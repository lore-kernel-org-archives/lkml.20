Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794909804;
	b=M+IvQq7Goj9GDymm64OosjrwwOo+r+LV3yVlxdvZQ7HChPnFUeqIpBmC/5JZMYEt3kAR
	 c5TyAEp/K6n9YSQT0cDUQCD8rAOdoiowAYTJQjoaRRc2XgqdzcNOQMaB/qoI9bwK2xFYR
	 UJ1DRlquVyNPqeGm19ndJLs5nSNFX6WmPK3QxVcAFGWS4ITK4l8Nqu5m4QpUlmAD9oQR8
	 hfmw8sqYYdK9+4dnYA8aqiq5bINqhkICZkxjEah0sf3ERRUkkiRqyNPW07j8aYD6KT6F0
	 1OYusX98SOvzbUTXJbqsavW2bFun88Gv85wNZ1w+4YtNU7emAJPGbxzchU7Wii8fMrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794909804;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=LLK+IGv2ggFjXZSuGp8l0UEwQwQwUf8yC75OsLJHlz0=;
	b=mf1TP/NwkHCRyu3kVAFW6KbwWJbLRvIcDUjWSg3jSdsz/a23Ad+D8Y8CMwOVsVJAtAeH
	 Dw4GVC1e1+o6vuqU+3NdzxopULQ1IlZd4/2NtBbuCjxGLyBd0BjWJC2AtvvNg8J0Pl81s
	 3Y5Jo+CYqhUTKBrvPwJQvXcoy/MtkFYdFp3k/F4PjyZ3matQTox8vBL7LgsJcKMz92mlk
	 NDUSDnpKxzox5uApH1pS9Ad+Cn/TmVSWZ6hC25GQJtQcG0RR8Fk3Wg6nv7xe8WjOle+7d
	 x1U1Y1YubCtbp3H1u1EtXgHAzmhOnAIFukbW44bGsOPiOB+rIFdjrQtf+1fP4v72dVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="fQj/Gx4M";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A86606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 10:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fQj/Gx4M
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 314CB1F000C4;
	Tue, 17 Nov 2026 10:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794909803;
	bh=LLK+IGv2ggFjXZSuGp8l0UEwQwQwUf8yC75OsLJHlz0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=fQj/Gx4MpWTb0HS/QyBN3HDcXOn2ruyxu1noi4UPMonZE4mwguKdHXtczFhB6PLXY
	 zrvoMBTb0Xhbp3f74EfDYXeaSu+omudQ3+lHy9Map9SwVotVMNsvTWRI8xEXyNFK+I
	 9176wuEGJOZ8YP3pqq8Uk3rvsZRGFARZP+MZ/6EDeW6ccrjomOYAPtQNaZz/kz4x74
	 7hvpzyVC5oYV8SD/dYJgx2xIuwbAp8UJXfYB1QLHu7tasggTg/Y0OTWCL62q+FLlYO
	 7hQiTUDsT+rwQ5/2+WJkqs7Vmct9jm0UbaSEk9G5fF9tG07eME5aGR4QeM/Uijgly0
	 TNdqcbORy+cMg==
From: David Hildenbrand <david@kernel.org>
To: David Hildenbrand <david@kernel.org>, 
 "Xu Xin (vivo)" <xu.xin@linux.dev>
Cc: chengming.zhou@linux.dev, ljs@kernel.org, linux-kernel@vger.kernel.org, 
 linux-mm@kvack.org
In-Reply-To: <20261117015009.611551-1-xu.xin@linux.dev>
References: <20261117015009.611551-1-xu.xin@linux.dev>
Subject: Re: [PATCH v4 0/2] mm/ksm: clean up scan_get_next_rmap_item()
 initialization
Message-Id: <179490980182.4957.9865090817609300343.b4-ty@b4>
Date: Tue, 17 Nov 2026 11:03:21 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0

On Tue, 17 Nov 2026 09:50:09 +0800, Xu Xin (vivo) wrote:
> Currently, scan_get_next_rmap_item() has grown quite large and complex.
> When introducing new features, such as the only-merge-zero-page mode we
> are currently working on, we don't want to add more complexity to it
> and don't want to touch rmap_item structures to avoid unnecessary overhead,
> so we need to extract some common logic.
> 
> With these changes, the entry of scan_get_next_rmap_item() becomes much
> cleaner and easier to follow, instead of being cluttered with unrelated
> boilerplate such as stale stable_node pruning and cycle initialization.
> 
> [...]

Applied, thanks!

tree: mm/core.git
branch: ksm-7.5.misc

Applied patches will appear soon in mm-next, followed by linux-next.

Please report any outstanding bugs that were missed during review, so we
can either drop the patch series or decide how to fix it up.

It is encouraged to provide Acked-bys, Reviewed-bys, and Tested-bys even
though the patches have already been applied. If possible, patch trailers
will be updated.

Note that commit hashes shown below are subject to change due to rebase,
trailer updates or similar. Further, this is not a guarantee that the
patches will go upstream. If in doubt, please check the listed branch.

[1/2] mm/ksm: extract helper functions for scan cycle cleanup
      https://git.kernel.org/mm/core/c/c3ee56cc
[2/2] mm/ksm: add initialization helpers for scan_get_next_rmap_item()
      https://git.kernel.org/mm/core/c/0eec9abe

-- 
Cheers,

David

