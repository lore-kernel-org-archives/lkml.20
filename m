Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794049177;
	b=B9i2Rnfu0yCAH4wbZS2FVzHRTQw/yPTdfiTcJQPxdyrGFLvLADo1Y7g5bciVPFPXWeFG
	 T9m+y1fOR0Bk2TWYO6UsSZHHgBEHGDejq/214KBafeUtpDOfYsv3w5aLVJ4XSE4Ahz3VE
	 n8TC/tnneTg6o9FzFpMNAxIgEUiluhX3OV2taKF9NW7IIG87C6xWTZeyd/BQUcx5O/JtG
	 EzuKyOY6Ua9xOaie9F+4R8ekgTW8lG3Z1zGWMJDctfCBGwBWcXyGqOEme0DvlkVASR8Sm
	 XSRC2J3A+jUfj+ytwdrzleeuq6tz+giVRiQcDcnVBx08B/2mrsxGwSEjYhRJ4CMHeJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794049177;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=5TEXBm2KFRNPqnQrkYBN59qrTw89JkXgXnSB3fFl4n0=;
	b=XI2Qrj9Erufvh0IZ2CB01boPzBQnKPJw7P9hH/ClG4v5+K7X7VIpOluYrYrqRsovfCXP
	 FosCVewdzcNnWwBQwamGS0Ids0TJI+ueMYZKVOcqdUWdTJyQP7u/f/ikN80SrRtH31jlv
	 T3Ts4G6xs/NDgd7YP1YXbh58O/Py8fuXhbpuG5S14/dvwqWH2lo8L2x7CmsWuBU7oYzIn
	 7CFoNnALTfe7RBFfAfts1i3u5GZgca8cl5l+iyTuoffwYeQsyTCZGp91Y65uCCBbj7+RX
	 ubBUV1Wa/5RtbGkhPeHV8dA3eykOEgnBPijwJziLIkHUBqomCNlL9WiOmrk87BZiO8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c7xComwZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1EE6606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 10:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c7xComwZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9A221F008A1;
	Sat,  7 Nov 2026 10:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794049177;
	bh=5TEXBm2KFRNPqnQrkYBN59qrTw89JkXgXnSB3fFl4n0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=c7xComwZV6OF+So9zXFZTdI+3vnCbG6eJ02qEHBFKMB/0xcNNz25SjkLniWK32Ww+
	 Gxok6L4yb8fAp8Z/t86AOFgsE6gc7GYgn0M09D7vhEcM7apVz7tvLFH4DO4cHIkKXP
	 Erog5oZcms0xVIcPEa7MNQ/KYWD703jWQS25S+Vyh/RN0R11GXKjT/0IdumYg2qyRs
	 EcPCiZkJwM8nfpq34pQUotRGCBdmZ/hDY0tSxtMjirY2KUC5G7JdELheqAwgHSkgVX
	 TzguZpPybfcyrP/mHimdx7klbJtiQGnK4yfvag6xbybvpLSRfclwpKLaWCK9CdR/J2
	 PCN4aSo7QqZZA==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <baoquan.he@linux.dev>,
	Mikhail Zaslonko <zaslonko@linux.ibm.com>
Cc: Mike Rapoport <rppt@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Dave Young <ruirui.yang@linux.dev>,
	Jiri Bohac <jbohac@suse.cz>,
	David Hildenbrand <david@kernel.org>,
	Usama Arif <usama.arif@linux.dev>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	kexec@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kdump: Give crashkernel CMA areas unique names
Date: Sat,  7 Nov 2026 12:59:23 +0200
Message-ID: <179404912276.1474561.4441607077586218375.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261106104309.3669583-1-zaslonko@linux.ibm.com>
References: <20261106104309.3669583-1-zaslonko@linux.ibm.com>
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

On Fri, 06 Nov 2026 11:43:09 +0100, Mikhail Zaslonko wrote:
> reserve_crashkernel_cma() names every CMA area it reserves
> "crashkernel". If the requested size can't be reserved in one piece,
> it falls back to several smaller areas, all with the same name.
> With CONFIG_CMA_SYSFS, cma_sysfs_init() then fails to create the second
> directory:
> 
>   sysfs: cannot create duplicate filename '/kernel/mm/cma/crashkernel'
> 
> [...]

Applied to kexec-next branch of liveupdate/linux.git tree, thanks!

[1/1] kdump: Give crashkernel CMA areas unique names
      commit: 941aef93e9e1df74f0ef0fa8653c435613131243

tree: https://git.kernel.org/pub/scm/linux/kernel/git/liveupdate/linux
branch: kexec-next

--
Sincerely yours,
Mike.

