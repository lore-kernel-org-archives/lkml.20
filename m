Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792435740;
	b=AnWnJequtFpcEsfyrByBY1KCKIF9ZMP0svtxGdXp5qqs/Mn/OhA2a64r5kG3gvPfG/p5
	 7eVeKNx90nmR0mJpjtumr54pigjS0MfXgmRJ7zvVDtHS7ruRELfDJxIQKtfOuGJzK8WOm
	 8Msd5H0j1nwGSaLNdu+yqMLbSAAURxBZpxiZMTSfRzhukUHF4mm2NCamDgFRd3XrOMQx4
	 g9OXixyxTTRLUTqFTP4y1yLBPB0e2pmJx+eUCH+PlLFNTwdxeyo7dzFndg1bsULS1TzgR
	 cXbZczS2EBmkyeuArWtJnJyJqoKbThvJNtQgGnZ7G1vYZP14Wu1An5zqoCyAf9W4Sdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792435740;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=LLSI7PktqOCoaAdY+nRTbxlJri6KWY7IdvuhfDd+3gM=;
	b=IQ06GwsYoHkVB9/2FMZVnohU2tseA67lj6osxgb0EH9lL92rdUKYAXSSHeyLYWbR0OlA
	 P9QbrEzWqAxeUib9oWHKufc7A82LU07aALJVX+h6bfGvkzXQqM2hNjzqQmYS0GTTHL4O9
	 bYMuWVBMRF+v/FCqKVoI96EtGcMvJ0Tu5OWcB3nkn8eN8zGsJmQr8rNSNQQWRWegteKea
	 iKvkWHWW+4tOfMrr4bebIj3QKVytznLlrDgeWtaaGqzrfot2+R6a0Y+Znk8q7GjFAQNTQ
	 V14F3ghfCyje0ERu8UoI4wi2QN1Cbsn4z6ra4o1G0qE+eKf39m62riUxNlkJEgjMi8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=U4ZHCe5N;
	arc=none smtp.remote-ip=209.85.160.178
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7067606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 18:48:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7067606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=U4ZHCe5N
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-53512cd2f85so27936961cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 11:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1792435739; x=1793040539; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LLSI7PktqOCoaAdY+nRTbxlJri6KWY7IdvuhfDd+3gM=;
        b=U4ZHCe5NO6N+hQbi1iEFnMsNMJoMSf3gdmKTzm4rJN01YlfmjT42JsbW+9aOcVaP1E
         K/GcbkOGYXM75il+9cB7zF9MIGTjM2ehLhZdjZs+0sqrGeSF2h332E2jfN2UgPIp4b1/
         8AvC+3ro+a8aXwJsjMe6IjzPXIftsFduWqnIFbClS0D359WMbb4ZquUeOlDIItJiAuyl
         ML8gFFl4E7qw+8cfR6AzXAPn73IL0IdXV/jsO8RNITQGH69gh2denSnriW99kszKrm6b
         GMOKybKDCa22Ns4t/TtQOPUfDQ2WPFKHncHzGU+Bhsx7BUv8jl9YQw7W8wBYdk/j41Rw
         2Kcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792435739; x=1793040539;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LLSI7PktqOCoaAdY+nRTbxlJri6KWY7IdvuhfDd+3gM=;
        b=Efo/z00RuQkE4rP7HY0/Eqfbft9m2wujN/SRBfufvGzU8ynxyoLESgYKO/E461hh/a
         DLAPPCeFqNzphukIvzD0jY9seOHWx0MSFr/hYBXhjVGAxxVrWlViayxTCmWtJydaI2Yl
         4aDRWB4Equ2oB/CIRnJk4Kv6NVS2anX9mLhphV72+8qIFllk/h9AA/qWHxYS12oc7H4W
         E4xDUmPiRQSe6hg1RKiZ1WhpCCe3SLvNGxn8w10NAjYJ5o7VL1dbGQk8eiICsMlq0hzl
         q2thYitq/CkQmX9V0xE1c2VT3/LFfhNgMwFFPX6vvcCGU53g7wgIJYKHFc6peofxMkET
         oR+A==
X-Gm-Message-State: AFq9FYLpRVyJtgW/oul+RRf1HOsvMRv7+6rh8uHuxB5Vxvd3rkQgQiPs
	aJd5R4VJhL1yxmrJTeU6YMhDIfNWZRlT7avHk1o/7PD+0ZTeTtH6UxaIXFTOq9pDjZc=
X-Gm-Gg: AYBFou1alhveiF1BWJwcAT76+tWxpYpZPymCWahwinhuDBnFm5i24VFPwuvIxopYZTQ
	lg1QDYVkVrrxwwBJ7Jq+ErcLPf603kK4Qhlcdozq8rPXFG0RpvPbFpaiH6JlTivu1Cfh7T20Fvg
	5CHT0E/5Exmql/VvlaxhibsGFFWbaezPvRHzb2TKaX4KN8Fu2JfKzmIHPbBp6ZGMNCrFKJwWT7G
	JwlK2nNuOE9xfAwUU12RubqW6uUmlHrMlhxwBMmcSssqrHxOLDP++7Jsg2vrp8jjQyRlieQ9E0g
	tqtpcX2pTyNTLmvzYSn+7IquI9qUCWiZvMtwUKvVTa1y8hUvBkTnmmyjbZmo35eV0ouT0QSBPEy
	35TTrNOEtVtw0sCxDoXzkcWTxiqBxqxK7IHvcblsI8ppn3xiR7sw6+bjjBxSM1ds8IdpMgRsyoA
	LZR/PHXzRzoSFL6o4eOgKtYOetEusIWsg0PQpiuzD1AD2+0XyrP9oB1JHb75sSAU2MaDt3qvHBX
	D6EIp+BjRJ9NY10DfiA1qfCcaPltvKJmIL1TSobDydUJ2YyxsD2/6NrCewd
X-Received: by 2002:a05:622a:401a:b0:536:5e83:589 with SMTP id d75a77b69052e-5365e8314cdmr96885911cf.71.1792435737103;
        Mon, 19 Oct 2026 11:48:57 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c040a49b4sm3183196d6.24.2026.10.19.11.48.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 11:48:56 -0700 (PDT)
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	akpm@linux-foundation.org,
	vbabka@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	brendan.jackman@linux.dev,
	hannes@cmpxchg.org,
	ziy@nvidia.com,
	flyinrm@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH] mm/page_alloc: let the highest memory node recover from hopeless state
Date: Mon, 19 Oct 2026 14:48:50 -0400
Message-ID: <20261019184850.3427905-1-gourry@gourry.net>
X-Mailer: git-send-email 2.56.0
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

free_frozen_page_commit() clears a hopeless node's kswapd failures once
its zone recovers above the high watermark, but only if another memory
node exists for allocations to fall back to.

The test `next_memory_node(nid) < MAX_NUMNODES` finds only memory nodes
with a higher id. The highest-numbered memory node therefore never
recovers on this path, and its kswapd stays disabled until reclaim on
that node makes progress and balances it, or demotion is re-enabled.

In many cases, direct reclaim many never fully run against a lower
node (CXL/kmem), and that means its kswapd can end up full disabled
in rare situations.

To reproduce, fill the highest memory node with bound, non-THP anonymous
memory and no swap until kswapd gives up, then free it: /proc/zoneinfo
keeps showing node_unreclaimable 1 for that node. A lower node recovers.

Count the memory nodes instead. Adding first_memory_node != nid to the
existing test would also work, but a count says directly what the check
means: some other memory node exists.

Fixes: e7a5f249e6db ("mm: re-enable kswapd when memory pressure subsides or demotion is toggled")
Cc: stable@vger.kernel.org
Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 mm/page_alloc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 417c427b196d9..6d4f03faf96ee 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -2929,7 +2929,7 @@ static bool free_frozen_page_commit(struct zone *zone,
 		 * kswapd work again by resetting kswapd_failures.
 		 */
 		if (kswapd_test_hopeless(pgdat) &&
-		    next_memory_node(pgdat->node_id) < MAX_NUMNODES)
+		    num_node_state(N_MEMORY) > 1)
 			kswapd_clear_hopeless(pgdat, KSWAPD_CLEAR_HOPELESS_PCP);
 	}
 	return ret;
-- 
2.53.0-Meta

