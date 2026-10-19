Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=65.109.113.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792453286;
	b=U2IkZtYsGtpoaFeUfdoC0mT3QpbG/Pa/7z2TqxrY+7kDNjK0Zatur8pUh711yMWVMXEu
	 9AYOZ6wreJzRyHvqEli+TGPTMUoQW5Q/QRA5drzpqWy/zrI7TGibGj2jWAA+/rHMOuobs
	 lkoNflaFTfrEsaARDFlrqZzyEtPMEX4SeM3aY3WlND2CwitFmJqPqiH0wlK5IW21Eg2AG
	 dozZ2wNHxBG3DM1nq/pKV5BH1k3yQYnmtVZ3EQuxaF6lubJMyLBuTHlTSbuv9tzTHNdie
	 Gz777gW0x4gxJ6AUpmv7EoKRIpMsC0TKtcw6Nfb3yxxx77rsOVDdcpQ2Deqoi5fh9QQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792453286;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition;
	bh=zPWj2A1OI7cXU0GUX3K99qqFEf4iNyyepUjse8iQXXk=;
	b=yqUeDFbfJxnvSyCHP8pMIwUCHge+GBrEQSIDxXJ38Mchsv8+5r/ARDC+3MI0j2V9Qf7J
	 7Rnqjl1meEJ7cebgoe0FZkFUk7j8xmhAS75KhS6filOqak3JldYSGWi4IMbLmo1r3ZHAC
	 0hImVLcMUEI93Mr4HPBXosU7yPpBH+urtAcshPRX/aT4eYYP5ZpVOyKIikJUjwtk+QXgB
	 E0sApPF2/R/9FUUtCtj6cI/cy2D4Ai1L4Bgj5Uv9Sm2aamP6jsicxJqIJjKwWDrxD4n5t
	 tVaa5HcKEAq4odhCvaSjyg8AVVzBGjWWO58UiE76auMinV04udnHuPJjlhF2WJfv07w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=alien8.de;
	spf=pass smtp.mailfrom=alien8.de;
	dkim=pass header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b="Pe1TO/7m";
	arc=none smtp.remote-ip=65.109.113.108
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5DC9606A319
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 23:41:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5DC9606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=Pe1TO/7m
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 94CD840E029C;
	Mon, 19 Oct 2026 23:41:23 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 2PgvP3_wLRaI; Mon, 19 Oct 2026 23:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1792453277; bh=zPWj2A1OI7cXU0GUX3K99qqFEf4iNyyepUjse8iQXXk=;
	h=Date:From:To:Cc:Subject:From;
	b=Pe1TO/7m5AixMCIrAwAcGwYb9Edu7Rh7u2f8wELdfens5RdOIH1PfwRKz6/hPZ4D7
	 e7JfDh5kFbUoxTYUxDlC1Xrx2funkHKQ3FJ2lO0PdQIS1SgyYpHBrok5YsPQE6rvml
	 G6p9kfVEJZAeRf/gFoqUgudMXG9HjlL1q0eRJntxzIvwr8z5rwVUeGBOlZykVH/C3p
	 njwVTPVSqr9fjCAoO3eJZCpRQkqX4pM/pQcQtr1VLywgR83rTpboQL4UQWA+4lvjex
	 t+nWj0tDFburPg5PFtmk+EneW+ptp17FkcyP+nNW+kapdQ+hGUX+G3PO7Mz6hgYuw4
	 AJCHgmC+lnSpXqBg4wGkjaPwjeFOo0aFyrwYniV5NQ40quWnKMnMKO5zDC1sg8nWWT
	 huNPZ6QlhzN/WZ7S7zarwkOvjjSuhnsozAPi//6a95TGZyFNAHK1CnplxEf/NBJ14C
	 zeDuqXQA+Riztfd3VG9SL6EyrbhaAA4Toi8tYFTazwAn9dqaCH1gOQ7MCtZdBARWdG
	 Z8KDXs5EaOLDC0CVY0OkP45nlYa8G4XW6lQkYKObu7hGiTfR0UvZvgl7fw5Nd0B0r6
	 nLPeFPnN40g0Yul9R2nt9metZsk6entzCAe33B+uxIlATYwGbPgMyk1hPKLNVyDffO
	 464zCAk90XojnhWVdUgmTw0Q=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 0FF4240E021A;
	Mon, 19 Oct 2026 23:41:13 +0000 (UTC)
Date: Mon, 19 Oct 2026 16:41:10 -0700
From: Borislav Petkov <bp@alien8.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: x86-ml <x86@kernel.org>, lkml <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] x86/asm for v7.4-rc1
Message-ID: <20261019234110.GAataqlu-wKqPxwsaU@fat_crate.local>
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

please pull a x86/asm fix for v7.4-rc1.

Thx.

---

The following changes since commit 93f51579e7df248780214094418f205253383cc5:

  Linux 7.3-rc4 (2026-09-20 13:48:15 -0700)

are available in the Git repository at:

  ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/tip/tip.git tags/x86_asm_for_v7.4_rc1

for you to fetch changes up to 966bbfa5f24f601593a0890154e3fb5fddc51e6e:

  x86/local: Support large immediate values in local_(add|sub)() (2026-09-23 13:16:13 -0700)

----------------------------------------------------------------
- Fix local_{add,sub}() to support source immediates which are wider than
  signed 32-bit quantities

----------------------------------------------------------------
David Laight (1):
      x86/local: Support large immediate values in local_(add|sub)()

 arch/x86/include/asm/local.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)


-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
