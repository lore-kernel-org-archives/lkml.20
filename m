Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794556475;
	b=Efpnw4+a32vjJg02IClqnkIwZqXiRSGgi3H5RXnBaRqvFQYHnNxa6kUKi1LlOV7XD1nn
	 IAtrmlMA4qW3lqlONe/jNaJeqELSyUfYovI3FkhZS1hXZW56YpxHIn+NkEfKV1uPLQBs/
	 lp26AKra3sYD8fP2EW67ltktWAPe/TqfxBn+wn7pWIkeuGopZzM2s9JNk+wszZaBr0Wcz
	 p/uD9mYmoV4bqrM7dNHpQP0H1D5ARJlHF+zCX0ISGTbEAK2OdF/SC5f961Fgm61JYyLhk
	 R8MwTgloBSy2tujuztWhP/QOmYB555B+YPSnrz2rlAEwWkt4LFVXTaWs1T+OA13dr1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794556475;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/oSrBPXKrNYnAzFH4eNjIUEYe3r0QmvR+RTmTsBOz3A=;
	b=NLfNlePA9qdUXTqpgqGqjOyOX0SKsiqtV2Ym5bUwmkvxRngyPDVdpGGXeaeXdHkPIW0O
	 lQpsJWlgyKn+2mxgy/dcb2MBmwg7fj57BM2wmXad7nx1FBq3xXUodkVcwEM+Ts/xswP+r
	 l+oCtu2/uL1CeagmpoEANk49RhfaO+eKAH+MFFtHensfzNHRWSthOLc+Lss0hDhcK7AgY
	 xnHgA9y86exqX8wnzqnpQEBjC6WoYJRd2Q51kdW8xWqTff57717w5msmYE6KuGu6HaEQM
	 Ypi7WPg4UTYPz4pJP0qtPX/nc+fDlb8jo3sD3FcRTTQlWGC5iLgh+XSSlTQNOeLge9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YyBq9a4Q;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B287F606A321
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 07:54:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B287F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YyBq9a4Q
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3b155f50c24so1185454a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 23:54:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794556474; x=1795161274; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/oSrBPXKrNYnAzFH4eNjIUEYe3r0QmvR+RTmTsBOz3A=;
        b=YyBq9a4Q7vAVmzwzza210l117Y9lnAiiEByG3r5U6I7jz++rmkhnn+WStvd7xK43w0
         hV+Trpjr9sSTNEwIs2691auUWlhgZe+WvgLfbjgpsNJys+OP0XJVjhwpIA6xLq/1B7Xh
         ubjHGDNOWAThXMfoKaMf3JvIhEc7kizNgFcDDHm44KX6DPi5Wb2YjUE2n2xhsqr1G5wl
         qgWu7Khwn43s4KKmeClLnxWF9L8Wt/fQ1PjHS8FCEiaoLWpTN3U8aoYVA7i1xNfoADqK
         QM+wC1FZFQZafmG1IlnB1XkX7UzNRZIiJY5nCRFY9l2yQX9pISUOrggU4m3XicKW0lyn
         4zOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794556474; x=1795161274;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/oSrBPXKrNYnAzFH4eNjIUEYe3r0QmvR+RTmTsBOz3A=;
        b=f6csgreIw5SK5jl3l+pM2b0Rad3NEAnYKFdNvakFoPQt3gr/qfDt0gbmhlZ42yJoMK
         tK2M4RTWzMJUcuzyW0m2pcHvUXZR0yyjrCcAMjMvGqbFi/5d1SB+y5EJgFaR+0DUnGHK
         brNYOICVbj77f0jt0k6URIX7FwWnErUipJKrNEOzo172UIBFb2p6RUTdAjleGXo1nXbz
         mHWuSR73hbw/GT06JEdBKNnecTEHje6yAB3+V9Yj2m2doiHRscgAbH/7UV7ufDnArvvd
         TEbwE2mqQjAtUmuGxqnT8t3SdAbrTM8HQ2F3Ml1DrJ8bTeRGr37wMDlyr0G9zIy9/iNx
         FUTg==
X-Forwarded-Encrypted: i=1; AL+hErFXYwZVKwK7hPCRFozEhzVsBsfFYBBAzWzukGkaVKyR3FbiOoc5dY+ozwxe0HmMSZc47M3vGsu7NjZRynY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Ugq9uC5Z/TfbQJRQM7GCyovCZzpfvUk113K7mvqO1+ET0EpbE
	5pujlHFMfo3x7qwo+gz95mAVRJ+Xf8ozLF+3zTJiyFfzcsCcPJw3ARga
X-Gm-Gg: AYBFou02t+UFqYX+YRK2ie5k1RbYdXHNpo+VQhPeT0umTzCdjjiK7l7yJFda5xinhUm
	1qSGL3CMYYyDmtQ6Y9Q/rt9lSrJNzQpt5S3qkUYe2gOdIWsZE9rM42Q4dehPfAPCJzxHT5S/1Yq
	ZN/vBpnQWHHQde1euLi6gzB2eoMqbRogLlBaLC410KqW+zD7ZCi8YmvB9CLB2dF++jo3VUQkEcd
	ippa6EGAR2cfg7FHk8AWjvCX9q0EuLn+zbyr3crRvUsUMHFbIBumXaZB+6Tb65ZCuuMd4eg6MuJ
	Ev4w7Y7RO3ruyuMJCEKfM+ZyTmStl93TC3CkYlO6OtqnTlrRnM/TvHwPuj6C8EuW7w53Ky6eW8M
	jNP72wU3HQbPmSc5F+PTwd0EnbdQ3e2oaqEuy5Hczx1Bt+ahkVjVJLBP892eT18lUcnwZv1KJ3R
	ql8f7yCjadto+msYkArfWCED4zfLWjun2aK2o5LARO7adzxwprY+KE21eeGvXQooi8d8WA+IPz+
	bWfY9WrKFLY4OciS+tiv7XTq2yYVpoOiXaNZ2SzlFP5hlueMY6ezyo0aAcf5EFpe4vYyilBc5DZ
	GutniJkiMYbZMtBCMybKALlsV5WSPuRTJKk=
X-Received: by 2002:a17:90b:2247:b0:3a8:49f2:8ddb with SMTP id 98e67ed59e1d1-3b1b0d4f314mr1396218a91.60.1794556474024;
        Thu, 12 Nov 2026 23:54:34 -0800 (PST)
Received: from localhost ([176.210.133.73])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b3eaf732sm1024539a91.3.2026.11.12.23.54.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 23:54:33 -0800 (PST)
From: Vladislav Zaharov <vladazaharova2018@gmail.com>
To: dakr@kernel.org,
	joelagnelf@nvidia.com
Cc: acourbot@nvidia.com,
	aliceryhl@google.com,
	ecourtney@nvidia.com,
	gary@garyguo.net,
	nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	vladazaharova2018@gmail.com
Subject: [PATCH] gpu: nova-core: mm: keep a page table page before installing its PDE
Date: Fri, 13 Nov 2026 14:54:22 +0700
Message-ID: <20261113075422.943779-1-vladazaharova2018@gmail.com>
X-Mailer: git-send-email 2.56.0
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

install_mappings() writes the PDE of a new page table page before moving
the page into page_table_allocs. If push_within_capacity() then fails,
the page is dropped and its VRAM freed while the PDE still points at it.

Move the page into page_table_allocs first, so that a failure leaves no
PDE pointing at freed memory.

The problem was found by an LLM-assisted code review.

Fixes: 4e4182282d4e ("gpu: nova-core: mm: Add multi-page mapping API to VMM")
Signed-off-by: Vladislav Zaharov <vladazaharova2018@gmail.com>
---
I could not reproduce the failure, as it needs push_within_capacity() to
fail. With the change, the MM self-tests still pass on a GB203.

 drivers/gpu/nova-core/mm/pagetable/map.rs | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/nova-core/mm/pagetable/map.rs b/drivers/gpu/nova-core/mm/pagetable/map.rs
index f7774b9cc972..e678197ec009 100644
--- a/drivers/gpu/nova-core/mm/pagetable/map.rs
+++ b/drivers/gpu/nova-core/mm/pagetable/map.rs
@@ -209,8 +209,15 @@ pub(super) fn install_mappings(
                 let (install_addr, page) = node.to_key_value();
                 let page_vram =
                     VramAddress::from_raw(page.alloc.iter().next().ok_or(ENOMEM)?.offset());
+                let level = page.level;
 
-                if page.level == M::DUAL_PDE_LEVEL {
+                // Keep the page before pointing a PDE at it, so that a failure here cannot leave a
+                // PDE pointing at freed VRAM.
+                page_table_allocs
+                    .push_within_capacity(page.alloc)
+                    .map_err(|_| ENOMEM)?;
+
+                if level == M::DUAL_PDE_LEVEL {
                     let new_dpde = M::DualPde::new_small(Pfn::from(page_vram));
                     new_dpde.write(pramin, install_addr)?;
                 } else {
@@ -218,10 +225,6 @@ pub(super) fn install_mappings(
                     new_pde.write(pramin, install_addr)?;
                 }
 
-                page_table_allocs
-                    .push_within_capacity(page.alloc)
-                    .map_err(|_| ENOMEM)?;
-
                 cursor = next;
             }
 

base-commit: 0ff9e5b9ff6736c37593cd7db89f4593ec4f8e86
-- 
2.56.0

