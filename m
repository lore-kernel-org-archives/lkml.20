Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4253466B0E
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 17:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788196008; cv=none; b=X3XkRsgu790csRFyN6YqrvjyvYYRw2e/8VqrfAc5sCxPxcOHr3kDgrj+3cCezpct9MBfivbFPyO6es8/gyCdeR1ZKxyKboOPVRSVK0moUtW9+sS+hXoFqK4AKJTZpTPPHDkM7hv1IYJHs5bU7sqhJl6f6hs14j329uOynotWEsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788196008; c=relaxed/simple;
	bh=K2KqcoylP9ajdo74uYFE/bbmE9F2Qm+5zWNnAdHfvtk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ksIupCzdXVEXAjhjLgSSgib8WfLgd3hrVuJHTF1CJTovPTSb9aq2vk6n+SN5vdYe2Zadvd/6UXt3ksjpL2Nupl1MkxCOuMdyeXKMflyzx8LI8YRFBfVslhtSu5gW0lPzpmHbqlWLaGTRC8yodvnOdlsBp1g7MJ8mPolMY2sCf+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=gK6qDEqY; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="gK6qDEqY"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-517dc520840so40306711cf.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 10:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1788196005; x=1788800805; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ey0i6GY/+uYMiZdrZqXVheWdxLiejFy0vPzvLZWYeyQ=;
        b=gK6qDEqYLplMfc0PeagNg51XBWZ5Gezhr+drQWG/zYTbe0cDiqE1bJFqfYn6/jGUuV
         bnLDKRq8OZc1doxPIcSiwcHKxWLLutMkgJAxdUQOTIE0Vq+09axSfP1bNfHm85E7JuCu
         6Fa8PexMdPFZ8o7aAP+tRcDOokPf+25n7TrUr74zJm5QnuAPQuNEMF9fxwyWjkJDbO+q
         na/oCVWpgDzcnbquL7Jg8SFRmIFIme2Ny+uB+6i3qMuII6OB0nVA4vjLc6lavRe3lQ4G
         mTUdgxP8R/GTSQtnAzWdROL6ND0r6xINxq4b9hKumbN0e2tELfY1O7LbYLQhEZ+0FD0/
         Fg3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788196005; x=1788800805;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ey0i6GY/+uYMiZdrZqXVheWdxLiejFy0vPzvLZWYeyQ=;
        b=AsA7i+ygwkAqsOnI1ydh8E4G/P5ZdHpW/2Is6rbn+9M/LuM/UOyfgoPkN65Y5J8W4c
         oRh/W3YAvmGRYuu9ua+9nwvNe1E1SgIFXX0PYPiizgU2Ad+n97FEK54B5EzqTO8NPCnq
         Ct4ulFu39AtJ8PXqsVUcU20aVAhBDu/FAjRa6f1h9wLD3LwHPLs2orsA8v9EbDg5vnA/
         YHVY2ujJQvssCmOzEILJvflDrtIN6N92tGEFQXqxPDv3KdhwLZKBtseYG9fnYBxsT/h1
         Nz9XjZzK8vzPgxpAy7cutQJust1iBbPbZU/jaE0vVPywa9qApBs9w8mhGS/NVoKLOg0w
         ql5w==
X-Forwarded-Encrypted: i=1; AHgh+RqKMghI9XBY0Bu8gSoYTsZhsc2nykk82cW4aicAdQaWt0cia3Pbcpvf/qxRE4azP7R/cWQDSXfttoqPGUo=@vger.kernel.org
X-Gm-Message-State: AFuF++kQqM8mXv9uaJ+THk9H17PRLQeN4SK62S3/uMDNAqEinh+7BML6
	DxZuvFngnB+q6xAQg5lQPG594Z+r8HBCw+KqHueml1rNSFgMQbDAPy5oXBLXg2R9/EY=
X-Gm-Gg: AR+sD12Phphic6mqmEOds0gCc3WeZLIGd5Hl/2R2y1va9ehLdUDrK1zMzVQfPYahEuQ
	btB/T04gNBzJ37RM89wT4/7A7Bg5a7Yel3VAgI/e7Y/V/vhSvOftXLQmuRk+2LGn+CQPpsIsgff
	+NlMdifTjEX8dRjVFy8wmhaWsgyZqkUN4vbPMaFqtnICSLzbiWz3k4RT50nRGcvRaBC71xKNmxg
	68pTNLN4GvQj2O8b5kcyi3QCDCp2ftR172RQ3YhZf2CPpTmEja/jfXA3hTxMITDKZBqg47PO3TT
	fSRujrNxSfaoCoEkbdkhNnyHNuDtgpT3hvAAwg4+jjR7xtmnye/AoT1J5XSLpEPDP4Y7rOK0nTo
	OsT558A47MKdabNu8MC0nj0+IEgudTuaXgTBBCTlM9icBDP/246BVYZSeQd82m9ZCFE1A8QbruP
	ZdOUvC8+BZ2ft4Pt3yrDVjiKTtxfZSvaroTRFPE5gZVr1ryYm7Re8XxLkshAmm6dwrfpEPQAoyQ
	jAYftueFTYO0ffVIdqAXqf94IuUJGrGPbaTdiEu7cFB
X-Received: by 2002:ac8:5750:0:b0:52f:9e5c:33ff with SMTP id d75a77b69052e-52fb93edd51mr337452961cf.13.1788196005399;
        Mon, 31 Aug 2026 10:06:45 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90ce44f4ef8sm87774886d6.31.2026.08.31.10.06.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 10:06:45 -0700 (PDT)
Date: Mon, 31 Aug 2026 13:06:43 -0400
From: Gregory Price <gourry@gourry.net>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>, 
	Pratyush Mallick <pratmal@google.com>, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] tools/testing/selftests/mm: add missing .gitignore
 entries
Message-ID: <apW0lpz-4o6zGbCK@gourry-fedora-PF4VCD3F>
References: <20260831-fix-mm-selftests-gitignore-v1-1-c984bbd4c5e4@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831-fix-mm-selftests-gitignore-v1-1-c984bbd4c5e4@kernel.org>

On Mon, Aug 31, 2026 at 03:18:23PM +0100, Lorenzo Stoakes (ARM) wrote:
> Commit 2bee308f3adb ("selftests/mm: use pattern matching in .gitignore")
> switched to a pattern-matching mechanism to reduce churn in .gitignore.
> 
> It however accidentally excluded the page_frag test's-generated module
> intermediate C file with .mod.c extension, and also the local_config.h
> header generated if liburing is available locally.
> 
> Explicitly fix both the issues, fixing the module-generated C file as a
> general pattern as these are always intermediate files that should be
> ignored.
> 
> Since this is a trivial .gitignore change it doesn't seem necessary to
> treat it as a hotfix.
> 
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>

> ---
>  tools/testing/selftests/mm/.gitignore | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/tools/testing/selftests/mm/.gitignore b/tools/testing/selftests/mm/.gitignore
> index fcd892ed21e3..a306d7754786 100644
> --- a/tools/testing/selftests/mm/.gitignore
> +++ b/tools/testing/selftests/mm/.gitignore
> @@ -2,7 +2,9 @@
>  *
>  !/**/
>  !*.c
> +*.mod.c
>  !*.h
> +local_config.h
>  !*.sh
>  !.gitignore
>  !Makefile
> 
> ---
> base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
> change-id: 20260831-fix-mm-selftests-gitignore-dd389da72760
> 
> Cheers,
> -- 
> Lorenzo Stoakes (ARM) <ljs@kernel.org>
> 
