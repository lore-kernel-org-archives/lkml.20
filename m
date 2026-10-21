Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792548212;
	b=edaJYc42v+vecQrme8NqgmiGmZ8MoE8HSCwRARkBOtq8jlR8a+5qo/7BLc3sNRcG00Ab
	 SCUEYdytjIZGzHB+Y+qgFO6jKwKUhQXNWYvpg3napFLHL7JSQA7QWZfcH3OrLr6sRkR0r
	 brMFzgInVq3SyUl/X8aC0DqysC5GvbY0fbtvwUIZtouVipZdPduepSZ0qqRl5550XAPV3
	 Jh6zj/8mMu8GbzqqV/47pV+ml9eanXJXIMsGZm3vZEXNrYOtn6+LJcg5L4DyoVTSVTG9m
	 8OoJdNv6CzETJgsnZ1fM+Skql8zhtiCfcyOjQE5NEaCr0c5lmKt+vxEebjaHDu3iTXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792548212;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BlvUMX8Lu0GoGP4/a2/X6c3y355TJFwaE46ARxjS7zQ=;
	b=zm5sI6RnZk7GhSzQSnBFBq55095qupIhWwA2Bp7+5u/SNuOD4TLf8ry6CYGReemHLsIH
	 VQvDSSItHU5nJxSemiVTO/2OWIBiJCLGYxLgxfSFzlwEPWy/QVzd/v+JqLy3oz1hbTN/P
	 0iwQesbBQAabknPVrtjyEQ7X+hi+6s8UjgmHuR65zWxNAFPFfSAPqtYZOFfgZt2ldZ1oh
	 mXFN9cWr2U07rAh4LB4fzwjuSXbipWCIRKxatdR1oAwEwqgQh248ZrrJ93Cz7y8+8Ne6j
	 +WuiVb2QYheNACzDDYvmF/VWkgl0n8qwIzFQhNi4Cw1vCtgae7Lq7+moTlHHow4YE9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gt.tech.gov.sg;
	spf=pass smtp.mailfrom=gt.tech.gov.sg;
	dkim=pass header.d=gt.tech.gov.sg header.i=@gt.tech.gov.sg header.a=rsa-sha256 header.s=google header.b=CifFtXAT;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF3C5606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:03:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF3C5606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gt.tech.gov.sg
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gt.tech.gov.sg
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=gt.tech.gov.sg header.i=@gt.tech.gov.sg header.a=rsa-sha256 header.s=google header.b=CifFtXAT
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3ad2b3b1c02so137467a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 19:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gt.tech.gov.sg; s=google; t=1792548211; x=1793153011; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BlvUMX8Lu0GoGP4/a2/X6c3y355TJFwaE46ARxjS7zQ=;
        b=CifFtXATkbaGlUsTaBdoFlT+mxYjc+kFA264t+FxPrPhmj7Bsnk92kj5LGKdG3gXbF
         NEaI+UPYZXsFx6VBd9CSHcq32NVUKOQjKTc0D+Ep2EhxZzJ40GuR97ZT34oJ680QY3GO
         yAYK2mZBW14HZ0n6VGzAmq/FFAqVw7nAOo98A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792548211; x=1793153011;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BlvUMX8Lu0GoGP4/a2/X6c3y355TJFwaE46ARxjS7zQ=;
        b=JrGfD8kqe+QTxqOwQHIcVzheIoM9MF5G4RN+Knn3Y2fiQZHUUgGaGmd1KXxW5m9bWG
         HWkg1zDQS/RlPSi0NIkSfIGdk3GQpnljlPV5ZMjDDiXdI3T9ZU8CYEGKk/0a+IiaP8vI
         gL0IJlXzl4mtWicsI8uJbWiqAj3dCdWqrtROSsCDvFiM8ng/7YsV93qr4APGacVsa9w7
         BFJu2yq+9nUpCWeq+1IE8MfZnMfR0Gt+nzVdl78tbil5fxmEJ6j0rytBgfR8Uz5U9RW9
         Gy8kl0xW2Yzg14E5JCNutdYHSkXaVtLYQchICQcdSUBfPxs8ebnmn8JsdCGVat+UbpOg
         vBmg==
X-Forwarded-Encrypted: i=1; AKwUvBwxY8kPBCZWAkhrCIx0SGbRQPxASHQyuGlA+KGy7KUyfvbP3ykM2KnnHpDtgb8JD9ziiPEj+UoFzfnRsVM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKDg4vpD8KtXaxLf6Naya7/dVsIFV1Hp0mQLxSwrLAyRochNZ+2
	SZ5TVvnn8G7gtGivrNXXOUSFyOU/xkQQxUxDGSMtzqCrXjB3o9lLVXW5wGibyc5imBg=
X-Gm-Gg: AYBFou1oRiIV3ble5iJEjgWo8xeGHBTha0pzYdGX73KDOd2J9yjmDu1aO+IbwLjQCZg
	e2v2Encj9qQUjVPqoisg+bDNGcYoHfDWkCGflJ8Vup7Up9+hAKhnaBDT71GwwD4ES3cJGuRjgm8
	qOn30yVaioO4G0xfERheVO3o24DJeW8c8+JG4BH5kinJEgo4o8M0aKAXsfu5+ggYqcd5/ylEWAO
	5/AOd1rNuq0QN0zz6vzW/biikIFkcMHELQgi13WDB21nsFZwGQ9FU+TPt63WaHFIlKnXlNgAsZT
	xEPS+qNY2x8lu47IabsVHY+SJrdEV05zgvecpdDjR6Phszx2K9Y3+9kw+5J4gz0pzoz2OYpafG0
	a/CGz0Y4PDsvA9/dkoEDufGY/CNGxPgpYDr1iikQCFCLVO6LAmm52Xk3mdIrTEqaWWms/KZFekE
	3pwTfSr3K0G76ojEPweM8iVVZLoI10w7WbJV/XwaXx92bKQmxxb04fxzYN/5XEHeZZbBsJCFKg0
	rYtp/aIZGpVjnS9qnNRzvZNoQ7p0lnYbnqPuYCfFgKYZqHVYa7lEF0DotATy+/6tT3Ut+OjD/RZ
	cB1QD+QD5Q==
X-Received: by 2002:a17:90b:548e:b0:3a8:59d3:530f with SMTP id 98e67ed59e1d1-3ad86f23619mr533892a91.57.1792548211109;
        Tue, 20 Oct 2026 19:03:31 -0700 (PDT)
Received: from LAPTOP-UUUVNN1I.localdomain ([203.125.131.137])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad8035a117sm1934124a91.16.2026.10.20.19.03.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 19:03:30 -0700 (PDT)
From: Wei Jie Law <law.wei.jie@gt.tech.gov.sg>
To: Petko Manolov <petkan@nucleusys.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wei Jie Law <98lawweijie@gmail.com>
Subject: [PATCH net v2 0/2] net: usb: pegasus: fix receive length handling
Date: Wed, 21 Oct 2026 10:03:08 +0800
Message-ID: <20261021020310.34045-1-law.wei.jie@gt.tech.gov.sg>
X-Mailer: git-send-email 2.43.0
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

Two fixes for read_bulk_callback(), both reachable by a USB device that
identifies itself as a Pegasus II adapter.

Patch 1 fixes an out-of-bounds write: on the 0x8513, every frame that
is dropped because of an oversized length field advances the receive
buffer by two bytes, until the host controller writes past the end of
the skb data area.

Patch 2 drops frames whose claimed length exceeds the data actually
received, or is shorter than an Ethernet header, instead of passing
stale or uninitialized buffer contents up the stack.

Both bugs need a malicious or emulated USB device, which
Documentation/process/threat-model.rst treats as a regular bug rather
than a vulnerability, so they are posted publicly.

Testing: the series builds without warnings (W=1) on net and passes
checkpatch --strict. It applies unchanged to v6.12.105, where it was
tested on a KASAN kernel with a device emulated by raw-gadget +
dummy_hcd:

The first two tests ran against v1; v2 only adds the lower bound in
patch 2, which does not affect those frames. The third ran against v2.

- 3000 frames with pkt_len 0xfff, then 20 valid frames. Before: KASAN
  slab-out-of-bounds writes and a general protection fault in
  skb_release_data(). After: no KASAN reports, and all 20 valid frames
  are received.

- Five each of: 1536-byte transfers with pkt_len 1534, 1535 and 1536;
  101-byte transfers claiming 1500 and 97 bytes; normal frames.
  Before: all 30 received. After: the 15 that fit are received, and
  rx_bytes matches; the rest are dropped.

- Frames claiming 0, 4 and 13 bytes (three each) with five normal frames.
  Before: all 14 are received, including the runts. After: five are
  received and nine are counted in rx_length_errors.

Both bugs were found, and the patches written, with LLM assistance,
hence the Assisted-by tags.

Changes in v2 (review by Sashiko):
- 2/2: also drop frames shorter than ETH_HLEN and count them as length
  errors, because eth_type_trans() reads h_dest and h_proto without
  checking skb->len.
v1: https://lore.kernel.org/all/20261014025307.25233-1-law.wei.jie@gt.tech.gov.sg/



Wei Jie Law (2):
  net: usb: pegasus: do not advance rx_skb->data on dropped frames
  net: usb: pegasus: check rx pkt_len against the received length

 drivers/net/usb/pegasus.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)


base-commit: 746d0e7e851edefce9656ce744d4ec5e94de6b5f
-- 
2.43.0

