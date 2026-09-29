Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF883E6392
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 08:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790671099; cv=none; b=P7693FAbfLVF0j5AIMuKLVxW15KNRoW/5XPXPcb3yzKYSsxYxbQgVFJV0IepnH1jsP5powFfzraJMeMF0VlW6YUAsJzXaIQgW4ggY9cl52PuUZsqatlovYA56ua6CzkP3zGV/ecX9iw+Zk/i8qWu2QDzqVuq6KZWKxtxWEW2XJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790671099; c=relaxed/simple;
	bh=rKzC6ijtYS99rEzAal5n4agHKy/S1Dy0DTP3DnN+7g0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f0Xwgn/XFHv0zH0UEFOWdbCBJc4WpLOPFxvR2tY0eHCijQ1n2FQOb19S0IkdI/xdC2zcug0DU3Oj/hCP1Ictqneq9NzHROhNpSKFwKFofn3wvSdlZTawLlul4QFffEWmxvlJm+veQbL8OKt+XlBlelIzK7oi7C0HYmfdbqEKVyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Et/NCyQT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Et/NCyQT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF5181F00893;
	Tue, 29 Sep 2026 08:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790671098;
	bh=iz5ZvXuN69BjPyv2G6HIms6qrpA+v8co7aU/JAxPMNE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Et/NCyQT7O69s/oTI0wI7TsZqQZ4BKiyPwlsmyvZXaQwi6qYH4wC3HNeG35KmYtdH
	 16rbfDWcY6FBulk3pCXZCBheSHbR9CKUreOrvVx3NIhT7iCgFzBli+GdrMeL4jt0OV
	 YLI8pC3bxAe3iZ8dFIAfaafOfqEp0davudYDsxUtIuq0nLLrku3xYuaxY0tyqTuR2g
	 pj0kzTGZQIz3VPo51nFxAT7rSF1q7zfdCXsZOSWXu/5oc1hhLBrdPpY0IMfzngOaFp
	 Sy6yMxjf3TFy9xHuVCBlwfoO1EMkOp79jWNfE5AxYmtByip1HcmC65oDtgLLGlR2pv
	 YzDvp8g8KS7gg==
Date: Tue, 29 Sep 2026 09:38:12 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Park Tae-sun <ts930@dgu.ac.kr>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R. Howlett" <liam@infradead.org>, David Hildenbrand <david@kernel.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, 
	Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/mlock: fix zero-length request normalization and
 integer overflows
Message-ID: <art47ZLD3Ioxw_1I@gremlin>
References: <179066531783.50175.13377521828379196177@dgu.ac.kr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179066531783.50175.13377521828379196177@dgu.ac.kr>

Hi,

For one of several possible reasons this mail has triggered an AI
detector script.

Note that, while we are fine with AI assistance, it is kernel
policy that you must disclose this with an Assisted-by tag like:

Assisted-by: LLM

See https://docs.kernel.org/process/coding-assistants.html

It is also kernel policy that you must fully understand and take
responsibility for every patch that you send.

See https://docs.kernel.org/process/generated-content.html most
notably:

        If tools permit you to generate a contribution automatically, expect
        additional scrutiny in proportion to how much of it was generated.

        As with the output of any tooling, the result may be incorrect or
        inappropriate. You are expected to understand and to be able to
        defend everything you submit. If you are unable to do so, then do
        not submit the resulting changes.

        If you do so anyway, maintainers are entitled to reject your series
        without detailed review.

In general, if you are a newcomer to mm, we expect you to do smaller work
before moving on to larger changes, so you build understanding of both the
technical aspects of mm and how we do things.

--
Cheers, Lorenzo
