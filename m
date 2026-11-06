Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793986648;
	b=ufFEv21thhrcXqlsK46AmvZGfeFjc+rz3kz4z4Qz1ZLwQnYHdXE7cL9Pc5LlLeJbppLC
	 Kde2YhNNbDyw7Jj5BsYmPZDgddAJtHtBlms1q9sEpq+HPKC4QrrFPiV7OIOyxMEczNPwF
	 I5id20zvJYlETUz/WGsA/50r4ja+Fu8aihCdyu709y1Ce0izPwkGxwjG3Y27HJd7tRIat
	 NaZ6+y7P9MXQuO2E4d6c6+TC2jcIs6s07wqgm9mEulOKPQIBUiN8DAb+X4FciOcwcZX+S
	 FuNb7hEsJ3fCehgeUregOVevVT28PiFOxZJteKIXBDaoZCf3Cn3+m52W+rABTktxS7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793986648;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=OKETz/chb1tHYfkJYLjvADpiiSfrqEQjXyv0+LotoW4=;
	b=v1r4xBPNRj/qC/9pGBHHw36D0NnhQjpFbpR7LK9uFujiJvwgslZB7hOBs3t2mnshd5zo
	 VwCWX8FIXgXPeCu3Beft/BAUoWj4gDQO3VG8g1JadpPGOd2YM/BJX6pfKI9artxx89W/h
	 Fkp/5gzagg+zRsgfGfJY0XrSSwUbYXMz3O8EqtIXNyTjkPLbJU0U0cwl7LvGWZjRstnFN
	 IJFWaVQwUkIzAI02cP+ygYs5skrfQJ5YA6AA4Te+OeU3XPHok3eO0PypqkWeNxqY1vPER
	 0kcMowupWFlauPL1e/SDA0aZOjSOOXkkyK0Lld45+Ef38yN3GfpDcjxXlkc3TaDoxpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=jv4JtOFW;
	arc=none smtp.remote-ip=209.85.210.181
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89464606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 17:37:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89464606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=jv4JtOFW
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8b1a705b88aso616768b3a.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 09:37:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793986647; x=1794591447; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OKETz/chb1tHYfkJYLjvADpiiSfrqEQjXyv0+LotoW4=;
        b=jv4JtOFW99wiV4NDqacB3xGxzaIoev9XxzTmlZKpB4s5HgPqYQAP9WjI0lJyyAdZ0n
         AVtBO+jFOjMVpXF4CqRP9I52o35we8R7SppFx0ThINAFmXTKPAnY9sKUf03XpOkZxulw
         PQR78jkhiQi5OmslTsz4oFAxfbw4Hd7XaLeO4/VnwrAUTqSIX44x4NFPvZ19f23re1lp
         n9X2/q1v5BGUxI+SGFovsN+eGe4eaIgwNH/MCCbNyszQ40+DAFGfhrhB8uOadGJNueXl
         WLvbQ7u6v71wtjPEE5EbxtnN17tlIzSORnxNmVlSvJqFmumjfzGWVsRZZUOG8xVyBgRv
         L3/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793986647; x=1794591447;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OKETz/chb1tHYfkJYLjvADpiiSfrqEQjXyv0+LotoW4=;
        b=RZQkrgIvsMf1qqp5300Be5WxgCWkLgOPf3JfpzByOjXdxzskpWeeUFxlsg29djXihs
         1kn/L/KsvhtaOD7kGcGmxNkzBdarysdN5aj84NRpobKkJN4VunglEulqAyUGTXI5Mejj
         34b/Vl46749hXAgvG9g7dehgp6vea6YjI1pNSdD/VUeRaSwn86gr8Wp999TXkyPykUsw
         P0Ocb1LnSX8PIqlPJTJN5IqyStyq/yXoIdaYRjXCi+xaeK8XEXhy0RPiGqyJt1pg58Ez
         lTAX4qG4ym+VSBHZHnJOWhOmzLjb8rVG79NrBBRVpUGd7fNk2YCTqMo49WEGOVgBIALG
         eesQ==
X-Forwarded-Encrypted: i=1; AKwUvBzqAVDVzJ1yXJNX2NlJoT0aYRpRHGclbJXUkm+QoTUw8QrpVmpc4OwCiGH9ZZmSrH24g69QkqOTsIzRw2Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z9D9sUNdJastV/nk2SoKtyQB3WYXfbVvRJ8Ha7icWusX4kZTrB2
	wF/19qV/clxTr33ML7xMGEsEgaiWQF4e+UjOVnzqCw1XCgbEo8vrxnTgiqX7tauEA5uU9JbWZhI
	en6DG
X-Gm-Gg: AYBFou2jokhzjxW0QKgKnsD0TXwJKyaKE6RgAIO/LVpqt/ejimRRzJQnu5cRo+gwN3X
	AhpYcSgP/OzibQaVnU6+HMCYq1HPEQugTdZJDO0/FDPFqIWmyxyJ1q6EuG8RYE/0ZzjZMhLDaQL
	KQuQilHrtO44GjcbMzJCSI5K/dYMoTQ2C791eGaNZPg6YuUuEkLtWzTw33EVnnOZXESaZrj0GZe
	lDHzmY1QhpNeCHG+TlW1Ek1YWNYthn+iot25ls3TuW9giYp2zyFIv/C8fHe2KgAcM8HT7hBhIBc
	4MB5nkii2kxphGV13fEXwl4nSS9zi3sQ7ihyQ4FxkZ3o4Ub3vZcHK7jJWvybRS9gd3YVXfsF5hY
	SsJ74rFYPAQ6C6lImktaX5o9QIOMO+kc3w9bUzTLgm4nwfnVZaBG71tFvwlUh6i4A94rJurDD2X
	NpeT7mmsAB/78Y9gyBTvFmiv77jmlKnyZSY+Zxf0n/MT9iYn9A+ijiG9UAlwn5ldn5jG3nlDNp+
	wDrkG8kRhNVaw6RiZXrYTr39OMMUGLPl0yz1MNtgFf0eJGdXWnPieUJY8TAUc6rg5gaqa60NHJl
	UjLDfFIr7rgAux8etLLYoHj/M2ogS1w=
X-Received: by 2002:a05:6a00:2e16:b0:899:13ee:1bd7 with SMTP id d2e1a72fcca58-8b37bb5b9afmr3072808b3a.35.1793986646752;
        Fri, 06 Nov 2026 09:37:26 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:b47c:40a0:a4eb:29ee])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b3597f0539sm855952b3a.31.2026.11.06.09.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 09:37:26 -0800 (PST)
Date: Fri, 6 Nov 2026 11:37:24 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Francesco Valla <francesco@valla.it>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Tanmay Shah <tanmay.shah@amd.com>,
	Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] virtio_rpmsg: fix config space alignment
Message-ID: <au4QVFyk7Zzc6y2u@p14s>
References: <20261101-rpmsg-config-size-v1-1-65686b445b22@valla.it>
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
In-Reply-To: <20261101-rpmsg-config-size-v1-1-65686b445b22@valla.it>

On Sun, Nov 01, 2026 at 02:54:03PM +0100, Francesco Valla wrote:
> The comment for virtio_rpmsg_config says that this structure is
> naturally aligned to 32 bits, and this is desirable by some
> architectures that don't get along with unaligned accesses.
> The content of the structure itself however isn't aligned, and the
> __packed attribute prevent the compiler to add this alignment.
> 
> Fix this by adding a padding byte.
> 
> Fixes: ca96ea25e51a ("rpmsg: virtio_rpmsg_bus: Get buffer size from config space")
> Signed-off-by: Francesco Valla <francesco@valla.it>
> ---
> Hello,
> 
> unfortunately I missed this when the original patch set was sent, but I
> think it's worth fixing (or at least discussing) this now before it
> enters a stable kernel.
> 
> The same support in open-amp has already been merged [1], but maybe it
> can be fixed before the next release there too?
> 
> Another, lower-impact solution would be to fix the comment, but that can
> then led to issues on architectures that does not support unaligned
> accesses (e.g.: AMR Cortex-M0).
>

Thanks for bringing this to my attention.  I agree with this patch.  I will give
Arnaud a couple of weeks to reply to this email though.
 
> Thank you
> 
> Francesco
> 
> [1] https://github.com/OpenAMP/open-amp/commit/744376f566c3ec7e06a7d093d785295b78aa486f
> ---
>  include/linux/rpmsg/virtio_rpmsg.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/include/linux/rpmsg/virtio_rpmsg.h b/include/linux/rpmsg/virtio_rpmsg.h
> index 0872cbca4593..d24fedb63023 100644
> --- a/include/linux/rpmsg/virtio_rpmsg.h
> +++ b/include/linux/rpmsg/virtio_rpmsg.h
> @@ -23,6 +23,7 @@
>   *
>   * @version:	version of this structure, currently %RPMSG_VDEV_CONFIG_V1.
>   * @size:	size of this structure in bytes.
> + * @reserved:	padding, reserved for future usage.
>   * @txbuf_size:	Tx buf size from remote's view. For Linux this is rx buf size.
>   * @rxbuf_size:	Rx buf size from remote's view. For Linux this is tx buf size.
>   *
> @@ -33,6 +34,7 @@
>  struct virtio_rpmsg_config {
>  	u8 version;
>  	__virtio16 size;
> +	u8 reserved;
>  	/* The tx/rx individual buffer size (if VIRTIO_RPMSG_F_BUFSZ) */
>  	__virtio32 txbuf_size;
>  	__virtio32 rxbuf_size;
> 
> ---
> base-commit: cbbddb6b08cc9900a87cccaa9b22bbe06aa4f50a
> change-id: 20261101-rpmsg-config-size-0dbe9ea63c6d
> 
> Best regards,
> --  
> Francesco Valla <francesco@valla.it>
> 
