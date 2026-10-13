Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB43E4B203D
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791885995; cv=none; b=bOwbw0gMLDn7lTjK4IbCvgFZLU/LqcK1ONwcac6Cpv5HBgsstyjUVHY9rxqw++6xD0uHtTrw7NCqOLklu/gUwKtg+Iu/VTEXYI6MPmbP0WOjmbGE+PMjSsuveCl96NTqICMZ7tRt7m+r2o78ZDB6sLW4jHNxZz5TmwTZxMqF2Kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791885995; c=relaxed/simple;
	bh=eXZKAVGojzj9jRst4y/o4JVAxtunG48awqKsCpW74Dg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jTPpxUCo+co9MNEU1ayoT1Or2yTU9vDspQ+1uVcgtMvic7nJ8C7kbQYo6p42Ia/XYGod5IxMnj8JFv9GgMHy7uzG34qkFsjEJokGkz3QQR+YrgSWmpe8oGtjAJiS7SVLNgSkxMXA+8eFDUKIlLvH1XRasawuyNScUXdQDKnl6dQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bm5Rr0+o; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bm5Rr0+o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 287461F000FF;
	Tue, 13 Oct 2026 10:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791885994;
	bh=gU5utLVnwFgQmWLZFQ4HFSchng7Sy7XfB2Vr8rq8k3s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=bm5Rr0+ol4pjiJzwi/GQKJ0ntegEVZPrz4cJnarSTTrO2k5Etyt/wleY5J38Ll9d3
	 4XNROqEiPrx7zUF3rOmVGAi08whzPjLZoLyItDQukcM4GczFOp0rERJ9Vd4737LeQu
	 FuHeXWHT+swUu4L7Eb1fb+bi54KfTLOAXebsIXVAS460rKVp82oAHQRbL0606tkr2J
	 wEZEN7tLiPwGNYTjRo6Rrlqe0aCg5RLB8qMfWcwHq4G6A8Es1LI1uy41aUF7+oerkv
	 BvFUMMHP0u7GRBvfEujf/sMCaRuDCErqPAtbDKwvEsz+JGvGNAnKFcvf2GYIvymRrn
	 UsuItD5TgJMIA==
From: Mike Rapoport <rppt@kernel.org>
To: dmatlack@google.com,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Tarun Sahu <tarunsahu@google.com>
Cc: Mike Rapoport <rppt@kernel.org>,
	kexec@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] memblock: drop for_each_memblock_type() and open code its users
Date: Tue, 13 Oct 2026 13:06:27 +0300
Message-ID: <179188590478.4188181.17324869307973975022.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261008190828.3221718-1-tarunsahu@google.com>
References: <20261008190828.3221718-1-tarunsahu@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Mike Rapoport (Microsoft) <rppt@kernel.org>

On Thu, 08 Oct 2026 19:08:27 +0000, Tarun Sahu wrote:
> for_each_memblock_type() always starts the iteration at index 0 and its
> body is a trivial 'for' loop, so it hides very little. It also gets in
> the way of iterating from an arbitrary index, which the next patch
> needs.
> 
> Remove the macro and open code its three users: memblock_add_range(),
> memblock_isolate_range() and memblock_dump(). While at it, move the
> region pointer into the loop body scope.
> 
> [...]

Applied to for-next branch of memblock.git tree, thanks!

[1/2] memblock: drop for_each_memblock_type() and open code its users
      commit: aedb8dde08f8cd93ce1cc3a23273f2ff7238f832
[2/2] memblock: use binary search to locate candidate regions
      commit: 7a3477ec5793ab8c25be4db3e7dfe8a461bc775c

tree: https://git.kernel.org/pub/scm/linux/kernel/git/rppt/memblock
branch: for-next

--
Sincerely yours,
Mike.

