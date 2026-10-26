Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792993135;
	b=j6M6lVEfkcJR2J0J/uc1qtOGLAYDAOEclP/4hYA9gVjmwF42ICgveUZWUcOs7CpDKyxA
	 VDYclZt051ebzfZODdmvY3Tr/M04VAfl8Ir2wxjIdhulHn8J12XWSmx6E6ntusr/JRJvR
	 eF0WQ/89EnEKDp/bdv4oQU6UJwD5NSDukvbAzKRRWAbkExuX3uVoqjb06rwbXbUl8dZ6q
	 tNK9ONRAw6xvRbEYJlMy/3tFWmxwxMS1ElzYWbCF5SzRicQ4wjmWna1F2dx7zJgRjuUIv
	 dZwNrT48jf6f3wCK/QHCDpVRg5Dsw4ME3XlC2AZCXi4+GFQX+6LyGWKa4TUyGD/kRlw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792993135;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=KRC9z7Hf6UT0/DB2ko9R8MQynM5giNRybmjOpJEixmM=;
	b=TCRDocm95dS3bU9noGh/hPkvg640+QJRf0zFOnu4QvQeDMv3lGTsPMECsXLSVsDwxvYx
	 zOyEazwZ0vPNJPKH8nqqZd0BGsFKwQSGz0C5JVHuGCfWr4aX57CTqL5sroDKBuGi4KsC9
	 r3DDPZ+qKLoVZOhaQeEhsEkw6hTHBj/mqQiPfpi2RH80HF6rr7V/7KrmkZUbS5lgLImCO
	 b5qG6JyMaiDWxpN7YQSqvJjKU4WF2MJrnw6ecxyxWTDDFbSGjJozV/L6do4NASzYDxvuT
	 PdmhrLfGs+DMIOIL1NYIfhmYNo/MIVg84/NDpYqopOacybI8FpSRSBDx1LcrYcP7+EA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=h8cwqi9W;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0101606A334
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 05:38:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0101606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=h8cwqi9W
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6a0794669a6so3376151a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 22:38:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792993133; cv=none;
        d=google.com; s=arc-20260327;
        b=eesupcKQvCMCFiivBwhM+PYwJOI9H7exOyW1cmteCjJhs7Fvk7W4dkbqM0adMco8KL
         +NEdV/pJUVfqcYMa7iZzatVby0bQ/uaJ34bAd01kEwY48zBH0yquEVnMYkqCftAGpiFg
         leeVrFBDI/bdnB5fHDb37YX6z2UVFGsFjLmd/kr1Das+iWZGzd7TK2gk1n1fqKy4RVv3
         T5mgjUzSU/lrGwXAnmsGYpeMPMEhN2bQw56VOm2NayrAiqI+X+ilDiuQ+v53hHhvYtlT
         1ojsrPL7/ukZzu5q8yY/SZ92SA9hfZPpk9oNxmjP240YUJqRazgUFC6mPpxA6ebqcPBO
         wA0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=KRC9z7Hf6UT0/DB2ko9R8MQynM5giNRybmjOpJEixmM=;
        fh=+TLfjUrMV6beWopGCiffvrMREumPYm1nYfIPY3O2law=;
        b=QWmaderY1wGzcGnQtKFjcdSQ7Ru9e6ecN7GmyRulZF0gtzrVqNVffowppPl97rkp0G
         otpNs9L+iEbLTs8qQPfswoJDfqu+mg2UK8qtMic2Yi5UVV5EUY1IPmW1MIV+yrprVl9B
         81g/MKFN3j9Fd0ZZdEQvMmtfJu19b+G9sXUZRIynseZAl/aSgqxQtCImIUYhqGQLqFGk
         UmqAcmTZSuhURxfWk7K/cBihEp8WbDb13QH/4RohLljQld32Acly2qnZ0TVjNN7AyW13
         WB7I0Tn7w4b3bNnSJrH6/z0cfSFCpWlVVy5xp3zphWrjgulhYuKeu4fNmi6papNQrNBU
         9fDg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792993133; x=1793597933; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KRC9z7Hf6UT0/DB2ko9R8MQynM5giNRybmjOpJEixmM=;
        b=h8cwqi9WjlJSAGSKlKfOTcAaAxe0tfDFqa0Gsvz/Ndbe1JCZRvUVXa5DCTLIQ9NurI
         QsCFc2vC1jnTzzDdB70Ldr8nslkMRgebFxlEZUEi2B2fbFVEuR5T+HrDekjewqQ1YyDj
         D+LspUaRacgvWOb5usMfUhg4cv1Q+abRzNv8AGeAa2qO/o5NR2nBLsZ+NYk1VCAueEU/
         YXRzTQmtF4M5yTOLJM7VDQ9CPhz2/VB6830idnQg1ppI+QKcJ6IHU02BlOHuVG737+p+
         gl3lGAkBUAblr6szfDi6RidfGiukhRUisqKezznLGez2ZRQ1+7U55BqvrjLj8quk+d4d
         Gmng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792993133; x=1793597933;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KRC9z7Hf6UT0/DB2ko9R8MQynM5giNRybmjOpJEixmM=;
        b=kyed3rRikwYJjCs4T6E0SNEitCXXuTyoQ1BL9o88w0/XXaZVIkYBrTZ2uFqGN+d4XN
         FxPcgXZ4O5M29VfZwy0kHp7JHPeMJ7UyL6RHa4GSwfm81AjoDE1ifb9WlVvbpwljq/D4
         CQsasz29/MQ9q2f2w8WULGIjLmbEVztDY0FZSBvzxzcaIcXfasHobQsih3iICQiwD3QG
         NWDDm1n11Xhi4F+vYpvaLAfUXHJ14t7NO5XqhKMb10LqgMc0Oo6DzP8QhJrz7GMueSVO
         /oKuY2CXpk43awL6LGD2m4vsruEsCO0Oj9TqXykk35quqQkTczCSlmIhbG1Dbmcdaey4
         8gnA==
X-Forwarded-Encrypted: i=1; AKwUvBw1BekEIu/DRn65lBtW9FSpm83x7k4PmtIVF4ZE2f9L36wwhCk72WJBz5yWx3W6AymOFsoHq4Hw0NswiXU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJKedcwlM2APygOrvx4a0bSMJKWMMJhePCbu+/dI6DInLmah7fX
	Phr7QimnjZEUYfm0FM3o61a2GkOiXfhuBPneguOH2b5XhBOl6xFGVg2QGUzk+yAGRaWwAPtHZr5
	jvNGklUrcxnRqqnpXTHbcnf9s2UVjZq0=
X-Gm-Gg: AYBFou1CbMBERIAoJ7DXNWLYSNylinQ/SctzZxmeOb8FDTBbRfaG8ZFDWqwgES7lu3L
	iRaEk1l7mLghAye7fUaMFaSqVMdJBeWdvbHkxDrViRtpzrpPoW3kMe8/QvmpUAYQvPV1/VVk7gf
	XVOUUVeSSvQoM3i/oMREJ/l+/Dvx5ljiq+rIPJ1zs9azzUGb6OBOUxWNOBqevikp7sBsnsSaZYw
	9BieCGX88Z6SFklBlE6V2t1xaCfbcymaE7BmeXM74oUFW/I16ImXL2l902PgFUKkXhpGefLPMyJ
	yLiYAX24+TOg9NrhIQnKzaosrslgPIgeog/3dFnDhPQ25e0q9+zitDR9KwIJRfHecJ2WOvdw5/n
	SioPkBPm1QoxhcLurXMKWzx/kwX18Bn/oN18=
X-Received: by 2002:a05:6402:5630:b0:6aa:1112:62f2 with SMTP id
 4fb4d7f45d1cf-6b442fcb0b1mr5488509a12.15.1792993133095; Sun, 25 Oct 2026
 22:38:53 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261024092558.143621-1-alan.tseng.cs@gmail.com>
 <20261024092558.143621-2-alan.tseng.cs@gmail.com> <CANAwSgQ=Djw_o89MgvEsmKVxuNiE3Yuy=e0T5DcLfqCYy6eWMw@mail.gmail.com>
 <20261025130206.187282-1-alan.tseng.cs@gmail.com>
In-Reply-To: <20261025130206.187282-1-alan.tseng.cs@gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Mon, 26 Oct 2026 11:08:36 +0530
X-Gm-Features: AclHuK9RjSFEksyS7-_jnVXSvRIxT2GkoKRYV9Xd_PqlQ07C_F6NfX7RJdwzzV4
Message-ID: <CANAwSgTiSiEfdLD7yUwcbFnXfRpnSNZu_GXLnQnXipc+ansnPQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] riscv: dts: spacemit: k1: mark boot-critical SoC
 nodes bootph-pre-ram
To: Hung-Chun Tseng <alan.tseng.cs@gmail.com>
Cc: dlan@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	e@freeshell.de, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Hung-Chun,

On Sun, 25 Oct 2026 at 18:32, Hung-Chun Tseng <alan.tseng.cs@gmail.com> wrote:
>
> Hi Anand,
>
> On Sun, 25 Oct 2026 at 18:43, Anand Moon <linux.amoon@gmail.com> wrote:
> > Could you update the pinctrl and GPIO configurations, including all
> > necessary pin
> > assignments, to bring up the SD card, PCIe, and Ethernet nodes?
> >
> > Please ensure that the required bootph-pre-ram properties are applied
> > to the relevant
> > pinctrl, GPIO, and other dependent nodes wherever necessary for SD card boot and
> > SPL initialization.
>
> I'd like to keep this series to what is needed before DRAM is up.
> PCIe and Ethernet are not used in that phase, and their pinctrl-0
> entries are already in the board files.
>
> For the boot media, the BootROM has already set up the pins of the
> device it loaded the SPL from. U-Boot's spacemit_k1_defconfig does
> not enable SPL_PINCTRL or SPL_GPIO either, so the tags would have no
> user today. SD boot on a Milk-V Jupiter works without them.
>
It is partially working, but the current approach is not ideal.
I have made some driver and configuration changes to get it working on
my Banana Pi BPI-F3.

The main issue is that SPL_PINCTRL and SPL_GPIO support are required
for board bring-up,
but these options are currently missing from the U-Boot configuration.

Here is my u-boot logs with some debug prints.

[1] https://gist.github.com/moonlinux/a491bf56bfa914e4bf5f661635eefe9c

> E also asked on the cover letter to keep the BootROM part and the DRAM
> part apart, so I'd rather not widen it.
>
> > Additionally, could you update the regulator-name properties for
> > vdd_core, vdd_1v8,
> > and vdd_1v8_mmc?  On all the boards, the SPL code requires these regulator names
> > to locate and enable the corresponding regulators during early boot.
>
> These names come from the U-Boot SPL code, not from the board
> schematics, and U-Boot already sets them in
> arch/riscv/dts/k1-bananapi-f3-u-boot.dtsi and k1-musepi-pro-u-boot.dtsi.
> I think that is the right place for them.
>
I have made some changes while integrating this patch series into U-Boot.
I am following the approach used in configs/starfive_visionfive2_defconfig
to keep arch/riscv/dts/spacemit-k1-u-boot.dtsi as minimal and generic
as possible,
focusing only on the essential SPL bring-up requirements.

> > I am verifying the changes against the existing U-Boot board device
> > tree and configuration to ensure
> > that SD card, eMMC, PCIe, and Ethernet initialization work correctly.
>
> Thanks for testing. Please let me know how it goes.

The goal is to move most board bring-up configuration into the
upstream device tree,
allowing each board to enable its peripherals using the existing
upstream configuration.
Once this patch series is merged into U-Boot's dts/upstream/, we can
keep the board-specific
configuration minimal, avoid duplication, and reduce the maintenance burden.

>
> Thanks,
> Hung-Chun

Thanks
-Anand
