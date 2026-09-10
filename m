Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 171BB5678EB
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 19:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789068386; cv=none; b=SylhMz+qs4rjBuORmdaeByRQsy0VFh9JI/uI4NYHQaErm64doafSopjvssjR8B8Fg0GI7/2gbBAszCNk/IjUO8Mhm6kDTqx63/6QMaMDZHlneNMzo08Jcp2efL66sixI7xXCHizBjcfrogXPbQvVrwSYjLzIMOK2HCS4FYthQv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789068386; c=relaxed/simple;
	bh=PK8bn5aU171tfON89RThbs87i/BE1OYud3wLsDUh4hU=;
	h=Date:Message-ID:MIME-Version:Content-Type:From:To:Cc:Subject:
	 References:In-Reply-To; b=GF22h+ChUIAwtoJfu4UYg8XMVmXaKq5/0PMKmxNbd5/dFMKCNVipDmx49xLGSyZSdKytqjUmqD020Jwa78dwshIqpJJeXex1yitIJs3TE5If4LacMwRTvzG3qmhrKMYsLbp0M+TEp3LOUA7XXnGHRRhhxflvrh77qSrwqUbBaNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=TJzVSaBe; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="TJzVSaBe"
Received: by mail-qk2-f12.google.com with SMTP id af79cd13be357-93910cadeb4so5516785a.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 12:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1789068382; x=1789673182; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :content-type:mime-version:message-id:date:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4xukxtRxDbbfqZShrZASrA+GXX4dRNxrhliA3H85hXQ=;
        b=TJzVSaBe6JWN3LWgLyYOZUFto49U5CTuJraV4VIPAmuBR7ZJBmyKCIBU/+2bTVxEW4
         L56FQrsc2n++FdHOiZlMa+30UoluoJ0OCeD82XWQ8TnSRUcpS6ELlAFAWX3rYjhvxYxa
         I2N+mbEtMnPAp62CPX6EQDkK20snic25TSNJ64Sdyjf0tiOv+O9rDDGOhIPVsNhFqjof
         L/w7ohojbwyPI8eaVyj1W6zxrNkyHzPZ6GQ8yVjBCucZL9KINHUD4D25ygbh5MGbCV8j
         u4s29Csmji/0TXNgyFvp1JVremYVguwLbdOkyQa5b8ktuNfjBxUz806L0llSUr5ufvr9
         irJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789068382; x=1789673182;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :content-type:mime-version:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4xukxtRxDbbfqZShrZASrA+GXX4dRNxrhliA3H85hXQ=;
        b=tCA9TQ45x2O3innQ8NivtmBpfDaLDtcL3Li4Ef3uqocIernlFQMeiWOZovYQai4YC5
         HSdRtO5j2IZpTkT96q/I1k+hIxe8b7Dc7WPtYO6KoMZWkl4gEegbyZHgPHqeX3h922Y6
         y87DatKWimcf6rsHPOgHaoLE6sMmVPPYVGyC5iOjkmnEZIujaAa+A5aq+03oiLfOIH7Q
         6VD+tdKzvK77/L4FxVNAUTGEM8Dw5BrN2M31uR+hcFLOixyak33ni5bJ964FB8LUBSbt
         qm5gafiHaSGQw4yMZTcncRI+O+4TeWjeUIB4AEsRQ3mk/aHWImXXVrxxh5tMGFG4thUY
         q6/A==
X-Gm-Message-State: AFuF++mpEQvdZVgQK7U17WsneCm/3ZYs/Iy1aBVmAH82Oikas569gl8A
	Ius/XEou0VAY3yuh/mahicyKPMLIob0gS7R5LYTYGrWZ6itaM74FSPScTrXU52Issg==
X-Gm-Gg: AYBFou1pnlnu1XLWvXl+FgOlZB0JrT88vuJ4XVjYul3nHbgJC9cSicQby224M+MS7Cw
	E0mu+ZnnLcA6VaQ63uFbwCe+mNTS5r0MbLbf7Z8RvOeTTQ44O8aNp0eWGpp+XPfSVQ4hmPtD6cs
	0kV4i3Af9PJeRIHuS3PIbTfcNs3OXU8+7jovMMPIub7TOLW6iZyfmCi9VHBW1UYl60/Ldpm3b7K
	+pVMAPPx2kIF8KWGzq87KtgvEljNetE2KO2cfTcJfkluG+I1H/cxCEkMOSF4gy4O/7wsDXLfpJ0
	IkGJNHYcE3km3u5XUMgONeXSI+yYuOWfDgpgPHojmouWzhlzFxVtJaTQ4rFCUVLpksBbiF2Evld
	DbcIxTFvkxblB4fK9b7lzmYIB0VtAGsxml4LT81Fr+BSjV+9dDdDpW5CnWsflGqx7tB4HH/eaRa
	CbGGK2IAHgqEO+7K2iEtERvcSGEcLG+GffLIt+Q7du6koyPymZ0sQqMCefgnBSXaci81o123Mi6
	Q5RYqpE0ZdSaiwxngaesn+M4Pw8QTTOBkqhIavaiZIjXf7TZJkGCs1Qnj4ngmU0mhB0SyaSSiDr
X-Received: by 2002:a05:620a:28d4:b0:936:8840:427f with SMTP id af79cd13be357-939ea037c44mr52546485a.4.1789068381925;
        Thu, 10 Sep 2026 12:26:21 -0700 (PDT)
Received: from localhost (pool-71-126-255-178.bstnma.fios.verizon.net. [71.126.255.178])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939e8045b46sm56168385a.18.2026.09.10.12.26.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 12:26:21 -0700 (PDT)
Date: Thu, 10 Sep 2026 15:26:20 -0400
Message-ID: <f444c557e77c22eb578216a5e6eb5b98@paul-moore.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 
Content-Type: text/plain; charset=UTF-8 
Content-Transfer-Encoding: 8bit 
X-Mailer: pstg-pwork:20260909_1743/pstg-lib:20260909_1550/pstg-pwork:20260909_1743
From: Paul Moore <paul@paul-moore.com>
To: Bradley Morgan <include@grrlz.net>, linux-security-module@vger.kernel.org, bpf@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Bradley Morgan <include@grrlz.net>, stable@vger.kernel.org, James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 2/2] lsm: fix size queries for getselfattr with NULL buffer
References: <20260619130305.27779-2-include@grrlz.net>
In-Reply-To: <20260619130305.27779-2-include@grrlz.net>

On Jun 19, 2026 Bradley Morgan <include@grrlz.net> wrote:
> 
> The lsm_get_self_attr() syscall allows callers to pass in a NULL context
> buffer to find out the size of the output needed. That path still
> compared the computed entry size against the caller provided size first,
> so a NULL buffer with size 0 incorrectly returned -E2BIG rather than
> reporting the required size.
> 
> Only enforce the available buffer length after checking for the NULL
> buffer. Cover the zero length sizing query in the self test.
> 
> Fixes: d7cf3412a9f6 ("lsm: consolidate buffer size handling into lsm_fill_user_ctx()")
> Cc: stable@vger.kernel.org
> Signed-off-by: Bradley Morgan <include@grrlz.net>
> ---
>  security/security.c                                  | 8 ++++----
>  tools/testing/selftests/lsm/lsm_get_self_attr_test.c | 5 ++---
>  2 files changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/security/security.c b/security/security.c
> index 71aea8fdf014..fa0d7e036249 100644
> --- a/security/security.c
> +++ b/security/security.c
> @@ -406,15 +406,15 @@ int lsm_fill_user_ctx(struct lsm_ctx __user *uctx, u32 *uctx_len,
>  	int rc = 0;
>  
>  	nctx_len = ALIGN(struct_size(nctx, ctx, val_len), sizeof(void *));
> +	/* no buffer - return success/0 and set @uctx_len to the req size */
> +	if (!uctx)
> +		goto out;
> +
>  	if (nctx_len > *uctx_len) {
>  		rc = -E2BIG;
>  		goto out;
>  	}
>  
> -	/* no buffer - return success/0 and set @uctx_len to the req size */
> -	if (!uctx)
> -		goto out;
> -
>  	nctx = kzalloc(nctx_len, GFP_KERNEL);
>  	if (nctx == NULL) {
>  		rc = -ENOMEM;

I'm not sure the existing code is necessarily wrong.  The existing code
allows for an E2BIG length check against the current necessary size, so
one can still do a length check regardless of if a buffer is passed.
Even in the NULL/E2BIG case, the necessary buffer size should still be
returned to the caller so that the process can size their allocation
appropriately.

Or am I missing something else?

--
paul-moore.com
