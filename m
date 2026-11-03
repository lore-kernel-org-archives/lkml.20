Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793723468;
	b=O0AYc3u0NOWp7CiFk20zlrNhv2n41Dfu8VKIBNAoHhQnctqGxuQ3y8/IVjO/ol+4ESmc
	 ol5OVtZR8kSoK01Z/ArFcvGUGQqVHJik4mL0oV13ViRX5k7l7uoZpQ5dDnzuF9LbC1DXs
	 xGQe3GlUJPR0+iiaWjTOcIVDNlvzsjPCMcLwji8/DnB5Es2ryJV5KoAO6a4o9hMmUdSFK
	 Ijv+k/rVDpyegGa4CcqbPZoojA9Mbe7eCOK9cMVxfBr+U3zMxTV+zHmuuqjOJUAazonoS
	 NJlcDsg6Iy0/dQQOd1/8awkwuMbW3TKqKetWOOVS5MJ8Yc4t3OvrkoWRZYHlmgQnvmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793723468;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=eSQKm7UUijl6C6P3krsAOLC7tr+KFlL5vw7pWHaCRFs=;
	b=s5cXX5JlAmXLSgVONQfvPRzygkktxRGhRTA+56F5+BMukncyLu43Ujy7oVx9YAg46fhu
	 44T8kyJZM3XN4vOESMG5jV5lmvLL7GpqwFfEhGM3h2g68fNVHt/Zs6++wyt5VquOrBwp+
	 nO/vzEbqAyjPMgk0jaZgmj1hSHP8tkuNku/iJ7qAkxeChLHQb6g9/mOj7TD00LhkEDOov
	 Sbo0sthw6wQsr2EvOM+/Ji7l8tPAAVTZzFXmjoaQibyPbaP4NpIIhRHHjs6GXooW7ZLHC
	 SqRL/aaiJitemp02uMKnpZeyYfFfn+iOPBDYMi8UBseKmWFIs3hlOk6ZZ/tWMMVNOrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--mclapinski.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="fkL/ky3+";
	arc=none smtp.remote-ip=209.85.218.71
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBF69606A329
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 16:31:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBF69606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mclapinski.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fkL/ky3+
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-c42f98f351eso433203066b.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 08:31:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793723466; x=1794328266; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eSQKm7UUijl6C6P3krsAOLC7tr+KFlL5vw7pWHaCRFs=;
        b=fkL/ky3+foSTneGb4j++TAoxRKYCFlXP2vj6z4ta3Mw/vkJxsly4NZYBVSMTe3H7zg
         F/2hBDkJx9luL2VLahCzu2rYIrzjds2t2gjl5p23qLZS+/PceNndg4PF/E6Q0lRIWZk2
         a3lKGfottp3HsqzR7fNmorb5SF+Vv973rfftkWLDsgtyZVSXm+0FC+uRmBxRk0yQCll9
         3KF8vf/U3SgPxBBQGjmRpQU+ImSwrdtkI6ICi87uwbhFag9Q6FL/wgn8QmpG7S0R0dM7
         sf2MfJR6D/x8PhQxyLT/+6OoxfVWFrODX2JmC3d45XB2xkgYw+PcI+UrtKVruDsTWs08
         qIwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793723466; x=1794328266;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eSQKm7UUijl6C6P3krsAOLC7tr+KFlL5vw7pWHaCRFs=;
        b=Y2QTYCXAULVf+abWpUS3UcPsnBYyKZagZtYHDIk67n1iloVy86l4TfwBadkr/JuVGd
         XBfcOZGf82Gm7C3FrBQk56WFIWqVQcpCJ3qHSNqCO/3X2jwweed9ZFlrmQMwQFOuF3Th
         8FuaY5aJP2Nxvzbj+y9kfpS0rnWdegRcvtoNHNPnwAtoZGne6VcIdpz1EFWNlXUy1R6v
         CDCwWWkPBU9L7Yr3V46zQZvCh7spkcO1v13bqSS6rMfamjOoA0ZvAOQQtdG2g91/QGdz
         HNny3AFcQP2Sy9KzF6ld9LgNsGjd2f7IAQS26ptG3FLb5IXxmX77BXigMzFHclBuJ7Vc
         THGA==
X-Forwarded-Encrypted: i=1; AKwUvByhjQ1ictB4fV6ZqugmRVzUotXaL7K6314YQ/lKnkUyV77GpYcEGIqG13aZfxTIp7tDFqHwfIRemGQ5H1k=@vger.kernel.org
X-Gm-Message-State: APuU4Z9yphGK4G2dk/sGNldn3FQEgMjnIvAxvwJXgsx0okKY9E3ymZMw
	akl95cvnifhv/lTdHtbTb5oYHjAiIFE7o2Vxrjw3/6Y7tduXA3fLojymjW3TI9/8Lh2U0iQFKDW
	DnRHDkeJatdIBVkAjCyJ9uw==
X-Received: from ejblt21.prod.google.com ([2002:a17:906:fa95:b0:c40:3bc8:4248])
 (user=mclapinski job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:3e0f:b0:c2e:8eb7:53dd with SMTP id a640c23a62f3a-c4ca7a9f026mr1267723166b.42.1793723466395;
 Tue, 03 Nov 2026 08:31:06 -0800 (PST)
Date: Tue,  3 Nov 2026 16:31:00 +0000
In-Reply-To: <20261103163101.1696520-1-mclapinski@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261103163101.1696520-1-mclapinski@google.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261103163101.1696520-2-mclapinski@google.com>
Subject: [PATCH v2 1/2] PCI/DOE: Don't busy-poll the mailbox when HZ < 128
From: Michal Clapinski <mclapinski@google.com>
To: Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org
Cc: Lukas Wunner <lukas@wunner.de>, linux-kernel@vger.kernel.org, 
	David Matlack <dmatlack@google.com>, Michal Clapinski <mclapinski@google.com>
Content-Type: text/plain; charset="UTF-8"

PCI_DOE_POLL_INTERVAL is defined as PCI_DOE_TIMEOUT / 128, which is 0
when HZ is below 128, e.g. with CONFIG_HZ_100. pci_doe_wait() then calls
wait_event_timeout() with a timeout of 0, which returns immediately
without sleeping. As a result, doe_statemachine_work() and
pci_doe_abort() read the DOE Status register in a tight loop for up to
PCI_DOE_TIMEOUT (1 second) instead of sleeping between reads.

Make the poll interval at least one jiffy.

Fixes: 9d24322e887b ("PCI/DOE: Add DOE mailbox support functions")
Signed-off-by: Michal Clapinski <mclapinski@google.com>
---
 drivers/pci/doe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/doe.c b/drivers/pci/doe.c
index 6b5d9ba8e969..6d258f751318 100644
--- a/drivers/pci/doe.c
+++ b/drivers/pci/doe.c
@@ -26,7 +26,7 @@
 
 /* Timeout of 1 second from 6.30.2 Operation, PCI Spec r6.0 */
 #define PCI_DOE_TIMEOUT HZ
-#define PCI_DOE_POLL_INTERVAL	(PCI_DOE_TIMEOUT / 128)
+#define PCI_DOE_POLL_INTERVAL	max(PCI_DOE_TIMEOUT / 128, 1)
 
 #define PCI_DOE_FLAG_CANCEL	0
 #define PCI_DOE_FLAG_DEAD	1
-- 
2.56.0.385.gac671c819a-goog

