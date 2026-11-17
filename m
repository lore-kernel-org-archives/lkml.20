Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794878115;
	b=Z9Rvwlg97mQXL+aajVJ/p7cggWvP6f7eqIiDGZkfCi41oyuJQXTMLpqd6YWlFqupbpkW
	 v5fsKwmEIUKygRxj9grmG7x9YN59ExMdoz/ZwZFUlu3FO1liCRhN/+8HyDjgeScOyJemR
	 LwXAPlzBwclHqSgeXDY/0unyNB8ROrumZ7derJJOg5vsB/Rnwpa+OU+rl4YE3U1goFdLQ
	 YVLlLudNXl5maxZERZuk1UyEgbN0EdYBOKIRYFHhT4uTNv1CVPoJ1w620We6x3NUOTxgh
	 nCBghZdITPOeCZUPZ0/+qC6jMDsTJM3w+nkyNjj3recrSf1mILrKkuOwp+fAo8WOndg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794878115;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Reply-To:Date:
	 Mime-Version:X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=OfKf9iYa0JD3DIaGQL4jdglFjk83Ku8ktmH0JNxa7Ss=;
	b=kWGI0ZGadGi+vgX4Wd5rB+J7ZiHYj+Z6+mOe2vadEEyVZQ4mM73sa85wVZfxh7OobjA3
	 4s+bt4M5IEXqmfL4ckJDOjoqFtPAPUDBSK7fsfaMFTTcGKZzD3rxe0Lbib/6Onh+27HDN
	 0uBnm/neprwCKldV6OKkhCTWuJzbriOph9HiIz/ZcqRJwjA/yAp/xbkBYi6bJtkPCmDbx
	 4xg40paGfxSAGAzKkX0TXrblv+46fTiUm1QpMKwHbP6oaGXFpQ3n2jDyi7qUxYwe5szgc
	 KXB/3u4MC2G2AWPCQ0NzCrkaKW3dZFp4Pvo/z1Kph1jmsQI3OwJkZuMR/yLyz8gqV3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ckLzIPD9;
	arc=none smtp.remote-ip=209.85.214.200
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85CA2606A329
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 01:15:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85CA2606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ckLzIPD9
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ed08904845so25130215ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 17:15:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794878115; x=1795482915; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OfKf9iYa0JD3DIaGQL4jdglFjk83Ku8ktmH0JNxa7Ss=;
        b=ckLzIPD9h52dG90sQPAujcVw+2zscj8VjKG8x1FHk5Bpokc4HRUfmh0tdIhgTsdwty
         AqZRzGqp33Fwv2L4hCIzEc2Lf+5P4bsqARUJECvmbJn4bB4za2cvUGFh/hO9JTr4hjdM
         fflzORtprz+GFDzwKcvCJ97QL8oIo6pSg3obKum30idQiy0LPeImzMv28ypHWyi/n+R6
         zsnVdZIOpybZgeeJPOd/o2VON3a140fZ+/plFVIhmy6OpQkzhpNB51vGvu5Ej1vaV+nG
         qU1O7aJq1ut1cdO5HfrYgYqnshRbY2oWamWq+6dZJQq/Z2O44NWs4UqYYbUQyH+4rAY3
         uwYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794878115; x=1795482915;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OfKf9iYa0JD3DIaGQL4jdglFjk83Ku8ktmH0JNxa7Ss=;
        b=FdG2REqRTtuvq4Xp1ExziG3+xZIzkDVg731EY3FmJ+M6mehqWIg3jzy+ACXhXYS9zW
         A2wbkGX96IOqnehXUvgBrpHXWeT5c5JLt7RDj9BeHL0ANiL7Xcm9ylGDgpZs1y88O4w3
         0O6xBvqBfJaKfYjFDkG7PDc6XjcZLhBkpn3Uf2zee07VxPMzYY6ZMcHQKYShKumWGyz8
         g2Z1PPrh7Jt3GScol1LU2zqZCxEsXC0tjb94SBDnoI46lPbFMcPVs/RPss+wmu+K6n4R
         pjSt+VkahOpaui4Qs8gfarrB0yGRh273AZtceFoev0IpqBiXG/vCDFfgxJCjhKxAdIsb
         2sUw==
X-Forwarded-Encrypted: i=1; AL+hErFVXdagzXTkxXpsaxAcRdIwB7W+fWOdWUcsyuLBDUmL4uws6WODK2nDxDoXTYXxhkAQRTWOo9XSBvPknbg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+k7JIgE2tmk+lQylLzR76Z3ASTLAFH/S/9uSK2j0jH9mLacBQK
	zDzL/C9yOfdYCuxbqGRXRIV+zFB2RL4RMEzT12gFI2TzROBmpSTUlp1Qd1BQwhZxtkbtUtyq2i7
	ADizkDA==
X-Received: from pjrx21.prod.google.com ([2002:a17:90a:bc95:b0:3b1:317:bac2])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1f86:b0:3ac:7556:8ee0
 with SMTP id 98e67ed59e1d1-3b1b0b666c5mr12537753a91.19.1794878114705; Mon, 16
 Nov 2026 17:15:14 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Mon, 16 Nov 2026 17:15:11 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <20261117011513.39419-1-seanjc@google.com>
Subject: [PATCH v4 0/2] KVM: Skip mmu_notifier invalidations for gmem-only slots
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Sean Christopherson <seanjc@google.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sashiko Bot <sashiko-bot@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Naveen N Rao <naveen@kernel.org>, Alexandru Elisei <alexandru.elisei@arm.com>
Content-Type: text/plain; charset="UTF-8"

Fix a lurking bug where KVM incorrectly prefetches SPTEs for gmem-only memslots
using fast GUP, i.e. VMAs, and then skip mmu_notifier invalidations for
gmem-only memslots (because as the name suggests, KVM MMUs are supposed to
only get PFNs for gmem-only memslots straight from guest_memfd).

v4:
 - Tack on a patch to disallow prefetching gmem-only memslots using a VMA.
   [Sashiko, Lorenzo]

v3:
 - https://lore.kernel.org/all/20261113164000.467175-1-seanjc@google.com
 - v1, but with a different changelog.

v2: https://lore.kernel.org/all/20260714160411.302386-1-alexandru.elisei@arm.com

v1: https://lore.kernel.org/all/20260615155244.183044-1-alexandru.elisei@arm.com

Alexandru Elisei (1):
  KVM: Skip gfn-based MMU notifier invalidations for guest_memfd-only
    memslots

Sean Christopherson (1):
  KVM: Disallow prefetching PFNs (for SPTEs) via VMAs for gmem-only
    memslots

 virt/kvm/kvm_main.c | 7 +++++++
 1 file changed, 7 insertions(+)


base-commit: d21eef2084a9af87ac2a783bc7c2b175ba114e4e
-- 
2.56.1.703.gf848ed807c-goog

