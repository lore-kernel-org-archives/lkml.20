Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794513137;
	b=BlmNqXH5iZ2JUbGKEKsIIDnoZ1t0Tnui8v/I7MwZMJuGYUyS3THp4rjmyFDUf4jQlUjC
	 jH9DANzBZOI+zEvC0BPELOsxUnhc+BFvffkyu0lyDVj5bRvgm2XTtU87Lds13BXkm7neo
	 7c+c5ie7zQ36dt9bxs+a5iJHVWkQy+5DDcZhHWsy4tvKOgR977vyXlyeVMOBuPJpF8pGC
	 rQBcrIeb/kqQO6uDb8XXL9BtmxTf9/B+KDs1uOK84Obw6AvXgJGeQbfIB0+6E9ub6RoKh
	 emTscHcwyO9WnKUz0bgsdY1wHEEF+Dx1wCBvA2Ne4niIrRta/e0j5pnk+Zv6GoP5s+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794513137;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=hYKrXo3r1holufW7AcHtZgDm/1s3GasnuMhptxVhdNA=;
	b=gWHjR2sWdO4yOOjFt2A9UJlUdtPpJjbFNZu6A+jTlAGZPQqqEeIoAZvpFqj+PxmIPjTR
	 CFyM9/zYTPw94wUkdKhjTqQJYpMCmsfKDSZONxSTPUwKjvfyqSfH6C9PrmsJVtSbrdfws
	 FhPopez/uExg73TK+CgY9knVqaJUmJ0WHH9HhusHWHLHnXe8qsCgpcUEyEcJZt2Z5Xx1B
	 4rnrVpfmsVwRi3MlVUCgleb5QaXb12m+GGu0fzL7OCe2eDpTGXjdB7W3LFOi4x0Cqi3nE
	 LaHr1CP2boX4sy7dTOJrjpU6ou6X7R2FXZPW4QblCeb70jkS8FSPPGESq1WBG8q608g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=sJ6IJ1gu;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 006A3606A327
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 19:52:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 006A3606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=sJ6IJ1gu
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5624D165C;
	Thu, 12 Nov 2026 11:52:13 -0800 (PST)
Received: from gaia.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 751393F632;
	Thu, 12 Nov 2026 11:52:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794513136; bh=nzXj1rL608SvCKmeouEdQMlkLBeYWbBshMWDCnenC7k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sJ6IJ1gu1+aTPx9IErkAHP9oAy80fnJm+AzVzxBbOHeKmVUf/WNZCVckq4ot5jGY0
	 ICY5yoD/UEP0Lyl5KGImaaBCXgLtKuMjYkxDTkeoJHtHW9hiVggOnC1y69nK7skRJH
	 5LmecvElJd8fsswmmAk2M9BYt5pCXE2yEi7B2tbM=
From: Catalin Marinas <catalin.marinas@arm.com>
To: akpm@linux-foundation.org,
	baoquan.he@linux.dev,
	graf@amazon.com,
	leitao@debian.org,
	mark.rutland@arm.com,
	mpilaniy@redhat.com,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	will@kernel.org,
	yeoreum.yun@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jinjie Ruan <ruanjinjie01@gmail.com>
Cc: ruanjinjie@huawei.com
Subject: Re: [PATCH v9] arm64: kexec_file: Do not use CMA for images with a non-zero text_offset
Date: Thu, 12 Nov 2026 19:52:09 +0000
Message-ID: <179451296806.3304937.7524260457442565579.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261109041324.3642034-1-ruanjinjie01@gmail.com>
References: <20261109041324.3642034-1-ruanjinjie01@gmail.com>
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

On Mon, 09 Nov 2026 12:13:24 +0800, Jinjie Ruan wrote:
> image_load() adds text_offset to kernel_segment->mem and subtracts it
> from kernel_segment->memsz.  For CMA backed segments this breaks the
> load path: the payload is copied to page_address(cma), which is the CMA
> base, while image->start is set to the adjusted address, so kexec jumps
> into the middle of the kernel.  kimage_map_segment() has the same
> mismatch when a segment has been moved.
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/1] arm64: kexec_file: Do not use CMA for images with a non-zero text_offset
      https://git.kernel.org/arm64/c/18f2d01bfce9
