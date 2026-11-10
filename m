Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794315322;
	b=ltqvJ/0OcOL9PMFgV4keUMgX50l4QyBd3X3U7Z101jkXJPtwttMSBU+nT6knKVjLnftt
	 qW5WC/WqVJB/0mUbj8vIyp8vUg0cAaSGPjTabZ+UG2PZngd2PCSn1vWsw/s2z7s+Zx5X1
	 yNQC8G63hdPKa3nrigVipLhFCwzFoqJd2M/G4b0LSEjfHJWH1Kr158IBGF8z6bSWLweM2
	 w4G8WooBUm6BP9l9uX/S9KoAA4bNNWu766adFk22K1MAM0RJyswDGNqYi7JVlA0w9BdPn
	 mCoQIYsBIhT+TOQqH44tXJ4nHLfWsBNp1Cy9/BiNg60Cq37r8uAsuKusbPVNvIQMSvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794315322;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GBrzT4BqsmPvzbPz0b5YaJ5HxxBsGVIewvq58skV4VY=;
	b=SH/MrDPgGbNlySXlhRCq5nEmGeWmIvozg1eYspAoYvN6Mg5ZS4OnJb04A3x+LzCeYyn3
	 qrKBE2su5e7rHweJdIp3n6rntoHxOADcILg26n+058RVHQSSQYOLpkvWtrLsu1Gw8ylwC
	 C6yE4G1BRmAuQoAFlJDDa/yquOYQHh2v+c6zfVi8mzXyA04Y1kJZuNIAHGhIP1Ulz57Bu
	 bgsacG9gd2lHujQBYoeXquuRwKDXMON1bB/vE5YiKAOx91/baE3TrEglNtBnwAcRsYS3n
	 EWUlKQ7vtHTLJ+eEjt9WDTUbv1l7JTB/HDyJTFTg/jK1GXdPGtJqownoE2a1o0lMwyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dankook.ac.kr;
	spf=pass smtp.mailfrom=dankook.ac.kr;
	dkim=pass header.d=dankook-ac-kr.20260707.gappssmtp.com header.i=@dankook-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=hsbPcbgi;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D7A606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 12:55:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49D7A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dankook.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dankook.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dankook-ac-kr.20260707.gappssmtp.com header.i=@dankook-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=hsbPcbgi
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3720addb068so3507362eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:55:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dankook-ac-kr.20260707.gappssmtp.com; s=20260707; t=1794315315; x=1794920115; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GBrzT4BqsmPvzbPz0b5YaJ5HxxBsGVIewvq58skV4VY=;
        b=hsbPcbgik1+lQ/N1fUjhJC+B0lCWSn4kN3UnDHqik4dH2zsQLbrd6FtCykc7CWTLuc
         RrAb29RMdS1C4FkxL9oKZvcp3RoX9TXuWt3i+oIVkWHHb3AxQ3PDie+/3605N3+mNPoK
         CtP/kIPr+acdNZZ5yQGkljis56Q1X0Iw7sbMG5JV35G+WALbtmCHC1fJDiTLlKd0G7u/
         wGwQk87vNejLXeZG3ZLezDbV1yWHiSMoQTpOMEGZY2GAcXU0a6EVAdpByslFG2lcqC4W
         eaNHeTT9HVNYpnkUbk8XHIL5yoakJJTraL8/qQIOTVxuG648pAwr3TeeNo26ayKpI692
         2SDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794315315; x=1794920115;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GBrzT4BqsmPvzbPz0b5YaJ5HxxBsGVIewvq58skV4VY=;
        b=BB2f9lu1fuORTfklt8M29zjLBYgiIFRzj60HqPHwUcPAL/gGGfp+uwbT1CvVmAW9Wi
         Ei6dM8kpzACaTYiuOBG1DWTCM0SUC3DkEDlba7KI+4HiYNfA98oqoI7QhF5aarVEJ8Ez
         jCK9ap2t1gd1DSByS5CwkXe9V1J2IctaRjzZv1d6fN5EFDjq2/dpCw0O6Nk2WVZvFiHX
         etIM9ztGm372BIlVulZ7xsCGKOdv26GE1mCoQuJrKh2UXajx+acKxHomuKqw+tEZixcK
         /Eelf8sv+jsXUNKvyB0uKAlI5UHHg7MagL3j8MHTmTDwm5gqB8S5TIExloTxnpHxdrhR
         r2zA==
X-Forwarded-Encrypted: i=1; AL+hErHStn6OEzv8ttKzExEslvpcRjZ393yC1ol2f+eehOlBbKcdNGT8KqFjZYwjbJVydnLvMlHd4ZYPa2xJUVA=@vger.kernel.org
X-Gm-Message-State: APuU4Z89v3hnbKHzQMRoP/P1QFfnNelmOe/EEXC2ZvDFhIrD7uwRWkIz
	dvK4KnJxXh3Y2YOSvAHx37H8vnG+n5Znycmtx+dKjR9qC4ZNVbVieP2QwseFH260BkA=
X-Gm-Gg: AYBFou1zdrIwqovmUjPhoAO45XGCq309oWicmbWpPO5YcvV31TQGmOQaHqUaFezO1am
	w7lUbNaNbzHfv51UZhv9t9kdSjfkNPeQMuWdz5SC2Hxe0W80y1uKUvklSvaWYmhfG0EfaAweGXa
	nv4RY+m4JZkCeFOFjNo9h4qbB42aflHBxbQGO13hjpRCwJzwMyYwCEzZszivA0Fzh3CrI0yW2lv
	11R20aMaJ5iFEuziIjzbiQ3A3kEVml7iOR0ZCAYG0ci9RNqRt6ju+y0+sISDVjj86hTXmIFseGa
	GoBrabpftlW/ug4zFmK2fGFgoagSVH7uZRPGV63WrBeAN9A4BiTQiu2+ZAsF4PsshRv7wL83FwH
	hD5w57zONAJZxVrw0S93mK9f2sujuNJxb3FinFKdSzEgij6i5rlUGKMnFat6G9qP4ZbS5I8Pvzp
	Gt6JbUdB/Kp1X/uGtYOu/PbTxPQJ+HMYDJBn7dC2uVBlIVQBkAHJfjoREQH893h8PuHFG+nOTA2
	SsiwrUfwRIC5re+d88MV+9nptCNbsqA4X19fnANlOxtSnKP5IFKihfkuN2Q0n1UI3oXl3eaWXW7
	AwkkVXOOJ5B+QTCIdInqPs+g
X-Received: by 2002:a05:693c:87d6:10b0:360:e2e6:f849 with SMTP id 5a478bee46e88-37520d0038fmr3367933eec.28.1794315315029;
        Tue, 10 Nov 2026 04:55:15 -0800 (PST)
Received: from myarch ([121.165.40.114])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751dae63a6sm6855380eec.1.2026.11.10.04.55.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 04:55:14 -0800 (PST)
From: fixca <jaehoon1744@dankook.ac.kr>
X-Google-Original-From: fixca <jaehoon1744@gmail.com>
To: broonie@kernel.org,
	Vijendar.Mukunda@amd.com,
	shumingf@realtek.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RFC 0/2] ASoC: amd: SoundWire audio for LG gram 16Z95U (rt713 + rt1320), speaker still silent
Date: Tue, 10 Nov 2026 21:54:27 +0900
Message-ID: <20261110125459.3924-1-jaehoon1744@gmail.com>
X-Mailer: git-send-email 2.56.0
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

Hi,

The 2026 LG gram 16 with AMD Ryzen AI 400 (16Z95U, ACP rev 0x72,
PCI SSID 1854:056c) has no internal audio on mainline: no sound card is
created. The same generation 15Z95U has been reported with identical
symptoms (https://github.com/CachyOS/distribution/issues/516).

These two patches create the card. With them, headphone playback and
internal microphone capture work. Speaker playback through the
RT1320 is still silent, and I would appreciate advice on that part
(details below). I am sending the series as RFC for that reason.

Hardware, from the ACPI tables (ACP node \_SB.PCI0.GPPA.ACP):

  acp-audio-config-flag = 0x10 (FLAG_AMD_LEGACY_ONLY_DMIC)
  PDMC (_ADR 2): no acp-audio-device-type property
  SDWC (_ADR 5): mipi-sdw-manager-list = 0x3
    link 0: SW36 _ADR 0x000030025D071301  RT713
            SDCA functions: UAJ (type 6) at 0x1, SmartMic (type 3) at 0x2
    link 1: SW23 _ADR 0x000131025D132001  RT1320
            SDCA function: SmartAmp (type 1) at 0x4

Patch 1 adds the machine to acp70_acpi_flag_override_table. Without it
snd_pci_ps returns -ENODEV because of the BIOS flag, snd_acp_pci binds
and reports "No matching ASoC machine driver found".

Patch 2 adds rt713 (link 0) + rt1320 (link 1) entries to
snd_soc_acpi_amd_acp70_sdw_machines[].

Result with both patches on 7.2.14 (Arch Linux, alsa-ucm-conf 1.2.16.1):

  card: amd-soundwire, components " cfg-amp:1 hs:rt713-sdca mic:rt713 spk:rt1320"
  SDW0-PIN0-PLAYBACK-SimpleJack  rt712-sdca-aif1   works
  SDW0-PIN3-CAPTURE-SimpleJack   rt712-sdca-aif1   not tested
  SDW0-PIN5-CAPTURE-SmartMic     rt712-sdca-aif3   captures audio
  SDW1-PIN1-PLAYBACK-SmartAmp    rt1320-aif1       silent

Open problem: RT1320 speaker output is silent

The playback stream starts and runs without any error:

  rt1320-sdca sdw:0:1:025d:1320:01: rt1320_io_init amp func_status=0x41
  rt1320-sdca sdw:0:1:025d:1320:01: rt1320_vc_preset, RT1320_KR0_INT_READY=0x1f
  rt1320-sdca sdw:0:1:025d:1320:01: rt1320_io_init version_id=2, dev_id=0x6981
  rt1320-sdca sdw:0:1:025d:1320:01: rt1320_io_init hw_init complete
  ...
  amd_sdw_manager amd_sdw_manager.1: p_params->num:0x1
  soundwire sdw-master-0-1: Port=1 hstart=1 hstop=9 port_bo=65 slots=32 max_ports=6
  rt1320-sdca sdw:0:1:025d:1320:01: rt1320_sdw_hw_params rt1320-aif1
  amd_sdw_manager amd_sdw_manager.1: dir:1 dai->id:0x1

What I checked:

 - Mixer state: "Speaker Switch" on, "rt1320-1 OT23 L/R Switch" on,
   "rt1320-1 FU21 Playback Volume" 87 (0 dB), "RX Channel Select" L,R.
 - Direct ALSA playback (speaker-test -D plughw:amdsoundwire,2) and
   playback through PipeWire both run to completion with no sound.
 - Firmware: realtek/rt1320/rt1320-patch-code-vc.bin is installed and no
   load error is logged. No RAE file and no "realtek,dspfw-name" property
   exist for this machine, so the DSP firmware is not loaded.
 - Runtime PM: after a runtime suspend/resume the peripheral re-attaches
   with func_status=0x41 and the preset is not re-applied. Forcing
   power/control=on for the RT1320 (so io_init runs only once, at boot)
   does not change the result, still silent.

The ACPI SmartAmp function carries a 5627-entry
"mipi-sdca-function-initialization-table". It follows the same sequence
as rt1320_vc_blind_write[] but differs in a number of registers, and it
embeds its own MCU patch code (0x10007000-0x10007da7) and tables. The
attached rt1320-acpi-init-vs-driver.txt lists every difference. Some of
them:

  register   ACPI   driver
  0xc900     0xd0   0x73
  0xc901     0x09   0x04
  0xd471     0xba   0x3a
  0xd479     0x40   0x20
  0xdb08     0xe7   0x7a
  0xc050-0xc053, 0xc060-0xc063, 0xce30-0xce44, 0xcd00, 0xcf02, 0xdc20:
             written by ACPI, not written by the driver

Questions:

 1. Shuming: is one of these board-specific values required for the
    amplifier to produce output on this design, or does this machine
    need its RAE/DSP firmware? I did not want to write the vendor table
    to the amplifier blindly.
 2. Vijendar: is SDW1 / ACP70_SW_AUDIO1_TX the right pin for an
    amplifier on link 1 with ACP rev 0x72, as used by the existing
    rt722 (link 0) + rt1320 (link 1) entry?

I can test patches and provide the full acpidump, dmesg and alsa-info
output.

Disclosure: the analysis and both patches were prepared with the help of
an AI assistant (Claude); I built and tested them on the hardware.

Thanks,
Jaehoon Kim (jaehoon1744@dankook.ac.kr)

RT1320 (version_id=2, dev_id=0x6981) on LG gram 16Z95U-GS59K
Comparison of the ACPI SDCA function initialization table
(SW23 / AF04 'mipi-sdca-function-initialization-table', 5627 writes)
with rt1320_vc_blind_write[] in sound/soc/codecs/rt1320-sdw.c (v7.2.14).
Final value per register is compared. Addresses and values are hex.

Layout of the ACPI table, in write order:
  idx    0-66    config writes 0xc003 ... 0xf080
  idx   67-78    0xe7f4-0xe7fb, 0xe860-0xe863
  idx   79-118   0x20000708 ... 0x200007bf (10 x 4 bytes, value 0xa9858040)
  idx  119-2169  0xe000-0xe7ff, then 0xe801-0xe803
  idx 2170-2181  0xc003=c0, 0xd470-0xd47a, 0xc019, 0xd487, 0xd486=c3
  idx 2182-4905  0x10007000-0x10007da7 (MCU patch code, 2724 bytes)
  idx 4906-4955  0x1000cc46, 0xd486=43, 0x3fc2bf80-0x3fc2bfc7, 0x1000db00-0x1000db23
  idx 4956-4976  0xd540, 0xc5c3, 0xc5c8, 0xd471, 0xdd08-0xdd0b, 0xdb00-0xdb1b
  idx 4977-5626  0x1000d600-0x1000d7ff, 0x1000d000-0x1000d089

1) Same register, different value
   register     ACPI   driver
   0x0000c900   0xd0   0x73
   0x0000c901   0x09   0x04
   0x0000d471   0xba   0x3a
   0x0000d479   0x40   0x20
   0x0000db05   0x00   0x45
   0x0000db07   0x00   0x5a
   0x0000db08   0xe7   0x7a
   0x1000db15   0x12   0x0d
   0x1000db16   0x09   0x01
   0x1000db19   0x00   0xbf
   0x1000db1f   0x0d   0x12
   0x1000db20   0x01   0x09
   0x1000db23   0xbf   0x00

2) Written by the ACPI table only (0xe000-0xe7ff, 0x10007000-0x10007da7,
   0x1000d000-0x1000d7ff bulk areas not listed)
   register     ACPI
   0x0000c050   0x15
   0x0000c051   0x13
   0x0000c052   0x55
   0x0000c053   0x55
   0x0000c060   0x99
   0x0000c061   0x55
   0x0000c063   0x55
   0x0000c582   0x01
   0x0000c5c2   0x00
   0x0000c5c4   0x12
   0x0000c5c6   0x10
   0x0000c5d0   0x09
   0x0000c60b   0xb1
   0x0000c682   0x60
   0x0000cd00   0x05
   0x0000ce1b   0x88
   0x0000ce30   0xae
   0x0000ce31   0x0d
   0x0000ce36   0xd2
   0x0000ce37   0x0b
   0x0000ce38   0x80
   0x0000ce39   0x04
   0x0000ce3e   0x00
   0x0000ce3f   0x00
   0x0000ce44   0x1c
   0x0000cf02   0x0f
   0x0000db00   0x00
   0x0000db01   0x00
   0x0000db02   0x73
   0x0000db04   0x00
   0x0000db06   0x00
   0x0000db1a   0x00
   0x0000db1b   0x00
   0x0000dc20   0x30
   0x0000e860   0x39
   0x0000e861   0x73
   0x0000e862   0xb4
   0x0000e863   0x6c
   0x20000708   0x40
   0x20000709   0x80
   0x2000070a   0x85
   0x2000070b   0xa9
   0x2000071c   0x40
   0x2000071d   0x80
   0x2000071e   0x85
   0x2000071f   0xa9
   0x20000730   0x40
   0x20000731   0x80
   0x20000732   0x85
   0x20000733   0xa9
   0x20000744   0x40
   0x20000745   0x80
   0x20000746   0x85
   0x20000747   0xa9
   0x20000758   0x40
   0x20000759   0x80
   0x2000075a   0x85
   0x2000075b   0xa9
   0x2000076c   0x40
   0x2000076d   0x80
   0x2000076e   0x85
   0x2000076f   0xa9
   0x20000780   0x40
   0x20000781   0x80
   0x20000782   0x85
   0x20000783   0xa9
   0x20000794   0x40
   0x20000795   0x80
   0x20000796   0x85
   0x20000797   0xa9
   0x200007a8   0x40
   0x200007a9   0x80
   0x200007aa   0x85
   0x200007ab   0xa9
   0x200007bc   0x40
   0x200007bd   0x80
   0x200007be   0x85
   0x200007bf   0xa9

3) Written by the driver only
   register     driver
   0x0000c598   0x04
   0x0000c5d6   0x01
   0x0000c5f6   0x22
   0x0000c5f7   0x22
   0x0000d172   0x2a
   0x0000d47c   0xff
   0x0000d500   0x17
   0x0000d600   0x01
   0x0000d601   0x02
   0x0000d602   0x03
   0x0000d603   0x04
   0x0000d608   0x03
   0x0000d609   0x00
   0x0000d610   0x01
   0x0000d64c   0x03
   0x0000d64d   0x03
   0x0000d64e   0x03
   0x0000d64f   0x03
   0x0000d650   0x03
   0x0000d651   0x03
   0x0000d652   0x03
