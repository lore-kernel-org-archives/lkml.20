Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794543018;
	b=svW6P+zoiqMqI+h/zCE4EPc+ZkLlQYolsTOXFvihqWvl0EV4N9hDMJH2sPHMYhNmUnM3
	 0YcV20j8vI1wySVZ0YwQtur4cK2UaeVfrUobZc8ycPGjoszMj/wA5/hmF93yIgfFmm0lo
	 2/qiI7NiPTXg8t4DAQTz49R0Y48oXggHJTHXrqLDBXRrmpMfnBD8AObR9hGdgiWn9mv0+
	 CI9XEpi+W+h20Uad+DHOm2zSYnrrMgk91KjVvld+FOoAcuAS34jLLCBXwkuz7W0F7dBA6
	 ZO1w5K2k34bYs0ltLUVFOxd5sMy0yUOndjzyHiua+zvsF/fyk+rqkDbd7ybNKAlZHyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794543018;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=0dyLUPgXHh//k1rqYdikzfnU/k9m9fgYRI9bsvixd+8=;
	b=wamKKPvri0SMJWwdnJXzsgjGb4YE6S985IyRJ6cg/Y4F0wATAMKfSRuOs4x0CsL7ZamB
	 KLshSnEmTWxvsHJgRk0CW3gXRroMTMDyqP4YM3xwxbas5f31VQ02lvnhptKsjy/+HNd8q
	 NoCMthryKpuQuMQkAcevJ8Ud7ultgplqetHAacrijCiAqY6yg+OIdx42qwhWmcimZ/72a
	 3Jp9aRyz7h/+0gnQL1LHcYhaa0e+tVP5SmO5NEeiOSV6llWZIlOCJ9NfMo576UF7/v3Kg
	 UQiroLBXRp06GWrBog4TxDpx8QjjVmQXqc/v/rw0WD3YSCDWPQWQkXqxROW42l1Sesg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QjXNfSbS;
	arc=none smtp.remote-ip=209.85.222.43
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B82C6606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 04:10:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B82C6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QjXNfSbS
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-97ccbba8e86so153797241.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 20:10:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794543017; x=1795147817; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0dyLUPgXHh//k1rqYdikzfnU/k9m9fgYRI9bsvixd+8=;
        b=QjXNfSbS13b8qDjbXfn41s0luG2rxpNMZqOg6lqF6uM79372tZO59Bg+A2kloOFBIv
         8KeipQAQaLsr6jGHMl07R8XhCQLIosVkLMaEFGccjV9bbQds4XgjjEQMdux/Tw94fdTY
         iHg6MfdsnjPiLmSn2BSQIPwtSiVhUQd5gyIPteFAwhOl5G7Gst5NIR2Tl/cPE4XgKu1o
         fT+CYeQdNqNMRkUOAHMZgbsU5ZnmCDgSpo55WXqnc1tkO6/W6O1U2S9T+Aoma9Wtpby+
         VugPdaGnluQ+Oz4MaSKOgOrHek6RZlxs1WtYTrGbCpfWTdhlZALKJSl3GKKH3qTrT4xP
         h0Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794543017; x=1795147817;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=0dyLUPgXHh//k1rqYdikzfnU/k9m9fgYRI9bsvixd+8=;
        b=jVYY7oNpcD64G0xKjGWj53gZ7CNW2g45QmQ3YEtKLWIUsb9dJjV4+vfQIoI+1fcpss
         8rGXTNLBb9mOoy3dcM5LTUWHu6YkW5iQEsUAYzI/e0La4amAcGGOkfh88iAg3FUj22UC
         aa2102WAd7PZxAnmuEUOzxj0RmhA4EvzpynwhuuZ+T3jRFYeOjnNx6rlwcwb5Q6yKHTV
         oyJA8LKUly8TlVap8AX2G68BYTio0P9ZuUK1tmnq4octJ/bKnWFTcgD4pMJbuYGjUKck
         2hZEK9EdU8OFww7OIsDhZCC0taENTalWyM5XnJgQat1SkUyYjy1e6jTo+HJRukZRciUN
         cHsw==
X-Forwarded-Encrypted: i=1; AL+hErGhV4tUb/OlLI/3aodHtvNuYzmXnKt0VF49LPVIhv3Fk2ShvkopAljaj7hXNFmrLZYss9K9HlhP54KjeiA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8zXfvS16fL6om3qNIA2kPTBWZXouicKYytEh+Oblxfkr1dW2Sj
	0R2COdX4tFm5JCrfjX9MhMFjw45sE7wtCMi1x4NU3zW7Ujw2TJ7kKDNg
X-Gm-Gg: AYBFou0JwRTunxNYtrgMYis4TRSGrjQzAcN9dHVMRZgc0tkrxqL6Hmfv+YkZrzyQaXi
	3y4Y1kPNuJlOl9VmhGEdSPu1sPoM60rCmZgAw5OoasDq6NuzDvDv1bwdVKXOBh1MaZIlXMerFy1
	YOqGVqZ1oEv/RuqFTKycKktZ0CFImmcCHrej4rRmVHi8XeVQ8yW/XOa+DHSqFP8/ZwOrWnK7eYQ
	ASa9nYU8hZZgfKQIu6CfEcV8IJEQJnZ651y3tMsl0iaSZbz2oDQjIRoPdhMT5mVZuoBv/MslaeC
	iMLOe1nQaaV+HJTZXUXq+2VOWcWz1+ylGkaPj0WOuCjG3NS/JtTxSk+sk2g/P+Z4FSE9LHx3lvL
	37yw+vm1xZUddDjMIX04wi2qvkkLF2v8T4jzzXmpRYT7QGGXHhHiCBnfl4YxQMwCIkcBzN6mvXB
	QxzJlLVs0ghG5+HNOg6UYKUmtYOwXCzugIcD1X4U6LJxB79ro0+TEKgYdJ7WJnyGJzgjbe1CIWD
	Pnekbe9m89QCeDWyYy6ucwIxrgjKeNErDoMEBbwTvu80laVlJZN3upAWOzL4qpeqORvYmnGvBlw
	meIKa2oEqbXv8tPEoA==
X-Received: by 2002:a05:6102:604b:b0:7d2:840b:b064 with SMTP id ada2fe7eead31-7d64d47e1a7mr270019137.3.1794543016557;
        Thu, 12 Nov 2026 20:10:16 -0800 (PST)
Received: from [192.168.0.8] ([2a09:bac5:565c:aa::11:1e5])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d64c47fb86sm792188137.6.2026.11.12.20.10.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 20:10:15 -0800 (PST)
From: =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero?= <aleszlucero@gmail.com>
Date: Thu, 12 Nov 2026 22:10:11 -0600
Subject: [PATCH] mm/folio_batch: document missing struct members
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
Message-Id: <20261112-folio-batch-doc-v1-1-e5a1c013e4d6@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MTQqAIBBA4avErBtopB/pKtHCdKyByNCIQLp70
 vJbvJchcRROMFYZIt+SJBwFVFdgN3OsjOKKQTWqJyKFPuwScDGX3dAFi960fmDSbHUHpToje3n
 +4zS/7wfLKgF3YQAAAA==
X-Change-ID: 20261112-folio-batch-doc-fa4f7e18ec85
To: David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Andrew Morton <akpm@linux-foundation.org>, 
 Matthew Wilcox <willy@infradead.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero?= <aleszlucero@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794543013; l=1225;
 i=aleszlucero@gmail.com; s=20261104; h=from:subject:message-id;
 bh=OMAbBXvcemwxXwqU4ezuLdvFSjrFqp0C4mq99sFmFE4=;
 b=yDZIedPEmQr67Ky69DJnIrFX8e3/p9mJnummgDENZMYpyxQ8XE27tvk6nU/6EHyLj9FghMcf6
 blVDfBk9GPOCNDs30cjFrRULD1ACSu2V2en8//kQ1xdW07VpgniI14c
X-Developer-Key: i=aleszlucero@gmail.com; a=ed25519;
 pk=zRzEBMID7l1FXqr2CjfnlIn++3m3N05FuNYb5zPA3cw=

Add missing kernel-doc descriptions for @nr, @i, @percpu_pvec_drained,
and @folios in struct folio_batch to fix warnings.

Signed-off-by: Oscar Alejandro Sánchez Lucero <aleszlucero@gmail.com>
---
 include/linux/folio_batch.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/linux/folio_batch.h b/include/linux/folio_batch.h
index b45946adc50b..7731dcd249a8 100644
--- a/include/linux/folio_batch.h
+++ b/include/linux/folio_batch.h
@@ -18,6 +18,11 @@ struct folio;
 
 /**
  * struct folio_batch - A collection of folios.
+ * @nr: Number of folios currently in the batch.
+ * @i: Index of the next folio to process in folio_batch_next().
+ * @percpu_pvec_drained: Whether the per-CPU deferred LRU queues have already
+ *                       been drained during __folio_batch_release().
+ * @folios: Array of pointers to the folios in the batch.
  *
  * The folio_batch is used to amortise the cost of retrieving and
  * operating on a set of folios.  The order of folios in the batch may be

---
base-commit: 9d66f26fefacebfeed15de31c1123451a17ff119
change-id: 20261112-folio-batch-doc-fa4f7e18ec85

Best regards,
-- 
Oscar Alejandro Sánchez Lucero <aleszlucero@gmail.com>

