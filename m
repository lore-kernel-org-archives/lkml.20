Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792749562;
	b=CteVezYqY7VEguLgsBzz2fteNHAD4W9TWWD8mQc8tdil1rtIdCfGsJledHT/zsUEWf8g
	 3ZN6fHfAByDM3MyCjmCq+gIrtT3QQ5RuefzrasEvtxG+4WDDPoIGkpRVRlEHItktOlTAS
	 2344nKl1kCzTUePJBkMgNGoxhhosPQU4FXhXutDzdr34g6z4TxlwD3JAGKpxh8+miUckU
	 mxUKpTDRNruLQOvH2Urc9vEXLvpYYuygwrM6c98jRbDp4bGkr2/u+58LbPui8T7TS2PKb
	 xHX9+Ba6YhY7aqISyMSYxD+PEW3tCI8qiHg+U8BkZ/TbsolisQhBCHHFitwCXLKw0mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792749562;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=qObhk7P6qFFtcYvqpzRA+rRNnFaua2XVu7v9r0gfD6k=;
	b=btXjFLku0jp0116lnAxXVw9UJ3XiFLTsKmUH0TotzKjr4GbDnj/uV9zyXN1x82dU3wQT
	 vOY8EPOJpLq5Fo4o8jqTrGOl3RDVdMjb7SwAVMZ2XSIWEdh31vRPomoWfBoOZ2VM2svJU
	 2gLUpvacBuraOYBg4ZLO90U4UkTQef0rHqGsFsWt3qbeXWURYl9gctLupjQ0DHDjZp2AG
	 tAra9A6EHl9zwJtHg/hY0lrTVo9a8t00+gH4vCtL2ODB/wI7TmzhDMH9wVJlC4Fo6heHX
	 m3I594DXrhUSG1rb84jbavmuJh+1/pDuprMRwWkmO8Hq09xKj63TONfchM0tGMM6+dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VIu1ZjJP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jTQCQP3u;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84577606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 09:59:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84577606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VIu1ZjJP;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jTQCQP3u
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N7FU3M588011
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 09:59:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=qObhk7P6qFFtcYvqpzRA+r
	RNnFaua2XVu7v9r0gfD6k=; b=VIu1ZjJPoBYcHKvUrgj7XR+WAuMUgGzYxq7Rm1
	9xUj2mY3wwBPh+BbC4LI1F0CXX9He5t40CJXo3n8GGXpRTt4EWxqdFAIIMWVvTsS
	EVMb5pna4us27CuvIKkg0F/BP8QpNDbWHUtizbaQokQXWVVlXsHp3AEZdJBazMvh
	uMK0PFIPPOZZQh3Lss0CLxLQa271M6gpDmfqKreXyA6jTKmNSXLIUU8JwH+mFbnA
	XO0+Y8OrJ32bqa7l2277h4sm+U6fyu6yOCFBgDDpJxQe2dSFYhdXWBujP/4HUSpR
	cc2knUinb+RZKcJ7VPIF5wnkNNHZUaiLAUtmtQfg6pLSK/FA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfsmatjtd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 09:59:20 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f2005ce21so123033685a.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 02:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792749560; x=1793354360; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qObhk7P6qFFtcYvqpzRA+rRNnFaua2XVu7v9r0gfD6k=;
        b=jTQCQP3uHIxlGiFL8WOl6ZNUAxW0MjvXzAzuiEHiaycm4EmNFVuWw+H0eCFtlokezo
         3VVpO8/UbjM1bZTNGIwnu5nxQMbkOsJXtlV39lWNKbya5hgNq+K+lDvweUT+y1X5nmN+
         EgfXLOzwiy0zMRuyUfXzEvACL7QLdvWLsjnqTECwR+YFr2cdqtz0SjzV6FeNZiveV8TD
         dXF5jDnV0mYq4zD0ZOdU0k7TAxFVyUS3NJ2eeZK9DY1dwO2Cxd4kq0jXB6wMTHq9ItRI
         A0RBvafBLIlSCfKirY/GheHWGaO9iXFn8QJLDPcQ3zt9Y5QYrLEI+2CbvzZSXMLdY5Zi
         c/IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792749560; x=1793354360;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=qObhk7P6qFFtcYvqpzRA+rRNnFaua2XVu7v9r0gfD6k=;
        b=hDbQJ1Ciz78lnuQI5ipj1gNZ/buqfy3PmgbdcIsQIhtEWHEz8jZ/JNg9duGYhAdw8T
         33oZ5AjaBZNAva3Ao1aBKiLtAZCr9HSLn+hell7w4PSfF1fsTCflalVakx33mRSMTaF+
         ccFVaiJ5Stp2rj8V1T8B8YNPf2rNJwmHeV1UjqLhTnJpLbosoC3nKBEhwbl5Zam3tfIu
         b8MLRPZ2h5+vEN6J1efSMvSVseaAyJ+tmuRlvU4Vmg4iZ/7938/EV1l3/5aHdsFZwdkt
         n+5Pwtewgp8wvjRC7GLvefDwA/PeAXuUgN0OHylqlbgQH5zpuBRaUhndKxjoR4AhaBPa
         WGGg==
X-Gm-Message-State: AFq9FYKlegrVqKe4JtPJ2b9GCzVdaa38bE74WnE27kBpCOmwykecDFAH
	9GU0L1QCVJjsg15dwawOfuYKh0CXWjAbJ9f83TrSV7Y+E2bYLJSYxPyKuHrPdhhQf2sTMdkCA1L
	9exAYfnFC3w80emczoTL2Ln22fGbpuzmrqN14jxD6FKIZJXzC0u+nK30ZiIXzsFYopmKVVYgqfA
	I=
X-Gm-Gg: AYBFou1AHvHQ3BRCJ9Oj+FMIGoczONnDZT3hZF7KF+4w18tf+muuredzlQXCiMULBoL
	t6oJ16FefSvpL/gykfPpI/1Eh2z4uvYjtANKxljvPshVCjOZh+jDDFb8OGi6EZVX10raosgQEJ6
	L9M4/p8NdQnYLMETdRTqkqW6l2FlQftzDB24MaD54C/c7oHzkI8MKtI+EoGbKl1TBZUOWLP0qvx
	PrnqNJaSSgB/OIWFGLP949GaXWQKobcC2A03VGK3tDs40mPOcCtFe0+bSy64SmTxHGVNs5MSOHR
	X4Nhhay7XWW/rRYupRXglfey3lqSfhtZPI6A/gUwrOEs74tWrxsMk1VuBBlEPhpp4ov9ovMwfQg
	LkLPfrqg7tbugy4YzkbCExc7iDskR
X-Received: by 2002:a05:620a:400b:b0:93f:57a3:71ab with SMTP id af79cd13be357-93f6f94e2a4mr298871085a.32.1792749559665;
        Fri, 23 Oct 2026 02:59:19 -0700 (PDT)
X-Received: by 2002:a05:620a:400b:b0:93f:57a3:71ab with SMTP id af79cd13be357-93f6f94e2a4mr298869185a.32.1792749559202;
        Fri, 23 Oct 2026 02:59:19 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a21555fcd1sm22619935e9.4.2026.10.23.02.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 02:59:18 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 11:59:16 +0200
Subject: [PATCH] power: sequencing: add .kunitconfig
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
Message-Id: <20261023-pwrseq-kunitconfig-v1-1-0576e431565b@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAPMv22oC/x3MTQqAIBBA4avErBPUQKOrRIvKyYbATPsD8e5Jy
 2/xXoKIgTBCVyUIeFOk3RWIuoJ5HZ1FRqYYJJdKcNkw/4SIB9suR+e8u4Us47oxbav0hMpACX3
 Ahd5/2g85f6eCRPtkAAAA
X-Change-ID: 20261023-pwrseq-kunitconfig-073d8867be6d
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=810;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=5Md/kZ+LiBWZqC7MEfaaUdwXUpxfghx5WOcwz1JD5lU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq2y/1+goXEDhbljKDgJhVgwN6lbQk5QgvC0nP6
 GIevYmZOY6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCatsv9QAKCRAFnS7L/zaE
 w34bD/9yQb9tfGk5aPNAfGbc3i0vI0MHL52KO2KTf7C4sOdXIEPtXVmduzM8euH6Q4anHy5FN6+
 W2ANoej2qAs2pkC440hahA1+ZQM7+a0e+9Tnr2BLqzDz8zjWuTC3ed8KV0c0dBfPRcA8s/sGfac
 eIlOyaw8K/gGfK8rOajKFEluvCCOPuNo72/aq8ELw5fk+/ljcl7WmFooqUKjOpqS/0kKIekNreN
 28/1G/0Xkjjw9wGPwkOTL79em81GV/D4r9ANqpLCmjT3UfSR3HwpcfLzpYF8VVfGyzeT4+Tlnmu
 zRQx78Z5Lkm9BeEZQ6qrrMtFP+jQwlV9qFB4lx0QLLiBRuuq1NBKdytPPV2lVtywM9q7RtBHDxt
 juSvE+PC/h5ej5+dwBYyISLjdpMNGO5Xj0SGAXbAB/HIYv7vdPEbmtVd00ddTp0KixwTf+7oTZd
 1hyd0JBxyzZtJ5Y0KwKot6kvNDCV8tT5ZhAtsZZpjmh74/srKQY3ugHIyW5hhs2oiMeyIPHppwX
 gk6W6E5qhbZ6IGuIsmf9t6i0EkY2ck2KFP1QSmf2E7/6NbhrwBit8xPca5mWmIiJA7DIWUrW9K9
 Btibo9E7fCX9BFkApb6uY/2pKFt7mBoePQdOPqHFr9Ud0O//S02HaAUX8jchboijis310yJWh0O
 7GKrJuBjrMe2pGg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=V7LoQuni c=1 sm=1 tr=0 ts=6adb2ff8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=DIZ46cZ5GcFYGT-oMLkA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzOSBTYWx0ZWRfX3If4MHFfeCl7
 o5NLmHmsnAbFXg1z75AlEEqGvQvNzYnjr03e8901naDbWnX02YQJs/RIof4rn7XERjLwObJ9TZ4
 fdPhXwRmKtZwG65WNH+dtN2SFea2ijY=
X-Proofpoint-GUID: W2bk8DgRMK2pLxtTKbQjBxlOu5XX7xdA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzOSBTYWx0ZWRfX5w7E+mhmQZiV
 ycyqfMcak1ek16DmhJNIH/P77vUZsJpWpNhXESe4zM90NCafQEKF1MRdqP1/tcnBWmpR4H1V5Xq
 Wv8HCEAjYy6+OBm0fRZq4gzTGstpF8DJirUu3C9uVoQsr3pcb/VbwegCB2KPF9j+Y3a4hcTCOsV
 Z+2sttDdLicXEe97rp21n5xmitwq+a3z7bPXtyVEFw4a7wYLsYg7Ud7r6eoTbv1R00extJgPyWK
 tXllKPSAzhFnWbrjbyQubb0x8OY2PN/LBI1rmQTg79LEtMeOTe1cfu3EQgBm5EVZgnlROBtCnXF
 sHCT2Rg80t0WAnPQIZbn6VMrWVkicJjQ/SVY9JqbxrSebP6K8z8Xsz5tgiaMGDR3+pWOnt13Zzg
 kQcmr7NXKpAL01WuR5BnnpyBWSNoO6HM/yh87B2ttgayXfiGvF6GyD3udU/ox0V8RH5IzZNGuof
 xpKatDudjvdZwhs1eVQ==
X-Proofpoint-ORIG-GUID: W2bk8DgRMK2pLxtTKbQjBxlOu5XX7xdA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230039

Add the Kconfig fragment allowing to run power sequencing kunit tests
with kunit.py.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/power/sequencing/.kunitconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/power/sequencing/.kunitconfig b/drivers/power/sequencing/.kunitconfig
new file mode 100644
index 0000000000000000000000000000000000000000..c73b4e374d0742f4ab550ddba04f873f476218e3
--- /dev/null
+++ b/drivers/power/sequencing/.kunitconfig
@@ -0,0 +1,3 @@
+CONFIG_KUNIT=y
+CONFIG_POWER_SEQUENCING=y
+CONFIG_POWER_SEQUENCING_KUNIT=y

---
base-commit: bd1ecbb61afefc6a8b876ccbc31e9228b44e9eab
change-id: 20261023-pwrseq-kunitconfig-073d8867be6d

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

