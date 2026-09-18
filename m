Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 209203A2E39;
	Fri, 18 Sep 2026 09:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789723324; cv=none; b=GzjsqOn7eQ613Uf9FEJQDtE/RJoCS8IeDwDStnujBviyBpnk8n+g5y0MXYtLAEHr66o4oXXT4Bg2I9YHgGNiVIgHuC1fseBRt3jvQ2vNKuI0dHiZCbooOxhfcaTA2wBDIMRWfondb/G52XRFnMo+bXFYKqZo0w0xSqsSlSMqHpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789723324; c=relaxed/simple;
	bh=YXbg8h3QX0LMadHGqUmPe0199Ik27wuAwoICustn92g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hDX817pRSZh5LcemBJjRCsGSy4EBxr2myPjl+FgHdSCoovggaodDG49C3x7u+PgcXEe23RYxDovMXHVcTTP+Ga1eUK++MMibxKGN95jBbUM0QL3V8PW3hDoDLEZGCkKEXUIxcudoWTKLpPvSbfDgXcl+ywhexTL+Kh0btImzEuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=CRc6En4o; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="CRc6En4o"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D97D0168F;
	Fri, 18 Sep 2026 02:21:58 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2D1193FAF5;
	Fri, 18 Sep 2026 02:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789723322; bh=YXbg8h3QX0LMadHGqUmPe0199Ik27wuAwoICustn92g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CRc6En4owgRirjVFVR4Xi7k4EH/UqS925SavcyEn6s2SVlrryWaSnc0wN8NoROyWW
	 y76nl7qrmR2OakFBMRGC0llWAeFBqZZr0fHquU3/J6n1gNaRDrJBOMG/aqFoIVJ7S1
	 fhtNVUhWRtl2QTEcq/Wn9m/1AbLWsqQ8QMRSETPw=
Date: Fri, 18 Sep 2026 10:21:58 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Breno Leitao <leitao@debian.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	kernel-team@meta.com
Subject: Re: [PATCH 3/3] mm: kmemleak: raise min_unref_scans to 3 for verbose
 auto-scan
Message-ID: <aq0Ctvzr4V4zjF0k@arm.com>
References: <20260917-b4-kmemleak-doc-v1-0-84fde6d1f749@debian.org>
 <20260917-b4-kmemleak-doc-v1-3-84fde6d1f749@debian.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-b4-kmemleak-doc-v1-3-84fde6d1f749@debian.org>

On Thu, Sep 17, 2026 at 06:47:37AM -0700, Breno Leitao wrote:
> CONFIG_DEBUG_KMEMLEAK_VERBOSE sends every report to the console, so a
> transient false positive there is broadcast to whatever collects the
> kernel log rather than sitting in the debugfs file until someone looks.
> That asymmetry justifies being more conservative than the general case.
> 
> Require one more consecutive unreferenced scan before reporting. The
> only cost is that a genuine leak is reported one scan interval later
> (600s by default); the value stays writable at run time through the
> module parameter.
> 
> Kernels without CONFIG_DEBUG_KMEMLEAK_VERBOSE keep reporting on the
> first unreferenced scan.
> 
> I've been running constant upstream kernel with
> CONFIG_DEBUG_KMEMLEAK_VERBOSE set, and I am still seeing some rare false
> positive, that goes away with min_unref_scans=3, so, making it the
> default based on my heuristic.
> 
> Signed-off-by: Breno Leitao <leitao@debian.org>

Until someone comes up with a better idea to reduce the false positives,

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
