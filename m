Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792692034;
	b=lzbdib4yNijTp/ptn8ibwU+/uvK/x+wHAHsyf25y/gUArBtQ4kXkuj5NjI4ZCAxokkAo
	 XCv7k5v/NR73HMbDUhY8QfH+Sm4RUss+h1ux82/1ZuUAzVmlLRjfeKKEJpdunQwyVmC+9
	 7Ys+YW5DzDymqvMvB6QYt3A8PpkLOEtlfNlC7F+zwsyrq+F8Okt/JvEtg57EPzAt8/5g3
	 FyevysUXo6yTVaicYQZ9ZNZTBkuGaqO+cpKz2NfW/HLx1ZN7GeVK3O06cLmTPioeVIg5f
	 DMxeMvF+EnJJCgkEaSEvdieZt6iXgVpGC3ba9S7Qc3b12yry1VtwBUsJtdnmNngkIuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792692034;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=qVs0gHMpL7OkRuO249jNop/fDefJUtpskmuuYXxUmmM=;
	b=Eiyv//TvadKb5km5SlkhPst9hqEuYkzFxd5gEaHT/L+fKXwoFbx+6Rqj++vcL8YGhYye
	 RvLibhrsf2ELccns+BoEwWI6wlqyvS7HP18AHoYxXDPMzLmvprI6DtMOZ8TGJaAaO8jYi
	 pQtwct2fEswVlJBvGHlmGAzzH92u1TtBfCUs9QZBn5gjMZoDdTM0JdLGeHp1Hh1KXiMx9
	 icjD9+f3tAuIwOMSToE8Sm0AHmBZ3KEdgum1wHdt07ZQ7c8/+1/M+TC1qakIBlfroQ/zw
	 LZdYQLLxlKrr0zCF+ToODTK7QhEFrUe/PN3rMy1sj7nv1HkuobSl18Pq98gq2sM55Fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=aCBHNZ1z;
	arc=none smtp.remote-ip=209.85.214.228
Received: from mail-pl1-f228.google.com (mail-pl1-f228.google.com [209.85.214.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65A3606A31F
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 18:00:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C65A3606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=aCBHNZ1z
Received: by mail-pl1-f228.google.com with SMTP id d9443c01a7336-2dd76b1361dso97005ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 11:00:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792692033; x=1793296833;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qVs0gHMpL7OkRuO249jNop/fDefJUtpskmuuYXxUmmM=;
        b=O0xug4gpc0FNTSUP3SjnxtJALdYCEA6ytEXRA3iy+RrIiaq/3kYS2lnlCa4gi6zAtc
         lJdOKlDTEOol0tDkCdMduLImlHsV0DGI1D4JnjYrfaWWtSgZQqWyhzbFizIBdg0nIlHX
         vP6vWMY6HayivMmWu3YjCbdySaoeZR73tueO6Pmc41dF02wzTe5UibuCNJVL2Y6RnmEB
         zwNKp/+Wmfx+dG9N8wQW0Pl5RhkVgOg3I/n5meruGYBz/bzenFzUY3GDgKh7rBmp9bhM
         oMEvvmio0Z4p0bn19y9zb3fjsnjhg7fFBLPS1HDT8mjtcsPYiaYD6zVAQXRXISB9hWzX
         fHug==
X-Gm-Message-State: AFq9FYLt5Ojurb4cp4q8NxjQTTzjNcdM2mTCWYD9xS41Hwv7OiHy47yI
	YH+/wXOlucvgY0dnWt+yOIY7jJ5WYiKF5vqs8Tzz/P3JaTFO4xy1rFL7OLxT2XoaBxlrWQmnazT
	BIAT9ii5VVFAQg6FmadLGxgX51NoDoHYtrS83tC++sVOz7tpnceS9kAIzy1WTlKu2mER6OxN4ng
	WslTHikFYl/5Zx0OBAtTxnGLd27C8UlejzZK01rPatc/ymVyaXKBrxaEDHKNxOLCkfU4QFiWyrE
	RSxW/B3X5eL5s/4bHV7hiR8
X-Gm-Gg: AYBFou1UK+q7NX5oWNDoyhNRVLh8/o74J/mEpwmVtBKZyQDnRg0srwmOKbZhaKs8Fxt
	JeiN9K7cYPJt/fwvkonIUzktZ4d0rXTFa6LXF7CEzHiWxjP0I7ABvLxgDd/xsHJECW9vvVys70M
	TbWQ30vmGc1figeREa7o0qLTsEnNLFA140rZRSQPG3TAysyOFOYUOtQ+do6GVzj57bmLoz0P1Ld
	yp1WZNGd8hjN2/h4DBr2+ZMutVgjqQrciim4IkJMF+v/tI1oD7rPf9tXTTXy2OE6YScDMsjxIBO
	YHxmzOGiXFxvytYfcd3CmKe/m31azHhB+q0XUOT4valnjFh4nFnHkbScDl26KayOnrRA1UI9b8i
	kaEkhkWdnPDcBme+ESAXjjIpcIUJJJx9jn2i0WQc4+QCs/pUBBbXGn3k+bC/pElzkR8GsE8UGPw
	P8OXooOMdnAzPVG71i+ftEPgETojGCxQA/n55edmJaOHQ=
X-Received: by 2002:a17:903:2446:b0:2ea:1b9b:b938 with SMTP id d9443c01a7336-2ea7cf4b72emr184945ad.55.1792692032933;
        Thu, 22 Oct 2026 11:00:32 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2ea7b52ec0dsm48825ad.53.2026.10.22.11.00.32
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 22 Oct 2026 11:00:32 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-8a88d53c7a6so2003447b3.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 11:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1792692031; x=1793296831; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qVs0gHMpL7OkRuO249jNop/fDefJUtpskmuuYXxUmmM=;
        b=aCBHNZ1zQwzFXz03A8JO9R1IyFq8Yaqo+dbxxxTSeXSBkUK6Zy/NIIwctdFHp/sg6Z
         ce9G1SCcfcQIlFE01rOZHTkLQg0cWZf2kg138KR701DGpqMa1a5BchjH0PLEJ7QD9B59
         vvf/xAY/4ySe/JRQvQcvlW8zmtqEyRtKo1bWA=
X-Received: by 2002:a05:690c:2604:b0:8b0:dca9:8fc8 with SMTP id 00721157ae682-8b134089d4cmr31280017b3.92.1792692030697;
        Thu, 22 Oct 2026 11:00:30 -0700 (PDT)
X-Received: by 2002:a05:690c:2604:b0:8b0:dca9:8fc8 with SMTP id 00721157ae682-8b134089d4cmr31279647b3.92.1792692029727;
        Thu, 22 Oct 2026 11:00:29 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b156107beesm1968187b3.16.2026.10.22.11.00.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 11:00:28 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-kernel@vger.kernel.org
Cc: thomas.petazzoni@bootlin.com,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Padmanabhan Rajanbabu <p.rajanbabu@samsung.com>,
	Niklas Cassel <cassel@kernel.org>,
	Aman Gupta <aman1.gupta@samsung.com>,
	linux-pci@vger.kernel.org (open list:PCI ENDPOINT SUBSYSTEM),
	linux-kselftest@vger.kernel.org (open list:KERNEL SELFTEST FRAMEWORK)
Subject: [PATCH] selftests: pci_endpoint: Do not link with pthread
Date: Thu, 22 Oct 2026 11:00:21 -0700
Message-ID: <20261022180022.1282641-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

This tool does not make use of POSIX threads there is no need to link
with libpthread as a result.

Fixes: 392188bb0f6e ("selftests: pci_endpoint: Migrate to Kselftest framework")
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 tools/testing/selftests/pci_endpoint/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/pci_endpoint/Makefile b/tools/testing/selftests/pci_endpoint/Makefile
index bf21ebf20b4a..b4ddfc52e79d 100644
--- a/tools/testing/selftests/pci_endpoint/Makefile
+++ b/tools/testing/selftests/pci_endpoint/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 CFLAGS += -O2 -Wl,-no-as-needed -Wall $(KHDR_INCLUDES)
-LDFLAGS += -lrt -lpthread -lm
+LDFLAGS += -lrt -lm
 
 TEST_GEN_PROGS = pci_endpoint_test
 
-- 
2.53.0

