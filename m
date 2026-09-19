Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D45132DEA7B
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 23:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789860106; cv=none; b=pDaoRo4zfKmY2B4uU1i2RYXRK3oA6ib6dbLov4j7xymBDvb131d+dBwG1i44qoHOwR7y6vSahL5eC20BNzyPRxrHhRuLM65BQTyfbFEA3M37OCdVM24+4JndaesLygqLacCFFchkWT60XrFopNZR8yhhIQURBVYEKEOkAt2Gb/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789860106; c=relaxed/simple;
	bh=rBz6B/di5S9FHTrFPqqLTj34SBL7t+mg2w5ZyJVUd6Y=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:MIME-Version; b=R3mE5NG2E+6pd08PIsJOZHnE0cnDK9Xd5Pudkxnvk2JBxdG2Nf10ItSPIn1D2alJqfCrCfHzbVuECb14nzVrOtk9z6ApFQ5YUsCkUkF5HmgaVYk1vKyj1dAJNLdjG9bBN58jXSdS95U4Gi/toA9pXyUbnylLt9COdDIWe72PzRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g/5W8r2f; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g/5W8r2f"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-39dbdfaef3cso1681041a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 16:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789860104; x=1790464904; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uvzYLHxwxs2iR6mGVYBYcimLQ2Sg/Va4WyJg4K0mC4g=;
        b=g/5W8r2fZ70GTVo3kIkd4VTrw45Q4MZr2ID2dPV3LgFawz9O7S0AR5sbY0wVM7EOvw
         Yxgq9vXYYB3zRJ6z0AUF3UWQf9tMCKNZ4Lh+oSVjKj+G4P3uvNi/J25o+9d6lSLm7geM
         f9ztyliiElFKZgB9OMgLKcAYm735mBtadt+WhgEw8kWNznVNFq3qxWkaSAoFJA9rPL+M
         87sxPmTqEC3zfptVvtEiAlSmtZ/BgG33AOtrYC4HBAcPML+9LKTGwF5vtufgQkd/rrE/
         xzj5pX4RfPLiHcM7WrdfOktK4doTJZOmda84F4Shg9658sn9kzposfNU3zFMH6q4lcxs
         GyJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789860104; x=1790464904;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uvzYLHxwxs2iR6mGVYBYcimLQ2Sg/Va4WyJg4K0mC4g=;
        b=LHJ4L6zKaTTDH1Du74yCxsDVItKaJ3ID5ijbyLj42ksL6QyFeHokCABQYsTM6oTcZb
         HGg1RnKmExyPfzI7lE+nKhGj1dl9C/FYEws3AeSVn8XcMQRs/AB6xwLKI2um0OB2Y+Ib
         veOJF885D01fI6CNzlGlkaDBh1FLvdoEv0Ncr2spIXiIZfm/5wnCUqoZMc1fnWd1GoEz
         tApr3xQRryyBI0gPgANIbL7UNZc+kXE2vzd5OjArWYU4XPLEqd5dP53Mp1zSmLPHd+zd
         JsrUWoZG2RwqwLUzG/4PFYzV7E/isL4VKdb4mT1TywmJoAkTwsOqMNCNczRF+9TgPLHs
         zAkQ==
X-Forwarded-Encrypted: i=1; AKwUvBx0f05rckkApj/P62q10d1+Br27qJa/0iry1EEj7Y/ts7WV4uWzaOhDbbdTFUPOrORSAAZXholsk3jE63I=@vger.kernel.org
X-Gm-Message-State: AFuF++kDzJ87pJ2O26SutxRsTOIoTz5hIXMzzgmsme1VFgotHtM4UUA2
	By8gl1K1eaxhUXWlyYDxvun+UNx3Lhz5R6tS+oFPUGJVOKWMdYiFTVNy
X-Gm-Gg: AYBFou2UAaYYQgbr/9LwTWoW9Ew0kLwNs3yqobdpqcBWq2MDknNSTuk7XH9dr9shw18
	46URV64NPAN/SbWDC5VyqKmsvo5JONWEDQ/k7TBQsUpl7xgt0wvMDvbCFI3DVWFK3mhFltBjkrB
	PDGs9BAQP1NGRWz0WvD1J4IbEi13I1OKjAi23fVpIRWv0CeqirVf8iLGw1Wleu+MEcTU2W5YnG4
	Gq/CBRG9MdkLgVcm8oOZycYvJq1aEBUKTL55YG73anyYuDUPxJn4J9OUyJ6KULgkOpZ7FuGda/b
	czCinFEcnfD3aWLme004lEUv1zcTCJLJn2f2xZaUmhDBkegSql1/7GVp3e5/56MTyRop4jk0z7a
	HYOXps0d/ET8ryxNrwcCaDIKLyJDBAn+B5SIMDi1LCSQInBMyqBHZgg6DXduLCoYARjaJifhrLm
	uRROEGDkyWnvQeDA/tgnqeKqZ7QOFd8lcE3U+iJYyuTNyp9Q7at8TtHe3jBa6K8KehTPGH/vl0v
	TcnB7UYjjNNRS1WBPj4Td2XAlbG90Fp0ds+gWG8P/ZG1ZIuDoDqFxRflFeRxk1FuWGBZc76+YKv
	5Mn0QH10X1yCD3I=
X-Received: by 2002:a17:90b:5305:b0:381:6c5:3f63 with SMTP id 98e67ed59e1d1-39e54dcd917mr17679110a91.6.1789860104144;
        Sat, 19 Sep 2026 16:21:44 -0700 (PDT)
Received: from localhost ([153.61.198.255])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6c3145e5sm6749632a91.5.2026.09.19.16.21.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Sep 2026 16:21:43 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Sat, 19 Sep 2026 23:21:43 +0000
Message-Id: <DLJOGC7M106N.33I0V3YRNYB8E@gmail.com>
Cc: "Martin KaFai Lau" <martin.lau@linux.dev>, "Song Liu" <song@kernel.org>,
 "Emil Tsalapatis" <emil@etsalapatis.com>, "Ihor Solodrai"
 <ihor.solodrai@linux.dev>, <bpf@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] bpf: arena: Flush stale TLB entries before reusing
 ranges
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Andrea Righi" <arighi@nvidia.com>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Andrii Nakryiko" <andrii@kernel.org>, "Eduard
 Zingerman" <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>
In-Reply-To: <20260919224616.3123513-1-arighi@nvidia.com>
References: <20260919224616.3123513-1-arighi@nvidia.com>
X-Mailer: mkdraft (claude review draft; edit before sending)
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sun, Sep 20, 2026 at 12:46 AM Andrea Righi <arighi@nvidia.com> wrote:
> @@ -911,11 +910,17 @@ static void arena_free_pages(struct bpf_arena *arena, long uaddr, long page_cnt,
>  			zap_pages(arena, full_uaddr, 1);
>  		__free_page(page);
>  	}
> +
> +	ret = raw_res_spin_lock_irqsave(&arena->spinlock, flags);
> +	if (ret)
> +		goto defer_publish;
> +	range_tree_set(&arena->rt, pgoff, page_cnt);
> +	raw_res_spin_unlock_irqrestore(&arena->spinlock, flags);

Now the ptes are cleared in one locked section and the range is set in
another, and arena_vm_fault() can get in between. It doesn't look at
the range tree to decide. It does vmalloc_to_page(), sees no page,
range_tree_clear() of an already clear range returns 0, so it allocates
a page and installs it into the kernel pte. Then the code above marks
that range free. The next bpf_arena_alloc_pages() that picks it hits
  WARN_ON_ONCE(pte_page(old) != d->arena->scratch_page)
in apply_range_set_cb(), returns NULL, puts t
he range back into the
tree, and the next call does the same. All it takes is user space
touching the page while the prog frees it.

iirc Emil has patches that address this issue differently.

pw-bot: cr
