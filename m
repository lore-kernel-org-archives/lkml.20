Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793987731;
	b=zMMJprbPIixwN70Ha+3aPj9DRhA89DEuImE1mKSQ2LfLwhJ+ZHXAgRHKuRworujdNtHv
	 EW56/+VBksXpbZbFtDTbfWCg/8SfLX10o8VdIgckRx+hCUDGM7xmRAEauWnBylwJCe9g+
	 M5nRJmlp+raSoOLb1MMmJs2pVs/2qAIbmh5KfGs2ovW0ERRqDa89W4ikCx42BCUHYRt7m
	 k9GardUv2bbVCjg1JjtZoxaXsD9PazXj90qk/ChS7yTO7ed2xoZPjsceFs4ja8W8C0/Hr
	 1a2xFPt6UGEu8FmmKkmyGKiP2/b+aQdA60TbRvmkB8cC9K69QYUtf3qy3pJa5C307Cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793987731;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=mr8GCRAOmajdICVG5OcvHing6H+KXq+hdcv7TT8Lw4E=;
	b=k6/BSKI/D6qyKLlpH+Y5X4wSst6sSGkPqdrL/iPxdjZqowxGpOKLnIR3ZjBc1oRmYayn
	 lYuv2b2oh6esBW4ZPRuqzyfYiXNgvQS0Pg0uHQNUbegwN2cnI1GvasKfTwWlVTXtL6BxK
	 q0IvzdqdpFRfaNyySFWSobfI/43WcBAI3PTRhihVUlk5WUwmBt745X0WWYzjROd5zl7bD
	 9DG+1bgTV+5PQQtJ+62dWAYAOmde4D9WmdrktTjsZ5K0cqbyWGpyYpj+cE3HGZRYZ/bZY
	 uzRtwCj1q/ew8El4WF7pFVduRovNJMxC5gBiGMu7g66oKeB8VzdmgR8gv/JPqNZqSRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="rf/yAERp";
	arc=none smtp.remote-ip=209.85.210.175
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40CF0606A32C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 17:55:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40CF0606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=rf/yAERp
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8a0880a46e7so508612b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 09:55:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793987729; x=1794592529; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mr8GCRAOmajdICVG5OcvHing6H+KXq+hdcv7TT8Lw4E=;
        b=rf/yAERpHuKsLWUgLKL5AuC4EEwpdmhPa1zpuCZKOFCUkx34cK3yrBLlXhrUlTDcVy
         Rk1/C8gYwofcNgHzd+4WzOUITsaOmRhpGZEgLbldpfxjlsJZYbgCRbLuov0aMFWIbG0J
         RxkyN9jRi8GqrcOSYnJO8UJHC2m4YT6oyLx4MyFmRAex4F4240Fpql6H4Sg5sh1SueDY
         DE55nCy3uwK2NLG3wxKVKIt1Dv7svxV0tfJ4DFAgQjJM5NKqTx3Ld0copNysCU5S+6PO
         lwenUkZIKg5xxd52i8TWboXl7fadNXcHJzzs+rtDaWUb09MWOp73SwlESi4WtHa0rovR
         oGHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793987729; x=1794592529;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mr8GCRAOmajdICVG5OcvHing6H+KXq+hdcv7TT8Lw4E=;
        b=n/ow3YyrgeC3hjSGDUaYUJxBiWeGpQNex3Ui0BlfIkXbh8YBLcwS8SU/G/2Q8GNjFq
         pJNJ/P8bqWaN5U1u4WfFTRllEhOVdA37+VxMpDur9Jrk51mCS+0OemnkmHZuo6uABNzf
         lH00v0uLiO0X8/7PVxWZYFR5wkWPfEVfM3fcuIucVmfyx6QV2WD3MkQjcU2inhMfzvQe
         ajH+x+PycN/vtxzGc672gAgmNI9IvSPcoy3N3SiWE6B65aUFgjcvPTLi88xafREkKPUa
         eDHvas+IBkI8D4kappzwQiS2Uz+6obLbneTe6eQVhZGDwuwxv2pzB2TpWIgUEFHP+BkG
         gLNQ==
X-Forwarded-Encrypted: i=1; AKwUvBxnFeg+d57cLSGWnTXW6O29geEotrsSQcKlOb/8x+Q46KhYKtY93Ota02r95M4sQm5kugh7zN3sEIbtLhA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8y6YJxztuVBBy8icYBBd9OtCn4fJm12IMgfPy8iwRSsufWRP7v
	5QVIGhGEDK3ynzgVavStlCXEkDwnjMr0aZPCf2j9JgXJE3gefnhe15SGH5plUVsLYfs=
X-Gm-Gg: AYBFou34GgFtG7jSA6kPxIv9n2Q5X0gu/kDcDq1dTQVk9Bj2mbimEG2EARpSKPurZEG
	9sIwlhmPXIfz73lxmsa5keNbF1lqtd8gC1y2mZSlND1/xlUWq4HNtUBUHHwbPVjN3QM66ef8UjH
	0SdSL8RfQGT8jQrgyxZb4nXfTXp2YXSToMDBZGBcPfT/v42MY6P2Qm7LMR//PxJI4M+xHW9u+ZO
	uYNnO0avSoYxEFKEgwPSOa3PYzZF1/vuHWAZssgQog0CletYboywJxa+oGlFTXi5RNDl3iQ8i+8
	CaZ89U0rC60E9H6vEGd3a5BfHlZjv0isfF5pr2ozmrLYmPWelGszEUF2YStKGdTYUg+Tc7ZkePn
	UGESWw1Xv5fp5/7+Q5yaLJLfM+jz4A6LM931TESWcKJ240w7vOFue1tkVmoKJr4Bmg6K1KU5EBq
	ipP0h4KkpBWG+gLcNrZo7pNip/iRh19FQRvebeJExmuHrencxsCbA00ngoq/ab2QME+4K0qNCEv
	205NpbvtxVYZaEUyEzLF+UeQ4y8dB0hFp4dfj+McEoBXQ+SkyfIpylCWn+HUFwHTa/rGSsvGXRF
	SdoB3Ar6HKG/IC29vGv4OdBBSJmWOECJ
X-Received: by 2002:a05:6a00:3a20:b0:8a0:652e:95eb with SMTP id d2e1a72fcca58-8b1e50a34dbmr4767646b3a.8.1793987729411;
        Fri, 06 Nov 2026 09:55:29 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:b47c:40a0:a4eb:29ee])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b356c2c5a5sm847951b3a.7.2026.11.06.09.55.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 09:55:28 -0800 (PST)
Date: Fri, 6 Nov 2026 11:55:26 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Lianjie Wang <lian@is.s.u-tokyo.ac.jp>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Takahiro Shinagawa <shina@is.s.u-tokyo.ac.jp>,
	stable@vger.kernel.org
Subject: Re: [PATCH] rpmsg: virtio: Reject a message shorter than its header
Message-ID: <au4Ujm6W4Oq53WgO@p14s>
References: <20261102221504.175116-1-lian@is.s.u-tokyo.ac.jp>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261102221504.175116-1-lian@is.s.u-tokyo.ac.jp>

On Tue, Nov 03, 2026 at 07:15:04AM +0900, Lianjie Wang wrote:
> rpmsg_recv_single() rejects a message whose msg_len exceeds len -
> sizeof(struct rpmsg_hdr), where len is the used length the device
> reported. Since len is an unsigned int, a used length shorter than the
> header wraps the difference, and every msg_len passes. The endpoint
> callback receives up to 65535 bytes from a receive buffer of 512 bytes
> by default, and rpmsg_char copies them into an skb that userspace reads.
> The receive and transmit buffers share one DMA allocation, so the copy
> can run through the following buffers and, with small vrings, past the
> end of the allocation. With vrings of 16 buffers and a header claiming
> 65535 bytes, KASAN reports:
> 
>   BUG: KASAN: slab-out-of-bounds in rpmsg_ept_cb+0x4d/0xb0
>   Read of size 65535 at addr ffff888002484010 by task rpmsg_echo/140
>   Call Trace:
>    rpmsg_ept_cb+0x4d/0xb0
>    rpmsg_recv_done+0x29f/0x840
>    vring_interrupt+0x32a/0x540
>    vp_interrupt+0x146/0x180
> 
> Compare the sum of the header size and msg_len with len. The sum cannot
> overflow, since msg_len has 16 bits. Move the check ahead of the debug
> output, since dynamic_hex_dump() reads sizeof(*msg) + msg_len bytes
> when its dynamic debug site is enabled.

I don't understand why the check is moved ahead of the debug output and the
robot generated changelog isn't helpful at all.

I agree with this fix if we don't move the check ahead of the dev_dbg()
statement.  For this patch and any future ones you may send, write your own
changelog rather than simply dumping what the robot says.  

> 
> This patch is assisted by Claude Opus 5.5.
> 
> Fixes: 9648224e564a ("rpmsg: validate incoming message length before propagating")
> Cc: stable@vger.kernel.org
> Signed-off-by: Lianjie Wang <lian@is.s.u-tokyo.ac.jp>
> ---
>  drivers/rpmsg/virtio_rpmsg_bus.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> index 23ff6c8b7a20b..a9125e81cb150 100644
> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> @@ -661,6 +661,16 @@ static int rpmsg_recv_single(struct virtproc_info *vrp, struct device *dev,
>  	unsigned int msg_len = __rpmsg16_to_cpu(little_endian, msg->len);
>  	int err;
>  
> +	/*
> +	 * We currently use fixed-sized buffers, so trivially sanitize
> +	 * the reported payload length.
> +	 */
> +	if (len > vrp->rx_buf_size ||
> +	    sizeof(struct rpmsg_hdr) + msg_len > len) {
> +		dev_warn(dev, "inbound msg too big: (%d, %d)\n", len, msg_len);
> +		return -EINVAL;
> +	}
> +
>  	dev_dbg(dev, "From: 0x%x, To: 0x%x, Len: %d, Flags: %d, Reserved: %d\n",
>  		__rpmsg32_to_cpu(little_endian, msg->src),
>  		__rpmsg32_to_cpu(little_endian, msg->dst), msg_len,
> @@ -671,16 +681,6 @@ static int rpmsg_recv_single(struct virtproc_info *vrp, struct device *dev,
>  			 msg, sizeof(*msg) + msg_len, true);
>  #endif
>  
> -	/*
> -	 * We currently use fixed-sized buffers, so trivially sanitize
> -	 * the reported payload length.
> -	 */
> -	if (len > vrp->rx_buf_size ||
> -	    msg_len > (len - sizeof(struct rpmsg_hdr))) {
> -		dev_warn(dev, "inbound msg too big: (%d, %d)\n", len, msg_len);
> -		return -EINVAL;
> -	}
> -
>  	/* use the dst addr to fetch the callback of the appropriate user */
>  	mutex_lock(&vrp->endpoints_lock);
>  
> 
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> -- 
> 2.56.0
> 
