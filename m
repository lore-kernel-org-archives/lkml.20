Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794320687;
	b=RJWtHlW4uF8bpS6f6S2mMb8A39noFR8nFhvrHk6ewNm5wv5k2rEf6h2G9b6HjuP95PD3
	 FiZaEoYwd6lJiLDbJzedK5EgRWdhGHnDGUG2Ov3Y6J+atO5v+8LJ2aggsOU4uc8Sy71pK
	 id4vOcxT3pUB8ZxO9BMsjgATAImNIsFqHlUDDMEeg8RigydnCFloi5sJcJmabazSgcA3r
	 /3GEyXO7WMVHcHzEOqnqXnYF9tk7o1ehASy1psqBdPpXt+OctVJWwD7MbzLFT5TDUAiEk
	 z/bpNOOE3NGdHh6FEOWo/mslSEbsVHmsH1bl33XGjnlhPB+WnYEA8N/7yt4iHrozqyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794320687;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=wS0G4PKOC+sZAy6EBQh5wk5dk7w9XV8dQM2PrsOePY4=;
	b=kUAgwg7FVRAdj9sYrEVGAmker/y9YAmn7gQ6DOXTb3zg1oyeS5BOBlqstlgdV46YVMbw
	 ICYQq5ZU4cJVxYJhb0VLcemJgDKgNzxhKTXB5NEa4ADVAeOlWW4+mMbUa6f+KCa4gVIq4
	 ocX76Mhj1SzPVdRT9bRXANmEBcKEmFpq6WNwiS85NbjZ9gp5Op60N+TnyhkQ8KnaTP00F
	 VClQiPRYMnnSEW4bEMf/ePrTMrnWV2XGL4SG46oVc8IJhNk/9tw5OSIsF/34oXD5nCkKH
	 WkrSE7lQpOaNc7lAYbN6Uu5plTTmYh4bai9vqa2MtkQgGQpRupA+otQxfBJP7yzM+tQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nD7cRy+X;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A349606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nD7cRy+X
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C28711F008A1;
	Tue, 10 Nov 2026 14:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794320687;
	bh=wS0G4PKOC+sZAy6EBQh5wk5dk7w9XV8dQM2PrsOePY4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nD7cRy+X0568qFu8nUcq6JPrvPOJVhYUKp+avz+0J42anE6gpzVlqiUeSK6aozltW
	 RXRemI/pgDGuJXvkWk0vgMLHL80NRFZXf/JcwMuK6HviQhrU7Svp5Hhz6cPqVYWt9k
	 RRPlmy7863npcCz/OJPNh9cRphmve/iiaQWhepVCKT+krHfgQuXgwyzqMKWEQGtvgD
	 nwq0vQahadGw5udecF/tOEUcq+6691mzuuekKrBnF2LAaKfJc2Gjzsavf+roBL0X7j
	 amsceKqUsw3QIvzEXiD8CvdvXsr2xVdXh42N1rycfOtgnGzwV1JWa9amCdFtLHzdF+
	 lUp//15v6v8Qg==
Date: Tue, 10 Nov 2026 15:24:45 +0100
From: Harry Yoo <harry@kernel.org>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>, Hao Li <hao.li@linux.dev>, 
	Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Conor Dooley <conor@kernel.org>, Damien Le Moal <dlemoal@kernel.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Alexander Potapenko <glider@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, kasan-dev@googlegroups.com
Subject: Re: [PATCH v3 09/10] mm, slab: add slab_tiny boot param
Message-ID: <avMo-x1-lj2YU2rZ@thinkstation>
References: <20261105-slub_tiny_rework-v3-0-0484ce59eabb@kernel.org>
 <20261105-slub_tiny_rework-v3-9-0484ce59eabb@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261105-slub_tiny_rework-v3-9-0484ce59eabb@kernel.org>

On Thu, Nov 05, 2026 at 09:43:58AM +0100, Vlastimil Babka (SUSE) wrote:
> In order to deprecate the CONFIG_SLUB_TINY option, introduce an early
> boot param slab_tiny to control the value of slab_tiny_enabled.
> 
> As long as CONFIG_SLUB_TINY is still around and enabled, this boot param
> can also override it to be disabled. That could be also useful if we
> later add some auto-enabling conditions such as detecting the system has
> only a small amount of memory, or being a kdump kernel.
> 
> Signed-off-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>
> ---

Looks good to me,
Reviewed-by: Harry Yoo (Meta) <harry@kernel.org>

-- 
Cheers,
Harry / Hyeonggon
