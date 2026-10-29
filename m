Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793261610;
	b=1GrbVFqivAPhNKqk4YAxv/EkEBgcgoQ1Aqf1FlU8OT2T1Gs6x28F2iWBHT9UMKTZKsH6
	 Uu2hNKtHFpYtXkam0RFKWHkkM2N93gDtXw+L+DB8fsFD7MAXTm367MdWkiZpzqxmndUFt
	 D1+g27b+IWJk6/3NP0hOAvQZWgQ60JDCQD/g7nW4SUNyuMt/Q+nh5KtSZeQlOdr2eoNxM
	 ZR095gbr8kHNDi1AZHVK2zHyuJeJkvP1Z4TGiIVMryS9lboES5X1TQElENTvh0ReED/bL
	 o50EoGArGS35VhX3gvHSiE0J1EhbKiXCgVHtGf/Y43D9y6fWpoWq/zl/9ntMr97unqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793261610;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=4zjN8dXrEcZKqqWzHgZ+S8UFEEw6yVLTfn/k2Q+2E8I=;
	b=IOlOZ0rqbMo2GsY8lICg6BdPbMjdFpqZ4sZhAyDiE1KEam/T1/rApDwp22uU6FTH8TJN
	 gDzBUbZM9fti5gXwkno3ARQU6fZ+lrDePjSQ/7nM1Sl66RcIxspNlaQ1omxbgxuTpMGFU
	 4Uml0+cGLApUy2cpDC2M4Pkrbo34LizzwBZp7cGSmY7UjmImHchOgElhjJ+BcpgykmfFa
	 lHv6XFYozNPOWyeS+jXCvH/C8QbHiFuFtkCkklWe9XYoXhDV3AgaYKfnwOXT8O7lnzAze
	 JtjYiVAYwAxGx0UuXA8WEHC+Kq2PI3qym2WgGycqOISanTvsgcpGZfbHiyGdLnNcTRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a6wIindQ;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F3A606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:13:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12F3A606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a6wIindQ
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a7a5bcd929so1954575e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 01:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793261608; x=1793866408; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4zjN8dXrEcZKqqWzHgZ+S8UFEEw6yVLTfn/k2Q+2E8I=;
        b=a6wIindQ3TaYlMrHTlDWbXVYO1DmRQQ5/7gxNcAgU/MgXpAAeKA6ZcAtyZ2o7B0CUX
         bG9X4HkEPHAKAVxsq1DzokNJnKEFM8NYk541lPD+3i7BGVoSMcyPOio2FY1GQmocO1+i
         baXiwyimueigSbkVE6A9u46oJ7IXYAI4fOVwkCV4OWYLHwQTdGjKTUnevEvYUhKLA3fV
         MzCazJl5aGrGL9nEPO3DxhVkIe22ggD81EkLmJaRwTh+6o6eaTQ0RO06diAQtOZRq0vp
         keDKfYWpOL+2eBDpE+F6AQenSlb1qgJSqJBqENoGdJWebZZ82r68y9PpKOgxdOTKo4rd
         F0IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793261608; x=1793866408;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4zjN8dXrEcZKqqWzHgZ+S8UFEEw6yVLTfn/k2Q+2E8I=;
        b=n+W/PVFZBgAOlwy+TiZkHhPAT4U9VPLX3CcDpDXWpzLr+X//FlX/tyZ4JgGHe2+nqV
         Kn0UiqpeYrLLQhf8j1Bk7vmHQKLVW10V9/RMLIKYM4lpVquS+kBs9qTVzzZ2InfMEs+u
         x6/Aeq6C5uI85OBizUIv9Q+5Mw1sasOCtZbnfqisyMZurSSVqOrOjGT5kztLBcDTZi04
         WIxQXrsEY45Dg1ALhqUXlUiOSydKh/wv52rUhxrpEb+nfhGClYOLY9MqmwX9R70NCKv7
         V/Ytpk50Yb7edhU5/RGKmrlpdcRK03JRGjPZe07+oxnaEw1t9Z+rYu0piMPKNIV0tBMq
         pk8A==
X-Forwarded-Encrypted: i=1; AKwUvBxQ/CvTIVK51Lp2tANwfMya2+wbvaBGIVxwzfRN+lmW0cac6oaOxgyLlFOeLKwBtVVwebQowh/A/D8k0Lc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIpRutSKtLlcRYM8iiaL3Rc3vyDXBnpnURCffInMCmAAG62/Tbj
	2jqV/lFyF8LnlLvMoChjGJoikfVzRP+yyLyfaWiuoV5MWX0amjketXvz
X-Gm-Gg: AYBFou1y/vYN23YFbOeSJ0JlWWtCQ5G5w5mfPkKLxooKMJAix2tuD0BefkQX0bZ+hzc
	6SHVEl5xCKuPIYN61Pnp4btPesUWgkduYHT4uvpW2ohKuqDgKUqiu+i9HH1rvz3UBt9dp3U7Hu+
	Mv9WZJ6Yh0ak5Lwy2pPGbok+RWxmwP6chsVfIDFuZv1QZJc4bsVDvM3hQL67mQWlE1apQx8rTzf
	px6GLWnMZvLpACDaD3A5hPwXvKh+Gy+ij3zvXCWIUORsfUf4bLOmZfnIL4/B6aHB4p23bxuvHA3
	smWmgzcXh1HOYs/RPLoAO9teJEQXDvaEsE6XWybl6c+ZPv+tygaMzNlA3FJ1FSRw+oE9vKbzsDY
	ncZj1hluZezneWiI+8TXS2MxgdRZrspWhEkdtxdGzyBOA2EY/WN2irXwUi4KBvbZc4PMAY3xPVi
	uUrnvKVbti+7C3SDC/5WEmbTgaseMkJuZO4YDHOSJr+oHQpeBkXcY+o0Wnxv401iT4KJ92JR/uL
	kIJy7chCdio5QRXrG3To0qBQCQujrWc2C6JIi9Flv3ufVjnsiU6p0lIBb4Wvk1YMvxtkLG5bUXG
	EydfaYvxgIR52j7KMHFdyxuS9aI7sFD/yDPeUQIe9pHeUzk8lbS7LZ+0
X-Received: by 2002:a05:600d:849c:20b0:4a1:f57c:3803 with SMTP id 5b1f17b1804b1-4a965fbffe7mr74753855e9.2.1793261608237;
        Thu, 29 Oct 2026 01:13:28 -0700 (PDT)
Received: from scheduler.schedules ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a94eb8a60fsm83424305e9.3.2026.10.29.01.13.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 01:13:27 -0700 (PDT)
Date: Thu, 29 Oct 2026 11:13:19 +0300
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: Zhan Xusheng <zhanxusheng1024@gmail.com>
Cc: peterz@infradead.org, mingo@redhat.com, tim.c.chen@linux.intel.com, 
	yu.c.chen@intel.com, kprateek.nayak@amd.com, juri.lelli@redhat.com, 
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com, rostedt@goodmis.org, 
	bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, 
	linux-kernel@vger.kernel.org, zhanxusheng@xiaomi.com
Subject: Re: [PATCH] sched/cache: Check reduced capacity before
 alb_break_llc()
Message-ID: <auL_-u5bHv-Tp6hh@scheduler.schedules>
References: <auLs7xeL9FsHcf-h@scheduler.schedules>
 <20261029075043.4013667-1-zhanxusheng1024@gmail.com>
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
In-Reply-To: <20261029075043.4013667-1-zhanxusheng1024@gmail.com>

On Thu, Oct 29, 2026 at 03:50:43PM +0800, Zhan Xusheng wrote:
> Hi Kayra,
> 
> On Thu, Oct 29, 2026 at 10:13:10AM +0300, Kayra Cizmeci wrote:
> > Well yeah. alb_break_llc() just returns true in the nr_running <= 1
> > case. FWIW, on my tip tree this just creates a conflict. On me
> > alb_break_llc() is first, then asym_active_balance() and then
> > imbalanced_active_balance(). I think in that case moving all three
> > functions would be better? (below this other block that's for this case)
> 
> That's sched/core, which doesn't have ee92b7ef4c1e ("sched/cache: Honor
> asym packing over cache aware scheduling on hybrid systems") yet.  The
> patch is on top of it and applies to tip/master.
> 
> Only alb_break_llc() needs to go below the capacity check, as it is the
> only one that returns 0.  The other two only return 1, so where they
> sit relative to the capacity check doesn't matter.
> imbalanced_active_balance() moves only to stay behind alb_break_llc().

Ah, my bad :-).


Reviewed-by: Kayra Cizmeci <kayracizmeci@gmail.com>

> 
> Thanks,
> Zhan Xusheng

Thanks,

Kayra
