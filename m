Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792873573;
	b=okpQ3fEVGXrsYy3290g+ssSxMuUnjFG6xh0UkxHEiiRb+cft4b4oZTVC7nmIWqNR25T7
	 aWFg5xTlr6kj7qyizwvG9d1Hq/MsWwco15rTLZhC8czkjkqbbMbyDnha69EyeG7RlP0bj
	 ytRxmE0AERlRyQhsmmEagw68qi93NLI6h/Xgui5rgTGp/tTRvmaOqd8eXwmnysq2vNWIL
	 bDR1YvDkE5qACLyARUpdFsUQ5Dr6TuB+OOqNMW8iPxH+SYxWQKPJaTniqO3RYy96f0AC+
	 mUYrebDgGsAY7FJwdlR/VUagAFqKkpb2+L+rvGIHhBOXdM/7ePbjFZpzpp1lrSaLgXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792873573;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=tD8TUcG4GR/qMQpgQaXa/j5++8tEfZOt1fk2tK6yt1o=;
	b=PWSKVFKNzvlgEDlTBZ5Unw+W9fWb0CjWZC1gtF+qIq8FOhGu2zVRbsmdP2tfCGyWfeXO
	 /qc8AcZ8NS12O0l5Rr9kC7+rysayejkeMCQK74oxMsXi8f1LgjGeplj6jhv3XvE21I6lt
	 4fzCNXGWxQdEputkoo9C+VejIS1KN9Ao2AryY0VcrKHMOFEmqeFecUa0rGGPteWm7xfhH
	 mTruqvlByRv9uH3zuT4gzR7TIBCkdLBhgJscxwLtIrWDNsEKdss7H/U5tJ2W29YUK8AlL
	 aHxxP9T3QnbrDBj0qJtnNv5yJqUY7gaQ9z65C/DsurfV3FquUuVKiiAfP0ISGfOI4Rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="gbCNO/iS";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kH3O6Utd;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B38B606A31F
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 20:26:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B38B606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gbCNO/iS;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kH3O6Utd
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69OITxQr2873296
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 20:26:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tD8TUcG4GR/qMQpgQaXa/j5+
	+8tEfZOt1fk2tK6yt1o=; b=gbCNO/iSifPPAA1bZMXy+FxG+TyfrVZvEifi5XNe
	pSRt9fe0PmAnw7LT2yhPoDDegDsBZhCQQhB87qk3PtZWQVORxk2tLOzDeGj/jzgj
	QHnJxA4OUOaGEz9lgSFRMh2lgdZYsByfgpllFNlj8spCC+O30x595a6aXZqrTOti
	FJNPC2ZAegCZnHzcm8E90LmFcVugJ6XCLzyAuSQ4gIwaSzpu7WzeauNk/yByK8du
	o8Nd85KVbmoDhjeWY2J9SmxhglkmDhFz1jnlU+LAFkhP5tpEq40192vkGnr9kP0o
	vgFuvGFg3p8Tibs39uZ7YuO024Lp8PwTwCOaG5W2gVItbQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgm8xhsh3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 20:26:12 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f5844cb60so376959785a.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 13:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792873571; x=1793478371; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tD8TUcG4GR/qMQpgQaXa/j5++8tEfZOt1fk2tK6yt1o=;
        b=kH3O6UtdSQKmXhtvjc+zI3x4nWj9Akwxj7hw1WVhCoE+hhCyOWawMSNqGYDY6idKW4
         BY6VlFZpJkS8aR5lAluc8QCSwawSIWcbBZQugQY07Vq35HKfZWpj/G+RpYJlXaeHdp7J
         MIPbTswPTtnO5gUSNQKLQWXQbKthPN3c2LrdKncgGq85nkr9dpDC8scYEgMJ8WZ3X1Bg
         ua4Hs9/d//4kGGkgLDNM6EgYVtxi9koqYyi+iKPg8nsQxy9t9Ze30eiHRDJadXTH/1iT
         UNyTwBYt3TjRq/ELkM2lNRZI24Mq+gIy92ozaQMdUcWYNcLKDm3+/q30xUU4oGmvxiHg
         NdUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792873571; x=1793478371;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tD8TUcG4GR/qMQpgQaXa/j5++8tEfZOt1fk2tK6yt1o=;
        b=Zqq3Igd7S7UEPmX3f5rzjYM+jqu1wge07tARUrDi1B8UirZjrsjV77WsphO561Tvt9
         jB4g47z3d1wNe9pTVO98IThz9xzANOjN5wi5Z6zV0tKSwmZheyWZTQnxMGYKL8QU6PsR
         Ia2Fv3Tgx8f89TQdgL1Uz7Kre44cd91fQYw/p5awxHagFULnGqtuM5z8rWM26GCMzt52
         vh4//tFpDsUiWyUOG47DiIS4tATZwfKJ6q+jUWR5i0GZZmg89TBxbBpYJAdrzGmB00rF
         9yz4pxOzwH6Y+e/65Fpq6d25R829n8XnbdYmgoX5qnelPOiGsSENHdpl2LIJpXWIy09g
         6tfQ==
X-Forwarded-Encrypted: i=1; AKwUvBwPQT0f7YOzMOodedJ58VOoapTTGDov5Al01IhhuDEucvrWHdNQ2UOfJC4fw4AEOD+Hx07nT8mj3UEeOaU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIlxplVFehIoLSgBbiJag7Aq6QLkSbWCtka7sN7xb+F3JsL4Bxr
	KDaR5rnkNqEMz9oiZlmkdWF3mPeL7OevYEnl9/0gE43bN06J1ccPdeJNjuTFOUO+M9IWCx1kkKR
	V/koluezym8TCwc+sk7gR7jGJuT/POSAqOshYXG8Yw7BbCnlg7GEgmdP3VP3BvgqQn/w=
X-Gm-Gg: AYBFou3EATdnjhGzixJ7iNIbgg57rIfloS5B1OVmJk8YAcEnvdSBpgkJ0M0A3ejoTa7
	SwfxD4NSvf6e+tosmBEQLkG9AC1VRxkxgZEGDogMq0fn4eSG8wLkIhwMTBlv/I2LEY2DZrj5rLj
	M2ThKQr5oBfMA0LddkzqBETUcEkTnFGupFzg3vobyKefuP3/b7BraCtbXgKp+nXu1WC3J2npY8i
	JLeerIVT8DDkDW+ospi/gc6HwHRtJmb8w7YJRbUzW+MZvl331jDil+Nych92iOmprD/1nHAASBd
	vP8dblHlcGEYURXhB47ioshgHmsajBq2xBI0nGbFxfhgdL+fZFspmoEeuHkeweWz6bSRGFSG8Ck
	SXkK64tlzWn1NWVe6
X-Received: by 2002:a05:620a:261e:b0:93e:fcac:a91f with SMTP id af79cd13be357-940ef9d656bmr390597085a.37.1792873571410;
        Sat, 24 Oct 2026 13:26:11 -0700 (PDT)
X-Received: by 2002:a05:620a:261e:b0:93e:fcac:a91f with SMTP id af79cd13be357-940ef9d656bmr390594685a.37.1792873570855;
        Sat, 24 Oct 2026 13:26:10 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a06da5fsm50379965e9.3.2026.10.24.13.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 13:26:10 -0700 (PDT)
Date: Sat, 24 Oct 2026 23:26:08 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] arm64: dts: qcom: sm8650-hdk: add DisplayPort audio
 playback support
Message-ID: <5ijmn2ozihmobfliynovxqo3xiss4u7wdmt3tywdi3tybzdf6g@ta5ymqfkmvec>
References: <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-0-8a189c71938c@linaro.org>
 <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-4-8a189c71938c@linaro.org>
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
In-Reply-To: <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-4-8a189c71938c@linaro.org>
X-Proofpoint-GUID: gT0MIy1OeYevqjAqRQhRPsis39K6PPIx
X-Authority-Analysis: v=2.4 cv=Ra0FmFtv c=1 sm=1 tr=0 ts=6add1464 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=lwKPvcPLtPgdvEeQYCQA:9 a=CjuIK1q_8ugA:10
 a=3Q3lADbaBCgA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI0MDA4MSBTYWx0ZWRfX1e70kEtCkbNt
 5f0O6xK41GlAkYwjoSHl9Jn8q4ExMRpqmFfuvGLPnji7XteflcMydeQRPxGR7g4+gNAdBY0d+pQ
 8rhmzhaCZoYvFMT6b/z30TgfpZ7HVME=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI0MDA4MSBTYWx0ZWRfX/Lhba7ydJETr
 yB5JCrl4eNzWCSwQCo3uuOik9ZIW3/ekReAZl31Hekkmh98Tdv5EsazPopHkJTixS4IoRGKGTEK
 aDTIRUAhTmCcpKa5yuB7J+x9TT+puoSb/EJpuXW1KTtJMTpEe9tmhQgiVGj6ZyuDWNz2GooBoXL
 QehjyliEjc4/PgT55U3KFN0ZY4AmMC41NJmmkagLSFm+BI1O9hWGanMwDQ7Z1geVUpHc7H0KWmv
 K0o0UwBh1WudXca/ow3ZHTFbmQ7wma1OdqOCkxCgO93gdMuhmSXlypSyQkGTr24RzfRXS+UNXmu
 t4n6wMbrbU43u8mIHOHb+qTLOt+BdAVZRESCA+Jq62oAIWVVNafMFZeogGinJ6QdfamYvcVoBqv
 nRp57HDVnkiSeAMcglB1taoo1P+kmOhHZgWeoBjg7zHWFyA8y29S4qaJPzCHOfr0IDF1qzA2mus
 1ycU3SK0sZ/YYDqVswg==
X-Proofpoint-ORIG-GUID: gT0MIy1OeYevqjAqRQhRPsis39K6PPIx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-24_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610240081

On 26-10-22 11:36:24, Neil Armstrong wrote:
> Add the DAI link needed to enable audio playback over the
> DisplayPort altmode output.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
