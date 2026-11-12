Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794485516;
	b=WnVj5qAIXyxEmeF5xXiaYWcAya5/r4grUbT22GlwxPYe1VTFQpbvR1wktBL4QNL8yX9x
	 yzdLAD+pwazVqwvX4LsX8AltPW1XZR7KP9lZkSPq4i814FO5fnghiZoky83h3XMWYCk9R
	 C5i0nDUWo2yO7TlsFeodGQI1NcEzTJHcItXF93KGYUgy1CqOZhxt+ZUcbPL9P2B36Bsh7
	 RA2MDFbvoNTm7Z9d1QfII2N64ib/x52xDbvEZBXolSBS6ABK1sHIJI3Qfi4v7Db/GG5yb
	 1m1EqmiQE9el8lFrkplYClPumuOzNQoIwZv+9eFZjkZ/vXqGo7vtAv6AgteWmV3dM9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794485516;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=xc3dkm2FkTj3bfcx1hRbhfim8mfu2/061yvWmQIUcIs=;
	b=4yRqT++RRDmkMewrpypa7yTD8iiS9Ux2MW5iTTAPbs6SHdXwya75xDkOW3/RlV71qNTS
	 9rRLMwCcToPiC2E2Sr/TDS8OACbgwJbHJCJApalqB6YUOPcfRmcRQ5jcKpFoYWz2afeQT
	 XumzX8Jq1xdIyrjK/6JQJZjByds8uIlZIP6++V4+VQsr4cUcZXsWla8c87p4RdXrml/tz
	 Bswaf8cQ94lQlGJlTi3iAiYX0dEMl4WIyEPKYmkUVby+Yd82k1zWVBk+YdkBn47JmutQt
	 J2nhvYEXJIwJSBNOHwMMmanaIM1+7rpQdJXXvceItdx2jg3Xy+CpU1TzROWJSYla9Vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RpiHyhBL;
	arc=none smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 471FF606A327
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 12:11:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 471FF606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RpiHyhBL
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6a642495d81so1192479a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:11:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794485514; x=1795090314; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xc3dkm2FkTj3bfcx1hRbhfim8mfu2/061yvWmQIUcIs=;
        b=RpiHyhBLk3MvPRGZ9KqyZYaEz3gxSZVZHr/cu2sc+OExldAArs984cRSnc7hzg2L3+
         M6lfONzNuDEfOaU3n583z53FmsvyFjKNoy8/Xb0dUQOQNHHX+yCU+wwMwjAUx/uoh31F
         Vp0Eo9QrEaSR4SkRarnowfwIdntBB7uUGVmT6iIEuGBXaxnk09AA3SgAtXgBwOuwJ28H
         pAwo9grT/HnEH61Lav3gp2FOIEfY3j9YsfVNsqSoNfBSBebDE19ZCNKSPCHH907zYUHP
         Im7Ef0IhJN0ODA5CRobe8gwI47FGS6/MzyM0j2pzXXXCNQ9ClZNFzTweLx3ZQ6ysN8O3
         uUAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794485514; x=1795090314;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xc3dkm2FkTj3bfcx1hRbhfim8mfu2/061yvWmQIUcIs=;
        b=VSNhMpXevxK9hqzbluiQ0ZQyciquTOdhWClxuum4hnyLwZn8BiqB818Tmb81L1+h9L
         qx0gRAuI8xl0otWQGc4XPs+X7hLv1A6IV3W4UAe6OZmD8SNzwcW/UkXmqtxzjNcv+iP4
         4PHqx4Gmmz06e9rlefvjE6mJhEayv+49a3NxaUfIxcpgYNuYPCHKdppcopwGFpAXvRCy
         FBuCFMzTD4rPOCrZJqzBVFx8AelmoUw+2oQjSxqTonIqE2mSB6aTuByUipsIG8ylpyg1
         rA9UxgnJY3ueIQZwpXd6JuIW829pmX564JhOhvjqDIG80FwWvRsvODdXRRblfCgYbC71
         9PyA==
X-Forwarded-Encrypted: i=1; AL+hErF/OBBBb1+IR3Vd+Qvpi8yibWlbD1kCJyYMgWflBTzBoBIVvanq8xyYc+Tpq1AyZGATNoDeDkHKKSkJKJs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9T5dnIpn/B4AzSaB/J3nCUu/TyiUfnisCKC9j53J+rd6tmXTKW
	EZlvzgZgzuxxKruVT3/DBYka5o6SUJq3+qsI8Kri+xv5uOptnHjHwnZy
X-Gm-Gg: AYBFou2NxHS2urhHorLkB3mI0hdRykoMSzEZ4kj2UrNsEto51cC4zxeIRumuf70euAT
	qRWEHnyBADBkfCq+WFb/r6fwMfaOoLfYE2eyoixr0ZuB+X0gkaFykbUAl6NK2S3+vQjASrPCoyx
	aCojSvyNB1C9/MSt5vNq/wwmLtN6QDkruxBAVLtmDl5SmCq69Vi3Jp5OB9EzCCSS+kPDD4Niomb
	pn3/Dh1EbX79Yh5u2VjZitAgIyS5Tg1ngg7qy9CsQGjo4JS8UheYtvdkBSudZpVXMcvchJdJzT8
	nUs2Jy8YfPwh3UG2DhY7uKM3M2R11BNPKqwz8bLyfGwmHV7Su7wI3XNlvzBIlVc4cnDGl3nNJBm
	y/vu5AyBaYRKUFbXDPS8z28+3jCFpbf+bx/Udl0oaBbkEv3XalAra8qbZfUNENkZEnSP6cJc6Nv
	guZFhS2FnCKkw+fOkTZgPh5Z3/vbTiHmIUZ91N9ikOCgAipcESDtPR5se8M0ipffTI+jAwm8+e6
	bD9CDFQvP3XHTymxuirKeIXMDeOCxLAUThvlciW+eVSBKz8MuDOxRp3VR6djqpAeEjhTA==
X-Received: by 2002:a05:6402:450a:b0:6b5:875a:c2a0 with SMTP id 4fb4d7f45d1cf-6b7775eb13cmr3884877a12.24.1794485514349;
        Thu, 12 Nov 2026 04:11:54 -0800 (PST)
Received: from milan ([2001:9b1:d5a0:a500::24b])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7834cdc23sm1610428a12.12.2026.11.12.04.11.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 04:11:53 -0800 (PST)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@milan>
Date: Thu, 12 Nov 2026 13:11:51 +0100
To: Hao Ge <hao.ge@linux.dev>
Cc: Uladzislau Rezki <urezki@gmail.com>, Dev Jain <dev.jain@arm.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Alexander Potapenko <glider@google.com>,
	Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>,
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
	Christoph Lameter <cl@gentwo.org>, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
	linux-mm@kvack.org, Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH v4 4/9] mm/vmalloc: BUG_ON() on an unaligned range in
 vmap_pages_range_noflush_walk()
Message-ID: <avWtB-nWZUwLdQdP@milan>
References: <20261110112546.261415-1-hao.ge@linux.dev>
 <20261110112546.261415-5-hao.ge@linux.dev>
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
In-Reply-To: <20261110112546.261415-5-hao.ge@linux.dev>

On Tue, Nov 10, 2026 at 07:25:41PM +0800, Hao Ge wrote:
> The pte loop of vmap_pages_pte_range() maps whole pages and stops
> only when addr lands exactly on end.  An unaligned end lets addr
> jump over it and the loop keeps mapping into whatever follows the
> range.  An unaligned start maps the page below the range with its
> first pte.  That corruption is impossible to debug afterwards, so
> bug out on addr and end at the entry of
> vmap_pages_range_noflush_walk().
> 
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Signed-off-by: Hao Ge <hao.ge@linux.dev>
> ---
>  mm/vmalloc.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 27f2674a5556..86fbb1d2b27a 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -698,6 +698,8 @@ static int vmap_pages_range_noflush_walk(unsigned long addr, unsigned long end,
>  	pgtbl_mod_mask mask = 0;
>  
>  	BUG_ON(addr >= end);
> +	BUG_ON(!PAGE_ALIGNED(addr) || !PAGE_ALIGNED(end));
> +
>
But why do we add this? We used to live without it and as far i see
we have not gotten any report about any unaligned addresses un-maping.

The vmap allocator grantees that va->va_start/end have to be page
aligned.

--
Uladzislau Rezki
