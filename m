Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792459209;
	b=RZH2QM63dHLf4Qt0Of9vOwIcb5Bmu2h3/HhagF/4asVHoKCsuqw8/AkgZOPk4wIxM/YC
	 iN5dWppGBgy3Z/PZ3eKOgh6c+Xb8q4yL6ZfLUZSj4KCIdqDls0mkgTd8QD+VeBa5qqFWU
	 UDJItuIaWd/Yd8pis9u2uJ2yXZFXGpLO2FyK18fXvhplgpVNKUMFHtW+qVm90XGKM4ONB
	 6AfjcV2ZGSUy0vPb1Qko5RC6F1PwoOMjKLiS0hPTlb5xAwJTpv5/xdjR79SvL91d0G0+Q
	 FT0vVA5vHWSDIJ2jShQcYVhLPJD/fHWUWgDgp74Yn3NEHUmHLp8a4GWIavSuCKfTiQg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792459209;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=gll0oA4zkPNMV81jQfOkhNSBCWmgQfeLFvzCe0OxeXI=;
	b=nuK4gD9oAoupnTB5Kzdvq5IrEpC4q6mOBCj/vUiCQTAUR0PvdqssdTbfOduztiJpR5LS
	 7vHYk4cY7QnM2jTBMIkou4je5grvffx8NEmiD8PgI6/hOjzwCu/J/5xpHNcA2pYCY7gEK
	 UZpqKAsmi9sy+fW6szBwQQ3JpJzIPkMrgSkJsQAO7F+OGppnB10Xa3MQX2SVBBlrNhtFI
	 VRYJ9flVlusl9tlljT+OTkcZO80w8W1jf7UiUak5T+Hch9OmnlnajJWJPwj2JOf4hnIap
	 sW5I/pz3LJ1hYlcLQpObIFdakoYwZlW/lwQqbbcGuYkMqc/2ZvGWDryp+StkF+Z7mVA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=BmDH6h8d;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 012DF606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 01:20:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 012DF606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=BmDH6h8d
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48c5358fc28so2247211f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 18:20:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792459207; cv=none;
        d=google.com; s=arc-20260327;
        b=UEikiT5NJ3dRjchkAvPr6U6u5hmDhbXmOgFNgzKyktMvlIGBLdknUdrP+R5kUW+nWm
         m0J8rUagPZbMM4xiuW0eofZfE1xptiGgaM//9Ed9n0DcW0r9VVga6FwBUFqbYjnaW50m
         x9yKWwXza+DTBnnMIIGbFL1LqD+Jdf0DJsRPvz0BgrI7H+6GaaCmVqgoAKxGu2DsauzP
         0yZj2ii449ygVylpqTrvNu92fMgv2hvI9Ayb26wcGMcDB2wKcPX0GbrEVnsJCPXxpVBQ
         ZDrplIfqYNVnWx5BnLoaw3T7IZegwhtDKU7NFH5fAo35NGGFHQjZ9zCe8xCXRhAi8hE7
         UGRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gll0oA4zkPNMV81jQfOkhNSBCWmgQfeLFvzCe0OxeXI=;
        fh=wQttcwdtcjGTKkgXpcfH/kREX9HZx1k56cEMrUkujWA=;
        b=sYwO6Dy4heRTDBOGJZj4kRdEiAqhSwNeRoxUZVivmVw7lqhz4EEFcu2i8sjuG3arU7
         +HauPKDpqtUiv6Dp+Bs0tdNh7WdKqO27LL9LUXMNP2Ml/X0j4+ByD6TjJ/gwZLrwEJkF
         9tppqMzk/2kskEJZxMForGxDzdDiBp4g9vM6wYZHU0qQd/ezTV2BEtPjqW8EoOxHTw1e
         uN++sk3bN+VH8RIhfE4kCheJO0XVH9d7kK/Wf/DeTo1IsI1B3t+ycW+x7sClM7br6t65
         YJXaH/ZtJMLDDM4C4g07rRWfUXVdLYUQcN+oXPIbTDmv4/m1uuh4tesltTiI9s3BSz51
         T1oQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792459207; x=1793064007; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gll0oA4zkPNMV81jQfOkhNSBCWmgQfeLFvzCe0OxeXI=;
        b=BmDH6h8d94nYHhbeuKlxs6/mnr4ggKkXGLZORzWUpWPoYtOnuzSNePYEdONn/Iew2h
         /P1HkQqEQJfOLox0RWmzZgYrG1IxFbCc0dEwlBvieMh1R30zY4H/zrObc9FXwcMrePrp
         FLBSddgpcGJk7WtIN4FyWicUcnHPnsOS7mgVBxslO1x72vPBeVKz1Kkmdw/BIga5roGj
         BgFjxywuPL0YAnZZ1Chjv7nRyNZxH0qf0rgaePqk8ox3WxaEytWEpRjg8ohmiDdylOJ/
         8dcXoaS9cyBMHu0U0r9zfDVOk9XIlEOScYTNYqGseMmusKze1hOSUoXQGtIRuvXwGNmC
         RmRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792459207; x=1793064007;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gll0oA4zkPNMV81jQfOkhNSBCWmgQfeLFvzCe0OxeXI=;
        b=jaY/noXyQD+FbRMmAC/6EMDYmxIMdofct+7KCAxNPmDsYQIOr+ggZGxXS8bOHzSb4C
         Oak+rFp2ZINxPszYrdMLH5ikGURg7NoIad/V4HSkxhWeZ76enYKMrY7CWi4Hb4Eb50Bi
         x6r5UholJ6jYyXxol3R7hfo5EeNrrmFVa+SycqpFFB0ipmgVvmfqNuYHlmiwhjBUrCG1
         mwYjAl3N84VVjNbayJ8jiT0q1vYX8Q7pycYFprN2aHDSFwkr9kLzw2VXOt3J+oUvhoD9
         EGrHDpRuHg7BY63u+Ytaki6Yg4N3vo7fhtPufEmxYMCSU65XqvJTdikILoRjr05NCVqT
         mBpg==
X-Forwarded-Encrypted: i=1; AKwUvByxA3wgd2i3LD4ajownsd6J6aVO3eDDDflj+H+Z9P1DS/gGBNBHPryS1acSD/ggmjNX4Blsz2F3bCawMf0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLhzu79fmLsI/oc8pmd6Fpy+dekW5NbzOk/5VkopksEbkMMyxSu
	1c3qqnliIxPIlb0DmNFoae3pSPHCdlpvbCNOjw/gHkzIyLf9pa1ofdvGUkb/DEOFhAmwcpCf0tB
	IW9A5zBNkC0F8UfZ2V3tWkk80DYOl3kBrDMp/WoU=
X-Gm-Gg: AYBFou1OaitW8tAr0Kq9OHgDfh15uUku3RXrucpr79fD1Q/9yc18FWM+XXNcWt0oTsD
	Kwv10st3FBBUU1uoKITzrBE65Tw0bhwP4P/XlXGaSU1/Y+YsMECzXOdAhJ847Q6Is3gJdEwzZ75
	jGJTMG6+R5WzxgGZgdJiIe7Cb8uw3Q0amQO5+jzLZAxs8B9yguViXJ1lp6Ncr5moLV1vB1IDlmD
	qo8EhU9ogwFA/PBvlJ83qB07YtB1Dow+Fl+J58aoizDhMFYLmnnXr3ByQjr2TkQ0FsByxZuZrae
	1qQT7JRE8AyMAJDxTKOvveJ0OvwfcV0cfzY5xlX7wBss7n2jLhzFOsvMsFoCMAotTPOZwvaXIJ7
	cV04VZ+nhwuCIXVHrz9LgXN/77Y4DbDOr1gncz52a5ewuvHcZw/XqOZ9W3JzWqO/3zOBZXqZvqJ
	MfyXZGjvzyBwbXvMCFgw==
X-Received: by 2002:a05:6000:25ed:b0:48d:fbf4:895d with SMTP id
 ffacd0b85a97d-48e07bbe6acmr18262851f8f.19.1792459206869; Mon, 19 Oct 2026
 18:20:06 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020003641.1012025-1-shawnq1@163.com>
In-Reply-To: <20261020003641.1012025-1-shawnq1@163.com>
From: John Stultz <jstultz@google.com>
Date: Mon, 19 Oct 2026 18:19:54 -0700
X-Gm-Features: AclHuK_84z5UzNN4cH3Q461JqQt5946Jj9_dwyHMWOkEQ3FMJTpayiAMsl1cJC8
Message-ID: <CANDhNCpYAVgxsF=+3YE8oG_HzDxrohADkvqbZVSbeNJhB-vXLA@mail.gmail.com>
Subject: Re: [BUG] timekeeping: unprivileged clock_settime can change an
 enabled auxiliary clock
To: shaos <shawnq1@163.com>
Cc: Thomas Gleixner <tglx@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 5:36=E2=80=AFPM shaos <shawnq1@163.com> wrote:
>
> Hello,
>
> aux_clock_set() validates the requested timespec and clock state but perf=
orms no permission check.  After an administrator enables CLOCK_AUX0, a pro=
cess with no capabilities can set the system-wide auxiliary clock with cloc=
k_settime().  The same clock's adjtime path and CLOCK_REALTIME setter both =
reject the same caller.
>
> HEAD commit:    fe2ec83746e501645709761605c2464a44fd2929
> git tree:       upstream Linux checkout, local branch master
> source version: Linux 7.3.0-rc4-70-gfe2ec83746e50
> compiler:       gcc 11.4.0, GNU ld 2.38 (from the kernel build banner)
>
> console output:
> https://gist.githubusercontent.com/shaos26/189eb1fec9f2b4e69e979642496f5c=
54/raw/75acb2f68b89a64dd4719f2493e4c2a161e38cb1/console-output.txt
> kernel config:
> https://gist.githubusercontent.com/shaos26/189eb1fec9f2b4e69e979642496f5c=
54/raw/01c9b3f973d527975537280bd7631127537531e0/kernel-config.txt
> reproducer:
> https://gist.githubusercontent.com/shaos26/189eb1fec9f2b4e69e979642496f5c=
54/raw/003a5649dccbd0218da367d906093594ddf3c8c9/poc.c
>
> Build the kernel from HEAD with the attached reproduction config.  The Po=
C acts as /init, mounts proc and sysfs, runs the test in a child, then powe=
rs off the disposable VM.
>
>     mkdir -p build rootfs
>     cp kernel-config.txt build/.config
>     make O=3Dbuild olddefconfig
>     make O=3Dbuild -j"$(nproc)" bzImage
>     gcc -O2 -static -Wall -Wextra -o poc poc.c
>     cp poc rootfs/init
>     (cd rootfs && find init | cpio -o -H newc --owner=3D0:0) | gzip -9 > =
initramfs.cpio.gz
>     timeout 120 qemu-system-x86_64 -kernel build/arch/x86/boot/bzImage \
>         -initrd initramfs.cpio.gz -append "console=3DttyS0 rdinit=3D/init=
 panic=3D-1 loglevel=3D4 nokaslr" \
>         -nographic -m 1024 -smp 1 -accel tcg -no-reboot 2>&1 | tee run.lo=
g
>
> Two fresh minimal-kernel boots returned success for clock_settime(CLOCK_A=
UX0) and read back the injected value.  CLOCK_REALTIME settime and CLOCK_AU=
X0 adjtime returned EPERM; disabled CLOCK_AUX1 returned ENODEV.
>
> Impact and prerequisites:
> A local unprivileged process can alter a globally visible auxiliary time =
domain after an administrator enables it.  This can disrupt consumers of th=
at clock.  It does not change CLOCK_REALTIME, CLOCK_MONOTONIC, or the core =
timekeeper, and no memory corruption or privilege escalation is demonstrate=
d.
>
> Validation: Two fresh positive boots returned success for the unprivilege=
d CLOCK_AUX0 set and read back the injected value.  CLOCK_REALTIME and CLOC=
K_AUX0 adjtime returned EPERM; disabled CLOCK_AUX1 returned ENODEV.
>

Looks like a fix to this was submitted earlier today:
https://lore.kernel.org/lkml/20261019080324.4147815-1-4ncienth@gmail.com/

Maybe could you validate it resolves the issue for you and share a
Tested-by: tag?

thanks
-john
