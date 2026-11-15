Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794709751;
	b=aAP0VQRZ0yJw3IP/bVPltPT+Kc1/vUhvmtuV2HacttVbnlWGwsW6LvN1G4jbTaZiQaHC
	 ekoBL8lWnheqqCzbYC86GuHBxb138OuDGn/XabPV683FWjHaV7gkDgbMJkaeuYhsGX/N7
	 we1Gg3w0+SIYTFLNAH+ZXCoUfyEmTEBI6ZTFOiY1xCngqgk/PuEBi5XXxKA+W236o0ANr
	 K3/XK49tNYSZyrI6E+yBgnGuBvVhadSFcrfG13U2Cnoo654XNXBKjeWspKdafn5pf4bHL
	 iVhYBXsVHTKJbPE1+tDsWS3f/GMVrPzmdC30BajCeL0eA9FnDIFYdSCV/rs4dSUAa/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794709751;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=7CDE5oldwyToxMIHZaDAAROi1zR3/FKKlLBPz1nWp5Y=;
	b=WnEK6SkgSMWKYj+eddoJqibuLqtKJ/lqNWXSyreSXs+lSL4Nf7+z7EyHvU78sCayvX4j
	 bEqeE5gApC6RJDBpaNJEuFSUneJXqEjb86c5zQRzydL2SXQTUVY1+4zNCl+JUNgPIuZhh
	 +EL+ga8nzCC8/lPrUsIYoeMQf7dWU8UqyiyZkkfQxUhn4oMMhAumU7mJwC36VDfSVF4gc
	 VvPOZVxRh55lp9H6VZ25jWe2333qFSby3oUDXsr0uu8KwNvblGOgj+uNDMdjpOXSxvMuF
	 9vg2gTvBawe84G18QV0ZrmfHYMdVrTez2dW8k6WNlvPkqulQtFJ85JSPz++BZqOlsJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T+tStDCN;
	arc=none smtp.remote-ip=209.85.210.43
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C01606A32D
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 02:29:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13C01606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T+tStDCN
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-862a19300b7so327898a34.2
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 18:29:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794709750; x=1795314550; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7CDE5oldwyToxMIHZaDAAROi1zR3/FKKlLBPz1nWp5Y=;
        b=T+tStDCNHyTwpVrwpY/oHLqkXZxok0j3rwq91AyNE0mZPek6fIP8b13nuvhrJIUKa6
         ab1Kh/ROheDyxFbx5YhNLKdwQPpuAfv+em7i6tO8eNAGl4rztkwPSbCiHY6B1jVvXfoN
         o4lluGVK+4Gg/8XVtXotyh/feX3v1JHh0z566htkVAuSIMVyBSfBm6WImqIRC6OFv0u3
         yrccVrcpg2IHV66qfkIJs756YbNS7o9c7PTtu0upsnyijkhazliAemD6XeL00AaMJkFs
         JCgxOroc3w4Ddt4bs4GJPrf/PjeaJBWcSqLwS2ntKBZNgeCUIsnbhLPWh5bxnmBLox8V
         uRWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794709750; x=1795314550;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7CDE5oldwyToxMIHZaDAAROi1zR3/FKKlLBPz1nWp5Y=;
        b=NifWFe/zPD5uWqRFrZzOA5Eok9HMFVql7ZUfHKuokejSmikDTQKOUkWJZdwmiS4yDa
         AFaJkDmkQqOCyjuehILJ56CVTx6F+f05EOcS6eqZJoGhva3HGqJ5rBOhwRO6YO7wb6b3
         H+pmdmsDPO+jDICr02w4i8H8De8/T5D/uWb1cv/BOLce6RnbTvjn/dft9mjxDdV9Xn6A
         sykDTsx/kKrDC4PXo4TD8h1jledveOZIs90PtAA7RZWLYDhBMmwsSG7xo3qexInhtPFm
         uqj88GjXq7UI8INZRjtE+nj+0j7le2yYBTSbUlONICctR9ylBHKvVHBgvkczPrgfpLhh
         pWyA==
X-Forwarded-Encrypted: i=1; AL+hErEzq9bQH0NQkgMG7vlrgAlmikAlbZygIhWt30zObZxLnUfgdtJ1Kq/znNMNH4a9EYJM/jH1oqwi2qzyWhk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+VgYzC1CTscwlH4j1pLj9y9VNZ/oh/0Ag4wGdDOtRvAp+4NMGR
	3azLuNfG+j1esFM0DIWNjIGhY8fnfmbcdmUMY+yTHu09gPkui5tssuGO
X-Gm-Gg: AYBFou314uliwo35i4gnoAuTaLywliFWyCmdsLdnFCuicp+WXLCCj9G6YUNVAtl0MVa
	0Dp00X/AuL1zY+n1V5PevHzRYafH5E7fwUDVWffpJcKdddrVCzzgqd4CZSknn+KvDcp3i6Nh3lI
	b5GqyMZelNFTTe0LmQ3qABbJVk5VIJcoBpx3LKBgRVR0h37te2r3SwcOzJNXybN/VJwvDmg/oZL
	tfJVSumAHX/1UrS2UYv6N3En+iIdVfIj+weiT3ToA/YWfOB5Jolf+E1m1C5It0ECzbejNvU1bqZ
	uOmUi9qyIdSpcl1dD+/0aQDIQ9E4mL5kuvVhLkkrVUtua/VynfwXG30h6iv7DTRaTIFYH9c32zk
	IAbtVI8eA4q6nQ9aaDjVAujmQvcNKUaAO+23QA1EQPNdsJ/SnYKS/EE5j/tdJEot/YAn0ufphmL
	hu3nGHq3TtYz68gjr1CC4lyKGks5qPQjSfrJNxbbRwHb9OcNkAShNfhhuEqha4pzOyvUEm7+Ixr
	1MC8D0bUmQ6N5xjOKAFPl4s2BEbDUfqgEc/QSBnFkqIho5YOm83RMON5jVMd1fpkPTccQY05Pnb
	6TUOMfOzth6yrFXK8v9ZxqtMdCD1xQDlWwvCueNvPsws8i7Ou5PEZE060qUEv+EeRTrUyFd2NwG
	joPs3m1OLcoif2rSSXHKsdZlsaFo+yRpA
X-Received: by 2002:a05:6808:14d2:b0:568:39f2:1254 with SMTP id 5614622812f47-56e64dfaba9mr5765056b6e.47.1794709750000;
        Sat, 14 Nov 2026 18:29:10 -0800 (PST)
Received: from fedora-laptop ([172.245.82.59])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56e6fc412c6sm6246722b6e.4.2026.11.14.18.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 18:29:09 -0800 (PST)
Date: Sat, 14 Nov 2026 20:29:04 -0600
From: Ming Lei <tom.leiming@gmail.com>
To: shao.mingyin@zte.com.cn
Cc: shuah@kernel.org, linux-block@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 4/4] selftests: ublk: clear reused batch SQE command flags
Message-ID: <avkY8Hy04c3QzXSv@fedora-laptop>
References: <202611112257529855AMDZLzg8ZmFDQ3fBstbi@zte.com.cn>
 <202611112258022807A4cJ4GoTzO_Q2qeMKeG1@zte.com.cn>
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
In-Reply-To: <202611112258022807A4cJ4GoTzO_Q2qeMKeG1@zte.com.cn>

On Wed, Nov 11, 2026 at 10:58:02PM +0800, shao.mingyin@zte.com.cn wrote:
> From: Shao Mingyin <shao.mingyin@zte.com.cn>
> 
> Batch FETCH commands set IORING_URING_CMD_MULTISHOT and select a buffer.
> When a SQE slot is reused for a PREP or COMMIT command, batch command
> initialization overwrites the SQE flags but leaves uring_cmd_flags set.
> The multishot flag then disagrees with buffer selection, so
> io_uring_cmd_prep() rejects the command with -EINVAL. The completion
> assertion aborts kublk, leaving a recovery device QUIESCED or its CLI
> waiting for a daemon notification that will never arrive.
> 
> Clear rw_flags when initializing a batch command. The FETCH path sets
> its multishot flag explicitly afterwards.
> 
> Fixes: cb5a6b308700 ("selftests: ublk: handle UBLK_U_IO_FETCH_IO_CMDS")
> Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
> ---
> Tested on next-20261105 with CONFIG_BLK_DEV_UBLK=y in a local QEMU/KVM
> VM (4 vCPUs, 4 GiB), using real kublk and fio. With the same diagnostic
> kernel and batch null workload, the original binary received -EINVAL
> for a multishot COMMIT without buffer selection and its daemon exited,
> leaving the device QUIESCED. With this change the daemon remained alive
> and the device stayed LIVE before deliberate device deletion.
> 
> The four recovery scripts also passed twice with this change and a
> separate fix for commits arriving after the quiesce cancellation scan.
> 
>  tools/testing/selftests/ublk/batch.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tools/testing/selftests/ublk/batch.c b/tools/testing/selftests/ublk/batch.c
> index 625a9c32a..fcab2ca9e 100644
> --- a/tools/testing/selftests/ublk/batch.c
> +++ b/tools/testing/selftests/ublk/batch.c
> @@ -241,6 +241,7 @@ static void ublk_init_batch_cmd(struct ublk_thread *t, __u16 q_id,
>  
>  	sqe->fd	= 0;	/* dev->fds[0] */
>  	sqe->opcode	= IORING_OP_URING_CMD;
> +	sqe->rw_flags	= 0;

Reviewed-by: Ming Lei <tom.leiming@gmail.com>

Thanks,
Ming
