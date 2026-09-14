Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D9EB4963C3
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 15:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789398131; cv=none; b=MSM4bn7I4Ad5kJXsJBUCjckVE5wfuX6aYOJTEzzhFsV/RMpZSIo8ik0KsOYMVYQojnreBEumlONs1jYSkvCFUafBjylMR4+jtdHXct4uKx94H7tqEzhQXLj9PGYwZuoqbYp/ed9GlzZEeIJEgGs96LFWKjSInmrKLbgTnP8bTH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789398131; c=relaxed/simple;
	bh=eRZchRufhj3t9s/2k/I67ScznlqWKjd4OkHFdD5fxaw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MRqv5YT2gxb6SL7EzhrYzQrMkCBWHj1vaxXRhApk3euAnOhvrkgXjaCiS/0zxwtkyiMH1FHxuYnGHKSpkI1yKJct6QM65Q7zqQ/jRbgC6q6RB3BaYTXbG46MhqGFmTrY11XPx+2Dkui8In9v5bwYvv7QOGqgyT/oTaJEubfAzBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RrEuUu9q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DfXbY3P0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RrEuUu9q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DfXbY3P0"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ED0cjR1200557
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 15:02:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=w4t3O+boQ/6
	prVdjN4I3fTqFDViq1Qb1L+fZxB5u9Ng=; b=RrEuUu9q5M9qmpGHhQ8s8q7Pzl9
	EpkPm/6FmCnxpjBOSLOGlCC4llT6x5+99fyOX7zFdEhdG2bIE+aelkWW825w49nR
	pY2ITnqj1XjmAVakfbg3jRGMmlwsUjrW3o+h0WEcufPQY+T9240rla/h6/kmxD89
	6psc+Yb+beDmcVwsDS+U6+yl6MbG5AJIxgdHw4XeoTHhab5r/+D46h46fBfWb1G7
	ZzaUmglfFTWoBY9GGm2162yjAoWviXpIxNHlEjEb6oJOKuyVfigZzuJDfi30gCsJ
	BuBv4CBNv/j4DDRtxDL8uXSqP7Oo24bB6r4vrzDoMrlb2Z7K2xy0GcDdGGQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpdevsej8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 15:02:08 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-78fea4e86f5so3522746137.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789398128; x=1790002928; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w4t3O+boQ/6prVdjN4I3fTqFDViq1Qb1L+fZxB5u9Ng=;
        b=DfXbY3P07jgfy8YPoXX5q7lO7IHMw2IXSygglBsj5o3G6LPeM96NDTst1S0WmpSZtm
         vfCOsM05Sqbnc6En4zjo/YuE+ynNO+GeU4grjnwZQ1ru15AtPEuzrXCocZDbaOkCqRVB
         vooGl9MZXBR2FDdgGMbLEQAkFxL4Ys+v+iqKc3iO31+Xft3qH3fL+QuV1YGdLrurXj4W
         SJYRWfYu22GtmbNT+afgSW3hnIZuaeWS3p/wXUoafnkeBtUC/+UGiODjCDqPx5B6oBel
         /UnpuW+D1li7Jgimjbrx3ZPieggjGF8FfcVedPQCet/pdI+KKbosA+7SFV8vMI7ItUZT
         AQrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789398128; x=1790002928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=w4t3O+boQ/6prVdjN4I3fTqFDViq1Qb1L+fZxB5u9Ng=;
        b=YJct/iYhvWiKQstHIq/s5sMDMGhZBXEhFK58tT2sq+evo5UEfgwTLuJS/GTN/h2n26
         nILc4eEpjVJQQr7Xohz7t8UiP9X3DwWf9iTrR4JgSvveOubuUnSVcFpydWBVA8CGXepu
         ATxZhN/bsZSgxp0sh0QFtICxHK/+gpKJi6s6WlOw8/0HE7q5iVxkHqyKL1SueleR4sRh
         uU5MWttP7Rqs3OplgiLE0rAxZURdpJ67mUyJAGRxNwoJu1Ag0yaBuagMaQCXZy1J6xJH
         Jxi6rDsAu0aNebcMXwjYamPx1Zk9zl0QBsH8NXA36MpMmsSkk0+j2t+5k+zKovzcD+Xk
         4oQA==
X-Forwarded-Encrypted: i=1; AKwUvBz5HCekiJF3YeiXxJKkLVmggY7LOT9+XOyGfL3uWMld+sJTtjUUwACD7fEXIAqQ8HSezVppgvjrR/d4DsU=@vger.kernel.org
X-Gm-Message-State: AFuF++lVRH3OB6Lx3xTjKy4LI8zfjjNjSszFEjcpcjRLuZ+QnfHiLPrk
	Mq1XWXeR8SZ1gqEBXe9aaiQAQ2bB32qArE/4IAr68YEfhC1G5khG/wPf6TNPgUq4zM6PEhvDGsG
	RnRugSbx8Vm8R551FxBQTHf/a7ugSlBRUPS6dW4s0Tfs9sPttb/pJ2fHYxuBsJ/GtgiA=
X-Gm-Gg: AYBFou0BVZnc6bn/nzkEIfl1Ao8RK8J27M2d4a9c60DltI6C6fG8oKqusC/T69KzJjA
	UqMKgdtVZK/jrBlUVk5FhZdxpz1D28VO3ozLgOCNNFZLR7/9ZIUjt17BkzUHvAH2aodgBvdOliG
	FAoLnfND21Gf8YR5los4iiPXUCKiSc4TDfxsRVhB1ZGEsQeQVvSKQLO2fjHZZulKtYLNcTouIZ3
	SNkQevvvyxPuN/JuJZFrouVxp+jc1dudvHQ8n4Qo0bN+vxLa0ZtStjqkZI/xe5jAz95elEQqF5u
	bjHiini4Lh39SkAIdVPTLPDJj+GETVB2ef+udx7zkfKnF5ARZennbxDFVjYXRjIPn1AiaELfI6S
	yRGjlKt8x0SFna+mZ20cJi95q+uNn4sdPq5Dp5K0xqbAbNhoH8m4Lai4Wrg==
X-Received: by 2002:a05:6102:22d4:b0:791:740b:7ce6 with SMTP id ada2fe7eead31-798930aa611mr2058730137.11.1789398127705;
        Mon, 14 Sep 2026 08:02:07 -0700 (PDT)
X-Received: by 2002:a05:6102:22d4:b0:791:740b:7ce6 with SMTP id ada2fe7eead31-798930aa611mr2058562137.11.1789398127096;
        Mon, 14 Sep 2026 08:02:07 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c296608480esm468632666b.36.2026.09.14.08.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 08:02:05 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>, linux-pm@vger.kernel.org
Cc: Dhruva Gole <goledhruva@gmail.com>, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 5/5] cpuidle: psci: Move initialization a bit earlier in the boot sequence
Date: Mon, 14 Sep 2026 17:01:41 +0200
Message-ID: <20260914150146.187622-6-ulf.hansson@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914150146.187622-1-ulf.hansson@oss.qualcomm.com>
References: <20260914150146.187622-1-ulf.hansson@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: vYxOkV6dUzJO1DxD5CY-3VfZF9LKhpAP
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDIxNSBTYWx0ZWRfX024OlTvZNhmp
 NCxv6IYs0+MdU8km1hyfuILVGRcixxJytYlk6NpIFWTer8lwSj/sMnrPM/XykWQkHhisRFRNHSB
 oaT/Zp1JJH65AkHUMeivy68MwMFzG2o=
X-Proofpoint-GUID: vYxOkV6dUzJO1DxD5CY-3VfZF9LKhpAP
X-Authority-Analysis: v=2.4 cv=ftpJ914f c=1 sm=1 tr=0 ts=6aa80c70 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=h7aNHqOhPKB91FvYUefsSA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=lJEbMRRrfWY45v_ev9wA:9 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDIxNSBTYWx0ZWRfX7AQA6gitkXmf
 FSTMvUSHArrZlkrRLI/UaSiEQr4XbFheP74ZKtnFmEJCq9o2FrNemo8yyrkT8msJpRUnm9T+Ego
 A8UMHsNMw9aYH26+K0GF78oy4p0Ce0wqxA/4yjSpegqudF52nYgManp3ZOJmjU2n3T+SZof9bCh
 yvM0lTrWMvK2lMXFLQ7cMsRVFdQW46seAhxuwM+lPRAzQIUvz9wj0IfNwYUFEuVDjZaOvUaP5Xr
 v/WaNM6hM+UZh7o9BspMhCRrwXos121j7etEKdewb2fF/H2ySK2AacUqA+MkvyeuGwVFWdDDuBq
 d9/oQotc/bER/DtTwbHsSmbQs9y6mvWUdvSZJ4X0YFPhKdq7H5EknePej6jrGY0fkV9fzj7uo9a
 d9f7D5wRbGhkfExOjrQ+9Yew5RNdUZcJbww+uyVSFoIHnTiEVbAsXjm2Be6NvwAegYP7RmG2KTY
 yt35dTUvvUdMTdBBahg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140215

When using PSCI OS-initiated mode along with the cpuidle-psci-domain driver
it's of great benefit to attach the CPU devices to their CPU PM domains as
soon as possible, as other non-CPU devices sharing the same PM domains
depends on it to allow their devices to be probed.

Let's therefore move to a subsys_initcall, which should be soon enough
after the cpuidle-psci-domain have initialized the PM domain topology.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Tested-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Signed-off-by: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
---

Changes in v4:
	- None.
Changes in v3:
	- None.
Changes in v2:
	- New patch.

---
 drivers/cpuidle/cpuidle-psci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/cpuidle/cpuidle-psci.c b/drivers/cpuidle/cpuidle-psci.c
index b250d0dde760..0187d6a9096a 100644
--- a/drivers/cpuidle/cpuidle-psci.c
+++ b/drivers/cpuidle/cpuidle-psci.c
@@ -479,4 +479,4 @@ static int __init psci_idle_init(void)
 
 	return 0;
 }
-device_initcall(psci_idle_init);
+subsys_initcall(psci_idle_init);
-- 
2.43.0

