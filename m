Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44BAC272803
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 05:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787807944; cv=none; b=sJfsP5rhtRCjewzIoXAh66t5JIOg21ongJiRxzc910DjZ4zk/BePRdIImKvfOHReKGmZ3mpqhFkbmg2Krm9DPZxta2i+lkmpDJlt/J46hAsOdSWdZVtuOW00RukNA0k/a44GF6/fjvrhuXXqIYLFhNpZ5EAb0AIgm3ng//RQEJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787807944; c=relaxed/simple;
	bh=ySnq1R/ZDNIdGAG/P1y4Pm9WQpGs2XBLLe8CXCbhTBY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ADn9W98hsveNmyxoBCjR+X7GRhKclWNV+Jhu2/VBgBgnbL2FjcFGtssO9cATyFiVr1RCTdWKvXjdT8pyqgIsgw2wom23+OGdqTui5gt9ZpaIBKYjHzXDGHqCtufwR2sdk07DiPHFzmxoFUkQ1Aq5zdpuM+WpclaTYYV0haWAMhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SD5Vk8hB; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SD5Vk8hB"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-856114a8247so22210887b3.2
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 22:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787807942; x=1788412742; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NfC3jFJ+7i7b9tWDvNXtk6nuIhDZjOEEiQ4o3HnSEUY=;
        b=SD5Vk8hBEY2zBOnl/IBAt2fXeF//33Rw/4FDXbDDmKAB9S7EtQgaYocJHNR6ek3SGf
         j/nPYStQVhmpNciKnPnpL4M/e0sNY9jUUO3GXM5P76d1AQJ21i0dRrTt34nslf1yPogM
         YjsZuReTdBDBQy4iw4Eitf9w48Hz7RTMShKAvewyJN7FfOSHUMHBZyLQQnlL8LkZNjRH
         02VoKP6cWHKG+DtMFxaUSpLYr4zVJxXWnRODcNywA9kVRBgUPvZoCoI9lu9B94tLahrD
         mym9peiuuGYYKy/22VQW5KoPUu12S9aJGQ0nL1R5GTkKFpjIHwXT+YOD/dkJtFpCvoZs
         WnQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787807942; x=1788412742;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NfC3jFJ+7i7b9tWDvNXtk6nuIhDZjOEEiQ4o3HnSEUY=;
        b=ohRztzXN1xd0zSlF7263YuaHsAeHYaPbUR3LmM3vnbVMkcpqjENZ1dF97t18UYwaoP
         yzQcfeNiX16X1gJOlw0FSFwi76oON3w2C+dXWpcaNZJS7tkElb6sODkJfKQJiOJKI/hQ
         rjmMAYhi9Sdr1LE6YhGne9GrnyCBev8PFU81Be57ipZ4X4xuOPHFC7KsGcvT3q+0ymPk
         qX/1zsCNI5VyHL4hoJa3Ma6fHq7yaHSY2F6iYiJp2AYLZs//soAvMDktRkZv1nLBjz8G
         Ax63gOh8XfaJ8jt1FlRaCmCanIy2aW6/m1NUN62lqM+WvGganQ3Vtq56sv7uLMjSbTq5
         0K7Q==
X-Forwarded-Encrypted: i=1; AHgh+RoZjlvlFDyBfmEL7MRJiSP+ty/UnepqJpBD2b3iFdybeXHfnLXNe9xxNX2Kzp+BPGNUZU8PpIRfki7zYWM=@vger.kernel.org
X-Gm-Message-State: AFuF++k7hNU0qCg9QDLeLz8pk0Ak5uFQu2Qa3Cw29DiI2nVmxOMc0hd/
	dIirRSERvL2+LUwGatm7xecQPqh7c/grrbYoYIKUzjFOsJezD8bnY9y0
X-Gm-Gg: AR+sD13zBCBukpj17xl+3rBkRxUHEjHRrfgNknWcKg9Bzw0ItDvPzWbPfCelc6SzQ4h
	9KluwTHvjlT6q1PkhmnhTMfhlb/GIhogFBYqRlJpRxILb0CwTWiGHiYWmMFCanBJCEwNo6/ug6s
	IidcWtfp8749Zynub7Rodwm5mueX/wfh2J+ba7i7tyes4MC8wj6/Ezu2fiWlcZ1X+cZPSKqJvtl
	AooxC8lbvH3DzuNSM5HPmtVS9wVs83XWku/nNzfrMKkUAvOjWpN3lyY+wHYmGPLiolEUgkdh0EG
	nuBCMedvihrj1D8IW6hpOCmBAz6iNM6MCLbJUpKCXsfCcUxqCvNA6o10DPWfmcBehXZM3oZeVfL
	LnJi9ClIye53fXiLRLUelKm3AcYfGp3l5c6aoWY64mjhwYuaD6QUJFysnTCRAE9I0lHr75/hrrm
	8c6H6fQobIzuuMq4zcwpp4rnAoxscCOrDjcINL3Ut9aRkHCv+FynobxwePBdjuvc0VgejO
X-Received: by 2002:a05:690c:dc9:b0:85b:7fb9:22fa with SMTP id 00721157ae682-85b7fb923admr7057897b3.10.1787807942117;
        Wed, 26 Aug 2026 22:19:02 -0700 (PDT)
Received: from mac.lan ([136.55.173.105])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-85b5bc34f86sm4466367b3.8.2026.08.26.22.19.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 26 Aug 2026 22:19:01 -0700 (PDT)
From: "Cen Zhang (Microsoft Security FORGE Labs)" <blbllhy@gmail.com>
To: ast@kernel.org,
	daniel@iogearbox.net,
	martin.lau@kernel.org
Cc: ameryhung@gmail.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	wangfushuai@baidu.com,
	bestswngs@gmail.com,
	mattbobrowski@google.com,
	kees@kernel.org,
	menglong8.dong@gmail.com,
	bpf@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	AutonomousCodeSecurity@microsoft.com,
	xmei5@asu.edu,
	tgopinath@linux.microsoft.com,
	kys@microsoft.com,
	blbllhy@gmail.com
Subject: [PATCH bpf] bpf: Fix NULL pointer dereference in __bpf_sk_storage_map_seq_show
Date: Thu, 27 Aug 2026 01:18:59 -0400
Message-ID: <20260827051859.45511-1-blbllhy@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Iterating a sk_storage map is two stages:
bpf_sk_storage_map_seq_find_next()
returns a selem, then __bpf_sk_storage_map_seq_show() uses that selem.
__bpf_sk_storage_map_seq_show() re-reads selem->local_storage via
rcu_dereference() with no NULL check. A concurrent close() can run
bpf_selem_unlink_nofail() in between and set that field to NULL, causing
a NULL dereference of sk_storage->owner.

Oops: general protection fault, probably for non-canonical 
   address 0xdffffc0000000011
  net/core/bpf_sk_storage.c:809 __bpf_sk_storage_map_seq_show()
  bpf_seq_read+0x366/0x1120
  vfs_read+0x174/0xa50
  ksys_read+0xfc/0x1d0

Return if the re-read yields NULL.

Fixes: 5d800f87d0a5 ("bpf: Support lockless unlink when freeing map or local storage")
Reported-by: Xiang Mei (Microsoft) <xmei5@asu.edu>
Cc: AutonomousCodeSecurity@microsoft.com
Assisted-by: Copilot (Grok 4.6)
Signed-off-by: Cen Zhang (Microsoft Security FORGE Labs) <blbllhy@gmail.com>
---
 net/core/bpf_sk_storage.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/core/bpf_sk_storage.c b/net/core/bpf_sk_storage.c
index 1d295a8769fa..7228520aa2b6 100644
--- a/net/core/bpf_sk_storage.c
+++ b/net/core/bpf_sk_storage.c
@@ -806,6 +806,8 @@ static int __bpf_sk_storage_map_seq_show(struct seq_file *seq,
 		ctx.map = info->map;
 		if (selem) {
 			sk_storage = rcu_dereference(selem->local_storage);
+			if (!sk_storage)
+				return 0;
 			ctx.sk = sk_storage->owner;
 			ctx.value = SDATA(selem)->data;
 		}
-- 
2.55.0
