Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794106445;
	b=ps8Sh2DkfqepdQSWjnTY+NKmPDDqsvYCNAgVH+vMX6wgxRmuSPBqchLi3yDeuoR086lp
	 fvR34iOOhEzsSaeHygpgSz2j9eFilMYaJkPwyHHI2hVpGpRWp8tY5FY2KHB3BGt+xX0wH
	 CGRd8E0jejBqwPnrC/vCFu09Z1p+Za29PFtxQQBwi+9xPpaJWxbwtl82k7cLWVfCZq3eJ
	 OMKcX+pInyMq5GSnYjRLnj/bylkD0Hv/TbsYcZAiDFUUMRjofLsekQm/GOfvBmQAw73v5
	 eb1jgdf7ouUyQY0GEJozpWSAGTmA1zpAGw/WHjn6v0RsyvBZG5KMWC4rJOkIBxltG5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794106445;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=rKErtvNWkBsK/2nMmPPXo8mzP9NrOokMadJ8yLKh6Gc=;
	b=IQOn6Rttq7Juy+XV31KfNGij/ahIHONXCZe+HFCBRaiZyF8IAhcDBpSjF9bti2/h0bcx
	 80Z43Lvs+Adz2tHvnIj9ag/Zhds/21Xt/d9QUnMhlWj0C7Pa5JY1dMX+wAasgH3eIUNNL
	 D/QexaT333iuSG2ik0jPK6Um1tNvfm15s8ZR0Z0PtDxoQkpVgSZkQSMn2arpXOvDenm1f
	 TiBwta3sJUpAX0bOzvpXhqLuOZJeuDItQzMJtx9OjqEbPRBGqbx6gDvA38rwpxzNUh4IO
	 anbPswW5Aszv3N/TkNW+4fvauSx8AEYmzmFgDlQovfvdz/7WvtPnn1GIPCZ8Oj1+oVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nbD1FdTr;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40160606A31F
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 02:54:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40160606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nbD1FdTr
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-36dc20d6de3so18344eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 18:54:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794106444; x=1794711244; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rKErtvNWkBsK/2nMmPPXo8mzP9NrOokMadJ8yLKh6Gc=;
        b=nbD1FdTrZdxZfMRV5vsPyB59BoPJc8XBJJYYu6A81B9wfUY56kvKTZyhqa55Mcp7mA
         URYLxcQHD0hX7AODtlmzDJMk+xp7oEWwM2MkKfk0Fj7RdP0P5GVvwQgop/a4aVVtKbaI
         5RlRyKH1doaT2BTflX6gqFRCOy98CGMYAtCutDJg7UFzKAvDUP1ikybzJA0vWldUnMyA
         Bly1zdfis3vQHbJwMZW536i2zRfKknmckpXtwECXt52n/utjXQAVxvy2KuKRNj7siE1B
         oZKzf0K9mA+XITUUElDYF4XYLU2DDxYiJHBWWpyi1QOxixUY8xXVLcZKJGh5rviX+Tkh
         7a8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794106444; x=1794711244;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rKErtvNWkBsK/2nMmPPXo8mzP9NrOokMadJ8yLKh6Gc=;
        b=xx9auO2Ogl0VIvgzbgR7qehY9BIbNw3LJM5TKZz8e2FvgI8El4pItzb/0i557sPhBT
         PKUEv/HnapflcRy6rT+GmrHIaCio79Pa+r6jpIbXTEnuMrxjrYWLqsD6jQdcBYmypj2/
         8Wkv9z1LDnwqKh8me9qBMpMb3byL6vKbImffJrUZ0TzVBIM3cQEoFHZ15M7eWjGoI/mA
         Mx9WPpmEPuLGJg4xkRvXBY1i9Ol4ooWLpAt6OOFIzbMXM7MraS38pvX5m4R0jwEwwCIY
         Kgz1iAJZ+4tU0Z0y3nmk32g93v2ips16wYDwtuH54h6FZZ+/aUln60tc/iJYW9wF/ACY
         Uprg==
X-Forwarded-Encrypted: i=1; AL+hErF6InGc2rrip1q8zmjkPRhgFuMpk1VYnk5tEL6fI9kzLEsr4KlXTY3Td8SWXoIHlpl26ILC5/MOgESlUM0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/3y5mDS3D9cuxsDqwLL8NnNxlCaqDTRZ592lOHxVfVLt2QYGYl
	S2mTpILVodSr82XLZdEDeOIrG0Q2JgXomfIxCVaeacnafxBChs2DUlMc
X-Gm-Gg: AYBFou1U4NVczOOTtroOYQpMcnT2U5BwheJ48cVypCDGYJcoWF/dP3JGGmdRM40W4Fs
	OvOOkXaqIQounOvxFRHOt2b+HhTxPW1YZKsAQiaOV6ZMjA4j21qgnT+4kVqX+Qy/07pCwLrXXTG
	yHImfoCfmBxUwpRCjZuzRUR2I4xvuuD47HG/ZaZdsmg7sF/eV5VEo/AfNf0Jyb9333O1oN1Ma9N
	IMRkL6fhl1mYy9IiWKc37UnmJpr0CxDDbggFdGT+ZKAkMT/2zXYpDriYIxi7FRgzwplrS+B6PF3
	upeOes8OldZn4WUUj/RdtMR8bhiBBl/f1Sw7Qc6N/a4ZqTgwmVC3bVNY6rKbzNDwzEn4VQ+PPhy
	IXEtM7i8WBSjHLpGwvFJVHEWttoqTu+TOMe4vTCkoQdY5w58Nn9DOuZ3BpUHMcFL9eJyi6Qagoc
	a03gmNTAhgZxrWlbTYiEqJA5o+tVXk0K4KpAwWzQPM/Eg3Fqd3DJhBltEiKhKu+kq5a4X9uxQ4G
	9grs//4niaNYQ5NndVczeyJ5qZ0/iVGzMwQFcBL+fyDv2UIb3PCqaYZ0xxwawfj+TNbEXsUGLjz
	hEjIy5r9krPy5GsqmD4Nq7+Zd//zrPEcbPOqwArsW07oHIiwUy+jlV8TbH9xYgArzcowKpNuFvh
	7IQmexUQaIll2
X-Received: by 2002:a05:693c:87c9:10b0:36d:5fbc:8c8d with SMTP id 5a478bee46e88-37255475244mr1965227eec.2.1794106443908;
        Sat, 07 Nov 2026 18:54:03 -0800 (PST)
Received: from o6.lan ([2602:fce1:44f:115e::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37265efd2dcsm1849390eec.17.2026.11.07.18.54.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 18:54:03 -0800 (PST)
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
Subject: Re: [PATCH] mm/zsmalloc: keep fullness stats consistent with
 CONFIG_ZSMALLOC_STAT
From: Xueyuan Chen <xueyuan.chen21@gmail.com>
To: Nhat Pham <nphamcs@gmail.com>
Cc: Xueyuan Chen <xueyuan.chen21@gmail.com>, 
 Minchan Kim <minchan@kernel.org>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <CAKEwX=P+8AhOV-HQGHmtWftMs=if7LTk6K16Q39bJyF3DFFtdA@mail.gmail.com>
References: <20261106-zsmalloc_stat-v1-1-b574f4714adf@gmail.com>
 <CAKEwX=P+8AhOV-HQGHmtWftMs=if7LTk6K16Q39bJyF3DFFtdA@mail.gmail.com>
Date: Sun, 08 Nov 2026 10:53:59 +0800
Message-Id: <179410643928.425802.15371130916450367499.b4-reply@b4>
X-Mailer: b4 0.16.0

On 2026-11-06 09:34 -0700, Nhat Pham wrote:
> On Fri, Nov 6, 2026 at 2:56 AM Xueyuan Chen <xueyuan.chen21@gmail.com> wrote:
> >
> > The fullness-group counters are only used by the debugfs classes report,
> > which is enabled by CONFIG_ZSMALLOC_STAT. However, these counters are
> > stored and updated even when the option is disabled.
> >
> > Make the counter storage and updates conditional on CONFIG_ZSMALLOC_STAT.
> > Keep ZS_OBJS_ALLOCATED and ZS_OBJS_INUSE, since zs_can_compact()
> > still needs these counters.
> >
> > The behavior with CONFIG_ZSMALLOC_STAT=y remains unchanged.
> 

Hi Nhat,

> Do we need CONFIG_ZSMALLOC_STAT in the first place? Is the overhead that high?

Good idea, thanks. CONFIG_ZSMALLOC_STAT only controls the debugfs
interface; the counters are updated either way.

In my zram tests without readers, fullness counter updates changed CPU
time by less than 0.1%. Reading the stats adds overhead that depends on
the polling frequency.

Dropping CONFIG_ZSMALLOC_STAT seems simpler.

> 
> Also we already have a #ifdef CONFIG_ZSMALLOC_STAT section. Can we
> just move these helpers inside it, and provide no-op skeletons in
> !CONFIG_ZSMALLOC_STAT case?
> 
> And if we're going to have CONFIG_ZSMALLOC_STAT,  anything else can we
> wrap in CONFIG_ZSMALLOC_STAT? stat field of struct size_class? struct
> zs_size_stat's definition?
> 
> 


