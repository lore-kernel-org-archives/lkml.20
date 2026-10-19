Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E4CC23BCED
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792394746; cv=none; b=eq5vbyN6drpr+gN/rxZsTh3l3LKvb8T/L6RG4W0PXodoN8V1k2d8UeecB9yuwu8f2r3R3PWNHRCdZvoCJ/l5TzPlgIq7tMy/Qf1weoDuKK1XtRhYrwY2TWOqvzEl/fZow0Ouva5IaWeb4UZr2uQR7VXECPPVVf9nglCl35Mr++o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792394746; c=relaxed/simple;
	bh=xWF+QRQlDHw2ZGGPr2Qc+26xZ821hZboGpCCtUdZvxU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rL8LFr012w4d6hZV0q6tPZPCEWVyDpExEWUUnpl8a9oTa2AIM7jxIfMSi+JRJzdwhgPQuGz0wRCux/u/S6Po7DDvubKfr9PzD13hmHZiVs1aQWUrDCceD+8LAbYjn0Pxg9LB1iZZ4bWpL52CDWxDDNUNJngOL0tqO9OY+i6UBPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EOjjp3MU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NUcFSnGl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EOjjp3MU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NUcFSnGl"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J4j2kT683349
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:25:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0ZT348g/Ac7kP8wYr12fgEIsNfhFaNR7Am43qhu+KN8=; b=EOjjp3MUSkwizsaF
	IqkUf91goeslH3UufT6jF6APm3EGqyy0/qSkQ6MyvY94WHeIaIiRgDBdJfghrKBW
	7wiPdeFoPW7S23M5fM3jWZ3puEOO5pu0ZZRVbtNEwx+5jhI8M6Ca7KLtx0afIJQ3
	3FHT43/fA0ebJJXNuvJSyyzWUMMoGTZtQycKEgy2ogxNnDG719aRdz+f9nTqfF2m
	bitzrigml7eZzC5+DWB9TYg4vy1FM/+hC9WPLCDR82D3XK52nHyvsvFxUsZr0z73
	xBKknc8RKPp1Yql5Pl0yMzxv71vin9aGfxmFJvFBQIt7nsnEKQfDuyCaV4sKjRpc
	swkLHw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc1d7wevu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:25:44 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3580c07911eso5571265eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 00:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792394743; x=1792999543; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0ZT348g/Ac7kP8wYr12fgEIsNfhFaNR7Am43qhu+KN8=;
        b=NUcFSnGljXzNoMAvU3ErXaaZq05yLjRSya/+prWbwpqQ1pyx7XWzFiz/WWMuLVkRoP
         //2lyvegiJEQ5Tz0AEPOtNshalk8swUBanNNKx6o/q6bX8jzwo02fDRf87YiWBr7f8cZ
         pyW+lFOqFSUs8t8apTedVKVtf1n2hVhOdQw94feCWKO8ASS+WkXXSoHv+5+4TKPcQPEG
         3SBj7eGIgxFFI8ADeDz8eQezw6+Zb828hNglHWaBLCh0AwLwJyXeh9VG7Q4H5NpJrSSa
         uk0YOYaQ7V2Z4gAsF5mBFatEcqZhrnoeI3Hoo7zq6s6XMvsDdNiqmnMjZsj9o50FKov6
         YZ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792394743; x=1792999543;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0ZT348g/Ac7kP8wYr12fgEIsNfhFaNR7Am43qhu+KN8=;
        b=TY2ho+ze/cCFgbjwp/+9LPSz+U4cKsnJBwkLVNDxtYorUFdXREqxzaEm/q/vADlcd4
         cIph1sA0F8vVZ+Unx4K+P3g2gv3Rm4GqWkV7j6kxbXf52xRgTVGc1AmZxnRzmTwAmWOu
         WhGxm9NPbsvAXEZpKnkpFqUAepRNBrCgJLnpcE5/ZM0I063jjty8w9XmGYkyvClH6ZcR
         tJKBwrgYFjqWBG4JnGUzSU7+qaH5G5M8nwArnPTxwjHE1giwnfsUgcBnrr4uFlvdGITQ
         8UKxZbUywuUwG0lZunefIsvhID3bjBmln8/++7I9oWrM37ymo1D0REqcB7MTHUKaIHjm
         RSww==
X-Forwarded-Encrypted: i=1; AKwUvBwnCamBWpHeqLN8yIpxtSUgFBQQvAYma2DcZ4tjHSAxi5LWqcaC8KtCmrvt2fMsU/JKOZBr3COXWKSZOa0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJaAAm/JT41at3EOHmGGk07pXnC6d2qxjRQ2c1fGrmsyLVPX7R7
	oXs1ecOTEAhFcaidm0k9bb5Z+AeisPjefrbs8PTEYF7s6phbmY9SsxuTaUkDissm2Uqn3P63f28
	YlOk7slp2O1phocNKfgl5W2FJ4YHwx3zXcHVQDtMzc1L1nodfc6Lz6Bcwgjr7CIF0anY=
X-Gm-Gg: AYBFou0RRm6iHrZTJSk/3bBfpB51lKdCiaqdI8kh7O35obWJh5udMH4qFpAlS/GrSf7
	S/kVf813WxqBAWPbgzzkChZasSo16pw0+5Q8aJSJut58JurQhFe0ZdJJ4SCOzSd71wxR34uJJjL
	h+WLQaO5VdPDiE1eyZlo8ct16HuD7n62QE+eukvyLVpPxqx7iTulAWNc+mrnW7/rI92VrKut4T/
	P80ev6ilOweJcvztwtaorxQujIz8vwlf8aMCVSpDIhvun2ziB/58651Dx4bGV2FksX6wAU0JvLN
	OjUi+qjzN4W86bfOXJFPJK61HlKnZv1LyT3M7qMWCdAXTQHrXBQ9ojTmbjN2KJI0hKjjawpT+Wo
	YJ9iOfUlZdG25s1YyBQwMcUYs
X-Received: by 2002:a05:7301:2a9b:b0:35f:6d9d:af68 with SMTP id 5a478bee46e88-361a1f4fa38mr9834547eec.23.1792394742987;
        Mon, 19 Oct 2026 00:25:42 -0700 (PDT)
X-Received: by 2002:a05:7301:2a9b:b0:35f:6d9d:af68 with SMTP id 5a478bee46e88-361a1f4fa38mr9834518eec.23.1792394742408;
        Mon, 19 Oct 2026 00:25:42 -0700 (PDT)
Received: from [192.168.1.7] ([101.0.62.42])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3608258aa66sm37292247eec.20.2026.10.19.00.25.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 00:25:41 -0700 (PDT)
Message-ID: <dfe968ea-d123-4e94-9a6a-5dbc21ae431c@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 12:55:37 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] misc: fastrpc: wake poll-mode waiters on SSR
To: Jianping Li <jianping.li@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thierry Escande <thierry.escande@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com
References: <20261007084447.922-1-jianping.li@oss.qualcomm.com>
 <20261007084447.922-3-jianping.li@oss.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20261007084447.922-3-jianping.li@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAyOSBTYWx0ZWRfX5i8aQRk3Y3jF
 sQmb9yJbG24gKW9/VZOovtF3CNAGf0AaW83JfplT0VjT3LpXXgYN3RQEJ0TS8bxZzQbOGMHAO/g
 l4odoKJKE7QGeMfNPEtyVBWlB/FTBd8=
X-Proofpoint-ORIG-GUID: E9S4G0e4Er5Jbt0hoGUKsN5tuyR5eVEs
X-Proofpoint-GUID: E9S4G0e4Er5Jbt0hoGUKsN5tuyR5eVEs
X-Authority-Analysis: v=2.4 cv=K4O3jCWI c=1 sm=1 tr=0 ts=6ad5c5f8 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=sC8K8RXUWm68HHFV/PXcoQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Ibi0DqZ3yaYieqUivDkA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAyOSBTYWx0ZWRfX+0djjUBpV3Kc
 rE5FUYEVXvcf8HaRVvg9Mzg/TM9Yu1GLOGoFpIOawW6ygRiFM31Yk0vlsX0DkGuYUojA/PUwIZo
 y490gGh0EI6ITWXFyF2Yr6bb8caegxqEnVzrNditKuFHlkxdtgtnRNjwU+6PLaltxrqkI/1Kzl4
 XwsKFffARezL06mFaWVrWvffModDxHIyImdsZBJPMGdf3orm5zfQoDIPov/oPUEfKmz9GWKc4y6
 8gJaDbddnU9tUit+jdDtsbYKqte3Q4cUJT4UGxBalgh44ATjqsD6UrZd7HEOxsoYOn2oa1IwAZE
 BZHixg5wbmB5LkXCo4MVQ1AHsvA+DUoHrjLC3B0ZwGGJr/iSeTQNtQHyNFFQ6fMka6Dr4nV8fc8
 3x9YmusJX8GNhUe25HkyhRDQa/Zi/0ZIqlFF2yoMtOM3mmhLm8M08XkH2xMPQIR6c5NilorIKaX
 60gAT/r/hF/AFKPpBUg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190029

On 07-10-2026 14:14, Jianping Li wrote:
> fastrpc_notify_users() sets ctx->retval to -EPIPE and completes
> ctx->work for every pending and interrupted context, which is enough to
> release a thread blocked in fastrpc_wait_for_response().
> 
> A thread using polling mode does not wait on that completion. It spins
> in poll_for_remote_response(), whose exit condition is:
> 
>   (val == FASTRPC_POLL_RESPONSE) || ctx->is_work_done
> 
> Since the DSP is already down, it will never write FASTRPC_POLL_RESPONSE
> into the poll address, and is_work_done is left untouched by
> fastrpc_notify_users(). The thread therefore keeps spinning until
> FASTRPC_POLL_MAX_TIMEOUT_US expires instead of bailing out immediately.
> 
> Worse, the poll address lives inside ctx->buf, so a polling thread that
> has not been told to stop is still reading a buffer that the SSR
> teardown path is about to reclaim.
> 
> Set is_work_done along with retval so polling waiters observe the
> termination on their next iteration, exactly like completion waiters do.
> 
> Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>

This looks to be a bug fix, can you please add Fixes: tag?

> ---
>  drivers/misc/fastrpc.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 05b2e7e4ad3b..c54c450cb571 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -2663,6 +2663,7 @@ static void fastrpc_notify_users(struct fastrpc_user *user)
>  	spin_lock(&user->lock);
>  	list_for_each_entry(ctx, &user->pending, node) {
>  		ctx->retval = -EPIPE;
> +		ctx->is_work_done = true;
>  		complete(&ctx->work);
>  	}
>  	spin_unlock(&user->lock);

