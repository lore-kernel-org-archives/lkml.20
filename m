Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793665333;
	b=qGKZBtzozxU5R730zI5Nvo02McpWrsBRhm8Hj4fqkSf7AKIoIWaHEOHlCTn7e3wpwr2p
	 PrrNYygrMj0IZbkF2/KcSWPFTCF3mphcfZHfKoxXp5WFKyB2JCl3e50kVFd9GHy5mCa+Q
	 mHPWBFdUTLxCd9EeAXjoxxW4M6uXOVM1fxzdqY9YeiWH27q+Iybs4z6+WsXVwh/hMp56D
	 oo9JKKWB2UIzJYMx3baBPZWbWn97q5yHm/f+Z8OshjDgTI5yvRzKbtF5zVz0aVsxMIs9Z
	 HDHett/6ThDqUs32H9eFF75Bti/HAO71OWh+NWRuLM1rQJXnWAni6rK06LsP3zu60fQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793665333;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=54IhsnyP2g3Jiy+S3uqB1XalWVHCL//tyTGoAcklP/U=;
	b=uUdQOWVtg1NyLUzi/gyifdFH5ggTG1FBeHo0ZzwgZkqUaMHrkXSanGqoXPvCmKe4wHdy
	 r6ae4A4prkIiNy/vPMtY0h/1M93P1vTJdVcAijjVoUZ8RCSgx3Ws4Z6sof2W91YgvbRXo
	 d7NV8j+z9f5ElKlNc85Q7GIQ0QdTkla+ICo/jIymqf4zu0lgpOemOXZ0mtyuMucxJZKTK
	 1Qf8ZajpNA/PlZVKlk9ATqxiyhUAjl0dS8nC7bkfvPPaovGDCUIucFPiYcbFNDtxrIick
	 l77n/TjHJdVoTBF8FYwjXtoUwa42cFKdHMeyT7YP0hZRJz3c08M0XTv7wqLRmqyyMjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=l6zDArSo;
	arc=none smtp.remote-ip=209.85.214.197
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE1F606D809
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 00:22:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFE1F606D809
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=l6zDArSo
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e601800e58so56952675ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 16:22:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793665332; x=1794270132; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=54IhsnyP2g3Jiy+S3uqB1XalWVHCL//tyTGoAcklP/U=;
        b=l6zDArSo/3FNlYvlM7lmevOJSRFO+72jBOx4bQycjDIqzmlsrt2iyJ5ujUwnhn3nID
         m6ZaUF1TTQhCJDh5ZX31ZY3gbCpmwDT5IVFRSThjYgwHL9UwOFWL3aLb28IKhb1QprCn
         bZJSY3+BSUXJWA+CVWpXWFVTr+zBc/mfP0M311SUXnPleXq28HbF3smQVZrU/k3zUiBB
         fMJ2T/fY3attgyUrywOGXbfTc1YUucT3fxsxDYB6wGVwbCvjG+N629kJeQMc3XT3T+b9
         IRFTwKIUo78YHS50O+/ol64sYpMob1KxcewgJYbnw7umaXfjAEMXHl6yzY+PEfNSQJbY
         LihQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793665332; x=1794270132;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=54IhsnyP2g3Jiy+S3uqB1XalWVHCL//tyTGoAcklP/U=;
        b=QxNdQhYUPXWxMwnv0ejk92r90IQcnun9SlNkDwKR+xNfwZs02HedGuedLu+7C0filG
         AsaYh9rQrpVUG2HcZDPedgaUz9nJRYWsuL7EPHHNgzKQkGlAH6e457uR7/lp3FrVlcAC
         GsOjewSUa2ZUDSuAep3e26o7clCSZi01sYwOQq9OjpkUwBFTlaeoem73NddsZ/qSZtMB
         K0/3vmGiJ53hq+iT+Aal0BdnF9rJ428dj76ryhlXzV0Znv5A79EvdCe9ljNz+9EFLJdM
         s7RgtbdyYUFXGY48HNfUAYlz4Dmoyd9xfxtV71O1fJ7YwBfhgDu0hCdt1vmThrMg3+oF
         DLHg==
X-Forwarded-Encrypted: i=1; AKwUvBwqFseQiTQ4DCRyVoPn4bjXJ6j5d+lSLT/6q9YOa7s0zveoQLfUpvi5/M0x2e21uw9NQGQUgexJlYYaedw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/xCiIqhmUVbX6OeT9ujy3oDsasUq7oXnqYVUT3pAjPhFBTGOC6
	nU/NxGWUisdXb9IT59tOu0BulK6wAsLFXM7VOhOG+d5uIdeVxO2OLzIbZkbC2Il0hxcgSG6soVc
	Qua4iuQUUcNs9Rw==
X-Received: from plgi6.prod.google.com ([2002:a17:902:cf06:b0:2e9:b079:3771])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:3247:b0:2ea:1b9b:b946 with SMTP id d9443c01a7336-2eb3649bbf6mr114233985ad.14.1793665332121;
 Mon, 02 Nov 2026 16:22:12 -0800 (PST)
Date: Tue,  3 Nov 2026 00:22:05 +0000
In-Reply-To: <20261103002205.3348519-1-dmatlack@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261103002205.3348519-1-dmatlack@google.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261103002205.3348519-6-dmatlack@google.com>
Subject: [PATCH v2 5/5] KVM: selftests: List the known IOMMU modes in
 irq_test's help output
From: David Matlack <dmatlack@google.com>
To: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Cc: Alex Williamson <alex@shazbot.org>, David Matlack <dmatlack@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>
Content-Type: text/plain; charset="UTF-8"

List the names of all known IOMMU modes in the help output for irq_test's
-t option, using iommu_mode_names() from the VFIO selftests library, and
clarify that the IOMMU mode is auto-detected by default.

The help output currently claims that the only valid modes are
vfio_type1_iommu and iommufd, which was never true, and would get stale
any time a mode is added to the VFIO selftests library.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 tools/testing/selftests/kvm/irq_test.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/irq_test.c b/tools/testing/selftests/kvm/irq_test.c
index 8a345472df5f..ef69f9d7ac3d 100644
--- a/tools/testing/selftests/kvm/irq_test.c
+++ b/tools/testing/selftests/kvm/irq_test.c
@@ -159,7 +159,8 @@ static void help(const char *name)
 	printf("-i	The number of IRQs to generate during the test\n");
 	printf("-m	Pin target vCPU to random physical CPU before triggering interrupt\n");
 	printf("-n	Deliver 50 percent of IRQs as non-maskable interrupts\n");
-	printf("-t	Override the IOMMU type to use (vfio_type1_iommu or iommufd)\n");
+	printf("-t	Override the IOMMU mode to use instead of auto-detecting it (%s)\n",
+	       iommu_mode_names());
 	printf("-v	Number of vCPUS to run\n");
 	printf("-x	Use xAPIC mode instead of x2APIC mode in the guest\n");
 	printf("\n");
-- 
2.56.0.385.gac671c819a-goog

