Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D30783F1070
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 09:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789810794; cv=none; b=KK7z46wfVUOVoXQxt75mic9ya7D6c73zxKUhMDMT1JX0YUs2gv2qOgxJTJ3CK16bKWg+3Pyo9dn0fweCiQ/Wxe8wdnJl1eUnfdncd33h7Qix3j/p1iR18CqX90zugkUURTJgf8hYooN3EYUMJ8NICryC/pvA6CGtwSV0OrZuduA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789810794; c=relaxed/simple;
	bh=tHdHCeV3i/53pBzx+BvRaG4iEMebCHpkPsy50Fuskxk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rvB1wVhBEJJleEjtiU/2odtZsF2aHUtluxKD2AGFv7Hv71ZFXpYWBU8gVIkZed31pMzMz2xgqDNkIlUg+p2MSQeW82MiQPDzFAv9Oya6H04+CYa22VqwUoMZ0hJoLMTl+oTpDMIx08WEHMJgspM03eXlD4OtGDjtM1/q6uxQtac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QcDGXE9v; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QcDGXE9v"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912d8239so10945715e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 02:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789810791; x=1790415591; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G7D6znmpASqvbzZksdBAJ2aUTbJ7HvmNoE6FBY58urg=;
        b=QcDGXE9vmm/H8m4H5M7wjApIcK1rfcHQ4bH6+pzWqT/pcTdIEgATWEUucjdZPixKK0
         ELFSRmPrh1/I82b3TSRUZE7sMNGGxJAcAPCYS5Tu6oTiwZwYVo75pnao4p7E9DRO1xxs
         FE2dhZ9g+MCW0DkDaqh4F7yNxvViK2ClO9JUcgsV0e03pXZyhqM1lCoL29UF5E3m+NBY
         1slOKaaOnH+bzU+qLC/lXcVFIZ3qc3myHL08DAs3aJLYNydQf9o2H2Twx8MIYl0pVzFi
         lfM72nR1e96Am1bEriXQUISdbDBXfeTcf0JOglWdsAb0funNzAsxxm+z+zbCUiUOoLAo
         Tpag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789810791; x=1790415591;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G7D6znmpASqvbzZksdBAJ2aUTbJ7HvmNoE6FBY58urg=;
        b=wVCRK4a0w7gZpk25xbbwGiNXs4sxbGlYNC3I+ruYsMBZ8GLoWpDQWffwxQAEMLPsPb
         puyqDBUjBQCMs49VHCFlzfnQMDDdvndlWua4qlPKtmFvEWcNhW+kemzSxqwqJjBAzC12
         W4un1EtnfDuz1+srJpN+7REcl1lZ7JxxhK3GeLrJt3ab6urPcccsR/p4ABa/aOFuqdOg
         2vpUsjRPnvjk4HMW1XBtEOrfsPB3XXKF/z7jDDQXkr/i1fXwXfVmyXsk6l2nXjiRN5/K
         /rTK8dq+ZVQcuW2VeaECLckwVu3UH+VKkJm52gXjWej3FthzVUVvAhCeidUAsrpjhcmV
         Pn6A==
X-Forwarded-Encrypted: i=1; AKwUvBxrTjcEr+BGju31LVKtuS+ELdcuoWFPTOt4fGwYZhKclDCWZv1qBEAEjNKccMOxT5FS/pi3Z+7uWU87id0=@vger.kernel.org
X-Gm-Message-State: AFuF++l2ES3XrQM3LyePoT6Vm6TsUjcO03hhVOFBt2+qnp4HifVFm33T
	Uq+cLn792C181gpI8j01O/YbuwgxHk9vZDfOrQqTFVzMpxnNAvH8CZL8mKY0nFO+
X-Gm-Gg: AYBFou3JFdGafVCE6dPU1RMCIo7LlE/uYulDmZIz2Q7gyuTwIhx5vAxQp8ewSQGLvlb
	HA8oVLlbdZpajwpSMAmLSXrOOVIFPPrC06WfUms0PLbKqe+m7uAYgw2kgY9Jormq1tLe4pmL48E
	Fg0ZEx/Qf+YL1K6IDYNaFK4y1Igr+CzflriSnXZJvuxwdj8H4s+aCflj/xwxIAglQsNB5U7+k4N
	yYrL1w9wa7QVsjFdFGfeCgmAqPgC2Vqqh1X8mVTYO1lZBt0nxiuv53HgaPjdLJTpfJSAaHvolOX
	9CWrTFrQ8E0uN9R7VBblRlCNdsBMF85cOIbDYvOorgZIuPMG8JW2IJdQHVLzvLE6vMW1WNuY0HQ
	nrR6n8wn9qWkErhe0nVK4kXysPDl4TK/xm0KgSZ04Z2NnX3xKwbl+Bk3MGjuH7nPlVpyr5hl3fx
	DsN66YXXU4iI1C4xgykNA+uFKR2cGJOVlQSsJgHNRsTcRQ2U9CdZ2QHYSfPso6VOkDDsrdcdX49
	wY8W35vYMsQP96S9toNg1SS9qiMh4hK2ig/f5PaZDHB+aJ9lYpX55N0qjAo44ENyWqTyridlYj+
	QmfYUJAWTzt2y+6YdchW+eNSk9E0+FUCgoXOaBXSu7EWHGtAJO3oKmRniM2cTUEAwcqXycznp1r
	xr15whKzp
X-Received: by 2002:a05:600d:848f:10b0:49d:827:e5b6 with SMTP id 5b1f17b1804b1-49fc5735351mr48923145e9.20.1789810790822;
        Sat, 19 Sep 2026 02:39:50 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-a017-2b01-05fe-203b-7cd2-a640.310.pool.telefonica.de. [2a02:3100:a017:2b01:5fe:203b:7cd2:a640])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc6ca43edsm124495965e9.0.2026.09.19.02.39.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 02:39:50 -0700 (PDT)
Date: Sat, 19 Sep 2026 11:39:47 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: Harry Yoo <harry@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>, 
	David Rientjes <rientjes@google.com>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Catalin Marinas <catalin.marinas@arm.com>, Kees Cook <kees@kernel.org>, 
	"Gustavo A . R . Silva" <gustavoars@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Shuah Khan <shuah@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	linux-hardening@vger.kernel.org, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v3 3/5] slab: handle ERR_PTR values in kfree and hardened
 usercopy
Message-ID: <aq5YL3P6tuFy4eTU@gmail.com>
References: <20260903203720.63689-1-kmehltretter@gmail.com>
 <20260903203720.63689-4-kmehltretter@gmail.com>
 <497a85d3-e062-4930-bcb8-c86a8205e7b2@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <497a85d3-e062-4930-bcb8-c86a8205e7b2@kernel.org>

> > +	if (WARN_ON(IS_ERR(object)))
> 
> Wonder if WARN_ON_ONCE() would be better.
> Also wonder about the benefits for hardening (as opposed to debugging).
> Without this check it would fault. Now it warns, but hardened setups often
> use panic_on_warn anyway, so the result is the same?
> 

Yes, I'll switch to WARN_ON_ONCE().

You're right about panic_on_warn. The benefit is a clearer diagnostic
and, when warnings aren't fatal, returning before virt_to_page().

I'll split out the ERR_PTR patches as Harry suggested and recheck the
KUnit warning-count test with WARN_ON_ONCE().

Thanks,
Karl
