Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794608591;
	b=NLZmF237GKWfpQWOA9zjTw87Qruug2ZqCue53o4Ekx/KfHNQkEpOZfQFy8aBndapbn0q
	 NQFY5MiOasCG2TT1s2hBUjMeqSS6hkHdz4VzndopJIKUt907S2MBH/b2vYnP/94bwLLIc
	 CWElxiycOnhCgKzS4+YbQFyP0BtYy+e0CEp05uj5a3Fey4W5XMvDvoDrIfadkkx7husqv
	 /kInGGyk4QW+rZjqyfWPlyQpI0Fs1iYS8Nt640P1N4BgTuVyfk0Vbg6AAjkdbsf0zpKnO
	 k4pGmm8EXFRNlN9n1b5gagLndWWVsW5M2FGEWOskz47jNVIVVJgxAgm0C+YsG/ivp5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794608591;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:Mail-Followup-To:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=lt2oCclDDD+rP94lJg6vk9k+uikGlXnAQ4GsrH0NNrs=;
	b=SzgK+h7xpE4KU9fRzwdD8HK4FdEhYoyfJuKEKjy1oBx0pkErZAxdfHe3ReApGiex5jxN
	 GzHdzaILIBX8DHHmqqUDFrEAB6zZsmShx4Ku7tx+YHwzfVlqrmqU3k2a8E/A2N6WKW5ts
	 +L7awaJw0Zq/nJkqvc6V8OBld9lNoEe7BYdxzLnQ+ojK7GVigoRa7BDIphmomtRb5mHSJ
	 6vdBfgZ/f1piA6HDuRnQEcp00KAgL55CjbIrRKtpPGvjplZX2r2wzwFAEtE1Rj2FOfQ7o
	 vVXSqDPr0GHUKXYaUL00zRAEYtx4/Zg3c7j1VlhWQZnUJ8Jna8MY0xFVCr8+FyQt2CA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="TOU/u0fl";
	arc=none smtp.remote-ip=209.85.128.169
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEC14606A327
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 22:23:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CEC14606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TOU/u0fl
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-8b331cad3cfso12095497b3.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 14:23:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794608590; x=1795213390; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lt2oCclDDD+rP94lJg6vk9k+uikGlXnAQ4GsrH0NNrs=;
        b=TOU/u0fld60SXTMHQ8NJNR5E7iMK1H95CJMxqo3iI4aprrgzcUP9gzLuxwA839Zlb8
         SnXgHFBe0O5yJK6BWvYLu+1b5fpJAeWsRRorF9kWJp8+lXeGbAlj0ZZZZgz3ye3WfXMe
         IujJVBgb81C7nuLpgUW93wSAwqHzFQZjtrDUOoOCcQvL8OmF2BlLJi15jntGcjClFYkk
         4+1gNU8AgTdsKhgQ7ZlnPWHha/SQGa0paOyTaRWexyyr0+FkHaBNQfcLRAh4fu071kSX
         lqoZAm58/sYDhsYjJB5aBzIIMYjkLR0rtXlHTlFROsZGfG1a8hzeU2ZuNmqdj3z3x9rn
         hKkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794608590; x=1795213390;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lt2oCclDDD+rP94lJg6vk9k+uikGlXnAQ4GsrH0NNrs=;
        b=qiMYwnRW4X9j8EOGisZhF5wyg4VXd1N8iJ2c/PfFDk1iQNo5ZVrEzZDWtyt7Fd3vWr
         CYBd+osh5f+oSl1RDU6DcetTHXZ8FwLoGEuXFO+f/CfY96d+jfUUTZDocHIhZWuJa3fX
         MxA6XH7EsvU2G1kdGdRymZYo7NPuExKDHt6XLRrHWtoMNdc1J8YVe+vdth4eesI3fqde
         NVDOCKdEKrFq4TvdYXA7o/lmuw9QNlyrhmW1LFz92EPzBijpnyDG15lKuS7qqmV+5I//
         MRHNBI0Mcv+4I5VWvaYyAAIj6ciZ6ESOMVjqpZFguZ0+1ZsoxCA1M1VRFaZuoCrxwUMU
         /6qA==
X-Forwarded-Encrypted: i=1; AL+hErGmrqkU3ecEuLXpQuMW1dETEi3yvnsEOETHROBADSwg7rG3apLi4h/BhOjNPPa91RFY6a8kkpxwUHIY2wI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Jt3T1DVKl8bmRHiLnNDQJGvGokLRf4fyQ4X0RcaOajiUk6lwV
	s3d36/GkWPtud+qezEdMIrV2dukfI0/vT7W7NEM0NBpRb0ZagrXnYVQ8
X-Gm-Gg: AYBFou2fBsgU569kNVsY7Q9i//7HZi1JeoXhZR3Pv7v1BSHO0nAGBbg4b4x730Dm1Tr
	b3SBSCjFbLPrD5EoKwQK/qnPqzwgSkvmL5bXlbSMT1HHEVzNNpbv+b4933v+Q1PaOOefsQ+wS5v
	6Wf4K9ys7wvzlvfWwkoXjqan0f69lk6C2gI2BH9/J2v6pnHWVYxclcAgaSoXnwqcyy4mAKRE/Us
	hao+3Yp5F8o9vvs/j8VooiXPK3c8djyhc42xERex72A4Vq1Yt/o9O3mUj41KMvLeHberS3CV/Zf
	6aEmjVTl3EqCuk43iZ1cm8h7Qp4/3b6vXuW5Y7x5/lKxtYxNdWiW9m9V0B8gVGH1vEcGDGq9vHU
	uCKaZ2HpLOh/kfGIXKvnxZoFrT5x7Mwxb8EtT6JE0f0vozxpN41c9e832AjaSWfzwL5dgy7modX
	+TQ4BJl/kNO4sQiBDDK+7oaRG8AEZN2gTujhBRhFwnVFDT8ylmA7OR4mjHBgDl0UDKjx4rhbtO3
	RaPgzwHQv0Z3dMaGl4dRMD6XjrS9WU41YXN08e6qv/ZwitJhDZB5BIZ1WyZ5+HpNN7QqyHjGwFW
	7FTRmVTftypFzf7BGmBLX0vp1yr5FhBi2PKbk8FMFLRM3cjM01rH6G/w66MCpEVkmlCqUorocoN
	LASODnNM=
X-Received: by 2002:a05:690c:89:b0:8b1:233d:7054 with SMTP id 00721157ae682-8b4aa2f48ffmr31548167b3.32.1794608589587;
        Fri, 13 Nov 2026 14:23:09 -0800 (PST)
Received: from localhost ([2a03:2880:10ff:41::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4aa7eeaf9sm31201657b3.4.2026.11.13.14.23.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 14:23:09 -0800 (PST)
Date: Fri, 13 Nov 2026 14:23:08 -0800
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Hugh Dickins <hughd@google.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Gregory Price <gourry@gourry.net>, Zi Yan <ziy@nvidia.com>, 
	Rakie Kim <rakie.kim@sk.com>, Ying Huang <ying.huang@linux.alibaba.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/2] mm/mempolicy: merge adjacent shared policy ranges
Message-ID: <aveNgfkmfZ2SMWK8@devbig011.atn3.facebook.com>
Mail-Followup-To: "David Hildenbrand (Arm)" <david@kernel.org>, 
	Hugh Dickins <hughd@google.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Gregory Price <gourry@gourry.net>, Zi Yan <ziy@nvidia.com>, Rakie Kim <rakie.kim@sk.com>, 
	Ying Huang <ying.huang@linux.alibaba.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <20261113-mempolicy_limit-v1-0-16688b2644dc@kernel.org>
 <20261113-mempolicy_limit-v1-1-16688b2644dc@kernel.org>
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
In-Reply-To: <20261113-mempolicy_limit-v1-1-16688b2644dc@kernel.org>

On Fri, Nov 13, 2026 at 10:36:12PM +0100, David Hildenbrand (Arm) wrote:
> Shared policies can retain separate tree nodes for adjacent ranges with
> identical policies. This can create unnecessary policy ranges especially
> when individual VMAs cover individual file ranges, and user space sets
> the policy on these VMAs independently.
> 
> Extend the existing replacement handling to merge ranges with equal policy
> at either boundary. The existing replacement loop will then remove the old
> nodes and installs a single node for the combined range. This also avoids
> splitting an existing node when setting the same policy on a subrange.
> 
> Extending either boundary rules out splitting an existing node, so the
> allocation retry can only occur with the originally requested range.

Hi David,

Independent of 2/2 I think this is a really great change. Thank you!
Reviewed-by: Joshua Hahn <joshua.hahnjy@gmail.com>

> This change will make it easier to cap the number of shared policy
> ranges per inode.
> 
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
> ---
>  mm/mempolicy.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/mm/mempolicy.c b/mm/mempolicy.c
> index 06b90903e8794..183bc3bd077cd 100644
> --- a/mm/mempolicy.c
> +++ b/mm/mempolicy.c
> @@ -3208,6 +3208,23 @@ static int shared_policy_replace(struct shared_policy *sp, pgoff_t start,
>  
>  restart:
>  	write_lock(&sp->lock);
> +	if (new) {
> +		/* Try to merge ranges with same policies. */
> +		if (start) {
> +			n = sp_lookup(sp, start - 1, start);
> +			if (n && mpol_equal(n->policy, new->policy)) {
> +				new->start = n->start;
> +				start = new->start;
> +			}
> +		}
> +		if (end != ULONG_MAX) {
> +			n = sp_lookup(sp, end, end + 1);
> +			if (n && mpol_equal(n->policy, new->policy)) {
> +				new->end = n->end;
> +				end = new->end;
> +			}
> +		}
> +	}
>  	n = sp_lookup(sp, start, end);
>  	/* Take care of old policies in the same range. */
>  	while (n && n->start < end) {
> 
> -- 
> 2.43.0
> 
