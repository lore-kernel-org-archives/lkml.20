Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794223332;
	b=YCecEu9/4SIhNirdrROnBE4VnUM8THTe5JyE7d/oSND2L2Pb9zj6XQ+e7UFw1xSZD1Lu
	 g3vxyjKONjl77ZTDXtad6c+/HpauSO1G3RhvnNfGz8nC33Ej66/DxlPmmzvkJHON5EKs9
	 wPQBI6ukdh6v7/+23cvj5Cm4QcOzVSl5Vj6+VQXVAzj6Ibu7djeINrBMnJwg5PopQfPpy
	 PlEyb+Yyspxu6XlgGCGNi6eFjFdDlAIAzMitR5oG3I8DrB+YBn6sPoQkvq9RqFdQqMKWo
	 SVFBAqYqP543oiINvX+6N8ZjRcCbtTlfn7aR5ir/E/EWziDmPrvdysEPyAIwCDb+GkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794223332;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=/EGlkjnTPXViKqQZVNQ5OhXpwdoUkAoPNRSYCRrjUm4=;
	b=4Ssg+ZmYAsXVuZugT/YTZm7eexz5rNTlvXlX8DQpEyZQ/4YCpdo16IYvUSyYjhqlIczh
	 GrbODU0FOcZBPFF/3xzswcr3n0Vv4r8FC5cd38rFPQIfPIPTusFPwEgBP3jRLHyoBpg+W
	 sg67G3dRGy5o1SyTLUzR/OIt/e8bxnK0bqBL0Ulh9ftBsnre2XI3hhUElMYRCRCVbCbqo
	 tJy6tiC7N+4V1uLBGR9LOXI8yZjkbPDH9Ek780MSwEfhxYq9Hns1k06grs3DpWpSx9yai
	 0ZVTYT6bmPeqB8LYGbdKFFTD7BLZbHitSETx3/nbYYshX+KPr9fyoxfThVPzstRPygg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=htltHbUS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B67606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 11:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=htltHbUS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 931A91F0089F;
	Mon,  9 Nov 2026 11:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794223332;
	bh=/EGlkjnTPXViKqQZVNQ5OhXpwdoUkAoPNRSYCRrjUm4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=htltHbUSacOuNqzjJ9rauWTrqcdykKX6USyqFGrUK9Xsa38SnEMQxb7T/ZjiCXkEa
	 Q3m4xjJ9yNTSt0qsBs0OHMh2c3NiQTo/IkQbsECjBb82KMmTcgAvO/htFjpHzCaGRE
	 Dr34Ia6Ph2F0gzzJYkwD9mERLqFmcNp0qIXlhazhqzYMvO6QdiHSxnhmhYnRS3wVX7
	 aMdc9NiJL+XVYIbIVwTb5UEWJUq9mHr/u/UYPehQ14rEs0B4NUXfyGGzQsJQACdAUa
	 SvBWUQdAlhi4419n9w5EnjfN/FsofQ4t5bL/MY/OybcPVK/0yI0aCReWdGkuwdNUco
	 TSHC0IPQ2kIDg==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	Kees Cook <kees@kernel.org>,
	Alexander Graf <graf@amazon.com>,
	Changyuan Lyu <changyuanl@google.com>,
	"Jose A. Perez de Azpillaga" <azpijr@gmail.com>
Cc: Mike Rapoport <rppt@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Pratyush Yadav <pratyush@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	kexec@lists.infradead.org,
	Mukesh Pilaniya <mpilaniy@redhat.com>
Subject: Re: [PATCH v4] memblock: don't allocate new reserve_mem regions on a KHO boot
Date: Mon,  9 Nov 2026 13:22:03 +0200
Message-ID: <179422331231.3350534.16388829888932023722.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261109075733.9051-1-azpijr@gmail.com>
References: <20261109075733.9051-1-azpijr@gmail.com>
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

On Mon, 09 Nov 2026 08:57:25 +0100, Jose A. Perez de Azpillaga wrote:
> On a KHO boot, a reserve_mem region that can't be revived is allocated
> from KHO_NOPRSRV memory, which includes the bootmem the next kernel
> boots out of. With CONFIG_KEXEC_HANDOVER_DEBUG, preserving the region
> then fails:
> 
>   WARNING: kernel/liveupdate/kexec_handover.c:1245 at kho_preserve_pages+0x168/0x180
>   failed to prepare memblock FDT for KHO: -22
> 
> [...]

Applied to for-next branch of memblock.git tree, thanks!

[1/1] memblock: don't allocate new reserve_mem regions on a KHO boot
      commit: d9a27fa1050902a6e38bdb780b0277cbf1dfa5a5

tree: https://git.kernel.org/pub/scm/linux/kernel/git/mm/memblock
branch: for-next

--
Sincerely yours,
Mike.

