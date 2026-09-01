Received: from mail-yw1-f225.google.com (mail-yw1-f225.google.com [209.85.128.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC314A2628
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 19:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788290312; cv=none; b=ValDcMUyAZym1JDaMejDo2f3Fr6yOJOyehxt/e/4HwNCxcwiT/xjYVTq/W/PzaotuRAfjudviQvVtNl4reW1rfYLZt4QasP8jEtHIqL/+xykk7SI4iw74RQudcpYWtTI8SdPfI+DYavZqnY2Hsg4KzwC3HP0gnfKh5KKBZfVr9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788290312; c=relaxed/simple;
	bh=cT8ZEKHAT8Xn1sHTU5bkljeWfxPtFrQE4WQVZMOBlIw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DECCFaJfFhfsINVVpBAx7WHwPyaZiD63qjrrSX6rcYloSSvZMo0cJmmDF0908elWeVG0jJFscxlHqfqY8P03ccNeG4jkAOF7jNgcbEmExKQwHCxoh2HSuA6d8Hv05R4tVCdHrRwqFT5Dwu1Vpg5hrI+59nAIpRZrPR0JaHvWDqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Cgjr5YKA; arc=none smtp.client-ip=209.85.128.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Cgjr5YKA"
Received: by mail-yw1-f225.google.com with SMTP id 00721157ae682-85a50f6a7f7so4870927b3.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 12:18:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788290309; x=1788895109;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VqNDSMrUN5Hnu4Er0j5df3BDuTddzqevbT40udGtjGk=;
        b=pEVvTdDw5wiYtWSw5SZyofpcmI0iFxv6s5AfCIB0VQsIoQ8bZm0XBa6R0VoRvDq9/N
         CP3LO3QxGhxefsNBsUWSd7fuJEh6niIOUvVpGtc4RSY/I72DfRqyEZBVWXoRU1e5z8iD
         rtvvuMxmKLkZqyYMRb8Jn3cRyBCU6inzD3++kzVlUP2I63A1cYdnYIq23v5EqNQB9jpo
         qAoJ9BY4MtefhrHPiy/jnHzBxVT+rphIZZyq4cd9hLF7lQJdR7LF9ZGpJSPc9+Mt2GmH
         Ew12WhL0sLLPZPcNSUsKIfovR9Fh/2ZbqGk53onThPxDGUBBXOMknXO4b2ON1IeBdD+F
         FO2Q==
X-Forwarded-Encrypted: i=1; AKwUvByOMno1wrnPYGbHfiE2opa/7PzrdoTTl5hRoyakKSCBFtRQ25VKF83/0x4k9fN/UcQgR5tLCAdLfpXq2fY=@vger.kernel.org
X-Gm-Message-State: AFuF++lnP1xrsegHzUslAKq/AnL1PIvEL0wPyfaxvqKTKeoSShmACvp8
	GEG25fEH8z/CGnP0ntbJh/cNDJolxfo/XmtJOkuDj7clvK4WbVR5Olon6bJpGv60zhh0Ubgpd3n
	LLaXYEhCSYFoGkEgXQV3gFk+pCtwg2nM1MGrwA3xYOBHv2YI7Zb/SnG8D7Esy0iC0ghSnDIDitd
	GTxT1gNNtnAFLaIWPq8iRxNU8fM0wMBSKt9co0kB06/Jcoie3T6MnkUk8hO+s7Nd40N2fp5kJIn
	ziAHHY8xfcv3/5ECAbinwbk2A==
X-Gm-Gg: AYBFou2AsW4qIYouR+qMxlHdLOWRAhtr7hZ/JmFJgM2SUI0DDNrEAAWDCEdNpH4bO1V
	CnQAuQlJBfmdr87gMYeadpCwyuGZFn2/iq3QvTD2C9OuvDmAN1s6nA8sQO6zm1PIBtlULYuGtFJ
	V8ELdMSht3X8TYbc7vxfeVzaAQ3NswMwIPgFzjZDkfcmhOoXy3kgkB7gH1exEcVPJJYwKP+TniZ
	UwhB0Im7BzDLwteZHTjIydLvqI50HBOEqXWf7Tvm1UVf9O3bvQH46LzD9Q0SwqF5TN6j2duNjQM
	XUnD4i8sFuiutxoIh22Fa4YzJyODysYZFRb7QNUHP+J3WsnWHE/NVMNO7Ou/FrBrHs6LeYT7bfv
	HSSffNNoaHNCojMqEX040Q6XM3AbCqmffIQQs63jZ7CqjoqemZ4uCYZXqrnFbutOwdTxd7wPOqU
	OX+owS/e0r45+vU1ajoiQIjYRoAO7gthugS8yhu4n1Dg==
X-Received: by 2002:a05:690e:160a:b0:66f:8a11:5dc0 with SMTP id 956f58d0204a3-66f98846c1bmr158768d50.29.1788290308505;
        Tue, 01 Sep 2026 12:18:28 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-23.dlp.protect.broadcom.com. [144.49.247.23])
        by smtp-relay.gmail.com with ESMTPS id 956f58d0204a3-66f98592b85sm6958d50.11.2026.09.01.12.18.28
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 01 Sep 2026 12:18:28 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-398e1f7d1a5so324629a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 12:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1788290307; x=1788895107; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VqNDSMrUN5Hnu4Er0j5df3BDuTddzqevbT40udGtjGk=;
        b=Cgjr5YKADieRgLJmSP1cYZrxOdBM+ODVUUcCzmjLaGMD6QrMKrSunfl+uj5nDblxLW
         aSQ8DltKqHi5ZtDolZG1lc6siKaPLIxQB/ZEuk0PH6CZ0lv/XGyAWE5J/ZzelDKhsq2z
         RKMqtu/iCal8BGFBHdTNpB8k5KojDCp291n9E=
X-Forwarded-Encrypted: i=1; AKwUvBw5HNow/B+Cduzq8GAUg+1YJNZPm4tbCZVOns7mxFpbP2jIu2h8RqdWWKDe4ZBm7sBkqJgDkRP0/Sfrvpw=@vger.kernel.org
X-Received: by 2002:a17:90a:d2c7:b0:37d:f983:7b5 with SMTP id 98e67ed59e1d1-39ae82bbdc5mr475257a91.9.1788290307071;
        Tue, 01 Sep 2026 12:18:27 -0700 (PDT)
X-Received: by 2002:a17:90a:d2c7:b0:37d:f983:7b5 with SMTP id 98e67ed59e1d1-39ae82bbdc5mr475159a91.9.1788290306517;
        Tue, 01 Sep 2026 12:18:26 -0700 (PDT)
Received: from localhost.localdomain ([192.19.203.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32f07b79cf9sm186440eec.18.2026.09.01.12.18.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 12:18:25 -0700 (PDT)
From: Bhargava Marreddy <bhargava.marreddy@broadcom.com>
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com,
	vsrama-krishna.nemani@broadcom.com,
	vikas.gupta@broadcom.com,
	Bhargava Marreddy <bhargava.marreddy@broadcom.com>,
	Rajashekar Hudumula <rajashekar.hudumula@broadcom.com>,
	Dharmender Garg <dharmender.garg@broadcom.com>
Subject: [PATCH net-next 4/7] bnge: Drop obsolete bn->bnapi NULL checks in open/close paths
Date: Wed,  2 Sep 2026 00:47:25 +0530
Message-ID: <20260901191728.643212-5-bhargava.marreddy@broadcom.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260901191728.643212-1-bhargava.marreddy@broadcom.com>
References: <20260901191728.643212-1-bhargava.marreddy@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Since bn->bnapi is now allocated during probe in bnge_netdev_alloc() and
freed in bnge_netdev_free(), it remains non-NULL for the lifetime of the
open/close path helpers.

Remove the dead "if (!bn->bnapi)" guards in bnge_free_ring_stats(),
bnge_clear_bnapi_queues(), bnge_disable_int(), and bnge_hwrm_ring_free().

Signed-off-by: Bhargava Marreddy <bhargava.marreddy@broadcom.com>
Reviewed-by: Rajashekar Hudumula <rajashekar.hudumula@broadcom.com>
Reviewed-by: Dharmender Garg <dharmender.garg@broadcom.com>
---
 drivers/net/ethernet/broadcom/bnge/bnge_netdev.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
index dcf04d391570..dc3d51f31e5e 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
@@ -85,9 +85,6 @@ static void bnge_free_ring_stats(struct bnge_net *bn)
 	struct bnge_dev *bd = bn->bd;
 	int i;
 
-	if (!bn->bnapi)
-		return;
-
 	for (i = 0; i < bd->nq_nr_rings; i++) {
 		struct bnge_napi *bnapi = bn->bnapi[i];
 		struct bnge_nq_ring_info *nqr = &bnapi->nq_ring;
@@ -1240,9 +1237,6 @@ static void bnge_clear_bnapi_queues(struct bnge_net *bn)
 	struct bnge_dev *bd = bn->bd;
 	int i;
 
-	if (!bn->bnapi)
-		return;
-
 	for (i = 0; i < bd->nq_nr_rings; i++) {
 		struct bnge_napi *bnapi = bn->bnapi[i];
 		int j;
@@ -2371,9 +2365,6 @@ static void bnge_disable_int(struct bnge_net *bn)
 	struct bnge_dev *bd = bn->bd;
 	int i;
 
-	if (!bn->bnapi)
-		return;
-
 	for (i = 0; i < bd->nq_nr_rings; i++) {
 		struct bnge_napi *bnapi = bn->bnapi[i];
 		struct bnge_nq_ring_info *nqr;
@@ -2565,9 +2556,6 @@ static void bnge_hwrm_ring_free(struct bnge_net *bn, bool close_path)
 	struct bnge_dev *bd = bn->bd;
 	int i;
 
-	if (!bn->bnapi)
-		return;
-
 	for (i = 0; i < bd->tx_nr_rings; i++)
 		bnge_hwrm_tx_ring_free(bn, &bn->tx_ring[i], close_path);
 
-- 
2.47.3

