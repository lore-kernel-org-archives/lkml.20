Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C8F431499
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 15:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792165065; cv=pass; b=dQCZu+A39QooNUEpGbWqR7BgRGjVRKbckZnpvxj5elmUya80fvFjM0uqVfRr6Og06Qc4lwkI7Ny239ZP01idpmtFwKUPi/vI3YodIGc4ftgNQ7KH/P0RM3bkhKNOJ76Cxsx2LAZTELqbVWeyJy4ZNR5nL6q5SBk5B2EFGXNGxDM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792165065; c=relaxed/simple;
	bh=Qo77gaAgVQTP0Wo7RjceELd5Xbc+Xpcpp+2uNGjS++w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NgY2SxeivcPji1meWt6TiH1lPLTx0BV0/+iqsDEfmBbZ/sQjoHP9ErGDXmg2LPDyG1/ctDs16bAyzJ+4CQUFOqWGXxAAQbvhmrqfhGKLmipWmdqUB0QbGaMjqD709M1rE6k1cFhOD9pFBNRQUZbri7vkwyh0BY9dFYrhhx8XEfE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SRTdXlBC; arc=pass smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SRTdXlBC"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-89ff475a152so17275b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:37:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792165064; cv=none;
        d=google.com; s=arc-20260327;
        b=p0+od3m3UQjoVqGGorWP5Ce2IGzrF3prMMwqbhDvnm+OxEXHJHrqzQNK2XZbo7Dykw
         1SmdtpVG9zg6TP0mzmxNhsGVZalRE2ULwmKbLGMsFaNl5eDLUxJ7pZIp9zFSTuu/O5qX
         jplVevwkwPlqh3ksWr8yVloOdC5YPWNlc6zjSrYVvPJDXeDhu6/xKgQ8vRROSYpuo28c
         jeAe1Jp9iQB8Nsjof0Qzu6WGLXrabw5gE2y5rfTWAA+j4kyW+WE1s5mI7VyCFjVKw6oW
         fTicLb+5c5WKVgzUvE0Sgg+C7h264KEwwykchHbmo5f4/yLwN0iGP7aIkAUrYzsKqCPB
         mesg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IYVNPQuFkI4o7N7mZVUWjjX+AiySaZaN5/dMXjnZrJU=;
        fh=hT2xHl3CwSOGJza7U0isdlkNiF8X6CpRU/lJTeBU88E=;
        b=bSzIzU6q4xvYQB+YGuYuEKR0geCOfM1ZKYrkIk4E+h3Z+UQgtWwBc+IOsrFqL0VDus
         mw+6rRuObMmnAhgIkbzVb79sGrMy+4uHVHSJBaG77gk6AIpPTH2mDWtRI1Dd173aA26s
         +IFZ/7tUp4PVE+2n22AoJ3xGPL9O8DcnCQ20T+Q1zmsyyUOaEPtE1D64knssSbqTLGdZ
         I9BuVtqgQgXfvLd9JW2V6tIvPmEl0kNDLNJWIiJ8aem2uEwBudJFuAgrEXGJvrJSQ0yB
         OPYPx58PTmpY/lIsPy8ex32esjBNzwWIent0yBUvv6d8XIl4gAmPAk0P22/7FPqnTyFo
         SCaw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792165064; x=1792769864; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IYVNPQuFkI4o7N7mZVUWjjX+AiySaZaN5/dMXjnZrJU=;
        b=SRTdXlBCvekoW5PINPfdV49NohxYPgGQRBZm5FnfVUnxNnuA5BuD9mdSpi/TIOqEOR
         fgKMn7C/WWoHD5qgRmYQT0LpiUN7yh7lCQgsbVQFtXrqj3sBe2UxFw9uXnqK34Nuoa8O
         Mhzz3hJug7hyo/3lxJB261gd43bsgiVl68BasPR5ovDk6bcw1gaODWlVwbd0Qup7pyXe
         MwSco7WjEDOQpZyYVDW9KU7zT+ai9JcSwgARCYMW5n36/nwnT1v3kto00alV9ErloH1Y
         ReGPSWhDj9t54Yl9u3M4jsAJ+YNBaINUBE4BGyhdT7w+6VNtZGqXNxoRHdQWqiDLprNc
         etcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792165064; x=1792769864;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IYVNPQuFkI4o7N7mZVUWjjX+AiySaZaN5/dMXjnZrJU=;
        b=MeihnDd1597I5aJn3r5eXPpn/meLkpnAbAiLqVE59IpKwRPiv2gkG8t8/DeBVpKHwk
         2NeoVmtJXWMRCU6Xps56PmpCRXFI6sPRbVIGJUDp/5bIWzflv1ZE3XO+BfGgkb0/Q79h
         35Qm0mXqO9iAgLp5jsri4VRu8BAXlb+tVo8P11kK4pQeiDhnbtzVc21JUeklSR/XE1qo
         Zsq8hO7brlx143K5DPbqcw+eJQJIX1YBOoYNmvbQzCdr9P/+5LXsomPJDWPVdAyPAxHg
         FHXVLK2jgp9n8GX8EucOALrQZ1O7XkMXWMfBbjDAAqGNwa5dGAOsPIZKT28v/kPRlJ1r
         fNlw==
X-Forwarded-Encrypted: i=1; AKwUvBz47BlFs7jRX4VstGQVj7OgYd0Lvs1HSJ3OYyRbHd0ZUf0pqdit6WQYEecKb5DEB48UrbDJq4HzJoAjbUU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ/CMzN1Mclry+bxS3LzXw8/JP51Zm4L+Ku/7FX5GGcIn73/VgH
	RNXHXEowaA4s49hQ4tuRD66B3gSfuQMnKJzkZqrfWwCS7kEAEy9hYRPqbq6UzIHriTwVIm1GD+V
	rwHq4D9jGTU1U3FrwM9z8TSDgnB4M5kA=
X-Gm-Gg: AYBFou2tP9TpIcYaCx4JxtoUk41pmjuum+WrXygAviBctQG+PnEEgsQf8epKaUMTunm
	9fnmSojSjkEoe4bzrc6dapqN4nvbUKLgnVFVf7AxXGArjZ/Z6fo+/di5l5WszxAnaPeiGppfmoz
	Bspyd0LdVDxJw0gGtis+cvM09EHwkYFGVl/lk4bfcv+0oqa7hkhFdx75cJiSMGpM83UqJrllPrm
	8uMDXsQ3blqByOynRKO26efwmmw29x3x2hMIec/8js8G9pvIPB11qDpOHn21P6AgrSNA3RLbfF7
	poBIC9sRsXY7SEGeNMPx4ToRB+AWPstvt/xH3OvVx9qZlZ2Rtv8sYcWT
X-Received: by 2002:a05:6a00:4b42:b0:888:4f06:903f with SMTP id
 d2e1a72fcca58-897c78d5fe8mr18023757b3a.38.1792165063703; Fri, 16 Oct 2026
 08:37:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1788222001.git.mradityadash@gmail.com>
In-Reply-To: <cover.1788222001.git.mradityadash@gmail.com>
From: Derek John Clark <derekjohn.clark@gmail.com>
Date: Fri, 16 Oct 2026 08:37:32 -0700
X-Gm-Features: AclHuK-sUJKTjgoZIBWIIHtbP1GEijbCkJsUj_4hV98hycsPoEpLJOyCwEPUX-4
Message-ID: <CAFqHKTkStExZHvFKP0Kh8USQaGfx0jXO5QmvY4vNhT0eB6ENSw@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] HID: hid-lenovo-go: fix controller configuration
To: Aditya Dash <mradityadash@gmail.com>
Cc: Benjamin Tissoires <bentiss@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
	Mark Pearson <mpearson-lenovo@squebb.ca>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2026 at 11:36=E2=80=AFPM Aditya Dash <mradityadash@gmail.co=
m> wrote:
>
> This series fixes several issues in the controller configuration and
> calibration paths in hid-lenovo-go.
>
> 1/7 fixes the calibration attributes, where the command and sub-command
> are swapped. 2/7 fixes two right-controller attributes: imu_enabled
> selects the bypass feature, and reset targets the left controller.
>
> The configuration interface initializes its command completion after the
> HID hardware starts and opens. 3/7 moves that initialization before both
> hardware operations.
>
> Before 4/7, any decoded configuration reply completes the shared
> completion. The driver then ignores the result of the wait, so an
> unrelated reply, a firmware error, an interrupted wait, or a timeout can
> still be reported as success.
>
> 4/7 tracks one pending request in the driver data and matches replies by
> command ID, command, sub-command, and device. It initializes the new
> completion and spinlock at the pre-hardware point established by 3/7. It
> also returns request errors to the caller.
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
> 5/7 preserves the defined values and maps larger status values to
> failure.
>
> 6/7 rejects 'unknown' as an action. The action table contains it at index
> zero, but the options attribute advertises only 'start' and 'stop'.
>
> A previous result can also hide a new calibration attempt:
>
> failure -> start -> failure
>
> The status appears unchanged for the whole operation. 7/7 clears the
> selected status to unknown before submitting a Start. Stop leaves the
> status unchanged.
>
> I built every patch against kernel 7.2.1-ogc3.1.fc44.x86_64 with
> W=3D1 and KCFLAGS=3D-Werror. I tested the exact final module on an Origin=
al
> Legion Go. The configuration interface bound without a kernel fault.
> An idle Stop result of 0x08 was reported as failure. Writing 'unknown'
> returned -EINVAL without an output report or status change. A later Start
> produced failure -> unknown -> failure; the final report contained result
> 0x02 and error 0x0007. The five unselected statuses stayed unchanged.

For the series:
Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>
Tested-by: Derek J. Clark <derekjohn.clark@gmail.com>

Jiri,
Aditya didn't tag stable in Cc for the fixes tags, do you mind adding
that when you pull?

Thanks,
Derek

> ---
> Changes in v3:
> - Initialize command completion state before hid_hw_start() and
>   hid_hw_open().
> - Remove the unreachable zero-length calibration action path after
>   rejecting 'unknown'.
>
> v2 review:
> https://lore.kernel.org/all/CAFqHKTnQiTQc6joz-Y6tmjR=3DC5giF-MuHeBwu3rw+b=
mFVMQtqw@mail.gmail.com/
>
> v2:
> https://lore.kernel.org/all/cover.1788096666.git.mradityadash@gmail.com/
>
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
> v1:
> https://lore.kernel.org/all/20260821214810.87826-1-mradityadash@gmail.com=
/
>
>
> Aditya Dash (7):
>   HID: hid-lenovo-go: use the correct calibration commands
>   HID: hid-lenovo-go: use the right controller selectors
>   HID: hid-lenovo-go: initialize command completion before hardware
>   HID: hid-lenovo-go: return configuration request errors
>   HID: hid-lenovo-go: normalize calibration failure status
>   HID: hid-lenovo-go: reject unknown calibration action
>   HID: hid-lenovo-go: clear calibration status on start
>
>  drivers/hid/hid-lenovo-go.c | 191 +++++++++++++++++++++++++++---------
>  1 file changed, 142 insertions(+), 49 deletions(-)
>
>
> base-commit: 1292bca0f8d835d2ad96d309595b2e97f3106d3d
> --
> 2.55.0
>
