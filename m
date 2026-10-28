Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793202100;
	b=oBxRY/wEIR2y4M8FJGBqTnHj4+SsaExMcD14J19j4TyVg5qSk8KcAV8ma8UYNSp1pM2S
	 5aGNgmfsjJm9fvXmoE15jUCYeXbcCQaEolm0FGYlm0wCY69PJ9cgfCr6y+nV2KvC8ckec
	 Vz1iwPfJ5Pf2Uu0X1UkIx6yffItZGZsyvLUykIQqAH9Yqyao8GWVUwrFX1wQwdzHvWMXq
	 +G8U3/YEgwxQXTWQ38RvSMWX5MjCqAmyP2/oKUlVvFCOnw36Qvay6R4JM4440R2KPX7d1
	 5TpI76TgctJSiHhV6m+FSjknBWtfqt+XiIxc/U7rgO5aBaOfjIjHqN9fHhFmKCRUsEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793202100;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xAGpz9TD6oCxgoJfz5D+tXdaBBTRPGgALN6kzjVk6w0=;
	b=dSrxqVBiIWzhfsq3zdzlcpZjkVVjQ4h7Ertb9vYp7n3F3EE9uPooj4TbTdHN19/4ATnZ
	 w+lwPoGvl95ZYsDKqSIwM/W3O8J0st/abpHZImDZEhxEwHoq+UzZx8dLt5e2UmSccqNlb
	 MTlb7VPkTvWj7/+pjeVOFm6CRLVcdhCQN0fTVeAqLMngcBBsT6K1CCJYQR81vxCEF8Jix
	 1GkYEJXPJ/lIdzaLIDqilw0UNEB5Illl6sbltyoD3PQW4BsRdbumcgK0ZteUhPYdco6Im
	 UZQ1HyvoEpJ8qRxHC+gAShb0hrdfOZmgGH8QeqcMi0HmLdZjKEHzhoIWcTf6iezgAaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OgvPAAv2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SWN1Czf8;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CA34606A326
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:41:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CA34606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OgvPAAv2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SWN1Czf8
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SFAI8o2001994
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:41:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xAGpz9TD6oCxgoJfz5D+tXda
	BBTRPGgALN6kzjVk6w0=; b=OgvPAAv26Z+jY/F3lMnjG4J8bK2QeZ+lW6MBAcFa
	9ldLQr72iZ3IOG8JMXXK68mRP8AW3N2Ndvco1y8nUQeHp0Euxm9Buo5Qa6YXkUS9
	2Eu/O85eHzBqAzgzFL/na3MgIz2nFnim45LBQRvbu5Nvd2s6hN3O8YMsf9EftPke
	9AkgK9OwzOnzJX+qCuvxGgvRD5GvSCSWD4TqEx5nV/JZiKYrW8KBBTVUimZOljsg
	GVdeOAT6CchVYA2Uq7HtfUnhRgFmNdmZMoyodDJ8ji09AcISYE//UdD54a5Fqf1X
	DeFeURvl86BxECwPBb5mfs0bfHMSycRCYZuXDCbmPyZQ/g==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkdf7sran-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:41:38 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91c046843f1so1036406d6.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793202098; x=1793806898; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xAGpz9TD6oCxgoJfz5D+tXdaBBTRPGgALN6kzjVk6w0=;
        b=SWN1Czf8FuWymT0ynIkDoLOUTQu9SOLtb5+1ILo+GVbCDgOLsxALBS4Raknj974WMa
         huqNP/jFDm4mUv4FQ2mGNB4u6szeCZd3ZmfSA1tLMJ2XbMjtA9b+W3vFIQujgVN9tQ2H
         s2WTY5VdjaIeMGGQf/TVN7jys3UhWsLDtx9plNvg4G5Lm/aalBzuPovf5LUB0cmJkre/
         w1nQynqbFQM2HXeOkSoYr29WUkkfgj+A3t3CLVO4NEMZaGoHHKLORJeva+ORpLcFhMrL
         OP7ii2on16sa10IhpxapdWWR9SKmZkdZr3j4Bwk518rHXji9WUHButN8I1qw1jUrsSkZ
         rtRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793202098; x=1793806898;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xAGpz9TD6oCxgoJfz5D+tXdaBBTRPGgALN6kzjVk6w0=;
        b=R9zbneL/cutCSkBQCKHCaNh1tQlVLvzzXTRlYQH+h2qDEaL/8Fps8f292KaZTlwDek
         VpqNA/6AyYNOm0/DZ/oQgsA0oqfCBGEhsEwCqpbm4ODHGuCTeNTrahtxEt27ipLmBCNK
         9BmLqcGvY5Ig/KSgKUsjjABUze8eMnX59zEMCvjy6HFH01Nfpydfe7Ho/6JpRqfngiaa
         F8r/qDmGcw47R3XZZmKVj33tPJPmG6Tt+QOefxj3l6GcNhR3UHJZ9HS9FDpVQFsPrEUz
         Cb4C0lWMeGgjBaRfXNafSi07mtL5Vpd2x+yOXf9J6s/tLD+GW2wB8MGI5p9pNRR3Koq7
         JL6w==
X-Forwarded-Encrypted: i=1; AKwUvByGjqtnAJJeabg1C7inm3huAEglHm62FQKH1ZM7m0mvFMCMeMs/PcUZniqg6cVPX4ivFclmGHQmLG4MxFc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIThs6RxLaFZrQ1aOoYUBzAU3K0ngAEco7dXhphlttaybNzl5/F
	8f6qaZWqJqeqgwdenqcwLWPsTwNoMvWOI5atmeqkdMZLNJCFBXXdWoRvAN1wNxSV22mN4xXDUWg
	iL8XlU89b9+Hg57BdrSe/x4MhnmJOEt5Qmg8Nu2bVfx3HkCl/amuuqnAIO7evxo0QHOM=
X-Gm-Gg: AYBFou2r1a4cX3YTQeTWL7CNj11cKI6CKSC//xj7Mt5K/eLrayeOuiLLXU3po0gXfTa
	jQ9RDvwMhMzb6cnkFdkmdpz5nptmg8+LWl9TS1UNQGWTJh3M9HaFaRB502xrXbVYGSVqBjRqnrZ
	lyEEQrgYdzR7RbJQH1g7THwDRe7OAxNakAYCjEq7NEeBvlrZ03F7C5E+3AvEiLiBDo1E0txwC1a
	Xrh+b1lmYP2BVh27+YYNte5dYsg7rcX0YXcnqS9gkTRez864eE2WGO0bWufNyPR0fEQeU5ZdtAj
	I2MeHibsz8xCVF0ePS1ApxLOLOqHFTw/UxSM962rfoUoqMK+YFdJy7FfSfWM3ciOQAsu6sk7USz
	jJhqtAerirmHO1Zk2IFb35ne38uv2vBF7h1RvHKApbmUh825NCAxgPXfCFdbduoxj/A==
X-Received: by 2002:a05:620a:2b4e:b0:93e:53fd:413b with SMTP id af79cd13be357-94408dc203emr391843785a.59.1793202097910;
        Wed, 28 Oct 2026 08:41:37 -0700 (PDT)
X-Received: by 2002:a05:620a:2b4e:b0:93e:53fd:413b with SMTP id af79cd13be357-94408dc203emr391838285a.59.1793202097156;
        Wed, 28 Oct 2026 08:41:37 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd37f4sm34722381f8f.44.2026.10.28.08.41.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:41:36 -0700 (PDT)
Date: Wed, 28 Oct 2026 17:41:35 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Avi Weiss <thnkslprpt@gmail.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] spmi: mtk-pmif: retain controllers for removal
Message-ID: <e433xawx2fa3x33rslqiijtbk4vf4ius4h4w3k6jgrwhsqtpww@zyyd6mxxvvni>
References: <20261028094847.764747-2-thnkslprpt@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261028094847.764747-2-thnkslprpt@gmail.com>
X-Authority-Analysis: v=2.4 cv=M4bYuCws c=1 sm=1 tr=0 ts=6ae217b2 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=vSNd-Fa7lg0QEwYS95cA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: A0XkzSk8fYM5iqmk4pNtUSFsHAjzDuEG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2MiBTYWx0ZWRfX8axZ+4R6YkyN
 FJdTWzHzhFRKeDf8IO36tI8Gqn0vf53ozyQrttrnuFKRCZlXpIv0xbn4GcKp1g+8rAdyBq5eiCV
 nCvWk+wthegs667St4buISywMotqVsA=
X-Proofpoint-ORIG-GUID: A0XkzSk8fYM5iqmk4pNtUSFsHAjzDuEG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2MiBTYWx0ZWRfX2W3GweCeP5iJ
 7s59tgBNd7y1oPCKpz7sa0qk6JfHPn3jBmbStI6isG/GYyTqTfpeYxWbp7LqaxnEluE2DLowacD
 I6aIjLYM6apck2CWH3ncF9m+MMyiqNqm0j2SGTUfBw0U1DAVr0cstuQPG34Ny+puD3qidV/bpbS
 ih9tVfWO2aD74tdhzj1OA2No8xkmUIdyqtB0FoS5rLTTJHCWKAjyQpFAdW2ofhWQ88HYbOf65Q3
 tCG6bJ/tfbWRObyaIs88jahguwvHG7fDEiSGqzoQnLPVshQdjl7Fx3+tU2ZpkSR1EvHdEFBRl25
 rXyg8MEpIYi8kg4Ym+qZ3rTtb7ceErmTFWGq0Z8AXTHzgH4B6VXYzyHW1qb27lxoUSsYf8O0fm+
 v08T6IMpu5rAchmnyOfbyMVTcuQwzUbDrr4vVHtlj429j9/oMmB9Tm4vTHbfv5FldhVuVeTqIS9
 CDjYVN6kICt1ox8s2ug==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 malwarescore=0
 bulkscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280062

On 26-10-28 11:48:48, Avi Weiss wrote:
> mtk_spmi_bus_probe() stores each controller in its private pmif_bus
> rather than the parent arb->bus[] entry passed by the caller.
> mtk_spmi_remove() checks the parent entries, so it skips registered
> controllers and their IRQ and clock cleanup.
> 
> Record successfully initialized controllers in the parent array and
> recover their private bus data when removing them.
> 
> Fixes: 078117963b2c ("spmi: mtk-pmif: Add multi-bus support for SPMI 2.0")
> Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
