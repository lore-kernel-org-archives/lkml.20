Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794361214;
	b=3vPRBrr94EdLNzsMTcOv1F1l90A2iAPqKXiEM1T3ukXn8HItaz0WvEAorz3e3asHuv9D
	 amgZe28gtqeHRyEidI7IJ0/dMGcwqyKMGyUOKKfcon/m44sohNWyib5ygJwlAJ6WyMBdL
	 mrmsBpRPAboh0nlcFIo4jiJ+ASCIy4kwnp9zNrdsNhVx7P8CXbestCnqJNEMfNWNYj+DN
	 n5jgVpl9VYWf/F5kWAXTV8VTQuz8HvB8S4bbWBbBsmLRUhpPmRwy5ZkldF4al2lTqqc1W
	 IQ/MrpPHDb03lb2TNCFRHFzjyghYKnqcNevre7ckTj2DvfHaSOWHpByDcRRvutF1I7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794361214;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=SEznzYyvdTSxa+BvfqhFvVyZzygD+3ndNPeZO+sVVv8=;
	b=T/49ELdNEMq3RZgm28dpQXrDHox0i12ZAwA6LQB51R1FUKwUeEkePOzjJjIC4eoHj8D6
	 83R3b+eL6jHk+bp48WwtgYJ22cMxxk069KdXiNGAz31wk9qRNmFDOMNWxc0HTf5sGyBjI
	 IjFXGtEvCgDkdUsTZQdnmrdcWAV8KHmQM4Rt1wjCxAfotL/kEMaFjiAHrku4FYKFLCNLu
	 kTOPSzJhnFiY1PDLOMW+c2mDgnXkvlk9mBbjj5Dyzv4PkqEtrSnKKQh+mcIePYmTy1p1h
	 0tJR+G1eDkSlR/+UC79KQjaTespMv1Jmg6bwI+dt8NQSbAgG9aiJvcUKdRkURcHVs2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dankook.ac.kr;
	spf=pass smtp.mailfrom=dankook.ac.kr;
	dkim=pass header.d=dankook-ac-kr.20260707.gappssmtp.com header.i=@dankook-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=JZHn5elB;
	arc=none smtp.remote-ip=209.85.210.173
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19077606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 01:40:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19077606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dankook.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dankook.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dankook-ac-kr.20260707.gappssmtp.com header.i=@dankook-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=JZHn5elB
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8b32bc605d9so1161235b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:40:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dankook-ac-kr.20260707.gappssmtp.com; s=20260707; t=1794361212; x=1794966012; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SEznzYyvdTSxa+BvfqhFvVyZzygD+3ndNPeZO+sVVv8=;
        b=JZHn5elB1QDZDqoEdvVi2fRCsEaH6qhO94mesK+Ct7n+eFyliCWuzvghPInb23N3mr
         pHynupKvYSsSuuN2/9SUqIOijrZXb1e9/JvGzDYoOe9HeHcVZaTFtW57vj9aiz3VdeO4
         2rmrto9IYWuP0hndg1XoQTiQdG+PstmcyAldsnuOBMs6kaQucRm0FZq7RS+RPvfP55Hh
         +/8lCqGiqC5G/Ehr2tc82X6Gz47P50rS5i6hH5MBIwLanw/jbHyk992Tbav6Fsho1qnV
         qfo5Lb46vbY/kSnEFOdaB9IXHhbqc3T90VLzjGklW8cfb9tyrjtsnsyShKmiS0EW+tNb
         teIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794361212; x=1794966012;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SEznzYyvdTSxa+BvfqhFvVyZzygD+3ndNPeZO+sVVv8=;
        b=g+CBT3ZYy2PE/qdU1QckEZn3QzYr+PatBl7w0mGOnBI++eyx1JXR+a/QelVAXFSy66
         K4Pni/bsifHHHPgneq7g+NihJsi9IchNquvDmSgZEazAF7zfDjLKq4eRQGKE/+LTyJeI
         PynA9HIgc04m6GqOViNZCmoByDCqMZ/DuPqgMctxMfCU2ofZrRsvkxxaa+qBjRQiK7Xc
         1lpGd9WAoXYjDz2S0Uycn+cWOXnBvUMqniBn5hv5Uw5m030nBkqUwSK80USYrreSSFj6
         /cWX2VZMVkkkul0XFwc3JQARMa5z4jyn9Pbx1DVCgn4kHc0KwrqPe+8zUUaI+4NxgIBj
         /2uw==
X-Forwarded-Encrypted: i=1; AL+hErEMsTpz49v/KzovzegGo9coWMET+qe/VGVN+er9fAF22VwfYLyhkVi+oV8f0uK3zcOf8Mwx8jJnOhfCLpg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9QxzKsKwiu1pMeqoOtcxm1Un6x6eCjdWjgM+//X9LWYDT8+tV5
	5v73bJPtvQFIFWT4WY63zJ6DusjnB1DDx/AvFMfdc6qvQZrxzPspwHAQ0vBw0TJeMB6mYrwsF+L
	0QO7+In4=
X-Gm-Gg: AYBFou0zUjUX6nU9jfYWMctKyuEJK5qQwMthHDrzhp1TS677uejMp+wn/zzm/3blUJ3
	dXV3RAKBCKX1+JLY8+gd3FuUZ7lCwi/wEYs1Ir0XGgd8Eb2Dw0Nq/9rFzuWLvhDwS0aoxY3CpiK
	OBPR2YVp/yFHKHLylEjbNHwFGX1InMQ3bVWkcpQSu/n6gpCYIk9D4P2Jqt6kka8pyRKPsTeSU83
	Pi+Xavc33lJm2Fs/4k3l58D/kkzV9sIvy3MP455fuFO3o4LjoD7Jo0N8jzsGgqvfCHB/JIF+vv2
	8GTBZ2cKFmnF8AUSenoPTP/8rIS07PSrEcVE7cV1DnaRMaKaJ060P84osx7U/mP3vhGBYXCmOBc
	9t5Pzw8lYZ8Y/eIWcgSylQu6cj0/QDWH6dYZpg2dkwOrC/zpaYPYt0Ne/zHLGd9gFz6aZ3c8dOs
	iSoURLit3MtNra2DAcDWsIukX3iAa9Ii6+wgDZpnr5S3SIOEC+KG1hDCUEdosCfWVl0kg0eHRkS
	SsfZ279ERArd7FQp1wseL46Z+e7I9JHokqZzp1OgKymUPmGnXZs8UK/lKO8lLpVauLSqxXh9/53
	vK55IwKTexswl40HgHar9A==
X-Received: by 2002:a17:90b:5483:b0:3ac:8af9:4a77 with SMTP id 98e67ed59e1d1-3b182ec2078mr679895a91.10.1794361212044;
        Tue, 10 Nov 2026 17:40:12 -0800 (PST)
Received: from myarch ([61.254.29.71])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17db9d1fbsm1912111a91.15.2026.11.10.17.40.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 17:40:11 -0800 (PST)
From: fixca <jaehoon1744@dankook.ac.kr>
X-Google-Original-From: fixca <jaehoon1744@gmail.com>
To: broonie@kernel.org,
	Vijendar.Mukunda@amd.com,
	shumingf@realtek.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RFC v2 0/2] ASoC: amd: SoundWire audio for LG gram 16Z95U (rt713 + rt1320), speaker still silent
Date: Wed, 11 Nov 2026 10:39:08 +0900
Message-ID: <20261111013953.4011-1-jaehoon1744@gmail.com>
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

The 2026 LG gram 16 with AMD Ryzen AI 400 (16Z95U, ACP rev 0x72,
PCI SSID 1854:056c) has no internal audio on mainline: no sound card is
created. The same generation 15Z95U has been reported with identical
symptoms (https://github.com/CachyOS/distribution/issues/516).

These two patches create the card. With them, headphone playback and
internal microphone capture work. Speaker playback through the RT1320
is still silent, and I would appreciate advice on that part (details
below). I am sending the series as RFC for that reason.

Changes in v2:
 - Rebased onto broonie/sound for-next; v1 was against v7.2.14 and did
   not apply. No functional change.
 - Patch 2: use a dedicated rt713 jack + DMIC endpoint array; the new
   jack_dmic_endpoints maps the DMIC to endpoint #2 (rt721), whereas
   the rt713 SmartMic DAI is endpoint #1.
 - Cover letter: added what the Windows driver loads for the RT1320.

Hardware, from the ACPI tables (ACP node \_SB.PCI0.GPPA.ACP):

  acp-audio-config-flag = 0x10 (FLAG_AMD_LEGACY_ONLY_DMIC)
  SDWC (_ADR 5): mipi-sdw-manager-list = 0x3
    link 0: SW36 _ADR 0x000030025D071301  RT713
            SDCA functions: UAJ (type 6) at 0x1, SmartMic (type 3) at 0x2
    link 1: SW23 _ADR 0x000131025D132001  RT1320
            SDCA function: SmartAmp (type 1) at 0x4

Patch 1 adds the machine to acp70_acpi_flag_override_table. Without it
snd_pci_ps returns -ENODEV because of the BIOS flag, snd_acp_pci binds
and reports "No matching ASoC machine driver found".

Patch 2 adds rt713 (link 0) + rt1320 (link 1, unique ID 1) entries to
snd_soc_acpi_amd_acp70_sdw_machines[].

Result with both patches (tested on 7.2.14, Arch Linux,
alsa-ucm-conf 1.2.16.1):

  card: amd-soundwire, components " cfg-amp:1 hs:rt713-sdca mic:rt713 spk:rt1320"
  SDW0-PIN0-PLAYBACK-SimpleJack  rt712-sdca-aif1   works
  SDW0-PIN3-CAPTURE-SimpleJack   rt712-sdca-aif1   not tested
  SDW0-PIN5-CAPTURE-SmartMic     rt712-sdca-aif3   works
  SDW1-PIN1-PLAYBACK-SmartAmp    rt1320-aif1       silent

Open problem: RT1320 speaker output is silent

The playback stream starts and runs without any error:

  rt1320-sdca sdw:0:1:025d:1320:01: rt1320_io_init amp func_status=0x41
  rt1320-sdca sdw:0:1:025d:1320:01: rt1320_vc_preset, RT1320_KR0_INT_READY=0x1f
  rt1320-sdca sdw:0:1:025d:1320:01: rt1320_io_init version_id=2, dev_id=0x6981
  rt1320-sdca sdw:0:1:025d:1320:01: rt1320_io_init hw_init complete
  ...
  soundwire sdw-master-0-1: Port=1 hstart=1 hstop=9 port_bo=65 slots=32 max_ports=6
  rt1320-sdca sdw:0:1:025d:1320:01: rt1320_sdw_hw_params rt1320-aif1

What I checked:

 - Mixer: "Speaker Switch" on, "rt1320-1 OT23 L/R Switch" on,
   "rt1320-1 FU21 Playback Volume" 87 (0 dB), "RX Channel Select" L,R.
 - Direct ALSA playback (speaker-test -D plughw:amdsoundwire,2) and
   playback through PipeWire both run to completion with no sound.
 - Runtime PM: forcing power/control=on for the RT1320, so io_init runs
   only once at boot, does not change the result.
 - rt1320-patch-code-vc.bin is installed and loads without error.
 - No DSP firmware is loaded: there is no "realtek,dspfw-name" property,
   and linux-firmware has no realtek/rt1320/rt1320_<vendor>_<product>_<sku>.dat
   or rt1320_RAE_<vendor>_<product>_<sku>.dat for this machine.

On Windows, Realtek's SDCA XU extension driver (RtkSdcaXuLG.inf,
10.0.297.1) binds to this amplifier:

  SOUNDWIRE\SDCA_10&MAN_025D&FUNC_1320&TYPE_01&VER_01&ADR_04&LID_01&UID_01&SUBSYS_056C1854

It ships RTKDAT_1854.dat and RTKDAT_GENERAL.dat and references per-SSID
ALC1320 DSP firmware / preset files (ALC1320\FWFiles.txt,
FWFiles_LG_1854_*.txt, alc1320fw_preset_*\alc1320_afx1_*.dat.bin,
RAE_XU). So on Windows a DSP firmware and RAE preset are loaded for this
amplifier, while on Linux none is.

In addition, the ACPI SmartAmp function carries a 5627-entry
"mipi-sdca-function-initialization-table" that differs from
rt1320_vc_blind_write[] in a number of registers (full list was attached
to v1), for example:

  register   ACPI   driver
  0xc900     0xd0   0x73
  0xc901     0x09   0x04
  0xd471     0xba   0x3a
  0xd479     0x40   0x20
  0xdb08     0xe7   0x7a

Questions:

 1. Shuming: is the missing DSP firmware / RAE preset the reason the
    amplifier stays silent on this design? If so, could Realtek provide
    RT1320 DSP and RAE files for the LG gram 16Z95U (SSID 1854:056c) to
    linux-firmware? I can test them.
 2. Vijendar: is SDW1 / ACP70_SW_AUDIO1_TX the right pin for an
    amplifier on link 1 with ACP rev 0x72, as used by the existing
    rt722 (link 0) + rt1320 (link 1) entry?

I can provide the full acpidump, dmesg and alsa-info output.

Disclosure: the analysis and both patches were prepared with the help of
an AI assistant (Claude); I built and tested them on the hardware.

Thanks,
Jaehoon Kim

body content if you don't wish to send a summary.
From: fixca <jaehoon1744@gmail.com>
To: broonie@kernel.org,Vijendar.Mukunda@amd.com,shumingf@realtek.com
Cc: linux-sound@vger.kernel.org,linux-kernel@vger.kernel.org
Bcc: 
Reply-To: 
Subject: [PATCH RFC v2 0/2] ASoC: amd: SoundWire audio for LG gram 16Z95U (rt713 + rt1320), speaker still silent
In-Reply-To: 

