Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FCAE3803D9
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 00:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790816266; cv=none; b=C6K8fb+KKycB2k2L4Y3zS7IXSjYU9IpRqv+h4pL/YWEbAjkZYqNzIwusgRquWkNTs93rjPfs5pmrpsu91iH5MFZdWA2q05Q/d7crJiSFF8Aulgngh2gxGD4WoZOlu8z3Th9tjXfJAyQcmMCAxTNOBTIBgEEPQ8wSdAa9BVc8m5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790816266; c=relaxed/simple;
	bh=+hd5xdb7SzsuF9Mol88uhtNFE4upHXprVJKCgzBa9Ag=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=u6C6hmRnZKsD3kRjUwUyRYzR8D4JwCD8r3uf2E15/LErwzbn69F9DGFdsM03j/V5dhwuynnxRKa82B4hChIFjfRuhjkkZyNqg6P7yCZtGVGnMewMgywVk3BGJBnhc1niib5K6C0f0rAQ+aoSZRonzMGggQ16s4/+arQZ0RHDW7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--skhawaja.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LvRDfwuQ; arc=none smtp.client-ip=209.85.214.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--skhawaja.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LvRDfwuQ"
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cfa4e4684bso99749335ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 17:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790816264; x=1791421064; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YTQtDRZE6hbaSqiCeRYm1Tiy2pek4MhmDBkS+QhXVW0=;
        b=LvRDfwuQSCZDAnsfHak0P8NJaQ8ivuX/ckTBUrSjnWii2SLn/uk4lCohxZRxVaEhzQ
         UmjCW+fi0DyTnjKyyOutV4KGa9pVpsk8TJ5XT7l70d20x7bizOFp83d1C0Q4o9nrF07i
         Q/+C1WBrzvGTWtUgBz7LdNDdq0GYRg8LVB3j9+i2M+Wh8oeShHEXXQrAHZkBKnRpRiu5
         6IMbPPe2vK/VVLrSfc9PAQgEBFs9Ow3AKMgjY+CzgwPMUVVPnnNTOzNq4O+rSp6Z7lfl
         pabCSSWSKGDMtVCUz7eRN407RNQzHUO886U8ED60TCZpLMJARloiNBv93tAYTOH69pkY
         Uemg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790816264; x=1791421064;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YTQtDRZE6hbaSqiCeRYm1Tiy2pek4MhmDBkS+QhXVW0=;
        b=WMnz/357jpawuDpMyigBh9poVJGDZCfUg6/eHNVJh+MrdcmAyIyXmjqA9dO5TGyetj
         iOl1ORYCqbIaiQUrRbAovA2IOWfDJdSrS17MX6kLNMo8nsp4h3j/Y3Srg431+H++wHPT
         XcZ2hbI7RVNbHjV9BUZb3NjYnugjwkJ7G2Uh6f3KENkfxkLzjvQqo1V9EYpH+wCeL/PU
         U2PU/Bsq+2wZn+BT7uoGbdQ5kGGlCVqj0DtXcRwo0H0fhVwt47/lWmhXju5j2B/DEdnA
         eYk7aL5JlQEfjhw6nOHXQatm7suWxY2lXlouX77ekx6I4L6nKFa/x/C4ZCbG/NcG49Kb
         fyWg==
X-Forwarded-Encrypted: i=1; AKwUvBymFPwj9txeRPbJrVKPnv1U3S74wixc6EGNSl1kufUpKMJvXnP0ZRQBxfv4JYSHoIL2zGGBZFzT7jwBs6s=@vger.kernel.org
X-Gm-Message-State: AFq9FYKEM1bOSorkeVavBXBdbsQQlM8Z46+6R1PUU9K58wr5Jg7rgs6E
	v3wNJ+cSU30SHgjCq3MvAaluhxFkxr31fYMngpBdeeEIvb0wKiUhrEfloMZdVRM8DKuG13UGMxn
	64s/UjjuYKV6eHQ==
X-Received: from plsm24.prod.google.com ([2002:a17:902:bb98:b0:2e2:dfc9:4865])
 (user=skhawaja job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:3bcc:b0:2e3:110:b71a with SMTP id d9443c01a7336-2e30110bc9cmr8262235ad.0.1790816264188;
 Wed, 30 Sep 2026 17:57:44 -0700 (PDT)
Date: Thu,  1 Oct 2026 00:57:32 +0000
In-Reply-To: <20261001005734.1033516-1-skhawaja@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261001005734.1033516-1-skhawaja@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261001005734.1033516-5-skhawaja@google.com>
Subject: [RFC PATCH 4/6] vfio/pci: Set live update file handler level
From: Samiullah Khawaja <skhawaja@google.com>
To: Pasha Tatashin <pasha.tatashin@soleen.com>, Mike Rapoport <rppt@kernel.org>, 
	Pratyush Yadav <pratyush@kernel.org>, Alexander Graf <graf@amazon.com>
Cc: Samiullah Khawaja <skhawaja@google.com>, David Matlack <dmatlack@google.com>, tarunsahu@google.com, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:KEXEC HANDOVER (KHO)" <kexec@lists.infradead.org>, 
	"open list:KEXEC HANDOVER (KHO)" <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"

Set live update file handler to LIVEUPDATE_LEVEL_DEVICE.

Signed-off-by: Samiullah Khawaja <skhawaja@google.com>
---
 drivers/vfio/pci/vfio_pci_liveupdate.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/vfio/pci/vfio_pci_liveupdate.c b/drivers/vfio/pci/vfio_pci_liveupdate.c
index fb2141ee8942..4b8a350b867a 100644
--- a/drivers/vfio/pci/vfio_pci_liveupdate.c
+++ b/drivers/vfio/pci/vfio_pci_liveupdate.c
@@ -335,6 +335,7 @@ static const struct liveupdate_file_ops vfio_pci_liveupdate_file_ops = {
 static struct liveupdate_file_handler vfio_pci_liveupdate_fh = {
 	.ops = &vfio_pci_liveupdate_file_ops,
 	.compatible = VFIO_PCI_LUO_FH_COMPATIBLE,
+	.level = LIVEUPDATE_LEVEL_DEVICE,
 };
 
 int __init vfio_pci_liveupdate_init(void)
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

