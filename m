Received: from mail-pj2-f40.google.com (mail-pj2-f40.google.com [74.125.227.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8AA4333730
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 00:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790641236; cv=none; b=lZPdL6VoxuWxlj+Rz4DzN8GIoZmKHarI9ygo0vqS+OXcHA0VtLDorGq6ayRlNQ4pp7o9HylCiAvlNnKDgYksCOsqP5KCXYuQICxhYccZr7vKXFyKDYpoRVSFnQuuX1D2E5yeXW0N8pDWok7xvIYmEeuEwVdmQqoyqS2OQVBlLWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790641236; c=relaxed/simple;
	bh=njaNJUNDzcQJqP8cXWyLujjI7GkWmjvNDB2uLaRHOsE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jGgEplp1gFtK9mFDVM4mV3ig2z66en1zVL6Ryw78O3ujbT6WfrUe3U0k+9PI0+5NBV7cj4JWhu2AN1Wu7NOW1SkyC7HMK0fJ06VOaBZqYfKw5wblQHFaQOow575aztB+EPslCX9l0uhT/E24J2eXsJUYI0mqYpn4uSYGPqKSCoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b=K4eGEfXO; arc=none smtp.client-ip=74.125.227.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b="K4eGEfXO"
Received: by mail-pj2-f40.google.com with SMTP id 98e67ed59e1d1-3a0d2c37b0bso1206857a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 17:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1790641234; x=1791246034; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ve4zzzXKEVOYiC04gBko3TUlMyxYcTGnHNIKti8S/Sw=;
        b=K4eGEfXOJpLFkcWW+q8ONLgjpJ2xzW6i8RuUMxdPL6WT+ddoDUD8iLPhlkOWuLC8G6
         3OlbS2NyVzURFf1vQF0+VywN7I+U/dNOKqjdOqTTRb9v5ZXvWFTK/nxqiibb+lzARh8u
         uTcDd7KxcCNMmN1gu0G+KfV5FLw1lOGwviQ+EKqh74dYIR+lYElupjBWoaNLEIIAoeUV
         J1S8islCzze8LZZzLYhNj3M8Lf4CTU7Lwh7zxmopaQddJpEiKP1jmjTL1tPOwezPVUK+
         ChsBX0PcUsy1Eb5TQ7l8AdxzFJ2yDjkO9aRNNIIRu36vi56atlSHdzu8uREdOabMtcJ1
         uTSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790641234; x=1791246034;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Ve4zzzXKEVOYiC04gBko3TUlMyxYcTGnHNIKti8S/Sw=;
        b=zw118Q9c5Pl+ciV7PlQQXidJhgjGuM2Zelt2XAZxvLv646V+M3Gu53P8MwA6h12pYI
         Cv0hS1KjjCqczH6WcOyidwcGcPwK7NUMkSSASLPNRof0yY5prmSrFmsnQm8rEv0YYZoz
         3HQBOU03CFMff3HZDXOY26sg5S6IdGrO/UPfRicE97TNGv+k2z+DQ3UTrPsrO0O9+qen
         9eu9nPG78PsFruYLmAhw0nZ8jFyKWdxAkogtF+ObO9PwsVRzOsNwOx+oEBwhz5HKpx4w
         jqCTyZ3liBPZkSQUsbf6/uLlcvaiVah3VC0TWHz0POtp2X/oyulpjEQVD2wpFle2rgG7
         OfTQ==
X-Forwarded-Encrypted: i=1; AKwUvBx3aDWU0P5iKm6cnoPtH39NpNsrrLN12n1SH8DKbgucmfpw6fegWFJscY4iJiK9e8FRMiHDl/FLfVcM1l0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLToNxkY4IRyxL5BOfytlw7fSWTyiLmYLNDkxi1RCBrFbkOgika
	jC3l1ikmlV3Vmpg4k2rIHCDN09FyYAWUUUk+6H+78qhPSl9o6BYSIejhzrY3NVksESM=
X-Gm-Gg: AYBFou0NFZo60pW8AoLMOvA9oaj0k99MH6A8oIiYlLvR+cy8/iDLoqy3eBYyVp2Y0Aw
	Yks1RYAG2L0YZo7ZpyakXsWp23gTx1FYHz8iwuCcBK7jzr0DTOmsKyDJT4MK2giWoCnswfEW/G4
	JIr952Gchnd//3AT1fyY1/xb9Lyn51Y4Uc6kd43HezQIXnBR4+yD8c73NX0WiHVyWzTbSvLuPnU
	ncMGd7PDUlKSrmBRAs6NJG/Vo9bcmt4gB9XrNUVDsYD5rPDKM0eR7Z2LPYMjYEHGFxzQj7ckzVV
	mlrLQIiv40BoJ93Om1wbhDeXY59VtqXjg+cgJ5EN0TpKoNK1r0IQa/7br0ReBAoVQ3RcQHfnwJX
	26nWYVMWawMSwfjRB3I0NHnfZDi8Tn69Gc8uTb59BUyBJjBuk38+hiWtrT1Q81baDQdY5YpvhMi
	SLvl2cCgdE242sH9KWkK7wJW/oW8AShF+UyIaSf40jHV0AeDbCeg7btzcR3t52AFUf6kGPnxOSg
	egIReqjVUwtrg==
X-Received: by 2002:a17:90b:1e42:b0:3a4:948d:9dc3 with SMTP id 98e67ed59e1d1-3a4948da310mr1345895a91.21.1790641234231;
        Mon, 28 Sep 2026 17:20:34 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:57::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a49858555csm1915743a91.5.2026.09.28.17.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 17:20:32 -0700 (PDT)
Date: Mon, 28 Sep 2026 17:20:31 -0700
From: Joe Damato <joe@dama.to>
To: netdev@vger.kernel.org, Michael Chan <michael.chan@broadcom.com>,
	Pavan Chebbi <pavan.chebbi@broadcom.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Prashant Sreedharan <prashant@broadcom.com>
Cc: edumazet@google.com, horms@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC net v4 4/4] bnxt_en: refuse to open a device with stopped
 DMA
Message-ID: <arsETwwN4YfcfcTz@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>, netdev@vger.kernel.org,
	Michael Chan <michael.chan@broadcom.com>,
	Pavan Chebbi <pavan.chebbi@broadcom.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Prashant Sreedharan <prashant@broadcom.com>, edumazet@google.com,
	horms@kernel.org, linux-kernel@vger.kernel.org
References: <20260925174404.2789072-1-joe@dama.to>
 <20260925174404.2789072-5-joe@dama.to>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260925174404.2789072-5-joe@dama.to>

On Fri, Sep 25, 2026 at 10:44:01AM -0700, Joe Damato wrote:
> Add BNXT_STATE_DMA_STOPPED and set it in bnxt_stop_dma() to signal that
> the device had DMA disabled. When opening the device later, check this
> bit and exit with an error.
> 
> This is a very rare case, but when it happens the device needs manual
> intervention by the user to become usable again.
> 
> Fixes: 74608fc98d28 ("bnxt_en: Ring free response from close path should use completion ring")
> Signed-off-by: Joe Damato <joe@dama.to>
> ---
>  drivers/net/ethernet/broadcom/bnxt/bnxt.c | 26 ++++++++++++++++++++---
>  drivers/net/ethernet/broadcom/bnxt/bnxt.h |  1 +
>  2 files changed, 24 insertions(+), 3 deletions(-)
 
[...]

> diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.h b/drivers/net/ethernet/broadcom/bnxt/bnxt.h
> index c673b2ce4a0d..061f57824c7a 100644
> --- a/drivers/net/ethernet/broadcom/bnxt/bnxt.h
> +++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.h
> @@ -2470,6 +2470,7 @@ struct bnxt {
>  #define BNXT_STATE_DRV_REGISTERED	7
>  #define BNXT_STATE_PCI_CHANNEL_IO_FROZEN	8
>  #define BNXT_STATE_NAPI_DISABLED	9
> +#define BNXT_STATE_DMA_STOPPED		10
>  #define BNXT_STATE_FW_ACTIVATE		11

FWIW: while applying this series to an older kernel to test it on some prod
hardware, I noted that this bit was previously taken.

If this is re-submit as a real series and not an RFC, I suppose I'll tweak
this to take a different bit to make backporting easier.
