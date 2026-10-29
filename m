Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793315868;
	b=q7veMRg4ZVUcYeAJXzFnnT/mUdZmnL5n8+ZsGAITSGOYHrte+a9nxPVAVpEi/D4mgCjT
	 W28VmB0LGKiJkBQms4A412P8TMDIRPmy8cwbcFhMQu7tja5K5LqoUdNEAGfJPlh6GuCC5
	 Y+nHLt2VziOOUCE7T+7mw0hVF+LNqJVNXUOdSKAa51QRWNKNBwmDQ7xLWEk1Wn3Fe8evP
	 nIIRrQ5WeOO/6bFZto61hCsPmT6fbyOPmekgKbWxhDJXy/hx310w983bQ422qxOjia2Di
	 codE+bBVE3vaD8mkI4OATeBSB7sEBifBxD4DiB03i7XpV8RvUJwgU4jXw4O6bZ01qkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793315868;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=SPEnqdGMpTzdZwWJhFlJuppIlSs2KDhs9MBrZg5NKrM=;
	b=Kpr4fYwnj5BKHXCraUGOju1uHvPJat9w+hmmYrTggo8pKYgyKtLZOhLGZzWvIYdTyg3r
	 8rlRxsGzYU736JIGOyCX2qL90NxO2ZNw69whshbSAbEI9t4TLOUqCNAwXFbHoCWw2evYc
	 kZFe0s6NW8yeijuaOLiBRIVMttl5n4LpGtRhxbEph05kM+EL1VGfd0qE+VoXRh0G2uifl
	 0s6wmrUWx7fuXIBprknR61/0Bf+gfk8tyzpQ8YBBqB9xdMeGWdQMMnPTeCvcFrsiApz/i
	 XePbO298v3Hyvi5nKAyKkj54L7W5vjH/u4HiuzvvLrMdUm86sBLwY5AM3qECBy7t6BA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JgtgeSBl;
	arc=none smtp.remote-ip=209.85.217.42
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F4077606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 23:17:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F4077606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JgtgeSBl
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-7c33cc572e6so123611137.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 16:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793315867; x=1793920667; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SPEnqdGMpTzdZwWJhFlJuppIlSs2KDhs9MBrZg5NKrM=;
        b=JgtgeSBl1A7EroYa9zlcO4q0XImL4eeq0uiOQ2b1D+m1V0uKjVyJcBYS5048FZ1L5T
         k1aWaHOiNeL63eNOHDtyvvSLIE+b/NWquOve2n9Mbm4aMUSjP/RFZtj3k66C5xfxrvdC
         gz3Dq5w3PNbWZTsQF3k3OLcoWKUvMMK0zc8/woQF2wgrx/r4XwZVEraLlejkW8QqUzKe
         SKBI+WVYxptAPkhMlXaCq/r8fswAkcDbVmfPIRmlFqb5Xbad0Y7ObPEv9OSkvoQASpF2
         ZPNe9b7e6BtDI/3Q5S74dtF9vqaaRimjVbb8xYcC3ARaHnPGk8IJB3n/QXsL4st5jnD9
         JETg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793315867; x=1793920667;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SPEnqdGMpTzdZwWJhFlJuppIlSs2KDhs9MBrZg5NKrM=;
        b=045B4qb1xNBXnPiSw4gn3QmUn/PjESrfhByeicKxxnoEIl/SzeKA4Ei3hbTNg21OkN
         9QVdXhNNsvlmmhOFxpISAeUBx/ebTlXvHkStPOVGR7TsU1psC2/LljHGL+hH3q0JYbJi
         xYAAX72+g8rsCTSpZsYDXJ93nRNoE0fjhmGFmis72Y5dexZW3iHrPtyTBUFxyF3V5Z1d
         BvNmp3Ns/n3UFZFSge/6/CTIHw9gBXL7qT1+oULyi2KaSd+CRsYekMsMFB2l0rIbXsM5
         8mW7CUqoZo1tYveV3FbyJ4JOcldxYXOB/Z7D3FrJexVOewwzmcH16DkvgMqqV1X/uWMx
         dlEw==
X-Forwarded-Encrypted: i=1; AKwUvBzXBE+TD3xA/9jeFDqjub24mPtWdpz275q8nh4HNF/dqREsL9tLKxJciw2Kr/B+d89GsBdCp/00TCWx95M=@vger.kernel.org
X-Gm-Message-State: AFq9FYIuYmig3ZI7EFFQOpEOOISpHVkGZVb6PDz5yH9eN5L3QOHP3elc
	ZzSwzG9MZHyDrN8YBxSdfO7pMbyHT14jovAox+FpI/xyKo5Fx4RcuYGQ
X-Gm-Gg: AYBFou1BBVJ7VRIsz/6gobzBjk63t7eo08J51E+goVKamHI5nZD4MAHnSGYxXvFwnAd
	Z3xUxK4+AJ7YDWcmGCjRXkWHMLlIS6gF41epAtCM5/Mt1fctf+KvL1fKyg+kW5iNWJ6NvAv7You
	/GMQgZGCO1I9v1Ijf5KjKsZoW8f4tXmVgPsSey0+dxz/73ACjoF23HByLs1aOACrZQzLxAqNtXR
	CoZPfrQ/BqKWwrwixsuLCi0WfSe7WbDnkAH2iRbKIBVYMWnAsb0OEwXrEk25t+AYsTh5ciCoCto
	R/4F7FEvuHP4yVc8rM18roqh0phGwYja4W0/dJopBQCCVDhwMYbXYgjtNxRUNtjtMJ2sf8vMNUB
	ZO0kq3DUao5jUxPpHM2MQBc8m38RaUvdVaqO75HNP6GByOaOAZSbUObq1Sp1gwWcld2tVgb63L3
	8FMmv2Q9NgmDRpL8ZMAFLlcxzCRkk+viPcs+Db747YDgtpwA60fpLbv8NrMDGihaO8sC/AQWMDo
	23urimnJVR+/k39fdvmDDAXJ+BG5MwTuPfE6F/lBiOtE87JaEta2eIy9P4J3S+SXueMCZ+4IUKA
	1bZD4M+IkScJcGSDc7ZzYea6ZE17hoMcHvOnS0BmOGtSKToFmQL4k+91F3MTYR0/9qVYylE4IzT
	Lcf0W14SAtMoi
X-Received: by 2002:a05:6102:950:b0:7c2:b741:2391 with SMTP id ada2fe7eead31-7d0542f8019mr1629209137.30.1793315866785;
        Thu, 29 Oct 2026 16:17:46 -0700 (PDT)
Received: from [192.168.15.16] ([2804:1b3:a2c1:77a1:5cd:8fee:f3c:4da7])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-992ee4e7453sm319509241.11.2026.10.29.16.17.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 16:17:46 -0700 (PDT)
From: Joas Antonio dos Santos <joasantonio108@gmail.com>
To: David Heidelberg <david@ixit.cz>
Cc: David S. Miller <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Zhenghang Xiao <kipreyyy@gmail.com>,
 Sanghyun Park <sanghyun.park.cnu@gmail.com>, oe-linux-nfc@lists.linux.dev,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject:
 [PATCH net 0/5] nfc: fix HCI over NCI and NFCC loopback response handling
Date: Thu, 29 Oct 2026 20:17:35 -0300
Message-ID: <179331585573.30322.4049957541187612575@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Patch 1 fixes a regression: since commit 8265a626cc14 ("nfc: nci: fix
double completion race in nci_data_exchange_complete") every data packet
received on an NCI logical connection other than the static RF one is
dropped, because only nci_transceive() sets NCI_DATA_EXCHANGE.  That
breaks HCI over NCI (st-nci) and nci_nfcc_loopback() entirely: every
command times out.  The commit is in mainline and in the 5.10+ stable
trees.

Patches 2 and 3 fix the handling of the stored response in those two
paths.  conn_info->rx_skb is never cleared after the response has been
handed to the caller and freed, and a request can be completed without
a new response (an HCP event or command received on the pipe, or an
unrelated NCI response).  The next command then reads, modifies and
returns the freed skb, or dereferences NULL.

Patches 4 and 5 bound the controller supplied pipe ids used as an index
into the pipes[] array in the st21nfca and st-nci load_session
handlers, as pointed out by sashiko.

Testing:

- Patches 1-3 were tested on arm64 QEMU with KASAN, using virtual_ncidev
  and a userspace NFCC emulator, plus a test-only ioctl in
  virtual_ncidev (not part of this series) that drives
  nci_core_conn_create(), nci_hci_dev_session_init(),
  nci_hci_get_param() and nci_nfcc_loopback() the way st-nci does.
  - Without patch 1, the response to the first ANY_OPEN_PIPE is dropped
    and nci_hci_dev_session_init() returns -ETIMEDOUT; with it, session
    init and HCP commands complete.
  - Without patches 2/3: slab-use-after-free in nci_hci_get_param()
    (HCP event instead of a response), null-ptr-deref in
    nci_hci_get_param() (no response stored yet), and a
    slab-use-after-free on the skb returned by the second
    nci_nfcc_loopback().  With them all three return -EPROTO, normal
    responses are still returned, and KASAN is quiet.
  - tools/testing/selftests/nci passes (8/8) with the series applied.
- Patches 4 and 5 are compile tested only (W=1); I have no ST hardware.

Sanghyun Park's pending "nfc: nci: Fix conn_info use-after-free" v5
touches the same functions in hci.c (it adds a NULL check for rx_skb,
but does not clear it); whichever goes in second will need a rebase.


Joas Antonio dos Santos (5):
  nfc: nci: don't drop data received on HCI and loopback connections
  nfc: nci: hci: consume the HCP response exactly once
  nfc: nci: consume the loopback response exactly once
  nfc: st21nfca: validate pipe ids in st21nfca_hci_load_session()
  nfc: st-nci: validate pipe ids in st_nci_hci_load_session()

 drivers/nfc/st-nci/se.c     |  8 ++++
 drivers/nfc/st21nfca/core.c |  8 ++++
 net/nfc/nci/core.c          | 18 ++++++--
 net/nfc/nci/data.c          |  9 +++-
 net/nfc/nci/hci.c           | 83 ++++++++++++++++++++++---------------
 5 files changed, 87 insertions(+), 39 deletions(-)

-- 
2.43.0

