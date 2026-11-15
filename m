Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794718985;
	b=e30qYJSRYRm6GixLCZE1GZt6y47Hg/ENIi/Z9iTaD33hATzvSCMC9v728MOje5LkU6eV
	 nkSl6Rfc6zQKlYErdkorm3ETTjprj4Ke+G3y3aRQkiCop2ci9kUOOhBwJLj79maXnGawS
	 DD63hXfr27QygiKZNEoHe2Qb1AhdhBr/AGAgJotAOOz1uba5o0xq/d7AJ6Nf1UTCfBeGR
	 +paIHCfTbPT/svwrSE1B704FIc5Hb2svzlhbI6iHKsqJV2wRDvCA0Ox7RDJapS2W/Sm4h
	 Jqf5YcJOZVhvdAAr2/IxxP9deFJxc9XG447f1JjZPRG+X+dAOz+jTAnOwHpQXr2aFqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794718985;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=azq6hlaktEMUDgLyNyRfk0hKL7yGmOVuQpf+tMmLcs8=;
	b=QfamGonnI66lv26tWI6Dbu5Si/fuqLGlYF+H8OhKo/3hdO39hAxiBLorznpc3iSBQ/Y0
	 iOlFE0Msq+d+WFirPLeTGhWP/Y6t/fpBfB5vq8yKvbJjDqWp6RW6D9Vm4WfQcWHFqtT1/
	 sTLJ4vPntKGx6SgjS9o1xaDdITJ6V1lKLV935BgHCiRdYLOUKkG40x+3rS2kzVhFqzX3L
	 CExPwZH+r2t+6/ZC8OTGCLgJxMkXwK6tJh2N/JGZ1R2I2YIkhWV3zgRDd75eIM5vs6WQ7
	 +fEvSof0N/Ee6sTlsqyL9AEoNSEJNMuUvRqWCqndlRccEk8hzKRnSxtjhwCjYk6bY/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kQrW1hFA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 357AA606A323
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 05:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kQrW1hFA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 098C31F000C4;
	Sun, 15 Nov 2026 05:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794718984;
	bh=azq6hlaktEMUDgLyNyRfk0hKL7yGmOVuQpf+tMmLcs8=;
	h=From:To:Cc:Subject:Date;
	b=kQrW1hFA9eLROj+8e9HgGk1bBbcWq7RXQkuKPs9FiAK/S3BOBKoe776SyNhHchMa3
	 Sc57o9flKR5qM7CJFj5NoIM6e4nwb6krOaxMUGtTrFL6Pg9f3xAZ3HM+rs9nGYcoTZ
	 gRcGCAYfU+1NY99N6C7eoFjeaXymFovRdrhEoG5WX+DXlYPdQ801Fp/1UZJNQZ9p0n
	 o54/BgyH/7moBX2pEhuVL7ExS4gvOuyWguy6X96/BRARkEqooe/Hd13sU4UkQUfH6g
	 5/ZX/MDGeKzHeKspVqQe0jCODYSTB01Dzt/wNfeTS/WiNlr/lPWpkDqLxxGVLjG0UR
	 I+mqd2/+5wj0g==
From: Mike Rapoport <rppt@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mike Rapoport <rppt@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	kexec@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] liveupdate: fixes for 7.4-rc3
Date: Sun, 15 Nov 2026 07:02:58 +0200
Message-ID: <20261115050300.1847760-1-rppt@kernel.org>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4:

  Linux 7.4-rc1 (2026-11-01 13:26:31 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/liveupdate/linux.git tags/fixes-2026-11-15

for you to fetch changes up to 58c5852ca96c58cdfdb9646870b217fc54d06a97:

  kho: check fdt_phys in is_kho_boot() (2026-11-08 11:20:19 -0500)

----------------------------------------------------------------
liveupdate: fixes for 7.4-rc3

* avoid address translation in is_kho_boot() before the linear map is
  initialized, fixing early boot BUG_ONs on arm64
* check for duplicate session names before growing the sessions
  preservations block set to avoid preserving an empty block that causes
  restoration to panic()

----------------------------------------------------------------
Christian Aurich Zanettini Martins (1):
      liveupdate: check for duplicate session before growing block set

Greg Thelen (1):
      kho: check fdt_phys in is_kho_boot()

 kernel/liveupdate/kexec_handover.c |  2 +-
 kernel/liveupdate/luo_session.c    | 21 +++++++++++----------
 2 files changed, 12 insertions(+), 11 deletions(-)
