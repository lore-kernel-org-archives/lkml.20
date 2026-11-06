Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.40
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793966550;
	b=4cz8mVfBd73V5/tftq6paaj8ffeoI3E2fVMywVWgzdQeKg3I70495qKTPwGuJD1z9x/e
	 ztx7/U1rLppgoNnej3V2NdUZ/XC/L/v70pJHOAj22PBIxvBf6JXVr1SQObrXR9O6gai7q
	 SF85xhCyGJFEAa0jXUcH0+OuUOrUkIBa1R5aXI9Ft2Zzi20FRLYWB600iP0euJVNK82qZ
	 EPs6D4YukuA372eX7ugivL6Sr94g9n2saZcbGF/sPBfjiERbi1bEJd0mSe1KQAvC0263r
	 QoHcaCHcwBlpNwkv813eh04m8FybXaT89lj6Bc3wevhpPqbkbTdF04ELguPc17in1gQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793966550;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=JW2nYW4eOEsIeuR3Jj207bMvgKycyIZvpAyiF56kn2U=;
	b=0uTryz+5S9sqHaKvr+iYfB6+atzlAjKjy6bWsJcKvwAgcIp9Rr58CkZ43O4wLWmML5LD
	 qUmkXMAbdVqJBiRwHiItshB7HLFKG7uY51XVwqPmNJI4hnetXOnxjB+EekKWvRW4ddimv
	 nqvpJM/FDvheE7YMvfQvHbsB5HZQ/d2rrpshIoiiWf9vL/EN9BxHgS2ex1fk+0pXluLWx
	 IacbDy0xylrcaoqInItSYnxEawaCCFSKm+CBFM7l4aL6/0L3FOXC6V6/ubNpoK/w1Alpf
	 6w3pcrWbfTgq5bmV2E7hAhxPUZPuF2qUfBcHg6Xco1W0cHCR4/wSnnKcIRzlGq/MLCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=WIicy3wa;
	arc=none smtp.remote-ip=91.218.175.40
Received: from mta0.migadu.com (out-40.mta0.migadu.com [91.218.175.40])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F8D606A339
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 12:02:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5F8D606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=WIicy3wa
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=AXr6NWeXxU15tKhtULr0QMWsvA7Q82fZbvuPp93piN4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793966546; v=1; x=1794571346;
 b=WIicy3wag5nLiSrcs2gqFMnRyjQlIluJyg4AgcYRZz+gz6uBxEOWboGEnu6fqSVhf4KagGWD
 cCBJh4nphd1LFnLJY7yjMgmTqRjH/shFSNjROleEpwMqUu9MnaqWseXCUa2UZOTAVYZHcDErjLf
 I7VRb3kEvSPByvIDJWtMd48Y=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 78496ee2bd9dc1ab;
	Fri, 06 Nov 2026 12:02:26 +0000
X-Mizu-Trace-ID: 78496ee2bd9dc1ab
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: maz@kernel.org,
	tglx@kernel.org
Cc: radu@rendec.net,
	lpieralisi@kernel.org,
	steven.price@arm.com,
	suzuki.poulose@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	will@kernel.org,
	tabba@google.com
Subject: [PATCH 0/3] irqchip/gic-v3-its: Fix how zeroed table pages reach the GIC
Date: Fri,  6 Nov 2026 12:02:18 +0000
Message-ID: <20261106120221.347309-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
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

Hi folks,

Three fixes to how the ITS driver allocates the tables it hands to the
GIC, which turned up while I was working on the pKVM ITS series [1].

The first zeroes every page in its_alloc_pages_node() before
set_memory_decrypted() can share it with the host. Every caller
already did, except for the LPI property table, which was allocated
unzeroed and filled after the share. The second orders the zeroing, in
the same function, before the store that exposes the page to the GIC.
On a coherent table it wasn't ordered at all. The third cleans the
GICv4.1 vPE table to PoC when the redistributor is non-shareable, as
the driver already does for its other tables.

Based on Linux 7.4-rc1 (6628e7d4c6b25).

Cheers,
/fuad

[1] https://lore.kernel.org/all/20261102130133.3684226-1-fuad.tabba@linux.dev/

Fuad Tabba (3):
  irqchip/gic-v3-its: Zero ITS pages before sharing them with the host
  irqchip/gic-v3-its: Order table zeroing before the GIC can see it
  irqchip/gic-v3-its: Clean a non-shareable vPE table to PoC

 drivers/irqchip/irq-gic-v3-its.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.47.3

