Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792601690;
	b=qJNDy1KVZhoTE2KGq2gkLW0V28r30quhuH+x/hmABvHW+H366h0UzUz58Xtno0PzuoSt
	 qTv9S6by3rrQFKdhlwScpS+UlroyqdGM0JaYtBDulX8nsUA/QLvhozVTaprKfJLWVOOEA
	 gZE0C3+XMEW36QazbFMJ8gBSIAohaUjiSShV0Q2NFwnsKJ+dJ8XHBSiTT/xCfrcdNxoWB
	 u5mbMjydqPUGnvC5GADHSwYC5+txF7s9eHthJxtMAz1KX77ufj3kMQtT0GWlkupGBh3Uv
	 Yvj4d8m++i4vkJLG0g0B06lUr7uHH/CaTO5Fa7lCbLiBaUG22yZ/uWqK3IuImjTKp1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792601690;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jW94fUrEEV4vE96KzZHOt/ckZsK/1E1HYZRarmoNLtw=;
	b=UkxkUjSq+mPPreT+ZoyFR7cUZc7NFw4v0HOs8q8EhuFEMZLZ2fyabta7hz26ncUXSAOf
	 ei4DyYv4G5T1H9TgM4Q/J0TeNzPZXDU+rzKoXYLXL3G8UU7zIr0BWkslCr+tZ/wwrk6Xq
	 ZQbYZDgOUS215B3hfUrubDdant3eK1JzrmjEB07+fdfVQKoCIMSice02lwzyFOmOkRopi
	 lzSkOY1Mc0Xamuyv3Mycqax0zGZuiOsBcaxpF5cpi84ambJVDLRF5B54C/8u3lhGYKJnj
	 +8ZO4SlYzjqrkaI+8Sj/6xqjAdgX0hwSunkI2jr+KTKB63J20hrnvM1tYkr+40GPkWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Nb5Sjr7f;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L9LncZzT;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28910606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 16:54:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28910606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Nb5Sjr7f;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L9LncZzT
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LG4CEp2149280
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 16:54:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jW94fUrEEV4vE96KzZHOt/ck
	ZsK/1E1HYZRarmoNLtw=; b=Nb5Sjr7fQsdtlMvWGadhbbx3FfICmiY3qZWMQ1LR
	rPC6Nx0aPLTss4+KcMfC18xcR27AjWgk02LiIJzH/fJrNqHSEsfL82yBDe2k4t5l
	Y+wO/oUPaiQiAM1Wd/tU9F9NcwO1iTrOva8UJGlyUPIIqcZnLJIc3vdTBumNBFk+
	IyTrLskYn+Uh+yKv27V+235pxslX3uLVkBB3AQoY6NLW0WLzFMKmzQyOSdR+XLDV
	BOPF0foGU9/rfSc1TkeBaWUx/LjUeMHBZB7PRM0or3Ker6wvujp+z6hYDwLnWeaQ
	X0cUfmdQyhAl9t3WQGG3iDbF72jkEUWbihRHNZ6r5kkr4A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf0ke084w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 16:54:49 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cb71b1443so193197685a.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792601688; x=1793206488; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jW94fUrEEV4vE96KzZHOt/ckZsK/1E1HYZRarmoNLtw=;
        b=L9LncZzT6NA68yXFmbG3QtWg8G7dbfTxZT8nhdjnRUeSqSmCcUkLqQS8g1sMZ1ATS0
         nBFc4auF4YORLBoomGt1unfu1m3rOdD1f7xLlWpN1x6nG393P3JTmx+M5xU2ZIFdq9F2
         OfwG5gun2frbrIm9CxfUKtoguJq3NAZ7TM28YeUzh/gBX5qA4WovBjM2GViDgNb67uN+
         tcw/beAuZ7QuR1hF9A54sDv2SaTOYiqPn3j1bp+iMXv8ZUs/xP9lNkBCO+pLezqmZNo/
         HW6gd1BeoXur1oQx+qXDPDDLDgGw64EftZMHfLCYp1uef92pDcSAgiQA4vhZpHLcibBI
         cMQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792601688; x=1793206488;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jW94fUrEEV4vE96KzZHOt/ckZsK/1E1HYZRarmoNLtw=;
        b=Xw+1YlOY5H//b5phG5jJTH0etNDrrWeR583HdVYQLI9eEHlukyM6+4K+GonPLRKxcD
         z1Kt8A93WfGXnJLcAYRSaVuG68VjSx+3mnj9jhGcbguBM9yKunRY12WN3ClPRd8UvBYM
         iYrz3oWWJ3s9qWd8w6DPR67tKYb/NWruC2bqX8o1wQT+gK+l2TvZScsNGulLNkJLg4CD
         7hYY8WfJDcqwWI/o3FgAriAEOFxtCN5B6+imQleRW6PZFx4W0Glbp5YOaykeYaUCU1rM
         SSelfzglAXnJ1xEpcKQqI8Ld2517SwLE82Mq1hAUx2RUrFqX0S9TY8YmB4UgloSl2eU7
         Ac6Q==
X-Forwarded-Encrypted: i=1; AKwUvBwXuFbuDmoELJg+be5ls8AqNSDyxvsrxCAfcR3vCDxP6ApyjtNag+37Ek2MMAHN9dD8803rJMnCf0Ut4S4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJia/8dlE0KUKkEz4gEU7AKFOO9VdTG82lBLMXL61sj1vJ7gB19
	aVjfvLAj5X01dfnAZ6Y8PRXprG2AaDjbGIFhOUvRlZ/eSPuAl2BufR1W8xSip+q5rL1jeU6I5Yt
	WXvab2JaUSGTRaT9EAuYU0IvK5/1KQgK1igsX4I/bJAcBf6+IMegutd6ijx+bxfLMWLs=
X-Gm-Gg: AYBFou1M+O6gUrWVplRucM+gwOo7ZfIeT7StJeMrJ0RGIbW2aWhuMe+T1ShqX4cF1M4
	JznZkefL2i0429UuuY52D0qaJJcf9tgY3ghDbZp3P+/1G8PGLDqI7WNgiDG4fPEidd4y+UCkQ+1
	4p+fMDUWrp5ys38o0HdO2I+cWxdmUrdj6uiMbUptz2i4NjfKHigSjY1ViDEh25wby6C/iOo/Zjv
	v+xQyIZCJUk2Ecp9jTQxZEsjt0XgAUKymzB3xLB9uMbfA7VzE9jrwksNnfLkHqL+tqvd22NHV9k
	FSrCJ4OgyGav/GxDOybd5sqo4nkQbq3WbKGpiZ/wJsn10IeaQX+Dlssg1eKROh3R3pRhCBuzUcI
	1sImdAjO89Z0H44iZZ908SUOXShRuFUYtAN3+YCXaQocKe7soglMBMn06xeVFm9t0ox2WiXLq9O
	c0kLp31W0LEkMc
X-Received: by 2002:a05:620a:4143:b0:93e:6723:9de8 with SMTP id af79cd13be357-93f57fafdcamr558945885a.59.1792601688062;
        Wed, 21 Oct 2026 09:54:48 -0700 (PDT)
X-Received: by 2002:a05:620a:4143:b0:93e:6723:9de8 with SMTP id af79cd13be357-93f57fafdcamr558939885a.59.1792601687400;
        Wed, 21 Oct 2026 09:54:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac4f68f1a5sm1127421fa.40.2026.10.21.09.54.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 09:54:46 -0700 (PDT)
Date: Wed, 21 Oct 2026 19:54:44 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/4] interconnect: icc-clk: support N:1 master-to-slave
 topology
Message-ID: <i6etkqkc4zqoex54v42b3m53eqa2fvphyxglhcljk3wjr5mvit@qeuvxlksfeh3>
References: <20261007-ipq9650_apss_clk-v1-0-fd4c2b3cbdea@oss.qualcomm.com>
 <20261007-ipq9650_apss_clk-v1-1-fd4c2b3cbdea@oss.qualcomm.com>
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
In-Reply-To: <20261007-ipq9650_apss_clk-v1-1-fd4c2b3cbdea@oss.qualcomm.com>
X-Proofpoint-GUID: tIxNEtnUbKQqF96QIw84UGJYi5amhi9R
X-Proofpoint-ORIG-GUID: tIxNEtnUbKQqF96QIw84UGJYi5amhi9R
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA2NyBTYWx0ZWRfX3Cqq0WZE3wev
 DwQlj2HmFgI8y1bpWbGbJS8Dd34I6nngbPL7B062isGsZYiVBhqCaBD1s1Lvw+My531k+1n/4Vk
 DwjR+H1OVK1xGWZH+YRiZh7QAB2t8LU=
X-Authority-Analysis: v=2.4 cv=KOzPn1Fo c=1 sm=1 tr=0 ts=6ad8ee59 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=nKfPptvIfco8BJigVBwA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA2NyBTYWx0ZWRfX6qbuc/mmu+hF
 68sO7j7KdMuAMFhl6LYD6PqGi+UbVRnS1WCKQt6Q3x/Q8QxE/Iq5XYPzlIjSeRDyI7xucbHwuir
 PjI7lumwpuMAjlAYTw8TohP/GfimedmoWX+8f2k7Bydl7+X+IiKh8SemaC6yfAvBYqxwjbxKotF
 p8vv+7FPbI/zIUl7gYs+rFE/4OXlIOjFBxyLN/kM85v5J5U6iCMJPSVr0hFKe34FUz12e9u0iWW
 AFwnPvG81L2f/iUpjmyooOizLU9ERbyFjuJw60l0GdZIFOrVVf0itnZbCkfs5pqv+SOlS4PN1NL
 sCnaOJxVar+lSiW/3HhE+idxLDkxDehc3coFhyBv951jBIpQNRUL7JF786UxY+iUKe7QOrulKg+
 f2NH0AUrhqBXJkv0sfCVL57H9zIifYw11lFaFDzvObAwJxanslQDZlYlPCfxE6SwuOEQS1BNZua
 VAVYx+LNqPlkrN0gFHQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210067

On Wed, Oct 07, 2026 at 12:20:44PM +0530, Kathiravan Thirumoorthy wrote:
> icc_clk_register() assumes each icc_clk_data entry describes a unique
> master/slave pair and creates both nodes for every entry. When several
> masters share the same slave_id, the shared slave node is created and
> added again on each later entry. icc_node_create() returns the existing
> node, so icc_node_add() hits WARN_ON(node->provider):
> 
>   WARNING: drivers/interconnect/core.c:1103 at icc_node_add+0x10c/0x120
>   Call trace:
>    icc_node_add+0x10c/0x120 (P)
>    icc_clk_register+0x1a4/0x214
>    devm_icc_clk_register+0x18/0x80
>    qcom_cc_really_probe+0x4c8/0x514
>    apss_ipq9650_probe+0xc0/0x108
> 
> This topology is needed on IPQ9650, where the silver and gold CPU
> clusters both vote on the single L3 clock through a shared SLAVE_L3
> node.

If you have a single L3 clock, why do you need multiple masters? Can't
each cluster get its own handle of same path and let icc core aggregate
those? You might need to have a different voting mechanism (i.e. vote on
the sum of bandwidths instead of voting on the max).

> The onecell table is also filled in registration order, so xlate only
> works when the node IDs happen to match that order. Size the table by
> the highest node ID, index it by ID, and skip slave creation when the
> node is already registered.
> 
> icc_clk_set() also passes only the requesting node's bandwidth to
> clk_set_rate(), so the last writer wins. A low vote from one master can
> then lower the clock below what another master asked for. Before setting
> the rate, take the highest peak bandwidth across all nodes that share
> the clock.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
>  drivers/interconnect/icc-clk.c | 45 +++++++++++++++++++++++++++++++++++-------
>  1 file changed, 38 insertions(+), 7 deletions(-)

-- 
With best wishes
Dmitry
