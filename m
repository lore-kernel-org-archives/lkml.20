Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794007406;
	b=XhfMzyc0MBvx2KD5C3kkoJqsIQfVEQnhKhqq7lr/UgY98QQyrBkY36SMYGT+Vs9tz5AC
	 R6R6vxGOrGFZeUQYMws1sEVgiFMYW5qG0s5DwHxcO/5hpczKcBnplKufHXJtLColEYz3L
	 gLTtXxBaPY7Lyij8jHdEFhNCjtSKgQgWSedBoeDu3W+YKYDO/zudY0lGPNFISFbUgTX4Y
	 g5zyzp6mKI2/C03pBwOyM4tUXMtJ/5WZi++lVs/cJ6VpSiEs6tcYfm731kPQvNQ+2Wc5U
	 me25AktiEeKDiaPsYJ4y3NdjYzSuJNnZ4O76hzyBvptjir8EFzZHZyw2n3BWe+Id0UA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794007406;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=mVy1ahp/P6zKdu4H9fQ7zteH5AB1M4xbGRPzRcWMmpo=;
	b=JgVcxRNXe4LdVL/H12u8GC9L5vYnrPMVrsvMmNeL9XNuJYCDfrDSSkXU2wHPEBhB9Sj3
	 suoAJP9qchk9h7HD8MGm4l2zYEwD8LCSqwqw5AjbzqsyStjnF9OWRGlBPdrtvu9275vou
	 Uw4sJK0LKBZO9Hsz+T26Cs2BvcWOiaAELHSGgpHCv4hInWGFFMRr6u4X8J4Y03zfxxZBa
	 KLhmpsDkHdn+eJEXX/+IpETkKv1u33v7/5Hx42UPWHMG3HWWkSnraWMfy+BLrZ5yVK6WM
	 stJNZadeSv7Pta7sdMCjsSmCYv0d9BdsGLDFIksK+MkQf1y9R3IMt7aYV/Y0xwazK+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ALRfDkGX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Df4Hbqfq;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5492606A337
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 23:23:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5492606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ALRfDkGX;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Df4Hbqfq
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6MoEjL1120220
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 23:23:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=mVy1ahp/P6z
	Kdu4H9fQ7zteH5AB1M4xbGRPzRcWMmpo=; b=ALRfDkGXfTnQsj/c7be9hGwskhm
	VAJZntA9czuWMltnPizvzIy1oP5/nrIb7fj4lgH2lVQWU0aGxEp4S3bZ26278wQM
	HEjuwR9xFYXE4SRDpRCqwcHeJoqxC2i3qJBkps8npmugHvQGSQEnpTZf1aYXlbOu
	07QP80QnNxVFUH3jURPftHu959u5Fk78TAf7F5dChAR3ZlsynHvyudAYTqQuMSOu
	5fGnQjr6LSo5erNOIWCsFXlCJ3MKzexG/ZLsI+1BP+Y4oEUQi7OvPfTsqeLig9wg
	ZGxYTlCDwmvfRQkgD8If+cGKZdrwgprs3GQCHgfdvaGXkFIBjGs/PRUKd6Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsn03rr1f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 23:23:24 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ad30487d55so1821219a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 15:23:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794007403; x=1794612203; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mVy1ahp/P6zKdu4H9fQ7zteH5AB1M4xbGRPzRcWMmpo=;
        b=Df4HbqfqWC6vGEW5tBGgTrJhSLP7toyn+MYdqgl7EdDHpqeNZKDpZau8iZz/KfB9gl
         DAftN7oPj69347Vie/v4s9e+daeo5Q8tD7zUIzj2ZOzoIOpoWuKR/7EzVSV7/8YFc9YE
         gaWHJgfm46gHPgd0Ee3p7K0WwqGw/Uxy6PYHReBIWEDD/YQo+bctkLvahUHkMwjyF2EE
         rUeTduW8n8o9xl+ZpWN0DQoPcnUTsJM5EsnPZPRIe8nlXgi9wyG4qeVyTbfAvw7FWCbA
         Ftnc8oJ/Qp932NETkzyQpAWwu6fZtgswSdlBfgXB2bW34lx4MTXAAwEkGZgaOllM2tv3
         Dq5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794007403; x=1794612203;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mVy1ahp/P6zKdu4H9fQ7zteH5AB1M4xbGRPzRcWMmpo=;
        b=Dw+NZFpw6Ot6HdglvMFWQxsKH34FDc+b3xuUDqxDNmoCzbL7xuyBp/2St9ev4SXadl
         QI4ho/g7GyAGxkxCqC6rTQHd/oZEaZw9bzm3aiAiQo+jqoj9HT37uwnHBZyIqoVlMOKw
         07mZz2nE8veSXMIY6KoJYgpcNBCaoXoO9jgMBcKaGWljeHS8XRTzWFEjcPlepzTvEjpF
         2ntvWDq7L7ci3YPPtdM7dBPR8zk8PCjncbws1K7l9UgJkq3+t8cFZlK1g21Lv0H138G7
         rKt2SXs5z7bgLCsgPRV+iNC1QwVZ6Xb1wZljjnIAwB1ZUZQVWaJv+Je2B+IRbRfpZLa6
         +xdQ==
X-Forwarded-Encrypted: i=1; AL+hErHgKwuf80eYsCLL0G/lFVFD7Jk5sKc/8/nB0NYVVaFV/USqOHRt9g898yEuEbCUzOA/cY8kxCSmVqApJWI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8h+13e2SLSai+6laDnzZqCgxe2SR0cgn45vndudNbv5irgXnBg
	GhyscfVUjSs8uBwlmFuBGyebMV6irhhQQ+w816quWx0Y1Koj9hkO9RQ/v2+F7Xc4uEquiGmXCCD
	xYc0qYda8Q8OROSusQy7NOI8uuRYgnQsD+YwsUXrv1X8K5vNwg7xL2IzLYSOZYMynvn0=
X-Gm-Gg: AYBFou0lSB/NdFlWZxNQ/W540EKhnfNKzX0IindceIaAAoPORZBCxwkwaj43JKilB9j
	VlehjVgI/Gczp94FgifyC5CgC4Q2dGDj45TbUiVN93sJBuu1ZCks/2z7VweLT6hUpvhk0NHaN/O
	tkQVqfPlauyt5c31avBBptHUROcKXgYr1OwXjvRUkogYnHGB984CmOrAAxLDL7dpisj3dxSJOsF
	JEaoZ5oyy612fCSS2Fe6hA5vJvmBPVPtqqNVdn1EeavOd5O6Kek+u7hI60qpv2kt5sEiSJ2Joye
	wahUZSUOKFKqWukv0VS2NZutfptg3d80QaxkdoDQlayPT6l/oFwBnSFZUTzNPX66j/UDsfNm/Df
	P/O6P8Ml2nOdewvZIzM8LW9JFe1iFF0Ur2MDO7MUu4qu9U62iXNGgEfybb8VsLH03Cvi6yTRi4A
	aCK8CRQ5hy/jhxYCxH8QO3+EdkMGfGKnisqHXaP/XKkXvCnBWPLCYMEzTDxrcDIA==
X-Received: by 2002:a17:90b:3e8b:b0:3ac:7556:8ee0 with SMTP id 98e67ed59e1d1-3b0db6bc565mr3864396a91.19.1794007403449;
        Fri, 06 Nov 2026 15:23:23 -0800 (PST)
X-Received: by 2002:a17:90b:3e8b:b0:3ac:7556:8ee0 with SMTP id 98e67ed59e1d1-3b0db6bc565mr3864373a91.19.1794007402976;
        Fri, 06 Nov 2026 15:23:22 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b105864390sm655031a91.6.2026.11.06.15.23.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 15:23:21 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Nico Angelo Dela Cruz <nicoangelodelacruz@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v7 13/15] drm/msm/a8xx: Use CP_PROTECT_PIPE regs
Date: Fri,  6 Nov 2026 15:21:05 -0800
Message-ID: <20261106232220.47602-14-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106232220.47602-1-robin.clark@oss.qualcomm.com>
References: <20261106232220.47602-1-robin.clark@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=JMSuIMKb c=1 sm=1 tr=0 ts=6aee616c cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=UnxhJFuZtzOLgjs1IeAA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA5MyBTYWx0ZWRfX5le6HN3eOrlA
 icoUao6zVawi6jWJij5D46eMiy4uEK/lrG37/h1Un6lRCeL2L2c8Omu8O/e3UwsCcfhwAacUSi7
 pr0Wh2zYQattQOaTuaUga5FciExKOiE=
X-Proofpoint-ORIG-GUID: ohW6z3opN83IAqjvmKAS2g3aGf1E9F8M
X-Proofpoint-GUID: ohW6z3opN83IAqjvmKAS2g3aGf1E9F8M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA5MyBTYWx0ZWRfX3e9M2jpJFfuU
 RMviEYPPOcbkbj5hrxyX+hHZITYl/XGO7TZHHByF7/6eNWZkEanoKfcN6GqkWxnbBkUnYnUx8PZ
 +yT14IqvonIl3Zsn5LRcxg/5muecaa8n3jrFnM3/KaTVjzSndY1pnJN4nTQbha1jqXwRIGQhwXL
 J1WHYGXwqDmxoebVCn8fEhxkT9HIzi6AF32nERy6jLR4bNq3b7LrnthTZ4EE4gO6CUKIHEZ5Cv9
 9BbqzWcix/CvtPOt1BkdPhhCmDyaZxDmu6f+1LerDHpTDER2B7Gx+sXDLksYWzu/eP20EPs9po4
 PYtlbDoWLIqq0NcY5o53IgPZfOL9drKtwqp4cRPkPMsnaypB7gRwRnVKmCwgA8GyPEbVUcgRKB3
 cRo/eoqNbX612d1yUnFg9sCVHUtu+nzRmkZN3QmkTsL8LvhYH2ps+LEoXB8EJ/N1/gujVYnTR93
 l6hs4nw4ohq4GA+W3uQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060093

If there are not enough global CP_PROTECT_GLOBAL regs, we can use
CP_PROTECT_PIPE regs for the extra spans.  We just need to configure
them the same on all pipes.

Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index f65bf82e5c21..f6afa5b3b0bb 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -261,12 +261,21 @@ static void a8xx_set_cp_protect(struct msm_gpu *gpu)
 
 	a8xx_aperture_clear(gpu);
 
-	for (i = 0; i < protect->count; i++) {
+	for (i = 0; i < min(64, protect->count); i++) {
 		/* Intentionally skip writing to some registers */
-		if (protect->regs[i]) {
-			gpu_write(gpu, REG_A8XX_CP_PROTECT_GLOBAL(i), protect->regs[i]);
-			final_cfg = protect->regs[i];
-		}
+		if (!protect->regs[i])
+			continue;
+		gpu_write(gpu, REG_A8XX_CP_PROTECT_GLOBAL(i), protect->regs[i]);
+		final_cfg = protect->regs[i];
+	}
+
+	for (; i < protect->count; i++) {
+		/* Intentionally skip writing to some registers */
+		if (!protect->regs[i])
+			continue;
+		a8xx_write_pipe(gpu, PIPE_BR, REG_A8XX_CP_PROTECT_PIPE(i - 64), protect->regs[i]);
+		a8xx_write_pipe(gpu, PIPE_BV, REG_A8XX_CP_PROTECT_PIPE(i - 64), protect->regs[i]);
+		final_cfg = protect->regs[i];
 	}
 
 	/*
-- 
2.56.0

