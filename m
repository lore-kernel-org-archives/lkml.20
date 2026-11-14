Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794676924;
	b=D4h9pfE7Xg8hhQKpIQLhtEVM978h3uZw459Ax4IbyGFsqHuhpfzuGOYomcV4E2m+D5Fh
	 wchi7fma4HSGXZK6vXjiAb8BDFP3nUWztsgiNEgZozubrMkSyeOC4j/wHFz+2fYu2ZvOK
	 8t0/1Avq5ZtXPEihRw1+Gyv6EyhdwDuxbYWsU+uf/ftovazF6lhiH3/tid/EnagNs6JVj
	 tgRrsK+AmiBYxpwQs3lQRkqpH8Slee/D7lyi69VOFVrlzwIkn/9gts9T7wcdekPA9fEI+
	 jiGqmTPDlM/6ss9h5MxhEbLcKANpVNVONYjgOhjv6ix/br9QdUB3fNSZX8fStcrltqQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794676924;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=1FxwB/4fd1fC7Ne8SpykVHTVQmn++Y9ZKfC2D6FASKM=;
	b=yerY5Hglr056PFbHx6tqEXrz2qvXyKhcep93ne837XrTtIUnLvxzxdHrHzo4DLR84BBu
	 UEL4cVxSELVj7TbCjYOmux0SXQQeGBKtcZr+CBT4bwO5sqhyo8HpKbLMp8AaQNTGlQQMf
	 YcK9mD3hCZ+l7IV2yYMjNp3uvcuR89QJbV7xK4VqLTJvWGIMYIadm9sBZPYavQb7MAzwh
	 rv1t5wSMjsi2wxhiPLXGP9S62qVb4YkH/viYVtF1CUI7shUNm2XBGRkvkv1XAhdGvz8SA
	 NNqax4n8atJ0uNVpGxYtnspPNe9dnJxa/XCkyzDWedvxdcFVSB+aJQw+GW+uM+M8vKA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="XXp/MagJ";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.44
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E362C606A323
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 17:22:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E362C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XXp/MagJ
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-4a76f63b243so3043836fac.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 09:22:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794676922; cv=none;
        d=google.com; s=arc-20260327;
        b=YsfC5AKFaXyZ47yfo4gXnLXi2++mmbD90SGcdW4Atzc7JaPdzvd9sRSoLjSDRCmPCZ
         ohx//pp9nUmXAVNIO9vJu+2kPEe98LM7riy8SWlrKErCVwknCCy8ifsqGU/lf27GK/yZ
         K9hwgGxxFZEpDo6G8zm1jPlg9oiVHDbB7M6z/CvWJd+hasQf/JluT6Z1YaajuG8oAxvJ
         4QyzXswD70h0UG0oI5UJs0S8AqpK3caalWFU3z/AVb7S1USsZD9AAMXrDUuay03S2f8J
         Gium7RVMOl132m6oT4tU3oXnGQcUvP52qChiratDosktyPVeRdMJVolwdsJmAkayoPci
         ZyrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1FxwB/4fd1fC7Ne8SpykVHTVQmn++Y9ZKfC2D6FASKM=;
        fh=f8RoCLErqjF7pqMB2M0yp7AN7mpcEolrdN4WfSIYEzM=;
        b=EL9RLTxFdpcC1A+/7SUOArqs8Ybn9DvPUaQRFx0hOT+ybG2uzZOKsQVDhP+72RIChZ
         vXf37iffvDi1Kmhu2FgHtBaqikzU4NrmHXoT6jyAZ6HeVi9EY9sWzGCk9SNz4tGdQyYl
         tMw1qHiEA/L8p9FwFFnwWZEy2cBg7eMaoH8CJguayIXeSVPbOvT8SOvr7v7n82Cyl6Yw
         P3yk7TanADO33I4jSxpRMlsRgq8s5xHt/ib0Kzrq2nnFLzMjg4obLxcE2YSK8N6pbX4C
         /Z1Nt5fpgBDtofoXla2l3JYTfRH85ggUB4fgZFacqwc0uaVkNkdcPh7SEk+cj2H7u4zv
         RNtg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794676922; x=1795281722; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1FxwB/4fd1fC7Ne8SpykVHTVQmn++Y9ZKfC2D6FASKM=;
        b=XXp/MagJ1q3w15vWYVb8uhUnb3rtWUUJZ5FnR0tFsqofzsXOkQRWRm/2tpCGXbQURC
         1Nhg+wKdpfe31bkt/3gf7/WjgmOunWutiW/MciotDR429NgI6zYmKy7PHGl33Q0JDT2N
         xTgrd927pqrn87NMS5Lvg1vHf/Tz1zXSC6Pie5Q/0VJwFpZLFA/Y6JSXvvfQVK+4bCN9
         PQzeLtCo4uiXK6E08q6tOoUR9ILaviuEul1tg1zm4nrrRIrf8ZdJ1Uoti0Td47VBSNGL
         hnU0shwWH+hfPo0OSkeU23GbxZhsEODskWWrUXnhGNcOSOfrdVBN0PapIIi+H+wpAXU5
         2FUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794676922; x=1795281722;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1FxwB/4fd1fC7Ne8SpykVHTVQmn++Y9ZKfC2D6FASKM=;
        b=ZdWQx7vTdyP3SW5F41JWE88+EXkzgjRExI3y2Pf14mjL0zt41yc9Xk4c82UA9mwCe6
         TZ0cpTA74stDpyZQ15YTAddGuIDPi3rJNwhxHRReyj98Q9n00R+dXEik4GnlWuenyT8b
         sUVQGwrPtTxt6yJyxGG/KQOxUN3emSKo9w5D7Rm9AggibgteZfsIcrGczyQdtqHhu09i
         YJ0qGnnxlJY3jo+sisM39FlZ2oYOYUncC7UD6iiAS/zNWCe+GcNbQ3CGPaS8aGXBkqA1
         guOzlbms6WIIF/iKkg/vGGpxm8ys2I1AqVRZuZYvRE6d4XZD1U2fl+jOgua+a62OlRyt
         vWXQ==
X-Forwarded-Encrypted: i=1; AL+hErH+tIO9ZNhmb8fBdu7qIjHymw/71CnU1zDQV8HEW2A/A5xloR0Ed9L3wZBX6pop3ZlhSnCNwfTtbS3vvIE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9pFrn/KW/ddk2y+bbYlVfjzcKi1SokU86Lp2KhYQ+vJLlDh7Ma
	imsz+WFfobmsRcwvLxTL48PFrHZBEF+BP9LxlS6hR3+0YmqwUZ1QzkZMOcljexe+Xj5qzyQJANS
	vZ98V9XFuiKSCYQhMkmuj1xTJ3xeq7l4=
X-Gm-Gg: AYBFou2H0YD9wJNdQfHeKAEgGUzEZyA/f1jVDh1TD1njAulbQzUd0k6j/Otj6IhVXDr
	ukA3/B/FzkmkZIXkt0qLF5S3OE6xQARQSgVbDdKc3aOIrDVFzvS6NV3w+7Cgcwe9E2foY6P4WOQ
	HL9Od22bwhRp3+wD6/5pu000ul/jGDjhqSyMRlY6NajevzlvGysPQ9+SJS0Ji8AGH3jMaMxvYBk
	DyJLQWB7MIsjGGa4rYskHHlPwqwdVTCaafITDkiUX7H/Xe2zmFlnvvWNtOVzFZVykP4VZ4oF3La
	faEVykGYLAx6MtIeai/01HreSE2pDckYwJRzjePWqyL9z1679QHZjLKB2MLlLf0ytO0iz4xlsOL
	XxG1T8kqXUrbmdUzwkQncQCAzCJVh2wrmJjH7BHM4vJ1XZGwkOAEClTqLspKSFDkSKCMJ87joOI
	SNx7getjzltFA86g==
X-Received: by 2002:a05:6808:190a:b0:53c:4502:971d with SMTP id
 5614622812f47-56cd88e794emr6967709b6e.36.1794676921875; Sat, 14 Nov 2026
 09:22:01 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <9b73858d-fc09-4988-8bab-fd7b88db9412@yahoo.com>
 <39e46930-0d24-46d6-8861-5dd309bb7640@yahoo.com> <1e8da5e3-0d1c-4ce6-bb3c-4b9b7a5789a6@c127.dev>
 <f84cfedb-b551-4316-8d2b-4d6e06fc151b@yahoo.com> <b68807e4-1470-4f4b-8975-e8a70dffd011@c127.dev>
 <20261111152158.467255-1-kuncy7@gmail.com>
In-Reply-To: <20261111152158.467255-1-kuncy7@gmail.com>
From: gabon pivovich <gabonpivovich@gmail.com>
Date: Sat, 14 Nov 2026 20:21:50 +0300
X-Gm-Features: AclHuK-dmGD1oYDEecnkca6jhtE7I1ej1lLyGD1r05U1Rlwmm1WEtVbhDOg3YL8
Message-ID: <CAOaAmLwEBfKsx3K=dr5nBPmJ9keHAvAOSgp7iLEciKH20pcSdw@mail.gmail.com>
Subject: Re: [PATCH net-next v9 08/11] net: dsa: realtek: rtl8365mb: re-latch
 the family D SerDes
To: Stanislaw Pal <kuncy7@gmail.com>
Cc: Johan Alvarado <contact@c127.dev>, Mieczyslaw Nalewaj <namiltd@yahoo.com>, alvin.sipraga@analog.com, 
	linusw@kernel.org, andrew@lunn.ch, olteanv@gmail.com, kuba@kernel.org, 
	davem@davemloft.net, edumazet@google.com, pabeni@redhat.com, 
	linux@armlinux.org.uk, luizluca@gmail.com, maxime.chevallier@bootlin.com, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, gusfmora@gmail.com, 
	fabianotassotti@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 Johan Alvarado wrote:
> Oleg, could you check this on the AX55 before the first ifup of the
> conduit? A single register read tells:
>
>   devmem 0x98218    # UNIPHY MISC2: 0x70 =3D SGMII, 0x50 =3D SGMII+
[...]
> Oleg, if the AX55 can take it, a reboot loop with that commit and
> without patch 8 would settle this.

Hi Johan, Mieczyslaw, Alvin,

I tested this on my Archer AX55 v1 (IPQ5018 + RTL8367S-VB, family D,
CPU port 6 at 2500base-x, booting from NAND).

Tree: OpenWrt main (24c13d794c) with the family D series from
PR #19644 (v10-pre4), without the re-latch patch and without the
conduit ordering patch, plus your commit 50e49862d2ba on top.

MISC2 register:
- In U-Boot (stock TP-Link bootloader): 0x70, so the bootloader hands
  the UNIPHY over in SGMII here too.
- In Linux with your commit it reads 0x50 already in preinit. I could
  not catch the state before the first open from Linux, because
  OpenWrt preinit brings eth0 up at about 7.0 s.

Timing in the log: the switch configures its CPU port at about 4.86 s,
eth0 at about 7.0 s, the same two second gap you described.

Reboot loop: 16 boots, 16 good, 0 broken. On every boot the router
pinged a PC on a LAN port, the switch CPU port counted received
octets, and FCS and symbol errors stayed at 0.

I did not run the same loop on this tree without your commit.

Tested-by: Oleg Gavrilov <gabonpivovich@gmail.com> # Archer AX55 v1, RTL836=
7S-VB

Best regards,
Oleg


=D1=81=D1=80, 11 =D0=BD=D0=BE=D1=8F=D0=B1. 2026=E2=80=AF=D0=B3. =D0=B2 18:2=
2, Stanislaw Pal <kuncy7@gmail.com>:
>
> Hi Johan,
>
> On Tue, Nov 10, 2026 at 12:49:04AM -0500, Johan Alvarado wrote:
> > Oleg, could you check this on the AX55 before the first ifup of the
> > conduit? A single register read tells:
> >
> >   devmem 0x98218    # UNIPHY MISC2: 0x70 =3D SGMII, 0x50 =3D SGMII+
>
> I can't answer for Oleg's unit. Mine is an Archer AX55 v1 with an
> RTL8367S, family C like your MR80X v2, so this is a second family C
> board, not the family D answer.
>
> That image has no /dev/mem, so I printed MISC2 and MODE_CTRL from
> qca-uniphy instead: at probe, around your preconfig, and before and
> after every pcs_config(). On every boot, warm and cold, probe reads
> MISC2 0x70 and MODE_CTRL 0x421. Without your commit, SGMII+ (0x50,
> 0x821) shows up at the first pcs_config(), at about 7.4 s, while the
> switch configures 2500base-x at about 5.0 s.
>
> One note on the values. In the pcs-qca-uniphy table, MISC2[6:4] =3D 7
> (0x70) is the USXGMII value; SGMII is 0x30 and SGMII+ is 0x50, as
> FlyFish-go pointed out on an RC3000 v3 [1]. MODE_CTRL says the same as
> your reading, though: 0x421 has SGMII_MODE (bit 10) set and 0x821 has
> SGPLUS_MODE (bit 11). So the hand-over is SGMII either way, and 0x70 in
> MISC2 is just not what tells it. On his board, MISC2 reads 0x70 after
> the boot loader's block reset when U-Boot runs no network command, and
> 0x30 after a U-Boot ping.
>
> Reboot loop on our OpenWrt tree (6.18, dwmac-ipq5018 + qca-uniphy), with
> the OpenWrt ordering patch removed in both images. A boot counts as
> broken on ping loss to a host on lan1, or FCS errors or PAUSE frames on
> CPU port 6.
>
> - Without your commit: 2 of 15 broken.
>   - In one, the switch sent PAUSE frames to the CPU (1368 on port 6) and
>     to lan1, and almost nothing got through. No FCS errors.
>   - In the other, frames from lan1 reached the CPU, but nothing from the
>     CPU went out on lan1, although port 6 ifInOctets kept counting. No
>     FCS errors, no PAUSE frames.
>   In our tree the conduit is closed and opened again at about 26 s
>   (pcs_config() runs again, the UNIPHY already in SGMII+), and that
>   didn't cure either boot. This fits your note that a re-sequence on the
>   SoC side does not help.
>
> - With your commit: 0 of 23 broken (20 reboots, 3 power cycles). The
>   preconfig puts the UNIPHY in SGMII+ at about 2.1 s, 3.2-3.3 s before
>   the switch configures its port, and pcs_config() at open finds the
>   mode already set.
>
> 2 of 15 against 0 of 23 is weak on its own, but it points the same way
> as your 18 of 51 against 0 of 32. In the same thread [1], FlyFish-go ran
> the RC3000 v3 (RTL8367S, family C) at 2500base-x with only the OpenWrt
> ordering patch removed: 4 of 7 cold boots broken, against 0 of 5 with
> it. In every broken boot the SoC-to-switch direction was the one that
> failed.
>
> I have put the same result on your OpenWrt PR [2].
>
> Tested-by: Stanislaw Pal <kuncy7@gmail.com> # Archer AX55 v1
>
> [1] https://github.com/kuncy7/openwrt-nss-edma/pull/73#issuecomment-67964=
51511
> [2] https://github.com/openwrt/openwrt/pull/26597
>
> Best regards,
> Stanislaw
