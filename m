Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794495972;
	b=YhayY2tzXGCEZO0dCXr3dSzEughRRGg8qqHcKjdt0Ku/Yb9q3FmODJ7+cudOD6zzDbcZ
	 dGED5bDx1OnzyyVOQxHCmGqZRvPwwZeAQwPxj/m8fdYLgyBzUZvb4rUon8DZpChZ06VJd
	 ceMBiLNvGW6WchOAGXNNZRysUG9hESILIttfUMTRrx6HgxYliAXbN29lkdSqL4pvJSMWB
	 Ge27IBlKHu621mSA7k5+1tHj7USmKWEjtHpN+k8phpSpQGUmzHa4xhXbb4C0su5dXCrNU
	 UkRs6P00cbGyn+n4Ce+2ASRbW3DxfuN09NW0mNhJD6+eu9vg/XNdNsC3ZNmpntnRSoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794495972;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=3QaFLESo8P1tr3i+Kl+aPkGwBQBuU5DOM0WQKz2Fj/4=;
	b=AhDZkuG5gsZMJ0VTb06714CyH8guS2sPn55e+o4XgKsuJgkUIa7J4d2jitkiXBDGrmV4
	 YISnWBrfrhf2TfcxEcaZtDKvYSTBg2xk1O/PZWg1k8RPhvvvKMlDUmt2simbrAyTF0LyC
	 mHq0ztAX2y1dlpYq5mOlt8YseurbBS8pGS4+XNQD9wU2+n2p9Ki4X1UyRgdumuchU74hQ
	 qssAjmJev6BnjO4ZAKhqfIrO8uzwYUp4wl28RXPNuJfSdWv7LMjZlvTIq4dLPh08IGX4w
	 vbXxfDoX2OI3PdA8M9sC2oF5g1SkoossM4+jOxOsy7GRAwo8ByjCuGvxpbaezrpvn5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b74UMPcb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B712E606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 15:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b74UMPcb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E1D51F00A05;
	Thu, 12 Nov 2026 15:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794495972;
	bh=3QaFLESo8P1tr3i+Kl+aPkGwBQBuU5DOM0WQKz2Fj/4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=b74UMPcbNWmvg6D5i8NUpmHQ5s1gue7/SEK/9L4qT2s/FwRDq6g45eJ3dxargrj0O
	 IfUJDq5Ywa9nfWvgNZ2ri7DaO/ct4j4knW3z9iuky0N8ttekWTRHnf6uhUp6VIy5N3
	 pGEdBViCaz3BIgGhExQCG/VpzdZLz9vRUbCqBEqWpqwfWxCOSgldyUn6xWc1tHAIVu
	 Jpzfz3+lD6zgyJnTDRG7DjXqNSIYmD8ASjnpTek7C8imYFfGZKDdaduP8DVy/U00OS
	 HN7CQfkoNfMc4f13hTQjEr3cusVBJkK5Mh7d1SwGaoPhuRRAyNj/vEnY+BLNAyJNId
	 NoZ8SndGyc25Q==
From: "Harry Yoo (Meta)" <harry@kernel.org>
To: Vlastimil Babka <vbabka@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Sang-Heon Jeon <ekffu200098@gmail.com>
Cc: kernel-team@meta.com,
	Christoph Lameter <cl@gentwo.org>,
	David Rientjes <rientjes@google.com>,
	Hao Li <hao.li@linux.dev>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Roman Gushchin <roman.gushchin@linux.dev>
Subject: Re: [PATCH v2] mm/slab: remove outdated comment in create_kmalloc_caches()
Date: Thu, 12 Nov 2026 15:06:05 +0000
Message-ID: <179449594652.3028940.6311434157615107421.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112144653.840367-1-ekffu200098@gmail.com>
References: <20261112144653.840367-1-ekffu200098@gmail.com>
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
Content-Transfer-Encoding: 8bit

On Thu, 12 Nov 2026 23:46:52 +0900, Sang-Heon Jeon wrote:
> Since commit 16a1d968358a ("mm/slab: remove mm/slab.c and slab_def.h")
> removed SLAB, no kmalloc cache is created before create_kmalloc_caches().
> 
> So remove the outdated and redundant comment.

Applied to mm/slab.git slab/for-next, thanks!

[1/1] mm/slab: remove outdated comment in create_kmalloc_caches()
      commit: a7cdd0af963a420fc0e6f20b7c8bc8d4784098db

-- 
Cheers,
Harry / Hyeonggon

