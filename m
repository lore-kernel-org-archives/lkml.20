Received: from mail-vk1-f228.google.com (mail-vk1-f228.google.com [209.85.221.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97BDE3B9956
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 05:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789535158; cv=none; b=U9HvKcA5Y8URVh8v57QC6ZOmVrD9++OMUGYjEM0aoHKdDoVtXE8nJVOfU420gb8noE1+xciqGq4qgTGkYSsxWR2vJZjBsgZZukCXzbuoY86/OUU+vy+++vVuv1qFB5fYGQupWXqw/+fb8s148G5zFn2rd6TGKJY8GIvWYJSonzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789535158; c=relaxed/simple;
	bh=LWc2s4qZvBb3TJVfltvRwFaklDcNXyLXGRlUr4C/OwI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jfQLGxRwqPhQ4pj7k4a5GwFkMjx6nBd4XVz1N3rGFxmlHeCs49TGHTncvhuuT4cdcSa+AoDVgpf9oOWz06l8nQrQjfh9KW8Xf1rBm1zZ56eqvL+xj+89x4q5cb8TUQh7OyIhsYRwbz9b0koomdtSTYXVeUfbmqN3Gh00BiLjvuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=AgIxbS4l; arc=none smtp.client-ip=209.85.221.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="AgIxbS4l"
Received: by mail-vk1-f228.google.com with SMTP id 71dfb90a1353d-5c847eaa0aaso684715e0c.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 22:05:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789535155; x=1790139955;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6awU6L1NSAdZve1Go4DAFmiBVEoVbQdcfNtuUS9ma4s=;
        b=qCm6cJ9BE3o1PogY94WgdiZLVqh5sVw0cJbXyjm6s1I5yDtZ6rutuN+hAAge7sURI3
         Qt3HqvjBkE80+6WRlECsZEnVZpw8YyXgOT2mEArbB/uF7CdXk1DJYC80YpVbztZN7lWY
         H7HZQQVtjjRTXeoQTcUIl6sIrT3QIsT7leqddbpRgAJ+QmNVp5IYVC33z1vjdsI/it0g
         PEtIg8nLSPhw2geQAwgpCYwWXmRFrgNloRtsVI7L+J8GXIaIu+xhUzFqIbsAFgFTlo6t
         aMROZm4X7ljHtSQKlR+jHIjUifpnNDnQ8AflJwyWDIl8BX8mExk19roywvHqurediSY4
         lrLw==
X-Forwarded-Encrypted: i=1; AKwUvByVb8J3mZqjHea6g76qOtplZ6VDUoOd0ZNOBA4fFScJeKabDyJWZ3fjmSooYtJLwddlZnAQ3kMWc2+p9To=@vger.kernel.org
X-Gm-Message-State: AFuF++ku/bpNpLzfbwSJH5c3V7XLg3Rloiuysgru1OiVg1aUarsLeRwZ
	MK9asSsNdr+VroeirQRd6CE48DjdO28+kFFN25+gSV4O2ZkxIQwV9qZGtTkr99o0yVztXsmbZFf
	pOdC+bptkxIySRdQwC25rbknkBWDawF2CYFmGix3zJw/N0JzGMg2vJUqCgkVDz1l48InRkf4W0p
	tUOjZQDnbHr9whgAx2bU8Gg1imkqwjirjmACMnvDpQUNpdGXi8+wzCxs7bl2XXcaBcfOFXeLkRf
	AZVM+eiTJkTAhnp
X-Gm-Gg: AYBFou2/StuMh6V6mr3kD3dyDqN7ubU7LrYwojjADA/vZGG7Aup00MXQ4fkidzEhvLQ
	dEoFxyv2Z9naCXuUbuo3GMOya4mTJAdPxQ0KBYZghqibfcJd4OihHd0VMckk8I9pOsAnT9cuhLa
	VhZdn2FtX1VRBcogadfq33ed+sWp3CNe0J6iRZd8ePkiRi8Fqohu4gIZ8CDQ/353syvvTN5sH/W
	eBflvLaq78A3EC2Om/rwHb62cJoxxNIY5lx8ywl0DtW5o2ab8ZTszaDv09xQ+vZcLTdi9dDhbLw
	2gYG06xyjd2iPreOcqgXvWdvwqyyR98NV9zcbblt2iAJUkX5WzHWCj4Gn7bxFSauGx/J7oXwvgQ
	DUC780zTKspDECSvF8esTFRD8RgFJYj+LXfFnOtmA0+EycK9yCBccx3I8NAD4eCrGclOty0Zmui
	X6/3njqjT151Znao5pi0lRDfmDtWa3QDO0
X-Received: by 2002:a05:6122:786:b0:5bc:42be:f758 with SMTP id 71dfb90a1353d-5c99ac5f757mr933546e0c.3.1789535155282;
        Tue, 15 Sep 2026 22:05:55 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-98.dlp.protect.broadcom.com. [144.49.247.98])
        by smtp-relay.gmail.com with ESMTPS id 71dfb90a1353d-5c9988d02casm696570e0c.2.2026.09.15.22.05.54
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Sep 2026 22:05:55 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c89704da8c7so7022242a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 22:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1789535154; x=1790139954; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6awU6L1NSAdZve1Go4DAFmiBVEoVbQdcfNtuUS9ma4s=;
        b=AgIxbS4l+sMGzOQKUymNIgMNamCZBEsk5FlD0p+PGzS5LljSWOGjmA8Qbd3KpX/tGK
         Ga9JsNwG9oSpFcbKpB7z/4M7GGHaU04iUlAhCCTyIFsJLRXbRZ7XHhtNcme5T5sNuCN0
         +CiXxYnC2nhU2Cy2+vrjWZjf/EgUCPiN6Zb9I=
X-Forwarded-Encrypted: i=1; AKwUvBzqwPbypMU+0LAIscez0lOPw4cAzn7jyzaOFPE5jOo74RvbAUUIBt+LcW8QFaOvpr19yxdc3ohs7zOWr54=@vger.kernel.org
X-Received: by 2002:a05:6a20:4388:b0:3cc:8f53:26c0 with SMTP id adf61e73a8af0-3dd5f57bbfamr2773496637.17.1789535153993;
        Tue, 15 Sep 2026 22:05:53 -0700 (PDT)
X-Received: by 2002:a05:6a20:4388:b0:3cc:8f53:26c0 with SMTP id adf61e73a8af0-3dd5f57bbfamr2773437637.17.1789535153567;
        Tue, 15 Sep 2026 22:05:53 -0700 (PDT)
Received: from vertex.localdomain ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5e40494sm3951386eec.15.2026.09.15.22.05.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 22:05:52 -0700 (PDT)
From: Zack Rusin <zack.rusin@broadcom.com>
To: Borislav Petkov <bp@alien8.de>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>,
	x86@kernel.org,
	Dennis Zhou <dennis@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Kiryl Shutsemau <kas@kernel.org>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	virtualization@lists.linux.dev,
	bcm-kernel-feedback-list@broadcom.com,
	linux-kernel@vger.kernel.org,
	Christoph Lameter <cl@gentwo.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Bo Gan <bo.gan@broadcom.com>,
	linux-mm@kvack.org,
	linux-arch@vger.kernel.org,
	linux-coco@lists.linux.dev,
	kvm@vger.kernel.org,
	Zack Rusin <zack.rusin@broadcom.com>
Subject: [PATCH v1 1/2] percpu: Use X86_MEM_ENCRYPT for decrypted per-CPU data
Date: Wed, 16 Sep 2026 01:05:39 -0400
Message-ID: <07cdda86e2c60b27a18023e2e5fae339b78db0ab.1789488039.git.zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1789488039.git.zack.rusin@broadcom.com>
References: <cover.1789488039.git.zack.rusin@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Decrypted per-CPU data is gated by AMD_MEM_ENCRYPT. With
INTEL_TDX_GUEST=y and AMD_MEM_ENCRYPT=n it falls back to ordinary
per-CPU storage, so converting a variable to shared memory can expose
unrelated data on the same page.

Gate the declarations and linker section on X86_MEM_ENCRYPT, which both
AMD_MEM_ENCRYPT and INTEL_TDX_GUEST select. Existing AMD configurations
are unchanged.

Keep the decrypted subsection page-aligned at both ends. The per-CPU
template and each allocated per-CPU unit are also page-aligned, so page
conversion cannot expose ordinary per-CPU data. TDX-only configurations
may need additional space for this alignment and isolation.

Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
---
 include/asm-generic/vmlinux.lds.h | 2 +-
 include/linux/percpu-defs.h       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index b2988aa12f66..1448e791773e 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -1013,7 +1013,7 @@
  * Note: We use a separate section so that only this section gets
  * decrypted to avoid exposing more than we wish.
  */
-#ifdef CONFIG_AMD_MEM_ENCRYPT
+#ifdef CONFIG_X86_MEM_ENCRYPT
 #define PERCPU_DECRYPTED_SECTION					\
 	. = ALIGN(PAGE_SIZE);						\
 	*(.data..percpu..decrypted)					\
diff --git a/include/linux/percpu-defs.h b/include/linux/percpu-defs.h
index dbe3267a0a13..54ce1442d918 100644
--- a/include/linux/percpu-defs.h
+++ b/include/linux/percpu-defs.h
@@ -172,7 +172,7 @@
  * Declaration/definition used for per-CPU variables that should be accessed
  * as decrypted when memory encryption is enabled in the guest.
  */
-#ifdef CONFIG_AMD_MEM_ENCRYPT
+#ifdef CONFIG_X86_MEM_ENCRYPT
 #define DECLARE_PER_CPU_DECRYPTED(type, name)				\
 	DECLARE_PER_CPU_SECTION(type, name, "..decrypted")
 
-- 
2.53.0

