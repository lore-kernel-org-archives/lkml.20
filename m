Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793392658;
	b=t787/pNAB5p79LtT4F1uACWdN8M6+wosh4fqfPY6KYodv0BOFliK8AQzffdp7UrHU2pX
	 c8AoCjpKRzRtSaMstg6ORV2c9D5pgbGQ+GTZz9EgXR+D77YBfrCgpQdp3+L+FNhgLhEvL
	 DKo5DRtdAuJ/n2aq4pmXpiKJz4r9qyv0tf0R0V34a7Ixy/YBS8keuliIEjZYoUNEJee3X
	 EazlYsoTE31CJyibqSrDXM7wTdjZiridvAUn2zwK8mutRmXZFGuQ1zY8HMZ/4M3cpSq5O
	 +3J0LN3UkkYf30azTA+UOZYkSgnert7pulMNYmLrll02wglLHMK2mreSgZSXiJXCQlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793392658;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=6eGRQolKT850t03nddPMlTnlGoSQpVGdvFqhXPcTEIo=;
	b=3TOpnyy37DGoD3mFkAc4VLZxF4XHsw89lrXG4IEwHh5Wi1aDScbtWlUPZVxb074/D2jT
	 4bLf+/tCWwWPUWM4dnJQxbtbWKF8Jp3W9VXi0ra3FF2RGgSw/glx5L3IceXBpPIuK0OYC
	 bXDVXZ6jwTtNzv8Jy1iVFSGTwejNpb8mXSCWrw6hKuRg0dDLsdyLqu27m/5mq+Nkz4r7t
	 rAgUuJQpKBeDvSnRv3cXTDZWwsBIfo7brGYWHPW6KI65M6iuFb48opeFEMGIlXZLubT1W
	 12aw1L8B1dgUsjPBz1+YXZsuhdFFsx/9Lvco3tQaD++9jt3J1n17nhDrzbGMhd2QiOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--vamshigajjela.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=OP4woNqM;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70076606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 20:37:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70076606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vamshigajjela.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=OP4woNqM
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35c3c370b17so1874997eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 13:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793392657; x=1793997457; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6eGRQolKT850t03nddPMlTnlGoSQpVGdvFqhXPcTEIo=;
        b=OP4woNqMezshs5h99KWscxZ3wNHADksXW3XXTgWiEn6RFoCXn4/JaFboqZNjzIW0OM
         T1aflDUlXfXvhfsT/IgI+TRVyGYchqj8n+8SXWA8UnKBO7ivK5hauL/iQcp1k8i5Xahs
         VmQknw5X/YZyV+v1n/EJp28mgsfJdTyX29NiRHcYLKLwV7w95YsI/6qoNvHhRVpp6001
         P1FtH9Onu0SsEjyBwa4Jk4AkaTtAu6F63N0fdByrvT+OvrjsUdC+FJVNLLE+93xYje2R
         55XLdg/3zaxReBoHAh1bAVqrMJNtnuXkwc3JcNbkN2dNp99jDC/LXHFY03SBWCTTyns+
         ytbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793392657; x=1793997457;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6eGRQolKT850t03nddPMlTnlGoSQpVGdvFqhXPcTEIo=;
        b=n/fknNW0ZXVALMUQbEDV4P7GysgPPLdM6+ltYehR8nvQqRK7f60OtxCDkqYO4GIgSE
         B9sSb+5QWHmNA0Cc/06b69IewJAEwYHgxFys7XqQsRQhqoA/Vv52fdPrJhXB35rsUdqG
         i4Hc2w8zPgncYXy3SzoUIqOR46Q1ICY/xud0u3IqUHe/50xD/RrRCPbE3Vp6GwauejDO
         ihkYsqItSWXDWn+1JA+bDQCCYwjJw4HdQ7ka4XzRVSTDZGE+N5R/IZv3r/4YtJyKdKGz
         h8Qy20RRKxUT2fUCV9GLccpdPz0/6cwa3gXrZwucgOnxZGTyIoeNah8yeTz6OC8TImLj
         2/mQ==
X-Forwarded-Encrypted: i=1; AKwUvBxnV0zB+WUW5enLfndvNKYF3/z5BbPOv8NS1Aho/VEQWaNM9Sm9579vxgpoPPIM/AA9UiA98pNUb9QBhKY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKJMnfUKkkHSCbIFfNUwQNN8iY7SO108UQefBjVwsJXBEtzaL+3
	2rRTInlo19xjUEPQUqgbqS6xqTKHTQKojAX6hcJSF1ykGmA6eS0RjuneAsHa/4Fz66ldRfgMUH4
	vxUCFlDCCXrNUVYBdIqTPutLu3ldf4CkECQ==
X-Received: from dycmb16-n2.prod.google.com ([2002:a05:693c:20d0:20b0:368:bdcb:56e4])
 (user=vamshigajjela job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7300:559e:b0:36a:1846:5c77 with SMTP id 5a478bee46e88-36a42204585mr4957553eec.3.1793392656920;
 Fri, 30 Oct 2026 13:37:36 -0700 (PDT)
Date: Sat, 31 Oct 2026 02:07:27 +0530
In-Reply-To: <20261030203728.3784902-1-vamshigajjela@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261030203728.3784902-1-vamshigajjela@google.com>
X-Mailer: git-send-email 2.56.0.317.g454f8302e1-goog
Message-ID: <20261030203728.3784902-2-vamshigajjela@google.com>
Subject: [PATCH v5 1/2] spmi: Rename spmi.c to spmi-core.c
From: vamshi gajjela <vamshigajjela@google.com>
To: Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: Jim Wylder <jwylder@google.com>, linux-kernel@vger.kernel.org, 
	Vamshi Gajjela <vamshigajjela@google.com>, Abel Vesa <abel.vesa@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

From: Vamshi Gajjela <vamshigajjela@google.com>

Rename drivers/spmi/spmi.c to spmi-core.c and build it into the
composite spmi.o object to allow linking multiple files into the
spmi core module.

Signed-off-by: Vamshi Gajjela <vamshigajjela@google.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/spmi/Makefile                | 1 +
 drivers/spmi/{spmi.c => spmi-core.c} | 0
 2 files changed, 1 insertion(+)
 rename drivers/spmi/{spmi.c => spmi-core.c} (100%)

diff --git a/drivers/spmi/Makefile b/drivers/spmi/Makefile
index 38ac635645ba..190d560f692e 100644
--- a/drivers/spmi/Makefile
+++ b/drivers/spmi/Makefile
@@ -3,6 +3,7 @@
 # Makefile for kernel SPMI framework.
 #
 obj-$(CONFIG_SPMI)	+= spmi.o spmi-devres.o
+spmi-y			:= spmi-core.o
 
 obj-$(CONFIG_SPMI_APPLE)	+= spmi-apple-controller.o
 obj-$(CONFIG_SPMI_HISI3670)	+= hisi-spmi-controller.o
diff --git a/drivers/spmi/spmi.c b/drivers/spmi/spmi-core.c
similarity index 100%
rename from drivers/spmi/spmi.c
rename to drivers/spmi/spmi-core.c
-- 
2.56.0.317.g454f8302e1-goog

