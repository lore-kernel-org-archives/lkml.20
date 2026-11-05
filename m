Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793841032;
	b=HUThx2HFL/17MWcAwIB+6xKM1nBwNXyFmllwb9jrVJvoe3gIulPlCNVD3QfjQhpWaArW
	 2zfvzk5FoUOkxnwWaBLN6yTeXZsGSKgv9U3Mgu+uhuNbYkR8dE5s9oCrWkHSPZsiKQ2IQ
	 TvgOkWabtW8oI15tqtfWASaTAKNFk5iaSTXtrp9nxpRVPG1N0JdrQWozMYcq/K2QRU1eg
	 NnFNaSyP0F2npvrkx4eQS/AeUCW5BQ652A6bUJKgHuX0c/5QVgibvJnAg54q9mrd+twT6
	 FyDMrZx5HDEbtA1er3f/kCWZi8F4uMQRe44kO0NXajGh+jdFlN9ACbcPS96/dSYiD/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793841032;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=mA/5JmHeMYIVrBxf3oNqARmHAQK65wAhI4k5sCDPP90=;
	b=rcxMTb9towsnL87fe1hAHAGHlqQuaIoZkHpPQyF2U0+l6B+Z0C/7sUIcMSdnmEStW155
	 WOiK3TgWAPTUDRcG9n8to1dc9i4jf2E4k3WsmbH6kWDaqmrvX5/fUzXLJra8bQw+4rpZs
	 qt5tuZwcgEC1mWLoUA6NKrY3Box4SJLNdg2+4B8dUDhprHRDyqx66YfiYIQTLxfFtDoIe
	 v16kJDcBhecmEh8UNGgw+OiCp9qZDGXYqdPPqQxk1US74m2InVXNTH9CjbbjW2bAZKhJS
	 aFtYQuGiqAST0WcoSJ6owWivT4eqLZuabyvp3bHLKwB+vV5GWip4VnpA+CNvSkhl8lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QLUQWoYq;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D82606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 01:10:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30D82606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QLUQWoYq
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-369dd48cda7so18512eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 17:10:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793841031; x=1794445831; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mA/5JmHeMYIVrBxf3oNqARmHAQK65wAhI4k5sCDPP90=;
        b=QLUQWoYqhN4deyaI6qiQWtT5OU+ekb/TDIdnIaP5U6zJufLOwFJJIEL6L2yQ67VXXy
         mJyNUKlnUyZpnFB/HuAXP7QbqPO+gt1Xoafz0yCl7oMr3tbBf+ozsY/qF+e4SNwLvAXV
         97LTEfup9yFGG0ifDUdIsB4/PDre+RmazGEnKs2bgS44Wk7vVzXT7zdc25MJ3Uy1EhQl
         sYmk3mvzLsrvX77eFq0bqu/KOpmrM8JkvczmYfkLVwYmnDFSVrUWqkOtAWDLXhPGRaj+
         JHxljo95HhqmTHzN/wEgSbK6RMWModm5bzU5cRQDj7eWJnp3Q3LJXw0jx6l3JzZqo6Ub
         KGKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793841031; x=1794445831;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mA/5JmHeMYIVrBxf3oNqARmHAQK65wAhI4k5sCDPP90=;
        b=qPHNzALGL20X0Sdaiwlw2OKOTa5PYnDPrkFjRsEt+vjuvvWWWtKJwTMW5kEQN5Pnr+
         R0M7HEXXFMsS7+RaxjT69KaK1bN7MdLMLmSEUeqPl/Zzz6XNKV2e4MbUoYyuets4UeSN
         WPmpAI+7v5J5v7/+EwkQ7FC+I9Yfz+b0+wdDm2uQQFsML6tinnroT9Yyo+p2BXEJZGgQ
         hP7hCF2SREQEOR2HAqnxNsPjMTcwJ6Bcu552PzYHDSYykqKecaveBmKfOsD+djK9XrWx
         nSQMulOxxWHbcTBOQ4WIlYIETPB/iSAeFiabGcSy02N5A6ImiTUHEihZVvEAZaV2Xu1z
         PQlQ==
X-Forwarded-Encrypted: i=1; AKwUvByeW7FxNJ1VPgYxvpfSt7qqF6O4GTa2F2k1uxQ7PZcTux7du1MC3Hi2gyHmRCApkZaYEEix4R/wKpzjSgA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8TwAynz2U7phhupeHhGuvRtSGQ16XEeDF3PfEIFLkn9SxZeJF5
	/p9KU0hBozcle+7N4ZMd5DFGiKTb6LwJz9XSGn61qyUV/se5ad5NYz0z
X-Gm-Gg: AYBFou1FmbiP6n+ueOiPQOM+LVnKC0Ug2JwvQ1csPw3Et+fa6MiRZr1gF9Y+snUewe8
	P61MdgJaKrUf8zTcexqj3zid4SBOPItF0HmNRiqBfA6SLurS6xixaWJBJCG4KOycvwcwVL7uf6l
	y6i00Pz+1eCGyGefASRJqrkjhkb+85tOjTflP9GnqaXe99OaShezrh31jfxmK6gV+TAaOEcYWBH
	7zbLdQ762/rqo5GlLkMVKPgzkNTevdyk+2Xyn6ohTJK1em1ByoFU/RnoqHgsCjXnLZMIb2clH/n
	kjg+aO/na73KY23dddxy01ch47p+XJG5JcEVPD8JUALmOYfTaxeiIlc3yX5lw5fgG41h4Mnqmzr
	ODta32Ko4DMFhHzBrBYDd97X4LONP1M0td/grrVbeJZVNIMaD2HxRUdzFYqJhOBg+tkaYPZHqRq
	W2LplbfcEuazC19FNZiCM6OJu1c3CnoFmoZejfPsezkrMJHWTQTcDOkD/Q2Mq+81qC3Y/1TBcyG
	HSLwxlHz8jqxSyyC6vMGxZv0Z0+7X6hxjd06mgs1uG8z6jIYv8qKHgiSBBsY1ZKpZCG2uvKLy5w
	NESmJNMidt1t/qJUfEOIsepkMDcy/MUFE5sZz4BMlANittZpoRGRSDja2/Xxj+7bPBVS6KSXX7V
	7PiApa0OMItaz
X-Received: by 2002:a05:7022:7e0c:b0:165:be2f:c56e with SMTP id a92af1059eb24-1ac5b7dcb2bmr42937731c88.2.1793841030720;
        Wed, 04 Nov 2026 17:10:30 -0800 (PST)
Received: from o6.lan ([2602:fce1:44f:115e::])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c2d69asm10759440c88.11.2026.11.04.17.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 17:10:30 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [RFC PATCH 0/2] mm: zsmalloc: make shrinker compaction
 budget-aware
From: Xueyuan Chen <xueyuan.chen21@gmail.com>
To: Nhat Pham <nphamcs@gmail.com>
Cc: Chris Wiseman <chriswiseman@google.com>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Xueyuan Chen <xueyuan.chen@vivo.com>, Barry Song <baohua@kernel.org>, 
 Yosry Ahmed <yosry.ahmed@linux.dev>, Johannes Weiner <hannes@cmpxchg.org>, 
 Brian Geffon <bgeffon@google.com>, Minchan Kim <minchan@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, xueyuan.chen21@gmail.com
In-Reply-To: <CAKEwX=PFdgEbba+H3fEnJFDnfkxCTsvuHEb4numVwJRaiMgwKQ@mail.gmail.com>
References: <cover.1786003779.git.xueyuan.chen@vivo.com>
 <anVWZVOt-xeD0dMH@google.com>
 <47ed45b5-de67-41aa-aa21-a3ba3479a7cc@vivo.com>
 <anXJ-5_vO7-toSe1@google.com>
 <CAKEwX=Mm2tXcen-quRXHf1Y2qSHYvpEUe4xiw-mHYaJnRUR-EA@mail.gmail.com>
 <auKqt6b4AxCLziIH@google.com> <aufPMirl4cD7tz0X@google.com>
 <18e4542967ebdd10.3137322e32332e3235332e313736.1dfc41.0000sendgmr@google.com>
 <CAKEwX=MV_xEUvz91pz6uc4qXWnWOUDtXZ2zASdNVOBHBLeA60w@mail.gmail.com>
 <18e4ebf806e937ec.3137322e32332e3235332e313736.1bf52a.0000sendgmr@google.com>
 <CAKEwX=PFdgEbba+H3fEnJFDnfkxCTsvuHEb4numVwJRaiMgwKQ@mail.gmail.com>
Date: Thu, 05 Nov 2026 09:10:24 +0800
Message-Id: <179384102494.19062.12740032892044628762.b4-reply@b4>
X-Mailer: b4 0.16.0

On 2026-11-04 14:54 -0700, Nhat Pham wrote:
> On Wed, Nov 4, 2026 at 11:46 AM Chris Wiseman <chriswiseman@google.com> wrote:
> >
> > On Wed, Nov 4, 2026 at 9:57 AM Nhat Pham <nphamcs@gmail.com> wrote:
> > >
> > > Is this precheck basically checking if we can free at least one zspage
> > > of the size class before proceeding? Yeah the number looks good -
> > > let's add that, in parallel!
> >
> > Yeah, it just checks if a bucket has enough wasted slots to free at
> > least one full page before taking the locks.  Sergey pointed out those
> 
> You meant full zspage here right? IIUC we keep the entire chain of
> zpages around until the entire zspage is gone?
> 
> > two counters aren't atomic together so an unlocked check is just a
> > best-effort hint - if you and Sergey are good with that, happy to send a
> > patch.
> 
> Personally I'm happy with it being a best-effort hint!
> 
> We can also recheck after we acquire the lock (but I suspect it's
> unlikely we'll get radically different decision?)
> 
> Sergey, how do you feel about this?
> 
> >
> > > Ah ok hmm. Sounds like internal compaction isn't that helpful, i.e
> > > zsmalloc already does a pretty decent job at packing objects that
> > > there aren't a terrible amount of internal fragmentation in the first
> > > place...?
> > > Should we do CONFIG_ZSMALLOC_SHRINKER (default to N or to
> > > CONFIG_ZSWAP) for now, and remove it in a couple of releases if users
> > > in the wild do not complain?
> >
> > Compaction still helps when we trigger it between bursts (freed ~21 MB
> > before the swap storm and ~10 MB after).  It just wastes time running
> > mid-swap when new writes are filling those open slots right back up.
> > Defaulting CONFIG_ZSMALLOC_SHRINKER to N (or CONFIG_ZSWAP) for a couple
> > releases makes sense to me.
> 

Hi Nhat, Chris,

> SGTM, but I'll let Sergey chime in!

Thanks, Nhat and Chris, for the discussion.

If Sergey has no objections, I'd be happy to send a follow-up series
to make the shrinker configurable and add the unlocked pre-check as
Nhat suggested.

