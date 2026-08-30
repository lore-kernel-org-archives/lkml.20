Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD05358399
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 23:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788132145; cv=none; b=X5vMUHNbVnseshWi9aqH7xj8Rd2G+nYxU3rRBn9H6ZI3nmbwKXMYwRVxhoH2T4Jqjlz5SgG+rvHIuHMhFmDegFqzIFx4lqUCh7uS7etNobysxk7Z77RKsPQ1eCERRRA0Rt+x1AgX+iLOSLFEiWRJUIRlsVIW9Jf+qWSi8/Fg1wA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788132145; c=relaxed/simple;
	bh=lWdkSLVMrJME+IC4sl1WFmK4U1DvQrIT1XEOvyx3X9M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l7nSD3wHE7ycZmt8Ri8h7PjqZmXDfZ+ch+OyAWcYnAXBLAbbRfU7BXLjkL/k2OcoVKA/id3qfYNUputVGsHbXLoQCYm1dcHCuSJiksSj5ZzmUPoNPrPcr5LNV5oaw+U3qPdvaomejBJkVdwVYuB0chHbuK48Lgi2GoEyaYidxYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JTsrHMgF; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JTsrHMgF"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-861feb6d61bso8303757b3.2
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 16:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788132143; x=1788736943; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oDyIKzL6PQfyOtcZdXIqJp7bl04CBybW0yg006Rr6/Q=;
        b=JTsrHMgF3Sr0E2BdUIqgdWLqVBl6CGEQTO5CbSaBs5JvJ2yFHrUiD09jUGYgoMC/pg
         13xtSMJQWrOhHGzDkjslSIH0EE3+sIfbw0rFkGQsJgXL3r5A122PbMhqJawjyY8Fb8yB
         Ca+iVoLsE2Qe2WGMGjcQWQDmxpDeZ20DpALdaHKQfki05ocWiGc/Bf+DimAevTwS/TJu
         WyJIkV65Mluvti/7D0EUhEkdwI46VilB2YbTNorWYesNQMGDlp2VSADvey7erA5GqEpN
         SNJOT4spYvuJmDQeiG3zH7QJq8OOm7b8w2VQT7UkqZ9AxydW7kUwBUi3JWVnVzTvONGX
         YLfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788132143; x=1788736943;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oDyIKzL6PQfyOtcZdXIqJp7bl04CBybW0yg006Rr6/Q=;
        b=g47Op4Sn7/igP0MdqK8lCtJddIstyKRGYiREtDsQOvM9agyn09d2BC5k2/Y9K1LHll
         22DuL9NuT/CqxFylT/a/PHrQQenmw6ATy89Ad02TfA6a4X+h31jollMSBdzzhYeAZRPK
         xeVORmBfAqtSiU2B3DCaAuv0UFILTJXHb71iWA+b326UXObkhtp7vUSIEZerCa8OCYle
         JGFZA/rt6Nak4dCGEMl3JBdr7Te/SaXu1WlIv3qw2MdTB89mpQh4CVMlYKlqs8yfb0rR
         o8PtrTO5XyDlQZSBXp8/3pZ1CsaPU0fMHL9sTt9/+ZYWnV9hmHed+DIDqJxHiaVIhWOY
         3wOg==
X-Forwarded-Encrypted: i=1; AKwUvByUSDe0W6t1nva43MDIpeVKi0z8zR4hXnUkaawVVQR4RO9xaW3Q8LNdvjGZ5tB8fY/LrlMkf8yMveJ2TtM=@vger.kernel.org
X-Gm-Message-State: AFuF++nueibppUgP4QM7uDTLU2E3IuZstX4Mc2Ru8HECBPJgpbgsu5ge
	qgY/lfSx+Esnpowr2eB99OQxpi1d/bk5eqm+Jh4F8G0W83jZ/MGaZOx4
X-Gm-Gg: AYBFou2IMDNjx5PRtaUkiJdB0ir9VT1CfZ3gfk6DNBFH81p0cIjUYT7eivzoc3bndvd
	2l5x7Hdb7niNJ2JcTnJwd1Zol09ApWZZrj3DUjv9GlFN7+QtyrBfG/xX7BWH/nCEI22h7z4J73q
	OROA/jD5SShc63feQVEvhbawewRiN3Oe7DFDlxj1lYO0oMP9l1HJoDvcOT92jMWeH/wst5R96mB
	0rWqQq3+SJaHPEJgmikpSkqyA/tpOs9ekr6vviGPYFYFbJCWP+OjW890ptQA77+K5zBDwSqmF2y
	J/k7N/l1pHRbcbDs8U+WPLKJ2asNlWr0ycjTJz6gXl/OGFiLd4o4LURYsRSDDSv0us903CIqHpS
	jDpq6JGhN2nMfDfjoIA5iQl+YFAn55u9UF5IOk+dhjfaYL1d23NXDwJ8Q+8O6nOxSBSa5n11ObB
	eKaxepjAu8sjiIceKVy4UuZj32HYVNmm9ai68bo70ofA7Z5pehKUE=
X-Received: by 2002:a05:690c:e294:b0:862:65f4:c8c2 with SMTP id 00721157ae682-86726879df3mr283417b3.21.1788132143343;
        Sun, 30 Aug 2026 16:22:23 -0700 (PDT)
Received: from devobuntu.lan ([2600:6c5c:6b00:316::23])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-85e677606aesm39025937b3.45.2026.08.30.16.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 16:22:22 -0700 (PDT)
From: Matt Vollrath <tactii@gmail.com>
To: intel-wired-lan@lists.osuosl.org
Cc: netdev@vger.kernel.org,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Matt Vollrath <tactii@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH iwl-next 2/8] e1000e: dump pages for jumbo Rx buffers
Date: Sun, 30 Aug 2026 19:21:40 -0400
Message-ID: <20260830232146.36948-3-tactii@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260830232146.36948-1-tactii@gmail.com>
References: <20260830232146.36948-1-tactii@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The jumbo Rx path keeps its data in buffer_info->page rather than the
skb, which is only a shell. Previously data beyond the end of the skb
allocation would be dumped. The jumbo path would at best dump useless
garbage. At worst it would dump arbitrary kernel memory. This OOB read
is only reachable when page size is >16K and MTU is >1518.

Dump the page instead when it exists. Skip dumping the shell skb left
behind when a jumbo slot is cleaned.

Signed-off-by: Matt Vollrath <tactii@gmail.com>
Fixes: f0c5dadff3fb ("e1000e: fix panic while dumping packets on Tx hang with IOMMU")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-5-fable
---
 drivers/net/ethernet/intel/e1000e/netdev.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/intel/e1000e/netdev.c b/drivers/net/ethernet/intel/e1000e/netdev.c
index 599600ad695c..47ff3c6ab451 100644
--- a/drivers/net/ethernet/intel/e1000e/netdev.c
+++ b/drivers/net/ethernet/intel/e1000e/netdev.c
@@ -465,8 +465,23 @@ static void e1000e_dump(struct e1000_adapter *adapter)
 					(unsigned long long)buffer_info->dma,
 					buffer_info->skb, next_desc);
 
+				/* Jumbo buffers land in the page; a cleaned
+				 * jumbo slot keeps only its small shell skb
+				 * until it is refilled, so only dump an skb
+				 * that can hold a whole buffer.
+				 */
 				if (netif_msg_pktdata(adapter) &&
-				    buffer_info->skb)
+				    buffer_info->page)
+					print_hex_dump(KERN_INFO, "",
+						       DUMP_PREFIX_ADDRESS, 16,
+						       1,
+						       page_address(buffer_info->page),
+						       adapter->rx_buffer_len,
+						       true);
+				else if (netif_msg_pktdata(adapter) &&
+					 buffer_info->skb &&
+					 skb_tailroom(buffer_info->skb) >=
+					 adapter->rx_buffer_len)
 					print_hex_dump(KERN_INFO, "",
 						       DUMP_PREFIX_ADDRESS, 16,
 						       1,
-- 
2.43.0

