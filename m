Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792592654;
	b=MqmL+xhMpy8KJYrbkcmt0UTooeIs4lnOmYqeH5GZQusdAeP3qtebGkozLWW8wk6XCP7U
	 leSLXUZYQ9xSoxpQYYNVASQgi0pYB3egW3cx2XASeuDuw7mCqWSnYSTkVV/DV0v6njGaB
	 F87utP8vP8z3acibN9xBuhFatE4GUCh97kqcX/cWDHpz4VGRA9G+3bm2qh2u7coSIINE2
	 rjmiBjdBwwMfPdZ2vVP2KFrzjVzmv69o19JEb2ZrLGq5nMJitdhKZrAR4ay5icgV1lVlK
	 By5ZLbJWziuKIOIdmLC0lKVni+x+u1/6EG5Y760QeJmwUyKHfEEwQizNuGx1tHd3VUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792592654;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=abISaULiRsqDdy56jiSPYUxDOSde6FWDJ/0vhfMVuQA=;
	b=NAXHbonFe6KrwIjewWXujXB5NEkeacnjNQrupVhMosDCCCwCsRKwaK4Gg19Sm9QMxjDi
	 edloTKza4coriIg4pTIsARYshkhk/m1zQn6vL2QKL40oc+oVMDxuuC9135C15Pt04YbXW
	 cfnawbkRidA+xdSVEff6xrmY3ucb2YUUMY6OISJTJTdZ+8ABRy6uSLxH3e9QreykhkhzF
	 p8iBVJxzOgfyfIXS49OkSGToJMGLXsPjGIkpNHcyiQVZQh+T6Iiyt9RICLwQW3qPAi6Ae
	 T72YAzNujwmkZD7ggpLsK6vylHFonVy/my3GFwhqriIyZtkNOHdZxJdVGJSpPxagQnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BfZscyGr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hmiC5X76;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A39606A327
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 14:24:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2A39606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BfZscyGr;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hmiC5X76
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LEEoiC1932989
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 14:24:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	abISaULiRsqDdy56jiSPYUxDOSde6FWDJ/0vhfMVuQA=; b=BfZscyGrg7TFIUnD
	e61YRUCkXaG1Eq+H3lByJAk960/DDpm4zo70/S+jxN8BfKh8uu/K/UYvjymVVGa8
	oYNiL3bLtnKb2Ex1qDLGnyUbA6DM56FdjMt2Kw40pI/wKOufWwk4ivfdqKYFxQA4
	w0ilK1mo1p+pGOSXbidI8M+o3+GoW9qbcAIiUe1jAp5F9//bi1A5PU2YAW8JCE0X
	k11Dxl17UXFenFAULPiwGxrKEpv9OKQMybKy2kOxep8lEkOVFfA+wmzDYjaW0/if
	mcXgqDy2avYqIOTw4rFk/2gbWn8u/1EBJs165Vm47uxyfoorjszrxr/4r9og+r9e
	Tklxrw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heuhugx4c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 14:24:13 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7bf45388253so560609137.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 07:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792592652; x=1793197452; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=abISaULiRsqDdy56jiSPYUxDOSde6FWDJ/0vhfMVuQA=;
        b=hmiC5X76/6uycdYkelPtKJ3wwmpbx2JzOf7JAUb+WYIcn9YnnBITO20Xqxnlex9SUX
         s8Q4+8sbw4PEHakWThRb2+nZy+qCXLiI6rmzE4MOAqEqHQahPUifi4nsQIulx47qLIdh
         lD+u0YxmTTK22QvTVN/8p0Y2h1nhTsUJsG58KmC9cMGuRfn/iDYxaA3hwoReEGcRhiEt
         FOKRPoyzT75gK6MGaneMEKA87w+mXVtf6s7MiCm1i2Lya8z9OP7FWwPfqFFy+QG70fXZ
         Ua4rkOFMLNewpnHdH2dj3y+MB9z5W0J/qhV/MwYkRbQmm70Nr5jUyCaE4xeI3j9b16jS
         uQRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792592652; x=1793197452;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=abISaULiRsqDdy56jiSPYUxDOSde6FWDJ/0vhfMVuQA=;
        b=mDZjBhhMYGOAHJT5bGeJy1arNOPDAL/r4SQBoUgIobZEzKkREDRrSNX7Cx2EG9S/Zi
         tB8xK1hPGU4ERSDmvmk+K906XJ/sEkZBKaIyQaHpeFwIyu08BeZNm2h7DlP8UyjVz9sZ
         jkJGWX4Gqdtar9yuta0hCAOajlibn+vi9cgB5gwiaduW1KsiFsUaW63aIVgTHMYpIAgM
         09Okylz0LiY7ECdrv/aoeFCK9r1HYtZkJ8PXuZLCXmxMP8r5YrbSJhFkzL0uErnXQo1N
         iJJzv4fL3fidoPuJE/cLNBhtExYqGNk2fFmw8bcXgE+a+QghEyqgs0VJZFlXOhvggOZv
         cplw==
X-Forwarded-Encrypted: i=1; AKwUvBww7ZuFEro4Z1VfcwwrzfnJOQi/U59tKjuhxMf7mX/RI3lovgCMAOkKdYa0TjcU21Om34a/zmlQQ7Vpcfc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ795y4Cv1c7Mt/vCSTs5UR+IIiqiIUTz6TQRkiZwVYipCxrGQ6
	27zGq1GIBJW5TwQcyGmSNiU04wBtCgi2iKz16YhlUkar+hOfbd0C5sSuw7vDL8Oja5HP6O8ETkp
	vGxsLcSUrzf4P8BcHwM3b3wba76C3q1N5Nk2Bc28Jxv9LFdRl2zjFaoB3YHathhLF6X0=
X-Gm-Gg: AYBFou3dK3VkcdrhaIPrhSUxgnxpMKrcSBTypBbl2IHHCfJZQy83E2+YwLbpihJviBY
	Jv+/YPiSYdVaq+B1gR0PvOwchXrTy1cLF+uUCDle5I7NH4kdVL3EituW2W72YB85FgyJMnvoTne
	ipv4ALS6Ur6io9X4V8D2l/wr7fxnwBprsOCGoTZsapurwKeGP1lvzwO0hAapLnY5W5hmFeApYTW
	Pr/Qt3GydWAHabW3ONbogqtRZoy8NpTZ5xvxsVTY1j2mhqwZ/8FIE4hN/HtFdk7iInKPpp9ty20
	Vn7UoW0+EQixH0S6W+q1eiCfKV87T7oQ03oz1RoBCIEaamVcOpDhkytar2d1/EDmJn5euqu5WcT
	bLHTNuNCMjbT7zKuxdWJOzRnVMeY6
X-Received: by 2002:a05:6102:3c82:b0:7c4:6246:6ed7 with SMTP id ada2fe7eead31-7cc926e0cc0mr882840137.26.1792592651285;
        Wed, 21 Oct 2026 07:24:11 -0700 (PDT)
X-Received: by 2002:a05:6102:3c82:b0:7c4:6246:6ed7 with SMTP id ada2fe7eead31-7cc926e0cc0mr882827137.26.1792592650774;
        Wed, 21 Oct 2026 07:24:10 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fb83ff0dsm103760055e9.7.2026.10.21.07.24.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 07:24:09 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 16:23:59 +0200
Subject: [PATCH v6 1/5] gpio: shared: factor out per-entry teardown helper
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
Message-Id: <20261021-gpio-shared-fwnode-lookup-v6-1-6af7d8eefd25@oss.qualcomm.com>
References: <20261021-gpio-shared-fwnode-lookup-v6-0-6af7d8eefd25@oss.qualcomm.com>
In-Reply-To: <20261021-gpio-shared-fwnode-lookup-v6-0-6af7d8eefd25@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2293;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=tEMTba6j7OtG7ZvUjMGaZ+IWCP+KHeGpGKNY0A3P52U=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq2MsG5y2UNJTBlBqqyoLJP2yhTFZnAFAZ1/Yj9
 WAWUPBa+VeJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCatjLBgAKCRAFnS7L/zaE
 w7UdD/952bR21nlyJuf5dQAzdXPZyquoZ2HI9/zFQUmfKVwMNR9QmyxWpqmgfxpoE26sFczcbyR
 HWizCGYjdEnA1V/i2Fvdb8KCZQ/amEvTe4MQD7V5UiscoHIQdHcXD7ZhdhwrEgAkDtidZBX/KaN
 GwO9F4dthL0wpmRKe6+w8sTZYAAR8xAWBzXfH0OA58gHR2eHG0EnaspeAD3SWc6gmEueTvLkO7e
 pXkOVoKxdSRtx4xVpr65iHmyyMLAVAQBBNBrDxj7xyoX6LDFVLRrn18rBaZE09VpexKRG+3gFrS
 FrDv4nu2jHkdGds4hzEYKyZyan+uX12Tj8u08uiFuQKR9EgTxMvb/jfYtdRrA7QjX1USEnet73P
 vgeFX0yXdr/0gt8GlwsILsaaIjkqZq88uM0BJWQkrk2SizXgIdhYS6t2vnsP9dCuCdsvwH4dim5
 TSlO9tFGqOiYqkcxmKctdBv/+f7jPefD3WAIV/OtiiZL4YM8QlF81M+UCnXnPvM6WsCEai1TiHA
 Tiu7kiOngHZULeuyJnOq6rzKY6PopAhR2JLE9C//c//M9IxNWJ3SVzIByKLLFBBPqI0QpLQAKfa
 hF8Tc8fgedn4f5e1tOnw06haoLtR7FUsOCHB55NTx5SCyH9JKgJH98ww6CSgRpbj5LI48344wUV
 j5DuTuH7KEnKbcQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=d4JgWhjE c=1 sm=1 tr=0 ts=6ad8cb0d cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=gXy2-9L5Abwvwq9I_uQA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1NyBTYWx0ZWRfX6WPJytduJeq2
 g7QQfx/RrIpwEuyDU7ghl7VroKVGVmUDwSEkbgVjfg/GakCRn9JeFnqKZfwGkHuLNNbbuNrDZpj
 JDviMIlGzeXTOyh2aXDCmB1VFa2E59k=
X-Proofpoint-GUID: rCC7ZTfAtG1lvQt00FSPZOwUPGM9TeNn
X-Proofpoint-ORIG-GUID: rCC7ZTfAtG1lvQt00FSPZOwUPGM9TeNn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1NyBTYWx0ZWRfX0ERHUN/fSggy
 i1CgSL+4FJDHjkOyw9iPvPRwef2A0ShVmxPHziVKul4vY2MPowbKfVhp9MvYAWhTf+QRYcb7xFH
 0RBx7NqCDek/bJY4xjEtjkFH5h+uKDgbUUUWxszFr1yqwFvdUqRh/c0qXGqILnO8NWP0F+mnkIZ
 FRH12KUb2/qTHO/SEXpcD22GdqWRG6yMlpHYT++T1EYazvhgIoLVjCBaX7761Am1eZqv1Sm4v4/
 D160+t0JXu7pQZFW/yADvcWUineesHUdB65KTtBEoH3IDNJRkP+9BhU2GcAZ36g+ND46+o8OtHy
 jDIPi1UfZJJYoh0gd5ZrArFjXRosQhfSLQZtsmFBlGYphTJZlFxnkF6DgBSuUdIMmxd9X3zHjA/
 +mGYerhyQHplscugfQu6LDChKFEQP3pK5UURIbgr9aPhYkawfShoe7PjrpNxD3HjPNIz25p/45/
 XNsfBe3TSA18BG3K8lw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210057

Move the body of the loop in gpio_device_teardown_shared() into
gpio_shared_teardown_entry(). This is a preparation for unwinding a
partially completed gpiochip_setup_shared(), which will need to tear
down individual entries. No functional change.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-shared.c | 37 ++++++++++++++++++++++---------------
 1 file changed, 22 insertions(+), 15 deletions(-)

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index 8c9ac9d9330490b17fb3936b8758beb97a308a15..64bb450f0a8461d214a45aa97e2474ff0d1857ce 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -517,6 +517,27 @@ static void gpio_shared_remove_adev(struct auxiliary_device *adev)
 	auxiliary_device_uninit(adev);
 }
 
+static void gpio_shared_teardown_entry(struct gpio_device *gdev,
+				       struct gpio_shared_entry *entry)
+{
+	struct gpio_shared_ref *ref;
+
+	scoped_guard(mutex, &entry->lock)
+		gpiod_free_commit(&gdev->descs[entry->offset]);
+
+	list_for_each_entry(ref, &entry->refs, list) {
+		if (ref->lookup) {
+			gpiod_remove_lookup_table(ref->lookup);
+			kfree(ref->lookup->table[0].key);
+			kfree(ref->lookup->dev_id);
+			kfree(ref->lookup);
+			ref->lookup = NULL;
+		}
+
+		gpio_shared_remove_adev(&ref->adev);
+	}
+}
+
 int gpiochip_setup_shared(struct gpio_chip *gc)
 {
 	struct gpio_device *gdev = gc->gpiodev;
@@ -606,26 +627,12 @@ int gpiochip_setup_shared(struct gpio_chip *gc)
 void gpio_device_teardown_shared(struct gpio_device *gdev)
 {
 	struct gpio_shared_entry *entry;
-	struct gpio_shared_ref *ref;
 
 	list_for_each_entry(entry, &gpio_shared_list, list) {
 		if (!device_match_fwnode(&gdev->dev, entry->fwnode))
 			continue;
 
-		scoped_guard(mutex, &entry->lock)
-			gpiod_free_commit(&gdev->descs[entry->offset]);
-
-		list_for_each_entry(ref, &entry->refs, list) {
-			if (ref->lookup) {
-				gpiod_remove_lookup_table(ref->lookup);
-				kfree(ref->lookup->table[0].key);
-				kfree(ref->lookup->dev_id);
-				kfree(ref->lookup);
-				ref->lookup = NULL;
-			}
-
-			gpio_shared_remove_adev(&ref->adev);
-		}
+		gpio_shared_teardown_entry(gdev, entry);
 	}
 }
 

-- 
2.47.3

