Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 862E85013C5
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 14:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789567946; cv=pass; b=tYnWTFcelMQRrku7YL+7fzhqJSATAlJj99bz+YI+Av9fp9FHa1KMIuVDZsjJSkysr2GERkz3mxHaNtKJxQWHEKcDFFCEzf3jazv6kSSHUvkoUqHVTbf4f5eRK8ge83KfLKsTk9Yp1l8HCSw4pCQQe7+IZxMLVGNN6ztAzaX9B44=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789567946; c=relaxed/simple;
	bh=d7Znp5NNZxYJd4Xe/QgaIbKxuaLC2x6XIlcie67IVG8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HSt5uHu4pbpFg8//W9SB0Maan7NP0lmXtjSmHmcO2PuG1fPCRKPTpRXMD6zzEN15fVasIh3e7sNk8kkJ4xnvAXuojlo47Ug1RsPBSFlSvK2asCIJlyLUStjqQkGy22ICOWptCookzeytdOngrHtdr6VeZaOKAhPkvhhBGmZV9co=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hZbJrQCt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PvFZd0Je; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hZbJrQCt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PvFZd0Je"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GCYVJt2015222
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 14:12:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d7Znp5NNZxYJd4Xe/QgaIbKxuaLC2x6XIlcie67IVG8=; b=hZbJrQCt7xfhxnKG
	PbBGY+RlohLA50nEt3lLit+T5kj2GQb0umm1euW424NEYPuNvULZDQ/0HMxuAwzH
	Ul74ycK1A/oUcAAOKrj5b6zt+rEzIEnQRcJdnB6lbCHGvtl0FQgR3gOd+VxtfqwK
	HvhKsAlhSWYTSN7pDn87NeHlr2T9psF6uqPx38K5xRFOtGQAfTCDfxJuPulg2rZ9
	5753pJkRtQ4XCSsAPtSBdx2nlUOgxZ42V/CFUA4fuFRZEXDIQUJs3TeKZeloFeiF
	X7y5m4Cpi+DGYJHc4X9Vmv7bA7xX3csTnYCPLRum/B+bVTYsAsblHP2gRU4UYnnH
	b4ldEQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqthnrk67-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 14:12:23 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-868f443cbd0so4944761b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 07:12:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789567943; cv=none;
        d=google.com; s=arc-20260327;
        b=Y23ZXv5RrPzyRYylT8ycg8FSc80N1FwEatzgIi1GMFk/e1m+uU1R+opXIZdmwpvup5
         pOppX/wDC8wB2VDCzr6faAdmkG6xQa70zgSA1nB08UBkNrpAeEdrYqmoaJWUM8x0ok+S
         Za4gzN8tTvuDMPIXZP9152/xJpCHIFqw9e1JZk3KuJDj7aiapVOCuTjlteUSExFMOFEU
         yyzhR18PAyVF57qccT4GtZJV4DcFp8UFULgWPwu8lWEiy4M74UWBJF69RQStCRPGJyqH
         yYkIK5+4GgD3GMBA4AsjFf3TrSxZSos3VWov356Gx81gxAoJllVQnwQIAs8/9CFbNk5B
         uqPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=d7Znp5NNZxYJd4Xe/QgaIbKxuaLC2x6XIlcie67IVG8=;
        fh=nrc1QD/BgfaTq3DemZciTxCpAf7GI6W1ra4+T8GX0gQ=;
        b=GRIwafOLJxrf13ybVC2YqBooHaWO0QCJ50eSdJ9YS8N7D5ce9NfxfWbOBMMvo3UWm8
         fTQ61kd4QlAswyjOvFdX9Xe5BMyhEdDkASka4RBFpaR2cBIehAE+iVZxOo9lBECL4Mba
         6ZbrbT8sqF2XCkcKdDSejOMGsF8wMFQ1iNqqkPQJF7yNjK3R4aqj1cv+O9/G64eEwsxv
         XzTGyKcmoOOzceMhP2vizMg5fMjye/iTEZi692gIwzv4Wn0TGmx/0pvdDTjygvbg+zxU
         mV77W7XAs1f06DH0NbPqZKvk38TvzEKqipuRamt+O5sMjqg5OvEerpCgiMz69VQLNLBm
         wqiw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789567943; x=1790172743; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=d7Znp5NNZxYJd4Xe/QgaIbKxuaLC2x6XIlcie67IVG8=;
        b=PvFZd0JeK1BNCWNBzotqtYpJkNXcsj9lv7tilhT+PGxw95/7ydsERZ+qhX8yss2zOg
         2/yqLKZGE7+EBXPYZ4a5e6YMrfdHl2XNC9+4iyRnfEFmYF5S4AcmEvrwUP6fUiOacDqz
         yaw3qYNU+xJK/vgJfm1ShcInb72M03rcVrgke+r4NhOFRpO7PBp8QBI8FPD7KPrFKahP
         mwy8W3fsGNdlG5RFmTLBitUTOQUFz9MusI54p5s3iJRylWLXRrA5RItDYZqnt9xRMN3V
         w1uLI9Ha09/fmTz7KUGFEtKxyEuIusFX7QjDAZSG4z12bjTfSFPhWeXj7QbNqz7E/Cki
         7rpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789567943; x=1790172743;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d7Znp5NNZxYJd4Xe/QgaIbKxuaLC2x6XIlcie67IVG8=;
        b=hBHJtI6FP9mKMdshuKnMMB21BtCmMyLwofCUbWXtMn7LrfD96ivZ5MMatPV3KWGDJ+
         hfp3C8Ncv+KqOLNHha99aJKkC0/FN/qz6T0aE8BWxkaQYufArmwI/rwTSLFpniau/Ly0
         v/hq6eNodiWeJUBcA5zTw2fCCP2k2aE2SxWuwY3O024Eq9c+P87qaIpjWmJx9oVeyUl1
         oiDSYtxJAUWAXknk9TP/hBKn/1xdlshVKkrs7POv0jw8nLNnnd7V36oWApw8h75fL4It
         uYz7gUkR0Ta/1wC9WxotgbtCnNSkSVNNsM3WJjj3LTeALgqIjW0G8XzfupzRfyiIIETf
         ur9Q==
X-Forwarded-Encrypted: i=1; AKwUvBxuedOUeltUWXIdsdZiy1WCF9ROQz6bM2QTVw/bhUUwFJuoPuGEr/FRnztqKDj7+dYRUdn0+GVv9B5sbTc=@vger.kernel.org
X-Gm-Message-State: AFuF++k4W4M+0pz0N07sXMkVWTexlhJi3tZDBomzVMI2LfYBGZwqOvph
	OeIO1JmuHkYalsWnDqg03BwJQ5T/3nPli5GtY+sO33F7+CrsqQNUMnpjGydrjg9glXRBlmjXjcC
	zKOkhaOVWQ3JRZHAUIpNxARYblUwkDjyntG+pW6F/XQiaI2nq0yLS07VXljiPcOd9PE60Y+5bS+
	P55CaXumdIa32b2qyDhEp2T2z1sPsoAU6XV+YHudNofN9qFAaaXeEr
X-Gm-Gg: AYBFou2bfr3+2PIe8QS6MaYx47qo21lzNi668BRgB7b2kc6n/1c0mFFeEWz6HwZv7kB
	yNihW83DCWbmZoTRGHD7oOcp9OP7Db5ZXZ898Oz6oBRRABChZzjK158bjSP1x7cufkBzWCWfSLo
	76QvpTjkGZEsI/JFBwBWCuI5ExfrhQ9bz0xFbkAC3BAMlrjThlWjqIGP5hdA==
X-Received: by 2002:a05:6a00:300c:b0:848:2e3c:9955 with SMTP id d2e1a72fcca58-872372c3f18mr6019644b3a.4.1789567942634;
        Wed, 16 Sep 2026 07:12:22 -0700 (PDT)
X-Received: by 2002:a05:6a00:300c:b0:848:2e3c:9955 with SMTP id
 d2e1a72fcca58-872372c3f18mr6019564b3a.4.1789567942091; Wed, 16 Sep 2026
 07:12:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915132052.273212-1-ulf.hansson@oss.qualcomm.com>
 <20260915132052.273212-3-ulf.hansson@oss.qualcomm.com> <aqpIl5NWCFiuKy9b@hovoldconsulting.com>
 <CAPx+jO86Sy+of41dw3Gi5CNfyc5+iOyDU4CZypz4YGzG27QW0A@mail.gmail.com> <aqpovla0rTDnmwRh@hovoldconsulting.com>
In-Reply-To: <aqpovla0rTDnmwRh@hovoldconsulting.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 16:12:10 +0200
X-Gm-Features: AcwNN1UPNXOQLfdSFRPJAlCiq-g_reRwNd6uIUSpPLv6c1bEYkBTby_bsRYsWRY
Message-ID: <CAPx+jO8WS3MqzS3txy1B3FnQ9OzRjDGzxMLLZ+Mys-jqego3_w@mail.gmail.com>
Subject: Re: [PATCH 2/2] mmc: core: Turn mmc_alloc|free_host() into static functions
To: Johan Hovold <johan@kernel.org>
Cc: linux-mmc@vger.kernel.org, Ulf Hansson <ulfh@kernel.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>, Alex Elder <elder@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: B5JD8PTXQuXn8dkPtG4DogiLERfbushA
X-Authority-Analysis: v=2.4 cv=IsKL47/g c=1 sm=1 tr=0 ts=6aaaa3c7 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8 a=zitRP-D0AAAA:8
 a=sgTPu796ueBBQ-pzyZoA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=xwnAI6pc5liRhupp6brZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDE5MSBTYWx0ZWRfX1FWMjXoyPsnB
 ofCeWJ1U6nC6G1A4rNgrFejrftRYTNAs8rHxwz7HNyyumexPzDt7IwUA9joY3f3/hnJxn+rE86v
 BJG6jjap6igKwGvWiUuIJDe1TKJAFX29blwfWydlxI0BkYM/DROgEAVkrM6pn2T+tqurutDTdyo
 MXKYwuY4pQBKk0T2Q92meuSI0blccCS2a/i8G0+lokqhgyG2EyryxORs46sc/C+UJW24i5WAP22
 VqAnf0QSaeZwwOCTSYd69Jii6UDMeOv7E2RVJ6IzWhvnlj/gJxE4pN+sU/V2YjqqmJMWDe8M1WK
 7H3GsNhmVVF4nRnpPBBvscQx8F6cDn8kERZEk/22ebWUACDzIDee3bc03UUxRlHAELESSo0BioL
 HzYTrv56+ri5NVB41eM70da6MB91Eaf3qw8O0XiYj6ju9m92DbFgktjJkOiy15JHcqmTw4voSEb
 Hq5BM26GyKfpkZ9y7hQ==
X-Proofpoint-GUID: B5JD8PTXQuXn8dkPtG4DogiLERfbushA
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDE5MSBTYWx0ZWRfX2zgLEpp9efxs
 1HCrSmusr2cN9Gdm8rFh0qZxI5r6W6by2yOH0MFfB+KYtC1RXLwKizKTaoviP1AUN1PRudW/KKW
 nUtTr63t+ypDU7CmdJAXgk61/MsZ1jw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_02,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160191

On Wed, Sep 16, 2026 at 12:00=E2=80=AFPM Johan Hovold <johan@kernel.org> wr=
ote:
>
> On Wed, Sep 16, 2026 at 11:36:25AM +0200, Ulf Hansson wrote:
> > On Wed, Sep 16, 2026 at 9:43=E2=80=AFAM Johan Hovold <johan@kernel.org>=
 wrote:
> > >
> > > On Tue, Sep 15, 2026 at 03:20:46PM +0200, Ulf Hansson wrote:
> > > > From: Ulf Hansson <ulfh@kernel.org>
> > > >
> > > > As there are no longer any users of these functions, let's make the=
m
> > > > internal to the mmc core.
> > >
> > > Why would you want to do that? The devres helpers should just be simp=
le
> > > wrappers around these and sometimes devres just isn't a good fit.
> >
> > At the moment there seems to be no need for them. I would rather keep
> > API/interfaces as simple as possible, so I prefer to remove them at
> > this point.
> >
> > If we see a need for them, we can always add them back.
>
> Devres generally only works when all resources are device managed.
> Therefore you should always provide the underlying non-devres manages
> interface as well so that you don't force devres on drivers where it
> could cause trouble.
>
> > > Especially with the work cancellations present in mmc_free_host() (wh=
ich
> > > I have pointed out elsewhere should not be there), a driver may need =
to
> > > free the host before tearing down other non-devres managed resources
> > > during unbind.
> >
> > Can you please point me to such an example so I can try to understand b=
etter?
>
> We just discussed the renesas driver which can schedule rescan work
> before registering the host controller. [1]

That isn't a problem, but it's not the right thing to do as
host->rescan_disable is set.

>
> If such a driver also has non-devres managed resources that are freed
> before the work is cancelled you have a use-after-free.

If you are referring to the mmc rescan work; mmc_rescan() will just
bail out as host->rescan_disable has been set as soon as
mmc_remove_host() is called (see mmc_stop_host()). In other words, I
don't see how a use-after-free would be possible in this regard.

If you are referring to an internal work for the host, yes that needs
to be managed correctly. Although, that doesn't matter whether the mmc
host has been allocated with the resource managed variant or not.

>
> > > This may even be needed for greybus which currently destroys the
> > > connection before freeing the host.
> >
> > I looked closer at gb_sdio_remove() (the greybus sdio driver's
> > ->remove() callback) and I think the problem isn't about freeing the
> > host.
> >
> > Instead it seems like the call to mmc_remove_host() is done too late.
> > To me it looks like when the mmc core tries to power off the card
> > gracefully, through mmc_remove_host() the driver has already moved
> > into a state where it no longer accepts any requests.
>
> Yes, that looks wrong, but that's a separate issue.
>
> I only pointed at greybus as an example of a driver which has non-devres
> managed resources. If there is (rescan) work still scheduled after
> probe() or remove() returns, there's a potential use-after-free.

See above. This should not be an issue, at least it has nothing to do
whether we are using managed resources or not.

For the mmc_rescan() work to access the host internal data (for
potential causing a use-after-free), the host must have been
"started". See mmc_start|stop_host().

>
> Johan
>
>
> [1] https://lore.kernel.org/lkml/ap7CaVj82BJZgjf6@hovoldconsulting.com/

Kind regards
Uffe
