Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794552826;
	b=lYMJMJ5TedJ4hBxxBeNiHEhj9oF4MWv/PqoHkgWyoyQfAmIYrgV+1gZlnyGJPCoMNIL4
	 j8KfgFmoul0F9PYu4jvM/IHQjvDQ4MZxapTn4o16PJvNWJ4e3f3YnhrvwAN0AqrF8eVmT
	 grFlNwOMFCZWGEwJmMI1gi1xONa/fssy1msfy+0J6Gj04EMOCtePO+ZIM7M03vtRKM0bR
	 szkN+o48DWYpLn4KWUnCMSKRW3OOL7VSdlPW6eqUG+RE89zgJ2M0CjBTk1B6WBGm2Pauj
	 8Fosj6F3sxyk4mF2r6+0PkvDq0XMGroAvvJer3z4SHcTpudPq347prvz9ob3PODFLhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794552826;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=ZXZy87FYbCuQ3bk0rNuxzYnSFzxorcUKJ7haQiR5YMs=;
	b=Ey6x71O2Kj8IJimJe9XiCGrxj9LBP+d1xlUpscMB5IDF+R+GLiSv3fRPHbhvNfTdGia8
	 +th6KvW7R8vbG8tbB640bvgi/Do5mvl8ec0eM83txDX0EH9RUZHR/gzKxvMZUR3OwQ+cj
	 ThpPdHOya+bDIqw3MbjYTs8NkzOvkgoqZEvtnkUtCHvQz/uxM+aE0isIIGYkOOO8cXCSw
	 GohoOPqjw0YpbeUmJv74BP6Rm11g+z6nrZ8LtOsmcxR/ZDG/8Mxji3+Cqyn6a2rFcKyeD
	 gyNE4pgPyCTB9I3RmMEtqNttJXwkQbPUkknxsnCsIU3cyMgLog8YvStIzRm4ufQeCKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--sarthakkukreti.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=lS8oOqpA;
	arc=none smtp.remote-ip=74.125.82.69
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE617606A8AF
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 06:53:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE617606A8AF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sarthakkukreti.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=lS8oOqpA
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1b3b45597c7so1411207c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 22:53:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794552825; x=1795157625; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZXZy87FYbCuQ3bk0rNuxzYnSFzxorcUKJ7haQiR5YMs=;
        b=lS8oOqpA//DRDpUFWQrKw+3mAjtwA/fBLIesvgdduosASUSrI9iFNndpdGmrM1yLzv
         eYyXrTK0UZbWhZ/MZ+Gz2kpUnkz0FONgiXzXWMZ1Ov1h2FOQpnMAywR7ya7UjR81Qz3D
         yBoDRjqghpQeBA9pSwe7NqEvDzyqa3/rvqmGfnlBmTpFHaKZOx31KePJcsMrI1dFV/YC
         1jscVW0y1p3cmeZ5gBXhGz6VZkpKAPOIV6sFf1XtTZZF3+cb7hl4X2tBHzQPx701FP9Z
         wIs2W5oMrql+LUZkqT56ZH6pPA4AD31ozgbWE1WQM3VW+Yu50ebpRM0r9P2anR1WgDnx
         dmDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794552825; x=1795157625;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZXZy87FYbCuQ3bk0rNuxzYnSFzxorcUKJ7haQiR5YMs=;
        b=AhUaweJR2rvFwByvm5QExm/kEKVQAPCiOiRXLN0q9ue8fiiiD0jUkcJtyFEE2SqfH1
         rp+qpgexeoLM2NMz1sXHWR9yioR9VoI6AsHC2ElQb6TGBr3JmGvK3+416clcpnKv4q+u
         aIWkT+yoEL2uNNtutNPOsASUGcB03xg4ehEQPLA5yywJcm3LniHAVw3M9UkjXZh9kQIr
         hwI+PoUWMBjCF2Vh7ZrAiwM9qUJ4h5yEZPePZESsRZEibmQf2uK0n8aq0I9fotpwgn6/
         HiFRT5UAgcXLS2yfcqkIltnoRSFU2UmoxvFMAEtQvptFp3CG0CqqG7qFnXVxIcu1Thwg
         6QZg==
X-Forwarded-Encrypted: i=1; AL+hErFtOsLUzO0ET8e7lXrz8jZYjpw4/5SOsDSXeIUa9zuI82HaI6LLs0KXaLRKd/6upPW3OBIsRzsA2cmXqD4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9HhFWYvl2f5C+vZ87NFx83hzWYuWQMZdh+999ebZqe65t4MFj9
	x3Rg9qxIgfkWJDsKJwLlMt6OKJSsor4Zdq5mqoprT1Olf3iC2q+qXLtfPoAbOgEufcQgMtZ3Dp2
	4iLBPz99g/utCyqI8UjUSSuA2tQEpi+NDPdNjyA==
X-Received: from dlbrl10.prod.google.com ([2002:a05:7022:f50a:b0:1b2:4b7e:5356])
 (user=sarthakkukreti job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7022:170f:b0:190:8f72:445e with SMTP id a92af1059eb24-1b5030e2d75mr1782938c88.11.1794552824499;
 Thu, 12 Nov 2026 22:53:44 -0800 (PST)
Date: Thu, 12 Nov 2026 22:53:32 -0800
In-Reply-To: <20261113065332.929085-1-sarthakkukreti@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261113065332.929085-1-sarthakkukreti@google.com>
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261113065332.929085-4-sarthakkukreti@google.com>
Subject: [PATCH 3/3] f2fs: reject casefolded names that fold to ".", "..", or empty
From: Sarthak Kukreti <sarthakkukreti@google.com>
To: "Theodore Ts'o" <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>
Cc: Gabriel Krisman Bertazi <krisman@collabora.co.uk>, Eric Biggers <ebiggers@google.com>, 
	Dmitry Torokhov <dtor@google.com>, linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org, 
	linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
	Sarthak Kukreti <sarthakkukreti@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Dmitry Torokhov <dtor@google.com>

Filenames consisting only of ignorable Unicode characters fold to empty
strings, and names with leading dots and ignorable characters can fold
to "." or "..". Allowing such names in casefolded directories can corrupt
directory structure or cause confusion with special entries.

Reject any non-dot names that fold to empty, ".", or ".." during
casefolded name setup, while still allowing invalid UTF-8 sequences to
be handled as opaque byte sequences when strict mode is not enabled.

Fixes: 2c2eb7a300cd ("f2fs: Support case-insensitive file name lookups")
Signed-off-by: Dmitry Torokhov <dtor@google.com>
Signed-off-by: Sarthak Kukreti <sarthakkukreti@google.com>
---
 fs/f2fs/dir.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
index fd0e2cd31a81..a20723edb724 100644
--- a/fs/f2fs/dir.c
+++ b/fs/f2fs/dir.c
@@ -77,13 +77,17 @@ int f2fs_init_casefolded_name(const struct inode *dir,
 
 		len = utf8_casefold(sb->s_encoding, fname->usr_fname,
 				    buf, F2FS_NAME_LEN);
-		if (len <= 0) {
+		if (len < 0) {
 			kmem_cache_free(f2fs_cf_name_slab, buf);
 			if (sb_has_strict_encoding(sb))
 				return -EINVAL;
 			/* fall back to treating name as opaque byte sequence */
 			return 0;
 		}
+		if (len == 0 || name_is_dot_dotdot(buf, len)) {
+			kmem_cache_free(f2fs_cf_name_slab, buf);
+			return -EINVAL;
+		}
 		fname->cf_name.name = buf;
 		fname->cf_name.len = len;
 	}
-- 
2.56.0.611.g1030f0b940-goog

