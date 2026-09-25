Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 611C74C680B
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 16:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790352684; cv=none; b=kF4WFlvbgOZPUPdUkgzttIZktXIoAVaEnrN+HWsROW0T00+Pz03MHhT9me0nbeRsftXSboS7LxxxnhC1vGKY2tUzPWUkvhWZvSy0371Quny1JoIwUdi3Nqv5QgvPmBzAbi5yo5EXy+F+lvyFSU+8H7mKWyK7a9Iar/IMvz6kM/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790352684; c=relaxed/simple;
	bh=F/iXP+JEwA9EqSDT0Nx7e8u4H23peONoXgJq6hUIwXg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NL3/ZRVDDhDZcK4f/gVKzjkY8i8bfvELgAI2GEYJBW/ZpGeMynt5IzIVXYgiMWA5HGrCu0dmW+wKduyWgEVDSd4enlH7bx1cD7KOKr6AGe1NvOZLI66KKQE9+SXaDceU5/Gz/QwMgXu5bLPQaru3TpU/Kbj9iDPFzNy6VmSZia0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H6QBTTPx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UQ34gC6y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H6QBTTPx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UQ34gC6y"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PG0C6k1489620
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 16:11:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=98Nyoih8+3YA2/Q1yypaUxBVERYILXDNomX
	DQkZMf+A=; b=H6QBTTPxTtU7MVj/xJvc1Oe9/O/wJ5RTAKLBbXPlRy0wNKLjDat
	Kk48gFVHpw7Bxj5FMBE8eVFHIoam8bQgNXOLiUjec+6tfaMyLKJNH+vxPOGqbSCe
	e077FnBXVRIR0mgEQqmwnCw00SsfeFsI0cU4k/UGCTSjdrjSgw+sCqpiWILbTPad
	ix0TpAmu+hxRxMWTWxea06y7lctEFASsjmVqfu6uSGUDeRxfvNeHk6o7sZACjtUk
	aNRL8BPRea7S7KUvWQiwMDRYqi1jwOOvpLmlUmbrgSQk2bDS3kkuewfJBooE/NfQ
	yWkQVTiCo4FRI3j8+FhwNvzh0LMGGoWKHBw==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwr101038-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 16:11:22 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-98527cdac1eso128975241.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 09:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790352681; x=1790957481; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=98Nyoih8+3YA2/Q1yypaUxBVERYILXDNomXDQkZMf+A=;
        b=UQ34gC6yFCzNUvx7UaHLBKXcdnmYSS0z+LRpDDLSByjA/g6skJ4Nye9V8hDiVr61nw
         XDFqDPiAAu7JJfG2/05RSuFYDNWtfspAUJb9SxGKWinZbSRTsOkLzzDJQfeXuREZ80FX
         lO1rV84s9M5NTAg2fQof508a+aRLwOErPF/VMq3Qqordu/yeXzywL4Xa65PkjcKkVHcy
         9VK+YmreDSI5S+3BmJtNUPEVqlVspDsvXz7MCb1OzWVejAq571dG6AWcMYccNCBFw+lp
         5pGVNZ12QntycyO/SAtEJ1XhlkPxU6Bm0ToiY4MaIMnO35IcdQucppnZOnxyxpT7EGLi
         pcLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790352681; x=1790957481;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=98Nyoih8+3YA2/Q1yypaUxBVERYILXDNomXDQkZMf+A=;
        b=TVgNsaVPxuiIJssJhf3SysJ9ca0dK0uopKomZ7Vai4MmoVAwH1dlNIlzztpd8neFVc
         kjevYum5QpAHU0wr+fsFPj+fb7tNLzpjQfc6nS0DXSR1gQthqZYVDVNrY7BplS2kMuBm
         wMiRtdI46g0bYVioj2dyFF6YRizHHA9TtOdrKV5dyhOunMhqK/hua86HBGHJrKvMq3tC
         b+Cg4j7WNQ3/oIJP2CG/tmBtUO+QqHPjN4lUIniZJ2HAIRyoeos2gyGyHxJE1UzosPwd
         HbsuafIo4EEEuaPnaMU8/BmU0Xsd0ktAZCd8z8TKmoiNUvwOmt8b436yQOjKkfuWSIft
         ZyCA==
X-Forwarded-Encrypted: i=1; AKwUvBxF0zjHk56vnMtqtTkXC6KDZJpZnd4RGZ8yrCSGysfErBpmo7NPEiGXskARsODN7F8j+MjKDlzy0nijCiE=@vger.kernel.org
X-Gm-Message-State: AFuF++nGxHTga/H3B0njsjJv6oPJaxkjHl80VocjKt746L0UdDvqehp0
	7OKD2Xhswzdyzv/Kk1T1ukbBTNgMURfEjkCaWx9/jUQSx+hCThaJeGHtHdpNHGvE7rZL9+U2zcS
	qqrJRxbKrcOhMONMMuWed9v5LOMtM8jjpbG2TYZdj5NE1aBnZgR+WrHKXrrknQ1Gz6ak=
X-Gm-Gg: AYBFou2JvTZoMk59T/8knbd/QxRBC9GdeeV4oZKq+7z4cWjsxqpg8c8l1BKCSKgijRf
	O3/1p/5+Mfo+b56HEgFdrcnr9MRct/Q+MkLZTP3vPKZX3x8/64raf6BVs/ejj8ZqcF4eCzFSZVx
	k+53kzYYTWd7XF4eFt+ql/gnZ8W/jTlsC+IbVq0NefNRqwE/IEuZpWXNwXp+hHwnH3U80tru4g+
	sFIg0IM5qeB8TsZ7AN7yfXdITtX9AJby/cr7B8UK+osd901YVgJpBDdhge8J+2h7+5HgKR+lcIW
	G6v5+MJ/nL4IyqFjPMqzrzWWiyZZmXnoO6Szaer8+MeWRsqFgs6OvHkPBBDUTlDQqsUXooZ3r1L
	hJzXG9aBMpjD5
X-Received: by 2002:a05:6102:2914:b0:7a6:e08f:9fa with SMTP id ada2fe7eead31-7af1cc992f3mr2742525137.13.1790352681251;
        Fri, 25 Sep 2026 09:11:21 -0700 (PDT)
X-Received: by 2002:a05:6102:2914:b0:7a6:e08f:9fa with SMTP id ada2fe7eead31-7af1cc992f3mr2742498137.13.1790352680681;
        Fri, 25 Sep 2026 09:11:20 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff06b4d45sm73019505e9.7.2026.09.25.09.11.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 09:11:19 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v5 0/7] ASoC: Qualcomm Tambora (WCD9378) SDCA codec
Date: Fri, 25 Sep 2026 17:10:41 +0100
Message-ID: <20260925161049.758913-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA2NCBTYWx0ZWRfX7sRIvTMEzYFG
 kmSvWhac3O5cXHd5awcoqBk8E12Hsbv1wYxKKUrzw7Uqo1wGixIISvdf3hstk3bwnT8pq09Age0
 1+E/92bbv5EQyWcgoX0GVracWJ292safXByZ+qcUdesndvCfQSYgRtSpJrDzSlNc220iVjOSFXV
 HCAsKmBgbcFnl5dtjub7ENrjtVXP7hG9Va/XGwowt6aGf0UgdNPGrZQmZC73DHhE/xgyYKuJK6d
 rSlt0pM2n1cbd1CiMtlNWLVn33OrL7PW8++BzzdvAeu964UxqMD0h7qQKZzoumuf53EqwRuvJqc
 WfULqxD+62iSB9UdNsarzAk8SBhrFbdDNMZbtGehtd/GnCRGElIM/H5xOGbnnqls2vTjziEorVE
 g9wiVOfa4j7I5AgKrRD3WeFzo6+5F2ZT20YGqV9xu5qSAC+6+r+Bg0XzvGMJ/dHJxHh3n6vyiR4
 Ok2BeVaVqQzmxeZ2Rog==
X-Authority-Analysis: v=2.4 cv=ZfKIpcVA c=1 sm=1 tr=0 ts=6ab69d2a cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=hYdbEgFD419NYT9lHAoA:9 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-ORIG-GUID: 4jCTg5BagbHNmQtH_uONkCWItBPr_2WL
X-Proofpoint-GUID: 4jCTg5BagbHNmQtH_uONkCWItBPr_2WL
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA2NCBTYWx0ZWRfXzi4T+3QZVCaZ
 qCqOxoZE6LOqgpt4GEB8owtU/rMLUUURZoV8rz3i45mc6Qaq1VyIbG3Pgw3BG6vL48oZIFHmSqx
 Ui5Iqp4RQiG2c2ff/n8Oo+Ls+im4qiE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 adultscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250064

Add support for the Qualcomm Tambora (WCD9378) headset codec in
SDCA-compliant mode over SoundWire. On ARM/DT platforms without
ACPI/DisCo firmware, the SDCA topology and SoundWire port properties
are supplied as static data through the codec driver.

Patches 1-5 extend the ASoC SDCA class framework so that a
class-based codec driver can be built on ARM/DT: allow builds
without ACPI, expose the SoundWire probe/remove library entry
points, add class_ops with a populate_function hook, and translate
sound-dai cells by entity index.

Patches 6-7 add the WCD9378 dt-binding and driver. The same
silicon can be fused for a mobile (non-SDCA) or an SDCA-compliant
mode; the two share the SoundWire class-ID compatible
(sdw20217011000) and are selected apart by the qcom,sdca-compliant
boolean property.

Tested with HPH playback and headset-mic capture on the Snapdragon
X2 Elite Glymur CRD and Lenovo T14s Gen7.

Jack detection is not wired up in this series.

Changes since v4 [1]:
 - ASoC: SDCA: add class_ops with populate_function -- callback
   now takes the SDCA function device instead of the parent
   sdw_slave (Charles).
 - Drop the v4 sdca_apply_default_control_classifiers() helper
   and set is_volatile / has_reset directly in the WCD9378 static
   control tables (Charles).
 - dt-bindings: sound: qcom,wcd9378-sdw.yaml -- $ref
   dai-common.yaml# and switch to unevaluatedProperties
   (Krzysztof).
 - ASoC: codecs: wcd9378-sdca: fix SU 35 Selector mode RO -> RW
   so the class-layer DAPM mux can drive it; keep SU 43/45
   cached; reduce reset_max_delay to 25ms; drop the
   sdw_slave_read_prop() call (Charles); lower-case hex literals.
 - Commit body / Kconfig help corrections across 1/7, 2/7 and
   7/7 (Mark, Sashiko).

Changes since v3 [2]:
 - dt-bindings: sound: qcom,wcd9378-sdw.yaml -- drop the
   qcom,wcd9378c front compatible so the schema plays nicely with
   the SoundWire class-ID compatible; introduce a
   qcom,sdca-compliant boolean flag to select the SDCA fuse; drop
   the fake top-level wrapper node so the slave sits directly
   under the SoundWire controller; drop '|' from qcom,port-mapping
   description (Krzysztof).
 - ASoC: codecs: wcd9378-sdca: gate probe on qcom,sdca-compliant.
 - set SDCA_NO_INTERRUPT correctly on controls, (Mark).

[1] https://lore.kernel.org/all/20260918131914.681588-1-srinivas.kandagatla@oss.qualcomm.com/
[2] https://lore.kernel.org/all/20260915165652.914893-1-srinivas.kandagatla@oss.qualcomm.com/

Srinivas Kandagatla (7):
  ASoC: SDCA: allow building without ACPI
  ASoC: SDCA: export PM helpers keyed on sdca_class_drv
  ASoC: SDCA: expose class SoundWire probe/remove as library
  ASoC: SDCA: add class_ops with populate_function
  ASoC: SDCA: class_function: xlate sound-dai cell by entity index
  ASoC: dt-bindings: qcom: add Tambora WCD9378 SDCA codec
  ASoC: codecs: add Qualcomm Tambora (WCD9378) SDCA codec

 .../bindings/sound/qcom,wcd9378-sdw.yaml      |  105 ++
 include/sound/sdca.h                          |   23 +-
 include/sound/sdca_class.h                    |   70 ++
 sound/soc/codecs/Kconfig                      |   11 +
 sound/soc/codecs/Makefile                     |    2 +
 sound/soc/codecs/wcd9378-sdca.c               | 1080 +++++++++++++++++
 sound/soc/codecs/wcd9378-sdca.h               |   20 +
 sound/soc/codecs/wcd9378-sdw.c                |   51 +
 sound/soc/sdca/Kconfig                        |    6 +-
 sound/soc/sdca/sdca_class.c                   |  148 ++-
 sound/soc/sdca/sdca_class.h                   |   35 -
 sound/soc/sdca/sdca_class_function.c          |   45 +-
 sound/soc/sdca/sdca_device.c                  |    4 +
 sound/soc/sdca/sdca_functions.c               |    2 +
 14 files changed, 1531 insertions(+), 71 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.yaml
 create mode 100644 include/sound/sdca_class.h
 create mode 100644 sound/soc/codecs/wcd9378-sdca.c
 create mode 100644 sound/soc/codecs/wcd9378-sdca.h
 create mode 100644 sound/soc/codecs/wcd9378-sdw.c
 delete mode 100644 sound/soc/sdca/sdca_class.h


base-commit: 4c253ac4b29b8c6cc6fdef8f92d4facde62e63b9
-- 
2.53.0

