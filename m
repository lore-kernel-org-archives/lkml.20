Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CCCD3FA5FA
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 09:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788427535; cv=none; b=rYDOOAqHU1l5eWMwkcqeYMiE1AjkMzPD3QR3sk0Hvj87OIUyUdCkWWT7PB1vaNdmIRuMF3NVwncMISNY2qmU9rgJdh/tfOiaqwnmt4dWIYimZPgWW6BshAT4+XP0FvuAY1xDJiYEKsAMkHB/wvDkvkVXviF44bwQPYldZCqR6KA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788427535; c=relaxed/simple;
	bh=YEomMeML2cE+49xMRE46FgrabDDRLugR6xWa+LCEczI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SxJYv6TjOxZ8UlP3OQGeW343aHQMyErgkYOFjFedNc+RlG4Wl+bJMrsIM1HImgKm4Dd3ctL2X6kmhRtivF7AAWg1H1yMUMrtd/Zgjx/pQecB+Zh3lr0EXTR6cjjhFKVtjhzhXPyaMiy0y5BHqArq6MRnFs1KxA+K3NwRPncPod8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jdmFbiPk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cLltE5SQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jdmFbiPk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cLltE5SQ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683924jk043820
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 09:25:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h4AL3I1iVTY1lcvS7u5/OIzDF2L/Odk7CNpIPaVSYCQ=; b=jdmFbiPkU0C6fvJQ
	d323nGO3iMaryCOi6qYJW+nT90TlGpztKsy5xbJlaEkIS8K9YLVJQtPYa7d6eE55
	L5yRZIl7HVqpX48QOk6VP96x05V2RxpoOwhuN1JYtOmUjWCmd2wFlv+bRbHSaDZL
	eXT4KCbtJgus9lfAHUVqsTBNmIZOna5J8XSImd9s+J7LOx1/kQidCERLNq+LInrd
	EVEZf67NFvxNn/A8Hl9ccxS6fTg0QDu4r2McZfFCPEXpv4jAbuW9gAf/wQ1/rgqC
	ZBQFGo1q6GSF95VFjQgxb3M4ZPhMRBFrCspFMIuYmZmB1THbFLS+6FuzgGcRYVA9
	HL/X6Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf1pyh6gj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 09:25:32 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93821883e26so55015085a.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 02:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788427531; x=1789032331; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h4AL3I1iVTY1lcvS7u5/OIzDF2L/Odk7CNpIPaVSYCQ=;
        b=cLltE5SQe8aDL21Wx6dupuM27DoGW+4rqvvLcvCxnHfT4LTXpl5Z3CT4wCqlhG3aOQ
         a1uNAM42H5psfPb9BLa14/GbZwjDQphGsEZHgZIDz5cfP6kcOnYVY8Y2WkhESkiWowOd
         rKTl4p78hTu/cnPkqXWm50lwknVUa15r8h56kfoQoTYIcypIC4ru7Kn8mANi6fEPB+4s
         SaTH1tj//05s/IOVv765RLfm6L8zmnMQJ8WRGaCcOZFmJD+C+vam5iFB0Iumyv6Mm5+y
         ECuCyc6B5BEf+D0vdLwYCJX4omHcJEnyGK6Kvk8cwbahs7W3L39b2Vy5tMHYf4Mtm8IG
         OkxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788427531; x=1789032331;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h4AL3I1iVTY1lcvS7u5/OIzDF2L/Odk7CNpIPaVSYCQ=;
        b=ZaEtUuZvHw81uVCSQ4fDv8IqfMZ9YlmpU4xPzAuqsB/3cxeMmSjf5VVSO9bENOTkbv
         3Y9KzufckkIrCVY0gXDD2oCBzfuNeL4yxsPU1pB/if1imTYsmjPzGxjkzLQh78NgzP2H
         2J3z9w3DDzrdsP0Tb2u55XcT8o7nc0IHVut/6CSxiqrwWqPAHoEfkYsOQHNhNO6PDxMT
         NoGnZC1bb9vCWHOI9rlIaqTq9/3TmjeGVSY7P1v++yyUudqk7dZGgyv3qC1Jjqtcr0Y8
         UAro9OBXeJCohJ0wsCnJpvi692Fe3HmWrueTNTUlaptuhas8vIrILfuiKf0POZ9YnX0i
         3Vnw==
X-Forwarded-Encrypted: i=1; AKwUvBxZwu0K1ftparBjlGourFjvutfGM/APo3wpNtpZEZyAXdu2Trp6nf7hyRRAmlkJDj7y1dBdfy7XkDjw9H0=@vger.kernel.org
X-Gm-Message-State: AFuF++nBBI6P4TSP0ga5wZjhrYfeVnLGeveTwcB38HY1AoBg09Fp+koG
	vD+UFLdb2WIeHNBvqzgPQLhX0tXnE4WSuGwqC11R16FPYjasAjza/Rpa65vqKaYi/mlHKYyAgNz
	oQNcabrPK3mQ+7OMXmml6Wa3vJ+F+Fhg10Ipu/8rbJbhtqoJjW6sTq6NSedrfoDrTDDo=
X-Gm-Gg: AYBFou2QUrRsjzu6Oy4gikRbEb0BevMoepsFQFyKN0e0ugJDIkte9tyegsCxI6st3Sb
	MVJdMOgr8HYGeBfMoUA42lcjFgiDJf1EB8TLcdZwgUk1HQHeousRWjDI/NvN4vl/RlwnLJxZY4h
	O5p+SNtRvi2aYRaU7V+PiGL8ld+8yUtHkA9b2hgWbThlCSXS/n3SQ7VHEVoXD6LKM+XP4VdKGPj
	EMhGQtL9ypcxQLYn4xmxwGUPzmYpVNKqMgdsYfoQChV6MQG5afYeW6jaT3a7DqggfJwogb5kOJT
	YeuPwpddhxSMWwoh47ZfUx3Jkidus6xASboQ917s9V1Gplozcczsn9fwwAeo6Tk8aepIAvPzz0O
	khqXmyX9nzGUDDvrInKgzQg==
X-Received: by 2002:a05:620a:2b46:b0:939:288a:8a30 with SMTP id af79cd13be357-939610cf0bcmr847809085a.6.1788427531238;
        Thu, 03 Sep 2026 02:25:31 -0700 (PDT)
X-Received: by 2002:a05:620a:2b46:b0:939:288a:8a30 with SMTP id af79cd13be357-939610cf0bcmr847807285a.6.1788427530904;
        Thu, 03 Sep 2026 02:25:30 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25f3eecf0bsm69605966b.3.2026.09.03.02.25.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 02:25:30 -0700 (PDT)
Message-ID: <8fe6926e-723e-4051-8816-d9d5773e0a96@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 11:25:28 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: Add Retroid Pocket Nova
To: webgeek1234@gmail.com, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260829-rp-qcs8550-v3-0-198d5b2fc475@gmail.com>
 <20260829-rp-qcs8550-v3-4-198d5b2fc475@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260829-rp-qcs8550-v3-4-198d5b2fc475@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA4MCBTYWx0ZWRfX7Ap2+v2FeHaL
 o560IzPmgf0yz4ECXlesGE3fyqTxbNJso06Dze8CVatmTNjc35WhQ83DB+eUXO94uAaQjZunWR2
 u3gl8LpAyzH+KttXBZma8+n4gybnp/QOZw3aJed9uM7WfO71oFDcPySN+bdTEGY81LPTcTJ7O3g
 jzJl1sOiUWYVd2I/z9DMQydCdljRyup31VCsGs0pmO3ZAAKvZmimfa/R03+wIsuVZtuWeouy5Jh
 c2RICSBXqCxxTj3SOFCeruWezpvztejvQHHnQiCIhfPJD3PMRhBxKpQosgLtcXL7fEPDnk6h7ht
 z1UREOpl4L4jT2599BQ0FqdjPtKeoQjo8sRA+LVViDALC0V85yMZHoC/pRzrQV7Wp2xWzWxmhC9
 z8XD2zf7ESNSa5rHtYozk4Ps2U/IUnDZ7LWMXSZdLb89pYmHSzXiTkbWJxujQWKIjkerlpXDEzl
 POH8CthuKhCdJFqwOvg==
X-Proofpoint-ORIG-GUID: gR7YAFgD7krjxnPVffce9KGjjxDdECbA
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA4MCBTYWx0ZWRfX5Cd3y+osWnhC
 I2AjOU9qK6l7xygJDMOFcuNqfPKvkVLmWKT1XGnJhIef45HcGc5ehcn2J/LZzu+uYgMgL8gBBuL
 U12WVRa7EV3PkfkSu5UvktBqq7Ln8pc=
X-Proofpoint-GUID: gR7YAFgD7krjxnPVffce9KGjjxDdECbA
X-Authority-Analysis: v=2.4 cv=DMO/JSNb c=1 sm=1 tr=0 ts=6a993d0c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=ZnTXIAIJv0AbCldGE5kA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 suspectscore=0 adultscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030080

On 8/29/26 9:35 PM, Aaron Kling via B4 Relay wrote:
> From: Aaron Kling <webgeek1234@gmail.com>
> 
> The Retroid Pocket Nova is a high-performance Android-based handheld
> gaming console powered by the Qualcomm Snapdragon 8 Gen 2 processor
> featuring a 4.5-inch 4:3 AMOLED touchscreen.
> 
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
