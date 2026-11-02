Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793630823;
	b=01KYgIQ2pQIJYa3yAPlzusUJWm/ju4d917WjQbUixPEGkTf8cRes75bw533wpvFBY/F/
	 KbQuPB1IeahPSTVlYh1+Xeu/tFvgVjT/n68bjtXmGlzILdWjn8yzKNHSjV1Wl1QOUym3G
	 z0LIyV2IHxyfPvqGVTuAfLViMNZpl5RH49CZu15rYujF6242AsVCyrJAIhRgyhCRXeewz
	 OWDdBvj+Ke92qwbLG285G5WlHMO70htZn63LVgZVvxUm6+tlP+Cv0ZANwnBRg6YPfPM8x
	 Nue65Is1j2ydcqSSODhDQ1a8aCkjE4FM8Kpf5UVOayapm8CccNIhwJw3v6zFr2MoJlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793630823;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=PhtKHNCzvBbYJo7kK2oH/+mQGSC+QziCQO0T5A2ou0Y=;
	b=w6lPzwZ8iGJYfG4SewMyuGI1OmwXSgHbS6cfagGQHEVysShkPSerCcjAESQQA0+qb9yo
	 Ity0BuGykhakEXbsTq6DjWxH0ePO+PzwyAvRvEiGavFuJl+mGu34X7vv6o2QMrlXxmSRJ
	 M4mNjIGN1v2cN04a4zjElLMdDMB1zLBXvOMPNrd6HGYG5DKroOZ5A3JDX/eebWFTsZd5w
	 o+wvBbgV/itbnZvffoQRZKWcTvOKTQOCMLLlmwqGvCrBqAGTF6WzWtRhxEvAo91GGWQ8v
	 Fx8xubA361h5/V4F7i5Ym5084xUYW7sM9fYw2syxNtypz75pFG37VdSELOGojxTBaGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hJ9h9xzd;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ctl9eNWC;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6666860A6F41
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 14:47:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6666860A6F41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hJ9h9xzd;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ctl9eNWC
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DpL3Q2448586
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 14:47:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PhtKHNCzvBbYJo7kK2oH/+mQGSC+QziCQO0T5A2ou0Y=; b=hJ9h9xzdoubeImHd
	vcfmerxsjcHiCyLKAcY7uxb+2B0hybHzh6vsXXZEtOreZ1TXF14/Y0fh/5RcPGJ/
	VtumWcxgBenL44u1BTfODv9+HwX4c+wfAiuJvEFwDTBXUKI7tZpFRlbG0zZJwBZq
	2JEMHXaICg5FXxcdwCfrSqYoncWPHJO80ynGsKWbySNv0RNA68EEw2r+PMhVihj2
	SjVVJ4uh+3Fgt8c9BTSh9Vbwyyx/KZJl+7wN1FIANE3TwxG2A68jT547S8O5ammQ
	C0LWEs7Xe3ovarg8YPblGq6U3+Gh9Kh2lGUtnKan/Y3tb+XGs9rcKIiCT1R6VdJ4
	5gtvcg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpky4j6be-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 14:47:02 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7cc099197b9so2552434137.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 06:47:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793630822; x=1794235622; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PhtKHNCzvBbYJo7kK2oH/+mQGSC+QziCQO0T5A2ou0Y=;
        b=ctl9eNWCvipouQyIK5/V/c+ADEDTCM41zYhi60HA2Ltk0YL75WqeKMg3Tj/4XRQfwq
         VQzYEhACF1sX5BXXN0aZu+uUO418lXvT56nV4h7+layFkq+gv2XUBclVl/dwuG1CH181
         vGIhhaC7GDiTNdGQl9XVD1xFCUY1QAYas00rvyMs0FKVg5a1H+2A2tZy18CoDKnL4RLi
         Vi/AQYZVPKKBImvIXhkRzCCq5fJukDDSaRhvHv+7GBc51mOuvJy2vz8EkKGhlRR2OE1x
         UkSfo3Q/fsNtG4jHzv0TjiCXVrp0sZZ7xJwnUD89tnAKJKuZ3/M0OZDmt2ynzu2WlVPG
         nMeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793630822; x=1794235622;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PhtKHNCzvBbYJo7kK2oH/+mQGSC+QziCQO0T5A2ou0Y=;
        b=WclXpm/PkpFeGbnCzcyOLsxwhGM5rsJHGWhpYlsiskV9nx6H3nJMbBPK9Onf9J+ZGs
         k/zq1ZfJsQX5k92/aWWCUpjw/As30BFIUJnx/V2zjlxNp6eShUuEhN2Mpvrz41m01dWm
         8Qc4ZBAWbogtdqSaVJBuvt2dpMMlbqlYxW6T5BpJyy718vEqVRZxAF8JoHAykxIOHH0q
         FMQ8uNUjao3cdktqJXuI3NewCbSeJjh1+GynBBynDYb+b9oaf80rz8Jm47pl0hHFe2Wa
         QRaQJKrwD73cFYPvospywa0NQ/2rgdMDMFYMN5ZQBvu2AbiW83YJqwm+wAc7sh7j3q2X
         mNYg==
X-Forwarded-Encrypted: i=1; AKwUvBzxPDMqqQZQ5aUJAl+ldNgx35BDXkdGJHV7YkNIh08kMX3t6pFwQhizUqkRgFYf5AQ9rOBPAHCPMv5134Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z8D4Mp6QRhPrm3WUZMxH24f/8norCmxMJXjpSi/jF5lm+CYHSkn
	WDFCVUnWgLqVoo5QgorYXwhBKE3WtTevpnaRO71Vc5xhGCJSkrZ6+Kb00NwLhv7WUD8NrXk6XhI
	1cAIZleOaolQquOyok5FsTGhrmm5LACQicPBmAQTX0zR2dmU/Gux4UcJSmEwQbGIZH+Y=
X-Gm-Gg: AYBFou1ZXq/NJ2AgpW0llm+VR050PGtuw7hII60HfHB4dANmGZwUAVhKONbCtRWc1xM
	Hh1t9t3S2iw4ozMIc/LwfxTMnTo9VasxNRyxYk3MhGGMqLyRPNjVESVp6XgxCWTfQc41YyWIw9o
	64zgkxXpMrIXYhNOXi/LDa8Sa0WbdHKBgd6dan1eg0eX1yatGi8pe2FPmNAf6DdGAgwYJ86vBO+
	/HRV3c43ItUv44QNgjlUKskzyKz01Tay53c86cwsywPnFv6c0GHIuNbwcM7wbXPN7IKkwZRslLL
	yBERkiy9fsihdtrnchoMspDbj7TLXvbCrz/HQc5WI5wdbA5zOkwBQ+2LrI1nNMqZUZhAAuCqq1j
	p15xgXczIMajuOq20ypYgBZ52eBhwBfB9d4vqpjZ4DkV5w4Rc+bkwIRNUVQ==
X-Received: by 2002:a05:6102:5048:b0:7cc:56a:58d2 with SMTP id ada2fe7eead31-7d072d49698mr4176783137.31.1793630821173;
        Mon, 02 Nov 2026 06:47:01 -0800 (PST)
X-Received: by 2002:a05:6102:5048:b0:7cc:56a:58d2 with SMTP id ada2fe7eead31-7d072d49698mr4176756137.31.1793630820080;
        Mon, 02 Nov 2026 06:47:00 -0800 (PST)
Received: from [127.0.1.1] ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e86a06078sm4004893f8f.54.2026.11.02.06.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 06:46:59 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 16:46:50 +0200
Subject: [PATCH 1/2] PM: sleep: Do not mark devices without PM callbacks
 active on resume
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
Message-Id: <20261102-b4-pm-sleep-hibernation-fixes-v1-1-51fac96d080d@oss.qualcomm.com>
References: <20261102-b4-pm-sleep-hibernation-fixes-v1-0-51fac96d080d@oss.qualcomm.com>
In-Reply-To: <20261102-b4-pm-sleep-hibernation-fixes-v1-0-51fac96d080d@oss.qualcomm.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        Pavel Machek <pavel@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, Ulf Hansson <ulfh@kernel.org>
Cc: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-pm@vger.kernel.org,
        driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2706;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=WEsPxao1XYRmaV90WeW7n4UXIAWakRV1knJgQrEUYSI=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBq6KJeJsN8MIUPJLFJXgCfoWHCZbki870RQaP4M
 1TARZXFMsGJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCauiiXgAKCRAbX0TJAJUV
 VsasD/9sbOdoasu+/OzLpVRMYXtob+9KPgFrS0BcIwPeGa/Eo9qwFxvlxAgqnRmoMYCVYueFOpt
 3H3HUELwkkRC5rijcyROAy1NFiP0zGCZCyyJHq0elWp/OlI4FsqrW8hC/ILrhNHGr+lpf72LTZB
 tOhYALncg+jY4Rizwdp99a8rDLQfv0b1/42ZaIFfqFu7i1Klwd3kjRjff4tlAVYgqBJWNyhGwro
 4NpCrgA4bBLngWf+MySssqn4gsCbG84CS8qFxRJxNXzQMiOa3aM7JQMVjpYo265NExj3eqmif9o
 vtX57KbnbE07o64GJU2JX7VZ5SWsB0schbxo4Af7vsEsKVl1JEUrBLWEW8MLnnN1ljvoqEnxnbi
 0TptMwzFu+v91wnPFSl5FGEAyIBgCBZy4wH3fzpGdzvpXsFq1Ye5oVA6cdSrrM3z/QrZlMnjF5C
 nUgcfoKTxX2OGFm1ZjdSI5b1jd0Xe0wTKpbmBRK7BjBebmNEg0KaCWWxlw7XUVqmmIodzKXUdFm
 0HBVgtJ+NlK5c1kz3GWnoahqhCmBZQ0ShrO1vt0CT2oI2RJmPgp706XXSFkUw65P4NcljsKDtQu
 jT/z9T8xkwZIjqRY+eRZbIhltZY2l6WtpTiP2O/nB2uIclSC4jriBOyIdIBoV6Y9Kj4eGSKqArM
 XVwMzd57ggzqLxQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: 5eztS5em5gLtcIpfr42HLClD7euS6THY
X-Proofpoint-GUID: 5eztS5em5gLtcIpfr42HLClD7euS6THY
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1OCBTYWx0ZWRfXyOUKpLloCZyV
 yx4t/XSMsFPun+g6IROenIS21ASldBv0St9GGqjOp/eeu7U28ZLj9sCtuhBRe22QWZV2JDR0+jv
 uAUt6zxHP6YbIjsgtaeuNRXMG98dfng=
X-Authority-Analysis: v=2.4 cv=QoHLTlyd c=1 sm=1 tr=0 ts=6ae8a266 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=BJxvg6BrSIDu2IxgrNwA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1OCBTYWx0ZWRfX5R4lB/L0EV5z
 7HZWEsdSvAK0wo3M1ugK6AQ/P5meCCcbfenJXylzbLT123DdthMtH4ONhzKzcbBxtm8r5fZsAru
 d5QfHkt7ed4bauI6qXRpfKUapzGVyspPygWObQuU/8W+BRThc+TyVCCRb0m1vINkkMaNmGpTq9Z
 i8pglgGl7YWKJx7SegIDDGdw3UWzBIAQgHyMOyCNFL/wdXqhqzF6D+AMjUWllqMRF50gg1/P7qd
 TVG6ks1S7cqCqVob23kY7wgdimfGOKpSXvwSTWjA1Ua59UR45Dnk3le77EirfVgcqJI4Rnx9bnl
 1B5hI7cvzWop4Dlpe4BTaD4O0tG/10UoWxwPy9021HoQCKmeCKW3+vrAtzinolZN/094/K31ztt
 XXprX/H0GPSeMVw9h+5RvGTCfh31SygUtGH+sKXMAA/ExkOOL8g1gAbxM2ybOzMdhU+kIEVaZmR
 Lio3E5lJtf0InTXalKw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020058

Devices without system sleep callbacks get power.smart_suspend set in
device_prepare_smart_suspend(), unless their parent or a supplier
prevents it, so device_resume_noirq() sets their runtime PM status to
"active" whenever dev_pm_skip_resume() returns false. That is always
the case for PM_EVENT_RESTORE.

Nothing resumes such a device, though. If its bus or driver manages
resources from runtime PM callbacks, those resources stay off while the
device is now reported as active, and the next runtime suspend releases
them a second time.

AMBA devices are an example, since the AMBA bus only has runtime PM
callbacks, which enable and disable the APB clock. After restoring from
hibernation on a Qualcomm Glymur CRD, the runtime-suspended CoreSight
devices are marked active, and the following runtime suspend of each of
them hits:

  qdss already disabled
  WARNING: drivers/clk/clk.c:1259 at clk_core_disable+0xa4/0xac
  Call trace:
   clk_core_disable+0xa4/0xac (P)
   clk_disable+0x30/0x4c
   amba_pm_runtime_suspend+0x58/0x74
   __rpm_callback+0x48/0x1e0
   rpm_callback+0x58/0x64
   rpm_suspend+0x10c/0x5a4
   pm_runtime_work+0xc8/0xd8

followed by "qdss already unprepared".

On suspend-to-RAM this does not happen, because such devices take the
direct_complete path and device_resume_noirq() returns early for them.

Leave the runtime PM status of devices without PM callbacks as it is.

Fixes: bca84a7b93fd ("PM: sleep: Use DPM_FLAG_SMART_SUSPEND conditionally")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/base/power/main.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/base/power/main.c b/drivers/base/power/main.c
index 88a31e09e4f3..16a1f017051e 100644
--- a/drivers/base/power/main.c
+++ b/drivers/base/power/main.c
@@ -839,10 +839,15 @@ static void device_resume_noirq(struct device *dev, pm_message_t state, bool asy
 	 * Otherwise, the device is going to be resumed, so set its PM-runtime
 	 * status to "active" unless its power.smart_suspend flag is clear, in
 	 * which case it is not necessary to update its PM-runtime status.
+	 *
+	 * A device without system sleep callbacks is not going to be resumed
+	 * by anyone, though, so leave its PM-runtime status as is. Otherwise,
+	 * resources managed by its runtime PM callbacks, like the bus clock of
+	 * an AMBA device, would end up unbalanced on the next runtime suspend.
 	 */
 	if (skip_resume)
 		pm_runtime_set_suspended(dev);
-	else if (dev_pm_smart_suspend(dev))
+	else if (dev_pm_smart_suspend(dev) && !dev->power.no_pm_callbacks)
 		pm_runtime_set_active(dev);
 
 	if (dev->pm_domain) {

-- 
2.54.0

