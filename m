Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 046F64B1292
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 16:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789491436; cv=none; b=IKedIt9IxxhAXKNA4AY0RRdYer2Y75c2iOumAvWkA7gdNbDVYLRwjqTj3bmea7rZLI9oyBAQND49OBaCBFyuwwnxHovpdWdw7sKv6zNqaw+4l4m+87iUHPsAg7GssmtLmD4GxaOZt++/Z55pTCpGi5YaIanaUOfu8HnvluzIF7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789491436; c=relaxed/simple;
	bh=7sZXCJrlcQe6tWAnvFSzQqrjQWl6F0vafplST4Apil8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mdZyFZ6sRNnDJjFb7FR802z9T86IFdkWHB+fz2qS/iZmy9mMsOkpwJBGu3g9zyrS2PmZmVRsjqrrNDz5K5VnWR7sjmR3NfdxBOQ7aJP9eyIe0eVXESmLlQY551KSeC5HaR/b/13qtiCOuFZ8yKq0+pdBlYPEOKMv8/+jjWemEuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OjZnOgzx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U7GAPlaF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OjZnOgzx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U7GAPlaF"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FGXUoh3577003
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 16:57:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=MI9Kl7QZCeP7JVMjKmDtliZY8ZENsVTkKBw
	Bqm3AWGs=; b=OjZnOgzxB/Ny/uKwILwfTDmDBotboGiLbs5GjDZllgRDP51/nrp
	GIaviMks4eOhaIu/0bdDTfgotEs1RFidTkcSbGEa4HV+nOBqWwGuCcXeX+1dMDeI
	vVvOxDjfHMilqgx//l2LikFX+ImGINhUYOxKbOx3FJRKM4XYZXyuNQdNhx4CuMSL
	WRIZoOWB6dlHyx3OdxlnK+mcxVbQOn35gIGV76EzpvkkvVjJVaF+G/UsOXcl+DLM
	vPiWfs/r5pc3QlnQSjxmsOPwTJStpkAFX5q/Th2Ugcw0m/IxkPBunw0iKiths5gp
	1aLcfC9Kgl96yvrBrOk2fPILLY0IfW03KaA==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq9n605ev-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 16:57:14 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-97e98448895so709250241.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789491433; x=1790096233; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MI9Kl7QZCeP7JVMjKmDtliZY8ZENsVTkKBwBqm3AWGs=;
        b=U7GAPlaF7yJEerwi+ZDWNtGQvumHelZKPJ3MiIFdiAVCw1ZT6hDOqDq0Ynz5eCbeba
         PBF38+wy+Wwzd2e/KDl/sgltxZxCVNXiEMwFnwkjSJlEJYl53wtcQ626e+VYfkjiU3gH
         tlAnraghCb7ob5unwhkLkJSz48Meic9nGZQ+128UzYeuKy6v4YW4tEBtTgieXEuuWY7e
         Gu8/FskHki1v5y6NlfzG9aHY6AcpfPaxzplFxsdP6dlfYeRPiMM7FvN6PjwjO7oVgikY
         dP2XziQbsAh4pnTE6Xhx7nuoxii2ZNZnq5CpEoqgthUg3zlxqWxIJNCogiLU3Q4UtA/j
         Qv6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789491433; x=1790096233;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MI9Kl7QZCeP7JVMjKmDtliZY8ZENsVTkKBwBqm3AWGs=;
        b=lfWGdBk9whMmZWtPIwwF2uISvREBRmf7KEe6u55mtRNT9QJMPa7FYycC3GnhIuFDjm
         1jr6GAuOe4oJD/fv63Ayn/A09x/KFdfVdOhGWY4gW+Tyu6S8KMPQ8TrhklRV7/7s5Fcn
         os2c49oSTDSmtBCe92Fg7Mf1XiEBasEd7NdWXi2BIl6oNKrzwGK/Jvihn6SS4umUGzGI
         HmP3XV6brM8TcdRRoKmPvLzSAt0HcCTUbvn7xVReb7KjdFaWR0Rmn04ZAPMLlXCytqV0
         AVkqUnV2nXaaWOneBSNe7w/mY0+063zZwqrVqkI0JyG3NLVjqlc4AlMpeO0xgYsgCYK+
         FLKA==
X-Forwarded-Encrypted: i=1; AKwUvBzcgPq33zX7OXJwMdohAGPXSdQ9Qyt0yKBkD4HZNE/fnGgJwdVrtyKsQ517r1unA2cN3X8VIhxg9ljRWZ0=@vger.kernel.org
X-Gm-Message-State: AFuF++mf4OylwqVOID5ki1IxgYsCnESURy7bGaeuGZmvDnHvXeUKyYil
	Kd69Fl9/TU4CYTP5E/r2n3bd6wwe1lRAxyx1wh9pz6ODAjg+keyDZw2rVhUYLg6V1oz0hyxqd+I
	j2/uVE6qz1bnQaHy9V1/8qBBPyNI+I7OqtShpxI69RzHcQabx57V6Onbrc8bmIV7TUJg=
X-Gm-Gg: AYBFou2x8ReEUKkN65W+29Yyd1amoGA3VWbmSkm5dYkc7Uixuk+o8KAq5U+N1lS2ggF
	00VsqFgyCkc3WM1mBcBHDjjfY7iaKSSDGmF7hii6sj8Y9yXtLpdX38Whv+gi/0J1qVcZ2bsx46L
	phkm2oddKKQXQ8iwfRhSQi6kYBabHo85SNIkREU7JxxGzHr1gn65x7ETI4VoylzCPFbJDGjvB55
	o9stCBkzi9h937WSPOFLhPJ39Jh3eS+4od26MJLUj20k9iKpwQKrA2Xx3oHcL2ajTAY18s6onhN
	qPEpdGwRkLzfmN7XUVQNp4+DANi5cCWrmPZYHx+J2NXVicoZHie9NVl7We9MrWxs9sYpoj2xu32
	zKUzxYJ2PdN1MqQ==
X-Received: by 2002:a05:6102:6407:b0:79b:ff9f:74cc with SMTP id ada2fe7eead31-79bff9f793bmr8266158137.0.1789491433072;
        Tue, 15 Sep 2026 09:57:13 -0700 (PDT)
X-Received: by 2002:a05:6102:6407:b0:79b:ff9f:74cc with SMTP id ada2fe7eead31-79bff9f793bmr8266072137.0.1789491432543;
        Tue, 15 Sep 2026 09:57:12 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83d9057dsm4361335e9.3.2026.09.15.09.57.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 09:57:11 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, patches@opensource.cirrus.com,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v3 0/8] ASoC: SDCA: Qualcomm Tambora (WCD9378) SDCA codec support
Date: Tue, 15 Sep 2026 17:56:42 +0100
Message-ID: <20260915165652.914893-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=BdVNQbt2 c=1 sm=1 tr=0 ts=6aa978ea cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=NRmDave84CxBQQXzKXEA:9 a=O8hF6Hzn-FEA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDI0NyBTYWx0ZWRfXyRAzb9sv5ieC
 Q/d0DAOLcoRHFoBfGWKGMy0giuWUKBXVe9Cd5V84gTWLkS6a4KvkDC5P4LjM8ZKDCHBvTbFE+zz
 BMUUnQS5iri8nlwPjQ/wqXs62EZdkmx/s1d7yy8i+r97tijsRwGIPnLELNQAUbyCQ12NjBL6Fh8
 7XdVgWwlM6P/Ho7JXpSoWq3yDtVToc/cZDaL9N5Hc7o/UgeCwYreqlyCwOS0Y96zTaVtzluJyzT
 fa9JXQM7ilYHNZmy7z/GqyHSr1ybYVFKAWDfkUWORPtW7A8WErsAc+KtUa4bZ1iD/kNI05GZb/k
 Qjv615ZADSUQwqz7i/maFD0x7WVhyiJwbAG8as1RqbA7TXQLgV4rg3pm/eeHji4MbYA7SsEo9QM
 31vgYjI9+3cdibpg1+wm9ifsMLBH1yosO2zlO48z70FZbt2E4tAVmaRg4v9Bok9ciK38iZ2XX39
 e7rah44CCC2QXLJPv7A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDI0NyBTYWx0ZWRfXz5E40yU3FSAk
 MDl2s4nl2Wc+R7Zg/abEelqhEp/c/KWLwQARz8zoTV+F9/oDn1Yc1BSaXjA56kN3B4jUSTMb96N
 rw3CYqyoDX74IC7F4/nBxpHHe5c/JXs=
X-Proofpoint-GUID: 5eEGXF7cXmwnSTB8uO-QLfbfGNfPgWq1
X-Proofpoint-ORIG-GUID: 5eEGXF7cXmwnSTB8uO-QLfbfGNfPgWq1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_04,2026-09-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015
 impostorscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150247

This series extends the SDCA class driver to work on DT / non-ACPI
platforms via a codec-provided static topology, and adds the Qualcomm
WCD9378 (Tambora) codec as the first user driven in SDCA / compute
mode. Tested on the Snapdragon X2 Elite Glymur CRD.

Patches 1-6 extend the SDCA class helpers:

  - Kconfig gate to build the class without ACPI enabled.
  - PM helpers keyed on a codec-embedded struct sdca_class_drv, so
    codec drivers can build their own dev_pm_ops.
  - Class SoundWire probe/remove exposed as library functions
    callable from codec-specific SDW slave drivers.
  - class_ops with a populate_function hook so codec drivers can
    supply the SDCA function payload from static tables on DT /
    non-DisCo platforms.
  - Class function driver registers SDCA_FUNCTION_TYPE_SIMPLE_JACK,
    and resolves sound-dai cells by entity index.
  - sdca_apply_default_control_classifiers() applies the same
    is_volatile / has_reset flags that the DisCo/ACPI parser would.

Note:
None of these are functional changes in sdca core, all of these are
helper functions to allow non-ACPI users to use sdca core.

Patches 7-8 add the WCD9378 SDCA / compute-mode codec:

  - dt-bindings for the SoundWire slave in compute mode.
  - Codec driver split across wcd9378-sdw.c (SoundWire plumbing)
    and wcd9378-sdca.c (SDCA topology + class_ops), sharing a
    wcd9378-sdca.h header. A future mobile-mode driver can plug
    into the same module by adding its own files.

Testing: HPH playback and headset-mic capture confirmed on the
Snapdragon X2 Elite Glymur CRD. Will test it on Lenovo T14s. 

Jack detection is not wired up in this series.

Changes since v2 [1]:

  - Un-export sdca_class_pm_ops and per-op wrappers; keep them
    static and let codecs compose their own dev_pm_ops.
  - Drop the exported sdca_class_read_prop() helper; codecs
    open-code the four lines locally.
  - class_function: check the codec-provided ops hook first, fall
    back to sdca_parse_function() only when a firmware node is
    present.
  - Rename sdca_class_hw_ops to sdca_class_ops; populate_function
    does no bus I/O.
  - Drop the hw_init callback; codec users moved bring-up into
    their own SoundWire probe.
  - wcd9378-sdca: MIC_BIAS fixed at 2.75 V via the init_table;
    drop stale qcom,micbias2-microvolt reference from the commit
    message.
  - Rebased on b-next-20260911.

[1] https://lore.kernel.org/all/20260907083727.733705-1-srinivas.kandagatla@oss.qualcomm.com/

Srinivas Kandagatla (8):
  ASoC: SDCA: allow building without ACPI
  ASoC: SDCA: export PM helpers keyed on sdca_class_drv
  ASoC: SDCA: expose class SoundWire probe/remove as library
  ASoC: SDCA: add class_ops with populate_function
  ASoC: SDCA: class_function: xlate sound-dai cell by entity index
  ASoC: SDCA: add sdca_apply_default_control_classifiers() helper
  dt-bindings: sound: qcom: add Tambora WCD9378 SDCA codec
  ASoC: codecs: add Qualcomm Tambora (WCD9378) SDCA codec

 .../bindings/sound/qcom,wcd9378-sdw.yaml      |   91 ++
 include/sound/sdca.h                          |   23 +-
 include/sound/sdca_class.h                    |   70 ++
 include/sound/sdca_function.h                 |    2 +
 sound/soc/codecs/Kconfig                      |   11 +
 sound/soc/codecs/Makefile                     |    2 +
 sound/soc/codecs/wcd9378-sdca.c               | 1005 +++++++++++++++++
 sound/soc/codecs/wcd9378-sdca.h               |   20 +
 sound/soc/codecs/wcd9378-sdw.c                |   52 +
 sound/soc/sdca/Kconfig                        |    6 +-
 sound/soc/sdca/sdca_class.c                   |  148 ++-
 sound/soc/sdca/sdca_class.h                   |   35 -
 sound/soc/sdca/sdca_class_function.c          |   45 +-
 sound/soc/sdca/sdca_device.c                  |    4 +
 sound/soc/sdca/sdca_functions.c               |   31 +
 15 files changed, 1474 insertions(+), 71 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.yaml
 create mode 100644 include/sound/sdca_class.h
 create mode 100644 sound/soc/codecs/wcd9378-sdca.c
 create mode 100644 sound/soc/codecs/wcd9378-sdca.h
 create mode 100644 sound/soc/codecs/wcd9378-sdw.c
 delete mode 100644 sound/soc/sdca/sdca_class.h

--
2.53.0

