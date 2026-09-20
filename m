Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D262EBBA1
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 10:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789899342; cv=none; b=uS824Y9cflH9MCk7g1xHdw3AGAI62JthrH7YeVCMua3gwRPECGeq9lESU94GqwLg36tvED+8MEIWoFnS9AQSLqLaLP+yByy1e2He+1/+4CQHgWWDcqNNu0jiAZtRNNyEzwA+psOLJBG46PFKuS08HFCIgFLSNRDirjksyD8Fnf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789899342; c=relaxed/simple;
	bh=mP4LBcsk8SbUUg5L9VQYHG5XTUfJqZzfjqBrf1Vbspw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GWwd4umO4WET2d98Bk66f4UlnkQyiiPqjTmh3JM44QLUwY9PHypNuyYDNDXKcxAUu+6gyJEPpilxKIz6sBHSwF66k1QMKEwYs/wbU152vhORkE06o/POLeuJb+/rE3jr8VrA5HQF+u6qT0ZdPAnIXf+lBCc8+q1YwLsa/lBAlOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lt6Lliyr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lt6Lliyr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B43181F000FF;
	Sun, 20 Sep 2026 10:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789899341;
	bh=mP4LBcsk8SbUUg5L9VQYHG5XTUfJqZzfjqBrf1Vbspw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lt6Lliyrx6wJvs1xcjP1ZckgcNwtCTa4efHtXdEYCNTCsp3h5+IAJN52pwnMfWV67
	 IAnW+MJIO7v78IZdnjZk8jhhCIfgG1AeQc84W7Mf7/+dBuBOgxKo2XwE3ecsCRJUfI
	 E5sCQV7rzmlirmW8XZd5EBCRKJy0Se/a+q/T656v+22BOZN7jfd50kThusNxn9vo/m
	 C4xq0ySGZq4ee0LE6c6E38p4Px64b25ynKt1hVpzZer7dFkjhK+ZQtJX32ywDuNEn6
	 1Mac9tq2Lzr88YUy5J80vQfCElejgza11vExf+r2z+7JBlzgEdqlA+9NqjywkTMQk/
	 aCyNI2cEh2j8g==
Date: Sun, 20 Sep 2026 11:15:36 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Hui Peng <benquike@gmail.com>
Cc: akpm@linux-foundation.org, liam@infradead.org, vbabka@kernel.org, 
	jannh@google.com, pfalcato@suse.de, bgeffon@google.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/mremap: account unmoved locked pages in
 dontunmap_complete()
Message-ID: <aq-s1erMd9kCgrRb@gremlin>
References: <20260919210612.3028241-1-benquike@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260919210612.3028241-1-benquike@gmail.com>

NAK.

You are engaging in abusive behaviour on the mailing list and it's totally
unacceptable.

You sent 115 patches across 40 subsystems over a couple hours.

https://lore.kernel.org/all/?q=f%3Ahui+peng

DO NOT DO THIS.

You are in complete violation of kernel guidelines on generated content -
https://docs.kernel.org/process/generated-content.html

I will treat the report like an AI-generated report and figure out whether
there's anything valid here independently.

--
Cheers, Lorenzo
