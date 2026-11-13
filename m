Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794530151;
	b=xD4tcuAcxXthn5O9exRdWv4oe7d4Wu0Trrdvd3RSHQTapqjIzticvI8tD1mNEdcMBLNl
	 op1PVoLzpl/FmFhVZy0jbEUy7+GIMVn/9hxJpkykRES8mW258lMApHc2kPbLd3zK9UI4q
	 IY9m5pwD6A/LXAZEHiOv9TFgapHMmGpu/bInd3JxOUBBRWE8ypY4NXwCJe4PG7GBX1fkD
	 5SjOql4FLNyM+a2dLA38Ma3YYBBtQjT72cvc09ZCDBBbSR89Clwk4lEVPugxTqZQt06uG
	 Fjy/0QXYdi8Lsu7+PJjF7PsVrK4rrYgOaTKAnVPIZsJfOntGgYglfLcPlwAvpiOxLlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794530151;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=+/1cY6ZrJCVA1E38up//QamWrEv2l6bHlMUbtQACcqk=;
	b=5P9RdocgEhzefzJ2r/xrCBVORkGZOnxA5X1cpMDRPyfR4m+DPx7MdtybqTpMY4WHUEya
	 EmwiPpiDrwH8EMNBUVkGEG7Dy27CGgCLmR3ZScpwwVO8Zf3+jnKC2Kgs1C//bm5M6bKai
	 xI5AV984Gv/fbpHGomCeoK2dVomgO2VfH/Zp+FG7vF3P7SxFw7ObWeHwW268vMSL28Vuw
	 hnNgMA/++H3DKYihG5DrRILRWpG+Ou76GLXWxgsK/+3p/JgHqfcWAwAMpiuKYgJJFOlS0
	 TxD2D6ssDGdhZpdeZe8HbT+7PrEpSYt4w2hfbX93WCCvQEOHOi9kzVGzyNEtzQ2Y2/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--sarthakkukreti.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=R+PEhPOl;
	arc=none smtp.remote-ip=209.85.214.198
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 523E76070098
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:35:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 523E76070098
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sarthakkukreti.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=R+PEhPOl
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e8dd9b9743so5434265ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:35:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794530150; x=1795134950; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+/1cY6ZrJCVA1E38up//QamWrEv2l6bHlMUbtQACcqk=;
        b=R+PEhPOl675YIyMf6fGRwXb6xqHN7XybtWwHnsvqN+ucBJzHkIcMIIlZ5aDzigTili
         xn8RjbZGkkviyvOBY0LLeW8Iphd3zVJx0PqDx+tbunrRFktAodjqwOJe/up/UGnjcuAj
         Ct2PxiE7K9hC3DGrzok9Vhp5VS/OOo4deRMbbNB14WSkgB4F9VZwmQ4WvBZPrI5PPl63
         E6zV2MIaS58XwRLukETOiROb1VSRMvDUjyOqooWKRrqwBfopfPmULdEvNDBeIxJmNFE9
         M5K1vbeY5g4Z5Ha8/w+P2d+TgccIFQ6ShBOfv2nsWe65iLcQvBUqyyat13sT5kMEuO9C
         KB1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794530150; x=1795134950;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+/1cY6ZrJCVA1E38up//QamWrEv2l6bHlMUbtQACcqk=;
        b=Coi269Mz+CyQojaNXN+G3wwti4GwV2/vdLr2BppFuE/9lSyJAqdrobVGMyGTuYdr/+
         D68CCK7T6/NUoh6bKCrAZI6Mt2vMt9NKnrJSv/luhyULOLc7uTcsDnIXZR84V+zHM0Mx
         LtHKs616Pd10W8FpZtIPkhBrpqfK3eM8rHnpX9FKEekKRVKmkx+6eBVU9BvDbD8PsG/a
         Gt+fCjZMG7Ay462uuH/XGTOMfF3Y3AVsrstaC8P6+cWn+Gut9ftdRWgmZfZ+OLK+eAc+
         M0dHEM0ojbnmsu/nNQaf8SO3y0RuU7WWMrQaYAXpQ8h/y0bVDqdJ63CbDJhjn9KriFZ8
         Xdaw==
X-Forwarded-Encrypted: i=1; AL+hErHpXOsWENke5fqnZ1vFxjLVUwAr4l+EGz+bO+K9K/nWT8JmhTs02EzOMvqcA9sXRuEeSbF22iG9QfE+kM4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9o+BeIoTBJmF5WC3bFj95i6A7ye0dY4JzrYwSBg09H0ptNPFYF
	oIpDtGqnYBRiCVPqJpf7kDTGzqn8vk/Bp2U7s1wvNpci6mHd2oPwBgradeuA1M0CyYMZ6CPjCO5
	g/ycl+ZWPpgZV31E1u/fe1p8HehLR0xcDQLskgQ==
X-Received: from plmm12.prod.google.com ([2002:a17:902:c44c:b0:2ea:e1c7:d3a1])
 (user=sarthakkukreti job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:e5c7:b0:2e8:4066:d247 with SMTP id d9443c01a7336-2ee0dad1fc1mr9431415ad.33.1794530150245;
 Thu, 12 Nov 2026 16:35:50 -0800 (PST)
Date: Thu, 12 Nov 2026 16:35:36 -0800
In-Reply-To: <20261113003536.3622755-1-sarthakkukreti@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261113003536.3622755-1-sarthakkukreti@google.com>
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261113003536.3622755-4-sarthakkukreti@google.com>
Subject: [PATCH 3/3] scsi: core: do not retry passthrough requests on
 disconnected targets
From: Sarthak Kukreti <sarthakkukreti@google.com>
To: Oliver Neukum <oneukum@suse.com>, Alan Stern <stern@rowland.harvard.edu>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, 
	"Martin K . Petersen" <mkp@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Sarthak Kukreti <sarthakkukreti@google.com>
Content-Type: text/plain; charset="UTF-8"

Unlike scsi_decide_disposition(), scsi_check_passthrough() matches
SCMD_FAILURE_RESULT_ANY before checking the host byte and returns
-EAGAIN on DID_NO_CONNECT, DID_BAD_TARGET, and DID_TRANSPORT_FAILFAST.
Callers using SCMD_FAILURE_RESULT_ANY (such as sd_sync_cache())
therefore retry passthrough commands against disconnected targets.

Return 0 from scsi_check_passthrough() when the host byte is
DID_NO_CONNECT, DID_BAD_TARGET, or DID_TRANSPORT_FAILFAST, and update
scsi_lib_test_any_failure().

Signed-off-by: Sarthak Kukreti <sarthakkukreti@google.com>
---
 drivers/scsi/scsi_lib.c      | 5 +++++
 drivers/scsi/scsi_lib_test.c | 9 ++++++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/scsi/scsi_lib.c b/drivers/scsi/scsi_lib.c
index af27fd3df8d4..fa16a75e810c 100644
--- a/drivers/scsi/scsi_lib.c
+++ b/drivers/scsi/scsi_lib.c
@@ -219,6 +219,11 @@ static int scsi_check_passthrough(struct scsi_cmnd *scmd,
 	if (!scmd->result)
 		return 0;
 
+	if (host_byte(scmd->result) == DID_NO_CONNECT ||
+	    host_byte(scmd->result) == DID_BAD_TARGET ||
+	    host_byte(scmd->result) == DID_TRANSPORT_FAILFAST)
+		return 0;
+
 	if (!failures)
 		return 0;
 
diff --git a/drivers/scsi/scsi_lib_test.c b/drivers/scsi/scsi_lib_test.c
index ae8af0e0047a..aafafe676098 100644
--- a/drivers/scsi/scsi_lib_test.c
+++ b/drivers/scsi/scsi_lib_test.c
@@ -184,8 +184,15 @@ static void scsi_lib_test_any_failure(struct kunit *test)
 
 	/* Match SCMD_FAILURE_RESULT_ANY */
 	failures.failure_definitions = any_failure_defs;
-	sc.result = DID_TRANSPORT_FAILFAST << 16;
+	sc.result = DID_ERROR << 16;
 	KUNIT_EXPECT_EQ(test, -EAGAIN, scsi_check_passthrough(&sc, &failures));
+
+	sc.result = DID_NO_CONNECT << 16;
+	KUNIT_EXPECT_EQ(test, 0, scsi_check_passthrough(&sc, &failures));
+	sc.result = DID_BAD_TARGET << 16;
+	KUNIT_EXPECT_EQ(test, 0, scsi_check_passthrough(&sc, &failures));
+	sc.result = DID_TRANSPORT_FAILFAST << 16;
+	KUNIT_EXPECT_EQ(test, 0, scsi_check_passthrough(&sc, &failures));
 }
 
 static void scsi_lib_test_any_status(struct kunit *test)
-- 
2.56.0.611.g1030f0b940-goog

