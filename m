Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD56C47DD77
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 08:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792053582; cv=none; b=gCX8EVuNYFEAAPTDFCiam6V/4qe7lT0TVbKt0IDF9WS9ktZSNnOb6zbblFCicMiqty9HxOa2qAPNwaJ5E+B5wXwds8egXxbNYdMLoYbE3SyvBPVR8Vq7GT0WgZgxCC3k/MhOukPCHdvuTwhPERaEgPjeFG85WSK3XAS45JHeYUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792053582; c=relaxed/simple;
	bh=WUnSr7/faSyMZiJC9DduJnZ6AjboGu7nRkRGG9mJ2ZY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FVUp8NL+yVDEQBgEi1OcD+TDDHJ+i7EWNAtavdDSjrXv8JhMB4G56JXutldGGYRD/vVzHLlm+2n9C6K1UFCAML2SD2gBc3AdPAxaHeC4lDN6NRavgXqnMzgwj9bQA5WK8jA6bWBIPv5YNIG3Ih6E0XfDIvTxhISxLsEK5otiHXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jafa1uvA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jafa1uvA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71FD61F000C4;
	Thu, 15 Oct 2026 08:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792053580;
	bh=XlhcTFporOc45iUrAemRtzHNltY+ILuEWa7USZu1uRM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Jafa1uvAXgtotQ6UZxgmVOGkG+VUznT6x8G8rUCDCMeXx+KdgOuxhOmICwpqoO5El
	 mTVIiwBgu8+0iIDrG5wjhm97OypiLtmvEus1cAWOnciBhe4KFVzPVQ9ofC1CLbmRRW
	 Jn5RqUXekw2ZkmZcT1iiIdUSxzYWT5u//7fRYRCglAEQOjlPaWn+JoBKdtSUoekEWV
	 mTPFikrKavr1ojc4cvJT31b/buQAXZDzri4IivxyfOcQ5turT89PCTD1BFUPZJXZkp
	 esWvg6jXBjQ4Xd0rnuveFCtBC+/h0pv2MCIB9faffBxkVG93ZjwFLZZSG62ivudTej
	 i0g3/bstxPxGQ==
From: Mike Rapoport <rppt@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>,
	Alexander Graf <graf@amazon.com>,
	Pratyush Yadav <pratyush@kernel.org>
Cc: Mike Rapoport <rppt@kernel.org>,
	kexec@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Bing Jiao <bingjiao@google.com>
Subject: Re: [PATCH] kho: do not reserve empty per-node bootmem areas
Date: Thu, 15 Oct 2026 11:39:34 +0300
Message-ID: <179205357104.207844.7161126108043305989.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261014131547.259138-1-pratyush@kernel.org>
References: <20261014131547.259138-1-pratyush@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Mike Rapoport (Microsoft) <rppt@kernel.org>

On Wed, 14 Oct 2026 15:15:44 +0200, Pratyush Yadav wrote:
> Some nodes do not allocate any early boot memory. An example is
> hotpluggable nodes with movable_node enabled. So the scratch size for
> them ends up being zero. Zero size allocations normally don't play well
> with memblock. Memblock returns an address, but then doesn't actually
> reserve anything. This address ends up being recorded in kho_bootmem
> with a size of 0. In case of hotpluggable nodes with movable_nodes, the
> allocation on the node actually fails because memblock refuses to
> allocate there, and so KHO fails to initialize.
> 
> [...]

Applied to next branch of liveupdate/linux.git tree, thanks!

[1/1] kho: do not reserve empty per-node bootmem areas
      commit: 9a6a70aefe77f6fb9ff2b3037dcf87f6dff65c8c

tree: https://git.kernel.org/pub/scm/linux/kernel/git/liveupdate/linux
branch: next

--
Sincerely yours,
Mike.

