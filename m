Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98087481A9A
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 04:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792385338; cv=none; b=mLZrIFQt8CnCBD0PfszsrAG8AmZ6c+m9e0QgFOtL0GoVEqTW+HaM6QyXRodaURl1wC609wlJgr1Dp4FJ9+2j6oT4OuWWLZfeNePGcHRYE+Yx7GnCnJyXHxZaJdJiB983/Km7SZYNFr0INLwEzT9bV0qQtPlmuOpt2CqbddiZam4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792385338; c=relaxed/simple;
	bh=C5m+3nLNo4SQB6BTHIX3MDQVFBhTPkVbrz1tN4w/kpo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oiiuY4sO4f9Y4p/p3kpY0IIwlodpPCFoWz+nNj6ZHpD8wx9bAudMFjRL86zrcqS6htX2x4kC0Yj00M5LXxi/0fn8nZp9SdHSkLSm9h/LvSea6SdfRRCtSWc3gFy6XgXhoQ6V4v8omLfutsy/aGP/cmx4WlcpuLi1VUrpm/roHco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hefDVloS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ps2HXO7S; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hefDVloS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ps2HXO7S"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J4jJBR1408613
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 04:48:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c7PDwWaWCXcmVzQxwEvjXKeBiyp1XM301RRMHg8cFbQ=; b=hefDVloSXjVs4uaM
	XYgySix7CHxIcDOw7atX9+C7YeG7ro+X51Q0SKHeH3UlRsfLVk1d3LhhbhOm5dUt
	GX41cQOCYOGAXIoMdKegknZ1UESi/+SVbywP827N4dw258TlzGGAx4KemR/7iwDV
	eG8K7XecSh2fv8XUVO7E3lG3avRAM7XEXfI87pF0uez42hikBMttFk1GQc8Bhnot
	8jOWBeYs2zDMaoKn2vPwPAYCAScRv/SUofuxo7sh8kF+k8uEk7maGBoApI/EPmAt
	hz/a9dB5v7jpHcWfnOMUBNmpU4SlRPMclAJ8S+iCwXIHWhHvwuKDnCOLYAxvI8J2
	LyticQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdbvr83hq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 04:48:52 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3548cdfd2fbso2716265eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 21:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792385331; x=1792990131; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c7PDwWaWCXcmVzQxwEvjXKeBiyp1XM301RRMHg8cFbQ=;
        b=Ps2HXO7SH9NPBnQp87u/cYEHF58llkQ92Fx0O1Bzfrws1Pj7bO6HeMv4Q1HvK+ZNOX
         VeHsdQwshL0T3cM1Ps5phDZRCJ8ohTci+2siw6dkPL5rNkf2Nbub2TJvH0/pdUUCYuFE
         Eaww97SwlvO3gXFDq+eboplD5fDEEuow+c9QPcJZIQnjs+CFmEfG1StYHtMOCcQ4C+hw
         3jpg3o9sFmONMYU8VVj9Wve0XxiLsWZ5oNEv6IhuEbCGT1HQRVrMNZZtl4W4ye3C9VD2
         T2MYCMFpIqNt9or1yj6cEZPu2H9zw+q9DlzW43o0aS6rBMDvqQ4aa0TDLWhIyeDjVzsv
         OvUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792385331; x=1792990131;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c7PDwWaWCXcmVzQxwEvjXKeBiyp1XM301RRMHg8cFbQ=;
        b=aViTkPHf58N8Yv0aSYVe8dQsanUxcAoCFcaOp6fCgTlf00IFPyIkX5LmFKzYDGG8Tv
         PJeDAv1ex+g5TWxgq/+josfI1lB6MXofBx8GyNJhuXLfHSC3BKNkt7lkEDSfTjLBKQlZ
         w5s8la6TtknUvzWyUiRU2tnqR9sEcW8c/0mHGTutyEIpZCvSV3b7isEJeTSDLCYrrgYM
         DEuZ97SfZdJvQiaeIfyDUtAt436dDZYrvDwz/U8RzLUqcKZlxMvHb3dIX5SIvzlrB9lL
         PEXfjhOE9bcoZ+K2RZip2+axe+dnZXmjg+i/O7XavtqP8USEGTnM7B3Ogw35+G/ovMTp
         gzdQ==
X-Forwarded-Encrypted: i=1; AKwUvBwmfx2AE/4x2mPH0SytmBHf0g3Uys8S04oT2oXBD3EstRHNamjq8/+1m78hb/HXsmNt9mmOPU/RcHU5x0E=@vger.kernel.org
X-Gm-Message-State: AFq9FYLAx/eFFoLekuP1PJ8roNpK67bbvtPicm/4TxgFL/iKMx6DeC6j
	QOarfRGLmEZsJx/QUjBgzuvRk1EL7+A5iV37KiF9QJ/Yutc263fa6PF/kJRBPJUVYZ6Nu5d7XKZ
	l6WBktPla3QdZVmdmm2NjXTGDABYZEMMQqiTklszZZe8v5WarZXlcUCIsqgcon/sy3Fo=
X-Gm-Gg: AYBFou1cy0C4uW8E7jw992Q4zaS6hPqh2FQ3bPPT8ljHJcajKi3GvbiaDhZIXMA3LOa
	P8n3toKAbBat7UEz/NHNZ9X5RKKYWW9liRtBvZglXom+Kjb/oZJkZKPBg0eJSEq3dpiJKCX7t98
	E0IILaaiSVKzx+riMsXImN5Mfl2Y50GnnDB8xD4R+JxGkPJTI57Ngcz/AzkS73+ROEYBVLsgYw6
	PrXf8EKAx0bJ4Mhn0kiKM+XDx2WmJtcaVzy39vCMPIF/G364qSyPRPWLSY1dNNR9J6wAg9kvGTB
	5KuctSxxUWDL2Hd1dmUD5h2yrqBc9s1gyKVDpuuvfq12KMZyUXEBHqYahY1Q+OF4VG7XDi1O2fS
	/DctijfiZJ/2cwIzE6gYqFz+i7Dbmebcxj007H0vZiah637fjdtzIdVwJmul7oAnbipc=
X-Received: by 2002:a05:7301:183:b0:351:7d5f:df26 with SMTP id 5a478bee46e88-361a1c4d6a0mr9514010eec.15.1792385331131;
        Sun, 18 Oct 2026 21:48:51 -0700 (PDT)
X-Received: by 2002:a05:7301:183:b0:351:7d5f:df26 with SMTP id 5a478bee46e88-361a1c4d6a0mr9513975eec.15.1792385330431;
        Sun, 18 Oct 2026 21:48:50 -0700 (PDT)
Received: from [10.217.219.121] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3608219f838sm28661469eec.19.2026.10.18.21.48.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Oct 2026 21:48:49 -0700 (PDT)
Message-ID: <15bff3b5-6e25-4809-8781-461d08fa97ac@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 10:18:46 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] usb: gadget: configfs: use-after-free of gadget strings
 during bind and under a bound gadget
To: Yu Zhang <yuz08559@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261019033415.73542-1-yuz08559@gmail.com>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <20261019033415.73542-1-yuz08559@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAxOCBTYWx0ZWRfX4ytwiUs78KIG
 /jutbOwNeWghY/9gkxFZeGS9PBSyFnMqET5k4pBJBlcezn1MQQRGKkWfWY7z0eUtdx2p1SJ4w2r
 HBcEFlWIFuShLZysn8Ys6f40PXM+rIRG/tXkg/cxmqJKQsaT6r/uiIqJ5WrrrLpao2Br/bi5qkp
 CHm5ufUcct8PTS7RXfPxj9lHEE/TutSBbv8gRpl14voKlunXTpd3nPZJG2YxpVoSrfmE+D9nwsD
 QkChQhYvPySn/ystBpFLfjbMBkfsv4Q2aD62lGLaPA+N5AtuMpnQRniM/a0mBMWlTXztYfu6Ltn
 G+kQmIoemoV7Qt5fbYECmoQUP5X0XtaFexgfylRKDl0gCfG3mKhu3C7ERVH6ZzTykhdOmENdB2/
 HJRDB61RG+Z2z5ahBEhMiXNeaBa2TgTCDBR815+YC5SYX6d5wkLjkppP5ttFTN9qgaQwFKbucuV
 EjDdJa9Paux5HHTljKw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAxOCBTYWx0ZWRfX+m+vGbrfgK4g
 DhKPRBmU8uNi98Dk5J6Ou6t/3neNFvpJrMUMwp/I7nmqcrc8Zr91NVuBLgBUyqJB1Kobt01+MS4
 n6ElC8Zjb3YbQPbkPxbGE2WAEboucuc=
X-Proofpoint-GUID: oO4lB0WPJ2JPTR99nymCNWzxEN9PdJFi
X-Authority-Analysis: v=2.4 cv=K/+3jCWI c=1 sm=1 tr=0 ts=6ad5a134 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=dZZo4ud942Yvso2rW3gA:9 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: oO4lB0WPJ2JPTR99nymCNWzxEN9PdJFi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 suspectscore=0 adultscore=0
 impostorscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190018



On 10/19/2026 9:04 AM, Yu Zhang wrote:
> Hi,
> 
> The gadget-side string configfs objects (the strings/<langid> directories
> and the strings beneath them) are created, modified and destroyed with no
> serialization against, and no lifetime coupling to, a bound gadget. This
> gives two use-after-frees, both reproduced on an acm gadget over
> dummy_hcd with KASAN. Both are root/configfs triggered.
> 
> == Background ==
> 
> Writing the UDC attribute (gadget_dev_desc_UDC_store()) runs
> usb_gadget_register_driver() while holding gi->lock, and
> configfs_composite_bind() -> configfs_attach_gadget_strings() then walks
> gi->string_list and, per language, language->gadget_strings to build the
> usb_string tables (the "the gi->lock is hold by the caller" path).
> 
> The configfs callbacks that build and tear those lists down do NOT take
> gi->lock:
>    - gadget_language_make() / gadget_language_attr_release() add/remove
>      languages on gi->string_list;
>    - gadget_language_string_make() / gadget_language_string_drop() add/
>      remove strings on language->gadget_strings and adjust nstrings.
> (Contrast function_make()/function_drop(), which take gi->lock around
> gi->available_func.)
> 
> A store to the gadget's "UDC" attribute and a mkdir/rmdir of a child
> strings/<langid> directory are not serialized by the configfs core: they
> hold disjoint locks (the store holds the gadget-root fragment rwsem plus
> gi->lock; the rmdir holds su_mutex plus the langid's own fragment rwsem
> plus the strings/ i_rwsem), so they run concurrently on different CPUs.
> 
> == UAF #1: gi->string_list walked during bind vs. concurrent rmdir ==
> 
> configfs_attach_gadget_strings() dereferences a struct gadget_language
> that a concurrent "rmdir strings/<langid>" frees:
> 
>    BUG: KASAN: slab-use-after-free in configfs_composite_bind+0x2ba/0xe70
>    Read of size 4 at addr ffff8880085db900 by task ...   (language->nstrings)
>     configfs_composite_bind+0x2ba/0xe70
>     gadget_bind_driver+0x170/0x5f0
>     really_probe+...
>     gadget_dev_desc_UDC_store+0x179/0x220
>     configfs_write_iter+0x1a7/0x250
>     vfs_write+0x5df/0x940
>    Allocated by task ...:
>     gadget_language_make+0x93/0x340
>     configfs_mkdir+...
>     vfs_mkdir+0x1ed/0x4d0
>     __x64_sys_mkdir+0x47/0x60
>    Freed by task ...:
>     kfree+...
>     config_item_put+0x89/0xa0
>     configfs_rmdir+0x42f/0x5b0
>     __x64_sys_rmdir+0x34/0x50
> 
> == UAF #2: a bound gadget references strings that rmdir frees ==
> 
> configfs_attach_gadget_strings() stores raw pointers to each
> language->manufacturer/product/serialnumber (and each string->string)
> into the cdev's string tables; usb_gstrings_attach() does not copy the
> string contents. Removing a language (or a string) with rmdir while the
> gadget is bound frees those buffers in gadget_language_attr_release() /
> gadget_string_release(), and the next host string request dereferences
> them:
> 
>    BUG: KASAN: slab-use-after-free in strlen+0xe/0x40
>    Read of size 1 at addr ffff8880065f2000 by task swapper/2/0  (GET_DESCRIPTOR)
>     strlen+0xe/0x40
>     usb_gadget_get_string+0xbb/0x1b0
>     composite_setup+0x33fa/0x4690
>     configfs_composite_setup+0xbb/0xd0
>    Allocated by task ...:
>     usb_string_copy+0xed/0x110
>     gadget_language_product_store+0x22/0x60
>    Freed by task ...:
>     gadget_language_attr_release+0x36/0x60
>     config_item_put+...
>     configfs_rmdir+0x42f/0x5b0
> 
> == Reproduction ==
> 
> acm gadget on dummy_hcd (CONFIG_USB_DUMMY_HCD, CONFIG_USB_CONFIGFS,
> CONFIG_USB_CONFIGFS_ACM), KASAN:
> 
>    mkdir g1; echo ... > g1/idVendor; echo ... > g1/idProduct
>    mkdir g1/strings/0x409
>    echo ... > g1/strings/0x409/{manufacturer,product,serialnumber}
>    mkdir g1/functions/acm.0
>    mkdir g1/configs/c.1
>    ln -s g1/functions/acm.0 g1/configs/c.1/
>    # race:
>    echo <udc> > g1/UDC        &      # bind: walks the string lists
>    rmdir g1/strings/0x409             # frees the language
> 

Is there any real scenario or use case where only the strings are 
removed without stopping UDC or when the udc bind is going on.

Regards,
Krishna,

> UAF #1 fires during the bind walk; UAF #2 fires on the next host string
> descriptor request after the language is freed under the bound gadget.
> (I widened the two windows with a debug mdelay to make them
> deterministic; without it they are narrow races.)
> 
> UAF #1 is a narrow race (bind vs. rmdir); UAF #2 does not even need a
> race: removing a language under a bound gadget is enough, the next host
> string request then reads freed memory.

