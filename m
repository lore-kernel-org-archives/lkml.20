Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17DD23AA1A9
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 01:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789780246; cv=none; b=uJAh961dt3T6mMfU6q9bBnlngE+NCiLL+YbcNNdYzy3pJENFZgSSOwkePPgGHh5+nSuvQtKGDFu3OybESTK8I1Reaq6v3nC6O/uHQ+yauvCzr419gMipEcfsjuCPqWTv/GjgNHHBm38ewwDY/VGbrmMAATTl6fHCaFuKDXGpv+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789780246; c=relaxed/simple;
	bh=PD17Y3XeERkph6rr6sHZAKy4DsdPrdxQEx/QDmuRqzo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TLoSed2GwcHMGYq4lI26Hyf6qtX7DmYIAPKjKBxelpH1IaqAL+XVsT3HebUYwj2feRGzAgxaJCLfFtz8ZVNelkpZu1IZPGGhS8FcOFz9bpxFTyzDV1gj2qj8exiWxDLhXdEF2mJPpc08MGJ6KVOzcGBXYWp/QTqgkCAuw5URoEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b=ZepgU0e/; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b="ZepgU0e/"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2dd88a115ebso11513455ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 18:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1789780241; x=1790385041; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=a49yaJ/GGjwIg6ibC7aTwVaBRLcdBDhKbI1sakT8d8k=;
        b=ZepgU0e/N1D6q0ctVm6zTa7r3afmQs8d3DOKLGauufQCKMaRNxOwS47dKxRCHL4ExQ
         JWAZJAzsca+tVJWUIzv3Rtdxq6osoiHWf5OQJzsbtP4akf+RLEXaXblEaVDkvCFJBODF
         c4u6nvTmRHajn5SjNfiJbJWBfXyXHKaDNHlU4vMtMBq0Q1efUOIaGTxGsYbIilsQR9YY
         0Ji/x/W4fwOBadlAgMRSuVceYYYvGk9QdqljvRDDtTxTRQYkSoKtrwaM4q1AebkqaMVO
         4DUS0K1nG0rEVJgE/AATkQnmxzG1fOn+W7t8LQ/EzE95h3BfmOq3KZ+bErQWSVHVU+CK
         FgUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789780241; x=1790385041;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=a49yaJ/GGjwIg6ibC7aTwVaBRLcdBDhKbI1sakT8d8k=;
        b=n7piD/sUzI7HmqdXo1C4vcgfgdUJ5ViACNL02PKC6do6MqsJJacWznkCD0XS+thk6t
         2shqqE/ujeoAU0OsHHyDrxkyC9nOiWiEBqtXhk4aIH+XtnCGWqbeJV0+l+VKXN059azc
         I7ZId9+hU/NpLLlG3EcezqdMrj5boJBLakKGQcc83wlA0TY73iNIWGMvydPtHwu2NmDP
         VTXcjeadtp0fCbtVpR3kyM1FkclEGNYRsMFvLDou+YybGxaZAlGhnQkXlV7ADMCnz4ko
         VYgDIhYdaY7ToeYwo7rZ6k6pLvvRvcx/AAwyCoWxzL0ar5NlQpcLwk/UzV1cvoJkPKYf
         /k4g==
X-Forwarded-Encrypted: i=1; AKwUvBwXplbykl1Rol5ZRKv6AKHgTGsSvptrjGRSskoxMpcIycpjmZRA3+DeZz4jPsF9/N7zM9Mk+z4FUIhcejY=@vger.kernel.org
X-Gm-Message-State: AFuF++m0EDzk6343QYibq7a44xzJmubMmlgs8w5pDUSWlIzkmlfETmvK
	UNe/4nJpmhvSdV7xTVg3wAGG5gROJou7Llc6yPf8E6NOmRpO+Q55LLKHjF5p7w2n/90=
X-Gm-Gg: AYBFou27VIx77FHZqSk2YWj9vl71ew6A4U0MSDGIc99zFR08WRUo9gWDScTv1j3X1YT
	MznlN4sZEJ3g7Ih4OOAMUWtDtnPzKcs4HFxNFnA1sHOME4ayYq3M2pKzFCZZrddDCrTq3hguXqw
	QQyDeuW5HFUEfrD3PxLYdbicnyJ3AKlWPzDywKvZjYgYw8Gyz48CItIyGDdtgUuj3CfRNwbdKRI
	ViMcGlOLkFgi4Yp+eeTY1j3+0XmQv3ZxcXV35YznIG6lc6zQsz/hVPETezpDQaBVlicqkkfQAsX
	BzhEY4P+AkNQBR8p/Hz2eKMMXaK0v2U/nC1a+xVMGUVyDxMChi2uchMq0rhVeyXO0G4PckWl5h6
	c2L3hITHcsgub7mmKf/Xk1FkhRtDxM3mw6oBqdWAP6riFSuIX74LsndQMq/fZNCNlkxSNfNBqLs
	nFRVBK2WfmgTBc2Tghx8KlLQOrLNy5v3AWPEEMUpUpEzHYMKOmi+CO
X-Received: by 2002:a17:90b:57d0:b0:39e:6c69:f470 with SMTP id 98e67ed59e1d1-39e6c69f4d2mr1917003a91.47.1789780240973;
        Fri, 18 Sep 2026 18:10:40 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:40::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6c6dd585sm1680612a91.0.2026.09.18.18.10.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 18:10:40 -0700 (PDT)
Date: Fri, 18 Sep 2026 18:10:39 -0700
From: Joe Damato <joe@dama.to>
To: Koichiro Den <den@valinux.co.jp>
Cc: Jon Mason <jdmason@kudzu.us>, Dave Jiang <dave.jiang@intel.com>,
	Allen Hubbe <allenbh@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	ntb@lists.linux.dev, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v4 03/10] NTB: ntb_transport: Order RX entry
 completion
Message-ID: <aq3hD4D+VfMUd7vq@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>,
	Koichiro Den <den@valinux.co.jp>, Jon Mason <jdmason@kudzu.us>,
	Dave Jiang <dave.jiang@intel.com>, Allen Hubbe <allenbh@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	ntb@lists.linux.dev, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
References: <20260914084838.2158249-1-den@valinux.co.jp>
 <20260914084838.2158249-4-den@valinux.co.jp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914084838.2158249-4-den@valinux.co.jp>

On Mon, Sep 14, 2026 at 05:48:31PM +0900, Koichiro Den wrote:
> RX entries are added to rx_post_q before their fields are filled in.
> The overflow path sets DONE without a write barrier, and
> ntb_complete_rxc() has no read barrier after checking DONE. A concurrent
> completion can therefore consume stale entry fields.
> 
> Publish DONE with release ordering and check it with acquire ordering in
> ntb_complete_rxc(). Use the same publication rule in the copy callback.
> 
> Fixes: da2e5ae56164 ("NTB: Fix ntb_transport out-of-order RX update")
> Cc: stable@vger.kernel.org
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Link: https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260904052134.2970111-1-den%40valinux.co.jp?part=3
> Signed-off-by: Koichiro Den <den@valinux.co.jp>
> ---
> Changes in v4:
>   - New patch (Sashiko)
> 
>  drivers/ntb/ntb_transport.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/ntb/ntb_transport.c b/drivers/ntb/ntb_transport.c
> index 3f497a62673f..b69e8ac8047d 100644
> --- a/drivers/ntb/ntb_transport.c
> +++ b/drivers/ntb/ntb_transport.c

[...]

> -	entry->flags |= DESC_DONE_FLAG;
> +	/* Pair with the acquire load in ntb_complete_rxc(). */
> +	smp_store_release(&entry->flags, entry->flags | DESC_DONE_FLAG);
                                          ^^^^^^^^^^^


>  
>  	ntb_complete_rxc(entry->qp);
>  }
> @@ -1664,7 +1666,8 @@ static int ntb_process_rxc(struct ntb_transport_qp *qp)
>  		qp->rx_err_oflow++;
>  
>  		entry->len = -EIO;
> -		entry->flags |= DESC_DONE_FLAG;
> +		/* Pair with the acquire load in ntb_complete_rxc(). */
> +		smp_store_release(&entry->flags, entry->flags | DESC_DONE_FLAG);
                                                 ^^^^^^^^^^^^

are these two smp_store_release lines right? i am asking because it looks like
they do a load ? i honestly have no idea if there is a race here but it looks
sus to me
