Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792505866;
	b=BiEtPhZl8gNUD5kVYvGD2sCSsBuBSyo4Mpou9VgEmsFzqypInKDihEyLAHKjY+1EbZms
	 v34hK2Mh7HffUz5MxIazDrYBpVc9XLXMsqTP3u09RsJOWYdYL1KnI4TinAa7HuWwrg61R
	 09OejGL4BaZJyZ4zQOhJLqpeKhxtYPnJPbcsFFwVJ+e2qn3cchFWGHB9/iW7cIdUl5BkK
	 4iqFhJzVxtviL92I65DDSF12twyWY4PSXmTXzIFuADOjw+fPBag9Zf2DiH0hVe6wzYu3u
	 mCpZ2fmLlfQBZdJD5MdmQpK7S6bmr3isqTErz7a/gZhrWzjOWvkmUCcTF2z019d200Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792505866;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=uXpc2QWgMGXBiYzG6BvVA2zeICE/TGbAAGJgn9nSWvw=;
	b=FLuAlUvyRrau8lKQ429hHNbONe1QPWVnEmhqoyGaQwIlab2XcIhiZOHClomVNvabiJQI
	 1YNb4mbVO/Ll7IeJcWw6qBuGc0sM0T5UCxCZ059RR9CBvKRljNIPX6Y2KsJjAHKwGzdCG
	 594nwyBgkzSQQnukpqRpDE8Psa2Vqje/nfREw5jtD944+Zc0wy8iPek4ngobvOm+yyCmT
	 Y67rgbcsTKRYeZBd1gMju5FvCbfKoDh/PGxXn/8qgtpCTr6EgxtuFO8IBkWXX5wURclpO
	 f9sZd/aoOOXwoPmIZkbQ4xFOUUw5Ri35LTCWhd0AgOsPN6TOvzXK5O7UW3HeuoJpppw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U2eK5zmx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S1I68N5Y;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5334260A5BDC
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 14:17:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5334260A5BDC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U2eK5zmx;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S1I68N5Y
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KDA2Tb1209384
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 14:17:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=uXpc2QWgMGX
	BiYzG6BvVA2zeICE/TGbAAGJgn9nSWvw=; b=U2eK5zmxQX3gkfz5ViE8MyntVu/
	GrSSZFnWeIMrCaS3S4TNkmw8V9udeZu2ZINdcXicQRI4p5I+b8jApPKP/kI1N0Wt
	gq0Fwp+6bvT1L7tz8n2cQ8/loJ7m4UBYudoWcyCK+sbYmga8N+y2DqtUdAs1cczu
	MyWN8Vq5G3I/uvesRwwR19+5LvEvXMPrdUTC3B4vyl3IC/oqkc91xmrBaxQWLAKY
	boNvwdCkAqTeHn1JDDDatQ/WFw1/n+1CNP7Q7DAMbEHuAs8MfmWMkUbd2q8k2IJ0
	570lUYY/3oV6qHnGFV9aE2kXqmC8MWyLIIol/1jDn96t16EvY1mn1bxC2og==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5pav0n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 14:17:45 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f33438950so854210285a.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792505865; x=1793110665; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uXpc2QWgMGXBiYzG6BvVA2zeICE/TGbAAGJgn9nSWvw=;
        b=S1I68N5YttxClaGAJfaIDKSu8LpoDfbrTw2Qyc+SXqwYdgawznxCImJYAXdW/zlTRu
         LEB9urQwB2bC6gfLZets46Hf37lV+9JnzLfGJ5NLpuiyapEcjw0HrLxRWD5yoymxV0oR
         moS6OWTbFr2+2JLHhFLCstwuAgsA+5emeHoQCCXF9dhuoAeshpLsK0LypDhgQOazIncu
         jD9kSww7ZIjUcC95tWCpJ0vh7xLFWCFPgHUehEAgIgtn1J6HRPXRQCVDLbVsza2bUo6B
         kSuYgu6Mj6bOnBUylZUS+Id1iZW23SZG1qIRwPpIY52cJxYtGn2npQ2JRZQ6nc/w4LgN
         +mOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792505865; x=1793110665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uXpc2QWgMGXBiYzG6BvVA2zeICE/TGbAAGJgn9nSWvw=;
        b=hjzQHKI8Pnoao6/ktb6APbLrqboBAUQAFuRw8zt3fpp26V+UIVYIAjiCUJGluEzh2j
         cs8tSRlPPmaqkuWHsV1Ue27bmGs6pB+/qq7s5Ier/LZ4lKzmeM0prVVSgppGVBUV+GGY
         HRITwQewxGrcnpeezvV95fAgoA0mskQYBtIYnbmCsepIf50empXliNI88JkjnibCaV/h
         z4YnZuxvaBi7mJd3vdiKj8oaq1ijnn35QqHrulxLHFcKgUd0UOT+6lvNMHJ1Cf5CWxZP
         Y2nqq0iaQBDQkLOjRYarFEoTKjR67aUlDlDlu1KXEBoijlry+AOKoJ0hFNJKn0m2FpNL
         2cJw==
X-Forwarded-Encrypted: i=1; AKwUvBzRttshylztSon4O+N6POQj5LzcRAqPxouV4A8EJ8Umny/YVMsFGQyhjXw6oDfm4GC94k1n7x+1mwFv0uU=@vger.kernel.org
X-Gm-Message-State: AFq9FYI1z1B7Lq7tH/yrlpQB+HSaX5ZmqKY5ulevny/sLeXmbY9MrKwb
	h+l05X/Me/hpN3qgE9sLbpmDCH0YUX7BMg8rURNfwTh8pd10d2SMBRvbmpFYjzKeu569Na0yAEX
	U94TVuxfctIPMlyDstIOGHltko/6ShM0wjV76G/SsXyloQBrVz94oyjX4/oJs3wFX0KE=
X-Gm-Gg: AYBFou3tJSku1A1xjle7q0OCOKTbWvfCsLZv/ESps0r4sya9YRXavUF0EuP+dDBFuRZ
	cac9MokYs2xTidU5iwRtKAiDJoKzvAyQ/ySV9NiVuZdPEIZI4DARSdKLDjYf6U+L3ltH7YJDXWY
	fDJd5xXwiKYGp0wl59gVE0i2yFbvIpYNO3GMa5ib7eC/KC38nR0ugWguZBJkjicUj2LfcuUCyuj
	kFy1T9/Swjtio9ypYd0ocVseAw3Qx8oOhYoYHEhKKMwpWK4QbGdd68wvy1Qe+lzdiIYxV1xHNGj
	71DVmwd6FKY5uIuYQhyPz/hClM5QMn/m/Ii/ubDVdzNIUM8ob2sKCYA+lymars4PgnlMNYKgNNL
	SBYVW5gPpdGRKNoKTQFpbJfcs8W4=
X-Received: by 2002:a05:620a:8812:b0:939:6dfa:48fd with SMTP id af79cd13be357-93f29d8358bmr1660653485a.51.1792505864747;
        Tue, 20 Oct 2026 07:17:44 -0700 (PDT)
X-Received: by 2002:a05:620a:8812:b0:939:6dfa:48fd with SMTP id af79cd13be357-93f29d8358bmr1660644185a.51.1792505864113;
        Tue, 20 Oct 2026 07:17:44 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:4884:6e9a:d9ff:9fa6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d810043sm6642276f8f.16.2026.10.20.07.17.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 07:17:43 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: rafael@kernel.org
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>, Shuah Khan <shuah@kernel.org>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: [PATCH v3 5/6] powercap: dtpm: Rename Rockchip virtual node descriptor
Date: Tue, 20 Oct 2026 16:16:55 +0200
Message-ID: <5ff8e721e9b2191439dc8f5342fec6f4c07b4fe8.1792504834.git.daniel.lezcano@oss.qualcomm.com>
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
X-Proofpoint-GUID: TLvRGPgpqXJ-N0uOLP9UHCfAQU4L_Pyd
X-Authority-Analysis: v=2.4 cv=fb84WEQF c=1 sm=1 tr=0 ts=6ad77809 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=_NZqlvP9bvTAGtRSC3sA:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1NiBTYWx0ZWRfX430qnNDv57zm
 zkkd/6B1agQAtWOZGHvIHixF3AEBAjGWbgH58CrsQj1XJR4Ahjr3FSgNBGCqqUHEu8cebXrg7w1
 GxmWanYt3NqaY9tqrgNRs4D18czEtrEfogDVfllKd0mB7K/re64CGL/gtJpFgylPcinAgybCNxW
 f1ZMqunZUv4/cVtoAQq44Ap5s3Mo1IRKgldvxaqgr/OAXJf7AG/fa2yd6tFa42emqcQj8uJ/TsR
 5euEvfIARAJqBSGEoVZNEfVzJbjq1RwF/E34GubFyxFsdBt+MSjyOYJYwkwInc4QmR4ei/wxXDH
 XxV8i223KeBauG7UH4V579bAxpEUdSlsTHANOpZhHnrnEGv/x9ABJz7hXWzA1LFraIGk6N65OTc
 B9q1fNOBJug8NW6qTwxhQeTW+IspXd4Mcv0K2rhyMeVZhMLPCX4QERVDD81+6DeMHtYewLIBpLj
 NOeuZ3bsNpu8BO0qM9w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1NiBTYWx0ZWRfX2FxxlPGqd5Ep
 qr2YqZ6hwVmVypr2ITK6yvB0c/A5fxtXb/3rB9JZiPq8SPVuDFETw0IHXOTdbXXAFB+xL6bE0xF
 QJ5Ln4iNJyAgni9etF0fNTV91Y4D+Ls=
X-Proofpoint-ORIG-GUID: TLvRGPgpqXJ-N0uOLP9UHCfAQU4L_Pyd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 phishscore=0 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200056

The virtual DTPM node descriptor is named after the RK3399 even though
it does not contain any SoC-specific information.

Rename it to rockchip_virtual so it can be reused by other Rockchip SoC
hierarchies.

No functional change intended.

Assisted-by: LLM
Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
Changes in v3 (since v2):
- Rebase on v7.3-rc7 and refresh context after patch 4 style cleanup.
- Add Assisted-by attribution; no functional changes.

 drivers/soc/rockchip/dtpm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/rockchip/dtpm.c b/drivers/soc/rockchip/dtpm.c
index 222d9098cc98..5ae00680602f 100644
--- a/drivers/soc/rockchip/dtpm.c
+++ b/drivers/soc/rockchip/dtpm.c
@@ -11,7 +11,7 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 
-static struct dtpm_node rk3399_virtual = {
+static struct dtpm_node rockchip_virtual = {
 	.type = DTPM_NODE_VIRTUAL,
 };
 
@@ -33,12 +33,12 @@ static struct dtpm_node rk3399_gpu = {
 static struct powercap_node rk3399_nodes[] __initdata = {
 	[0] = {
 		.name = "rk3399",
-		.data = &rk3399_virtual,
+		.data = &rockchip_virtual,
 	},
 	[1] = {
 		.name = "package",
 		.parent = &rk3399_nodes[0],
-		.data = &rk3399_virtual,
+		.data = &rockchip_virtual,
 	},
 	[2] = {
 		.name = "cpu0-cpufreq",
-- 
2.43.0

