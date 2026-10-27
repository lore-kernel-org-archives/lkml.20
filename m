Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793104531;
	b=iiCEHNadb756/wyA1BrI4Cv0MKBzumxgaUEEDMA/VLKmztEB3GjjeOZmo6XfW2Pb/W6I
	 7VWloy0cRi1D/VatcIYfNa3n/1Q2pJXK1ddw1tTcwVx+uXMRPgY7gyTFxCDUdTUMaiznp
	 x/pG/0O9WbAFGasPYRrFiNeiVJVRkBbtZ6INe7nY192sZoD1vkof1EBmYlRE8LtCfWgTL
	 WFy5LibHieHEof2LQzIHPBgdeGd3Wbkw5AvN0QiuhgUfJl1JDxLNx2w+tEBtOWB44i09Y
	 Zes8JxOT70sz80N/9ZbuXFOkQc0oPabWkm5z5iz6C5e8tQCz57twkL8ckRwyiT1db3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793104531;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=rmsSccCdCVqEkz9rVQlbpk23rbdxQICURfkwTyElrOE=;
	b=vHL1s2yw03wurTlEXJzjVRhc/XseK3zJydrwyLSl/gfYaNc9Q9LbzDqrbQtSFSPRKO7D
	 Y4qEkGehQZVXyoPYx4GkL8uMXnFMxfrATOdRG+E8kCDfY/xmIOYNzaFz2x5uJUevZcWK6
	 FfufnCvxu8J4mG8MgwhB6m+6evHdu/EVFyzV/7bRGFvUl9Gltp9MynW+zCCTm0mVfnZE6
	 XfhjaBnbrpIcg+DersZRgRVdmVbpw25MC9yJ34clxpOkwDZMxPfNaGeuBG0apVyssqO+f
	 r0l3Bk64agAv8+X0+BhdhXbRNEg1vH/O7ufuiw2MEANtPdwLzYZCQ4iW/crIMnBW/yA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SyFUWO2s;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iQeJFbPw;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E792606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:35:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E792606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SyFUWO2s;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iQeJFbPw
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAdvII1614507
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:35:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rmsSccCdCVqEkz9rVQlbpk23rbdxQICURfkwTyElrOE=; b=SyFUWO2syPxPDET6
	7LmY9HH6Hl3n5bBbrQpND3yp0XaCpbpAzaxrWqm/23YjGWZ+JuO52POoX6Kamu0v
	nImeUsn/j3nYckOnrFBK0F7a2C9w5j2u0Ch88S/+K4nliaQM0I3Fj+1AcoVR1Yii
	5i6W5RfI/EMv5O77RKFV36nnmAvYW4Vj8LIzFBZ1j37160A7bbPu2NydCzGL5ih8
	Zs+BUrlfLyFsl2iOpgXXXn82ApBeFcDbtFieOiYD56QaXnwMpWQ5TGIbHm9DbErY
	G8G6RWnRxx/urEJLSmKHD8zRpUKKtG7pcqQO2T8LBXaywV5ICgwKUYENWspmjNAD
	PO4zdw==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjqf5s5x6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:35:29 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-86c3a053d9bso61381677b3.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 05:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793104528; x=1793709328; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rmsSccCdCVqEkz9rVQlbpk23rbdxQICURfkwTyElrOE=;
        b=iQeJFbPwd0Dt8k3dSAR9fZHyu0W/oe9pjhhhzptg6Vh7Z7J850/xJpUEVOduIiIGT7
         Z06MSZIgKe1S7t2g0q49aSjMBGfag4wez7d541WzpaI8Q2Do7m4MXwAdMA6BSRl8vs1y
         9JOZtzxQVtGR+TVfAkvp277zvZbJ1GbmKSg2L/2YHDg63G81kHeygP1SfxUfegWKJCOT
         Etz7PU2eesTRHfs8BK2+7i9U5Gwt2/YdqRDcIa7aRTB3k0LxKhwU2pI+jzdBXwE78XGv
         QwwHjQybNNbpSAQXIRuIklCaZY4+FVXzOnS4ep05YUILaC3PNbUfSaic+1yf+Ine/1pu
         T6uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793104528; x=1793709328;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rmsSccCdCVqEkz9rVQlbpk23rbdxQICURfkwTyElrOE=;
        b=se2xW1L9J7XRNkjtboa2+Ud3jcXhRu7RAfVgHusEzckDMR6E7Vj73lqlnctlaL2zqI
         q+tOuhm6MHYhtfTqff+mkOWTU4HGdjHyFrz0/tvob66IHDsVixs+pQ6J7DXyOES/wNsB
         d3musj63nV8dxhDEwJGQVJNoB9aXLh6EG59oPmhxHz0AYJEYSlyZIzQ/ZHMLdqQn2oC+
         1miALvjBBcN9ySanXW0q5HQXkynfWHEK46GnEKPj1reXQ0j2Ae75/a3x8FKAZZ3vsQNa
         /5w4u/Quzaqw6HpqFVjzD267If3nDDiTIhn78lVKBj1EMnTGXqAz0fhvXfOJNrfZU3X0
         7fyg==
X-Gm-Message-State: AFq9FYKHGAM/tO+piOxWOuV4MPI8kzmU0n2RAj09znuhLgBwNqdJjTQS
	T12lTi8yMr5AlKTxB7fkrhaKUqIcgU3gGDtSTN7a4AbAH01IwLz+u+XzYWkgnSib+excOmizkcI
	7Xv27ovP9WIilgsJP2L5dpwttoylfFm7BpxEaqxTY9K2f2w8nTRfChRPagOeY84ftzhA=
X-Gm-Gg: AYBFou1YWvkBH8LLN1GYJvNgczK1SDE3ddNdjzSeLaa14MgIuMmy+TgYsY9gYEf9TIA
	5DexraIlfMLPHMqI1KWZBTkci83SbPa5yLmu9IE6DLjDikNxsEeyTTo1GuS+xptQIFHFXAuqy9J
	VBRO1QIv2T5VYR2L4wmYY3IPANpJQYmea1ClrUwirCDBZOnMAKbxxE7pnrHF9gvLlMANJQE3ilv
	o15gFvHmhjL+PT7RVP4+GeH9xywHvILfawaa6579YGny24mWDQv3Q/1EpAg8Ml96yuQz3o7EoSn
	1T/++lOH1MufDxs4AcXi4OcGHr5mhcJp+7kHauH0uxKLCe4e43ONbIcfieUg02J1GLu83x544W1
	g3HU4/BYp28wkPOmG6g==
X-Received: by 2002:a05:690c:d85:b0:8b0:d4d8:e0d5 with SMTP id 00721157ae682-8b166ca3a17mr80538427b3.59.1793104528273;
        Tue, 27 Oct 2026 05:35:28 -0700 (PDT)
X-Received: by 2002:a05:690c:d85:b0:8b0:d4d8:e0d5 with SMTP id 00721157ae682-8b166ca3a17mr80538297b3.59.1793104527694;
        Tue, 27 Oct 2026 05:35:27 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b19e57d131sm10413507b3.20.2026.10.27.05.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 05:35:27 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 18:04:19 +0530
Subject: [PATCH v5 2/4] regulator: core: Parse regulator-off-on-delay-us
 generically
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261027-regulator-off-on-delay-v5-2-f9c3b128c6d0@oss.qualcomm.com>
References: <20261027-regulator-off-on-delay-v5-0-f9c3b128c6d0@oss.qualcomm.com>
In-Reply-To: <20261027-regulator-off-on-delay-v5-0-f9c3b128c6d0@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Saikiran <bjsaikiran@gmail.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793104512; l=5262;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=Mb+M13JU33yRl5ikfmNSIlfE5FNtWfL/XYrlwXjHaO4=;
 b=phXB8dnkOoxUJ8v0LWqSSWOfE0HrIW6SKSKQDL8XhnEpNDY88R/Hd3QbR3qO4HDss9J+xbEnn
 fr4oPndo5wkAmScoja96va5CsjgBxqaCe6X0q4GPx/pqRZMyYjG85Sv
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA1MCBTYWx0ZWRfXy3N5gtgUmhEY
 lTs3Ujiky8Pp6tvjjX/2QtDoFART4nqbu7m3ggJPcMmzCUZISTijZO/w8WaMytNqZCOoXp9ueR9
 hk1gxf+wCca5QIq6Da5zM+C0dU8IJZI=
X-Proofpoint-ORIG-GUID: OBef9915xfCYLP0pdKL2MTZbhOsSa5Lr
X-Proofpoint-GUID: OBef9915xfCYLP0pdKL2MTZbhOsSa5Lr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA1MCBTYWx0ZWRfX0AHD3wvaKxLG
 6KYEPwttqnPjmPWITB/qZhhFzGOiisYBwXhYAuPDUDXFfTXTs5nxwqxGD5kw0rK+FzsM3/T1tAM
 ddJNMrQndqkDGnDl744vhVmT1u4sEgE5hoOuXY18Eqqg6nQ3GiYVjResxtbA7cE51panqQBQ/dv
 btJMptbHdI/LaE+wEbwl1ql4mNuQxsEdLhatHSwoTLa8MeTFuJlLzZt2UzntiqXpdTHVQdMa6Se
 1A63MqfEX/jHmYAwJf/OAUR1UaUUXAutO8kQ7vfii53si6v3eFpvnAfewcbQB7IQ795TOmtLugI
 tCeL6DoXrRCfIqsmnxOnIjIaJfyw77NQmTUUUUq2vErti8rVude6JeIqDsLCUccd/X5WQa0eZWh
 i4AcJtyI3ZlDxQzT56ErTBybek1rZvdqDXAaR4xxfHen+J/z1Rrn7AImG/AbMbsuf9WP6SK8B+c
 e5EnmlMeSIMuEgV/JEA==
X-Authority-Analysis: v=2.4 cv=UOFIjyfy c=1 sm=1 tr=0 ts=6ae09a91 cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=f4amEbVUL3UPIz_tOzEA:9 a=QEXdDO2ut3YA:10
 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 clxscore=1015 impostorscore=0
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270050

off_on_delay is normally fixed per regulator type in regulator_desc,
e.g. hardcoded for every LDO a driver supports. But the delay a rail
needs before it's safe to re-enable can depend on board-specific
factors like attached bulk capacitance, not just the regulator type,
so some individual regulators need a different value than their
type's default.

Add an off_on_delay field to struct regulation_constraints, parse
'regulator-off-on-delay-us' into it in of_get_regulation_constraints(),
and add a _regulator_get_off_on_delay() helper, so a
devicetree/board-constraint value takes precedence over the driver's
static regulator_desc value. This lets drivers rely on the core to
set this delay rather than parsing it themselves.

Suggested-by: Saikiran <bjsaikiran@gmail.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 drivers/regulator/core.c          | 18 ++++++++++++++----
 drivers/regulator/of_regulator.c  |  4 ++++
 include/linux/regulator/machine.h |  4 ++++
 3 files changed, 22 insertions(+), 4 deletions(-)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index 6a4008f387b5..537384c55d6f 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -1401,6 +1401,7 @@ static int machine_constraints_current(struct regulator_dev *rdev,
 }
 
 static int _regulator_do_enable(struct regulator_dev *rdev);
+static unsigned int _regulator_get_off_on_delay(struct regulator_dev *rdev);
 
 static int notif_set_limit(struct regulator_dev *rdev,
 			   int (*set)(struct regulator_dev *, int, int, bool),
@@ -1695,7 +1696,7 @@ static int set_machine_constraints(struct regulator_dev *rdev,
 
 		if (rdev->constraints->always_on)
 			rdev->use_count++;
-	} else if (rdev->desc->off_on_delay) {
+	} else if (_regulator_get_off_on_delay(rdev)) {
 		rdev->last_off = ktime_get();
 	}
 
@@ -2071,6 +2072,13 @@ static int _regulator_get_enable_time(struct regulator_dev *rdev)
 	return rdev->desc->enable_time;
 }
 
+static unsigned int _regulator_get_off_on_delay(struct regulator_dev *rdev)
+{
+	if (rdev->constraints && rdev->constraints->off_on_delay)
+		return rdev->constraints->off_on_delay;
+	return rdev->desc->off_on_delay;
+}
+
 static struct regulator_supply_alias *regulator_find_supply_alias(
 		struct device *dev, const char *supply)
 {
@@ -2985,6 +2993,7 @@ static inline int _regulator_check_status_enabled(struct regulator_dev *rdev)
 static int _regulator_do_enable(struct regulator_dev *rdev)
 {
 	int ret, delay;
+	unsigned int off_on_delay;
 
 	/* Query before enabling in case configuration dependent.  */
 	ret = _regulator_get_enable_time(rdev);
@@ -2997,11 +3006,12 @@ static int _regulator_do_enable(struct regulator_dev *rdev)
 
 	trace_regulator_enable(rdev_get_name(rdev));
 
-	if (rdev->desc->off_on_delay) {
+	off_on_delay = _regulator_get_off_on_delay(rdev);
+	if (off_on_delay) {
 		/* if needed, keep a distance of off_on_delay from last time
 		 * this regulator was disabled.
 		 */
-		ktime_t end = ktime_add_us(rdev->last_off, rdev->desc->off_on_delay);
+		ktime_t end = ktime_add_us(rdev->last_off, off_on_delay);
 		s64 remaining = ktime_us_delta(end, ktime_get_boottime());
 
 		if (remaining > 0)
@@ -3243,7 +3253,7 @@ static int _regulator_do_disable(struct regulator_dev *rdev)
 			return ret;
 	}
 
-	if (rdev->desc->off_on_delay)
+	if (_regulator_get_off_on_delay(rdev))
 		rdev->last_off = ktime_get_boottime();
 
 	trace_regulator_disable_complete(rdev_get_name(rdev));
diff --git a/drivers/regulator/of_regulator.c b/drivers/regulator/of_regulator.c
index 09e26febfc83..990946b27a7a 100644
--- a/drivers/regulator/of_regulator.c
+++ b/drivers/regulator/of_regulator.c
@@ -178,6 +178,10 @@ static int of_get_regulation_constraints(struct device *dev,
 	if (!ret)
 		constraints->enable_time = pval;
 
+	ret = of_property_read_u32(np, "regulator-off-on-delay-us", &pval);
+	if (!ret)
+		constraints->off_on_delay = pval;
+
 	ret = of_property_read_u32(np, "regulator-uv-less-critical-window-ms", &pval);
 	if (!ret)
 		constraints->uv_less_critical_window_ms = pval;
diff --git a/include/linux/regulator/machine.h b/include/linux/regulator/machine.h
index 1fc440c5c4c7..79b2d7cab934 100644
--- a/include/linux/regulator/machine.h
+++ b/include/linux/regulator/machine.h
@@ -163,6 +163,9 @@ struct notification_limit {
  *		      regulator_active_discharge values are used for
  *		      initialisation.
  * @enable_time: Turn-on time of the rails (unit: microseconds)
+ * @off_on_delay: Guard time (in uS), before re-enabling a regulator.  Takes
+ *		  precedence over the regulator_desc field of the same name
+ *		  when non-zero.
  * @uv_less_critical_window_ms: Specifies the time window (in milliseconds)
  *                              following a critical under-voltage (UV) event
  *                              during which less critical actions can be
@@ -222,6 +225,7 @@ struct regulation_constraints {
 	unsigned int settling_time_up;
 	unsigned int settling_time_down;
 	unsigned int enable_time;
+	unsigned int off_on_delay;
 	unsigned int uv_less_critical_window_ms;
 
 	unsigned int active_discharge;

-- 
2.43.0

