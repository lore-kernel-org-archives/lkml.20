Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40FA749EC60
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 12:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788437283; cv=none; b=ryabWOHDXz0fL6tBlpcv4zBNbWbG4ZD529SHOndNKp9fPm+lwPR9DU1AJGrAt5TwJi0Tm6/MKf2qr809B+AhBEWBHjviaAErcchocHl9eJKdCR6TMSD3vAOXKJm7xZEKh339Bekq/jh9i01r04YCiW9AESsNu8P86Y+uB37qBho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788437283; c=relaxed/simple;
	bh=JvjgTsJZJ52y4kyW1nFUJTEfAu0hNknPq7wSNqID1I4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MxbEnZviomY8WOLqTlef+aNtynkoUTF8Rq4i+8kufNIcYY1Sx33Cki2HIzrJNTuMwpIRwV4HaThsGK7nAdA0sMg1SzIf6okPFvxlW20pGUCHKwpuNIn5grOLdEXpI0bXzsIut8//CwY3vQX+YPPQVgVVdvU0wfprJ0kcdQhaovc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bw21I/T9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hbAJa2il; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bw21I/T9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hbAJa2il"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683AH8nv3203916
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 12:07:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dDZqAY+ezXfJh7xukUn90z48pHmek8RAP97eAMAhVww=; b=bw21I/T9Rm7I7Z6x
	1j5DgDvyHuveaea1+wsbKgS65DZiPloXZp8gX1r/AmL6LRPpKF1QkorIs+QeNpJH
	cWKFAgt3fKSTt4sgBpassSrrKritpenEqUuYZkeC2xzjZLkJwG55cZXneG/Mb0Us
	+mLz9kMctYjQ5nd42SLYVTykIGOHCIAM1NGjzsSmW1zzLjx5f0rxQ5zlHvrdp08o
	9Hmxdc9IMxg2n3/KYTohFPG2XukMCYbHa9lG/gkndZcQDX5Hj0WHuF/UFGqSK5Tl
	+QidJ6uDpVzDmjwO9L7t+NLqOhmzKeE/JMNV50JkFT1YJ8NDGh5XT1QQn2BSIvWs
	jia1Rw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf5d10tjx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 12:07:58 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92ec3146553so637033385a.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 05:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788437277; x=1789042077; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dDZqAY+ezXfJh7xukUn90z48pHmek8RAP97eAMAhVww=;
        b=hbAJa2ilA+xZ4FwTHI8MM0+SHS0D8A5yYqt0oK76beNfFFf2xxM6wn/QgsMVv3NC0W
         LvVQ6gKlVicwJmRvUbg8MkwvgP4GRvt5N6n4M8H4FIEIW+1KEUL3/cWsXz/BlF6I4iu5
         SN1BCj1WJyZ1unTQkn3HUjwb0Ka3vGddrXRBMFd5IHcbV1QUcfeHwmxjaHpczDrZFvNj
         GXaY8VoM5+8xYjjraBEjM+osll8BJWxI2fuP4/w/9dqHiNofia+0wQe5iWxzyO00mHSq
         ycizUrCTYmm0Ku+5NnIDMkHP3HK6jO68OesKenSb2MoW76/GBb8r5lPIdkUsXE1cHz3t
         KI+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788437277; x=1789042077;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dDZqAY+ezXfJh7xukUn90z48pHmek8RAP97eAMAhVww=;
        b=nfJqNEQS6BbRgHntfoKib+4gLTbiT160sDw5A8fFachqo+nWDwFKsJIMeWJ4f3PctN
         SPeUH9qIr4KvJ/38dXpHcDcD93PpAZVubqGc3r4uIp0aDA664B93xHT0gAHCmQjEab8f
         IqFbI49mZOjH/bDVwGBoQsxi+MHpf0mHHSW2Eq8GjcoGvT6uZGdHTPQ5h/wrY5iU5Fo5
         uHwV0ykf9wwnBrna73t78SERGrJO/5Op4L9mKNG4C3j2puMk9qVgIrrlLM46KuOYs2fm
         CdR1y1kv9GYMAXQN4kP5YlP317v+HvMDz9gAMPBkHSYLp7eQBgkflabOt82sVkO3IkyG
         GRVQ==
X-Forwarded-Encrypted: i=1; AKwUvByGlbWd8uEOwXzxPWZ6fgov4ZkPHBawBwKcqomLkK8hfcw934oY2BSszHxZklRKkhduRIw1PXwM39XYZXE=@vger.kernel.org
X-Gm-Message-State: AFuF++lkgG0X29204uc9/B3ftct7dH434KXL7zyCGvku46p8FVeXQvk2
	OLboG2bVyEngteXxBMBHxUKjWI4KoDTRBRKn2jVv6na8ZWO2k+3/J9buwWaS7PIdqxcrsPaXq2z
	I4gPNwjKbq2Gfo2ysj6OPrh+Ye8mJ8EKP5OxiSd31T/hIsqy3bUH5MZ+cU27oZfbnouFMORKelL
	A=
X-Gm-Gg: AYBFou0HHpNrczmvWnwK34eZt4rZvYJdS8nxovXktsGUvaz53dJBRHTBFPvzB0rOm9S
	DJ72Kbr96GO45myAIdh7X5qZ1zngpiNQ4BC3X1OlgRMWhb0nbxmaCfeva2wkwCAgu+i+TVSNz00
	mcteFUy00KvUnXMmx0qE06z+0kJZD6LpLznj3VwX4h8e7XldbpPLTL1bAI5IpJ1uKbyVxwOKfWW
	uNvxnrFVtLhWChK2AnbCUVP4Rg4OyXBHE/xMEmpAFkeaZD73Z1k4VPY6E9twMqgC6lFBHmVn6X8
	Km59hJIB5hKIrXMxBs+MNukmBNiMX9Ow3tPiOSjCHHts+m+l/V/LhFr+GXnGdvYZNpUNLultvka
	SKWYa5tHB1yyz/gEJz6/GnahP9tP+
X-Received: by 2002:a05:620a:6187:b0:939:6df3:d7f6 with SMTP id af79cd13be357-9396df3de25mr697151185a.49.1788437277325;
        Thu, 03 Sep 2026 05:07:57 -0700 (PDT)
X-Received: by 2002:a05:620a:6187:b0:939:6df3:d7f6 with SMTP id af79cd13be357-9396df3de25mr697140885a.49.1788437276736;
        Thu, 03 Sep 2026 05:07:56 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:1c7d:412b:f9d3:3bfc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5d587csm72143115e9.4.2026.09.03.05.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 05:07:55 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 03 Sep 2026 14:07:42 +0200
Subject: [PATCH v3 1/4] firmware: qcom: tzmem: guard against IS_ERR() in
 the cleanup handler
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-qcom-scm-code-shrink-v3-1-8237f3a654e1@oss.qualcomm.com>
References: <20260903-qcom-scm-code-shrink-v3-0-8237f3a654e1@oss.qualcomm.com>
In-Reply-To: <20260903-qcom-scm-code-shrink-v3-0-8237f3a654e1@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1151;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=JvjgTsJZJ52y4kyW1nFUJTEfAu0hNknPq7wSNqID1I4=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqmWMUrMFILDlEffZuTArHusuP3GlPVcDQI2UzL
 bpeQlMEv5uJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCapljFAAKCRAFnS7L/zaE
 w+KED/49DJpAzsHZorDqRzPFVsR9qZ7WTtBdJ6o9gn2g6/0sCUk0dGRtonXJOXlfnH1dEVrfufm
 fjdvH/7gHxiTVxtAxoxYp4RWQbVOSyOqlP1Siqz/lJIyhrLdQJxmm7uK5vq4gugNvN2BThTy4BX
 NcZXq/STTpvrr/7Dj2Bdlc3YuDtwyWp28XZmCzSGtsRdXEgC/d83FGfxbWk+RS6Mf3/bLlDbrbL
 VQZgmZ8Biju9MBKRXZFfKvYE3NHh2hAMQUoT1IATVJLaszl00EowfEHu34K5CdmkTJZUiw7SQhb
 lZVvG7LEzmANBlJUxtBTtgSo6fJ2DEPatPQE09WrbRycvau2btzfffIQKbvpBqNoY+/x1kdQ0xs
 NdXAvfJfSuoDwhLMQ1YReTOyrpVnwKngl1W16zPmxqje5d5WUyRykzxrsVKS5oJGdmac33zFoX8
 HyZ3APTDuM7qlC945gCaL2GJ3cRzgR2Bz0XaBJQrWgBca4VmQrn8TKRqgD7sEiJEf5Xcf0MyCdg
 ThnONUZzx3RFy9fAqvAB+vbTKd+VTer7cfZyfsoEvLu6rrdybuZsOtUQq/4Kn2Pe8dYxE7T0ew7
 LjmNzhuKA1QX8mdVwZsMzYC+AVgeoqhFkMj+dmn1NjXXfFQEwQUYjZJKk2FVLtPEtMOvTXGWAPG
 jpEvaIxQapLlWIQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDEwNSBTYWx0ZWRfX2mAndu1SgzUW
 UsYh3oipzo1nYeT41DS0fzVrtuVuAi+LEoXGQgpph2GIUVYSbs+T1o5WXilp/C3gmtgPydndpQU
 jdvwA6iNFeSTNPwPSAWK5Kh2FR7kBqer7M8j39skYZaDpL93SS3sIYKuiItPih74RxBFvLEJ//g
 tEJqmg6qBCHb+wPR5Nap7T//YRIleA2OmWkmcWqDmaBR7IV233uz2Ebce6/pQaROK7sUHM4uAvu
 bC95y8lh8C2hwq/aGiFNFIRbRClsZdiIZ9fr/x822KSO/QD/TcWol8mXjbWaDQDq3q9xsaJ24xr
 Kc5Sp7rSUwowlsojVXb4S/TrtGLzkXd9Q3OSYRfLVelwYPgdq2K1Cgz7kiec2VpygW2pVHt3iSV
 E9ztBLbufsa+XDhXbD6wxUsah0o7bPQUld5LgwYx5BZA+aJCRxdSAagVflCE2ZXQ8bGX/Aoc7y1
 GB0IhJ04j7CxXBcEkxA==
X-Proofpoint-ORIG-GUID: 1as5Bzv52CQfJBi1C_xqLZjwhP-vasZ2
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDEwNSBTYWx0ZWRfXwTWOxZ73QQCT
 6NPGT66N2e13zAYqoaY/sZWOnmdOQzAl6tc7n1++lOtQvx3j13d+mdQGTr3ToA3/rHmmAnesZYf
 P+KyCGYyOsKQgPzL/LpUkP6Yz5UjOSQ=
X-Proofpoint-GUID: 1as5Bzv52CQfJBi1C_xqLZjwhP-vasZ2
X-Authority-Analysis: v=2.4 cv=J4GaKgnS c=1 sm=1 tr=0 ts=6a99631e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=PGwebHSm6yYtckILb5AA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030105

We currently only silently skip NULL-pointers in the cleanup handler for
tzmem. It's possible that we get passed a pointer holding an ERR_PTR()
value so skip it too.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 include/linux/firmware/qcom/qcom_tzmem.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/firmware/qcom/qcom_tzmem.h b/include/linux/firmware/qcom/qcom_tzmem.h
index 23173e0c3dddd154dd56dc3dcb56bd20ada0520a..b5520178bf6f53b86b530571a3be9f302225f022 100644
--- a/include/linux/firmware/qcom/qcom_tzmem.h
+++ b/include/linux/firmware/qcom/qcom_tzmem.h
@@ -58,7 +58,7 @@ devm_qcom_tzmem_pool_new(struct device *dev,
 void *qcom_tzmem_alloc(struct qcom_tzmem_pool *pool, size_t size, gfp_t gfp);
 void qcom_tzmem_free(void *ptr);
 
-DEFINE_FREE(qcom_tzmem, void *, if (_T) qcom_tzmem_free(_T))
+DEFINE_FREE(qcom_tzmem, void *, if (!IS_ERR_OR_NULL(_T)) qcom_tzmem_free(_T))
 
 phys_addr_t qcom_tzmem_to_phys(void *ptr);
 

-- 
2.47.3

