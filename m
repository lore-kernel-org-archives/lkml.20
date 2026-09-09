Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4089B3AD53F
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 19:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788981207; cv=none; b=nFAhVWK92Htz19PNGeA/v01uY0DG9QuhhabMai0xUPtBxM/R+vwFwUlDCBke/qRdIymgXv8rg8cpG32jqZz1/PmloALcKd/PTjWa953oJ3IgcDr5KQrDzauFNmeWeQhcOFgS3L8WkUD5UMpCVVhbaWNIZmfBQKq8HvRvfX5QYXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788981207; c=relaxed/simple;
	bh=VrH+00iPXFzilbQSp/OlOVbtUbGy1K9mPgMOEwjgBvA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hFQqOHXRq3RcHOlM796TTYACNnRzwfaOE6183rKvhwDeu7slz9COXJ1C+K672am88DLitYfaEMPV1w9jslLLoe9K/Ad2zlfkffgpUqDI6wNheF4F9KcaGUUTGYi081/Ixn1pfofkCGDhCL3q9jz0Nxqmlhj/IV2x4Fm8Tg7hHqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F5J7J56O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cDnqvfhN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F5J7J56O";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cDnqvfhN"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689IiCxl2118967
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 19:13:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MF1vp434/T33eDhqwTtDmkQh
	9Dqky4UNrblzSAUjYFk=; b=F5J7J56ObCks3lNBuHn4iwjTlTxnrp606lpb8XnP
	jSaznjpa6IX4NfFtfD91MZ37HQ/t9wFSwLFoyJIaYJ8MAju9vmVt1QDtYiJSQ5bf
	TFZ+oBEu/bZAfTq6fcJtYpUXBcjNov8V4eJs59pS6nZ+p+WRVPJQpY157FDFRxTo
	2P4UvJkVyzwP1bMCUYi3Ef1h3B0AHqHVIa2Da1QiZMp1DX4BVo9RPL7QC8ki5xVG
	pA1TWpQuO1GBXoizA2ARIFwd5UXuVxXvOhsrfVKnhnwTuniE/M0lnP/L3uG7ivf7
	4EMy/BLVtiB5aEprli83cMTNNrAL+ypvCi1qV7VQSc5kZw==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyeg56c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 19:13:24 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-9806535f8ffso124269241.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 12:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788981203; x=1789586003; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MF1vp434/T33eDhqwTtDmkQh9Dqky4UNrblzSAUjYFk=;
        b=cDnqvfhNR2h8nhvsia7BdFAKgwqqgVTGN/CLtS7YJQAxmUkMeKVG+3jaQOuOUJ4ZAi
         OtWxee9pvsnZB4L0EBCYRF2CS1Kdy3QS5vL5E0IUkMqaZWoeIDxFflkuETuBTSRZ9Eyk
         O2j1jKbqWn0QK99/snTQzXV8cCxZdIpVHttx6XcZ6AsC9Jt1/rnSl3EVUHAvcQeNSoJm
         G4ggCpltk6lErA1VAxCfKptRMw/QUwzJ+sf7LJQmNNzo4KICLSsmOcx5Zn2rLZuVdcKp
         7ksxJFEWgZqzlloquD2BDicZHJhsGjWgM5hx4kmJt6U2dDNaWHI5vJE3aXPA6mjNKDB5
         OqZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788981203; x=1789586003;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MF1vp434/T33eDhqwTtDmkQh9Dqky4UNrblzSAUjYFk=;
        b=NiyZU4r23G4NAEK/7hd1hzWSIxgCno3DbBk3/v0N3ii3TDMzgxJ+Y6uS5qnvKU9odQ
         46H/J4tBp1sntQSfgnTQO8vh7nrEKhsQG3f585sbik9GVaY35Xd1dP5YcGkhrqkDLvrJ
         60HhTie/ibWImCsEnCFOMPiFIqbuh89qxXizevzPNeqXHUnmV2F7iEh6B4INcyu89lEG
         E4tGcYcZX81EP2s2A22BsVwVmcK7YYZ+UkYrdi3XAlcoqxzk9gKvZh2IMQI+BMjivKup
         hCOHkO7KS+PDgx/ya30yn4N9NW2baPD3kxyGmW+D+MWNn214JGG+EuX3xTByzHZ8T2JI
         g29Q==
X-Forwarded-Encrypted: i=1; AKwUvBxT5tgslwKxTANvty95uH6c0Omx1XEdQNV8Gj5Wj4qP5Q6pZaGvVAIvhpNRHQb4nCiRGe1MpogmgChaMFk=@vger.kernel.org
X-Gm-Message-State: AFuF++n0jQK+zR/PRGgxPDZI1ObNzmoXmOBpxcEucseJucpQST6kp3FK
	GaLMvqUaO70L1iifVlK/Omo3aSg2EQhcy1IXj8axw8HRBPVqnS3Whj9GS4Ik1UrnSNVsNvoC95P
	qkTbWpMsk5yP0cS2BfsQ/N1J9zFvsTiRtNSljctoGeb4spTBb7dE8ZRwtCkPK/Bi5SpI=
X-Gm-Gg: AYBFou0/j2NGnJ081/z896fbCnDisUw49NgM8D/zZJ8BCFWcapiSgUh4tAsGUQxS9hG
	N7pC/1R43c3SumF4Tk10eNB0FmW89fcIi4bquHZqbEl/NOgUmf5TkILUR5LuX3XYaUh5LFdnvsY
	pJl6+GjnvNRlcO+sLVXhCpo280p9syqrIIP1U1wsizgo4Ij8GoFoVmFxXM9e7k4ieyDy15xqg3H
	d7Q0G4PmqHGFRPd2DlDMhvCVr3OnPoulshMjnVzmJjx6KfFAN1eCARz+ZmTLZqPMPZ2h97todXT
	dZBDvOzltG97LZtqCN17H/3HTFTtD/smx86KjmBpg4Up8C7b/tO/roMO9geRY1v39ZBO1NR5xZK
	t1nDgG7/FeLWiLzpLaN+S4//XEwU/RFv+J2INn7xENj7MBTsPp3xzvpU3OGFpBM1gzsx2Y0kj0k
	20w05XHp3mMUBL
X-Received: by 2002:a05:6102:a06:b0:78a:4dff:7b3e with SMTP id ada2fe7eead31-790dabbf9dcmr241396137.15.1788981203116;
        Wed, 09 Sep 2026 12:13:23 -0700 (PDT)
X-Received: by 2002:a05:6102:a06:b0:78a:4dff:7b3e with SMTP id ada2fe7eead31-790dabbf9dcmr241378137.15.1788981202584;
        Wed, 09 Sep 2026 12:13:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b74f2ec6f6sm3198485e87.44.2026.09.09.12.13.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 12:13:20 -0700 (PDT)
Date: Wed, 9 Sep 2026 22:13:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vsevolod Nevorotov <sevanevorotov29@gmail.com>
Cc: vkoul@kernel.org, dmaengine@vger.kernel.org, Frank.Li@kernel.org,
        andi.shyti@kernel.org, mukesh.savaliya@oss.qualcomm.com,
        naresh.maramaina@oss.qualcomm.com, aniket.randive@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dmaengine: qcom: gpi: Set IEOB on linked I2C GO TRE to
 retire TX descriptor
Message-ID: <gibyui67mjkf6fxgodg2uzwyiio6d75boien64f2fpfjpkvwno@jtmsqwh6zmzx>
References: <20260909175332.304767-1-sevanevorotov29@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909175332.304767-1-sevanevorotov29@gmail.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDIxMyBTYWx0ZWRfX2Kd6QizY88ua
 xmd5IfZZwzdtw0mNAE9/aKOqpGTcmzT/gceKX+iBps8eiK8Z9XK7PzJ0K1sahzy36R7zSfSePu7
 52/cFbvt8/8JbneUFH1BvZwrIVQXFnw=
X-Proofpoint-GUID: KSxAry7ciAsM9rlLXnXHU_EFumFwZ0df
X-Proofpoint-ORIG-GUID: KSxAry7ciAsM9rlLXnXHU_EFumFwZ0df
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDIxMyBTYWx0ZWRfXyHIG7eW9wbOz
 FH72jfjccZQzyAtubeWeWiN3LtIIODXugv1Hq5TV3zt5/d0t/o0WYio6KJPQVNAvdmNs5bkXPzK
 U6UVZqFgWrM1pt/LCKVQvb8OD1xDkd1IrqfDxDXGVF8sVbr4+4HAKSxvtpqLZ6v341MfPGfCXsw
 i5hJ9JwBW11MCP7DO/2TdklfjjEZ49pFVfzqBBUeozIEyxgHeaIbnAuCn9q61p5ZnfQKyddTZGh
 eM+47J9ESR5TmKZBmxjz5/UMaAkMGSqiaNpU98B7x0xszNbzOPSR/yWubT+6rWDoISb2CMQ4tV0
 cqXlc/pyYPJDToeTVYSuOoRknLTw6pmrdOKPVLevPnDvgvAwIESWkjNux2DPjZPmUq79iucSTAo
 OxMeQsurHJOwY7XdbUugXgaUmL+vux/iVQ+FddpWthoMt8mwqcX1RhGQcET5on689tBfRydjiNL
 FJ5QXQkw3HfEU7kREfA==
X-Authority-Analysis: v=2.4 cv=Go/XaU1C c=1 sm=1 tr=0 ts=6aa1afd4 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=7ZfXIp-WeeTcKSKqBWEA:9 a=CjuIK1q_8ugA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 clxscore=1015 spamscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609090213

On Thu, Sep 10, 2026 at 12:53:32AM +0700, Vsevolod Nevorotov wrote:
> In GPI mode, an I2C read transaction consists of a command phase on the
> TX channel (issuing CONFIG0 and GO TREs) linked to a data phase on the RX
> channel (issuing the DMA TRE to receive data).
> 
> Commit 656147fb1d4c ("i2c: qcom-geni: Avoid extra TX DMA TRE for single
> read message in GPI mode") avoided programming a dummy TX DMA TRE for read
> messages, leaving only the GO TRE on the TX channel with the TRE_FLAGS_LINK
> flag set.
> 
> However, gpi_create_i2c_tre() did not set TRE_FLAGS_IEOB (Interrupt on End
> of Block) on the linked GO TRE. Because no TRE on the TX channel has an
> interrupt flag set, GSI hardware never generates a completion event on
> the TX channel when the GO command finishes. As a result, the TX transfer
> ring read pointer is never advanced and TX descriptors are never retired.
> 
> Under sustained or high-frequency traffic (such as touchscreen controllers
> operating at 120-240 Hz), the TX transfer ring quickly runs out of slots:
>   gpi 900000.dma-controller: not enough space in ring, avail:1 required:3
>   geni_i2c 990000.i2c: prep_slave_sg failed
>   geni_i2c 990000.i2c: GPI transfer failed: -5
> 
> Fix this properly by setting TRE_FLAGS_IEOB on the GO TRE when multi_msg
> is true (matching Qualcomm's hardware specification and the existing SPI
> implementation in gpi_create_spi_tre). When the hardware finishes executing
> the GO command block, it generates an MSM_GPI_TCE_EOB event on the TX
> channel. In gpi_process_xfer_compl_event(), handle MSM_GPI_TCE_EOB for
> linked I2C command descriptors without a subsequent TX DMA TRE by
> retiring the descriptor and updating the cookie without invoking the
> client callback, allowing the linked RX channel's DMA completion
> (MSM_GPI_TCE_EOT) to signal final transfer completion to the client.
> Other EOB events fall through to the default transfer completion path.
> 
> Fixes: 656147fb1d4c ("i2c: qcom-geni: Avoid extra TX DMA TRE for single read message in GPI mode")
> Signed-off-by: Vsevolod Nevorotov <sevanevorotov29@gmail.com>
> ---
>  drivers/dma/qcom/gpi.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
