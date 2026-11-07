Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794049093;
	b=tKFafvM3jXKUfrbJ9rvV2R9ov2to9Bs+T3oNZADztiZNaWkDXKL79HItJte4m+P64Q5z
	 Zs+xZiEm0HXF5GKCS9D230ZoZVf0rjusUaXHcupbzG9W1z7NUcqD3XH9bsSX81qZ+UjXq
	 bnaRwQDGUdE6oTAcdbeXRybzhW+0gFN1S7DhTQ7BVxqLxOIxP6kSNgbudkGdPU716yxqG
	 MZqJunYCqMw6OJyGpxErazgjWZ6nGFSAtp4qtJbf8ISetae45zXSMDTcTDs1dzn5XgaMv
	 9S7DloK8Pd4fb4jqkzPqliUxl6VLZ7ioWyhM9uT1XvAJ8oIeZ2HilCfoAElm3L4dsrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794049093;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=ShVD0/lFnfCk9+NOZh/vGjWFTDGdc/JlM5VbuhQviNc=;
	b=KWPnR5r2D4FVusUgUPjbhETn7ajb5pMnpcebRXkAL93gYFzIbCN0vYSrbz4GJaZcwjpS
	 +505tZD/uspeePw2sXXBEzsV41h63TrjwZ8icEVgPJEsA+YFt1GAOnfqZpyRx/eSNWpqe
	 ZvDOdSU5GufXa8GQ55fK52LBgWTk5So/gcgfsdxrufxyyzFgf2U3ujjxUerzzJ+5dDv88
	 orJ/vpeWhRj3LxGIGGjoKjjm+wEchmO22MFriNBmHZNaYqZM3eWAi9WL6FxSZ9FtfCwZu
	 tpUqs/s6h1wvmf1hRXIhZwqsrsP2KX8OMPxInECdiFXgA6BOjzodXNLQBTW4WU7pcbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EQ3H3g6M;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A8E606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 10:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EQ3H3g6M
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B4831F0089F;
	Sat,  7 Nov 2026 10:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794049092;
	bh=ShVD0/lFnfCk9+NOZh/vGjWFTDGdc/JlM5VbuhQviNc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=EQ3H3g6MXx4JGlDF6JwT31Va+JkSFnKMBVWKYAd5bJSjzveCS+TEwtfvgYXLFNpUt
	 Xre38xeRz3BfrZ2v3DJtfGLBzu0t9kZzfzKedtLshaYxyXFbJMioYAtJ433HDOdiYJ
	 NqFGK6QGXqKxzBSecaWejwzkphBsLWBB7CLxaFw5VFPiQeuLz3FSHouMZl0IOZLhNL
	 xX1+o3OL1mVqwYl7zx+6I5exqVjgITeQ2crXF5hlKNQM8YfYlsJVm9x1B6GCPN8VsH
	 N1b6xgrAACbxLqvhAA0sTqWKFLSxixgaXFAlqK3NPYQtJ1Igp1e+QnBri8fESMuYCE
	 e7cUotrSiRDJQ==
From: Mike Rapoport <rppt@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Alexander Graf <graf@amazon.com>,
	Samiullah Khawaja <skhawaja@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mukesh Pilaniya <mpilaniy@redhat.com>
Cc: Mike Rapoport <rppt@kernel.org>,
	kexec@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kho: fix restore order for NUMA-split preservations
Date: Sat,  7 Nov 2026 12:58:00 +0200
Message-ID: <179404894583.1473879.11936948088388939869.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261105-kho-numa-v1-1-e807879644cc@redhat.com>
References: <20261105-kho-numa-v1-1-e807879644cc@redhat.com>
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

From: Mike Rapoport (Microsoft) <rppt@kernel.org>

On Thu, 05 Nov 2026 18:51:33 +0530, Mukesh Pilaniya wrote:
> kho_preserve_pages() uses __kho_preserve_pages_order() to reduce the
> order of a preservation so that it does not span multiple NUMA nodes.
> kho_restore_pages() does not use that helper; it recomputes the order
> from the pfn alignment and the remaining length only.
> 
> When a preservation was split at a NUMA boundary, restore picks a larger
> order than preserve did and jumps over the next key. Those pages never
> get restored: they stay memblock-reserved and keep the KHOP magic in
> page->private, while kho_restore_pages() returns success for the pages
> that were restored. The consumer has no way to notice that part of its
> buffer was not restored.
> 
> [...]

Applied to next branch of liveupdate/linux.git tree, thanks!

[1/1] kho: fix restore order for NUMA-split preservations
      commit: 825c63a0056cbc94cc57779e83440ffb9c5103f8

tree: https://git.kernel.org/pub/scm/linux/kernel/git/liveupdate/linux
branch: next

--
Sincerely yours,
Mike.

