Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793103540;
	b=U/DOHQ/9jegctY4Bt39emXWnBQqrkh1RdPpeYiKBNolJNeL+X7iSwnRY2Zkjmuz4uceX
	 Gn1KPcWUxBr6ax8PwNc13XhyGtbKFryVKjGmY/B7op3Xd37S61m2DSOi1mBTQCECKHhpQ
	 k5IkCzVhwdZCJEQQk+vTF6OTt/N8JqYfg4NISzEvLlsqUSImJnO9CwC5lB0FDvqzLHYP1
	 By0EgakC1hVsuB9o1SCiKDSEzp+UniiqOJjf/r0ECiPVqaVE3nuzvyH+7/aw9m5jkK4Y9
	 1DbW4ocyUMEiSJwrAHGiU0jCDDntrSIrPNDmolvSTgiA55qvhsi+otu69NyTDSZb0RA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793103540;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=AymIl8NUuoD3cq2I5G4+I79LeWGYDbcm+efxd2TumK0=;
	b=ezQEDl9r+fgV+9FYjzFAmmC1K43bq/8tL5BQwuSRlLdWDS6oKjsUn7+B0ldVfci+/hHR
	 /0+/dspvDlY8IQ5sfAeVjPXbGegqeN+U5Vh7Qm2rQUr1wnNjrAVYhlVjJUVxAKFFXWv3V
	 oZCKKtNpSjtjVQ9nFY9TNnH0BMavUWfEdnyCix7Tq/QY2AYfiz0qCpyDYlNg9gg2xXnKW
	 ZamCD/yTwikppJjBpwbZbzZnjYy7gSpokxjGbWGGdIGMkJYaOYRSllzcTEs4tXc8tD8gZ
	 UxtT6cKCGRCSoqWCFw3kSgaIRmACovpUlJ4oorumQPzL/pOhrKJFrzxXRhYzpXGzD5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=klPNqPRa;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Rjj0NyRa;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09056606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:18:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09056606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=klPNqPRa;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Rjj0NyRa
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAdva81061065
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:18:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AymIl8NUuoD3cq2I5G4+I79LeWGYDbcm+efxd2TumK0=; b=klPNqPRau43upOnZ
	y7bJXyAMwY7ch4OGO4a48+81jW5FEw58DssTX6W9jKoGfyg+K8EOUkleDbcnxHlq
	CKQZ631zE5+yNf6HtwYYEAQWz9aki9Fe5fqYgkEB5Q/e2TfrsMTIFZcgLrvX2zp+
	BAjzOwE90vqGNcMgcc4yHU1UoRfiw7QfONOWMJ0Zxv/9h3kzNXX68tWcvarNW+dY
	QnnTWds0RyKrFPvBIBXNXnJh2WXZxZQgQuIVOGu2DKeEImzWYn3MlDnluK68MFo3
	OuNzZFwigGwukjuRqFQUcV+UAPxHyD0MF5iqYQzs53YYe7OpGJtRZyPVI0SldrXi
	UTEh7Q==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjp2t9eye-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:18:59 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5eb86091358so56083e0c.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 05:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793103538; x=1793708338; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AymIl8NUuoD3cq2I5G4+I79LeWGYDbcm+efxd2TumK0=;
        b=Rjj0NyRajzzGJhxWJDhWDbXOM6niDOyof6cKKfMnqE8eoIwCX5vxC9dP+GR/6bA2T5
         QJoe2DC/CE3rcbz10jfttLglKstp7lkB1nP0R/z+NrJdxSEWdmYDWDSg+iQ/DgHC+Wq1
         a6AL24+qlmBUR7bOOH15KLCH2w2ccbwjlTGekBb5Z6nygc8fScn5LBGoWhbbOCE0LwuC
         iOFhdBVaNKHTz028XPayv7mWW7bA6evnXUWR8b+rp9GpUpjlzJxqM1j48PezniSdDjAP
         R+qwjxf1K/tUGo6MFSTddmzqPLAA5I+XWQkttHujqaRaFpTCwlAYZx/Ge/x5LPPGBXrg
         BVbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793103538; x=1793708338;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AymIl8NUuoD3cq2I5G4+I79LeWGYDbcm+efxd2TumK0=;
        b=avZbKLnwAPHA4PeEdiCHvO5UT6xt+LqxpZfOjWt8sbTh7+G3qcwcqTFCX9x7oez1Bd
         oI6VLkppVnhEqKtFBBhdr/wud53bLuH7qNz1siKLFGO+yeIh9M/D1Mo6bFOjKbRr1L7x
         KSapHgWBRNyVE6UtYhVwntVcqPit0ycSFuJqwCKIDpQug2nYpthamOr1U/zJe9sHMDtZ
         jQEZ+GqSyBXe4XAumFRS5ch4HHWYlIxcMhfj0X79od4hr0fGebkQ9mM2dG1Q398CCGOJ
         ak/sJxDt6TcY9uTifv5CwNOyYEsXGUtJPUSJH9kgQk2CeZiN4XlJ5VdaQVCbacES2Krp
         pIsQ==
X-Forwarded-Encrypted: i=1; AKwUvBwXXytA6U3dlgLZI2xGmyCrXWA1VZfYhg2l2ZnTrcItYezg4LHVz+iduGr5w9FT0I7m6bH1HTBLStPexX8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLOLclrn92VwUhRaaMrlx87apIHZ9CXskvw4NVrU0CBB9rE7v70
	SXCkeyV+Ste8UJSWaaEBZgphbgD/w2qYNDTbSBCW50qLXk7vaKXDwEz6UgZPuvbfaTgxQv4pvVX
	7sbNC7xB/ew3MTqWhkZ6walfavc/s378UXRLfePBY9WG1G+hTwUdkf0s4+DCGzQQazP4=
X-Gm-Gg: AYBFou3CrFMcOa8G0tfF++FELRfVp5h/ZK1x44davW3KWXL8P7/PfR8l16SZz637ilI
	rE9S6sDz8NkvQfIcUUTJMLXe/GDZLVvZ6cGV6hixUsyjM+DZ8qswn6zpys37H6LLBDap6W8IgS6
	OkPFjSkthDztJA5EbynO15GoleCJVwVYTkoNtZbyEUx5aqGMI4TXHev81FV6ecTuK5HuFeoRg1V
	cL8knTefSm+8Kkce6d5vI7kpruHEykshgMSt9TQx/Mz5FVqy1CQHCBmdqsxQbHXDZUtM6lntcBL
	j7mN6XjzBkNMLBN63vlDkvVMSScC5G0ihtbVWGMiUgQYiuXOMtnXOgDitMrTXqEwiVaBY72InoV
	UW6E/+L/ZsvaDpQ4jFWKp0w==
X-Received: by 2002:ac5:c010:0:10b0:5ea:c3bc:c584 with SMTP id 71dfb90a1353d-5ec230a43ffmr3512994e0c.1.1793103538126;
        Tue, 27 Oct 2026 05:18:58 -0700 (PDT)
X-Received: by 2002:ac5:c010:0:10b0:5ea:c3bc:c584 with SMTP id 71dfb90a1353d-5ec230a43ffmr3512972e0c.1.1793103537572;
        Tue, 27 Oct 2026 05:18:57 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd0f6f1asm447056466b.0.2026.10.27.05.18.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 05:18:55 -0700 (PDT)
Message-ID: <11d89d40-9a2d-4e5c-bb0f-3cee5a4b0393@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 13:18:53 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] soc: qcom: smem: add IN_PARTITION_RANGE helper
To: Albert Esteve <aesteve@redhat.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sarannya S <sarannya.s@oss.qualcomm.com>,
        Pranav Mahesh Phansalkar <pranav.phansalkar@oss.qualcomm.com>,
        Sudeepgoud Patil <sudeep.patil@oss.qualcomm.com>
References: <20261022-port-smem-v4-0-b0baf39c6e01@redhat.com>
 <20261022-port-smem-v4-1-b0baf39c6e01@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261022-port-smem-v4-1-b0baf39c6e01@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AJjzCM5L c=1 sm=1 tr=0 ts=6ae096b3 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=20KFwNOVAAAA:8 a=jyy8ADtZjKfwQqIx334A:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-GUID: oRT87SMt49j4HzyUFaeh_Pk-a5iboqwS
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0OCBTYWx0ZWRfXx97rgr2TyuN6
 zTHfHEm9t36pd7qBB4jYpae4H2BTOT6DhfSa6HcSbfgdehHNEnhllREujP/EKMsspshAWy0p0qb
 8Rwbozd/LckvIA4oyAL+XFjPnw2bMWI=
X-Proofpoint-ORIG-GUID: oRT87SMt49j4HzyUFaeh_Pk-a5iboqwS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0OCBTYWx0ZWRfX5CCnFAwKoDhB
 4tZa6F4Y56KZRm2wNF/iO79M+3PEbPW5+ZmXfOE9HSZlb5z8b91bK0MBE55lEOQdeCjffxRxL5X
 pTWaQdlskjc+LuOoCRZr1M6CacTy5GU8rFshPGwuQIL9eO4l5VPSdZA7+9kiGj/OKiWAtDOp0/J
 DWzl+NwMV9009uajxfa8a2Sb2A6KMGeA/DQwYtKXx4pG9pfGT73RT9uARze/jFCfkP0zGzRojmi
 xH3R/jT9ID2gMQv0pNHQzoXcCw4HbKMLU+QOnZGJGm6uPbOckN/17wgtnzzppeIV0/HNBhROAFu
 ji0sNMsN0qeOjg1hpp5gdeFrQz3+ofNVtUlIqUHGMoKi3H1lSCK7iylU5JfNh1ao/8cxHrRIcMZ
 VM1U5k3BxCMxRuMafy44/fY5XJ33Yu4m1jBG5ZG0AOY1XmbB7QyeG0hdxnNheMGdPkZgUrmsZyd
 ruaWJmDDGzZ24xfBajw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 malwarescore=0 spamscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270048

On 10/22/26 11:47 AM, Albert Esteve wrote:
> From: Sarannya S <sarannya.s@oss.qualcomm.com>
> 
> Add IN_PARTITION_RANGE() to test that a pointer lies in [start, end]
> and that pointer + size does not wrap.
> 
> Signed-off-by: Sarannya S <sarannya.s@oss.qualcomm.com>
> Signed-off-by: Pranav Mahesh Phansalkar <pranav.phansalkar@oss.qualcomm.com>
> Signed-off-by: Sudeepgoud Patil <sudeep.patil@oss.qualcomm.com>
> Signed-off-by: Albert Esteve <aesteve@redhat.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
