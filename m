Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D6440682C
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 23:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788219366; cv=pass; b=H7C3losD+xXJU1HoGRW+5GFKsKxDKvpAP42uHbK5qIXLeXw4zty6MrI7O3v6eK4uVLky3/cBUS8/MEyevd/e6o0h1+4mLdIRp71U+lxUEbuoYj9J8dTrc0CF6F4mffefDjO9vAWpPy1ePYw8wafwUyXa9epjU5WKp91INNXrTqo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788219366; c=relaxed/simple;
	bh=iCehflJlGOz1mQo5cAWM6ZY/cFiKDMhIje2eKZy9xTQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nyWNSgzy4kZafgMqIweaBJmksBn6t/+s0AhEoU2K5KwoPo41rQHcVuLn0GfgVLslICLELsEe6ghxtgCHVwUOK9gKcQKPjp2bsM112L4OQReXCnVpFM0jsqxqq7AkfCG4rgMfPDMemPv5gVnDf0186iKcjHyDLM4tKA0kvjjG6vo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sy9ZBWds; arc=pass smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sy9ZBWds"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-90cd43bd740so3825976d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 16:36:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788219363; cv=none;
        d=google.com; s=arc-20260327;
        b=Q6D6Z+W3pM3DNacngF+TQqn/JrlS82trX/M0ykmZ4ctc0vWuLG13u6uRV+bwxZqG9w
         21GBciX6bAV0VmdPQ1T8M5X9xxyMN/oHBlKGHGVIgSG8Y7nBNY+9iP11NdIrQcEqcwc9
         3AkvVooYe63RIuPDx3FMvNYmiXo3uAE9iQPVPYkk7Q43iT6rjFjYSxmXFeFO844E7LPJ
         egZBMRWntPLcMd6dkVbYlWyBa3GtAoImL4nh//fTrSPFlUWeEGnusMi0qW/of18O9aNj
         PYmHDx+Rsnug0wJ3WPLbwfvCFLSq/RbbrIPUJapShZEoExKDeay9q2q8+0TsPVhgbue9
         OnAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QNum+kgdZaAgFaBRWHJN3l688YcRNpqHNoOYWPD6JjM=;
        fh=R5ZTORCqqgnWp9kbD8tZdVDfhCY78yhJwMabxJscS9M=;
        b=gTRD1D+ExCwWrWhmLtXs46zQpseJThWeUKg2VBkF79KbETw14xtJYrMbX8+wc4UsSO
         /RUXsJVcnv1WBMSm/+4GnV/qOkEJNSTd3sriz6mgU55UkEKgLBSJpoM315UXkQtSMKvG
         Tfz7hDj8GjYpCAg46zj/X4qJVX033Vd1e+11CCUu+NXmW+WpUefpPI+Czm86AenYIrsf
         U5roYTlqOOqns37rw18hnoM6+FwBlEGiDuqutz6HM6uc37W4NgeWCyJs5YZg/7ldrRjk
         1HeQ9mHRxW/19txdqCJOPi2kfsyyhyhL/MXJPrQJ+cpi3Po79sS7Ch9WvacgMS37M9Vl
         tvYg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788219363; x=1788824163; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QNum+kgdZaAgFaBRWHJN3l688YcRNpqHNoOYWPD6JjM=;
        b=sy9ZBWds8knpcgMmii7VtF07pBW04Sb+DyKFt6w0TBnU3uef9orp+iEVCGhKXex58z
         SZUTlK/WfiRcEuzuI0dKPA7w5FEFVc130XYDRENj2L2OVEZWgAQPhGr3rp9vWxtwVSVf
         E1ycxuoROi67JKztXsnyDwQLa4DPIb+bdlOf9btOP9hOXvtaxxLYdnrYAstxrGBvBFkp
         zP2dwpFJ4a//xzPoJOlj23j3xF6uIfhhDrmGslFYRrt2/Grh3eJuzssQRkTHDIKwtWdQ
         OcyO8YT96XCUzKNTWbjiPuX/C2Lg59dM3IZ3Wru/eh+df48WQ7IwXCnC7pXykwOCj+zp
         XDLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788219363; x=1788824163;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QNum+kgdZaAgFaBRWHJN3l688YcRNpqHNoOYWPD6JjM=;
        b=WSOSEiQGkPVeTG5tESUosuVCpLuY7df696SmJBLzIkRT+4FLSBd7pvAa6XZVXGGcXL
         lQari+dL5NxkArm8rwxv6g58Rzd/CTStygf+2j0veGPJiIDuNMCfG9uBkHDtxmG9uKrc
         vZWNY28pQzaqvjyqo70PeRkBfqfJyARO/V/RFBn9a7UMGGyjz5CEqNCoVCr1MK5CI3i8
         7G7Em/zWL4POU2aDKhtK58//7mOyjLGwX2kZN/J5N2LawhcfeqFq/PI36qFIyoxxMrHo
         /zcmXrq1MlG0cxy/6T2Pp+r33feTZunuBzw/WgSGP/+T2YpuwcJVrxVKdCG3DE3ZbEpn
         e19w==
X-Forwarded-Encrypted: i=1; AKwUvBwEiZK5L3ABc609oPNMTgvX77oNKoHa6urcJqKkwb+1lJKrTJnKlVy3Qm7MujlhhbUQzMmfHxqcQXVZGb4=@vger.kernel.org
X-Gm-Message-State: AFuF++lDbqjO5r5vmBsk9n+GYbPhY0f4scYimAJxfXyPuhgpn92w4y6H
	H1UVqE6oq7h4fbItNw0Lqz/iFWtSFpOUUiOVbbzz8NvbRPg2K4gIaJUPdWUmxS1q4R4Evt6H71m
	i7ybhXWcN6/GdotJ7dbwlG2/0hFnk84k=
X-Gm-Gg: AYBFou0ycbsYQ/YKylTOeZEbdYVLWb08SmcJmXkbP1KlICFfyxIcMXaWme9H/MMZ50V
	61x4HmogeWaCinEjZmwLNJAKqclhxziBP6HIeO/uA7AqPTNV9bA8RYi62WQoDyMEtBzAbwb71oY
	xyFjeJ04s9Zt/ds8IwFzpxtQw2YWnLry4MlF93Xv6yi8kweCer2curqzVk2pICfhudA71Fxwlmx
	DeKiDxvAS1c6tdolyKoE2RWfNhYLb58hjbj/jIm8IFy7rT997ZOi3mrzippQ8kfSCu5vfqnZhjV
	VDQIFuEJ9QWnHH6DK1cpeHO/kj62O/VQt/eZbAWNOD5izQ==
X-Received: by 2002:ad4:5f49:0:b0:90e:963d:4c9a with SMTP id
 6a1803df08f44-90e963d4e35mr13013446d6.24.1788219362875; Mon, 31 Aug 2026
 16:36:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1788096666.git.mradityadash@gmail.com>
In-Reply-To: <cover.1788096666.git.mradityadash@gmail.com>
From: Derek John Clark <derekjohn.clark@gmail.com>
Date: Mon, 31 Aug 2026 16:35:51 -0700
X-Gm-Features: AcwNN1VimrtqKaLKbT2p_0ZGoPZ0-TfAblpWoub3Lr8dw6kUn9FpJC6ZJFGhaq0
Message-ID: <CAFqHKTnQiTQc6joz-Y6tmjR=C5giF-MuHeBwu3rw+bmFVMQtqw@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] HID: hid-lenovo-go: fix controller configuration
To: Aditya Dash <mradityadash@gmail.com>
Cc: Benjamin Tissoires <bentiss@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
	Mark Pearson <mpearson-lenovo@squebb.ca>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 30, 2026 at 7:57=E2=80=AFAM Aditya Dash <mradityadash@gmail.com=
> wrote:
>
> This series fixes several issues in the controller configuration and
> calibration paths in hid-lenovo-go.
>
> 1/6 fixes the calibration attributes, where the command and sub-command
> are swapped. 2/6 fixes two right-controller attributes: imu_enabled
> selects the bypass feature, and reset targets the left controller.
>
> Before 3/6, any decoded configuration reply completes the shared
> completion. The driver then ignores the result of the wait, so an
> unrelated reply, a firmware error, an interrupted wait, or a timeout can
> still be reported as success.
>
> 3/6 tracks one pending request in the driver data and matches replies by
> command ID, command, sub-command, and device. It also returns request
> errors to the caller.
>
> The firmware has no sequence number, so a late reply with the same tuple
> can still match a newer request.
>
> The remaining patches fix calibration status handling.
>
> The calibration status table defines 0x00 as unknown, 0x01 as success,
> and 0x02 as failure. A Legion Go 1 returned 0x08 after a Stop was sent
> while no calibration was active. The driver stores the raw value as a
> status-text index, so a later read returns -EINVAL.
>
> 4/6 preserves the defined values and maps larger status values to
> failure.
>
> 5/6 rejects 'unknown' as an action. The action table contains it at index
> zero, but the options attribute advertises only 'start' and 'stop'.
>
> A previous result can also hide a new calibration attempt:
>
> failure -> start -> failure
>
> The status appears unchanged for the whole operation. 6/6 clears the
> selected status to unknown before submitting a Start. Stop leaves the
> status unchanged.
>
> ---
> Changes in v2:
> - Drop the FPS DPI patch; the existing request is correct.
> - Drop the v1 Boolean calibration-result mapping. Preserve values 0x00
>   through 0x02 and map only larger failure values.
> - Move the existing pending command state into the driver data and
>   initialize it in cfg_probe().
> - Use scoped IRQ-save guards and validate the report size and ID together=
.
> - Drop the v1 no-wait calibration path. Correct requests receive their
>   matching SET replies within the existing 50 ms timeout.
> - Reject 'unknown' and clear only the selected status on Start.
>
> v1: https://lore.kernel.org/all/20260821214810.87826-1-mradityadash@gmail=
.com/
>
Hi Aditya,

I tested the series and have no complaints, everything seems to work
well. Thank you for working on these bugs. You can ignore the existing
issues that sashiko-bot identified for your contribution, I'll take
care of those separately.
There were 2 new issues that need to be fixed:
- [High] The newly added spinlock and completion are accessed by the
raw event handler before they are initialized, causing a potential
kernel crash.
- [Low] The patch leaves behind dead code (`if (!val) size =3D 0;`)
after explicitly rejecting `CAL_UNKNOWN`.

The first one is more pressing, and will require a reordering of probe
in an additional patch to ensure drvdata is init before hid_hw_start()
and hid_hw_open() are called. The bug is admittedly very unlikely to
occur, but it is the kind of bug that could cause spurious crashes
during boot that would be very difficult to trace.

The second should be trivial to fix

Once fixed I'll add by review and tested by for the series.

Thanks,
Derek

> Aditya Dash (6):
>   HID: hid-lenovo-go: use the correct calibration commands
>   HID: hid-lenovo-go: use the right controller selectors
>   HID: hid-lenovo-go: return configuration request errors
>   HID: hid-lenovo-go: normalize calibration failure status
>   HID: hid-lenovo-go: reject unknown calibration action
>   HID: hid-lenovo-go: clear calibration status on start
>
>  drivers/hid/hid-lenovo-go.c | 179 +++++++++++++++++++++++++++---------
>  1 file changed, 136 insertions(+), 43 deletions(-)
>
>
> base-commit: 1292bca0f8d835d2ad96d309595b2e97f3106d3d
> --
> 2.55.0
>
