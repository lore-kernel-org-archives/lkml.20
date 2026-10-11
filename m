Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96728136672
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 11:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791717375; cv=none; b=pRqei0jV47btZO2MMjFN6cO58exr+xyRbDp5u4b7eXiFkw2a/nr1R44h9ETnLIF5bnhWaSPRWRhZNgoUPtnUUVJ859ryhyrEsFFwu8vWpwTAkSyuo0eODk6uOubvn0XkUKA4IdngkF+15i5XwRJJykioBgc3AyMpLI9/lLz4NUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791717375; c=relaxed/simple;
	bh=5n2fjF0VbSmI6/85OVGLV52tja4i00OrgxTy09Gvdc8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uXJaK7VZj5gzIhgjc+B4WvYypv2ZjqBu4z0cw1tdywa19kpfDQJxgUKbfRpSsizrz2NSEc37skURv31AZnKjoXRpPaJPylRXy4Q3ZXlCbNc18tHDmJjD+Do0wMVgy38dmOcHZEyVZD/6GTQPfOHQRlWHzK0Z93MpV7xkacW7+gY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=abh822HC; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="abh822HC"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3282db206d3so183069eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 04:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791717374; x=1792322174; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hwfQOboJrE1I9YMyi9xdPhuJ4m7VM518y+XKlBP1o8Q=;
        b=abh822HCl4O1ZJZh9w1kQWDsGNTdmgVoM8l64QDlRJhzy5nxkHRDixh7QBVCWefxkE
         hkyiHciDpK7p1g6weKgjwa31NuGh6Aox3YadA8K2IBfcYwP2Og0fVtJ2ak0EEyncQDNR
         ND5Q3sgArh8I/jW1f64yu0pVMQOyIddhxNaz48VoRnB6BNqe+Zb4/QcZCBk8+LkDX00m
         2S1RCC91vRw29lPKdKBZ516jvwMj9dF+8mrLzLXmJ66ygswpiyIQLXy6oiVGbUrQeYEF
         intz7SngZE0kX0KKQOhLZLujL0M+yE1KVRhmbRE8hqaUReQhB2dLYpatY1optBFGvp+I
         2Qeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791717374; x=1792322174;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hwfQOboJrE1I9YMyi9xdPhuJ4m7VM518y+XKlBP1o8Q=;
        b=bWDeiQLodBK2+TOuThSJPCwcc0mcUBsijYDQ+eppvj/7jcGdsZhIcpuAkDN4I+xC3Y
         tZ9mrrj9mz622kkMPjyC65jV1tGuPIA7dF1sQcSj+Wg367QnC0jQtVm4fhQbZulPZwhP
         MGiC+UIrqFbD0izANxPNWN2mVir83kFIQhOVJGje7QmiABLTFcKICICRc/F/nBA8vN38
         FhR93PduQWRHqRhHacK1ZBtCZEIaE46WAxSsBE36shVi3QstYG+h+GVk7q0oP+d4wCAs
         JpNQqIec38JRfKI2Uvq/J756Uy0U/p5Yi4+W3cDtlvnVQblOcF7cwneU+Sj8qPWka7SG
         Z2PA==
X-Forwarded-Encrypted: i=1; AKwUvBydHJUlLn1esV7snCR103M8PmvXmyAZGUx3wMO+Kj/1Cf3QkxFkZSoO93xvi6UudPNoMVg8FGP/3SQwoSE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIeTJ8Jw0V2NHfLG44kDtnGKtjRX0bvHQOw6Duuf7hcYYNwbjrb
	omCBZfJRt8yQyOFt94AciL2MnMJcBYXWqwULEeKtesKoqHQgEYFG+0tW
X-Gm-Gg: AYBFou2lvfbkrsuh7Qm5bh3AehOg7YeKViJMhlxwrUMGm80YW7/TGBqDAt2EK4KIL6s
	EPzU0PkWNFkRiJIx1IkhhK6658nMhjCqFCFdXE9eJ7xntg1BNX0z2VPDiNLxMjLA6h9/U2Iv6nq
	6lLXWmItXYrsDo30y3x27XQzN0UzchYa1P9dn0q261AVQngGOHiF9WkURQBy9mpVo16PbuJGXmM
	/CNJGnxE7RrTaN4CtUI0TPtnN5xVME7didPNpaEgMKxmSWICGqt5rGApHbuanVjm57AlyIjYiFN
	RQhD0BsXNRpnN7zCnG9sMIMAleSSwFDd8ghVEWDdxQmgmCjLJeQvd31RchjXS7I1xmZ8DeLrhLj
	rP93OFkqbHArFUq+Ro6IlQ6SkgWMwBZagW+cn+V1X3yuMxC0E1QvoU8gDx6SDXqO4lW65F3YaVX
	6f4SB9S+wYMZa9anM3X94MpB0a+B3ZK9gsM8fEbxquIyoegV0+bRmn3kW/gNCE/3CQgir5I+XO/
	P7YFGm83LT4c03b/E2iebeeMrmfHD5ZX3O+0ur+CnlEH6gPdMBp+8OPFHKbl6J0epVcBLd7iSWu
	RvpmMrIKno6J5GmtQHMjDqzaeJEPKIBbgSH6aZI/WjQZ1E4eqbMdK+CelxM5yqfgCe0XcGcXxUb
	oUPLOkRWI4+ocTSiXeIUhr3HNp7gl4viBiKAAf+LfeFgKkQ+HXtYblRtkZigPpyuf9A==
X-Received: by 2002:a05:701b:240d:b0:144:eb46:c3f with SMTP id a92af1059eb24-16a572659bamr10847616c88.2.1791717373401;
        Sun, 11 Oct 2026 04:16:13 -0700 (PDT)
Received: from FT6N242TWK ([223.181.119.248])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a6021e49sm20851347c88.20.2026.10.11.04.16.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 11 Oct 2026 04:16:12 -0700 (PDT)
From: Shashank Mohan Jain <jain.sm@gmail.com>
To: Eric Dumazet <edumazet@kernel.org>,
	Neal Cardwell <ncardwell@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	"David S. Miller" <davem@davemloft.net>
Cc: Kuniyuki Iwashima <kuniyu@google.com>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next 0/2] tcp: keep the route window on the SYN when SO_RCVBUF is set before connect
Date: Sun, 11 Oct 2026 16:46:04 +0530
Message-ID: <20261011111606.14753-1-jain.sm@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v1 was a single [PATCH net] with only the fix. Eric Dumazet pointed out
that the changelog overstated the effect (TCP_WINDOW_CLAMP does not
persist past the first data segments), that "no window scaling" was
inaccurate (the option is still sent, with a shift of 0), and asked for
a packetdrill test and for the series to target net-next. This v2
rewrites the changelog accordingly, leads with the common
SO_RCVBUF-before-connect / listener case, adds a packetdrill test, and
is based on net-next.

Patch 1 is the fix: setsockopt(SO_RCVBUF) must not write tp->window_clamp
while the socket is in TCP_CLOSE or TCP_LISTEN, so that
tcp_connect_init() and tcp_openreq_init_rwin() still apply the route
window metric (RTAX_WINDOW) and the defaults to the SYN / SYN-ACK window
and window scale.

Patch 2 adds a packetdrill test: with "window 4096" on the route to the
peer and SO_RCVBUF set before connect(), the SYN must advertise the
route-clamped window and window scale 0. On an unpatched net-next kernel
the SYN carries win 65535, wscale 5; with patch 1 it carries win 2920,
wscale 0.

Changes since v1 (single [PATCH net]):
 - changelog: say the patch restores the SYN/SYN-ACK window and window
   scale, not a persistent clamp; note that since a2cbb1603943
   tcp_measure_rcv_mss() recomputes window_clamp from sk_rcvbuf anyway.
 - changelog: "wscale 0 (option still sent, shift 0)" instead of "no
   window scaling"; lead with the SO_RCVBUF-before-connect / listener
   case.
 - add the packetdrill selftest (patch 2).
 - retarget from net to net-next.

Shashank Mohan Jain (2):
  tcp: don't set window_clamp from SO_RCVBUF before the socket is
    connected
  selftests/net/packetdrill: test SO_RCVBUF before connect keeps route
    window

 net/ipv4/tcp.c                                |  8 ++++++
 .../tcp_rcvbuf_before_connect_window.pkt      | 27 +++++++++++++++++++
 2 files changed, 35 insertions(+)
 create mode 100644 tools/testing/selftests/net/packetdrill/tcp_rcvbuf_before_connect_window.pkt


base-commit: d8674294aefef02266c4d47ad10131f1bffbe534
-- 
2.43.0

