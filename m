Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F24053164C7
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792394518; cv=none; b=jA0irfsLSDMvEvAXiiCNPqzp5EFCGcUtwgiPh8oNoDFPrD7YYssFI2/Z7IPM92HgcHqrP285YWtCr8mks6OBvGpnMT6f+sdqp/mKjozHgJI6wGNXbinozjPRsb5aRWrhfBelphgevpYmNRT1vkVvD3X9u2hSZgxvOmr2wyHthbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792394518; c=relaxed/simple;
	bh=SBY8z7gC6UVEgwMXUaxuVvdl1jO4c/aNNzHV+sEReMw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YB8qcHQ5R05xaqEmtHLoZjLlh/QxoWTDtLJrSLC9NUVra4m6dU1igQmeUB3Xy5hyW3ouNuP+JU6jHwyNHGooTNu1HF94GIiMMStp8yJvcfqFoZUfX2kGA82rd5oEXmFTtv5kn8xZJYL+yeDT1PYRCYL3HmTRLQoAiYMlJnoF6f8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HoGjtrxn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K2Hu8iiZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HoGjtrxn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K2Hu8iiZ"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J4jNqH2179667
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:21:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RW04UJAChk1zLpmtFuvB+VwxtXHR+RDaCh3ieWKs66o=; b=HoGjtrxnPrkHoHgz
	Y7Hz0FVLU0lVIHg5+7tYaPGEM8xZcVuVdv9K7zWOLO2Ki4AEWgFEyYEImDYFfwu5
	WGzIcPwu5bOXFlzvggYKxxGQpQJxkKwD74iy0b+RT6wnyQY5Xwjfscznubqt4CEw
	0RcuOpT70kDVB83QbkB4NdhMlNtXQaaQMjb2PYwRMAl8VA+BK/SsQmPAB29Ki2jb
	GiJx8wKdAz/kSwy7RKxpy3DDQPVZPwGP7gIffUJN6NgslHReBasW9yQTqdYNPF/2
	Qs1+i69qv23SL/D4erXrY/VgerHSfO3rvscKu71nuUDm94qQNiM1vB7dDNqMhIP5
	MFhCtw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hd5u1hh5u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:21:55 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30c0d568830so3947558eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 00:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792394515; x=1792999315; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RW04UJAChk1zLpmtFuvB+VwxtXHR+RDaCh3ieWKs66o=;
        b=K2Hu8iiZ/hzWrpRWjxqgyP9fsNY2FNuOeiX1lWCB3R7j7psQn1RRCROc0UX+ilcdL5
         G+TWi3wSeApYr433daSTN/FKwAnfIMYTW3SiC8h6pvSGcX7kz5rtxy3AYR4bJErm71Jr
         or8FJG5Ssne2UW+f+t5e0MN2Wpptz3F+W3mgjU5hYSQpwTzMOIvzYSVKgdoJ3fewMS5y
         aU4uf+G0xq+X/msT+6JT9TtSBDNTtGM7A/q/n11G6uHNNJRWNFrj3CcO6qJdBPbXYPXA
         sUOjpRxZgeIsbTBz0L8sP5UnNObnCyOiqcf7wJ21NkMhd/e007lGfC3GFO2QxgSUCB4R
         2VVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792394515; x=1792999315;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RW04UJAChk1zLpmtFuvB+VwxtXHR+RDaCh3ieWKs66o=;
        b=bumtWtHpiEtiBbPYEJ8CkdiHtV6AATcxcrXMybUg2Wgfk1AksLZ4PFE/Ae+BEhyW/H
         qbRPxX2BOjG/k/JSIhNjAr1TUgQg6bW/TRaiK/EVeC7PPq83hI5VikFTZNucVlqogK1L
         +WAIBTHNVvAwTRBw5V5jwcy0qjn4mhFafJFox8sf/XYW5AjFWzj//QsbHxy82bAQTOFe
         VaZFn/iCeJDiAVoenOOv/6wkH71AF0R2dlZaApB/fcLkHkd9y9gMlGIGd1sy4nnSX066
         1HrAc68g+WOhUrxLXMeRuTHJDCrjjpWOYixgmdbLrTL3wU12SSJHoN3dTnr/5eCtx09d
         c4Tw==
X-Forwarded-Encrypted: i=1; AKwUvBya7ElzL2/Oi1gb22W+JaPKVFsGCSJ2ZrPWAiJcogjdbh+7f4BLzESSKemWJCx8Xi+P2ERx2XZocDZ/5as=@vger.kernel.org
X-Gm-Message-State: AFq9FYLHnOBJG85EMEoZ4GDz/VHclkc00Z7Sg4PPkFOYGw8RwG98U0s2
	gRrSflt3PaxpyCAxcu5bi3pYUWB9mjzUicPy/O/3d9NrR+u3Mg6CiwqM6sQMx2H2Gu+5lbwTY+C
	c3P8DADhlmUOZ+cbksSYFPPangv2/iAjGeqXiqj9f2kjlkhL2pnzDI3UwQQ9o7RaD+1kLUG92yG
	w=
X-Gm-Gg: AYBFou3VjlGWxugxTim7pcqOy5ARzoirGIcankBrki6ardDI5ofQvd2YqedM2g9UwSv
	4rDEBC9h4BX2w67ggBd4aYGxRD6MigO70HOFY7OzR8A+QdG/mpGBz/iKyw3e+M0MSW/fZsAUDRk
	++hCMv7QHiSPWsyFx/OoarktT0AknkZwIt5wolwNHasyjhMoeR5gyGcctiKaCrzvsalzAqU0Hx5
	+P+hIyn2A7suf3qoqkjQSVQJD/VyNb4oalZedSx3Zs54/1Ptaq0wL6V6r62njT6fJzygR5Uyskt
	GXb+PcY2sZ0EQssYXRb1tT2OSDfRJgMHFy0tEP80rsooST88cGz+LgbweY/SFUQBUP9cOhDA8vM
	1xj5+jYQ8TKVyPUoiY2cj6gSH
X-Received: by 2002:a05:7300:ae22:b0:356:9345:a07c with SMTP id 5a478bee46e88-361a1b52d40mr10457796eec.22.1792394514787;
        Mon, 19 Oct 2026 00:21:54 -0700 (PDT)
X-Received: by 2002:a05:7300:ae22:b0:356:9345:a07c with SMTP id 5a478bee46e88-361a1b52d40mr10457763eec.22.1792394514172;
        Mon, 19 Oct 2026 00:21:54 -0700 (PDT)
Received: from [192.168.1.7] ([101.0.62.42])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3608308a87csm49639768eec.28.2026.10.19.00.21.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 00:21:53 -0700 (PDT)
Message-ID: <2e1f73f2-5ac5-42f0-abfd-93d428528e40@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 12:51:48 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] misc: fastrpc: initialise channel refcount before
 exposing the misc device
To: Jianping Li <jianping.li@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thierry Escande <thierry.escande@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com
References: <20261007084447.922-1-jianping.li@oss.qualcomm.com>
 <20261007084447.922-2-jianping.li@oss.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20261007084447.922-2-jianping.li@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: BKfMqH7UIFU2beY9eEWCQ_nEZwC2osFD
X-Authority-Analysis: v=2.4 cv=NItAaE6g c=1 sm=1 tr=0 ts=6ad5c513 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=sC8K8RXUWm68HHFV/PXcoQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=rhkbLGPNnmkQcCxMrrAA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAyOSBTYWx0ZWRfXz7G2uM0AUNxp
 R3cYGxFMp5e+v+5bbIja2y8OPFejUbSiARunES4m8IHb81q9wR0OmLE9egNAg7nymyeYmY1A0nA
 ZmnQeJZ6wBnDQq8Z46cM9SfeKvuH0fA=
X-Proofpoint-GUID: BKfMqH7UIFU2beY9eEWCQ_nEZwC2osFD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAyOSBTYWx0ZWRfXzAbTtgQ8pFQf
 gzxtQ3eRywqZDPcGzRo7oU6jPfgTYWXab7vxbnmXQ3qe2O2Od/WT+Z6w1iq0tPmCPJZm0IifIWy
 btUNvyZPGWQ8mjRjPmY7f4r67MSFlJ2waMq0QjM5PPhl8jhhkrmAsYdfKYM6pUAOGXQcBqqMmuG
 2IPRGd4RlqulTq3mA4XYZV7dWdRacfGFz5OYFPswPU5QCrnaBX8HP0DL4lA5oWKpgfGDMn2MB1C
 mqzBi5NjQHzsuXeHRm1Q6AgGscji/DUZrQ63zvlnb48/jmnf4BoL3DDdWuo+fwxeLRPIsRIUvTQ
 E0QP5yLGm20ADaua+1zgSRDH58k7UJ3aZ5ISAo9vu42PZCnUx8p2Ybd4AZKyqU2/nxmrMHsffL4
 f1YVi0gAwZTMZiQipY2bPehvkXuCmn0/bXGzm7XLY9EznIdoJIwqeiffxcbPCbs/kRKU27ARrlk
 iRdF3ZgyW038k/nY/0g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190029

On 07-10-2026 14:14, Jianping Li wrote:
> fastrpc_device_register() calls misc_register(), which immediately makes
> /dev/fastrpc-<domain> visible to userspace. However, kref_init() on the
> channel context refcount only runs after the whole domain switch()
> completes, several statements later.
> 
> Any process that opens the device in that window reaches
> fastrpc_device_open() -> fastrpc_channel_ctx_get() -> kref_get() on a
> refcount that has never been initialised and is still zero, which
> refcount_t correctly reports as a use-after-free:
> 
>   refcount_t: addition on 0; use-after-free.
>   WARNING: CPU: 0 PID: 760 at lib/refcount.c:25 refcount_warn_saturate+0x120/0x144
>   CPU: 0 UID: 0 PID: 760 Comm: adsprpcd
>   Call trace:
>     refcount_warn_saturate
>     fastrpc_device_open [fastrpc]
>     misc_open
>     chrdev_open
>     do_dentry_open
>     vfs_open
>     path_openat
>     do_filp_open
>     do_sys_openat2
>     __arm64_sys_openat
> 
> This is easy to hit after a subsystem restart, when the DSP daemon
> reopens the device as soon as it observes the PD coming back up, racing
> with fastrpc_rpmsg_probe() on the rebind path.
> 
> Move kref_init() ahead of the device registration so the refcount is
> always valid by the time the node is reachable from userspace.
> 
> Fixes: f6f9279f2bf0 ("misc: fastrpc: Add Qualcomm fastrpc basic driver model")
> Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index af18ff1992ee..05b2e7e4ad3b 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -2599,6 +2599,7 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  	data->poll_mode_supported = soc_data->poll_mode_supported ||
>  		of_machine_get_match(fastrpc_poll_supported_machines);
>  
> +	kref_init(&data->refcount);
Need to move all initialization before fastrpc_device_register(), this
is already being handled by this patch[1].

[1]
https://lore.kernel.org/all/20261001-fastrpc-probe-fixes-v1-2-1376d93b8b3e@oss.qualcomm.com/>
 	switch (domain_id) {
>  	case ADSP_DOMAIN_ID:
>  	case MDSP_DOMAIN_ID:
> @@ -2626,7 +2627,6 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  		goto err_free_data;
>  	}
>  
> -	kref_init(&data->refcount);
>  	atomic_set(&data->ctx_seq, 0);
>  
>  	rdev->dma_mask = &data->dma_mask;

