Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792723584;
	b=g+XfKtusYHRTI/+cRZQheWvcad1EBxMlyiiQXKqpodWryiBHWy8Ladfc/HHguKYPO4TP
	 FCZAk3Gwqz/HEhkitv0UBU2L4bHlhCs3VqHO+E+VC3+mCCk6vdv2bCa1MRxFDAAIcbyKF
	 bOGeb/Tb97I5WCq9JBOPBZkgkxwkyiCJ7Wtdh9+ZsOOlwFNgoKJdF733hfAhNH5tzY8xi
	 i8TSiriBSqgvTmqO1d8/BEBWxIGGlNkAx4Smp66dFuJYFmuv+tm4DFT+3Rk5iUjANUmzm
	 MfmNoUlaY2IZScUA5DR4ipt/vcm9azGWG05D5b01J7rw4mPUOwF48TJbVJNJuG/3yjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792723584;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=V+pqjCEFgknm+G3XGUd3Ph3K5ObbbOwQi0pMo2Pd7bo=;
	b=JieA/ixC1zA+RYgbe07xlzjZtCck62Wa/ZQjxDhpU08LsfE3rE+Etefln7v7Qq7zJHa5
	 x/iLe2iYFU8pfwpgISj3tHoxYN95QohskemwgSeGYEx7qFCoB32htvhu6MTgdyYVLg02v
	 UzYq31zcpoeX5mqPpm2v92YOslUlpqwpSqjS6xNIi3oN+ZCON0YWvQOI/DFQVWXvQSjRH
	 wGWe7AdaTdXnIQH63yq0OFT1CoEWqufLFxpMcu2BfqHgbCDlZgCHnL1Ik241Go1q2h6H/
	 oZhmlQxqG8xd/8UluWxNCmHiGiJTqRVRT8PKaOj0ORP/mef0rEtN5RwjN1V0qmsPwgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WZBO26gg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MbK1vZIo;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73780606A319
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 02:46:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73780606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WZBO26gg;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MbK1vZIo
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N1Etjo2389423
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 02:46:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=V+pqjCEFgknm+G3XGUd3Ph3K
	5ObbbOwQi0pMo2Pd7bo=; b=WZBO26ggeAqzfQ3dDhim0tuC0CZ+hb1/CXGB4rc+
	MANT+wG64BHCQi6V+m4/d8eIoUyoSw1m/pC1bzrMTVWSjOToNS9t4Jaz3+pby4HB
	FMzpCbfu+i02j5x4T0bvCoBxVNwTVCglkXlmQF+6iD+V5gLoN7/mBgRyLf6nCB6V
	ROxwX8cC7gIPcyAloxPTf8ECJJUgz+VIhgkZvWM59a9JeMDL/Hyf+GyU6n/mPgLU
	dVA0w2UjNUxgoA1JWsS2nWGWTWCOWNF+bjKGMhw1sPPXUkCDeuMxNu/4cAMqXbFX
	471fOfk0Cec8WKylHbeCCm+CzMtObyeJ4+FDL0soYWGiOQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmp9hny-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 02:46:23 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso723927eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 19:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792723583; x=1793328383; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=V+pqjCEFgknm+G3XGUd3Ph3K5ObbbOwQi0pMo2Pd7bo=;
        b=MbK1vZIolr/333dQnmuUMJA4Jz/4Bex4fIoe53z/aFDxEIrv/tyiMTTi1Sfg3+oM3A
         AWA3/7KGn2UA+nVvsJI9pOefD3vhR7iNQFmjQ9cagScMLfTj7vlLIDr91euLoBZxUSwt
         uEUlBmAYHhgNuRSuiRbRbLpaV6+XbMAK7o0IDIzRaJPUlJAWm4wFkAxbCgKidp7KFGY+
         dddMyo2TSBg4aqQvS1EhBFQQMP+Kex0xACsIPDWoF6J/8t2lIcoCf0bO+jyQ2iLWbFBU
         GKu9n24zCDNKbAoE4e6eKLLN04SnRi4dBVPwmFIxfZJTCIARdSlwGHUizFBmJSwFHt2e
         v6yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792723583; x=1793328383;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V+pqjCEFgknm+G3XGUd3Ph3K5ObbbOwQi0pMo2Pd7bo=;
        b=pSpBzktqbt3d7hbJjwTik3NuzqZAsRAM86d+4guNaAwfzmv7r8pl20xKxlcaogkoy5
         n3b5B0WEJy6JQUySag5VdlKVP6mqtfKWtMQjsbikD3WANRlCsBkj0SvOVGGlIM20qKDL
         6PVzUJHTrxkpsEH22IEX8VzQUIwbNh2rKl0FwcIixb4uct87p7zrLkrU5TwCnDYOqkAb
         HRDnMbHDXza2bWO6hiugDd8W6rRHiuD6DiwZqNP0y6LC+T//iLd04wbQ74/Dy+e5inZQ
         gCyng7vOyOtV52q8GBPiNXczgS2RqBlZKKRb7rKYdXsZPRoRy+VwELihu0Hh9ERAQv42
         HXGQ==
X-Forwarded-Encrypted: i=1; AKwUvBwKYHxawX9FTtO+FT55b0orCIZuyZJRgx2xQQsPI1KPyaDwI1VxYyA5syIp8ja0EPYVf5aHfhRxCuL3lws=@vger.kernel.org
X-Gm-Message-State: AFq9FYKR0fyXkgf9pmHH8Bh/5unviJgcUYdfisofRRHCblj0D19lTKzs
	KIn2o13zr8j9xYYfjKVEUf74auiA0Licuh180XIeyjZIjd332hK3n8+dcsdStl3AoFq6zezUxbO
	zbHPG2AwZC3wI4OsfHJWF04hORUiJZzqyUr9jWIw7uNp20JLT2ylC3A5aYsPHZWmcWSI=
X-Gm-Gg: AYBFou0zQPZbKid9pYgxij4IiYPPSE1s8assgXYD/FAzVu01q/KEmI/rHi0sLmY1+CN
	wflKeMsa4yZknYs75CSXIcLuL3Tk1uTjdFVAlAytJbel8BlvYipvTkEXfjFlmAj9SPzCBA5D/+7
	BsswN7kG4dz5JowjUd/rdUZK4LDSRZM34vvUyS7mdl8ZFUAHAAxdv55c3hAOpHdll7Zl81UH+tx
	jYadEDN4cVv6uAczqL34VuKPfoPnpm2HxMpaqj/gQXa1xl+KgtFfS2YdNCsfHZJMpAJN5n0+/Pe
	RIA2wW1N8peV9QVS2tEH1UuH0Ls9Fzh36zozY19DR70iPPoLNVA5V0jKQA/UQHl12vNBaD5wDYl
	smbHon9pf87SkGdMYVsK6hvrfZcTaSLq92IVcvAA5RQ==
X-Received: by 2002:a05:693c:414b:20b0:367:5e31:ce29 with SMTP id 5a478bee46e88-369d97c63femr1366801eec.20.1792723582716;
        Thu, 22 Oct 2026 19:46:22 -0700 (PDT)
X-Received: by 2002:a05:693c:414b:20b0:367:5e31:ce29 with SMTP id 5a478bee46e88-369d97c63femr1366763eec.20.1792723582146;
        Thu, 22 Oct 2026 19:46:22 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369d9d892b1sm2312032eec.10.2026.10.22.19.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 19:46:21 -0700 (PDT)
Date: Fri, 23 Oct 2026 10:46:15 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v3 1/3] arm64: dts: qcom: nord: Add SoCCP remoteproc
 DT support for Nord
Message-ID: <atrKd0jDer9wAznR@QCOM-aGQu4IUr3Y>
References: <20261022-nord-soccp-dt-v3-0-1a69a4d54c42@oss.qualcomm.com>
 <20261022-nord-soccp-dt-v3-1-1a69a4d54c42@oss.qualcomm.com>
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
In-Reply-To: <20261022-nord-soccp-dt-v3-1-1a69a4d54c42@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAxMCBTYWx0ZWRfX6xUHRbVDFGQ1
 C/bJiUIjImI9tiZk3XCV/0yAevG7AoQYmGCMyKETMTP61GFTqNm3NPg4JJcPU1ZHhheU78EENMc
 RAqpWIHg7ah/RAUgUHvzoBxT1KdU3As=
X-Proofpoint-GUID: V2IxjYZE1dr4jWeP75u7yQYXkwuCeFMm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAxMCBTYWx0ZWRfX1+BDVl2zFi5T
 atf7aQv4N+B+mzCBwfGtR1/CL4Abuua5Aj9OA58Z5as4xDAWwt0GpDAhe7O+uWeD6CuFWc+XEF3
 zmU4YoFSebqh1wpF052a5I/aFrmsaA7qCnmSYmhqf6iJpDDl++aRa9w1pGRNS6/Pt3Remr4C6dl
 RUbdIDST4X/sx/CdAqrtpj5B1VKD2G1it2RKAjgR32qAHWO4eTbm+GE3alsLSGo6s19dLfFz/9p
 Fcbhbo0F16zK0NntB9/U0Zc4am5DhsPtz6CQjAwAw4UcXzHZkSqTVMCSHckVp7nL/kx69eGn8wM
 pP0YAMG3TAQwgHmSzZDHNJsAdYiWaWyg9cfcoXh5R/R2whPs96e5yzcO7UdwV5kyTuUtktk+3BA
 2dNhbDGIHWWr1h21KWCUphEMc8GmzNa5anFnTIiPLdcCREN71oAVnY42+D43Dk+aUWo3HMkuzkV
 SMUfnzLdNN+sczFGalQ==
X-Proofpoint-ORIG-GUID: V2IxjYZE1dr4jWeP75u7yQYXkwuCeFMm
X-Authority-Analysis: v=2.4 cv=BdBNQbt2 c=1 sm=1 tr=0 ts=6adaca7f cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=OoMBhQ6JWsPECC_GQXkA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230010

On Thu, Oct 22, 2026 at 05:27:01PM +0530, Anurag Pateriya wrote:
> Add the SoCCP (System on Chip Control Processor) remoteproc node and
> its SMP2P configuration at the SoC level in nord.dtsi, and wire up
> the clock and power-domain dependencies shared by all Nord embedded
> variants in nord-embedded.dtsi.
> 
> Move the SoCCP compatible to nord-embedded.dtsi to fix binding
> errors reported for the Ride board.
> 
> Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>

Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
