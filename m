Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792505246;
	b=TGxNvRbPCoL7QXcLSLpu6sZnoAsKl5Hk2mjDztyo4Jqw0Jn1yDYRJiMwTte7bG9kEwAk
	 lCYSnTr5/0AZV4lXTKSfQWObT54f6WiQo1zTID0S3vUpmVUSUeqqVxIbBYJWP0ZSgDwk2
	 YLExRCIjkA21UtF0KLxJAoE9tsrbWU7rgujz4Z8jEzdfPrzgHM8kLnRymb/iiUBL9tbzx
	 JirJXK/H53DNlen4+TfJXYD6OeIULZXtVPAdxBRbyZDqTk7+YS0Wx0ZJFtc6wnmfKf8vT
	 EV8r//Rcny8Aq2srnWx4EoLeQArQuE+VeluQtFu1PS56aRcsHc0CNqrubJx+cFD90wA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792505246;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=hUv7uf8ufBNBf/i6W9qgwPGx5KWz5jW4iKKV5HAxgy0=;
	b=XWnxfoTQ4VF0RTu85wEeUik/65t9chkV5npbzzTeR4cxINa70CM0xd+A8D/2+a3pLaW7
	 LdEyiB5L14NM6xHaXb4Yc1MjKa3G5Fa3xEb+gFyMZh+UkpMPLAjuG/WaCLScBqaRLepaN
	 fUaG0NaGPIBpNHbc+/FXQVa/RpAY884eZlcfUwJ12kuQhZTptE/8gOl4msDMog9miOQAA
	 IBTRJs7h14wNy355pa9SJ6aDhHh/JoIamrQAhJ0JOlwBDMRS8tsY8Co82IRwopDHSOWaa
	 gLupuBC7xPfqp2IjMNlCQLSilAUyL94wqSX6gW/3aC0LAHOtbeIlHz69QNr7jpDUfig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=RKgmoIyf;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A744260A2626
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 14:07:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A744260A2626
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=RKgmoIyf
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso5453665e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1792505244; x=1793110044; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hUv7uf8ufBNBf/i6W9qgwPGx5KWz5jW4iKKV5HAxgy0=;
        b=RKgmoIyfmeN+1A/ODaqCWjVB7LBKWoUaJ3vU6tbeGRWCdveT9YGfE/A7Ax/gYE196J
         TqjLniQbMy/lWZfRjzdG2a0xn9D1YURb2EIhEbiAhBd+A+l7TUziWm+x7Alixsygt2yM
         CEeHFYI3rflQ9zY90CkeA28esvIjhjHwJpX9040H43k3iXcKizmQ5M+Rp11Og+jKQ9F2
         lFK0AgQ6lQStulC0Uq7TEzak73HxGAkJBw7b1mKZ/LFKiBHUaQsXy/UwUsWn6wyinQ53
         Df+z26BEgxLc8bPXztW93id/wVzZT6RbptXmxsnr/1p0rLjXnVYiKcS9R4jJV2JNfIqy
         n77A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792505244; x=1793110044;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hUv7uf8ufBNBf/i6W9qgwPGx5KWz5jW4iKKV5HAxgy0=;
        b=T8GT060864qHKnoKlH3OX43VUE7RUvQqVE9nigwGhrbgVLKRdsBlTkta5R3dpHJ27N
         kTzLjzn6GElATUn4CzCiyvHBJIAIn46Gfy3Vfqkfd/BZ/ISeDEtGoR461MTxJnw3PHGZ
         tbiXsvCAV0UltyvEHo1GHDRw9jEVzGqzePN8CHUTlldL+Fs0k/suI0fBzrGvML4/rT0R
         6njRbMsGO8+XRg2t5aUTj9E5gyyNQGQnnDZnL30MX8fKhKTKPf+8kKZlhRFNpW68E8XC
         idL7qAXaIlQVvW1CngA/zHJMee/rMaG3LNhGUBGIwl9Kzrkw0KnClDxYTYObRAvgd/j7
         j7Rg==
X-Forwarded-Encrypted: i=1; AKwUvByUT/DE3mpuiausTijbycyK4e84k46axh+hsRW5nf5iJL0aNmUXOLobc8gscqhHCOFD0s7QXjAgnMsIrtI=@vger.kernel.org
X-Gm-Message-State: AFq9FYK7R4jPORNvjdKaQw/Wv7l09hKBpDN372xIp/c8wtsGWMhhZPms
	JujDDIFQAIGL7dflDMKnM2nTnsXlSDemjpkSY692wCGd6UJOO+AnW8YNq1UKC4QW0O8=
X-Gm-Gg: AYBFou0GWXcuRMn490ndRl4DORqQ4kndAMPYjLlk1VRPB7KT/QDzAWr21iDPbjrNh0F
	GmUEYudgDboybKKsrRuvRrlry6nKxOnjuqv5y3D9YwakOsiNAK9ipwzN4bckV6ofqZMJnIcquMO
	KwMa5MfKQWllCirqgXbx4P01uIdYCF+M+vsgd8ddfmmpBfJTZfFbqZuP2pMIB3Y4MSJG64Cge/5
	OR7ytB1tyrzUj3ylVNBpQh7BflptzGGjgZ18qme99wm6tiIoXWs9X9wjFALjbyF/lmLlzFS2uVQ
	hmO+qvF8ubbX0917CWC5ck8wOnfLyTX+DFQMTqqpwhTrY7mYhvDYu95+ruCvrQryHM9taSqqxEw
	oLGES0ukvA9ZXYbi+PlIYaIgrJT8n+vOtcIk36RKS66d9FzmcLKDJsP+J9PwDAnGQYUPmlfdvOT
	+tp7HQpMpivyQAHZ1X6jXgq4QMn5E2nmQcMpV2FUgCRDzh/ntMdL/eT9mIopWMYfzWvjO/295qu
	dV6GPgcqs5GHBb+
X-Received: by 2002:a05:600c:1c19:b0:49f:c5aa:9ef4 with SMTP id 5b1f17b1804b1-4a1f4d81b75mr58480915e9.8.1792505244014;
        Tue, 20 Oct 2026 07:07:24 -0700 (PDT)
Received: from localhost.localdomain ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2ce1479sm75602805e9.14.2026.10.20.07.07.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 07:07:23 -0700 (PDT)
From: Petr Pavlu <petr.pavlu@suse.com>
To: Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>
Cc: Aaron Tomlin <atomlin@atomlin.com>,
	linux-modules@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] module: Fix data race on mod_unload_taint::count
Date: Tue, 20 Oct 2026 16:05:20 +0200
Message-ID: <20261020-taint-unload-v1-2-d1c764889afc@suse.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261020-taint-unload-v1-0-d1c764889afc@suse.com>
References: <20261020-taint-unload-v1-0-d1c764889afc@suse.com>
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

Updates to mod_unload_taint::count are serialized by module_mutex. However,
readers may access this value concurrently with these updates. Since the
counter is a u64, this can result in torn reads on 32-bit architectures.

Fix the issue by changing mod_unload_taint::count to 'unsigned int' and
using WRITE_ONCE()/READ_ONCE() to access it.

Fixes: 99bd9956551b ("module: Introduce module unload taint tracking")
Signed-off-by: Petr Pavlu <petr.pavlu@suse.com>
---
 kernel/module/internal.h |  8 +++++++-
 kernel/module/tracking.c | 12 ++++++++----
 2 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/kernel/module/internal.h b/kernel/module/internal.h
index 061161cc79d9..70ef20b97c84 100644
--- a/kernel/module/internal.h
+++ b/kernel/module/internal.h
@@ -257,7 +257,13 @@ struct mod_unload_taint {
 	struct list_head list;
 	char name[MODULE_NAME_LEN];
 	unsigned long taints;
-	u64 count;
+
+	/*
+	 * Number of times a module with this name and taint combination has
+	 * been unloaded. Updates are serialized by module_mutex and use
+	 * WRITE_ONCE(). Readers that may run concurrently use READ_ONCE().
+	 */
+	unsigned int count;
 };
 
 int try_add_tainted_module(struct module *mod);
diff --git a/kernel/module/tracking.c b/kernel/module/tracking.c
index 5bcd1c2701f0..873fceb30526 100644
--- a/kernel/module/tracking.c
+++ b/kernel/module/tracking.c
@@ -28,7 +28,10 @@ int try_add_tainted_module(struct module *mod)
 				lockdep_is_held(&module_mutex)) {
 		if (!strcmp(mod_taint->name, mod->name) &&
 		    mod_taint->taints == mod->taints) {
-			mod_taint->count++;
+			unsigned int count = mod_taint->count;
+
+			if (count != UINT_MAX)
+				WRITE_ONCE(mod_taint->count, count + 1);
 			goto out;
 		}
 	}
@@ -57,8 +60,8 @@ void print_unloaded_tainted_modules(void)
 
 			l = module_flags_taint(mod_taint->taints, buf);
 			buf[l++] = '\0';
-			pr_cont(" %s(%s):%llu", mod_taint->name, buf,
-				mod_taint->count);
+			pr_cont(" %s(%s):%u", mod_taint->name, buf,
+				READ_ONCE(mod_taint->count));
 		}
 	}
 }
@@ -92,7 +95,8 @@ static int unloaded_tainted_modules_seq_show(struct seq_file *m, void *p)
 	l = module_flags_taint(mod_taint->taints, buf);
 	buf[l++] = '\0';
 
-	seq_printf(m, "%s (%s) %llu", mod_taint->name, buf, mod_taint->count);
+	seq_printf(m, "%s (%s) %u", mod_taint->name, buf,
+		   READ_ONCE(mod_taint->count));
 	seq_puts(m, "\n");
 
 	return 0;

-- 
2.55.0
