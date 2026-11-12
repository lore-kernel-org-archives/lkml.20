Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794501077;
	b=SS8DpWRdRJrSDUPA3n4pa+lfSAGamc1BehTkb01DX1HGErdccBgMjEX4HesyAlzE4Bz0
	 gAlb0JJYn8w7P9SL022DNvqirjkmG0HSqfr6occ1G4/vpF79chER/sLS6Q0WbrsDL5181
	 zvB3KyKkNExuGBXQngyyAWqP1kgg9XOJe49LlFUee0JSg98EEdyHNqY0BMz83nHZnCEsN
	 iwzx1iNDmhK4/3kmQ9wjwewmA9+wJCbwIHJ/KLms+qVmqd+j5FD4uwXRtgE+L3bCv5vin
	 h2oQW70Cz+fhlgeFEswuDDwahVneKG6J/5oGXJxX5zPoWxuJx1b4ErGA0ycdRn3zRCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794501077;
	h=Received:DKIM-Signature:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer;
	bh=roL1aUYaBrYPIjccB+pZod4zjcl4hJ1JjVO/wTzTDr0=;
	b=gtKI507bxkzTyL8CF4ixNf41bjdPyGxAQPDqZVNF8f+gDyCTntkwbTGzRXZRCglP28EL
	 iQjjSw2RU3RUNcseOE77j836SR5HkksYMknaBNWnsPO9YkvlKHv1pZ1P2kQqm7ezbUxbo
	 3Xw0kLYIBef6UlvtjfpahDZxj95ggPlmKMZI2OLJ5stD/tsk5irhwdm4vct9KuOh20rvT
	 4JQsKIh6nHlOWJWUQ5UYTELNLw0GzKo+ulOKqRTU/2rid9D9CqrQIHKkIO6GagWFpblmp
	 fDj/RL4HdR34YxYah8+UlANCSiFglMOOaLYdg0Uhq4BdEWoklofqWSFzhDIpqUH6PvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aAJw+7fA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04396606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aAJw+7fA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C06601F000C4;
	Thu, 12 Nov 2026 16:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794501076;
	bh=roL1aUYaBrYPIjccB+pZod4zjcl4hJ1JjVO/wTzTDr0=;
	h=From:Subject:Date:To:Cc;
	b=aAJw+7fAbuC3NILXCqYAN/GOFrzU0J3WsC0kf7reKVkVHFoSRGXyRdISmBmofx2PV
	 +FBPlBauyd9KoQBgfUymMnhWrXyjrk6torzQ5MiYAt6Ep+f1YTDl3k2JVCey44qI2q
	 CcUqEdnr/Qa0VPlpe27VzMTExDmMwSQfaYjURVrrugq0poBm62dGNSCvAjfrODTgEJ
	 c8RLZ1rn/9BHpDcWzUK7xgkslGpd5/uUgSN0nO1Eo9YJVUSGJcta6BBmaRjVSu3QM6
	 xB60H5P9NY7lva6jOxOLt9fxXtnXCABA4DJ+VCf95M41pDA+waJa2CN4ssNNBzAhit
	 Yy2PKBB4K10bA==
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Subject: [PATCH 0/9] x86/mm: CPA robustness fixes and cleanups
Date: Thu, 12 Nov 2026 18:31:05 +0200
Message-Id: <20261112-fixes-x86-v1-0-791adb8d6670@kernel.org>
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
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWM0QrCMAxFf2Xk2eBSsIi/Ij6kXdwi2EkyZTD27
 7b6eM493A1cTMXh0m1g8lHXuVSgQwd54jIK6lAZQh8iEQW86yqO6zlin+mUIg85UIDav0x+Y82
 vtz/7Oz0kL+2gFYldMBmXPDU1m45ajk/2RQz2/QtuymXgjQAAAA==
X-Change-ID: 20261112-fixes-x86-0c15b6adc212
To: Andy Lutomirski <luto@kernel.org>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, 
 Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>, 
 x86@kernel.org
Cc: Mike Rapoport <rppt@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, 
 Rick Edgecombe <rick.p.edgecombe@intel.com>, 
 Tom Lendacky <thomas.lendacky@amd.com>, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.1-dev

These are x86 CPA robustness fixes and cleanups I found while working on
a generic implementation of the set_memory APIs.

The first three patches fix issues that are unlikely to happen in
practice, but are still worth fixing even if only to avoid LLM spam:
* CPA does not flush the TLB when only an alias of the requested range
  changes, and the alias keeps stale TLB entries.
* mark_rodata_ro() ignores a failure to write protect the kernel and
  enables the read-only protections anyway.
* set_memory_encrypted() and set_memory_decrypted() map random physical
  memory at an unmapped address instead of failing.

The rest are smaller robustness changes and cleanups.

---
Mike Rapoport (Microsoft) (9):
      x86/mm/pat: flush the TLB when only an alias mapping changed
      x86/mm: don't set kernel_set_to_readonly when write protecting fails
      x86/mm/pat: don't populate page tables in set_memory_{en,de}crypted()
      x86/mm/pat: don't BUG() on inconsistent page count
      x86/mm/pat: don't warn about W^X violations before mark_rodata_ro()
      x86/mm/pat: remove CPA_ARRAY
      x86/mm/pat: pass the address to CPA by value
      x86/mm/pat: move the collapse of large pages out of cpa_flush()
      x86/mm/pat: use cpa_flush() on CPA errors

 arch/x86/mm/init_32.c        |   8 +-
 arch/x86/mm/init_64.c        |   8 +-
 arch/x86/mm/pat/cpa-test.c   |  15 ++--
 arch/x86/mm/pat/set_memory.c | 203 +++++++++++++++++++------------------------
 4 files changed, 108 insertions(+), 126 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261112-fixes-x86-0c15b6adc212

--
Sincerely yours,
Mike.

