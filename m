Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E8CC37757C
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 15:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790521619; cv=none; b=LwNMKVWYw9xDozXBU9/ICaX/lhJ92bmjIV9BS59PzhR1lvuMqdGjm4tm2dFfOMz7tZqyJlLCeHKEP0f0vY+ddlwrsscG5pK4Q5mFWOjyeNcioqaAoRLrvnLcJ+zXPfKY9iqp94BMzjDXM2XmQqUEjB4GJxp/RqT0PYoVL13h9Cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790521619; c=relaxed/simple;
	bh=ROvVLsAWWZxTQsLfqClfhbwIw0ODqKrmuaWsIVnaKbQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iDy2NC1Gj/xrrjUGd62KP9fxtHPIcHtvM3JG7zsWhHe+kgBpbpzz0oojDAqQyJRvNppIp7+rPSsLTUng889MPADJK9q+VEoWMgnSTywFywgkIQoth1NGQBmrIYpAqoYLtjj7P+ycA4r7qL/CJKfL1yj8bv5JKbcikoOQK2itNpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=INjnGC/q; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="INjnGC/q"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-482f635552aso1764412f8f.2
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 08:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790521616; x=1791126416; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CrMFIXOrRMNN8CamXouNMnZGLVuoBTeO83yFUevJuik=;
        b=INjnGC/qXsOUC1/3/1t0+elj0LKt1D/0oqs4/KHJDXkgWvCbSlS9yYurNIfiumZygK
         EL6orVHaOwP6Aymbnu+AsDk+0b62l3zgggUfrTENVQxNTEprhOdfEYvCGDyNgPqmBPzw
         OP2EcR1MzjmDut27XlMAeawIt2z+vR4+r59SywQfuCDyMd+GZIYFt8NBlMrKcaSeYA7e
         EIM9tpp8lXp9NHAdfn63LTkoTrUlTw87rCd/Q59Pcj4+tS3OaUkqqt0HPG7kgkdYkBim
         D44h1c0n4VlgrNfblFwxg8tRVuDEU4ZCzYwuHuUvu85BVqYJDhiGIfxFFWshKz8J0TJ0
         AxNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790521616; x=1791126416;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CrMFIXOrRMNN8CamXouNMnZGLVuoBTeO83yFUevJuik=;
        b=VkO5H4Fh7B7J9L5jBJtRcx94i1bX2PF03QhfN3zWKnrnXUUqs1HvwX0AGJXf7l7NR8
         SNabh/WH7mkTui7UU22wlliXjHDP8D/IUMpP8My3aW6BKNWdFVbKAt4bxjrjIFZb1RTF
         AAwacwQ5OrfexGv0hBIs+yXlIDSZ5X6wATLjqSzsQuGaMP3lunFBLZnc6Vb2SdUEQMx9
         zx9vR6n23WUSaL9siGS8lSyyDN8zFY9Z1mYkd1Yg/Kbqx1vhW+uy2pKVCLCAIBBdGq9E
         /l7h34bPvMmyDAs0kI5eWdVtfV1ozPsJ88r6mGUlh4E+quYYUzYtCtX/DUvhlnUx2qI4
         +6IQ==
X-Forwarded-Encrypted: i=1; AKwUvBzHybxhGLIKpM5dyEZSFlmWO5FSsRUmIcWzfSK2dLXgj3mrIruywYICpsujITqDGh8OY6ntReP1yxaYNVM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKbaUrEUiMHHNySdIBo1pF0UEyivN96ZrSCHCh2iPnOZEb+7swb
	+ghCh5UWZXy14Jmw+oP3l1WXovw/dydN1Kbt0/UOQdgQUE7KmajQSINc
X-Gm-Gg: AYBFou29FNW/EhI+mMhBzcMlhBSxTAD1Ypo0767oV7FLmXxxQgiLnNXQA3UEwoBpqqZ
	6UDlBU2aTxRnZyhNcEAh/+a2kwa7J1BZ6F35KDHSBjgQDGicifs7hj4woDVMCHjnUrrvYjSjnWR
	ZaXvlVr56I4aQ6+WHxccjjNqvxPo/AczsdvmRbpAIGGQqPGZVIHv1lCxBfh3EL9NxfL36wWBi21
	6BDw0/KkcyWCY6Iv823vo51Dv4QvVS/gwRjUlBBw6qOEm+9RcaKzcITVoeXmKGDOJLRmhgRX6MG
	kz4N0IxlHvV/seTznSQDTWwAXehgRPbxgieahC4NCmOpVw9f9wXBtOYwin31NfdkRU6wiX34F4t
	mcEtXDOCZMrPiC0ZJJS9f9t8zNrEnpL7A1U2d3stzGxbJJCLEVpSsuRrtQODz8Rc/Dytfzs8SfU
	Wv+nacSq6MaHFn2tzCBE/3acUpDo7VwW1MCwQjMN8n6rBt33/QfbY1vtkLw/KCIHbTQkP9xA==
X-Received: by 2002:a5d:5f45:0:b0:487:2347:817 with SMTP id ffacd0b85a97d-48872abc804mr19369239f8f.33.1790521616280;
        Sun, 27 Sep 2026 08:06:56 -0700 (PDT)
Received: from gmail.com ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a34a638sm20467465f8f.9.2026.09.27.08.06.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 08:06:54 -0700 (PDT)
Date: Sun, 27 Sep 2026 17:06:52 +0200
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, 
	Brian Geffon <bgeffon@google.com>, Minchan Kim <minchan@kernel.org>, 
	Kiryl Shutsemau <kas@kernel.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Subject: Re: [PATCH 2/2] mm/mremap: fix locked_vm leak by splitting VMA for
 MREMAP_DONTUNMAP
Message-ID: <arkuBw_l6iL-VLuC@gmail.com>
References: <20260920-fix-dontunmap-partial-self-merge-v1-0-6ffb556f8f8b@kernel.org>
 <20260920-fix-dontunmap-partial-self-merge-v1-2-6ffb556f8f8b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260920-fix-dontunmap-partial-self-merge-v1-2-6ffb556f8f8b@kernel.org>

On Sun, Sep 20, 2026 at 03:13:11PM +0100, Lorenzo Stoakes (ARM) wrote:
> The MREMAP_DONTUNMAP feature is highly unusual in that it permits mremap()
> operations that keep the original VMA in place.
>
> Historically this has led to a lot of bugs where non-obvious interactions
> occur between existing mremap() operations and the original VMA.
>
> Fix another of these - partial copies.
>
> The long-standing mremap() partial VMA logic has the baked-in assumption
> that the originating VMA is unmapped and thus moved.
>
> However MREMAP_DONTUNMAP defeats this by performing a partial copy
> instead since it keeps the source VMA around.
>
> An mremap(..., MREMAP_DONTUNMAP) operation disallows resizing of the VMA,
> but the operation can be performed partially:
>
>                            |-----------------|
>                            |                 |
>                            |                 v
>                         <------>          <------>
>                         .new_sz.           new_sz
>                      |--.------.--|       |------|
>                      |  .source.  |       | dest |
>                      |--.------.--|       |------|
>                      <------------>
>                          old_sz
>
> The page tables in the specified range are moved, but the original VMA is
> kept intact.
>
> This interacts poorly with mlock()'d VMAs, as the VMA_LOCKED_BIT flag is
> cleared for the entire source VMA and set for the entire destination VMA.
>
> This results in an mm->locked_vm leak as the change is therefore not
> accounted correctly.
>
> The clear solution here is to make the portion of the source VMA which is
> mremap()'d distinct from the rest of it, a.k.a. split it.
>
> Therefore resolve this issue by splitting it ahead of the rest of the
> mremap() operation.
>
> In order to make this change re-expose split_vma() in vma.h for
> CONFIG_MMU (nommu doesn't compile mremap.c and uses a static helper
> instead).
>
> A quick search of how MREMAP_DONTUNMAP is used in the wild suggests that
> the partial case is either unused or rarely used, so this should not result
> in unreasonable VMA proliferation.
>
> Since this makes every mremap() MREMAP_DONTUNMAP operation operate across
> an entire, distinct, VMA, also eliminate now-redundant code checking for
> this in dontunmap_complete().
>
> Finally, update the sys_map_count check to account for this case.
>

this also LGTM.


Reviewed-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>

--
cheers,
jose a. p-a
