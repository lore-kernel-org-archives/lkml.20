Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794333582;
	b=aULd+IjgV7++KSVOH0OGGoHmFPvQnwXW0qaE+NccDHBGK48LaDVzVy5WkkJxLVstAY1H
	 cKD/bHz67aS0Pgz0ufZRCYHc7rXNkpBPi/t0n33081GVWEGhIEfqBPTKQQ5QEfPywa0Wm
	 WN8PXwHhBB4/lp3H5qEwR9kCGTzI4qvIEnrHrJqo/5ik/B6qhBefxn3DkN22hMfk8m8pb
	 NVCpBfZggaltQzHg6atnm1NqGcXeIDA1B5FcPrO5uCpioOuabywv9rPNFsYO7n7RVyNlT
	 rsI7M3Zw7NA2PXDhfWJNZd5XOSFpR+XciJKRTM9ot3gDr6IGJ8XpzFxupUqvg4wRnOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794333582;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=XmC4GUa/rulCX5qlkxBsaY5GKMUzAQdtcV8eTaZtnBs=;
	b=EbdgojyHUyuoXlYAsxw2J2jb2CDYDQFBW8SSlhzd4dP1Q3KDDPLNc5GbR2NxwXnNvmGq
	 DJl1rruWix5EpIWQKOav4ROkPQaXZuIEsp0UCWG7by8uLzfJ4k/lUFV6CNg5lf+8DXz/M
	 cZDAFtlw4OESMQGUvNKoQF4LZzeP8k2wbbgD6bKSnsjNoDIw0G0JAVjjxvFB7tuznk7tO
	 Nsk30p43DZ29P4asmN5GZY7jYnEIhgKppZAGFMsNTkVKEgzUC/xSv71cUJQkvXaywIsJR
	 Of7Z9C0USYlo5Z8oq6WR2a7AyzCP/8ZVcELBJuw8fy7eiMRjdGNSGLQk5xZOq2qgyrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sLSSpzBE;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78DC7606A325
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:59:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78DC7606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sLSSpzBE
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1b3b4944abeso1248993c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:59:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794333581; x=1794938381; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XmC4GUa/rulCX5qlkxBsaY5GKMUzAQdtcV8eTaZtnBs=;
        b=sLSSpzBE73s4DWWB1jkcP5CgfqIkrr3n1D3d3djIRsTi1Ab/p0AaODcaXSn+MqXUCr
         +F9kB+XUlMI/+W1FHksUjYC8mtEHfm1zuo/lemKPyIqt/7uhj6Jh0Fkp86KpYuTOocTK
         quFal9fm3Con8gAsUp16SmF0Hz8ldAw8Tf77SWmnm/dz03q2pn7T0xdRXU2hpCoOconc
         5eBGEb1BnA50Alif3xuwIsTYhPDFzfA6bHlfC8wog3v5odcICfDe0gMZXGQSPoWVvZnL
         K2VB7ICKdTNEpaVn6IH2hOfC8GQ1kOr6aodMVGQBtBjth3cBwysk1DvXlr+1hkFje0j/
         NdlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794333581; x=1794938381;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XmC4GUa/rulCX5qlkxBsaY5GKMUzAQdtcV8eTaZtnBs=;
        b=tS+EZ/RFjyVmFjIzq224HC+mIEYkgzl9WVSfhIKbbv0QLMR3O5GE09FF0akp1F++pl
         FkYN3rJAJg5WspxPsIPysM+N+nEid63PPMudJogqDVW0iB6UcBDTCooBGuldQxvXeHXR
         +CpArtdQKOso2BX0eMX273ao3tYsi1kRUJw5hMSY8XHNq3nOaClsp5koaP2YMzIBLxu8
         pAbCIxtjD4nsWbey4Kru1JBJIBkAwyTMCTbf9dtITD8UQ0kBH7N9/j+dANSy1BwVnGGd
         +bALVSVyZ383/nF2a2Tf4EGeJNYTelE8lHHHcP8Hbr/vfW19LlYRwUh53o8S73mQJbYw
         Dstw==
X-Forwarded-Encrypted: i=1; AL+hErHMDP2c9BFQNom6/ykcXzXj8eT+G6QT6+9KqsKzgb3kjoVsM0OkUBSRQpvHc5nvb6z5HgXnWBbhdHgH4xM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+q1aia5M1MOZOHqvKNbOjvoJcFMQ5uX8azcMUEkrR8a0dNqg12
	iT85hf6uTu6+RN+8Dt5Ue6CxFK7ninRClYOXoaUlLz5TRCLwzFMbS/IXpltCkjNbf0o=
X-Gm-Gg: AYBFou3QU7H2IoSVpkmYy5IYN7DsVGo7VkAPEOlHFpptWsSJb/D2uJLBYajurkyhSd0
	aRoBbCbDbv9yJp6hktuNIhE9vUMl+u86GkKPrDJpRG+jJ8osKVggWsAzJtHcqOL8nvkPGVu4S2w
	BM/BWUeIgu8Acq0eTE1Qz3APzgL1RWrb8GQt6VThBS9NbqvYwHOnJO07M0FzWAsvHVhYPuhPZX+
	lLoEflTkVVc4a8jV/G815W1WYGJ9YgrF0IcueIz+8hEotv4dRv7pu+RIH0CZkJiUamZPcYEpQ1K
	LqM9R7zCv9Y+YiAfzvRhG9rhm8zu6PGqEV7GJNKPBHxbgOQ50LP3rD5bH1UNXNeXWpEf1A+44Pv
	lGCqnGjCWgSPkuviXdkbJzEFvRuWGYeyDw6oaO1uTJ7YwkMjvH/NGoc9h4vM42U4GSpl+kaYmGG
	iZgjRKLJPpXLySA9rg9H30o2AGb1HQDtJ1ZJ5gtRBOgz3+ulhRtvPTbWnQFiXm7egptsvkY9Hld
	jt3Zw68IrLBxEH16Kb90/ILDvKgVO49DRs3bdAVE9nz6BYzyR5wlEoSvVkS11IlaYxGHfIONxBl
	nrRIZ71KFNM4k/HHwnPidgwJRZUdgKUYCtccYPoOoBN9x/cSlSrNR0eFFAa5kA9I3leFtyJZ9fi
	Etnm4oA==
X-Received: by 2002:a05:7022:7f1b:b0:1b0:430d:d81c with SMTP id a92af1059eb24-1b3b607e53dmr3882636c88.25.1794333581359;
        Tue, 10 Nov 2026 09:59:41 -0800 (PST)
Received: from aig-kmd-01.. ([120.133.49.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b4b90csm7624260c88.14.2026.11.10.09.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 09:59:40 -0800 (PST)
From: Yin Tirui <yintirui@gmail.com>
To: akpm@linux-foundation.org,
	david@kernel.org,
	ziy@nvidia.com
Cc: ljs@kernel.org,
	dev.jain@arm.com,
	baolin.wang@linux.alibaba.com,
	baohua@kernel.org,
	lance.yang@linux.dev,
	ryan.roberts@arm.com,
	nico.pache@linux.dev,
	usama.arif@linux.dev,
	liam@infradead.org,
	kas@kernel.org,
	wangkefeng.wang@huawei.com,
	chenjun102@huawei.com,
	yintirui@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH RFC v2 0/9] mm/huge_memory: refactor __split_huge_pmd_locked()
Date: Wed, 11 Nov 2026 01:59:15 +0800
Message-Id: <20261110175924.2945538-1-yintirui@gmail.com>
X-Mailer: git-send-email 2.34.1
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

__split_huge_pmd_locked() currently decides from the VMA --
vma_is_anonymous(), then vma_is_special_huge() (now replaced by
!vma_is_mm_managed()) -- before inspecting the PMD entry, so split and
zap use different classification logic. The entry itself should decide.
The function also mixes the present and non-present cases, resulting
in duplicated code.

This series uses the PMD entry and its folio to decide how to handle each
PMD, as zap_huge_pmd() does. It separates the present and non-present paths
and moves their common work into helper functions. After this change,
__split_huge_pmd_locked() only selects the appropriate helper.

v1 -> v2:
https://lore.kernel.org/linux-mm/cover.1787941780.git.yintirui@gmail.com/#t
- Rebase onto mainline.
- Use !vma_is_mm_managed() in place of vma_is_special_huge() in patch 3.
- Use vma_has_deposited_pgtable() in patch 4, following Lance Yang's
  pgtable deposit cleanup.
  https://lore.kernel.org/linux-mm/20260917054015.23553-1-lance.yang@linux.dev/

Yin Tirui (9):
  mm/huge_memory: read the huge PMD entry once when splitting it
  mm/huge_memory: add and use huge_zero_pmd_can_split()
  mm/huge_memory: add and use unmap_huge_pmd_entry()
  mm/huge_memory: use normal_or_softleaf_folio_pmd() in the PMD split
    path
  mm/huge_memory: dispatch on the folio when splitting a huge PMD
  mm/huge_memory: add and use split_huge_pmd_anon_rmap()
  mm/huge_memory: add struct split_pmd_state
  mm/huge_memory: split present and non-present huge PMDs separately
  mm/huge_memory: unify the migration and device private PTE loops

 mm/huge_memory.c | 525 +++++++++++++++++++++++++++--------------------
 1 file changed, 302 insertions(+), 223 deletions(-)

-- 
2.34.1

