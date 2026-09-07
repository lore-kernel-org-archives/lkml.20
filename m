Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB6843E4BE
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 08:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788770312; cv=none; b=E7TeDT2JVyIyqNri9igrMOwRZGaq2t9unMB836WTk0cIQ1LBEgmB/gBQcqwls/RsoTUcadtT/AEzjSamywN3blvdzqPibgARFgWeAgZmjCA8yYDNdr8/kBVfagbQ1CWwZVfAFxJ/OGjch0fuEEnUq6+3XChHLO0A+LzHmjCy7Wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788770312; c=relaxed/simple;
	bh=d2waHw5hQQta9KrXqkbQ0UYe80riPkC+jSg91Kafgk0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E/1S5kwAu/pWtREmLku6dt5gYc3nPlypL7JN0V3YRvleIy7wX+R4GfbLyDmj/C1nUMt4QLM9eqdF7pdIVhlZ+PDBkDycIvExZEZeXvX+4D60ZrkJQZeWoZ8kxcTwf3d3IddzfiURLXXPcAofFRg9ReC37B656oWBReSXOexEuME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Omqbr3UD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V+kF6qeX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Omqbr3UD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V+kF6qeX"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68777JTa4161114
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 08:38:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Se+7L1HVUggxXbgDO2sx71Qt+rECVPAGxv+
	lE2vxgMo=; b=Omqbr3UDO4uxIFeOOl8zCnENtx3bz63xnmqq/1j7Px99A5f1n1E
	agreXF1xPYNEJCQvoabjJ+4LcSP6Eft4NDFsvftoFpyUsDV5oHNldCH1aazdR3wU
	DXFlAzgcrKX5I/fseFphP6hzYwEJ2xRQGxv5aulwIYqiovo75eoPDtxpUc3p3j4H
	2RulUzmzmLJ2pkSEk4sCXsdAUfl/utJ0xW4za+wWI+rPwbl+Hl78kKrfav38H6hc
	Ej29WjKRp3Zv/ivpoh2Fihn/O1gpskvSVNWb5XIRJ0c34NoCwUPudYMEzeTQNqTF
	gAwCyNzk7+3WZ2ScwMlTNeT3VNVOEpgZ9qg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghfwjhrwb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 08:38:28 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9102f07f2fdso74317686d6.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 01:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788770307; x=1789375107; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Se+7L1HVUggxXbgDO2sx71Qt+rECVPAGxv+lE2vxgMo=;
        b=V+kF6qeX4Z7CXP07da0Gp/PE/IqH1S7ExGnGWzcWAgrW+iF6vorj0y9l4KvBF0Kn8c
         JFExqXhO5zox9iti/rCP4Wh1T9JkUW/OyIbl3URGfRgL5z4kq32SfcTBk5wZXyirSuGR
         SAVumDp8LTyQtPcoe29W4NECUzwH3yXe7DXU7jo09AhJ1/beFTlRPAddkqXP662nUm8X
         OUaIBmSedi0omYfnj6xsDXuP3mXMkFF2bkDNC6GuCBORBj7EeqgSaSsj8DVCR7zOcZfC
         IVvwm1jy7dByLPjKRQAVAcY3RsrZwWtIrEtI/2jo1ecwoNJH4clpCDFvACB/TsR7eD+M
         e+Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788770307; x=1789375107;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Se+7L1HVUggxXbgDO2sx71Qt+rECVPAGxv+lE2vxgMo=;
        b=UhuUujTunQCRP1/w0HLqnCEbAwDo0ffiYqQByp0KAbvweasvqdtVef9xfCKMeZTqaR
         eWHn0FMEKLtnA5dbH1Yr6TQLaFP/MyWVbEzAHS75vmKL7u3frmngMkK/n6GMAuCrswQL
         RGAd6mBQjlISSzDnKxFRUCkWwlrpRlxNYzJTQbyFE/+dGgWr8og3z3Obs3kW3NNj5lwP
         mfEDxgR8H50EiOQ3tNxoNn1svqD7hen6cl58xA+ZIKf//1gjnQRJxslt2rt+r43Rq89p
         d7BaBRh8+Wwr5YZXj6z+GTpX9xvHihnuRLn5F4uXReZkdWGYIsV6cunyAqLNEd1Zef8C
         1eew==
X-Forwarded-Encrypted: i=1; AKwUvBwegJ+cshEzCf0fWUJK89XqBtBWlF1L1yP5PoZRnxohiI+JLMiJxko1cklYU3o/C9cRlixYrRPWLUgZBuE=@vger.kernel.org
X-Gm-Message-State: AFuF++nj6pSxTtfz0nMc1Lj2zXKniuVhjqoUqUOJLqPLRC1LFmanlMyr
	6mcjYXWw5DQ1v2F0ozJIY5bd+3B9vyMyRy57EF1lB3ReveyLFlpSI0vi6i/NpjFMjCKl0S5Kf7v
	WgUTyCPu3Y0BsKiaQt5zWpX86s5IEwggXNMoHJL3r4P03OzpJJoj+d2/YOyA4FXXXDdA=
X-Gm-Gg: AYBFou2ZFEOM+UOZ8ICZMBtI8XqGLnSw8RXJz9H9TjFgT4GjcCI1mu8lKyr2ZYOypj0
	fvg7y0hTjxiXS76+xY/RaZ4YcJIh6LRvkcyXDKaNpKqcOU30NiXktDSpkdEo3Zr8fl31fPLaF9j
	ZV3ufgNnXUg4OFKnoTjvqBYMp5pD7BfVHP/dz0wahKfdRUg8mQJU6uzzktmzXVkbbK3PD+doOY7
	NxBRFGyps8v5i1OgwM1FHWWZ3hOx8lBLMqGPbV+LvgyJbz9fktXBoQYB+3RASvCwpjCrMqS7DD1
	+4kfceiUufjchmuMjBlmvKx0bvQlnmrznzdCdzD5PrWJ65p5Rcojw2pkL7snNkorrnHyDYV30UG
	Bz/4W0OZ9EnS1pQ==
X-Received: by 2002:a05:620a:2990:b0:939:a5a0:4a08 with SMTP id af79cd13be357-939a5a0627dmr450366485a.8.1788770307273;
        Mon, 07 Sep 2026 01:38:27 -0700 (PDT)
X-Received: by 2002:a05:620a:2990:b0:939:a5a0:4a08 with SMTP id af79cd13be357-939a5a0627dmr450363085a.8.1788770306687;
        Mon, 07 Sep 2026 01:38:26 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c6ba4sm30852179f8f.25.2026.09.07.01.38.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 01:38:25 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Takashi Iwai <tiwai@suse.com>,
        Faiz Nabi Kuchay <fkuchay@oss.qualcomm.com>,
        Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
        patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 00/11] ASoC: SDCA: enable on DT platforms and add Qualcomm WCD9378 (Tambora) codec
Date: Mon,  7 Sep 2026 09:37:14 +0100
Message-ID: <20260907083727.733705-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA5MyBTYWx0ZWRfX8GzCjxqHKATH
 hTzM0hxpPscm36U35EiMT6gcFE/M/jd6ziyyV2wlRC7mJ7Zem8Zvdjdxz9SGvrTs/fYVc885gtn
 OBfM7fTo5RRjSKbGABDcSmghvoZ3VAw=
X-Authority-Analysis: v=2.4 cv=NanWEWD4 c=1 sm=1 tr=0 ts=6a9e7804 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=w1d2syhTAAAA:8 a=X2GpltJzu40BM-42fCkA:9 a=O8hF6Hzn-FEA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: lxHS7hb9U3djroY05NKmhgctSQ5hjfDF
X-Proofpoint-ORIG-GUID: lxHS7hb9U3djroY05NKmhgctSQ5hjfDF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA5MyBTYWx0ZWRfX2r3yCOrEsZMy
 TI1qwJ23U+efMEc2vA6dKtgd9QSkCnodcYm59z1waj2Y+fAjsmfj/nWVhG0vdtKDJ+PDU2FfL0y
 V0mhkyBZ5mTTgXRLVdH+Er93VF7rQ4fW0vvX9vXDF9AIEwrA3XM2ImG33e0nCKATKi7bP5egI+e
 dnc/9SIIsYkXfDpSTSxF/XcGYwb0Fb50vS7ip2IdYH4X6pt4ndrx+bguR7ZdJJbpln03e95xu2z
 pA4VvPITudpQYoUemb1pOIObLGrqrwNzY06SPTdp2lASE76PRZ2R1gk+gY8OZ0zwisCajprQHqe
 +da+Fg6NbW3rf5y4raaZMli79IqboHaJwxmI78OCY0yqLD34SlTzRFZ2n0sfbK+435Y5sGnzCTj
 lZg82dKylcCn3kvVHwW//tgMqeFiClRkUCeE8P0aa0uiBT1tLNjScDdw1+0PZihqajwf4TgZzMr
 L2gPGDX5zNGBv8k2dcA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070093

This series extends the SDCA class driver to work on DT / non-ACPI
platforms via a codec-provided static topology, and adds the Qualcomm
WCD9378 (Tambora) codec as the first user driven in SDCA / compute
mode.  Tested on the Snapdragon X2 Elite Glymur CRD.

Patches 1-9 extend the SDCA class helpers:

  - Kconfig gate to build the class without ACPI enabled.
  - PM helpers keyed on a codec-embedded struct sdca_class_drv, so
    codec drivers can build their own dev_pm_ops.
  - Class SoundWire probe/remove/read_prop exposed as library
    functions callable from codec-specific SDW slave drivers.
  - hw_ops with hw_init (supplies/reset/SCP init) and
    populate_function (DT-supplied SDCA function data) hooks.
  - Class function driver registers SDCA_FUNCTION_TYPE_SIMPLE_JACK,
    and resolves sound-dai cells by entity index.
  - sdca_apply_default_control_classifiers() applies the same
    is_volatile / has_reset flags that the DisCo/ACPI parser would.

Note:
None of these are functional changes in sdca core, all of these are
helper functions to allow non-ACPI users to use sdca core.

Patches 10-11 add the WCD9378 SDCA / compute-mode codec:

  - dt-bindings for the SoundWire slave in compute mode, using the
    qcom,wcd9378c variant compatible alongside the SoundWire
    class-ID compatible sdw20217011000.
  - Codec driver split across wcd9378-sdw.c (SoundWire slave driver
    plumbing) and wcd9378-sdca.c (SDCA topology + hw_ops) with a
    shared wcd9378-sdca.h header.  A future mobile-mode driver can
    plug into the same module (single MODULE_DEVICE_TABLE, single
    modalias) by adding its own files and hooking into
    wcd9378-sdw.c.

Testing: HPH playback and headset-mic capture confirmed on the
Snapdragon X2 Elite Glymur CRD.

Jack detection is not wired up in this series.  GE 35 / MBHC stays
armed by the transcribed init table but is not consumed; the mode
0/1 aliasing in range_ge35_mode_data is a defensive fallback and
has not been tested.

Changes since RFC v1 [1]:

  - Compute-mode identified by qcom,wcd9378c variant compatible
    instead of the qcom,compute-mode boolean property.
  - qcom,micbias2-microvolt dropped; MICB2 fixed at 2.75 V by the
    SimpleJack topology.
  - Codec split into wcd9378-sdw.c (SDW plumbing) and
    wcd9378-sdca.c (SDCA topology); module renamed to
    snd-soc-wcd9378 as preparatory for mobile driver.
  - Binding is compute-only; qcom,wcd9378 mobile-mode variant will
    land with the mobile-mode driver.
  - MODULE_IMPORT_NS("SND_SOC_SDCA") added.
  - sdca_class.h moved from sound/soc/sdca/ to include/sound/.
  - qcom,port-mapping missing now returns -EINVAL via
    dev_err_probe().
  - init_table sync up with CRD asl and the T14s DSDT; 8 stray writes dropped.
  - Six fake IRQ-anchor Controls on PDE 47 dropped; HPH
    OCP/CNP/SURGE stay codec-local until an SDCA framework
    interface for standalone status-bit IRQs lands.
  - .is_volatile dropped from FU 6 CHANNEL_VOLUME (matches MUTE).
  - dropped pre post pde callbacks, and all of the mixers and mute are
    exposed as mixer controls.
  - added sdca_apply_default_control_classifiers, inline with acpi
    iparsing.

[1] https://lore.kernel.org/all/amHqO5pMFmKRNYTT@opensource.cirrus.com/

Srinivas Kandagatla (11):
  ASoC: SDCA: allow building without ACPI
  ASoC: SDCA: export PM helpers keyed on sdca_class_drv
  ASoC: SDCA: expose class SoundWire probe/remove/read_prop as library
  ASoC: SDCA: add hw_ops with hw_init hook
  ASoC: SDCA: add populate_function hw_op for DT function data
  ASoC: SDCA: class_function: xlate sound-dai cell by entity index
  ASoC: SDCA: register SDCA_FUNCTION_TYPE_SIMPLE_JACK in class function
    driver
  ASoC: SDCA: make find_sdca_control_reset() return void
  ASoC: SDCA: add sdca_apply_default_control_classifiers() helper
  dt-bindings: sound: qcom: add Tambora WCD9378 SDCA codec
  ASoC: codecs: add Qualcomm Tambora (WCD9378) SDCA codec

 .../bindings/sound/qcom,wcd9378-sdw.yaml      |   91 ++
 include/sound/sdca.h                          |   23 +-
 include/sound/sdca_class.h                    |   80 ++
 include/sound/sdca_function.h                 |    2 +
 sound/soc/codecs/Kconfig                      |   11 +
 sound/soc/codecs/Makefile                     |    2 +
 sound/soc/codecs/wcd9378-sdca.c               | 1010 +++++++++++++++++
 sound/soc/codecs/wcd9378-sdca.h               |   20 +
 sound/soc/codecs/wcd9378-sdw.c                |   52 +
 sound/soc/sdca/Kconfig                        |    6 +-
 sound/soc/sdca/sdca_class.c                   |  166 ++-
 sound/soc/sdca/sdca_class.h                   |   35 -
 sound/soc/sdca/sdca_class_function.c          |   50 +-
 sound/soc/sdca/sdca_device.c                  |    4 +
 sound/soc/sdca/sdca_functions.c               |   43 +-
 15 files changed, 1516 insertions(+), 79 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.yaml
 create mode 100644 include/sound/sdca_class.h
 create mode 100644 sound/soc/codecs/wcd9378-sdca.c
 create mode 100644 sound/soc/codecs/wcd9378-sdca.h
 create mode 100644 sound/soc/codecs/wcd9378-sdw.c
 delete mode 100644 sound/soc/sdca/sdca_class.h

-- 
2.53.0

