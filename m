Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4444F519926
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 10:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788863903; cv=none; b=SDjS0bcIfeprwZ1RBiT5t/De40UElkvSwXRst/zj8PB4/5G4bdMX2UD8LzZW6nDPBZSBaJv3AUAjgaIA1ytyrKR5as0sSw+rJaHJeu38ds+bq3YVC1BxsYcrfBc1xV0tYWTVBJ/+dMza/cYMiLU7xJn9R0+Bww+YaR3yFbBLV6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788863903; c=relaxed/simple;
	bh=ziS13Sl0XePVb+8Irj5aKB2uXwjBR2AeCsUFpisyMOM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qSA0opjl1St4tdsz0YXy0LMkA7looTcpJUYC8qXzCBMy20rHNaGlktlzjKhhwyQ2TWKEhPcZ0r1PZVOK8tzkRae1ja1fqXMuwkUQB+sMWYVzlk17z4g5fih/ZKx4kJdG8U8Tt2viObQEssPtqgF3qJFJaMh3AZKGxM3HR4AHGuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.huji.ac.il; spf=pass smtp.mailfrom=mail.huji.ac.il; dkim=pass (1024-bit key) header.d=mail.huji.ac.il header.i=@mail.huji.ac.il header.b=DtnTIruk; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.huji.ac.il
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.huji.ac.il
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.huji.ac.il header.i=@mail.huji.ac.il header.b="DtnTIruk"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49d0726cdbcso1152245e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 03:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mail.huji.ac.il; s=mailhuji; t=1788863898; x=1789468698; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gukiW5oUha6xq8OwiRh6vFuhYnRARLZXiBZpgrxcnas=;
        b=DtnTIrukgN7shU/osfE1PxN7a2d/36Lnd5aztDmNHm9/kblkhm9Z5N63nKgNCLnfQq
         EGwebOkdyx1a58Jo33keihURRBZ4IEQSk1fxUfykpJkyLamOtS+G9I0D4j2YL679dOD3
         4dOsXDktSymYg93OiDeWUucO9RAmm6xc8sgCk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788863898; x=1789468698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gukiW5oUha6xq8OwiRh6vFuhYnRARLZXiBZpgrxcnas=;
        b=MlzedbcVKcho1v4UWzKkk4DU9oDtxJG0ax88CFkhMVulG+ENeIXgKljNiRoAkshIm+
         guurx8E1u8C2/WqyFC2joUzeScEfKD2iJXgy3TJKFptq3lvZkMlq7zIXGvy7hpoEuiNe
         hD96vpprwWMil9PIlY5v/pdsbCLSFQuUVqFRr/Igx11n4iVZj15saAGHfbjunqx4xfKI
         qhvHO7pBzqQ0ztD9abUX7rjnQoXeOpKRNp0MGlEIpvzSJPxNF1BekNxa5lErl6b+R+8g
         4vSybdAvvE/H+MZIcDwIJrCvwMU9TbwoHOV8beRX9p2axT8iylTGk95ASI+V/5mCsYMS
         ThzA==
X-Forwarded-Encrypted: i=1; AKwUvBwtJ0UaBexHzZiTWjdS5MOhUUCAlCZbnbwrwakBqzHCbmgXZOtpXbAqdL5jjlk6MPi/IViDP6r8/GrLB70=@vger.kernel.org
X-Gm-Message-State: AFuF++mmyxtb6Ws/dmHi7/DfoU06DR+QZiz1xBT9w/firjqq5x7u8Aom
	u9+c2kQUBzRL+j4upTQojn6Zoi3gl7pep+YqtdlYxmFHpRO7pNbcxu8k0lKNZaxxIw==
X-Gm-Gg: AYBFou0eMdQxbWZh+vAPjIAn/dU5uO1emwVcO4SmW3nqGj+RoQkRmyU+ZQnNH4SFIUX
	iyzEZxMT2TE5w2JjIbPr+A7ONdkoKnjQmta7+DZbDkc38uo9OPRoZ4gyEQph3m9UX7m2mEUhyFS
	VW/oPu+oMbB9DOikCSJ4LxvcLe09NjFWuYTLRYvSXAv3P1XC5Ses8NQ7otBPZkL0gqdnycRqM0u
	NCemMUs41l9f+DQXRibLiko3kib1d+n1vNluxvNLVAoCmTrIoYDFOgLwhrlSp9zXst92iS4KkwV
	YPyoEAyNTuRYSLcB7B3o2XY0h3KDvAPCVIz7WmLmonrXQC7v8CSfmaKRjZwV68JUyx4rJW3dk0v
	ALBj51etu+gATEVo0NsKsKwolwrm8z97E2BYNV7LDQcgdrPqduo91AhX5dyoegbefTxnVkVLQHu
	cLcehDf94BPVBjN9ZsU97928/fOh9Z1KfXM81o4tvmzxdJlLmZl2TXNdk/dbTOIxH50Y7zL8Awp
	y5r5KsqCKnYlyaGv5sWohzIzA==
X-Received: by 2002:a05:6000:40dd:b0:47f:9283:1f9a with SMTP id ffacd0b85a97d-485907b118fmr18369279f8f.2.1788863898284;
        Tue, 08 Sep 2026 03:38:18 -0700 (PDT)
Received: from inbal-OptiPlex-Micro-7020.tailf3f5b8.ts.net ([2a06:c701:c272:d400::7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c5bc5sm37697594f8f.24.2026.09.08.03.38.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 03:38:17 -0700 (PDT)
From: Inbal Schussheim <inbal.lipshtat@mail.huji.ac.il>
To: edumazet@google.com
Cc: ncardwell@google.com,
	kuniyu@google.com,
	davem@davemloft.net,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	linux-kernel@vger.kernel.org,
	Inbal Schussheim <inbal.lipshtat@mail.huji.ac.il>,
	Amit Klein <amit.klein@mail.huji.ac.il>,
	Tamir Shahar <tamir.shahar1@mail.huji.ac.il>
Subject: [PATCH v2 1/2] tcp: exclude old ACKs from tcp fast path
Date: Tue,  8 Sep 2026 13:37:14 +0300
Message-ID: <20260908103715.1402788-2-inbal.lipshtat@mail.huji.ac.il>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260908103715.1402788-1-inbal.lipshtat@mail.huji.ac.il>
References: <20260906123151.1391349-1-inbal.lipshtat@mail.huji.ac.il>
 <20260908103715.1402788-1-inbal.lipshtat@mail.huji.ac.il>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Exclude old ACKs before SND.UNA from the tcp fast path
as well as ACKs after SND.NXT.

Such ACKs will fall through to the slow path, where tcp_ack()
performs the appropriate validation and challenge ACK handling
according to RFC5961 and Commit 3d501dd326fb1c7 ("tcp: do not
accept ACK of bytes we never sent").

This prevents old ACKs from being accepted
or modifying connection state as part of the fast path before
appropriate ACK validation is applied.

Reported-by: Amit Klein <amit.klein@mail.huji.ac.il>
Reported-by: Tamir Shahar <tamir.shahar1@mail.huji.ac.il>
Reported-by: Inbal Schussheim <inbal.lipshtat@mail.huji.ac.il>
Suggested-by: Eric Dumazet <edumazet@google.com>
Signed-off-by: Inbal Schussheim <inbal.lipshtat@mail.huji.ac.il>
---
 net/ipv4/tcp_input.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
index daff93d51342..57fec58a4f15 100644
--- a/net/ipv4/tcp_input.c
+++ b/net/ipv4/tcp_input.c
@@ -6539,7 +6539,7 @@ void tcp_rcv_established(struct sock *sk, struct sk_buff *skb)
 
 	if ((tcp_flag_word(th) & TCP_HP_BITS) == tp->pred_flags &&
 	    TCP_SKB_CB(skb)->seq == tp->rcv_nxt &&
-	    !after(TCP_SKB_CB(skb)->ack_seq, tp->snd_nxt)) {
+	    between(TCP_SKB_CB(skb)->ack_seq, tp->snd_una, tp->snd_nxt)) {
 		int tcp_header_len = tp->tcp_header_len;
 		s32 delta = 0;
 		int flag = 0;
-- 
2.43.0

