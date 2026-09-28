Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C403440E8FC
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 07:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790581820; cv=pass; b=SjDfdaiyIVTAAoljmf3kwYVXfNx/roczLwfEIq3Fppj1dt1zZEIe2eXdHN/1CHqU+gCQ+PjpnAj0tsRlrHjQ9vYcPxRrWTa1KJlELzGLKeN3ZwI6VAdi4sDHZP+T3/Z1590vajCTk15Cr2eyVRZX3/bdhvAMpMDBVRcBwbzgOsU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790581820; c=relaxed/simple;
	bh=oM/kARcWbvXXKH9Xq2YfQCxMNZfj4FIob4Gex0PqaWs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S5/ImRRoTBgTumBgv12dh6naJw9/+L8MYHf6y3xPUPKrWwp6LrkbAwliv+tKlh5NmdA0XoB0AT7ymuszKJ6YcF3AjR9mVvFWc1xG6M8vi+NBmSd1GaRAkgUh7pLQBnDYAFs0RmW6NLkzdm7txgrlShDU4Ipuf/hN8O3YqEakjGk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YYT3RpTk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jdNu+Q8M; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YYT3RpTk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jdNu+Q8M"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S596vt1500964
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 07:50:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	POnKgmLt09qWE2p/7yWzeUW94w7CwA0WKPP2q2akDR4=; b=YYT3RpTkQJou6Zam
	/hJVzhZRRjMAK7jA5ckgI1KYWi4eEl5IzbXGSA9jUlcuIgr+l2ylCCyWd6/xmQ0O
	qcPmW/VLqqwOgV592wPHB+5mRV0WkIr1hF9n1cS1ehKvZEy0DGIifqIUKPpNxlxx
	3RA0sPWx2oFJ0FFoVu781GrIwYoYOfEo3CUMvqtyscdV3VjmHXrwV4HuxWttUiA1
	V4avk4ZlrXFG4M0ih5EdP7qQOFD4rH7nAE5MOGC4bJ2EQyq8R7PvBjjfkJTH11OU
	6aAiqzmhS+slpXnwbFGvn+H3vzllJqQUPTatDwuae6h+LJxUA2JkGQq5Xda1YlzA
	O9q8mA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyhubggbv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 07:50:17 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a01d1d1b6so521008885a.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 00:50:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790581817; cv=none;
        d=google.com; s=arc-20260327;
        b=eoJ7F5YMlkqytrG021TCtXZL1P3W2AXZGgL3Ekcd6mrA9UAQL6xi0gDRwcMaxErr4A
         YpGItFBbxcbNzTKm+oGZ7zzIkz0dqJ2tMZXLYttIvT+gRsjZpbc9NFcrHM5Fr2QGIHwt
         MPB/L6/KMPwuPnFo/ANTH30wkfdbTHpOX+hdMglH6zwlSl/w1RbP8NKZut5eIrzlSbVn
         VAvNH/3hyKQZ7gU13YkLASmHuPz2sHbqbD8oGhvOgRqAfx2h4GNep+7M3HFWEefrvfGK
         doHIlM+8zXKgm8rx6zeKsMbKzF3FM9/lNABb1vPdW6YQZRscT9w+WPJPAX9FwaHe98dq
         K2VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=POnKgmLt09qWE2p/7yWzeUW94w7CwA0WKPP2q2akDR4=;
        fh=ICcy3bgpKziXR1dg+WE1R2NvluIdcs8M9xqeD2NYmdc=;
        b=R2UIO09jOmUwLNFwBHpYbfy0DhRaFvUYJizWxDuGcMj/bDBdZQ5mGPJvmWMtARiry5
         yXLccSOcTniocLtczr7liCtt8RZLr8S8KL9X4SiWS1xzovkgAVZ1zQ/8igMkNuCc4ja3
         Qf6/5gNUVipDO2oBPe9q6zADoLPbTyTSu7Vjx6xeQN/HzqznUo1qdshwy1qmIo5CCMYQ
         UNEgcxQPGk9VicVMwiHMj4T/UqZ+YXogLcY777reHy7hG7FtZ6DFZhZLaA04SmpI5ndx
         xz0m2j+655LzpxDRMict2vksvq9Fbj4KeJcmM3IDjvyDu93pnAsz4VP/giVTN7IzGbPa
         7eOQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790581817; x=1791186617; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=POnKgmLt09qWE2p/7yWzeUW94w7CwA0WKPP2q2akDR4=;
        b=jdNu+Q8Moalborfq+C/0l7cEVgV/g3z46FZZd/aeDrl1kUtNSAWkkLB5VlJUf+gWBo
         fpNd9WnLJzZdWOQOI99F3Jf+2yv0JGowk86Wfn1W9+MCh4TB7TLx+nUGlGeWotzTjWc6
         t5jCpUE4UETLrcusg1pyfjsXOEnPr+Z/BbGM4ihxiMlJK0y2Q8xE3yfdtrEhzgSwk+nD
         YQrifNQ1EqBfWHSUUK67M4dLlkJ/12S4VmNWQT4PmyL3awRaeny8sDoitU8TArfuAvae
         9V8g+BnvRUCqN8cH7uxw90lntROLbBhldLAx7C2odkVzUWC/IFq1uABzUrVgS3l9VTNJ
         gwWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790581817; x=1791186617;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=POnKgmLt09qWE2p/7yWzeUW94w7CwA0WKPP2q2akDR4=;
        b=jekQO3bYDOleSV0zHjzhG9EHnA6XiLZyjMUgDSR8L52lcMWJj1ZjHUkyZmZaRkPOHX
         KIyN3D37ZfOxunI+edyi7J7mLvOMX1fde4f2mCifn7T1OzBSY5XYUrV46q2I6bURE8B9
         yikZZaI3kq0KT/A8qSXL+dHfvwNxFE00MA0f3i84xS/CVMyGK4TVJG6dV9tFAMLqRZfL
         l9a7UtwWkOZvGRbIwlOhje/oIg9Pw8lPTlQHKgOLBeMbItQx1wmb+4sxZ7p/ewfngoT7
         /2Srp6OtMJqyYhI8EZdn+jFhs+K0+kKGdOtY4o3nAFaNWuH8n0BHHMF1uAyS0f2/ahTP
         SuXQ==
X-Forwarded-Encrypted: i=1; AKwUvBy6Kb4xkBgGYsijP/5KrnzwGOTBaPGCBDqmYY16Kp0lvgAvT7qvszDN1AqCCU3SAW03nuQ6+X//ONE50ec=@vger.kernel.org
X-Gm-Message-State: AFuF++m2uUI1B5SM+Qig4L2OI9qLExyhBbntErsXbCicO1KUiXUCYInj
	j0hCbVXZbd85bto/FsiKXtQDt6yezWB6dYiUKUMeYY1zU69/WPjVJzDBxuv/WL9O2g4FsTed/Fe
	7y2bczSTW+4oxkx6Cbagm7TZdwB7axnxkiC2nR9oHXRZygdJRCtTf3QLXfL9cjNI36rgnGq3dUy
	zi45E4w/kumfNHKbiQ5qLk4IBpptEKAHqbUYyOt5Na/DWNzQqMwMt7
X-Gm-Gg: AYBFou30ujcMJ1GY3oBnrBjr5Sm1NWmkYkAft1VMP52HywZU5v/Mb68fzsSEpsE8Idb
	rabirFYO/pRl4Dn7X3FB+lLCaiUBSdU0vvqf/wCl6eJsguVO3WaYhhSwIUvWI5nUvSj28d28mcu
	mfbAIJYarNVt3NkNjBdEO7XbHOZmOhTLDmsjm9Tq4I5C+h7NL2RiDRUjcauz5enGCAK3hGbr5bC
	d2q/zjVPb6gHaLbBulY4zllwm/fqvBlrnSqJyqeOpr+kxoHr573dFJDR5wXeb5UaQDepj6zpLo=
X-Received: by 2002:a05:620a:471f:b0:93b:d7a0:d9e5 with SMTP id af79cd13be357-93c43d749c7mr1883510385a.63.1790581816741;
        Mon, 28 Sep 2026 00:50:16 -0700 (PDT)
X-Received: by 2002:a05:620a:471f:b0:93b:d7a0:d9e5 with SMTP id
 af79cd13be357-93c43d749c7mr1883507685a.63.1790581816214; Mon, 28 Sep 2026
 00:50:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928064336.272659-1-hitesh@ebytelogic.com> <20260928064336.272659-3-hitesh@ebytelogic.com>
In-Reply-To: <20260928064336.272659-3-hitesh@ebytelogic.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 09:50:05 +0200
X-Gm-Features: AclHuK-1bScZDI2Kq8qDaDpz0Ihb6vAst2esegxj3mK9B7Q_HqIqbUAYq3CsyRE
Message-ID: <CAFEp6-1szHugZNKXpyNwBEREJ7au7F9F4qxy11X632C9h9q46w@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] media: qcom: camss: vfe-17x: Fix write master
 selection for RDI lines
To: Hitesh Patel <hitesh@ebytelogic.com>
Cc: linux-media@vger.kernel.org,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        "Bryan O'Donoghue" <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        ravi@ebytelogic.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: BmucULlWkOkzzkDG9HxPDRMz7Wwcxc5w
X-Authority-Analysis: v=2.4 cv=C7F8WgP+ c=1 sm=1 tr=0 ts=6aba1c39 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=ZovgdgjKAAAA:8 a=EUspDBNiAAAA:8
 a=Pns92UxjTm5tqybKbc4A:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=VOxKbm1zgHvARWIDjr3b:22
X-Proofpoint-ORIG-GUID: BmucULlWkOkzzkDG9HxPDRMz7Wwcxc5w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAzMSBTYWx0ZWRfX5w8hVib4/mfP
 t9z3Abbla9pGDbV020lRF7pLLD1WKBT+GltOwAaQHXVwLvouMHFb408tZbRRggXYHW+R2bQavDA
 jmyKBsjDa0SwOW4wpOyMr3yLfT4ls7tj7O5dJCysXMfRHvO0V6wgd/Z+VuPO/SwrCM8aniQRsPj
 zN7h3SslMouBWYhOitlHlFwqLay5s45qofwBkswBpjdkl7AGTmVESQo9a/OIc5zwb60MAedUCp5
 KdA45u8ZoEGNcpJyx0p4bpqYnq/qiz7xvbxtch446XtNc6tjN7B7QceYXS67hYRvUqEzcEyLX7V
 WWfM237OqzlccWFciGNxukjmSfOm0fx892QIRghrePBbO4noVeOcqa58a0hJJR6BCI/96n211NB
 3B8f8Y56Wa+zAzTq4pvByc3Xj/BW/sEKVOEIwpcNhusI73NPfYG4qYwxKD4VdZ7CdJ3Qw4h9QMs
 SgeydHyaEQ+MmiUtuFA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAzMSBTYWx0ZWRfX0ssKTWIi2xnT
 B2cjSynUAa3uVhCfiXOl4MQ8nPaonpwjOtO6vKwfquKXVqLkq2/sAOy+kX9rv+2o6Fbm38h9881
 V0+qrab2o+gA+GmwZqIrRRxW3fZ/Lz4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 adultscore=0 suspectscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280031

On Mon, Sep 28, 2026 at 8:43=E2=80=AFAM Hitesh Patel <hitesh@ebytelogic.com=
> wrote:
>
> On the gen2 VFE bus there is no crossbar between the RDI paths and
> the bus write masters: RDI n is served by write master n. The common
> vfe_get_output_v2() reflects this by mapping line->id to write master
> line->id, and every gen2 VFE except 17x uses it.
>
> The 17x code kept its own vfe_get_output(), which reserves whichever
> write master is free first. That happens to be the right one as long
> as a single line streams and it is RDI0. As soon as two lines of the
> same VFE stream, for instance two virtual channels demultiplexed by
> the CSID to RDI0 and RDI1, the second line to start is given the
> write master of the other RDI. Both write masters are then programmed
> with the buffer address and frame size of the wrong line. The frames
> are truncated to the smaller of the two buffers and the SMMU faults
> on the larger one.
>
> Use vfe_get_output_v2() on 17x like the other gen2 VFEs and drop the
> duplicate. This also removes an error path that released
> output->wm_idx[0] before it had been assigned.
>
> The gen1 VFEs are not affected: they have a bus crossbar and any write
> master can serve any line, so vfe_reserve_wm() is correct there.
>
> Fixes: 7319cdf189bb ("media: camss: Add support for VFE hardware version =
Titan 170")
> Signed-off-by: Hitesh Patel <hitesh@ebytelogic.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  .../media/platform/qcom/camss/camss-vfe-17x.c | 41 +------------------
>  1 file changed, 1 insertion(+), 40 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe-17x.c b/drivers/=
media/platform/qcom/camss/camss-vfe-17x.c
> index c011f64f63..62c2405359 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe-17x.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe-17x.c
> @@ -382,45 +382,6 @@ static int vfe_halt(struct vfe_device *vfe)
>         return 0;
>  }
>
> -static int vfe_get_output(struct vfe_line *line)
> -{
> -       struct vfe_device *vfe =3D to_vfe(line);
> -       struct vfe_output *output;
> -       unsigned long flags;
> -       int wm_idx;
> -
> -       spin_lock_irqsave(&vfe->output_lock, flags);
> -
> -       output =3D &line->output;
> -       if (output->state > VFE_OUTPUT_RESERVED) {
> -               dev_err(vfe->camss->dev, "Output is running\n");
> -               goto error;
> -       }
> -
> -       output->wm_num =3D 1;
> -
> -       wm_idx =3D vfe_reserve_wm(vfe, line->id);
> -       if (wm_idx < 0) {
> -               dev_err(vfe->camss->dev, "Can not reserve wm\n");
> -               goto error_get_wm;
> -       }
> -       output->wm_idx[0] =3D wm_idx;
> -
> -       output->drop_update_idx =3D 0;
> -
> -       spin_unlock_irqrestore(&vfe->output_lock, flags);
> -
> -       return 0;
> -
> -error_get_wm:
> -       vfe_release_wm(vfe, output->wm_idx[0]);
> -       output->state =3D VFE_OUTPUT_OFF;
> -error:
> -       spin_unlock_irqrestore(&vfe->output_lock, flags);
> -
> -       return -EINVAL;
> -}
> -
>  /*
>   * vfe_enable - Enable streaming on VFE line
>   * @line: VFE line
> @@ -441,7 +402,7 @@ static int vfe_enable(struct vfe_line *line)
>
>         mutex_unlock(&vfe->stream_lock);
>
> -       ret =3D vfe_get_output(line);
> +       ret =3D vfe_get_output_v2(line);
>         if (ret < 0)
>                 goto error_get_output;
>
> --
> 2.43.0
>
