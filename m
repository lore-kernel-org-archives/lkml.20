Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793552003;
	b=rJ/I/aUjRcwmE0e/p16EL7dZvLQiVIpmqYjDisKJhtDYeTOSuGy5QRf4h99+rWlG2Agx
	 VgvT/j5YaHotwcYEybKfkfrImNMjXS7q9ivBjr2KYPD5XJg0I9rn6r1BbBcn46TfE95fk
	 5kGf+KS+oHj7EqWE5HRqLlDxx8RWzFc6gi4enpPkLfYd+oLBb2/4Iwbl9IfMNcmV1Mrp+
	 CcmnDsC2GyAYVGJGriSD37y8biCluEOQLO/N1boOiorCr0dowj0s/CXE1AgcrCXHF/I/8
	 DlhdiODKr4p8WfPVxgjVlKQRTSn2bamJ5g0677GQ/yx3PrMSeuBiLX3cPYVume/wLXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793552003;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=097R5J/xw41Xh61+p10blxCYZ8kZHC4U5wK3EMQFzX0=;
	b=Uc0/a0n+xMHzrr5ThTm/AQywf7h5tX3nYAvysNTtwY+PdrRaHbRMogksepM77OXllSW7
	 9eqvwGMhR6ahquGxZFFeoM8EGnqAVzg1TWf3Z2mG7qv15l4WBPYplydxfCO1pCCzJqgBF
	 fIo39AuAn4PNKINV7PmpZ8U3QbgJChN5TCmV5UkyRAXfzPcnBUMggG1ZnwUN8l6TD3o/1
	 frtoeffTnfk+eS11AW/BI+8g5It1DZvB8KnvkorpOBirqLXyETAuxzAojH9S5WPCXbUbM
	 wcc+/VSj4ZDN6YjeTdciJS1/oEBvsJRg9wM/zbN9czZkn20A4xWU9Ueg1F3IF8dcUkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TTz5lG2E;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18640606A325
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 16:53:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18640606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TTz5lG2E
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so19178715e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 08:53:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793552001; x=1794156801; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=097R5J/xw41Xh61+p10blxCYZ8kZHC4U5wK3EMQFzX0=;
        b=TTz5lG2Epant/Yj5Vni5mrCXHG2XP2etVYJSUaKB1IRtqly+mrc2LroXVTxBD+QYWd
         ePbN/gZtjhWOxI2bUX1ADzpXvAijeWD0zf4N7q/mhVX8ImQXn5TCWXJTp8CzV3BF1Ppc
         I0wXCAAJJW1UNIEFiumsUsXs6tpD51vpU5qCDEg/cbWKv22GSwCpSTFpgyiOkDokoq42
         q/EztiRRvmH87DDsjPtGg75sU8XkMfbtowiCOWnaqvE1Ri+1TtFXRfuTA1YVIVhwjIFr
         Bxetfet3sG3ERoOr6rIamvQUlESEDOqD28LZqNe4FXYxH7MtwjIpPjGerf4VnIqxUVG3
         2a9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793552001; x=1794156801;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=097R5J/xw41Xh61+p10blxCYZ8kZHC4U5wK3EMQFzX0=;
        b=gAsJPELn++71EuSvsZTT34u4QXTU77TBkt4k5BLV4LDlFILYnSPPjzeYx4yon+zfpb
         ZOIcdwlO8tP3j2zjcY3GZVQM3hjEfZbzz+IaKx6+lkyvyvVtiDoLWuw7TxKLzR8hAHCu
         ma6LqYVqnBzhXwqBr89wi8bzvjZO6Y+XGq2GLW4HwNCKZ7uNA+gFHNfHreyR/rHFvniP
         4bGyyI0BwRt27sVsS5ME3/1v6CAwBC5k/yoMF42h9jXEc3CGWmGQWZfxqtaB16NyjK0H
         OUprlZ4acdLbTI5GKViMyN5gSe79cY43mAvn2Z27E+kI4I9lIDxqklHY1acTfr7dIYTl
         nilA==
X-Forwarded-Encrypted: i=1; AKwUvBwIHVERMoCic+BkmYJITNke9zleSnqKDTkru2A3gwe7UfXctR781ippMsKdC6ruOPsKlXrqEjkgceoDMCs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLR1PXaO5XgH2I8LoaZK0pg3wTgsZYfWg35MGn4MHVNveJbGtNZ
	txll2bYBDhrHBNMmlSqHTRhNEQ+xdFD9zvrQic14BYCbE6buLFuLhtld
X-Gm-Gg: AYBFou0oIhxg1nRrxxz5l2w6SZ/qJJ8jx1wqugRMYhmTBrVwbprnIYIteQRp9RIZlaV
	Esk2wjnj8Xu/3ImV4MZqigKTQ79Zk2DeL6AX+uZTAVeiMxFKe+EZWcmM6R3SYxp5IUw6MlfzFou
	VYGbJymJOC6RqMRu7SCZk0hOdsNXP0dH1lqyCF1KF/P8BLSjMIB6BNnl12GvbGSvIYGMjsdUwZ1
	JW0kIwzt3weDjpEp/G8TJBS7vEPRzSlN9KoVN+7oUVmb2K4qv9RgYqcihDBeK5pMWLGMeSgBPzX
	HA8psKKQUf49OOPxGvfnuQ3qm8yujo3YnB56kwQjyl9vlb6y8UqjDn8ZXVywBH6iIGdHUxd2+J1
	kciZRu/4I+F/2QiucUh38H+8I7y2+zy0+oXLUz4AdrPkslLY+eGZnEP9U/gQLA5orCFp6hVGzrN
	9DiIy+hMqfSADDi3mDXl+xU+HKX9FXDUIwc0s9UQG0XcVbSdy+oTGL9fEd+lhRz2n9oNYNOjRgt
	D87U1vigr+E0BodWe3v2vV5Nc/MyWvgcIDhZtGKj5Ui8NexqE/+yzp88jE5PoZgzh7FCFhFz/2P
	m4fTCi9sGpI5/HVTGTFIDfUELV8DWpp6EO6W+Z8WIPnU3dE6ZaORfU9k2pGxqBlRhZe5tt00Pzp
	v
X-Received: by 2002:a05:600c:3f0a:b0:4a3:7344:13b4 with SMTP id 5b1f17b1804b1-4ac1709a2d0mr182481895e9.14.1793552001474;
        Sun, 01 Nov 2026 08:53:21 -0800 (PST)
Received: from stjepan-Aspire-F5-573G.tailc0f20e.ts.net ([2a00:1bb8:118:d39e:5058:2b49:7a78:eb6d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf6c76507sm223903095e9.10.2026.11.01.08.53.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 08:53:21 -0800 (PST)
From: Stjepan Poljak <stjepan.poljak@gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowangio@gmail.com>,
	Jens Axboe <axboe@kernel.dk>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	virtualization@lists.linux.dev,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] virtio_blk: fit requests to virtqueues without indirect descriptors
Date: Sun,  1 Nov 2026 17:53:05 +0100
Message-ID: <20261101165307.2557421-1-stjepan.poljak@gmail.com>
X-Mailer: git-send-email 2.53.0
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

A virtio-blk device without VIRTIO_RING_F_INDIRECT_DESC needs one ring
descriptor per segment of a request, plus one for the header and one for
the status. virtio_blk takes max_segments from the device's seg_max
without checking that against the size of the virtqueues, so a device
that offers a seg_max above its queue size minus two gets requests that
can never be added to the ring. virtqueue_add_split() warns, returns
-ENOSPC, and the request waits for ring space forever. A virtqueue with
fewer than three descriptors cannot hold any request, and depending on
the queue depth the probe then either fails without saying why or hangs
on the first I/O.

I ran into this while writing the virtio-blk device of Hearth, a small
KVM-based VMM, with queue sizes and seg_max values like these:

  virtqueue  seg_max  queue_depth  before                    after
  ---------  -------  -----------  ------------------------  -------------------
  128        126      default      boots                     boots
  128        127      default      WARN, hangs loading init  boots, 126 segments
  128        254      default      WARN, hangs loading init  boots, 126 segments
  1          -        default      -EINVAL, no reason given  -EINVAL, message
  1          -        128          WARN, hangs on first I/O  -EINVAL, message

where the message is "virtqueue size 1 is too small for a request". A
virtqueue of 2 is rejected the same way, with either queue depth.

Patch 1 checks the virtqueue sizes in virtblk_probe(), before the queue
depth is derived from them, and fails the probe with a reason when one
is too small for a request, whatever the queue depth: the last two rows
and the virtqueue of 2. Patch 2 then clamps max_segments to the smallest
virtqueue minus two when indirect descriptors are not negotiated: the
seg_max rows.

The seg_max case also reproduces with QEMU, which with seg-max-adjust=off
offers seg_max 126 whatever the queue size:

  -device virtio-blk-pci,drive=d0,indirect_desc=off,queue-size=64,seg-max-adjust=off

Before the series this warns and hangs loading init, after it the guest
boots with 62 segments. With QEMU's defaults nothing changes.

The seg_max cases were tested by booting a busybox guest that reads its
disk with O_DIRECT in 1 MiB blocks, the others by looking at the probe
messages, on v7.3-19954-gcbbddb6b08cc, x86_64.

These patches were written with the help of an AI assistant, as the
Assisted-by tags say. I reviewed and tested them, and I can answer for
every line.

Stjepan Poljak (2):
  virtio_blk: fail the probe when a virtqueue is too small for a request
  virtio_blk: fit max_segments to the virtqueue without indirect
    descriptors

 drivers/block/virtio_blk.c | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

-- 
2.53.0

