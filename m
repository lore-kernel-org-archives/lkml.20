Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD2493B14D9
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 09:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791279024; cv=none; b=aBpCGMYRHt8jaXx8XJjSSmNSIj0fXt6hQ+pP7RhqsqlfX0kymO/hCQnxU443OInRBDzGEqwHcE2TYFY6RDg/CD/xh4swxN1l6bi7DUmPaa6YnPX/ITX/M1d6QMHPVwmrA3GcUBGlC8IVIMjLnYxFnoiwK11qaI7qOmhn/A8xgMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791279024; c=relaxed/simple;
	bh=Fv0hBvkz7ho20ttuSv2niqkqp5+xuqgKds7jvqrAZco=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xb5m7fIHr5w7V+iDyu/Amr+3dXxcgCbbegbbeZ7uNflIIwMHKFUB3roC3nBqmMh4vtW5ZtSEa4r7E0Q37QCQzLO8ZE8LphuR1EhBNDjOpLg99f93YZ22jLEcn5AwKd1BXIw58wRNExiWOmFRTcz75p4tyhFFCGkhEIR1zcSJ/6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KVSTeQps; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fx9+ZWbg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KVSTeQps";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fx9+ZWbg"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6966eDAm2834150
	for <linux-kernel@vger.kernel.org>; Tue, 6 Oct 2026 09:30:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/jXVRZO2rth4o58n8sGnnHZ2
	wLu4POvMIWBNar58HYc=; b=KVSTeQps/CUFDHfJdbKouCv66YK25XM43DixqsvK
	G22zw4xQjZkVMkclELnop1m7xLdKSBBsqXfgE2MTYptgYhQbkUhVnfJQ872dPIr1
	hicVElgbOaQ8WZEeICTiYiAW9O9q3LqKAyfgXn3NKud3gBrmY8+sDNu6HoqmKXGH
	YRfuCBECyYSZmRSAqHi93GG7p4273a7SQHrlqNDISizy4zRQikKi80m1h0wbZEfz
	u/U50qZTNcImL7JwRygaxD/Ck2K79K4N4ZEFY/9QtssZCOS1s3oo5Sx4WsAzNIsR
	H4wLlolobvSQKWxjO5eDjbdBYBLtQlxvio65IEFSpsVXSw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4dnckujt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 09:30:22 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-155a75f91e1so1818573c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 02:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791279022; x=1791883822; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/jXVRZO2rth4o58n8sGnnHZ2wLu4POvMIWBNar58HYc=;
        b=fx9+ZWbgk+lxBu3idfpbJs50QehfxgJ7MdlHkxb6hlviPzfwdpuQp/ZQv858h0sV4J
         6dvZGqefF4Ih6JbOMHsd0eZUUA5dPJp6k/wHg/10UYTbNyORUN2ZSPc20I99P0RI+Ix8
         p2xJAn+JCxyoR4alV3Jnnc63WFq/Hu/yDfV5KkjznJiJ0Go43aDTxJ+cs4KVZG/opjCj
         5jx4FvVqszigUdCpYL+BAkdvIPAmrDUtFx0+mEAqGtSBqL62uEfcdDS3qdGk/hBINEK8
         8tivuvaygwYHZu4RWpFAtCwdmGBU+16X9pxM2tfb12MyMWeLed9TQ0GGG0UaGzV2F14C
         8R+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791279022; x=1791883822;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/jXVRZO2rth4o58n8sGnnHZ2wLu4POvMIWBNar58HYc=;
        b=i5+JU5azFz08nMYQExjOiqhddaKah1+ZVv8QXtwSs9678CH4uIdTiv5QXhjCb0C5wa
         YD1+0wpmRuq+83XgTW3hXXlaQy0IiMsD8IjqkqCfgaK/wmLytNGDfy19NtxahtYUrgzA
         +3SX1iS5SaqE8GgkL+w53kzB85nKgWiGQxz52Iow7OmUgOGAQ+0zgc6zkgpofH/BVeHh
         uk4akPzdIerfxDhcyaXQ91/ondJmpFEHnbOjFEHGAr+rqPHUcWdKefjMOlPORO7FMLne
         kOOXt6kUHy3Tj1uwtKBCovFKp295ovrrX6eQ7Lf40GdA5c/UaBy/3hNxFPCZ9gYtWk2q
         pdKw==
X-Forwarded-Encrypted: i=1; AKwUvBz5SejqvEfH8eo3rbSqKkBHbJi3NfZ0h1VdfwHFFQ4Mzl4gCG/03cIwbJnbi5Uu/MhYM0QRXwPfJqrqI10=@vger.kernel.org
X-Gm-Message-State: AFuF++kKbcGMjHR75vrt3K2rjp3/cG5iA60EzlTmlzM0AkzRT+FbLz9/
	c0wVf5I1qtt3qPfETPHupuB8vfHQY/9QunToAhlGZguZpLe/QJoKown1qKc1DAs+OE3xvcJYjgN
	Cvis0xwr20HzK1gQXyW3d3QjBnVOFH1PE6sZWB4ZFfjLKo4bPcTBEBGItKKslU66euNA=
X-Gm-Gg: AYBFou1H4WHsmHCH0xjrYJ2NFUYlQ849oEPD+uxslGgL+WTaGF0jgFwFajJD+RgsyTP
	LxkEzJ2cZQh4rCnZMaHYhtFMQnboWW8oABNi023dzhuLyaBoPp9vEOuS0y0rVZEo0NC+cFb1rBC
	U6sG1Ej5DF7Nr+5sdnU8MaYPyg+tgnyJhkV6LsFIYkKS9z7E3EAb3BypfPuaBfh2Ij1cOCA1CBl
	a8D6InIw89lclMC8reQiJifHZndWXQSvAXt24hWUnPI+mC6nPEfG7WmahU3SqA59hfWaEzveD6b
	LNMfL3x+Df7mJHWgGza3QxkP7UQ8MwUk4xm2Cb3ma7auSIJSoCmxTMtGGolM7g1S2W++blmN2Q9
	rIs3rKwHcBRQ3M7NLYoCkxVh5LQ==
X-Received: by 2002:a05:7023:a4b:10b0:155:734:9cc9 with SMTP id a92af1059eb24-15d301f2259mr2420963c88.16.1791279021396;
        Tue, 06 Oct 2026 02:30:21 -0700 (PDT)
X-Received: by 2002:a05:7023:a4b:10b0:155:734:9cc9 with SMTP id a92af1059eb24-15d301f2259mr2420925c88.16.1791279020728;
        Tue, 06 Oct 2026 02:30:20 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-15d82d04332sm5850583c88.9.2026.10.06.02.30.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 02:30:20 -0700 (PDT)
Date: Tue, 6 Oct 2026 15:00:14 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Huang Yiwei <quic_hyiwei@quicinc.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Jassi Brar <jaswinder.singh@linaro.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] mailbox: arm_mhu_db: Remove redundant
 mbox_controller_unregister() on probe failure
Message-ID: <20261006093014.mak7ctqf37c22l4o@hu-mojha-hyd.qualcomm.com>
References: <20261006-b4-mbox_double_unregister_fix-v1-0-9011ca208d36@oss.qualcomm.com>
 <20261006-b4-mbox_double_unregister_fix-v1-2-9011ca208d36@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261006-b4-mbox_double_unregister_fix-v1-2-9011ca208d36@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAzNyBTYWx0ZWRfX6KeT3Hz2Uek8
 DdnbdObD/cyTuISianwWlN67KWf6x7LLZdS4UjtKlvoce8x9eEq+wS4n15hGE/Y/sR/ql0LPVdn
 YGwrB8DOenvasNXxh0nrZs1rqMJWupM=
X-Authority-Analysis: v=2.4 cv=Vdxir1p9 c=1 sm=1 tr=0 ts=6ac4bfae cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=y-iOYEGbE81HM73byi4A:9 a=CjuIK1q_8ugA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: 0qPnEOuDQ4sRPaHiV_q3aoCFiUj2JCrI
X-Proofpoint-ORIG-GUID: 0qPnEOuDQ4sRPaHiV_q3aoCFiUj2JCrI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAzNyBTYWx0ZWRfX8e3XwJBrmWE8
 8w0T6PeK4DxzKPZOp4irljaF08+4mgf0dRkZl57CF9Iv759oQxWhHWpx0nFGNAYSr1mbZsnuGCe
 YVym8W+CHOCSLlzWtvD0JSHzcNtWCZEcGGBzlg6TaR7WlnvRCgYplK5kpO9lrOBWsgD8+C/nGqe
 LGf1qfeqBbxXJ9nstZPp8R4xFWMiXbvzs9lO77NyPn6BifUySJCyaZq8ueTc2PmvmgE6Q/zrF2o
 PV5Kw7C61PG7bU4/o5HrTEOtl9i/WRQyyEUuIHI73fWJRR+Y7dAErg4dNdbZVz/SPLcVdopsEeJ
 PdzcDiO1eEaN8gY1/5C2iJHjxkGV6yKsf3dj4aqMhNf13Unpi5tyH5PO3rGlETjJhQhCa7vPBds
 gc2hWMaJH89e0R/8RbdSQ5o89iRo9QKe0e/Xo4Jn0iPb6tx/HqCJoihlE9YLShmYF/8EVy3Zpka
 3W9hoVHn0Ce5zozGvdg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_02,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060037

On Tue, Oct 06, 2026 at 02:44:15PM +0530, Anup Vishwakarma wrote:
> mhu_db_probe() registers the mailbox controller via
> devm_mbox_controller_register(), which automatically calls
> mbox_controller_unregister() through devres when the device is removed
> or probe fails. If devm_request_threaded_irq() subsequently fails in
> the channel setup loop, the error path also manually calls
> mbox_controller_unregister(), resulting in a double call that corrupts
> the global mailbox controller list and causes a kernel panic.
> 
> Remove the redundant manual call and rely on devres for cleanup.
> 
> Fixes: 7002ca237b21 ("mailbox: arm_mhu: Add ARM MHU doorbell driver")
> Signed-off-by: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
> ---
>  drivers/mailbox/arm_mhu_db.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/mailbox/arm_mhu_db.c b/drivers/mailbox/arm_mhu_db.c
> index a39239e38a47..9668dfdedc78 100644
> --- a/drivers/mailbox/arm_mhu_db.c
> +++ b/drivers/mailbox/arm_mhu_db.c
> @@ -315,12 +315,10 @@ static int mhu_db_probe(struct amba_device *adev, const struct amba_id *id)
>  		mhu->mlink[i].tx_reg = mhu->mlink[i].rx_reg + TX_REG_OFFSET;
>  
>  		err = devm_request_threaded_irq(dev, irq, NULL,
> -						mhu_db_mbox_rx_handler,
> -						IRQF_ONESHOT, "mhu_db_link", mhu);
> -		if (err) {
> -			mbox_controller_unregister(&mhu->mbox);
> +					mhu_db_mbox_rx_handler,
> +					IRQF_ONESHOT, "mhu_db_link", mhu);

It looks like alignment/indentation is unnecessary changing.

> +		if (err)
>  			return err;
> -		}
>  	}

with the above fix.

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

-- 
-Mukesh Ojha
