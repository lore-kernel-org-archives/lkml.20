Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794437267;
	b=NZNKXJt/nrEaIFtbFqTB/939fqxZ+MIPA1NoTzxB3NOYh9nhIi/ypO0TjaE+YGTXeHaV
	 kUDimCCBMNA/6MKXjg9SYPaqv9vSZTe0zz2rBgmjhNiXCdfdEZRWQSIR6BlwMldp5ZJuz
	 yBKR5TxvnPVYe2TcBJgz0t2omCxdqdE/i8KQuwoNF1E5GKAbGyS0CcpmjGs13u6a9J3kI
	 0juQ5sB3nxxqqzSYi1T4RlerbnbDkB8UeokTNqOrWF+k6GTFdPBD/CpfrrRWfFnoGAlHO
	 Xf17WaB3i4G6kw01UDmyRhJqFFUUDCpB295TANaURIvCseg0ZpnKRmiwZEciYKR0w2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794437267;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=tp4FwDBE4d49Hi9WrTjNIMNYb2nVWF+rLrH6T68Pxk4=;
	b=NxBQOBiDJwEgW4kLhbiI0tdWCA8ciLDQ6IOhwVwN0PegH/J7uc4IlwTpiYad+xpHVTfF
	 en+lgvt3V6B0ij/pEUdgLfxsl0Ivgikv3T2yBfeubCRRN1ldvIW73VUhYoqc0hg1FwGs1
	 eylWPnQv4EFF39CpjNoa6LO9OPbRzOIK+ZKZ5wzJYAc5/idtduJjfLVv5ZMRjRcstUPk8
	 QYh+rGssEmQY73D+o44ob6Hh7ohiOZMG+YmQmbBFLIYwgS/9Dgbwsgyf5xatetL/rhBoE
	 l3fq5c0I4lVthdraD2d4RWcTBtp6Kdw0sRkIIVhOlI1Fi8PgZZ+e8yAHiaH2NUKSb0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="LLuo6V/7";
	arc=none smtp.remote-ip=74.125.229.131
Received: from mail-dl2-f3.google.com (mail-dl2-f3.google.com [74.125.229.131])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EBB7606E2B7
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 22:47:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EBB7606E2B7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LLuo6V/7
Received: by mail-dl2-f3.google.com with SMTP id a92af1059eb24-1afb6473195so706581c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:47:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794437266; x=1795042066; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tp4FwDBE4d49Hi9WrTjNIMNYb2nVWF+rLrH6T68Pxk4=;
        b=LLuo6V/7kIsfNKiTCG734leNRhC9dyI/J8vOcEIJ7nHklg/FevWrQTnrhiRgp0MDf4
         ljL2KVoCzseQ2GNnAwyATO9XCS4ckFDZ0RbEx6EwB4IWqje5bupXLy1wqgqrYhCyz/Kr
         kg1K35thVoKr6zz0wLAzm0MA0hTwUGGICCp1EBVVZhvmNbD8gkt1yTckU3hCP9O6GiLE
         6P0IfwW/i6lEmzLVUTNYvfnqFMSvzMEUKGqa0qIVQQgZJCNjA4xwVkoznQyjVYzcpfBx
         ocjjzHxI3A2PkgiLRQ3K73ZT/cJVVeaAsrgfw3DCP/+xNXD22ctrZYrh5wLNPJZtq7Yr
         Hbiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794437266; x=1795042066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tp4FwDBE4d49Hi9WrTjNIMNYb2nVWF+rLrH6T68Pxk4=;
        b=fxXjQKHS3tGkNPCSMXe62i5tv200F4YxwCz9KKuToGFQJ3xICD5yNsFfC+93CLX2OU
         wXPGmoHh6HpTEZk9c4hdwZjdJTFIV4K0qKjzm0O25YrkbBMbdgY0MrqUb+Y+XCUM/7ux
         CXUk0QVKGPdau+4TnLZQWI4k5VFtsNKYtbP5Ke5AG0ybkzMqSrCyPB7wByYPdNuy3LTO
         Use0aTL+2gmc0kAx/XQ7Be8hERZIMFUwLfU3+c9UiiLvZqDZMDzSOK4zIOjUgNY4HY3Q
         hibMaT9+wL0rd/HU/BhqpXNxVBVg+KhXaOUYefSc1Z9qGrQbUnb6Ucen90gB5oh64WC2
         rMnQ==
X-Forwarded-Encrypted: i=1; AL+hErFmaIir1fn8CxTZlXmBDuHC5eY08VCFNsZzeZceKe6Vr5ykfk0lKk3+Ils14RYMGscQczjxqd9/0N9VHds=@vger.kernel.org
X-Gm-Message-State: APuU4Z/PMut2LUcubR29XJxDLQ1kyytgsRHJmc5+dUV2rbmHegLmV8w9
	JahTmkT4GvL42kR4kbrn+tBxTkqUgv5ySZPu6G+2fNfHd+wItQRmPcOv
X-Gm-Gg: AYBFou20JTiBuDhNndrjH88nfbThf7Tigt6MVG/A19V52HdnA6MwWtb9xnHgAY5mSRL
	9B3X3ah6VbaWOL/bDjWK7hq5F42TTisNwtzTiNXUnZATompJFHMWmEmHPJw3RbqpOQGdHobuiVx
	qaAHBspCJOir0DWcjHr7F2RdGUDZ88iWqU1f5WrXSSfble5crpKBEnR5CsPhwpaA1XkVWDgGwI1
	AiCHRrspDk5a+rVU4fZ3m0zjWu9sCB0opDaC9wBcFVCy7hFJeX+DnTT5ki0LT+qi2+Bt7Rt7n/z
	VdlHM24prRZYsn4FszdWevuITFrIPOPiHiBFK7IsmpHJv6sovcY2whrEiByrmS2WSE68Y/zWpLY
	1vcYaXLPIK8Pa/Cl4GsSI1QhO4LidacCETyYTB4oN0Mzzxe1VLlSLKRY46mBq8Fil6CTkaF04PB
	MhScTNYadSQ7n3ABWKDMk0fKyDoIzDA1bYPe0K+zAhEiOChC+HOeofxpQCdqtVYYXtG9PUbnpKK
	durysYZZKTVWPrgsd9tZl5AMSdIU++xbY6W0duMzbtsV8cShyUcZ/EPDwT7TSlTAzlbL2vE/k7M
	2fwnfofY5pTZ+VLewKGMWgU=
X-Received: by 2002:a05:701b:2610:b0:199:e38c:29a0 with SMTP id a92af1059eb24-1b3c03390c1mr3026458c88.31.1794437265699;
        Wed, 11 Nov 2026 14:47:45 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:61::])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5890e04sm19170807c88.2.2026.11.11.14.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 14:47:45 -0800 (PST)
From: Stanislav Fomichev <sdf.kernel@gmail.com>
X-Google-Original-From: Stanislav Fomichev <sdf@fomichev.me>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com,
	andrew+netdev@lunn.ch,
	edumazet@kernel.org,
	horms@kernel.org,
	shuah@kernel.org,
	almasrymina@google.com,
	sdf@fomichev.me,
	leitao@debian.org,
	dtatulea@nvidia.com,
	asml.silence@gmail.com,
	bobbyeshleman@meta.com,
	daniel@iogearbox.net,
	razor@blackwall.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next v4 3/5] net: devmem: use niov_shift in net_devmem_get_niov_at()
Date: Wed, 11 Nov 2026 14:47:38 -0800
Message-ID: <20261111224740.2744522-4-sdf@fomichev.me>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261111224740.2744522-1-sdf@fomichev.me>
References: <20261111224740.2744522-1-sdf@fomichev.me>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

TX bindings use PAGE_SIZE net_iovs, and the TX lookup hard-codes it.
Derive the index and offset from binding->niov_shift instead, so TX
bindings can use larger net_iovs. No functional change, TX bindings are
still created with PAGE_SHIFT.

Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
Reviewed-by: Mina Almasry <almasrymina@google.com>
Reviewed-by: Dragos Tatulea <dtatulea@nvidia.com>
---
 net/core/devmem.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/net/core/devmem.c b/net/core/devmem.c
index 5c7d9640e9d1..c6868f39261a 100644
--- a/net/core/devmem.c
+++ b/net/core/devmem.c
@@ -581,13 +581,15 @@ struct net_iov *
 net_devmem_get_niov_at(struct net_devmem_dmabuf_binding *binding,
 		       size_t virt_addr, size_t *off, size_t *size)
 {
+	size_t niov_size = 1UL << binding->niov_shift;
+
 	if (virt_addr >= binding->dmabuf->size)
 		return NULL;
 
-	*off = virt_addr % PAGE_SIZE;
-	*size = PAGE_SIZE - *off;
+	*off = virt_addr & (niov_size - 1);
+	*size = niov_size - *off;
 
-	return binding->tx_vec[virt_addr / PAGE_SIZE];
+	return binding->tx_vec[virt_addr >> binding->niov_shift];
 }
 
 /*** "Dmabuf devmem memory provider" ***/
-- 
2.53.0-Meta

