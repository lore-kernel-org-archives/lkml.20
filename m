Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A99470121
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789387898; cv=none; b=jqG9UtM9VtDtyqlDNfTssU+aN4z6cc6fAGzcUruchNvF0b4adBussyCtZm1zAP8V6KNH3/s3jlRMZO01sXmqhHQ6Y7Fj7CKLEkqBQDy3gKRHeDLxrI4j3Qi6/P/Q64atNQ0eor88jOG7/GKDHEBBhE6rED+pC7nxhE0PspDBPZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789387898; c=relaxed/simple;
	bh=1PVRB8TUPBWVirpsxM6OHF6ZhUdGDDcHgqxr8lIBT7w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=JzLNP2028FuKS95wU4ujXBHpKDiZYn0wWdilNUbwMmC6sb6YL2Yrw7wLAlGdj6SF1g9xyc9Qp/jCN3v+MNIfO+v9XhiIX6gzDqCnuvxAue/FJ8tjtdQ0uavzI/c1quxwiQm9BbRGkl/mwQaOy4a75d8M6pEbUO52ZwE59tr0PiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qa0RpX5J; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qa0RpX5J"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-85469e25400so1429205b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 05:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789387896; x=1789992696; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rnqfF0881hUPYee8XIZkVKnPceoCWZ6t05x/WRkGDd0=;
        b=qa0RpX5Jhsle7cdsloIQS03TfZWNLy/wl3lMCLurL+HV4Bs2KyxBhnk2m7P71fzSlT
         gslGOZwkcs7jwM1CSmJ5R+VAJSK/yRPtHFwBqPBn6gBXOaLAYQTaK218lLqhHZ7Jn025
         7Ajx4iZDcD4nrO3u/CdvvV9gCN/SOubD6bsNuu5lmJgkku7rHVjf1s/oV0HoTfmjB2Cy
         qgj37sh7x4w6PWkB8DFYhCAnC29jElfFyvLzotgmm+485ttYLJ1W5FLX5jga06fEQosX
         QVavoEHlFpDm3UMxq5aerMNs/OUbQF76UgKVxMZ6ea1ssUfbxjSpeNlsIXzolAQdWgRM
         lHyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789387896; x=1789992696;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rnqfF0881hUPYee8XIZkVKnPceoCWZ6t05x/WRkGDd0=;
        b=WcsXg581Vua0Td+QqntqNF82C8iFAI8YFxC0LRQUJ2E9hPbehoGxXGR+JON9EyDIEC
         GJJ0yHKhLq9GsNxvZQsVDp15wZgJ4no4mQFAzru1ZrQhyVmVUC9Q/bEIZcWXWerbi+Mt
         VQJOtd0yy1y6UqsULvxyfZPqoVBFPk0WuMyb2ErXqeXPeTWnSA3ntxoRsChZJ5cvtxhE
         g3WDB2gin+9/Wal1AaZAqYhXAtvZAtbtKcB9cPjmWl8XYkkAmVXmPaYDDeTQ8VlGc3Fe
         XqB640HAbADDcWX9RDyhoPiHVP1anAFQ7URf/KQniqTSCX6XR+hdWJlV7/Ba6JdUKFOE
         VY3g==
X-Forwarded-Encrypted: i=1; AKwUvBz/SN9rJB2Rs3BHuVkvAIXu+jXSj7vWjADNU5NL5K38kJn/QEjaDB9KY6tgymiOvgRmI/A78EVd9BWKI3Y=@vger.kernel.org
X-Gm-Message-State: AFuF++kqh15X5URcNeSHORYgavQgq6UpSFYyBCnZDsicYWdhbaOaokM0
	3lASfcVYwP/Ct5N1KxMdiaHjpZkoaHloEQY2BnuMCCM5yOUH39es4B4d
X-Gm-Gg: AYBFou2jRE6GOcnZii9n8r11CKc34ugUPdtNR7PXa9DrNCwZ9hTJiUCqOVh3tWo/eaE
	/HCWRCBglLw7mSVxNxZwrgbdjero+6GPx/3Vn5wqptrrMrLqC2HdCoc4X83Z0kEk8oTTff/VVYO
	2jQAAC9vpwxsFbViV4gx/h19L/Zb1zCz0yHOG6S1fDjpAWpqBKW9kJXWPHjj53lS19BHaFywcJq
	hS4FKzpx892jf+2uXvFhHl2aTyNu3V/kNmb0U4LeURRrxFgsf8jrBxrxovYs8qi+yMftWFs/O7R
	0RR4hEVy/UzQcAsG19eWS/oq8HS7hMjU/PWgWFzFz7aPfFZ0zFZnoexh5EFdaG1XwLf1VijsR3v
	sfcH7N3+97HZVDCY6+UVYxP4YwCfODkZeHcl3eP80UeRWaYLRUso32g6VbIOc1xR0xDb7/GUgi9
	n3HObzMg4skCLS5HawnHgFz0fmkDFnup4CpzALX93G3Msrc/7NaQX5yNHfq9jEcrASJ67NOpVll
	Z1Mk3i7jnQOMucW
X-Received: by 2002:a05:6a00:368b:b0:84e:e741:174f with SMTP id d2e1a72fcca58-86f83e3afdbmr5040971b3a.7.1789387895990;
        Mon, 14 Sep 2026 05:11:35 -0700 (PDT)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b2a7c7395sm4430398b3a.61.2026.09.14.05.11.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:11:35 -0700 (PDT)
From: Cong Nguyen <congnt264@gmail.com>
To: David Heidelberg <david@ixit.cz>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	oe-linux-nfc@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] nfc: llcp: fix sdreq TLV list leak on parse/alloc/send failure
Date: Mon, 14 Sep 2026 19:11:29 +0700
Message-Id: <20260914121129.2098606-1-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

nfc_genl_llc_sdreq() builds a list of TLV nodes while walking nested
netlink attrs, but 3 error paths (nested-attr parse failure, TLV alloc
ENOMEM, nfc_llcp_send_snl_sdreq() failure) all skip freeing what was
already queued.

Route them through a new free_list label, mirroring the SDRES path in
the same file which already does this. Harmless on the success path
too -- send_snl_sdreq() drains the list as it moves nodes, so it's
already empty by the time free_list runs.

Fixes: d9b8d8e19b07 ("NFC: llcp: Service Name Lookup netlink interface")
Assisted-by: Claude:claude-opus-4
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 net/nfc/netlink.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/net/nfc/netlink.c b/net/nfc/netlink.c
index 0c58824cb150..224bdfa2dd0d 100644
--- a/net/nfc/netlink.c
+++ b/net/nfc/netlink.c
@@ -1181,7 +1181,7 @@ static int nfc_genl_llc_sdreq(struct sk_buff *skb, struct genl_info *info)
 
 		if (rc != 0) {
 			rc = -EINVAL;
-			goto put_local;
+			goto free_list;
 		}
 
 		if (!sdp_attrs[NFC_SDP_ATTR_URI])
@@ -1200,7 +1200,7 @@ static int nfc_genl_llc_sdreq(struct sk_buff *skb, struct genl_info *info)
 		sdreq = nfc_llcp_build_sdreq_tlv(tid, uri, uri_len);
 		if (sdreq == NULL) {
 			rc = -ENOMEM;
-			goto put_local;
+			goto free_list;
 		}
 
 		tlvs_len += sdreq->tlv_len;
@@ -1215,6 +1215,9 @@ static int nfc_genl_llc_sdreq(struct sk_buff *skb, struct genl_info *info)
 
 	rc = nfc_llcp_send_snl_sdreq(local, &sdreq_list, tlvs_len);
 
+free_list:
+	nfc_llcp_free_sdp_tlv_list(&sdreq_list);
+
 put_local:
 	nfc_llcp_local_put(local);
 
-- 
2.25.1

