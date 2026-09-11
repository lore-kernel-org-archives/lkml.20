Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACBDA37B41F
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789140228; cv=none; b=pxrpXpT8qhvvmt99WVTXuTvCuzz7GrpBYJOAa73WmQWnr7NwN1aeDIRRzWvzU4OIz1QeGk9J30DCRG/0deT5aS2Pnh1yamfOcqi6ZGrFba0ohqHC4tl93TxLhrxnTlnUN68blM+UGiP1PVlF3gldo46gIRclZwtIui7H6rXMqRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789140228; c=relaxed/simple;
	bh=cHC+UHnFTXah7PYvHY5YC/sMeyCMkaCll5i3gjNsico=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p3Jtu3QRp8pxd712WRbiJbWXo+J1bCxj1h/5AR5WauadNi156BzrSaBO3Z0q69XgN4PNXuJbtYazESZ3bHYQmnejyS5r2wKQCLXi0eNsHH8eelTPWqqyVGe5FHJKu9+0y6o/+2buZT1Kt2f0+y2o7913V46AiXF1ZOGgeIWtYBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Suq9KY7z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rq1CnhYj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Suq9KY7z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rq1CnhYj"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BEmBj7222612
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:23:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Urk/tOiIEwK
	LzYvti+etTD7iBNYdIx2xH64rRVioykU=; b=Suq9KY7zVg/VebW6W63FMbrTuJj
	7ap8NNkC4Lsuzv9kMMfAD/4qrM2tl8jxAe/P7CfqHEXFezJMEx93GLLUd4mYXgOP
	MYvLaM3AVLYi3qEn6EHYbpSAoKaKHoydQu5x1EQjM+5m8+FlnmjhShHvXbOb8CeP
	BCMP0JBc4ms6YpO4HoYFpZst5TSnmCXVv0LiCae61u4gTCfHoJo9FzmBcIU1hx6u
	F2hKMEQhv/553GpVDCLEvyMYAhZ6UUsHiQlc1fGGD3vZQQTzfgbaGXGGc/TkaTcO
	QLyW+Io1/xtaBj6k6Vf8sm7/jRYPc4YoowZijbeEXxnHdYIyBdGud2O3D3Q==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmbdradyv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:23:45 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-78580a6b2fbso307394137.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789140224; x=1789745024; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Urk/tOiIEwKLzYvti+etTD7iBNYdIx2xH64rRVioykU=;
        b=Rq1CnhYj/sqKKtosAqiCDmjPSdu+izEnC53r4WfS04tGkNvu3r1y0TLAvQg6gSCllo
         iJK4tUVGMThkFI66Cz7pgafxtr0u3+K6dd1JnqAWNU6GgbIYsogxeizh9dx5N3e683hH
         LdjttzZGgjJa7uqwWjqOEWnwYIIq8avKClkzPC5V4MuOqv2nWXebAr+dP9RxjoW7M8sE
         9YtI844sTPeO5rUoom/VnYSczsJoOYgNAYoJvoappjreuCsML1ss3ubR7X+1LuIVAjw0
         ltVkq/EK+5P1CUQ2HWdMfgIyJFAPU2RK7ZLNSGiqSA9936v+cOJdKGggxtpxHBQycIbm
         X3XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789140224; x=1789745024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Urk/tOiIEwKLzYvti+etTD7iBNYdIx2xH64rRVioykU=;
        b=nPxj2hMA6+nkkQDcW1orehEX5t+QCAp47Z9yAT+q9FzfaeJjH/uRJdCfFJFEWvhfis
         sqhJE8WeHNqkkaXmq/9vaMEvjSfo2yA5XdZe31aixbNWg6YHLy34xzwCu3aGC31CqFVl
         8ALoa4A4p1+nEIw58F+0iy3o6DokdsF2R9H/INOhxUDIYbKNA5icr6f1JdvDgWFb7LTb
         AE2O/wg2B2qj3ggKK63ueyA11YmNIzA2gGYm3nJydmY0deZS4nRVqvUk3wPh+6esGc5C
         vY4nA3FoxGUjD7zPhECKhFVLqKWjHoyo+8aWzAP5JykzDFkij9bc0MLHBuluRigRbhOS
         LVsw==
X-Forwarded-Encrypted: i=1; AKwUvBzzVGlH+zwqJMAOts08aLXXiCZa01dq0hXJe76dT/A7og2s5TER/l6tKD08EFJfiI3bHH2Ol2GqcHRdZb8=@vger.kernel.org
X-Gm-Message-State: AFuF++lBIvVEqQ94DB4RbqfCIRzhhosvY8YI7hpNviTpoffIOrUi83cH
	ftvswFRrIurlZLvKKn52qbLDpuq4KMVhSvMQ5VH/rOP9Q5LbQhG8x063Dud0x0137+RlayYcXNk
	fK8ZBSTJmDQ2xCiB8quC+vsXVLPP/V4O+YtWpBfMQr+B2BwXu/BAsbP0hQX3/jIpDZbc=
X-Gm-Gg: AYBFou1ruyvEgPC9T92Y5X1KXkr/h2nnCvmXPvjkNfKZjkrPmxE8yIL9ZUeNzs00jb4
	nmjjzxU2SSymV71bx4fs5mDLVlUWtATpJmsIEMc+STyCFTUzSqZhqgJzbfqNYG6IMIBhzPDX6pX
	HBrLK5wO87NfFgji2buOrElZIl/xFGDKdZw4AE+IOY6j/e4rS/nvx+PXR/YU0zy0ThqiviEoXRy
	A4CuuXojjkiSfoVSxWZuTbxS6gl2LtYr6uUmZtC44ro8FXGT0WKDxrSj9OuQpsKbqlKmy+0MGsM
	jkpeTPItxk0a1eLVRrHb3pGvjBMylQCvMgzlswQhjADgCZtNpVzxOymhuKScuJmdgVQfcaEY1G6
	jIKnuUStB9H2PGTQoSNEmAx/flBXlp01/q/7fqQkEv8ffRaUWRkzqSRv9M/RUa7IEXddzb2R0/K
	xMLq7DH1siTo6ALAsx9VxHinXk7acfdAjnekFL
X-Received: by 2002:a05:6102:a191:20b0:786:724a:4e94 with SMTP id ada2fe7eead31-792aa571236mr4941232137.11.1789140224567;
        Fri, 11 Sep 2026 08:23:44 -0700 (PDT)
X-Received: by 2002:a05:6102:a191:20b0:786:724a:4e94 with SMTP id ada2fe7eead31-792aa571236mr4941110137.11.1789140224027;
        Fri, 11 Sep 2026 08:23:44 -0700 (PDT)
Received: from t14s.space.revspace.nl (2001-1c00-2a07-3a01-8e96-3679-0b9c-de47.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:8e96:3679:b9c:de47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c296614323csm94042566b.59.2026.09.11.08.23.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 08:23:40 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Frank.Li@kernel.org, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v6 3/4] firmware: arm_scmi: Fix scmi_protocol_device_unrequest() race
Date: Fri, 11 Sep 2026 17:23:28 +0200
Message-ID: <20260911152329.5822-4-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911152329.5822-1-johannes.goede@oss.qualcomm.com>
References: <20260911152329.5822-1-johannes.goede@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 2qV8uD_w6nXIanFVAkUnuex1_bBNtzih
X-Authority-Analysis: v=2.4 cv=PLmaavqC c=1 sm=1 tr=0 ts=6aa41d01 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=EzzhlMzFHTv8R9URApkA:9
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: 2qV8uD_w6nXIanFVAkUnuex1_bBNtzih
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIxNCBTYWx0ZWRfX4m4O2MTe6WKM
 16DfTQm7Pz5J1UkU5SFGttVud0Vq9eqMudC/t2PMS1Ld765YbOdiKh9BbdG+CHhmdAI80XUNPcR
 Xu6EEdo8sqT8mgmAlMjdECfCXCcOR30=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIxNCBTYWx0ZWRfX1DyuQFRjHCPs
 dIKSrUeOvKfpefEtzwsBond+0fWQxIqvt546Ng6ezO+Br96HztiZ+y64vn0cr6iE4+hoNgkjbB9
 PTm2vxrt6UPYXOAnYf8PeXjN4zv9VpAKBhE26SC93XvG5Rv2d0enjJ/tti9H3YApj0krPYskcjN
 9Q1gGf2JkhTXJL/xM6WbU68Z/OvZxnvYlSfHX6lOAcle+cBA9x9/hwJ0UCjgJOiG/TGUr6HFRw5
 cAwAE+IsawIzoplLGqc3l0PXrNvqLJlhlojsARg30CJ1Z5h84/+7aqvcuIiLUZoifU7Uf1E1P1l
 gibxoyeuKz7NSfHjJ/7hQsc7tEFvliIBDfpe82vkdysnf6CrWEBibx+UpAecs/QrpgLDYSS3Z42
 979px624SgjxMba/5HIBPLU6isHcxE5qw7/s/W9e/A7aRBUT1ipbvSNxuwo9JyYrioakhkkGVQ3
 DDqHESUZwpPgvLhEM/w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609110214

scmi_protocol_device_unrequest() unlocks scmi_requested_devices_mtx during
the notifier call. During this window phead might have been deleted by
another racing scmi_protocol_device_unrequest().

Re-acquire phead before cleaning it up to avoid this potential double
free problem.

Fixes: d3cd7c525fd2 ("firmware: arm_scmi: Refactor protocol device creation")
Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
Changes in v6:
- New patch in v6 of this series (Suggested by local Shashiko run on v5)
---
 drivers/firmware/arm_scmi/bus.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
index 6f667e4ffeed..651d4ba06574 100644
--- a/drivers/firmware/arm_scmi/bus.c
+++ b/drivers/firmware/arm_scmi/bus.c
@@ -173,7 +173,13 @@ static void scmi_protocol_device_unrequest(const struct scmi_device_id *id_table
 			}
 		}
 
-		if (list_empty(phead)) {
+		/*
+		 * Since scmi_requested_devices_mtx is unlocked during
+		 * the notifier call phead might have been deleted by another
+		 * racing scmi_protocol_device_unrequest(), re-acquire it here.
+		 */
+		phead = idr_find(&scmi_requested_devices, id_table->protocol_id);
+		if (phead && list_empty(phead)) {
 			idr_remove(&scmi_requested_devices,
 				   id_table->protocol_id);
 			kfree(phead);
-- 
2.55.0

