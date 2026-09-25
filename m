Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 441364307A0
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 06:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790319308; cv=none; b=l77zCWKEovPOBAW46n6EbpaDJ3vftjOrMduj8o+qmOWgQt87TJMqnwGk6j+SlGiFjcr15jkeG4EwVZ0/3BtUZ9569dEtnF8paQt32B6q8035aT1u7zbJT8MjmwJ9x04R40vpYHjTtrThyB1dKRIaBPEZjTOCnJA3Mw+3e6MOmFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790319308; c=relaxed/simple;
	bh=urC2V/TROHH3jZ8x2AUGfzXDJkIFKGZjenmPfOmGKt0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KE2JJhvRhspxaUoxsy5jgGvAl8ceSMMVGVr0cUoiWNOAMS/rGDyJLepsDgFoi81tfbHaWKNWwiX2uffISQAYU/xpVIWRkH17i9eGZ3TTDDYP5LdkIZH71QjIpKsEsHgKKivYwfqayEVZ1tnVuoJNOwqnpLRkebWJG2Aa7LWJ3zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YQ2qN2QL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MjZHKLFq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YQ2qN2QL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MjZHKLFq"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4YkZi208631
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 06:55:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+i1Ci6ISaO9TjrU3L28qZpsn
	0dc7H439NZYktOph74M=; b=YQ2qN2QL4ch+FFUMrykQD8VJoAsp2wPwT+vbL051
	SakrRUbrAj+MRM1ZDd6IsMWtYrLsU4X7AugsmsPUmm/NGVV/1fsWX4V4mWcSSPfm
	SeFW6J5Huo06U7B4YQHZGUWCAI+rDAlDDGPxZEVKg/qjYeUZNYT2aEgWvOQ9TJUk
	v9TqU9GhcTxojaTv5+TaX5Gifi/q5wwZsGzHq6yve601VFNHTSmN+jvv9gZjV6EU
	eStxYCoNBARgVYwzZE+GKpx5gxfXwhKraEU/4+PnV6O4sfS0oNVr0X0vLpWcGE7r
	m31xSnkxvrVar84RG6iJBAmpb/nvfv/POqE9k2zO3GeppA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw898tdg9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 06:55:05 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33baaba6371so2274409eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 23:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790319305; x=1790924105; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+i1Ci6ISaO9TjrU3L28qZpsn0dc7H439NZYktOph74M=;
        b=MjZHKLFq80Nn6RtAd0v3HFSsfC8UxtBmPuj9VLSJB1IBVTmWBV4BE7y+yJR31gTlI2
         zF4tZF3jIXUaIHFN8jNu898yE1F0v6I4QPp95rgfpDLR1U0iCYU937vQiBAZKuObvJCZ
         BHUZRheMIgU3wY2MvvMVyiMt/152BIMIJeRvJg4s/FvI8FaaFybgKGciWaykJfWRWzHr
         k23HvHC5Dp9JVfrKd+IEZslZcKQCztzmymHQdrl3RvuBt4P0H8FX7I7uUFApMUhtG9Ju
         rMuU/1k8YfyJTpLC3+ZD8b9Pp0GnAqgjLET4SRVnHUaY88Tz5/0D7QrfUOaJAo/AwlXI
         WMSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790319305; x=1790924105;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+i1Ci6ISaO9TjrU3L28qZpsn0dc7H439NZYktOph74M=;
        b=ErI27aNr9ooBepG0Y70KK2j0eM5utx166Q4YkwFnpLjchXubNBdk74M9WU9ngpvfUJ
         +y0Ev/bA3go27lrKPSX8rW9o++lOy6V7PdKockwNW0XP8m0W/zmyQg9N47edSM9vwMpj
         W/UEK68VNtpLCp41mDByEdXHkBxY+HV90jsvlTrCPOwd/tIBSXaHMzM3upmwWVrV3DzK
         JswLuOHH2PC6itGy5gWBhtJNno96fFIGgV424TummcEiHqVT3j7Tti7uuqPdgvwqD5az
         n9n3uh2AuIWRXOZl9Fol/iZrhZ2QBCXK7jsaeZObf8efhCmPQRECdmuqcEQjeNklKN2H
         CuOg==
X-Forwarded-Encrypted: i=1; AKwUvBwnBixdbg219kFCZxW1yT4WDAShrbxxj3bCY1PJRYmo6pCi/xb4xf6EfGSAMrYVixxGz/NVyWOmcrbSrA8=@vger.kernel.org
X-Gm-Message-State: AFuF++kAq3OKDRIWW2E0BcsloCGb2jhfwGLSDxBj4G7kIJPiaPuVFF9l
	0inzz/UfukYDSsTHgid+xIkrr/vHzV3Fl2hzCxfzNe+Yv7u0y+A6YExWFb9yz9rKm5sBsYLC9ek
	+fbRYMIQdEnkcHF8SQwxbBvbln2UAYMt0UUUK/vlHe6/qhzJqVhSbCpLdL62IENK4W5U=
X-Gm-Gg: AYBFou0F8UIX70Q50uoqEAl/q+j+QMw4VRDh8DpaKyLtgza3vZucaVjmmeVQWxZzv5O
	m2A2mGic4gs7/RAsC7xjpbh+VlMfalx2Elr3sJdl5J/PvbYnH3lLVYKMWG9ZpcMJ0zmG9V7p3ak
	N1hbsnO9HjNtOhHNbUMnhvUj6iJq1rhUq0LK39kZAHmCpyRsY9AheUOSFa480Va6RuORC+P9iSS
	fjZmGr13vKnJvxzDvasUvaR2GfvCI1hNBACe4im9Cs5bPK+3Fj0yHmdyO8HW+0ejpuowaWtQI0Y
	S8qg1GbZn7/E6sFYjnBluTatZKS0J8DTnpYqCsWUTstrCCj8UD0hPyYH7PHZ/nezlOCFLMmcg+H
	c3SAbzBNfnnsemKcdaIqPbwLMmMGqoEl+jYCQRQZILA==
X-Received: by 2002:a05:693c:638e:10b0:33c:1bd2:1d96 with SMTP id 5a478bee46e88-33ffe33ab58mr3783062eec.0.1790319304646;
        Thu, 24 Sep 2026 23:55:04 -0700 (PDT)
X-Received: by 2002:a05:693c:638e:10b0:33c:1bd2:1d96 with SMTP id 5a478bee46e88-33ffe33ab58mr3783035eec.0.1790319304006;
        Thu, 24 Sep 2026 23:55:04 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3414485a9cdsm4130176eec.16.2026.09.24.23.54.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 23:55:03 -0700 (PDT)
Date: Fri, 25 Sep 2026 14:54:56 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] clk: qcom: Add EMAC CNOC APB clocks for Nord SoC
Message-ID: <arYawDgjni-nMfjt@QCOM-aGQu4IUr3Y>
References: <20260824-nords_emac_apb_clk-v1-0-290767386bf5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260824-nords_emac_apb_clk-v1-0-290767386bf5@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAyNyBTYWx0ZWRfX++bnOpgC21PM
 MEvRT6U5uhKQYHEabQ2b7yBZfczIfUlIQH+sejqLhFt6I9ZDCDMI35Ke8jmzNVLPc67ZGmcQkmw
 Gc6dkN8NDb8QzdRXoALnadsxpb7aVVZH75iHoDMWrUwMEA62BAds4X5TQkOR+Gr+45xkrVYl3pr
 jzHX+tNhSsvn2vcdm1RXxtPIDPFMc6fMwe+1GCI+673ikRtNQIET9va6M7cvhvSYGtTj+WgG/p6
 ehyIPOnnW4ryv34Y7duMnOrrRX8n2h7U6kcwjNH4romK6F7YQfZ6FXYESto0UmYUnV4erlCHD7o
 7yTCt7UGMAiyrYgUp/GDSaMHLMxOBCtYCPlVjsc79YwtZQ2oUom9suQVwMeMz3UEp/djzOyO+/m
 +hE4i6SpveRLqv12+6hGBsZpWwOK005E+oFs3tbEGKuskPxrC6F0SwEmzxqZPOlgWBVuBuF5dg1
 X7XbKL6jwyjOgn1CiZg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAyNyBTYWx0ZWRfX2Tm7Fk0OlTVd
 9r8qXMjMqsTzCQwVdty6GpeHOEKQIVYo2KtN5FIWGdnjKTpDYB8OdKCzzE+wBb5oy93372GVwZW
 3hwGJ7Xd4cYSBkw8USKrmBVZopSjNng=
X-Proofpoint-GUID: ryYD--8vUAkrb9zYhMSjxvMI8AZh1Avy
X-Proofpoint-ORIG-GUID: ryYD--8vUAkrb9zYhMSjxvMI8AZh1Avy
X-Authority-Analysis: v=2.4 cv=EJWTQFZC c=1 sm=1 tr=0 ts=6ab61ac9 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=rzbz_-ElnrvAUyxyaKAA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 bulkscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250027

On Mon, Aug 24, 2026 at 12:23:28PM +0530, Taniya Das wrote:
> Add support for the EMAC0 and EMAC1 config NoC (CNOC) APB clocks in the
> SE_GCC clock controller on the Qualcomm Nord SoC. These branch clocks
> gate the config NoC APB access path to the two EMAC (Ethernet MAC)
> controllers and must be enabled for register access to the Ethernet
> MACs.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
> Taniya Das (2):
>       dt-bindings: clock: qcom: Add EMAC CNOC APB clocks for Nord
>       clk: qcom: segcc-nord: Add EMAC CNOC APB clocks for Nord SoC

For the series, with Nord Ethernet related patches:

Tested-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
