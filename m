Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3270C501F28
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 15:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789744594; cv=none; b=FFvyOB1fN9HUglR0Gk0n2htVGBWu/VNfFmbHtKZCVIRS8qtGhvBRRFNOayEkBJk0NrS7jGlKIl/YPdq4zy2BQ/SSIa460FfZ7T6VmDCPTez0BmnFsZ8z9zy7DONgDYGYmwb6DoJSJAbg3H6c+7L+nYZTp/GB20tmgKhEAZoAk1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789744594; c=relaxed/simple;
	bh=kqyTsLxvJqqNIVbyBSny9ezC0Wz+9JYHM95lhispPdQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Sud5ZNwy9DwV59wTs8jNeJIJjOiB+2d5kx7qn0tVVpwsiaQh53nOCSaRzfxLxgFSomiaKmAX8fPuP+QIkLL616iotRG8z8aAr19WKXWNU9z2PQ+Av9r8QWQdh8noumHGQ2RwfaGu46pu5YXM3IFFvCu0S6RySJzd2lX40k0xC8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kUtAPpeF; arc=none smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kUtAPpeF"
Received: by mail-yx2-f12.google.com with SMTP id 00721157ae682-85d45ae011cso8899557b3.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 08:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789744590; x=1790349390; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qpPL+Kfb/Xa0aIKQ1c4l4vPP5OJgxaNW5DW9HZvgIrQ=;
        b=kUtAPpeFeVjZ5jW9VzyX6Ktwm07OJO0ooJP9Yq6rGq6UOeByGwvYlOkYQlSOhPwipy
         WVzXPIePOC00r8AFokQKP0HQtqn/z9HTwi44hp1kqPUTSDzHDeuIayvi2GM62Iw0bzbi
         9p6PlUNe3PQ1J2A8VuU6uJhVQKyCR/xR9Bkz8/ARoUlhYjp+65YaGhx+Pq5piWRUDVw+
         i6g8mpeo4KMsacA02rAttJoB3cn3e+I9szT4NtCGClwkfQrsKozjorScJj8FtilWgsna
         gr8BUZkCny/7SuIMrmaItVDEF0edWOzdSf6SllXT61JpxbK/6Qz+e01I6WS7gaXaqvsQ
         ievg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789744590; x=1790349390;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qpPL+Kfb/Xa0aIKQ1c4l4vPP5OJgxaNW5DW9HZvgIrQ=;
        b=pEzgFzzucNQYXmusgli+qL/8gzbjydzs82bfb6JHn5v8YEHHhstaPbhf8l87i/Dyd7
         u7tNc62kU2vMuD1tMsJeNS2pBo+bj0zDsSMpANDMlkRzYIm2fCFPYVjPtzc84Up26LKH
         cJdpQ0gA6DiFd00AwKCtNGvMX8YtbESevXd8PpF3ymJvGKq1qbcut+3UaDIwg+7n0x6Q
         Z0aovg7o7f0H181p7CGhTxwmKHy2O7je249R84M7OnevaSiLD0iz3s5ZTGQReF2T+LaC
         Xs76RFIuRohTCi4bsCUlrnSHp1/8aTsXcOencVnt5DljvchZHky+xmBkuxhE1X+eotsa
         Nwqw==
X-Forwarded-Encrypted: i=1; AKwUvBwKbPh/Vtiohr0vtaWgxjBIzoXZAqvLQLPp+hKueHbFr6dHyNwmHF43L9MBWAhVdmGreNWBjairf+7u8Y4=@vger.kernel.org
X-Gm-Message-State: AFuF++lwMWRo/PVhFrmqzwS0p0wNQXZqHQGNVawoFwP9EUHkd1a/HaEk
	2yvp0TcS9PM0Q8C4IK0iLmDAW3TiSazpd5zZ4j4Mi9vr5jiGa6TMd4wN
X-Gm-Gg: AYBFou3VGuF9XBmR0k9EOhMKNohTIkIoXW9txBkUGQt3+p8LHjohxQ7jR4/vMjwDsNe
	vWQegiTl81S0Mj83E+XPdViFs5JJrLh4WVRZp1ogR9HViDprS75dIVQJlLwAxo7siJjr/wm53IV
	mlA/eKr+uuA4XyG6Mz0OMDFXoI4L3n5Xctmxf/ht/5epO23akjm3XGpgsjnDuUp39JbSoj8MwNE
	9543tMKplKAz3jG/AknZc+D7hTRBvqy65mQRQRIg9HLUfa/iNdjoiMhMPU4H2IA7393plOAqXIk
	j4+o0Lx+BoDbjHDFH34aJ9SQ1SIv90e+DKZGk0ytscFt+U6o94dkopkGubN+7dXMdUTIZmDJItb
	PkY1xA+IdV7d9SiG5pKR+86VtJcuiM4DdgfGE/Ar/6urXJvPcb3bdY+F9fpB7V26RRvm9W04Glm
	bM/443SGDDGN8tDveqjSb/b5hhD0SiNyjNVlzDA8a2z80MaeBVIQFSNEjyXJ0rC1QEdCDxEQ==
X-Received: by 2002:a05:690c:60c7:b0:873:5bb2:6c26 with SMTP id 00721157ae682-89735d83d68mr9261677b3.45.1789744590356;
        Fri, 18 Sep 2026 08:16:30 -0700 (PDT)
Received: from shaunak ([103.48.102.247])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-897ea659c06sm5814157b3.49.2026.09.18.08.16.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 08:16:29 -0700 (PDT)
From: Shaunak Datar <shaunakkdatar@gmail.com>
To: mkl@pengutronix.de,
	mailhol@kernel.org
Cc: pabeni@redhat.com,
	socketcan@hartkopp.net,
	linux-can@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shaunak Datar <shaunakkdatar@gmail.com>,
	syzbot+1aae11dc8d42ec1a87ec@syzkaller.appspotmail.com
Subject: [PATCH] can: dev: fix missing skb header initialization in init_can_skb
Date: Fri, 18 Sep 2026 20:46:06 +0530
Message-ID: <20260918151606.765490-1-shaunakkdatar@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

__alloc_skb() sets skb->mac_header to (typeof(skb->mac_header))~0U via
__finalize_skb_around(). skb_reset_mac_len() checks if the value has been
updated via the skb_mac_header_was_set() and fires
DEBUG_NET_WARN_ON_ONCE(1) if not.

init_can_skb() previously included three header reset calls:

- skb_reset_mac_header(skb)
- skb_reset_network_header(skb)
- skb_reset_transport_header(skb)

Commit 9f10374bb024 ("can: remove private CAN skb headroom
infrastructure") dropped these calls which leads to the skb->mac_header
retaining the original value.

Restore the three missing calls in the init_can_skb().

Fixes: 9f10374bb024 ("can: remove private CAN skb headroom infrastructure")
Reported-by: syzbot+1aae11dc8d42ec1a87ec@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=1aae11dc8d42ec1a87ec
Signed-off-by: Shaunak Datar <shaunakkdatar@gmail.com>
---
 drivers/net/can/dev/skb.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/can/dev/skb.c b/drivers/net/can/dev/skb.c
index 95fcdc1026f8..9cbddc1edd41 100644
--- a/drivers/net/can/dev/skb.c
+++ b/drivers/net/can/dev/skb.c
@@ -210,6 +210,9 @@ static void init_can_skb(struct sk_buff *skb)
 {
 	skb->pkt_type = PACKET_BROADCAST;
 	skb->ip_summed = CHECKSUM_UNNECESSARY;
+	skb_reset_mac_header(skb);
+	skb_reset_network_header(skb);
+	skb_reset_transport_header(skb);
 }
 
 struct sk_buff *alloc_can_skb(struct net_device *dev, struct can_frame **cf)
-- 
2.53.0

