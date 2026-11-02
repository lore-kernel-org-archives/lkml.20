Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793641380;
	b=jM26HyuC1ZHgaPJpTe/Dg2aFrVfInqNg6yAoTeZS+/zknTR95ER6FGP1AR/Pa2/76FXU
	 1kOxgGLPKmnm9s81DR5s73c3UdP+4BcseeLyPESudyt3i+/Om3XgYCvvnBIhQvfoS8wwT
	 8sNECPl1V1PSGKRvPp6ygcZOp8qdIL49Z23o42/2abx3I0FLi4c9Iu1ZKft29EUFZDS1b
	 RWBrN6aNbrR20HS3pkwCbUzh/yXH686VcE91E/9fRA59nrVjq0k6H5KionsZWGN231m6m
	 Kk3wkZOAYueCFBDJvDEWiXpfoPhxQTartb7fy4Rh71XWWuK3g/AFQ+QTW5k2BHmg0eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793641380;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=IF3QP6AWqoRpGnQgFgZF37K62udADGWdf9OtCoGHGQU=;
	b=m+lAkHZrDtJddwRJNH5z4DlAr0YKw/e9L3BESSPDRuIjhiQoouU4+Xapg6BsP/aR586o
	 b+iZgGysDwDCU2+prahNof4PXBrW+tz2yTcB3YmAP5FLI6y8y1Lfh2bxEvQvR4vzmUVIq
	 hnACAb+j7CbxYqqqmJNcFI3tgxeILecBZH/zbnbMZArByuPz4ZwA70+Xn9Zw2f4EWv0+o
	 0WAtPxkd1GBzrNt5DJ23avGaztC8/OwBrUUOK9M2JRGRMJFfaHqRURXQv0J6IReeTJc8y
	 kp4vFDMEPzkrDL/DZ8ohrcHfl/c35wZZQbrmIpQ0cC87HDkbStySarKQEgqFzq0h2gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Nn5h5T8C;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07893606BA59
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 17:42:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07893606BA59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Nn5h5T8C
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2ea138a3497so21118785ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 09:42:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793641379; x=1794246179; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IF3QP6AWqoRpGnQgFgZF37K62udADGWdf9OtCoGHGQU=;
        b=Nn5h5T8CygzT1p+tLFGcKmhOOj3W0DDg8JCietGAgyWnlceLiS0/W62fWd5k5HWEyv
         OXPG1uEI+vKBn39A0tG1AuIMNO9H8WuEKAl413hRUu5bgEh9pqLMctDFuyz8vf+nr6L8
         qVofI7MolrkgpOmFPwIwzRN2eWe399mCVA03hotlY4uJbT7PrCz1uO/kR6ExK+EFj96M
         m8E8YS6JHotcy2tRP81R3V6Q3/Qgs4za3WoiYLo5hvKdUuYHozaAi69qDJ7Co3EEFiu9
         jC1cf6d4I2TeYSlAoivn1jMufxTz5WsMi1RT1Ym6TlZd9f4KhQogaZq7FP7U0rAmEN6K
         B/cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793641379; x=1794246179;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IF3QP6AWqoRpGnQgFgZF37K62udADGWdf9OtCoGHGQU=;
        b=t4DSUY6ZeE1Go4kLkHH3CIjmUv/0+D3DlOTC0Ks3FR7Bdfr18UU5QSRodkZMNo6fQm
         yPR8D7jIkZyfXjS9PhnBYL1fe1/ADxp25RvnKzYSB6M9kcOtHxlX5ZDgL4bh8PSfZR9n
         V9EA+Gn6ms35kLeIIrPjAeeBSw+O23HDSHFUkthjzbNUyVMt4vb4qyQKKnQpX6EX5OnL
         VhQ7OKire4ynXgqmv2C3wlQETufjOCpKgdgG10d6VQDt6tcscvLKLEoTSwAjXGJ6ZZ2p
         mg25RW8bdbqyisOo7t7gmi+3bCmEWkWsARI8wAF3dr/q+qEjRQkvmnZY4TugnMqKgfzK
         48dQ==
X-Forwarded-Encrypted: i=1; AKwUvBx0g8T5uzvu4cnWUB62oiTFiVaO2YXWqcQCKDUwL6BkXjYC3BnOUy+ifAYrBnZo5aah1+uuWruzr9pTRrQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8vW0UzTmQ4I0fQNUY++ZuoLtok5Y5wsFkVghoYa6IgWYNnnIMO
	3JmoCUhNf9s9n/dRu4nh7P/Wqme7GAHzV7pRzxR5Q8cUe7EGh/JZyoXgi3+d7zFWjuN0lSJBZq2
	PXjfF
X-Gm-Gg: AYBFou3b7Y9BdD+DpFxUVnzV8AOvWxZyfdLmthTbe8eiJ9Sqob7q+EZt3rTuIRH3jwx
	MUU1vYt93Wb72T4BN2/UXzobxbbIkOD0xix2XmicKKRMSQAB6h3cI63buaIWaEfs/e2YVQXVUFe
	cVGwZddZgt5ghD0I4IYQVYUCYrQAshG/W+akwP4/pH0rHHVzY8Rtdl6VHimo+0gXALjKCPfGJpa
	CRrloGcFN5Ngcqr2fuYiusqvISFvjMLaPWcAujZtRN/FkVFKdfuk8q2bn9DLvSBRkdGKhBx0t9M
	YpmUGyhw+G4b55TQk2nuNPwbJZ8ni6P8I4qjih3LBbS+MsKcX3WxTh6rNH5HY2Kppvsk1fEq7xr
	0DaRLxYTlBRcZfjEwPkanxMNoEJTGmo30xtcX5NzVXQA8Ur/uOT2tU0hJBsGXaiS6a1/HsKjzeR
	yJH7Mk2wdaL8ls/JusYqy5BocExCRocAe1DtFV3pFIyHph1n+HtdER65v77iaN7/oS3BkHHxyac
	IxEfPlKvFRzunCqBsHYzFSU3SKrXajR1GG2+j4FUhIAHRwoKIZDiLYNgCHJ7iIotAEn+JnFCokJ
	h5l1TDclCTg3m7OehrbWMpUJQLKBSX8=
X-Received: by 2002:a17:903:3c4e:b0:2e6:136e:f264 with SMTP id d9443c01a7336-2eb364e56d1mr106517765ad.50.1793641379335;
        Mon, 02 Nov 2026 09:42:59 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:810a:982d:b93e:e497])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb3922f56bsm31097845ad.16.2026.11.02.09.42.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:42:58 -0800 (PST)
Date: Mon, 2 Nov 2026 11:42:56 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Lianjie Wang <karin0.zst@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Tanmay Shah <tanmay.shah@amd.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rpmsg: virtio: bound the buffer sizes read from config
 space
Message-ID: <aujLoEtfDfXfh2t9@p14s>
References: <20261022194129.2233880-1-karin0.zst@gmail.com>
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
In-Reply-To: <20261022194129.2233880-1-karin0.zst@gmail.com>

On Fri, Oct 23, 2026 at 04:41:29AM +0900, Lianjie Wang wrote:
> With VIRTIO_RPMSG_F_BUFSZ, rpmsg_virtio_get_buf_size() reads the rx and
> tx buffer sizes from the config space as u32 values and checks only that
> each can hold the message header. The probe multiplies them by the
> buffer counts in unsigned int arithmetic to size the buffer area. An rx
> buffer size of 0x1000000 with 256 rx buffers wraps the rx part to zero,
> so the allocation covers only the tx buffers, and the driver posts the
> rx buffers at offsets up to 4 GiB past its start for the device to
> write.
> 
> Reject a buffer larger than the header plus U16_MAX, since the 16-bit
> msg->len cannot describe a longer payload. With at most 256 buffers in
> each direction, this bound also keeps the size of the buffer area from
> wrapping.
> 
> This patch is assisted by Claude Opus 5.5.
> 
> Fixes: ca96ea25e51a ("rpmsg: virtio_rpmsg_bus: Get buffer size from config space")
> Signed-off-by: Lianjie Wang <karin0.zst@gmail.com>
> ---
> The patch is tested against a virtio-rpmsg device added to QEMU. With
> buffer sizes in config space that wrap the size of the buffer area, the
> unpatched driver probes and warns in rpmsg_sg_init() while posting
> buffers past its allocation. With the patch, the probe fails with "bad
> vdev config".
> 
>  drivers/rpmsg/virtio_rpmsg_bus.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>

Applied.

Thanks,
Mathieu
 
> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> index 23ff6c8b7a20b..de4af75ee1620 100644
> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> @@ -91,6 +91,7 @@ struct rpmsg_hdr {
>  	u8 data[];
>  } __packed;
>  
> +#define MAX_RPMSG_BUF_SIZE	(sizeof(struct rpmsg_hdr) + U16_MAX)
>  
>  /**
>   * struct virtio_rpmsg_channel - rpmsg channel descriptor
> @@ -851,9 +852,14 @@ static int rpmsg_virtio_get_buf_size(struct virtproc_info *vrp)
>  		virtio_cread(vdev, struct virtio_rpmsg_config,
>  			     rxbuf_size, &vrp->tx_buf_size);
>  
> -		/* The buffers must hold at least the rpmsg header */
> +		/*
> +		 * The buffers must hold at least the rpmsg header, and at most
> +		 * the header and the largest payload its 16-bit len describes.
> +		 */
>  		if (vrp->rx_buf_size < sizeof(struct rpmsg_hdr) ||
> -		    vrp->tx_buf_size < sizeof(struct rpmsg_hdr)) {
> +		    vrp->tx_buf_size < sizeof(struct rpmsg_hdr) ||
> +		    vrp->rx_buf_size > MAX_RPMSG_BUF_SIZE ||
> +		    vrp->tx_buf_size > MAX_RPMSG_BUF_SIZE) {
>  			dev_err(&vdev->dev,
>  				"bad vdev config: rx buf sz = %u, tx buf sz = %u\n",
>  				vrp->rx_buf_size, vrp->tx_buf_size);
> 
> base-commit: bd1ecbb61afefc6a8b876ccbc31e9228b44e9eab
> -- 
> 2.56.0
> 
