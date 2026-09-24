Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D9A43DEDC
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 07:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790236771; cv=none; b=l6qfNSOeAM9cLTNmeE+JrR5HeW3FuWT0h4kL9V35/ovM32j1gt7y5GLwx+F4ATe8lXeRzfhicssmcYeLQ2+mXHL9Cu4kv3kstP+tswHfxjqUGBLJing2v1JsSlzMwWkw72GWfA949NTq0HH3oupBlpuSXBj+4RjpqzgVJqIpCho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790236771; c=relaxed/simple;
	bh=gxNLJx3mz8Vu2ubvLHDLakCnQ+k7+Kzt4I9gwXqM8AY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=b4AOOkDJUTw6y8oQrma1x6/92W5rByXMRS48J6N/TbnbpV5xaO7p9Dqtzyox8r2b6DlN9noeL/GMzn46FYTjQCVug5RW8Uv/qgqukopscs8yfbh2BNDtU8fwdFpL5A4YGAybxCrGeEsydEkuTF12hFFdMgXBu9Sbw0dBwdSmjqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ITZboI8t; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ITZboI8t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 932251F000FF;
	Thu, 24 Sep 2026 07:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790236769;
	bh=998uBd1XYYEP0ytxfXGnKoiJo1y3bsTMZfIe9aU14nE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=ITZboI8t4J2shJ445/0XNbKX8PK1mwZQjW709wnw7y1/PamU6i5luxP0tFN052Igc
	 jx/7Tac+V5gabRA6lkC5cYq5rAuliwCh9Mse7KUAmEHloPR9DUPy1YX7XSiS0GeDdD
	 Ik6SyfyeOTCLr/JI0W/ln7MWCurQWTEoy8zTecf/WwC1Tj5nVK6XOPVTzkD+nh4csl
	 Si+gg25/dtD9ZBPUSAkbCIPzUqxySnc0SjWfBSO+eLbV4cmnPApfA72M8oiCRniFLv
	 0lQawIPR9Gn1lhizwztBCOUvsVYZy/B2kuLYpQRVWPUP7XHP2gYbobtksqRGuLutx7
	 Y9yrbMaX88UhQ==
From: Mike Rapoport <rppt@kernel.org>
To: Tianyi Chen <hi@tychen.cc>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260923023126.1910311-1-hi@tychen.cc>
References: <20260923023126.1910311-1-hi@tychen.cc>
Subject: Re: [PATCH v2 0/4] memblock tests: fix BUILD=32 address
 conversions and warnings
Message-Id: <179023665438.508753.12271049963919722675.b4-ty@b4>
Date: Thu, 24 Sep 2026 10:57:34 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.1-dev

On Wed, 23 Sep 2026 11:31:22 +0900, Tianyi Chen wrote:
> memblock tests: fix BUILD=32 address conversions and warnings
> 
> Fix the BUILD=32 physical-address truncation and sign-extension failures,
> and address the remaining GCC warnings reported during review.
> 
> Changes in v2:
> - Use memblock_phys_free() for all synthetic physical ranges in the basic
>   API tests, not only the maximum-address check.
> - Keep the dummy-memory address conversion fix unchanged.
> - Use __pa() in tools virt_to_phys() to avoid a pointer-size warning and
>   sign extension of 32-bit pointers with their top bit set.
> - Initialize end_rgn to avoid GCC's maybe-uninitialized warning.
> 
> [...]

Applied to for-next branch of memblock.git tree, thanks!

[1/4] memblock tests: use physical addresses for region removal
      commit: 9357596afac61154e7f54048c0add9f1293b9eba
[2/4] memblock tests: zero-extend simulated memory addresses
      commit: 6957416ae43de1830174f527b5b8cf737401a8dd
[3/4] tools: use __pa() in virt_to_phys()
      commit: a10f3a08d248fcb3006f587faf42437837fd12c6
[4/4] memblock: initialize the region merge end index
      commit: ba94f68b754985f77c3f6d3354df74952a1e0752

tree: https://git.kernel.org/pub/scm/linux/kernel/git/rppt/memblock
branch: for-next

--
Sincerely yours,
Mike.


