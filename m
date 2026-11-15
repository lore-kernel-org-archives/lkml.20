Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794718927;
	b=syzrPExcZDa0ADR0zaiJSaVJbxWA3WBAPnjrZcpIrDlr4N7OOrlYPeUSR0SKYInSkZhu
	 3+DRmF/WuIBQ6/PDJtjNwB8+vpo6D4j+biplcXIZJ8bI+bWI7CfsUEXR9tDWd9nwe/rVR
	 xMY/KaFmBHm9zQeWun2yVar+8Nbjr/ojm3c/RnHDsTpPgLuHmWDy/vscIdkgLTVfOq864
	 FcmeP5ySSWbqWpZsBn1K8Uaq6ELXhlOHV/aqDeDsM276Xnfg2KNtIP6xTZq4DMTOlE8EC
	 UVf1uNLybzafoh2ftbzcjLd5FEXTyiVUgtyyv/9yGoXLxWT4Wyx6/8K86PJGUcdK7yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794718927;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RvmTX8t5j5/IoltMXAdXZ4t6ouHAYznQwasZalqaL6s=;
	b=quyxYYUh7dXdUXKkEZ5Dx+9PfPsEPa4Q/83F7E21V+8D2+OtAVQMsTr37e4xMQUBPBRQ
	 51U7N5w+HvCyo0zMZPM5JiZ1POpcjmR/y3ykMG+SNK86O/lsOrpRLMk0KQY7xadj6JXJ6
	 tPsbolMa9NM49tR9geI3S7keXgF2C//aMalIB+ePvORZlOaBuXjJ1EhLXX2rAJ49zFwnu
	 YMJnfbPFJz2jZzp/VPngIK+UYCAeWB+c3muzEyOV4oUr+ktsWZe9OLtAizBxMUidPt70j
	 Ehz0Cc4yX1X4c3MVZZj9EEPMZ0rqLNxNQOTRM37ssEQhO/018Yy0qfrcAW74uzUYUQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=izOZUxYS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35740606A32C
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 05:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=izOZUxYS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E59CA1F000C4;
	Sun, 15 Nov 2026 05:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794718926;
	bh=RvmTX8t5j5/IoltMXAdXZ4t6ouHAYznQwasZalqaL6s=;
	h=From:To:Cc:Subject:Date;
	b=izOZUxYS8HzrKJi/UTtmkSX1XsfKOfNT/yiOgTXLdnD2mb1BL2X5Y0LGXWS1HHELm
	 u5zNT/MvMnyq5cDMbRI+VExbc48PKodmpXx+pcb7xSEg3xoWvRxJtt4dGYjLL6O9s7
	 YM5O0UmhtfXCvw4ZKHKaesI0+OPAda34j10NsiEiSBP1cua2JuJGQAUXekQkSYyEMG
	 3n+6t+xGDvI6xfCthg7ELLZaNoJPC4i9v72Ttw6PT3H3cVrCAFWqcsgP2C7G4tEooH
	 52EdZ/htiGD5VY4UChDHYXH7saYSG/+F/XE0EgCNTNMZvxZugmg2YahDHt2zasdGpC
	 2UHhDR1omBYWg==
From: Mike Rapoport <rppt@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mike Rapoport <rppt@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	kexec@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] kexec: MAINTAINERS update
Date: Sun, 15 Nov 2026 07:01:59 +0200
Message-ID: <20261115050200.1847508-1-rppt@kernel.org>
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

  https://git.kernel.org/pub/scm/linux/kernel/git/liveupdate/linux.git tags/kexec-fixes-2026-11-15

for you to fetch changes up to ab75132e99eb0b7dcd3a1882e35519f8229a669e:

  Remove myself as a kdump reviewer (2026-11-11 00:37:37 +0200)

----------------------------------------------------------------
kexec: MAINTAINERS update

Remove Dave Young as kdump reviewer

----------------------------------------------------------------
Dave Young (1):
      Remove myself as a kdump reviewer

 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)
