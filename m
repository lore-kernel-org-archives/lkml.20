Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794530655;
	b=terSivuEyXQzDV/mJw8p7ulTxX4yVh6u0QnoVHjGVZz+7gtc+8SBivlOGqOUI30De/OB
	 vlOFOVqdsY4RnKZKNgNjZyL4nkBnzDDVO5seFN9JjRCRERBR0X6jao988pctRGiiRpzad
	 xenyxr5gcU3/GsqIRLYPa1tiqGUtGe9moTqNyGoTjoWVib4/aDJZb8M2wG+9bDKDECgu5
	 bzvjISf2f6fOG5cCqtGrPx/i3tjF62m2gsltRAe6e4LXx/wFQymLQhmjYOGFENZ83DzMa
	 BKQueL2kUP8IaZDrS+361ttSqF+KtDEwIqRpnUr/wG/dkdIi284cfi9gw8h2fe7LhIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794530655;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=s1YVk99TpLbLdCzUwvUqAo5yK2pRxoOy71wVRzZH/Js=;
	b=CeJv25/7bL6syRYtGaorWqlDM8g382jnjO+rqL0TDj5I66IeuVPcvF3MaaK5Hva8rxN0
	 80vpSe5Mrk9zvcachWBf9MEyxeINbhw01qvNSa+M05q+KV9aJikNliO2AeoYmc9C+RhP9
	 IZRzTbzY4MWj4+KOL3psSN8JUDp6svDHK5eKvixFAFNI2jbQDGf+ORJSQe6KUM7+h2jHU
	 Tks8WVXIbcjN4CyanS21kDkKegQGx0cscYmiH67o5hgwM0Y+zX7NYxKn69sggvZShy4ch
	 ijw0Vdh8PbiCxPiOTwW8vqOoqo4+blQRWCpMIYihRtHH4M1VRmdMh6IHzqOAX12xL/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wJ4y50z9;
	arc=none smtp.remote-ip=209.85.222.54
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F4F606A33A
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:44:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35F4F606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wJ4y50z9
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-99c0c1d07feso513037241.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:44:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794530654; x=1795135454; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=s1YVk99TpLbLdCzUwvUqAo5yK2pRxoOy71wVRzZH/Js=;
        b=wJ4y50z95xK0SKgtd1AUsP1H2zhIK7Dt+B5zHAp5rSK+TH6c3QeVSlSJaUN9JgjCU+
         dOwL0XhEu7zm/QlIXUaqRIhZthYD0dtV5n9kb2sSNg60D1bwW1CVCCfu64cYiAicvB+/
         tiO0GqTtS4krbFlv/Pfyj0BAV1gElxrXahkyvsuJ5t3paPVdP4wxYpAGZZgwdkuNNal9
         0vnL0+YXiPUcrLorbHAftxfE2ZsoZ2hmivYicx9AiVq/GLsGX4YUeeoPbjc1C2J5UWBz
         bRg/rX2r64NuCBhaYD/VbtpTbLOGqfiB8WnfBuuxEqgZR5HXGeJnIlfM71ujCCNnI3qK
         enkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794530654; x=1795135454;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=s1YVk99TpLbLdCzUwvUqAo5yK2pRxoOy71wVRzZH/Js=;
        b=xfyWP7u5O3g4hFEhC38ZVvZN97Z1hMvunYbKeS5hpI14AfuHreWPqOfuz7z+UYuRsY
         1t3t9RKnclkP9gN+ceC8EiPJYUuTQLy7nNAXgUHGkrjXe5TyGQnzDHCnG4+03yI2zZXk
         L0hjodx8sPO2QqhdDACxb6p6AWw4QnWQAd6YHvfjUcOPaMOVqPnIo+NsGqXMvOxLWUnE
         d6zR2nCOfcckt4GO+PiXAf2IJKX66NWbzkuSmvGUkcSYQ5aWq5Eey6z+Y7bUrnIx/PYe
         5SMlQVO/RnLgmYDmnyGhQzMQOwkKVgISBPhAcmkvycS84oUoDTVCZ9mlyT+/Zkqn8kM6
         11rw==
X-Forwarded-Encrypted: i=1; AL+hErGnoWv26AdvqfuVf2H7bhtzmEPY/kD7Q+sv5IO2MbxkqTRXXDpAIS9XIsPM4cyl/Ih+XT+RT3xtI+K94ZA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8E4CX8ug9ZQGM1lteoHlREyA1HyuFsEmmmENbYG/IG9nxxuraS
	MJHcT0gM1eEHmdi/hrubC2sd4JDQrxG/XrNgfQTFCm9xGOisj7hXm4nU
X-Gm-Gg: AYBFou36wZIQl+KCTbvsa51ySBmao8ypfUmShXtOKSsNMFFzHLvSgVUIlYX5SJK3KW+
	XdZVNZnXOmGGtja2saXeBX6qPMSdZd1DJlxBlpddkNrhXqdh0HEKAnTKwi4wsF+7tbiGeFvyV0u
	0NJ1OdSyap72RbGDnx83RLxXVPS77n8DhzSFkI68Hax0SXuYWFH9lU4aBPNkTOVb6+dA1qzqEiX
	pNyEzxqlmC6ZkSvN03UPVfWp+xBZUjnc/Z96qbDMmo+DecUh+9yMNf5w1MafcEGQ6pezPtml8JC
	03A5GYvPeE4c1+7lBZ8MW3F6BVKGY2o2WO8i9B0Vk1DOnhR6WQiIT11RCaO8X661Pdwtq5V+GUa
	a6056QdWSPxswSPup8XCTShClOYRGHKHbYSht7E7ZEJ+bFgOleUxPW+RyRfe8NLKuQUfajzOrD5
	zg9eCNqHUIpydesThq+DXeSAAIDrp3OLcsiHoCpavosdAesa1pklBDNDVnUpqTmZke5uaflzJpF
	0aZQXkKMxtoruk5basVODoSkFXLOgw2+SouVTMxASMXZvsVsOwcuszVEs7ioogPMl8YnnE4PSOM
	gqyh4IMDKjWIeHa4sanDaRH9sEadkDSfV/SUcLvTqw==
X-Received: by 2002:a05:6122:311c:b0:5ec:c186:d22b with SMTP id 71dfb90a1353d-5ee34aef024mr356354e0c.22.1794530654065;
        Thu, 12 Nov 2026 16:44:14 -0800 (PST)
Received: from [192.168.0.8] ([2a09:bac5:565c:323c::501:50])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee34eb9a0esm391085e0c.17.2026.11.12.16.44.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:44:12 -0800 (PST)
From: =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero?= <aleszlucero@gmail.com>
Date: Thu, 12 Nov 2026 18:44:07 -0600
Subject: [PATCH] mm/pagewalk: document missing struct members
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261112-pagewalk-doc-v1-1-6cc5ce7148da@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQ0Mj3YLE9NTyxJxs3ZT8ZN0UkzSDlFTTZAPjZCMloJaCotS0zAqwcdG
 xtbUAf6DM0V4AAAA=
X-Change-ID: 20261112-pagewalk-doc-d4f0de5c03c2
To: David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero?= <aleszlucero@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794530651; l=2229;
 i=aleszlucero@gmail.com; s=20261104; h=from:subject:message-id;
 bh=pJ9P7W0I0mabCui6yThr7RtPoOdOOdr/WWw8y3K4weU=;
 b=hZqPLMCN9HIdyzRPrexPxD5hxkRBBDo8KaVc6u0T36+0rfujFKA0gvnwyuFR3TDzS5/mf4F2Z
 uyV6aukmUS6CHj6em6Ww+8WbDzVk2GIzU7/nC3HtVodDt7MVDF5sHul
X-Developer-Key: i=aleszlucero@gmail.com; a=ed25519;
 pk=zRzEBMID7l1FXqr2CjfnlIn++3m3N05FuNYb5zPA3cw=

Add missing kernel-doc entries for @walk_lock in struct mm_walk_ops, and
for @ptep, @pudp, @pmdp, and @vma in struct folio_walk. Also fix @pte,
@pud, and @pmd descriptions to state they hold entry values, not pointers.

Signed-off-by: Oscar Alejandro Sánchez Lucero <aleszlucero@gmail.com>
---
 include/linux/pagewalk.h | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/include/linux/pagewalk.h b/include/linux/pagewalk.h
index b41d7265c01b..978714d5e32f 100644
--- a/include/linux/pagewalk.h
+++ b/include/linux/pagewalk.h
@@ -63,6 +63,8 @@ enum page_walk_lock {
  *                      install. If allocations fail, the walk is aborted. This
  *                      operation is only available for userland memory. Not
  *                      usable for hugetlb ranges.
+ * @walk_lock:          locking requirement during the page walk (see
+ *                      enum page_walk_lock).
  *
  * p?d_entry callbacks are called even if those levels are folded on a
  * particular architecture/configuration.
@@ -161,10 +163,14 @@ enum folio_walk_level {
  * struct folio_walk - folio_walk_start() / folio_walk_end() data
  * @page:	exact folio page referenced (if applicable)
  * @level:	page table level identifying the entry type
- * @pte:	pointer to the page table entry (FW_LEVEL_PTE).
- * @pmd:	pointer to the page table entry (FW_LEVEL_PMD).
- * @pud:	pointer to the page table entry (FW_LEVEL_PUD).
- * @ptl:	pointer to the page table lock.
+ * @ptep:	pointer to the page table entry (FW_LEVEL_PTE).
+ * @pudp:	pointer to the page table entry (FW_LEVEL_PUD).
+ * @pmdp:	pointer to the page table entry (FW_LEVEL_PMD).
+ * @pte:	page table entry value (FW_LEVEL_PTE).
+ * @pud:	page table entry value (FW_LEVEL_PUD).
+ * @pmd:	page table entry value (FW_LEVEL_PMD).
+ * @vma:	pointer to the VMA (for internal use only).
+ * @ptl:	pointer to the page table lock (for internal use only).
  *
  * (see folio_walk_start() documentation for more details)
  */

---
base-commit: 9d66f26fefacebfeed15de31c1123451a17ff119
change-id: 20261112-pagewalk-doc-d4f0de5c03c2

Best regards,
-- 
Oscar Alejandro Sánchez Lucero <aleszlucero@gmail.com>

