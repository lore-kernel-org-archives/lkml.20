Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794930588;
	b=YzWDi3lPDof95eOiRD+IruOoXKLurElg+ZhpVu4f96QNN5EpF0t4fXCAKIfQZcMMM/nS
	 BPgOA4ZxJWQ+6XYaMutFkYfXzjQN1bj1cIvIXaQI5wl1NqtP8Z8rYiPqtv36H6fRUkKL/
	 ZvPNuBPaOII5p0PCHvbkQU/U6FjZqk5kFYoHG2Usg5FCcxaImgbYFzYUA+1/026jjCkO9
	 /YQloR4hgDlON9JeUEO3RE3EBI4I77Xgy97ONrIcOViLXe3cA9GP8Fd0EYB6+1FMTa/uv
	 XsEnOjJ31hNqRsDJj/WO1/56Tp6aYCaVVdB5z5Ozdvm3h0dmwapiq9UoBC/fgepAIEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794930588;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=RqqATJMJCjsooN6FrDKpV3FwcVUNXaVpOA0bEdXMNXM=;
	b=fcuMEfytwjUzhFdIGnm1EHrfpm4yUI7RL8vSplzrfy17f0PIsljfJ+04FfKHGX1GIqNl
	 b9Antr6MqvEERNVvK50zTjvQ+gH1nkF+ZNamwVxthd7ypUoZThVwVXlGpI+GHaYXBux/b
	 V1C9ocHdbs7nCD6EsdSf+T133bbi7xYLRO9l+V2BbUjftHBSQ766bEQ1/1ETTiMzhVDeU
	 X1NkJ0sFjsB2vFFENlpRCpC4oLY9sKZZ4stgc3SEBXjKKf8g9KABxIuPWRtfNx0vkhrwx
	 bIkwWUJ/6qXsd2Yj0+4bNJN+Cp4BDBzuCzMzhG/Yrk90PX/9CdcCgY0Gzea4qpE30GA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=X4V6PHMA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="EwwO/QYS";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A400606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 15:49:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A400606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=X4V6PHMA;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EwwO/QYS
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHFQLFf923193
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 15:49:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RqqATJMJCjsooN6FrDKpV3FwcVUNXaVpOA0bEdXMNXM=; b=X4V6PHMAt/ILcHjo
	1Vq3/EoGUwQ2eP6Xx81LWw7XpFRPuFdkCTB5BUy2tFUtX6le1KWZjWOlq/lu3Skz
	vhiiK33lWjl9zF0mLUKzidsWHSfbuaXOdcvriUWTMfqABaTdHieSDeIm4NLTkGUU
	24MKhgDb3GLiIgz3UyrvJoY13bxQfzAntNMd/RoEH1PS/Ipo/fLM78C/ZQTsApbi
	HQF5X0fNjcMuYWaPpfua728/WkRHGV5fyeppeLAq07IfSWico4aUlHkyHqgA1HWA
	YIyprekKOCKDNDvWlZ4WzwcV0sudgi0axkeBPkTvV3nxrb/0K1dOUiwHaVj9lTbW
	qVAX9w==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0qms0qkb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 15:49:47 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8c5408e418bso324571b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 07:49:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794930587; x=1795535387; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RqqATJMJCjsooN6FrDKpV3FwcVUNXaVpOA0bEdXMNXM=;
        b=EwwO/QYSxn9kXpjw/2MOWuKOpSOfGhsxbmQ8KLKreW4pHx14cKGphVBA6xzVWSFLNw
         jpsW+0HAU11FovLvf3esm8As39hS1m1ofVV/RW4Jli+P28XYr2dfBJdHa25r/wedN8Xc
         LuSwbZ/K5kDPNXwVUs3PTijVLFMSpe9oF7z382dJIdA0wTtjl4KC9SViiM0bIPyoVfPF
         pMB3VFf98xnOHIdTkdctbNi1JEMSvrqWwnKL7rJqjnKn5jnt2IpNs0W2LT8JQtwHEmV4
         yb3gZQH/OGPD2/vEuNWLyWBPHy5NyVSJBOlnz5snmls1r7pcTiX3sbwkb76HeZMkk0BF
         I7Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794930587; x=1795535387;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RqqATJMJCjsooN6FrDKpV3FwcVUNXaVpOA0bEdXMNXM=;
        b=brCj9Gctu/mysBk1/agJMwX3Jmzw1z0KIp/I9ptr3aAeFFS2meSKQdbGk3SKYtyrZV
         yvu0e+2FlJD0BPW2mazQ9tc/Yse1QC5WdCBPJVwhbFXni78Axybp3veOkWyKHio6JzHB
         5K1oa9kOHh8vCu6rWfuVaAyl4S5y3JwoD28x5i564hUW6UEgNBTR7GQe6O1w1r7Epuzw
         Mj97HE9NioA1THBeyv3l1qc4T/c09Sh2D6wT0nb9FNjoRJd8NJs244Hvx3ivwjW44/1v
         5HMdofiQLKbEVjtqQ+iP4stOzOmLdiMP2hxhELPrh8ykbjVJP6jzFoO094wrVtKntC8N
         6BOw==
X-Forwarded-Encrypted: i=1; AL+hErHMwsea6YGkT/HgVgx9sTbEZ/isEx81wYHe/e3vD8E6fZFo+D8ODv/GgbvvCuhtaEuwSbtCXevX3EBkhBA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8FU+OlgvyDbztFRGcTIb/IZeZMBlxS6xREjG38SJfLYAJ1wi3M
	YgC1Lo/sEifzOxBH5XSvqYfyvgCwJM2GamEUzYfXW+/MiB1nnMfv7O/dBeMgkmwB2yav06G+3xC
	Umvz1bRftrQ+NT3eEJ+QJZWY/Q4oNFmKOOnqgslcQzU866fsKI/81JTt5/J0DDEJXCgE=
X-Gm-Gg: AYBFou2SG8oMRjWPX36YjXeMFKSPkucMgkofDm6szK9cSzWWciUL5EKcReuYBTO5H92
	7tdJ914CCOJxkYxO7WNFkWHuwMsXuAcXOlCuefPHBrNzfobdknpaX3/6ThTSE4KB1Q6D29HTV9r
	DC/5cdFLNATPTqknhoEqq6I434/TeAPTPCzrah7uEuBPFvdnh3G6ri59xWofDAtWkntdreBufai
	yBEwZv8nxy3XKYWmOUM0H+5vPiz0yi8wReiCgR5FIjK+dua40bO3/qK2sbby8K8X2RhDWVcwcUt
	aRU68IGRRgSuhlsOBxhb50Eq3/ltge38aiFOtRDpxjK4AJtbsYak4q+K4xuH9MUei22uqfxhYD9
	ehInKid+vELR0wg1F7tRdjOmWY7gcU1f5aF0aVEBv2ykjQGtCFtHSSG/BIaaX9Timo2X0g/OMTp
	qBsA==
X-Received: by 2002:a05:6a20:431b:b0:3f8:f792:2373 with SMTP id adf61e73a8af0-3f8f79235f0mr12126565637.48.1794930586631;
        Tue, 17 Nov 2026 07:49:46 -0800 (PST)
X-Received: by 2002:a05:6a20:431b:b0:3f8:f792:2373 with SMTP id adf61e73a8af0-3f8f79235f0mr12126525637.48.1794930586048;
        Tue, 17 Nov 2026 07:49:46 -0800 (PST)
Received: from [172.20.15.99] ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed12a90f1sm5515688b3a.19.2026.11.17.07.49.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 07:49:45 -0800 (PST)
Message-ID: <d38594cf-5359-4862-9e47-81e15ab8fd05@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 21:19:31 +0530
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
Subject: Re: [PATCH v4 2/3] misc: fastrpc: drop the DSP-response reference on
 channel removal
To: Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, stable@kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        quic_bkumar@quicinc.com, quic_chennak@quicinc.com
References: <20261117-interrupted-invoke-v4-v4-0-2320a8a7eda2@oss.qualcomm.com>
 <20261117-interrupted-invoke-v4-v4-2-2320a8a7eda2@oss.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20261117-interrupted-invoke-v4-v4-2-2320a8a7eda2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA2MiBTYWx0ZWRfX45QraLoPjY+k
 q3zVgcNPS1Vjq2tdRSQRgysyM5xzusVz9mFya/p2oYw8nYX2atjEqfDZkgnQNgWfV0hhhmDuPYo
 cYgLuqHUBU9uhMwHjmVFe2ZaCoXqNZM=
X-Proofpoint-ORIG-GUID: f1tebaFD3vzRON0UuLRLzUb8KavxWRvp
X-Proofpoint-GUID: f1tebaFD3vzRON0UuLRLzUb8KavxWRvp
X-Authority-Analysis: v=2.4 cv=BIEmP1QG c=1 sm=1 tr=0 ts=6afc779b cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=1jytM14GPKulnBB8BfYA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA2MiBTYWx0ZWRfX32zDX669wOik
 nWQorGolzG9fUKMizccsuOcy+PdKFQvQo3YLNl6Ufka+1L66guu2NrR2Y4ZndUh/PyBZJEt0kf3
 sxnPjjhMb+8IjX58rUEfTYpxruoRXYwiTdp8ZXV+Php9fxGBa0sF9kW0Dq84Iq6jG3YFac/dtY1
 ZcUeUY8co2qIZK9iMP59lAeSAZ1WQL54951ZKa/puERJICu4VPmuKeh4Vi3lyLFw+VPi7fpC3+0
 PLFPs/Qua56wc4mVQX8jRuGMX5ylv3DqZsSMPYRbaatHW9Vv5mJU/fvdoR9rwswZoi6IvFxiBZb
 bMWZ0G7+8u2OHa/Pb/jNsJuTTs0U3SFDiQKK/A6ptl/SJ4GwaBA7il3lTLbSN913qE2ClPtYnX9
 0bPuldfAC+WPVXriqlBLBSgyQ2qKWnnpSzdYfW5MYyX4kC/Cm7XFrnl7kaYyXNvtrh//VOeA29o
 xqQgiYCGdCUqOgtsfEA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_03,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 phishscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170062

On 17-11-2026 15:09, Anandu Krishnan E wrote:
> fastrpc_invoke_send() takes a second reference on the invoke context
> before calling rpmsg_send(), to be dropped later by whichever side
> consumes the eventual DSP response: fastrpc_rpmsg_callback() for a
> real reply, via schedule_work(&ctx->put_work).
> 
> fastrpc_notify_users(), called from fastrpc_rpmsg_remove() when the
> rpmsg channel goes away (e.g. on subsystem restart), only completes
> each pending context with -EPIPE so its waiter can return - it never
> schedules the matching put. Since the channel is gone, no response
> will ever arrive to trigger it through the normal callback path
> either. Every context that was genuinely in flight (successfully
> sent, not yet answered) at the time of an SSR therefore leaks that
> second reference, and with it the context, its DMA maps, and the
> reference it holds on fl and cctx.
> 
> Schedule the same put_work that a real response would have
> triggered, exactly as fastrpc_rpmsg_callback() does. rpmsg guarantees
> .callback and .remove are mutually exclusive for a given device, so
> there is no concurrent real response that could race with this.
> 
> Fixes: c68cfb718c8f ("misc: fastrpc: Add support for context Invoke method")
> Cc: stable@kernel.org
> Signed-off-by: Anandu Krishnan E <anandu.e@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index bb0c304196..c5c3679f87 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -2835,6 +2835,13 @@ static void fastrpc_notify_users(struct fastrpc_user *user)
>  	list_for_each_entry(ctx, &user->pending, node) {
>  		ctx->retval = -EPIPE;
>  		complete(&ctx->work);
> +		/*
> +		 * fastrpc_invoke_send() took a second reference for the
> +		 * DSP response that will now never arrive since the
> +		 * channel is gone; schedule the matching put the same
> +		 * way a real response would via fastrpc_rpmsg_callback().
> +		 */
> +		schedule_work(&ctx->put_work);
Can you check the sashiko comment?

https://lore.kernel.org/all/sashiko-outbox-218551@kernel.org/

>  	}
>  	spin_unlock(&user->lock);
>  }
> 

