Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793483390;
	b=e3BBO2o4GWl2PNWCRgZbvWf7FFiWA9CQLqOe2IiROcSQQJPqBqzoNeST0kFFmRrpT8u3
	 9cry4ClG5iJgl7A7GT1o7bYEzYqoKcJT47giUtQ+TCdqMm3+Vs9guk5S/JlI9RG04uNJN
	 yHQlggH9huwrdc64uQQ2gtKiOQ/O8Q6p1TwXlGA8BLYIc6k6z21n/74Z38p+mWSgJJ5al
	 tAs9HHxCUg1fL125C8GwfCskKYsn+fgn4oAiTMse0iwB/vuccUfFukbJ0Yj2iY29kFiS5
	 vO2E9KqZf52k2fbGpVTScfNUHIK5UaQEn3tld6o8ij1Qi4Z7KNRcI9/cVq/nH3yaxjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793483390;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=j1mbjZFdOfU1TKJ9RHIWtlODdzpuDSIVrKfpxo914T4=;
	b=N18MS63e0yAVfsKpQo1EhHR+i5OQ4xyFTLMBg4yT4m8ADTlT4XF8IR6iJGJJU6CV+WEN
	 eut9aPWenycTjRGsHFNP6duqz2bz+1yu+yd19l2zidjr/7nhJU5WFoe1s6ZEVii91ssOO
	 rAFgVBnQYt5mDUhSZP2lJxtTvWBLOnk5MHhHzqAttefUulW198OYHOZcNt/Bz6UrCHVR4
	 /8yQkuaCGxasrVo2KTy5mcvmc9h1yT8vQXaOIaTHExRKUWA2NFQOYYQDGKVKc9NLQbqkZ
	 MCiVePYz/sYwjaQ1WKOq0Ps7RTVgp0Krpkh/8g2V/IhBg1n4W6bkhcAVybaKAqquNtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nkI+6Pch;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MKf56zz8;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D2EE606A31D
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 21:49:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D2EE606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nkI+6Pch;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MKf56zz8
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VJFFVP2614937
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 21:49:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=j1mbjZFdOfU1TKJ9RHIWtlOD
	dzpuDSIVrKfpxo914T4=; b=nkI+6PchAxge0VXtleC8xeqjg/F9Te5QKC8yTT4y
	WrzwjzrXcoUIiwnv/nEa+GuwT4Q2AdiYh11Hwziw9FdcfTDOo+8p722PZyqoG2EA
	/OWFNhYGWHrzCpto+9qyrSquHbyhGlYkuDeKl3X52KzzDwMThiFyJ1AKMjFO3jSY
	lfgalAMX4PbQruqT0KfvN6bVsxrNyO3X6FvWhu5ZmBRZ9xNNK4ksnFV7nin7ELXr
	Uptjd1vTA8du/mHECAmZFyklwRpsFRdAk8YdZD789hEeYSPvodPm0lIwK/shKpW5
	L4NF87JwOi1zSch5tu7cJA2h78gMVIc8nDgaNHvKs0xdQA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn7nft85e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 21:49:48 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91c7a0f8250so41009466d6.2
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 14:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793483388; x=1794088188; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j1mbjZFdOfU1TKJ9RHIWtlODdzpuDSIVrKfpxo914T4=;
        b=MKf56zz8SX9uS8xmkg7JfxvafTZkHTj13emxxlmk8SnLnWW0b9Q9v0apVZRUb83O+m
         ecUTQjtT8jQK15yakHlVcwosCR5pHgYCEOY8i7b1IwensqTIy70INUgM/BBnPRLy1K3J
         pyyNmgmy08QqDsouwpWfdPpR/GfXogVR2r+C0yXm4+fizij4Qm1HbRyaF+1XIE20w6tN
         KsMimH3BCrkNsAutKC3gi3hnuzgZwIEbWL8GCA/dvJZuIrOVYBDLZWn8GRlfoqKeHOIY
         S7eou/TG5Mvr/iNsjYmg33M4TPrZSHGJU4Kdh+ez4YJQK9tycWvF+z363I6ZJfvb+FNF
         QcVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793483388; x=1794088188;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j1mbjZFdOfU1TKJ9RHIWtlODdzpuDSIVrKfpxo914T4=;
        b=MVdpdnVuyMcTN8B4625UsfC6+SANYxZgMJPnO1b/rOg+nNvj52R2ChYZE2C/FJ1HMA
         mrZTw5VW7CPnciwPM+6CUBOyM4nvEPrP7lKuuviox2DKRhibmckAxrfuBoTVuxsvncz1
         Bq12NFb1Pe7D5AhXFLcai9PLyJUWusqw5tF9a92ODcq1Q8Z0SWvMXgjkojiPlBsuHDUm
         q6+Q38tExpXTEdz2a5DRgtZmfCIAKvL6fH5DRDjIeMMc4zh62GWOD8mKntwaDjYtHthK
         /ltRIBjCidYi/NK/V90Lv1EUewRzIAZMor8869xgl9/hqj13YbNmWK/bDTtAiOuESSoV
         kfxg==
X-Forwarded-Encrypted: i=1; AKwUvByZLVXKRqMREYwLgeF/vI99XHheIoV3mZ/a6lsIHf2yTk+iHeVjmgo8oH+lJZti2IiSOq/kpKTS4sCjmCo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJym8okU5kCQ/S3cpeNDXZ+UE8eaE3RagSqqZ4m1yJhj4IuV51Z
	+Abf1MMAUVmVnFve/ZEM+v8pbu3Hm9L1xTcXt97HEkG8XC1yafNJEziQRxKw7pu51ADDatvPiCS
	C8NRYF04zi1P1sF6Zmu0Ez+a7dMXLrYY3ZJJHnswKz0rK1fcRNqOe6H6jZa7EfHKQoFk=
X-Gm-Gg: AYBFou1qiLKQOZQAwlpuRtTPHikpyLpVyuDcxkuXJvCZH98MUNf8BegSQ5n9Hi6KjCG
	WkNfI8b2ZaqXIcpRq8FSJQCp/7KHb17kdSfKsAnKAe6trSHuuqnOoESc70G7POe9J2i4ZUaMb4E
	x/0eRzobIi9/LQzir5QPs3a0IlG+9oaZvBjALosEWjqnKCSX5LCP7yiMs6DfeAd+4AL7sowgNP1
	HizVYF4fnfOz2Px6/OcN013PjPbcY+yn3NRxSUqI7Y7oY43u59W5GZiwVk+pG5ZDUg3XPX5ye22
	j1iWjSlrqs1bQCgq1fVUKwCn1zEgyeyNXfqjHV3b8XUs0ckV9py8op3MS10aDbSARcnyGE+8w5Y
	KpQ/nAQ+ZYhk/w5gxnLKFvkkK4Ku37TxLWiYrSp6Sk7v57GwbNfYcoKdjjvUGdFteI5GhX//u3l
	OQSfk223MIqkYZud4QyThIdscUDoZtlpT5CJ3vZ47dvjwhn2ZHWJ47FemAmspz2Q==
X-Received: by 2002:a05:6214:1942:b0:91c:914c:87e with SMTP id 6a1803df08f44-91ca4ae154amr105508156d6.9.1793483387608;
        Sat, 31 Oct 2026 14:49:47 -0700 (PDT)
X-Received: by 2002:a05:6214:1942:b0:91c:914c:87e with SMTP id 6a1803df08f44-91ca4ae154amr105507946d6.9.1793483387153;
        Sat, 31 Oct 2026 14:49:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3acbbf2b872sm11304101fa.35.2026.10.31.14.49.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 14:49:45 -0700 (PDT)
Date: Sat, 31 Oct 2026 23:49:43 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/6] arm64: dts: qcom: milos: consolidate IPA
 properties
Message-ID: <i4gd4zqtjyb3a5my2gy5p5ura7xsu6bqbheigmclhgxkeitvru@y6xlqkmftjjq>
References: <20261030-asteroids-dts-updates-v2-0-66a56c537749@pm.me>
 <20261030-asteroids-dts-updates-v2-1-66a56c537749@pm.me>
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
In-Reply-To: <20261030-asteroids-dts-updates-v2-1-66a56c537749@pm.me>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA4NyBTYWx0ZWRfX9fTyxJWr6iKF
 CJqzYeN+rkDqfAoihRQBhNE+AmSzXDuOs6HsvRLroouD2HF9k5Kiwj9+UtVOwB64rXxmlDTt7Mc
 BTZ0+X0jnuZuQaPJDUeeSAbIvX0FTZY=
X-Proofpoint-GUID: Ce5Gg_wxMpggnsXDiFRZRSrTp4ZMEl5X
X-Authority-Analysis: v=2.4 cv=FJ2OVOos c=1 sm=1 tr=0 ts=6ae6627c cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=r0E3B6ySCoxRs-Erq-oA:9 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: Ce5Gg_wxMpggnsXDiFRZRSrTp4ZMEl5X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA4NyBTYWx0ZWRfXyZ8gybkerFtv
 xbm3p5WQoW6drYULcsp+c7fICM76qlzggE/K1iRfDAWnqexnir/GCypXu3mtU8rembnPpsUfFBj
 ZK8BCqBLuU1qEDyFofhYxLhELHEkFFnFXjZSV5PtwgzpOGEc/3Rl/JVKdUTs9iqYtYH8bFK71Q9
 WG/uNOgvkwAl4xXfW2cFbFgUty7msyRKwOLu8imgd1NZSg5LdLubVHomWqrfISSXWSZAbDbiNpv
 aXaRLS5IieXPsg1f4E9CUOZ3Or90aLNBZqrboVlQKQY2AdU2fBk7y07AEzhx0WFdEh/bGLzMKQP
 MsOzPj88iqM+2JSUC97hrS+8o3+9yaw+h9wQELykAIHrWshnw64NVJx9iTHRGXx4vfwstnKp/zI
 PItXBiRdGLjnlE/FhpBQWjmYTw2Z1kqSUCDOia7ksyuzaT1jl1Ca6fIs75XGTxidz3RaIeRQHF+
 ap9fmHxOQ7a1OPrNQ8w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 adultscore=0 suspectscore=0
 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310087

On Fri, Oct 30, 2026 at 10:41:29PM +0000, Alexander Koskovich wrote:
> Move generic IPA-related properties to the base DTSI file.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
>  arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 3 ---
>  arch/arm64/boot/dts/qcom/milos.dtsi              | 3 +++
>  2 files changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
