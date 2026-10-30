Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.228.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793327581;
	b=sVGPv8ipixD3Q66hr9w7fo16fuogp4vB0zUwQBIJwYkjzTEhUahqoF8HclPGvaSr8A6g
	 cu3ZrNO5ufo4bmPnpPXNx94r43DVJNconv2OysXa3igQcgOZwzrZU8wGypGbec/ZUj3HB
	 ZDY9b8eclTDJYKPoYggHIBj8y5R71SbnjIyB/SDLGYHbWIDANqYxOTN/ubR0JVuKESx92
	 bYwiWEbEQ/9N1u8yhvfst3LD4V7IDGmK3pPyWcILoH2KygCIMtqN7HOB4g9Nz8/u/o51Z
	 18EBP4Yo5hYOqZB+4Oj6Ssj0JoYC1UMNrCzIJflULFnc46/pUFkdRXkYNU4fGnqYK6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793327581;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=pcgb/vipsFKI93zItJdvIwVM2kRByvoCBd5I2lEqCew=;
	b=CX293MWytW+5sesD96LyuK09qPjSSdfV4QeIvZjKUL97YymVyyXGmkttxpgyNovsZ4TC
	 Ur2YYEi7UYA8KEADchoPubugTJltqNDXHBrDcjbi1AOOepyL3tnhqFMocJyOdHnkc8TNI
	 SL0q0jPkqW2sPMyZjgKwcZrqE3P1WO5LdIojDsAV0MVCyo+Ed9kBDoyWm+wLsGslR1W/J
	 7Y1T+XLh5+xLICGAAq51nBRRrxPHRTOHWkrvFWCMLZ1ERfESz80EScGPXMh/Wj5nOs5Ap
	 ezjQ42EVR9OmvHAtV6lCtzSuKgJb/Ah8pMEnBEgdHE3xNWAQYmbcQeSEnGvCQw11Qsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I4cVE3zN;
	arc=none smtp.remote-ip=74.125.228.5
Received: from mail-pz2-f5.google.com (mail-pz2-f5.google.com [74.125.228.5])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF862606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 02:33:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF862606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I4cVE3zN
Received: by mail-pz2-f5.google.com with SMTP id 41be03b00d2f7-cdab7493046so92669a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 19:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793327580; x=1793932380; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pcgb/vipsFKI93zItJdvIwVM2kRByvoCBd5I2lEqCew=;
        b=I4cVE3zNaa166lxyWLucLPwYv+KKUvcJb2782h1+tYmj2lVTSPBnTdH7SA9m7E9MjF
         0opo8avjoUPnItlZu0TYg2a1aVmH7OVIHTMN9HDYSVB6OTsM+uzbXx5oJMSmRtRxDgQF
         Psf7xF69LvGaOsj8RTjjMLfwRyOAE17xVsMKWn67GPX6PGAQQADemFAaNfTmHs3G/uga
         24/DqDEdEZbMqcql04HYUY8Mabl+kRXlUmp3Aq4hzHPqCDpfDigrJEXAjWyr7+pwGU4Q
         9gJSjAfD5AGxdLhscnnIyTuY7pH3wocg5//cRWle78FoXGuQ4ZLJP094+OwKCV6FPTWi
         i28g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793327580; x=1793932380;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pcgb/vipsFKI93zItJdvIwVM2kRByvoCBd5I2lEqCew=;
        b=zpWRkSiV0npQQHzSpH+CFwZOmf/A9WuTkl/p4reamUjdjlK1YxOlfxfu/hr/lPJkb5
         wOa+xnKtW/UfglBAfAjSbTBNDfAA7Ge1sInSnW5BAQ0TCN/zI2aDTxHpQ64ZR4MhKf+q
         +ZdUUYANf81qcEvfgLxCEZyjWvKMZlDwX8PhfmGYHKLFewL726UXmJmAkbmZse0bX6I1
         sDxxgIKnfUKbFzctAAj95KGFhJ18zzDzSbFd7327YnGGymh4/NNxAKnZSkN1ovmvPd5Z
         uY3/A/TUyy/w/1l/omvt43UgDBowLM0cYAx9uj3v7aJrXmLQwDgSgTpKpHo5iQxEe6tz
         KJ4g==
X-Forwarded-Encrypted: i=1; AKwUvBzqDjjfPrc48RawPYgbTYuqLKvULPs/YLEdGZCXoH7pttkAV9vuKBFejl5cZvQv9nwxgcH5894udhMcX2c=@vger.kernel.org
X-Gm-Message-State: AFq9FYKrNK8tqUJw5zWfIMD9Iu1ZNY9SoHqZ3r251RSn2F8R9EtMP+Kj
	x3vMSqytPAEezMfBiVW3YX3AVyM9clQweubrQK7uxU4iFYI8qEpLowfm
X-Gm-Gg: AYBFou0pDEejjR6hjkN+2DkAO0HF5aK432YyionZ86N+elSgF4dm7oIVUYFKzCvqvFd
	CX0VN83zPSJ6UpJ02bquHWTEnwEKDoQrscLcWieOBKGDkswY25oPq9Am0cSy5mbeiAkGNKBVZWI
	Is5fYoQDCjHawNdF8DkfDXTFGkrkbIIAgd3StP7EVUUee8kjHBH+Xnn+QKbZZPHNLIK+xVHKLMk
	L0hGs+6XUgrYIOZGORvYoOqoXpTa6rRyzvo7MjGvgFVgkrROo5LCK7DFa32hfPIYqsCYOL8iftv
	n+yNYI8CshUdldqfH69Y2Agu6dKsnr9yX390C55emOQYaXNmyKafGbiOzVnir+EswDKrQgdbF5u
	Njn9/vMmKA8SMcWS65yN51gfaV4NVnF4Qol2tmXI0BfkjLr6o5M19nszbVNzc4poUfjTFydF5hd
	UKVhyBDfvlZ6qG2NsC/q31GyRuKBLrtWJ6ElembKdxP6dZasFD5o//Czqnxy2dBvhUs9YKwWQzK
	/LlWw78nbtwIfPXWQMgU8q/aH4V8H6BkHKGfbSNxPzza7zh42uHB3fsj727pHQMUh/6zOdUT0ZF
	g1F/ut7OMFJ3II3b8ojzu2AK2l4Eze785ImsGLnCV1Ojku4fkgHfBA==
X-Received: by 2002:a05:6a00:140f:b0:89e:f8e9:205e with SMTP id d2e1a72fcca58-8a9bf71c0f3mr783776b3a.40.1793327580059;
        Thu, 29 Oct 2026 19:33:00 -0700 (PDT)
Received: from localhost.localdomain ([58.247.233.220])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a9eef95f2dsm152216b3a.10.2026.10.29.19.32.54
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 19:32:59 -0700 (PDT)
From: Rongzheng Wang <testwrzwrz@gmail.com>
To: netdev@vger.kernel.org
Cc: Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
	Magnus Karlsson <magnus.karlsson@intel.com>,
	Jason Xing <kerneljasonxing@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	stable@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rongzheng Wang <testwrzwrz@gmail.com>
Subject: [PATCH net v4 0/2] xsk: fix multi-buffer TX software checksum
Date: Fri, 30 Oct 2026 10:32:46 +0800
Message-Id: <20261030023248.78802-1-testwrzwrz@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
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

This is v4 of the AF_XDP multi-buffer TX software checksum fix.

I found this while testing multi-buffer TX with XDP_UMEM_TX_SW_CSUM: a
two-descriptor packet had a bad wire checksum, while a single descriptor was
correct. There was no production or syzbot report.

Patch 1 moves the software checksum calculation from xsk_skb_metadata() to
the point where the last descriptor has been added to the skb.  The old
code calculated the checksum after the first descriptor, so multi-buffer
packets only included the first fragment in the checksum.

Patch 2 sends the packet using every descriptor count from 1 through
MAX_SKB_FRAGS + 1, and runs the existing metadata and checksum verification
for each case.  The last case is the copy-mode frame limit documented in
af_xdp.rst.

Patch 1 is unchanged since v3.  The updated selftest passes in a local QEMU
run.

v4:
- exercise every descriptor count up to MAX_SKB_FRAGS + 1 (Maciej)
- keep the last descriptor within the packet length (Maciej)
- fix the local variable declaration order (Maciej)

v3: https://lore.kernel.org/all/20261028025026.11401-1-testwrzwrz@gmail.com/
v2: https://lore.kernel.org/all/20261024141157.59301-1-testwrzwrz@gmail.com/
v1: https://lore.kernel.org/all/20261024091256.17918-1-testwrzwrz@gmail.com/

Rongzheng Wang (2):
  xsk: defer software checksum until the skb is complete
  selftests/bpf: cover AF_XDP multi-buffer TX software checksum

 net/xdp/xsk.c                                 |  23 ++-
 .../selftests/bpf/prog_tests/xdp_metadata.c   | 147 +++++++++++-------
 2 files changed, 107 insertions(+), 63 deletions(-)

-- 
2.39.5 (Apple Git-154)

