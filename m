Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9EC53DD86A
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 21:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791494634; cv=pass; b=sTWq0TXtV3VUZO2LMIxcsFEBmeWZrYIHKcxRrlBgpqxga1ZiE61rynmJqi2ers8pOE4BTGkqVt9KlejUYf0BrwZDwqmzUxonTssi/FHA2cAS4x2rvjv2+UaXEVaH5jlGiUQo2GDUYe+brdgvavU3arirIw7y1X8eWV6CB5+Suuo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791494634; c=relaxed/simple;
	bh=M6CM2xvKkSIlGXfDQ5IHgePPERx3aiPmGN8gZP5u0+8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GF24L56eUQ2n24p7dU4mj22Lq3Ummi9r09L0oUB8fQuF8Vr0iZ2QLx4Hb+gIn0k8MqC1WpQzfBOYEawb0ZakDMkwBozsxx+89yrl4owz+6BOupE0A4jzUl43g6N55+9nhXLmxBlw1T2kMnbgrkujJ9nQCIBc1DqPbDcRiwEr5cU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jg6zPswR; arc=pass smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jg6zPswR"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3a20f06cce6so16845221fa.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 14:23:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791494631; cv=none;
        d=google.com; s=arc-20260327;
        b=TpRYHc1oqEOpTPAznX/AaaXmEcpeTBSB7kW+tpjJw22JjEL90ToVe6oH6Dp3/MWtGi
         n1CMJFbcQKEAzVjOz1ePjIXOm7s81xZxJ1xsW2zKVBIMGvTixwiJERHZ3teD1lXeIt/P
         GEXV3+mN8c+7v023W3ig7fV/Td/ylCHoyby1TonUnlvsy4cclOjJonXOFB6xNwNU0JW7
         TRwilTXQBpqpPhleJKzcwA9Bv3CUd5sMF2qZmwsrbiKESfdSj8ro/b/P42+1hr2d25H3
         vwiBrRVXlkp2OveoRes1IIB98ogbT2FjX1AoEjQfyi7U1Wg7Yl/vUVk8KOl5OuewwJ0+
         x6hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=M6CM2xvKkSIlGXfDQ5IHgePPERx3aiPmGN8gZP5u0+8=;
        fh=H7ypoDQFyd0xpQU0fYbU1dqaOGBnzHXhtmwbf9yrARo=;
        b=bCqEVxc4gEluSVZdi32BCmrKTSKMqnHJe9ofr13fiIu6SGLC4jGElCxvETRUVC4H6a
         3CXa/htGw8NZpAFMIPPDGphd54tNCOVWj2zPMaHi7eye95ORaN4Jq+qntBxp5n1tKwyD
         DTrcSlJx0fvOaeNTcGwynBvu4gc0gf0xX+DtHqQxNSm/GkWew7LJHi/FCbP+Ev07TRtF
         oSRK3qHg/g054887IukDVKNS+ZpxNt+xG/fzVHXrPSSggBJq+GRtMXwdJi/bX3m6eZGK
         tR8IW8MEzqeejtjDKg+mg/EzVQewh0fE285JqqVFyyTGrIenDhZ8cS7lmzov0NjtIeki
         ARfA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791494631; x=1792099431; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M6CM2xvKkSIlGXfDQ5IHgePPERx3aiPmGN8gZP5u0+8=;
        b=Jg6zPswRk7LD3wZsJhgpW4eZOLFNFHVaJC9q7DLrP9cMsnLVynY0AiMQxOQAD/Hxzj
         gDp/NMiDTeAg2ce+GZTMcrD1HYArtanEzTdOMPe5gkSg7DzIbC3NmgwvIBx94LVeH3Mb
         qwDe9BM+GUthz2PW3BQVHce7VLFdfyanxMMoefDY05qu1KDfVXztfn5tZDpaRfvWeDVJ
         BvzfRKNb4aDEDtMD4sVPj7TXhj/nZhbA9irxlhrSiMOT1AvWG254rI5D02wdpn2IWGq8
         kC0ykcXH+0+K2Mco6XCYw9YPcL6u/K/B5UTyffxvCtTKq9/ndIvaVkcqzb1l6pRrzJfs
         IbjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791494631; x=1792099431;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=M6CM2xvKkSIlGXfDQ5IHgePPERx3aiPmGN8gZP5u0+8=;
        b=U9KqjN4Yo38uyd4/fdoTiaGGxpQ1aoD6VZQLAi+pP0UQUY2IkFbnQBU9Ix2IlBTfa5
         xPm6k1vdmKrk3jcsc3SU4Qs28oHZRPa2YO5teBfn2uzJtwqfX+ibZvwGNS8XU4z12dhL
         ap62qmZPmGFGzDLVuV2Wa8eDZe9Ih8YRo1mUfnA57D8bAJZh4Xkllakpqk04KpQYJ6Z6
         PiFsW0gJFIqAny4Pylxadf9P+bP33meo90fONVOY1l6oj0V/tWtkVVRs+SkF5ncaxVWF
         VMcAMHzXLaTn2zuukOELNlpo8QS/12zzXt9wnziZkq6UJnIMi1ZQHqFDYI3hwxIIgCBJ
         wR4w==
X-Forwarded-Encrypted: i=1; AKwUvBzaFrUeLwFGI1V5MrM4VCzs5PKY6hmhXmo3D4V03PnMUAOJM0iWOGNrjhXDrShJmLOkExh2+LauF9PUc9s=@vger.kernel.org
X-Gm-Message-State: AFq9FYKKuPMH6mOZiw2xwRA8nSVzgqHDCjAAArdBNeT80MDjeJhc4u2R
	c4JmCJJ74IiW7Up3bf417majawU/Yu3RavL7xyuIyuzrbjf+uAqYf9pmxKfAahSFGoZKW+fT4dB
	BhjiqbQAldo7wlGxOMUTRIZObOLcUWjo=
X-Gm-Gg: AYBFou36jJUZ4GGbeqg6kwr3DTWCvZ3+8h0rn8VuynrQeyP4w+Lu/UtbdeQQgfyZwns
	7+oTtZkpAV6Lbk9hrTcu6pboFOPBmJl2hGwqNfFiRLdCvjiEWRFQoy1bDc0LPIO9ZqplbjJCEwu
	uieV3F7BE1I5tIdTGvzRlN8EJN/MxOJ0WFyMktophqvaZaii5qAIlOVFxdlDuTcBHR6V3cMgWTH
	ijNuSagPMBOuuii0NkU3ApOd1bp3A3bcoFTYo0kJ6mERVfRCeFModKQabFYEKHsuKYWw90y1bG+
	QAMf2rZzLMh22v0bPe3HB2nG0Pwa9yQW6ooqDr40N3LQHwHbb/txZqFSkKF1BOr9FRHIEto/Uxv
	/7J3ZoILlUxqNXfA=
X-Received: by 2002:a05:651c:542:b0:3a6:5b56:8106 with SMTP id
 38308e7fff4ca-3a9c2c3095fmr906041fa.22.1791494630493; Thu, 08 Oct 2026
 14:23:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261008195608.965266-1-linmag7@gmail.com> <20261008195608.965266-4-linmag7@gmail.com>
In-Reply-To: <20261008195608.965266-4-linmag7@gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Thu, 8 Oct 2026 17:23:38 -0400
X-Gm-Features: AclHuK89eYiVBvE5Lrwb__hHWrXIWel0f50BxkAl9nePVtCBE9ELUZ7tgaAtMas
Message-ID: <CAEdQ38GMc=aH6yQpSGFvXpNZSmvrU7uzKqDN+T2W8GfqDchQMQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] alpha: do not skip TLB shootdown IPIs for
 kthread-borrowed mms
To: Magnus Lindholm <linmag7@gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 08, 2026 at 09:55:18PM +0200, Magnus Lindholm wrote:
> A
> CPU that does have the mm active keeps its slot, and that is the CPU the
> IPI is there for.

That includes a CPU that only holds the mm lazily, idle since the task
migrated away. ipi_flush_tlb_mm() and ipi_flush_icache_page() test
active_mm, so it takes flush_tlb_current() and publishes a new ASN
every time. It stays visible, and each flush_tlb_mm() from the
single-threaded owner sends IPIs again until that CPU runs some other
user task. munmap(), mprotect(), fork() and exit all go through there.

Testing current->mm in those two handlers, as ipi_flush_tlb_page() now
does, would send the lazy CPU to flush_tlb_other() instead. I have not
measured this.

> A CPU that publishes a context is in turn ordered before it goes on to
> access the mm, by two different barriers:

check_mmu_context() is a third publisher. Its __load_new_mm_context()
takes a slot from zero to nonzero after finish_lock_switch() has
dropped the rq lock, and nothing orders that store before the return
to user space. An smp_mb() after the WRITE_ONCE() in
__load_new_mm_context() would cover every caller.

> So a CPU either already holds a
> context and is seen here, or it allocates a fresh one before going on to
> use the mm, and a fresh ASN carries nothing over from the previous
> context.

There is one way for a CPU to run the mm with its slot at zero. When
ev5_switch_mm() allocates a new context it does not set need_new_asn.
With the stale-TLB series, finish_task_switch() enables interrupts
before check_mmu_context() runs. An IPI for the mm taken there sees
asn_locked() and calls flush_tlb_other(), which zeroes the slot.
check_mmu_context() then finds need_new_asn clear and does not reload,
and the task returns to user space on a live ASN that
mm_context_elsewhere() cannot see.

Setting need_new_asn in both branches of ev5_switch_mm() closes it,
since check_mmu_context() only reloads when the slot is zero.
