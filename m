Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D8D45A29F
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 17:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788800623; cv=none; b=h2rKUR1pENh1IssR3tIxJmHNJ5ykOn5YexzV7AXfTDwrB6I6AuZ/38RZlvYXl4Jfp92eVND1uZUkWZNJIzC17yXpD8vEsdpEmMQkv3rlHmeZ7UGxxF42yzMypMIxVs9B7nkhaIiuqGB4H0gQQ+8fd4eHaBykBu1W/UXv4z0B458=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788800623; c=relaxed/simple;
	bh=yci8SCVSj/c4byzd49bd5AwR54pen4y2tBI3v+juCjg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Etlf7LzZsjD3Kx+m69AQSZEG7N1S0THpuUrF3VmYcjwJlY9RzJDILVSKYUJGpiSXvmcqMpq7fgJu1KA7/pqqH7O41sLmrf3gyZZFbpUPmdGm8s8XnzkyRBX9VWHrzaGPKdxMsVO1XILFZntfY2yz4avgcGH5p4glhtn1Fsdzr4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wJMQObF6; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wJMQObF6"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-485843aeab8so4218186f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 10:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788800620; x=1789405420; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=D/2WLxDmERbGCh7iT/2ZThPPuDMwAWqV6GCdXRr20bA=;
        b=wJMQObF6YepA9UZYqOKJ6OlmLVKwAG1KYnrsHmyuGWC9/myR6Z7Hq7zJ3cLuh7FMYc
         OX3D2AGcJwFf9wDUMNIFV+iwLOYac2S3eciZLIK/NL3FDi4Y/PzHU6q4LXfHMiGeX86X
         PL3JKuo8nZRzMcg8aKlfcSStfeMe0ul03xc+20IzH64ewXXn3FxVwa/8llWX3YrSCQym
         mX1bq7wRtvOGvfzuOGvbOHUSm/OgfBUjmNm6jGsb3RsCcJeMeKGBusTYPgHLCrllVpeH
         HbHrPLB3IQAUeTkexM5PkmtiQwS0BpqfFscw27pB+RRKub0RuLPw7wsO3OreeNcRahis
         qiTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788800620; x=1789405420;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D/2WLxDmERbGCh7iT/2ZThPPuDMwAWqV6GCdXRr20bA=;
        b=i/2QKg4mPNgHPDCV7BBttwsQ1W8Vedfq6emcXCTiUhqpNzCV+c5oLtn0GE9gpde59h
         dI48BNnLKJnz8BHAVtuVYQq3pKOvwPBgqrlV2JlWG/8s24qoq9+WY280krJd/oEaWycB
         hDLYRf9sbjnsrK37F1P62cdyNg/me3WS3VMqqLpDwKrHOxkitGEaQv1/J2qqIF81ERo3
         6k1Hej7Xkhf3epNNn3gEjcvvYatOwTPIHKmZjqB87+o5rQOYdjbQ1kaYtQnYBG1/uRKB
         FwOshfCCuQsSuWsbdnDPk19sEPcTH+gyfXJbQqJHghS5xh0N3zNWyv8kFVRRfulTcHwv
         B+uA==
X-Forwarded-Encrypted: i=1; AKwUvByfqsyrmKrTurwSAqiK4YqPYt1TCJ4RGKA+zRubz/GyubR4MdI499XjjD2kBsh8MOQDfsHjBe07739rL3Y=@vger.kernel.org
X-Gm-Message-State: AFuF++lSTLCWQ5WExaR6T5Eg+sStj2Mt2MbwfFT2k9oWfnLHorenL3LN
	/nsjhzCHRQGiNS7a5wkjckJDqXmk/cfHh+ALelDBLHguaQLzbZNEhee/rcQUkExh1A==
X-Gm-Gg: AYBFou11YmzJHqSsvp5C7Nwr0KVDKi1tMHAUPAco9Ff4pFD4G85busFBO3v2pbdbhL/
	JdETaG34XLuNKDGKe9E/YV/XkP+xUlMxZ4ABtO9TqO5p3feKpY0wHIPKnoK05K14mbhtRACqDyk
	Jg0Yni6CNuGiil7D9mh3boET1M2XWa+p+sx4zHnDPvM3eaOGLb2+lKfu590RTcXkHDk+kVoIVDE
	PzDzgE3GPntgBcbazLymol7++HHBt8Fj7PGPQMhvKaG4VYVxjQNmoV3aR4IEQTdAGVRxc3PsuAV
	/D4IikO281eQqVst8fH3xrINuMa6cSWWsTGGiJGRElSaG1gwNh2JeDnwxdlxngEKH7hICjgRcew
	Z7NbyWiF/jpYAh/i6cor2yORWi7UXKbLFtKaolEXz3Mzzw8/Ly/JIo5mUyRdLQdi8c1K2hvI2R7
	cyjSeKj92DymuvWg9i+1YbIvh2DKQOjNHmtIFy4hSvwW3qPJ6NthEts3KudA7kCO7FLCA23tAHS
	z7sh4OpIArvWDsVWh60YOhGK/CbhKWa
X-Received: by 2002:a05:6000:605:b0:485:8b66:f5 with SMTP id ffacd0b85a97d-4858b660161mr42549469f8f.18.1788800618759;
        Mon, 07 Sep 2026 10:03:38 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883927a3sm23089736f8f.11.2026.09.07.10.03.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 10:03:38 -0700 (PDT)
Date: Mon, 7 Sep 2026 18:03:34 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Rob Herring <robh@kernel.org>, catalin.marinas@arm.com, will@kernel.org,
	rppt@kernel.org, akpm@linux-foundation.org, sudeep.holla@kernel.org,
	jenswi@kernel.org, mark.rutland@arm.com, sumit.garg@kernel.org,
	ardb@kernel.org, david@kernel.org, danielmentz@google.com,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	op-tee@lists.trustedfirmware.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 02/10] of: reserved_mem: Introduce "ll-map" property
Message-ID: <ap7uZuGraZ2N58c_@google.com>
References: <20260902104712.2399797-1-vdonnefort@google.com>
 <20260902104712.2399797-3-vdonnefort@google.com>
 <20260902172436.GB1440252-robh@kernel.org>
 <aplF4NaoFk73d-c5@google.com>
 <ap7CAowlFTFhSFP9@orome>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ap7CAowlFTFhSFP9@orome>

On Mon, Sep 07, 2026 at 04:00:19PM +0200, Thierry Reding wrote:
> On Thu, Sep 03, 2026 at 11:03:12AM +0100, Vincent Donnefort wrote:
> > On Wed, Sep 02, 2026 at 12:24:36PM -0500, Rob Herring wrote:
> > > On Wed, Sep 02, 2026 at 11:47:04AM +0100, Vincent Donnefort wrote:
> > > > Keeping last-level mappings is interesting on some architectures as it
> > > > allows mapping/unmapping pages from the kernel direct map without the
> > > > risk of splitting blocks which, under the break-before-make rule, may
> > > > trigger page-faults the kernel can't handle.
> > > > 
> > > > Add an "ll-map" property for reserved-memory regions. When set, it
> > > > splits the underlying memblock and sets the MEMBLOCK_LLMAP flag.
> > > 
> > > Where is this documented? Any DT property must have a schema.
> > 
> > Ack.
> > 
> > > 
> > > Though I'm not thrilled about more flag properties. Handling all the 
> > > combinations of properties has proven to be painful. Can this be implied 
> > > from the compatible string instead?
> > > 
> > > Rob
> > 
> > We need this before the kernel direct map has been created (paging_init()).
> > 
> > I would have moved that directly into the driver lend_pool.c, but then it is
> > probed too late (unflatten_device_tree()).
> 
> Any of the node_*() callbacks from struct reserved_mem_ops get called
> prior to paging_init(), so these could be used to manually set the
> memblock flags in the corresponding drivers.
> 
> Thierry

Ha yes my bad, early_init_fdt_scan_reserved_mem() is calling ->node_init()

So I should be able to drop this patch entirely to do set memblock_set_llmap()
(or memblock_set_pte_map()) directly ino the that new FF-A lend_pool driver.

-- 
Vincent
