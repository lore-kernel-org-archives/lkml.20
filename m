Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 911DF44D00D;
	Fri,  2 Oct 2026 08:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790929950; cv=none; b=Y9wJJgxDI8Qe86ksZiBR1aj8DBpP0+Vrv89P3yaAYey+PP+VBSNgHgbB2DLt92AU9fEsQn071m239LLBhJnapqF7atyymLcX3dVzNRT4L5WVE/eWT9zXl0DqdI0s0vqymGvPkU9sUbSJzHuvmskVBC3l3NlJexVKWThR2YU9Gk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790929950; c=relaxed/simple;
	bh=jG1ybcula4zP4GIDKvPs5PsGrmogHMbwRQM6IAk7XO0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Erl9zvWv0aVJTV6uMgcGAz4QvGFeT8bU6mJAPdPXjtF4hpFAF90Dyt77eEBBq8zdNS4wMS5XDo2TQ0kCkSKoHI/j3Fp2v1cKHmWCHs0eaAJ6nX5m9RgW/DSJuWRZUEJz7CG9h5PvnsMWnt3pi/3YpnK4P23cr4TOSxx4mFA2MRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=do5RPuzz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="do5RPuzz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 431D31F008A7;
	Fri,  2 Oct 2026 08:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790929946;
	bh=ANFhZY5oTXIgXzJkgsjgPsIuJL50A78fEBGBYh3rZyE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=do5RPuzzz3tSANyIPWTUtoJpk700txOdRPbNqSrh5XADTyX8v0+RmCdMFV0YR4u6X
	 MTGAEEha7yb3s/xI72yZWyN5Fknt+QT8pQGkai2eF7hxieSN/UNU7ypvtAxDlsdiOJ
	 YbiSlzGe+G0oe+UmkIcpBBRDYWuBHzkii2b/U3INF/3oZyn+dk7+ZK/MkUL8at0fMU
	 1si7zAA3qD5Gjlfx1wbxrEKTs3j3KiQOnz16XxgM2lFynKZWPhHxgamKy/aooWqXZw
	 9Jt8EA6Z47BTB+COEVX9E+GgxI0mckFEVAekf+qz0ahzN5k6nxuWvk2DXzdlpLqzRU
	 WeS3cpXnXZ7EA==
From: Mattijs Korpershoek <mkorpershoek@kernel.org>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kieran Bingham
 <kieran.bingham@ideasonboard.com>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Michael Riesch <michael.riesch@collabora.com>,
 Maxime Ripard <mripard@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 5/5] media: imx219: Add status polling using .detect()
In-Reply-To: <CAPY8ntCBcUXte5pAG+i0SRNC-z6GOjakfgGLjDm7D=z91A3uhg@mail.gmail.com>
References: <20261001-v4l2-sensor-detect-v1-0-a45993be17b8@kernel.org>
 <20261001-v4l2-sensor-detect-v1-5-a45993be17b8@kernel.org>
 <CAPY8ntCBcUXte5pAG+i0SRNC-z6GOjakfgGLjDm7D=z91A3uhg@mail.gmail.com>
Date: Fri, 02 Oct 2026 10:32:24 +0200
Message-ID: <xhkdbece8v6xz.fsf@mkorpers-koolstof.csb>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hi Dave,

Thank you for the review.

On Thu, Oct 01, 2026 at 16:58, Dave Stevenson <dave.stevenson@raspberrypi.com> wrote:

> Hi Mattij
>
> On Thu, 1 Oct 2026 at 13:55, Mattijs Korpershoek
> <mkorpershoek@kernel.org> wrote:
>>
>> Userspace needs to be notified when a sensor connection status
>> changes (e.g. disconnected at boot, then later reconnected) so it can
>> react accordingly.
>>
>> Add periodic polling using a delayed work that calls .detect() every
>> 2s and sends a KOBJ_CHANGE uevent with HOTPLUG=1 on status changes.
>> This mirrors the approach used by DRM connectors in output_poll_execute().
>
> AIUI DRM polls from within the framework (drm_probe_helper.c), not by
> a workqueue in the individual drivers.

Yes, that's my understanding as well.

>
> Admittedly V4L2 doesn't currently have a totally obvious place to
> setup this, but it would be far less effort to have the polling
> framework within the core code rather than driver.
> Possibly initialised in __v4l2_async_register_subdev_sensor() based on
> whether .detect is set, and cleaned up in
> v4l2_async_unregister_subdev, with the workqueue calling .detect and
> generating the udev event based on the return value? I think that's
> feasible.

I agree with you that the polling should not be done in every sensor
driver.
I did it this way to illustrate how this would all be tied together in a
simple exemple (one sensor driver).

If we move forward with this series, I'll rework this to
be done in a generic way.

Mattijs

>
>   Dave
>
