Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792578869;
	b=b/arzCda2Osu3UpmIrCc9fbn4balOl8rLJ7tBnJd+4GA07y0VgxtVjpgBTxusOtun6SI
	 sAOv1pNDx/ne9fTKP1K475uKqdZuro3WI0XWONe0dW4/rUEN/9B3FGHRQ6stjENxgecKf
	 P4bFdKfQe6n2+EFIrj5k6bilKyidWpE51PYvoWVg7hROQGxe/RE0DqYA4dkd92vus8HNN
	 KguVgxNuDydyHYgEh3L5i4y0JYwxtvyxo4McvdfezMjB/OR+0fj870wHWLCb3PaoVtB7p
	 li9VbDRBT81ImVDlN1y2jWeKsWfvdnAw86W1NAiy2epgfFR+FZxXLDTDyU+hmIBo/3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792578869;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=K2/rXHmCPqE90Kar2gFfKfylVcffvSB40DaENFVBwj4=;
	b=lODbUXut2s1udgu8YnZ05W5k3ZmSJZkgl3Lod5y7wrczLzwtXgRvVrmkKR3nMv54s0/b
	 3XshYPBSmhGec41FvbTaXJUeUe5uPaq3OYXvKskj2MbytCawu9E6QDPdqgRGORRxI7+vK
	 xO5KVm2ECtNVaa+6TriYAK3VqaiiPx0EBwQMmZFlL9R4nR5CQQnbPUwn1uk4n/j7VckHt
	 0HVEtETCwWcI/vplEtGnCAIBMNQPMt12U1OJCTn8lr3RSEyzE/xb1uC33FJ0BF170bkAv
	 9Tri3wCBTzO9nsW43XYedLAUypKhzSeIgcofKvm7K3qPgPI3MWRhPhbHwB4dzjY8COw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=W1B0Y2lb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FRriEjlz;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD56606A325
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:34:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2AD56606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=W1B0Y2lb;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FRriEjlz
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LA5pgs3016034
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:34:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=K2/rXHmCPqE90Kar2gFfKfyl
	VcffvSB40DaENFVBwj4=; b=W1B0Y2lbYE9sJ9jRxV/kZ4q9XaE7uyRIY+ueVaDG
	OKVdKxpRsM0b4JgnhldeNYguzW3ULCihI4iAngbiNirdGZiZmZ5l64+2rW8i0vb5
	XoKIlYGBsV4UKT1SbhWPUzMzii73usQPH9SZasel5qdtyZ8P1MkRoZSeXF+urKDx
	CGfDdO/UkU+nOGTlV/ibFuRXHsRk9chzEij6SRCqIOOdGQjbFhmzGWHZFgb8VjN7
	KU9Mjn5ANZLSZ48THgScotNKjwWkqkKRmZ5CF+ZlzbmCyRrMszmecivB/MSxRm2L
	aIFn586eF/awuqxAsb0T4oEWWrkxmLiGFzIYUkRwPe/eUA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hesy78kwb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:34:28 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f32050e72so197409485a.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 03:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792578867; x=1793183667; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K2/rXHmCPqE90Kar2gFfKfylVcffvSB40DaENFVBwj4=;
        b=FRriEjlzhrmIXund81cxFFf1zqZB4lqF4+Z/Mxt+S9dkNdvzN2hbDYfc+1nVpu9plh
         G6WC3CZeJnkMsRNLmYHb8STNqIybhP7KM+mo4wgL8T3jcHFf53M6VYsDOYWExczjwAD4
         7YmV8tovVQgEg/apU8v5r731ZIIOHKxtZiKOmnSeAtM813rmOKryI8H3kE3VMxdwjk+d
         NEL0QPd/kE71o+hTJCYFxuPD+fPRhslQh2OxC/VZDclrZJxKEQeBNQhxHGKP06vyZwL+
         oyQ0G/oUumGaVLBPCZaCmTVyVntiEmBZbgTWyuEs2FzJypgD1bE/GCN9Rh1WzFzBLQlr
         jSMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792578867; x=1793183667;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K2/rXHmCPqE90Kar2gFfKfylVcffvSB40DaENFVBwj4=;
        b=Mhb05nFZBoDppIqXKzlfrB3S6aU3rQ/YvG0CU1Xykb+DIcR9gQOkQ6MblafJL+1iEM
         J/U4PLLrweTaq4vc7kRF57enlbAkaVhnolNUk3uq+VU/fTvvjAY4aGFnxfEYn73aJaje
         n/KNsu5qMKQ3IsqiQixwIgvsXpXqswLiqisJ1MkrWXcRohXUnA6JyofFv2vbwN7vU7Kp
         yyzun/RWjXX9MJjCCFFb6OyWrmKx+kaMw6wKX8pudMbw0tk4kleU+g9pguX0EQYhG2Oc
         WbeUK9sdfswcdgQhPp2jBvY6Rn/dLbJoTwUceJMD1IYX8IDXZCWYp2EWHnvWInT1UypZ
         Q+GQ==
X-Forwarded-Encrypted: i=1; AKwUvBzz3l2eSn/jBcaS06RaFwO/BVVkb01ILc2qxEIXRbo8F/Y4W2KhPGZPypGxXcmXm29kN2IvXD9GeVXZO2A=@vger.kernel.org
X-Gm-Message-State: AFq9FYKHWq/Ci9Zu+rUr15jS8GhEQB36QXHyHfsEW3R/rldSKTb86BgR
	hHwA/JTZqSzUz0Ep2l8fQoXoSXCp14SyJV5P4tmZZtEaYaCb62nD+49u55FmG56WMZQjZzioKIA
	PuBLf26k78qQaBTZcPFSTH/ddTYRj9G1ofKqk99G96drPJfwwyNL85SgmZ3DN0mWZ+aNXexevDz
	E=
X-Gm-Gg: AYBFou2i7IjkPje+vpCdHRRbFFnr0iY184buzYHamc2UfDfCd4jSCsNtfHSfz3P1OGt
	JY6ZS9cKNNyAhiWeCm481pcjhVRRic7PlOr+1ale3b6jyHWCeWqzHjJpAQTcINi7l0J15bYCUwt
	/rYMp/a59iZDfTIa5y7YNU5Mwug+4SGHgBoi56LZz/HofTNo7b3kiERSeIyulugAOWq0lLj/iRH
	Epa9lK62lyhIhM5ggCsFaHmAZI/fMmCgohrE58LPY7PxYSHZVBIajWaAQ7QRHKfk8tOXS5JzEfJ
	z1q+If8eyA4WVtqzLrgW5BGwrrU0H4ZLLVo9kuv+lPF9EhiQPqhpPl+lOOB4uXRb1I3uYrzW37o
	cEieED61nALdh3x+b
X-Received: by 2002:a05:620a:6509:b0:93e:6865:7e3a with SMTP id af79cd13be357-93f57f76b95mr292123485a.55.1792578867198;
        Wed, 21 Oct 2026 03:34:27 -0700 (PDT)
X-Received: by 2002:a05:620a:6509:b0:93e:6865:7e3a with SMTP id af79cd13be357-93f57f76b95mr292120685a.55.1792578866672;
        Wed, 21 Oct 2026 03:34:26 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2d324f8sm130087465e9.6.2026.10.21.03.34.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 03:34:25 -0700 (PDT)
Date: Wed, 21 Oct 2026 13:34:24 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] soc: qcom: llcc-qcom: Fix whitespace in slice config
 arrays
Message-ID: <ds6oh34jzvkuyyt5jzocvy5g2euiplcvb2fpr4cdjng7qf23dv@vnly65vgdwmi>
References: <20261020-lower_case_hex-v1-0-bfac89824646@oss.qualcomm.com>
 <20261020-lower_case_hex-v1-2-bfac89824646@oss.qualcomm.com>
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
In-Reply-To: <20261020-lower_case_hex-v1-2-bfac89824646@oss.qualcomm.com>
X-Proofpoint-GUID: hShOeV0CNF1MCcJsHVZWFmoBc-pVHljU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0MSBTYWx0ZWRfX/hWfQAdE85Em
 uJwYSiWbHI3kQQWr/DZlzaRxoFbI8v6YlPDRVrW8WnchMHnFxrTxTQtAFMg+IksZvSn0VYbSL8z
 C+uw9jRMDq+5uIdIGO6TbslXHGNosG9fFy4pROEfsYFkjvF27YIgpj3jXMqjFzc1Ep34/JSQjQP
 ycie9JV/heCUs79vCj+e3AN1ytUJFO+rhv96gRI6tYEu2Ht5VCyzrmIEXTO7BsL68NDICIheocC
 4A/PoQNLZn72CxYozKacsPaZ2FQfI/1rYp42qIXdG0dCb/KoN93JstxUd8XBfJWADgUvhcssxe3
 w0tBnbCRyLkcZ/zX2EfS+RdFgA1fpjIiv4BiMZJdn9GyPOrrJ+y0C8gHgz3VDhlrqHx6ZA8DmxF
 rCE5By4PeF+/1kCOIM8G0OfB7FXJXcbWEk23t7K4zRPB0E+y9q86pYSQF0rCocA2foLZvESNbYu
 XbLkCTrBIJqlZz7s1NQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0MSBTYWx0ZWRfX0kbY9Lf5VL95
 wI8IzmmEAPIrV/c6n4lanGiAfVoMMZ3ysyNaYB0ggL1E4hpPl/riLHZIpDCU7FU+UcRPPIfV1Pt
 9hZg6T4SkT0aSEhBs5V8vYM+BVLjWF0=
X-Proofpoint-ORIG-GUID: hShOeV0CNF1MCcJsHVZWFmoBc-pVHljU
X-Authority-Analysis: v=2.4 cv=IPaXmQvG c=1 sm=1 tr=0 ts=6ad89534 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=SbMn-8PG_jNgW46L1lQA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210041

On 26-10-20 22:24:51, Kathiravan Thirumoorthy wrote:
> Some slice configuration arrays use two spaces before the opening brace.
> Also, sdm845_data has the first element's opening brace on the same line
> as the array declaration.
> 
> Use a single space before the opening brace and move the first element's
> opening brace to a new line to match the rest of the driver.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
