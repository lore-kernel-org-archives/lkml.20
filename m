Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=183.62.165.209
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794674834;
	b=T96mJtG3Evh8g3E9+s10nhExYzrt3MNPYAjBJDzAyh3gmP4vxTtMy7sdhdlEv+NqfYb2
	 6ty7M3JXTKNhZ6P5PCdk3tnnruRENbztaiqhjUjJdgjlaKNl/EF74e13/8Nb6oAuZzByU
	 f8F9G0L55qc3Toov0XS39YIIrZXjAPPh6ma/8YxPMBQp4C5VgKszhm0awP/M9rwWfbVmw
	 qdDo7lYIHhYX3ksJt+fioMjcMxOpVt0gAgR9KFVrzodz/5WzFXCeVzr0zkTpdRVBv+nUW
	 ywKD8hsjqm1/Thf5lcWtbxJj55O+XSajn3CbhX76blvMijsB+r6BEUddHwCq/RZfBdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794674834;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Zmail-TransId:X-Mailer:Message-ID:Date:Mime-Version:From:To:Cc:
	 Subject:Content-Type:X-MAIL:X-TLS:X-ENVELOPE-SENDER:X-SOURCE-IP:
	 X-CLEAN:X-Fangmail-Anti-Spam-Filtered:X-Fangmail-MID-QID;
	bh=REi7QiYPl7c6P19kM5QAhrR/RLv2O8VPnLsUnTbts/Q=;
	b=0EdCLetDfad0/NKlMnoDDXCJRnB/1CgKEjTfFssxno0K8W8bVGNxHOyVxgfgwjxJ0eA7
	 vM0uVJbA2FxyvHMP+qLULwMWLBKQ6gqeFBAEDsyoxYOuHUIJtpDrEz/mfVZm7oby3GGS3
	 NtaH1e5xHFYEqgIqomWBdtmBv3FSoJiJuf0tOQqFpVuWT9znXibzpyPHTIVi+0aEq+taM
	 fslg7NyPSfRsWpM3cWDHlaE68BLnxGLO3mS4GjGYO/Z1GOw5Fa9AMpxIb/gpnAqUJ1vqL
	 eKeqW1AYUyipmhoc8Kej3XR7zDGxDRaiZ5oerJPv64wW2PmVc6yg9HLTJ+hWBLalYDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=zte.com.cn;
	spf=pass smtp.mailfrom=zte.com.cn;
	dkim=pass header.d=zte.com.cn header.i=@zte.com.cn header.a=rsa-sha256 header.s=z202610 header.b=KSHm3q3f;
	arc=none smtp.remote-ip=183.62.165.209
Received: from mxct.zte.com.cn (mxct.zte.com.cn [183.62.165.209])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81367606A331
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 16:47:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81367606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zte.com.cn header.i=@zte.com.cn header.a=rsa-sha256 header.s=z202610 header.b=KSHm3q3f
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4jRg5Q1jMzz4xPSr;
	Sun, 15 Nov 2026 00:47:06 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=zte.com.cn;
	s=z202610; t=1794674826;
	bh=Kv5hM57oYSpwy9YfyoUCbxe7s7mgHIuA1qm7uHUVv/o=;
	h=Date:From:To:Cc:Subject;
	b=KSHm3q3fhTWqgM6niPlx6MTDaHpTB1yGTIrZT2EpzWRcmUz1ZywtiTBMBnodEt7YB
	 Wt69FUYnegYpLZmDBHD4yDWjiQm28HSEcR6znOMbSCJyuFyDyvEVs9aVlYZRbaWdT9
	 NvbIahTQNdU0nFj+nzsvZU74YO2uDzQnMyid1M5AhV9f9imnpPzRxf902GAj8higZ/
	 d+a9BdsMF5gS+GDLWGLJckpPsm01/98QOCmsi8HomXR2kJVEBZqbLdZZqnq6JY10Ya
	 1TCnS98YMQJ7/wyUmgeJBSXzCVBUFXigMlSqzpxhnzS/P6rB/x6w0UXDNyRX80zeSL
	 LgiBXMhDjy5uw==
Received: from xaxapp02.zte.com.cn ([10.88.97.241])
	by mse-fl1.zte.com.cn with SMTP id 6AEGl2tZ089762;
	Sun, 15 Nov 2026 00:47:02 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp05[null])
	by mapi (Zmail) with MAPI id mid32;
	Sun, 15 Nov 2026 00:47:06 +0800 (CST)
X-Zmail-TransId: 2afc6af8908aa47-30a17
X-Mailer: Zmail v1.0
Message-ID: <20261115004706741mYrBkIRqmj_IWsv3oh1uZ@zte.com.cn>
Date: Sun, 15 Nov 2026 00:47:06 +0800 (CST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
From: <shao.mingyin@zte.com.cn>
To: <akpm@linux-foundation.org>, <rppt@kernel.org>
Cc: <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>
Subject: =?UTF-8?B?W1BBVENIXSBtbS9udW1hX2VtdWxhdGlvbjogdXNlIHRoZSByZWFsIG5vZGUgaWQgZm9yIGxlZnRvdmVyIG5vZGVz?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl1.zte.com.cn 6AEGl2tZ089762
X-TLS: YES
X-ENVELOPE-SENDER: shao.mingyin@zte.com.cn
X-SOURCE-IP: 10.5.228.132 unknown Sun, 15 Nov 2026 00:47:06 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AF8908A.000/4jRg5Q1jMzz4xPSr

From: Shao Mingyin <shao.mingyin@zte.com.cn>

mm/numa_emulation: use the real node id for leftover nodes

After assigning fake nodes, fix_pxm_node_maps() gives the remaining
physical nodes free slots in the emulated node space. The second
distance loop in numa_emulation() derives their physical node IDs by
subtracting max_emu_nid from those slots. The slot assignment does not
guarantee that this yields the original physical IDs.

For example, with fake nodes 0 and 1 mapped to physical nodes 0 and 1,
a remaining physical node 2 assigned slot 2 is read as physical node 1.
The wrong row of the physical distance table is then installed.

Record the physical ID when assigning each remaining node's slot and
use that mapping in the distance loop. Keep the first loop's fake-node
distances, and check the physical IDs before indexing the copied table.

Fixes: 63db8170bf34 ("mm/fake-numa: allow later numa node hotplug")
Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
---
Build-tested mm/numa_emulation.o and drivers/acpi/numa/srat.o with W=1
and CONFIG_NUMA_EMU=y on x86_64. A C harness using the actual mapping
function and distance-loop excerpts reports physical node 2 to node 0
as 24 before the fix and the expected 27 after it.
The tables and topology were synthetic; no NUMA guest boot was run.


 drivers/acpi/numa/srat.c |  2 ++
 mm/numa_emulation.c      | 24 ++++++++++++++----------
 2 files changed, 16 insertions(+), 10 deletions(-)

diff --git a/drivers/acpi/numa/srat.c b/drivers/acpi/numa/srat.c
index f5616830f5a9755868779a76a859134671de0178..798aba14cc6e649420644c84797ad0f2dd0751ec 100644
--- a/drivers/acpi/numa/srat.c
+++ b/drivers/acpi/numa/srat.c
@@ -154,6 +154,8 @@ int __init fix_pxm_node_maps(int max_nid)
 			    "Number of nodes exceeds MAX_NUMNODES\n"))
 				return -1;
 			node_to_pxm_map_copy[j] = node_to_pxm_map[i];
+			/* remember the real node id for emulation distance setup */
+			emu_nid_to_phys[j] = i;
 			node_set(j, nodes_to_enable);
 			count++;
 		}
diff --git a/mm/numa_emulation.c b/mm/numa_emulation.c
index 55f26b22bb0be25fff4a29e2d282e7d4459b3e0c..f2321666ed42dc3b765e5eeacaaad8e96974d5c8 100644
--- a/mm/numa_emulation.c
+++ b/mm/numa_emulation.c
@@ -525,18 +525,22 @@ void __init numa_emulation(struct numa_meminfo *numa_meminfo, int numa_dist_cnt)
 			u8 dist;
 
 			/* distance between fake nodes is already ok */
-			if (emu_nid_to_phys[i] != NUMA_NO_NODE &&
-			    emu_nid_to_phys[j] != NUMA_NO_NODE)
+			if (i <= max_emu_nid && j <= max_emu_nid)
 				continue;
-			if (emu_nid_to_phys[i] != NUMA_NO_NODE)
-				physi = emu_nid_to_phys[i];
-			else
-				physi = i - max_emu_nid;
-			if (emu_nid_to_phys[j] != NUMA_NO_NODE)
-				physj = emu_nid_to_phys[j];
+			/*
+			 * For real nodes fix_pxm_node_maps() has recorded the
+			 * physical node id in emu_nid_to_phys[], so use it
+			 * instead of deriving a bogus id from the slot.
+			 */
+			physi = emu_nid_to_phys[i];
+			physj = emu_nid_to_phys[j];
+			if (physi >= numa_dist_cnt || physi < 0 ||
+			    physj >= numa_dist_cnt || physj < 0)
+				dist = physi == physj ?
+					LOCAL_DISTANCE : REMOTE_DISTANCE;
 			else
-				physj = j - max_emu_nid;
-			dist = phys_dist[physi * numa_dist_cnt + physj];
+				dist = phys_dist[physi * numa_dist_cnt + physj];
+
 			numa_set_distance(i, j, dist);
 		}
 	}

base-commit: 84abb955b1015477aa11a96e2f3ac1b938b77f48
-- 
2.43.0
