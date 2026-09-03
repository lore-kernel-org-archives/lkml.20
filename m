Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 529E630E83F
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 03:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788405066; cv=none; b=MZ8t18eZSehakKI/BtsYjz+lyLFa4h/3luY7td1xa5N95+VUrFeMK3NW35q+av4AbYmZIZRcwpos0QPQsgFSxeMwF/jWjo6PcYIyKq18uw/6uFz1go2V114ItDYLS2qTqEfaBRS8sQr09UXfuG6TEYO5AvFO+y/wD+xeHA4zYKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788405066; c=relaxed/simple;
	bh=cTj9gp6hyNG5Z8+4bW77RkA7XAaluHHQB/zBA6orByA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ghA4NOAoV6tSqxa0r2jfA2gQpGW2yWzJWf47hIoBiMHsm3hmSef1Ljp5g4HcjmD4pr9J1RxtebcZyYQ8n992u+4iFWrSXO0CC9LE3btOT7iWItaj2ZDWMlNMOoOrue3Xj9rpxa2z7yfzzEKKIiBxabdscAfmGBFmkcHGmOYejYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JD2wPoxS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DhM8wTPM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JD2wPoxS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DhM8wTPM"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6832xtW03275627
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 03:11:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=koCBTLe9Ly+T/r6rPbnY4S1G
	//XZlkZiOKX9UC2GtLM=; b=JD2wPoxSFYA9seI/ne+7tUi3VZjiOjxBpCXvBMb2
	5nWdoLtKAv+wRZQWCJTJ3Sxdmz5Nr8qLj8Hqvx/RjkGnANSnmfnXmdXhJDIJrmpF
	OCneV08FUlnZIpI5YbtxIoQvj90YAiaikJVc+eE4Uthw8hMQ/F0dGhGbVWI9Jfcn
	OfUohu4EaGXDze9RIjrylo/HjjSeQSKzl42BqPFTsaqZTi0Ns5b4C1Q11hIcwvQ4
	pWn8Ov2ud0gL8GQKnPAlCxdNymI54nZOm2ZNCQuDPaFTmRwGIDYPuzgEO/RvZPTV
	QTacsv2tnvsWMAta+yq7R87jl497TtU/YQI449nIZ0tL6w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4genrdtucw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 03:11:04 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d54187d8b0so49448915ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 20:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788405063; x=1789009863; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=koCBTLe9Ly+T/r6rPbnY4S1G//XZlkZiOKX9UC2GtLM=;
        b=DhM8wTPM4+QlVXQo1U/RrE/5SsOacc+/ICw1fNn0igsNMdBR3HZYpCO7+S7Q8xpVig
         zXE65gW7qZt6SlrWWaZbXrFTp1Gx3rQw72YYbC9NRYquGvGi1aVOViONdT5I9LTDsDCQ
         01uk78UJ0av73r7uf83Y9D4esSb1NsNkk69wDTvgKi1Q/ra45AfeT5sJONAFxO7lyyKv
         6jv8rVKm99W2LTbzsqfIMq1ynILXis2aLl7OHoQJn/H6+9H5zjatHmFXvcYSkuNlw+Xl
         NmfECqQ9FEInSIhHT4y+eUfwFlFSCpt5fv+0/rMW9gpJubohKKkqmk6P9JF+J6dUjeBk
         zWsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788405063; x=1789009863;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=koCBTLe9Ly+T/r6rPbnY4S1G//XZlkZiOKX9UC2GtLM=;
        b=LPNZy4D3tKqOLdhQuNlNPHY7NV65G3/0k4Tztdhye+2r2VC87GceZm8Fo7s/zQ3DDV
         8cghTojYB+sznCAZaDnA639YoZ6M+qXsU5PZ8jmzu8oympZzBhRsfJR9ZRklPCVlgr46
         1P8i8QP5UtuHpOYRvSqhNH4N1JOnHE66Th+Aaslcu60O5cH4HSlTQUCfi4ctXxuJvDVX
         r4nE6pYZhsgTAd63gg4WhPhdInHEwWCC1KtvEYc4DpqbZ/xU6NoVtPP9TMO1Q6qxuiE2
         Lcq/PRIrs6UOHwD1I6ekaWlEKpFej2sdsk8Vl/xuv2NqBOPs+Q94aN9btvSr9dOriqQw
         VXRg==
X-Forwarded-Encrypted: i=1; AKwUvBzfIlaxxrkKbAv+eZu30WAMgKy+7FzpHqEDvWkHU6BtTxmByCKl5j/gsqRziusuOjdZOKWlF2+ycIzAll4=@vger.kernel.org
X-Gm-Message-State: AFuF++mBHB+B/ZTsMlqVmkPhJ16gMa4mhkwe1CYZgCqrUm4zhGbDoJyl
	29/X0Q007vIgdiK9XBFK9tWgTnk6HX/PNChFLHqccXyrDlamvtHKWJbgZw+w3LjRdpLYuZtxiYY
	k+l0O9xUUHupZtN85bNuSIe+Eag72+haNPOq4Psx8dGLqsnr/99Rtcro5iSjlym3N60w=
X-Gm-Gg: AYBFou1XW7kgOdu4F6mwTKVsKRjbup2mQZUx7qJg4Pq8xMpGWFBJh2iAUqUEnlvdyi+
	BXXhO+c34p3vNxkImnb9kcKSyb2oWjEal1VrzbCQFayvU8YJWUfpnIzPn/I2L2mKWFj02fZrsoX
	mHA4l6QVPgtv+95ietvleLSHp7roCbKSBicJPjHCo3aPrlpbqP12KHp+VPKlxofPd65CSJUcmEQ
	ZhFjfPSmD4k1VJgcX2BTm7EpDUtpEgQZB/az2Tro5Ea1eFQ83cCi6YJyzQph7XLEejOWzz/lj1h
	bq9HkxbXCpbgFfo2D1HspiSGmYrMKdsYc7bi01GZNVkZDtl1SPd/aCWggnW1ZB8nyYcuvzI+LqD
	hT3AiVDONd8h89t8j8nlreuIeO/UeuSZN6kqdeY1BjM0=
X-Received: by 2002:a17:90b:2cc8:b0:396:6344:3b63 with SMTP id 98e67ed59e1d1-39aedf8b4f9mr15164413a91.2.1788405063131;
        Wed, 02 Sep 2026 20:11:03 -0700 (PDT)
X-Received: by 2002:a17:90b:2cc8:b0:396:6344:3b63 with SMTP id 98e67ed59e1d1-39aedf8b4f9mr15164357a91.2.1788405062728;
        Wed, 02 Sep 2026 20:11:02 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3325592da63sm2088759eec.13.2026.09.02.20.10.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 20:11:02 -0700 (PDT)
Date: Thu, 3 Sep 2026 11:10:56 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH 5/6] dt-bindings: arm: qcom: Document Nord Ride Embedded
 board
Message-ID: <apjlQBKj2TgOlBvq@QCOM-aGQu4IUr3Y>
References: <20260831032103.341633-1-shengchao.guo@oss.qualcomm.com>
 <20260831032103.341633-6-shengchao.guo@oss.qualcomm.com>
 <20260901-proud-innocent-macaque-7c52ce@quoll>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901-proud-innocent-macaque-7c52ce@quoll>
X-Authority-Analysis: v=2.4 cv=H4/rBeYi c=1 sm=1 tr=0 ts=6a98e548 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=_WDQo8kc_inshQGevKgA:9 a=CjuIK1q_8ugA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: aBN0_KE4TMXXjh-5lLsAywZ1qJrW_yan
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDAyNiBTYWx0ZWRfX7iJkzhXuGSW2
 IZxN0Xp6r60JLbTBRnpks3xQeYKAqlMRQrRXEKTHOxOl8/5Fl7MmsaZmuxf46e6g/QjZdvmCjp3
 pmv656Nnn2yjyKi72uXmxRnfBqfxClGtq3KY3mq07pTkRhKOhJaQ5tF5D67J9+aINf1IFdEiRHE
 wr+IAABxtu5PW7IZtkGL6rV1yxngC6Db6dtOWOjE9B0pB+8A9xEd8XQEPgOz7QJgTiaEsQbUKuD
 xlRFoPgyQuUBG99Rn94Su6VuA+tLyUpUVumg+oIk+2+RMpwnUCdJA7fkgW0ZpoNk9tPdglSStS+
 givKl/JAB361dP/AGFauVch9x4GHKm9nEQiCFlu3c/3BavzuH4X3w7zZ/bGiUmFiVb3SI4gkIA/
 KCpudsyhoxa73EUaE2wkk8Lcr/YP1GjGElV8XlVLsrAMhcPjIcyDJw1ewpMMLx7BtkmUj7IIvu+
 g30/26I/FN+yXsvUWCw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDAyNiBTYWx0ZWRfX6qZX1Dsx7taL
 EchJKalzafgVc8h2/c1BFHpp5q4n1znRaQWzOKpp3tYI8JSON3LbFHXBTTF5hrN5GWxYM64MAq7
 Yw2BuJnyXaZAJR5lULUHwXsZ4TgEn4g=
X-Proofpoint-ORIG-GUID: aBN0_KE4TMXXjh-5lLsAywZ1qJrW_yan
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_01,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030026

On Tue, Sep 01, 2026 at 10:31:30AM +0200, Krzysztof Kozlowski wrote:
> On Mon, Aug 31, 2026 at 11:21:02AM +0800, Shawn Guo wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> > 
> > Add qcom,sa8797p-ride-embedded to the list of compatibles for boards
> 
> "Document foo bar, embedded variant ..."
> No need to repeat the exact diff contents in the commit msg.

Sure! Will update.

> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Thanks Krzysztof!

Shawn
