Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793749920;
	b=KhX5CDgwD+2lAPN6aPGgxMrf9q7s8/e4x/50SIbSOR3ozwlw1tXf+mER/UMC+omhvv8Y
	 TqvHfJiHy8OfIc8pUd9iQla3hQO+ZRFQEelMRcW9g5MA5vVVOyCbVhl83qIzYSnQsR3j/
	 4jy0KupuNdLIFt3Iv6ufk0zRFixSS4mDUD3L0QPhI6Q1orAwVXl5RODCNUajFaorHwx5t
	 nxtUBNVBXAwPFG96Fsyy26jJSWTSlZVK3l05/AS9VetN5PUM9znoCxO7/nFAxhmnC9j12
	 qJmNjwyZPAVUaK+kWQnU8mdIMkZJG0vq6GAnFACzznyruajme+JVYS2tf/YBKtqo1zQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793749920;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=u2FL5iZJ3JHIjTjapoLLiX3E/WLeHQAJjW9k9AzRwQk=;
	b=HiVcmvgUtH15esVQeUtF+ZoXnU8gOZWCTqETUl0cjXXI84QifK/24ahtS+rUQ2PPpXPq
	 ZfXzwXW7fsry0H6ZyHg02dvCW49JaaZ2UexNHFixuW2WG10P8SJmcKyy23u1Qg9KeKE/n
	 gZFF7l3k/G4pOjRiNJNZH0AUgnUMKPdLsrElmGuzRkUoiGlZ5jLLr29uqH065dwaJY9ul
	 8veFFl5oTNLhi/aKagd5gyt3VLg/WBbVvXrEpXFXCRrgIOoyBwGJAhDV28Ot18iRuAp1I
	 DEh56BJwFDzTbh54t2cjoQ+VWS80aYS76jsZReN97zLSp3pDjrgaK030z2o6Lbzfoyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UPGN4NCT;
	arc=none smtp.remote-ip=74.125.229.135
Received: from mail-dl2-f7.google.com (mail-dl2-f7.google.com [74.125.229.135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D47606A33C
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 23:51:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52D47606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UPGN4NCT
Received: by mail-dl2-f7.google.com with SMTP id a92af1059eb24-13985f8229aso154227c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 15:51:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793749918; x=1794354718; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u2FL5iZJ3JHIjTjapoLLiX3E/WLeHQAJjW9k9AzRwQk=;
        b=UPGN4NCT1NhBPIdKHOKGSo0GUnrckC9TyZik21lyvgHH0js5GC9k5TJvR4sCkcW/zf
         1lqBRPSCRMRSY8+khu79223f0n2Ep0gmSa94vrnY8TxyBaizryjW9AhJNcZtA2mf3rpP
         c+7JpL8AACxqCsQvF+N7Q0U9wahzNZPeATpsssFqEZKAqYmSoi13mFrBPWqmLOiY7rAs
         7bc7HjUey4W9j/QrJb+6rhxinIql8PWDfb0Y3Wzu2YMrYCxKlqq1hT1Un32U7SuPjVFM
         RqQ13NeFN5J8S2CANiaczj8DJJSAn87CmCAoq//kL8v1lI8OLCvoVpchWHTM8BtStETw
         HPCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793749918; x=1794354718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=u2FL5iZJ3JHIjTjapoLLiX3E/WLeHQAJjW9k9AzRwQk=;
        b=FsyuQvwXdB+YnJhYt3TQU+vZD/hYjokBRXgYgysnGAbHyXHRmR+jgy0HAjJBBtupJU
         YnCH2x+c5DIcZcBK+nMHmoUItA97pwgHFKQrIGJBPPxwxKrVSPCGS+oGRW5rK4fv42mV
         Qi/hXS3XsmyG9xuIy+PFKHBwvQ2dQoNOJ+X9E7qykoKsKgqzVeNRdlVqAiqnMBfkkepJ
         w3fPDZHs0Baa36SXgfClvDTxlqCDNJIU5CGmIoyULuPR8XTy4d/OE89/nA+1Vn/g5Ghr
         eWbPyiGguvQrgY28sYV7e+ZDP0mYbsUJarb4DKmbF6HjvrFkh6QJLEIt22XpKNtnGKIJ
         IdlQ==
X-Forwarded-Encrypted: i=1; AKwUvByM/jOfYx4JDd/vvRl+mHdu7Tiw9vdeHkG6LYA9eYpI6aASgoMBUE/wXCtj90wxjMyHrp/y1Ul6utb9j7Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z89g7m7VcS51FJalVIyhdl/V3avEn2B+CFT/027sCu9yNNh8U9k
	ref8IG0kBt/PDNl6GZHtxyZdsU/TuPJTichLBh4y5fEdtyx/Kpr63bG1
X-Gm-Gg: AYBFou09o54RVPXhVInqyUEAjWXTnr6e1CXO+cTU3rboQNQYUp9eLlR9KE/wScOvi/p
	paOWA6loy9lhjpBZhTv0gq1/kDKVFHvUdV1Ojp74rHWhLAsk7ZAimymWEczgS7MVXcCXAD+9aF/
	qQT97VpR9TL3J+wHNneR5syiVHUJBIVvEY/iCTElWZnP0zeAkPKpFog/thf5K00+NUhZvGMLd13
	nBsa7FMDIzykYGupPJqNuAmJcmoQ3BpKVilPYGVNq0YDE8hPtjtK8kbvtA6bLY2J25DZfKzOqkG
	RWlNIUh8um8SsXzGOx0idnsLejIK465yPCM+TcOwvS+4mnYRwRogjHqCLLJZIV/BDeVfWrKIF2u
	CBYqCE6t33aggtv4FUPDpR/oL9X1FrmSKuacPpWYF8oGxeIKdHmawvvQVbUp+kJZNcL6FHA2ZZv
	3agLkgC/ECEmcJLkCLJAjw9MXsPIUTm/k0hXmbh6DKIcweUr1pKijoY9DK79hPuIfv+0diU61Uq
	7xM3d78yHiqDP3m/FAqexdeGs9HwvQmhEN7N2Hkf1BSyKkS/0zT//iYVb0RZ/ri7OI7sFq9ladI
	yYbcUZx2Tq245smZhZi3nMI=
X-Received: by 2002:a05:701b:230b:b0:1b2:4378:3545 with SMTP id a92af1059eb24-1b2437835a8mr3011803c88.21.1793749918147;
        Tue, 03 Nov 2026 15:51:58 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:70::])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c748eesm2167834c88.23.2026.11.03.15.51.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 15:51:57 -0800 (PST)
From: Stanislav Fomichev <sdf.kernel@gmail.com>
X-Google-Original-From: Stanislav Fomichev <sdf@fomichev.me>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	edumazet@kernel.org,
	horms@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com,
	sdf@fomichev.me,
	almasrymina@google.com,
	bobbyeshleman@meta.com,
	asml.silence@gmail.com,
	razor@blackwall.org,
	daniel@iogearbox.net,
	leitao@debian.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next v2 3/7] net: devmem: use niov_shift in net_devmem_get_niov_at()
Date: Tue,  3 Nov 2026 15:51:48 -0800
Message-ID: <20261103235152.1904727-4-sdf@fomichev.me>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261103235152.1904727-1-sdf@fomichev.me>
References: <20261103235152.1904727-1-sdf@fomichev.me>
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
---
 net/core/devmem.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/net/core/devmem.c b/net/core/devmem.c
index 32fafbfa1359..6339f221bc82 100644
--- a/net/core/devmem.c
+++ b/net/core/devmem.c
@@ -455,13 +455,15 @@ struct net_iov *
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

