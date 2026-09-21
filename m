Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5075A227EA4
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 13:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789996091; cv=none; b=o8vuDHwdFXAGe/XEyuH1UoiAFhf3a7Z2rrlAlBGF2GXCNvF/4Ae9+FJD7oXXUZRZ4SnsbnzLI1X4sVLTSfOlDWyofcer3p1BI/+ZGGpo29V/WZeKkVTtatXwMvxQsRZUiVu0dREkPD+JaBtqbdRMshi5Zakx/O9yDdLIFZRLXk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789996091; c=relaxed/simple;
	bh=uCGjtxHU2SvrGBQXerzZKN+YHphi6c6SWOdJasY+eH4=;
	h=MIME-Version:Date:From:To:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=H5PSca4Aw2KzdjrBGA5WYMmRvb169WWFbzZ3Q0AQ/plOuglGPyOKCQnOOPf88YGFdnbPZXwgUQ4IzTRkGIRfXjWRMNj+VcRKKXdgF3z3MeW3dh3k1uet/KZCtnX9D3i4u8xahwrzrj+E30qt0Iymd9jt2g2gxj3hpVXk2U2F/+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N1RWmkJf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N1RWmkJf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37F8D1F00898;
	Mon, 21 Sep 2026 13:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789996090;
	bh=overbqbhNoiQAgfPHfOzyW8f02biwyF9eOUPuiVG0uY=;
	h=Date:From:To:In-Reply-To:References:Subject;
	b=N1RWmkJf0dxyMe56BKLFAOvpI3r9DJaMa0yAMLW+0fDviDlSyZeHeii/bq5y9Rl3S
	 6LpG9DhLLRRkp2OHU8RnH+QBfIdcqqGozUy/5JRRW71BvDdoD/HMiDkfytqNvCpevs
	 mFKVt+q3SWSibTJw+b1Z6YXO/IGlIyxViS/xQMIqkOs3nSx8EsmRES9vBYFvHk/yGT
	 rDjpecC6e+V8j95+A+G5qFPgOnYo3KHeVEC+OI0qjXDosvqfEAWIHVKdbI4FrOaXgd
	 NcxLBb8qdBpww7SIuV3huvI5xZEknPXqZH4b45joUljFsJJ/Jyegkch/bk8CYnR07A
	 pljBgHiS7+h/Q==
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id 92695198003A;
	Mon, 21 Sep 2026 09:08:07 -0400 (EDT)
Received: from ams-imap-11 ([10.64.2.31])
  by ams-compute-02.internal (MEProxy); Mon, 21 Sep 2026 09:08:07 -0400
X-ME-Sender: <xms:NSyxalmbnDw7JkPkofamlHu5Z2W7XOvJgRsBar5sq63nMkrQX_J65g>
    <xme:NSyxarru2sHknqhP3U3zMmUjbByWmHqWZTDS4hFAlOjsSkU5Bzf_Ho26TOpl1TrpZ
    nyNH52E7AEWEHg9atD9E93ZUM2Pg4Pp3GcYqK7vzl3OdnO_5e9PXaur>
X-ME-Proxy-Cause: dmFkZTGIIV5IkDnVsd4r8uh+ipFWlm6Kanjs4Ie9hyftYo7IR9wzl9ZK3eGjYhnXcWc9yN
    4oTo1qQxuU2jTHlu9PUNyfYnvSx9csuIjVB6Dfxf2d6ZubbjXUMJ4jcxXbXPecDlmuXGQc
    H12nND9ST2CY3Daqk0MTE8fviqrCmd4nkrC9Co+U4uBSGa6LN++r52Z8GE/tMcQ2XvklEr
    QcP82gceBdiGWcuJJeXsDa8LSUZMky7nOGPTKk4Bdb/nOHyBjdob+U3fMcYFRpKPiBUIF5
    FQXtJY+6v5c4psgsBfMan+aMMVWaTwXXJwoVuVhH12oulaBbWzA3F/D2LUxcjt809MTxN0
    23RkaL731L4CGYG3DGlQ/6MDwYS5BkwDUNGdIhHYEZwWuswn7igqFwSG6tz5c5FtUtpmNw
    e+MqKtrEryDyyNYRy5Yp815r5R+E1K4U3EZ2QCtLA9MesSmOrMcEEep/iyQ+9QMPmd3dVw
    Q7R77pO8MgQHCcQLIufp9g4g9Zq4qSPvcGrriYz595puRlfpQGslyT/kp5SIMpNGNd3RW3
    oW1tpBjxrFTc0mjtSOMLQxr3567Eh2bWQFCQgezZz/cTKm8yuvWhzrVZcC3Ryk54eNcEmQ
    IFQiNuzqnBrH8Z1ZnWxNOiZ5Hn+NYyifsLnaCZ9Kp+wVbpvXRXVztQWdH8CQ
X-ME-Proxy: <xmx:Nyyxar_Qr_eU_hatxIZqs4qCr9SI1x9-xSwnwG08aUxcZkMhBFuDhw>
    <xmx:NyyxaobpKgyU3ZYJ770FwwYUeoCMStkgMA_9CKt2cDliLIBTDg4_ag>
    <xmx:NyyxanOmUH8zKj0Hjs8IbbRQd4UKa3jhR3U6z7nAsfVyh4JMER4TIQ>
    <xmx:NyyxasCQMynWGSMNHGoe6ybMdktnhs_UfqWyXGnz4bW_3mRVlzUyuQ>
    <xmx:NyyxamJ920Nzw2NJ56Aby8E0LjCcPev9E2wqcCtAia_uvfHIidd-Qba8>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id B5ADAF80080; Mon, 21 Sep 2026 09:08:05 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 21 Sep 2026 15:07:45 +0200
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Jiale Yao" <yaojiale02@163.com>,
 "Herbert Xu" <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>, "Mike Snitzer" <snitzer@redhat.com>,
 linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org
Message-Id: <da953eb7-4282-4bcf-8223-39f115499253@app.fastmail.com>
In-Reply-To: <20260921090458.3364976-1-yaojiale02@163.com>
References: <20260921090458.3364976-1-yaojiale02@163.com>
Subject: Re: [PATCH] crypto: essiv: avoid request access after subrequest
Content-Type: text/plain
Content-Transfer-Encoding: 7bit



On Mon, 21 Sep 2026, at 11:04, Jiale Yao wrote:
> essiv_aead_crypt() reads rctx->assoc after submitting the child AEAD
> request. An asynchronous completion can run essiv_aead_done(), free the
> association buffer, and complete the outer request before the submission
> call returns. The later request-context access can therefore use freed
> memory and trigger a second free.
>
> Snapshot the association buffer pointer before submitting the child
> request and use the local value for synchronous cleanup.
>
> Fixes: be1eb7f78aa8 ("crypto: essiv - create wrapper template for ESSIV 
> generation")
>
> Signed-off-by: Jiale Yao <yaojiale02@163.com>
> ---
>  crypto/essiv.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/crypto/essiv.c b/crypto/essiv.c
> index a47a3eab6935..5aea4584d5cb 100644
> --- a/crypto/essiv.c
> +++ b/crypto/essiv.c
> @@ -189,6 +189,7 @@ static int essiv_aead_crypt(struct aead_request 
> *req, bool enc)
>  	int ivsize = crypto_aead_ivsize(tfm);
>  	int ssize = req->assoclen - ivsize;
>  	struct scatterlist *src = req->src;
> +	void *assoc;
>  	int err;
> 
>  	if (ssize < 0)
> @@ -247,11 +248,12 @@ static int essiv_aead_crypt(struct aead_request 
> *req, bool enc)
>  				  essiv_aead_done, req);
>  	aead_request_set_crypt(subreq, src, req->dst, req->cryptlen, req->iv);
> 
> +	assoc = rctx->assoc;
>  	err = enc ? crypto_aead_encrypt(subreq) :
>  		    crypto_aead_decrypt(subreq);
> 
> -	if (rctx->assoc && err != -EINPROGRESS && err != -EBUSY)
> -		kfree(rctx->assoc);
> +	if (assoc && err != -EINPROGRESS && err != -EBUSY)
> +		kfree(assoc);
>  	return err;
>  }
> 

The problem here seems to be that rctx is dereferenced before the comparison
of err. Just drop it completely from the if: kfree() ignores NULL pointers
anyway.

