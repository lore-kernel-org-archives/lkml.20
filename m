Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793667750;
	b=xvhrRWVvbHroA42t/eqx+3Qh7rPc3Z4NiaqZTOlyUDQ60D2FeVJIWrekD5oKsVALTcoP
	 b3IOMp1YQj89krlVO4lF9fzS57/wBfTacE9GfFGwYgdrND/vWs6ZlsIxbh456juh71T9V
	 eUGs0KOKAtAiFGM0oJkHI5Dl7mIDP/oGwG0GXfs/PVsKxlnQJGOssiLVywwPbYh3MZ2/l
	 Y96yrn0vG8RBY5mR3Zfeckl2YmeA+3xnSfGsaE7n2r5U3QB55vFEE7E2HI4UwYLqSzmi5
	 30/avrdON1L2/VIst4BKabKv727zaUjk9dt2x/t/KnUCXr1P5CYqq0JrYzsadc2J05g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793667750;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=Pqlok/L90zyySLepqQOJQncJ0sDMJpbHVdvROaPHHJ8=;
	b=byWweuc/2WzfKTM3dsbtA8HOL9uzT23rep3wOemUWILpQkJ2Q+WNWsncvGpv44mV1aWF
	 906XzZ2pFNHP1VAwRnVMqatvweY9jYtM7Uxvvv8+H8meX1ADXthPeV1WMKGJRXdy/cjFo
	 BV/O22p3SPYMOWqV0IhXdk14OB5+RLdSbEYXJ+YaDFgQaS6yR9JFV36fxyHtp+cadxlgK
	 L9lQ3ndsR0+07XGoxRJR3xtvbSB421tdzDs5PDCDYIquBURzBKxjA/X5FrwQsjyolhg5e
	 XGFi5nCQKwTb+lGm8X/iEt9sb9EGqF0YPv/oFebN2opxoioPAfhXdAkcIX+Sa17UIjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gc3iPP3H;
	arc=none smtp.remote-ip=209.85.214.198
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5468606D82E
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 01:02:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5468606D82E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gc3iPP3H
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e987ec84afso30495045ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 17:02:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793667749; x=1794272549; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pqlok/L90zyySLepqQOJQncJ0sDMJpbHVdvROaPHHJ8=;
        b=gc3iPP3HUMm13tANsNJ2kw++s9XvPLqovkanTm98Od5BUFSIBLqZVaaz5z9ITpM1ex
         vVdLEURE8rZhhtpjpZaRufWZU3pGcbz3d7NhmFtOVZ7ajoBZTZhfJFijmxUJKPcwpecW
         udEF1wU8cFx8KGzSJH5+mvo+f8ZV0pYmQQVZlCsOGOq4ZSm7OsEK+IMB/xS0tA6VdypN
         svfjG2EG4V8tbk2vxk8NTI+EZD2XjlumPFMQng5nvAnyJBkX8KZIPCzG1b93rEMdX22B
         Cf5jvdT/T9jiVhtw9alV/EKd2S/8AmsHXQG1ln/uxEgabRmLHv0WAJp8k7NezpnfEvhN
         SZ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793667749; x=1794272549;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pqlok/L90zyySLepqQOJQncJ0sDMJpbHVdvROaPHHJ8=;
        b=Kv2bkJ0MRMJaJ45y8xKSKWkc/QDnN/oG/gFw2usvon8XSMgGSA7hBK1tuvIaicPDRr
         qKNnuikevs7GSBbaWFLmF7CiLFrOvSMPbMB0l/+3YqasG+hHdtuc4IaI7ysoBNTneliT
         uZU2zHBYVB3kBqjNenhOGpZ4PdXoSzHJ0i/W9lbPEhfh8NYSZqUIzGwvk2QYl/AsKkCH
         SfBrEIAwbWcIJ9jDELjy4D0u3wygP1eXfy9PARhL6TslfT1LdvfiVeCxaGXKS4g9FM8I
         vysT9AEZLhc9YSLTV1pC15bnIRom03w833yxHODlzaN10h1/Npa29MF61IldjpmpjReA
         C2mg==
X-Forwarded-Encrypted: i=1; AKwUvBx1iHNM+crTiG5e9IeEbub1DhpaKrzaOTdeUkOaorykKjgrmM2rM5j6wyDDt9HdNqcgjtiNZzxVEd8R5mU=@vger.kernel.org
X-Gm-Message-State: APuU4Z832rN+FKxLUpU85kDQkFjmy4mNJRquyz2xHAZWjvwBx2t9D00V
	6slAajxgnl2BSZLevWf7gAGzKQQB7HtgR8+Z843UNr4Vd6uod4ITgLtfIWQemsJVprBXk/lFPTp
	+YpI91wJrEHo09w==
X-Received: from plru1.prod.google.com ([2002:a17:902:b281:b0:2e8:f377:a4d4])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:1ace:b0:2e9:5714:6079 with SMTP id d9443c01a7336-2eb3643f7e5mr119975855ad.31.1793667748954;
 Mon, 02 Nov 2026 17:02:28 -0800 (PST)
Date: Tue,  3 Nov 2026 01:02:11 +0000
In-Reply-To: <20261103010216.3447716-1-dmatlack@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261103010216.3447716-1-dmatlack@google.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261103010216.3447716-6-dmatlack@google.com>
Subject: [PATCH v3 05/10] liveupdate: Don't WARN if tracking a retrieved file fails
From: David Matlack <dmatlack@google.com>
To: kexec@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org
Cc: Alexander Graf <graf@amazon.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Christian Brauner <brauner@kernel.org>, 
	David Hildenbrand <david@kernel.org>, Hugh Dickins <hughd@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	"Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, Michal Hocko <mhocko@suse.com>, 
	Mike Rapoport <rppt@kernel.org>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Samiullah Khawaja <skhawaja@google.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@kernel.org>, 
	David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="UTF-8"

Handle a failure to add a retrieved file to luo_preserved_files instead
of triggering a WARN_ON(). Make the failure permanent, and keep the file
until the file set is finished, like any other retrieved file.

xa_insert() can fail with -ENOMEM, and userspace can trigger that with
LIVEUPDATE_SESSION_RETRIEVE_FD, so warning about it lets userspace crash
systems with panic_on_warn.

The handler has already consumed the preserved state when this happens,
so the retrieve can't be retried. Keeping the file ensures that its
resources are not released before the file set is finished. Finishing
the file set then erases the file from luo_preserved_files, which does
nothing for a file that was never added.

Fixes: 00d0b372374f ("liveupdate: prevent double management of files")
Signed-off-by: David Matlack <dmatlack@google.com>
Acked-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 kernel/liveupdate/luo_file.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/kernel/liveupdate/luo_file.c b/kernel/liveupdate/luo_file.c
index 908ae124ea5e..5a82e45b9062 100644
--- a/kernel/liveupdate/luo_file.c
+++ b/kernel/liveupdate/luo_file.c
@@ -684,14 +684,25 @@ int luo_retrieve_file(struct luo_file_set *file_set, u64 token, u64 arg,
 		return err;
 	}
 
+	err = xa_insert(&luo_preserved_files,
+			luo_get_id(luo_file->fh, args.file), args.file,
+			GFP_KERNEL);
+	if (err) {
+		/*
+		 * The handler has consumed the preserved state, so the retrieve
+		 * can't be retried. Keep the file until the file set is
+		 * finished, so that its resources are released at the same
+		 * time as those of other retrieved files.
+		 */
+		luo_file->file = args.file;
+		luo_file->retrieve_status = err;
+		return err;
+	}
+
 	luo_file->file = args.file;
 	/* Get reference so we can keep this file in LUO until finish */
 	get_file(luo_file->file);
 
-	WARN_ON(xa_insert(&luo_preserved_files,
-			  luo_get_id(luo_file->fh, luo_file->file),
-			  luo_file->file, GFP_KERNEL));
-
 	*filep = luo_file->file;
 	luo_file->retrieve_status = 1;
 
-- 
2.56.0.385.gac671c819a-goog

