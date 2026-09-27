Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6098938F633
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 14:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790518851; cv=none; b=HmRthtSGTOWlOi9xjXcw4urOH4PfM4elf6dBgDOpD2E63c0bQOgXhSfnpwHv2tmHtXJm95jnkmw2vs+PXcL3FtBsADm0ca6+uYwYLz1rpPl0BVCpfFHhia54NGfi22yiWo8jLWuMBiA+AwnqSEE0DC2C6CbwuBtSp7AGtyJpPho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790518851; c=relaxed/simple;
	bh=rewYJ804mTzQ60NoVNjxyHcEpuHioue73AiOm0aU4D4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nlJQypOaI2cv5ZpGldRL5lflcvSVqtiuiIUyAAfSbe7cqjh86bSG4FMlLIH3sFKX5oTBh6Z7d2Ow+HB16kmuCavGAnDI7IVFJLEUHZPK8SploQAeN5adAf+S/2fbVbB7R1Bl12fPW4+Fj/7/ChopX1IqOlynUTeaXdB6yG0g+Ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HiZVZYJX; arc=none smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HiZVZYJX"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33e46a156f4so1207295eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 07:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790518849; x=1791123649; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QuFiE8Sn5ZCiAo2F3P+hWDb2ouMekTqqlvB4M0L/MQ8=;
        b=HiZVZYJXNFvEUFnGqmna20rmJwC9EhanTDGZOYOp21a57gwfBiM1R30OzwL01Wr+r8
         fLV3ZESNzy+6LtaILsb3zqrMNlQ+jxn70MfnxrgJLJVDK1rVPb+9qLkwVQTSvVCME7Ae
         akOM5VdfxMcyYbSRKeJXzU7vzTaDsllYoBItS4w0Kjlaof8zoe+RuIH7uGlWOodRxGUn
         jAStjmjKwcZ49njgPihE7oTOStxrUrQOFkJRon+CoIhu/ZTY/2hCSxthMSq8CAryMvFM
         wK4BycH3aZF4m/ewt3waW30jhWfhgmsrU6LuzIHVLXI7CUgOfL3LSC+h1urWFRd5jRlk
         Y3UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790518849; x=1791123649;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QuFiE8Sn5ZCiAo2F3P+hWDb2ouMekTqqlvB4M0L/MQ8=;
        b=IU+yhClujcJHCivk+DrWCbY98uB0aSg6iuQXUUO10bw3zjOhwhhcEtQcxXDj7MHg3/
         SggtY3RgIAO1EoR20toxrwsPIKXJHO8lncIAhH+f2MdunvHmqz1XweYMKs7bqeEtQLqb
         p86LX14QSd3dFhOxTEBEIyLsf34nbD+A83vNnhJ05AMfF2onYPpPVzAlZwF3lU/3VWT7
         FGW7B44DEh7MjtWUhIwFeLyxO99GdLsCif5rGl0W3xDXn+A8mjtCvjS6NF8twCCWD5AW
         pplX85/eJRdeH8QVYgM6UXH7uJQiBmlLykv5x9J3jlGorJRdTjkzQ/w9UGeM9VyR3sid
         6NRA==
X-Forwarded-Encrypted: i=1; AKwUvByvxEnCHw8PMQyRL7XouWK9K90q0qOMn7BOkyGDFy0xwyC62qviERnCQu4Caypwkyq5Y9DvH0QhtdnkiZ0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLKENYQHkZo+TZCRjnrCiNsAuAWG6FJaaXoGuK+OKN0YP2aDwVK
	dLlKmpowvfzi2CLxUS1yGBjS2nQhww4Gqtkl8/nVAvaCxtjoq5dv1oXk
X-Gm-Gg: AYBFou0wgLHsVuGHFTFlwmZQPfwxrUxdQo9GQT3w1G35wvTcIqejrigumFwfUCj4kYZ
	tK441IkZpv+XRSxGn+J+7b62v7yzqYiDtTQj5w/414iIwBkP3Al6YnvAnbNUXa5JlCqDgatBpTK
	VCf3+qQBpaaoQErdGar0UC9jjBeRHSMnK2lF7b8t+HKx1TOwrNcYpreieLbB5kBLwQzdUX/f8PL
	D2f9ZIcj52y9Dg+Y7Eq+O+PprDQEmSUfh2TWJWMunynTSBn5Z2qo9itQvdZiqNPrJaheVtbbOl2
	Ua+dT5t7T4U8GL3yJAWbqf7WCMtEh4ZObXoCf7BPwKuiR5oZ82HQk9ogr8XFMHOgYfHHE79XDdZ
	KMJfm5Cid3dEHQlFCZx7rQFPlaOMNBNZTFKy7CTJRJ3y9fZwhqYEEdZlKZQbm18+hO/DCx1E/uf
	Xd/vnEeChQoyhKFvspP/PTQf9jSIB63rGw1irHgShKCd9M5qqjtHEj5WJqbicPONstdMD7s4CX6
	9W91ssM/d+w6BBvliFyl2DtUU0RjH8X
X-Received: by 2002:a05:693c:87d6:10b0:346:7c2c:1d23 with SMTP id 5a478bee46e88-3467c2c2597mr1464216eec.13.1790518849337;
        Sun, 27 Sep 2026 07:20:49 -0700 (PDT)
Received: from 192.168.50.3 ([198.176.50.208])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3414504fae2sm22534911eec.20.2026.09.27.07.20.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 07:20:48 -0700 (PDT)
From: Weiming Shi <bestswngs@gmail.com>
To: Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	=?UTF-8?q?Christoph=20B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>,
	Jens Axboe <axboe@kernel.dk>
Cc: drbd-dev@lists.linbit.com,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	co+4618907cccdeffa@bugs.sh,
	Xiang Mei <xmei5@asu.edu>,
	Weiming Shi <bestswngs@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] drbd: keep discarded packet size unsigned
Date: Sun, 27 Sep 2026 22:20:34 +0800
Message-ID: <20260927142033.297349-2-bestswngs@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Packet lengths are decoded into an unsigned int, but
ignore_remaining_packet() stores pi->size in an int.  Values above
INT_MAX therefore become negative; min_t(int, ...) preserves the negative
value and drbd_recv() converts it to size_t, allowing the receive to
overrun the 4 KiB rbuf.

Keep the remaining size unsigned and clamp it as an unsigned value so that
each receive is bounded by DRBD_SOCKET_BUFFER_SIZE.

A KASAN reproducer reported:

  BUG: KASAN: slab-out-of-bounds in _copy_to_iter
  Write of size 32672 at addr ffff888027129000 by task drbd_r_r0/5002
  Call Trace:
   _copy_to_iter lib/iov_iter.c:197
   simple_copy_to_iter net/core/datagram.c:521
   __skb_datagram_iter net/core/datagram.c:435
   skb_copy_datagram_iter net/core/datagram.c:537
   tcp_recvmsg_locked net/ipv4/tcp.c:2846
   tcp_recvmsg net/ipv4/tcp.c:2949
   inet_recvmsg net/ipv4/af_inet.c:896
   sock_recvmsg net/socket.c:1159
   drbd_recv_short drivers/block/drbd/drbd_receiver.c:322
   drbd_recv drivers/block/drbd/drbd_receiver.c:331
   config_unknown_volume drivers/block/drbd/drbd_receiver.c:3624
   receive_SyncParam drivers/block/drbd/drbd_receiver.c:3671
   drbd_receiver drivers/block/drbd/drbd_receiver.c:5366

Fixes: 4a76b1612f35 ("drbd: Map from (connection, volume number) to device in the receive handlers")
Cc: stable@vger.kernel.org
Reported-by: <co+4618907cccdeffa@bugs.sh>
Assisted-by: LLM
Signed-off-by: Weiming Shi <bestswngs@gmail.com>
---
 drivers/block/drbd/drbd_receiver.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/block/drbd/drbd_receiver.c b/drivers/block/drbd/drbd_receiver.c
index 58b95bf4bdca6..3fb73fbfd5f27 100644
--- a/drivers/block/drbd/drbd_receiver.c
+++ b/drivers/block/drbd/drbd_receiver.c
@@ -3616,10 +3616,10 @@ static struct crypto_shash *drbd_crypto_alloc_digest_safe(
 static int ignore_remaining_packet(struct drbd_connection *connection, struct packet_info *pi)
 {
 	void *buffer = connection->data.rbuf;
-	int size = pi->size;
+	unsigned int size = pi->size;
 
 	while (size) {
-		int s = min_t(int, size, DRBD_SOCKET_BUFFER_SIZE);
+		int s = min_t(unsigned int, size, DRBD_SOCKET_BUFFER_SIZE);
 		s = drbd_recv(connection, buffer, s);
 		if (s <= 0) {
 			if (s < 0)
-- 
2.55.0

