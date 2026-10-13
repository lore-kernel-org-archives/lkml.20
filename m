Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3B7F481FB7
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791888013; cv=none; b=YaGfa/B4vTPRd3zcdZy+lGzqE25Zul/BYJhy4MBQOtFki4nq/mNvqaXYaW/jRfoXcOpCEQve2kgs+9BpDTayRBZUhycxorEjyjiTi2BLAQCquxIB/a0lcQJ3zYj6paS2zauntFdJJxwV4nDyn1DfOXdy8gUKpP1/zEtg+0ajZB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791888013; c=relaxed/simple;
	bh=p8JT08q8v1DQwSLRGMqk0Y5KS/u+5aBPxRuypVILJkY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VHgVAl9BFXIsJYIfBYmzNvahv2S569XoSIkdOq0n/lb7kN/x1IwhveYHRdikiry0zls4N4MOjvRTpKI6Ndgibag8+fzk4VlmPDAaHoEQZiqWv2R8bH9LBsz7Ra/WxeqzBGeFnPHE0JdXV1JUkH8mRBYrt6GQLPmhVEvKybcZRBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bHcCEgn4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S/85ZwT0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bHcCEgn4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S/85ZwT0"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8Lvdh3907375
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:40:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6xDIx4Wl7ppJWbdjXs0UgIx3KwRe7VSEGs56ZDEik8Q=; b=bHcCEgn41ErgxjsY
	mX/541/2ClWBwzDX4zmhncET9n6nW3romz6HzQ9LvwkCj8TRuDP7CEM87ldVdJIg
	bmQiHSPnvtm1ZP1krt1uMt3N43xyhS2tIJivqYB/EXCK30UbtTiiIhfi2gsEgaWR
	2lsq5KmZ+Je2l5pWG1P9hc//yH23Yc7MprvlOuGgu58kyIAQuHKsJrAwN69hyc64
	GnOg1TAU2+3/rxasMhtNFNhTZ5+L1dh9yxxz2ry3To6hIAJuW+2ZyPHSwgcrir1C
	M54ngmOIwPqwPbmZMj1r52vBZ0PtdcBywUr9vCeyqu7FY1roRplZj+/5qyB0gr7k
	oQ4dNg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h95xqu3km-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:40:10 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cc50fb0d2so48657985a.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 03:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791888010; x=1792492810; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6xDIx4Wl7ppJWbdjXs0UgIx3KwRe7VSEGs56ZDEik8Q=;
        b=S/85ZwT04vEdiKXhnTH3Mxqb7RSauPoohGDzNpkJ4Dl+sktwzpayA/ha4nk7ZSnLdr
         JEz4cohGYu28viXNL7QvQwErpv5JgN1Xgv9mhXqXRBw/tXcW4wA4TwhYyIDCjikI7xVw
         BTrb+waMm+oPD/9XrlvZ2nG6Ydpn14mybv9aizLTFUZKtNes0+pJnDe+fqfvtXGAqzSF
         6bIPVVxbcvEtQULW1nTDaU4u7tWE3Rt6kFXS95dwgckxpqujxehiqT8QdbIFZNCkHGOK
         12ne7B3+fzT9zu9fsXoTPES5uKdezQxE9tM8+3e6i0fYzzoI8AXspvCFTEi6apyJGR5w
         v3iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791888010; x=1792492810;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6xDIx4Wl7ppJWbdjXs0UgIx3KwRe7VSEGs56ZDEik8Q=;
        b=fKPxmlAjBA1IRYTs79fWIJou96pbpAQnjors3+PF94b6d3tQACv3DTe5pE0e5xpHTF
         R8gKO8sF5LRgHDEyCNYwxdeIhuTocgDftPPmEaaw4DzPMeYq/hCoU8TWyklI4+I3Xroc
         e3bzS9r7NrYXA35iF9YbVZJp8y4hNjBKOQJqaOvKoYbaIG2Zokub26fhDLIYpdS5xEfg
         JMolidfw0GdABhnt6AVAQ+T4O07D8ZcoUdYl5nyeuFZA8a6kYafB6aNdK6Sw762Hza2y
         VpzNymppevTyYKEDTfcPY32462f8iMJO0TIRxiR2p5qoXGrZ8aMOo3Gpu8rDYj8Gj1Ky
         HtaQ==
X-Forwarded-Encrypted: i=1; AKwUvBzrCySE9H/HCaB1rFbdEn+6Sck4uLo/0A/2xAuOZm8lcrialYwhSbKlykPllHtL9u9whTna3qGRVKhaNB8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLyHC3Tg+DDqWi4Z2UZkrFksWYYM2w9WVWI4rw/KZHPMGCnDfdb
	VIWUUJciz5AQphUDdpIE6k5yO0p4HLs3Rau8ej+ZMs6/pQoutZn1ar+Z10DeGaJauJaX/5Txqhe
	45Sj5/ct9AXtvpb2Kf/ecEGtGYvfyoAeE+K6zxr91DCx7FKdDe6VDkdN5cP0/nKZyDGo=
X-Gm-Gg: AYBFou2lT7/1mKWSzi7v45zn0WNCQbA9JYMKuGCQ2kV3nKJb3wJATU8z/ws/6DnKKmK
	uGLXu/Ug003I7hlUWRHl7LB63InQFsaqiKHgLAfRQLDFPouOmvOkerDUpdQ5CYjgNRRzqCPrn1l
	9GtDxGGurGyWW/Y5TamBnbF6GvIHFe2bW1CL4YdXIV8y9dgtCLhWvIPMyOYz97PwnQehxw69LtP
	k45OiPSXYilVrHGln+HO1Twpb1+VLPr8QLbN31mPfQ5tiYhfZ6b+uv3In1lmnneya7/uVDlIqwc
	Hwo0a9xg4d2YdgPHh9bSG5LHXQERa+tf0Kg3QhFIL2zJrGFYaqsbZBdaP2LWwd9ospVPJQJvtYR
	841cCDhYIkeDgwzGThQe/6A==
X-Received: by 2002:a05:620a:269a:b0:93a:14c:329c with SMTP id af79cd13be357-93ebd0c2693mr2289147785a.1.1791888010007;
        Tue, 13 Oct 2026 03:40:10 -0700 (PDT)
X-Received: by 2002:a05:620a:269a:b0:93a:14c:329c with SMTP id af79cd13be357-93ebd0c2693mr2289141485a.1.1791888009168;
        Tue, 13 Oct 2026 03:40:09 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31b8c4b407sm522786766b.0.2026.10.13.03.40.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 03:40:08 -0700 (PDT)
Message-ID: <e8689aae-db6f-41ec-8584-f2d8f105eace@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 12:40:05 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/6] clk: qcom: negcc-nord: keep GPU2 CFG clock enabled
 via critical CBCR
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Alexandre Mergnat <amergnat@baylibre.com>
References: <20260724-nords_mm_v1-v3-0-32b45232217f@oss.qualcomm.com>
 <20260724-nords_mm_v1-v3-2-32b45232217f@oss.qualcomm.com>
 <as2gyLK95eXM0WgM@QCOM-aGQu4IUr3Y> <as3_5EFx01FaNFmJ@QCOM-aGQu4IUr3Y>
 <oqi2xquf7w5qahh5ufeecmkpy2qhfenu6v33t3vbz43nsph2q5@cseg4p3vlnyh>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <oqi2xquf7w5qahh5ufeecmkpy2qhfenu6v33t3vbz43nsph2q5@cseg4p3vlnyh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0MiBTYWx0ZWRfX88mpHEJmxV+b
 454GYlPtB1OprK8pzOdu2+439vGBJS6ZcGMs4Tc1bzVml1dUoBzk/yqDlEdfgmorfLygzqmyQdI
 oFuR41av8aS1xpc7Atv+TKvJqIus9TDN8ECy8TkxKdew20zBjJnCvIGTKdOzLV/jz8e3zpZnTEb
 z06itVk94LoMWXi8l1YZztL2siyGsz3FecEcf8kK7BEnOj/GFxwuZBO7keRXzfMMYNiu7r7q3Rg
 9VLsumoFbB+vdHoN8jxIBUXRC/ZxG3oc29LSwduxgJtfqwXm7dcRMqZAZnSoa3mZyGghKazzz+I
 ET6Tfse+NwP9CZ+Z0UJ5VGekhgsnlGWeqXfkGKsBBbJqIiNIYV3kJKpuRBlvuJHiR3MCxXo3PF8
 3WEU+psk73aQNUUIBdiHixUJaZy2OfzNh2eFVVd8JrVQoU8BuM59xVtVavUYRzmGwDp/f8hWFSV
 ZHAQASQc+1B92JIvwjg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0MiBTYWx0ZWRfXzs7DnrcrPrE7
 UBfv5bov99FC/cSBomrn39xGsYFXxAac01CQNTxOF+gSxjMzOs0M0BwYhTUByp5WcPFYAWuXZsr
 2z5IEt8CoQ1pFQLJufKS7mtPAUn1ef0=
X-Proofpoint-ORIG-GUID: Z3gZ7XEQ6h-CcuoKuG84VLce3k_0jEmn
X-Authority-Analysis: v=2.4 cv=EP+TQFZC c=1 sm=1 tr=0 ts=6ace0a8a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=GumQ9EM2AAAA:8 a=2Dd11suIDkSi0JYY73kA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: Z3gZ7XEQ6h-CcuoKuG84VLce3k_0jEmn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130042

On 10/13/26 12:36 PM, Dmitry Baryshkov wrote:
> On Tue, Oct 13, 2026 at 05:54:44PM +0800, Shawn Guo wrote:
>> On Tue, Oct 13, 2026 at 11:08:56AM +0800, Shawn Guo wrote:
>>> On Fri, Jul 24, 2026 at 04:25:06PM +0530, Taniya Das wrote:
>>>> The GPU2 CFG clock must remain enabled for correct operation and
>>>> should not be exposed as a controllable clk_branch.
>>>
>>> Hi Taniya,
>>>
>>> Could you share a bit more information why this is the case? I do not
>>> seem to get any problem when testing without this change.
>>
>> Never mind! I can see the issue it fixes now.
> 
> Would be nice to capture it in the commit message.

https://imgs.xkcd.com/comics/wisdom_of_the_ancients.png

Konrad
