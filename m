Received: from mail-yx1-f97.google.com (mail-yx1-f97.google.com [74.125.224.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D44F3E1222
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 04:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790654599; cv=none; b=qh295AyZXTAmEYM5iHY7Duxg8uxCYN8JU3EZwySDCRlDQmApu+E85L+RVSIZrW2205hEEu9PHXpNcTH8ugxoxL7S1L67wSacNrRkc1QFEJzDDcfqHVmOA5IiKH7VvafZgL6/PjLWUFlioeFM0GLEzWVTYtBftXKi/NMsXVnGfds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790654599; c=relaxed/simple;
	bh=hwzN7aNlJ2wxS9ZWnQFgLPxc8hv3AZhs4ribMUFVqWY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AfMrP/W3lRiKJuquqt1KtLJynLvWVPed0FxhoILWCVBV9OprQQHdhXa9Rf38q1v8DiKcFObhS4uVpEhbGC41yx15Bx9bRT2cv/ORL5SEhEo+ZIZ9/4Dnk5t7mGj/bmp5gBBzEj2haB3KYbuaJT5aQCERSxr4lx/wgoJGXDcUFiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=PyotIwFz; arc=none smtp.client-ip=74.125.224.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="PyotIwFz"
Received: by mail-yx1-f97.google.com with SMTP id 956f58d0204a3-675617e81f9so203715d50.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 21:03:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790654597; x=1791259397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wf4+8fPuDTBmj6DTA0OwZVxSovvEfEo3g6LDTXOjhgc=;
        b=mbOapO1ZmzjhA+IvzhSXqhkE2KyfYSl5dayn1aNBGXw1Jwn0sreKjGQ1pzE1OjwIKW
         8k7s/+EEUH9ItV+LI2pXFuvYptfupeMcymmLaYkJhEyct9FbHbCbEJ2OnVLTYSNacYn0
         tzkw5TbzGo55wAQeDdmxPiEqb6ig1DGkIlxPq5DrqLz1D9d0daEJU6Tl0cPLr956t7vW
         IRlE4nYwCg32SijBZuwtRo6dl6pN4W3zmQlvWv0kwLrKxU11rNOeRHu0LUtlW9zB0UDY
         pTzOS3ICH0A/4HnpUWnv3bniMLTGk4nydeK/9ogMg4nbRQPX3Y16IY045xZxAtp4VxdA
         aRfg==
X-Forwarded-Encrypted: i=1; AKwUvBy9kM9JRykEOV/GHTk3nyRoLuBoiuiOM2m6i3tDIR/AFbPMDavPXKbsDXI0aQgNXlGV/pa3P/1EiU6uzw8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLRHgHVpvDuYqyUzBRMGV/pItgk6chFmNfgKlO6MiMW3g2y+gL8
	69iidC7OM16CqcRh/d2fNH26Keh07NUsF3Lt6jZ0/L4BVgvmv0TH7xAGRtIxQY4IeBKMPhPoYi6
	sXYfOgyRdtwkFS1E8llL2oFfLVWSDaJy5xmCm9AYs/j4t9DetTvXiDRvxM9oRldHvH+1vo+PGUV
	sgwjsKqx1pEFDpEXQYeomjYJEuw+WWyCJhQGh3OWxmjbcJcINEDBKHvcXosTC1qgNFtqBFE2/eh
	hIQyOc/2BRJFot0
X-Gm-Gg: AYBFou1dOt6HT8mierGJvx5ZHYc9ssIH7Yw9Sm8AKXVFvZg9FYuCWFfa7oyU5bgWmb9
	M3GCmma7aO7LHSFc+Jv3De3WHZJrSlwNcQUWLd3Z0/KZkd36P4DZQ204b0sd5nUMAn28yRMxN+i
	C1HVj29slnR2M5zsyvAev0ysxq3TN268AStwQl1KhIj97VB7/molmPZGuhfJkTTVNUkRckmwKVW
	yLpCd0FNJamyYFSiYWCJF1G4oiCs0vcvl6Vrk3Vh/xesV9zw6cXuAcOfTD+hJ7cnVof/1ymurnn
	6jmtsQ1fdqeT+IgWXZVt6pdBW3YRSsVqCzbg3wHLKi0a+pbF3Hkvk6tt71qoGSjy+TNyxi6Zm0g
	URTWjr/IHsk+V+LShHVlao0he119WqAuOu+oBlq89rhDjJPrdjoN+HXUBxYPajYulfv+CWSidXs
	O7R+ayKmoMyMI59iVdD+cUNoIvTqukjzXZN3s=
X-Received: by 2002:a05:690e:1688:b0:675:55ea:3a11 with SMTP id 956f58d0204a3-67555ea491bmr1731484d50.97.1790654597004;
        Mon, 28 Sep 2026 21:03:17 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
        by smtp-relay.gmail.com with ESMTPS id 956f58d0204a3-6740eea8439sm1860486d50.6.2026.09.28.21.03.16
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 28 Sep 2026 21:03:16 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-342217d8d53so12162527eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 21:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1790654596; x=1791259396; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wf4+8fPuDTBmj6DTA0OwZVxSovvEfEo3g6LDTXOjhgc=;
        b=PyotIwFzFgcwxJInUjRqHdieDpi+5TYK7k6oOh4arLQ/4SxzVkj3Zckhwcp0wDEBvR
         uz6kmALuwQN1yZw/lxy6N+LKDNlbu8+SyezeqDk1hTETmMhViRP2RaSKyYrJ3c7C0tTE
         0g9jIlGP1CbFSRB78DU76rriTuCr0QkFtIECs=
X-Forwarded-Encrypted: i=1; AKwUvByx+2GjjrN1OPQjtoIe4pAW/uGj7a+mp50y/43bj8NQ29S1Vkc6q0bxg+/icOio8X6xD2pE4J1bQf11iPo=@vger.kernel.org
X-Received: by 2002:a05:7300:c8cc:b0:33b:a4dc:d5e1 with SMTP id 5a478bee46e88-3426fbbe36fmr11863807eec.8.1790654595156;
        Mon, 28 Sep 2026 21:03:15 -0700 (PDT)
X-Received: by 2002:a05:7300:c8cc:b0:33b:a4dc:d5e1 with SMTP id 5a478bee46e88-3426fbbe36fmr11863746eec.8.1790654594365;
        Mon, 28 Sep 2026 21:03:14 -0700 (PDT)
Received: from vertex.localdomain ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-347323f5a7esm10952571eec.15.2026.09.28.21.03.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 21:03:12 -0700 (PDT)
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
Subject: [PATCH v2 2/6] percpu: Bound decrypted storage for all x86 encrypted guests
Date: Tue, 29 Sep 2026 00:02:51 -0400
Message-ID: <20260929040256.543767-3-zack.rusin@broadcom.com>
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

TDX also needs shared per-CPU buffers. Use X86_MEM_ENCRYPT for their
definition and placement, and provide page-aligned boundaries so the
architecture can convert each CPU's whole section before registration.

Define the boundaries in the SMP template or UP data as appropriate.
Drop the unused DECLARE_PER_CPU_DECRYPTED() macro.

Suggested-by: Kiryl Shutsemau <kas@kernel.org>
Link: https://lore.kernel.org/r/aqqGUAX65s4LdJkr@thinkstation
Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
---
 include/asm-generic/vmlinux.lds.h | 12 ++++++++----
 include/linux/percpu-defs.h       |  7 ++-----
 2 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index 64bc2bfdd2ec..145fcdbbe9db 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -368,11 +368,13 @@
 /*
  * .data section
  */
-#if defined(CONFIG_AMD_MEM_ENCRYPT) && !defined(CONFIG_SMP)
+#if defined(CONFIG_X86_MEM_ENCRYPT) && !defined(CONFIG_SMP)
 #define DATA_DECRYPTED							\
 	. = ALIGN(PAGE_SIZE);						\
+	__start_percpu_decrypted = .;					\
 	*(.data..decrypted)						\
-	. = ALIGN(PAGE_SIZE);
+	. = ALIGN(PAGE_SIZE);						\
+	__end_percpu_decrypted = .;
 #else
 #define DATA_DECRYPTED	*(.data..decrypted)
 #endif
@@ -1022,11 +1024,13 @@
  * Note: We use a separate section so that only this section gets
  * decrypted to avoid exposing more than we wish.
  */
-#ifdef CONFIG_AMD_MEM_ENCRYPT
+#if defined(CONFIG_X86_MEM_ENCRYPT) && defined(CONFIG_SMP)
 #define PERCPU_DECRYPTED_SECTION					\
 	. = ALIGN(PAGE_SIZE);						\
+	__start_percpu_decrypted = .;					\
 	*(.data..percpu..decrypted)					\
-	. = ALIGN(PAGE_SIZE);
+	. = ALIGN(PAGE_SIZE);						\
+	__end_percpu_decrypted = .;
 #else
 #define PERCPU_DECRYPTED_SECTION
 #endif
diff --git a/include/linux/percpu-defs.h b/include/linux/percpu-defs.h
index dbe3267a0a13..fdb666a1b4de 100644
--- a/include/linux/percpu-defs.h
+++ b/include/linux/percpu-defs.h
@@ -169,13 +169,10 @@
 	DEFINE_PER_CPU_SECTION(type, name, "..read_mostly")
 
 /*
- * Declaration/definition used for per-CPU variables that should be accessed
+ * Definition used for built-in per-CPU variables that should be accessed
  * as decrypted when memory encryption is enabled in the guest.
  */
-#ifdef CONFIG_AMD_MEM_ENCRYPT
-#define DECLARE_PER_CPU_DECRYPTED(type, name)				\
-	DECLARE_PER_CPU_SECTION(type, name, "..decrypted")
-
+#ifdef CONFIG_X86_MEM_ENCRYPT
 #define DEFINE_PER_CPU_DECRYPTED(type, name)				\
 	DEFINE_PER_CPU_SECTION(type, name, "..decrypted")
 #else
-- 
2.53.0

