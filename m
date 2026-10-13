Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2CB64C10E2
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791889124; cv=none; b=n7rVBgNq9Xs5U8mRGplw3NtwQxMT/2fgDYaK7HQd26P2vqaKeBnf+L3Oh6QGBTwizwSU2I2zVjiCTtbZTlmMs2k1RcH9jh+9YV2R5SVcQ46ekAXeRXeCDogWrZnLEUYs/dkU26xY05jahsw+AvvHhQdfIyAuUxs8j8YRbq5UKLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791889124; c=relaxed/simple;
	bh=7ONX4vDOeMj5oyXc0wpCu79X47WQjrqzwSNypYSUYbQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i+PHUIFRJUSJ3r9GhqDm0vNElzSAml6b/gCLmPHphz6gFBSrRBwsDjBEJFByGD1hTnYro4FHmU+1WII9XQOWn343Xuy0egbmZGkgxv4340Tcmibs6iRNQCwVabxUDDUjYFiDiQz/VnnnUylx2MW65u2Q4iliRdBOyLjiLmcy9ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZELKi8+s; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=XEk1okJ7; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZELKi8+s";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="XEk1okJ7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791889115;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IntiDFOBDv3N4E6ikCGJ+h2ZJ02HJSndIefAXObsa/U=;
	b=ZELKi8+s+pSqDekhNRe1eN3Ou0yc0m/LA1rkbPiVLhOpmAWcX89bdegOYfsx5YT8eX/pQn
	9Usy5ekOlA1p2eN73ZHjiSCOVZ0ct2ccyRR4QfXPWJAoon45YwrSIrB7NSNH8x5Ozxr8ol
	b5OkFgHTbsXBvnwAbzuiuuuZTP4WN2o=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-44-OaSk-NuPN0CNUPgYdl9TkQ-1; Tue, 13 Oct 2026 10:58:34 +0000
X-MC-Unique: OaSk-NuPN0CNUPgYdl9TkQ-1
X-Mimecast-MFC-AGG-ID: OaSk-NuPN0CNUPgYdl9TkQ_1791889113
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-48b02e93a1eso2180756f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 03:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791889113; x=1792493913; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IntiDFOBDv3N4E6ikCGJ+h2ZJ02HJSndIefAXObsa/U=;
        b=XEk1okJ7ZWR7En/1sCTqJPKfHZ3+mNi+xCaD7XEXWbIKxqU2Dg93OnVty78/dtHR9a
         VM6RdCtWu8v8b4d03vnYqbW+HCAauvF3//7pliWXSaOiThOH9ERuNdZ1WNYByBFhLjWw
         Rcy2Ggimpu0bkciHnetzpQgt1HUUH37atpAgcgOz8ZmzffV5lxke0aI3qdTKWt23Wh1Q
         1nbjwODnM79fCqBNYSeXJnRGKywKqk2ntrvJVVoNeasXLWFHlz/e98tHVaag6hgHHA11
         LqcW8alBRCmvNPgZ0Epv5oEadJwzvTKeXiPuQwYgJtZzZ3ApB6KzTbg+/1WAafBx8GDT
         qYHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791889113; x=1792493913;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IntiDFOBDv3N4E6ikCGJ+h2ZJ02HJSndIefAXObsa/U=;
        b=Bzz09JBugE5hGMV/TceS1K5LWMWxFIJJYBeBcCIonao8OQi1Y6wkYGCUUm9r5lsEuw
         JBDug6yC8yiq0lsaR5sTb9cN8jNC2wklLYEsKcoc90xf6u/S/k+rgct35zpnOvFN9vc+
         DzeifX2RKo2MkslJyelnaWXS4j07oSescdQEZCc83mJIFXtO7LmUZW31HkIKTITq+YwA
         q/xrAh/hRQ5Z8eb+O8jmU5YHKAE0Pb58L0sRKqDSUC9WUcBM48efjpB/qJwoz7oft/Fb
         HXAj94hVjvw/q+mlRs+yHLlG0GhJoqinDRSaDP8gDKrYiHTZbPQ//tMRQNaeV/SYuQw+
         kHAw==
X-Gm-Message-State: AFq9FYICrcIsB7QUBHZcTosihcUHKus6MtSuEMsq3VjyNLX68yROeYL2
	g+GKp49T+2rGbHbhrJHfoM9VUd0o3E0fXnzomGqU2OddIgqK1fVzK4EWsZw3U2T8NpATASluzX+
	HpU2SWkQnewXu6GWO5pSdQJR6wa7bGrrClOVJxomGqw5g2UMTq3l1VKK76nCV3P9sT05H4ifHWT
	rcGHmMTL7Xb0YWJIWoUXsWF2afT8jOkUsFt/3jCiT7Uvc=
X-Gm-Gg: AYBFou1WAILUEiG5uOT1Nk1v55I1MheLNuZjduzRNAwD2BynraHXGPgmrB3+gjUREez
	YKoxqXZICheRjBG5cs6npLYxtER7e5rnizhlrlwGxNuQWW4crqno3l5ytINCTsiIb0y9jvdPwxw
	KLDXr1ZXpBjH1QCfzHj8tfcRKb4C+6DgIwI7YQ+j2cVKMd9v3KfY74sO0/YmJZHdhY8KaVaJeN0
	EOomiN+UPbDP+Sl/VzuELP1fUcLitnmNZ99GPifDn45I8GOHkQ5DbclA9E7k2QIH70O8mxNP8vC
	mP90DDq+walWJbRv1rEuzK5w0kADFu25TDA2ik1xl++F4W6mj640qmrTHcUnmOyp1FSezw==
X-Received: by 2002:a05:600c:4e91:b0:4a1:7ec7:a479 with SMTP id 5b1f17b1804b1-4a18e4f56bcmr247249165e9.33.1791889112687;
        Tue, 13 Oct 2026 03:58:32 -0700 (PDT)
X-Received: by 2002:a05:600c:4e91:b0:4a1:7ec7:a479 with SMTP id 5b1f17b1804b1-4a18e4f56bcmr247248425e9.33.1791889111969;
        Tue, 13 Oct 2026 03:58:31 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:3fd7:5300:3d6b:52a4:a23f:9d0b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf3e044sm344208705e9.14.2026.10.13.03.58.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 03:58:30 -0700 (PDT)
Date: Tue, 13 Oct 2026 06:58:28 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Jason Wang <jasowangio@gmail.com>,
	Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, virtualization@lists.linux.dev,
	Max Krasnyansky <maxk@qualcomm.com>,
	Rusty Russell <rusty@rustcorp.com.au>
Subject: [PATCH net-next 1/4] net: add ip4_parse()
Message-ID: <bfd6257f8fc8a5c6cd876b8ebc498b8a4ee0be8e.1791887415.git.mst@redhat.com>
References: <cover.1791887415.git.mst@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1791887415.git.mst@redhat.com>
X-Mailer: git-send-email 2.51.2.2891.g4157995a80.dirty
X-Mutt-Fcc: =sent

Multiple places in the net stack open-code the same minimal IPv4 header
validation: pull the fixed header, check version 4 and IHL >= 5 (where 5
is the fixed header size in 32-bit units) - and locate the transport
header at IHL * 4 past the network header.

Add a helper for doing that: it returns the validated header and
the transport header offset, or NULL if truncated or malformed.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Assisted-by: LLM
---
 include/linux/ip.h | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/include/linux/ip.h b/include/linux/ip.h
index d11c25f5030a0..98012f6d0efb5 100644
--- a/include/linux/ip.h
+++ b/include/linux/ip.h
@@ -56,4 +56,28 @@ static inline void iph_set_totlen(struct iphdr *iph, unsigned int len)
 {
 	iph->tot_len = len <= IP_MAX_MTU ? htons(len) : 0;
 }
+
+/*
+ * Pull and minimally validate the IPv4 header at @nhoff.
+ * Returns the header and stores the transport header offset in
+ * @thoff, or NULL if truncated or malformed.  Only the fixed header
+ * is guaranteed linear; callers that need the options or the
+ * transport header must pull further.
+ */
+static inline struct iphdr *ip4_parse(struct sk_buff *skb,
+				      unsigned int nhoff,
+				      unsigned int *thoff)
+{
+	struct iphdr *iph;
+
+	if (!pskb_may_pull(skb, nhoff + sizeof(struct iphdr)))
+		return NULL;
+
+	iph = (struct iphdr *)(skb->data + nhoff);
+	if (iph->version != 4 || iph->ihl < sizeof(struct iphdr) / sizeof(u32))
+		return NULL;
+
+	*thoff = nhoff + iph->ihl * sizeof(u32);
+	return iph;
+}
 #endif	/* _LINUX_IP_H */
-- 
MST

