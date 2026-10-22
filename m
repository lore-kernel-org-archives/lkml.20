Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792660475;
	b=fnGHQ2arz0E3vfJmR9M1Znbc0KGDJBEBLZyWRm+eOm3toqm55pS3097htbOJMRnf887B
	 D3IhLFWUv/w9c1LhRhwEnmM7QH6mrsX6j5LYb+/cR0WBwywh+jAhSv60WJ4HSGqgZHXiU
	 taHKM2gqorc/OFUf+FjCgTtO2NqBYeQ7E8TZcFBkmISdTDxr/RHvuW6/efNTAavxJI02g
	 vatQwusQkIfWHLU7jA4awKI2HcOxR6MZQ2QKSvvn4nCd5huG9AUwTFqHDSBLuJ6/fW8om
	 1ASi1waWWGWfagFIpQSbASYlrN0LQaSQI/PU/43l4F+2yojNXaRwBh2EsbE8SzrwZjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792660475;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=+FdxbDW163sXl7PSrtKq2x3hScBeEWK+b0ZUQ8/Dwtw=;
	b=kip+Qeicnayclxf9iiQoF9QU+ay3DVjn4P39SCt9mqheNDHZc5pJTlqFg8vlSC6aqxw5
	 DYl0J2uQ698JJX9po1rWF9vuTq6YJHWEWd2y7pPrUHV3g4xA2Yk4q9dNlaDV0V+f3A3Ua
	 DTW3r8tLwfj2Krd9QmqnQVt7qzk/SkXCEEr766BWXRuvj6csKgqIHpYOPYV1Mfhj+5ewP
	 ZXFGXiH+1CKylyaE3euvsFB+pg9Y/6udodIPhQ3ZqrJArHJeBi9uE2aqMkOTylMCxit/2
	 tEtcvkach7SJwi782cXVsSkTBBZG/s8SYMCs0tX7hdAStg8n1RUI55EEIaWpmWA7osg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=laJovtXn;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE38606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:14:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBE38606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=laJovtXn
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3282db206d3so3811732eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792660474; x=1793265274; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+FdxbDW163sXl7PSrtKq2x3hScBeEWK+b0ZUQ8/Dwtw=;
        b=laJovtXnSYFUn2fHAoo9hWJWxpjWrfAl2s7kwQSMXaYBwObYltX7rx7y040ej7nREH
         PLwyGlaBZj3720EWPYkuj3GZU5VUCwfr+f4EmF1XBWXDiFOMgHsv6VeBXljb/tptahtx
         DdDQyOOhWljYrsKPRM6fLg8x0X1EogYFtg7kg6t+38N57AMking25uAwArcZ+qLqLgXm
         vFY0wj09bUfnY1Ia0Lc9fgoqgtr+fMorLPnnC0KNQ/CPYf37HbnGMQIpGxOo1xxtnG8x
         Dj5SV7yjIcH4MVaOBPy1ZlqdkrLhSUrGRjFZuznMfZEbLeuw5KFCBhaEScsdROjKU5gD
         hK+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792660474; x=1793265274;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+FdxbDW163sXl7PSrtKq2x3hScBeEWK+b0ZUQ8/Dwtw=;
        b=xNpJxXsTP9pVE3+Q67GIyea2GcqRbjTPepGsYJ8r3dvrDPibEidlJoVtPI1chLW0Ce
         eUTZtuR+JTOrm/p7o7dVWIR9ex6lEc4+gABTD23LZpEiN8X+vEjSPZEe22rIab5aLUTI
         HEtssqEd2gU+dxXiWgTLD1yOjv8wrlPcmGgj4zLLt9Z+63Hm/DEX8zOjY5vV1helkbuF
         dVOcanUCUHJGNHxu0R5BkahLEfHI4aR/9e/uVlGysynfIqT4Cwn6DIYSdPItm9NswSPW
         SdXexcHSqsMloEF4QBUkt3aquHH8n1gnM2uxnyU+5qtGTcsMvqCs+7DRiXEvCp1cgM1Q
         nQ9A==
X-Forwarded-Encrypted: i=1; AKwUvBwHjfwrHKxflcH5sLIC1f6H0zUh0qSQtpwW0OwCGJ0lPDAEBVp2Ia2wvLuB0TQW87IZBoWRd3FyL5yHBmM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJZArEFWSdPL3ErefsE5BGgRz7dZHiZJ1VB6+SOsoznYh7HdXPC
	x6Zq+BjiJFXu5ZAAneNicGLwYtE149l05FYT1AhSHJY2NGLSVYJWj6gXjNwLC6Fq
X-Gm-Gg: AYBFou3RwzeC/bH4aDxHv+RFR3xyHY3faWfEEb3hcpyKWeNBap7xh9ZVDYIsf/52SsT
	SGhUgRjwzFYi/ZOCaW8ul8uHNGcX55NnApOa3Vvcewuc8QK8X1rW83zZ1Z+euwgOPqBC7FSG4YP
	JiAlrT03rYiGk/XZt97vdu1Arj83eU5BKkzqFsGGeGC2P9ptVJ17sN0uTnDCfzn7dGEtsfnrK7f
	/0BzA0LPQrvQNhwSpVqvyAYNFCVSy/iLBNWZTSLSAq4t32m7Y5WZAqvQrQs4HqXmbaEDd0cBr1b
	YfjVI1neMBuRUjh6HAPFMsJoPZW+e974m1DzD0OKzrfVP4IaQMvz79i0BpOJ4XEOSHos/BDY47S
	ekPOtxTPKE2IZpTSeDQB4CWrI4uIw0IxiiZ6tT83SLLiRQLB+Qq9SiBxbp3p2dXQhEPSEZ1+9bx
	D90lasZdJZ/pHkvCgdAd0PASqFEvXHs4hrN2qYeSoBv5MToCaGIge/edexpG6E9iF+gihRjrv7j
	xLpU8DIEgSXFBokGILTP143IiH6A3l+/vOqISEgeT6BtRK8Iij+kNxX0BRccz4N6I1XIS9mG8yA
	Nx8MsKWg7oCB1wK5wIV1/UGHydYNrwL6Lv0L/BEA
X-Received: by 2002:a05:7300:7aa5:b0:360:8a6e:640f with SMTP id 5a478bee46e88-3674e64d8ccmr5989884eec.39.1792660473992;
        Thu, 22 Oct 2026 02:14:33 -0700 (PDT)
Received: from youngkk-vm.localdomain (67.216.200.102.16clouds.com. [67.216.200.102])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-367416a1fb9sm12845003eec.20.2026.10.22.02.14.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 02:14:33 -0700 (PDT)
From: Cheng Yongkang <teel4res@gmail.com>
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Jason Wang <jasowangio@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [BUG] net: tun: queue detach leaves stale flow steering indices
Date: Thu, 22 Oct 2026 02:14:27 -0700
Message-Id: <20261022091427.3650281-1-teel4res@gmail.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi all,

The TUN flow-steering purge after queue detach does not remove all
entries affected by moving the last queue into the detached slot.

__tun_detach() decrements numqueues before calling
tun_flow_delete_by_queue(), then uses numqueues + 1 for the purge.
Entries recorded with the detached queue's old index, and entries for
the queue moved down from the old last slot, can therefore survive.
TX flow steering subsequently selects the wrong queue fd, or selects an
out-of-range index that netdev_cap_txqueue() clamps to queue 0.

Observed on Linux v7.3, commit
08ab31164c55f20c7a2653de3186ae333470e2c1, with a three-queue TAP:

  learn F1 on queue 2
  detach queue 2
  send F1 reply
  tun0 selects TX queue 2, but real number of TX queues is 2
  packet is clamped to queue 0

  learn F2 on queue 1
  detach queue 1, moving queue 2 into slot 1
  send F2 reply
  the flow is read from queue 2's fd, not the no-entry baseline queue

The second differential directly proves wrong queue ownership, not only
the expected clamp warning.  Candidate BR-027 is the same off-by-one
purge root.

The detach path should purge both the old queue index and the moved
end-slot index, preferably before their meaning changes, or rebuild the
flow indices atomically when queues move.

I found no matching upstream fix.

The PoC and complete program/console logs are available on request.

This was found with a multi-agent workflow; the
behavior was reproduced in QEMU.

Thanks,
Cheng Yongkang
