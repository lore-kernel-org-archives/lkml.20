Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793376597;
	b=wc5yRDppdMkSlRlMNiP7Oh67OR7FYnUv2Tz8ROsdV5vKFHnc5hpNOjz8nERLc3tuD4iX
	 C+VqbkUvf6PiHnrD5XSmg23IRv+O+Faq+8tzjZ1EPoUA53etZS2a+IL2IgzZ5MqZxEpJL
	 Q3XM8WEY/NwQIBHaf0EFla9ZBzGXIq8JF3Xjtcrww59BMxf5OSCsNJJVwsqr8sVTMPmeD
	 KktJlMTnWec7ihQyNOMqJOdOhXFLOwTy71iWG1Bt5R9Fbf9h+LKlSeZGS8Xax1lJchghg
	 OCvJI4EJG3a8A0u7oq1+aRmhYewDTctgjduKjWZDuAIVBnO16UVYPAYXhg6Rcu/wcIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793376597;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=1AYa/vYlLDzFz5Cu7GUcbH8FmJ6yEd4e4C14u7b+OtQ=;
	b=JhoRsrid/6Jz07THwEdwUvbE1A0Ug8EbXfxV/SDTwOnSRaW8fL6rkzolsDNKV4jyfLG0
	 Ef6uEE9Ib4vJnynbPT4kddoXqcd1LagRkKTxbPFHcUbXcrOFZLav8NVZPfcxKNHl1ucxH
	 fRhI1J5GrrYvwASw7IY4a5U5kN/n5if59cI5e8Gzgx6aW15Q/0wYKPiy6cat/k6tvW6+F
	 kkX5eu0zZUm4KeHFBwwcAHv08n7EY/VlXaJxg0ONKC7JVb/Mh+bH7UZwujg7tkqs0mLeC
	 ti4urEevJJOOKFWbmpKZWmU2h3W4BaujdAbR35gE2r0KZyDgSNnvc4m7B6nDHIaxBKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ay4KeWRO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gdMHw8W+;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E7C606A338
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 16:09:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46E7C606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ay4KeWRO;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gdMHw8W+
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UERDog4102996
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 16:09:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=1AYa/vYlLDzFz5Cu7GUcbH
	8FmJ6yEd4e4C14u7b+OtQ=; b=Ay4KeWROteb22jNsNnpmqiD9vdwZdIDane//9R
	MRyU9iQCSeI5A4bZuP/skHDNo8pkiXeGYAagPkOt6AdO+zJO44L0H++osXtjnyFK
	fjnOfKdV3GtWSYnY4ZyS83w0NmhETl2/BAWSimvAUAdHRreKE3zjpmLEhadH6A1F
	vyC/uclG0HvyGh1it4rm7H89hautcvNge/65WoPDoYj2/fcvggd3lZrfs9T8lZi+
	wstwkmCX04y0Z9uIRqXN+rVCBes6JPFzkub6jfifEtjuVSWoivOiYWysfrW7ThlN
	VZ5rFoVeiO2HimC7DOfaQnYOpUM3ftb2R+f3kTfPLQ6D5iEg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qkwsu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 16:09:54 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7bfa915da7cso763017137.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793376594; x=1793981394; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1AYa/vYlLDzFz5Cu7GUcbH8FmJ6yEd4e4C14u7b+OtQ=;
        b=gdMHw8W+BK5aReKWdTiklht8fUZ7wtAhQuVV72BTK9Rjg6Sl2OG9mzsTW8J6f/kKbG
         WTDNscg2+mvrL3zssK7ZKCB3TCNBkVMI0bFB5Y988v7O6l7EiwUwtyHbrEkhfTTt33Rc
         zH1Tz0S8ddiREsehtjITTu96i7pcwLx7r8PzXQRW2bc8myYX8pD6vNae5QJJ7ZMesBQO
         rDuOQySn7PQQuBG1qb23RftOXjPlGs0cg1J8Ri7TBa6zgYCvf7Hqq4BksrPCEGCjnhA/
         hAV++ZmO13kjdXm1YnGfhQ16HLE3Y5CWPBjcIiWfapt1AwyRcSQ7DENAFaVVKU2cOEXx
         czXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793376594; x=1793981394;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=1AYa/vYlLDzFz5Cu7GUcbH8FmJ6yEd4e4C14u7b+OtQ=;
        b=QyLmMi/Ss3kGILOKN5i9Mxg6yaBbzEtQO6XU01AerFJbfLfheuTiDBAEAr1EQUf/f+
         09L7csnypIx1qwAnWaqDJR/+17jvdYvtElIr1RkXc3NW950w6MJbTsBc0IZV3piziuKL
         mAcjzXChejWgwFCvSszq7R6969jH+RzZwq7ohmtPANa0dueyPk/c3ipEUwhh7rQ0yPcz
         Y7DZe0Lc3z7bY9oXSvauQdftEy86/zurK7OBJKXQ5fNo1aZr5XkGC8t08n3thgPye+UM
         oB7v5pddoWsuwskN2tK6gSwh8yjDmzQrm0hkiQPmI5kAZcMpgXQcFmLAcOGb2Fl4EMAS
         2sKQ==
X-Forwarded-Encrypted: i=1; AKwUvBy4INPX+wbJpqKFgB+O3p6KHsgfcbRh/HxpSLS6lr475hkRM5f+d+F8t7XtSK2K2QBSPfZAS7KnDc4P7Ts=@vger.kernel.org
X-Gm-Message-State: AFq9FYKC0gGxcnJ+f1uiclw4NuzFdQv4iK5PWjOCI7ADR4lFOiyS7zpv
	VE5GFrmEuG7FMJoQw3U+s2652abjkJlj00c7IZ6RbaqCaeiQjg11bpA2iA0CBmEWVFvZSeG3Fw/
	Vgpr6AM4k+ym1RUjDquDDQhyO4xl2yfQ72eK3eGrtjQLj/UjhozkRZt8O/XeADZswY58YY8VWEt
	A=
X-Gm-Gg: AYBFou0H1Op41y+5SzPCZjmXo0hd3MGJpjkDnVrxlWm4KqYlU4LwJa7fftXSub9BtBb
	QdruwpU26vWGmnrhMt5E0a7kAYRQN8y09t4OEzTWGXvH9RfiFe6j9vGzxURHHNnVMU9TwNkTZ42
	0In14R7lv7JwPuwo4VKB0ZHUtCjSrR+tY835Pf310sFk642C+kBHm0vf3/PCvdnlkMs5YLA02ou
	my4DN9MxqqpJfxMEwyiOpImU4v1qUgMxm24WPM+FezIxsa8BWYb0lcgRBe6qfsefc157cs8OtWd
	yB7me4R9MN98owmz1+GQCaiEK/0jfnjkH3XgUjoQknLRtWdrOxf6/QgrvZ/RaIZtCdtVTyKCJd3
	WQCAT+6dOra4mzUWWk3SY98jD5DxnRMrH8pznIw1RKJmmMy2ijwWQqWqQ3M0kTGQzScfJpTFNCz
	0rAaohOz2zltyO8+m0HTiDDl9nvUcspPcxfhJvJnbQTQGUsSSiapKudtvHJRVb9hTab2jBMdaDf
	+OtIR2wj4VmWsSXd4j56ZkQLzE1
X-Received: by 2002:a05:6102:370d:b0:7cb:cfcf:3d01 with SMTP id ada2fe7eead31-7d05432ac0amr2197844137.33.1793376594255;
        Fri, 30 Oct 2026 09:09:54 -0700 (PDT)
X-Received: by 2002:a05:6102:370d:b0:7cb:cfcf:3d01 with SMTP id ada2fe7eead31-7d05432ac0amr2197839137.33.1793376593802;
        Fri, 30 Oct 2026 09:09:53 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:9d77:8e43:b62f:d85d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b7246fsm4044103f8f.19.2026.10.30.09.09.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 09:09:53 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 17:09:52 +0100
Subject: [PATCH] PM: Use IRQ safety to handle sleepable PM clock operations
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
Message-Id: <20261030-clk-leak-v1-1-db8cb68a5a8d@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAE/B5GoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDA2MD3eScbN2c1MRsXePURLM082TzlEQjUyWg8oKi1LTMCrBR0bG1tQD
 0pZsUWgAAAA==
X-Change-ID: 20261030-clk-leak-3ea6f7c7da25
To: "Rafael J. Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Len Brown <lenb@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>
Cc: linux-pm@vger.kernel.org, driver-core@lists.linux.dev,
        linux-kernel@vger.kernel.org,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA2NCBTYWx0ZWRfX6jl66FguzRQ/
 WX6OxSKr2waIaoZVRf+hEQ1GjDwx9dP1L312VRqGrZjrqwYt7KW6LDMyXpOT6AoHTvlfHBRAAO/
 teL8bvL9PqsukoaKth0WNYmtWEy+KvdgZm/xgjOImPr0jPG6+GUq4eVzqnYtGSJ9QF0rvxJjsc9
 vGI7XeD4jvBOKA7ji+796wjlazmhDGxIV52x+RNssxUBAtCeIA4QPcNZlamkcvBL8fk6prcCNh/
 6+Xt/wQ8ZNIjx8oEipQb5uhyDjRIvRMjU2Y2inQlsGuOh38TBl7XRXHiU8BH2cAVaEA8NmaccMF
 tXEhg+eNlsoIZnUdwF/hEY6SE48kvrJyWFDeeGxc9kwxlXRgpXCUgZxGJUyiQ86chRHvWkMgE/J
 Hvw/vkFFVhL64X28Zj2P1JufIuJIMUZPjZwnPJ+c8fdUdjKCyPa7R4erFDhUy9czgN31Jr8mXgn
 S75YFyFxJrwsrCScymw==
X-Proofpoint-ORIG-GUID: Hgsbm00zA-pODqzsybGVJJ_33otaXWSh
X-Authority-Analysis: v=2.4 cv=IeoSymqa c=1 sm=1 tr=0 ts=6ae4c153 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=q1VT6stkq7JPu4EZEUQA:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA2NCBTYWx0ZWRfX3aZu+2KXT69G
 RS4+3g7dsTL22Ka7wKmKb6wDsDJPQsMIeTzrK68owLp40skHA4BCrXShPb6CUhPP1ICYv8/Zm+h
 prrVhasg7ljJMC6WbcId5kO6nVvBi1M=
X-Proofpoint-GUID: Hgsbm00zA-pODqzsybGVJJ_33otaXWSh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300064

The PM clock runtime PM handling currently performs unprepare/prepare
in suspend/resume operations only for clocks that exclusively implement
prepare/unprepare operations.

However, this logic only considers the clock itself and ignores its
parent hierarchy. As a result, a clock that uses enable/disable
operations but has an ancestor that relies solely on prepare/unprepare
may leave permanent prepare references on both itself and its parents.
This prevents those ancestor clocks from being fully disabled.

For example, on Qualcomm platforms, this can keep the RPM XO clock
prepared (and so active) during runtime or system suspend even after
its consumers have been disabled.

Use the device's IRQ-safety setting to determine whether PM clock
operations may sleep. For usual non-IRQ-safe devices, defer clock
preparation and mark the clock operations as sleepable. Suspend can
then use clk_disable_unprepare() to release the clock's prepare and
enable references.

This changes behavior for all pm_clk users. Preparing and unpreparing
clocks across suspend and resume is generally expected, devices that
require PM clock operations to run in atomic context remain IRQ-safe.

Reported-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/base/power/clock_ops.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/base/power/clock_ops.c b/drivers/base/power/clock_ops.c
index 3b8ba27802a800bac29abd8e21756ccdb0f2a716..b919a1d08cf4611067e626dd1131be870200838b 100644
--- a/drivers/base/power/clock_ops.c
+++ b/drivers/base/power/clock_ops.c
@@ -33,7 +33,7 @@ struct pm_clock_entry {
 	char *con_id;
 	struct clk *clk;
 	enum pce_status status;
-	bool enabled_when_prepared;
+	bool sleepable;
 };
 
 /**
@@ -177,10 +177,10 @@ static void pm_clk_acquire(struct device *dev, struct pm_clock_entry *ce)
 	if (IS_ERR(ce->clk)) {
 		ce->status = PCE_STATUS_ERROR;
 		return;
-	} else if (clk_is_enabled_when_prepared(ce->clk)) {
+	} else if (!dev->power.irq_safe) {
 		/* we defer preparing the clock in that case */
 		ce->status = PCE_STATUS_ACQUIRED;
-		ce->enabled_when_prepared = true;
+		ce->sleepable = true;
 	} else if (clk_prepare(ce->clk)) {
 		ce->status = PCE_STATUS_ERROR;
 		dev_err(dev, "clk_prepare() failed\n");
@@ -223,7 +223,7 @@ static int __pm_clk_add(struct device *dev, const char *con_id,
 
 	pm_clk_list_lock(psd);
 	list_add_tail(&ce->node, &psd->clock_list);
-	if (ce->enabled_when_prepared)
+	if (ce->sleepable)
 		psd->clock_op_might_sleep++;
 	pm_clk_list_unlock(psd);
 	return 0;
@@ -371,7 +371,7 @@ void pm_clk_remove_clk(struct device *dev, struct clk *clk)
 
  remove:
 	list_del(&ce->node);
-	if (ce->enabled_when_prepared)
+	if (ce->sleepable)
 		psd->clock_op_might_sleep--;
 	pm_clk_list_unlock(psd);
 
@@ -485,7 +485,7 @@ int pm_clk_suspend(struct device *dev)
 
 	list_for_each_entry_reverse(ce, &psd->clock_list, node) {
 		if (ce->status == PCE_STATUS_ENABLED) {
-			if (ce->enabled_when_prepared) {
+			if (ce->sleepable) {
 				clk_disable_unprepare(ce->clk);
 				ce->status = PCE_STATUS_ACQUIRED;
 			} else {

---
base-commit: e726cf08ee6ba7e8b852c77760f12c59f90f1338
change-id: 20261030-clk-leak-3ea6f7c7da25

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>

