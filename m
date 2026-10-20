Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792499458;
	b=TDUD0Hsq6dxcoZCCjrpx5JA5fV0sCcN9DmYB4//pRQFHpclqf4/xDN49F6VGnBU70BfR
	 WmgoYpgKAelMrW5Ytg6TsMNHcZAb0IH4PolmtmFLvyDMGwZ1P2m+Q0ob/C54juZ4QXtYm
	 h8Ryp9I3QTQdO6ob8nYGqgBkQifRE3sLKQqL6LUtjmIJuQMCzPRSR0gNzYGFazBdtsmDR
	 ggxuf9H33ZrDbPo2sj6Qzne+cTcdP/wafK6Nwj6JeAOW/UKGA+cBCcY4L2tTsxltztL+h
	 NvNbkzOGbFg5XI0yK7xEhfdxAx70zyr41d0DE71MqDCfCWrsXAHW53DF4WgxAkEdSJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792499458;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=zcO4EZHYcvxPDEYxtrbQd73V1Ga4xxNs4GqACyVzAD4=;
	b=D7Vsffz4YsiDXS1ao4BzStKpuOLDjqjzU8vh5yqSAEixZEMVQGMhTXnH0Av3E17vtQsY
	 NpkysS71QTH4ktRXJ6CL0kQHudcJAughkYoJRwXQ/DJyCfGXNmsKuyL88HqXnL1ckT+7e
	 Ag5EgQ1UE61F2syAOdWKR12lrkxL0Gyo9g8hzGXa7KKt6pioZwn5LTIxPRu6JI4y8b5SL
	 K3+uGZ8DBmEM0414iTDbYDu+ysW5z9zmrIk5Hr+Zcdxr/SRcVj/516X0stkn10l+OX/lE
	 Xs3DvNEwxmBlZD/MBhUjSK+HORrD5lRvFw7eq/1H2z1jQM/hT4ZIn8S4Bsl+FbuHZwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZXmdSi5n;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="FR2R//4q";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD769606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:30:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD769606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZXmdSi5n;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FR2R//4q
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KAx924419896
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:30:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zcO4EZHYcvxPDEYxtrbQd73V1Ga4xxNs4GqACyVzAD4=; b=ZXmdSi5n/DG88tJx
	UPnGgvl3IgKNtWd/ecIZr8qlbTT5aAVPWz4yHGN6r7Bivaw0lYGZ/eBZ9BuAwt3z
	blHDmwcKpnq3o3u1J+CqFWYsEgB431fRyZJA9ynjTZXIb2bMwhycJZc3Vba1270x
	mDnJHZOBUepZPchh24itBwpmuAbzeR9ObwL6VsLM0zi3bivKAd9Yx0tnkDGcVkMn
	l3Wg+n+HjGpeaJgs6HK+lptO4Xq5ZORGxulLbKbHhaXxaY1fdNK6crCNAX1Dz7QN
	/LSFDOrBf6Ce3npWqnfZ9J0KMf3peOniv07fCShYyJI8nY58HGCL0kBv5Ju2QzsS
	zyQMgw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5stdkx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:30:56 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92eebb130dcso71761785a.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 05:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792499456; x=1793104256; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zcO4EZHYcvxPDEYxtrbQd73V1Ga4xxNs4GqACyVzAD4=;
        b=FR2R//4q9gB2RcUe9SyaJOUNRcMYCPU1VuP3HxcZylZ7hZy95Z82FsTQf123Je5FKf
         a9c4VMB6yu50WPRuSUnZFrwZC0d6s/wBwtJtDyokG6M4z557ANSaYqwDa0qnN+0Bq9oy
         42kMJU9vEh4oO9wtU1UuRI2JeVJCRDGsrMfTOJTlc3vK+vBhe9KDaQmolteCtRRut9We
         972zARMAr2OgMBS0fkHos8tCyMdWWx8Wm+V8OG3feaGSQPaIuvmku7BT9Bv3ibkyfGub
         NigSC0VwyRPjG2/bq+s16VqK0xYdllKxrEXFNup6o+Iw5AEezFX+9X423CfrNPUwpU4n
         VVBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792499456; x=1793104256;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zcO4EZHYcvxPDEYxtrbQd73V1Ga4xxNs4GqACyVzAD4=;
        b=sro57IHJryiUFZPdQmqlPN8RGOy4RJXvRFQpMsUw9zBgKz2Dhp3OiTABgISueA2cvl
         QolkMzbRINd+miDSVB4twYkZ/JIBuvgvvV4Srh0JbS/0qSUzYGqcD8Y8G+IP/yoVWXb/
         nPipBktRGZUaCNi9VXFz0G0noSAvztkSbhBJ1ilQBWgb0EDzTn/PPRyYwy5wsL45P9sb
         ksLkJvnQTivO6y4yYxEMJbz2lf4jzx4Rz5VjU30yALQYU3r+ad9kwqG8HWveu5cVGdf2
         82JDerzRE/XSiidIerAJsuYPKR2UyP5uAn0QN24kgRr/HfX2SQwCKLqSG/SRlZ+6GJng
         iMkA==
X-Forwarded-Encrypted: i=1; AKwUvBxzB/P8sf56pYhEJNYxro0N8umquqnCjJ8XENxBwhXHT8yyxjSLJEK4j9FO/UePJiQAHe679hGEkUUyhOM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ0DGQKRTqmKQrhvpEApMcgsEmL58axRFWnJmHLCT4h+Y4QuRxo
	LJBlO2oVx0ZhylnCJpRS90yf8ryGKI+TQzWG9mPdXnXREljr9QLca/6mz85uELdfC/tyzFrfhh7
	fiGdb4IwNIdIuftHgl19vaJ+rsILFNdC5gawnfEkwrDH8QuLuxEOb9pTW5VZH5odvyvO9fJkSoO
	c=
X-Gm-Gg: AYBFou3T/9w3w0hxb6kmF/+HD+9SFO9cM8i1XvVlwKDvjl5OM5+kwdp/QL5cKkKnQC4
	G5f/c702eRH7C2GqiHAESA3PBRFOIu8QvHFMLyVhaBUpWD0BjThRsj2g+Xl+c9WB+PXKwOV8YlI
	lHP8iiIYNKA/bjCjg5W4wzm1/4sSVCCgeWyL5NNEKDU/i5Ez2X4LPpcsMJQRGyOgfvO5TcRd1f7
	N/Jdru0r4qZcfcd8nVT6K0mOuBC6IDonJOw+qGdDso9GqSE30LY75/hWvkJb/O95dx9gfAjKqzb
	lxegbsNTkB9UeY4weeHJFgwfWwzymvemgXLQagcexVKyG4eKr+xOYXftN7eoapze33rO6Cpqo5v
	oGPLMOFcZVmhgOHcOrkQhlA==
X-Received: by 2002:a05:620a:a99a:20b0:93f:43a4:a48f with SMTP id af79cd13be357-93f43a4a566mr535237485a.5.1792499455993;
        Tue, 20 Oct 2026 05:30:55 -0700 (PDT)
X-Received: by 2002:a05:620a:a99a:20b0:93f:43a4:a48f with SMTP id af79cd13be357-93f43a4a566mr535231885a.5.1792499455448;
        Tue, 20 Oct 2026 05:30:55 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1c6240sm5318361a12.15.2026.10.20.05.30.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 05:30:54 -0700 (PDT)
Message-ID: <73e35f02-002c-40f0-a42f-92402fc058ba@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 14:30:50 +0200
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
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100-dell-xps13-9345: Add thermal
 zones
To: Liviu Nicoara <lnicoara@thinkoid.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Aleksandrs Vinarskis <alex@vinarskis.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261006185557.23016-1-lnicoara@thinkoid.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261006185557.23016-1-lnicoara@thinkoid.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA0OSBTYWx0ZWRfX0DATkgd1LllB
 PSy+fu4+4GCuO0DqFnero9wPbXThOnFVBRd1fUGyiJOj6ir5GRuo79UAD9HlBqvEnuJiSeLgHCI
 Bm/QDEjNWjKlC0CmT1PbD/S+/t3HdmWvwlStZ9elT1yCmGrbipKlbIPhIxW6eOLXVGvaHxJWaRw
 fm5QRk8Eirg7NUJeyp1m4Yv3aFKqxNvie93GH7uxUirZPy3jUjhEoMRRa6IJ8yupEQiC1MbU+go
 A9jAL8BpY8fDd1Tj6dgLeZKLFMGK6wEG7qbIbQ7kgl+8stOrijaFIssICxH27j0LtqPx9o50vKF
 LSQ1aNc+oT33sv3x0JbjCDA/VRNvbBq1sX9T5Z0SsXkLq+h2bU22MHOOdcx5xuCCeviVFXjQLkv
 XyKEUkp6X+UMckMGUtwSp4B6yMK4t35bvKMOedyGbRLXA0KcHkEmCWoQxyiR3cAnR/oEw3kfRjc
 wZA+q/Zhsi+2GaJxDJg==
X-Authority-Analysis: v=2.4 cv=fIusTpae c=1 sm=1 tr=0 ts=6ad75f00 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=vsDZt6SWGVavrg_UzXUA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: bNuNLGg0X9jxLEdGoST2GkxCF5Asj5au
X-Proofpoint-ORIG-GUID: bNuNLGg0X9jxLEdGoST2GkxCF5Asj5au
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA0OSBTYWx0ZWRfX9SVcXqH1m6iL
 HmiA1p5DKY75Iq+kAMrHn3PVH0CZXXV9MZ+9v1tAIreu7pB9jCxTBQORK6ZI5hvM3i3XMpWHDDt
 2Y8DjOUZcn++rmNJnfZdDB02q9nufNk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200049

On 10/6/26 8:55 PM, Liviu Nicoara wrote:
> The XPS 13 9345 has seven board thermistors on the PMK8550 VADC: AMUX1
> to AMUX5 THM and AMUX1 and AMUX2 GPIO, each with a 100k pull-up. The
> ADC configuration in Dell's Windows driver package lists the same seven
> channels, SYS_THERM1 to SYS_THERM7.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
