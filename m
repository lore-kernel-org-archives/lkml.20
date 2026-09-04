Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7186430CDD
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 09:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788515042; cv=none; b=GxpU1zX+UcrNxl8oD5NT8gK/sfJe3fiPFmn12m7qC+wg35UlHVt0O8tjXOCJgQOvvXwcyen+npAHSzCT/Raq9Kykd/+8v21h2NvqmDJCMAC80gEyJsTRD4m0KeRALruiwyrS+OZ8OZ1oMJtT5wSG/yvbQi7WB26MFphLtE+57vU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788515042; c=relaxed/simple;
	bh=BUuamkW7WyQdHUFUJxPa9rQAVkw4TDZf9p4h2DUNuew=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SfKwxo6xZKHAAbMAh+vCj1gAUBnPxskUyPBOKkT1WPb6XMZ0w/iEXv2Lw2VCO4mMn4Qu5qnS/5vphxdgxD7IZk1O2Ai2j2s/7VcEMn0kwwh/8z0LbK6106AcRtrh//UHEiVzbDCGZYrb9mY2QYX3d32TX6qRvG6LW8iChaIy8Zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l4cyti5f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bu0Ht/Sz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l4cyti5f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bu0Ht/Sz"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6847n4YZ2976861
	for <linux-kernel@vger.kernel.org>; Fri, 4 Sep 2026 09:44:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WzIVwuHMN3wiT2r3c2yLfkg7g7saW/QnkVAUDv1whIM=; b=l4cyti5f5jb4QTjx
	0ZyI9QA+6Soc0sC7+UGIua1F0I8Dz0aWgQcCuerJY5yP0tpCypODgTkuoVAj9yW0
	2FNQOkF3BnJJCc3VJtESD9myqnCloZE+draM0s/qhjwleykDUQltrngnCCTtAJsC
	MpHrBIBedKFlks47F3qBtkLMsrN137RBWtN9ZVy7Vz5Guj+XNbACdMD++cJkAaRe
	FBR7kQtD9/fjQK4hztk25nx/vUzhZl100Y1Ozb+oV3rQrSVf92YtRUg91oYgjJSc
	xZBsqr9o1o8+CHzV9HtnnzGb+BJ5S3JR2awIJjWkYNXwW/DG234f/Jhcvg/L/jTf
	fCfXNw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfdyxjy0t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 09:44:00 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52ea38b1e7eso2071431cf.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 02:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788515040; x=1789119840; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WzIVwuHMN3wiT2r3c2yLfkg7g7saW/QnkVAUDv1whIM=;
        b=Bu0Ht/SzOg35cyLxtXL9OnhpeL0GBPLgZSHCjdYLbuREB144ChD2pswTyl6kL3zT/S
         RqauVqo7lIAxV1t2hVbnA1qZahKyK7I9fHOnLPaEDvFR1bf8PgHsKI/hRVygjG8nk0vm
         8KUQEYleyiJdYKYEwLQqctYj+k/bWPm+ZvYeEePReaUqMJa42sw9wSw6sRD22Vi21/Vm
         Rr7008hVAxpteIEOBf/6aJarElhCClzsI1v7XTn1X1dpr6UZolwBiMM1tnZ/txbhI0uF
         LlGKKqov+Hu3mz3OoDhF/gOqPxSdQkNtR40ne4SkbHYZZRtBkH40hwqxCp4+McouWHFX
         4f4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788515040; x=1789119840;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WzIVwuHMN3wiT2r3c2yLfkg7g7saW/QnkVAUDv1whIM=;
        b=Y37iQ28K8ovze70NmlLD5m/6hasbVm9sSF45iIGaP5hFPuoHkodtfQqUGhVWIvi8/W
         8U2UpU6UhS5xwzKf8zZxZbQJyd4CVcgbZBJcHXcXy/lPEY2d6+lxB4YTQGy3cnMMgSm/
         6/UFnhHUEP7euLzgUCwfdJK+Qh9K48KTd+NYm1zSLD3JInXsJGGMBjJBF9AFfCU2/6RD
         AYwWbb7LDWL+j9d+R0yzcTcRYsFXarreAea2O+LrUtQqEE5k4izfo3aJn6oILKEwiqEU
         V2G4RXf3XadsQDfn7v5dHKoZw5kk6XFnSJVvVKU6z0tpQkfLpUlxqiqHMCxCWIHQem7c
         De0A==
X-Forwarded-Encrypted: i=1; AKwUvByxqKASP40GDAfwwzl07dZyfyQX13dHyiVkAwB1TBke331o/DadhmQb6iP1VGapjL3BFBfUScup6aNlPE8=@vger.kernel.org
X-Gm-Message-State: AFuF++lR+JcdXyUkSYNEokRe0vCyW7zwij4tccxAzxUgObKADcoj8W1n
	6Zep8ujQ7Eppru7FOkAKNcM1GRr6JNUOU8SB4/NBmOG2u+1qlcR67H8fgRFuHwTeI56y06h9tI5
	fagn/Bf0xWL8HezHks6p7GjejGyQaGq6zQCa+16FhbaXpy/YeUOfMlkxqd1j9P7+oeFo=
X-Gm-Gg: AYBFou3hO2Dv/p1zewkmn2XtFXUoJeCdRZK1WB7+2MJmF5BAdmHyIH6TLvEagchKZm8
	oNpQw4h2ekq7Y+EeOUUWfEMhQuKFJnppInRJiWnFh16eK8/gkKccuzCOrP3l0H7lPy6G0zMG1Gt
	074gVnaG53oqEPN9R25ZP0LcQBj5zV2xgTXMqZGNsS/gymVRCpjP+Vv3KgzDbKqA8XF/ejJAW+b
	71ATWePAV0WCp/T2HonfglhYBTj0JwIR3KoFPPjUonce5M3s/UToc6AAdNMUitKugMpiVXWBllN
	CltOUn2+H1Pm+ArVeqPXnHA36cexWaPvMZc412dZSS51ITn79/mquisDBp4sJId46EZnT1ogBkX
	hP4qOVyHe2JYokYfuoyDx4UX2qm7zBRdhxA==
X-Received: by 2002:a05:620a:4709:b0:934:95d9:85fe with SMTP id af79cd13be357-939806ecf7fmr302197285a.3.1788515034889;
        Fri, 04 Sep 2026 02:43:54 -0700 (PDT)
X-Received: by 2002:a05:620a:4709:b0:934:95d9:85fe with SMTP id af79cd13be357-939806ecf7fmr302183785a.3.1788515029655;
        Fri, 04 Sep 2026 02:43:49 -0700 (PDT)
Received: from [192.168.0.242] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cfbdacc45sm30554755e9.11.2026.09.04.02.43.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 02:43:48 -0700 (PDT)
Message-ID: <45e238e2-4c02-43c2-8050-cba0862f6be0@oss.qualcomm.com>
Date: Fri, 4 Sep 2026 11:43:46 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] pinctrl: qcom: Add MSM8952 tlmm pinctrl driver
To: Muzaffer Kadir <muzafferkadir@mainlining.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-gpio@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260820-msm8952-pinctrl-v2-0-bf2b8b7b379b@mainlining.org>
 <20260820-msm8952-pinctrl-v2-2-bf2b8b7b379b@mainlining.org>
 <7eea6a82-6bcf-486d-9c0e-5a68c34c03de@oss.qualcomm.com>
 <1c059e1a-f791-4de9-87c2-cb13405b69bb@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <1c059e1a-f791-4de9-87c2-cb13405b69bb@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: VP4-FUY1P06x-uDRxja7B7APtl8dK7ZS
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDA4OCBTYWx0ZWRfXzrBfmT10OEr9
 zyY6Q+mkl5hcaBFg2+6AXP142FYPAZXb869yzG0bDhqdgWRi6CycaKIGGUot7hTXcd7gBcK3cP9
 fTfz3r2tlpSkPQih2EWIWCTQZWrYv0o=
X-Proofpoint-GUID: VP4-FUY1P06x-uDRxja7B7APtl8dK7ZS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDA4OCBTYWx0ZWRfX0zdvFEYevg+6
 zuHp0E6joatvjXplFVuhGIR1BACIs0jElmEUdX38BymVRZFo6mGNTLp+MdkbaN8Cf8qsmxfLXqP
 KnTrpRbZu178rJhQCBi4VoRL7wN2KQuvbqNvsfBOyyDYW36lm/nCoyNOAiM2KgAJdmEQRdj5jt2
 9o6/YD6z7T0YOllAvBXzotrtv84YvQIj5GTVpUId0Saq3PjTgB3Lwfhzhi5EUHTGoeQxGnaqC42
 pCjOmaG/78Dr/mimSOLjpZVSe9LUzjFGeogYrFImUfHlqZW1kD1VG7P3wKAWAsb507yS/r6a1kF
 r3Xmg7IRS6nKZxvWKnEmCJnMmBXW1nHuKgJzBPuKhCCFUz6xiMgOpR5N0Wg6PhiUvEKaKMbcSos
 a6hDAyQlWhlM+IlG+mkxDM3CpzWPkTz2ThyoQV5773noWIbrd2PPlqm4Cwem6E7tBb89S99UTJD
 BQ+dIXGQCGSHMuJJ5rA==
X-Authority-Analysis: v=2.4 cv=X9Zi7mTe c=1 sm=1 tr=0 ts=6a9a92e0 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=uepqBgb_qm6DIlqMricA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040088



On 02-Sep-26 18:11, Muzaffer Kadir wrote:
> Hi Konrad,

[...]

>>   must have a matching mipi_dsi0 entry in the GPIO0 PINGROUP() definition. The same consistency is required for every item in the table. The gpio function is intentionally excluded because it is inserted
>>   implicitly by the PINGROUP() macro.
> 
> Sibling SoCs like msm8917, msm8953 and
> msm8976 do leave them without any PINGROUP() too.
> I don't know what function index they map to
> and I don't want to cause bugs by wrong indexes.
> I don't know what to do with them.
> Should I remove them?

Apparently, for 8952, someone took their creative liberty
to rename function 0 (GPIO) into what looks like the
assignments on some internal devboard. All of these are
just GPIO functions (i.e. drop the other definitions,
they're totally bogus) except for:

  Function                GPIO group    Mux index
  ━━━━━━━━━━━━━━━━━━━━━━  ━━━━━━━━━━━━  ━━━━━━━━━━━
   qdss_cti_trig_out_b0         GPIO2           12
  ──────────────────────  ────────────  ───────────
   qdss_cti_trig_out_a1         GPIO3           11

Thanks for spotting this

Konrad
