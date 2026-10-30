Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793391179;
	b=AYeSWpNMevuegl1zbeLtWYG0iT+w0OzYRrLl6M6jQA1rBhhHH/qEJvW64RI5cSEj1wmV
	 0AQ0RCo2+kKWZClPDaHeUYbni3N/rKamUd03CMFrYEn0/orZGtWtYInkZtOnoHkerfo/Y
	 vltcd20KmpLsyft594v3RUhdc/HhOWylZAGKo+O9mNhQYKOjfs5WNjWZhbjBVUx+G6sUv
	 Zl2SVN/2emUNs5xezC8FOHADk691hKCDP3OcGmWXQJEZM3xi47ZHLIw7BeMO06XrvUgiF
	 n3RfOK7ECdRjTDyIIt75eg97XBi1cs2yZawqBVOybWRrrHaPMNo4t+ANOGjcm013+dA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793391179;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=+uEj7dkzggUb6lkggRktE0fOB+YC39Gh7yxfAZ3lKo4=;
	b=Fn6xA3URH/cZLA1Ck/tPgw/dJyG+x3h+Ijo23awRGhBKCv92Nvt7FN/eZGt9mOkq77wl
	 SEoGK8zl8rA2uDKTIzK1RVopBSKLTmlbKbKMHFLMO4VVYQYqf8b7+z8qrFht5zhgW+jjt
	 1ysM7edPhOKN1knTFNe7mUwpLVd6HidX9rZ0SKCMoinqyS6dTTslk5e38z53pss03oaC6
	 KnYzwdQmDb0ZM/dY8KP+zWUAojIMnug4MmZnfHSnaT1ronjHIoqq/XRzfiWAR5zqPHXV6
	 zYmq4PmqdMQ9xBgXst7B/TiR0UZ4ldN9OjnZ3W7Wb37+U/8i6aNcGBtQrsD1ZxvXtTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SbdZiQoN;
	arc=none smtp.remote-ip=74.125.229.9
Received: from mail-dy2-f9.google.com (mail-dy2-f9.google.com [74.125.229.9])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46511606A32D
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 20:12:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46511606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SbdZiQoN
Received: by mail-dy2-f9.google.com with SMTP id 5a478bee46e88-34cbc588a31so563852eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 13:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793391178; x=1793995978; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+uEj7dkzggUb6lkggRktE0fOB+YC39Gh7yxfAZ3lKo4=;
        b=SbdZiQoNd9v8nZxQuOMNPRPAe3YN2K/2lS+7X9Bn5BxLITOLrcB/hcYjzkI20WWS4y
         fQtDhN+STPp2Dp0/8jJwHW/ofizMr/sz7JyYnt0QKsCias2AT1scQyiu3EUysCy2pkMm
         5+8smIXAqprspCMZSCaCNLCvO9EIOEqYqVaFzDA4ea+YmKxbDNbpYljFke/oD5wDjtz7
         KVbwuTxXV9dDsWLdse7wjZIq7JVItQopjnOPpBeL6CnpdEAh51fr4V/62fxwkrOom3al
         rq9la/RooBlB1Fx85WhoLa0CIdH4Nn6lEELyrTkCoIaEivYuHKS1p/GFeD36Mx+YqvSp
         eTWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793391178; x=1793995978;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+uEj7dkzggUb6lkggRktE0fOB+YC39Gh7yxfAZ3lKo4=;
        b=jOMH8cV02f8cOBUoJD2mfUXITMpfOEJzNIhrkDGNzaT9tW8L//TPC7TXpdN2r82Cd+
         LlMwoSoZyvIQJPTtYaEJrAj8uILPNCEroZeHVjd4PFG7+HZjbGj6XGjBLrvPRAhcBYrY
         Zaqi/SaurPxKd9WeVXBp0p5Drrla8lQYZ5yls9qbJSrS1QJIF+E/hpNC/vRBuzh6eNO1
         c9R50PdZpzX0QbprjvdRWoASlRI7FA3BSWVIOWDh7ByCoLNkkNMyUjUOWdoYA5T6JdTH
         Rh/Fh/iWbopDYf6IepQh3gtLqROP/EjTQIcb5DBfxNonfSqgStuw9zI2b591ilnaVXFG
         AAMg==
X-Forwarded-Encrypted: i=1; AKwUvBycC0s//tfuy7m/o+ePi4VVYCVli+XLkD7CtaLGbn3leObOt7qKAf6aSIjl3ZBAHC8Sa3wB5KwciaEalyM=@vger.kernel.org
X-Gm-Message-State: AFq9FYL90cQvesOAnBzmeZO1rkxOm29Wsynfp/pcp49qdt7qPUKP5QPH
	CX4oFmvPV48ia7rmFpPlIXPUxqFU0fEwSphA+Rua3Bcko7wDsLMjLcNy
X-Gm-Gg: AYBFou2iJPR2fY3plbQGCDAF2NMelk49nMhq//CvPb/bAibr8Wnx2EN1KKqr3LIZ3lP
	FRuur8B4NkfQvI8qvMTL5n8iKhVmmhURTChKAsSqQmoCjETbgPj+/QUqU7qPnGpOXzdlvJKAn1k
	y9H5iOhlutq9hBNkqssN++LxtLuVHAL7d8kSEtHgnvY0FV99df5LTtRf2b69Qn+JPWVJ31ctCY1
	IdL+XXFZ2RtrTcbqDoNu3irsn4IJYR47QBOwm+WkK05ayURSH1wn/L7qOt6YpVrpzFW87rQ6Uoh
	ls+qY/yZyt1osVFcEfn4vqQ2BwODq/VSFwYdCPY0KZRGtevXrRwe1PK95zuFrKwC5kPuC2aEgTI
	1EAsc5c+IynNVhwIk6MYq9E9shNnmdQTbOz7LJm7ggf2BKUDs9L+CTNhFJ9IOXhj+i0LEoF5i5Y
	mGFCbqiU9MtaJrCvqN5kmzVDDtec/O3qo72m9Zg3fdSvuLiUJDp2AFjCFdodnb1lfekOLG74IND
	KYZZNDX45kw1rEMTuiq5RpCmkgSy2V2edR6nFpO4Mt7MHcpg+2J8YsZfbFz4PMW3C/DtPLMaeaQ
	y/tXVQXKCVmSSt3NL+bpqKw=
X-Received: by 2002:a05:7300:e9c5:10b0:367:3d68:8480 with SMTP id 5a478bee46e88-36a4206d82emr5086488eec.0.1793391178247;
        Fri, 30 Oct 2026 13:12:58 -0700 (PDT)
Received: from localhost ([2a03:2880:9ff:6a::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a429467cdsm9450626eec.19.2026.10.30.13.12.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 13:12:57 -0700 (PDT)
Date: Fri, 30 Oct 2026 13:12:53 -0700
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Rongzheng Wang <testwrzwrz@gmail.com>
Cc: netdev@vger.kernel.org, 
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>, Magnus Karlsson <magnus.karlsson@intel.com>, 
	Jason Xing <kerneljasonxing@gmail.com>, Stanislav Fomichev <sdf@fomichev.me>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, stable@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v4 2/2] selftests/bpf: cover AF_XDP multi-buffer TX
 software checksum
Message-ID: <auT51NbSPvKJwgiD@devvm16445.scu0.facebook.com>
References: <20261030023248.78802-1-testwrzwrz@gmail.com>
 <20261030023248.78802-3-testwrzwrz@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261030023248.78802-3-testwrzwrz@gmail.com>

On 10/30, Rongzheng Wang wrote:
> Extend test_xdp_metadata to send the same UDP packet using every descriptor
> count from 1 through MAX_TX_DESCS (MAX_SKB_FRAGS + 1), and to run the
> existing metadata and checksum verification for each case.
> 
> Build the packet once and write it into the TX descriptors in a loop
> instead of using a flat two-descriptor layout. Keep the first descriptor
> large enough to cover the checksum offset; the remaining payload is split
> across the continuation descriptors, with the last descriptor taking the
> remaining length.
> 
> Reuse the existing AF_XDP setup, packet generation, completion, and receive
> helpers in xdp_metadata.c instead of adding a separate test harness.
> 
> Signed-off-by: Rongzheng Wang <testwrzwrz@gmail.com>
> ---
>  .../selftests/bpf/prog_tests/xdp_metadata.c   | 147 +++++++++++-------
>  1 file changed, 92 insertions(+), 55 deletions(-)
> 
> diff --git a/tools/testing/selftests/bpf/prog_tests/xdp_metadata.c b/tools/testing/selftests/bpf/prog_tests/xdp_metadata.c
> index 5c31054ad4a4..17da0a145666 100644
> --- a/tools/testing/selftests/bpf/prog_tests/xdp_metadata.c
> +++ b/tools/testing/selftests/bpf/prog_tests/xdp_metadata.c
> @@ -18,12 +18,15 @@
>  #define TX_NAME "veTX"
>  #define RX_NAME "veRX"
>  
> -#define UDP_PAYLOAD_BYTES 4
> +#define UDP_PAYLOAD_BYTES 32
> +

[..]

> +#define MAX_SKB_FRAGS 17 /* minimum CONFIG_MAX_SKB_FRAGS */

Any reason you're not reading the real value from
/proc/sys/net/core/max_skb_frags ? 
