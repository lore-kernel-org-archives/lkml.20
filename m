Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB822DA76C
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 07:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791530173; cv=none; b=SCSvsCgcQIzH2+UgwFNCnk0ZXHchIkvG167II1LufbiHgBF9rjkeC+hIUxryUv3TkdGEpro1HE+Wvcuxo/Giv0wB1PBhPcvionobMdAqzhsytTuPT9RcQFuFDJnrLTWG///BDCJ2aJve4wL8xFxk9K2cWCd5m9+liqId2l49SHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791530173; c=relaxed/simple;
	bh=fPH0wVEGimhaW13WJVTQikvyNpiUaeWQCEIDwUN/7GU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qsMX07kYj+S/MJFDiHXklnz3xDMJHTB01+XeIiUuAIaH+1RvZBUQ4NL0rPR4GLEVhcZyPuQo+Bffdtqg6dhB1NujmAAxw1cwMIOp8ClW92GxaDTuvxNqbmpgsDdy9FNUZAz7PjZgbLQZ06YOdQ0gfQ8ymVO2EbwnSpj53xY4uSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=KKk/oq+J; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KKk/oq+J"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3a4b9732d5aso3389269a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 00:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791530172; x=1792134972; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z2Zp0tbPzypU+Xc8XKZGNu3Y99smdHR6a9gLWnL8e+E=;
        b=KKk/oq+Jau1pyzzWOxCp52QObFTqL59/Qk2dQ4YSFbJgIkMa26UNdZpw2aZ+BcAjvk
         C7gFnopiZk5JxGOON2aehCtyKYt/AbGtrwEZ6zUOy6HYtCI668/w8gEdqPrC/G1TwyWf
         aTex9iPvj4Yy4CD6TtodWKVj03k1o4SJt/lxk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791530172; x=1792134972;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z2Zp0tbPzypU+Xc8XKZGNu3Y99smdHR6a9gLWnL8e+E=;
        b=q+2A8RJOTO+7XEBQ6CBACUJsX9HPJXezrJrL6JUabijHcYjdCnyMNaxUiLVaFQXSeQ
         5itIao+dCBep/zteQJD6bSWFjA68JMUOSr9u7yZWEYhE/z2Jy1UQZuFypXIWuFwGbJj3
         S7aGk0YerCO6x3V5wpfl02CcIpWC4YO0KnHkT9tmvHn/oRNLyH9wzsK7Tl1Whi007NuA
         oB4B073UHVoROB3rb15VBqYoNg0WRsk+S4IxYX1TaIn5uwaVE/jT+rL/OmFMeohrB0Og
         8Hm/r+qMuNJtSyap++k5qGUfcpHfunOkUBuGzefrvHxwRXdQa9ZXhiTCaGhVRdUbYVIx
         OI/g==
X-Forwarded-Encrypted: i=1; AKwUvBx7OrWz9ge1aNOuCJFletn+QZWOsc6AXirc6hbc2oBg9zRJqMRteMEJy3jyIVCo20Nd4u8M/oHDgya32nA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJYKcbmKwT/bIQPbyfEaKcY4C6yD/mzYbk1pAQMBs69suoKShLd
	eEyrgCmjgQ6u3ZSUysSFUvvFsXg6Dmi2cvfQ5OxY4jDZA7+XxaRA5uQ5aP+MM+O+Zw==
X-Gm-Gg: AYBFou3LAQ/pS7UQ7NA+1Z6YHDZGZZJ43csGQU5G8YmxQZhcZrPccMi4x8qYD86aJIX
	kPtDqEegAL40Qwo22slOIJZ4qbTyTPM7xJ+9wCdPlFMXf7/JyUFx59cNPA08ZCm9OULSleGgRiv
	wM5PY1ZrSXIFEsbx/+HG8uq8mZ5n0KG6umkxG1+HSZXHLVX1lJ7OacJ4LEt8K/xrK3mKZYNy8JX
	YhSqnZPdwl/1idmp/CHoQV88EXgZo9YvrIC0duh7AeB2GqXWXP2fwAZS2OOcTo/j8bW1WCQMgtR
	73WYptsSeXM9Fpi7zLyzPAWvvuWPW56tZoTEaRHM7gemBllgwpnmkY+07d3rajBVDcF1IetsenU
	oudrherIeVuovB2tYiD1RpWyrKhZGY6qSL4uMjPCG/8XGAM1IjGKItrHv5o7moa4omjaaXPL98Y
	fjglxLAUVzOPg1/FimbhKGG1AiOlwMfduoOT4ECQVPU4MfejXESdBZoKf04kdAdTcyFTnzTFFmf
	UdbYlzp8Fq9xmRaH+DFYbJqtglK5wqNjX2lcVwj
X-Received: by 2002:a17:90b:4b92:b0:3ab:2d17:51c4 with SMTP id 98e67ed59e1d1-3ab3ac9bc91mr1089309a91.56.1791530171629;
        Fri, 09 Oct 2026 00:16:11 -0700 (PDT)
Received: from google.com ([2a00:79e0:2031:6:383b:5817:8167:5051])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3d9e557b1sm471687a12.27.2026.10.09.00.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 00:16:10 -0700 (PDT)
Date: Fri, 9 Oct 2026 16:16:04 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Usama Arif <usama.arif@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, chengming.zhou@linux.dev, 
	dsterba@suse.com, hannes@cmpxchg.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, nphamcs@gmail.com, terrelln@fb.com, yosry@kernel.org, 
	riel@surriel.com, shakeel.butt@linux.dev, alex@ghiti.fr, senozhatsky@chromium.org, 
	kernel-team@meta.com
Subject: Re: [PATCH 1/2] mm: zswap: use separate compression and
 decompression requests
Message-ID: <asiUXpjrE61TLMxQ@google.com>
References: <20261006002307.2669023-1-usama.arif@linux.dev>
 <20261006002307.2669023-2-usama.arif@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261006002307.2669023-2-usama.arif@linux.dev>

On (26/10/05 17:22), Usama Arif wrote:
> Stores and loads serialize on the same per-CPU acomp request and mutex.
> A low-priority store can be preempted as soon as the compressor drops
> its stream lock, while it still holds the mutex. A higher-priority load
> on that CPU then waits until the store runs again, which can take a
> long time when other tasks are runnable.
> 
> Give compression and decompression their own request, completion wait
> and mutex. Since commit e2c3b6b21c77f ("mm: zswap: use SG list
> decompression APIs from zsmalloc"), the per-CPU buffer is only used for
> compression. The two requests can share the per-CPU transform: no
> in-tree implementation modifies transform state while (de)compressing,
> and shared codec state has its own locking. Loads can still wait for
> each other on the decompression mutex, and stores still serialize on
> the compression mutex.
> 
> This follows the proposal from Sergey Senozhatsky for the same split
> for zram [1].

Greetings zswap peeps,
We pushed things a little further for even more gains [1]

Catch me if you can ;P

[1] https://lore.kernel.org/all/20261009071157.3730698-12-senozhatsky@chromium.org
