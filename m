Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8367429013
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 06:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791526302; cv=none; b=qgujCG5T8oRh1EK3PzwX42lq3Glxtz8Gn0wK4NJJv60lA5IQIZQxgQZZ67aoMwST0xdvxNP0D1kt4hx9dbgQVIuo1oEPhxrR/QF5pY/6zoyi/oXQ63Ckb6tSA0QQhuG0jzT8J4T7G5bXFStyNhuRc9s8pKyW9x8v0yFMotycoMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791526302; c=relaxed/simple;
	bh=Wmkbo8HPR11OILJQCDQF6szYZaFI0eOI5BQs9yUQFP4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=olrrZwjnXA7ftb0fDQHAOU2F+sD0/NgHnvzMC+mRTr5aCpOO8Q6pIJ5hV3id/6QyvawFV2fK8+xkobOu3B4GF6ZlFXOoTpO36HluU2ud3ovhgrNlnZRvcO8xgL1T98ChkQ4qmvKg9ycRB2dDxk5qvPn97B5P70twiTBPyPzqTEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O9/ET0QY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jm0p4YcR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O9/ET0QY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jm0p4YcR"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6993HKcr564700
	for <linux-kernel@vger.kernel.org>; Fri, 9 Oct 2026 06:11:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3hOn6raAcGNFw6Nr4o3rlG6f+gywDsQ3FA3PX1oZuQ4=; b=O9/ET0QYXa0ojnp6
	uErL892z606ka08h489t1yy2sqohTJMXEj6zkhVtM9OU8+Ds78XV7gXZ59fZDfsS
	5PmHDU/3ugLrCbXBTncK1ZinCNqHGYLWc/GJgk1HjExatySW5UpbIxgQI0afaWNN
	/e+i+tA0d+QOsOjPIwePoGllMg9wsQlrJiD1Z3wwqtDYbatEkrazcHVOSK9wU0kq
	shhTsCeDP2Px+IF5rUvQlgvkiOfgK98JaCeJxouhZEjf6QWtq4H+JYvl9YYXdZZi
	SfSZdUO9x+ejbxkaKzG1lK7Esa7P/VVYLKalLbUxuJTwp9e7tA6c03o1o3EjLbkl
	zmqU4A==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fxka3qx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 06:11:39 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cd3b9e70f88so700326a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 23:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791526299; x=1792131099; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3hOn6raAcGNFw6Nr4o3rlG6f+gywDsQ3FA3PX1oZuQ4=;
        b=Jm0p4YcR7awx/WGLkmGsOXE6Falh272lLivx5cFacsD+NQP4HGJM/Z4qflYkhaWiZW
         k2FO9DWh73mVxKDPOyCnrIvn1vrrKc0UnfQ+AYYjtzGVUbZwK0ZD5JJHdZiljJBw8YDs
         gR/Z3bHCGAtFZfFH6j9hr/QOMOI02x28APFyzDcHf2P0MFUTbtN+q0Fb8W7gqoKytxR+
         Lo9kQfH6z116Uvh+23KicrEJJyT8IhrgwszgrJRPIMaSREtDbbqGn8AxPgM7GSJ0f2sw
         cl0rmqlQFTNIVfYF9BcTHIIGAY305zDId0Yd61JzB3rQqd+jzhW76aTvfmE2xGmrhhL3
         otVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791526299; x=1792131099;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3hOn6raAcGNFw6Nr4o3rlG6f+gywDsQ3FA3PX1oZuQ4=;
        b=njl8QfmFetUL5CgcTy4Cplpw2bmjzeCtzSv91QEeqBtU4j0CCcMo1CKI96g5Cg2ijT
         8mBQOJDb/R65MXY8LC7TKCcuTPvEHGbnFQbE2LNo+77O2gn58+NjfgwQGx9JjqPgranL
         P+H1N8VUeZ/RSaL5mU7bkbtoEuohBFFXdTr0gADDClx8A/nE8Xe3/BhuYBuEFfwHy0xh
         3lBjHabJ3IQ8FNEt8Ju4xA/fWqu7LhbWMMuoZCfjOBugw5dHFk7vXcxQtf6tMd4EAasC
         H2sGpF9cVALlDEmoj3JMoN2w9PehLyg14JJuGcThH8i/gzlMsqCKgZ0+snBd5F880aRR
         R3sg==
X-Forwarded-Encrypted: i=1; AKwUvByd/kHaFStZ/PluYFFyhp8RvXRnJ2uQCRRip4GCX7YzuuhL9EkRgRvQENPxGkhiDHXG0uo2yWZV1t66XJs=@vger.kernel.org
X-Gm-Message-State: AFuF++nyLAw/OhPDdPQwT8Wb/tGAygWawRSl9tRvkWfOl+XPpx1s9Acm
	yWro3oZhePDKET4d6jdERWm+4oNnlp9/mH298AIIfPr1+UVlvpfP/JfpbQEj/V5Dt98C0AX38xa
	Lo8bEkiO8aQwiVZXSagOtXjO8VpEPFYFmTUduXgtBLNgWgjSvMolFb+AWZYU1qGvj9iE=
X-Gm-Gg: AYBFou0KWl/Y2VTXJVovLY1m7vJxSYfq1y92T6ZRtfBC2WmuaKy0xvrgRCyRgCOHvtA
	DqIYdKSSzfofJTzakQryj4EXJTR4jolofIUQD+aLkLW4TVS8R56J93RwDIvshfi4O+R5sOYT7+o
	L4M4GRWoifO0lnhmPKeFCx3mBhv8UJvvMX1iS+Dy4kYLHuXqmQSDWil+dN+sRy20FZi/neag8G5
	dO3/NDNjH5X+KcLcoYiATpnI7TTcIBHMnQB44vKVvXkDyYiBNs/gEmnFGMA4Wr55IhRtI8lGyk1
	h43gkf94x0KwDvg8ajYu7uCUZnNF/JSR8xYjMNg3tnAkihh3To6bn75e4vVukuRZeblWNn9RlSL
	4d3NN9A4klp6CPL6Q9r5JV6/Z+AU9
X-Received: by 2002:a05:6a20:748c:b0:3dd:a197:ede8 with SMTP id adf61e73a8af0-3e16bef1d07mr701380637.55.1791526298515;
        Thu, 08 Oct 2026 23:11:38 -0700 (PDT)
X-Received: by 2002:a05:6a20:748c:b0:3dd:a197:ede8 with SMTP id adf61e73a8af0-3e16bef1d07mr701360637.55.1791526298064;
        Thu, 08 Oct 2026 23:11:38 -0700 (PDT)
Received: from [10.219.57.162] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c3106e07sm467718b3a.11.2026.10.08.23.11.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 23:11:37 -0700 (PDT)
Message-ID: <041b1648-1320-4394-8282-3d1cb1203d16@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 11:41:32 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] misc: fastrpc: move ADSP duplicate session
 creation to the driver
To: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        devicetree@vger.kernel.org
References: <20260923-dup-sessions-v5-0-e953133a1827@oss.qualcomm.com>
 <20260923-dup-sessions-v5-2-e953133a1827@oss.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20260923-dup-sessions-v5-2-e953133a1827@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: hjdYrWrUWXGC9X3PtN1zeN1F9GO_FLhH
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAyNCBTYWx0ZWRfX0ttmD2kzHqNo
 ZkGI8ueUJmBhgIheDxqVwk5u2kxtfvta5XGib0KjtXRAMVxCv6/G3qDMLfepP4cAPQSP5uU5s0/
 U+LMZaJViuXe9OlEDo00QRywVUKLJEE=
X-Authority-Analysis: v=2.4 cv=Cs0q4X4D c=1 sm=1 tr=0 ts=6ac8859b cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=6scLBf4XpmJJRpZfmIIA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAyNCBTYWx0ZWRfX18Ha46hDscoW
 qReZI/Nio7GElkKeMblPBHnkZhnb/4H0tmXYnRyETh2wS/IvD79YdOQHUufBTUekXmU6iVPQN1X
 3oUXVs4NgIuvSTMl7AyWFfZHA+syrk9qeQDaJCpXYtLyoUUfKwWt9XV62NwpCj7zOUc+FHqKc/1
 IlpZ4lcPrvi2jFghvs9R0ZbwP+s7GfvZfSlkDBn7cbtcl/AwTt8JkuHtLvM/AfU82NH/u9EHWKn
 1mEwcw9w5zWOA6CQam0CQDfnoTkCplEh9obFd3HmHrOCqKBqt57z5lKmsMEHbC1YcwaPOqyBTA2
 T0UtlstX81qatV3/v5efay6LAgaVsy2NEi68vq1513LpFM/c1/pgS4queA1wCUGSF5gjBBJozZP
 bjXCwInv89o5dJOpMVq20zLrX6Ni+Qquf/ew6uIMi5oQ1FZd6CoEcFzEyspr2ZseHaLvfoWlnpt
 g3hpCUujmDP7Pd3SAXA==
X-Proofpoint-ORIG-GUID: hjdYrWrUWXGC9X3PtN1zeN1F9GO_FLhH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_02,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610090024

On 23-09-2026 14:09, Vinayak Katoch wrote:
> For ADSP, only a limited number of FastRPC context banks (CBs) are
> available. Each CB supports a single session, which means only a few
> processes can run on ADSP simultaneously. If all sessions are consumed
> by fastrpc daemons, no session remains available when a user application
> starts, causing the application to fail.
> 
> To work around this, qcom,nsessions = <5> was set in DT to duplicate
> sessions inline during fastrpc_cb_init(). This policy does not belong
> in DT and should be handled at the driver level instead.
> 
> Remove the qcom,nsessions DT property read and the per-CB duplication
> logic from fastrpc_cb_init(). After all context banks have been
> initialised in fastrpc_rpmsg_probe(), append FASTRPC_DUP_SESSIONS (4)
> copies of the last session for the ADSP domain.
> 
> Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 29 +++++++++++++++++------------
>  1 file changed, 17 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index f20d3e5ecc81..b29c1fd00de2 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -34,6 +34,7 @@
>  #define CDSP_DOMAIN_ID (3)
>  #define GDSP_DOMAIN_ID (4)
>  #define FASTRPC_MAX_SESSIONS	14
> +#define FASTRPC_DUP_SESSIONS	4
add some comment here>  #define FASTRPC_MAX_VMIDS	16
>  #define FASTRPC_ALIGN		128
>  #define FASTRPC_MAX_FDLIST	16
> @@ -2338,7 +2339,6 @@ static int fastrpc_cb_init(struct platform_device *pdev)
>  	struct fastrpc_channel_ctx *cctx;
>  	struct fastrpc_session_ctx *sess;
>  	struct device *dev = &pdev->dev;
> -	int i, sessions = 0;
>  	unsigned long flags;
>  	u32 dma_bits;
>  	u32 sid = 0;
> @@ -2348,7 +2348,6 @@ static int fastrpc_cb_init(struct platform_device *pdev)
>  	if (!cctx)
>  		return -EINVAL;
>  
> -	of_property_read_u32(dev->of_node, "qcom,nsessions", &sessions);
>  	if (of_property_read_u32(dev->of_node, "reg", &sid))
>  		dev_info(dev, "FastRPC Session ID not specified in DT\n");
>  
> @@ -2369,16 +2368,6 @@ static int fastrpc_cb_init(struct platform_device *pdev)
>  	if (cctx->domain_id == CDSP_DOMAIN_ID)
>  		dma_bits = cctx->soc_data->dma_addr_bits_cdsp;
>  
> -	if (sessions > 0) {
> -		struct fastrpc_session_ctx *dup_sess;
> -
> -		for (i = 1; i < sessions; i++) {
> -			if (cctx->sesscount >= FASTRPC_MAX_SESSIONS)
> -				break;
> -			dup_sess = &cctx->session[cctx->sesscount++];
> -			memcpy(dup_sess, sess, sizeof(*dup_sess));
> -		}
> -	}
>  	spin_unlock_irqrestore(&cctx->lock, flags);
>  	rc = dma_set_mask(dev, DMA_BIT_MASK(dma_bits));
>  	if (rc) {
> @@ -2669,6 +2658,22 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  	if (err)
>  		goto err_deregister_fdev;
>  
> +	if (data->domain_id == ADSP_DOMAIN_ID && data->sesscount > 0) {
> +		struct fastrpc_session_ctx *last_sess;
> +		struct fastrpc_session_ctx *dup_sess;
> +		unsigned long flags;
> +
> +		spin_lock_irqsave(&data->lock, flags);
> +		last_sess = &data->session[data->sesscount - 1];
> +		for (i = 0; i < FASTRPC_DUP_SESSIONS; i++) {
> +			if (data->sesscount >= FASTRPC_MAX_SESSIONS)
> +				break;
> +			dup_sess = &data->session[data->sesscount++];
> +			memcpy(dup_sess, last_sess, sizeof(*dup_sess));
> +		}
> +		spin_unlock_irqrestore(&data->lock, flags);
> +	}
> +
>  	return 0;
>  
>  err_deregister_fdev:
> 

