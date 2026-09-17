Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C6A94E06CD
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 12:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789648029; cv=none; b=juo+jZi2CXR7rhH5FpSEMt4HP2YABy3SqC79w/S2ffgm9AmLC9BWTL3JNNXjxNyDPU4Puf9+TdjbofmERUfByaflS7HWsNSh2UvwNA/AqhpUJCHd9yNTbJtiM3v8lYgqdQjzKEKwUNfBK/UJlDRiX178JPgHktpfoc43O3IWr00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789648029; c=relaxed/simple;
	bh=vaJXnuN1+7gN3LnxmqGkVL3QjiTCwZCpSeRtfqwwwBA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aSv6uFuyXyftD0CufD0uYXQw49fxapiZ0bPB26DkK173p2hqCYGPV7yiCA/CoG5J/Iygy4WZRWxeK9Znhza6mRLFv0p+CZdajYl32uaU8OWawSdVcGh6nYwRk081m4zKxCgP/Ed6Tpa4TlgcW5C1CakT/F3e31PNTtuqAe78xAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=Yc0v/qpw; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ALN8pvoY; arc=none smtp.client-ip=202.12.124.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="Yc0v/qpw";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ALN8pvoY"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id BCC361D00019;
	Thu, 17 Sep 2026 08:26:53 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Thu, 17 Sep 2026 08:26:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1789648013; x=
	1789734413; bh=0lyJ8zqBoEOycT5nzPuEdvgCgVgM2x5/iPvVMuCaVJY=; b=Y
	c0v/qpweF+XkmUFfjS8UkDWrnJbtI7+FEdnJLT3S6mGvvyPZAEo7YZEANPn/fq+z
	O28S+HKUZjjWNqF3JwyhyJKKwbAxIle1lxw4rL/ZKjmqB+STh1vy2CUi42FX9BTy
	2L6HzF/M3WO24FuaQSUvE7d4HBWgbPEAy7wiVYsQLtJN7N71jXNoH2SDo1Rj6PM+
	mCXnie2NZoYz6n4JNbQpXMo77/dUrBBMO6Ud/dnxAFR8Wm5roLQFV/e4eviOXTRS
	q1+Ot8g4fSKXPZa8EIr1u+2hsQEH71EEsYambYO4Mwtqk/yPo4AAa6Wj46r9lAIO
	Ql6QQGI3e6iBlSNX+eCDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1789648013; x=1789734413; bh=0lyJ8zqBoEOycT5nzPuEdvgCgVgM2x5/iPv
	VMuCaVJY=; b=ALN8pvoYJsRMNe433abxYc6n5sOtCrv4CBuFxOaMJKsyCjQfJdG
	QiKair/ubRVxfFl7+g0c6w7OWwEES5gjDl8qJbpOLcAm86RycrEEMwoDSaO143Mo
	ObpVVDA9qTYYLde/gyWvs+THbAH6YP7OBl0F1mqZjRx2CAym3NhM8y+6GBAhHdqA
	BGQZoLFmqRQ0i4fHeP9HNmF4uyOfuq5hI2+JKWrLPPT91uUPw+doU3Jsk/t4iNLr
	fS0cgiw2aWzjPbGI1NIUfOiIpJRogfrB2GEAUc9WMser4WZwLiI8LU9rZMsMMGNw
	9GMRSay8jiALrXKBZmMugPxuuAGU0ViB22A==
X-ME-Sender: <xms:jdyrakRoZI92Tp6sc8CLBoOhDnwe92mamuZmAB2XALyp9poloaoEcg>
    <xme:jdyravY3vadlYzNchPVd6w2zwZN9SUoC6gRe5tigCjmSxumI_2I9y8ArRgihc-tyd
    jipFsucr9hpRfDfrWmZJoJF4NPuZ1WTUMCEktmeu2MlwfA2YYpRwGFS>
X-ME-Received: <xmr:jdyrapNp2CUcfXxLANiniFIsJ7Ev3t6Wmil50whE255GfTZlYG3lp44Ghyg>
X-ME-Proxy-Cause: dmFkZTGIiRiuQ5PMdB2WYxmL16h5CDXoi1BFdRa7lEVtBzpOMWHvb9A4/pu05WY++SyB+h
    qExORmtkwcpdpBx8kTLTdD2wg0WhATVYsrhgOD5W+6ELkRdhoGJssibkTiIJKtVXEjtk7A
    abZuYwWU65Tb9ms4R2+ualLkQ9DW57htukuLgBJ1T3SoWy8/WQzkTiBwuJv5n84UkwNxs5
    M3SXhPj97KF9C7Fzth0o/d9Mv0/WeFzA4nIgaD/nn4wtzFBm6/B82Nx8Qb5vXsDuOk0wnJ
    okZKZfIrf3eyA3N1pS9qk8io4H+hh41gcNmq+1pesqMZ+KVqRTIiVkArDwfY3zihPAo/cp
    shq6EuhFEI+p78q5WfCrVdjXX6r/GfGohjsYha8rR2ghFknr8HzMI20hLV4AkFwzXcCotj
    oDEh8kOdZ9V/fG5MToWJIhktomfB0yGIF0rLqhGX9hRLmte0KUdjqZ/sq2eRmnIvgwd+KQ
    FrwwLRffN7dh8onZo2ufvtN0LasncW4XM/AACBKhjhzhGOZiMZQdQ5iC0BNOarm5fckdIB
    +LXF4HO8ZzS97Ze5a+Vdw+vlJ15cERKPbcfCKPScZcVuarkG6laBE0ODrtaNV+js+SwXxA
    Un+vN6ZcLtrhw/FhRk9d11voZB7nEz9UWPp38Xrpc1HK+2NU2L28Xqm5SYww
X-ME-Proxy: <xmx:jdyragPSqitgC1MlxnXpN6bbVDo49IBbMen0y8FE8q9LkTXAAE-4Hw>
    <xmx:jdyralPVFU_zzhXlw1oGsEuxEX3vmI98H7BAL7mN0tHGvMdCDw4zVA>
    <xmx:jdyrakbnB9DM8HUjWyVvDaDbfkEeDiKaB8g4V_03s5FkbAFTiHll9w>
    <xmx:jdyrarinjKDK4oeu8C-8eC1662fFcY_Idh8x26i2DejmRWtNbbn1vg>
    <xmx:jdyraqhwaZ0ZEZMIr5H9bj7ikmZa54srOOa3YA6BcW051TM7hTWYIZ-F>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 17 Sep 2026 08:26:52 -0400 (EDT)
Date: Thu, 17 Sep 2026 13:26:51 +0100
From: Kiryl Shutsemau <kirill@shutemov.name>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, kernel-team@meta.com, "Liam R. Howlett" <liam@infradead.org>, 
	Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
	Usama Arif <usama.arif@linux.dev>, Vlastimil Babka <vbabka@kernel.org>, 
	Jann Horn <jannh@google.com>
Subject: Re: [PATCH v3 00/12] mm/collapse: separate a collapse from its
 callers
Message-ID: <aqvcElQxmtysJwbA@thinkstation>
References: <20260916093145.4022188-1-kirill@shutemov.name>
 <20260916154826.a55591eec86b5514dab898ca@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916154826.a55591eec86b5514dab898ca@linux-foundation.org>

On Wed, Sep 16, 2026 at 03:48:26PM -0700, Andrew Morton wrote:
> Here's how v3 altered mm.git:

BTW, is it helpful to append a range-diff to the cover letter on a new
revision of a patchset? I can do it in the future if it is useful.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
