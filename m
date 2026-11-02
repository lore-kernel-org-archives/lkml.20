Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793646883;
	b=vady2LU11T/AuoK9cF+t6XKQkR17u7gtRLAaMgp9a6di62T0oZrzqYtR6MQrS355ws46
	 OjbxHWEkxEU/aIe8wCW6dh3msul6jTIwjTom3rFQ3QefyDB8v4JFttaCvlOGhIV9kWoIs
	 9WDTLv/t8P4p8o/7wMXO6N/V2Yi0auODY5YN5uDP0RZCugD+pgriX01OJ3hRNNKiNhz1S
	 9RKOqErbTqG4SzJYY3q0O+Kz31fW51EqQxTOIAD6OkFJhiSyRQfKVUdgoZ0pvbIaOLk8A
	 Z1NEGqjAZcTWFRjX4rJ+8sr4bRYEoC0QUv0VhG9XuEd+oSRl677McofKgOYbFL94bJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793646883;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=ZVsuCPHQOVUX+J0ERU9EzUWJOblLPkY73pQVUzYA+s4=;
	b=axtk5Ag5SZ00FiVGDQWoenJqeJ97Sc71G7GpYYGNlbOxnPCKf0zVUl5eEQQg9OgBDCzN
	 kQLA7wAMGmNA1pqQdUT8UCINkBVjlva6HZo5NpbEgB5sj6tTri7cbaw+lSYxQz9FKSLVj
	 d3k7t8KXEJHBv00KpFIZzAJDe94wyYhIdpegLPDqIVpcSqSpNUMIbTM2L5qVa30wjQu59
	 q7TBvyg+1UupZUD+BvePXsd0WY1KxswETnyK06IkIyzbvzlJPjN8lhlUamVG7PXEk4We2
	 nNzKdAo7qg80q2wCatJl9ovZRNU3q2cGa2923JvzrRAu4upIzf7/7utOCmJQt/oq89Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IhiP8h5j;
	arc=none smtp.remote-ip=74.125.229.138
Received: from mail-dl2-f10.google.com (mail-dl2-f10.google.com [74.125.229.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96636606D826
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 19:14:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96636606D826
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IhiP8h5j
Received: by mail-dl2-f10.google.com with SMTP id a92af1059eb24-143601f9f98so890001c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 11:14:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793646883; x=1794251683; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZVsuCPHQOVUX+J0ERU9EzUWJOblLPkY73pQVUzYA+s4=;
        b=IhiP8h5jzlmVlab52upLzwlOFij5iekEIG/X+yYfMJG3DW1rdsi4zAbXqX2qE1NgLu
         JdBpIyjfMkSoEncClqlyb/NpnB0PAOc3LDyPl6zZQ6q0wbOlm1d+/CVNbScLvG1z6sxM
         i/HtGMFHaaYHwKydBo3RF8fpo0x9IWf/CCQt417191kH9vwvO4fL/HkwHY1G4fXwz505
         V/Pkctgjr+J6Fprs5cmLUlEdFgPYno+VvEoPo9SVJosTUo/rIBV0RTAPhAJjEeIoWzxB
         +K8n6+YCssxKAswNrAWo32Hkd8dEq5TMp2WfY7UsPeLV7QucuSk+d/u1UkcvMprBCBBC
         5p7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793646883; x=1794251683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZVsuCPHQOVUX+J0ERU9EzUWJOblLPkY73pQVUzYA+s4=;
        b=JniXmNtbtC1Y8jcyw5V78o0H8DYhBPlboYwh9pAORzkUC993Zl7cJ+O7OAprEB8jwW
         4cMa+2i324Q5A2FSp/xXbuvtzZtqkCVpdDI7Vz7BYQ9gEqH8nIDsuR/kN4QOVEpCnMjP
         PX69omHpaOWYpt9MhRPCBFb+t0KIzzgiVgVKvPfdOEcIAPMUE67TOpMhZIK4GdfLPnWe
         JAnet/fvSJ45G0X2qnLJCLLtIxIkiqn4Vjx2a2jN+F99UHq2qHa1dBi9Ldu2dGvS/wd+
         0eGJxr9lqsV9IwD7IHYwCzDvZpS7AjALKzqajjUx5LnW3QtPpLMK3Rz24EliZK/Z9FSa
         YWBA==
X-Forwarded-Encrypted: i=1; AKwUvBzs6Y+1eZG9K73nSssEz/zgEWn4BG74M8gYUxznLUTzxMBLATyXLNBl+O6WlJQ175vKmxDz6hQCFc2ISug=@vger.kernel.org
X-Gm-Message-State: AFq9FYLTnlYc284SxLSRGc6/fh5A1JLO5fLai42tV5fylxwMU66RddeA
	MD01UY5D+u65Bxw1g7TrF1VaadBu98TDJnOAxzBguFMEbSMBaw2gWFQt
X-Gm-Gg: AYBFou2KTZEWq2jEAc0A5F7KMDzqyfYJcdlaktvpyXyuP+X4NTlE+RvtUHJwKl7Vq1m
	6YXvWGgoP4nbL5tZFYb5tnXm4azdU6Sov8nvF7NyW8z5FUq3LZHKUqYEV9T0csGygvkirYK9YRV
	aZcl610JPfXuT8/42mtg4ZPCufabbh7A0wIuvucGKKpCWjrF7LRoJbuEEeo/6p4CeB3F1cv7A+M
	JuIahLA2778AaeY6MTDljLOeRL6fYA1VpzJt3WsPOULdphkx1K7w2vrl8Ji5O3AdJCLu41Jyg4g
	yw1AOgiFAPCWkPpcKN3fMGhys2DpL/NhyhOrPTWqgkqQXimCpY6i85iGwmx5fUzEbkRVa9ZmF1O
	8Jn+gLw1JegRvUlQSQaQwegndQ9Y/GjF8BChNRZOQLMCSMHaXFjH/L/MjGg/W/hKLi3/EAzHI+N
	Jp96kSVytN7L1tG7DKAiewhwoITS46OySE2glUSnHWHk1Ss8uRFaRgSAEALz9QILwmjs90aisL9
	sIcfvXq/7yFvGmSjrY6lO6Vz3+m58kzo6XtxhP5z1XFsChNz1vofDJ9KXP6yQlcrBcuPtfdG6jV
	GIX23+2G9hCBs6gOuydLkSU=
X-Received: by 2002:a05:7022:281:20b0:1ac:91b6:8dfd with SMTP id a92af1059eb24-1ade9e3e335mr15040908c88.31.1793646882743;
        Mon, 02 Nov 2026 11:14:42 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:67::])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1aed79b3dfcsm36444456c88.12.2026.11.02.11.14.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:14:42 -0800 (PST)
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
	daniel@iogearbox.net,
	razor@blackwall.org,
	leitao@debian.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next 3/7] net: devmem: use niov_shift in net_devmem_get_niov_at()
Date: Mon,  2 Nov 2026 11:14:34 -0800
Message-ID: <20261102191438.1059771-4-sdf@fomichev.me>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261102191438.1059771-1-sdf@fomichev.me>
References: <20261102191438.1059771-1-sdf@fomichev.me>
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

