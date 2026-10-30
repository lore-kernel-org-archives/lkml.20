Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793322321;
	b=nScyUocd9Ge1jMNHGda6MPHVnjfCd81d1U7dAoGjpmPnLW4F2JFsWHgQUaWsOyH8bIY+
	 Ws49F08KqoVha/CcFx1rUo32+2EgEUbRYzO6n3pu6h1Yq12tPXzbWaiAI6wc9xADFXvEX
	 rnk/Ty4tXw7+w4QuVVMCN+BUd9ncNv+YnBmDL6C7pHg+AcTCGqg8xILO5AmtWf4Bh5b62
	 69rVrn8tjq52OclUbGXajGvItnlU/bagsdam47tmjiUt61r7HSQo0p9UXo1YMHolUS9Zk
	 48OaLxjxBsVj/LUOit2Vve90XGOD3e1NzMp5VRE+LVk1M2vZB7rtDAeQKmwG1dfM1vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793322321;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=61qcPN07t2TUNYnm91oL81Sx86wLZQKTzOl/nzNJeWE=;
	b=AdeJtgKvaeIUsE37ippBb/eCr73Pdwz6e3w/xsqsSeFcWcHCkCzZWeoQsLT1DrJpLMER
	 zSuoY85WtiLO4cC05ffGRuaV6HiYue4NNrQO7qQby0hquq52bg/1vlPOwSRAXZVbQ20Ck
	 rog0GhbqLy/mI54mrAH1CSnqEWSh37W1SqbAjW8naFQfWe0F63YVh4BDZ0fzAk79XCmtn
	 xH88syfvybV0EFeuhKI+DfJUpHTK/oadzexPxM/CbWbZe6ndIzebgauYstwOVQ+Lp9zjX
	 Aq0pY7k4IftJxI0mIxkvDJybm/tfvcnupSTVo8RH6Mf0Vk3mjVrh48LZmVbKyOehg4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goodkind.io;
	spf=pass smtp.mailfrom=goodkind.io;
	dkim=pass header.d=goodkind.io header.i=@goodkind.io header.a=rsa-sha256 header.s=google header.b=O004XT8L;
	arc=none smtp.remote-ip=74.125.229.7
Received: from mail-dy2-f7.google.com (mail-dy2-f7.google.com [74.125.229.7])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93DE5606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 01:05:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93DE5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=goodkind.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodkind.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=goodkind.io header.i=@goodkind.io header.a=rsa-sha256 header.s=google header.b=O004XT8L
Received: by mail-dy2-f7.google.com with SMTP id 5a478bee46e88-33e5ae86ff2so85176eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 18:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=goodkind.io; s=google; t=1793322319; x=1793927119; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=61qcPN07t2TUNYnm91oL81Sx86wLZQKTzOl/nzNJeWE=;
        b=O004XT8LrV0kOisutmOjeOkAAcgRirG51SVD3eTlxC9uptQxVRMAqYRSNu3zpcLo0l
         b2F3CDZEzhqFsrq+v0UPbW2ga+lFo/WPETrz0pin/65Z3nqRpANzqMkqZcEFxBlx4gAU
         53M+M1jGn9I/cEYSdff4C4G1bcWbURr8WsLGp3nKYiCqgJaMXs2Powc1w18LASFS718w
         3hqR4AbydoLLPCH4px5SMCemEVpZmUlnb8iO3dew9dsKz7Hi6xFHKBdWeH4+sixtwYnW
         NHroCcs+kfS0b0yPpA1ffkAPRaxBSf1dc79SHBGXPY6sNUQQI6hY4lQlnyYqDp+YmQ0x
         vuPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793322319; x=1793927119;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=61qcPN07t2TUNYnm91oL81Sx86wLZQKTzOl/nzNJeWE=;
        b=gxXFc/EgRda+ZuhvSw4oiDzuxkftTTqQjxgGJ1UVl/b87uCnOz2wN5ecoMpql6eYWF
         MvRJJg8GHpX5T74ipopgvTrk2qKuc0+LelN+86n5UOl9VHjSwwzAlHV1JHkel8tdRvlM
         fme7kcrEYU61QA88UPVjdjoJdfLukvdPoLWkIbtPy1knprHpWTzhVTTUp4k/+Me+5Lgh
         T6RiFka92Jth5onuy9FG0xbdhWyv7c90hKtR3w5iArm8PYK0bHE1Ioigype8rO+/wOtz
         YOyTMZvWXbx3P7gantXcbGilC9Dt4gh4xGH/QwMRdPtxZmm391IE3x2BEQOk9dJKgCaG
         MwqQ==
X-Forwarded-Encrypted: i=1; AKwUvBx8kfqwUFM5Ep0M4lrhQK43kJ+otiTAW1zxQTnFMIJ2FPPFfmXe8SqkfgsWnkGRyj+xQwBJhvFpbiaNtkk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKoDGrTCN7IwrjBZrBn4/Mh+6fws9xD0KhkRIEppvoTzHVKoYIs
	urz6yImn26e3fs0We1XY5GiF6sAvw93WCK3IY9Aos8g2skGC/mScS4ILjsISR9aIBJs=
X-Gm-Gg: AYBFou1cqxg99sRqBtbC1+aNM9RO4o4hYCfZgkMUAymakEkICmN4tImwYtqG3uZfuH5
	XMUfUqUUFKbgHpwp+duhh1UhcnRx/yWsGPDkOqYgLx+to4UbDGAzfu06mMlFnM93JTA+WFI5+wG
	Dhtzy0o90nnOvWANZHsXcbmcQa7Mtmd5rREXIz2KmC7moaysR9/gp8nPLX5PeOvDofm9c3cOICu
	ptKI/EgKIj2MJjrIZVfRtlSyZEkoaqd/VdBZ0aEnTrPnTEcXujbwUJMpcWL1lxzNyIdjCG1boTp
	+JFROPsDQHVgxtiIhZ88tHsNQC05QBXO5Dfqz5qEjPcxYosAEA9z74Zry9uZWFU982yvbiz/1FX
	mCAsyFO0y9TXxA+utsMy/oK5Z8jiJKPxZlHTZyV4y8jVvxlANbGJW5En4qYn7FiM1oCUOzVpi2E
	dN1oX7yB7MoaZLYA0nq60JOfry5OZBft177+6DoUyg3pFu4SwVuTZNaIJC8vLRxJuJcwm8gQUI7
	yAx4r/XVXgOgE2VxbQlTlBdb+PiXiVtLbhyprbW1KxlN7zeubIvs0KkxgVkMUiKL8ZrXbTeuicf
	UGh589Onb1YL4OIO6iY2GrsCX1kedh8UMVbiCtRIVB+ix0E=
X-Received: by 2002:a05:7300:3b0c:b0:36a:238:1485 with SMTP id 5a478bee46e88-36a4244276cmr1870508eec.37.1793322319336;
        Thu, 29 Oct 2026 18:05:19 -0700 (PDT)
Received: from localhost ([2001:5a8:4296:4f00:50b8:8e86:d398:7911])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-36a42a77c0dsm2458500eec.26.2026.10.29.18.05.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 18:05:18 -0700 (PDT)
From: Alexander Goodkind <alex@goodkind.io>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Simon Horman <horms@kernel.org>,
	Alexander Goodkind <alex@goodkind.io>,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Tarick Bedeir <tarick@bedeir.com>
Subject: [PATCH net v2] net: ethernet: mediatek: preserve sibling PPE bindings
Date: Thu, 29 Oct 2026 18:05:17 -0700
Message-ID: <20261030010517.45639-1-alex@goodkind.io>
X-Mailer: git-send-email 2.54.0
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

__mtk_ppe_check_skb() clears entry->hash for flows bound to other
hardware slots in the same software hash bucket. mtk_flow_offload_stats()
then skips their hardware counter updates. L2 cleanup also frees sibling
subflows without invalidating their hardware rules.

Restrict both cleanup paths to entries assigned to the inspected slot.

Two UDP trials reproduced the counter failure on a GL-MT3000/MT7981
running unmodified OpenWrt 25.12.5 with Linux 6.12.94:

1. Start a UDP connection.
2. Add a control connection in a different hash bucket.
3. Add a connection in the first connection's hash bucket.

AI code review of the original patch identified the cleanup problem
in L2 subflows.

Full ARM64 builds with allmodconfig and allyesconfig passed before
and after the patch using GCC 14.2.0 and W=1, without new warnings.
The builds used CONFIG_WERROR=n because the unmodified ARM64 kernel
already emits warnings. Hardware testing has not run for this revision.

Fixes: c4f033d9e03e ("net: ethernet: mtk_eth_soc: rework hardware flow table management")
Fixes: 33fc42de3327 ("net: ethernet: mtk_eth_soc: support creating mac address based offload entries")
Link: https://github.com/openwrt/openwrt/pull/26107
Assisted-by: LLM
Signed-off-by: Alexander Goodkind <alex@goodkind.io>
---
Changes in v2:
- Apply the slot check to L2 subflow cleanup as well.
- Add the Fixes tag for L2 offload support.

V1: https://lore.kernel.org/netdev/20261023012529.5994-1-alex@goodkind.io/

Codex assisted with investigating the counters and preparing the patch.

 drivers/net/ethernet/mediatek/mtk_ppe.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_ppe.c b/drivers/net/ethernet/mediatek/mtk_ppe.c
--- a/drivers/net/ethernet/mediatek/mtk_ppe.c
+++ b/drivers/net/ethernet/mediatek/mtk_ppe.c
@@ -754,18 +754,17 @@ void __mtk_ppe_check_skb(struct mtk_ppe *ppe, struct sk_buff *skb, u16 hash)
 
 	hlist_for_each_entry_safe(entry, n, head, list) {
 		if (entry->type == MTK_FLOW_TYPE_L2_SUBFLOW) {
-			if (unlikely(FIELD_GET(MTK_FOE_IB1_STATE, hwe->ib1) ==
-				     MTK_FOE_STATE_BIND))
+			if (entry->hash != hash)
 				continue;
 
 			entry->hash = 0xffff;
 			__mtk_foe_entry_clear(ppe, entry);
 			continue;
 		}
 
 		if (found || !mtk_flow_entry_match(ppe->eth, entry, hwe)) {
-			if (entry->hash != 0xffff)
+			if (entry->hash == hash)
 				entry->hash = 0xffff;
 			continue;
 		}
 

base-commit: ffdf678dd16610e3f006dac904bd37c09684673c
