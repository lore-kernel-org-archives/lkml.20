Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A02CE4AEBF7
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 19:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788378469; cv=none; b=ilB5HATg2f95gM6L5qFInJkbKbC5kCSI+RMU7Hzj0OQW8iO9Qy5GBOtSwhMrmOVKTBRO4QQ+u7SswxTeTmJnqzYBQFsJvQobg2p48N7kJNaVf9cJ8QwiWGVst35GEFRU6iMDE+ohmoosF+qUSa26/sWA/sJ/86+tMtSmGPI4rHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788378469; c=relaxed/simple;
	bh=8IJgnYMH8lZGxQI7mdW1WzUt8n14n2OLz6T+fV/tmC4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I5N9ghbAyLHBLcep3wNy3GKu8gj8QchfKN71v+jvCWXd1QIgh3NifpeDuHEFkYkBQ/GxTefhwWad8O6FAngijiV023wkCOeLkMgSlx7+snfZsNW/uNBQorbYJM0Si6512dSKXUaNQLL+9jayrfU2imc0CVmsZWVBTDAoqRr2nmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mUvxqWw4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hGLEy5/4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mUvxqWw4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hGLEy5/4"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682Hr0bU2209688
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 19:47:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=i7IUo5ODu1Q
	vw9BB74gz8i0GZ3EQa2sp7V1MaY9r7c0=; b=mUvxqWw4oJGdn61l8WtLkN5uIbC
	pOe3XUIGU7bNwqp8UilUWssgk7nvV7vFxGa8NGyg4XbgnGg3Cyr8ZxunqeYhQ8+f
	TCiZjQMM60U6inCxKvFki6V3rZcNiuqzMAmYJBCJ8GXJCs7/+yunwXADfqiZPLlC
	NQqHTfMpTn3DYqAPCrQq7UawxehowYfaIMMqCReJix0QfXobob3YqJOQhcuoxQSp
	S7RjP/hXbrwfZGQm65rspmTNcr6wbpkCMgFkDIA37V4GWfIjv4g5g3RwYdZxY9dF
	vyqcJC/0j0ItsF+Xf91mfl/pzHyIEh//JF9RYLhGRR0tsDBpwI2Wa5g/KEw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gepv5s1kc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 19:47:41 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e1118e4abso2863169a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 12:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788378461; x=1788983261; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i7IUo5ODu1Qvw9BB74gz8i0GZ3EQa2sp7V1MaY9r7c0=;
        b=hGLEy5/4zpZCi1I/P20G3JDa7QeS+qKk/mRjstg+/jMNf3O/Kv83i/yLIwM+0xZfre
         9Kc3nRxNfmTXF6R5EMUQ1Zl9BZt4KPcegjMu/sW4VI8ZDEFHxfkkRiIJxICbJopbSzOm
         fadf22ym1IAIaDl+9s8xScZA8A+8yW1Ws3WPGhahYFUmRe61zlW4UBAtLnQf8K26wAPu
         a1xxEq4A4Yo5EYmK4AD5jn6sYP3eBn/PWlyXGr4RAa+Ij/A3fZ+WXlC6ceaCtJxN7oBN
         LCYJixSQaign/HfCC7l6okGhsY5iUHiZC+yj5qkC4MDHJKuSEEfDgQuYQDUCYeICqc9q
         7CVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788378461; x=1788983261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i7IUo5ODu1Qvw9BB74gz8i0GZ3EQa2sp7V1MaY9r7c0=;
        b=tYw29LphCLr81Y+LCc9PxSJ9wNCM0vxSXwyz59oJAWb6ZUQUMZDULA0yiwOx1ZtVJn
         21nm2S5K2zIyAQvsLzchtgbSphSCVJbCeKl7t3hrOiIM3fsokV+Zm200SjYDwp9vuf6l
         OTv9Juq+mob9a8jAIr7pzvd6tlTqwAxf9wZO/VQQ1tjMib+TMdLLotq1dlRLnfoSsT/x
         hDvNseurTo6Cy3HzbNsuVuqxd596M8xryxxZT0EAfTZeBqudwxk6FMqLPOaGXZjLEVha
         ndl7ZV6DJMpd6EcfZoc7IlybVMIWA2Zp8ZI4DY7k8KexwJjxih361aEA+YuRa39wqJ3+
         jiyQ==
X-Forwarded-Encrypted: i=1; AKwUvBwszdpv9hx2z9WqaWgkav/ZkhvUa6WVtQpKyl+a+wwF8AivW+bhj1bqrFoE4sRKwEf/4gW82fQTpHDnVu4=@vger.kernel.org
X-Gm-Message-State: AFuF++nBkWvc+G5FlFm4fvSc4O3xc2uYa5GPmpb4OVEyWgA7Pd7OcVKI
	hFDpoDTQf0d0cBtUYHUfKrnLwCxhQaeIAwBToaDLv5yVNe5jPo4lx6dpMDZHbJ3mHkfh3cvvhCY
	Vl1pfWSwJ1yU5bydAPw0kjnu9wY7H0hCPmSRO1MXklPKRvCohKtFJW9cTHeukIQA2WSI=
X-Gm-Gg: AYBFou1biKIHvWMSBndWwGabYLSfFCJGZxSFNnXWiqKTeKmtB3jnNrHfS/DXVBgEZwK
	6HhoKSh9dareFcbIgXR73kyquHa7ZoDJy01J0/uxOtFANZOIzXLc73e+3Xm9lCIQa5+aYz32/gz
	jhGu01OyPLRLRWaDKmWikmDOI36TOeGZYKP627v6mzYzrXq7RsFcltzy/TLQ0IerChvz8EYxHGy
	NtgfkYXJN/CRo61H8X5wN7xia07PWFRYdqT0O8GNFvX3hMLUt/dgzmsGwbZfaMAuP8vtup0yFHa
	shEMwlAufMGCbVLv2//4FhdkT1x8PG0jfipoMSRGNNQ87YOHxNAKQP5Swv3UqLyNsWyOzvaB8c+
	54IMsfyCoAedSUUOhYYIM8Gn5V8s=
X-Received: by 2002:a17:90b:3949:b0:398:9c00:29ee with SMTP id 98e67ed59e1d1-39aee208a63mr11569144a91.22.1788378460846;
        Wed, 02 Sep 2026 12:47:40 -0700 (PDT)
X-Received: by 2002:a17:90b:3949:b0:398:9c00:29ee with SMTP id 98e67ed59e1d1-39aee208a63mr11569098a91.22.1788378460471;
        Wed, 02 Sep 2026 12:47:40 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3325641b4dcsm307065eec.26.2026.09.02.12.47.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:47:40 -0700 (PDT)
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
Subject: [PATCH v2 2/12] ASoC: mediatek: mt8196: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:17:02 +0530
Message-ID: <20260902194712.2003414-3-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902194712.2003414-1-mukesh.ojha@oss.qualcomm.com>
References: <20260902194712.2003414-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=T8y8ifKQ c=1 sm=1 tr=0 ts=6a987d5d cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=2Epw-RBMujpMcR55kOQA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: 3VWxIa-L19T13jE_n_1YZwMljj7uiECd
X-Proofpoint-ORIG-GUID: 3VWxIa-L19T13jE_n_1YZwMljj7uiECd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3NSBTYWx0ZWRfX2g4/3QbGaZ7m
 Eg9vHvPYYFpqFABP+MWocS/DK2aDHrLNkRWsuuYntAk9E7BzzHi0UrlBVGMUBOD5qnYvKyuqBrG
 asuDUQSw/839/1298WQhE61GhL5yZhJOpe6GQmVVtXDhoZSaKP6TRvKw1RTPKvWzUcheWr5zA9x
 JE80hPG9G7iEx8wEasOiKHskQm5kcqzHksp/xSwB941GJx9x62/3nZVt6KuUe94IfvArrg4VNPw
 Wy9SjLykACAmrpq+dEj7WOppDYXaTjtremaxqEmfRxxUwvU/snMuTOXQ98LyJ2vUwkV5M8K9EuZ
 pbCHUCB/sWg1inDbPU6CHGakjTwQNl2Rau/a3slS72pQUmhrrzGlJpobvLgJ11ae7Y7F6ZoB/N8
 akejT9oYMICACXisJik1pZgVrJFmV2UeFcXLhdqmdGeqeQqdRylWpWg5eciXDYrvuemLF3wgkTA
 zoVgiPhbShZM48UEKqw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3NSBTYWx0ZWRfX0/URNSl/vjOz
 g38zHoK6eTJjKz26vZ4gwBXs73nXC3DJTsuzLFKkQOxt6IHTPYxDifhLvIqKsc+/Rwmy01gXBM2
 OPNRN20EJRo0bewBEVUyFkpZSFVpXZg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0 spamscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020175

Replace the hand-rolled devm wrapper (mt8196_afe_release_reserved_mem +
devm_add_action_or_reset) with the standard
devm_of_reserved_mem_device_init(), letting the device resource manager
handle cleanup automatically.

Acked-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 sound/soc/mediatek/mt8196/mt8196-afe-pcm.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c b/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c
index a1ae8322d8b6..dcee037991aa 100644
--- a/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c
+++ b/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c
@@ -2309,11 +2309,6 @@ static const struct reg_sequence mt8196_cg_patch[] = {
 	{ AUDIO_TOP_CON4, 0x361c },
 };
 
-static void mt8196_afe_release_reserved_mem(void *data)
-{
-	of_reserved_mem_device_release(data);
-}
-
 static int mt8196_afe_pcm_dev_probe(struct platform_device *pdev)
 {
 	int ret, i;
@@ -2327,14 +2322,9 @@ static int mt8196_afe_pcm_dev_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = of_reserved_mem_device_init(dev);
-	if (ret) {
+	ret = devm_of_reserved_mem_device_init(dev);
+	if (ret)
 		dev_err(dev, "failed to assign memory region: %d\n", ret);
-	} else {
-		ret = devm_add_action_or_reset(dev, mt8196_afe_release_reserved_mem, dev);
-		if (ret)
-			return ret;
-	}
 
 	afe = devm_kzalloc(dev, sizeof(*afe), GFP_KERNEL);
 	if (!afe)
-- 
2.55.0

