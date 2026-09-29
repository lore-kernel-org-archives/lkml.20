Received: from mail-yw1-f226.google.com (mail-yw1-f226.google.com [209.85.128.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB79C3D9DDB
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 04:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790654606; cv=none; b=o7Qwpv1W8bfItTU3ZbYwW7esDffwaHQ3Q+Ib4A+v0qmkTJLuBhNup5PzfcksNSuZpL9KvvowjrjBYLz51nru69I744bhzaMdHQL/p0pen64P+CN8eWVb2UMR+qYfBL79vmfv/XSpTMVnVZb0iHqN6fWwr5unTU553HEpw2bQroQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790654606; c=relaxed/simple;
	bh=cAPVcgsAJorVkgcgjx8qJ2Cz7pTUEIJBuCCMwyGBvoc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Lpzh/sDCHtecQgP/OrRapPSZ1UqrPusQw+vaFk7bPppoY69YQBqTF2ejzWgzmFPOHaZm5DkHl+Y1m5jkl930gLNwCkdFuDzN8djIUmqoUd5zhdwk00Eq3263ZcO5XylWP8/E217nIkZGIKUuBbK9CW6ceibuvEsodv9gOvxV/hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=S5hD9btE; arc=none smtp.client-ip=209.85.128.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="S5hD9btE"
Received: by mail-yw1-f226.google.com with SMTP id 00721157ae682-8ab432273c5so266997b3.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 21:03:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790654604; x=1791259404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p1CKCrpax+qcHAbV5I37hg3uq7X1UIkb9ImgfW4E7N8=;
        b=2vPraTSXZv+r+UZYPDdrFltmn+Nx+dowpnxAQktTvh7YiV7McB6LZYD4bblNKHRK0V
         09GNzHh38/oXnPccRJMx+xoGFqhwGqKgyirxaTPuYj3ULtx4cy2wONTob8jTRBcAoAwR
         kLtYRtvRT5svz7A1kB++ApB0M/GZNF9iyzTxe1cVbnwntmtw9wRvBdIbi0wuPIU54u1w
         jTGZwN7aLQaH1gg18VGgNg6sjaBtnID7af4EwiXx1R7iIC/iOE6U3ezkU+71GFzx0jrR
         VLqnOZADGMx/G+dL0gto7wTNdft29OsIGERmgEJU6Gm6SsbsGIYlmEpVdO669DivKOxv
         zMTg==
X-Forwarded-Encrypted: i=1; AKwUvByGED6iRE96u64cwEtR99LasWIwOtXIqawHmctdWZjbl9gQ7pGENWOlXFlUJrYXlH9G7kWm1x+8g3ScNQs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLxRjuXm8p8BgaLzBZeUytR6w7xX4C9bKODqtuDfJ9owI6XA1+s
	uRua8JtLI0qvdqYTVHdPHcy3b652gVq9X7kdTjaIAYK6wqkTGsN35g4mzDqrYXT6Fvk7LDeNQyz
	le5fqXXhvWCSir009XvQul2pupXACnvwjufDJEi9q5lOsAn7zLrkamATeWccq2uKgAMQYBbGNRg
	ri4KQdtOcQOcVV9TSb0pxB2bNSGfhiWog3zSNXhBpcj65mBwnG2f3mVPv0h9xenp1JAnzTL1qEd
	N51x5FvO+Zp2dUv
X-Gm-Gg: AYBFou13i7MVFel1G0cepjEkWp/0V//Z635u3SjXtx04ny1NuaRmLpSvXJVGVU3g4qQ
	vD55ad5s4h/DKERPMs+5rvjaWzddGhnQIW2mqbcDTfkY28H7ZLuvs6fiW9zJ2LdHlOjtu9/wL/0
	Tv6iAwmO5pqusharxZJH+MTbgbG44xvg0LKyIG9HrrWqHXL8M9WgHo10uJlr9V0eDnv3h67997e
	0I3DbmbfRUhgi6vOnlWCL7awrC87jhZLSBCaw3AMyDYWyuu9GP3QA1qXtOuofP0Quslvs9yldbN
	1mtBkZf9jxkqOtRhlIijZwufmSJSeFyXt6VDJYU71e4Zzeremk27gv0RB9wm6TaRUGWBLRxHyHr
	kARfwAxlvqgy+XT+uUz7fcgWFq/04RoyyqZBDEmpzJerWsBT8MU2T94j9w7ucmkHJKatBEjXQdP
	JKwUnBQfmzZx+sw/8DX1ESyJMsgo+ZDz1o
X-Received: by 2002:a05:690e:d0d:b0:674:139f:243e with SMTP id 956f58d0204a3-674139f2b18mr5069029d50.84.1790654603558;
        Mon, 28 Sep 2026 21:03:23 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-25.dlp.protect.broadcom.com. [144.49.247.25])
        by smtp-relay.gmail.com with ESMTPS id 956f58d0204a3-6755e907680sm402853d50.17.2026.09.28.21.03.22
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 28 Sep 2026 21:03:23 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33713e5e6daso5804013eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 21:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1790654601; x=1791259401; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p1CKCrpax+qcHAbV5I37hg3uq7X1UIkb9ImgfW4E7N8=;
        b=S5hD9btEeeCasujz5w9QZDPjqqKKIrEHlJMVqOqhX8KtIl+hs1yg3FyozSXIHCQDtD
         9u57WciCTYugRIfLEGeT5e2xFFu67Xc8zbGGVunTFXU+nSERWicaZLT2ywSoRAPCSJWn
         5zgf3Rs94gkb08ZDMg2/ffnuONLXuLnDyT+jE=
X-Forwarded-Encrypted: i=1; AKwUvBw8Qy6f/INefeymJeqnXGHQFVeLbCX3ycvc7xrdTjl5SgARV0y623eNFqN4gwurTQIBvuBKpvYTGaBIF+U=@vger.kernel.org
X-Received: by 2002:a05:693c:4099:b0:34b:401a:4648 with SMTP id 5a478bee46e88-34b40298aa6mr875155eec.20.1790654601351;
        Mon, 28 Sep 2026 21:03:21 -0700 (PDT)
X-Received: by 2002:a05:693c:4099:b0:34b:401a:4648 with SMTP id 5a478bee46e88-34b40298aa6mr875122eec.20.1790654600700;
        Mon, 28 Sep 2026 21:03:20 -0700 (PDT)
Received: from vertex.localdomain ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-347323f5a7esm10952571eec.15.2026.09.28.21.03.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 21:03:18 -0700 (PDT)
From: Zack Rusin <zack.rusin@broadcom.com>
To: Kiryl Shutsemau <kas@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	x86@kernel.org,
	Dennis Zhou <dennis@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Wei Liu <wei.liu@kernel.org>,
	Dexuan Cui <decui@microsoft.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>
Cc: Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	virtualization@lists.linux.dev,
	bcm-kernel-feedback-list@broadcom.com,
	linux-kernel@vger.kernel.org,
	Christoph Lameter <cl@gentwo.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Bo Gan <bo.gan@broadcom.com>,
	linux-mm@kvack.org,
	linux-arch@vger.kernel.org,
	linux-coco@lists.linux.dev,
	kvm@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Long Li <longli@microsoft.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Ashish Kalra <ashish.kalra@amd.com>
Subject: [PATCH v2 3/6] x86/percpu: Require embedded allocation in encrypted guests
Date: Tue, 29 Sep 2026 00:02:52 -0400
Message-ID: <20260929040256.543767-4-zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260929040256.543767-1-zack.rusin@broadcom.com>
References: <20260929040256.543767-1-zack.rusin@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Early sharing needs direct-mapped per-CPU storage. In TDX, a private
direct-map alias of a shared page can terminate the guest, including
through load_unaligned_zeropad(). Require embed rather than adding early
vmalloc conversion and alias synchronization.

Warn when overriding percpu_alloc=page and let embed failures reach the
existing panic. Restrict this policy to encrypted guests, leaving host
SME allocation unchanged.

Suggested-by: Kiryl Shutsemau <kas@kernel.org>
Link: https://lore.kernel.org/r/aqvxQoIoYhJTZpAC@thinkstation
Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
---
 Documentation/admin-guide/kernel-parameters.txt |  3 +++
 arch/x86/kernel/setup_percpu.c                  | 12 ++++++++++--
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 33cd30996e47..8ba881af3520 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -5347,6 +5347,9 @@ Kernel parameters
 			See comments in mm/percpu.c for details on each
 			allocator.  This parameter is primarily	for debugging
 			and performance comparison.
+			On x86 encrypted guests, only "embed" is supported;
+			"page" is ignored with a warning. An embed allocation
+			failure is fatal instead of falling back to "page".
 
 	pirq=		[SMP,APIC] Manual mp-table setup
 			See Documentation/arch/x86/i386/IO-APIC.rst.
diff --git a/arch/x86/kernel/setup_percpu.c b/arch/x86/kernel/setup_percpu.c
index bfa48e7a32a2..c83c61e0b20a 100644
--- a/arch/x86/kernel/setup_percpu.c
+++ b/arch/x86/kernel/setup_percpu.c
@@ -8,6 +8,7 @@
 #include <linux/percpu.h>
 #include <linux/kexec.h>
 #include <linux/crash_dump.h>
+#include <linux/cc_platform.h>
 #include <linux/smp.h>
 #include <linux/topology.h>
 #include <linux/pfn.h>
@@ -112,6 +113,7 @@ void __init setup_per_cpu_areas(void)
 {
 	unsigned int cpu;
 	unsigned long delta;
+	bool encrypted = cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT);
 	int rc;
 
 	pr_info("NR_CPUS:%d nr_cpumask_bits:%d nr_cpu_ids:%u nr_node_ids:%u\n",
@@ -127,6 +129,12 @@ void __init setup_per_cpu_areas(void)
 	if (pcpu_chosen_fc == PCPU_FC_AUTO && pcpu_need_numa())
 		pcpu_chosen_fc = PCPU_FC_PAGE;
 #endif
+	if (encrypted) {
+		if (pcpu_chosen_fc == PCPU_FC_PAGE)
+			pr_warn("Ignoring percpu_alloc=page in an encrypted guest\n");
+		pcpu_chosen_fc = PCPU_FC_EMBED;
+	}
+
 	rc = -EINVAL;
 	if (pcpu_chosen_fc != PCPU_FC_PAGE) {
 		const size_t dyn_size = PERCPU_MODULE_RESERVE +
@@ -149,11 +157,11 @@ void __init setup_per_cpu_areas(void)
 					    dyn_size, atom_size,
 					    pcpu_cpu_distance,
 					    pcpu_cpu_to_node);
-		if (rc < 0)
+		if (rc < 0 && !encrypted)
 			pr_warn("%s allocator failed (%d), falling back to page size\n",
 				pcpu_fc_names[pcpu_chosen_fc], rc);
 	}
-	if (rc < 0)
+	if (rc < 0 && !encrypted)
 		rc = pcpu_page_first_chunk(PERCPU_FIRST_CHUNK_RESERVE,
 					   pcpu_cpu_to_node);
 	if (rc < 0)
-- 
2.53.0

