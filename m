Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794822685;
	b=Y1a4a/EaZlzwEQbM9E+JI97kuHmb9au96Ka1a0grienaUqfAOCL24TFlWqEXjzMS5r2B
	 tA9MP+XDM2T3OK5dXCG8COVZ9z+pP9OvL46IHJLDx2rnFmI4bxxASP+0JQrvPnb+I7vwC
	 qmAjzHtd87aQVoXtyWaZ0T0bGDiTmWl1bz8imDL4NkvutS/Hg1Hbgbu85TK6BcA/Y8pr1
	 rzbccQBgPf8d7xzzXguDW4pgrKOOCTb87aebAyhxdWIF1kVhsisArqbBzaYGNdPLCRgjI
	 WKv8nTeXRhIzf+vHsHiSse6ToEmudbHAR6q/a0R2KFgysJ1toZEfW4JJUr5iIySiOow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794822685;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=N+fImhJ1pc1ohPywlDOVCLfSXbIN+d12UyWza3WFBhk=;
	b=sd7SjJhSEIPnnJ9OJD3w4oxz6GtzgrvDoeFqEi37NcJGMyEMTxx7mnWhRa/maVGeFV5s
	 juwnm7BogcQh/6mpHAIfb5lJxCzBiG1lVEBk9f7sPXOjwKo+9XcyOzRMlQmNXa6/m378j
	 MB6s2EkXipn9+eoFUVxKYEPOSytAZ6d5b2ojN7UBhQCAuohDmfTOezTVhYFPIJE83/2Of
	 vI4wFy6ls9OfukN2CNjJD3uAPm0kIy9EwXqvAWoAgqsyNu4E8oHpPpdXlyGv1J+JjvNRf
	 41RmBz2EK/NupF4nAc5JWhBQTPDEx/aAnxa3bKLStNHZ4cqZVqbU+0R6qtzybmlW9lQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EeFkAcdf;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 551E1606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:51:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 551E1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EeFkAcdf
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4918c2d727fso1739465f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 01:51:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794822684; x=1795427484; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N+fImhJ1pc1ohPywlDOVCLfSXbIN+d12UyWza3WFBhk=;
        b=EeFkAcdfmpM/alg861PlAN3DrjF1bRj9ji0oDldUfaZv3j2CudELa/V0lrOC2gOkAG
         JGNkG9Blg/e5dnyx2OH4OuiMCYhFr9l99Ysf8YzZ/ks2aAc2KVLu4vH1KnHaNiDJd2E6
         uQ/myF+6CEQL7AlIAfTFXYZ/tDTPmqRORayOJm+JLmOFKYXRlMt7O52H2VceZUp/QiKA
         Xn3+0Z/DALpAQexSUr1ikDhJBCi0+kUKJIUwJ4e1WU/rwlPDlz4YYqJ0htdnv7ic21x0
         H+QfTC6+EUtcg7wTqdg6ULdakSYDXtVnUpK61Z30ZOur/uD9OitvzhOo06AZYJYQeLCL
         EVwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794822684; x=1795427484;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N+fImhJ1pc1ohPywlDOVCLfSXbIN+d12UyWza3WFBhk=;
        b=f+UrdEEqHnL8lJDCnzWggcOrRZPb1BKW5ISx8wga6rZV2MVfMPQYSuMy9y/bDOsFfb
         AmYHIRn6r32T+8GhTcPo4UsQgBI6/WALqHeTWKySun+4F4VNr74Qy1zOQSL6reU8figZ
         i4i6DY9WRB0tLUt9IDXPA9UJMkQP4iJGCenHmA84LsS4q4BlrYt1cSHhXPFkniQGJGh/
         KS6fCu6XtCSI08X8PDPdYzxW4W0xCozox5fUtH5N1yqul906eU9pENSajMSiHh3XFD3C
         GVdg1zI1V5ykmNBkbi8r8y+efFad7O+okhEjZh3zqJq5BhcXWHy/szhnyzS/OiAjET5l
         xeOg==
X-Forwarded-Encrypted: i=1; AL+hErEF0l5egvtZpi9MA27f7Q4UkGnh+UAdlwK+Ezk+jFFGvUe6lqvTlUjwyKLKyDL9DSoDUBKg5Bj4DKEMins=@vger.kernel.org
X-Gm-Message-State: APuU4Z/9MJedomaLblzqLG1bZ1nP+hTG1swgJfkHCc/g61c3xFxH7JZA
	b4a84j7XVn8a929aootWtBBKCAI46OJ1DnTkMiCqlCExuaGDlfvo+Se2
X-Gm-Gg: AZFdTZc8WYqtNouWu8TALFxk4o03GU98iGq8DbwaN/F9uQxqvy065kgcKThLc/GIoQ6
	4NLPYFAhkw4XJ4exJLC10z5m7/KDWW5LPjF6KRoFfuGRzb9d+LmZ+2UQ9fXzHNtirdK5kvMfeaF
	SWj7wZFMvfYJafs52zVJJTzjrbkaXtx5x+NSv92ofX4SfAYujydi6tDx1uOyqJ4fmMBKHKJdggD
	W5LG8eKmlUmilzTb9gpydGWO/6zZbfDsIkXq9ydPKMCtYp966UD5erF68+bEcrE2mMA4ExfOvBv
	dBUqB4qgw5lL3GdBOf5KcQSmroHEaoy+OGgWPM64Dw3D7/XE6gWihIfdHvTJw0WisF5NN6GN9Iq
	BW9E2kOoOU5/1PdgN02soNyTnTWOdXbjML9HGLLVcuCHBLsEHh3gutB2u6obj6zcZ4QeWNAwLD1
	QE/yHj5kig2Nv6tCYYQcKlv3Xa/y2/6kSU/atn433wM3HONF/LB5MAU8rTltyYhnoK25JyNFuED
	o3r+2TQ8fHzYuuPrY/Zq02PTqG9FdSiXVXGIL5IVfjKQ6MbwlEp6l3StTVVi4UcqxZiOpUqcEzs
	51Vp7DQ=
X-Received: by 2002:a05:6000:2584:b0:49d:a36c:2d66 with SMTP id ffacd0b85a97d-49da38ab522mr16399232f8f.27.1794822683448;
        Mon, 16 Nov 2026 01:51:23 -0800 (PST)
Received: from eichest-laptop ([2a02:168:af72::cb4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f1c1968sm21517792f8f.10.2026.11.16.01.51.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 01:51:22 -0800 (PST)
Date: Mon, 16 Nov 2026 10:51:21 +0100
From: Stefan Eichenberger <eichest@gmail.com>
To: Mehmet Fide <mehmet.fide@gmail.com>
Cc: Andi Shyti <andi.shyti@kernel.org>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>,
	linux-i2c@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] i2c: imx: test the block read flag of the message that
 is read
Message-ID: <avrSGehp4JX4aQ5L@eichest-laptop>
References: <20261113110501.1142036-1-mehmet.fide@gmail.com>
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
In-Reply-To: <20261113110501.1142036-1-mehmet.fide@gmail.com>

Hi Mehmet,

On Fri, Nov 13, 2026 at 12:05:01PM +0100, Mehmet Fide wrote:
> From: Mehmet Fide <mehmet.fide@screeningeagle.com>
> 
> i2c_imx_xfer_common() decides between the DMA and the interrupt driven
> read with I2C_M_RECV_LEN of the first message of the transfer instead of
> the message at hand. A block read of DMA_THRESHOLD bytes or more that
> follows another message is therefore done with DMA, which reads the
> initial length and does not look at the count byte.
> 
> Fixes: b460b15b3cc2 ("i2c: imx: separate atomic, dma and non-dma use case")
> Cc: stable@vger.kernel.org
> Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
> ---
> Reported by the Sashiko review of another i2c-imx patch:
> https://sashiko.dev/#/bug/linux-f62df5ed-ad96-43f2-872a-ae2c0100b73f
> 
> Tested on a Colibri VF50 (i2c0 with DMA) with a v6.12.117 kernel that
> carries the i2c-imx changes of v6.13 and later as backports; on this
> base compile tested only. An I2C_RDWR transfer of a one byte write
> followed by a read with I2C_M_RECV_LEN and an initial length of 16:
> without the patch 16 bytes are read and the count byte is taken as data,
> with it the count byte is evaluated (here -EPROTO, the device answers
> with 0x25).
> 
> The line is from v6.13, the patch applies to 6.18.y and 7.3.y.
> 
>  drivers/i2c/busses/i2c-imx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index ccf08cd63151..9abe0a26c877 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -1713,7 +1713,7 @@ static int i2c_imx_xfer_common(struct i2c_adapter *adapter,
>  			msgs[i].flags & I2C_M_DMA_SAFE &&
>  			!(msgs[i].flags & I2C_M_NOSTART);
>  		if (msgs[i].flags & I2C_M_RD) {
> -			int block_data = msgs->flags & I2C_M_RECV_LEN;
> +			int block_data = msgs[i].flags & I2C_M_RECV_LEN;
>  
>  			if (atomic)
>  				result = i2c_imx_atomic_read(i2c_imx, &msgs[i], is_lastmsg);
> 
> base-commit: 25e7ab89f4774b0f842cee0e8a20c11f755924d5
> -- 
> 2.56.0

Thanks a lot for the fix, it makes sense to me.

Reviewed-by: Stefan Eichenberger <eichest@gmail.com>
