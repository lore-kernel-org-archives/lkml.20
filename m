Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794821095;
	b=DYzJetJhjNovDRyTP+TD1a4IbdhfybOpoPg7r8xVvTIWdSjWc4f7q7gSx4hwP6p8OYlf
	 pla4EaIyFwGG1qzjNSDg0bZUCozlw4351UuWu+9X8bK9ZdLQIaxOvIk9jy8GdOUg/LxCZ
	 hSeb69I5fnDZ6UN8ziheGeLS+gPGyozB7kGi/B1JwzbM0fcA8BPDVT77blSDwHpnfDCxi
	 cW/fLLbQbpHadqEpSNlBRRODNVOL+oL+paXpAvBLsn2UmW5gj6S9HMMnBsbWkYPLcnXr4
	 cPt3bHLIqvFJH31EGdjxFC5Z5ZjoBqFL5KfCWMvrLzgW3dKk6a9fUE417bUHoyhX3Jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794821095;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=PsdqLnUGdpIVrBYmye0zPsfH3hdWVwuux/Bo2cpeGrA=;
	b=2lUJ1dB0RGv6hzw/+IzJ5YAFykOufkCqSWmBv0+GZJp1hWpR0hixcMH/8FogR0NGt2UV
	 7eAsRTnXZ1pLMSPISNnOXZJmPSFrLkPnU0B930UuELG67mQFtxNzuYeqYlVfi5l0Ee98Z
	 k9QrxmRngJ03uCvEleRpGtaB2lk73H3wJM3k+sv6HqC+M5k7EIP1euWONIsSQTkR/ciuB
	 D4UVPS9i1NJQjwnhsqflJh5EUzOCX2+T3HBzw/h2C07yT++QHgc4Gu90cqkYHBzPtM28Y
	 KanE99pvGD7VR1mj+6M58ed13zOs1pt7diJnunTbY0LtKXink6MuUv14vN5ObJ/Dgyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=is.s.u-tokyo.ac.jp;
	spf=pass smtp.mailfrom=g.ecc.u-tokyo.ac.jp;
	dkim=pass header.d=is.s.u-tokyo.ac.jp header.i=@is.s.u-tokyo.ac.jp header.a=rsa-sha256 header.s=google header.b=J4oqTYKd;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67ACF606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:24:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67ACF606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=g.ecc.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=is.s.u-tokyo.ac.jp header.i=@is.s.u-tokyo.ac.jp header.a=rsa-sha256 header.s=google header.b=J4oqTYKd
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-33fb4680717so8737051eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 01:24:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=is.s.u-tokyo.ac.jp; s=google; t=1794821094; x=1795425894; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PsdqLnUGdpIVrBYmye0zPsfH3hdWVwuux/Bo2cpeGrA=;
        b=J4oqTYKdhkb0jNaCJCwXA3+IdJxpD7u8orV+nMya3DxvW+VNn+8CfZ3PExRxLK/gvy
         ezpixVoX696YZTMc0YSOcD1crF10jmUMjPBtamELEHi2dXI/Q0V4EADXXBC2sYsKH9Go
         JwYubWJGJLwo+ebzrjNblarpHGiaDId4wiVIxT52yLCfi3P2iIvP+KodmYypN+wbeBSX
         Wv6GkIU9ZuUzd5JjznapSKUWqq/GoDuREl7M3NbSnel1xdGUZj5l8q5S/TloDa4km818
         aAxfM3bH5dLv63alpABlU5sxYgPWoJqnEAgvZT6PPOYRtD0hNdoZHHFyJJyMlZDs/TUy
         nmsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794821094; x=1795425894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PsdqLnUGdpIVrBYmye0zPsfH3hdWVwuux/Bo2cpeGrA=;
        b=LpDqtwzRJAR+5Ryy16jC+cexwee0HMRyR6lOCDAPK6hmF6hhG6WP+IdvG68/S2Rni/
         GyeDVF1KaO+IP89sc6cJpFo0cSz8hEqDrsQATmLhKfFcEzmrEK4CaAgzqZZAkU8VjfKO
         tz+1q+eAKAsfZckX9H0AG9vjsklo6wea9Hh5GeDpR6kYM4qHmPR/Z0SaAtLF948tiB68
         p0PIGz6wHpLS0ySkL0I7hp+m9JHNNzCR875k/TvISQMUM/ehIlFVXm+rWMWpeff3h7HE
         QgHFp6ExU49sbNXqFeB1J4u7OB9EdDzG/FPm8nhP6z5Ij63bXZDuHTBgBT1eH+GgPBec
         tjKg==
X-Forwarded-Encrypted: i=1; AL+hErE8sGV3ovIHhENaKtrRr0J85qxHDOS4tUtxhD82xqafZOXJKUAToWHZpHzuEfzRDO5WWWfCoNP01UdyLPo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+7HX5Rd2LpnjSdlt6qRejbyewB39mi3V9xkiAgyPXD4NbtZeAK
	2yXbJhxEW7ziw0vwXvE1jjoefgihg9F0ymVhe1IYuJMmGUETo1TMey4RYCytT2NhWg==
X-Gm-Gg: AZFdTZe0QlQ+TUE9ZLFwSMAgKe0n+DEb0iOcdWeTCVrhUZH3CAGu1siyHTK0JLMgNY1
	FFFj6i9u1GesgG7TXxRTz69EgueIS4URnagUc6kZ+JJPdjE7YxvBakpu8FlrMLwuzvJRu+gcIXk
	IOyqXQOH+JuJ/lpzh9iV+uPnUTxqOmeF9Je4rkXD4Rn6Ac7/RiJeiSSg3oUrFf0/YT/E3oYdz7d
	nJ5/CQwfYnY5HtwlLWRuZJ18Zt4JPq9ZhFPNUfjuH1i6Xif0iq5arw7cC7CagtczB2j67ePoM7F
	8YvUU0e4MDZbKkbmBiKsONRbLTO0RGMcaK/trDf48qbJgBm5uh62J6VuCSbXWEFgxO62R0RQgMe
	9ysQxmflCMIh958v0IxSei6RZIEbcXvRQcG8utTblCX8rF0aySJEE4RbcEyW3w8gw67pP7SIzZ1
	jiFQTiXczrz05R4NJEqqPd4+jdvgAz31Hzda8N9iEf8RY2NHEIsdd0H5HEKTCbyTlA6/88vE9Nu
	HcO3sQjyT/kuUN5G0vNRoDMx7Io6drW6wVWk7lzBK+OHbfYkmQpGd6MaR6q0iTF9/M4fsKQe4nP
	efPNsp5zI1eG6Y3CHF+8gNEMJOtFzv8oDc3P/Q==
X-Received: by 2002:a05:7301:4889:b0:36c:3b8a:8089 with SMTP id 5a478bee46e88-37967ddd89cmr10058508eec.36.1794821094425;
        Mon, 16 Nov 2026 01:24:54 -0800 (PST)
Received: from wang0.localdomain ([133.11.33.33])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bad6casm32056314eec.26.2026.11.16.01.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 01:24:54 -0800 (PST)
From: Lianjie Wang <lian@is.s.u-tokyo.ac.jp>
To: "Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowangio@gmail.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Lianjie Wang <lian@is.s.u-tokyo.ac.jp>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	netdev@vger.kernel.org,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Bommarito <michael.bommarito@gmail.com>,
	Takahiro Shinagawa <shina@is.s.u-tokyo.ac.jp>,
	stable@vger.kernel.org
Subject: [PATCH net v3 2/4] virtio_net: zero the stats reply buffer
Date: Mon, 16 Nov 2026 18:24:43 +0900
Message-ID: <20261116092445.3391334-3-lian@is.s.u-tokyo.ac.jp>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116092445.3391334-1-lian@is.s.u-tokyo.ac.jp>
References: <20261116092445.3391334-1-lian@is.s.u-tokyo.ac.jp>
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

virtnet_get_hw_stats() allocates the reply buffer of the device
statistics command with kmalloc(), and __virtnet_get_hw_stats() parses
the whole buffer. When the device writes less than the buffer holds,
stale heap bytes are reported as counters through ethtool -S and the
per-queue netlink statistics.

Allocate the buffer with kzalloc(), so that the counters the device
didn't write are zeroed. An unwritten record header then has size 0, so
reject it when walking on that header to avoid an infinite loop.

The used length cannot replace the zeroing here, since the device can
also report a larger value than it wrote.

Claude Opus 5.5 was used to audit the driver and draft this patch. To
reproduce, the virtio-net device in QEMU was modified to offer device
statistics and to leave the counters of a receive record unwritten. On
an unmodified kernel, ethtool -S reported kernel pointers as rx0
counters. With this patch, the counters are zeroed, and a reply with
missing records or a record of size 0 is rejected. The
drivers/net/stats.py selftest passes when the device answers with
well-formed records.

Reported-by: Michael Bommarito <michael.bommarito@gmail.com>
Link: https://lore.kernel.org/all/20260711150754.2918392-1-michael.bommarito@gmail.com/
Reported-by: Jakub Kicinski <kuba@kernel.org>
Link: https://lore.kernel.org/all/20261110001659.1654289-2-kuba@kernel.org/
Fixes: 941168f8b40e ("virtio_net: support device stats")
Cc: stable@vger.kernel.org
Signed-off-by: Lianjie Wang <lian@is.s.u-tokyo.ac.jp>
---
v3:
- New patch.

 drivers/net/virtio_net.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
index 57d7a98ecb57..498014773242 100644
--- a/drivers/net/virtio_net.c
+++ b/drivers/net/virtio_net.c
@@ -4994,6 +4994,9 @@ static int __virtnet_get_hw_stats(struct virtnet_info *vi,
 
 	for (p = reply; p - reply < res_size; p += le16_to_cpu(hdr->size)) {
 		hdr = p;
+		if (!hdr->size)
+			return -EINVAL;
+
 		qid = le16_to_cpu(hdr->vq_index);
 		/* The vqs of the queue pairs beyond curr_queue_pairs lie
 		 * between last_vq and the control vq.
@@ -5068,7 +5071,7 @@ static int virtnet_get_hw_stats(struct virtnet_info *vi,
 	if (!req)
 		return -ENOMEM;
 
-	reply = kmalloc(res_size, GFP_KERNEL);
+	reply = kzalloc(res_size, GFP_KERNEL);
 	if (!reply) {
 		kfree(req);
 		return -ENOMEM;
-- 
2.56.1

