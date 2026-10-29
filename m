Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793293064;
	b=aBye89JAjY576FhHFl/ygvTXZBWDrkqt7+fmRpbuGkOW24UqFbYg/SbinOSGOqQzUzLG
	 yehQ/WEelmmrupbiSvccCzZ1XQElXX2/thE7lxHJlvG8bGGeQcIilSIXSgJznytq1gWek
	 aMFwe/xIE/Qyupi7Rxh6gTWHO1pZ/zZCSRn4jPq5EPUD7IblNJcX/ylTkcWKc1MBVb8JW
	 9P8HcVxBdfNC+1pFKhpIAr9HQWrsILH12cJou3U7xTFC0IPhbiCFLtGMKiWWJgfpAq8/4
	 7spEDiH8wKeWv0t08YSzPlj6ups1JSYMKt5kkeFsjPVIpxAWKX7ytnxsB8pcJdFHqzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793293064;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ytOjkYgyk5LlmjFcxh3gPQQdewa7HVP6wQzba4/f+go=;
	b=lfU9SlkWxBHaC+zsYZ4MQXsPijkTy9Ijp4WI7xodRAUZYCF1HCde+V5FPexstn7uXwS5
	 EXUcct8xBn+HdObr1QFtT6kjcUmLusGCM7ajqPLyV/WjqypkoW/iEERb+fhaBj6IwYtMJ
	 XapuMug4FPuEy6zzBrfn9B0p4DagpkhK4eN74BHeVaNadfO1/u9vvFSN0+KY1dVRaqk73
	 WVq49vQoGxfEvVYR4ovmDaJwPD1RWMbLa9M1r11rtram1yJaepkmCHAVgxr+0AfBCiQZR
	 XPNY+vb/rAftAJpmHzLKVb78oX7stYiYQFfFX+0ScCo8mvEpACsk/tbJYs+gwoYnuWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=K5B4EY4m;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UEjBhxH8;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90EF6606A33F
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 16:57:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90EF6606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=K5B4EY4m;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UEjBhxH8
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TGDP5T594494
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 16:57:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ytOjkYgyk5L
	lmjFcxh3gPQQdewa7HVP6wQzba4/f+go=; b=K5B4EY4m88mryxZuLbPk7QKXc2F
	+bohx0GPOVwzeoz05M1vtTbY1G/RlSkU0t0d7BmUFdl2FGHmh2zw94EKW3kqyiDU
	M5Q2hQmVUQNKONVnE/q/FqJlsBAdZV2c41/yn58cj0e8XrAwdRE9xBEiJGQmlAcC
	tPP9kVwj2n9rHIP8EuVxpXWvwoe3+PQRhvUWLXI5dL2r8AvwXfC6DI3QV701Kbyf
	Ua7vj1nxum6/ahaYKeBgVjsOzDzlUuecvKAE7aZveMgc0xLOPOhAbFFCJnXLSGsQ
	W9ZG36XnnqtUdzHoyPbA/nPz9LykFPBypu0zpOFzWWKkf03ZSTXkO6WbGtg==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkut3kjaa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 16:57:42 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-98909a978b9so416954241.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793293062; x=1793897862; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ytOjkYgyk5LlmjFcxh3gPQQdewa7HVP6wQzba4/f+go=;
        b=UEjBhxH8LEL8nsqJCQm0X5sXfub94BSpRqSJ//Cf7RVT5Yv9yLkxmGzVH7qVHZNYid
         Jw+KR3MtIX8QLq4DVu+9jF8WODum80BXsNyNT5rZ5MnqWdSIu54olOZ8mFEtLut1tLo3
         d4/MFIjq1CKQbkiM2h3145NPIyc5pngXNgGnPC009P9hIuz9VVDr+Dbk2ZGvxnD03jSe
         vOJEuVZ4BJ/9xWu+k7WDKts9RZQdCpPhfhA5yOF6YNEp84oa1wQezkzdw/1jsC/ClHrj
         N2zSRYFEMoVTdgSrE0yzzjMoDNWZxtYL2esVfz0ybCuWLelgZQtOzlIJm22bu9ds63fQ
         qE8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793293062; x=1793897862;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ytOjkYgyk5LlmjFcxh3gPQQdewa7HVP6wQzba4/f+go=;
        b=xyXPENeSdXYGtxRNWFAv46HoR3JbgmPgG5S/4cLYQcP8Hw84QApfThSebXtk+nfToL
         lpxVT8/WSPJnUPY7cBYoT6KynaZzTIy4ZpRaxytQg4cCidaVRccGZf2YxIW19TMoScyC
         FyzqCt3MN2Wj2S+rBfwBYzNZetE+vmhM54slVwrtq1Aq0jsMFslcGvpdTBnWMQxPg2Ee
         LXPL6qiqWi+V4epJgIgtgA7Lk/J6s3zhEdX68fdM6qnNnNFxqx0yOhKeO+JIq4B24jxu
         rJRvDEKaOJ7arJtyhJJ/UsDQMWTWdYfk+4F4oO+isdphdiJqayXNB0Sl83TWb+z1HvCz
         55pg==
X-Forwarded-Encrypted: i=1; AKwUvBz34h9/gTIwuvezvFQq5j1TsevphC250PwKfPH4sJIuDZFvz9y9qo28ylRFz2ssV21SCQvWC9GSFORxC/Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYLXthtaYG37gBAbWFjiYCwh18F2Fsq9UFQhm/WB0FH7+gi4WB5q
	nnc9NDEe8U/0v5AfVRMWgMYjC+pXFe8IaQz23jhHGD/RO72m4QNkk6w+iroaJVsLWTyhz/UcaE/
	fa2Oi3mLoUeBpERPwbztTWDpAorgROULy3/uQ981nmy6zeYYMVX8k5gyqJO0SYPW0EqU=
X-Gm-Gg: AYBFou0fXTZ0//gLkqSqRzBL57fp0H+oubELfNH7A1RcW0+sQwOJGACT4PtbJgBntIB
	RON7do3fX0C5eu8OPBLz3WOntlV0wCB5zh/hyhwqEEl2S4LnL0v5iMVPbvpSl0Ey/cW7GOquDaG
	zrEbhT/oW3nmiRw3VPMH5nXUWuTU1m69EQmtqlXM5LgNx0udeA4Me2ouSIaVHYQ/TBcAkBQ0MLv
	m0xCwHMNzcb7XnpnRTo9Y8yPlrxB7Du2cRGEgJaGYRmDnoD40c5IhTZs1SiML6plYgShiduDBCW
	Fcxr2rZvpEP3yIATdgoLTEbcfaAaveHku4WsFg6U5lf3XzO+NdTdFdjP0bA9mO995Immdr2aqch
	/WVeX54IrQgQGKcJxq3WGREuSGffnoyD9Uuq44rjJQ+nV0/rEbRAzJq1aEOe4D/A1WSFxtIM6/q
	52
X-Received: by 2002:a05:6102:6a8c:b0:7cc:2c29:54ef with SMTP id ada2fe7eead31-7d03a5abb96mr2605293137.19.1793293061904;
        Thu, 29 Oct 2026 09:57:41 -0700 (PDT)
X-Received: by 2002:a05:6102:6a8c:b0:7cc:2c29:54ef with SMTP id ada2fe7eead31-7d03a5abb96mr2605280137.19.1793293061411;
        Thu, 29 Oct 2026 09:57:41 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:7fbe:151a:486d:a2cc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e6df961dasm325669f8f.23.2026.10.29.09.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 09:57:39 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: rafael@kernel.org
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>, Shuah Khan <shuah@kernel.org>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: [PATCH v4 5/6] powercap: dtpm: Rename Rockchip virtual node descriptor
Date: Thu, 29 Oct 2026 17:56:49 +0100
Message-ID: <063f0587a6c951ca57e941ebab39617a0d0a305c.1793288783.git.daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1793288783.git.daniel.lezcano@oss.qualcomm.com>
References: <cover.1793288783.git.daniel.lezcano@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA2NiBTYWx0ZWRfX9lGaDJqcYxUF
 LHuSUPQPtkBicTPbSwNlifFOWGPnO1jGgGnUcnM1LQce4pkTksscW/bjpb3J8LolgvysFB61i6l
 c3lVt7pYaENDSBniPXu4cAKTR2LZjj8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA2NiBTYWx0ZWRfXw8I738acDZhX
 BKrO16tuQ131b3cGP4dlVke8T3fyOhmH/2wB35kxyZ3yjOn4c5NGN5SaI9UGf44DEG3BP7X74lm
 fkz6TNJohxErDrVdC2g400hzjnYUjcZpPL7HGKCxzsSOVGRD9xRFeSTT+6bD/gVzZNCW/jVHYmS
 p62/jaGQWidDmrCBjRyFkjskxa6yDaqsUWhKmi1KVwc4RXsWgyVSQCs+LhjBHbIgq/rj71hxZrQ
 op93h8QSepUBQudUqPRuGPOmVTHmPWnQ8bYV8V117LLP5IhhSHyoRhFj+WLSOS+EnHEXxGF9w0S
 xA1qhKhDIM14bHGtUrG963aUlgxdwWaZvxUqvZKiBVs9HzG7KZu9bwDUKV0Ho0X/7zXrHAmq6W2
 d1uFktgxMAdq0yhtIpRtuQl2qRWPmW8N4IWPvw0GGNmHoqRZTWMQ9CiwWlIRtjNFfo3BI8VBKXA
 mS1CFEd3CkuXA3ZdF6A==
X-Proofpoint-ORIG-GUID: ExmcaRuwaD_zfFK4Bj2hWUWw1tcq_alk
X-Proofpoint-GUID: ExmcaRuwaD_zfFK4Bj2hWUWw1tcq_alk
X-Authority-Analysis: v=2.4 cv=HYSB3SE8 c=1 sm=1 tr=0 ts=6ae37b06 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=_NZqlvP9bvTAGtRSC3sA:9
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290066

The virtual DTPM node descriptor is named after the RK3399 even though
it does not contain any SoC-specific information.

Rename it to rockchip_virtual so it can be reused by other Rockchip SoC
hierarchies.

No functional change intended.

Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
Changes in v4 (since v3):
- Rebase on v7.3; no code or commit-description changes.

Changes in v3 (since v2):
- Rebase on v7.3-rc7 and refresh context after patch 4 style cleanup.
- No functional changes.

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

