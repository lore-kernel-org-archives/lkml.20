Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792505865;
	b=Z9eR+E0n04F7DrRPUROKrGHJu0C0EdpMdbf7iUe1UPuAxdG9Ji8LzYsm2hFX25MVHSq7
	 zt24zfP/E1QK61usuwLYwibYVjXHLcs5BQXWtB6Vy8Ebd/T/D3YrbvkIc5hkRwqkvFzBJ
	 VZU8363/T17724ZO9BQkqnsAbdpC6PFKwkGwmft/JccBCw34oxfAwaO7xQQGpGocLKsvm
	 c50kkDP8WEhrPa5uYIXb3rcZfbLS1r1BKYTyGkBnD96hLQgTaQMMVbh450/G75xw5EnzU
	 OirVBU49SsqCyq5Qrfnq/QvCbHkOSciMUjTIYc0S5xBRAMn2vQuPpCyLHh18Uu3I6LA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792505865;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=8J4j0djyVVFC/C1z8k5Rma/HbptDjpjZS/vt1pUoijY=;
	b=imco2YJbJz7R70y+2wfot7J/uZXCxD4RJgiwNczcamK3TI9fe7bVbdVDB0hP/TKdcfR1
	 26nX0CcrDtRuFKuEIXurF+7+k/SC2rCDGxv2mEk+Qn1hyrSG97eSoAfF1mvWxK9Sr0lIZ
	 hhNeyU8r60UjRg59jYGkMSLqQyyeJ4Yso/4NWB9ceHs/ymQ00mkbIb9B3MxZE7+n8GoWY
	 ap5NakGgROpVFMI1FlvF7IYYdo0VJQfxwItk+k4X11mCowC6nLjKX92eMsC6k0nUNxaXH
	 CMpTY5dXgf9Zmu4kupBx+1t1GGlJYOOqMrSQh8/5FJDStmNa7Q36guZoiJAVwdL3w+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O1u6Asj4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ddGIWJET;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F1F1606AA30
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 14:17:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F1F1606AA30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O1u6Asj4;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ddGIWJET
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KD9oIX2845507
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 14:17:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=8J4j0djyVVF
	C/C1z8k5Rma/HbptDjpjZS/vt1pUoijY=; b=O1u6Asj471qzv8lGc4di8WmrEup
	+DJtLvvwD5gLoCj0Kfqmwnbvj3SUqfuDtfGq5rWZaSa66O9VGQ8X4SmJHkSiJYcd
	2Tq9bPtyIAW/W6XskJSCNhA1aEivFnqcx3B1Aji9aLbEtoMOyeoz1J2YoZsKxlOL
	F1Zb+KQAlT3+xZT5TPU/oXEi09LqG8zy/klXnsdRHnRI2bsS9ywkeZn7fzIMfloQ
	P1K/NN71OHE5VlZE5//45yBAQcPTWFLp8zqo8sUUB3P+EzH5DMwgyN4d679N0pus
	LJhb/IiXkgx9RGeS7LIbvn+NYcRWjO0cHZhPb8PudVNbMUopp8DLb4sGcbw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5natmj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 14:17:44 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cb7f9bb86so673959085a.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792505863; x=1793110663; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8J4j0djyVVFC/C1z8k5Rma/HbptDjpjZS/vt1pUoijY=;
        b=ddGIWJETNQFthIxSzn2N3N2WfFqv+i88vyUWS0dMV19iOkGaKwOk1dbhrnNDuxkt53
         6IcaTmkqKTWm/8og2TNRPTsGkO/Rsq/F5JKAGvzm7WhC7QeqXVOnJESMWNazLoOzCv85
         lsVo+vO5ZCvIg606qksG/GXIGPA6l2bmgOg5NNXZiMeE+Zkxi1Tf6fFfEJ0EpUABL/1H
         l+xeLjQjcTFx1/jwREAiKPZ9P0f/p3WDepd6S89/Ujp30c7sdmrn1sp/q4t93cviB7Kk
         dMdGwG0lp/sW/B/HZBYt8B9jVbkspQdLBohl0194IF9+j8USpJxQb2TO/DIDEhNPQ1kg
         2gtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792505863; x=1793110663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8J4j0djyVVFC/C1z8k5Rma/HbptDjpjZS/vt1pUoijY=;
        b=R+dJ3jQrssSuG8z5r/3Zw6Ti17c2EtyV9+qZzIUVzxMBKPnIJTfKPrRj0g5n91d4TP
         7v3jf+uX1Sqgj60/75QfmlIVO6/ELFz277BZVDXwhnVaDHyT1K7DKuMP0n/4jb1f333B
         L4Mlv/inDDBkwKfKUSQLqhf2VjnmmlF83cd2dvhB7rZ6/PDSRtYIo/vx3f7ACyfygLNP
         edeitziD5yorYEZz5VY0rdYLMaHlvespOVYAekdwqQaOn+k/TuhpMmYZDnz9P8RaFRlZ
         1PbMgWXUZB9xbFxjPNJbqMHhUP3QxDTaFrG4lDelAJo9zPYyL6SCaCTPkN8aobMu0yJW
         oS+w==
X-Forwarded-Encrypted: i=1; AKwUvByIZryPez72lfJT7HVefAvF3cZOJ956mk1av2A7+Tb7LvBMJXh6kSK5skcyHuRynysrmzbDzf8wMSNkb3o=@vger.kernel.org
X-Gm-Message-State: AFq9FYJAWp7V0UbhXtAlRXNZxj6xbGwwGmsfuk+hZ01QU98x7176SDzW
	TLw5pPds5ziGqB8WtwqVP9lLtyBpVjOOE6dzHITyqeK67vH4PZCpSYgatarK3qbnDnbeGX/CJ/3
	QVUOLBtSn8OX6dIzBsYKdk3aie+78P3F5RS7DYSflgOMiUB2/HNfJZCOjChpK+1eKavc=
X-Gm-Gg: AYBFou28blVM2j0YKOM/IsmtivqgYxZsUsgK0Edl6IqASAvfDYi6KnQzx2h5looHquz
	enhGsaaEr9JEkSe7SegE+uzF7hrhXKazZdup4d4cpilfCEy0WcKLbFWXxXwG8gcoVVxE2EYBmko
	4X/OxMbJJo6ffo5bQT1XYXZB3okEz5Jx07kUdIyCF96aJrW7L9SaMuyJYBdjBGo57KnPRmV5reF
	bEvLbawxhUKvUtLmBFzxojDh96ksn/9ORwo2GIcssWVwgIeGjMyyhDqg6LD0F9R0z5NAevhvR8W
	T1F9BykBWvhlfl5IdsWGMt5rbWPD2Qi0kBx494IEwUOo/4y7P43kBQs6RBrXJ5UqgF1yJQ0Pz4D
	rpu4mUOfI/3spBrpJ3/2yT0jxqyM=
X-Received: by 2002:a05:620a:19a5:b0:93e:b0c3:388d with SMTP id af79cd13be357-93f29b7f65cmr1936804485a.11.1792505863343;
        Tue, 20 Oct 2026 07:17:43 -0700 (PDT)
X-Received: by 2002:a05:620a:19a5:b0:93e:b0c3:388d with SMTP id af79cd13be357-93f29b7f65cmr1936767785a.11.1792505860129;
        Tue, 20 Oct 2026 07:17:40 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:4884:6e9a:d9ff:9fa6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d810043sm6642276f8f.16.2026.10.20.07.17.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 07:17:39 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: rafael@kernel.org
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>, Shuah Khan <shuah@kernel.org>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: [PATCH v3 3/6] powercap: dtpm: Remove duplicate RK3399 CPU hierarchy nodes
Date: Tue, 20 Oct 2026 16:16:53 +0200
Message-ID: <38f5964cadd33f8b03afaf9ff740653258367d72.1792504834.git.daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1792504834.git.daniel.lezcano@oss.qualcomm.com>
References: <cover.1792504834.git.daniel.lezcano@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: BNHeZUM3kcHdVn9qVwJeelSUb4d5jztc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1NiBTYWx0ZWRfX9hvtNAq4bGAk
 N5FuSA9XiCbQbS94aiDiQqkB8cPJovWQeUZcKVxN0JKbkoI5s90oHuywf9Yk3sacynlHze/PfCm
 V/c14i8bLNLTOSN+DXGR8M06ZhD8E6TZgdRvAwRTFGzsLZl9OxFsQndbYagPFP9XshBDqH1Jooh
 ZDT6GoNUVPOcD6gVN5XM1pugUwYsLsLk2janQs/yu8fWu3LYO5Wwra5QKSQ8MwKO0CDVZstad0G
 UXNTH7jfOUf2j5JbyMmOL6ooAJvoz6fB4wYD0Y6yJ/uoAmTbUTKGbubxcY519d23lLrEk80y6OK
 0c18OiER7OtYKb1IkJIpRvzcf4jQ+VNOtsZHTLvYMKfPz3Xr9s34kdKfxksY+oBORzMddSk2C9c
 L+m8VZW6RiYBpqEuhIfNE1fO7CoOcXKt/OyQ6RRPtygOTlApGitjFDPlbRQRtY46ErtQyPIlFkl
 Cp5i7/Rnj9FUYv8OZ6A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1NiBTYWx0ZWRfX41ZEmDmtbweo
 ajkvdXpOCS7fecMQI6kleMe2MywMIE+Hn0jDJrDflbjHEAijGlvdHezYgn5hh6LEGNxKqNrsIQY
 9uA0i/hywyPDF0qdWLC1WWlAIVhIzyM=
X-Authority-Analysis: v=2.4 cv=VI9IDNPX c=1 sm=1 tr=0 ts=6ad77808 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=EpzjDTW3ywHV2UopgxgA:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: BNHeZUM3kcHdVn9qVwJeelSUb4d5jztc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200056

The DTPM CPU backend registers one powercap zone per cpufreq policy,
not per CPU. On RK3399, CPUs sharing the same cpufreq policy therefore
map to the same DTPM zone.

Remove the redundant CPU nodes from the RK3399 hierarchy and keep only
one CPU node per cpufreq policy. The backend already suppresses duplicate
registration through its per-CPU state, so the removed entries are
redundant descriptions of the same zones. Keep both CPU policy domains
and the GPU in the hierarchy, preparing for one created zone per generic
hierarchy node.

Also fix indentation in the Rockchip device match table.

Assisted-by: LLM
Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
Changes in v3 (since v2):
- Rebase on v7.3-rc7.
- Fix Rockchip match-table indentation here rather than in patch 1.
- Clarify that the existing backend suppresses duplicate registration.
- Add Assisted-by attribution.

 drivers/soc/rockchip/dtpm.c | 22 +++++-----------------
 1 file changed, 5 insertions(+), 17 deletions(-)

diff --git a/drivers/soc/rockchip/dtpm.c b/drivers/soc/rockchip/dtpm.c
index b36d4f752c30..e71f315fbb6b 100644
--- a/drivers/soc/rockchip/dtpm.c
+++ b/drivers/soc/rockchip/dtpm.c
@@ -20,30 +20,18 @@ static struct dtpm_node __initdata rk3399_hierarchy[] = {
 	[2] = { .name = "/cpus/cpu@0",
 		.type = DTPM_NODE_DT,
 		.parent = &rk3399_hierarchy[1] },
-	[3] = { .name = "/cpus/cpu@1",
+	[3] = { .name = "/cpus/cpu@100",
 		.type = DTPM_NODE_DT,
 		.parent = &rk3399_hierarchy[1] },
-	[4] = { .name = "/cpus/cpu@2",
+	[4] = { .name = "/gpu@ff9a0000",
 		.type = DTPM_NODE_DT,
 		.parent = &rk3399_hierarchy[1] },
-	[5] = { .name = "/cpus/cpu@3",
-		.type = DTPM_NODE_DT,
-		.parent = &rk3399_hierarchy[1] },
-	[6] = { .name = "/cpus/cpu@100",
-		.type = DTPM_NODE_DT,
-		.parent = &rk3399_hierarchy[1] },
-	[7] = { .name = "/cpus/cpu@101",
-		.type = DTPM_NODE_DT,
-		.parent = &rk3399_hierarchy[1] },
-	[8] = { .name = "/gpu@ff9a0000",
-		.type = DTPM_NODE_DT,
-		.parent = &rk3399_hierarchy[1] },
-	[9] = { /* sentinel */ }
+	[5] = { /* sentinel */ }
 };
 
 static struct of_device_id __initdata rockchip_dtpm_match_table[] = {
-        { .compatible = "rockchip,rk3399", .data = rk3399_hierarchy },
-        {},
+	{ .compatible = "rockchip,rk3399", .data = rk3399_hierarchy },
+	{},
 };
 
 static int __init rockchip_dtpm_init(void)
-- 
2.43.0

