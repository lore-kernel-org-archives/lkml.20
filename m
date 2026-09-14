Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 576823AB460
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789372011; cv=none; b=ongcACx+cesYTTqjI77MDJ68/N+FeCWK+uOmUSjKIMAsl6mHE1yoJdAw705qlhjtzuwZEeNoh0RVh87pLY/ga2JoJLXLZp0zhEAM/8nJtrA8t7NV8UW9urokxKU8nszEHDTRBqtxQMcmX7Lxgi7/lZGH7xBDjOJHebKC6qawW/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789372011; c=relaxed/simple;
	bh=fpyZ+wO5t6i+lqmqsTg8eqnqZWMjQOVGVNPTv1ziKP4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jk5y4QR3TKW/gkCCqadmsv654SIHtuuM3h9Mg6tOFUEj3zbJyywJyYU400VB61rZYtFVnGNSSixTxRNEv1SY8kUy30XYU38PSbi+y/OZXHmMEEqmO9+eLJLFTypdNyV5suKBnrEmXnYzmaOlfMFBvje6ppmcQUtXoEIcnjxj06E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KKl83eIz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Umq4Veof; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KKl83eIz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Umq4Veof"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5jHrU064030
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:46:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nwYpgflsInUUYK4VL8amNhk+
	D/quGcQ98duZ4xjrjTk=; b=KKl83eIzRltCkPZFiyYmI7YU1hfSgBdKpYEdtjza
	VtPwAm9lnBH74olln+D5xlWhg1toP7sqIO9RZDPRX7mcK3n8ddtqlFbIpTOXn/OL
	nNtQq8lNLZ0F3RYu9T7yZzofTvjJryR9bnWr7ktGEhsI1+6uhmev5yH1n6Er3ubL
	1YupiKTHf9SF0cQgiL8PLGyDGq5xerqj6EbjPy91EAxCzUtbSiM1UFDlT/j9qrmv
	cggbMAQOmFOkSJgaUNB1TF4p3APn0/KbBa6Ijq8yz8Gh2JtyRK/X1CI9F8/uxSji
	t+T3eqGF5mE06eo5oBnvW1swEydqI7WqXnHzNCTBbUtDAA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9dnmsq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:46:49 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93918756165so559954985a.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789372008; x=1789976808; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nwYpgflsInUUYK4VL8amNhk+D/quGcQ98duZ4xjrjTk=;
        b=Umq4VeofEIvphMOZbcn+jwAtxqasrXC8EmozPIkZXkQkqWasuQJGionIf3QOtP2jpf
         Ol37Lt1yg0RSIlxwCUKcyYBh4DxI96BpVtgTehikmJ5rwt5hjgjKyBwc77My4twx68Kk
         08u9lFxPr2GpM0ua1ijRk/sRecQYUWHpUWw7LFrdW7t6uyK89buz0qCSHgB/GHntAXd7
         0fd/IicjniA3QQMRLE6q3rvc7+wYpFPHJoXLF0btUQs5n8ruCDEP+zGqv0fUzxPU2NLr
         EuLQq2E4yU/1kDOES3INHbMSLCGHv1sBnJaEH/xTWLeq4sWx0j7gFaGzHyZx8XhQ9alO
         eaWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789372008; x=1789976808;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nwYpgflsInUUYK4VL8amNhk+D/quGcQ98duZ4xjrjTk=;
        b=r9YvnuwQ9FIVY7uqahEV26eL12oAOO0qvTyZQP5iH2wYFuYptq8K+zkcmy+DCuE8Tu
         fm42FsT7+sI2W55IjJXb1vW5JmMq6E2PpG27pDgX8XZ4S5FbmhAPIVKwHiqdDcQxiHih
         AObswxAZlQ8jCfe8Zmua/vpOl9dPSbwJquc0gFnXreYlJlzT9avCXtmyif8bIXRMVD6W
         ddnSppZjsqEP7qwA9bT+IO8MCtPrFRSJV8EaAnAPa9tXReqvNkLI/REx4eP3sjoheVlE
         kKCp5/c2XQJZ/97ehm+r9zb0hUt2VKRqN8Levxltdl6UtRHXxVrKbvAiagaq+7j2wdJD
         xqrg==
X-Forwarded-Encrypted: i=1; AKwUvBx0KQ0QjhinLFFb/dqQjnrRqLObD4xfrGKzPXsBMJsJYQhSURP7Kn5A2IyGw3qyJ5+FbXrVVtffpfbirgo=@vger.kernel.org
X-Gm-Message-State: AFuF++kOwPlv0Dp6a8XtsyDNlXaPEJ5kz3zF5WM4z1d39wOdRATSkzBa
	mFsykSEoCczg23q4Ionq5G0rEX4vNOE+/EN5pZVP9lyOKlmJeMb/fO0RbjXNFsk9kLDNCI54OGV
	AIh8f03BCl+66Goak9hlQ9Eml35b9usYLNqjhvk8L15+Kaiukh/ER8fkf+UDnGwXvPsI=
X-Gm-Gg: AYBFou3ct5ooKzFMngPbYsrCmgsBNd91c3OqelAwYGlwUdup5sN3qCMM7tHTPnycyEl
	ykg5ubXuil5hQaW6AvIG26R/ibqqo0bNmO8kXMrFL4gLYZzuS0KSBZinbb++5D+hpQ8QFkuT5c1
	0Xbv8SKQty2w0yZKAqncq9C6g1R2i3HsyUrr6RgWJr79+jvCn8YlJuozzCq9GHpKsVhPsRrDUA3
	qBM/+RxDOG5WKmPLUXeHfN008aCpAp/qE5jbXLjPmJhGW0Jis3wyEH8cYTYwZ8rvVHuk6uK60eM
	R+W2zP2j5B56X7IUTmcJD590N6gDp/vuyoIJjeTAcKhzIXQyAjzPI6b5375Y6x9MyWbYBN0bUJT
	2UXRF1u94udS29A==
X-Received: by 2002:a05:620a:170b:b0:939:d38:3ab8 with SMTP id af79cd13be357-93a297e8fadmr185030885a.12.1789372008588;
        Mon, 14 Sep 2026 00:46:48 -0700 (PDT)
X-Received: by 2002:a05:620a:170b:b0:939:d38:3ab8 with SMTP id af79cd13be357-93a297e8fadmr185028285a.12.1789372008058;
        Mon, 14 Sep 2026 00:46:48 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26be3e0asm429923155e9.1.2026.09.14.00.46.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:46:47 -0700 (PDT)
Date: Mon, 14 Sep 2026 10:46:45 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 2/2] interconnect: qcom: Add missing depends to Hawi,
 Maili, Nord and Shikra
Message-ID: <4kwnvr6azz2hvnel4ti5epqd7tyj6lzxgbkqobltdthdpmxkym@k6cymd6tah2u>
References: <20260914-interconnect-qcom-clean-arm64-v4-0-5b2c0e6a929a@oss.qualcomm.com>
 <20260914-interconnect-qcom-clean-arm64-v4-2-5b2c0e6a929a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-interconnect-qcom-clean-arm64-v4-2-5b2c0e6a929a@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEwOSBTYWx0ZWRfXzh6e9p4N33bo
 NkQ58mg2WpEf8JK4vbw8yZ5+k+BL/B4R+qQ79pvX33RerQZr74W4ui5fCJKFEYLdgOXC9ObJa25
 9yF13oM31rl8wmU7/MXO/1MomT0OS46oQ3xGn24Can/ebUickmJXqgo8Abvi6WIn2RgH0bgixpq
 Tt/IETXPAenwllPdBn+APndRaymEdYlH086HVTFjsO8VhEoJJUWokmzqTNqWx5ml2WfhUVFUsdK
 66kFQ2FBl/BEBlicNQjWXkX2nPXPGqQUTqzabh/O8j6gfpzwFGFyxCBGeDevhhiulxrpgXw/Mvm
 MDzQiDz7YXiCnj7++6+1Ds2B6QpKebGIx8FYeoo9rSLizgoAdLpahh87RnWwRHyQCREpOnrN4r9
 2gw+MOOdOKf8aVO40IyIOHBS5jXZK6RJD0dSdYbRsBkn91rmwiR3KisYPvu2L3wgzPgQODmagVi
 MGim1AAqTwn4jLDvxwQ==
X-Proofpoint-ORIG-GUID: nvhLwsA81XcWwy_x0GWgvQeFQ8dp6Y3q
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEwOSBTYWx0ZWRfX36ALWApPCnPy
 13bi3qmNc+5modbnm8JdRjeOcXMeO0eR9dyD4epQxBYXLjjVoy3AAeTXTnyB8UCeb4eBpYBRCqW
 /QJHi9aCiSQmLfG92uVNsmQcCOlVvgQ=
X-Authority-Analysis: v=2.4 cv=Y6htIReN c=1 sm=1 tr=0 ts=6aa7a669 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=bOu3b-dmFffoK3qT8M0A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: nvhLwsA81XcWwy_x0GWgvQeFQ8dp6Y3q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 impostorscore=0
 bulkscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140109

On 26-09-14 08:44:05, Krzysztof Kozlowski wrote:
> Hawi, Maili, Nord and Shikra were added in parallel or after
> commit 5b696f065843 ("interconnect: qcom: Restrict drivers per
> ARM/ARM64"), thus they missed the update restricting them per
> architecture (with the same rationale).
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
