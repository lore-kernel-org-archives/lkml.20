Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794487077;
	b=eFjfRB3bCrTPTjQLDYqmxu541+5n+PR9udJQoIqaSPofFkZ4XTTi65cYKOsYVytx3jX1
	 PTb/lcXnr5RsHAoUHXvsR07UPpld8tu3cTDTBDEsrPQiQBOLFxZMzyblJ9IBdO62BTEPH
	 nPZK0KZ9ZexMd2GgygEkwyfmulfWXbi7A2fq4aYf9Aa9PbmmDqS8yQ+1g36i3t44gYHhF
	 DMJKgxdAYig0/1HS4RzBZuWVsDFWExbSqkAxTF6Ij37ekDWWpkzNkdOTC5Z4F4g4TAjFR
	 bQVD/yASd6HwROV8RFObMd4UwDFwRlFcAhWhF0cX4r6YJGQlTl156sfqNxXh7Cob4iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794487077;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=klQOpf+HavRxRFNlSNefqEWhR0JJ4OucrEz4ZjfbFU8=;
	b=RJ4muR4K6M1U9tbNvqU+g3I3gJwGZ1O4t3mqZgYpzJg3cBegBZr9pVxlmYezxImqLeWe
	 arQ4h5KstNtNbFl6rAFq/ygmQ/9iucPT1v9EKQu7oOwJOlGTwqUOQFU078U0un3t+c64u
	 bUqh3aQEVIjyxM0Hl7CGqMO2MPbe0/wsWQh/3nFYMAod107xPwd6ZHazfUSvi7Sj4AnPG
	 jKb//W6bpnBVVa2SjtGhfiDV2pa2fFOFWYxvyX6XW/ekRT11ye96Ak1tfTFiWo8GapgzA
	 JDvnlghvVMre1tN/YlBlKJBwYYm901ObS0jWUoxOq2QESd/L+iOtBp8dWgyZvTgpLAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZPpIsLyF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EshcJ5Lx;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14830606A332
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 12:37:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14830606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZPpIsLyF;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EshcJ5Lx
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC7otli2820038
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 12:37:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=klQOpf+HavR
	xRFNlSNefqEWhR0JJ4OucrEz4ZjfbFU8=; b=ZPpIsLyFlzvsrJvB0C/y4EP13Vv
	jgneVLSaabLJyzCH6rNkJlgm9eGncJsFY/RtZPkhNuEQWua/wJgwpZpfiTVLJ7x5
	9pjcIixWQbc4MMQ+wZG8xuYgp6L8V66mAynaToTuGARCLDgK7xQGGykq121oxzpj
	eDapA4FOLK3XpAQKU9FGw6Bebwdg4k0ei+MrnneuzAMeZKExWgaST6rt75xW9cW3
	0C90NbS//4FVlF9/1d7Q8IX1z8dO/RqVmZZQ+ARkeYcx9ywGKvzBZX9ApN/nn3lg
	WIYIzrUaqDXsx4Wxn78PRy2+TK4LiGMF9W0ZVNshJ8LhlhcOvjuKbCIw3bA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw9e190ry-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 12:37:56 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-943e8ff02d0so477031485a.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:37:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794487075; x=1795091875; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=klQOpf+HavRxRFNlSNefqEWhR0JJ4OucrEz4ZjfbFU8=;
        b=EshcJ5LxyFizzXWgeXmVqSGNlO1yogXHmur2ZJtqg+0v0mK43qYlPSDs/xN8CKisqI
         628fwRrXPo4IqdrVtkvThDf1tg0joDG7F7FhUiCX3p0NgjmT5AzGIVHKYUVrzrO1LxTA
         3ZJD2xUsNhEt1XyTmZ8r3QAKdx7GAsu/Yuipkqlmxyl6+BstYGlTqTIhmcYk2eMsHFze
         //JLHzZSLFAhlVAdd0Oq1O/Ny0h/FKf+idnBkQycXisbG6NSPyQpLXYEMpXSNOmiqpfl
         HYqEBgVwqv/DcGt9MYzZm7iZEmgTu80+ath5+9du6A/+wFyUoTGAS22nm48g/cmXqez5
         AOHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794487075; x=1795091875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=klQOpf+HavRxRFNlSNefqEWhR0JJ4OucrEz4ZjfbFU8=;
        b=I81j5+FDyHDFGQG6hthFid4pR19Z6eOVbLW6ZunLvHnwLCu7RNVDmiH+MCIn79Bivs
         5vlFweX58FkX+KaDTr3kbYilgVKYAfMIjI0ykGdqYvg+d3a5jrxJ2pGHeN0+2cADOcMX
         ytOvJvuSAsvyr9o4YiRdQsdwNF7XAwvZUKnCkO3eDhszzfEzmr0mXHQJIVuz3UMo8JkN
         6KhxJqTCa9cU6/HYiCnQ963IFUyKi15I6c2Tnk7qgEIYHd1ay7TQ2diVSU/KmLgNvfdu
         FFp4mMSYctdDZhQqHHZGrNdU+20EzcanU/qh0h9VW2opbESWZwLBW/lY4GHytic7kv3h
         pOGg==
X-Forwarded-Encrypted: i=1; AL+hErHB0Cye8NL1Omyd8jfIEoEW0ki9RL61bCSj1nFqnaM/boPJ0R4BjAdpck0QzbCWxzypUFot1t0ZAExr1yA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9yusrOvXURb1hgBFuvVvwTuGVHH2JeqvfUfnyWBh37dXi/4mZ9
	DSpIkimc47+fctHI6faxEbY0pW+oRzpcbEdYte+lbsO1pWMLirPt08msB9x1ecGs0M4IDbIh+F4
	E7/i+m0ObbJfREcPfThXpJVD3ahbsU+Oyw+AHBWrGi9/NAQLCW4xf0cMXYtzv+0DOsCk=
X-Gm-Gg: AYBFou3wB4Y3RoPXExmHQJEcVxQf7FitmVmdB0dTdTChD2tHvOgzMHcxn+P6rN6SDLc
	KFqG2ev4uaWz1YugRT611xzOq7HiWRttwJ/SoMMnYr9Fr9xUzDQHsmKA9W/bLG9Yza7wkU4MP3s
	2nLLh38R3mgJUHn6a5hJSKPcdcK7F8MYXP1xPcFIOaIvkOmAUOWbhBRcmxwcXqzscdS0c1uNxm+
	KaKKzi9nR2rRc02cyavwlyRVXhlVYOIeaPl3XOc3HCfXzGZpJXuykcNA9NYYYsEHuFawZhUgZ4C
	vmfb6yLZhfU4OjHLO+JivEHH5Z3VWfkqyn0DWp6vpSvmts+vy21AaBVfXFcPXAYmYZ6989JG021
	7NtQKZOZ7Zm+eR248+1zbgq4hIfNjVtQIOI0e/QsKYfgPa47iMXIkr3rX5bJyDnIEnpB1GwyKqw
	==
X-Received: by 2002:a05:620a:2b8e:b0:93a:2221:5460 with SMTP id af79cd13be357-947affc0f5emr875241685a.40.1794487075267;
        Thu, 12 Nov 2026 04:37:55 -0800 (PST)
X-Received: by 2002:a05:620a:2b8e:b0:93a:2221:5460 with SMTP id af79cd13be357-947affc0f5emr875237285a.40.1794487074769;
        Thu, 12 Nov 2026 04:37:54 -0800 (PST)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a59437fsm331534766b.38.2026.11.12.04.37.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 04:37:53 -0800 (PST)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-media@vger.kernel.org, bod@kernel.org, mchehab@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, loic.poulain@linaro.org,
        dmitry.baryshkov@oss.qualcomm.com,
        gjorgji.rosikopulos@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        atanas.filipov@oss.qualcomm.com
Subject: Re: [PATCH v8 1/8] dt-bindings: media: qcom: Add JPEG encoder binding
Date: Thu, 12 Nov 2026 14:37:52 +0200
Message-Id: <20261112123752.711726-1-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261112-benevolent-discreet-warthog-1dbf04@quoll>
References: <20261110163909.78085-1-atanas.filipov@oss.qualcomm.com> <20261110163909.78085-2-atanas.filipov@oss.qualcomm.com> <20261112-benevolent-discreet-warthog-1dbf04@quoll>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA1MCBTYWx0ZWRfX/eMYKTEFsN7Q
 ViaLrBqXWwIWa0SxQZ7lIXp8crr8GRA+2w6CtI/DfWCkG43T52OrtGsP4mznXJRr3FNeu7Lv7I/
 d0/W/Vtq/gcYgtrA88eGNEmYUbsmIaXyEkG/yzY9RXDz6CLZJqdWe+lQYO/zfdijJqZTud9MaAM
 gNJkNwz81Mrg6WooHcbJOMm0csHvCRuXNJc4u9npcq0lJXiXmtlv0uMObi6SKhxVB1PtOqtakM/
 TK5nfltx3fwCFaTXLc0MaApFPrvZR7Dr21sXgasaiVCHU5kGWo3dk0ZTloIlN3EDgnWjUwzvUQq
 Gnlv0NBwWLcrId6wzJ5xQGlCaJrHB9FEySueIg4C9EAn5BFzYQHtg+kxAUQJxcwV7SMhawiRH5U
 pgB6vsRjTToCjVaNm3yC2dPz7Wr5nwXI/hPIcIHdIVg1zr+DdKvTq218oMU926Pee1R1PrUsjM4
 BxngobiZxVkNIerMUng==
X-Proofpoint-GUID: mNjH_YVlLhKGJHt_K6vyiUJZBCwaA5uq
X-Proofpoint-ORIG-GUID: mNjH_YVlLhKGJHt_K6vyiUJZBCwaA5uq
X-Authority-Analysis: v=2.4 cv=F6fC5ahN c=1 sm=1 tr=0 ts=6af5b324 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=bWJBzm-gYxnYfWmHbWgA:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA1MCBTYWx0ZWRfX7BNCqXBjyZ65
 J48UOR7lV6WU4pAJNoER2NiyOdi/Jx7+3DU+cwHuSJQvNuePDa8wLw/wk4/fAPcY6gaMffw363i
 46KmR1hKS6NRTPEDl3MpuW3VAtfZr80=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120050

On Thu, Nov 12, 2026 at 11:02:13AM +0100, Krzysztof Kozlowski wrote:
> > +    then:
> > +      properties:
> > +        power-domains:
> > +          items:
> > +            - description: Titan top GDSC
> > +            - description: MX power domain
> > +            - description: MMCX power domain
>
> CX and MMCX are the same inputs, right? Then make MMCX second, unify the
> list at the top-level with minItems and here you only narrow
> min/maxItems.

Ok. In the next version there is one list at the top level: titan_top,
mx, cx, with minItems: 2. The per-SoC blocks only set minItems or
maxItems.

--
Best regards,
Atanas
