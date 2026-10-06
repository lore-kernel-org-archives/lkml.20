Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C2537F739
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 22:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791326039; cv=none; b=lF8PgH1Tg2qu9HcrNikyAdpGPl+7p6Dub9GfRD++BE/a1ZM3e47+5KZ3uedW6dijhAwCZbw+3pbwfxmDuEWzyTozfKZlZa3Hbfe9iF+vrUSBpb95/Alivl9YWfgwy43Kd80E5C2T5QwFcd6gz8JmpDKnhqUTF5wmOBymYl4kjbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791326039; c=relaxed/simple;
	bh=O+8xBQY/v9jNZBk2zTyOCPA5ptcaa1NSOq8pLh4rddA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uU1n9c5McDrwnmpGZS1M2MsrrpzaU/baUtcbsdOm5HNP8b9uKMz6aE/Huw22N+3js+cXuJ+gEwkXXv1iIdYcudHYyofqTp41bJHCwTag1rOqRGq/fO3VgC3mfXQCRhaDWDpVtMXG+OtwUmIdgwYP2eZACUKFoP6CO46S2Machlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com; spf=pass smtp.mailfrom=openai.com; dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b=Nx87FDdt; arc=none smtp.client-ip=209.85.160.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openai.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b="Nx87FDdt"
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-49dfaa16190so944039fac.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 15:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openai.com; s=google; t=1791326037; x=1791930837; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JwfzmdAKScSz+AoW2s/aNmU/I3Sz1vRupnUAAkkpJcg=;
        b=Nx87FDdtWX0wMIgsYdTk3SN9WcF9g3WNXl6dMD8wcJOow7WUSfzuxyDdp7BkBzntg+
         yg9ir7yn66TNy38HaoSXZPFCkvvem2qYkjxoPMSIrOAhLvkChnvAUTiHTTt/JM7zu0NY
         ODtEqbF7bRhH03xrT0Kxb7EesUv4ejGsJ0x0s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791326037; x=1791930837;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JwfzmdAKScSz+AoW2s/aNmU/I3Sz1vRupnUAAkkpJcg=;
        b=vvzOfHiq7CaoJkoos7ma1rmCQ9prcfLVyHybPxQU0u7oKnzf1PUnTqJz4YELr1kSDB
         Usn9jWY8G7pqo69b7l6XbGxVc/XO3pBXrEe3/bSKjnjJJKKCOIXz1CvDn+JRI1mA5QCn
         Ssvwenm9BqX69m1h7++jn1IA3GEJNuq1t1DbqXTt8ut8tKTm+wD4acRZaQ4CKhUMtePb
         e9K2DnVB8o8zvobkhnyZI/OIyub035Vz/Q3A7zUIAbl1Lqs1UcI4P4tvO0EcgcBxv6tZ
         RJ/Aa0FXEby+J7NPc5OlKiBUzS7wZlUgNHKvf9pzkoPHAEQXeGLqmRkBXh9KrXxXKDIu
         j0Uw==
X-Gm-Message-State: AFuF++m7gGELYEd58o8muVQ/v11ciztEGOKAzo3NTYN9WDVDvJqTYiAj
	Hf43Z657TsmObG4kCVsOUTpoB/R8OxRBuZ/SuwlGjcc57p7JUfQBQ0/4xPkdGAsEc1o=
X-Gm-Gg: AYBFou1dJL3tY0JN+tDk00++BSkmMbuQ+zI2MNQo61kRBUiOfvZn5HyQH/Uq1U3Rb6d
	zm0/rlwbu76IYtTUgnC7XN8MvHv9GSNMtHWxA2hzz2jB7WxHPxbSiTBmf1iZn5ufmLRQfNxu4q0
	zBSDhVZ9vX5vGVWxs0r2vPq6vhHHBEu08LVevqMU69GBi6z+bCVm9/bPbdqKHRwao63GoJwvwMu
	9CyfGdoKRh2t+LEak9SJrqrVH0reE0JZha4arqIhot7OChFQKXCUZzXL4sV2MJPzhCcvv2X2WZs
	fzS4GKzBBrdQmlSC5yr16c7O7KFj2x4BUbgkYnbQuV7D78IDjd2eV3m+RLvpiS5i3J9pi+QqC6D
	QfOG+x5KUVzbQVtHDP66tBGbpYJaqN8raDLNT2BA0mtx8OkRjSCEa0npX/lFnWzM6lzJ8kuUpQ6
	v7KYIKwg63wPtNwtNpRvJqwVGN+RweSe2rsdnpet2/QoNn5Ls8Es+dcV4T6Rlu8XkIqXlk4JHtQ
	ri6/T5IPeNYDkAaHOuud+1Y/1hWUbpe7vor3JWlcEUCtk0jL/aBYg==
X-Received: by 2002:a05:6808:1a0a:b0:4b2:8e26:bdd2 with SMTP id 5614622812f47-4faad787077mr3227198b6e.16.1791326037172;
        Tue, 06 Oct 2026 15:33:57 -0700 (PDT)
Received: from com-75606 ([199.47.143.7])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a25723437dsm623812fac.13.2026.10.06.15.33.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 15:33:56 -0700 (PDT)
Date: Tue, 6 Oct 2026 15:33:53 -0700
From: Kyle Zeng <kylebot@openai.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	David Howells <dhowells@redhat.com>
Subject: Re: [PATCH] assoc_array: Preserve full words when splitting shortcuts
Message-ID: <asV3UaPsA2xSz8Cc@com-75606>
References: <20261006220638.32195-1-kylebot@openai.com>
 <20261006152508.ba7f3c7a6661daed4767a18a@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261006152508.ba7f3c7a6661daed4767a18a@linux-foundation.org>

On Tue, Oct 06, 2026 at 03:25:08PM -0700, Andrew Morton wrote:
> On Tue,  6 Oct 2026 15:06:38 -0700 Kyle Zeng <kylebot@openai.com> wrote:
> 
> > assoc_array_insert_mid_shortcut() copies enough index-key words for the
> > new pre-shortcut, then masks off the unused bits in its last word.  If
> > diff is word-aligned, the shift is zero and the mask clears that entire
> > word, even though all of it belongs to the required prefix.  The new
> > shortcut no longer matches the objects behind it, so lookups can fail
> > for both the existing objects and the new one.
> > 
> > For example, inserting a user key with a different description length
> > into a keyring containing enough full-hash collisions can split a
> > shortcut at bit 64 and erase its hash word.  The resulting search
> > failure can also expose the pointer-dependent keyring hash as a KASLR
> > oracle.
> > 
> > Only trim the last word when diff ends inside it.  This mirrors
> > commit bb2ba2d75a2d ("assoc_array: Fix shortcut creation"), which fixed
> > the terminal-node case, and leaves non-word-aligned splits unchanged.
> 
> Thanks.
> 
> When fixing a bug please clearly describe the userspace-visible runtime
> effects of that bug.  Including how-to-hit-it, reproducer, user reports, etc.

Hi Andrew,

Thanks for the response.
As mentioned in the commit message, a search failure can expose the
pointer-dependent keyring hash as a KASLR oracle. As a result, a local
unprivileged user can use this to leak kernel pointer and bypass KASLR.

The reproducer is not attached intentionally but can be shared through
DM.

Best,
Kyle

> 
> > Fixes: 3cb989501c26 ("Add a generic associative array implementation.")
> > Cc: stable@vger.kernel.org
> 
> Especially when proposing a backport. 
> Documentation/process/stable-kernel-rules.rst provides guidelines.
> 
> > Assisted-by: Codex:gpt-6-astra
> > Signed-off-by: Kyle Zeng <kylebot@openai.com>
> > ---
> >  lib/assoc_array.c | 8 +++++---
> 
> get_maintainer coverage is poor.  Please use git-show also:
> hp2:/usr/src/mm> git show -s --format="%an <%ae> - %s" 3cb989501c26
> David Howells <dhowells@redhat.com> - Add a generic associative array implementation.
> 
> Also, as this affects keyrings, grep -i keyrings MAINTAINERS shows the
> mailing list.
