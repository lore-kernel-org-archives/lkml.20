Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5604258CE5
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 09:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791970997; cv=none; b=Sa7H63hRxjqwquWmKiBb5mV4r2JFvfXaU1+uafE5tPvj76y5h2CewKTIeDAXQRJsHljgeaKEXv/l9ie+7NE/0udmoqcstKl6Zjq+NAjEbc/2zP2hgjz9SjQBHJAiLU3hgkMCMfdFGybs7u37vlxdWQiagvK7Xs0kGkulBQdzJ+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791970997; c=relaxed/simple;
	bh=/u9AYPaL2+ofC6n750AKptq4YtaPMhUQnmQw1XgZqz4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=OTMYsK+Y4AIpqBLfBtFNiLFH1ybYa+4RKsFGA4PKuwRnuTyByTtSEe54SIZaTNXe8D9WTk+XEauZPaJSlWFeAaLoh1j8U1GCi2PC2H0W/hw2cBYQQP8oMeY1ZFOoN3s9gVOQLWBHNMoCYt7bzosXjnqCPqaWW3fAKxT1J86YPHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TvHMT19c; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TvHMT19c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3E471F008A4;
	Wed, 14 Oct 2026 09:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791970996;
	bh=H5SgPo1HKKa1EEOsG2iecS6xN05Y0dz7KAy0sbsqSs8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=TvHMT19cp3VI4WXyMxkIIIl/rLkbwnHjQpC0jxXIXIcVqdL9JKKmVSSbx0r6hV7NC
	 Vrdpvz6qL4kqmdUa6ndhhBm547HYFlNtakrQ3150VOtqtxUgg/At6OYcKjKBZk+DZv
	 vTHNv6FZ8qbfem4AYLoZguZfvTOcrfUV67OCW+gFpCPJKpbB99Tqo/D3vKkSz2WuNh
	 vOWrjJzt4ic8ZI5b/0emBeZqAp8Vv1jjPYP+7Cil/RqS1xO96u9SkfKZBXadyOL6aJ
	 clD/IfYffLkkLB6aXQpFPDbtUq6WSVhV9vCPzmBbfUcRE4h+1LFv2vb8qkbUou6csD
	 GdwrM3es/LR9w==
From: Pratyush Yadav <pratyush@kernel.org>
To: Haolong Wang <18766350203@163.com>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>,  Mike Rapoport
 <rppt@kernel.org>,  Pratyush Yadav <pratyush@kernel.org>,  Andrew Morton
 <akpm@linux-foundation.org>,  kexec@lists.infradead.org,
  linux-mm@kvack.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/3] mm/memfd_luo: preserve the sealed exec-bit
 state; reject kernel-private shmem files
In-Reply-To: <20261014035228.473825-1-18766350203@163.com> (Haolong Wang's
	message of "Wed, 14 Oct 2026 11:52:25 +0800")
References: <20261014035228.473825-1-18766350203@163.com>
Date: Wed, 14 Oct 2026 11:43:13 +0200
Message-ID: <2vxzmrsgipn2.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hi,

I refuse to review this series. It looks entirely LLM generated with no
quality controls at all. LLM generated content is fine, but you can't
just post low quality patches and expect humans to spend time reviewing
them.

The commit messages are unreadable LLM ramblings, the code is all over
the place and makes very little sense, you have made 3 versions in the
same day, your cover letter doesn't even explain your use case and why
you make this change, and so on.

Future postings with similar quality will also be ignored.

Please spend time to understand the kernel development process and spend
_your own_ time understanding your code and polishing it.

[...]

-- 
Regards,
Pratyush Yadav
