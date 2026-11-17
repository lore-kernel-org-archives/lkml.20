Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=93.77.172.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794906011;
	b=AfdTl9kzWQL/KRAR8OY5UDpF8S2axs/Pc+DwYE+2/u4cuIS30osNXmfn3TYJfjwoUvu2
	 weRPfgJDkDhsfCeP4WyCvDIazLqZ+C8J5NqQ8r3YiQXja1z8Z2Ws4XE8RVhWiQb17IohG
	 +1OfW5UNIw0cOamvOsUgVh6RRC8v5uYNPBzcbqs8EZ8iHANLN91Ej4tc1Zw+yrx8jB0Yz
	 H4TBdOJUCxpwudaZwIKr1q3d/pXRujumRuPkXS2VI/7hHu53bSV93xSmOwYu2QVLi5er5
	 wmgf7vfDe3GJhtfSjy3xXo0sauKx0lvdV7bvMbrbmR//2UsBfMwAjjnPO3F+OnTAuhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794906011;
	h=DMARC-Filter:Received:Received:X-Yandex-Fwd:DKIM-Signature:From:To:
	 Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yrf6NhexygXD8i0mMxPEyNZF0DBQgXQ70/ethvzXbKU=;
	b=GiuN40lLPrJM8JcqFjoo3m7uzjsL9/1TK9pVD2Nc4sJsWSfqjo+3itrno7LBT+l2kdaN
	 wIflJbC3FMRMQPcSbptbw+QMsmqg8Sfol9a3hktKDngpQ2CLLxL8c53xJpBV8MEquIglp
	 Fpny0TIDTGyq0Vo/1X9gDunXMF6yUyeO9acb0mrLOWv41K96sirz/apDIsTmNQRRbFnNB
	 rff4GzIBIZpq6Nq58PadEuqG+aqp3Q4UuMtqKGcGJJcWwLHySqlfTzFEz6NM2d/ib/msO
	 nkFF78fp9wdzXYGDBys1ns9nfS09z2V4W/NR6OLfOFRr7pbYmn4k1vYb+w53AsLY6CA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yandex-team.ru;
	spf=pass smtp.mailfrom=yandex-team.ru;
	dkim=pass header.d=yandex-team.ru header.i=@yandex-team.ru header.a=rsa-sha256 header.s=default header.b=dS98J49f;
	arc=none smtp.remote-ip=93.77.172.4
Received: from forwardcorp1e.mail.yandex.net (forwardcorp1e.mail.yandex.net [93.77.172.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB925606A337;
	Tue, 17 Nov 2026 09:00:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB925606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex-team.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex-team.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=yandex-team.ru header.i=@yandex-team.ru header.a=rsa-sha256 header.s=default header.b=dS98J49f
Received: from mail-nwsmtp-smtp-corp-main-66 (unknown)
	by forwardcorp1e.mail.yandex.net (postfix) with ESMTPS id 61D34100031;
	Tue, 17 Nov 2026 12:00:01 +0300 (MSK)
Received: from i101646577.yandex-team.ru
	by mail-nwsmtp-smtp-corp-main-66 with ESMTPSA id vxUih6Aa6Os0-GGOrX6TZ;
	Tue, 17 Nov 2026 12:00:00 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
	s=default; t=1794906000;
	bh=yrf6NhexygXD8i0mMxPEyNZF0DBQgXQ70/ethvzXbKU=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=dS98J49fGR91BqmRBIA9q0XV5r9PXDKuP2QB+LMVxuqUUeemY6pdnp8uPJt/wD2xb
	 Do5GtuC6CDo3uxSUD0WmRac+PXigugeuW0yiApGXe8W1iSiYxef7maXuy1XijcsnHJ
	 f6Buu2A/ZnbRkqaU9TEmEUzYo2xVhQRTsevXQZKE=
Authentication-Results: mail-nwsmtp-smtp-corp-main-66; dkim=pass header.i=@yandex-team.ru
From: Daniil Tatianin <d-tatianin@yandex-team.ru>
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Daniil Tatianin <d-tatianin@yandex-team.ru>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next] net/packet: don't direct reclaim for contiguous ring blocks
Date: Tue, 17 Nov 2026 11:59:49 +0300
Message-ID: <20261117085951.681985-1-d-tatianin@yandex-team.ru>
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

alloc_one_pg_vec_page() first asks the page allocator for a physically
contiguous block and falls back to vmalloc if that fails.  The first
attempt uses __GFP_NORETRY, but that still allows one round of direct
compaction and reclaim before giving up.  Under fragmentation every
block of a ring pays for that round, so setting up a ring can stall the
caller for seconds even though vmalloc would have worked right away.

On hosts that run tcpdump periodically we saw ring setup (8 order-6
blocks) stall for up to 1.4 s per block and 3.5 s per ring.

The contiguous block is only an optimization.  User space maps the ring
page by page either way.  So make the first attempt without direct
reclaim, as kvmalloc() already does since commit 46459154f997
("mm: kvmalloc: make kmalloc fast path real fast path").  kswapd is
still woken.  The last resort attempt after a failed vmalloc keeps
direct reclaim.  Order-0 blocks are left alone, the vmalloc fallback
would reclaim for them anyway.

Signed-off-by: Daniil Tatianin <d-tatianin@yandex-team.ru>
---
 net/packet/af_packet.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/net/packet/af_packet.c b/net/packet/af_packet.c
index 8250e6a791f6..38f35a4f9d49 100644
--- a/net/packet/af_packet.c
+++ b/net/packet/af_packet.c
@@ -4493,8 +4493,16 @@ static char *alloc_one_pg_vec_page(unsigned long order)
 	char *buffer;
 	gfp_t gfp_flags = GFP_KERNEL_ACCOUNT | __GFP_COMP |
 			  __GFP_ZERO | __GFP_NOWARN | __GFP_NORETRY;
+	gfp_t first_gfp_flags = gfp_flags;
 
-	buffer = (char *) __get_free_pages(gfp_flags, order);
+	/*
+	 * A contiguous block is only an optimization because vmalloc works
+	 * too. Do not stall in reclaim or compaction to get one.
+	 */
+	if (order)
+		first_gfp_flags &= ~__GFP_DIRECT_RECLAIM;
+
+	buffer = (char *) __get_free_pages(first_gfp_flags, order);
 	if (buffer)
 		return buffer;
 

base-commit: 073d54dc3ccc8c8109c56e4d984d1ad616554463
