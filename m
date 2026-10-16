Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84D5A331A43
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792121599; cv=none; b=mosk1kQVrMwcyA/e8oJpFQ2c2n4z61jAbA/gJuMkINVslAv0BSvHmkRkUykbeM5SK/VvX3L9B4EG7DSHsvHDPI8Okfx4tfX5TTBgRYFjs+foa4oeWoePc4jHey3FnS025fsSQIhteUSbNngQBZ9JTp/HcKFB+DtqRmBHzD00CaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792121599; c=relaxed/simple;
	bh=DHdWukh4h7IvkZHXqIQiUR/IkL+1dqHZgnn7QdLDFkI=;
	h=Message-ID:Content-Type:MIME-Version:From:To:Cc:Date:Subject; b=rTMqE9cJSTVXv4YvtgqMu5EbBJboDQLRy4XV0fFiA10HH0sIVDN0t7EPzkLxCmCatGjiKtzVvBQZxg66URsrqslyfx/24YxuFiLTNB9tjIVeiMuUZDPiCtEfW1b+r7gH5VWYKOMWpsFhx/WurAtbc5IKnbJ1gkDhQM3mpOmbXFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GADB8XMY; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GADB8XMY"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3a4cdc9025bso3387196a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 20:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792121598; x=1792726398; darn=vger.kernel.org;
        h=subject:date:cc:to:from:content-transfer-encoding:mime-version
         :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DHdWukh4h7IvkZHXqIQiUR/IkL+1dqHZgnn7QdLDFkI=;
        b=GADB8XMYA5/1SyF+O0r6Lk7t5UNsnS9UNnfvtbODPgLIWQ6Caf0HBV9v7RhCYsg+Wu
         UxB5jOSj3F8nSouUe7fZZ4gIFSsGhG+qfEUE07TveKwJwkIZk6RN1/W3E7cWRY9LarLi
         /37fXvBSr220wX/8sxA7ISTH8fPiqqHUG9tNO/fCMF5JeLKNzYBixOIS7tZiA1e+XG1e
         9UTyFZdAlWlfVvSpBCUCH1Hwr/DaGhn4zPkjNrQzX7CD5bHBnpPKbbpr/saGmEHSQBPQ
         MRDB2Tt+LMgGDAJ408bZchDTHWRapp4A9zB4ApGiXTYYer/wCJB8slA4N/3lkT/iUO/F
         pQuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792121598; x=1792726398;
        h=subject:date:cc:to:from:content-transfer-encoding:mime-version
         :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DHdWukh4h7IvkZHXqIQiUR/IkL+1dqHZgnn7QdLDFkI=;
        b=zdZxdXisa0pJ1QpGf4M09C9VDdA+Fo6EMVY5pwG1KpQXylQbmrmdp5oxflz6+j6CpG
         tgNNUjWr4xiz8th4/A1hhj7GyMI0E9HKoWQK57MqsisKK4ohjLu9L4zSas9ChEU34wWa
         Y5h5YdljuTmr8eFFE41Yqg6rlGPr0AaAXxzKEPQdPTAaErRRDBfvIY5m4SZZCPZElwoQ
         7zwV7kocTFDd+4bYQAOr+4O8yqZbd0LF/AhB3Ayhgv9fpy9cxjWv/m2Oq5fvz7KpT82A
         guFw1sYUN2eo4IOjHotIXn2n1ioiUvBFhDuDcXXNd9HvIFlzO9T+EmsKnWMF41owrMNA
         02sw==
X-Gm-Message-State: AFq9FYK12hK1vQ/TED3diwcOB/OkvHJDimeaywrJ9PnNpPZHJZsWZZqb
	3Wz5f+N3Z2tkI7jaIwd8n1piu7/GXn87CpuneFYoSQeesIrgGWOYnIhb
X-Gm-Gg: AYBFou16MHNCdvjSZt4QFKISpxFusgOh/5exu2iSI+Al1b6sxWyLS23QKcMF3nDx6ON
	W14/AvpYoQJz44+At4nW8I0Dwwcr6qGRkRHPvV7fQ1cfSFaXhcbnIgv33lt0tDaisrfukUZat3D
	EiOSGmMd9Fmj8xGCiCk5ZJXhrmh7d442G8CYtH9aU7MrtcBHOhgapOlwXWxYTtzcKj9doyR3VEx
	sMNj0j3FatCj4gzXloxr3+cJ5bip1A5EkP8eMXUX1wul4s4DZSNrE3hCE30LuPUXx9tlM5hoBMh
	L0zEuNKsr7QxdcrbGWVA1rTOlOMFKT6a8706E9YABLCETd08GoYaAfBbt+GFCW46/Cj3ZBWYhQ7
	FrpAyBMN18dzKkiCKqpxO6L80GUwWoref4daQKSFbi13kU2avysj9SgW4ObO7QQ7SeLiRph3RdL
	vAkKD6zpKSFWyMMuxwHL4up01QYxiFcSZumG/Gv3rAfxV+yvRVnyKCbBJTVchQe6GXnzCbOWB1w
	IdZYw==
X-Received: by 2002:a17:90b:2ecc:b0:3ac:b3e5:426a with SMTP id 98e67ed59e1d1-3acb3e54485mr2244561a91.4.1792121597779;
        Thu, 15 Oct 2026 20:33:17 -0700 (PDT)
Received: from [58.206.202.11] ([104.28.215.69])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc487cccdsm1950630a91.8.2026.10.15.20.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 20:33:17 -0700 (PDT)
Message-ID: <6ad19afd.a938ce27.16851e.3440@mx.google.com>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: base64
From: Haoran Wang <haoranwangsec@gmail.com>
To: rostedt@goodmis.org, mhiramat@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, mathieu.desnoyers@efficios.com, haoranwangsec@gmail.com
Date: Fri, 16 Oct 2026 11:33:13 +0800
Subject: [PATCH] tracing/syscalls: use copy_from_user for the faultable syscall buffer

RnJvbSAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBIYW9yYW4gV2FuZyA8aGFvcmFud2FuZ3NlY0BnbWFpbC5jb20+
CkRhdGU6IFRodSwgMTYgT2N0IDIwMjYgMTA6MDA6MDAgKzA4MDAKU3ViamVjdDogW1BBVENIXSB0
cmFjaW5nL3N5c2NhbGxzOiB1c2UgY29weV9mcm9tX3VzZXIgZm9yIHRoZSBmYXVsdGFibGUgc3lz
Y2FsbCBidWZmZXIKCnN5c2NhbGxfY29weV91c2VyX2FycmF5KCkgY29waWVzIHRoZSBidWZmZXIg
YXJndW1lbnQgb2YgZmF1bHRhYmxlCnN5c2NhbGxzICh3cml0ZSwgcHdyaXRlNjQsIC4uLikgd2l0
aCBfX2NvcHlfZnJvbV91c2VyKCksIHdoaWNoIHNraXBzCmFjY2Vzc19vaygpLiBVc2UgY29weV9m
cm9tX3VzZXIoKSBpbnN0ZWFkIHNvIGEgbm9uLXVzZXIgYWRkcmVzcyBpcwpyZWplY3RlZCBhbmQg
dGhlIGVudHJ5IGlzIHJlY29yZGVkIGFzIGZhdWx0ZWQuCgpJdCBjb3VsZCBiZSBhIHNlY3VyaXR5
IGNvbmNlcm4gZm9yIG1hY2hpbmVzIHRoYXQgdHJ1c3QgcGVyZiBhIGJpdCB0b28KbXVjaC4KClNp
Z25lZC1vZmYtYnk6IEhhb3JhbiBXYW5nIDxoYW9yYW53YW5nc2VjQGdtYWlsLmNvbT4KLS0tCiBr
ZXJuZWwvdHJhY2UvdHJhY2Vfc3lzY2FsbHMuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2tlcm5lbC90cmFjZS90cmFj
ZV9zeXNjYWxscy5jIGIva2VybmVsL3RyYWNlL3RyYWNlX3N5c2NhbGxzLmMKLS0tIGEva2VybmVs
L3RyYWNlL3RyYWNlX3N5c2NhbGxzLmMKKysrIGIva2VybmVsL3RyYWNlL3RyYWNlX3N5c2NhbGxz
LmMKQEAgLTY4Miw3ICs2ODIsNyBAQAogCiAJZm9yIChpbnQgaSA9IDA7IGkgPCBhcmdzLT51YXJn
czsgaSsrLCBidWYgKz0gU1lTQ0FMTF9GQVVMVF9BUkdfU1opIHsKIAkJcHRyID0gKGNoYXIgX191
c2VyICopYXJncy0+cHRyX2FycmF5W2ldOwotCQlyZXQgPSBfX2NvcHlfZnJvbV91c2VyKGJ1Ziwg
cHRyLCBzaXplKTsKKwkJcmV0ID0gY29weV9mcm9tX3VzZXIoYnVmLCBwdHIsIHNpemUpOwogCQlh
cmdzLT5yZWFkW2ldID0gcmV0ID8gLTEgOiBzaXplOwogCX0KIAlyZXR1cm4gMDsKLS0gCjIuNDMu
MAo=
