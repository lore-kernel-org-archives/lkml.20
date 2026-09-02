Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D1214A9D79
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 19:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788378534; cv=none; b=aYb8Hc5FjiOr7Ik4g4wjpynPfks8PtbbJVAi2BlJ9diBtFfBc4Rn1rbrYgSfVIXx53Ts1xvKSTEpiJ0Y6NaZxt7yzdVhR21a3vjBGZuGDqSb36/gOweU8nVTEFTiQ60nh4L62gPIVI+l/uMDEdvD0wpmPmBP+wIIbzsph/eGgAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788378534; c=relaxed/simple;
	bh=I/Oc1aiwmb8sWO94Gb5pznov41xAVJ2kLYVBE2Uv0Qg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t8ZyVqwfMuJqn/lisJPgd6adVzMzBb/YMQTw4QBJa8LCbSjOs/QgpSinQtKP/LyidPX8TLjv/SCG7z3LtfJSnN/m/2mPGuZ484GHq55r9ghFyDXhwYW3KhQs58BKqpjjXbeE+9/RBPVq5LAY/Oej3qYXjG1fAycvc0/RXJK6mNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d1rc4QZf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JmCQ2CsW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d1rc4QZf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JmCQ2CsW"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682HqotS3377497
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 19:48:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xvdccM5K3gM
	HO/yLeeCZ5Ga5q1tP6nu5T3vLTzKGCN0=; b=d1rc4QZfbIpAUfa1/Cg076ioPXC
	9otIlrXV74HApsxHAcBY65egjvSUZJ/XP+wbHGPZwLWMXrC5yaKXnKjN2cFyoqav
	Sf4AXwMLW0O6E5sQw6/08LRTjVKzxOYQTqvoMfaZq64gpoXjwd34laxqaHWWOgAM
	LJ8h+PpWbylqr4FFwwAqXHdLtnkSGgXILjy3MW0mS4xSlwDjptnTky0IN6jPrhX0
	rQ4F+mI/oOFtQ0pid7mvmomP7JlWgZTvJlMdfqg0LOgUYZNRi6wG53KthQobriFg
	SVSMsN0azSxNW540JH546nB3BLb6X1E3zj26zSlu2ho81OngCUkVlvQ9mYQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4genrnhdvk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 19:48:41 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39af92138f9so392650a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 12:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788378520; x=1788983320; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xvdccM5K3gMHO/yLeeCZ5Ga5q1tP6nu5T3vLTzKGCN0=;
        b=JmCQ2CsWahpK/SokfVTl5uZDixaZ3PotRct0LNmKI3PNNufKNsGerNNfuHgWaCl+JK
         TI9gzDKYduqMIq8bnF6Y0y5QCK/zK3giFmUhcrwYIGgjh6CoktdgOeIhq7FCj/mwhBxu
         rTl13ZMUbrsZVllSjv1eaZOGqeksdEXc9Nz5ftU2bCZEU4laTBhmeJK0mi9uYqVZuH6w
         w8z+LN7igVmyrYxIUklCH5hvnzPeXSgf6QBt63yIXwrYagNRX/WnkNWPi287IuyFz32Z
         ZjRxs+hdIyzug9KEOax1eA78ND4jSdsv7mUVwmNbLCr5CyJkQ5fRj42UnoRttXjJTLiv
         yhyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788378520; x=1788983320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xvdccM5K3gMHO/yLeeCZ5Ga5q1tP6nu5T3vLTzKGCN0=;
        b=T39NKvj1uY1tfXW34tWIDUt1tRc2/1srQbf0HQxKt2z+yLmQUGVdL2Sd9J7yHhjJVy
         Spz/uHq38EVvFZ5sSKZMVCEkrHTqc9xZqTQrRKFSeHqb46mHF+TU13d9mTX6uA2uC4Ji
         o0a0Gxb9Bp9A5COCSeiIe3fiPMHTnIY7jUahQX4sUjVwXsmuv+Ltxn6ctEowYFT+AR5B
         yBC7Mysy1aiJfi+isTeV+iE0bvY4XJ7bQguzJunMSiM0TiDY5JrgSl8L3tXMewpJqzfa
         B2qikKJUNHvUyOpFm4qE9/MjF3TKFTJhH5r7CKz1Ps99hlkdUCiW0t0/r9WZ5vYeOgt7
         hfvw==
X-Forwarded-Encrypted: i=1; AKwUvBx4A7kSz+tGY+GgEqUkv0YcJW6ccOOq3L6C5jdLISMGqq/sQlNAqke5d+qriYcPp8yMDMbwdBpX5CaCa6k=@vger.kernel.org
X-Gm-Message-State: AFuF++kr5QmRZ5ATFFyTLnMg7DKG16ZRgbUrk/UeNRk0ROFkf9L8am4/
	CXd71w1l67TEwTigmKqUv47BcczNWhxxRXGP7GRWF9IiiC7qzbnwuSYG2iBVbtf7b9LSk7KIKMY
	vsnoO6mJAdICuvD7ot6FMfWZugDrb1V749x1VsLpjY1+9p3jIu1ByCGmkqyrKwPurnE0=
X-Gm-Gg: AYBFou3Lo48Neiy0q6epDrXjwKD/EQE91QqDZD9/RiCftRH87V5Yar1kq1mboS+eGXU
	7tMlJIjNUriFE1AdWiU5mtwO/bgJmtS0D8RMRO3m9ieR+7pb1pk1bvIBH/d3NxgTI0ijSYU821l
	6KtnabrC6RFjOzcJWV/hA4H4tj0S91My6OVhIF4hGjZTBBPKrKnOZ3QreNUMoPaPYFbxg9ZHkMb
	H/Hdp2U5oIUTK86oibDYExRu3KOTJ8QnabYUFsZ1Q1D9ihhkOoHDxH/ac2Y50RWZcUGUqKPTRiX
	rCr23RykoC4rsLe7QDGuGC4MVZjB26oKIkuARMEdXiKc/2j/pGpKmhzIlZVSrjsCWPKOvyq0adU
	Z+MT8a2c7PWOjxZDBRJmB2Cl7LMI=
X-Received: by 2002:a17:90a:ec84:b0:36b:b903:994 with SMTP id 98e67ed59e1d1-39b07f44dbdmr1560742a91.4.1788378520406;
        Wed, 02 Sep 2026 12:48:40 -0700 (PDT)
X-Received: by 2002:a17:90a:ec84:b0:36b:b903:994 with SMTP id 98e67ed59e1d1-39b07f44dbdmr1560695a91.4.1788378519784;
        Wed, 02 Sep 2026 12:48:39 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3325641b4dcsm307065eec.26.2026.09.02.12.48.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:48:39 -0700 (PDT)
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
Subject: [PATCH v2 10/12] ASoC: SOF: mediatek: mt8186: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:17:10 +0530
Message-ID: <20260902194712.2003414-11-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-GUID: i0oIeByhwkrvXARdyk8jn5F3ah9uH2QC
X-Proofpoint-ORIG-GUID: i0oIeByhwkrvXARdyk8jn5F3ah9uH2QC
X-Authority-Analysis: v=2.4 cv=YKuvDxGx c=1 sm=1 tr=0 ts=6a987d99 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=YxFYfaw6DuWYmsw8bRUA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3NSBTYWx0ZWRfX+ZKlLf3mCi4X
 Xg2QQUzJZSlslZnnOSReNXmX1fs4XQU1kL/Nln6eiy/ydBHK5J96PE2Jxe/a25SLdPtXJbwiYBm
 TAUrzOO2x/ecvubYsWIPIeZx9YFPnTdjRCm3zwKhlgbdUHQngPReSU0YvzNjXfU99/YsSeAhsrB
 vc5jkxnXrQW8hngelm50ED+Vr8AMba7gU+5i8H8TLf8DhLupP2yyTVGq+5LVpU6kCBFVzwqrolc
 ZMhjHLi9PfVRHE3V7GB7u7GyoAW6bLRss7Ct+8nx2QemcCwsN1wk7iUOv8mFCKMRA2u++nO6PZa
 fTJzw7t4kz4a7ZY8YoAtv2F5MNP6c7sjTsyYQA58ncmaBXVtisSpA+/H7/rG3ZIRXFSfwtQCxEV
 1lC7QVxNQohrh5tDY6jYI1bJBlUAn+3+91poGQ+BVZyEHwOSOYpPpKg+0jHYStI0CTyexuV2Gwf
 Amja0jvgLeNdIIykvNA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3NSBTYWx0ZWRfXyqs4ste38dE3
 opGoQehXC2jLinMDw9hr4OCpuJ+I6xg5dao4yfkSim516KVFUknODZp7qMJRsMmbp3KMWWAvB7J
 Fs1Xn48UFdijc6O5KmvZklsz9CPUkpg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020175

Use the devres-managed devm_of_reserved_mem_device_init() to ensure
the reserved memory region is released on device removal, fixing a
missing cleanup in the original code.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 sound/soc/sof/mediatek/mt8186/mt8186.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/mediatek/mt8186/mt8186.c b/sound/soc/sof/mediatek/mt8186/mt8186.c
index c1bea967737d..a5ccee87e684 100644
--- a/sound/soc/sof/mediatek/mt8186/mt8186.c
+++ b/sound/soc/sof/mediatek/mt8186/mt8186.c
@@ -49,7 +49,7 @@ static int platform_parse_resource(struct platform_device *pdev, void *data)
 	struct mtk_adsp_chip_info *adsp = data;
 	int ret;
 
-	ret = of_reserved_mem_device_init(dev);
+	ret = devm_of_reserved_mem_device_init(dev);
 	if (ret) {
 		dev_err(dev, "of_reserved_mem_device_init failed\n");
 		return ret;
-- 
2.55.0

