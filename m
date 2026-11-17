Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794924752;
	b=uT5vFvuDXomrrpal/55pQYbUyp/XrhcLE1cdPoT4lPKo+lOGmvMDgKMlWSW2Uumgklx3
	 A5f+BWc0U72cET068W3/mlLWVGEkX7M3bjQor2MBGAvN1rVNoEIGSr3/vFy9l+77d/hCe
	 LAOFBE8ksk2byrAEJ2ZIWXmeFtDWcDx14g0CJ/ceQej8oyngyogRkXNO2EuzGkIYmDvJm
	 cXJg/ZHCwMLcPIGeI6/+65PbHc9qQEl4Haayt63j69T39LVzkMfpOF10Ehwn1lb1P0x84
	 Z58z04hBMvx00H2Im5nbeSm7zwgj3NIAZ1wsem9Fp1xewxvERgp8heLpaCbequSYeWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794924752;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=X97KLM2kc+1MOkKgI4F1FwrxFLI65NOxfbxMj5IVHe8=;
	b=K1Vz67/HyrcMeYXrs3EBf/t78rBxjafiwYoqOFigkg6QTFMzI0dv1cwifISzoGK+chZO
	 Xr1jcTTL0KdfjhXISb22w7UC+yuSdNoHhGRvcMQMbXEuSy2llJOH5rxtnqdL+CiJxMwqt
	 s/MxsVrTNAEyy3/4X1p6Bs8mlOnU32Dzijr3f3clls6BtqPclKkYILEfuGjlp/TVCCqSj
	 oy+7waYvUw7Mw6pT2Bg21ctLD/YJkj7byOeJTkajxgWIc7sGc1vQO/yz5sJfEUi0T3fR1
	 b51SpH2aIbKLHCQRm5MoExYvaLMfvY+lyaj3Cl/ZnWOhr6sUZe0hYHF/frOHoeOUxNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=exabit.io;
	spf=none smtp.mailfrom=exabit.io;
	dkim=pass header.d=exabit-io.20260707.gappssmtp.com header.i=@exabit-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Bo4GSKea;
	arc=none smtp.remote-ip=209.85.210.178
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AC7F606A8A4
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:12:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0AC7F606A8A4
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=exabit.io
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=exabit.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=exabit-io.20260707.gappssmtp.com header.i=@exabit-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Bo4GSKea
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8b6a88e4341so1961473b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:12:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=exabit-io.20260707.gappssmtp.com; s=20260707; t=1794924751; x=1795529551; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X97KLM2kc+1MOkKgI4F1FwrxFLI65NOxfbxMj5IVHe8=;
        b=Bo4GSKeaMWBcCzBQUj30BiVDaBCBzDsrtg0JghncdHHEJhWe3A8ZjwoR+gn1zHiKzU
         uwoCRo1HYZ8Vcf3wHIIHfM2fhFHdVDdbI+qRVrYCdx3LunVxsDienj03k2kIVvbQrDmu
         Yj4ClXAsqfBFFlUd2WJPEMV3cyCf8LqvFsWDpygOochRGDtYOD1o3xKGfx3C5QnltGMs
         nIaeFzqcVi3Oc7VfmOEKhxI88Xm6rsZxegW1ymQiGD0lWZ9iPky3HDbSVOv1sf1UQfJM
         PlzC3KhruPsA9KSJw/bYCEp2hwwhcaD93e+Hkpih9RjDTt35IQvgPnYeBJ23lEyrvvjY
         a+SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794924751; x=1795529551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=X97KLM2kc+1MOkKgI4F1FwrxFLI65NOxfbxMj5IVHe8=;
        b=0w7oUW0aPj73rhTljuLBLML1YXOaHdhxRYc277H7gWJxCLlXQSEYIlt7lB6eDD0VIa
         xlY1L5/8n6UNBnEl6Gois5xMfa8bfjsGF0RhHsVTN/F6gSgph1SYo4jYFvhVcVQHaVAV
         uL6rWho/mr40STvW+vTlgmKiDU8z/gSeuvyLjeRWy2N1A8KEvn3PK10JmJTsex0/wLHh
         z3wP3tgdBRuIASCU1su5bagr8xaX1j6CxcdK/HvYc28haCPYk5INL1wGtUTPab4u8MGp
         xAPnyKbB0FfSyyb64opEW/Q8asPFTU9fzxA95wm26Fn4Wg+QnLeGTQ9ZO/j3vp/1++Dt
         6iJQ==
X-Forwarded-Encrypted: i=1; AL+hErGMMk3+wYJ5Pbj9Nh+hfaDU6VIzrGmuOc5noagMUyHgSuuTHk9NBSrEOpQu70LB3JsADeQtMXvvMtKE6Zs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+u/eh3oiywT42ZtJLczkZYMHi8O4c6vXZM36yOhLZXOb2NOhP/
	RFAf51x05ykwp9Hi1r7Zmqsbhr0lUALnwxj6NEhWps6NQz5+f4dPdxI5S+6rJr75+RY=
X-Gm-Gg: AYBFou2/1j12vnuUqxrHCL3co71MvsD2z56u9Kpoxt/9iH8xm4bUw+Fuf24m/sFPwL2
	dOwdbIKb7NjxXq4aFwUmDGKai/iKfQzuxJaF+jennBMCtCbSt6uwi+xSlnhtxKbWIwO40fypdsI
	9ysFhPVSS6qeAb0i4TStZi50mnKCgHol2tcIrLMpMaryKngRoE84inWTnqCMtjq0evsOFPBVVo6
	8VAsKJXr9DACpjGlNI3DrbLwqXfzqcr2/I6vWu8egkRmOhWjlUkEL/dT4rn4zteGIgYEGhSFBdx
	O0AKN+VlrezyHuyBTRMrfxKuuh+m02Oah09EiTKCE3M7a4C9fgOtY1DrIqZZNGZw1hCk0sSgdBk
	RC6LZvLhQgmrMmA3RDa2DdvDYFk/IRouIFAAZin2qcYDzaccrTCL8chLzIj/V2ZIQhGwl8MaS6O
	eHiJC4WsfLP/8agfQbiJXLST5SpzMRnUILbCnLaZ+osQDodaCMlISgBVbzdpQxvtACadKKNlSJe
	V3eVx3WaHm5N0NQTQPF79LdsrWbLOUYSGMpWEchtsBabiuRaYNfUeuI5kbxJy9WeM8sOIxW1hy9
	DB9AnV0IJcnDcICGyQcJYoglIexssVLsCqOuAC22L4bet3RocQE7+vHmuchs1AOCWGWsLUJz6Rt
	AGp7knToMWW7+ulmRV1yXVih7zhu2BZczYGYIMgHD5jPbUCN49rJzYos=
X-Received: by 2002:a05:6a00:2daa:b0:8b5:b10d:3c0c with SMTP id d2e1a72fcca58-8beaf3a8079mr12420935b3a.0.1794924751156;
        Tue, 17 Nov 2026 06:12:31 -0800 (PST)
Received: from macpro2019-01.. (c-24-20-225-94.hsd1.or.comcast.net. [24.20.225.94])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed12a7edbsm5271795b3a.18.2026.11.17.06.12.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 06:12:30 -0800 (PST)
From: Nikolas Joshua Britton <nbritton@exabit.io>
To: "Mario Limonciello (AMD)" <superm1@kernel.org>
Cc: mario.limonciello@amd.com,
	Florent DELAHAYE <kernelorg@undead.fr>,
	Michel-Ekimia <contact@ekimia.fr>,
	Konrad J Hambrick <kjhambrick@gmail.com>,
	Werner Sembach <wse@tuxedocomputers.com>,
	=?utf-8?q?Benoit_Gr=C3=A9goire?= <benoitg@coeus.ca>,
	mumblingdrunkard <mumblingdrunkard@protonmail.com>,
	Matt Hansen <2lprbe78@duck.com>,
	Tilman Vaeth <tilman-vaeth@web.de>,
	Christian Homberg <Christianhomberg@gmail.com>,
	mccricardo <mcc.ricardo@gmail.com>,
	bnewell <bnewell@fullaware.com>,
	=?utf-8?q?Bernhard_=C3=9Cbelacker?= <bernhardu@mailbox.org>,
	Ton Gur <kvantorrr@mail.ru>,
	Alessandro <sandro.it@gmail.com>,
	Pedro Rodrigues <pedro.pfxr@gmail.com>,
	Amaury TC <amaurytc@gmail.com>,
	crysman <crysman@seznam.cz>,
	Moataz <Moataz.zakaria@gmail.com>,
	wilk <j.cubizolles@free.fr>,
	=?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Bradley Morgan <brads@mainlining.org>,
	Doug Calobrisi <doug@calobrisi.com>,
	Helge Deller <deller@gmx.de>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Alexey Fomenko <alexey.fomenko@intel.com>,
	Eric Auger <eric.auger@redhat.com>,
	Maciej Grochowski <Maciej.Grochowski@sony.com>,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-efi@vger.kernel.org
Subject: Re: [RFT] Change E820 memory map handling
Date: Tue, 17 Nov 2026 14:12:29 +0000
Message-ID: <20261117141229.11971-1-nbritton@exabit.io>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110-superm1-genoa-mess-v1-0-bdcb3a6f2463@kernel.org>
References: <20261110-superm1-genoa-mess-v1-0-bdcb3a6f2463@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 10 Nov 2026, Mario Limonciello (AMD) wrote:
> Here is the flow I would like to see:
>  1. Test 7.4-rc2 (vanilla - no changes please)
>  2. Test this branch (superm1/genoa-mess)
>  3. If this branch fails, please revert this commit from the branch and test again.
>     commit 35c9c60ea8c1c ("Revert "x86/PCI: Add E820 quirks for Clevo NL4XLU and Lenovo Yoga C940"")
>
> In all cases please check whether your original issue exists and comment if it does.

I tested on the Mac Pro 7,1 from my bridge window report [1]: two Radeon
Pro Vega II Duo cards, four Vega 20 dies behind two root ports, BAR0
resized to 32G on every die. Both kernels were built from the same
.config.

1. v7.4-rc2: the original issue exists. Both root port windows stay at
   32770M, the second die's branch (08:10.0 and 16:10.0) gets no
   prefetchable window, and 0e:00.0 and 1c:00.0 are left without BARs:

  pci 0000:0e:00.0: BAR 0 [mem size 0x800000000 64bit pref]: can't assign; no space
  pci 0000:0e:00.0: BAR 2 [mem size 0x00200000 64bit pref]: can't assign; no space

2. superm1/genoa-mess (35c9c60ea8c1): the original issue is gone. Every
   BAR is assigned, both root port windows are 96G, and all four dies
   get their 32G BAR0. The layout is identical to the one I reported
   for v5 on v7.2.15 [2]. The first root port:

  pci 0000:06:00.0: bridge window [mem 0x9e800000000-0x9ffffffffff 64bit pref]: assigned
  pci 0000:07:00.0: bridge window [mem 0x9e800000000-0x9ffffffffff 64bit pref]: assigned
  pci 0000:08:08.0: bridge window [mem 0x9f7ffe00000-0x9ffffffffff 64bit pref]: assigned
  pci 0000:08:10.0: bridge window [mem 0x9e800000000-0x9f0001fffff 64bit pref]: assigned
  pci 0000:0b:00.0: BAR 0 [mem 0x9f800000000-0x9ffffffffff 64bit pref]: assigned
  pci 0000:0b:00.0: BAR 2 [mem 0x9f7ffe00000-0x9f7ffffffff 64bit pref]: assigned
  pci 0000:0e:00.0: BAR 0 [mem 0x9e800000000-0x9efffffffff 64bit pref]: assigned
  pci 0000:0e:00.0: BAR 2 [mem 0x9f000000000-0x9f0001fffff 64bit pref]: assigned

   amdgpu binds all four dies, and compute and peer-to-peer transfers
   across them work.

3. Not needed, since the branch works.

As for E820 itself, 07eab0901ede removes a single descriptor on this
machine:

  efi: Remove mem126: MMIO range=[0x60000000-0x600fffff] (1MB) from e820 map

That is the first 1MB of ECAM (0x60000000-0x6fffffff), below all host
bridge windows. On the branch the line is gone and /proc/iomem keeps
5e000000-600fffff as Reserved. The firmware is dated 2026, so both
kernels print "PCI: Ignoring E820 reservations for host bridge windows"
and the restored entry could not clip a window here anyway. Apart from
the efi/e820 lines and what follows from the BAR assignment (amdgpu
binding two more dies), the kernel logs of the two boots do not differ.

Also, the boot failure on v7.3 and later that I mentioned in the v5
thread does not reproduce with v7.4-rc2, so both kernels here are
plain upstream. It does not reproduce with Ubuntu 26.10's 7.3.0-10
kernel either, and I have since tested v5 on that kernel as well.
Unpatched, it shows the original issue (two of the four dies without
BARs). With the 14 patches applied (they apply without fuzz and need no
prerequisites on 7.3), all four dies get their BARs with the same
layout as above, and a multi-hour inference benchmark across the four
dies showed no regression against our reference runs.

Tested-by: Nikolas Joshua Britton <nbritton@exabit.io>

[1] https://lore.kernel.org/linux-pci/20260903063124.9316-1-nbritton@exabit.io/
[2] https://lore.kernel.org/linux-pci/20261106152642.23118-1-nbritton@exabit.io/
