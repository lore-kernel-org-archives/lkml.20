Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793610094;
	b=4zPx7q+9spfsG2Bv3RWVXua7fWFqSBfMYRkDxfDZzDRpl1kNMHlb4ZvAHmWIiHhw96Dk
	 6rQnffVw66qh2BkGje5DfzRqf35wSd1ctX7S5E2eyl2HTWqaMjg+I6KpUyGkMrhq3su8A
	 waQQGema8clZTbnmj8w5LwRP/A3ZpZfVahUzo7OOCbg3hSpHbo0YGAWxPNuqJQHhefhOy
	 63HXelk/H0EjdGYy6hCKYbxyNZ1uqXRE7yYGJEhip0UhkP4vaHKuMH7zczMoPMmevVBK1
	 MgnjLsdRNghJ7D2SjbBj06oczI3aqRxtl44+bKemnOX34qOsAAzs7ahXEcCAzgXMPGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793610094;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=avrdAC3+VaiYhhDXqmosyPWkGp+PfhcvqXebzRIarOA=;
	b=Jr99y28iOGhWTcwVHFhTDFZWRDYbmqNMeZ/YKSqLLKE2tFu5A61B0grm4YHgu+c7GljP
	 LN/O/0D+KnBLNvFiFHJdQqW3J3/yyFMYXLCJwQ9yJQGoKAPLcjtq06LwZwJSKPqCG7plz
	 CK4BKQdPfdI3rPg9J9saYSSBDh/0J1Aey2VugUTdxEgFexaHS89t28qB4Ggz22jI25n3Q
	 8cM0kiHklkb06YDXNUaKn8Ru81DsZh61M66HDxDqsqL09M4l/+/Il5bdABcxSf/uq3J+d
	 izNvaF8OGytyU8+t4s48NbHWd9mV5fUu3eewD/QCc4E4+8lwhkVJTOqW/OUKzcs7AIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RETzsQdM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KvYdgRbY;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B1A6606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 09:01:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B1A6606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RETzsQdM;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KvYdgRbY
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A23vGPn3768855
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 09:01:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=avrdAC3+VaiYhhDXqmosyPWkGp+PfhcvqXe
	bzRIarOA=; b=RETzsQdMUr7s9g0NetCcCjXGAgFDr42EJkxjGZGB2q2GrFfyYaW
	DWDeGdfEbUYQDA8s+QqhFEvP55OcQiANvZGImtyiMi+BpHgL0DFmuOT1A3xleYo4
	syvA/qCHOPBjqwNMqKZRzAQ6ugpvSyROSSmvTOCqkVrjsBr3M4/bCsDYc+PJoMCC
	+kWY+pAwq++Miy/Yz0Z8RdBMc2wZUAgC4uldVx4egeqXU64/oMIlMgEkkD98jzIQ
	sjprm9YmAubyxaHmOEGYEgPX1NsDkZZ+oTK3F5vO+xBGN0lJTkZ1h+6XiRXzmd7g
	6GEhnGSHMqgW0STiUc6wbTSqbqnbwoeoHiw==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn79rx5xn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 09:01:33 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-704aee0b7b2so2881512eaf.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 01:01:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793610093; x=1794214893; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=avrdAC3+VaiYhhDXqmosyPWkGp+PfhcvqXebzRIarOA=;
        b=KvYdgRbY1o7291HRSHvLRZiunk3BaYTSyp4qvEjMnNXoIHfxFUJbq+Q6t23S/Ddc92
         0k49lKDeAsBvM/zxOLFB8pcBQnrgPSzzFgtSkW+5ceOMJ4JB3SAAnsWQ44MvPPvrnj+K
         +lW2VXImTvHPbT5iJ/k60O1H6Zr7L7yWdV4MmswL1qyFOg0yd8F7o0ICBLc9NyG6Vr79
         dKnILdaKKpqm36IO8uP2qZjOOaqvVoTL2CTpRB+TugkWzSQ3UiBMxWw5ruN1drj4tkEd
         R1MkxAkZLfNzGue/xDmnTDffvCa8hYh2dopOrsUzzQkG6zFmAhHlWD7iYAe8SBdvDFH2
         xKVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793610093; x=1794214893;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=avrdAC3+VaiYhhDXqmosyPWkGp+PfhcvqXebzRIarOA=;
        b=n7/IDF+Z85Q1LSoUQjfoyGkXW5Ngzf9uWVEBABEnirGdG8W5Usg9w1Dyp7xxRgfIaj
         8hMAQ147Im8pxHwvlrR9cozNgq0/7f0Hmu94NkJVJ1rZKnY5THrIBtb5pT+iQ8zkToZm
         Zp4GljvJ0sIgj2WV9ki42P+AyokVT/+SYKIzX9eQOzeNEJhwKtJFSCqyxL+6tgf+XeiB
         DSy2CkpwL19uc3Xo9qx5VPHvMQd+U+VJ0OCThWKU0sGN6Dgcte5BHY7GO2tvlmPaYfpm
         fUOufx7DguqcGc0jeFLMHRd2o3DaHgPBi+WdtbQl409x6oFq1cr0qSoNqjRo/Oz+Min8
         YIsA==
X-Forwarded-Encrypted: i=1; AKwUvByHBPMdfOAlQRH2y9ZmMiW/G4AvJ9gO/S3tTrIS4pfNobElPAaseFzXGKL4W4v7YMKtE0NHvvKGtzG0Y3I=@vger.kernel.org
X-Gm-Message-State: AFq9FYIsRenmkZ1/54IxI57EUBTfTkbcVn3/YEwYXVEavz1AMfUahM9L
	9Or5yaXWatDG6oVUkgaUvFycr1E1QPlut0mE5G0rcmUVBkN3rI7rykPi3/DkC8tQmHY7VaEMWQj
	IF7xwhb0iXEciBBC4aanGKxtagjxlLWnDuLd/gz6hnJmj4psLqmXfpdoW7jxU42cldLw=
X-Gm-Gg: AYBFou1XJsbGsmmxLu5zm6dvT66CAfuJGhV+qYvojBr0mIY5w8idBMrXaKgyq7tVxC9
	Rbofx4rL+YWU3d+J4bOH91ZsFQyJluslk4qBLTPIQs/HwmWTdOkkJeJFSA48HZ2DLEBOQDmXeQw
	X4OFafh24tj+diecC/zq/sSfjsSztyP7an6cmaIUY7zqlEOLOXDmcIUvc8siP4gVvB+jXnVcikT
	5umZOwAV6rlPZZChjgfIxiCr8WaPG72VaYP37xLL+yVHMFVgIgjwdWjwWDVfETFo5xcIybXi6nF
	KD7Tb5zqrOE/ba+YO6kX6mb4qavuiHr/I3SId/idRCLGfNgljqNkoPskfLSMYiwE9sbhoAOm9fO
	qMqf5w4otVNdYXV0mAcFlWG/AswSCowpYr7KUNQzwU0OXlDpwlrWuNgoJySKXqU9u4IcwhVHp0w
	EDZxotZcXDaotuUIcIaVAglZ+DMAax7E4duk+Z
X-Received: by 2002:a05:6820:607:b0:707:5453:73c5 with SMTP id 006d021491bc7-714f242152fmr5313440eaf.2.1793610092729;
        Mon, 02 Nov 2026 01:01:32 -0800 (PST)
X-Received: by 2002:a05:6820:607:b0:707:5453:73c5 with SMTP id 006d021491bc7-714f242152fmr5313426eaf.2.1793610092355;
        Mon, 02 Nov 2026 01:01:32 -0800 (PST)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d3545bfebsm8473636a34.4.2026.11.02.01.01.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 01:01:31 -0800 (PST)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
To: Maximilian Luz <luzmaximilian@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>,
        =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Subject: [PATCH] platform/surface: aggregator_registry: Add thermal sensors to SL7 group
Date: Mon,  2 Nov 2026 01:01:28 -0800
Message-Id: <20261102090128.582927-1-gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
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
X-Proofpoint-ORIG-GUID: plqkSg2djKONkQhQOzAftRXafMzrmc7D
X-Authority-Analysis: v=2.4 cv=Wtq+otfv c=1 sm=1 tr=0 ts=6ae8516d cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=UzWXxX9ZMNbWsd0j3ogA:9 a=k4UEASGLJojhI9HsvVT1:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzNSBTYWx0ZWRfX6bVULf3CwSF2
 We7Joygay+ZVcFugv9skC3+oDE+Eq3SU4W9CPgM988zghtCjhGAgbsWZsN3QoH9dFihiOZmO9Ek
 StrU522OMUEf/OQIhoMQx48kI0fKRD8=
X-Proofpoint-GUID: plqkSg2djKONkQhQOzAftRXafMzrmc7D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzNSBTYWx0ZWRfX93TgKIrkdc/a
 KZwO/fOCU3CXkFnlHz0NZOLK5kp9mN6OKnP7ZlSyi1XkcFUG1YDZlC4EktgekGPGxfYgSBsCbmI
 UFlsrmgdZu/njfPfLBJv+RHfeiCuDn24lK6fz0sa+spxWh+vJ2XOdfStpE+38+ymjtzRBGUxXy+
 cQOMD/168LWq3swTN1xI0lk46+OjBO1vKBIBpleg769DfIgvrmKpjCq8td41iyBsQZiQ78ZGtRv
 96duA1UZoQOvHwf06ZW+eanW2b6Q5j7UvG9n2RqUqZfKCIwyH0gAy3HvJAO119m4CqebFDm+dwP
 QO0itOX/PVDnJBqJj0y0v6ceCFqNHQwUUzyAobb2ozqvbcz+eUnOzn4sb8pjKl9Bn0Gb9ZG8xFC
 nH6jExknSHbPIJgWwQ82fJm/GXfKEOFZ5JOvt54i8+CW4nTf/JG6SXMNGLJapIoEStAmHHWa/1/
 rwjpUNMOII4z5+8UBMA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020035

The surface_temp driver is available since v6.12, so add the thermal
sensor node for the Surface Laptop 7 and Surface Laptop 8th Edition
and drop the TODO.

Tested on a Surface Laptop 8th Edition (13.8").

Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 drivers/platform/surface/surface_aggregator_registry.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/surface/surface_aggregator_registry.c b/drivers/platform/surface/surface_aggregator_registry.c
index cf3ae252b1c4..db97a5fc96d4 100644
--- a/drivers/platform/surface/surface_aggregator_registry.c
+++ b/drivers/platform/surface/surface_aggregator_registry.c
@@ -296,9 +296,9 @@ static const struct software_node *ssam_node_group_sl6[] = {
 static const struct software_node *ssam_node_group_sl7[] = {
 	&ssam_node_root,
 	&ssam_node_tmp_perf_profile_with_fan,
+	&ssam_node_tmp_sensors,
 	&ssam_node_fan_speed,
 	&ssam_node_hid_sam_keyboard,
-	/* TODO: evaluate thermal sensors devices when we get a driver for that */
 	NULL,
 };
 
-- 
2.34.1

