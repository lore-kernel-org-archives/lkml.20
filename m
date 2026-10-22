Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792706723;
	b=y9b0dwpIFDEUt8bbXSV548fygfiiMFnjbZYgLuFkpuPoyi36AncMwAoBuWp0FH0hmHSs
	 wibD/F7ncYgLu2cRZAXxIs3aUO4UxUlT4WICKF3OGWwJRtuxcxs9wmiQ26pcJLMA0sWba
	 oyGhjLM9os7b1bG5MX1xQs6jBi48yTzi6tBpZCx1W4DNpamL7lu2qtjcGMyo9BHksG7ko
	 smNC1co5XQr55nmN+vNbjg0KsFCyZhadeszQ/CFC5qQ5w3MmmL1NpGWhdY4hZIhl9xZio
	 w0O9kp5XUyHq3tyEVyyiMop2rNlVr4w5QD7aDd31HAgDVx5srDtygrrdTmsLvqE5u2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792706723;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=1/BUQdhYtXycx0vnNfE9NP3iNYT1zXH+kKAKzMrdrV0=;
	b=uSvVcgcdpTNv5Tl86ZfJH/8XlEItLkIItjClvr4QeL9KDwFAIxkS35Z/VH1Al1OmU5Ti
	 Do+7bA6fRk1yTq79jCs+B1Wyp12ODDdD7nIFeU6mIf7Gf7SLOJmZi3qBSAG9nrUt1+xp+
	 pFZBBOKwr8G6/hRVTuNumtpjl7dhW0wC/uTIpyIb0EnsyK6Tl/tLUsll4DC5EV3LnNOe9
	 167LdEzko10BgA8W1254feGLKAnkXUEoX4f0EO54C0KfRp0hhqomNEgbj/46+lnaRdBlk
	 GfxKhxEcBhsW66nArnzdp8T8+Tjwc23mqC+e0Gkd4hiraeHSzNits2tM7rrCdiqYUNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--suseendranb.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=CuXs0wbv;
	arc=none smtp.remote-ip=209.85.215.198
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57888606A322
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 22:05:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57888606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--suseendranb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=CuXs0wbv
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cd63a7cdfb3so166844a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 15:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792706723; x=1793311523; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1/BUQdhYtXycx0vnNfE9NP3iNYT1zXH+kKAKzMrdrV0=;
        b=CuXs0wbvrutvyKXXoh7DNB5Dw0dO9AcxLvyh3/AGBwEefUPCuveDo2yjZOrZwuGsub
         e/3CXuTsw14Wi9o+HOrgqP4AuX96/dJD8PE14mimU0n76rAFITT9B42jqFik1gc9NlKZ
         HnTXaRIRVxHQpbiWZ+ZDXn/kMBE3D+oIizavCEQPH7JeL71gScjDEswYGQ8dOAge8omo
         pqX9LgpNVMaP5rLPuESIcAkcE84m87wclCRDxpPwfi+gH5oWbGp+Gih9n2J0/L4Tc6JV
         jC1FCtslRQ0u2M7eXbSDoCj9T/xysZtvY+SYQ4oPNcDszc/uYinpnWkfJzMLBX83YvGd
         91cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792706723; x=1793311523;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1/BUQdhYtXycx0vnNfE9NP3iNYT1zXH+kKAKzMrdrV0=;
        b=df+ldygFUYT95KXk8xQuJyvT+5pwUNtK8A4XaT+pw6KKVdBW0rWZSzYVdxFN5dw5z9
         X90bQ+c1COQw0NdHNvUrpG1loFfTSZ/MLfsRYo4xwAta26JMo9+fTbNjCInnT2Sy/8d5
         OQHCodBOkV/zzhhsEGRRs/CkPMWETn0J6Cae0OqiftzxHR+WoHUDf1K9+EeLdVpeWZ0l
         h7pDa7JHJZ6nqchmgQBSb05f2ilRGqL21PCExTNnQdZGg19+jeseRhf3GVG47z3Patf3
         uVAi3oxBvVi4QHRHOIWrLU70IzCXhwkEwux6HoL9ku14A1FdMw5t2jmYBlLxs5Cs57qJ
         fgIQ==
X-Forwarded-Encrypted: i=1; AKwUvBxQbd7oBO3IF133+Ja1G7BdRAREz8EcNfd1h1qPQPfaS52bWfoQxfwQ8b+x2sCdbqlyIvVp1BWKdP9hAas=@vger.kernel.org
X-Gm-Message-State: AFq9FYL4JqPb7nSgYe/1S6jIJpR92L70rX14BN5Ius3daQnZWXjgKqkw
	e4TZ9Jza2gHocccmgYBBYEvZv/06RdKWwDQnv+q/R1Icn6b/+6Qkf95M3nwmO88OXZdrZuoHtoD
	ZgUI8cGjYDEzvNq/MsT7ZMbl2+A==
X-Received: from pfblr27.prod.google.com ([2002:a05:6a00:739b:b0:88d:74fb:fa56])
 (user=suseendranb job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:748b:b0:3e2:7030:9080 with SMTP id adf61e73a8af0-3e36945eec6mr190250637.47.1792706722405;
 Thu, 22 Oct 2026 15:05:22 -0700 (PDT)
Date: Thu, 22 Oct 2026 22:05:16 +0000
In-Reply-To: <CAO9r8zN6hN4h5m9pg4xQpirJj3o2nhGx5dxAuSddZ8+UenYnMg@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261021205626.3286270-1-suseendranb@google.com>
 <20261021205626.3286270-3-suseendranb@google.com> <CAO9r8zNtuN=_BTV53oHqaTqE0Bo2qiDSrgTBzEZo5oyOnWyeYA@mail.gmail.com>
 <20261022155144.4177200-1-suseendranb@google.com> <CAO9r8zP+GUE-hcGWSGzhLNLcchFoZ38EMVCAtX5yZ78tZ0bbgA@mail.gmail.com>
 <20261022183319.163484-1-suseendranb@google.com> <CAO9r8zN6hN4h5m9pg4xQpirJj3o2nhGx5dxAuSddZ8+UenYnMg@mail.gmail.com>
X-Mailer: git-send-email 2.56.0.257.gf7497c7d27-goog
Message-ID: <20261022220516.383697-1-suseendranb@google.com>
Subject: Re: [PATCH 2/2] mm/zswap: classify compression dst overflow as poor compression
From: Suseendran Bhaskaran <suseendranb@google.com>
To: Yosry Ahmed <yosry@kernel.org>
Cc: Suseendran Bhaskaran <suseendranb@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>, 
	Johannes Weiner <hannes@cmpxchg.org>, Nhat Pham <nphamcs@gmail.com>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Nick Terrell <terrelln@fb.com>, 
	David Sterba <dsterba@suse.com>, SJ Park <sj@kernel.org>, Chris Li <chrisl@kernel.org>, 
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>, 
	Suman Kumar Chakraborty <suman.kumar.chakraborty@intel.com>, linux-crypto@vger.kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 22, 2026 at 12:15:51PM -0700, Yosry Ahmed wrote:
> On Thu, Oct 22, 2026 at 11:33 AM Suseendran Bhaskaran
> <suseendranb@google.com> wrote:
[...]
> > Since dlen is only valid when !comp_ret, we could normalize comp_ret
> > first when !comp_ret and then just check 'if (comp_ret)':
> >
> > diff --git a/mm/zswap.c b/mm/zswap.c
> > --- a/mm/zswap.c
> > +++ b/mm/zswap.c
> > @@ -874,19 +874,24 @@ static bool zswap_compress(struct page *page, struct zswap_entry *entry,
> >          */
> >         comp_ret = crypto_wait_req(crypto_acomp_compress(acomp_ctx->req), &acomp_ctx->wait);
> >         dlen = acomp_ctx->req->dlen;
> > +       if (!comp_ret) {
> > +               if (dlen == PAGE_SIZE)
> > +                       comp_ret = -ENOSPC;
> > +               else if (WARN_ON_ONCE(!dlen || dlen > PAGE_SIZE))
> > +                       comp_ret = -EINVAL;
> > +       }
> >
> >         /*
> >          * If a page cannot be compressed into a size smaller than PAGE_SIZE,
> >          * save the content as is without a compression, to keep the LRU order
> >          * of writebacks.  If writeback is disabled, reject the page since it
> >          * only adds metadata overhead.  swap_writeout() will put the page back
> >          * to the active LRU list in the case.
> >          */
> > -       if (comp_ret || !dlen || dlen >= PAGE_SIZE) {
> > +       if (comp_ret) {
> >                 rcu_read_lock();
> >                 if (!mem_cgroup_zswap_writeback_enabled(
> >                                         folio_memcg(page_folio(page)))) {
> >                         rcu_read_unlock();
> > -                       comp_ret = comp_ret ? comp_ret : -EINVAL;
> >                         goto unlock;
> >                 }
> >
> > Does this look good to you?
>
> Yes. I assume this is completely independent from patch 1, so we can
> tell Herbert to pick up patch 1 and send this separately?

Yes, this change is completely independent from patch 1. Herbert can
pick up patch 1 as-is.
I will address the latest Sashiko finding on patch 2 and send the updated
patch as a standalone change separately.
