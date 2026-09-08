Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB04E37701A
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 19:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788895889; cv=none; b=lih6NEALEhs/TchTzOMS6LXF7mPJCASS/43PSTUHUzFCfhQmwZZ9hsNDoiJd3lAwr/ySuCVV/5JpaRO44uxO357/VINaSvPZuBTe3iwPJ5QS6c3hlPTHcedwcfz/luhsygoU4+Hr7m+kLJf7EvNUuyL7T5+6duSTechBf7O4GGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788895889; c=relaxed/simple;
	bh=/1pXjrR9cuOnK2vYyqHrGZFoJSq2pPsJGh6P1fXARuw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sSGXfCnY9/JwmfIm5lmztoeqRTUATDtI0ahpda6fMYxb0S+eyp4abSHnHMCNsWBLHeloooMadVDiyNXPrlfvCedaH2fg9RpG45I5AK7bUBDjLSFcEFpRxhOvLbEcPPh4s1t+H/I0qEojPs3R6KvnVjGOyn7J86yBQGEgIRo5MW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gPCgwmXa; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gPCgwmXa"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4859245e493so2670269f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 12:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788895885; x=1789500685; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bnI1itulTesLodw5EkiLefmn13ex/6XxibeK3IHMIsk=;
        b=gPCgwmXaZQyhbKMsqvImGNlqtpeofWtuLoruBIuXOp3auRsbNRieGVYGt+QHCfzB+E
         CLpv6dkW/BK6s14ZkRtAsFUnire1joEjp9pRttPo2+nePhDNky3X+VAmVz1rXq6dDdZo
         nxNKzZEhlfskxuMnk7k002jNwHYRVzMlp8liuxpH/UrHsmt2FLGrrP/0vamt4j/jkSrW
         HeBaAHKfRxNEKzSu4OS8uWd0IEPOMfc+ugXhJ/05fEtDYos59W0s7G8vlgIxsi7o2vUS
         N2YrppmffQJZEoew4ixzAZFdeYFfcCPRZhuHbKGqZ6/Tf8QN5DXrN0y9h0zfcWuqOO1Y
         pqCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788895885; x=1789500685;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bnI1itulTesLodw5EkiLefmn13ex/6XxibeK3IHMIsk=;
        b=a78CsOzos+2HFvI0YM7Yvv2ZLmkdVuVfypYuP7fUjDQkPh4M7IO9GoRW6S7xrqUudn
         821HO8NUossmIkZi+adT+cBG4l3VlKijIgqw3SOcz/xRPWbBpUQ0h60KpzJhjEv+ph9t
         JxovBQ2w2ZPm6/un0HfkOtxo00CwFAbNnw7Tn7+sBHZz8enI8pazxI8DI0iyyLfhR2FM
         8SRL2RSzdlKNjycFm5uVWgE5ULwDjVpqD0AMYSiUVJiax+FGhZhkQF/oy3Wg9uhlR751
         68a8FneBXiLk5dZdl9xQwIpIHl8bbonJd+vWdQYeVJTl6Vd8VXd0r0I57exLuSDIDFKg
         56kg==
X-Forwarded-Encrypted: i=1; AKwUvBxm+s7F8sRjrt3W38IDrx0FGwgKIPvlSfE7pItJpu43ft0ZXUKhD6jTrOe4n+ywDVvySt6IKzToz8iwO08=@vger.kernel.org
X-Gm-Message-State: AFuF++nT3n4HP9+PyB9b/vQZJ/Y3KP+VtNlKvfeQZ1X8h1MG8w/fcwUz
	RJ0xlb6WFan2yp4odrb5WLUPvlscNFC9P4oxuuTpAH/IL0mvEAR9ai8x
X-Gm-Gg: AYBFou1rciX3WLJImivS8e+UV4cj/jFCXpds2hmMIKAfM8ORg3Rqnyw7PAc6k75yaII
	NgfWnjt6UHmIfb0WMcpqdCLpnrOHVDIgFr+nGf/8CnmiuMsqYBPzxiK1JruoL59j0X7u1phkRNe
	vkBkfiriKIOotjMYG9wKWE94nyH804Of2l+i0Fpm5mOTDRreEOV3p/a3d1thjrfRu8+6L2KCRiJ
	9ZQbAgWLFvfH6GZLm+8gr1GR/ETj0BE02i7DIRm5NUPp6wPRVWHXKdISrzMjkX8DwQ5yRgBnX8E
	NjM/tkjfMLSn6QPY8bjrhU94Z9mOLFCKZIc/uBrZrUjjHLlP57dJbwzbb1jl7byqxMqLhgs9Kh7
	R1HTY/ow0COyhGB/G5sdOnfxWJ2ey/AVEIJmI4KcwGJUcRFsNIWNzDrlP2K/rickM+jzE0kvSlk
	RZIR0R7yzgNkH87PSFqy5Fu8sN7QYUhr7PaTWEZA3+qMV92LWRyG9Os/2OWWKE742TNXIoI88Jw
	Ct7d1Pfx5st0A131UKkt+aPSv3xbaPerHxEgg==
X-Received: by 2002:a05:6000:470a:b0:47f:4919:d5b2 with SMTP id ffacd0b85a97d-4858707f262mr33763744f8f.1.1788895884671;
        Tue, 08 Sep 2026 12:31:24 -0700 (PDT)
Received: from [192.168.20.170] (5403F394.catv.pool.telekom.hu. [84.3.243.148])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485aa2c9acasm2597169f8f.36.2026.09.08.12.31.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 12:31:24 -0700 (PDT)
Message-ID: <5231553f-c24d-4bae-a73e-1f2af8c13636@gmail.com>
Date: Tue, 8 Sep 2026 21:31:21 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] spi: spi-qpic-snand: publish the ECC context to
 snandc->qspi
Content-Language: hu
To: Johan Alvarado <contact@c127.dev>, broonie@kernel.org,
 md.alam@oss.qualcomm.com
Cc: konradybcio@kernel.org, pengpeng@iscas.ac.cn, miquel.raynal@bootlin.com,
 quic_varada@quicinc.com, quic_srichara@quicinc.com,
 linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260825013848.1056946-1-contact@c127.dev>
From: Gabor Juhos <j4g8y7@gmail.com>
In-Reply-To: <20260825013848.1056946-1-contact@c127.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Johan,

2026. 08. 25. 3:38 keltezéssel, Johan Alvarado írta:
> qcom_spi_ooblayout_ecc() and qcom_spi_ooblayout_free() read the ECC
> configuration through snandc->qspi->ecc. qcom_spi_probe() points it at a
> zeroed scratch struct and only qcom_spi_ecc_prepare_io_req_pipelined(),
> which runs on page I/O, ever updates it. qcom_spi_ecc_init_ctx_pipelined()
> installs the ooblayout but does not publish the context it just
> allocated, and qcom_spi_ecc_cleanup_ctx_pipelined() frees that context
> without clearing the pointer.
> 
> spinand_init() calls mtd_ooblayout_count_freebytes() right after the ECC
> context is created and before any page I/O, so the ooblayout always runs
> against a pointer that does not describe the current context:
> 
>   - On a first probe it reads the zeroed struct from qcom_spi_probe(),
>     so steps, bytes and bbm_size are 0. The count then returns 0 rather
>     than an error, so the probe continues with mtd->oobavail set to 0.
> 
>   - On a probe retry it reads the ecc_cfg the previous attempt freed.
> 
> A retry is easy to hit. On IPQ5018 with the qcom,smem-part parser the
> partition parse returns -EPROBE_DEFER until SMEM has probed, so the
> first spi-nand probe defers. It defers inside
> mtd_device_parse_register(), after mtd_otp_nvmem_add() has already read
> the factory OTP - that read goes through prepare_io_req and leaves
> snandc->qspi->ecc pointing at the context that spinand_cleanup() then
> frees. The second probe allocates a new context, never publishes it, and
> computes the OOB layout from the freed one. Once the slab has been
> reused, qecc->steps holds garbage and
> 
>   oobregion->length = qecc->steps * 4;
> 
> goes negative. qcom_spi_ooblayout_free() only reports -ERANGE for
> section 1 and later, so mtd_ooblayout_count_bytes() sums the regions and
> returns that negative length as the byte count. The -512 below is
> steps * 4 with steps == -128. It is a byte count that happens to
> collide with -ERESTARTSYS, not an error the driver returned.
> spinand_init() takes it as an error, and because it is not
> -EPROBE_DEFER the driver core never retries and the NAND never appears:
> 
>   spi-nand spi0.0: ESMT SPI NAND was found.
>   spi-nand spi0.0: probe with driver spi-nand failed with error -512
>   UBI error: cannot open mtd rootfs, error -2
>   Waiting for root device /dev/ubiblock0_1...
> 
> On a Mercusys MR80X (IPQ5018, ESMT F50D1G41LB) about half of the boots
> failed to mount the rootfs, the outcome depending on whether the freed
> memory had been overwritten yet.
> 
> Publish the context when it is created and clear the pointer when it is
> destroyed. Clearing leaves snandc->qspi->ecc NULL after cleanup, which
> is safe: the mtd is unregistered before cleanup_ctx runs, so no
> ooblayout callback can follow.
> 
> Fixes: 7304d1909080 ("spi: spi-qpic: add driver for QCOM SPI NAND flash Interface")
> Cc: stable@vger.kernel.org
> Signed-off-by: Johan Alvarado <contact@c127.dev>
> ---
> Tested on a Mercusys MR80X (IPQ5018, ESMT F50D1G41LB) running 6.18.44
> with the equivalent change; mainline build-tested with W=1, no warnings.

Tested-by: Gabor Juhos <j4g8y7@gmail.com>

Tested on top of v7.3-rc2, running on the Tp-Link Archer AX55 v1. It works as
expected, yet I have some comments, see below.

> 
>  drivers/spi/spi-qpic-snand.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/spi/spi-qpic-snand.c b/drivers/spi/spi-qpic-snand.c
> index 61b1f2eb19ce..0d0ae93ad4bf 100644
> --- a/drivers/spi/spi-qpic-snand.c
> +++ b/drivers/spi/spi-qpic-snand.c
> @@ -411,6 +411,8 @@ static int qcom_spi_ecc_init_ctx_pipelined(struct nand_device *nand)
>  	dev_dbg(snandc->dev, "ECC strength: %u bits per %u bytes\n",
>  		ecc_cfg->strength, ecc_cfg->step_size);
>  
> +	snandc->qspi->ecc = ecc_cfg;

For the sake of completeness we should remove the identical assignment from the
qcom_spi_ecc_prepare_io_req_pipelined() function as it gets redundant after the
change.

Additionally, the zeroed ecc_cfg instance allocated in qcom_spi_probe() become
unused so the allocation can be dropped. However, since this is not strictly
required for fixing the use-after-free issue, it could be done in a separate patch.

Regards,
Gabor
