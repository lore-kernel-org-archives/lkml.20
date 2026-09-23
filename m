Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D244D45D5C4
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 07:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790149782; cv=none; b=dGghOl4MTVK0gzGJs++SH3xeid9OG/Il115NdXKYJI8A/2T8DkMy0ZYIuJp8LKmqxFhH5wqD9S0vAWsxoLembwDEbyVWfSnbwFRSri7m29qkLBuwJzcW6m6INFNG9YsOJ31RcnSWHvqAeAfbiZbXr9STgozuJO/31NngJ5LUJUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790149782; c=relaxed/simple;
	bh=x1EO1t+RhKNeTSsJq6ZLnxGbgzYj7ObuT+4PdV8PdPs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d/LBbi6fcRTZRZa1jW925g0rVxo+UF7i5V4NF+OvtrS88FRE1G83RklMrUyljRMw5U08zbvHs/XLnN5nrkggtHXVCS/PgZZft05bgCWKKSsEKgMMY7uPskcGstD4fhaiPnBdKf/rY4Zove1J53U55ndy/loZ2kR6OZYbbTSYRP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E1Ao9z2v; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E1Ao9z2v"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254fa663bfso92933366b.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 00:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790149776; x=1790754576; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jgp+ZrcyR2hZuyp2AvG7ZUXVguQdflnbvJs857sicKc=;
        b=E1Ao9z2vHp1r7M2uqh+YkOjFPoiVDGg18ym4TRyYXszviGJuWGRj/PFG56sP5OpEmA
         RjDE2Hha1XGocy69q414mvVmsl+j3E3+fiImx/UjYwDC2KNGn5TyC6w1X8TwstfoeG8T
         2YdAV7IdBK2Mzr4D28bnksiMqXLl1gGey8AGpaKBdwqD4FKXQBVQNIEjnlv+geAOmWl8
         zqGp/cZcx1EChlOMGEYISVJ3J2StBqZ1V0gPfhFeAhSAOvSQxbTHE7qY6ONOwHOuNWBX
         Nh0ZNNF/Jf/W+J8hE9UE0ywqJtSdpkfUz70AxryVc/cVHOZAsB2r00PwoGfXqS/VrrYp
         wtUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790149776; x=1790754576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jgp+ZrcyR2hZuyp2AvG7ZUXVguQdflnbvJs857sicKc=;
        b=2397G8xdm4ZlZKgZvxcKm+UeNs2AnoJ9uVHMkXiJNRG8ElYOcxQAzU07o3JAN9+lBn
         TRnLFYyqZoWDCSy/cXmSje7yf8N6QNWCOj9KE2vJ1jpmHMPql9MDi3y68opP7aebOTS6
         Jz5EMaOeWhd8/Ef+dVlH5lDeHPmUzLbEwn2Uso1P3exHdgiuZMafF2faKB84w+t9aPAW
         Wuy26F+2ddKQ6ma91LPi8tOewuDvC0JOs2d5IyukPCJXvQ5zIXimDqsHlGhCI++DFanr
         eMZyFdYsMzjBNMu7RfpUc3W5YOBpl/pmJv6NLMS9CyrXioDiXLoUXofb2n6sm0StA4sj
         JFkQ==
X-Forwarded-Encrypted: i=1; AKwUvBwF1u7dfQLWgE1r7lG9q7jxfD858OpChjNzX01JntJoOupKm5yDkfrBq8k555evSz/NenKYSe88ntCAkyE=@vger.kernel.org
X-Gm-Message-State: AFuF++nOrZAzClM064gEpG0cmEZ6hMzbHpTd6gydG9L+ykPQXbKyRbq2
	s6lxKJeMysLmj6AAO2m9X2h0EdULK50exCB0DI9k+lBInQSvjon2aC5He1K8lO79
X-Gm-Gg: AYBFou3d5edYGDtG9/hc13PqhgVsJFfL0NY94+ltqocdwsYEHrBHDsTJBCHxAhrcBUj
	byiC+kWD68NKyjZzDpIkWk8V1ZlDk+SCAr1r+asfIcD61zByWxPq8ybrLDP+3QGgCIHvWibwszP
	uxqaXYKtLso4t+Udmxbq1cS3okpI5pOpFjVeuOqemI5YNvAH3mp/6OZU59TZHTkqMjPnJpdMBEr
	glLrhg1etFx4+A3UoYtlo/Fd+V1Cve/cspfUVG16ISODMv/Tyqa4YJ68BNwjQf/3xPBAZQx2oNc
	vuxTEBvwex4oONHeg8nWHJhVEBRa9Qn+mVg6t1PywocwXEqbME/35KoWss9BnilawDbHjhpv72k
	n7VG093tbqqjkGy3Q21O2owwg+VwWpKcG1XfKIYe1A5O7msygUF5OiSFwiU2/nRW3ZOaq+HIWk2
	W+iFxkUr2a6cNKz5cwFhl4NYASHp8hMU819VrYOvXw8XNU+JogSm8FAVR5vtKAT5uP7FCVI6O1t
	0RM7N3DZa0cetf/uE/RzNwxrYIj0nzBvA2NwnM3
X-Received: by 2002:a17:907:3e8c:b0:c29:f5d5:5a96 with SMTP id a640c23a62f3a-c2aae1d27damr126462866b.32.1790149776099;
        Wed, 23 Sep 2026 00:49:36 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae5c6f5asm64951366b.15.2026.09.23.00.49.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 00:49:35 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH v3 7/7] alpha: invalidate the local context in flush_icache_user_page()
Date: Wed, 23 Sep 2026 09:47:50 +0200
Message-ID: <20260923074903.862898-8-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260923074903.862898-1-linmag7@gmail.com>
References: <20260923074903.862898-1-linmag7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

flush_icache_user_page() has the same caller-CPU omission that the
previous patch fixed in flush_tlb_mm(): when the target mm is not the
calling CPU's active_mm nothing happens locally, and smp_call_function()
handles only the other CPUs, so this CPU may later reuse the old ASN
together with the translations it still holds.

This matters here in particular because the function exists for
operating on another process's mappings: the comment above it describes
setting breakpoints through ptrace, and access_remote_vm() reaches it
through copy_to_user_page(). The calling CPU is therefore often running
something other than the target mm.

As in flush_tlb_mm(), the uniprocessor implementation in
asm/cacheflush.h already has the missing case.

No imb() is needed, here or in ipi_flush_icache_page(). Alpha's
user-space I-cache flush works by allocating a new ASN rather than by
invalidating the I-cache: the entries stay, but they are tagged with the
old ASN and can no longer match. An imb() is only required when the ASN
space wraps and numbers are reused, and __get_new_mm_context() already
does one in that case.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/alpha/kernel/smp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/alpha/kernel/smp.c b/arch/alpha/kernel/smp.c
index 988e397b0b8a..e21bc3920bec 100644
--- a/arch/alpha/kernel/smp.c
+++ b/arch/alpha/kernel/smp.c
@@ -758,6 +758,9 @@ flush_icache_user_page(struct vm_area_struct *vma, struct page *page,
 			preempt_enable();
 			return;
 		}
+	} else {
+		/* smp_call_function() does not call back into this CPU.  */
+		flush_tlb_other(mm);
 	}
 
 	smp_call_function(ipi_flush_icache_page, mm, 1);
-- 
2.43.0

