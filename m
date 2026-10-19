Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792448222;
	b=si3WyYSKedPrIcbmjEG8n1lWv84NICcDFIadtUOMmxvaO2YjZbAZ4FMmudDLRsMDda7a
	 1NBv5h3kfoVXZq63SOaJcrHB7UjoacqVriU7FMYpF2+BqZa2KLIJb6vVLifdHo66OkAsA
	 R78ea4zkhlXoYRXIy8o4CklGv7wFO2IM2D83Y17TeoHZn2ZG3p5eAV3iABJsh0741EPYv
	 pBPNjBKer/2+4N2WA02d/sSNssGa9niu8WCtTSwUCUnhQitYvKJZB/Igjkzt964ngjHYq
	 Yhf0kGpTP7fF6RDvcoKOzSAJCfnR3mmX7Up7+55ueguyftXsIaUytRlccgoG7lNgImw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792448222;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=zRJTeMWmwyeteHSitD0X0AULZiFtm+NfCHUhoRCgyVM=;
	b=e/I8gj+hRkdunrkuXMe33ZVZxr9iTx+xb1UtGl3EZEMVouESsTbfFf91srUWBWfuU3O7
	 JH46dUFHsZ7DcgHLH9jaJVmDckQcOfVLqHKEt/9mOD8ODSxz7f+XpWm8/v87MlFImbyAE
	 nMYC+31yEs7kch1SSwC/ngjjha9YiNl4X3JLAuGa2Jf0+50LJIDawBSDlZ3RZEtfkAqUh
	 SUaNbrp70GMex/O2knzDL+fcEb2xQESWVw8Rgxz0I20b9VHmjYqutcUzRuTk1+HjeUg47
	 RpfpinJmRDu6KVaAoizYgQIVW27VO7r1U5VjVaJWcM6+SXRpFI5jogMNPRbIc5stnAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="FIwt/DEw";
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=pgNB6bJT;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 153E3606A319
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 22:17:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 153E3606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FIwt/DEw;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=pgNB6bJT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792448221;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zRJTeMWmwyeteHSitD0X0AULZiFtm+NfCHUhoRCgyVM=;
	b=FIwt/DEwBkbYwoebF3ElzJh2ggGIbj1qzKba4zO8AJ+KpXMYsMrQgg0nblxRYWPWY7TJw8
	jEukznh5LrpvaID9LwxJ2uJrsFHs5Pg5Fb3R/q9dUClFDvTkVz08ZdrajBLGQKo8gpVc2N
	y8ja05GDLpU875yhcsuQvpZi4VQUiTw=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-625-D79OMSL1O9aU-hMigVRloA-1; Mon, 19 Oct 2026 22:16:59 +0000
X-MC-Unique: D79OMSL1O9aU-hMigVRloA-1
X-Mimecast-MFC-AGG-ID: D79OMSL1O9aU-hMigVRloA_1792448219
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a3f673221so965147485a.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 15:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792448219; x=1793053019; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=zRJTeMWmwyeteHSitD0X0AULZiFtm+NfCHUhoRCgyVM=;
        b=pgNB6bJTeVm+ECMjWtESp2dfpouBWGGHhEkV2pzYr9op490zYFYmi2XRIGoEt8mk95
         iQBI5c4W2+aQcRCBDEmuE2TbxsOpjCUGJYFwqaqn6GXyU3cCXbmOiaCRDcAqUT9rWxCP
         3VPYztIUZJg8vjw/BasvSaFRSeBuRgQ8FfsN8XkCqmaIWVd6Xv+rijcIQbTRUskQ0xcs
         UTpKhi28zTRoGevzaAuUtXbRQQuyo4+Njrv966VEIijlc+yUUfNssoP1ggWXmDxelUs7
         vd80/Qj9wPnU4QeUl8oad85nIDq1x3uge70Hoyl82d/2pQ3L6YI8+z+g2PsehX9svTFF
         +9qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792448219; x=1793053019;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zRJTeMWmwyeteHSitD0X0AULZiFtm+NfCHUhoRCgyVM=;
        b=Z75+SFJ4X/6xz0vp9URlrqUxPu+SO2DsaNjBfRLc0i2HLTdmdaV7nt5vHaapNWEcA/
         CmUqP28X5D+TJMGem4a7m2EwaSIzgug6gkDEi/UJMb1+n6IMVSLz9o5O6iD3L2m2Gcwb
         etj13EGmj5Ye5EK+difTewKwoPmSsSkRQ5p7BTKv2n0swTnYhXvNZSJzzZGTGr/KtlbW
         HhATIUDFtN17Ekvpp8NEWAQCra7gH1LUQfjB/PjLflPE7W0nDEs/jGMkw7Wn5RGNxoMy
         hoOBLYRYCOzwEzrkdO4IncUOkY4dtNUoJKLd7JeNtdtDRJGvC9GRFycvI3JxdZV68F+Z
         YwCw==
X-Forwarded-Encrypted: i=1; AKwUvBxu4ufKdxoqNF2G9wF0U7cAF/4XOP5obimCT5K2OiFEsQx2M9b6JJChI3eChjWfC6dJlSE5TRkj6l9fl/Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ89gv66LKIuhU/B1Ef45PLFKyCYEo1eCqhaymHPpMmVf3AxYYJ
	nJLjxxNYp2fTYeHVP4MOwupi8IjGJhxBe7Go6t+c1RmDLitL4gPUeuNNv2bcyPUwsVWj0P8WoLJ
	3l/ekGgxkgU1AqPeb6aRp9QP3kwlFDARRMff/qe9iwlYD8VVNNPO6HJbmCZV1mxSHYw==
X-Gm-Gg: AYBFou0h7LNseTYcZULtuaBZ+wD+hlhUTRCG99vFr0GBRmw4gmL4tB7MXvw/ifl8MQ4
	NgUeoNYALS0QqZbjeRZyzuKKu3wN7QQiLGr+3A+6ggQzepV6G/iOMQEp9yJHug3jr+5D1qrK5G0
	7hhQwNEG2vs/6z5CzXja0EAWpnOsIts4ZqLKkCcMEDPDHZJcbScyU5FX9H3QgvJzU4T7Hj9nG4v
	uIDxW7I0BYvbO1TIfTf77wovF6tKUcOCj+7l8/h6DdiVOb69YYPAzBHDcuZpcJmKKyHPnkcrIkM
	5/VlvdibCEWWB3Zd3elefWSwqCNjuUR2p3ZRFZeNAoXhNAO9iBHl3G/kTWOOJqslZlOeer75jrp
	cUfKTavXBsjKAGoTiFugJm/P7Ru8=
X-Received: by 2002:a05:620a:444b:b0:93f:47fa:b727 with SMTP id af79cd13be357-93f47fab7d0mr334484685a.28.1792448218920;
        Mon, 19 Oct 2026 15:16:58 -0700 (PDT)
X-Received: by 2002:a05:620a:444b:b0:93f:47fa:b727 with SMTP id af79cd13be357-93f47fab7d0mr334481985a.28.1792448218430;
        Mon, 19 Oct 2026 15:16:58 -0700 (PDT)
Received: from redhat.com ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c0405ec3fsm7982966d6.7.2026.10.19.15.16.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 15:16:57 -0700 (PDT)
Date: Mon, 19 Oct 2026 18:16:55 -0400
From: Brian Masney <bmasney@redhat.com>
To: Nickolai Zeldovich <nickolai@csail.mit.edu>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] clk: Free the parent map only in __clk_release()
Message-ID: <ataW1-SGLhXJIcBB@redhat.com>
References: <20261016164050.790594-1-nickolai@csail.mit.edu>
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
In-Reply-To: <20261016164050.790594-1-nickolai@csail.mit.edu>
User-Agent: Mutt/2.4.2 (2026-08-30)

On Fri, Oct 16, 2026 at 12:40:49PM -0400, Nickolai Zeldovich wrote:
> clk_core_populate_parent_map() can fail in two ways, and since
> __clk_register() answers every failure with kref_put(&core->ref,
> __clk_release), both end in clk_core_free_parent_map() walking a parent
> map that is not there to walk:
> 
>  - If the allocation of the map fails, core->parents is NULL while
>    core->num_parents was already set from init->num_parents.
>    clk_core_free_parent_map() only tests num_parents, so it reads
>    core->parents[i].name through a NULL pointer: an oops.
> 
>  - If a later kstrdup_const() of a parent name fails, the function
>    frees the names it copied so far and the map itself, but leaves
>    core->parents pointing at the freed memory. __clk_release() then
>    frees the same names and the same map a second time: a double free
>    on top of a use-after-free read.
> 
> Both arms are the -ENOMEM path of clk_register(), clk_hw_register() and
> of_clk_hw_register(), so of every clock provider in the tree with
> num_parents > 0. A user sees it when a clock provider's probe hits a
> memory allocation failure (in practice under fault injection, as these
> allocations are small): instead of the probe failing with -ENOMEM and
> "failed to register clk", the kernel oopses in __clk_release() called
> from __clk_register(), or, for the second arm, corrupts the slab
> allocator and reports a double free.
> 
> clk_core_populate_parent_map() has cleaned up after itself since commit
> fc0c209c147f ("clk: Allow parents to be specified without string names"),
> when __clk_register()'s fail_parents label skipped
> clk_core_free_parent_map() and only the later fail_create_clk label
> freed the map. Commit 9d05ae531c2c ("clk: Initialize struct clk_core
> kref earlier") moved the freeing of everything into __clk_release() and
> pointed all failure labels at kref_put(), so the map is now freed by
> __clk_release() on this path too.
> 
> Make clk_core_populate_parent_map() leave the map to __clk_release():
> return the error without freeing anything (the map is zero-allocated and
> kfree_const(NULL) is a no-op, so the partially filled map is freed
> correctly by clk_core_free_parent_map()), and have
> clk_core_free_parent_map() return when there is no map rather than when
> num_parents is zero, which is what clk_core_get_parent_by_index()
> already does for the same state.
> 
> Found by formal verification of __clk_register() against the kernel
> binary. Reproduced on riscv64 under QEMU by re-running a fixed-factor
> clock provider's probe through its sysfs bind file with failslab aimed
> at the parent map allocation: the unpatched kernel oopses with a NULL
> pointer dereference in __clk_release() (clk_core_free_parent_map() is
> inlined there), the patched kernel fails the bind write with -ENOMEM
> and logs "failed to register clk". A userspace transcription of the
> four functions reproduces both arms under AddressSanitizer before the
> change and is clean after it. The clk KUnit suites pass before and
> after on x86_64 and riscv64.
> 
> Fixes: 9d05ae531c2c ("clk: Initialize struct clk_core kref earlier")
> Assisted-by: LLM
> Signed-off-by: Nickolai Zeldovich <nickolai@csail.mit.edu>

Cc: stable@vger.kernel.org

This looks good to me. Can you summarize the commit message since this
is a bit too verbose?

Brian

