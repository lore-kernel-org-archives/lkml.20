Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793973757;
	b=gLyQwRnM/o8OZTMjEm3u0UN3tW25ccrz2trIC7tV+95bOdu/lBOX+eQlH/fDCFYVyM0y
	 8umsqHt7AHzz2iPnHpO0r9DH9eO/qPudBjCDNDyBeR1u0vBV2Sto0a3S/p1aFVpUFK4WS
	 66Ikuc0ohNM/wErlYLpYh/Rt29FNNFmxIgPVAdkCRMmNHohHou9ntGnSnLGaECxO20dLP
	 4c6zqTsu5vU6TeqQCY9MdKJYoGCwpfAn+AGrW7ZfXaZDQeutNrGx0XaZiTZNySNAlTReq
	 lIgM0fXAh8pae1j/LKuaWtGNjhpsTmc3/eOGkR6ObW/whlGog7dzwXFqhRcRrfY2foA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793973757;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=vGm/xArpN2sgty7GnQuGQKeyskq2+L7m2dfbTLksAPY=;
	b=v65iZFfb4unPlBnUFcdTZaV6z42rPM5+nkzpMtgx0MuQ7P0xvLHDlv6AmZrfz6LXjMoh
	 /M7h0mMUPqCJYlTvcoW6ENckcgaS39ibZfUKdc/Qxj5g1d26sZT7W3JeYrTpgwzFvL2Vv
	 /s17cnfhEPNoqkipQBPIk6uhpWm0yB3IhErJaK2ZIV1E3Z0cj5Uk3b2kWPxBATbWnvXg3
	 rU/lroOieR5Ws5o5siba+aWHxXfsvQOAIBvNWqHXI6VOjKvxXr4O+MhINOYI7h+v41lq7
	 jVP3L7rFWAdg4LHz+6s/eEjswwQUXQwJU4+VpvCcElsjbdWVhK/la+b+Rkeni9+kTtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BvyjVhGD;
	arc=none smtp.remote-ip=209.85.128.169
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62A98606A329
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 14:02:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62A98606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BvyjVhGD
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-8b305e10ac7so5079327b3.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 06:02:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793973756; x=1794578556; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vGm/xArpN2sgty7GnQuGQKeyskq2+L7m2dfbTLksAPY=;
        b=BvyjVhGDfWBI/TE/LM29fTHwd3KQaAP/hRA+JL81IhzSMYw9sExBjuiN7/iPLr++gy
         SFO6N54FxOjXBluQRHShQTl37hr91VNz+C5F+sLfqFjmAS2CM4rTxVJuwk95/lGxhfCc
         lufIwR5/n64DlbsMp7l7cZNaGDAUFCEcaN2ZhfFhafD+8kbiAe0qmzmWg9NkXGxyOj7F
         kHHFgOwf1l+GpmGwfwik9k7+886om9HlMzUcNdl2CTOEa2VGAq/4f2u8DDNIVglJMkZ1
         ybwaPXTdkWwvgW+X4p0UNpOZxk0oMJ72boKFWLIjS265pUTXt3ZfudYocV7cFShVAgyM
         xvnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793973756; x=1794578556;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vGm/xArpN2sgty7GnQuGQKeyskq2+L7m2dfbTLksAPY=;
        b=tfPCTyQ+WJIBYj2BWqqjnsdRw3Ay7qCR0Wv4SUGs1iHQE501XuP8Ksnw1NNfFfy29/
         Vr7fqVhxQEMm93A6Ffl5Hdd8vRUvs72YdG3oXXqEGejCakSymMapd7FGA6M/WKVT7hbR
         3mGcYOkDjo7vC+BriC2oRHsWf0tXXsVTEtzEWV38MyzCTopYX+xkh4W5iOQAnL9D6PCD
         8mMZEJOg+JTwaQhOayxqJNwbyNoXSevQqu12CEJtHvzmIvm4S2tFAyuiBOo+R+fHzHIc
         K29g/SpCo5OEtV8UmIlbkMFGcZtFsQ7VYJHxuNhtLUTEJDjNyDB0e/3R9QbL5fHl4XDN
         IkvQ==
X-Forwarded-Encrypted: i=1; AL+hErFbgrKcpbIGvEKcKs10hW5Wh5TIAzo+BhguSm3JHigL3NBOKcPVIXtvXoPMHkbsW89RvYubiVeqVNvcsE8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8OxFAKKf9sHOzruQM4T6HGNHbXtLCpVV9AF/bSjqetUU7dxVlu
	PlQm6C88pKoD1oJFWrWgswG5Dg9hNYcmX/uukTKYB9WJEt7rFVWrr2k9nuQ+78f7
X-Gm-Gg: AYBFou0y9qwnvDB3AEN+AF0T0pL9L7iGFEEWlqPn/bv2EV0uk8aoDEAQ5BWS9d8xHHe
	xHcB0eN2C2XvJA/APAHjcN05rbzfVk52c/roXO8OWK2G2WW3xQQkPs7Ph/agYRfM5lCd5gGvUU4
	hZGWR2ol3VvKQUvf9huqK2GgkW1BoRh7/nLT3URQzW0LR+tXmrcHoK4R0igNR4lZ1cJefKgmMKT
	HYlm68hD/PvoIwRt85G3l9B/h9NX4LyqLjVU1xD7mTRO9xgYAp0oXd8iOYGz9mFaku5WafRHIoE
	aUT5X8XKGq8O4Hjs7m7DfIB8XXY3p4Q3Ud1VPgKR4IRF/r6mGJK54xNHhnmFDJPZ3xMySdzBgXP
	2d0NZ7fLu2PhWvPG5Ncz/HjU+qm4TZkuz0oNrhjQGH2TdXEoUXyj0aIYzY3Na1Jg1mkOM3ny6Fd
	8BmqUu3VbKeoruUU3ws2ZJlfBbW6ukz4CaqAjNscJQfbfJuOZl0AqOXWXsw2aznMHNH88bT9jj0
	uPmDQoXDEDdbxHnHiTDKwDlXgy1XB9wbQRtgUDyzHC11Qczvgpvtki3aaSlXyGeX5wqEKpjeP09
	Vq6p70yPibOtMvJa/mqgUVP/eTqMYxs1llvsY1jJ5rLqEJ5ue8lfX/Mb56xepAUBNWHilgvMkrE
	B2KjvO/+Pauh7E4Vy0kVdPBpU4UMoqGbcXrGUwkGVQkctTuGmnU2Dw2YYT2gP
X-Received: by 2002:a05:690c:c4f1:b0:8b3:416:b1a7 with SMTP id 00721157ae682-8b3419b5bf8mr14445747b3.41.1793973756132;
        Fri, 06 Nov 2026 06:02:36 -0800 (PST)
Received: from lab01.myowncloud.network ([2601:cb:4000:1c5:5396:7ba1:d08a:ebca])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b33f5f525fsm19090677b3.5.2026.11.06.06.02.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 06:02:35 -0800 (PST)
From: Amit Patole <amit.patole@gmail.com>
Subject: [PATCH 0/2] lib/genalloc: fix a NULL pool check and add KUnit
 tests
Date: Fri, 06 Nov 2026 09:02:31 -0500
Message-Id: <20261106-kunit-genalloc-v1-0-ba1ea397dfd8@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAPfd7WoC/yXMQQ5AMBBA0avIrDVpK6lwFbGoMRikpEUk4u6K5
 Vv8f0EgzxSgTC7wdHDgxUWoNAEcrOtJcBsNWmqjlDRi2h1voidn53lBkWnERsuuyK2BGK2eOj6
 /YVX/DnszEm7vBe77AU4sYxNyAAAA
X-Change-ID: 20261106-kunit-genalloc-32ccb20f97a6
To: Andrew Morton <akpm@linux-foundation.org>, 
 Fredrik Noring <noring@nocrew.org>
Cc: Christoph Hellwig <hch@lst.de>, 
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
 Rae Moar <raemoar63@gmail.com>, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
 Amit Patole <amit.patole@gmail.com>
X-Mailer: b4 0.15.2

genalloc has no unit tests, so patch 2 adds a KUnit suite. Writing it
turned up that gen_pool_dma_alloc() and gen_pool_dma_zalloc() crash on
a NULL pool, while the other DMA helpers return NULL as
gen_pool_dma_alloc() originally did. Patch 1 restores the check; no
in-tree caller passes a NULL pool, so it is not marked for stable.

Tested on UML with a kunitconfig of CONFIG_KUNIT=y and
CONFIG_GENALLOC_KUNIT_TEST=y: 12/12 pass with patch 1, and
genalloc_dma_test crashes without it.

---
Amit Patole (2):
      lib/genalloc: don't dereference a NULL pool in gen_pool_dma_[z]alloc()
      lib/tests: add KUnit tests for genalloc

 lib/Kconfig.debug          |  15 ++
 lib/genalloc.c             |   6 +
 lib/tests/Makefile         |   1 +
 lib/tests/genalloc_kunit.c | 508 +++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 530 insertions(+)
---
base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d
change-id: 20261106-kunit-genalloc-32ccb20f97a6

Best regards,
--  
Amit Patole <amit.patole@gmail.com>

