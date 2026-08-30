Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC67839282C
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 07:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788076707; cv=none; b=pZnIHLSkbyCFCpF3D5cOMs9I2ynkLMqkjecv/EBDGLzpQ0OqL3x7MCyJIz/eaJ2VVkwY+e7YvxSyeKdGCJNJLOVGMbz1BnTfsRldc8kwTRIjPN9drPcrVyJjnL9uKs++oyo0XhyS8yEdanLcoIsSSrbnTxbG0B6nGWRiVdvkB64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788076707; c=relaxed/simple;
	bh=jegzOw+EXJIP4W/35cQGumTCQXocudJkdz7vv0uyPE8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kgzwoY/Al75vlNkrj+eJUyogmjvwmNuA4oMKDCCQCCBK+/ApBEipXru0oUYky2vPBDz0BIPLim8zC3Xrjwt5qDbHtU0VTu7ksEJd4z8Hm17cux20uzkqUrXaeAulVDtbeXoPClbKwI3MPkJK7EovgGTd8nlctor7gXdOyusiLyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dIMGFTD3; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dIMGFTD3"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4995b0343c1so23285235e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 00:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788076696; x=1788681496; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+j1AD6ZP4+NwsaE6HRfrB5G8mDdyvb/fqBpbDqu3VZE=;
        b=dIMGFTD34cL9Vp75CFV88Ji/ud6Q61woZTjg2Bh1TNJjNi7ef1uJWzbmNQy1TDX2aM
         yeK8qjhzkGiZZAuNS6xwGRmUe4kNbgKCL0FbhRTTm2vt8ZSWLnrXo92j/gy03NsPtT17
         GrUwmZmIUkczBgUU52rALxI3qa4QbaqK9K6zy7glSUgz5QMZwaXb1uI+vui44B27WzrS
         604b3ER5kPVzt5NGyOcZY73Pl6FfaXUTL+EMmy45RHIjD4MPVUzJaju34ozBTshwE17q
         zFtSfHbyhFlJUlWIMjUQ+8hahc8Vbl4A1K5a/RjQQcz/vwciaWgMbyqgtjtO+Wp38sTW
         ddsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788076696; x=1788681496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+j1AD6ZP4+NwsaE6HRfrB5G8mDdyvb/fqBpbDqu3VZE=;
        b=J+ee3WCs3z442Duatn6uKfJKsUc3XvqxHvQcS7OfAiGJghqIIoxQWFpgOdLo1qZezO
         R9SHO2NAOJn007R9oEfdlCg9tiBT/b/C/Fnc6PaUPvgy7XGobLIpZHDHO7qS9mg6cqCA
         UHmpF1ettFgqp4YoYCfCbSlS/7kkHf+NTi1huwQtF1BxtuEW2X5R1RxLRHk2PiRh28Um
         sdNBP6uC9kip0CR3JqwVZEiy2Jl4IpLCfE4kTd1qs8e/TnLyCfw1dlPO79fQO9b6nv4j
         H2KoQMx5TgHtXcgp/GFxwYBO5oWA/RhT/rjy1ph0L7CVgjy6dGDdCKgKzIba+Tmh859r
         IT2Q==
X-Forwarded-Encrypted: i=1; AHgh+Rr1JSJpQJMHqHP5ncdQNR3DNKjg/V7lgGhpkKl7JIsQe5mq0Fat5dASxCYtydKm5Sff+6YiGPyMTt6WWlc=@vger.kernel.org
X-Gm-Message-State: AFuF++kTjg/RnCEAl52+CN3G96g3v+1k1tWPuDZlpYJrm57Tx8e+JrTa
	/aEVrcffkt/Q4M/7u4NndtzfAi2qXXzLhyoB7Mk3dW1T96nGgGqWeeV02HnUVW0=
X-Gm-Gg: AR+sD12kuG1vO7r1J5/OlEET/8pEQoSl7t/1/+kJaNq0fEIYZZd+Q/iUgalDDKWocNS
	Vc1xQw+tvibVRr7Y4+WSb3LIqptl5M6SsM+uA0Nb62SxN0e3ylLyYmwUXGxZXSw+L3zQMU3pkBn
	j7IEJNkduEkIuGbd9OBn9x7XFORdaplrhtO6KFRbizga726O8rnKBYFmBh4Z5m8nTXguRdkIlWs
	946Gj5wS3WQNuxvN4EWMxRYhzlXb//YR84KOerM81kmbW5sK1eATDFHBbENfAcgz3nZ38/79hIm
	1aLW1eHY8q8GS77omZhA1VF0l/ZC93+bsm3vA9ugTZHHUj6qRv9nN3nkcstxfLm8kA8U52fJzHo
	8gFHqVg+uRIWrQC1ygYfjajMRSZ/vm7++2+fuxXV/9cJfZYv+8KItX9u1GuDTEf7ze4SZaPuDkZ
	6qNBYwYXeUMI/Sd4j7MwNtwcE3lOwqSvehRh8seIv5cb/Q3YoDlmI=
X-Received: by 2002:a05:600c:8b35:b0:499:7a19:408b with SMTP id 5b1f17b1804b1-49b91c3b71dmr267281245e9.11.1788076696142;
        Sun, 30 Aug 2026 00:58:16 -0700 (PDT)
Received: from fedora ([46.8.219.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cd53a4678sm14757875e9.13.2026.08.30.00.58.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 00:58:15 -0700 (PDT)
From: Vitaliy Sochnev <sochnev.v.74@gmail.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Vitaliy Sochnev <sochnev.v.74@gmail.com>
Subject: [PATCH net-next 4/4] net: airoha: grow RX ring 4 to 128 descriptors
Date: Sun, 30 Aug 2026 10:57:17 +0100
Message-ID: <20260830095717.37218-5-sochnev.v.74@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260830095717.37218-1-sochnev.v.74@gmail.com>
References: <20260830095717.37218-1-sochnev.v.74@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Ring 4 is the shared "force to CPU" ring for a wide set of protocols
(BOOTP, PPPoE Discovery, PPP LCP/IPCP/CHAP/IPv6CP/PAP, ISAKMP, DHCPv6,
SIP, LLDP, ...) and currently falls into the 16-descriptor default in
RX_DSCP_NUM(), same as most other non-hashed rings. The hw completion
race recovered by airoha_qdma_rx_check_stall()/rx_recover_work() in
the previous commits appears strongly correlated with a ring going
from idle to receiving its first frame(s) - exactly the access pattern
this shared ring sees under protocol negotiation bursts. Give it the
same 128-descriptor allowance already used for rings 2/11/15, matching
the other rings that see bursty, non-hashed traffic, to reduce how
often that condition is hit in the first place.

Ring 4 and the VIP classification that forces these protocols onto it
are shared driver-wide, with no DT/hardware property distinguishing
one chip variant's ring 4 from another's, so this isn't scoped to
AN7583 specifically even though that's where the race was found and
reproduced. 24h+ stress runs forcing repeated PPPoE/DHCP renegotiation
on an AN7581 board, both with and without the two preceding fixes,
completed 570+ forced reconnect cycles each with no regressions from
the larger ring.

Signed-off-by: Vitaliy Sochnev <sochnev.v.74@gmail.com>
---
 drivers/net/ethernet/airoha/airoha_eth.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
index d6591a779743..cd75c16d8d0c 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.h
+++ b/drivers/net/ethernet/airoha/airoha_eth.h
@@ -41,6 +41,7 @@
 #define TX_DSCP_NUM			1024
 #define RX_DSCP_NUM(_n)			\
 	((_n) ==  2 ? 128 :		\
+	 (_n) ==  4 ? 128 :		\
 	 (_n) == 11 ? 128 :		\
 	 (_n) == 15 ? 128 :		\
 	 (_n) ==  0 ? 1024 : 16)
-- 
2.55.0

