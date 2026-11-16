Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794807686;
	b=CeUSZmpenQ2w0NWj2KJ78yHzCziPUMuWVGhddQ8JffuNVIDAZn+XoYJogBV/QujMrNL/
	 Hs0ewVYf9eJlP56LLB37g9byR8zBzlWS6MUiu9C0Vb9OqXABZmN26g8/CRjjJ0xSDJzUo
	 NWiwPkPCYyrW3IzrVol0ucwJryjl1oNXA79hku8RFPkvOAs+K1MY5Mf2Z4O/+Dhoy1HxB
	 VHGo1Z7/68sUrXsDW2UonhHwoeF01XGwRoT0ioIEqUwthmCGakTDmy870hN0WPAVs0J9w
	 ihuHMZ2RguFt84BhhFwGefWRkjP3U3GTwc62oyrUIynlFUmnohgiL1xN9kYjx/hQcBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794807686;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=4N7n/7BE28L4kqbt573ndEb5uQs/GzHfQ3A7dFAVTH4=;
	b=a78LwIet4qJhsucFqi0UF6bA84JyjMrQldYBqQNYqI6r5/F4+rFxAe16izmJvGBut6dX
	 ia/SKkGjgQhrvVYl8LQ69gN2DKtp9WU0Y9qq0tv7McZtdrpdXzLg3XjXn8G4SjxRtzaHi
	 NXgWeobc/sq5/CqMli48kWJgZKpht3c1ujDAyHDTQwhjYTZvPp5PFRPR2SGQ2h97MfT2l
	 nt0xoHdFQBq2ImpMQBCSKHKVqkRUX9ej1epRuebQzwbjxXOCpU7Z61rR5N55eXyt2ZGFV
	 TyCFTEMyn2W1N9W+HS7OIQv5lSuRhAP7j8FIowOoNIhNtLD4SgbCPDqx8hRlHCgJTGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=logarcheon.com;
	spf=pass smtp.mailfrom=logarcheon.com;
	dkim=pass header.d=logarcheon.com header.i=@logarcheon.com header.a=rsa-sha256 header.s=protonmail3 header.b=jGq5DdEm;
	arc=none smtp.remote-ip=185.70.43.98
Received: from mail-4398.protonmail.ch (mail-4398.protonmail.ch [185.70.43.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A67606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 05:41:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25A67606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=logarcheon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=logarcheon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=logarcheon.com header.i=@logarcheon.com header.a=rsa-sha256 header.s=protonmail3 header.b=jGq5DdEm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=logarcheon.com;
	s=protonmail3; t=1794807682; x=1795066882;
	bh=4N7n/7BE28L4kqbt573ndEb5uQs/GzHfQ3A7dFAVTH4=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=jGq5DdEmNpQWil3lqsJBLThRfzNL7sSPtqlXYbI8nSKNUAsQObkUgM4bPbH/o/YE7
	 UvaJErSAVz9elMt0wLxyAce0zqnso6ebDm7kZnTbUQoQVDbTozRHdesRN8cpNWlMDX
	 vL2hgb7HvMRu5F1erzCjZcA2tgbxFz/oES3+z3a8/9ayHj2pAaFFofu8a2mPZbK4Sm
	 pbTNBLg01yPXtU+A/bH3llja23an9oMyOcLuFcnokvpa33L5BuMR5uzvHkVhPjnO4O
	 c1bGN/UFTL2k2N64W0ayOWh08b9gxFb2OxZVnPCkM6oPc+XQBgNCxKyBidOpi4K27F
	 cyojKBMVK8rTw==
Date: Mon, 16 Nov 2026 05:41:17 +0000
To: akpm@linux-foundation.org
From: William Chuang <founder@logarcheon.com>
Cc: dhowells@redhat.com, keyrings@vger.kernel.org, linux-kernel@vger.kernel.org, William Chuang <founder@logarcheon.com>
Subject: [PATCH 0/2] lib/assoc_array: fix root-shortcut split lookup regression, add KUnit tests
Message-ID: <20261116054112.39078-1-founder@logarcheon.com>
Feedback-ID: 145408520:user:proton
X-Pm-Message-ID: 596ea3b5a2e0ddeaa4d13cbfcf27f10ae11214f2
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
Content-Transfer-Encoding: quoted-printable

This series adds a KUnit test suite for lib/assoc_array.c and fixes a
lookup bug that suite exposes.

When a root shortcut is split at the first level-segment boundary, the
replacement node is installed one segment too shallow. Lookups then walk
the tree at the wrong depth, so a fraction of previously inserted keys can
no longer be found, even though they remain in the array.

Patch 1 adds the test suite; it passes on mainline. Patch 2 fixes the
split path in assoc_array_insert() and adds a regression test that fails
without the fix, keeping the series bisection-clean.

The fix was checked by exhaustive fan-out enumeration, randomized stress
runs, and KASAN; the patch 2 commit message describes the mechanism in
detail.

William Chuang (2):
  lib/assoc_array: add KUnit test suite
  lib/assoc_array: fix lookups after splitting a root shortcut

 lib/Kconfig.debug             |  17 +
 lib/assoc_array.c             |   3 +-
 lib/tests/Makefile            |   1 +
 lib/tests/assoc_array_kunit.c | 991 ++++++++++++++++++++++++++++++++++
 4 files changed, 1011 insertions(+), 1 deletion(-)
 create mode 100644 lib/tests/assoc_array_kunit.c

--=20
2.39.1


