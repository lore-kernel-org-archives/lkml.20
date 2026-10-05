Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC0737883C
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 07:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791184588; cv=none; b=hnu9SXClZfbqWPrb78S5i4sy6arf2bZWb4tmxtgklOGnncwpCB0jV5tFvPnA5J5c83cPtGywsve8cNXF8Fs+xp9/T9FkGLqj3vnbI2ukteW5JI0VX042KklGGloCOIkmF7JuqRLwUgqH4mOspEjYMNIUFZ+i7h/8LQQDnsLO40g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791184588; c=relaxed/simple;
	bh=oUI7QJHaPvDbYSWbJU1Q6FDTvjNjMc7sFWpXppzL544=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KMc7eJ+yCXIO4wJFdI2fnPf/aEUQfM3DBe+l0k7PqJvw4/+SZp0UZkgnPacIBJk9Ux4siHu5yVWgOOF10yPbE9JjfasV7QMb4W8pxR7CUVayOYmXE/vOFbtXyn2mwMnJO7VXWRheiAXCGeBScQ4xweFdoVFJ8keDJydzgJawGkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hW6S/mVE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EPwOggfh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hW6S/mVE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EPwOggfh"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6951018E291143
	for <linux-kernel@vger.kernel.org>; Mon, 5 Oct 2026 07:16:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PTQJcg1lkUmuY72CyxDCcV2H
	rbwklipgzh+7RxBtm4k=; b=hW6S/mVEabBct/u6Fj/JZVs9JYHysljkVD8UMMDE
	Vv8QbgnS5dtm14tEuF22dpPsPIQV7xK4n/G+cEFhRQjQ1W8s/L8oGAufvxTKxSU5
	r7DUGeuiNVfV1L3MkgMaIuzJ7cAH6bBuL78NlBZjzkDcLMACFwxuM2bgEyjkzcdq
	ITE47ODL/Lp93caUKdAKplG5pJ9YjKTSO+spaDoLjurs9UXkTMGyBMAR61NjX180
	fk0uDdA7bWJsed+MLxQePxw8PmaVj1RYqZizJrPVSL/QK+uPUhp0kLts5piZCiQY
	hzxEOPDg796dJWHiX64EWLreEXohZ054hyjg9U45cA5aAg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h3xhs12kw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 07:16:25 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7bf3a0a498fso1302584137.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 00:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791184585; x=1791789385; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PTQJcg1lkUmuY72CyxDCcV2Hrbwklipgzh+7RxBtm4k=;
        b=EPwOggfhSROcK0MDjV6qrWPLH9ObRwLsFLqM25zyXFjefLpuBKC1BuvOKt2iMAkKuZ
         mZQA5jIsHa9VUjSM1SY3bAHRuQD3pEYLNNdrYz0Q5ggAj0PLzEH0bl12RjM/F76CEuI5
         kff8Qsuh2G9ex21FmSL+bPrlkB2a4HI1YJVn30tdptOL2JaJe+EzkAsONcoAyYQPnA55
         A3uKodAvoe7RxeNkugPJvfJ9jPkHj+BauVFE8TfnpR5Q+cagLegg6LjRr3CFj43WEltV
         I+BnaYI9RSmeN8oLoAvqYqaJv7aOPVT7fKNJJkxJ5dq1QM5l5zJJGl/lXSkpD8RUAvxk
         7AHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791184585; x=1791789385;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PTQJcg1lkUmuY72CyxDCcV2Hrbwklipgzh+7RxBtm4k=;
        b=qUkp3VgfwYDjIALZ6i798pyBH9OaB4OSIh9H9UdEDXUVaLOu60HxJMz+EsOeOPHOV7
         4xQLzhVdd5M+HkumRt/l7pyl0LI7sfFkCPdghg4y66T3H2uxt5CYuEwIhnLtQzXs/fIt
         D7C/QTuj3Z8PwSVvyr5S1V0fnNs4iwMcEsxa97viq+1FmDja+v72rh/YIc6NA6v2kvyO
         PRWJVtNgyORbeGmeoDzd7ewIHGw68puUxwOXjO+yRPxsmSB20MPSyIXVQnRE87Hz3ICV
         4gPtI7QCdicazLR3V5Sgg/KlS84Dpvy8M+P+QLij6sdH8EGGIrW0yqxArebV86jgTyf0
         n13Q==
X-Forwarded-Encrypted: i=1; AKwUvBxzpfpAJXn4Pj1UW35CK5ZjwEMkRrLC0iPmxmIQVkdOf9rYQwHWkP4odXjq4//HKtq+8G+Q3TV6U/9poQk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJGBDSLdsyK+EZ1ypxaBpeixXuxjRG1NKnwVps5QuX462Jb2QxF
	5bG8waAOOTPK5yFiO6vNr6IOSM9Fp+kML0dkva2LiIo1/osEz5EGBVFQz+dxI1ygKkU1OeUnZZ4
	ihEtIBiYc6sJwN/uD35d7fEzCc+5yOCJS6drcAgZLqpGJJ6FFJydPVLaAfY0OwCsvnRv9jRbHja
	Lefg==
X-Gm-Gg: AYBFou2wTLfcWqRwJMLvtbRCStCKnDL7H7/lcspVKWDPi/Ta2cEWRNDjbFdvCSP46rX
	Fx1srbbwMolC2BowTocYWkkVO4/eZyYiD+2d08gkVJd5t5Xow480R7NhhBp2PKlJ34gI2mKRP+S
	djx8R3iKFcyU91OPB22A6n9unDIggV7143+jeirRDCcn3IvYRMcTmF+LuCiK68NZovqU6+xVOF0
	pBwLdkuZxzTjLgSOYqZrHdXFJNiuB2LIYUZq4Da0nen6WyMgRs/Dvu7K08Dg8x9LqyQvYlBc6FI
	Nj2gKvepIGnBUP/w+wk32TV2IPGVngFoCk9/a9DoJddGrpiPs8VAMlDm0shqnwDHZEMQIn3MzSX
	gMXzOxTNHGYTOQxG25CUCEdu7ylIr5Ma6NGwub2h2plM3A0ZU3eLtkMXmdBS7+Z+5NW4QHDLSj/
	cP1s9zig8cK//4
X-Received: by 2002:a05:6102:1627:b0:7bb:64cc:1362 with SMTP id ada2fe7eead31-7c0f4b9f6d6mr1914175137.6.1791184585058;
        Mon, 05 Oct 2026 00:16:25 -0700 (PDT)
X-Received: by 2002:a05:6102:1627:b0:7bb:64cc:1362 with SMTP id ada2fe7eead31-7c0f4b9f6d6mr1914157137.6.1791184584572;
        Mon, 05 Oct 2026 00:16:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a87e31035esm38762961fa.30.2026.10.05.00.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 00:16:23 -0700 (PDT)
Date: Mon, 5 Oct 2026 10:16:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Manu Gautam <mgautam@codeaurora.org>, Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <pza@pengutronix.de>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 5/6] phy: qcom: snps-femto-v2: Move PHY init registers
 to config tables
Message-ID: <2kjywcx6q4cqvycbpia6junpqmg45eyuxygb7slal4fyjxah5i@dkd5lzgxx4vq>
References: <20261005-phy-v4-0-b04c4123ecb3@oss.qualcomm.com>
 <20261005-phy-v4-5-b04c4123ecb3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261005-phy-v4-5-b04c4123ecb3@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: zaLh1jnNhO7xKAgIRPw7CohY8AW4e_PN
X-Proofpoint-GUID: zaLh1jnNhO7xKAgIRPw7CohY8AW4e_PN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDAyOCBTYWx0ZWRfX+XmdkyP47aIK
 nnZktw6iCkshwoj6iSNjq6oHjx9eOikJjFC9BY/ZGx8S7Tvn2yEa/YFOtumQWltmUipPb3HRRsa
 gyWWN3C1AgE/UAIhREysPtHTWXx8O0I=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDAyOCBTYWx0ZWRfXzQzfpKyB4qfR
 Sbcp1f1kyW0oKUJeDLFkbgDXnALOAt/cCU7bshzmJiiZy/ka+312FUbukg3rriR9vYepHrboEYa
 4Ad7tib8WFOFf79F/t7J+EwgU1Qt42eofTmMhaaXLX3Xj5AoYU/5Tezfy7r/N8z7cd/XYpCUCqT
 5WDG22ku1XQYzagZZEkevuHxONM7hHIhFlfSBYQZsm4LqnmVZ6H2wUfziMd9FujrklL3mHCPnON
 WabBXZDZVmzG4qeCbTF0e4Tkc60CejHcR5YRKOOFwF1RRcDQzP+4LuZciYDGMp1ppOVw14PXUzx
 lwW8OHk5f81X6yRCk0Y2hcjF4Egx2u1d4Zy05iWSBdC8f9opvMndwQMlKVlkDIS0rU0CdyJGE5E
 bfqqcN13rRmk7QGH59xlW+jdtF5/LosJzA6MEX0qO8+PYZmYnBuRQYwJxDspcboMRx09JTS8nba
 gA+WaCoaipNCGBzDWcg==
X-Authority-Analysis: v=2.4 cv=Q6tHcI2a c=1 sm=1 tr=0 ts=6ac34ec9 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=ANDOyDOR4wAE_hiF6jIA:9 a=CjuIK1q_8ugA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050028

On Mon, Oct 05, 2026 at 12:06:30PM +0530, Varadarajan Narayanan wrote:
> The driver currently programs the common PHY register sequence directly in
> qcom_snps_hsphy_init(), with the fixed register writes split around the
> override parameter handling. This makes it hard to support SoCs that need a
> different sequence or different values.
> 
> Move the fixed pre- and post-override register programming into per-
> compatible configuration tables, and keep the 7 nm override parameters in
> the same match-data structure. This allows the driver to share the common
> sequence while adding SoC-specific sequences for future platforms such as
> IPQ9650.
> 
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c | 124 ++++++++++++++++----------
>  1 file changed, 78 insertions(+), 46 deletions(-)
> 
> -	qcom_snps_hsphy_write_mask(hsphy->base, USB2_PHY_USB_PHY_HS_PHY_CTRL1,
> -					VBUSVLDEXT0, VBUSVLDEXT0);
> +	for (tmp = data->pre_tuning, i = 0; i < data->num_pre_tuning; i++, tmp++)
> +		qcom_snps_hsphy_write_mask(hsphy->base, tmp->offset, tmp->mask, tmp->val);

for (i = 0; i < data->num_pre_tuning; i++)
	qcom_snps_hsphy_write_mask(hsphy->base,
				   data->pre_tuning[i].offset,
				   data->pre_tuning[i].mask,
				   data->pre_tuning[i].val);

>  
>  	for (i = 0; i < ARRAY_SIZE(hsphy->update_seq_cfg); i++) {
>  		if (hsphy->update_seq_cfg[i].need_update)
> -	qcom_snps_hsphy_write_mask(hsphy->base, USB2_PHY_USB_PHY_CFG0,
> -					UTMI_PHY_CMN_CTRL_OVERRIDE_EN, 0);
> +	for (tmp = data->post_tuning, i = 0; i < data->num_post_tuning; i++, tmp++)
> +		qcom_snps_hsphy_write_mask(hsphy->base, tmp->offset, tmp->mask, tmp->val);

And here too.

>  
>  	hsphy->phy_initialized = true;
>  

-- 
With best wishes
Dmitry
