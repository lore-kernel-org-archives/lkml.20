Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71DA433FE33
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791792234; cv=none; b=N0bWUZi6kmRGx/C8McG41D4w7otBGrJZ/Rzt/1XypHjKTKnmWYxo/rxiwhSvuxkQvGdGd+tR6SMvt3A6xeZ26rxM4yMvCOBWJWM1xTvHV6QuyUIW/NKv6xgf0mmc9gDrH+AMJF9x/eG7ibVcslh4TR2cjvbhRRAMpL37Usaqd3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791792234; c=relaxed/simple;
	bh=ooEAAmAnoQ4zLHVB9/wcFEMHZk6OGgOdvPQZ8tWSYT4=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AByVwCMSJtPDf6mdW91q9xuZsYH30L2V3FxFKYLl6YSoueQlF+z+LfDdksqRoLhAoR2pNDYWJ+m6CM9b/tWQhJMiLfCYkmPzSQYaRpOuliqWXC+DRsJi+VAYdCmdbD7RzEhiOQXe6DFBKy5HIRUDgVv+H2og7YN4R0E8FnEKPs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a+Vu4lnI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OVU5Hh1H; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a+Vu4lnI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OVU5Hh1H"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C55rwh2436696
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:03:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=g4MJlXlMVj7hpW4dhZFHvvyt
	S6XShPPUqPcVkKVRF7M=; b=a+Vu4lnI8ZhNp8AxY/eASqRjAxXVwsbKaWaubnv/
	oG3I3VpChL33U5XeZ8Sse24nYmi/1jXuEQBxTU6fJ+JqtjOc6UMoQKzzVB01eHGE
	sRGISXIkdlZejyArguC7k4ZRE58MTsEIXcn7cKBKBvDy6T6O/PhKWSsPLRugjcie
	c+waWQmYsSGkIhydU9Gc3XVZPQnC6iFFxmXfErSmo6mYEpWh1wsMGoFhGi0hPqKs
	UQg0A48XUug2f/hWjBzvATKtW3SEikvnD3R5ekijvqsfuot4iQvxFSCFHmyPuEyd
	ZkdD/3D0EX6y09M5eU1Rk9vrPQjEMy6CQGOOkWXMrHvH9A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7b2fduc3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:03:50 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cb98809caso305419185a.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 01:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791792230; x=1792397030; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g4MJlXlMVj7hpW4dhZFHvvytS6XShPPUqPcVkKVRF7M=;
        b=OVU5Hh1HWGmntsLDfdmJncmGMCeisGkVNqDl8iEoMe5GZtpcIL7gGFYY+VDIMvYhJ4
         ukuamTbfTLffc4O+aC6jIL3p9Yjy1/nfMGNPzB7z4eqk1Bg1pOBIEnOfWDcsPTiNCRAg
         StvcAW1xFN84nXsps0rJeF8lO4dHtOl/LOzWB945LkEafOM+Jsir3vMER8uPkd6egdRj
         qojYHpupXKIRugk9nCDODx7zVel1YkNF+vezjZt62PGrkHKBgzpVK9o3I5iRfWxlPWGO
         XFZSCWMEsqdLFaIl8Kc5R1sLhTNsf+yrPDEm1SQ9Er1f78vm9uL1vTEyNVJthMAmu+r+
         WQ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791792230; x=1792397030;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g4MJlXlMVj7hpW4dhZFHvvytS6XShPPUqPcVkKVRF7M=;
        b=zn8TssMHKAmhN1K2hz3kx0b+37vEEdGR9MupVOICdp5KcrGyHL8PjROEhtTmAeLILF
         30+/Ky4nq1OYDmKF/myBwwnRP3Fgsa+n1fKQNlVa7NknE1lCKWyiIKL0slrh582Yk02z
         Fj8dvjgSejePR1aL+LX2Uo/Dz+cdLlmAaEA9H9n7IHp8u2rwhsHVA7Lp9mLwd65tCXh8
         Ya4T98Vaqbpi+idwGY7qURGn9O5/61LBo1NPIOa/MGyLttV+D/7qNvoGEquGTJUvRxjf
         PnHOlBiWVMvS2ECCCaOqhh5poRGNnVzh9LVo7H+86ovZyUKaCkzS0KK+aMKKifZ6gDMn
         u4CQ==
X-Forwarded-Encrypted: i=1; AKwUvBwm65xP5dgb6xdmZIfZ8eVQ8eIjjNCUT4JmtVM3jJb6Koqg4Qi8VX8VNIQrqxPCgU8iKEmybcaiZLVTp4c=@vger.kernel.org
X-Gm-Message-State: AFq9FYLKcJRY3hw72NOlOoIjI2HevBI1YPMxOziUp7L3YMpGVpmlY++i
	GdR3//dexKtXWNKjkL3d7Y9XmG31y8VQK0CgH4JF7xzOXkUwvfCxnZZPux0gxJvVna+7OCCxKT6
	6kiPCE/DMJsQMROriIzUXJQiOPuSJU92zZVYkM1idgDWiqeQvdDs7Ue/Jg0KGo7LJ9iw=
X-Gm-Gg: AYBFou2HQyiELlTgcjRcIkV3H2BiKOWoOCdAxhl17ISDtJmDRH1tmFTXaTLiZkfnW4u
	mhmN/U8e3HL1UH2/qvcfMcfPnnz3VPfrjOuXqBHLzxzh7zke0gY85+kMppau/i7ygNzTaz0T1q7
	wJJ6rZjygUmBKSotmwY7klqr4sE2z9mE5XW5221WgWIyg1lF6HEqzs3ao7Y3MmSP+hxRyZcb4VU
	/OCXUsviYOIkNBwxgGLy0Mx1AbWVBgUQqhDFGnxJHnl0yT1RLa92sTvijhm6p5H0tgdyJq26qWl
	ePzQuKRO4c/QwDXJhhb7MUpV7IKC4H3PXQBMo/TzDwYSwo7WgKkqefOXyk1pRI+Wcw2uc+XTcKQ
	ggjtAOa3K7+wfGaVfJ8eBN71EloBmJ/AH0VtgXwH2ToIJPhkqem3dPnvW
X-Received: by 2002:a05:620a:8088:b0:93e:c12c:f11a with SMTP id af79cd13be357-93ec12d0581mr1219075585a.70.1791792229657;
        Mon, 12 Oct 2026 01:03:49 -0700 (PDT)
X-Received: by 2002:a05:620a:8088:b0:93e:c12c:f11a with SMTP id af79cd13be357-93ec12d0581mr1219073385a.70.1791792229222;
        Mon, 12 Oct 2026 01:03:49 -0700 (PDT)
Received: from RAMIREZO.na.qualcomm.com (5.red-79-144-193.dynamicip.rima-tde.net. [79.144.193.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18e49792bsm431127975e9.4.2026.10.12.01.03.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 01:03:48 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Mon, 12 Oct 2026 10:03:46 +0200
To: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
Cc: mukesh.ojha@oss.qualcomm.com, andersson@kernel.org,
        sumit.garg@oss.qualcomm.com, konradybcio@kernel.org,
        harshal.dev@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: qcom: pas_tee: handle a NULL resource table
Message-ID: <asyUYnlZWt-ESGut@RAMIREZO.na.qualcomm.com>
References: <20261006064747.2454980-1-jorge.ramirez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261006064747.2454980-1-jorge.ramirez@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAzMSBTYWx0ZWRfX7LmJRFVBRbyZ
 Riy5a/bfFXyg2GFOu/oDTgl/0g2RrzyotkbbuF37SxLV1PDep8+VfCUkaG8VjDwQ2ELLlR/Eb+9
 ry4062tiXtl+mfSTGBTi0ciAyrd3KUw=
X-Proofpoint-GUID: WX7e0y_LUDzHjUsazf6-VvNi-VcEl7Gc
X-Authority-Analysis: v=2.4 cv=NddzRGD4 c=1 sm=1 tr=0 ts=6acc9466 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=nno+U714v6U58lXnMUU6PQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=olYsFG9ziHX7QXm0UEUA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAzMSBTYWx0ZWRfX7/5QztRZzscy
 TdDW13/Ainl1J4cCivcw6dKeyC1HpY0uSlQTuV/8dfxkNeFpL85ykXlMR/RT1Z3sJgulJpfOXnL
 S8/XtMm8WXG6D7WlylZFHth0Ud9LglPpgfHpf524Y6fgm0M9kNfV4OpdbsyZBVPq4jrjcthL0eL
 QAgkwrapFTqKHSpIeCQeb+bHKkqKvATYIUphIUZRnd5sTqwe+n8Hc5faJ4IxmwurOkezDxy4kb7
 Khk9vuDNHCapxf4Aq4YXauAA7G5rRZQvQpyGMvjQUJRXMLJDVXtg75TkzfGh/AE1hhkjzDrFvv1
 V4eo8t9DN6Lo8UKYQyAIeB7+i9hkOQyZgIZBYdTCeP8AT53jGrfkyi91gEXEXPXFlxDv0epgUhu
 eIyiioy+sf51Fi1wx/9Xxxsw4YDhvqzilApuPhoBC7EYGdm34E0kFpcJTVYCZ9sFFxfZG2gg482
 T2BB5JEM+xaCWoz06KA==
X-Proofpoint-ORIG-GUID: WX7e0y_LUDzHjUsazf6-VvNi-VcEl7Gc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120031

On 06/10/26 08:41:49, Jorge Ramirez-Ortiz wrote:
> Stopping a remote processor clears its cached resource table pointer
> but leaves the size set. On restart, qcom_pas_tee_get_rsc_table() copies
> from NULL when the firmware has no resource table:
> 
>   pc : __pi_memcpy_generic+0x110/0x22c
>   lr : qcom_pas_tee_get_rsc_table+0xf0/0x244
> 
> Zero the input size when the table is NULL so the copy is skipped.
> 
> Fixes: b6f7978da0c4 ("firmware: qcom: Add a PAS TEE service")
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> ---
>  drivers/firmware/qcom/qcom_pas_tee.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/qcom/qcom_pas_tee.c b/drivers/firmware/qcom/qcom_pas_tee.c
> index ac33a00687aa..a52a7df385ff 100644
> --- a/drivers/firmware/qcom/qcom_pas_tee.c
> +++ b/drivers/firmware/qcom/qcom_pas_tee.c
> @@ -230,12 +230,15 @@ static void *qcom_pas_tee_get_rsc_table(struct device *dev,
>  		},
>  		[1] = {
>  			.attr = TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT,
> -			.u.memref.size = input_rt_size,
>  		}
>  	};
>  	void *rt_buf = NULL;
>  	int ret;
>  
> +	if (!input_rt)
> +		input_rt_size = 0;
> +	param[1].u.memref.size = input_rt_size;
> +
>  	ret = tee_client_invoke_func(data->ctx, &inv_arg, param);
>  	if (ret < 0 || inv_arg.ret != 0) {
>  		dev_err(dev, "PAS get RT failed, pas_id: %d, ret: %d, err: 0x%x\n",
> -- 
> 2.54.0
> 

could  we merge this? as mentioned, it  protects against blindly
dereferencin a pointer that might be null. I submitted another patch
that should address the issue in a higher level interface but regardless
I see nothing wrong with catching it here as well.

TIA
