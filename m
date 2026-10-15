Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2540A3F1AD5
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 22:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792103286; cv=none; b=WIswjw06fpElPZxM/TEXkOrQMqpBcQN55cOXkO0n8B0ptXn3dQL+L6HljDuj8/FKnf89lrsyIK/5BxoCZ+6/8AmdfOeiGA708jkj01z6MOTttnZSMaAmzNZLi6oZuHUyx4Zi+DprNCE1suxEyef0T6hzkp3sb0Qzf0378NfcmzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792103286; c=relaxed/simple;
	bh=vpqF2wsjpDekTjyXB8OhTC5nc9ODzZN9cAbZ0mIUUn4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KA25/VxWz1nOPrOMZHBVzGOBJhKu3WF4wWHHxQ6TzhXrJ+1TPwzRT6mg6CjCJaKzDAAhJO5tTsnfRGulhJN4macoFwgnkLp8dENM7syWEoSckXeDDB3J9eCdbhKm71kcunHwoz7nH+vr433gr1bqen1jAV5OpJUlsjv7qfbv8dE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UoXHVqKN; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UoXHVqKN"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-35b2c599f43so1662397eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 15:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792103283; x=1792708083; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KBh6utbT9VXAJmle0MXKCsj9AJ6G5GAVRjk69ReJRuE=;
        b=UoXHVqKNuwTzuYJ9WlPsYTcIBnyZacyLbonGXtNgddkWcxM53Epw6RtMkYJd4zRs0h
         9qC+caufG28REaGfWMIBSPfu9foP8A/o/n77ByLKfqFpaya4Px/SM3vDGFBHVy6tShpF
         70wK2LNrbbhfQw+PU5GZOY897wBjjA9cW8cSxhDy5jbQbi2kZqPN08guIAVlQ1hqYCNV
         rRHfpec3x72sN8AiY7aXFA3N+DHSHbLF5/kpVfwTNAx7lfA9kw3f50onI1hRe35oDANX
         RUZm5OU1erGdPJ8JHOQ4z1/XjtBgMY1lSQKDo4guG1Aa8IObXSV3xTck0lEogWtfChKe
         L6qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792103283; x=1792708083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KBh6utbT9VXAJmle0MXKCsj9AJ6G5GAVRjk69ReJRuE=;
        b=odpo795Tc0O5XD+f1IoT/7nEbqdUxS4swG4PM8UMOnp2D9bkhcJeHQxq6/+x15yvFi
         fYMiTdg+bGK7n0Q3f+h4EmQsKFNYMeh0LlNKo0ewO5vIBR3gIg08oOIg7UEt1od03N/D
         vIILbSlC4FOsFBGTGmZK85WNdIxcBwEdfJJ6Fv8bGq+DQ+d4JDNJXPzK+W3JianvyC4u
         U/hpffiS+8n41a1DBSguZ1/zMEwypFdqn2Bjak3WQWivSaCOEPyriw5ZLNaWvj8mP2bp
         6mcQLGzLLj6ImIzf1eW35L3DJJs7IjrGEs0NEI/2KmMdZwf7ezebFAVq5EQMh373ZT9b
         KcdA==
X-Forwarded-Encrypted: i=1; AKwUvBzYu9mAUVz1FSao0igKkhDL5NyqQQ53VOiOjTrBMQTd0MxZuAN2qjRFaNQlOI7Y0TickMm5RcHHGFK9e3c=@vger.kernel.org
X-Gm-Message-State: AFq9FYIDde6MKLXLX1sx+s7dowIY7a+XaexN8LqIVFK+voPiWlKQV4TV
	q/hVzju/R52N0mNUA1qn0XaATmIxdrXqB5uhaZnyyWW5YbSK+WYqVtISA5IDfcAY
X-Gm-Gg: AYBFou0+Me//7ba7buAaHcYSY6dC4oh2XZgOYEcDwqw2ofHDJpULk/gxr2bOH0FUNAo
	0+jq0DIM+kxWLTgbBy7cRjVAbpN7SyE52BAfTYjTR/wx+eBQQSzuDZSfGW1b9xZRLUrLY70ZSz6
	xkvqlW7z8uObyiNAokDP/krtrxPS6215wTqbsKqGOQ4jXL7ge23ATrzDMCyhT4/Owen4J9P6HNC
	C2CotNRwp7ShXHw1WFFpm/xAxybvwBITt3fEjLPT/9iLMgo8uQp0CRY16saalkw/l1jpSBmrWDz
	56XEtb+4MqiB0agIxqJ3ra7P62yeAbwajbEX2QSQqwBm2QG4aYpIIrkgA4jj+950/Q2sBXAgT1G
	1yFyFJQcrzI8MRczFDVmy4YIxEOZh9kacfgTsfDQATRDr/dED4YNUD80aFjlaK5ja+R1uWYtlZI
	HXH5/BQsd8YQikwnZ2XiLgJJsoLLBKaqThQ029rkYp50fOi0naUlRtj8cFW6pNXMl4j0N5E/bpB
	Uv+hjZFtPNL/DagoUUVd/8AcOwXofmUZnLel8diuXrJw+phfwtK+6U+1ozI5mQ8328HGAa31f4=
X-Received: by 2002:a05:7301:4b09:b0:351:2958:1740 with SMTP id 5a478bee46e88-3537e088bf1mr27576078eec.37.1792103282862;
        Thu, 15 Oct 2026 15:28:02 -0700 (PDT)
Received: from yibos-mbp.3500.dhcp.asu.edu ([2620:d8:8000:8078:404b:acf5:562d:50f2])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36081fa5a6esm873307eec.16.2026.10.15.15.28.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 15 Oct 2026 15:28:02 -0700 (PDT)
From: Yibo Liu <yiboliume@gmail.com>
To: Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	=?UTF-8?q?Christoph=20B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>,
	Jens Axboe <axboe@kernel.dk>
Cc: drbd-dev@lists.linux.dev,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yibo Liu <yiboliume@gmail.com>
Subject: [PATCH 1/2] drbd: reject data replies whose size does not match the request
Date: Thu, 15 Oct 2026 15:27:59 -0700
Message-Id: <20261015222800.85928-2-yiboliume@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261015222800.85928-1-yiboliume@gmail.com>
References: <20261015222800.85928-1-yiboliume@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A node that reads from its peer (it has no local disk, the area is not
up to date locally, or read-balancing chose the peer) sends a
P_DATA_REQUEST for req->i.size bytes, and recv_dless_read() copies the
matching P_DATA_REPLY into the original bio. Commit bd910a7660d2
("drbd: reject data replies with an out-of-range payload size") rejects
a negative payload size, but a reply that is shorter or longer than the
request is still accepted.

A shorter reply only fills the start of the bio. data_size still drops
to zero in the copy loop, so the final D_ASSERT() does not fire, and
the read completes successfully although the rest of the caller's
buffer was never written. With a proxy that cut one reply down to
1 KiB, a 4 KiB O_DIRECT read returned 4096 with the last 3 KiB of the
buffer unchanged and nothing in the kernel log. A longer reply leaves
the excess in the socket, where it is parsed as the next packet header.

A correct peer always replies with exactly the requested size. Reject
any other size, as is already done for negative sizes.

Fixes: b411b3637fa7 ("The DRBD driver")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yibo Liu <yiboliume@gmail.com>
---

Notes:
    - Reproduced on block-7.3 (41cab3a71dc7) in an arm64 virtme-ng guest,
      with two DRBD 8.4 resources connected over loopback through a proxy
      that rewrites packets. A diskless Primary read 4 KiB with O_DIRECT
      while the proxy cut the P_DATA_REPLY to 1 KiB of data. Before: read()
      returned 4096, the last 3072 bytes of the buffer were never written,
      and nothing was logged. After: "Invalid data reply size 1024, expected
      4096", the connection is dropped and the read fails with -EIO.
      Unmodified 4 KiB reads succeed before and after. The harness is
      available on request.
    - recv_dless_read() in LINBIT's DRBD 9 tree, which the pending DRBD 9
      rework series is based on, has the same check, so the series probably
      needs this change too. I have not checked the posted series itself.

 drivers/block/drbd/drbd_receiver.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/block/drbd/drbd_receiver.c b/drivers/block/drbd/drbd_receiver.c
index 2135c14354a8..97b306676626 100644
--- a/drivers/block/drbd/drbd_receiver.c
+++ b/drivers/block/drbd/drbd_receiver.c
@@ -1810,8 +1810,9 @@ static int recv_dless_read(struct drbd_peer_device *peer_device, struct drbd_req
 		data_size -= digest_size;
 	}
 
-	if (data_size < 0) {
-		drbd_err(peer_device, "Invalid data reply size\n");
+	if (data_size < 0 || data_size != req->i.size) {
+		drbd_err(peer_device, "Invalid data reply size %d, expected %u\n",
+			 data_size, req->i.size);
 		return -EIO;
 	}
 
-- 
2.39.5 (Apple Git-154)

