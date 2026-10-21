Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792601356;
	b=rsHAdUoU3gVG2u9jvSGWlTVcH8W2fAqYBgzn73kchrsGEIvOzi//03hKgd/JLtfUDGI6
	 g9JcNEIvjmjHEG9WnIZchi1ci0qES1kjNs/qbUIF610sWyI4mQ148XfnsBRvcDBEKh6Lp
	 FjB2vX3c71/BH83+ZqLm2FXvEdVxq7cVMVRnr1xajkvLLcDe/8+TVlIpE/nTri/JihZRj
	 fZ4VcP5AUlEsFlXCBP4OzcqPg5stFVuhc/3TZpH8gj/HDom3R4d14+Obyj7uaZAXQtaO6
	 RcWM6p26mulmWi11bsHqd5/BdZHQMqQ8b9EnQLrNuochmfGBLhtdDvuiJ1Mm8e0cfyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792601356;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:X-Mailer:Content-Transfer-Encoding:MIME-Version;
	bh=KIQ4ZqYz7cbk1WpqhsyeBWWR103C0oZ7ZXL7of+RMlw=;
	b=3EQPN1v9Hl10idBps18pcbIVDHLzQ0IYV12PV5D18UVSUlLoeL71fzZwaCEjksbW0/MM
	 wlNMQED1+FHWPZicFXJeORkZyZ1dWBm+KByu4afn56tq4lqTb0DejdGYOv65gQgPpgNji
	 Hkf0RcBNHSk9bQe9h2cil7xlSxftCjnLAQePlPFvEPD+c9DYcyD3RFEY3+/wfSNDuuk7G
	 WsKXNPUVIakVZjtPRnH560+vGTt9ACmPXFXQM+e/d3p7Np/JCg56cz4xb8xG6BpKWNhcJ
	 HQaMwarnXuv37x12+aFPuxdu9jF4mfvRY5LQQrfMskM/MjVVJmzH/yO4/FFEyIUmHWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=g3ArpmUt;
	arc=none smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C6F3606A325
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 16:49:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C6F3606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=g3ArpmUt
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cc147d86bebso48623a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792601355; x=1793206155; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KIQ4ZqYz7cbk1WpqhsyeBWWR103C0oZ7ZXL7of+RMlw=;
        b=g3ArpmUtemRDXn9NQEm94F0hdVHhOiv0ZuJaCx5uSGUxQVweKsEwXtcqJxfA84aNFk
         OZ6JwCSsz6kaHDHQMswYeRY6wuBTnS6rG1PhlBHD2/bIBXCJgjLuwSEkcq4vDp5iETnI
         mCEY0xOP8mFZUVmIp3/9UlrHArGSbiPvex6ywHhHktgOVAaV8G33PLHvt9M94P0qCdSZ
         ixlKFiXVMyyJ3r9qg0mzMFTGnbWL4Iq1uVQKcyBuqeJgmi/moeRik5Q2zoYV/DzEg3VZ
         4mAPiF2xQCrXCJkUmhKZIqbpa5tdu2Xh4gZC94fVEff2wuwu6Kzlx4ylEdwrA5bHxthu
         Wwpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792601355; x=1793206155;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KIQ4ZqYz7cbk1WpqhsyeBWWR103C0oZ7ZXL7of+RMlw=;
        b=sUWE4pEglhJF8UhDdHEhxshZN9my6NbPYGlofpVuTWwDFwT0uesgcwA22MPUb9rM2U
         eJycBRoEda/0kS1XlW82AcFYkE3JUG3lBmgiKK6XDD9L1qzISAhgyPmyLdRCZp243x7D
         OaYH9JqXOjotVhsySQbIobOHJocCU1RBpIMAUL4cpJbb5xsadAMy2susF1ijG/sxy56f
         JZMNZbsoDOLC//EnIRpOiaVe6+xWXzYW0KPI7wKW2nq9afQ2txG1vBqdlC4J0/5dyGMS
         rO64Xbm7wnzy59cSGAcRCnXMyguuviqkT8LgKYz6U1+ceKBwh+P8WKZPIPxgrbJzvNW2
         5tkA==
X-Forwarded-Encrypted: i=1; AKwUvBz99EyYAx5DH6dpluxmnVmG0fceGcVohw/HCtmdHxz+4HuaGA6eoJCvpTstIDcOhRo1SGp4N6G8vRTN2M4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJRguaKIWr4ELYs/6WKQHy83hzGopswssiSORhdCVAqrGTIFxyv
	lJsbiTy3/2osvT+SNjALQeFmgEKOsOlXWghf2A39x2fO5b2WI09sLJm/
X-Gm-Gg: AYBFou2e+IcpekrwagHCmHwOWHJZMRrgkI9vOlc+5KeRCOfMxR3fpofGtO3kx13+o5N
	+rPCZXLo0jK9xPIqAFDKbu9Ppe1ND3Plb0eFzUryCeGBlNXS67kHzsW9AdN3PpV5Xb7OCKdJEgu
	YSD4rO+b7Vj8npNPCcTO1oQJfcF/Ty1fKz9XwUGEokk7rKqabq3iQpxlGtkSkaHo6B+Jy1hVCD5
	tZA4un6Sr/YbvpmcPfXEKrGT8LtYQaJiUP54P2q9ei0aLWgXq3dvBNW2YsjEJeLQD5jtJCUh65w
	nYJqB500wAYe3k8EqnLLNrUO9GV1keATO2GkxXCX8wik3NWS2tDAA7mqkAxbIaaMVqU/+moahQQ
	BdoCm97wIvD4mBOcgvW8IMDo3d1gGx7hC1AN7prnlnr29WilykGTKHpbnFJpkL4FGXm8wW1AwlQ
	8igxmGFRL6CEk0msll8CpdSBmCicTUv56DjCC42T/sJT410yQy3q5wK3ckheg1ms77eqFkR7SOy
	ukyh8NZssf7SVnkZmSYSHo34E+6lg2jaRo3B7A1xOyeyf/OOjHWGajiwV8RPVQXlgZsq0Z1yrnk
	sxeimPazfC8fKtEpHN/MfvSN/JWneUXiby6PXh3tCw/S/yA8h1UXcFDeMnoxsWOefITMVOXmUxs
	0ZbIdQQ==
X-Received: by 2002:a17:90b:2ec3:b0:3a0:e568:ed63 with SMTP id 98e67ed59e1d1-3ad86e96c23mr1512780a91.8.1792601355483;
        Wed, 21 Oct 2026 09:49:15 -0700 (PDT)
Received: from localhost ([153.61.198.240])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada4896c71sm279247a91.6.2026.10.21.09.49.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 09:49:15 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Wed, 21 Oct 2026 16:49:14 +0000
Message-Id: <DMAO59MCJM9Q.19D7DBRQEDHLE@gmail.com>
Cc: "Willem de Bruijn" <willemb@google.com>, "David S. Miller"
 <davem@davemloft.net>, "Eric Dumazet" <edumazet@kernel.org>, "Jakub
 Kicinski" <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>, "Simon
 Horman" <horms@kernel.org>, "Rusty Russell" <rusty@rustcorp.com.au>, "Max
 Krasnyansky" <maxk@qualcomm.com>, <netdev@vger.kernel.org>,
 <bpf@vger.kernel.org>
Subject: Re: [PATCH v3] net: gso: validate transport header before computing
 segment length
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, <linux-kernel@vger.kernel.org>
In-Reply-To: <52b8bfe4ee848aff8ace47752352de486171d45f.1792596586.git.mst@redhat.com>
References: <52b8bfe4ee848aff8ace47752352de486171d45f.1792596586.git.mst@redhat.com>
X-Mailer: mkdraft (claude review draft; edit before sending)
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Wed, Oct 21, 2026 at 08:31 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> No unprivileged path is known to produce one - IP input resets the
> transport header to the parsed position, local delivery pulls data
> exactly to it, and tunnel decapsulation clears it altogether - but a tc
> BPF program can leave one behind through bpf_skb_adjust_room().

As Eric said it should be fixed on bpf side.
It's a bug in bpf_skb_net_hdr_pop().

Something like this (compile tested only):

diff --git a/net/core/filter.c b/net/core/filter.c
index b7ac145..ec47f26 100644
--- a/net/core/filter.c
+++ b/net/core/filter.c
@@ -3417,7 +3417,6 @@ static int bpf_skb_net_hdr_push(struct sk_buff *skb, u32 off, u32 len)

 static int bpf_skb_net_hdr_pop(struct sk_buff *skb, u32 off, u32 len)
 {
-	bool trans_same = skb->transport_header == skb->network_header;
 	int ret;

 	/* Same here, __skb_push()/__skb_pull() pair not needed. */
@@ -3425,8 +3424,12 @@ static int bpf_skb_net_hdr_pop(struct sk_buff *skb, u32 off, u32 len)
 	if (likely(!ret)) {
 		skb->mac_header += len;
 		skb->network_header += len;
-		if (trans_same)
+		/* It was the same as network header or it was popped. */
+		if (skb->transport_header < skb->network_header)
 			skb->transport_header = skb->network_header;
+		if (skb->encapsulation &&
+		    skb->inner_transport_header < skb->network_header)
+			skb->inner_transport_header = skb->network_header;
 	}

 	return ret;

