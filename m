Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794052206;
	b=NPGZBsHe2h47io/FAXDbinoOXu3UjVH1YwHHS2j59EwK+tLwbqBe5/1WA/r8nRBKPzud
	 IIX1O7RLb38TL2qXJ0R39ruJ6evaroL3MRXqSKKx2BZyQjGFwFiUcEqSaUgA9TKCUDROI
	 dKSOktY2acL4axCTz1Kfx7SL2ClcbZdNwtxm8sza0rLQhsaSx40ySdDf1HIfnluYIy4qI
	 3CUYYaNSi5CDGnn48pSNz3jtSj//YxDYditDwUwwBzFqE0TrNs/GZPbMM+N+1swS02/O4
	 prlcO1w2aax7fQrVzwLPnOboAQk7hlzJ3VQHUEUmLsVeW1QlM845vQY8NL4KWCn4kQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794052206;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=r+uxcIgFL9/D/VViRhZ0+VIGzs8vtNNeMXk697RQJm8=;
	b=3rU6AdgTrOXksW7xQTElBvJ4eSVf6LgZnH06bznvqNJ0dO0Dd06CeAESVTJrMizCkqp8
	 hEPim9F2TDe/Pa+2DYq2Tf0zSABsW5qK6whJ0uGD2JjmuGWervIQGBLbTFpcnHtpEPKjB
	 pdmxta8K49rWCEcVVdtBwyHpkxvwmKHeDLvw0bMzXnrACkBg6LEkAXcTv3LoBWPSc0QRS
	 MgI8MQ2wZnvB1VmvEoV6eZ/gviyYi5xTJr6P/lfGQEHIeF0rFtAyasgxX62O6o7nPjNPa
	 C8UaM3HYV7/FFQe7aVYK+N5+1pL9cXtCfpKmE9ge/CYFJTvjD/mzEXv8hI/eTtzn8IA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a4AcB77f;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CD85606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 11:50:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CD85606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a4AcB77f
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-49318428d98so671659f8f.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 03:50:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794052204; x=1794657004; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=r+uxcIgFL9/D/VViRhZ0+VIGzs8vtNNeMXk697RQJm8=;
        b=a4AcB77fpaD8qLovRBx5p8vg4Z+2vacfqjKtPj3S/46vC0aGLM04yTBK2zR4DbZxr1
         XoZCDNij8TFgATut412g09ZFB4LwqmOK5U4/ssLZvnvZmyW7bZhXMuajGtt9tQ+iu//5
         y3pnU8+NQ7CHhRvPBfWgOmtGY3lD9ZLn3qVUe8dIGfMkGblwrAR9NzDbIG0YYmfEUK2a
         APqYOAT1TqMZJ/hhS9QQ2EUYVyg1uISgOFN/P532rw3Q0EH77DV3GGA8J+fEPhZb5/hN
         gEu1iPAG2pTxPKrVf48fUE+Yc4VM4N7XhYtAvU3vX/AD49qcolvwYrV8k+dKQS6t77fH
         tdHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794052204; x=1794657004;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r+uxcIgFL9/D/VViRhZ0+VIGzs8vtNNeMXk697RQJm8=;
        b=epnXGumPJFG5KxCtWLkP0UHH3toYh+oUTt4QOk2y3fLMARNwc1HdbSA45/iUDAIeFQ
         PqeWx28btZs7yMhEWPqg4CTHGVfzOdfEIF4m375du2w1gDvzwofiqhaGyzPypAFjz7SK
         zkEi2dDc5uaKOHUJcTLVTGxhRyySHZ58JVR1YItnMBIji/7HgLvKnNOT+24MtCovFCAB
         D9uaUZwQRmrkrEEKwTDoAJYomB38DrxsNrC/TRGoiabulmAxw7akbtD5oi9pnW3b0Ql6
         OfnmVcUezbx2NgpA2E30K8RNZe49O37MEbYq/llNK0gbI3Ki5p14hx0IxVAVs8WaKPcn
         ABLQ==
X-Forwarded-Encrypted: i=1; AL+hErGFVur5UiaX9R6xASZBrQIqCNdZVFz4iZY1ZKxeojzGsF75oMQH3nFAP6pzj+edMt1d9akt81glPy0w3qA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8A7pE92GYwoFEcafxOl2x109MK8MTpl/RP/veOoeNmUTSzzu8b
	QKQemuIMB5QV4ct7v0pyHetbsUN/ofD5eJepRktbjacZZSAsc2QFtL2B
X-Gm-Gg: AYBFou2L+RivRRZEwThtUX3ROseryCwB/++6Ot6dLQZoutkhJFDvtA6YiRGmjpvgrpm
	Y0Li5Ufxumm9RHuOplh33tPjK3NaO+F/H8ifl6931SQZx8wjkZIRM1a9mGW+liQ12EulAsptQte
	B5JQq7TM9kJSGM6EjDMIwzlLsQn6Nvay0lClOtdnpzvtdW267ngxzNXA74XekItEezklAhjYiTd
	krpUy6USn61Ib3VTGswtVGd7AjJr6Zos3eTeXhfjnVYl70NPQhDf/+Ebf73dbiSQ40LM0KIzDa6
	hkvHtAXbphq7YGFMHiYK8cDbYBKHu7Jzj2ZjwDBY6pqeSiRDLcv4H3mujYUtqsK5ESPo2O7ryt7
	xmukGMrdLY0dMIFgQR+/kgLBeJy3x5yEu1oDGDoSs6XfUPeH+sOTUytMDRH779hQxu2fhWtS4Qc
	7b689r+LtjdR/+WvOmFOnJPOuKuU69kJ2KWYiC1vpvRsXmoe758aWFXWToIc+AAifb8Ken9GEfE
	au5scDi3HUNRu68XixBZVOK+9gzF2z9Ey1fn9fY6TSqhkaMZ6dWffREHWPmC4GiYx4wb1kU5OPm
	qR3frlSTTGwUFDwWR+yV/YPcEEKzoVSmc6GxmAYpPiprgIFqPO361KY=
X-Received: by 2002:a05:6000:4302:b0:48e:5d8a:d1fc with SMTP id ffacd0b85a97d-49275a26704mr8848073f8f.31.1794052204280;
        Sat, 07 Nov 2026 03:50:04 -0800 (PST)
Received: from kreach.multipass ([77.37.5.67])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d6d6382dsm8318347f8f.19.2026.11.07.03.50.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 03:50:03 -0800 (PST)
From: Jude Gyimah <jude.gyimah87@gmail.com>
To: lgirdwood@gmail.com,
	peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	daniel.baluta@nxp.com,
	kai.vehmanen@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	Vijendar.Mukunda@amd.com
Cc: broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	arnd@arndb.de,
	sound-open-firmware@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [BUG] ASoC: SOF: ipc4-topology: vmlinux link failure when SND_INTEL_DSP_CONFIG=m
Date: Sat,  7 Nov 2026 12:49:44 +0100
Message-ID: <20261107114944.561731-1-jude.gyimah87@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Greetings,

sound/soc/sof/ipc4-topology.c can be built into vmlinux while the Intel NHLT
code it calls is in a module, which breaks the link:

  ipc4-topology.c:(.text+0x22bc): undefined reference to `intel_nhlt_get_endpoint_blob'
  aarch64-linux-gnu-ld: ipc4-topology.c:(.text+0x2424): undefined reference to `intel_nhlt_ssp_device_type'
  aarch64-linux-gnu-ld: ipc4-topology.c:(.text+0x2458): undefined reference to `intel_nhlt_get_endpoint_blob'

arm64, v7.3, full .config attached.  The relevant settings are:

  CONFIG_ACPI=y
  CONFIG_SND_SOC_SOF_IMX_COMMON=y
  CONFIG_SND_SOC_SOF=y
  CONFIG_SND_SOC_SOF_INTEL_COMMON=m
  CONFIG_SND_INTEL_DSP_CONFIG=m
  CONFIG_SND_INTEL_NHLT=y

This is the same shape as the sof-pci-dev failure Arnd reported in 2021,
fixed in 8a3fea95fab1 ("ASoC: SOF: SND_INTEL_DSP_CONFIG dependency") and then
properly in 194fe0fc3422 ("ASoC: SOF: pci: move DSP_CONFIG use to
platform-specific drivers").  The NHLT calls in ipc4-topology.c look like the
part that move left behind.

The route in

  SND_SOC_SOF_IMX_COMMON=y selects SND_SOC_SOF, so snd-sof including
  ipc4-topology.o is built into vmlinux.

  SND_SOC_SOF_INTEL_COMMON=m selects SND_INTEL_DSP_CONFIG, so it is m, and
  intel-nhlt.o goes into snd-intel-dspcfg.ko:

    sound/hda/core/Makefile:18: snd-intel-dspcfg-$(CONFIG_SND_INTEL_NHLT) += intel-nhlt.o

  SND_INTEL_DSP_CONFIG then does "select SND_INTEL_NHLT if ACPI".
  SND_INTEL_NHLT is a bool, so a select from an m-valued symbol sets it to y.

  ipc4-topology.c:1793 guards the calls with

    #if IS_ENABLED(CONFIG_ACPI) && IS_ENABLED(CONFIG_SND_INTEL_NHLT)

  which is now true, so the calls are compiled into vmlinux while their
  definitions are in a module.

Why the guard cannot help:

Simply because the guard tests SND_INTEL_NHLT, but the code is shipped by
SND_INTEL_DSP_CONFIG, and SND_INTEL_NHLT is y whenever SND_INTEL_DSP_CONFIG
is y *or* m.  So the condition distinguishes only "NHLT support is present
somewhere" from "absent" i.e., it cannot distinguish built-in from modular, for
any value of SND_INTEL_DSP_CONFIG.  The static inline fallbacks in
include/sound/intel-nhlt.h are keyed on the same condition, so they are
unreachable here too.

The smallest fix imo

Change the condition at ipc4-topology.c:1793 to test reachability of the
option that actually ships the code:

  -#if IS_ENABLED(CONFIG_ACPI) && IS_ENABLED(CONFIG_SND_INTEL_NHLT)
  +#if IS_ENABLED(CONFIG_ACPI) && IS_REACHABLE(CONFIG_SND_INTEL_DSP_CONFIG)

IS_REACHABLE is true when the provider is built in, and when the provider is
a module and the caller is also a module too, this seems to be exactly the condition under
which these calls can link.  However, no header change is needed. The file's own #else
branch at line 1972 already stubs snd_sof_get_nhlt_endpoint_data() to return
0, and where IS_REACHABLE is true with ACPI=y, SND_INTEL_NHLT is y as well,
so the real declarations are in scope.  This is the same one-line remedy
8a3fea95fab1 applied for snd_intel_dsp_driver_probe, named as a temporary fix
pending the restructuring.

The complete fix, if you would rather do it once

Move the NHLT calls to the Intel side, as 194fe0fc3422 did for the PCI probe.
Two things suggest that is where they belong: (i) ipc4_data->nhlt is declared
void * in sound/soc/sof/ipc4-priv.h, and (ii) the only code that ever sets it is
sound/soc/sof/intel/hda-dai.c:764 via intel_nhlt_init().  So, the generic core
holds an opaque pointer that only Intel fills, and then calls Intel accessors
on it.  Outside the header and sound/hda/core/intel-nhlt.c itself,
ipc4-topology.c is the only caller of either function.

A third option would be "depends on SND_INTEL_DSP_CONFIG || !SND_INTEL_DSP_CONFIG"
on config SND_SOC_SOF, but that puts an Intel constraint on the generic core.
An i.MX, MediaTek or AMD user with SND_INTEL_DSP_CONFIG=m for unrelated
reasons could no longer build SOF in.  I have mentioned it only to rule it out.

I am happy to send a patch for whichever of the first two you prefer.

Fixes: aa84ffb72158 ("ASoC: SOF: ipc4-topology: Add support for SSP/DMIC DAI's")

Found this with kreach, a static checker that compares what Kconfig allows against
the symbols the compiled objects actually reference:
https://github.com/JGyimah/kreach

Thanks,
Jude Gyimah
