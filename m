Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792709451;
	b=Z+MQxykRRMIiubYWa24KDkXJbIjjzjZTbJOWPcaZhAAW7lE2B9pHjZHvZHH34NKcZtP8
	 gWSIJb/6mQsZK10a7p1TauHIzISPyoEh5o/WdWC2XFdEML5jZ8Wx8vE4f99IZg4YRUQLp
	 73FKgSIsnEaZh2cIVcD1U7CTvCKsjNEwN4FULN0gFeqiYZ7ovyONtzW2sRLU0RVY761DV
	 A8gPgNdlQj7ppPQwtDlIzq5grl9QVjosFfh66Z43UCn0uhVW0JknwYAHy9gnF/ZGy+sxJ
	 cV0PLySuDMLMm4mRkPH0Dc28FZfuU3JgOuch6W0o1BxhHI7wU5WLtp8M3/XayaYyw3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792709451;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=QRGmnu+5Eb3jc4pybJnePwOeBfzJdgL5DEYasCwAfpw=;
	b=cm2qn/CsUWyzRQghx6GcGnLxsvaknhPW0X4y+3WZ7onC53eEebq8EeOzD7egL9tyMZKT
	 qSG2795k82QRKnc7R0Xb/B4PsorNCExBSH+ZK++7l1LhPKtPDj0YXHU3tYCaF3Rb9bUn2
	 7rpDvCMLp9F1HYTefa+oEBydwlYNC1URNbNMyB2fT8C8HpSYpoWr9y8TAvLWB5xVrkT6J
	 fQ/Z75369TXQ21uz69UgaxgbuJD5FnW1sWLQt/h2g5HmG7ihwpyVBp/G77ikoqsgFYEet
	 nER13LwOoxdwjPBfn6TwYuFlwJoJMPWhD5EUU/PAjCxbcNwh7kbDewBhDKwno/Xl6sQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=wBdMGCOq;
	arc=none smtp.remote-ip=209.85.214.198
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43E3460A2605
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 22:50:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43E3460A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=wBdMGCOq
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e93e2f72bfso2654325ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 15:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792709443; x=1793314243; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QRGmnu+5Eb3jc4pybJnePwOeBfzJdgL5DEYasCwAfpw=;
        b=wBdMGCOq0S7HE5KtfJ71Gtd27sz+1W4YyyEXfXJ/2FrS88R2aeVM11iK/6nrV/MOeq
         R55y9Y08ucVktB4wJsPjAqpKh9CxdOAVZBYwAXhW/eKV1oKUlteZfEj5jF9113WdNofO
         ITeJFV0Z9geOejFmZCjhYWKDP1RiLt+lQbxJJvQAbMlkhj8d2gJAwLRIdExY6V+QTrmd
         o2amT81UdXHWOUCv9yeVD6Ld18WEa+ZgUgPRaV5A8q8ZFJ67UIq2fQmQJ+WVhzTDwvNr
         4hJQqQmiD4k6id/Y9sBMKrw/e7sgNC/pcBpYEduUNR7qzrbH40R0Uj+1zl35hXAdAy0j
         Du+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792709443; x=1793314243;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QRGmnu+5Eb3jc4pybJnePwOeBfzJdgL5DEYasCwAfpw=;
        b=wHODwOwCc1MnzDvS7kYpDWNMRE2Q1RMhCDonnNoAD6FDgIGPb/De9vQue3x+U/xRtX
         4iy0cZwLt97Tc5CFmoNFlhXQ2y/1zECIweyyHMkLl3jtjJUhQUQWCxCpU+7GNCGucaSi
         n+9drdOIaUpWR1Nlm8dlZwcUeWKzIvpF5GYYi69ypIzHW9xW5aXkXNHW0cZIw/fM+XOT
         t4iKLjpq9X1MzCKShHX72KXcynbO2iufz7eCHxszfSaexkQ57oS+8DLofv49RoFVqZ4S
         qBhp/Eb8rE2CracOgUyUcbatnn6scSFXBcJtdnuynosuol/4GT0FDrW+Of1xcfF31obH
         fvzQ==
X-Forwarded-Encrypted: i=1; AKwUvByZfcCl298anIQZ6p8sTU6zJ5QGZBSC81oyPKsLupYiEfwVh+6lBNRXSbcwG7bHWWIMCjpfU0WJDgHh9FI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKDY3h+5ijmfKpmXzuxjZrFyzcWH2eCt6nX832DkUJOwWCTPISi
	mawLtmqKt7nPtS1de3L8vay8RJuhgYImNNZZkq1YsiA+hBDFK3YUEFDIuI43yO7ySn8XsGurzuP
	vtRv3qEdX0ztrpw==
X-Received: from plpa12.prod.google.com ([2002:a17:902:900c:b0:2e4:8c0e:97db])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:e5c8:b0:2ea:192a:13b8 with SMTP id d9443c01a7336-2ea7d09b8ebmr5151125ad.20.1792709442296;
 Thu, 22 Oct 2026 15:50:42 -0700 (PDT)
Date: Thu, 22 Oct 2026 22:50:30 +0000
In-Reply-To: <20261022225035.377445-1-dmatlack@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261022225035.377445-1-dmatlack@google.com>
X-Mailer: git-send-email 2.56.0.257.gf7497c7d27-goog
Message-ID: <20261022225035.377445-6-dmatlack@google.com>
Subject: [PATCH v2 05/10] liveupdate: Don't WARN if tracking a retrieved file fails
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
of triggering a WARN_ON(). xa_insert() can fail with -ENOMEM, and
userspace can trigger that with LIVEUPDATE_SESSION_RETRIEVE_FD, so
warning about it lets userspace crash systems with panic_on_warn.

The handler has already consumed the preserved state when this happens,
so make the failure permanent. Keep the file until the file set is
finished, like any other retrieved file, so that its resources are not
released before then. Finishing the file set then erases the file from
luo_preserved_files, which does nothing for a file that was never added.

Fixes: 00d0b372374f ("liveupdate: prevent double management of files")
Assisted-by: LLM
Signed-off-by: David Matlack <dmatlack@google.com>
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
2.56.0.257.gf7497c7d27-goog

