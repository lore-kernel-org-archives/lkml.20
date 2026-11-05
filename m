Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793897011;
	b=cv8Ljgh43scNsVZgpANrW3U8/RTyzKFMwg1oCGaIHPCYbzrLERXaEVokkPubBE5jSET5
	 X5uqwPE/mAG+6D6JObiHCmIfLjMmOrP5KZxDJuoyqCKthw7FGOimoEHsi0+j6gLOHI57n
	 jLeR9pRB4IKEnCb3H1DofLD2DZoK6wrvBIJ3EAeWyNQJEvi/RMw+WiW/YUCb7m4087ye5
	 o4N0Ubun6W9uqpsgCZOAQfM0TYfUx1U+VpsYiRVwpkx6p/g7CGPdtuzSnVJX7uYq9a2AD
	 YDPpVgUy7jxTbkYhO40oINyTHxpIl0AG/p/+luWiR5oSR9KApfYY9W+Mk/0aW+qlKcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793897011;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=U2gshDq2bNSNVDi2ZZPuvyhhYbiMNkYLcIK7Najb9DU=;
	b=RsVt+m7+7OhL753OJv6gXz2tyWp+pbwinuCujSzGGzE83HhtkDBGm1jvYYFolnTnn9CZ
	 qaomYpeLjFwIdvWYGfDjQSklJ/vFcWyfZ/53AAI98Grz0L/+01vEIBQVqb0GRigFRAeV3
	 FzbPaG5lu27JssDpH1Bkqxy7BkHIVIrGL18Kjp8s1XjOTYehvNJCXpPo+S8zwWz/DY32C
	 LD9ZKOG0IgUDophXplHbiYrUIgbuNUGbE9073EL0tJSpia6fHVGS/3ehtqhR3GXlHiyq4
	 Ik+k0NX7itI8Qe/hqtHJ720YC9wdi0nNSQWctiv9ECZIo6fCnyp4OQqcR7OjYlafalA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V0CL5WTY;
	arc=none smtp.remote-ip=209.85.219.52
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C6D606A906
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 16:43:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5C6D606A906
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V0CL5WTY
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-91c79a9a739so29032886d6.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 08:43:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793897010; x=1794501810; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=U2gshDq2bNSNVDi2ZZPuvyhhYbiMNkYLcIK7Najb9DU=;
        b=V0CL5WTYpoM1SYQ7P7pQ063tn89UFTxXRJ2vPwv2nuvsSTbAWYBlRkIlh2wtt/0rGM
         R5ssh7gAFZwnVkmnyQeuCK8rACXBvTUUcWBgKkrg2O+CuyQ/shQBTwfGjGFqMPalk1xj
         IGK/ck3grhWUZMB1tNrOHeJY4KQmAef7nDtT/kZUtFx3yRArG+gN1PnnzrnWPHjDU3F5
         fqLuVwgxKp79D+d0YbKXCOhWDgtFn63halgXcdxhiSyOES90gJt9t6cT8J6hlmLi1hN9
         4d/KYpe9g/l1xEy1CFSC2MwT1ZTq8vWpNShFeneAm6bTm2QoVn9LQ+VcvC4NPAqWD3SC
         5dSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793897010; x=1794501810;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U2gshDq2bNSNVDi2ZZPuvyhhYbiMNkYLcIK7Najb9DU=;
        b=X+HtRvRjCW6KHj+rJfkrlNkrLb8DhMOpJuxzRSRJ03JdGKZVDEpE9k/xKevKD4NqqN
         1NQp6mkvCSZb1Uoul5jpyxLvHSRFWyNaa1F0wrSlrIaUJ+JgHp4vuq/eBylK4rfyQsMv
         4P16OSVT5DKhQpBdX7SaaUxu83yt6a7+2btJ82MXpsjz2z+9sL5TvKGd8+aK4IsZ6iHO
         g4R4fr1TivqL7RX24/L6tMwbEpOBjQ1kmjnzEncalT/zqUG/tdkNyIT/2squ5Ib7knr/
         9sv18FIoBdfcwj1HTOePP9yT7vZ2EUaMI+VQrD8nenw7PSV3QfDU4H0xPiNL40ewpkZU
         5SCA==
X-Forwarded-Encrypted: i=1; AKwUvBx3ASdsCml4b6Dl99o7WUklvinTiX3Kss33x29G3dDLARf6ccvCtW1IcroyMIpHPgOS515fL2fHPxK5nTQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8zcKWrgh9Spvx3loFwAYZn0tMFnDl7uFVVw9MADnZrkVoa2yGk
	K8XDcNBrwSBHTqMVX/Nz9XFyuTdpzCrgAU+Hp+lHcLi5Ij0ttPrzTcWt
X-Gm-Gg: AYBFou1rn4HHjcPHDAxQGsLpNUVC9Idcw1I+vXsi9SX3B3AHziHzABbscMT9WSc7ytU
	cpO06Z74eBgZwSirXCWuZXIGV0xMe/3avk2WZGaoPfB3H/rw+oc5q0D6SBmTsjXaKoKKaIr+yJt
	fmEIIVT8K2qIkE3LyUcWtnoGBl/saVP74UeBkuJlSxeVBK6jN6bdemeWDWG81ekRZBVzwJx7L+6
	W+8vZ9iLoMYv0wZ1oyfCNLpW5Yee+2PP/+lQnulwb3244xua/7Ycx0qVvsgyQp2f7RNwryppe4f
	xpw+4Fuod+wHxykXzQcoEuIQ4iSqPpn/T+ZTgIhf5rsum0d+2/kuDHn1tdhY7mAXPqUuA1pac88
	WOpdoZOaG/cxnXLU5S8zR6/2jSpgjOJJCK+7vtt3TelWiW4ZWngFp1QuySoWvGvA/iC+EB3BTkn
	y1evaZy8kJ7rXIQyarfVJk4AdfEpELbp4ufrqsL/AQNGhrUQLRkhNoj2nnt6nh2/3L88+sWgTp7
	BgGqlMu9tNVjTzNPdEokAMcGnzqAKRqHNRoFJ0bW2XcaahRdgxy4XRMa/t8/IimPjwh3zsroUzs
	bhkraKMhAE88zeOnrjhb9ZUEJkRuG/bAC2PU/ndrkmECuaUo0VKJJ41rwuSkoVJVYNORpSD9EaQ
	=
X-Received: by 2002:a05:6214:501a:b0:91e:8e12:f594 with SMTP id 6a1803df08f44-91e8e12f9cbmr74222216d6.39.1793897009503;
        Thu, 05 Nov 2026 08:43:29 -0800 (PST)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91e97b5ae75sm22803706d6.38.2026.11.05.08.43.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 08:43:28 -0800 (PST)
From: Yuho Choi <oss.patchbox@gmail.com>
To: Richard Cochran <richardcochran@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Jeremi Piotrowski <jpiotrowski@linux.microsoft.com>,
	netdev@vger.kernel.org,
	linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yuho Choi <oss.patchbox@gmail.com>
Subject: [PATCH net-next v1] ptp: kvm: x86: Leak clock_pair page if changing its encryption fails
Date: Thu,  5 Nov 2026 11:43:08 -0500
Message-ID: <20261105164324.23501-2-oss.patchbox@gmail.com>
X-Mailer: git-send-email 2.43.0
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

In a confidential guest, kvm_arch_ptp_init() shares the clock_pair page
with the host using set_memory_decrypted(), and kvm_arch_ptp_exit()
makes it private again with set_memory_encrypted() before freeing it.

The untrusted host can make either call fail and leave the page shared.
Both paths still free the page: the init error path with __free_page(),
and kvm_arch_ptp_exit() after only a WARN_ON(). The page allocator can
then hand a page the host can still access to an unrelated user.

Leak the page in both cases instead, as was done for the same situation
in commit b9fa16949d18 ("dma-direct: Leak pages on dma_set_decrypted()
failure") and commit 03f5a999adba ("Drivers: hv: vmbus: Leak pages if
set_memory_encrypted() fails").

Fixes: 6365ba64b4dbe ("ptp: kvm: Use decrypted memory in confidential guest on x86")
Signed-off-by: Yuho Choi <oss.patchbox@gmail.com>
---
This was found with a static analysis tool from ongoing, not yet
published research, and confirmed by code inspection. Compile-tested
only (x86_64 with KVM_GUEST, AMD_MEM_ENCRYPT and INTEL_TDX_GUEST, W=1);
I do not have a confidential guest to test it on.

 drivers/ptp/ptp_kvm_x86.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/ptp/ptp_kvm_x86.c b/drivers/ptp/ptp_kvm_x86.c
index 6cea4fe39bcfe..811758bd8b0de 100644
--- a/drivers/ptp/ptp_kvm_x86.c
+++ b/drivers/ptp/ptp_kvm_x86.c
@@ -36,7 +36,7 @@ int kvm_arch_ptp_init(void)
 		clock_pair = page_address(p);
 		ret = set_memory_decrypted((unsigned long)clock_pair, 1);
 		if (ret) {
-			__free_page(p);
+			/* The page may be left shared, so leak it. */
 			clock_pair = NULL;
 			goto nofree;
 		}
@@ -68,8 +68,9 @@ int kvm_arch_ptp_init(void)
 void kvm_arch_ptp_exit(void)
 {
 	if (cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT)) {
-		WARN_ON(set_memory_encrypted((unsigned long)clock_pair, 1));
-		free_page((unsigned long)clock_pair);
+		/* Leak the page if it cannot be made private again. */
+		if (!WARN_ON(set_memory_encrypted((unsigned long)clock_pair, 1)))
+			free_page((unsigned long)clock_pair);
 		clock_pair = NULL;
 	}
 }

base-commit: 0822d2fe38262e8b55c5ea55c970022bca8dd2a9
-- 
2.43.0

