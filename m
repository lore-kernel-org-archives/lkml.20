Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794920494;
	b=tgXREEQ+SPWEfnpIdDe1dVaq6L2N39dvxlcKMjnrbYWSBwo6P/TIjKwJ0cwHCwRWx6QT
	 6tr1Ohqpyg/K8NeiM0fSpwkUSSevp/WzPV2QfuJLkq9no+1SIkcVZEG8SkKvZrAXdpRwb
	 hL0tCd9rhcW38+T5j5AL3/3SaXKhiZTd29o3wVLp0LwIEVE8Do5NP5SqAZ/0GOgYz3uNf
	 DEgCW3O9VHF2X6E2Kc6hCdemTXWUEpzzPfq3Bm1m7XFR6Fk+1Dw46fmM1k8NMNKRdAfo3
	 C+TowsK1gZYSZKvErMm75qh4kFhwyjgIY+ztnv3Xv5T7z0N5rz0avXe97+mI9LYdcvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794920494;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=ayTEljGwz/C/9F1gwd1UVwjVow2ZOVRqTAfEDPNcmCo=;
	b=MCaKXG7j0nBjBqnaMP7PcS8vdaBEQZLsai9YI8L8b9yUsuy3tckfMC80pbY9r1aJzBLn
	 TmR8M9p7gOvNXZJIv46vol2Uom2BxQ2oyPqvgzOyLe0PHzCIoYVTe56NpLvlSkKYeFeFc
	 1IMppNj/FGrrFSEWPr3c4O/HtXaGmdgNhlOMcRiwXuwNGgJ+MwPzt/BAjBRccx9HDRgEb
	 //kBiZ7W5IVuycwAmP0LufmGFAo6TnTYOXTzE3qiPRBuJWyAr60900ELidfM10wueufwc
	 i0ILcjH9VFa1m/mxT/R72jZBjp/KgquEYPBf+bL2KttEoVDBNRsKcl6mq0KcWwypknw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oLXy011t;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15EFB606A888;
	Tue, 17 Nov 2026 13:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oLXy011t
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A11DC1F000CC;
	Tue, 17 Nov 2026 13:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794920493;
	bh=ayTEljGwz/C/9F1gwd1UVwjVow2ZOVRqTAfEDPNcmCo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=oLXy011tD0Lq2XmQGbPDQXGMNJhwNlcl7ow9id2rCTBLZY7lgGwg4Hq5cXNP2uXWc
	 s4s2qxProB4VQtOIN6Zop9n05AEqH8Ak5MYY1s4tqVfmhYyEzV22KerCWaJ/yZ/wVI
	 cLrTTJLrhPepY39XdjZNdK8KP7aMAiwR+g0VQgCLBr9pA3+/aHtqCniC1l1rKEk/h0
	 Y0O9z564FqUJaenebFu3Lph65xPq7+IbKx/+V4r8IN+4gr8inBR2qM/mW7CABfMFUh
	 Om6Tq1cgGQx3Y/EZjrERb6ecCV4OPuCmsv9JGy2YLq2lgUA3pJQtIlyQTkEMiKxVve
	 U/vSZ2C9WgwRg==
From: Mike Rapoport <rppt@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: Alexander Graf <graf@amazon.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Chen Pei <cp0613@linux.alibaba.com>,
	George Guo <guodongtai@kylinos.cn>,
	Kexin Liu <liukexin@kylinos.cn>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Sourabh Jain <sourabhjain@linux.ibm.com>,
	kexec@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	"Jose A. Perez de Azpillaga" <azpijr@gmail.com>,
	Mukesh Pilaniya <mpilaniy@redhat.com>
Subject: Re: [PATCH v3 0/5] kho: fix bootmem sizing
Date: Tue, 17 Nov 2026 15:01:22 +0200
Message-ID: <179492040138.3797543.1666695922414228895.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112-kho-bootmem-sizing-v3-0-f0c8d00295d5@kernel.org>
References: <20261112-kho-bootmem-sizing-v3-0-f0c8d00295d5@kernel.org>
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

On Thu, 12 Nov 2026 12:38:52 +0200, Mike Rapoport (Microsoft) wrote:
> There were several reports about issues with KHO bootmem sizing.
> 
> The bootmem areas are sized from overlapping views of the memory reserved
> in memblock, so on NUMA systems memory allocated on a node is accounted
> twice and with CONFIG_NUMA=n the lowmem and the global areas are accounted
> once again in the area of node 0. Besides, the lowmem and the global areas
> are reserved even when they are empty.
> 
> [...]

Applied to liveupdate-7.5 branch of liveupdate/linux.git tree, thanks!

[1/5] kho: reject zero bootmem scale
      commit: caeb2173b83441d991171dbbaa59455dae5399ea
[2/5] kho: walk bootmem areas in address order
      commit: f117bbae706f44c7dd1e811d89057d1dc7886554
[3/5] kho: skip zero-sized lowmem and global bootmem areas
      commit: 1010dc3150fc835695df7b21cb9d56016477fab8
[4/5] kho: fix bootmem sizing
      commit: ee4505fe8c4490827244668dab3659c100f4e7cd
[5/5] kho: docs: update description of bootmem regions
      commit: 5b27be339c42a7540eeca5c179e7e0bbdb7a4cdb

tree: https://git.kernel.org/pub/scm/linux/kernel/git/liveupdate/linux
branch: liveupdate-7.5

--
Sincerely yours,
Mike.

