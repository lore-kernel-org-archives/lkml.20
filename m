Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792515316;
	b=ikuHdVoP2wcrlwxmDa3gayA1jWCReLFwz27sMwELBPrCYIwRKmP9bJX11xRjChnxjLHF
	 5ZOs59c0Iy5dM8VyGHvQy/3ecjj/bwQbDbt3gBSwVI7hsHWY1nDPSg++a7aVQSshwWPvP
	 xcyDlLN68OSd7AtQV38Be0M1ybgRj7V9yOOBa4tYcup4LwHMXXuB5sA4JjNWONa0y89VA
	 mAwbhQT1crqztEXNQ60lfDh+cAPiLSyeDKgY8p7zvJjMOYdE7f8ozsZwkrJTkcLrW+Raf
	 JiQzjWAbacS5qlL97q0f+OdJAFSYqey59EBXQtSwz7WZtpmhKi/h+B9tEps7mgBHsYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792515316;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ZGOMTsR/qYMhghFRquytVajxM5kcezdFz2fZ1AyM3Co=;
	b=qsO2xCq5EZol4Cta7RUuoYAy8LOPuyzDVfLWsVRk2pbLDs70tAQDhRPZHaVIsnuwBHkN
	 u0OMjPnbacqvZtYQep679bTaGHbfOFKdnSHAbVvaPgiuq/SU4WWF0KomaAcEOixZwwyJU
	 uOAE/ZKgSzklQbIHZpkX2ypY1imwrHFY++ddFUzraWmoreiX7fjVgxV8x1ZQwBqXaOClt
	 8RqTUT4o60ZLfpoodjkKjearCAO9XHCAu2vLdhHHUnUWePRmuBxQZa8M923zxVVNnoMWE
	 vlhVaMlkRjzivH7ZAvSOCmJuO0y63MwLTOyEczwy/tCewB17gjZM0EM4/Y/jY0KWqRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c0ONOqTH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=clXeDwqx;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A99A860A2622
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 16:55:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A99A860A2622
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c0ONOqTH;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=clXeDwqx
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KDA2sv1209384
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 16:55:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ZGOMTsR/qYMhghFRquytVa
	jxM5kcezdFz2fZ1AyM3Co=; b=c0ONOqTHj+Mz0bFVZIqDSmJafrz/ua1nDXbZtU
	8VNqZtGEM6UbsuPTZznXs11z/NU56H3VOv65LKgC/0HlSSCfO543Osvjuhu2LKiV
	xYi1HTwdq8pfRK2wXJskTVE5NLuxB1nuuy4kf/F6ekGqsIx04wxdel/TgqsL/6WS
	F3wbbzzsk7n7A5Duoi36hgl0HCCcYgREnIO90KXMySPYn0FlDTXkGATx1SPQ9EHR
	RfJO4rXWw2NX0LMQHRSGkCq/GfHkJlG7WbY4+MkYYxagbcxHD9bAQVN4KBbHQJdH
	Y7Rk6g55vz90kcPgpgUR2gt3kejqUvvnur7zxlUM2uDjhetg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5pbh37-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 16:55:15 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-35c5aef2a74so12075657eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 09:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792515314; x=1793120114; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZGOMTsR/qYMhghFRquytVajxM5kcezdFz2fZ1AyM3Co=;
        b=clXeDwqxlJE7J1tPaxajlKYfTzuzzgsuoh/WJJXfmy/i4M2hxnyr3SqaJYPVu7AFEc
         XkaN0IVAtU8+s4tC4HGBR4EH6+M6RVE+koPCBnu0cnjfEGPbc3Ye2X3iUB3s89lJUxrQ
         7vp+Gkvk/eHabc+M4DWb8t9uEIuPhLyAnO3kYkRzDnwQMZGPKKP1IgSoxrUveJjf1WaI
         rOKNy6y7wOZ3QnJLTIu9LnSwgH1nI+0FjnxiqVJcjNM7KVbgyOCs9rtvckTXPPWjwE3u
         GvDNvloVSFkwKN2MVw91RKwpn9vNyyyxArvDVVMEDQiFrhCssqaZPbh4Ien5rrDxuKWS
         LvKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792515314; x=1793120114;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZGOMTsR/qYMhghFRquytVajxM5kcezdFz2fZ1AyM3Co=;
        b=wZHOYmUg2eIiHzLB6XOEISL/Wc/mBNNQv4R5dkwjVtQKc+DNrvZzreLE2Q+LAmCVbV
         yMkMmSkGbggSmsYnd3Eqpdp39FcI/CWt5mzg1iCdtWKtWQ/CVwZ3RIiRdqBPdGHHIqoV
         gEIrMmNt7deRsRzKX2Ra92vbYm9N/QAMB8tBQ6aEm+6p7dIyLN8O2bjHsYaJ288EqgAJ
         OG/5CYovnerL5k74htF7BpeLPGzeL7Q0ESzT/1W4LP8CGEhACT3tbl+FQWvUKwNthu8F
         X25j+5GZm6jOT0J9XVqXUzcmjMnbRuPWboZZvSdZSbN0IXcWIoumM8PM1ZdPQBcGYBEy
         WL/Q==
X-Forwarded-Encrypted: i=1; AKwUvBwe7NSAfBzzxzMW6ClE093Ke7ahjdCtZTtbm43SqQTKjY/HsqkOLu25Xu2kxGAog1IF8BDPwYh9OsvkuFw=@vger.kernel.org
X-Gm-Message-State: AFq9FYI+RlU7nmqSnedN60g3DiZCOC9Nyrm+OpZYNengfcNj0Er/BzAn
	5Tui/68BgC9Wg308+3BzGc8jZhtcZrNH5eQnDUmhHbQmeizcxHowLBj9WoWMI2ubx5yx8cImcxB
	Qaw+Z+aB/opggND9gMMY7nTMF+cRWk5dWX5tvg6+FpmT0CzjnHyRdEDBbtZVcJ6MIoEA=
X-Gm-Gg: AYBFou2881yfmK8h1qmnH39yb3SMyD5x83JzZlR1BBbVfqM6bep74mZ6dLtM5HsnlYO
	KjD/QnrgpUx8thg1vqYaLX8W59RsVRIJiuMOtiikqJv8GkHeqtaj01nCSCjqa9lOXLtWTfn4e63
	85xS3yHX97Qll28vtLJnS53n7+etnU5IDeqWpbEtZ8CiYYi9Af3iY7mSUrRXO2i4Lx8I6+OXdoM
	nMqzn03Vs/srkqZUc8z1J7hX4HRT3EMQrX86RN/3DqS8MIBm8alfuDPSmsMrujlLjNcXt5h/kmY
	AsSwTbKgTyNLcGJEjC0TAhuyFLYy23n4L4/GJv61hnRNYiO771MMcU+DVSoxs5CItWtima2vRxt
	vJ5puP6p7IT8NAzLulCM1EzHgMjy9hqudusue1Gjophr+alNatrJKHxAApPbKqPMguIV6t1Iafn
	tcNfA9/kjGI5LeW+DmL6EbWffnsJrCFrXxWw==
X-Received: by 2002:a05:693c:42ca:b0:360:cf7c:269a with SMTP id 5a478bee46e88-361a28490eemr15088238eec.24.1792515314283;
        Tue, 20 Oct 2026 09:55:14 -0700 (PDT)
X-Received: by 2002:a05:693c:42ca:b0:360:cf7c:269a with SMTP id 5a478bee46e88-361a28490eemr15087798eec.24.1792515304035;
        Tue, 20 Oct 2026 09:55:04 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3608297f4f7sm43204868eec.23.2026.10.20.09.55.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 09:55:03 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: [PATCH 0/2] Miscellaneous updates to the Qualcomm LLCC driver
Date: Tue, 20 Oct 2026 22:24:49 +0530
Message-Id: <20261020-lower_case_hex-v1-0-bfac89824646@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIANmc12oC/yXMQQqDMBBG4avIrBtIArHWq0iRNP7qlKKSUSuId
 2+0y2/x3k6CyBAqs50iVhYehwRzyyj0fuiguEkmq21utNXqM34R6+AFdY9N5a5ojQ7e3R+OUjR
 FtLxdw+r5tyyvN8J8Xug4fstTCu9yAAAA
X-Change-ID: 20261020-lower_case_hex-658f10ca5795
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: dohIQvHffvKHRHDmevsf91_kCV3d9PY9
X-Authority-Analysis: v=2.4 cv=fb84WEQF c=1 sm=1 tr=0 ts=6ad79cf3 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=0oxzK7zeRQ6n_MDBbuEA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA2NyBTYWx0ZWRfXz2HByAUehWjR
 hh6UAx/Hilf9SuyT8lTaUD7D37/67TboAkqvgl7cV0lAmB3BoVBNOSucJs4n2rwTQ+3w2ssIhjl
 g06kg3KnAZ6IKQyFqaYHhgTtvs2mcoLeTgg3ireD19tgp7G8zuBYhhx2rbBkXipiTU8kX21CL7o
 kogs6b6pIP6Ulc04s+b0/L52YeXwNt0xen4/Z9TO6c5Bo6nLT0hCBMccEJRZ0ViEyUgfkdruet5
 HFQqpHxydxSPiIo2TgcawW/b4PdgtQnjPSF+TWkqShl//yfBVSo9KMTVH+dI3HdBLzqbvc5rGN7
 rPzQMJtRYDvsEW9N/O6taA4Xeq2I/k7NuVf93FV8xfaslWwLm18Q/ho9FSOCaW2hBbi8gvQA0kg
 LvBDnI+1zk3ZOW/j/2vBr7F2hIzPlam33OnfvgeR94BSL/lnNnJOBFZmib1cLLoxZJlurho2moH
 hABSYazcf11xuHa4A4w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA2NyBTYWx0ZWRfXyD8LKR1/YYuj
 1i0rBYh8c9jqszkjX63oACdfVJOtWMjd9SbMWYd5Xzf2SLCOz2PPobcnkA35T0JSBmFApayRFIn
 xzJDzhZyTLyA07qmUJm5mLIMcNg42Mg=
X-Proofpoint-ORIG-GUID: dohIQvHffvKHRHDmevsf91_kCV3d9PY9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 phishscore=0 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200067

- Use lowercase hex values in Glymur and IPQ5424 configurations.
- Fix whitespace and brace placement in the slice configuration arrays.

No functional changes. Compile-tested for ARM64 only.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Kathiravan Thirumoorthy (2):
      soc: qcom: llcc-qcom: Use lowercase hex consistently
      soc: qcom: llcc-qcom: Fix whitespace in slice config arrays

 drivers/soc/qcom/llcc-qcom.c | 69 ++++++++++++++++++++++----------------------
 1 file changed, 35 insertions(+), 34 deletions(-)
---
base-commit: 8f7df005a7564bd7ffa75da9c3085d5b996f1e16
change-id: 20261020-lower_case_hex-658f10ca5795

Best regards,
--  
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

