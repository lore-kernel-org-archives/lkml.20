Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793630825;
	b=kSAUxajIp3lUpVx6TdL2JPU0sJGVqWW3kPUZ1X1H4zOg0rSvLUUYusfprCN96uktAQ0e
	 iE7qTIfixV9Qs6lvsI/zY8VS9cjuW6wxRxnEbhehlei8nMfDEIwV+p9xpfnB895kBWhRT
	 7Ps2H8zFmG/OcDcX30Bpnla8LUFA145C6rHDNtd3Nlz2MCPoC/VsHjCv+bHCA3jqdmBCx
	 pP7gayubdPWKH5fvdA4eZPQJzP/fnuYvbnBL5h9xMBpiGLcAYtbjqNQPivCTG5gWYs9dN
	 s/2xrPoSqkLeYSGhmKDqLn0QquIdNjnmU3roAEWPC1CK0VhsYrplVQsV0fL7mZVpgIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793630825;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=2qrJ3KtJ0cuR3JwG4sVYGEim2RKQKNEp6dMT2f4JvhQ=;
	b=pRMzvRfUcJKO2eYrZUgNZwRK5nMAAnzI8DdNo3XdZqQV0wZxeVtboIvpnED9N0zKV8Yf
	 fcRCe1HnzRioBsHDopmUNp53Xj0VsPg9Ak4LdZeLAkZi3T18vO/CGWoAsCsd/8TYY4KaH
	 FflNNtpb5taDka/URUmSzuwSupQK7YInfgbObr4jK8r1FBz01/BdFsGK64w8yjjC1Smom
	 iAiRh4MvCgYKQry0+oGik2Vdwp0ZGrxJjs2kx79YCdIflfxGFkf9Q+sEtvOvrokxschC2
	 LHEtBZZp5hBX/jjGSWZ/iYMiwp5rdLs2SdwNQZt1piH3z6+fc1TdzpC7tZLc19VK7Tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="nYZSh/MJ";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="GpTD/Pv5";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9AA160A6F5B
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 14:47:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9AA160A6F5B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nYZSh/MJ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GpTD/Pv5
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DpPFJ2449079
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 14:47:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2qrJ3KtJ0cuR3JwG4sVYGEim2RKQKNEp6dMT2f4JvhQ=; b=nYZSh/MJpImfDoLt
	fimkIqi99tBaoECD0BbvXHKcK6HLzFQWp0pVl1FQpXnWVc404mzEpvp4rDARHmIj
	3XoSZ2cJygs5hQxqSmOeQpEfuu48+FgnCBGeXDjhoCQ6xKLOrCtXtYqXEB3bPfZu
	X8ZYTc26UQ7V9bFxBYbK7CrAdsIfejidJQPH25nB1OokmK27Lv/hJVenvv1VNOup
	9mT/bZ0gHNHM8ZiodW+qf1gc9MWeditQoIjstT77gKb3YVmE2DErAJoFMQw2qBBc
	kdO4/3UrFoiI1k3YPFwGEAKDR//xHaxPEIXMT42YOCNU942j23DwJwi2WpK6nQWi
	ZMay8w==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpky4j6bn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 14:47:03 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7c0bad5ec1cso821009137.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 06:47:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793630823; x=1794235623; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2qrJ3KtJ0cuR3JwG4sVYGEim2RKQKNEp6dMT2f4JvhQ=;
        b=GpTD/Pv549kUlw9cQQEEWqPpS0yA4ULzwXKKK3KlOOQ8t4WOZkd/KFEIgaisObSeo7
         M7Mcig9swPhLurX+B5sFy4ru6Z8whCyu/rBPrYQ6s4yIBDCYRzI+u/ARCT0G6AL7ZgGj
         42MqmZTc5qZ60WV0H6+IRxcaAiB35DH71FSou1WObRuAQSWztbRp/882XtBtR7inCPHJ
         +waju3XG+ODHoUaEX7ZBLjqJLZgku02e4clhnP0hGDl7PqO6ZXotch0tdJHo0knxJsqv
         HSE7vNtppgQs/I8M8u057VM5EYSlwsLYZK4bBKGQekRUdSIay4xTx00KaAQuNvAHSfpU
         5hAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793630823; x=1794235623;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2qrJ3KtJ0cuR3JwG4sVYGEim2RKQKNEp6dMT2f4JvhQ=;
        b=umYKYvhWxw2LPs+2Q2c6ReOD8+znOjj98EG99nrbI+vZjI3JQrx+3wKsNAa69bFjtA
         oavgJKkb032NHiQWbVHQbWtsfzhJzu4O/Wmqan1fOrHmaSrLfxxr+VZRIkpVEOpVKlOL
         6gstxFt8MKktiObgMBn5paEY3P9Pp4JsdgU2fa5Gpyn5s1km401BSR8bDVFjINxmpLdD
         81A52UpnyGgPkK4VjIG26WRkKmYNfONIOc6z3RP7KJ71KRHtvNLOuZ8934phaKy8fTXH
         nuwecMf9Mp8XGUH9cB0nBSYzURxn1Q58mOdO+ycHOnRmNMJN66gwfUl3/ee+4bd898iM
         nKzw==
X-Forwarded-Encrypted: i=1; AKwUvBw5+o9Nd9VnKlhfgTgSz3S6fDLMOWVrR2ssnqcIAcXa9v1bdbzvl3zLEMoXbVCGm0lwhn880zvunpecNMQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8WFHpmCK17D7k/Qcm129XHbZ/Ax6dtwkxXcj+GWJ5nHBlzaniR
	wtgZYIGBvsbi/8UxwYMuo5Tbn/t7zKH3SBwr5YIWLGkoXEUQcV1YjODJhuQ5PrxNTHSoREurx7U
	4i98sR94+NAmLf//dlhFSjZ8cGFGYgShl/QAew3DAz7LbmVc50eL45q5kt3mgC/7lKDg=
X-Gm-Gg: AYBFou2FWSgvELDv8abSQ3KFmjKASo6r8yjDfDi4G4Q1458J0gtBWdHCkAwFh6bEPly
	pqgY3MWU/IVTjFHgTka+hFfBLx/4AHuUkRACxthRJ2FRCOvHMjC2mr/rIs0vV9/Ub2pTPsdK1w/
	cAx8Ijh7mBx8EWkOnnYUUbPxBQDEiNRgFwMVzzzKU8wfGjZQj6IqvoTt27nNgU1bMNaoYwblGr6
	DqH5++SAO6KA7nBQ68xBNPXSqmLOCHetuNurf4eV//2EeIkvekwRTA08AYQjLta8O4kvcsfG+9Y
	+Tv8WvtYluZW5U9AxCmRrrTm8Ks5Um82oDIZUniXWOL/lOVJcxGmVaoLxwBEs20j9segAnNhq80
	6fh9HE5LMk71ndztZV/x+E3BrhCKhVl4FqRmIgP//OywG739CARyevQmTsQ==
X-Received: by 2002:a05:6102:809e:b0:7cc:2152:4f95 with SMTP id ada2fe7eead31-7d0727b11f1mr3608534137.3.1793630822553;
        Mon, 02 Nov 2026 06:47:02 -0800 (PST)
X-Received: by 2002:a05:6102:809e:b0:7cc:2152:4f95 with SMTP id ada2fe7eead31-7d0727b11f1mr3608514137.3.1793630821879;
        Mon, 02 Nov 2026 06:47:01 -0800 (PST)
Received: from [127.0.1.1] ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e86a06078sm4004893f8f.54.2026.11.02.06.47.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 06:47:01 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 16:46:51 +0200
Subject: [PATCH 2/2] PM: sleep: Do not arm wakeup IRQs for hibernation
 freeze and quiesce
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
Message-Id: <20261102-b4-pm-sleep-hibernation-fixes-v1-2-51fac96d080d@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2992;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=dmhw+rLh3YLAA0NQErytWkrrn7ttASoaBIZrNZToO5M=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBq6KJfLC8dxd2kJGunctvD8mTL1bgFM/yemD+25
 uop4+UbEg6JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCauiiXwAKCRAbX0TJAJUV
 VlFqEACFoJpTr+nxhgWU8nLWjdloXdv30Zu8UjDTVVI6VhiGDCJN8HDUdxwfeMhXsFpdnIbm6IL
 kkxAjkFUGQ5Ppfj1T/N9zg2PJ2AcgJNLm1J3EP7c29ijV7weV4Bi1u0ppZUihip5RNqsq85xQAi
 MBT+9ZN4aeOFk9Q8pH5jlQTZDa/++MprSuV3BJ8XO0q19IWARVRWRZbWDx/Hi6DZpnSD9gjqXZ+
 kpnilG9KppwnAOXwuE93TPypfVJRlWrs4FcN7HSXadxVUTrvW4JCBE25BVgzzp/zMdAFQdtjIi9
 vWX4jFReWhAJmSwvjDHMwaWC08CX03MaJ4ANLZ8eXcctavIT4O/mk1go/TaBeUS3b0Ku+d6Fxy4
 057eYlCMCLwKu7Athi8RqiRYNVTiX1II+9ipE6RGgqFdVlvlmDmgQZhcFFFy4yDGrEeyHpyoWBl
 Ss4PmzxIqqve3K4jHz/4I5UHI5CbXZcV5ITOQB7xE7e6KVn3c6bLtL9F1U9YbryvWM09pxdspMG
 zAZNLhK5Djh6UkYK6NhLZBkWj3dE432ss99d1KxKPsTf7D2LqUp6vvoAyg2R4tREHAJkEj1khoY
 DTH7rP/357LoMvta+WR1/vts16R/Yab3R/vx+vB/DoCbbf1w53B6BKWCoSU/MDbLP8GuQ2UvcQW
 zQZMEXmB+UsGdKg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: 7M1Mu-ecE0ZsKVN-JuV5vCR5UABPsjx5
X-Proofpoint-GUID: 7M1Mu-ecE0ZsKVN-JuV5vCR5UABPsjx5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1OCBTYWx0ZWRfX1dblbMxc1+nw
 W+k8JPNGqMkOIzCG8+g6t9wrNwLEbOkmUR5ls7MR0DJDMx7KoyH9msCWtdQYwa5It2/+0/6qJ3T
 Bc5hRCOTQFytzko39b61/iulfx83XbE=
X-Authority-Analysis: v=2.4 cv=QoHLTlyd c=1 sm=1 tr=0 ts=6ae8a267 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=YW8Bwjmn6SJj6jUQKWgA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1OCBTYWx0ZWRfXwCI40DdFrgk5
 AaLakcPWERYo+Yz+q7OX2VxN58odsEfUj0D8O4JDn7P9rgPKu1Oqxa2xkYqZUJRkMAqs3AcVqHo
 v17EPgzGds1QvYl5iOqdQuCkcUVIDy1FLVRZur4MrY/luHUOZK0o3yra22YIxEDkOcnIQnKuk1Z
 f2i+Vk3kv4/A+hlTkD3GhTHXImPSb8cMeETWphAMuI+26b5UHtnDenFd04nM4gNql4jq8ewQKz0
 Tay/d4/YSAQRUK4TD5BOvOCx6FPdFnrNYDe2V3R8HJb6Z+WHmj1KvdJILBE5c8EETEmXoJNT1jT
 6+zyslO/I0mqJ3Jr6KjvOmEpB54ko4Va4Q6BKxEhcZhR7cHjCkp/XPNGR2aB+2WcQx+UTZzXg0y
 gs+IS7109WEVsFw+6yEZWX9GwxvaYbgzirdgS6O83cSUDyY7KrCOwTCCm9PAV/DGDA49PG7bRbY
 jTbnM3lCAihFJEfF5uA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020058

Freezing devices to take a hibernation image and quiescing them before
jumping into one go through the regular noirq suspend path, which arms
the wakeup IRQs of all devices that may wake up the system. A wakeup
IRQ firing then aborts the hibernation or the restore:

  PM: Triggering wakeup from IRQ 180
  Wakeup pending. Abort CPU freeze
  PM: hibernation: Failed to load image, recovering.

On a Qualcomm Glymur CRD this happens on every hibernation and every
restore. The WWAN modem keeps asserting WAKE# once its root port goes
down, after its driver has shut it down for the freeze, and the WAKE#
GPIO of a PCIe port is a dedicated wakeup IRQ with wakeup enabled by
default.

Neither transition is one the system can be woken up from, as nothing
goes to sleep, and Documentation/driver-api/pm/devices.rst already says
that in the freeze_late and freeze_noirq phases a device "should not be
allowed to generate wakeup events". Do not arm the wakeup IRQs for
them, and only disarm them in the noirq resume path if they have been
armed. Wakeup IRQs are still armed for the final transition to sleep,
PM_EVENT_HIBERNATE, and for suspend.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/base/power/main.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/base/power/main.c b/drivers/base/power/main.c
index 16a1f017051e..34ba0e5941a3 100644
--- a/drivers/base/power/main.c
+++ b/drivers/base/power/main.c
@@ -949,6 +949,9 @@ static void dpm_noirq_resume_devices(pm_message_t state)
 	trace_suspend_resume(TPS("dpm_resume_noirq"), state.event, false);
 }
 
+/* Whether dpm_suspend_noirq() has armed the wakeup IRQs of devices */
+static bool dpm_wake_irqs_armed;
+
 /**
  * dpm_resume_noirq - Execute "noirq resume" callbacks for all devices.
  * @state: PM transition of the system being carried out.
@@ -961,7 +964,11 @@ void dpm_resume_noirq(pm_message_t state)
 	dpm_noirq_resume_devices(state);
 
 	resume_device_irqs();
-	device_wakeup_disarm_wake_irqs();
+
+	if (dpm_wake_irqs_armed) {
+		device_wakeup_disarm_wake_irqs();
+		dpm_wake_irqs_armed = false;
+	}
 }
 
 static void async_resume_early(void *data, async_cookie_t cookie);
@@ -1685,7 +1692,17 @@ int dpm_suspend_noirq(pm_message_t state)
 {
 	int ret;
 
-	device_wakeup_arm_wake_irqs();
+	/*
+	 * Freezing devices to take a hibernation image, and quiescing them
+	 * before jumping into one, are not transitions the system can be woken
+	 * up from, as nothing goes to sleep. A wakeup IRQ of a device that
+	 * signals for attention once its link goes down, like a PCIe endpoint
+	 * asserting WAKE#, would only abort the hibernation or the restore.
+	 */
+	if (state.event != PM_EVENT_FREEZE && state.event != PM_EVENT_QUIESCE) {
+		device_wakeup_arm_wake_irqs();
+		dpm_wake_irqs_armed = true;
+	}
 	suspend_device_irqs();
 
 	ret = dpm_noirq_suspend_devices(state);

-- 
2.54.0

