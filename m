Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF3D38DC74;
	Tue,  8 Sep 2026 07:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788852041; cv=none; b=aqRUJ7Q1ca7PMIO20sCnNNEP8WF/s+lSFJ47+84+mMM1m3LFITB6ZbVZYUHvneI209AErnOwe44yMNA0cN55+8zfYG/byhCMrOXBMbHZAWUZ30SCZgRvMl0kqRUgCaYgoOHbtllzHoNWSXsEZdA50UwgO3SWSHkqYn2Shtfht2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788852041; c=relaxed/simple;
	bh=n1W3cClPZ12zJKwBS1q7HoNes1jdKMx6MEnQgm/3KOI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=qs624zv392jFXOAq2TYC4LdEq+5QbHWasN0hGN64CsU11EBoeVj9j9fI50AxLE+Ox/N7TIfUtQ1QiQOAecrZ+zhXbUdTknUUWXdYI9T8MkN+mH3ZBtoRSK/9tBjRX7bY213safMH7kL7iuvDfGyhgLQJxBVpPOzkSgek9SAyjrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PGwS2UyI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PGwS2UyI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B4541F00A3D;
	Tue,  8 Sep 2026 07:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788852039;
	bh=AlyanAhg2HqvYa6iMCdujM0ZhnhXjluckOAgZociTnM=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=PGwS2UyI5U2iaerJr9Bo9/cGaztpm8Ex4LyvCai/v5Ju5ZMpEy+mQ80m55VzPmfNI
	 EIi7mtYiL3N+Qrlq0Z1pyQDzTUxCA/fb9Asdp1lK7qYoiF6dkOm1rAGYpKzckqHNNk
	 O2hUHG+oPjFgTzbFz0XOyNxWvROQibEHpgbR5xhMLz4k8sywHbBwI3LIDP5+TVHVx8
	 +J6SwR31DWh1/LE8X1RMKVoIYDHUJFoBWzJVAPEWRCzucXutorClbWtFqQGa6Hr+hl
	 H6z6rEGQ3WdIxT2MyGAGR2Uh/2hdFRwjiXa2cEi81xePmCfNxWTSI6ffFlxGunnKFE
	 ZL2d2jDCq0Gkg==
Message-ID: <88eded5c-d666-4442-9a4a-70d57ebf869d@kernel.org>
Date: Tue, 8 Sep 2026 09:20:36 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH 0/6] media: cx231xx: make USB disconnect teardown safe
To: yux50000@hotmail.com, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260827-cx231xx-disconnect-lifetime-v1-0-7bbf946bbd36@hotmail.com>
Content-Language: en-US, nl
In-Reply-To: <20260827-cx231xx-disconnect-lifetime-v1-0-7bbf946bbd36@hotmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Nick,

Thank you for this series: cleaning up this driver w.r.t. disconnect safety
was always on my todo list, but I never got around to it.

I have some high-level comments below, and I hope you can make a v2 of this series
based on that.

On 27/08/2026 19:44, Nick Faro via B4 Relay wrote:
> The cx231xx disconnect path can tear down the USB-owned device state while
> open V4L2 or ALSA file handles still reference it. It can also leave nodes
> registered when an analog video file is open, and completion handlers can
> continue resubmitting URBs while disconnect is trying to kill them.
> 
> I encountered this with an Elgato Video Capture V2 (USB 0fd9:0037) while
> streaming across a suspend-to-idle/resume cycle. On mainline 7.2.0, resume
> re-probed the USB device while the previous cx231xx instance remained partly
> registered. The reprobe warned about duplicate I2C-mux sysfs entries. Running
> v4l2-ctl --list-devices then logged "refcount_t: saturated; leaking memory"
> and triggered a general protection fault in v4l2_open().
> 
> The reproducer is:
> 
>   1. Start an indefinite capture, for example:
> 
>        v4l2-ctl -d /dev/video4 --stream-mmap=3 --stream-poll
> 
>   2. Suspend the machine to s2idle while the capture remains open.
>   3. Resume, stop the capture process, and inspect the devices with:
> 
>        v4l2-ctl --list-devices
> 
>   4. Unplug and reconnect the capture device.
> 
> The series gives the shared device state the lifetime of its V4L2 and ALSA
> users rather than the USB interface. Disconnect now unregisters all public
> nodes, stops URB resubmission, and prevents late file operations from issuing
> commands to absent hardware. Software-only close and buffer cleanup remain
> available so existing file handles can release normally.
> 
> The final patch is an independent allocation-size correction found while
> reviewing the endpoint-array ownership changed by the first patch.
> 
> The patches are:
> 
>   1. Keep shared device state alive until its final V4L2 reference.

Nice, this is the main change that needed to be done.

>   2. Stop video and VBI completion handlers resubmitting URBs after
>      disconnect.
>   3. Reject late V4L2 hardware operations while preserving software cleanup.

I am not convinced these two patches are needed, since I think this is
actually covered by patch 5. Generally having to add all these disconnect
checks indicates that you are just papering over a symptom, not the cause.

>   4. Make ALSA work, callbacks, close, and card teardown disconnect-safe.

Looks OK.

>   5. Always unregister the driver's public nodes during USB disconnect.

So this is an important one and should actually come first in this series.
Using vb2_video_unregister_device ensures that 1) new device opens (or any
file operation other than close() are blocked, and 2) that any ongoing streaming
is stopped.

With this in place, then together with patch 1 and 4 I do not think there is
a need for patches 2 and 3.

>   6. Allocate alternate-setting arrays by element count and element size.

Nice catch. You can drop the Fixes tag from this patch: it wasn't a bug before,
it was just allocating more memory than was needed.

I'm not sure there is a need for the Fixes tags in general for this series, but
I'll wait for a v2 and I'll see if I keep them or not. These changes are fairly
major, and I'm not sure how well they apply to older kernels. I didn't do this
for the similar em28xx modifications.

Since you have tested this as well with actual hardware, please add a 'Tested-by'
tag as well. It's good to know that this was actually verified with real HW.

I'll mark this series as 'Changes Requested'.

Regards,

	Hans

> 
> Testing performed so far:
> 
>   - Built the cx231xx modules at every commit with W=1 against Ubuntu's
>     7.2.0-070200-generic headers using GCC 14.
>   - Loaded the patched modules with an Elgato Video Capture V2. The video,
>     VBI, and media nodes registered, and ordinary video capture worked.
>   - git diff --check passes.
>   - scripts/checkpatch.pl --strict --max-line-length=80 reports no errors,
>     warnings, or checks for any of the six commits.
> 
>   - v4l2-compliance 1.26.1 results with a valid NTSC signal:
> 
>       v4l2-compliance -d /dev/video4 -s 120
>       Total: 76, Succeeded: 76, Failed: 0, Warnings: 28
> 
>       v4l2-compliance -V /dev/vbi0 -s 120
>       Total: 76, Succeeded: 76, Failed: 0, Warnings: 18
> 
>       v4l2-compliance -m /dev/media2
>       Grand Total: 148, Succeeded: 148, Failed: 0, Warnings: 42
> 
>     The warnings concern the existing audio-control ranges and values not
>     aligning to their reported step, unsupported VIDIOC_CREATE_BUFS, and the
>     video node accepting invalid pixel formats in TRY_FMT and S_FMT.
> 
>   - Repeated the active-capture suspend-to-idle/resume cycle once with a
>     userspace V4L2 capture application holding /dev/video4 open, and did 3
>     cycles of unplugging the USB while streaming. On resume, the old video and
>     VBI nodes were unregistered, the Elgato re-probed and registered one new set
>     of nodes, and capture worked after reopening. v4l2-ctl --list-devices
>     returned promptly. The kernel log contained no cx231xx warning, duplicate
>     I2C-mux entry, refcount error, or oops.
> 
> Codex using the gpt-5.6-sol model assisted with all six patches. It was used to
> inspect the cx231xx driver and comparable media drivers, propose and revise the
> lifetime and teardown changes, split the result into single-purpose commits,
> draft changelogs, and assist with style and build validation. The interaction
> was an iterative review driven by hunk-by-hunk review, rather than a single
> generation prompt.
> 
> The submitter reviewed the resulting code commit by commit and is responsible
> for the final submission.
> 
> ---
> Nick Faro (6):
>       media: cx231xx: keep device state alive until final release
>       media: cx231xx: stop resubmitting URBs after disconnect
>       media: cx231xx: reject V4L2 operations after disconnect
>       media: cx231xx: make ALSA teardown disconnect-safe
>       media: cx231xx: always unregister nodes on USB disconnect
>       media: cx231xx: size alternate-setting arrays by element count
> 
>  drivers/media/usb/cx231xx/cx231xx-417.c   |  44 +++++++++---
>  drivers/media/usb/cx231xx/cx231xx-audio.c |  67 +++++++++++++++----
>  drivers/media/usb/cx231xx/cx231xx-cards.c | 107 ++++++++++++++++++++++--------
>  drivers/media/usb/cx231xx/cx231xx-core.c  |  16 ++++-
>  drivers/media/usb/cx231xx/cx231xx-vbi.c   |  11 +++
>  drivers/media/usb/cx231xx/cx231xx-video.c |  30 ++++++---
>  drivers/media/usb/cx231xx/cx231xx.h       |   1 +
>  7 files changed, 214 insertions(+), 62 deletions(-)
> ---
> base-commit: 4900cad020c0580dfb1be27776ff10a4ef110cfa
> change-id: 20260827-cx231xx-disconnect-lifetime-772159fee2c2
> 
> Best regards,

