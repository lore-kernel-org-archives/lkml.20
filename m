Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793031537;
	b=JlJ4Ho9JI4xvlJxs/n4O8oJBN0oGw/sIPc7mkWfM+T3/AzoQoX1FxQN+jeB3lI2aN0xD
	 WG+A31UDS7U/vhkW3sKi6CKq94XUzccQcwvXFZH8nRaO1w8Ka69GPbR2rs9I+5eihZQVP
	 j6qdt0HPXdiabl/v/xc9uG4rEE2qv9s7A9quLXYrwILeYbfNQH83vpW1f8hzgAodXwT15
	 rC19F4GrHCzlcy3S6UA2xv8D+bF86cl0MnIjLB8cNma3Je0X3AvGjjcHSeu8JuSPff5hA
	 wv5/EFKRZ6H49Ws+/GyIwPB2nihlawtQJl5+Iu8gPRMMxT953BAjDBWs8cLIC4Gm7UQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793031537;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=kWKytCBvoLHHoEknZWb/nEOwpJei4el1w1yVW8YR0pk=;
	b=jqmqvF+9EveCBQJ4UVtEDWL0XyHUEm1U/R6bWuvr323pRuCQtDKZV8+AIr7jG9qJLzbD
	 vpUj8QCUTInQlOWEm6zBBLOQb/QkysD+Qen7ZDDdcNdMz3bbsdL5GnZZ+3I02Mkzr20pb
	 flRJoGLk8MJ9iFVlf9UMhWctkYRdpvK0onb1ZxdLrsDP8923Xw6tKgES1XOhYIaKCR0wt
	 iquqyYN/RBV4aCjsCWBMuWgdGY+Xiltycq8hdGcREOdiatEsdOerjk4Jv+UmjPkVZQVd9
	 wCmunDya4BF381hOnY1KEX9ueyrDg81frIiOXopgCqeh6AcntJyclqcdl9EKK06zCOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NYwZ4+Ll;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RZ97anAZ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A318606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 16:18:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A318606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NYwZ4+Ll;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RZ97anAZ
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QEwE1F3075124
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 16:18:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kWKytCBvoLHHoEknZWb/nEOwpJei4el1w1yVW8YR0pk=; b=NYwZ4+Ll9upBJ0J5
	pOM7/5Fc1Rjn+xPMIllxZ+we8haaMYQLij4MLwfxLXy59GyJk/6rxjVIUIt1LypA
	Ez6fljfpBdYzgM8uRyFW1vcBETiqCbbeWNPW/k0wU0/jem0djZbaafGxwVqMJBdq
	3nYLes5a0A2VU/lh+Tab9B57pheNhqz3d6CNU9AIk6Y60FYzO6EB6Z6VogtcSQYR
	rc+seS4IOtBs+hj5//xlOfm8vIWHyPOCkWuTYvhBQ0+y3hfczAvzuDS2i0PFnl2u
	+h2Vd1eb6+gptEy+M/lXfduRX13tbuhLWFh5q8Jy+mQ25QKMxvjdhuOodWMw1BjK
	Fk4YmA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhsjdbafh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 16:18:56 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e82060977so10783285a.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793031535; x=1793636335; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kWKytCBvoLHHoEknZWb/nEOwpJei4el1w1yVW8YR0pk=;
        b=RZ97anAZdNAOD4vMnVr7OlPqIRlyuP6kazwRVo83xQV+vRq0Dpg8QX3THj+DmbBiR5
         bbwE02ZBBQJeGZ450WSDoANTER4e5Wa0tTbuZxPoxAobEGujByVvXPXLNChCcV2MIT7k
         h3FYZwU7hDybNKu9nQadj2/7k7eoYHKRS+EVtYqO+7VJLZs+zaE5prUwremcK1ytTxUJ
         LvTF8WX8TciuZtdgmqxnl8ndV8mwDqC9uDPWEagnDzbowssbSOg4DQ8Bb/q3nVd2g+KI
         PIE87WSZWlgyF6djV/PMjngrGaLXHPRIBJ9f/CW9iHSeRNHE0OBEwbVfLzxWB4hK9nSU
         NuhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793031535; x=1793636335;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kWKytCBvoLHHoEknZWb/nEOwpJei4el1w1yVW8YR0pk=;
        b=STSRxbIzpt7zRNje9TKH0Sfoy9Tui37N19sh+uTf+2+HALbAIr3ztQwgOt1TyFMdW0
         R0jeieNBKYUEEDnHR4ocg/X6S66RxbuhayNaqX4X0it+jYxOfZubH3Z5eI+hgZaW9oiU
         aSy7Om3+pR/2fKvkT706VdLw/Yogx5Vr701Z+iPYp6g1hwrcxZ+fNK4k4mYWJ/jBntOK
         M+/U8Y3/epXha3FDps0oSVoUyuiyU2ryEQlNcdWd7/0Zb+hlFXN+WdO2r6la90I37fHD
         o1HegNcxb7CUt5D5kG+no6SdHZyZBFBGP4hB3qhumrZq9flJvmpgAoHsdy0Rh70QHV+r
         yqow==
X-Forwarded-Encrypted: i=1; AKwUvByZ70DsAwVqd902zORX/KKDfGn54yogyhejJQ//wrds9RNxtmJtazG3soYXoZdbQ7vXCOKwpwtA2kkfID0=@vger.kernel.org
X-Gm-Message-State: AFq9FYK0h4AzpN4xVym4oAl3BWa53BLGureTdYoeb0GFo7oRLzqArhAN
	t6yQKVnPwwPLJdIGt+V4rLv3noVEIbTSY6jCFHkNPNA28+ijgPrfSDUJWgK2EbGNrrYzyhFI+NQ
	otEb4o9LS2oDOxTVjftp6vvaw25lvalfUrxRyVoGnJvA5jh2RZVt2VQOYzfCafP9XC/U=
X-Gm-Gg: AYBFou2iY7Ky49DWIvrFMuT/zb2viIySoQ2B5U7CydLiyfWCtV3K6qwQt8DKRmw7qho
	ISIOoH+zMDSz7JAWT4C44qDyiNgZK1vwaeD247wIPMgKz5P+KHuT+AXTw793hPwG5mkmGTau5Su
	y0OLicAksvVeGFStnAiMW72TYsN4q/uYQEW2VF1OCxnaxYSX7qvX2O+xQVm3mdkOeA/wwaLTChr
	4qZKfjlhLl/PdfNZGUfCg3U5JBdr7dzajeh6mZrdXEkHgxsAzLvDOk9r0H+nHUkfhNN0ahpnBEN
	F5YKpAmMrqXA8SFvq2Zhb6+Q+F9UrWb857sWBmkf0v58ExXKUqtwcaMCgBtGfuGH6Cw5TCbXSoO
	Tpo496CyvvA==
X-Received: by 2002:a05:620a:711b:b0:93f:2e81:2217 with SMTP id af79cd13be357-943f4c06832mr23186285a.36.1793031534942;
        Mon, 26 Oct 2026 09:18:54 -0700 (PDT)
X-Received: by 2002:a05:620a:711b:b0:93f:2e81:2217 with SMTP id af79cd13be357-943f4c06832mr23179085a.36.1793031534265;
        Mon, 26 Oct 2026 09:18:54 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a0bae01sm250822065e9.7.2026.10.26.09.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:18:53 -0700 (PDT)
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
Subject: Re: [PATCH v11 0/2] arm64: dts: qcom: kodiak: EL2 overlay for
 qcm6490-idp / qcs6490-rb3gen2
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260803121042.3313824-1-mukesh.ojha@oss.qualcomm.com>
References: <20260803121042.3313824-1-mukesh.ojha@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 18:18:39 +0200
Message-Id: <179303151905.152909.10565381490663805980.b4-review@b4>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=619;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=ENLVtfgMPoAI/GjkuO+vHA/zRez0A6kOQ3KyAIkQzzs=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBq331rbEbtbZsJsQBWzsA6rWbRBPobaF82jk4dl
 9ZgNjWSPrKJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCat99awAKCRAbX0TJAJUV
 Vi56EADJJkPJRuCpVdBwNP1MLlZgQjbG2/EZT62ZGEWfM03YCyg54A6a41QVCr3mnMvxgjdrhn6
 bPXk6XXAu1WLFgsYli9bs4UhP+s9hR/Z4Fp9kncgEWGcEsyXmxO64jm+7Ie+gsNW0tOukO3B5d0
 Kjhy9cjyEafbsapFb3j4NxJ4Uq9R78WId6Ytr7wvng8TJu25noCgiF9aIkzW6NTqAhLjg6Q3eaG
 G5S/kiExe3koxYoUQw/H4HLjJEvOtG8pUoEVrl7ot5wb3zBQ2FCbJl7k+BolyZpD2r7munLwC8h
 l6FIVUS1za3SuP48VxZJOUwg3VoztqJgcm8QpZmWfLbmg9yU4oa2pgaJp5x+WmvmT7MlpAKyCzl
 djAbsfeIgzIL7SdFZmfC9nfxIr27jVj6WNGb1Kq7fkyZ/KXH8hD39IiivXgCsd8mRgebdQvRd3Z
 DEQ81NA/Sj/4aHLEAxXvpg5frfOJwwXf+ljABkVeLYhVhKwmmjybgApjsnm2mYjlaHaCkodlGOk
 jnuIhIo9yrw5Y5/NyUnuTSmLfoAIiKV/bqoFgfPx8tTNwCKRAGlX+Eer3O6Zh7bcNr6+2lGGDQc
 n9EdTA82Ub6J2kqRyVaK3aMjFxmIe1Wfv9IddgVgmZi9KOxI3mJZa/QLDPFV3MOelGLaKamFR2g
 bu5FdeyrHFonvNg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: VQqjMBtMWt4Bvxck02uDReUqXaWhOEOL
X-Proofpoint-GUID: VQqjMBtMWt4Bvxck02uDReUqXaWhOEOL
X-Authority-Analysis: v=2.4 cv=a4elZkSF c=1 sm=1 tr=0 ts=6adf7d70 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=nS062M93AAGP_pvMJEEA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA2NCBTYWx0ZWRfXybEfJ7q7EOhw
 5M90IUX/QYI6JVzeD38TRnfta5FjMQLpjNXEVljhOr5vD1n/15noyyC06yCxXtYG74UptikWwWY
 yKhqtEo7e5WKgHM4OwlA+cbAtebmAUw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA2NCBTYWx0ZWRfX/RVl4Y4gcyXO
 d8h6KKLHYen8O+p43nkMoZC24a79HBgoTKQH19lplDKQe2ZxKo1wZF4GEI88yHy2JM/8JV2bELS
 r/UgG7yqDUueJBNIOk9y06s5FtEp6XIjSTehXf5xm4roELpvJmkutj7Emgw4Kmec/HS/IuCNcSy
 CQ0X4FFzrRN0DTxY0Su4QIuZej2OCgwVy5pA7WXXaGcnrxvbPxt0vuLHb9YvfS+DdPsmZrK/bWI
 pigk1IRNiKtcxyCqy7GNdvJVHCB3wUHY5LN80g9NirA9zgFAG/Gj7FYoCd7iNiI6Vv5j1KzEjI6
 nYGUPcFzjaYdmTr7hQtDCU6G6y0/Nx8gTTFbgJUi7klYqDiJsJHijNty0eJMbJghpYZo048ph+d
 DDzgY/f88yhzaF+L1HjNIrEUIN/8JnbJGEhoOwlQnPvlNlKdTndCyUOnqQrfXhGZLaC9Gs6groX
 F+EwEwGaLqTb52dQz+Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260064

On Mon, 03 Aug 2026 17:40:40 +0530, Mukesh Ojha <mukesh.ojha@oss.qualcomm.com> wrote:
> arm64: dts: qcom: kodiak: EL2 overlay for qcm6490-idp / qcs6490-rb3gen2
> 
> All existing Kodiak board variants run the Gunyah hypervisor, which
> means Linux can only boot at EL1 on those devices. It is possible to
> boot Linux at EL2 on the qcm6490-idp and qcs6490-rb3gen2 variants;
> this series adds the DT overlay that describes the IOMMU streams and
> other kernel-owned resources needed in that mode.
> 
> [...]

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

-- 
Abel Vesa <abel.vesa@oss.qualcomm.com>
