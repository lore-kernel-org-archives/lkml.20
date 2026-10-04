Received: from mail-wr2-f8.google.com (mail-wr2-f8.google.com [74.125.225.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A5763C09F2
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 16:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791130338; cv=none; b=P8wxu5R26/cXVOduYEKkrRDtAPjuqyBNNuUoDKV5xknSoIEl2BSCQhOtmNvNj89EJD67H0jfWkusc1C+BjWwfMYp/F03TCt7t+NhExN6MKNh5yUlDteGpWmCF0pcGJHRNGJsfWDzXHlBFEqQFUxiJhA8mKE3eR+AiPwg5wjyx/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791130338; c=relaxed/simple;
	bh=/idkTiictibcBwPx3KaPsQdtHC3he+EupjWKYNAP2kU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a/7i7BNgHWGrZCfVavsI4a+DRRRo33/M/jn0F69/ghMCFR9bcwcbga4O3fptv/ODUGgYtG5JfvxMhwMLbAXUjK9vQf/K0lLtrqI+W1SjssgWlhnDiTBPr2U6b2Y6O2sHwycfK6zoNgDkdhsqIP8FVuH5eNrp6u/GIlgbQBPJrXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net; spf=pass smtp.mailfrom=blockcast.net; dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.b=LvYwD5Gy; arc=none smtp.client-ip=74.125.225.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.b="LvYwD5Gy"
Received: by mail-wr2-f8.google.com with SMTP id ffacd0b85a97d-48b007d7d2cso387698f8f.0
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 09:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1791130334; x=1791735134; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FPYochGZLRchHnAPZrvdvx5IZfJjHufMRI6BSKQPizk=;
        b=LvYwD5GyiDwXhrg/S3JMlbplWAU5Gcxl9zVnG1Q9it0n5G223lMoTRKLnxwTCSII6i
         K6JOHWf6U61ppLp3jIfvF243UtfPQ+lZW9g96sbmxG3bPMQwBs2LiwWp0ERocW9Fbkiu
         voMfnuuPH3woYNouPAHZeoIGSdhDt3K372E/rPhoG2EVsqWMLOTgw7NTvpsX4uEJx4wY
         K6TYwAJrPc6JxVLPC4WbKCffPhCWMm85zq7Njg5QU+KMR5A7rddbxf955UmAcpZU45if
         wpm0bU+hWdXebgQUI0ClWc94jgXoCpFv0lGgDF35leDqggX7gL4U25OUC9JOsku8z+fm
         vV/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791130334; x=1791735134;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FPYochGZLRchHnAPZrvdvx5IZfJjHufMRI6BSKQPizk=;
        b=m9zJOrrdxgPlW+sRave4TcGkWfkWMuXVdvnVGe6Ekc69ijnLutwjvf+iadpN3N+UXf
         WI1iogGnb8KIfQGCknqjYS3jmCaFV4dht2WIsVpMfCRQf43ZZkausKuGZ/QXnokj1CW1
         itknCXKGNR0/o9fisLKzbtIt3VAci00eyUDkNRDWVxcloKRWS0fQa8hV53wyt/W3ajkI
         6pED8NKmQRW9IIK/oBZrWrcvkSC1iHYmoyf5XGRwb/dc5/UQSXtEctNSmZ+lQtgM8KGM
         bBy17b+Yz4LnqG5mqBTytDyiTiZS4PTrO3owGASxdXeBLEybCik1Nw0Fmt3uvekkd+5+
         bpkA==
X-Forwarded-Encrypted: i=1; AKwUvByHoZNerqolNa4XXoeKQO+b7iGjdfDgFQazpsTjazwMJGSa3l446SEwS39HPuC0lDotJ5391zECkRI6FD4=@vger.kernel.org
X-Gm-Message-State: AFuF++l/ZsJEVarpBGlo2bWdbLGvKsdXJMXLwr0W9tqZJLBb3Z04s8oC
	ZxwWvhRYbFUd1GPaRJMk1UmtpG75uDNbtW7z2IahTaqBVwaHKpbsSoHG2knn3pWEF8Y=
X-Gm-Gg: AYBFou3WdW+d/uh2O2lLCaZfqh9mQn4PZ3roVORnIHopixbxoyKErR062sfZu3QTKdR
	z0ktMY7owAUs6Kjo4vZGHho4jmsC6CArinfKvIB5IZdqHaqUa/wrC43+dAIpUUZ86GY7PlW/o+H
	uocd8C+ZJC42EPfuxn/uKUCUoUN7JIieysxfSN2jrNk93ojEhHWikhpNuqxXm9oLQhbi+oNSDC7
	WBu2QJp9PG/9O2T4OdYj3y9r9xMCFn+nqszZFeM92KcAlYC0NsbW85bk9B52jA+f4QALIJ+zsDK
	4DmCA8CyvR0PfitAnzzHnohIInnTWJsBmfqKIzBLr9D6/OWYfYvFy8BryDGGxfMMybijb+yKCev
	a2uIu0sTwx7sdsHFEkDG7JgEG4tnZ3hAK4CrgJ6zhvwjEIEcoyIfZMacZW1E8NijK4t0v+EMXHG
	gKdu2Pf09oSh3nHEC99NIMEKgEphAk/9fmNkMRbmUPjMJPpMpUhbZuBx9AMAnfAy1aN3+f8wVbw
	ZNlp1K3AeTCQXHP+LVYjOA/q0p7E0nrzMFv7JYZU46mlI6dRk8FgMrKkR+fkkWCsyCTSAjx06yG
	rrC/h+abyOo=
X-Received: by 2002:a05:600c:5392:b0:4a1:6991:36d7 with SMTP id 5b1f17b1804b1-4a1699137bfmr78497205e9.10.1791130333960;
        Sun, 04 Oct 2026 09:12:13 -0700 (PDT)
Received: from localhost.localdomain ([197.51.72.2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a02854073csm244512275e9.3.2026.10.04.09.12.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 04 Oct 2026 09:12:13 -0700 (PDT)
From: Omar Ramadan <omar@blockcast.net>
To: Taehee Yoo <ap420073@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>
Cc: Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v3 0/2] amt: mark relay data as a UDP tunnel packet, with a selftest
Date: Sun,  4 Oct 2026 19:11:58 +0300
Message-ID: <20261004161200.27196-1-omar@blockcast.net>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

amt_send_multicast_data() never calls udp_tunnel_handle_offloads(),
unlike other UDP tunnels. With tx checksum offload on the amt device (off
by default), a UDP_SEGMENT burst through the relay is dropped before
patch 1 and delivered after it. Patch 2 adds the selftest.

This follows Eric Dumazet's suggestion on my withdrawn [PATCH net] "amt:
do not offer software GSO on the amt device":
https://lore.kernel.org/all/20260928181554.85766-1-omar@blockcast.net/

Not touched: amt advertises NETIF_F_GSO_FRAGLIST and skb_copy_expand()
refuses such skbs with a WARN_ON_ONCE(). I have not reproduced it, and
it would be a separate fix.

v3:
 - patch 2: fail a case when one of its captures dies (Sashiko review)
 - patch 2: also check amtg rx_dropped, as the changelog says, and
   mention the plain-datagram cases there (Sashiko review)
 - patch 2: wait for a fresh READY, and fail a case when a helper does
   not start (Sashiko review)
 - patch 2: fail, not skip, when no relayed probe gets through (Sashiko
   review)
 - patch 2: fail, not skip, a tx-on UDP_SEGMENT case in which no GSO
   skb reaches amt_dev_xmit(), as the changelog says
 - patch 2: make amt_gso reject sizes that would overflow its buffers
   (Sashiko review)
 - patch 1 is unchanged
v2: https://lore.kernel.org/all/20261002212458.34247-1-omar@blockcast.net/
 - shorten the changelogs, add Suggested-by, and move the testing notes
   below the "---" (Eric); patch 1's code is unchanged, one comment is
   corrected
 - patch 2: fix the shellcheck and 80-column checkpatch findings reported
   by the netdev CI, skip when AF_PACKET is not available (v1 reported no
   result and exit 0), add CONFIG_PACKET to the config, drop dead options
   and code
v1: https://lore.kernel.org/all/20261001171016.88208-1-omar@blockcast.net/

Omar Ramadan (2):
  amt: mark relay data as a UDP tunnel packet before sending it
  selftests: net: add an amt test for UDP_SEGMENT through the relay

 drivers/net/amt.c                      |  10 +
 tools/testing/selftests/net/.gitignore |   1 +
 tools/testing/selftests/net/Makefile   |   2 +
 tools/testing/selftests/net/amt_gso.c  | 462 +++++++++++++++++++++++++
 tools/testing/selftests/net/amt_gso.sh | 282 +++++++++++++++
 tools/testing/selftests/net/config     |   1 +
 6 files changed, 758 insertions(+)
 create mode 100644 tools/testing/selftests/net/amt_gso.c
 create mode 100755 tools/testing/selftests/net/amt_gso.sh

-- 
2.50.1 (Apple Git-155)

