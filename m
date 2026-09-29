Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2A53DB620
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 04:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790655215; cv=none; b=UmC1RafXNqGlwGceVmwXTqbqUY2GEf9l3i98wonMPL3uMtblGQ88w6PLWGLJxMI01dRttT2j06lcjscs7484Bg5MIKf7xb1tGc2jKgt7m/LacQIovaenWDW2xa/v05qLxHVWKijx74Nl5MugOdWqG1QGaBPrpyWGIOAEt9LRc/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790655215; c=relaxed/simple;
	bh=zIvEOC+XsP3lXg3aRF4/tY6ZEjP4/7XrWVFSulwDxkc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jKJhSloP3q5nudZTcbNyjW+YpnRs9vw4I8GDH/MEhHmz5dWB1MVd2scCLWFo6IMLZu34+oXx4HnTBlXKV5R9dzs6zZDzWvUzaS4kXEb2RxXYntThiQjMlnR6040gZAqX1QkFvOXBT2T+7fr2uShgMjPqpjpgl19HIx+gEGTKUE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Pb5LyQcH; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Pb5LyQcH"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48af51f6182so6374f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 21:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790655211; x=1791260011; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=901GbOx2BRhQA8Zxfo2Ky3itLYYimn6S4GN4hXMrzZw=;
        b=Pb5LyQcHKkNCwHcR3dH9w5cV0olhF1deDeCcLsHTDN5Cl5aABnBYqlJElXHn/kzVt1
         Dy0BnDQYfNq7XeGUcvFdPq05oVk3nrwQ88Y99ND0AhMRoyTk2Ph00VRKEhwtCot0a7VD
         hsujZ7m1/V2ro3HBdcXv1hUPRGzikw+LJ/lP6v8vBdUpy0njyUMFW1pOfOSNM6Y62ojt
         A1Cm3BMOC9U23nt8mlfxiSEtsjwaAWP+XGTaQVBAhc6wuZ1c9epQNZdpzu5al/oXqocZ
         dHq+4oEXGi1fViap1CqEPLMH0wJrHAJbAVN4yICml0pIlhUAh373pq9B+RNmEhSmH654
         eIGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790655211; x=1791260011;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=901GbOx2BRhQA8Zxfo2Ky3itLYYimn6S4GN4hXMrzZw=;
        b=H6sNpI/36v8DYBqYbswxHZ2XGHvJ1NIyREbV0J6dBFwiYazoyLPlSpLI0TG+KugwhN
         lsoG8jVHgf8iWv+V07qbHAy5jwE9p2wbwu504/zBxlfN7XhofeUFgG9uK1ttaBmNNj7c
         ql+alCz8dMJIV8dO8H+a//VPlZ8pZatOa/IA9ZrVAlsA7V+VjKVFz7FlVIw2M0wi6z0z
         yIvPcpd93nGghVdwRJ5v4f1XuXWevsPOlsAmUpCz5y/imCd3rSOVvUbgAINJeLambn0G
         ycgLJ5q3bnLEIC1FlNIRBKkUsf6ok4javPQIx0pJG/nHadEXR/7c1zEPhaHr7bw/ESmG
         mMhw==
X-Forwarded-Encrypted: i=1; AKwUvByzgR0yECyAnFcH7SzUJ6nWdEx6vHomCilfOtBllwgsJUXgzIjUHs0J2EPJ3dYrpOI7Rjhaij3VIqr5rxQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mhaXJ/qllsQXm4P3skN0zCRyksTvYW/Bh2iIw+/qZuqn3hz5K2
	1Qj8IUr8/hLF9t4cSWC/gIrUdEnXz3e1UxvM99Vs/65vGGnJc2m4iqmtnGMkzorKYgU=
X-Gm-Gg: AYBFou2BHCa9aObDMOd8B2PoJwrNybOvaSp2YSwo7jdrmzc4nQi6+CKMWTujX3EB+zm
	bsYM6wp00VJQoem7xc+lOeBQPNh2DE0CEp07WrAvYmSP4HWOXFyNql77u0W+4lG1he8Qz309hRU
	WKIo2+Q4JE2TnpfZ9wdZf8KkJrvqGLb6fbH1/lR5V/hkyKESUtO4y5cP/rPYZoilSvFXDHSiPX6
	XKf+qDOvcJvN8OAjQuN/5X/mxAaksKf4O/5UOiyJ6LmoNlw22/SeBiZ2J66fFDRtYbsU09LWgs4
	zEH74BdFXegTUltk0Rtrx8CsxnZUabEpEnsXjaqf+3YOc2Q1fD9SD9i/J5rGYPkdFQz5EM+3V9Z
	gyqN4thocv+YEvhoF7G11kMNfRU4xLeomKJncisovpKWVmoidafPmUqI4YD/uJCSK/PieP+YxSb
	iBojQ/QECXZ6jN95kqp1Mz/czgBneIqgea+mPVPWRaJerRnRl+wtwcMl2Ki3vA/1rfYFk3
X-Received: by 2002:a05:600d:b:b0:4a0:1a3:bf6 with SMTP id 5b1f17b1804b1-4a001a30da8mr77286095e9.0.1790655211608;
        Mon, 28 Sep 2026 21:13:31 -0700 (PDT)
Received: from localhost ([202.127.77.110])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df9140545bsm48849465ad.39.2026.09.28.21.13.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 21:13:30 -0700 (PDT)
Date: Tue, 29 Sep 2026 12:13:27 +0800
From: Heming Zhao <heming.zhao@suse.com>
To: d.morgun@ispras.ru
Cc: Joseph Qi <joseph.qi@linux.alibaba.com>, Mark Fasheh <mark@fasheh.com>, 
	Joel Becker <jlbec@evilplan.org>, linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org, 
	ocfs2-devel@lists.linux.dev
Subject: Re: [PATCH] ocfs2: validate la_size before ocfs2_clear_local_alloc()
Message-ID: <ars491U6UjiFdf1_@p15>
References: <20260810113508.8513-1-d.morgun@ispras.ru>
 <2927fd14-46be-4cb1-8dac-0f4249f16014@linux.alibaba.com>
 <e13b47fa02d27dbf4c44ae300fc082a6@ispras.ru>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e13b47fa02d27dbf4c44ae300fc082a6@ispras.ru>

On Sun, Sep 27, 2026 at 02:04:05PM +0300, d.morgun@ispras.ru wrote:
> On 8/11/26 9:57 AM, Joseph Qi wrote:
> > I think we can validate localalloc inode during block read in
> > ocfs2_validate_inode_block(), which will drop the duplicate code in
> > callers.
> 
> Hi Joseph,
> 
> Thanks for the suggestion. I moved the la_size check there, and it
> does catch the current reproducer during mount. Before dropping the
> duplicate checks in ocfs2_begin_local_alloc_recovery() and
> ocfs2_load_local_alloc(), I'd like to raise two concerns:
> 
> 1. ocfs2_begin_local_alloc_recovery() reads the inode with
>    OCFS2_BH_IGNORE_CACHE, and ocfs2_read_blocks() skips validation
>    for dirty buffers. I traced through jbd2 replay: ocfs2_replay_journal()
>    calls jbd2_journal_flush() right after jbd2_journal_load(), and
>    jbd2_journal_recover() itself calls sync_blockdev(), which should
>    clear the dirty flag before ocfs2_begin_local_alloc_recovery() runs.
>    So this may not be reachable in practice, but I haven't been able
>    to confirm it directly. The current reproducer hits the
>    validator with a clean buffer during the initial mount, before
>    recovery is reached at all. Is it possible to confirm that the
>    buffer is guaranteed to be clean by that point?

In my view, OCFS2_BH_IGNORE_CACHE tells the lower layer to bypass the cache.
If the buffer is dirty on this code path, that would be a separate bug.

> 
> 2. The check is gated on OCFS2_LOCAL_ALLOC_FL, but
>    ocfs2_validate_inode_block() doesn't receive the inode's expected
>    type, so it can't verify that the on-disk flags actually match
>    what the caller expects. A corrupted local alloc inode with the
>    flag cleared would skip the check, even though
>    ocfs2_clear_local_alloc() still treats its id2 as i_lab. Is there
>    an existing way to check this correspondence? Otherwise, this
>    might call for a separate per-type validation helper that takes
>    the expected inode type, which could also help elsewhere.
> 
> My inclination is: v1 (the check directly in
> ocfs2_begin_local_alloc_recovery() and ocfs2_load_local_alloc())
> has held up in testing so far, with a small additional fix on my
> end. Both call sites operate in the LOCAL_ALLOC_SYSTEM_INODE context
> and check la_size before using id2 as i_lab, so they do not depend on
> OCFS2_LOCAL_ALLOC_FL for deciding whether to validate la_size.
> Returning this new error also made a separate, pre-existing bug in
> the recovery thread reachable, for which I have a small follow-up
> fix.
> 
> If the two concerns with ocfs2_validate_inode_block() can be
> addressed without too much churn, I agree it is the better place
> for this check, since it would cover every caller uniformly.
> Otherwise, I'd rather keep it in v1's approach.
> 
> Does this seem reasonable, or would you weigh it differently?
> 
> Thanks,
> Dmitry
> 

Hope I understand your concerns correctly.
You can reject further operations in ocfs2_begin_local_alloc_recovery() when
OCFS2_LOCAL_ALLOC_FL is not set, while keeping the la_size check in
ocfs2_validate_inode_block() guarded by OCFS2_LOCAL_ALLOC_FL.

Thanks,
Heming
