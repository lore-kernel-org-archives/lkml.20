Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794929733;
	b=l1ZnXkjIYhNscKGjcRa2VyfLXXX7/fAYb5XWELBEkdu8GW30DOiEzDR0ErBIPuy+4z0n
	 9neJ8KqgdY56uttq6hZkr/ReTZwWODQWvg+bAKz2713myMnBDi4UUsY8D8ww0izez/WtC
	 DiI65FfY/Ap26mlwU95vQpQpeI9J/jgJ7d6uL93CRRNKEasv1EsPq5Q8obxF9rZ8rmwqY
	 HqZ3X6FVTZdcqAGrxHzplZWZAr9coirbUVlZckiPULG9zr/LZ7dR2vnZnBAHJL5cZzpuF
	 NQg2wN7chpi8frnHEKhdXbrC520TM+6UN5kiTVKKwS+WEnhOo64cq5M1lBxrarHKPgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794929733;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=67Ks5b0HSYrXo9kOcZY2qc0sEU+LdootGD3SBNdOIvc=;
	b=ahb+dF+L1vg7Ska5QSoMr/HIeKovfDTZf1Xqv9lUWkQeAhsv2XNGjvlPo1EoWi7xQYih
	 7FG5pVcFo8LgAtLyxNOJyBE/Ba7n+RwrDqDfKRll1+beUO/mFS+oTFiVd5f8VdFc36ux8
	 1j3KNMfZWto/gDL6nB5NZyg7MsxvkLtHzGyRK/9qx0irrlCDJdqyvMum8vHMFIxWjF5ZB
	 /rkqa7JfT6gwPgrvNy/B5yi/zmfUSZd6eP7KncT5Ux+Yhw4+Nw5fnDXXeYO1gB2jghLse
	 fYrvyA8AwYV8rXrhpzOP6iTVJcmUf/u4+v/x1bBOVWUH23WFssQ392dwn6Va7zELESw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IJIfwHeK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AP0RgrI2;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E41B8606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 15:35:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E41B8606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IJIfwHeK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AP0RgrI2
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHFQexf995110
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 15:35:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	67Ks5b0HSYrXo9kOcZY2qc0sEU+LdootGD3SBNdOIvc=; b=IJIfwHeKeh1kWGsD
	UR/tfSp6lnTJa42WLngOIKIW1tSHjFKyFl1CY9pStbMnzKmvzz+cwvkWU5qQSH2C
	WgIxsCJ3NNJ6LmQVXKS/oEZJM72aYKkqtm6SC4iSuIJJEXM3MQNbMEgqE7K76ejp
	X3/S9oEgoyYjtkrJd4F9D3P/YBc1T90SSfBhjOwQaG1SnVhI2CaoqVOdOvI2p+Xa
	0czEjLPfAh/8Sm5Q8r5xjStSjaZvUTkoQ5NhpLmeqVd0S6KQbSnfrfQ5p1hrUQ7Y
	wvyVstFbHa2XrbKDWV+ugGBuvdMZ99iAhobVtQfawIpAWdDNa7VyVKGJNiq8SzLO
	9EeVLg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0hkd26n6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 15:35:31 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b0e00d7cc2so4377528a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 07:35:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794929731; x=1795534531; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=67Ks5b0HSYrXo9kOcZY2qc0sEU+LdootGD3SBNdOIvc=;
        b=AP0RgrI2xb+CrGSUuLkY7o+1tfY8te/RBp6aFbTuTC1u6YE9yA4qnKfnv++SteB3En
         HoqD9+MWC5zTgQjO2y2ZFt0XUMH/dbo4UtrLy+FQ/zfws+kW9Q3bXl+2c/Yr8Wey0hIX
         9i6alLP2CFPP4NgdZSIo3/2tcyCi/wY23N5+RrbicnQ98WhO8mLicOYm1W91YAxWI5Ym
         qxnISn2bxgsWhKSPZYoHan74RYmiwCkBntHhxkCAEBtNvQPSocYO/ifrARn28HJzwxFn
         4GkPRSxyiUMRDzM1Yw1qMwNGG871kWgVSfBfFJJl8RU179C5LVgClgfi9FSLfrbV/q7x
         IJRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794929731; x=1795534531;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=67Ks5b0HSYrXo9kOcZY2qc0sEU+LdootGD3SBNdOIvc=;
        b=naCemKZavHqBdMu5oYYrpm6YH561v3961Vc1hWzMpk3LW7vAAnDkKlkbk26i8T5pDX
         wU4pOJYuv913+o3PaGu/janCwpk66KpmJbdMFvTT0d2g98NM6/y1DEpH0ozbsEvM/d36
         /eKcLZlVqObZUxZSIJ50w6LZx3QSjvVtW8lUrWPbYJF952ttTMLqKQM12wlzzwm0m8T+
         nmxfRth/1IN8uG10PHKBXfFZpDP7Ph7caAGN3U+5XGiDYHDlmI1OtRZE7BdK5TbTiz5t
         X4WEBrfIDdQ8sJYWWfXMsK3kz08sTOLut3OmjnDyRbAbjJbkIJ8ASQWJ2wy+ODbipE02
         RnUA==
X-Forwarded-Encrypted: i=1; AL+hErEz9Wb58PaXrdG2mmBJ5dAnSbSEWxpx8tKg/faTv4HWZN9ob4gH+DNzhNuqaf3xHkcLdwRFjrFAJLO5+cQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+8G9sgM20Akl9qOl+gb22VRM6Vn8FbCbtrAYOmIMjDqA74BUSL
	0trZ3igU0vtDKMwC6+P+aV0vgITwaXBNYMCvbYysUYWFXxl/qBHt+F5teD06CN5iZVzB/kAm2BY
	aTK6CqTTOCYVyACVhyTlnjGwtpEgMJx1xUwHD2Wgfrv+sisOwYpvfjg6FM08kUblUWYM=
X-Gm-Gg: AZFdTZcDe2LKO9BXDzSfQ+qCmRZt1f921ASSDWPNK6x3JdxnwJLJgJNxXJC75eEWGKY
	v7S2JJV7wVAJDCuPDdmujTmDoFbyRDXmDswH6pIjo3YFohYrwk79dZSFXjhCVynRCHrodtz9QRo
	FTY3mpmpra0eTqr+LTukAVyg68vK0eVJ6LdSL8E8o8KGNsfTh2KG1qsI/2TNmvcWgPL4nTt7jrx
	W+np7yvJc45zZmeeYcdWPqcR+XtLChOYLwx/VnTAwAUgu1shfhC3Jw9d7T9TMTQnlBJX7XGTLrP
	DpdRsgiujmSTroXlZAS94jO5yBlolK3H0wAVjEbo7HSMMTEroDzB13EMS12Bt+J0f72Dk6t+V7l
	40LL33T15uvvb4Y14eSbA7DpjhbXZqAok4uqPtEka2bAVj6emkAaIBcVfk2zn5iPZfVoT+UXlhc
	dd2g==
X-Received: by 2002:a17:90a:f947:b0:3b1:2810:dfdb with SMTP id 98e67ed59e1d1-3b1b0b86ae0mr13484099a91.48.1794929730648;
        Tue, 17 Nov 2026 07:35:30 -0800 (PST)
X-Received: by 2002:a17:90a:f947:b0:3b1:2810:dfdb with SMTP id 98e67ed59e1d1-3b1b0b86ae0mr13484075a91.48.1794929730181;
        Tue, 17 Nov 2026 07:35:30 -0800 (PST)
Received: from [172.20.15.99] ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3abec8092sm4658652a91.17.2026.11.17.07.35.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 07:35:29 -0800 (PST)
Message-ID: <443de2a5-d6ca-461e-b842-47b3acbf4031@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 21:05:15 +0530
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] misc: fastrpc: remove dead context drain in
 fastrpc_user_free()
To: Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, stable@kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        quic_bkumar@quicinc.com, quic_chennak@quicinc.com
References: <20261117-interrupted-invoke-v4-v4-0-2320a8a7eda2@oss.qualcomm.com>
 <20261117-interrupted-invoke-v4-v4-1-2320a8a7eda2@oss.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20261117-interrupted-invoke-v4-v4-1-2320a8a7eda2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=eqFKXYpX c=1 sm=1 tr=0 ts=6afc7443 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=tAvVqsXYnFiDWnUM2kgA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA2MSBTYWx0ZWRfX4CVEJJ+TATXg
 3flm0qEOQ+iSj8FjDQqVt9hRVTZPDW/Yra08D+LDHouRWxD50nQHm409co3WnQ4+VLt4NjFw95s
 x8f2irABuvaPUlBijjByP3ItodzNY88=
X-Proofpoint-GUID: _UW3olWvsES34Zobhq5598VsWo99F0CX
X-Proofpoint-ORIG-GUID: _UW3olWvsES34Zobhq5598VsWo99F0CX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA2MSBTYWx0ZWRfX5dsfmBMkSlWt
 YfpThU1mDmRUWUvmnY8QXCUYuEr48FVkwU4IBb2CFtYL/W1hSekDr411Y67JLf4nyNoAKiNZBVv
 jWddAmll3dIDZuECbOCuL07F1SR/RFKea7rKTtKrV1iFX3vrCdYi7Bb4oWOpsY9oljwrrNNa9bg
 52Y1JA1iYChOtvb+1MofxpnS8liXvmoXDz5BrYa/IjQbpnxGZ/0f99qUvFMqNhPdsSO+riMHBWj
 uaZuEvf3IZdNaArQ7+H79bN9vuFUnf6UkN+D5MJz6IAewqEjVPzR2YroV7iPSP37tLI3Cv5637b
 KHMUnZKWulTRnL1YCFdzWgT1vVLNnTz/Fd/FrlVpm7GDd1Xf2q390xwFdFFbSOQiI/dkUvb95fs
 HWxzg4HBWW0bux1aCDNfJ9gRsrUk+pLVdHJAFFrzVGRkxyVPC5xSpslqa27QN2njpzRyaoddMDh
 1rjccsMH3x8ouiwuFYQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_03,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170061

On 17-11-2026 15:09, Anandu Krishnan E wrote:
> fastrpc_context_alloc() takes a reference on fl via fastrpc_user_get()
> for the lifetime of every context, and fastrpc_context_free() always
> unlinks the context from fl->pending before releasing that reference
does it? I don't see this in the driver code
> with fastrpc_user_put(). This means fl->refcount cannot reach zero -
> and fastrpc_user_free() cannot run - while any context is still linked
> on fl->pending: whichever context's release happens to be the one that
> drops the last reference has, by construction, already removed itself
> from the list a few lines earlier in the very same call.
> 
> The list_for_each_entry_safe() loop over fl->pending in
> fastrpc_user_free() can therefore never find anything to iterate. It
> has been unreachable since fl's own lifetime was switched from
> file-close-synchronous teardown to kref-counted teardown; it was never
> updated to reflect that the list it walks is now guaranteed empty by
> the time this callback can run. Remove it.
> 
> Fixes: e85eb5feca8e2 ("misc: fastrpc: fix use-after-free of fastrpc_user in workqueue context")
> Signed-off-by: Anandu Krishnan E <anandu.e@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 9e760f68bc..bb0c304196 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -568,17 +568,11 @@ static void fastrpc_context_put(struct fastrpc_invoke_ctx *ctx);
>  static void fastrpc_user_free(struct kref *ref)
>  {
>  	struct fastrpc_user *fl = container_of(ref, struct fastrpc_user, refcount);
> -	struct fastrpc_invoke_ctx *ctx, *n;
>  	struct fastrpc_map *map, *m;
>  	struct fastrpc_buf *buf, *b;
>  
>  	fastrpc_buf_free(fl->init_mem);
>  
> -	list_for_each_entry_safe(ctx, n, &fl->pending, node) {
> -		list_del(&ctx->node);
> -		fastrpc_context_put(ctx);
> -	}
> -
you should also remove the forward declaration of fastrpc_context_put().

>  	list_for_each_entry_safe(map, m, &fl->maps, node)
>  		fastrpc_map_put(map);
>  
> 

