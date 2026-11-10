Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794280345;
	b=lXypVwgExwIJ2LdMq81n35M435dw04S2bm/bwEHPH7GiIdWQmMhTk5lSfFBhXVbN/C8S
	 2COBQ6MA4dCoMBpBUSp6RQ3HrbLGjq/ZpSgnl2LBURRU5TlUsKFnQ2Gz7rf0JlWuVpvlM
	 zaSJd4f11SzMcFpiyvw9gn5p3DCcsRQhxYE9XbzSCmTONfIOeNoIbamKBJ2L9e9/G7oEi
	 +/YxFP6CzwEMXNnCToJgvDM77RnxVK/4O7l/wKKEKUGifefjKH5x4o9ToSto9u99gYFeL
	 WkLl6M+De9b66Dfg8s0WoWIrqBv7PrAH+7XMFfkRE9tVa9EvxBavDqFyQnSI3SlToMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794280345;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=NFGbItuCJXnws5VmBkLsQYAO9inTwJbRMBsOInhSTps=;
	b=2bm2PLFVDYik+Xu7gC4TCz8l3q/L/Ahu1EyaRji9DOgNmC4PhgzbIBnL5ECLX+/1HbBZ
	 z01gopbVG6BmVkouQDlBC0BdfsLX2TSr3TbcFRzRWRj/CVPrRfJ9QpjrYCVSbgIKXPF9r
	 O6A79awOuym2p6xgeBLINQ2cDi6K8Rjl7eX4/j42roXOmje6bgJf2z2jGVHdwhYwN9FYi
	 Fw0BsoAjAq1p/W/cgPPsRkR9+whOzme+hION6ZBf12oBFSMZIjpVnOxHDHVbcnHvRvMUa
	 WyIqWvKUYyGIZgsN/E29nptUOcGo0ID8ynpXeB84kUyZcphEj6w3HQ2e64eQR2lfX3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Wx1ShSoX;
	arc=none smtp.remote-ip=209.85.210.180
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF603606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 03:12:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF603606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Wx1ShSoX
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8b67f25e6e1so704561b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 19:12:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794280344; x=1794885144; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NFGbItuCJXnws5VmBkLsQYAO9inTwJbRMBsOInhSTps=;
        b=Wx1ShSoXMAULpOOweXrdNkTnioNB1UaRLWhDjgHh5/OMjYq5jR/knMAZqJsg8NC+T+
         8hk3hYeCsTUgBudpyDMSnwvlyL4KoVvUoRti40/dKvmzmIl0WV2d4GFsRtt5XsFLbZCF
         7nXhS1EDYuqRxEZ46FFkYkMqkdH+7wTd2lt88=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794280344; x=1794885144;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NFGbItuCJXnws5VmBkLsQYAO9inTwJbRMBsOInhSTps=;
        b=Am4dhGQedTdEUxytgO8JZqvaW+WUAs5Fq9+ajNZzXgP7t+5P1eP+a3CUMMkw4JH2Qm
         +4CosCblsMIMJ9KX9DeFdHC172fpNmlME9yUw0KAbhuq7zUFxF5QkO7Df/0KBfr8o/pu
         L2b61N0HM7pn1COgpn8xdO4UcZXYac6o5hg/ukNmz2zpRD4z2k2rAGa+GL/UVXyK4bmG
         I0KR1PwDNE/uplPwiOqIHoMJ7xw879qVW19ayf7CY5Zf6bPpFt8LDzA86pLQcVpNFUqw
         /r/6Blu4cNzsuLJ8lFxocIr6IbytWqU8rSdzUP31gi7pgdi0tNw4aaOFMNuMJNjrD98e
         dScA==
X-Forwarded-Encrypted: i=1; AL+hErFWsgfodekOt2jar9k/CBNDwvQAYG+RbvMfUQDDxD/v7Evkqj3d99n+Eabj89leO3FxwxddAEK88Ct3gjU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+74ygOPmMc0S2fzLPgtbftBcku3BrmYaFObX6GgbkiRqWO2z/C
	DQqChbqGSt++WUqm5B2tqKNHrUNqbzFmebs16lc2ZRgkJK5MNZMf79Yxu6xamhZGmw==
X-Gm-Gg: AYBFou35jbz896GS6aGMtluKVDms0FitlAipHyOkEPHhZXuhH//zzJ9tCx7wcwBw62L
	uj7vf/r74gi69ogWHnJVNxdEM5nx0ux90EA1/iT/7bxzPGdx8PSbJKXQo/Srq2G9frl10uDGTPw
	EKAmU+OR3UIkv+SMKQO3NG2FZn0lbPF8+3v1Qx68gSq7i7WcogxA1oE6yw73Vvnk8o1PxaVAk6o
	ImyyW8WvGJcshAPs4RehI9Jf0diwIuRgMJepd3qzyGMshMcn2WFV15uvfiRSCHNW1x+TL9A0r9z
	vIcMxt8kDvSjtFjZEj9zM9zE3eriflPosTwXXiR5vrhtfhDSx013Yy3xJTHI6GsfyPGPNZttXRb
	2qzgsNSCck+tElMrQhvKneIfpgbT9yRZreG2m6//2J06uxoCRQWcuCQoUZHp1W0RBXUU2++y/Cm
	B1e3LgMM94hNkAld8JVdXoCRpSGkcs8fBTXcCH037+8kKsS3o6ENxqWQvxAt1xyD4iCPvchiTWw
	eCgKuunC7o1kzOP2nwrmIqt7h5Uxwcfjkk/JeEoN+dJyba0Z+sz5z0dGBHpUPtSJEEdJvTX5x7+
	jCR9hTcwyYtwTROITrPVpyLv7eLnunqH2ywO5s0zMQF/p0wi6ovqpPtjvW6lSHMJejWrqA==
X-Received: by 2002:a05:6a20:3d1a:b0:3e2:e27:1d36 with SMTP id adf61e73a8af0-3f190b8c38cmr1165365637.59.1794280344125;
        Mon, 09 Nov 2026 19:12:24 -0800 (PST)
Received: from google.com ([2a00:79e0:2031:6:e137:9384:7cd8:6e40])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdd8d7b6236sm301072a12.23.2026.11.09.19.12.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 19:12:23 -0800 (PST)
Date: Tue, 10 Nov 2026 12:12:19 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Yosry Ahmed <yosry@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Nhat Pham <nphamcs@gmail.com>, 
	Yosry Ahmed <yosry.ahmed@linux.dev>, Johannes Weiner <hannes@cmpxchg.org>, 
	Brian Geffon <bgeffon@google.com>, Minchan Kim <minchan@kernel.org>, 
	Richard Chang <richardycc@google.com>, linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, 
	linux-mm@kvack.org
Subject: Re: [PATCH 5/7] zsmalloc: embed struct zs_handle into zram and zswap
 entries
Message-ID: <avKLRTmkNGU-wxmp@google.com>
References: <20261105044752.1997895-1-senozhatsky@chromium.org>
 <20261105044752.1997895-6-senozhatsky@chromium.org>
 <auy22TkX0ADxP9WR@google.com>
 <avKFc82JS4R9yU-N@google.com>
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
In-Reply-To: <avKFc82JS4R9yU-N@google.com>

On (26/11/10 11:51), Sergey Senozhatsky wrote:
> Date: Tue, 10 Nov 2026 11:51:21 +0900
> From: Sergey Senozhatsky <senozhatsky@chromium.org>
> To: Yosry Ahmed <yosry@kernel.org>
> Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,  Andrew Morton
>  <akpm@linux-foundation.org>, Nhat Pham <nphamcs@gmail.com>,  Yosry Ahmed
>  <yosry.ahmed@linux.dev>, Johannes Weiner <hannes@cmpxchg.org>,  Brian
>  Geffon <bgeffon@google.com>, Minchan Kim <minchan@kernel.org>,  Richard
>  Chang <richardycc@google.com>, linux-kernel@vger.kernel.org,
>  linux-block@vger.kernel.org,  linux-mm@kvack.org
> Subject: Re: [PATCH 5/7] zsmalloc: embed struct zs_handle into zram and
>  zswap entries
> Message-ID: <avKFc82JS4R9yU-N@google.com>
> 
> On (26/11/05 17:19), Yosry Ahmed wrote:
> [..]
> > >  Additionally, zs_malloc() does not return a dereferenceable pointer.
> > > -Instead, it returns an opaque handle (unsigned long) which encodes actual
> > > -location of the allocated object. The reason for this indirection is that
> > > +Instead, it stores the encoded location of the allocated object in the
> > > +provided ``struct zs_handle``. The reason for this indirection is that
> > 
> > Should we explicitly call out that zsmalloc will keep a back pointer to
> > the handle and update it asynchronously, so the owner shouldn't modify
> > it, and should keep it allocated until zs_free() (or rebind)?
> > 
> > Probably somewhere in the code comments too?
> 
> Yeah, perhaps.
> 
> > >  zsmalloc does not keep zspages permanently mapped since that would cause
> > >  issues on 32-bit systems where the VA region for kernel space mappings
> > >  is very small. So, using the allocated memory should be done through the
> > > diff --git a/include/linux/zsmalloc.h b/include/linux/zsmalloc.h
> > > index 693c9484b638..6c76fd10344e 100644
> > > --- a/include/linux/zsmalloc.h
> > > +++ b/include/linux/zsmalloc.h
> > > @@ -14,6 +14,7 @@
> > >  #ifndef _ZS_MALLOC_H_
> > >  #define _ZS_MALLOC_H_
> > >  
> > > +#include <linux/compiler.h>
> > >  #include <linux/types.h>
> > >  
> > >  struct zs_pool_stats {
> > > @@ -21,16 +22,39 @@ struct zs_pool_stats {
> > >  	atomic_long_t pages_compacted;
> > >  };
> > >  
> > > +/*
> > > + * zsmalloc writes object location into the handle and updates it when
> > > + * the object moves (compaction, page migration), so the handle must not
> > > + * be on the stack and must not be copied.  Use zs_rebind_handle() to
> > > + * move an object to another handle.
> > > + */
> > > +struct zs_handle {
> > > +	unsigned long __private obj;
> > > +} __aligned(sizeof(unsigned long));
> > 
> > Is alignment guaranteed even if this is embedded in a packed struct? I
> > wonder if we should have an explicit alignment check in
> > zs_malloc()/zs_store(), and probably rebind too?
> 
> I guess only run-time check will work.  I can add those.  I wonder
> if we actually need to worry about this, neither zram nor zswap use
> packed entries, but I think it's cheap enough to make sure in run-time.
> 
> > > +
> > > +static inline void zs_handle_init(struct zs_handle *handle)
> > > +{
> > > +	ACCESS_PRIVATE(handle, obj) = 0;
> > > +}
> > > +
> > > +static inline bool zs_handle_is_allocated(const struct zs_handle *handle)
> > > +{
> > > +	return READ_ONCE(ACCESS_PRIVATE(handle, obj)) != 0;
> > > +}
> > 
> > Can this ever give a false negative?
> 
> That's a very good question.
> 
> > I believe that's only possible with pfn=0, I don't know if this can be the
> > case on any architecture. Should we use something like OBJ_ALLOCATED_TAG?
> 
> Yeah, I don't know, I guess would be better to not rely on "pfn cannot be
> 0".  Let me look into this.

Look what I found:

--------------------------------------------------------------------------
commit 67296874eb1cc80317bf2a8fba22b494e21eb29b
Author: Olav Haugan <ohaugan@codeaurora.org>
Date:   Fri Nov 22 09:30:41 2013 -0800

    staging: zsmalloc: Ensure handle is never 0 on success
    
    zsmalloc encodes a handle using the pfn and an object
    index. On hardware platforms with physical memory starting
    at 0x0 the pfn can be 0. This causes the encoded handle to be
    0 and is incorrectly interpreted as an allocation failure.
    
    This issue affects all current and future SoCs with physical
    memory starting at 0x0. All MSM8974 SoCs which includes
    Google Nexus 5 devices are affected.
    
    To prevent this false error we ensure that the encoded handle
    will not be 0 when allocation succeeds.
    
    Signed-off-by: Olav Haugan <ohaugan@codeaurora.org>
    Cc: stable <stable@vger.kernel.org>
    Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>


 static void *obj_location_to_handle(struct page *page, unsigned long obj_idx)
 {
        unsigned long handle;
@@ -441,17 +446,21 @@ static void *obj_location_to_handle(struct page *page, unsigned long obj_idx)
        }
 
        handle = page_to_pfn(page) << OBJ_INDEX_BITS;
-       handle |= (obj_idx & OBJ_INDEX_MASK);
+       handle |= ((obj_idx + 1) & OBJ_INDEX_MASK);
 
        return (void *)handle;
 }

 static void obj_handle_to_location(unsigned long handle, struct page **page,
                                unsigned long *obj_idx)
 {
        *page = pfn_to_page(handle >> OBJ_INDEX_BITS);
-       *obj_idx = handle & OBJ_INDEX_MASK;
+       *obj_idx = (handle & OBJ_INDEX_MASK) - 1;
 }
--------------------------------------------------------------------------

I guess I'll do the same + 1 / -1 trick.
