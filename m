Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECFDA3AA500
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789371382; cv=none; b=BWMQnqrXSVzK9WH1xjoythQSud1kkBQqQcxqYWnzqd6hKxdzvToE81oKd8jvsWabeXDzpY/SJ8awQjMa+A9SAinGylP19qYlNyJB4FkcZ1Z86VwODSL0GRgI4ecL9edMp3GmUEWzOvUMDXv9WV0xLdrsiKl9QxJXbXYvAiPooaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789371382; c=relaxed/simple;
	bh=vQynw5OVOYNKq4gspa+H+H5QODl1bA0pWBY8WjJmkFk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ln7qFWM5oq313HHecE3e7sAU/cLqEkrqkL1J6yyAr87Dta456ynj5evTzH387ltkonz6y73xRlWFA+vkFnudsL1VzSPpcC081KrbDe9dIAHQMSHTBPv5VQXnEb5UlyLtTFpc4LZ+m7sjLEvnGUdllbGYOmyB4DHGH9YhIx8VhRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QUOaDGr9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dZMxl27O; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QUOaDGr9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dZMxl27O"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5is5r3196659
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:36:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jSKLcPTefbq6W/OU8NO5vQ5Q
	j5YwT68D0oJVE6nhMZc=; b=QUOaDGr97jM296Aq0JTy2tgYCVFs+hlK0Cqki2j7
	Wv8OQiQprn3aqnrDsNFQyBN//13JkiPaiLEvcI/xEmCorVLDKAGXAdWshvdv+qG1
	tTjO7UY+Mnm8CZi37DWekxqCkPKJZ2xnJEJZIGDVK4txOJzI3v8vegz2ZJXkSXeS
	fWDlx2+xrOZKzKPBrIIvPL8kZ5MoaOwOjRZz7R9OlWqf4vsPyfIQzmX322ikOyEP
	52JzvWfxXLiRjpFPT86jYxeIRCdO4nms36AWfxoYWQsxvAzu4SDAQc6ai598fcTN
	fALdNEII6sYtgB6SfXi4XlPGGeQFmGZmMtUw0PyjNl4PQw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9cdhb8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:36:19 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93903622880so809351485a.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789371379; x=1789976179; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jSKLcPTefbq6W/OU8NO5vQ5Qj5YwT68D0oJVE6nhMZc=;
        b=dZMxl27Oa7Tn4Ls9L7+gSPJ4u2f3KFwlD5Z1uEh7wJqOeJ2bqS0KnXALsf0xUmMT9s
         a1l+HLcDRCYJBWCPnqxaOs5WYoPD9HGKqN03P5SROO6SBsycLZR70NI7dnJFJe4QrwS5
         8WzMJtETNY4MeyWXGWcbQ3f0fOTLf9g2zDpGqmDg8Ka9kHZn5U1v1KB9NhSeU3XgIGB6
         6u7PT4pApV6syoi5nAQoBYHjY7c6nVFcSt+n0dzBG80B6+ZYoY/ke/fp/A/Zu7DeFhEQ
         gL16VwyebXpz6i71mXwjfha57skhqX4trATIBRDdt806XlFtKs5cDV19bw1uaxygE9iS
         h/Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789371379; x=1789976179;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jSKLcPTefbq6W/OU8NO5vQ5Qj5YwT68D0oJVE6nhMZc=;
        b=rFaHm1uZqdCkdgDWvt97DfBSD3r67W3dsziV4L/nDRI2yIXZt9M3EdLes1r6glT39d
         NUfgD1oFg+yi1ZMz1d0gND20+JAyj1EpScfQhn6J6RntUEizAnLYGyEuYwWclcEAuRNJ
         60yQ4pGsqzbNRbi1fttk+LxSd+JQ9A8zzhOvvEd6v50O4xr9hmax4B5duLtzB3exfHi+
         hlmLdHtK45pcLfgPZvrFETBpjbwfOzRVSw31IiI197m22YShKSkaqH/P7HxEKATwWE3+
         6zX5yQNMHZp0v+1aX4GhvCDVXFDYw2ketzLL/7CRCaPkvcg/ce9S/ZqRPiSYLpoGbZyT
         L5Dg==
X-Forwarded-Encrypted: i=1; AKwUvBw0n4NeY+t1Htqn6jxjRONAFvErkOvd8dDxWPfaD3ZxxfufrSnT1isBpFgkgISpBY7vcinHNEnH1nRI2H4=@vger.kernel.org
X-Gm-Message-State: AFuF++nkC9617fRJgh3cmIYchttyVJBd2niaqB3O1HyhZkxYl+vLrqhq
	qe+paUtyklail8hCyOcKF/P9o20vbNS9Xn4+X34unCQ2vzcgNDoAcKU4dYRI3RUpWW3nWRLidd+
	VWOEXL4joNfFZl+bZpMCFDYBC4aiX9bFRaPomXbDm5zG7Znki6bIrNBWrpw5Zx/lPTVA=
X-Gm-Gg: AYBFou2mryc7czLVo3x8BRU8QDGJFnp01nrs3WhW+hFIihd9lZknPsDbtU308h1kywJ
	9Eb51iLZ7ZJ74RjMMCromXkS3AgiTyN46k304JL1001b4WvM5XubumjflNvIhFvwHGPBTz9svgN
	6iYGP2tZf+t1gHYfX0qWD+5wVSNjxxc8zA9vEWQNssguST/KHl3W2YsHNzcddzLgALVN4jf7psL
	k9DoDYaDEKFJtCOHvsnwgntV3FidgBCOMwzvDsR74e3YV9cMLgq56Mfyj2WCVORL6aq/jFBcwhr
	Cw7aPa0MFrG2hacD1ODsKVsBOtObPTt7B/OpSlwfYvVQr+9MxhX4UmDdf0XnfFdOVoBZnkHLwfe
	T+or4ps5HFwS0qhw=
X-Received: by 2002:a05:620a:40d1:b0:939:e7d8:9c04 with SMTP id af79cd13be357-93a186027b5mr519379985a.21.1789371374124;
        Mon, 14 Sep 2026 00:36:14 -0700 (PDT)
X-Received: by 2002:a05:620a:40d1:b0:939:e7d8:9c04 with SMTP id af79cd13be357-93a186027b5mr519352285a.21.1789371368939;
        Mon, 14 Sep 2026 00:36:08 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6cc11607sm194764005e9.12.2026.09.14.00.36.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:36:07 -0700 (PDT)
Date: Mon, 14 Sep 2026 10:36:06 +0300
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
Subject: Re: [PATCH 04/31] arm64: dts: qcom: hamoa: Add domain idle state
 names
Message-ID: <d5mdt4sjvlgkneh6ujxwg2vkpwscxq4z2xjsdqdwjru7rxab3f@czqge4bhvpdm>
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-4-660c31187819@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-b4-idle-state-name-v1-4-660c31187819@oss.qualcomm.com>
X-Proofpoint-GUID: xJvVpwpcGoPkv5xlm6bkezGosKE4LimP
X-Authority-Analysis: v=2.4 cv=Pv4G/AM3 c=1 sm=1 tr=0 ts=6aa7a3f3 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Dm1D3uWegqzzbaKFt_AA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEwNiBTYWx0ZWRfX/E6QLsIwbwMi
 xslqYSXLQTfvzb7cTMIaUH/WLKYLlLOedfyhVRZHJxUof/zuekH4Wz0wplkE/+WF0OsF3ygOm8c
 1oeD9zN+HHjvBYhzT8X1hIFY9/m8III=
X-Proofpoint-ORIG-GUID: xJvVpwpcGoPkv5xlm6bkezGosKE4LimP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEwNiBTYWx0ZWRfXw55pugVXFn4y
 HEJQ4L5/DDU+O/UZ+NqneCbi3JRQD9ifYhfwzuRo5BHvBeo7R0reXc5JTe6y/9ewlsVTMnrZUjy
 wvGMW3qEDVvicmTuuUdhPOWgta3FEWjqeOwdJaCwBKsJ48V/5TWJScJ5XQsJ8H/fkKbZbF7mK/5
 SUVr1OWqTdH1hZhLcIAsvBuqj8d96DLBWr1SpXEASQOtOZVTxbsD0qE2xkwvPm6IyUYlKnjERfr
 otn7HmI0k04Cp2eVJRwlLkrMhwf3Cv2PoHtOvi+7kyuH2HN+Wn/w36q5cVSkcTRDXXOwaQRgAnG
 2qWfZ94ryHILgOZlrxUwEFF0dy/Oy9K75uqnrYepnIgLJeHBCKn/1sfzDA0l5g9XUgf/DqsQmx5
 sxxwOqRSTioX2eT4c9f1ia72+FwgkUEVM9WhfFqDNkmn8aKaPvHpZch6gxK43XO0DsZN2ZEWAAo
 2Jd79nVG4wEVs5ag+nw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140106

On 26-09-14 12:29:36, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
