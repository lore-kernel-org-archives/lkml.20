Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACDDB3C10A7
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 19:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788378465; cv=none; b=n1mnD0Fls1mSskOXwDpmjaDHSF4lmtsdAzmZC5XY5mIVlCe/FhSgzWXYW0sztTTHzdQYH8IDde1LROJixL1Y0sznKCE/S/VwSt4adZZbubtDxw/R+8Wk7I9EamHV9EOD3V4GRUXcEulmU4Xo50535ias6TUthwmvd4suWgU68Cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788378465; c=relaxed/simple;
	bh=lR/kOg4JPDleieXCrH0ugn/9kc0/bV3ijWJfhYo8ipI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nMxEFvsWtguJLLCcN7FbqRU6lSrapku+KjUHLHHuwmb1AzDjxh1TDjaaJvCZvZuWJ3qbsKEXpwFOtkrnNKnIXZ34y4QF8dBt3cg2xMYxp2juMn3ieQW4O2LVrRH8E3Rjt3r6QQvVV47w7PLyb+RFe4T67WJF7O3DY5dCXcHSdi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fYKBCmKE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HBBi2+1b; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fYKBCmKE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HBBi2+1b"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682HqtVB2209578
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 19:47:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Ja8TJrF2QPIH95WAiiGz7eBCCXb4gcQf5aE
	nLgC5tuY=; b=fYKBCmKETr7hjhhElQ5bba4aeQ4CySO3kn9whRMrLELxcvgS3wZ
	TSiAe9qgWuenbUOZkYGD77ESL8ouruX/1nHHAu5DLzTSHzQ4itIpkTs3q3U/fyr1
	h1us0XQXNXIiaGy+VGJ+Kqbx+mdqi7kMHTg961EXjuRG7IS3cAjaIUmeDKXeaDOc
	0OFEXE0RinY4vkixwT/0CaNFS1uRG9U5Fr4jD0TJ98Wd2tWlY42E3VlcvWvxOrHw
	QktAgLkFUIjSVQaTNb02/6rTGonvIIAIA6vfcV+NPGFerUAITiYGt2xCeDUS3GRX
	zFQolpjTwPXCZ4x1RdoHfi3XCDrMQMiNzVQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gepv5s1jj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 19:47:27 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3823dcc1647so1928595a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 12:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788378446; x=1788983246; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ja8TJrF2QPIH95WAiiGz7eBCCXb4gcQf5aEnLgC5tuY=;
        b=HBBi2+1bfGiZWlMWUIRFgrvcYzyuvZb4MJW31bkwdzxv0FqVudHAy+7Rvt+d2n87Iu
         Gw4oPW0GmuCclN89PknrdT/MjCYYMiOPIJUqMaGk/I16++BU3i0xy6jPpBm7BA1JfbeH
         I2F0tN2F4/lXsHdnkFxgPw7cOuBOsBRbasK+WKA8Iy3uiDFxyX+3v6Sf07g1atFtuoCZ
         ZonfbHX+sSjzVOB/R8ln+4YkIr54uySouJMvjvMV73gajtfgIuM0lROEejmbXgLb/+oM
         U3UbuMOoQjmN7f7YHxc0NKCrtenio012kykmjivCeRoPAm+T1ZvZP4m2yhNhM7/TY62x
         vAPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788378446; x=1788983246;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ja8TJrF2QPIH95WAiiGz7eBCCXb4gcQf5aEnLgC5tuY=;
        b=MwyinGl3p5HSsZ4l6iTiJVRaX8gmYqiyBfM0boLjhCjCHTCSv7sjTL875TskAkiteK
         YZMBkiJ3J0Iv6Q/J1jbMYWlPchhm6BVZ5yfAtgsAJhNQ54aIHBzr3iiVkXBFZcFOIkXd
         eCpb0U+8bl/VaEgkb/R2u+/XiQRTKy6ezAUfVfj7DxSZCKo8JZm9rqqfl1NDK4SFd3YK
         dqt2xM0DqdBkpqhR6Jf6l8HlLdXNTsvVO6AZptFQ3XwqMxHmLvDEdBHzDjRYAntbkyhJ
         iclAQ5eNuEmUPMgAVXucoo0F5w+UQiauRXHwHEB9p1Kp8XTV/xEYG2TP5XERh2CKegRE
         ybkA==
X-Forwarded-Encrypted: i=1; AKwUvBw1ZC58vOXg2+Bxiy3l3aFRZJiCGwo7eoPfeRuQKxlKdGU/oSPKPxnzVo7J1znKIVNwdJdNBtniBd46gq4=@vger.kernel.org
X-Gm-Message-State: AFuF++loaKRZEnJefZUvP3goDxp2rNcXznVA+AzsJIwLdHkv0fTGFQrp
	7jEPDSnuuGYCEzWRSQserYsXLse4/MQK24dtOAlJGhw5peKavb7J3uTfkLVY+S7RNkmzsKmtEgh
	/yWbQ4Q3AsVNHPVEeo7xZNpZ3Vcb/zZ1Z3SkCX+qlvHMhScwfB0Xa29mhR+2HqW7OsLs=
X-Gm-Gg: AYBFou3M1JSjHogzQGR4nO8HGE81ZwLG2yRbubE5CLOZ8k7jieXxudG7EopD9wN1jUW
	9WRZ411z4eX7ovMj0C/hqSscwt48S/fTLQmTAyoSJg9CMoJHk8TaX93uGdmQeyGzaONyZJ/D/Ym
	zxAWFOWehXqCDp/BCt+YitUQ8/TMdnsLsMZ7/vSC4t5QCHgpXlHLGS1itWN0Cy9HZL1qPQRaLI6
	2KXtEAa9pO01TygF8+NV80BkAR4T+P63KSnjbL4dmPcfrGnhp7wSLrrFeirWWC1EYR/4/d2gNyf
	JnnRyyv+RTHjtulwRry40WvbAf4Ts3E2Y7w1t6J5hzRr6JpvvpZKiEzrwdFHLDZTdFOm6GKaz7n
	0XdStAQQ0Y8LlAKjDZYw6dnkaVDc=
X-Received: by 2002:a17:90b:164b:b0:393:288:29e3 with SMTP id 98e67ed59e1d1-39aedee9308mr10917511a91.10.1788378446086;
        Wed, 02 Sep 2026 12:47:26 -0700 (PDT)
X-Received: by 2002:a17:90b:164b:b0:393:288:29e3 with SMTP id 98e67ed59e1d1-39aedee9308mr10917460a91.10.1788378445546;
        Wed, 02 Sep 2026 12:47:25 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3325641b4dcsm307065eec.26.2026.09.02.12.47.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:47:25 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Gary Yang <gary.yang@cixtech.com>,
        Fugang Duan <fugang.duan@cixtech.com>
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        sound-open-firmware@alsa-project.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 0/12] ASoC: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:17:00 +0530
Message-ID: <20260902194712.2003414-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=T8y8ifKQ c=1 sm=1 tr=0 ts=6a987d4f cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=x_sJgRSeZ0M3cdfWgbwA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: tTb9GltPras1u5ROAD90zSBgtPZ3pyvp
X-Proofpoint-ORIG-GUID: tTb9GltPras1u5ROAD90zSBgtPZ3pyvp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3NSBTYWx0ZWRfX8PW4maOffDMU
 XS6pyvwNhhw61O9p/R//dPUf9bb5/cYn66aJ4Dig5KSMbxX63gBfaVYORMQ3JWq5V8j1dBvmx0J
 N7YCcgUMd+sn0TRlkgyZYIrW9HleKJ+F9/IcoLBnrdF0e42gXOTffs9wB+MfwINWOPe7NcrLz3Z
 NFr5+KyVoFi0LW6+7KvuDxVNs8Bif2vwSffzQsuhWl2FwPE71L955tzrYNJU2CRvrWAXUhv+QaA
 QeE6XeJ4Cj2AQgRpYIMOeJi2ZuIG6DFqR2R92i9svS/DSJ3Dz//A7y1d5l7PpREGzRNsNeJbPZm
 iuBrO7PU2aQfUyiVx0CclAmgzA+wZQzqaVQkl6oAE5HyD1jPbY7jDD3hJJV91NSGVjT2mntUdJv
 doApvVl9V77n6CWOGR8fOjG3SCqsLjdfY3fSabfX6HPQ205+BA8Xhk6izUwYliXY1SSYbHKlgyw
 Vl6GLkNGHxbg36CVJSA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3NSBTYWx0ZWRfXy4kS4oDIB98M
 8OjnaGckvTjUnP/zPsjj7Ct11SvTzzPx+doVSA9FMqaJS2nRipWmPpBKqy27tFu/odG78Ej3Wyp
 eFnlDw97StPViJi9EkV1LU/j3+83nx8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0 spamscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020175

Several ASoC drivers manually manage reserved memory lifetime by calling
of_reserved_mem_device_init() in probe and of_reserved_mem_device_release()
in remove. This pattern is fragile: any error path between the two that
skips the release leaks the reserved memory region for the lifetime of the
driver.

devm_of_reserved_mem_device_init() was recently introduced to tie the
release to the device's devres lifetime automatically. Convert the affected
ASoC drivers to use it, removing the manual release calls and any wrapper
devres actions.

Changes since v1: https://lore.kernel.org/lkml/20260703193855.110619-2-mukesh.ojha@oss.qualcomm.com/
 - Carried review tag.
 - Rebased it.

Mukesh Ojha (12):
  ASoC: mediatek: mt8192: Use devm_of_reserved_mem_device_init()
  ASoC: mediatek: mt8196: Use devm_of_reserved_mem_device_init()
  ASoC: mediatek: mt8183: Use devm_of_reserved_mem_device_init()
  ASoC: mediatek: mt8189: Use devm_of_reserved_mem_device_init()
  ASoC: cix-ipbloq: Use devm_of_reserved_mem_device_init()
  ASoC: mediatek: mt8173: Use devm_of_reserved_mem_device_init()
  ASoC: mediatek: mt8186: Use devm_of_reserved_mem_device_init()
  ASoC: mediatek: mt8188: Use devm_of_reserved_mem_device_init()
  ASoC: mediatek: mt8195: Use devm_of_reserved_mem_device_init()
  ASoC: SOF: mediatek: mt8186: Use devm_of_reserved_mem_device_init()
  ASoC: SOF: mediatek: mt8195: Use devm_of_reserved_mem_device_init()
  ASoC: sprd: Use devm_of_reserved_mem_device_init()

 sound/soc/mediatek/mt8192/mt8192-afe-pcm.c | 11 +----------
 sound/soc/mediatek/mt8196/mt8196-afe-pcm.c | 14 ++------------
 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c | 13 +------------
 sound/soc/mediatek/mt8189/mt8189-afe-pcm.c | 16 ++--------------
 sound/hda/controllers/cix-ipbloq.c         |  2 +-
 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c |  2 +-
 sound/soc/mediatek/mt8186/mt8186-afe-pcm.c |  2 +-
 sound/soc/mediatek/mt8188/mt8188-afe-pcm.c |  2 +-
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c |  2 +-
 sound/soc/sof/mediatek/mt8186/mt8186.c     |  2 +-
 sound/soc/sof/mediatek/mt8195/mt8195.c     |  2 +-
 sound/soc/sprd/sprd-pcm-dma.c             |  3 +--
 12 files changed, 12 insertions(+), 71 deletions(-)

--
2.34.1
