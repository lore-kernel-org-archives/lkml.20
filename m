Received: from mail-qk2-f43.google.com (mail-qk2-f43.google.com [74.125.230.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7810A4334D0
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 16:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790008748; cv=none; b=QdoSCGsIwkpS74QCHUpKaYcIBSFzG3paZjtPodXdrl9z6pbg1rw9B1lPlGuoKVBKR9CFyytl5GH2Q2xA5E8xZWeHdDAC8bRjZpOUkNUy0Qric9B8YHS5dr3LpyOaL8DV97tirJHlYwOUwJq9+OOtl71cohnGxPeuxBDA3jgN9ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790008748; c=relaxed/simple;
	bh=xlwJPjp7OzLrnPfVNoCfKO2PQWRt8wVlhsJIn40b1Lg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vFcuXWgyYHJQTzYYOnB0YvQW6tTkVFnMMp4rsBOheZMlOXuDVa/Lsy69g2xokTk7G7i0dTP2yocqo8xJLApuMc+MqlGTANm/UtBxOwu20gc3On0mW+VHVjrNDWFUeyCAETkhv+r2THmG9irZUgSiXhDnyhmuEV2avhUPKvt+9xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=OnYbIItr; arc=none smtp.client-ip=74.125.230.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="OnYbIItr"
Received: by mail-qk2-f43.google.com with SMTP id af79cd13be357-93910a0cb7cso246780085a.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1790008745; x=1790613545; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jHNYxc4ofRbSyKf1aiBAvHcEXeXrXDYKaCYPOfwKjFU=;
        b=OnYbIItrfgQnyK1QbjJSxvdRxDjzMG/Amh1p/svDxEhQLoEaLqAIAtpuiMuUhoZ+Aw
         Uo/lTKcdmp1/fZUq/qQJG9oG1YUzRlMJwcG22EU0cpsbz+Fm0q1NJYZFQC6B6xqr0tgG
         Y4WFLAPATdV3uyI2PSkxb/mDHsj3k5FXSC8eHpZaw/8uaFdXV88cXwkUgj3aanFzqtvA
         ovxNLv+TarhyIMXFoL5xN/JwcmfqjHy+oK1728Iqw2sRxAMilpx6SqNCiljBwBmUpy5x
         b63Y+xd19+h14AHaxXs36pmaNZDmjXRSGgpZgfQvkmIQOz11WJTVCekuO8RqrGq72Uw2
         bVbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790008745; x=1790613545;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jHNYxc4ofRbSyKf1aiBAvHcEXeXrXDYKaCYPOfwKjFU=;
        b=Sii5wp3Khx7p5br3YWAexZ4xqtZ2IBMmh8oAt1tnF7Nak6w5Ao2fdnjMx0ARCqNEvn
         Ua1evnVMvZ9zfOpXmm1ZYs6LALr0Ktr3eEIra6lPG7vfzSB3HpLdqoPg/ZIs4fKkhBxk
         tzvtWBE7Far8sGlz6xuaoTBWceuhJ3U+NC4lDKzH+yfyWguYXcN/Ot2zhVELpa3v0TU8
         7fSUhywvida7l6Ch2sXqkDm7QEL1nQrlhccTqH8V82csOYkb2pm0we6fDcSE03MHYzel
         6Yg43mx4eOjfEKVKZr+1rBY+qAfYyOMnbr6Ln/jidTdA3DFah9co6ItAJ3AljRxVVwmf
         ahqw==
X-Forwarded-Encrypted: i=1; AKwUvBzAPZIkdXQkCQlnBQ8AXA6t6ZgxKx5RL1i/28pChinjZUc+UlEuIxs7DrkoMeoSr5tm4i2lc+9ysfhfRws=@vger.kernel.org
X-Gm-Message-State: AFuF++mRW/RLL1RMnOmCKJ8SST2QA6caHxpuEWqpiyZJc13MCjSS73WK
	Wa+4kZJEbq2b6nlyQ/10GUfds/2/pY6qbHo/Q3IE1GMEoAyfuHLO0MxlrBuKtfl04Wc=
X-Gm-Gg: AYBFou1Tf/xdwoxjdo1EN6fRmchoXTexdkoq36wnzssQKWGL2rSc14fXzHzCHMQkoTI
	ebk4+GQnlAkUguhbk0kV3kiA+iXBtl/XWqpoSsC3THLijC/zR81yurZGjQHgt9Pk3W3JkIiss2b
	Sh0L/yAC/hzX7GL7niRfFcWtJ/ec1acyfum/MByqtZM34zdy/Wa5ohPvOkemhgOKaA+TTfwIMGF
	x+hgOykuk9GSFl1164U4zOrXTAST5nipXK9uIQ8hbU4pgkHkI0+zG1X5Kh5x8qDpIcmAnyBfXit
	G1mJqDK1MkjcYPraQZhBPGsDp7QfL1DOUyFBvq0yEHUZcV8lyf5yIFHygMXfQO/WMsJjdty9QhJ
	c7xHj06AGCN4yMIP1QZs4OWBGBCNal9BW++kQ/AUP5Wpq4FHbd11dY8Dz3Ukv/7eM0r1/OBsedk
	Bt1469H5dmaIoeRX/bLwtwwSaICrGtbLozQPUNWbCf3A4/mU7kF6RqEePNMT3WlWNJMV0TFhr+f
	Mv4cZZGgX1E3w1HdzRiXro=
X-Received: by 2002:a05:620a:46a1:b0:93b:d7a2:83d4 with SMTP id af79cd13be357-93c15f2ea2emr125179885a.67.1790008744843;
        Mon, 21 Sep 2026 09:39:04 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F ([152.186.177.174])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93befd5c2d0sm675442385a.4.2026.09.21.09.39.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 09:39:04 -0700 (PDT)
Date: Mon, 21 Sep 2026 12:38:57 -0400
From: Gregory Price <gourry@gourry.net>
To: Zi Yan <ziy@nvidia.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com, 
	akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org, liam@infradead.org, 
	vbabka@kernel.org, rppt@kernel.org, surenb@google.com, mhocko@suse.com, 
	brendan.jackman@linux.dev, hannes@cmpxchg.org
Subject: Re: [PATCH v2 2/2] mm/page_alloc: refactor build_node_zonelist() out
 of build_zonelists()
Message-ID: <arFaiV9iVgxIsZ1g@gourry-fedora-PF4VCD3F>
References: <20260912030424.2889731-1-gourry@gourry.net>
 <20260912030424.2889731-3-gourry@gourry.net>
 <DLKNHNP6LH59.3MEEBCAJGFEVK@nvidia.com>
 <arCeH_aD5PUM1tNE@gourry-fedora-PF4VCD3F>
 <C7A2977A-CDD8-4EEF-9448-A130411878B6@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <C7A2977A-CDD8-4EEF-9448-A130411878B6@nvidia.com>

On Mon, Sep 21, 2026 at 12:18:12PM -0400, Zi Yan wrote:
> On 20 Sep 2026, at 23:29, Gregory Price wrote:
> 
> OK, ZONELIST_PRIVATE and ZONELIST_KTEST are not upstream yet, right?
> In theory, the new zlidx can be added when you add new ZONELIST_ types.
> 
> I am OK with adding it now, but you could mention this change in
> the commit message to avoid confusion. Something like,
> for bulid_node_zonelist(), use ZONELIST_FALLBACK explicitly.
>
...
> > And add a BUILD_ON_BUG/ASSERT that forces any CONFIG_NUMA to have
> > balanced zonelist additions.
> 
> Got it. Thank you for the explanation. Are all combinations of
> {ZONELIST_FALLBACK, ZONELIST_PRIVATE, ZONELIST_KTEST} x
> {N_MEMORY_GENERAL, N_MEMORY, /* private only */} allowed?

Slight inaccuracy on the way zonelists are actually built.

Every node has a list in every zonelist.  The contents of each node's
list in that zonelist are limited to the candidate nodemask.

So consider the following nodes:  N0, N1, P2   (N=normal, P=private)

With the following candidate mappings:
   FALLBACK = N_MEMORY_GENERAL  (_COMMON)  (all normal nodes)
   PRIVATE  = N_MEMORY                     (all nodes)
   KTEST    = N_MEMORY & !N_MEMORY_GENERAL (only private nodes)

FALLBACK
  0  :  [0,1]
  1  :  [1,0]
  2  :  [0,1]  <- private node's fallback list is normal nodes

NOFALLBACK
  0  :  [0]
  1  :  [1]
  2  :  [2]

PRIVATE          Accessible via ALLOC_PRIVATE_ZONELIST
  0  :  [0,1,2]
  1  :  [1,0,2]
  2  :  [2,0,1]

PRIVATE_NOFALLBACK
  0  :  [0]
  1  :  [1]
  2  :  [2]

KTEST             Not accessible via any flag, completely isolated
  0  :  [2]
  1  :  [2]
  2  :  [2]

KTEST_NOFALLBACK  Not accessible via any flag, completely isolated
  0  :  []
  1  :  []
  2  :  [2]

I haven't posted the ktest series yet, but it's how i've made the page
allocator ktest-able.  Ktest is empowered to set the fallback list
directly rather than requiring a flag - not something any in-tree caller
can do - which lets it limit allocations to a private node and makes
mutations on the pgdat for that node deterministic from test-to-test.

Works on UML too, so testing is very fast. :]

Apologies for the added complexity in the explanation, but I figure it's
worth spelling out.

> Any enforcement if not? This is more related your “private node” series,
> instead of this patchset.
>

These zonelists aren't something we're going to allocate dynamically,
the enforcement is encoded in the function (build ZONELIST_X over
candidates N_MEMORY_Y).

> >
> > But I don't think it's strictly necessary for any of this, and we're
> > just shuffling code from one place to another.  Probably I can just add
> > that improvement when we add the next zonelist.  In the meantime - this
> > makes it easier to add new zonelists as-is (and just makes the code more
> > readable).
> 
> Sure, no rush.
> 
> Feel free to add
> 
> Reviewed-by: Zi Yan <ziy@nvidia.com>
> 
> after you add some text on the added zlidx in the commit message.
> 

ack. hopefully the explanation above helps.

I will work that into the commit message in a reduced capacity.

~Gregory
