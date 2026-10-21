Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792558722;
	b=jqoUceO3Qh+aY08k+aCoFby/66d2R37LZfWce3Uq8Y7Ir7jkyUwUAtKZfXto9A6xrGRh
	 h57CGQA8vRgHqV9XGUfLHUADK/Ajyv1Qu/ueFiMI3Y3IasWxL9NPhJZiynQS183SXs6XF
	 FAcW0C7csGobqJBKKsct3227XcsdWcvdY87frnLyzoCvQf3sGaztk/LTlgwyzq/7qUAje
	 dzygUPN3YgOwq0uO/g9XxIVF7pYYys0rYgHOyv7R1D5C0hV86W5FPx8vVg225O+5vDqiI
	 gP9lNzxpnCEtPZbO41l6cQJQzeJtQWqFnKwnKNdFKD017Gk4k0jA0/Dqy8anBq90Xtg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792558722;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=1A5vWPfzXmURnJh3IOMTPK7uEh1Ro9Aj0hKW+NQ7k5M=;
	b=RYHdVRB95FnZolvTfhmtgoOZWqZ3DHf2qHvoeFOJrmvj4AaV4KEnIFt+zSwgK2Qyyr3W
	 un2U0GzbBOkTz/S4UjkwFYGD/l0c+y59lXealM6YofLkm5qVn2IjZiwm49wySJSvZcGIR
	 jiAFwC2IJHfXjxlGCuheFYTB4nd873QU89V9OLtaNPmo4fVTjOwWUzKyh0gzwhz6iWqPH
	 DyfnHLktY2b3P2P+xC5ENu6S+Pr206mV3QI5JhUGGD4jnp8d4hWRBV/BwakCaZndL7nq/
	 UcjOBinqXqDl0HM0M0LR8skxDSnAtwbAQ8QFp35R4LCmUqO6MgI/P5HjcReOy5LwutQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="GDe/NFTj";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBEAC606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 04:58:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBEAC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GDe/NFTj
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6ac76a02368so245223a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 21:58:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792558720; cv=none;
        d=google.com; s=arc-20260327;
        b=P3gzcZdIcmZwrI+oGvNP02rFsZ0xkJf+XcXdfv5xoUbfyhCPvKiTJPks1QhNI/a1hZ
         /AG8UxMlhcPxiPM35on2sAo20lLNJb/kzQGDNAQLbEI9GlLW80wfilMxM37Xn/S2EHD2
         19FugYAsdZhQBGeneod2VIf7UuFRycFq1FKJzeT+aUiVavpT3oxrPMMvU0sYo3z1FdgJ
         2lFYT55JtDGUpZlyvAnUN4jJxpZ2IHrEAQMHGzCfBpvxfERg09wjgbaXRcwqwW6ECMF/
         gAq5sPd1TODWhBbZbOptcogc25hHRe2KH9PtSocebaKZG1o7ffBZH2/3XjzRylVlZJ6k
         4RIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=1A5vWPfzXmURnJh3IOMTPK7uEh1Ro9Aj0hKW+NQ7k5M=;
        fh=2qtzzuiO8mo5bmueEcOHsSf6auYnD9WRQRBv/JwSQEk=;
        b=ph0CzFFj1D6WMesmwS2Xdm5o7aR4BVCyxwZb/Psa7qEcAdxEt5xWF7ssMaNn5VyKAR
         g210GCqkWhag5uSXpkytu21vLjmI706maXHw+ItvfhN3mjZq8ge6j3WpQW93RlgpPkjn
         2B+5zvpnGPlfWuiNpAs8I8WkDVdsudXKNR4vx6PWLqOHbxLt+FUKtYzca3zOSjg9VhFF
         Xu0UMnzJHB7aANKBmOhKsXBloGrAMWTd50wYwN1uHObbPInrYgzFl6B8E8unYx4f/3ta
         +Rtf3fOWeq8riixDGA1QM4Fdq+C4fOHTlMSgC1+Yw2jr84VvVKRQWa9a9JLFoKXAL5gd
         Ppsw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792558720; x=1793163520; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1A5vWPfzXmURnJh3IOMTPK7uEh1Ro9Aj0hKW+NQ7k5M=;
        b=GDe/NFTj9YIGLIgeB3tlXXf5gmjIk8gSzbebF6kz4aN2YuDoVRytx09zHP+24DnniS
         Rbx7pU4+aS/HAgkuBdP+C4xoeqnBiHdUJHvwWV+Rs/y8R5WpgR1ju8TX2b2TdvUEcUqy
         ZxjXk/sy4XyfsuBhoZUozCwmR1TyCh5pJ8LyKyvOYERkU8QiXAwMmaKKrMwme1T/ASxT
         IepWKEvLA1et+mZoNfLj8ImLnSHopiESMNZVnxzIzyMTUO7DnwZyh9/4NONn3o+XzF6i
         ODjAMjLVepguf8vMPoTQbN4wPQoX9ORj1ogXm3zUlxunx1sgCoJbxGj4wBklcXlhlLbf
         IFcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792558720; x=1793163520;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1A5vWPfzXmURnJh3IOMTPK7uEh1Ro9Aj0hKW+NQ7k5M=;
        b=u+ZMjUPC0yKjXH177N3zb44OqXb7tbzFXyzPoXyVEUtdWXkCkV/c1+0OvgOwBaQk6r
         9VI3iOhQqN7SfEKLB1vgNjJJeYqEQlJ+i2F81gRVT6VIFtFINzYV3HN3t2tLXglVwsMc
         BJtqNA1l2N2apSO0Ib/9kYh6FcOKADEucszaS/2ecmRFy9txHlMSTow8XoY/lp2EaNk1
         7D7WxwwuY8ay6u6BxngcVpIyYzgfU4z047L6qwAeCLqTiso5Y5AC+aA+Z1GRHd3fyeuL
         xmZ6WCUp0KGe1hCE/Vr/VG3RNXPujFZOsRRs3ca+geJtoaOFXliTjouyKLQEFq9AaKUE
         Fk+Q==
X-Forwarded-Encrypted: i=1; AKwUvBwXztyBcg0pIMOK1byP9Bt7WaJY2whEu5S0ITpPal45NPWEpmbS7XFp7glOd7vU0L2ex4oEEy2lwy6UJqM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJfng1vgO9TK5NB4aOgFkQIxrrjibrA/C9CsnAopwKq0P6HrfKC
	qsrRw7dedJgstHxZHijqVkdOpmcjubZPtllGpuf2jc0qymxpQFvg9dhAY7NjYU+Y34LOdaXJxwQ
	8Kduif65b3tzY23oICb8qOdSQAKBmBTfUWSRs
X-Gm-Gg: AYBFou0Q7qEsE4vXRmSaOYQM3ultGtai9uGTY0M2fa4gRyHsnTa/RfZsud3SaXA5OVx
	BEhkUnfVwjPsTW6uuFEJDZhHAERVe7IoreojBAlDdm3U2He+6nNTDtxKsOIDSxnSrmWPmNds7VF
	kFYTTcoXFBZQ9HPesKUUBYPKZn0kGbgk3HWv+cxY7vS92RtYuag6SAqan/finiFRf7g0dTdFADb
	/DIPtLaZ4CA1t2QebuJhyXYtbR+MDJvhL3oXaejDHsYYIB3OPjYhsIvIDEP2prxJUAOo9sHRPAW
	8VE2ldYMxaV9I76fc1IYMvBGl9y8NlK02q2o87C/PF48+va/TJvALFUVnsV7oSUUzFW5xKQPmzP
	e11tPwaG6Mn4hFw+1B/5ZpP4B1ke+BgPUeNnq
X-Received: by 2002:a05:6402:461a:b0:6ac:7868:b690 with SMTP id
 4fb4d7f45d1cf-6b408ea0819mr370267a12.8.1792558720180; Tue, 20 Oct 2026
 21:58:40 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Sneako <dogg123456789@gmail.com>
Date: Wed, 21 Oct 2026 00:58:24 -0400
X-Gm-Features: AclHuK9BwCRQ9D5n7cgXqtTagXZ0FVJpq2wT9TZyouAzuCvT-oX37znOxUsdfVw
Message-ID: <CABXKy5Ln7m_ixqn_hi4WRH8N4Jx7FFn9GMqTzkKz-FamCf0ZaQ@mail.gmail.com>
Subject: [BUG] ACPI: s2idle: Microsoft LPS0 _DSM revision mismatch prevents EC
 standby on Acer PHN16S-71
To: linux-acpi@vger.kernel.org
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

I would like to report a reproducible ACPI suspend-to-idle problem on
the Acer Predator PHN16S-71, for which I have identified and
experimentally verified a specific firmware compatibility issue in
drivers/acpi/x86/s2idle.c.

Hardware and software

Acer Predator PHN16S-71, Intel Core Ultra 9 275HX (Arrow Lake-HX)

Acer/Insyde BIOS version 1.28

CachyOS kernel 7.2.11-1-cachyos

Suspend-to-idle (S0ix); no ACPI S3 support

Problem

On Linux, suspend blanks the display but leaves the fans, power
indicator and performance-mode lighting active. Windows correctly
shuts these components down.

The Microsoft Modern Standby _DSM interface (UUID
11e00d56-ce64-47ce-837b-1f898f9aa461) is detected, and the kernel
reports successful sleep-entry and sleep-exit notifications.

However, kprobe traces of acpi_evaluate_dsm() show:

revision=1 function=7  (sleep entry)
revision=1 function=8  (sleep exit)

Simultaneous tracing of acpi_os_write_port() shows none of the
expected EC commands during these callbacks.

Firmware investigation

I extracted and decompiled the laptop's BIOS 1.28 DSDT.

The Microsoft _DSM implementation executes its function dispatch only
when ToInteger(Arg1) == Zero.

Function 7 performs:

EC0.E3CS(0xEC)
PGPI.SGOV(0x00160C8B, 0)
EC0.E3CS(0xE4)

Function 8 reverses the GPIO state and calls EC0.E3CS(0xE5).

E3CS writes to an ACPI SystemIO region at physical port 0x6E.

Suspected kernel issue

In lps0_device_attach(), the Microsoft _DSM is probed using revision
0. However, the shared rev_id variable is subsequently set to 1 for
Intel's separate LPS0 interface.

acpi_sleep_run_lps0_dsm() uses this same variable when invoking both interfaces.

Microsoft's Modern Standby firmware notification documentation
explicitly specifies revision 0 for functions 3 through 9.

Consequently, Acer's Microsoft _DSM receives revision 1 and returns
without executing its EC sleep commands.

Experimental confirmation

I constructed a temporary Linux early-initramfs DSDT override,
changing only the Microsoft _DSM revision condition to accept
revisions 0 and 1.

With that override:

All affected fans and lights shut off during suspend.

The system wakes normally and the fans and lighting restore correctly.

The same machine, without the override, retains the original faulty
physical standby behavior.

No BIOS flash, direct EC commands, or fan-control manipulation was involved.

This provides strong evidence that the revision mismatch is
responsible for the missing platform standby behavior.

Proposed fix

Use revision 0 when invoking the Microsoft platform-agnostic _DSM,
while retaining the existing revision selection for Intel- and
AMD-specific _DSM interfaces.

I believe a generic UUID-specific fix may be preferable to a
machine-specific DMI quirk, since the Microsoft interface documents
revision 0. I would appreciate the maintainers' assessment of
compatibility implications.

Separate NVMe issue

This laptop independently requires nvme.noacpi=1 to accumulate Intel
S0ix residency. With the DSDT override but without that parameter,
fans and lights correctly turn off, but S0ix residency remains
essentially zero. With both changes, physical standby behavior and
Intel S0ix residency work.

I am treating the NVMe issue separately; the proposed _DSM fix is not
claimed to resolve it.

I can provide the original ACPI tables, kprobe traces, before/after
Intel PMC captures, and the precise DSDT override.

The issue was reproduced with a CachyOS kernel, and the revision
mismatch was independently confirmed in upstream source. I have not
yet boot-tested a kernel rebuilt with the proposed source change.

Microsoft specification:
https://learn.microsoft.com/en-us/windows-hardware/design/device-experiences/modern-standby-firmware-notifications

Thank you for your consideration.
