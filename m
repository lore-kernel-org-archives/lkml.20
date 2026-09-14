Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A91DB3750CC
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789371639; cv=none; b=UQBlrmHQparq9MYMhTHXNvHhzaEvHUtizh+SqyL7MoDvLsveGfFbibWLoWmy4AE5btxacEpB1eA++hl9/HwbvMifNHRC6fCOm5a0QvNc3YMnBesPkG8FvlbndnlMRlL23FmaFJr1bG12TEHxAlCknBVNQvbAUEYpP1hq7eo0lwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789371639; c=relaxed/simple;
	bh=7D1WrDaOXw3jEwbtz6iaTiJ0Ik7U81oE17WafVAW2yg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j1G1EEo5KfvKXdUwHCnPUNx7y4qsj6iCcIgX/yhGD0d4dhzQMutHRDI6RuZ74OxRHr3/vIKcEzcRFR6vJ7HlD3nqleOwicBdNvtItw3kvAHL2FW5BJvkA+oQQJWLWfREsrGK4BQOe1YC8gN80Zs9UaNl41heoo2PrfvYwc2bS54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WBdy/+Q/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QhnlK6Xy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WBdy/+Q/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QhnlK6Xy"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5j9K7063786
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:40:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+MmYma9ipaJNApTwltViswWE
	v0iN2F3QjUMkSNVw71w=; b=WBdy/+Q/q0vdN9eewwBB5t9+2NZ37YLDTW5vL+fG
	pRODQtAmweFTGF2QIHVYwSJBRUu6gH+rnmLteHJbOsHmQNNbP7UtXFlhgYloXSZA
	4RNnihwXWLzlcpALjb39GZNuiHSnXyqZepB+5qwZZKURCN74ppNVbQyiuPuQSGsP
	gOJKQFSOA2fpS5GSrXahymmFnYvvRbiU1NbJB/7xf7f47h3S+3Y5BfVfp2Gt4PNg
	sBQLzx0hlsQpWzAhVLovKXr94rimfjUvmt0b8yLOmCHYEUK6xID+dGWTulBOEWOa
	lTXE03Q3HTeAlhgfhOpNOig79r1CN/DuyBYd6OxoeVTzxA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9dnm4x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:40:36 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-90e8dd8be81so38321786d6.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789371636; x=1789976436; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+MmYma9ipaJNApTwltViswWEv0iN2F3QjUMkSNVw71w=;
        b=QhnlK6XyH0ZPUcUbKCxRbLPmbrJ1HIaAwDrq5aNDp5XrrTtLmF61VbB+IoAsN/ggpi
         NEPMqxy2lLHqm86u4hWAkECQ38iqHiqDmSPX94m8/ZVhGteSfSm9dAq9dNgY0igyZh1p
         YI0T6Je24f7IZ8FGnyqfJCDZhGBCHt2gP8unDR0+l6hPJGkt7KfM9seZBUX+WA9MR9f6
         GjhL73ABbj6DYJGBS7MpwSo1vqlxKGEnrSzJbEonX8O1RTZ9Gu/xqtJ4J2HbwwrzJXRx
         4PEjb7lN6Soe0BZWx8+5TgAmr3OZNUH0CxOi2uURtyY01RzNd+fqMGG4ZOwEDhaml251
         j4AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789371636; x=1789976436;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+MmYma9ipaJNApTwltViswWEv0iN2F3QjUMkSNVw71w=;
        b=Q/5SRavFvfqpeT+g40ho+lIne4XLNdOM28Oa4XIwjrzbGoDjTdyySuuyCZspISmpIb
         +hLCuF2UTIXZ/IL/XXr5bsieJzd/0Le+S2lZEV/x7oztvFP+bQdEr+68AdRrar7YI6H6
         ctlxYJIRHvpdbEgVHqMEmvuDq4VpdW7z0D6SgBwrf4kvEetbDwCzEs7j4zzucchJQbIu
         bfehU/Xs/gT73yMwO73PIT2tkBEjiN/pfmeMWoL4WkgJZ/UUMHW5sorHUE07dlOly+L3
         GmGgfBlf5CE8uqe5e4zXKq43cN9OySVNHjsHRkwebsdEV9nUsRPmRpYbFAXeN5RMyF3I
         V//Q==
X-Forwarded-Encrypted: i=1; AKwUvBy6n3WDR/jVTl7xXhJh8gZYPvtUtk5xxzzWt+kgYxEv+z8NJ9rPmYJnw6YGfnGjrcnPYEajbydflAZ8i5Y=@vger.kernel.org
X-Gm-Message-State: AFuF++liTiWD42+6wTvvyQLZbTHL3b1GKP5Tw+wOXkFjps+VVTkEgf2z
	bptTNok51zRv8OlXi33cnITZvlvMCY1Uzcw13Y1ESjm9q5YTHFmLoHN3sJuatXtYqMGD5aE0gwn
	BmBxExad+TBD5ku7F0BJvpGmmW9HGQPbOL7IFBSzxRGyi2SzhVbQ+qbrO6yHasG6w0Eo=
X-Gm-Gg: AYBFou34BINBnICOW4WvUToMoFTRXExiE+DiDoIRhvwLQ4Ev9K8tqrI0mgJit9oARcj
	r72TI/ELQ0suMk0QrWiikjuz0fzfxrj7XYyKmTaae6VfU3r4vZlLqkzOsj6fq9DcZgfG8mKPg6b
	YcYvKWyFYhcsZVD7FNDuamLXD6+PHInc+BfKK6oK/lLbHi0DSfxC7wXYJ11Sa1XDQSSIvEXSmds
	FDWLIEEQ76GLmwURjZIlH9x3ryU9u3CHebA3GvcZgRpZzQzth44DtJqJFzsnZQQUiK/a+ckVlTI
	twG7HDgoyID6UlemdBzO/QH5/f12IcVuhzV1Ux9Nr3vlO5mTHmEfFVjV8WbVbk5ghu7XwwQv3k7
	/vwk+DT+/kSQv/Q==
X-Received: by 2002:a05:620a:6018:b0:939:6df9:f991 with SMTP id af79cd13be357-93a29c360e7mr165549485a.52.1789371635957;
        Mon, 14 Sep 2026 00:40:35 -0700 (PDT)
X-Received: by 2002:a05:620a:6018:b0:939:6df9:f991 with SMTP id af79cd13be357-93a29c360e7mr165545685a.52.1789371635437;
        Mon, 14 Sep 2026 00:40:35 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb34f353sm23982368f8f.26.2026.09.14.00.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:40:34 -0700 (PDT)
Date: Mon, 14 Sep 2026 10:40:32 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 19/31] arm64: dts: qcom: eliza: Add domain idle state
 names
Message-ID: <h3grscehc53f3rvw73jbvnpwbc2m6fhr7xqrexsrrd3t7yphpu@vq6gu73yqiom>
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-19-660c31187819@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-b4-idle-state-name-v1-19-660c31187819@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEwOCBTYWx0ZWRfXw8Zqyc7IzP7q
 MspDHXJLUlFbpg9w+/ulVr22D6XJxsxDSW55oTE9+c/lau2KztvrglX9sFHD7Y2A99W9sjARRoc
 y6aJ3R0VlvP+wjXM7INJt7bCwnIIC8I/vMYnE9cYFqn/e9ZTwO24K6w03lOHpSljCB+drXpKnTl
 Sa/lLWBRknYCS+9vh25c6HdujAEEMtkk1aywMWGqCHPrhHhzl/WoljVvYwLMsTjDkLev5j8zWpU
 PCZuqF9K3tPROfiIs9xDv1InHUOf3JLztmTOiKAT19RmXgwJkqvcE3WvI23PIujS3SkR0KTIW7t
 u0IMrbH14q1uZtjBAH9EIprp6oD/xJ9DMC69ZMoF1Z/k68nK5xEUzJX+vXIrrirN081LMrmDHW6
 316VVDMEQei2mYLCZcuN+6qtfY16RsX0CJYLldlSmt7J5DLzagQAXuZaMC4BCykUqVq9dkQoj3c
 QQuSm0Yk7a2nm7aFbmQ==
X-Proofpoint-ORIG-GUID: ZRJCnviya39m9r9AqBJcCVLGxATZTyuw
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEwOCBTYWx0ZWRfX3E4sbjQ40cLz
 WdWd2miCI+ysw378/79VQiZTSXe1fE62bFHYYh8SuNr4kcn3/UMsNs4tfUbemLziI/AfRugbMlD
 YzrtGSUMhQTBSSfCXUWJWPBFWn5PwFk=
X-Authority-Analysis: v=2.4 cv=Y6htIReN c=1 sm=1 tr=0 ts=6aa7a4f4 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=HAnpKfeiUU4SruykqnYA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: ZRJCnviya39m9r9AqBJcCVLGxATZTyuw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 impostorscore=0
 bulkscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140108

On 26-09-14 12:29:51, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> While at it, update CPU idle state names to match the low power modes
> they describe.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
