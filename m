Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1AAE48A2A0
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 06:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792046314; cv=none; b=GSViwHdCrMBVzsmsNuVwgMiMCXMSdVFPp7BW+d8+Y/47xYOU+azn1XvKDbObqL01Yf1huK5Zb1umIHEA9vZV/iw6npaKrgN764RXlkCtZ9nx8aP0BK0vyqcvyjUziVFUY/uWb9aKEFySkfdJ9gVv1Imjbs2HMk9nhcOn2KQnaTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792046314; c=relaxed/simple;
	bh=JYTMtNgj/5fZcL3ftFEkoott1ir+FEvQxYenqM4wIjE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tyny+AcOhM/1NXj17HRdgBfd7BRH4DN2NsmoH9lMk2PID55qEs5c189evt3FYhGk8npaXnnoa06QtDvCV9W493kt6iKN62xgqPwHQHhxXBhEt8ftICuzjXfCyCseBQbuTpN8mB3k13CsJ2Su2arevCt8AoJksPjTwgfflNmit7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TvXu1D1e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B3N5nEYx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TvXu1D1e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B3N5nEYx"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F3xZui2738642
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 06:38:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vn+PAPU2yd7dK7uPhM98pxh8Uq/TtLrKIIgwoWoqb3U=; b=TvXu1D1ezG/STOX9
	8R0AFj1gTvm2/nHC15+MuZiqzspRvk1HLnKXf4UGL7aK6ufIT3D82+PG4lYDENed
	2FEX1L/DHyCgsk0SpV+bJMV7i5db5Wksppsd6LrHXuWR954+54infdTFRWAfc6YW
	bZv8xx7yq1k2Hzz3L6Y8Qyh6XKQCljvo+zVecVDMW3aeMfXRxmXaQI9qxU0dW7fV
	MUSBOlwWv8HVFwqdnE+r32Jx/13swZ3AyVazVPPCzxCQFFJzb6KbqAZEKPMKH2xn
	PwSz4sp8WioAma1ICiJPmSgPV9rCceidSbBNB0Y7TIy9Q5o2t0f5IYzAsGWxt8kt
	aSeeKA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haqds8gwd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 06:38:30 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3abfcf726dcso1716938a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 23:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792046309; x=1792651109; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vn+PAPU2yd7dK7uPhM98pxh8Uq/TtLrKIIgwoWoqb3U=;
        b=B3N5nEYxZ9ZHvBQkwV6Lr1UQD+n8zjUI8xSG5EE4LrzfycdOhNqYPWGzBCA0BqtaNy
         CeMLdFXiZ/3/cePmRPMS2yLbtdNxGJS2jpT6QCZVvrvxZzoyfADq1ZpoyXBqdoi6k1Tw
         +LM7jBF+9fwRVDTy9hS+TU1nHeiUIadaU++m3rt+XVW1OG7R+cc7vW6GdGiy0ciGNaMe
         SCW0yUcfWV4UD5TRpwlUOuyi1G6cglHmvZMSyGjj5skix3TxLp/gF9EITY9BiozNFjew
         A4TqioqTii3RNWogwu2DJXUTKKths8yQN3Fyg67P0YMyBaLNcEMQWr0uiD4iSZCXWMvD
         ZiAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792046309; x=1792651109;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vn+PAPU2yd7dK7uPhM98pxh8Uq/TtLrKIIgwoWoqb3U=;
        b=JyoZ2sBCENNXgak3mDsaA0txfSqO3V+kJn/It1YwYfKjqWMf4dSH3/fe6TZmAppWUw
         7IKmEDwCsFBQpYSgwKbQ04fsoTrAHZapmUYQHHCnbK3Pm83i/bj9UEoMs6OUDw9SdNev
         S0bDy9me2iYWaaRDhHfX7166wpDANb+aopcKFVGOSQZravJLQCfGnXYuX/GkeUIs6pXJ
         +kxPK/oUVWzoAvEdQGfkuBllgMfpO/lcO3mOdiarYt9GQh0PrYuhbXz6TtF6SzDTfrh3
         zdo805+twSoRhbAPX4y5SkgyUJsI2H64W0J7J/9y2HW8enJSw64yKKiYt1ug3v+hYFIM
         OJRQ==
X-Forwarded-Encrypted: i=1; AKwUvBzweDyutsrXQWssfFbmVTZLej2L3e/Bfsb4HM7flPRZwdhsUhbsOVbgazaej6rqRiZ9JzB9QTanZ6h6j78=@vger.kernel.org
X-Gm-Message-State: AFq9FYIyFvMF0jBSEARh7AGP2/Ke/pP3agtYm1lIHTestDA32MG8hrHc
	/mJ613b7qq9pSkeIaFi30RAf9UrBdwmabpxuA80BDbxZ0n4fJAdvorW62A4f/9AEAZvt/+w0VAq
	euwaiuMaQQSp94u/7hwFIx+tpWe9Kji6rF0JOcE1TxD17PzUMFsSN0pfnC3lzVdXMKoc=
X-Gm-Gg: AYBFou01jKkONnA7FAd/eqKS5tbrFUCy2mGdl1mOh1hZ3rwT2bPm+dRiPOb5oF6HrLy
	S0A5oPobQNam7bRQfvvbtkf9DFN4AX+tUJMkD3Lh8EcDuC1OgKhN2MAdqmuj8tDJdl0dxfhdPf3
	uRE/C9NOu/rpzCqoCerAlYeaAZnVkuf4p3P42H+TksJ+rkabr/Mt9MKJvcRVmx996yy/V7Y/Q/x
	f/TgFRgHMbZeJe1CLtP1mRGuWxyhvSygS80x4ccZagJJ3JKtpJg4nu/IiXhmVXZ765Tzn/OtO4w
	dSulFJAHK8uKOvREMzBr1Dqvg/GI2l+CRl4nrw7EVp2gDBIxmtSUlVfdBaWJN9AMx7HK2zNO6cD
	2fzZpjZzo1Xi7zguP44B8diatxAjG+s79
X-Received: by 2002:a17:90b:4f4c:b0:3ac:7377:fd48 with SMTP id 98e67ed59e1d1-3ac73780712mr3644508a91.56.1792046309450;
        Wed, 14 Oct 2026 23:38:29 -0700 (PDT)
X-Received: by 2002:a17:90b:4f4c:b0:3ac:7377:fd48 with SMTP id 98e67ed59e1d1-3ac73780712mr3644492a91.56.1792046308950;
        Wed, 14 Oct 2026 23:38:28 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac93ff4474sm2844429a91.0.2026.10.14.23.38.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 23:38:28 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 12:07:48 +0530
Subject: [PATCH v3 3/3] MAINTAINERS: Add Qualcomm TPM driver entry
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-tpm_qcom_driver-v3-3-247c8e50250e@qti.qualcomm.com>
References: <20261015-tpm_qcom_driver-v3-0-247c8e50250e@qti.qualcomm.com>
In-Reply-To: <20261015-tpm_qcom_driver-v3-0-247c8e50250e@qti.qualcomm.com>
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
        Peter Huewe <peterhuewe@gmx.de>, Jarkko Sakkinen <jarkko@kernel.org>,
        Jason Gunthorpe <jgg@ziepe.ca>
Cc: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org,
        linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: jrLYLCgua1DAKmWLzi_9V44je80dqsLD
X-Authority-Analysis: v=2.4 cv=fNusTpae c=1 sm=1 tr=0 ts=6ad074e6 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=tHMf5gnvwFDjO4kcr9MA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAyNiBTYWx0ZWRfXymB3J97nbcQr
 JmeJB2vWu4jQb7iU3Ws8IpbUedrcNkEz4ay7EpZ78cicZy56fq3slRF5MPb3xAozZCteCpkVTu/
 mzrK6ppYv+Go+DYKjAU8BTYPQQ5TAZ04ioa/IAm3mAnPdqs927GrjYr3XOxzex9D8he1RIiLmgs
 O1sxMxDQG6eG6y5Q72fzVU3qXe60dRZ/HRHU1dcihKfegVEUhIzv1AJiQowj3kMpV5MjAv0QYKq
 5IKXGK9uqBPW5d/andKZ/Z2UKhtV1Gh7/GCbaF1dFESpt1BhrlXXW5FGt8kTvUWHRtHOrAMRNZE
 HZkYcWxx5ww2KPjQAZRe90VRPlno2jYyx0Le5lVk41ypamhKniPyfWLEXlihjnzI8yjabloq/uW
 xyQsNCwjXzluPTgSKEgXKOXbLhI1ADw1zGXjBjXvFG0siiyAGaKbRPMM8MYqiCIVyL8uPZqLtBx
 gcM1siabJ2T/ICxFp8Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAyNiBTYWx0ZWRfX+7ofqdupD3xS
 uo/++Hy97ehyuSp7ttwDP1nNbnm9oV32caYenWnV1FTkLGA6gspKKe2hbEQ/CT9nNGwclkbMX2x
 1FIddHSfyq804liDtRQxjNtc2vZVnsY=
X-Proofpoint-GUID: jrLYLCgua1DAKmWLzi_9V44je80dqsLD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150026

Add a dedicated MAINTAINERS entry for the Qualcomm TPM driver, which
uses the Qualcomm TEE interface (qcomtee) to communicate with a TPM
Trusted Application running in TrustZone.

Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0426fc05a66d..618ebcf39ca4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23124,6 +23124,12 @@ S:	Maintained
 F:	Documentation/tee/qtee.rst
 F:	drivers/tee/qcomtee/
 
+QUALCOMM TPM DRIVER
+M:	Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
+L:	linux-arm-msm@vger.kernel.org
+S:	Maintained
+F:	drivers/char/tpm/tpm_qcom.c
+
 QUALCOMM TRUST ZONE MEMORY ALLOCATOR
 M:	Bartosz Golaszewski <brgl@kernel.org>
 L:	linux-arm-msm@vger.kernel.org

-- 
2.34.1

