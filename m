Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793018909;
	b=HY+S/OUIZm+1hbzQoTd7Nzawz6/Z9wQ6AS7+PkCNX8cHLJkQn9bLrg35AH1Q6Niy+kF4
	 CR7omvUmHNx7e5IYL8GoUeDxAgz4b/pATAoenWIlUHOV3xyMhugaZVTX+PVBaL+1LGlhq
	 YcKrhnJI7w3sVPL4UrPC0CWJDbz9bVhVYnCL0d5l2Sh+OCRf45SEO6B0XsQzCbpCHPsv3
	 QmmkNcr8+11wj0UedOp78jLv4sHeYGRPy+kRByjYIV04MOP5dD/yYyb0+GsnLgAtfxiwg
	 tnZMgcGXNkeNYvl67zl19yWPkz01a+qwleXVc+/LFMNkokXMtof86Tl6Pklz5Tknegg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793018909;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=oLrrooat79HtkN3dz5cx1qFd3lBwlFNkO28qDmfrYY0=;
	b=qFT2g5Gf3x6McZ3s08+shs62AOHlqxqGusU1a8RI1WGaMflMN7Vii7CroJ/ZEXGmEQZh
	 EIirXWOWjCLf9V0jHyk8CIwjB0dI9q7LJpncfBuG3MjNV/XQ6DBpKDK/rLY9IfeIWBpMk
	 livo6WzhIHU6vKHIuoKLTD2vGXfE+lP5/shw06776v1t8Or89Eg4mlRAI7G+y+gLEKAGh
	 W7MNRzk34eH7KxYSkZjlpY1gD7qAhK6oBf2z0ZcPmSpZQvL3IPUccAAfkW17f9XZcw1u7
	 PIdnsaDlKe8ETgKZLdC2lmn29OdrtBi4YA3/wS/M+MvbO99RLi8FlCtDZlvKrlVDOQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PPih1DaC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IzPZ3ShJ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55893606A322
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:48:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55893606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PPih1DaC;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IzPZ3ShJ
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAtKsh3563659
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:48:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=oLrrooat79HtkN3dz5cx1q
	Fd3lBwlFNkO28qDmfrYY0=; b=PPih1DaChJtnUNubASFi8/iyy+OXg2ud4IdU+O
	5aXLsmcVzPiKyyFoucDzUXlEPseoY1YBST6cY2FBH/D+f1hK5n7aVdnXJcT9j8ba
	zqOG+pczqo9rVdzUJx04+AKvIX8skXi1iYOyErlhfbEmHgjAHF8GqNn8R0b7JVFh
	2oJTrRuOhiDPZpDNwRM7dp/SflDfXPCOIYPWhFhk+7WOw0w+U46VCYfi01zvKMwA
	2WuqgtPabJSUVrnTWwtoj0Co9UP9j8jylw6NTPDZrstE8c7ipWWujnYUtNETwuo/
	SjdIMpV4DBtSi5X31Onfikmx6xagBWAjVXjvAJKaFxESLAcg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4s90msh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:48:28 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f32050e72so653881585a.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 05:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793018907; x=1793623707; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=oLrrooat79HtkN3dz5cx1qFd3lBwlFNkO28qDmfrYY0=;
        b=IzPZ3ShJzVR0E6RBbPSiYunDgbXfj7+fo28kDKsoGvasZJthTHjetn8jTRRdMrJGBn
         tetxiz/ypknKVx3nlilLCMvP8DDin+2CyBg3BjAtcL+GaAQcWWlH7H9clYC4y9xzSoRC
         2tTfJzKWstXLkLj8K4PSdIS4GZ2KEKcqTIL9Q99JMi3pa4YHMDLdXRNEs0QHeWylOz76
         0BTIvR9kjbnTX9n1Cux0sz4QaW6UQKze2NobbSy5FY/6/cr7xqWu0wHbkK9HWsegbI6Y
         eiQ0ZO9PgcIciuwQzI8aHdvslfbJfXPzUQNA28syHC93G07j1vuOjgFYjOOteCiG51D9
         4LyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793018907; x=1793623707;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=oLrrooat79HtkN3dz5cx1qFd3lBwlFNkO28qDmfrYY0=;
        b=aMLVtB2osP068h8kCrB6uUWhj9Pag+3Q5HW4pUcMlkeOwK6OTMLWXBvZL+aGNMkvVM
         y6yHEPpPQS/ln++SaX/Vc8vzHZC+VOaefk/z2X5cNEIor3mpx+AqTLh81rw8UQpCUBN6
         HDhJduHnZuXjZcO3uc0cRjSoY6JDCmt1GcJWrKy3PWeXhv0ZnumhkIpg25erMUo2PPSm
         igsi9JDLeH57ZHPBtxTGZ5AtCbYeOaHQiCXgK1rdndAAHVPND3u5brqMIs/Sk3RrDaY8
         5r/kGCSud+UadM+XFFCVOhVxixLHsmN+lvDOCJNVNI2W/a39tljofiVvnvZ6IGJn1hNr
         zkSw==
X-Forwarded-Encrypted: i=1; AKwUvBwl2IeWt5UGTgsaAEVDrmU9/Mzt6BQcxQ0lUPouOfE3pk6GHlKdHWOE9jVUO2xmMAXhQG2okkJ6mOy2xew=@vger.kernel.org
X-Gm-Message-State: AFq9FYID5vKfP5rbNV3Zq1ow5b5/kMB+ODXvfnRInzgzhkHq2MWfi2/u
	KeXo+onkbaxLmJ53Tfaad8S0yyAyWIjOMjJO/bG3KQaQ8oYQqS8RJOuL8kUvnR+jZPztCFI1xE3
	6kTVAU5QxUhIqqnkQGUecbCQ5/QnRNddBVLvWO//SBa3eBSJAxZ3cbhL6B5R81FyZlkY=
X-Gm-Gg: AYBFou0mBHw4A8YYJvF4eJo+n1v5q1IOKRrjAi5zCmmysLbt5h0RGBx8uEODiqp49xH
	rQyq9Q+xBWlaJqNuupa445LK+GwYWDcuiV5KhuscDoOiqzTLKg9Ar30U8vfvqMjsubEnMPJDPmL
	CzIgJgGL1WV1Bkhx/QbWAfA7yt6+QAvdt0lMLl3u6vIi3tsP6+JLKq2E/37KJCbKDQsR9gWQVq6
	8IroGRT3gXTpLmP481lfkfE8vD83+rcHKrbk1DaOaXxPN5DGsUuoPPwBYVf/To7K6lHOmm1t+HE
	A/zh6uXQHvDejhxiRSpU2FfgrkRzmEz0C7eC8+xShznQFe1aZXTm3woR6kPIYvuDC2bLtfbBWMu
	6klTtJxK9bw==
X-Received: by 2002:a05:620a:4150:b0:93c:5bfb:9a80 with SMTP id af79cd13be357-940ef7aad70mr972310085a.3.1793018907342;
        Mon, 26 Oct 2026 05:48:27 -0700 (PDT)
X-Received: by 2002:a05:620a:4150:b0:93c:5bfb:9a80 with SMTP id af79cd13be357-940ef7aad70mr972304685a.3.1793018906663;
        Mon, 26 Oct 2026 05:48:26 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3da7sm17488711f8f.20.2026.10.26.05.48.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 05:48:25 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 14:48:21 +0200
Subject: [PATCH] spmi: pmic-arb: Set the interrupts up again when restoring
 from hibernation
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
Message-Id: <20261026-b4-spmi-pmic-arb-restore-hibernation-v1-1-5f2438dc7813@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIABRM32oC/yXNQQrCMBCF4auUWTuQxFCjV5EuknS0I5iWmShC6
 d0bdfEW3+Z/KygJk8KlW0HozcpzabCHDvIUy52Qx2ZwxvXWuCMmj7o8GdsyRkkopHUWwokTSYm
 1BTCYU4y+9zacA7TUInTjz+/mOvytr/SgXL9t2LYdF0y4M4gAAAA=
X-Change-ID: 20261023-b4-spmi-pmic-arb-restore-hibernation-807aa4641898
To: Abel Vesa <abelvesa@kernel.org>,
        David Collins <david.collins@oss.qualcomm.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3957;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=576hds7YFmxgz0T20j6TL25eLSSQ48tiFuGk7ikETeM=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBq30wYuCXxhZFe+OKlD771JB09ztGr2Ztr2MwJq
 m1E+ShpkRKJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCat9MGAAKCRAbX0TJAJUV
 VtMMEACCrlzraYJ9tnzqbs9ejB36XZNw+QbtK0DtlgasGUtXKrzCwc0rsgzlA57w/5LWfTRT0Mq
 +eiKms94IBLztnpN8uEMjFfPTZETpakUWzUi58QSpJUzhF9+YD3dnoWtn8z7E6hqEAPWLH9upaK
 TsAOcc/ufn3OzqyD/LGkqjy5DCdjB77/YaiS04C41/cc+fyCZVLakh4VtAjvToIqL75veeLmqxZ
 6Q9HtFrQgdP94s46JZG5Fo0fzqKzuWv6uP5CcYy8JH0zNMrCTJP8t/2HLYDkjaOTObHG2xfjx4h
 iAWnJtOou02V14dGfyT5/vAPTZzxTz1VlP0OqA0HVRxJAT4Td1w3sEJt1SqjAQW8NThYSjkPagV
 3l6tujoYrh0CddceNpRXme1fzPFZYBimGtf5KhaqiosOzSEQLE1L29XL5ndt395GEwc9PGVGrmB
 V8CqVSIxIjGoi2YqOXtPwHbT5drtFCU7Hg8cmpbnXpKzmTEUqaly4fGYkWNFcizJhHCz8cI3XiG
 PLKclpb74EY6IUPI7+5WMR8WrJNo6aCrQo+iD79HZtvYi47Jq2KI7PqnR9QUXjbMjOVjqw1dWp5
 kGnrsqbPzhcb5ip3NxfrME8OD9j6PpQKAKQTACJowYXjsWWjtXzD2JibKYDdIm25uzgOYMAhH8L
 2YgAgL6LH9ZOVUA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1MCBTYWx0ZWRfX/U88wyNfM7hq
 ofVZbAMuP+PPzyrBmPUw8A1BONsk0Cp4m/Yu8KfXdjWDNT5GQpIlU8zvER443dS/zyDjWm7yYYI
 GCJRLKKZcrcnj7OCzAkpiEUIRwLhOlrTurwCsLsB1fj5fs6aDAC/c896r+NJuxemzsn3qCoKLF5
 wzZZQvQogpCtRU0XGm9Kzbc3NyG0aJW4sVk24WoGh7J+iFHGulIFYvSd1Gjzcxe0JTdnbjJVhd1
 ItqlV95TULMRWEXUHu1C2A0Hsr1NExzrpLdjzKhheelXUVU2ukSi7FYcy1W14GDu8j2aZ1JUCT/
 EXTi42QVngKR/TsC0nywA+1aXQ0ywxs26hVBKv0Fq59w4DoR7mFYoDYGNZWt29yUsuIEqJhQ+J7
 Lb/UMpY7aEQckMbQQPyvz2otLQw77ldrViOyFwPf0iOCbMIx7hQUwsqwLZSasmotVsceFFr74vz
 YTvmdlqYLaxpBFVciEA==
X-Proofpoint-ORIG-GUID: UD0T6133WpwApucozPaa2ZxATz1rfWuY
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1MCBTYWx0ZWRfX0mc7daW3CrHR
 /MD6f6egi2nbtq9XS1l6qoMZQpJFK65jZRXDzaZwPUVALz7DvXYg/dhH8DiQuZZyKFZ2GF/Y60T
 I1w8x0BJXjllt68dYWFMKmZOV991H2w=
X-Proofpoint-GUID: UD0T6133WpwApucozPaa2ZxATz1rfWuY
X-Authority-Analysis: v=2.4 cv=HKhWhYtv c=1 sm=1 tr=0 ts=6adf4c1c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=gULSp4nZ3xnbK8Yvv1gA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260050

A hibernation image is restored after a power cycle, and after the
kernel that loaded the image has set the PMIC interrupts up for itself.
Neither matches what the restored kernel remembers: an interrupt it
uses may be disabled, have another type, or be latched in the PMIC from
a state nobody acknowledges. On a Qualcomm Glymur CRD the temperature
alarm interrupt then fires forever once the restored kernel runs:

  irq 293: nobody cared (try booting with the "irqpoll" option)
  handlers:
  [<...>] irq_default_primary_handler threaded [<...>] qpnp_tm_isr [qcom_spmi_temp_alarm]
  Disabling IRQ #293

and the machine never recovers.

Set every mapped interrupt up again from the restore_noirq callback,
before device interrupts are resumed: clear and disable it in the PMIC
as activation does, program its trigger type again and unmask it if the
kernel has it unmasked. Also clear whatever is still latched in the
arbiter for the peripherals owned by this EE.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Prepared with help from an LLM-based assistant.
---
 drivers/spmi/spmi-pmic-arb.c | 62 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/drivers/spmi/spmi-pmic-arb.c b/drivers/spmi/spmi-pmic-arb.c
index 402ffeaff8e2..eeb584e2777b 100644
--- a/drivers/spmi/spmi-pmic-arb.c
+++ b/drivers/spmi/spmi-pmic-arb.c
@@ -2167,12 +2167,74 @@ static const struct of_device_id spmi_pmic_arb_match_table[] = {
 };
 MODULE_DEVICE_TABLE(of, spmi_pmic_arb_match_table);
 
+/*
+ * After a power cycle and the boot kernel, the PMIC interrupt state no longer
+ * matches the restored kernel. Set the interrupt up again from scratch.
+ */
+static void qpnpint_restore_irq(struct spmi_pmic_arb_bus *bus, unsigned int virq)
+{
+	struct irq_data *d = irq_domain_get_irq_data(bus->domain, virq);
+	u32 type;
+
+	/* Already activated as far as the core is concerned, so redo it here */
+	qpnpint_irq_domain_activate(bus->domain, d, false);
+
+	type = irqd_get_trigger_type(d);
+	if (type != IRQ_TYPE_NONE)
+		irq_set_irq_type(virq, type);
+
+	/*
+	 * Follow the masked state only: when enabling an interrupt, the core
+	 * unmasks it only if it has marked it masked, so a lazily disabled
+	 * interrupt has to be left unmasked.
+	 */
+	if (!irqd_irq_masked(d))
+		qpnpint_irq_unmask(d);
+}
+
+static int spmi_pmic_arb_restore_noirq(struct device *dev)
+{
+	struct spmi_pmic_arb *pmic_arb = dev_get_drvdata(dev);
+	struct spmi_pmic_arb_bus *bus;
+	irq_hw_number_t hwirq;
+	unsigned int virq;
+	u16 apid, ppid;
+	int i, id;
+
+	for (i = 0; i < pmic_arb->buses_available; i++) {
+		bus = pmic_arb->buses[i];
+
+		for (apid = bus->min_apid; apid <= bus->max_apid; apid++) {
+			if (bus->apid_data[apid].irq_ee != pmic_arb->ee)
+				continue;
+
+			ppid = bus->apid_data[apid].ppid;
+			for (id = 0; id <= FIELD_MAX(HWIRQ_IRQID_MASK); id++) {
+				hwirq = spec_to_hwirq(ppid >> 8, ppid & 0xFF, id, apid);
+				virq = irq_find_mapping(bus->domain, hwirq);
+				if (virq)
+					qpnpint_restore_irq(bus, virq);
+			}
+
+			/* Drop whatever the arbiter still holds for this peripheral */
+			writel_relaxed(0xFF, pmic_arb->ver_ops->irq_clear(bus, apid));
+		}
+	}
+
+	return 0;
+}
+
+static const struct dev_pm_ops spmi_pmic_arb_pm_ops = {
+	.restore_noirq = pm_sleep_ptr(spmi_pmic_arb_restore_noirq),
+};
+
 static struct platform_driver spmi_pmic_arb_driver = {
 	.probe		= spmi_pmic_arb_probe,
 	.remove		= spmi_pmic_arb_remove,
 	.driver		= {
 		.name	= "spmi_pmic_arb",
 		.of_match_table = spmi_pmic_arb_match_table,
+		.pm	= pm_sleep_ptr(&spmi_pmic_arb_pm_ops),
 	},
 };
 module_platform_driver(spmi_pmic_arb_driver);

---
base-commit: 20a33c6b6cbe7e4805dfb6cd68816937443aa148
change-id: 20261023-b4-spmi-pmic-arb-restore-hibernation-807aa4641898

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

