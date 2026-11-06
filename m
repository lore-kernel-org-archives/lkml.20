Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793924861;
	b=KTz9myqv851RwBI1iGqHEsPh+RrhkRKLFcdJ/1FQmmp5eeiAQkzIoQcMiozk0Gnaf73n
	 9TZVbX2LymFPzKWTQz42+p2NAFKxuhTl3/N9vzNCxMU6ZXbNKKiu6BvtqCzG/N2fjeWaE
	 ZMvMm06qAq1EQRlvTpkMt1vqpGK+Z43MqhBTQNZcQXRCNTtB7nWSr2CZFyr+bYy7tOIzQ
	 0Z0PjypPKCUVM+ZOb5Uu5DWAQizruGwq5w/UD0ST/soqqhHi44BIJhPTt1E9XhwSz1IQm
	 H+ZulcejgGK7GGnRxAlPCAvJnVcEPiqHwBPxk/HPit5iTepXBEPBezrER8JYfw27S8g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793924861;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=lQxfqQqFBFzOVfTUhrZDisLoJMIcujAgL0jSoxPWA2g=;
	b=ptosEacYaFwOzcvJI9rqcRE5Y15sBSH+05DVxDlT2hwXNevMdwoOY7QN+Z1S83OS1ndY
	 IEalONtYVE/reK3dKOGTwzEV9mpcAv+M9sleIMTRqwMBV5mkusYFJrr87B1Fpa642d87N
	 3qCz+VdRN96hBnXblgBfGGJIlA7+cbHHyDU3Kb2iYj95/B0A3YqypAZRX52tPc/fAwsaQ
	 bJuL8sHoFnAW5BSzaDE0xO1BZlVW8/MScp7UhpYfINfpSi5G5RqFUrPOrBhYVOfCFGYF0
	 1JX/x9QapdMW670eC+8wYUOetz/XnxsTU5ReDUkQHFPG7TCUcENWn7VyaNUEyqEodiQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B8aotozh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.182
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39474606A31B
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 00:27:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39474606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B8aotozh
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8b32bc605d9so19448b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 16:27:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793924860; cv=none;
        d=google.com; s=arc-20260327;
        b=JDkIkfcfB5DA0NF0KUHcRoKOL6UROV2PJoRSq7USacm8HGnZQ429KMDHU825Wy69LB
         16uZQMiRUYj9FuEyslbA2pAvzhWrrmRlzk2EbJCIjidsfJ3n+kuPhhAXgr19BAl3WvO6
         2PsFDDbKq9TyFLtnH/mq5y7F/x+iH9rnOQwQSUTELpN9d/HvD/YAc6JzEGzVN5Af5ZUb
         B2GYhT0RQY7MI1B4Fq1hvNXe/9daXuKLy0tu1HgMcT1apFLNdIjjBlTHfIAFw4hu2OEh
         bfualswr8DN5HKp+M6TNTbQs1CLVS9YTlC3Y4LVdeJU1Sd08tCPY3qxoEwpZ2/GMgSBK
         LTEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lQxfqQqFBFzOVfTUhrZDisLoJMIcujAgL0jSoxPWA2g=;
        fh=Uuj3RGr54p+UFsku8hxV6eJtKs3XiMOe7vxFFJbIkKE=;
        b=AJD2O2udhtuzFmOl+W2dB08PFhXNEq1nKeLJluSVXqMnwxHbrUY8qwftNzEit/UM8g
         kGQMblYVgFhu228zWqQ8K9lQtCMGw7QP0YTsP82WLSLZKb5BWWWywvhUuRnK/zp2s08D
         mu7tRNIaaGzEsUvjIuVd1bsyjyVvKENOYfr0f9wFbXd9JCBlNVoHXIi/wJxN2+2D+OlO
         HDHoM/LWrjdrsJPPjfwQgp52vk5O9VSwBvDY1r8XEIGYMvau6AGZhsQDGyJzJ+QskqEb
         Pgbcro2ak5u5r9dWgJ0wDXXse138643U4Dnk0bIQsPPnXs3+qlKNQCrVBD9EyYQXnGRV
         LkBA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793924860; x=1794529660; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lQxfqQqFBFzOVfTUhrZDisLoJMIcujAgL0jSoxPWA2g=;
        b=B8aotozh3RbL/dFwkTi4TMSy2nLYpJUYRWEYI3cy5AUlsnNovNsF/611X62qwIKAnT
         Q2Se8RO/zDE3KstqARhy3XiKYDXNDYRU68XBMd1brohkfCDrMN856R/hzeBiGFtfaTmr
         ipylV6gZcwXVF5im89jT0tXa3Te9VZGxBZ4irnxv8ORH4ncezZX44sd03ZY1oIiIfJ96
         +boVPu9To0OpNQ1SueOHPC82BfqVSmXy4OfuDIXN2BFSf4B5UroMtl0Q6f+VqQmTYmc2
         1/8XjFBSNQu7BymnVB+h5n22omGDmFgpDri9FMZ80i5EeuLLXYRDlq5mGN4OWeYkyZCy
         IMAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793924860; x=1794529660;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lQxfqQqFBFzOVfTUhrZDisLoJMIcujAgL0jSoxPWA2g=;
        b=w8gHGM3H2S5cHXIxmxrAJNr18f5rpVxd7xOK3L6IjTt/efKcy7rTDoSYNOYW1qFA2p
         SRRhlcxCH6VZIOIOoPwj/g+QL0iKuhQyajIz9xFV7ZfometEnmUkfs3lOFORIcBZyuYo
         5R89kre3/Q20nT2Wu2/6wmK0vWMuoMAkpJDhPJzu6jd0WaNynxI40XFLsXaY2ERJyYb4
         Qm+m2zus1U2W3fkBhGCAErErQiQ6FKpQK4xnRVVSn0nM1UaK9IKvBD7KcAFbuPUuy09d
         Jpani48hsPqELx8F6ISI4i9GvH2QC8O/zWzO0qvFFQurc4jsY6Aj0ig+K11Ex8WLv0wY
         AKMQ==
X-Forwarded-Encrypted: i=1; AKwUvBzQXb2k4xBIp0gBWJH6QGdu8q1UfuX5w5dx5w6aoraYWsb34ZiApqIghEalGXdMD0UCcoSnxpbpOsZOM9w=@vger.kernel.org
X-Gm-Message-State: APuU4Z9BDEooLlu7pAas3nAb1IW2/m/Ix1awI7TH5xgvPOuImfRFsjwS
	WG9o1JSVuUokywWGEvMsxUjpFfIdGbxVv/hwaG2K9NhcDMrXdCKLbPnGdLFYlOmVRSo7fE+U/oA
	2pf2ko8v9dD6F5kQk3gUxhTmPxsRqCDo=
X-Gm-Gg: AYBFou2kjGQZ9WjJMMJU5dqEDxxSAJgptoTFZHjXmpS/1z2bIDpT1SAt2/Kxz73Qw8p
	5kh+Ec5Yx45I6qg4bxd7AoY6CFri4G8PhARpy6x6XX9TnNFTnMCRNIWtOrhIaRd4RGUELgEIp7d
	cwYVqV4fu6JcJAzipRzDWk5xn2NVIYiWnruLPTlJLeq8q25Nl09ffl4Tg0TSkdNQ2abyVTh2H4U
	/rxvmqufwiHY9Z5jVhx3lgZFaYAzz/EDBQvB95n4LQTKCQxmPFr4WqKfk39mWTexcPyRbIP+cO3
	Sgx79o3AIK52Yqyfk1DcJJ5s2fQ7+SZ34zXHt2fAzvYRXMXLcEGgtxfi9RecEcVmpZo7De9l26S
	6r6vomg8nUOC1I9g9AinB9hoMFFCF0qy/IshW7hQ5c3GYEBLrbZciKe7QIMskRtsRt/FqaN/3y4
	TeepPvTj5n++F+8W8G
X-Received: by 2002:a05:6300:67c8:b0:3e2:83d5:191b with SMTP id
 adf61e73a8af0-3ebb2aa4cd3mr1017226637.63.1793924860049; Thu, 05 Nov 2026
 16:27:40 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030195025.5153-1-muniquefeitoz4@gmail.com> <CAD++jLkRYb1Pn2G=cP2yGkSFbuHhzRQ-fDbTygmpxbCsm-02gw@mail.gmail.com>
In-Reply-To: <CAD++jLkRYb1Pn2G=cP2yGkSFbuHhzRQ-fDbTygmpxbCsm-02gw@mail.gmail.com>
From: Munique Feitoza <muniquefeitoz4@gmail.com>
Date: Thu, 5 Nov 2026 21:27:27 -0300
X-Gm-Features: AclHuK9Mf-gcoGvhdirtuFilPtygvQ33RIDVt4CdaQjJgJvOHKAoPNhtTi8dHeA
Message-ID: <CANA1Db=sBQFR99pw0YUSS9sUcHtHVn-SoUyj3p6Vxa+LLJF_Ug@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: amd: Clear interrupt enable on spurious IRQ and
 skip unhandled EOI
To: Linus Walleij <linusw@kernel.org>
Cc: Mario Limonciello <mario.limonciello@amd.com>, 
	"Mario Limonciello (AMD)" <superm1@kernel.org>, Basavaraj Natikar <Basavaraj.Natikar@amd.com>, 
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mario,

This is a real issue observed on my desktop system during boot:

CPU: AMD Ryzen 5 5500
Motherboard: HA0QING A520 (BIOS 5.17)

During boot, the system experiences an interrupt storm on the AMD GPIO
controller (IRQ 7), eventually triggering irq 7: nobody cared and
leading the kernel to disable the IRQ line entirely:

=C2=B4=C2=B4=C2=B4
irq 7: nobody cared (try booting with the "irqpoll" option)
CPU: 5 UID: 0 PID: 0 Comm: swapper/5 Not tainted 7.2.14-arch1-1 #1 PREEMPT(=
full)
Hardware name: HA0QING A520/A520, BIOS 5.17 04/02/2026
Call Trace:
 <IRQ>
 dump_stack_lvl+0x5d/0x80
 __report_bad_irq+0x35/0xaa
 note_interrupt.cold+0x1a/0x58
 handle_irq_event+0x72/0x90
 handle_fasteoi_irq+0xb6/0x1f0
 ...
handlers:
[<00000000d546c9c3>] amd_gpio_irq_handler
Disabling IRQ #7
=C2=B4=C2=B4=C2=B4

Checking /proc/interrupts shows IRQ 7 (pinctrl_amd) accumulating
around 200,000 unhandled interrupts on core 5 before being disabled.

When looking into do_amd_gpio_irq_handler(), pins that trigger an
interrupt but are not registered as IRQ lines
(!gpiochip_line_is_irq()) only have BIT(INTERRUPT_MASK_OFF) cleared
while BIT(INTERRUPT_ENABLE_OFF) remains set. Clearing both bits stops
the spurious interrupt status from re-asserting.

Best regards,
Munique Feitoza

On Thu, Nov 5, 2026 at 5:18=E2=80=AFAM Linus Walleij <linusw@kernel.org> wr=
ote:
>
> On Fri, Oct 30, 2026 at 8:50=E2=80=AFPM Munique Feitoza
> <muniquefeitoz4@gmail.com> wrote:
>
> > When do_amd_gpio_irq_handler() detects a spurious interrupt on a pin
> > that is not configured as an IRQ line (!gpiochip_line_is_irq()), it
> > currently only clears BIT(INTERRUPT_MASK_OFF) while leaving
> > BIT(INTERRUPT_ENABLE_OFF) set. Unlike amd_gpio_irq_disable(), leaving
> > INTERRUPT_ENABLE_OFF enabled allows the pin status bit to keep
> > re-asserting in WAKE_INT_STATUS_REG0/1. Clear both INTERRUPT_MASK_OFF
> > and INTERRUPT_ENABLE_OFF when disabling a spurious GPIO IRQ on both
> > main and RGPIO banks.
> >
> > Additionally, if no GPIO interrupt was handled (ret =3D=3D false), retu=
rn
> > early before acquiring gpio_dev->lock and writing EOI_MASK to
> > WAKE_INT_MASTER_REG. This avoids unnecessary MMIO accesses and spinlock
> > contention when the IRQ line is shared or asserted by an unhandled
> > spurious interrupt storm.
> >
> > Signed-off-by: Munique Feitoza <muniquefeitoz4@gmail.com>
>
> Sashiko comments aside, we really need to put Mario on CC for
> AMD patches, Mario what about adding yourself to this MAINTAINERS
> entry:
>
> PIN CONTROLLER - AMD
> M:      Basavaraj Natikar <Basavaraj.Natikar@amd.com>
> M:      Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> S:      Maintained
> F:      drivers/pinctrl/pinctrl-amd.c
>
>
> Yours,
> Linus Walleij
