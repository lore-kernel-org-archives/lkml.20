Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB334A4992
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 13:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792156979; cv=none; b=daKsh/FvSSeclCBvADbZish3qqlbuMKtWvI0dV6eU1BdBITUCnqPDf+EwrzQ5LAkf9E3U8y/NXihfGG6mt65ENrgFCbmAGCIbUwhwE0esiBtsnrSwx/wVhnl4v+lcsPsH/KEpePCrk07GvcwNz34cW/vyVGvJVDLDcPJJY1Yof4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792156979; c=relaxed/simple;
	bh=Zoh3g5792438IIctiUeh8nECzubz/AI0R3YK2S7Ak+w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jCVvM81b7K8hr9SWcx7XJ00G7ggj+pqpXTHL9XrgNCrp9r2AfH+/FtEG3Sq5nvGkxQcQCVD32/ETDCU3aJzppCHBzMVypT/r/XNCZD+B8/GP2M9q3ogL7xH9CK3BGtZX02FDscz6bKZ0nwygPQwjsdnYruDKbvSBI+dmaoCXy3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=aIRxyiBd; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="aIRxyiBd"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-917a20e9efeso90154356d6.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 06:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1792156977; x=1792761777; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UZ+jg+YnV/4Rx7SNrmGuegpLMiyUs48QsBYMqR/oF7c=;
        b=aIRxyiBdQKFslLI7IwkstdBnBMGLfGlEWoFqH10Jjz+Y2g0YfcV5P6lStNPSpwdtwL
         aLkNPbmpmGqNRi6yrtFAtO0ulHS2hktyQuc6V/zZwCP/6321xiYHogrghmfvWro3mSUU
         IMWSV2BzIglZdKIW4fCxT6J4HypF96Bc8/QTehx6Im/fd3VDD46vLJUXcR8/fYQcRKGt
         VTebs8IKKfD2LzpP5o7Dtx6ls53jPpjoMH3QN82tsB1OdcCG/SOifAc+lMbH6w+JtyUt
         WG3Wn2TW48Mx18iYv0YqS3nDd0rij3I3wMyzeiT6aILQ2DB3jR90U9a4XKFdZPmTZZa3
         57YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792156977; x=1792761777;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UZ+jg+YnV/4Rx7SNrmGuegpLMiyUs48QsBYMqR/oF7c=;
        b=K0ExR5qpU+VKLKgLZriYEMwGXLYE8SS9Elf1w9Fbq0t6ih3gWmDQnYCR1qk2Wn90UM
         I3Wd2VWaclJCYj1HwhHj+XY6GdmnkLKTnI+pNk6ZZibmRNyz9ATT5covLNJQ8EEbWlIQ
         mxR2m6wGueya8lDbH59z7an17VmV4Vm9w77+sg1Bq1ZrkKz4pyD/SAUgDKvlW32x3IFg
         WWn89E3/xOtqX4sCHQduuRYeGKE/DAN8Gl4BFeMWDCDooI37xvF/N104/k1FFzHguzPS
         G3V3mpw7DU5spsaam1IcOH1yxKZLt0kL0jVR+ABRD2rR8BixivLvMjUjcy1yOY/1oVw4
         JEXA==
X-Forwarded-Encrypted: i=1; AKwUvBwMP2SZWt9wHLl8vB3b9kt6KQqeO5ShZuWWx1SjVr/ktED79XK2Q2zu694udd8aj5Lfs/MZRg2g2LY1RXg=@vger.kernel.org
X-Gm-Message-State: AFq9FYK5xSQx+lU37pUlkpSqSNdfJVJwv2pUFGalduz2AAlbwP3eVuY4
	bQTsXElrmUaqGQ/wNtT4aANIOqOWqahH3QJt08S0nELqwoZ1IIS0P4ZY7Wg86DP36YI=
X-Gm-Gg: AYBFou0MU/ktUnwUo2+R5FAsTHE92M6v/MdC0hGt28JrFpZ0zS3dJ4a1o6ZrxMa8rVS
	Yc8Ytpidytwg3TEibz6C+Zy1lxCieflljTVLRKi1KW6JQJy9R1oSKzSx1MxMiGZGY1p0RiPlyvg
	UYj9Wg2vtS0gv2LcUN21cc9XBar8Fe554tEMjw0Ojqc+FiXpH7wzZNYpiC18ts7HYKXaLjHmkNB
	HzUWgoybeD6k25d8mcGf86ojTKsATccGOZgntjflhP+1McAk3COLoCKBcg8vmaWCxv6sJgk5tZW
	qpEbngMBcmzw/NG+pWJ2tJjT38e+5K1Oo48v362HD+UyQhtFdotsdM8/JiQh5VQjzXIg3yyYJba
	NvYJ1iUGDWOAYXcCT9dzXAYleF/kkZhkMZ9P3WLRL9kNtzvw7L8tAIcMrlTs96vqml7Vr8rl+mz
	mNQqlgOAlkemD2z2ECHk+UkkBNy3LrUqpBoE3Rpiq1m8c+RolKDefGgZfKcAK2a8xGCqqYJ+wsJ
	Sc1TlBeZw1oy5hnHkaDf2a4Xj+5hOy6TWLJpg0mDYy6YJmD+pPS+uI=
X-Received: by 2002:a05:6214:4808:b0:917:8b5a:8e81 with SMTP id 6a1803df08f44-91b55564619mr403547436d6.29.1792156976561;
        Fri, 16 Oct 2026 06:22:56 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91bcbb756fcsm22569936d6.42.2026.10.16.06.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 06:22:56 -0700 (PDT)
Date: Fri, 16 Oct 2026 09:22:54 -0400
From: Gregory Price <gourry@gourry.net>
To: Sarthak Sharma <sarthak.sharma@arm.com>
Cc: linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, kernel-team@meta.com, akpm@linux-foundation.org, 
	david@kernel.org, ljs@kernel.org, liam@infradead.org, vbabka@kernel.org, 
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, shuah@kernel.org
Subject: Re: [PATCH 3/8] selftests/mm: check MADV_COLD and MADV_PAGEOUT range
 handling
Message-ID: <atIkDw9r6CVDJaG7@gourry-fedora-PF4VCD3F>
References: <20261014175756.2035176-1-gourry@gourry.net>
 <20261014175756.2035176-4-gourry@gourry.net>
 <73c55ce6-67a5-471d-811c-facf712b2fe9@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <73c55ce6-67a5-471d-811c-facf712b2fe9@arm.com>

On Fri, Oct 16, 2026 at 05:47:57PM +0530, Sarthak Sharma wrote:
> > +/*
> > + * An unmapped gap in the range makes either hint fail with ENOMEM, after
> > + * advising the mapped pages on both sides of the gap. Only MADV_PAGEOUT has
> > + * an effect on those pages that the test can observe.
> > + */
> > +TEST_F(madvise, unmapped_gap_fails_after_advising)
> > +{
> > +	char *mapping, *control;
> > +	bool swapped = false;
> > +	int retry;
> > +
> > +	pin_to_current_cpu(_metadata);
> > +
> > +	/* Make sure MADV_PAGEOUT can swap at all before relying on it. */
> > +	control = mmap(NULL, page_size, PROT_READ | PROT_WRITE,
> > +		       MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
> > +	ASSERT_NE(control, MAP_FAILED);
> > +	control[0] = 1;
> > +	if (!pageout_until_swapped(_metadata, control, page_size,
> > +				   self->pagemap_fd))
> > +		SKIP(return, "MADV_PAGEOUT did not swap the page");
> 
> This test is checking for both MADV_COLD and MADV_PAGEOUT. So if we skip
> here because we couldn't pageout, then we don't test for MADV_COLD
> behaviour at all. Do we want it this way, or should the tests for both
> of these be separate?
> 

If swap is off, the behavior of COLD and PAGEOUT look pretty much the
same, and we can't actually test them meaningfully.

We check that madvise(COLD) returns -1, but that's also largely
meaningless if this initial pageout_until_swapped() call fails.

At least that's my thought.  If you think I should split it, I can.

~Gregory
