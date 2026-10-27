Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793122306;
	b=hNP+hfeTkbZ3z8qghs9cmNTYqi9loAafdcj+clfNy5UV/K1t+U7UbIFqvmMLXXdakDGZ
	 Ug/KluzQxslPK2iO/dBHpPdAGVP83zCxMElimj6T94d2qS/O3oqh/v+4yReWj/PxaLvtB
	 01YizMvQiBY1eJMHvlbD5l43kemJ6DH/0lFT7H0hOe6D9NstIwOIVev8QlZk/7lycSy90
	 UcasFD+fiaCZM4HhMcC+eOuSiwl/Ho3M587SEtLf3cK53NGpSKu3H+OH9LayPOk7LROgk
	 IKh94h7Ys3wdZrUwQ7QctiM7MtTJgZo2rlz4ZxnvzuKwkc5/2IP0VRlHtpWxrmn/j3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793122306;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 Mail-Followup-To:MIME-Version:Content-Type:Content-Disposition;
	bh=ykD9hJIyGKZWLrte2Awyt7qawqEff/YzTjeoIDIVEp8=;
	b=3TzVDJ+UoCCqE2S/1MRHTvcLH2oGN/YuPY1jj3ED2ecFa6rXLBJ8TBQ2Qqge9RTLp3pQ
	 KTiJMBkOZDmM7h3AAbKsBLWGrDR3Buooyr7xv2R1iwZUUzYaZIIY6wh0UrLDn+KhTZo/a
	 yYIvvQ0VBlxvYNkZemrcDFg5FPk/Ixop/pvB8V+NPIJQo63OMCvMyiBVRFSWASq7eCUin
	 CQR+XTJAIbt6LtUjbU/JoHNT/VV1d6UtnP2ZobPUmNBaCRUF0a34EFaYWTjuL7UHriQE9
	 Bt3IjpHuYwdf3LWUqF7qMeYeXJNaHfHp6ZUaxLHvOGTu0m5IqZqIoL3A7qLPGA5YtBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QIGSwWYp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B121F606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 17:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QIGSwWYp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2A201F01825;
	Tue, 27 Oct 2026 17:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793122305;
	bh=ykD9hJIyGKZWLrte2Awyt7qawqEff/YzTjeoIDIVEp8=;
	h=Date:From:To:Cc:Subject;
	b=QIGSwWYpH8GFRyZWPPgYNY5A2TXJHdV1J9KaEDmbILKaR9CaTNrOg4fLLYhe0gHjm
	 PxrpzG4m+TJzji9ZB5QlT/tAepCdhMTbfKCirYHWGQTCRDXbBxFjPtCOqN0M7XYWGU
	 Y+YREykYzcMGZG/Cs0vA8LJ1U0uId0Ymzu9qZW+pDKMoCYax07tkhbhDEngJ8BKfgp
	 tmUFucYulNxpUq97UG2FWPrSgajBtr5HXsO9/Wus53NckgzvNJIsAUlspMJgm4esmw
	 rz2dMIx2TQr0o7NA5N1zI6W4nT5U7LwHg490UqKG2SbD3orFn91uKXrG0Z0US8aIpf
	 Ipl5OquGKStWQ==
Date: Tue, 27 Oct 2026 18:31:39 +0100
From: Gao Xiang <xiang@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-erofs@lists.ozlabs.org, LKML <linux-kernel@vger.kernel.org>,
	Zhan Xusheng <zhanxusheng@xiaomi.com>,
	Hengyu Liang <hengyul@cs.unc.edu>, Chao Yu <chao@kernel.org>
Subject: [GIT PULL] erofs fixes for 7.4-rc1
Message-ID: <auDf-xw7n159FvUS@MacBookPro>
Mail-Followup-To: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-erofs@lists.ozlabs.org, LKML <linux-kernel@vger.kernel.org>,
	Zhan Xusheng <zhanxusheng@xiaomi.com>,
	Hengyu Liang <hengyul@cs.unc.edu>, Chao Yu <chao@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Linus,

Could you consider these extra fixes for 7.4-rc1?

These patches address several new reported issues related to page
cache sharing, the new superblock_share feature, and recent metadata
path changes for file-backed mounts.

All commits have been in linux-next, and no potential merge conflicts
have been observed.

Thanks,
Gao Xiang

The following changes since commit 1137aa577a35e2684e8046c3e53f920e79c7cc60:

  erofs: enable iomap for file-backed mounts on unencoded inodes (2026-10-17 17:29:36 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs.git tags/erofs-for-7.4-rc1-2

for you to fetch changes up to 209108a5456171ab430e25b54b2dfe083455bfb6:

  erofs: drop unnecessary .read_folio() checks for file-backed mounts (2026-10-27 09:15:19 +0100)

----------------------------------------------------------------
Changes since last update:

 - Hold real inodes to fix mmap usage with page cache sharing

 - Fix metadata reads at the end of file-backed images with sub-page
   block sizes

 - Ensure disallowing superblock_share when device= is specified

 - Drop unnecessary .read_folio() checks for file-backed mounts to
   allow tmpfs as a backing fs

----------------------------------------------------------------
Gao Xiang (2):
      erofs: hold real inodes for shared files
      erofs: drop unnecessary .read_folio() checks for file-backed mounts

Hengyu Liang (1):
      erofs: fix metadata reads at the end of file-backed images

Zhan Xusheng (1):
      erofs: fix disallowing superblock_share if device= is set

 fs/erofs/fileio.c | 18 +++++++++++++++---
 fs/erofs/ishare.c | 43 ++++++++++++++++++++++++++++++-------------
 fs/erofs/super.c  |  9 ++++-----
 3 files changed, 49 insertions(+), 21 deletions(-)

