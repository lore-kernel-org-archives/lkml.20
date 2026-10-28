Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.136
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793155837;
	b=LAvrSoJyGsDQndMJmZ9vKUZs90mQH7ZTsJjUCZgrlEHHcEfFdDyeL01+nk3FcX6xN6AD
	 6FkKjwrOvBBsxkDxrQmVxeUJTE1yWMlEpDfN/5ToUzz23teaZzRftEH8iuNPLCobuSvjv
	 Gr6w9GI4K8TPeM02sMUgQEcwHoyYYJGeGTbuPopg3R5yfZvyP/Fo24J0vpElEWO2tbrS2
	 W+FIDIeReomDjWbBH1DFMSQzeOsLbBkRQRb2FbeiCV1qm3R0W/caND1Kr6fjB5ROrO1+S
	 AO+Lhr+79Ksmg96L6VyNI1vv4LkSgCSTRIsdFfr/LNFCq0iwnJ+OhhBAdmsZmN/MmXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793155837;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1dzXShKALUyaZeixBnjjH+DrrZjfaru5HO9W3ebDULU=;
	b=hbIvZPh40r+9fZNDc0CxDv3cBzQU4ssl7gB/IcsByQRbwFzV6hr/wg50fLhscFr7GF02
	 6kr0zTotfAoMgfwExiBQ+Wq6v1ZQre1KuvpIwWG6OQvJhWDntZsyM1mgKgVwKSBWO29sa
	 NfCh4ilistFcZeEuH4EY53iqYO89jtmFVc2rbUGIjkiKZEnFN/3yYNZ+tHy8ODHQ4Dm4H
	 z+aKngpZ3PxNYBdnkN9sFHvjNUBMDnpvdtfrRnkZczk+YBQ8PkdrHjHCSLpa+QOgeXPZH
	 aTVdYrXmNNXPzzstfO19p8Wsw0hZZR/w/tq1bXTylyiSBMJpw9Mr500G8yhgR4esPXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="eyx7f7/Q";
	arc=none smtp.remote-ip=74.125.227.136
Received: from mail-pj2-f8.google.com (mail-pj2-f8.google.com [74.125.227.136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B21606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 02:50:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9B21606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eyx7f7/Q
Received: by mail-pj2-f8.google.com with SMTP id 98e67ed59e1d1-3ac749e0719so169908a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 19:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793155836; x=1793760636; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1dzXShKALUyaZeixBnjjH+DrrZjfaru5HO9W3ebDULU=;
        b=eyx7f7/Q+fC5WBU+omNKOxO+4BfKSrMYmI8hYrJpclwUOEoA6wTu7EeAmY7Z94v2oI
         M2TY42zmspkcu6VNsxBjAE+aF4d7IfbfAvfA97oHKZtIeEsT6eInGiG94FMu1Cn2ev7/
         Fszu12V9BVBTIMIahHLC97qq0zzHjq9XpWGOvDUNFrPmjxkCT7wpKB180sqCNkYD7ryB
         eUWUPZVUN5qMpZYuwf/1KjMQpJeVFpWVHh3uDsxU6Wn5FeL8hY5sByuXW7AGfbxKz3DD
         HTubBCzRUHy7MA2t5uuYNN3slB9JE+NzyjvZwmX7KN6tS4KhIhFId4YKXcelvnKIL8AI
         1cQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793155836; x=1793760636;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1dzXShKALUyaZeixBnjjH+DrrZjfaru5HO9W3ebDULU=;
        b=eK3ZbQlZK2RPU044fcNFulRvm2DlTYASwOFFyBvdivvJFNUV5Uixkbz3SvbG8BmYyw
         x1WuYZ0K71AsVSR/eCjrNP/xYiu5Ew54PZYGtBjMJJjq9yGqvZs5cwePskBAywNLh996
         tUfeoBgDI1b2pFR+PK7wY94XhX6dqn6eCd1+QiCWqhwAO798Z8SuAc60KG2IgaxZW4qY
         RYqp26HT0ZhrtJM/IFIq6SfrMy3G8JaZlKfo/qsGxA/XFZ7myuRABwrdcY6e+cS17Ds1
         9Drf3BBaCL6jMPueOqi7bICi5DJq+m+JGSUM2nu8bfZHyIaBQlcmOx2Td7Kle7ln5zwD
         7u/g==
X-Forwarded-Encrypted: i=1; AKwUvBwD4oJyjlsShLdTfeA/1OaXfmxqt68rm5Cb8sa2ToqS2gjBmMOao5f/EXXvae6ubO00mZbqZgUM/F1X19A=@vger.kernel.org
X-Gm-Message-State: AFq9FYLf05/2oVEN9j5BvNY0I5c4rDccj+ZgYcPyA8IB35MOTVRdJE0G
	wF8IFN8GPOZYl7/fvoAoqfv48q5tIgp9jq/qSaTxRU8uw10dzUxH2TrD
X-Gm-Gg: AYBFou0zULbg+zuzzICuSOyt24iy1TY6QIp5WQ2mzW6uWKGGREUXtKsH3efUGp6TCr1
	sEXuIXw4wZ6FMLbEopl6Ta9Gl98WBeXS67aJ4DkxdkoET5FVtqnN/NnupsArYQBNei7f2cObjbb
	HY8OL4pjIwuQO4A0rFWttdkh1AMgigz3yGCEBIE29NwkpjxO41eq3+TpgbPFFSEN/Xi8y+LY3Ib
	OuR0BAp6P95STSqoxh1XuOBvd55gRyKxvD3O6D404HnqJ3fO3JTNTXtBAhhuO0f8zij+bVz2CyP
	yAT/NUx3nP2hetb8LBN7Eju+qP5mDHTuyLjXsSByhsqchSwFtdjVgRLaMS6Yx1c6NW+vn0IudlF
	l08xOKa8VMeQQcIKTshrtgziFjSdvQYlxCVHxD+AY31MBnGtfcdba2oiXAg9y7TmHTOFLhYQ3lQ
	OpvprDbxFE4xYxEgS2PTJlneaLhkyMnATO5QCcBmnvefM20woUcrdy0uk1YBHabvNoRdBXA3u/h
	m65nYJdu06b7Ui5iKU8oqz8l9tw0OeFZfxaDSbV1LP+C+gj7HbLnoM696qxgGx+pBothkHnjLWS
	Y+ERI81lZu9qpGHXjEA+ZK9ikKfqUv70ieQ9P0t51JAbWH5rem1NiKIb+VgfkfpRWyALauiwCD4
	dC3PqDzcR
X-Received: by 2002:a17:90b:3eca:b0:3ac:a203:e092 with SMTP id 98e67ed59e1d1-3ae57e078a3mr731546a91.1.1793155836154;
        Tue, 27 Oct 2026 19:50:36 -0700 (PDT)
Received: from localhost.localdomain ([240e:46d:1d00:2b84:48c6:402f:d1c5:644a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae55d64c0bsm812447a91.1.2026.10.27.19.50.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 27 Oct 2026 19:50:35 -0700 (PDT)
From: Rongzheng Wang <testwrzwrz@gmail.com>
To: netdev@vger.kernel.org
Cc: Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
	Magnus Karlsson <magnus.karlsson@intel.com>,
	Jason Xing <kerneljasonxing@gmail.com>,
	Stanislav Fomichev <sdf@google.com>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	stable@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rongzheng Wang <testwrzwrz@gmail.com>
Subject: [PATCH net v3 0/2] xsk: fix multi-buffer TX software checksum
Date: Wed, 28 Oct 2026 10:50:24 +0800
Message-Id: <20261028025026.11401-1-testwrzwrz@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
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

This is v3 of the AF_XDP multi-buffer TX software checksum fix.

I found this while testing multi-buffer TX with XDP_UMEM_TX_SW_CSUM: a
two-descriptor packet had a bad wire checksum, while a single descriptor was
correct. There was no production or syzbot report.

Patch 1 moves the software checksum calculation from xsk_skb_metadata() to
the point where the last descriptor has been added to the skb.  The old
code calculated the checksum after the first descriptor, so multi-buffer
packets only included the first fragment in the checksum.

Patch 2 extends test_xdp_metadata to cover the single-descriptor and
multi-buffer TX cases.

The updated selftest passes on the v3 kernel in a local QEMU run.

v3:
- preserve unlikely() around pool->tx_sw_csum (Maciej)
- restore the binary MAC literals in the selftest (Sashiko)
- keep a distinct malformed-packet counter out of this stable fix; if it is
  useful, it can be added separately for net-next later (Magnus)

v2: https://lore.kernel.org/all/20261024141157.59301-1-testwrzwrz@gmail.com/
v1: https://lore.kernel.org/all/20261024091256.17918-1-testwrzwrz@gmail.com/

Rongzheng Wang (2):
  xsk: defer software checksum until the skb is complete
  selftests/bpf: cover AF_XDP multi-buffer TX software checksum

 net/xdp/xsk.c                                 |  23 ++--
 .../selftests/bpf/prog_tests/xdp_metadata.c   | 122 ++++++++++++------
 2 files changed, 99 insertions(+), 46 deletions(-)

-- 
2.39.5 (Apple Git-154)

