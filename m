Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC9704457CD
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 07:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790148255; cv=none; b=chY9XxF6bnnL02vNeRjn3RkJ/j9KoXhtuIABLtiB2Sno1BrnFDEDZ2BY1X61HvU6vmohV44WO2JFcADPkgl0N6IIBuZ3+h9HSrJbJIK1R/26hLS7Fc59CdOLuVAlZN7XHzDUOg+B9O2K8xSrjSPMbheNyK5+McCI7JSHAnEYfhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790148255; c=relaxed/simple;
	bh=QBIdntIEmQ2xP4wCJnqN+jdkIkfhSNrtafmsVMgAY7g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WY0a0sIcV1B0Po17P+AI5E0Ot51D/nhXMBTJ9Huwt3GzJklgDfvZ7X0zbSldrAt6zzzOw6M7achWp2tP/xpK7Z1cKQRT8AI9PRagGk0kKFxaznwi6YjBIOkLhF465RFzfeacdB5ldOUFfbuvtZsT5uiyYmVogNhceLl7Q+ysS7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g0yvsq6d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L8x7ftgr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g0yvsq6d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L8x7ftgr"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N79qp73697003
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 07:24:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=StiXOR1Zsa3I0z00CmFf2gan
	ziT8Ta8TYsM9Gw+uB28=; b=g0yvsq6d5oCjyfsqZrZaZSfd0tFoGa2BjLpF/wJA
	9reZEj2Pga9fOwQlD325v/Qj41H0o0J3bihG3e7RFT+BiwoFCfHjKvqY1pCAaWQA
	/Be02QE+B9Bf4NfV74Lsg9UQznMxAn7x/PD3oDj8EKC/Fl/4wVg5TnAd0rd+gWTv
	C9pPKGzo2wfciHYb1AjQwNbC/sxtiI8Acuced3jobE+ehbkuCie4xs1jLRnV2xW5
	hiFBb6VlkwLwccxLA8F8HJfHPB9psKpv9440ItbZAMMCtPzy648nHDflgOtGlP4g
	/22s6pFbkzaM5AKAbdWgt2aYk7kbpWBAUI7jE5D6GIuyCg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gux8c32x1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 07:24:12 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33baaba6371so1187100eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 00:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790148252; x=1790753052; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=StiXOR1Zsa3I0z00CmFf2ganziT8Ta8TYsM9Gw+uB28=;
        b=L8x7ftgrKyLwNTLH11R/mh93W71Mvpwq9mQThGwHBm6bHls5DduKuuUI6A7bGxeEHq
         Lvf+o42i5XqK4E6YFwvab8dqwGgaXy9Z9BhyDBz2sEsfWW2RHKUL4ZSSeGmt7Ig7RRLa
         gDkZJqfYpZOiX26XyyqMpsyPqkr/nTPHm24hyQjD7KFGgxCUfn5sGZhobKKnGR7R0Q5k
         a/QCCDwoHOvMRWiTJIeyEfOQ+dqQEEBRmSnRLHdQfzvehlpvsvbh7VHNkADaNyoaedwH
         j9yqNmAnzNXVB7K6KjmOY7QC2dMgg6v3V8rzJxl+GHnsjUOsC4NZOH2GZLhMB+aAlTsA
         FjgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790148252; x=1790753052;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=StiXOR1Zsa3I0z00CmFf2ganziT8Ta8TYsM9Gw+uB28=;
        b=ludSM2w4ODwGNfs59F4hkU6cVDuIXOiqnJTIP+DQoGXLs6G00S6gmCv7he4hNGoH50
         1jqZCJQMJ/fvzxl8clnkLuCOg6any6cYoQBnI74XGEF/VCQhfQfFi0toBpnHZ2zR2eVX
         LKlDM/qZFtNuaDzfvGbG7V7YrPSuRYmkfL+BehsesRjoZjADquSGXWl8tREmjRkQKg0L
         Thpwgct8qs+Z7R/VaE44pK44jo8ws8FpKd52/JkiXILR5ZI35MnBafMSfcowYt/+5AIm
         1DVBqlpTrwlDtHZGO7xKN1/E0WzGaQnVE1U2JoZZ88vgauwVfDmJx5UZ7MWow/zFAUKb
         KEBQ==
X-Forwarded-Encrypted: i=1; AKwUvByrxUF7LcX5ywnlT4xna/6DhgEg3kMQXQhkaUihZxrXYRD9IevTt0g3YhijpNzxYFjUai1/Z156k1Ljnrc=@vger.kernel.org
X-Gm-Message-State: AFuF++lo90Ox6NAWio0trzIrOAlwQ2Zi+9V69Eu1n0eWfXo/jdwfsAAL
	Qyh1E+9XwF+W6GYFtxgdPj/5bFzd/R7P7s2yx44emhbR0Y5JFOmqJzAhtY2tDrKBI20J58oWdyx
	e6w256h7KG560p7Ilu83s8QzYwbCjUbpNNm9qcxBLrgecbNXoLAY95gB7FhdZC6e4ZDQ=
X-Gm-Gg: AYBFou1KkJgsg4WL7spy3MeNAdvaHXhSg9W+cVu+Rkd8TE6ngHnFzdz989iTe1pWB2/
	I5DxVjpKm9GoQQs7Q4QbbxzsAc5/o5rIydxfTNC1AGd9v79LmWHxjvW8TWULFsy7J5KOQxQ4SG9
	6KS7k4MN6aeqib1/PRfO/YXpE0EiEHoJsuTwQjp1+uG1FMvLxgnpx/8AJEqkyYeQlWubM2kH1L2
	gMYej+Hrx98VHcxIRT3qfKs0Ihl+7tgmQx1DdaS6Tk6jyzvqEHVzRj+kuxrzgyjfg+WxUM2igob
	8ovBDl0L8RF43rsh4WrW7uqFk7P7SFNQCLMVG0H3egvsRp/OXQKfRBxinKTz6qKRJJeWhX3Dj9A
	JQVNe/BF/2/oNmWKhE9lzzb/ST+auz/JZ9/Mx+nQGaCiS7/jm
X-Received: by 2002:a05:7022:29c:20b0:144:f9e5:c355 with SMTP id a92af1059eb24-144f9e5c387mr2040718c88.41.1790148252263;
        Wed, 23 Sep 2026 00:24:12 -0700 (PDT)
X-Received: by 2002:a05:7022:29c:20b0:144:f9e5:c355 with SMTP id a92af1059eb24-144f9e5c387mr2040695c88.41.1790148251841;
        Wed, 23 Sep 2026 00:24:11 -0700 (PDT)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f9877462sm3880534c88.10.2026.09.23.00.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 00:24:11 -0700 (PDT)
Date: Wed, 23 Sep 2026 00:24:09 -0700
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: Uttkarsh Aggarwal <uttkarsh.aggarwal@oss.qualcomm.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: typec: ucsi: Set ucsi->connector before enabling
 notifications
Message-ID: <arN-mTL7YwNSJKjX@hu-petche-lv.qualcomm.com>
References: <20260923060434.2599545-1-uttkarsh.aggarwal@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923060434.2599545-1-uttkarsh.aggarwal@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAyOSBTYWx0ZWRfX2f/7UV9Vv3/y
 Zoo2HhCCreqBXrdol/vr8Sw4tzoQBjGuTz7Qe3FpT/ZlxEzy2B4fZZc/MayRn9+ZgfAUZIZZOtS
 dEteG3mgPCvCrR9BzBvz78Hf6OsbN2Yjz01YqVElb9wQERsNB2UkiZrgz2TZRgNjHsDztlJOToC
 vHaWwV9Weo30hE95UqiYVG7DMV3XCM3sIqrElC8fWu/4TffW86we+u+7lYVfA60QUCbvsRMV1o3
 X5Y+v52DjuHppaodDDzWad97mL1Xwxzex5zWLHv5p5A27HGj/OvXfoMnR2Gd0P0nCDwKxhMQe1A
 8kio5J26jvDLn6W4bBUsDU85om/YpbVCEWVCmpJIOphH4dDfk8WeyIdmRfS6Y5idcbqJcPanI8F
 YUyJ3Mwm+m8iFXQMb9/9BtAbFquKGx1RIhfHtJxPZ2m/fFF2FdbaPWgsOLLafN2FvZZ55s8097i
 Qh5IODbIHklTFpHCRfA==
X-Authority-Analysis: v=2.4 cv=P9evFSAu c=1 sm=1 tr=0 ts=6ab37e9c cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=5V5iOW8oFJG4Np5ERE4A:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: XvheOOSqPeWDNnuFTksLnqCP9oVHrR6C
X-Proofpoint-GUID: XvheOOSqPeWDNnuFTksLnqCP9oVHrR6C
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAyOSBTYWx0ZWRfX9fiGXSgPE+AG
 f7/25a3Cc3YbBQhFdrGqHEvMFNjropof3FghK+oIktapqi8Oo1YXLXANXs2wZxidb6rqCme3zrC
 Paa2rvoyWN0YiPrPu/Hl16yfWAlCXfE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230029

On 26-09-23 11:34:34, Uttkarsh Aggarwal wrote:
> In ucsi_init(), ucsi->connector is assigned only after the
> UCSI_SET_NOTIFICATION_ENABLE command completes. But once that command
> is sent, the PPM is free to raise a connector change notification at
> any time, which is handled through:
> 
>     ucsi_notify_common() -> ucsi_connector_change()
> 
> ucsi_connector_change() indexes into ucsi->connector to get the
> connector and schedule its work item. If this notification arrives
> before ucsi_init() reaches the "ucsi->connector = connector;" line,
> ucsi->connector is still NULL and the driver crashes dereferencing it.

If you have logs for it, you can attach it.

> 
> Fix this by setting ucsi->connector right after the connectors are
> registered, before notifications are enabled, so it is always valid
> by the time a connector change event can be delivered. Also clear
> ucsi->connector in the err_unregister path so it isn't left pointing
> at freed memory if a later step in ucsi_init() fails.
> 
> Signed-off-by: Uttkarsh Aggarwal <uttkarsh.aggarwal@oss.qualcomm.com>

It seems it is a bug. You could add Fixed-by tag and Cc to stable tree.

Peter
> ---
>  drivers/usb/typec/ucsi/ucsi.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index bef3f9b71d71..8f7b73a9f4f4 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -2122,6 +2122,14 @@ static int ucsi_init(struct ucsi *ucsi)
>  			goto err_unregister;
>  	}
>  
> +	/*
> +	 * Set ucsi->connector before enabling notifications. A connector
> +	 * change event can be handled as soon as the notifications are
> +	 * enabled below, and ucsi_connector_change() indexes into
> +	 * ucsi->connector, so it must not be NULL at that point.
> +	 */
> +	ucsi->connector = connector;
> +
>  	/* Enable all supported notifications */
>  	ntfy = ucsi_get_supported_notifications(ucsi);
>  	command = UCSI_SET_NOTIFICATION_ENABLE | ntfy;
> @@ -2129,7 +2137,6 @@ static int ucsi_init(struct ucsi *ucsi)
>  	if (ret < 0)
>  		goto err_unregister;
>  
> -	ucsi->connector = connector;
>  	ucsi->ntfy = ntfy;
>  
>  	mutex_lock(&ucsi->ppm_lock);
> @@ -2143,6 +2150,7 @@ static int ucsi_init(struct ucsi *ucsi)
>  	return 0;
>  
>  err_unregister:
> +	ucsi->connector = NULL;
>  	for (con = connector; con->port; con++)
>  		ucsi_unregister_port(con);
>  	for (i = 0; i < ucsi->cap.num_connectors; i++)
> -- 
> 2.34.1
> 
> 

-- 

Thanks,
Peter Chen
