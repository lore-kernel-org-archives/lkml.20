Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793446902;
	b=AatqP42iBEBp3pvcTEjvju7MXsmBb5Vw1gkk5RnmZMUXDlk+Q0xFHi420rARDAKVGGZK
	 7KRJae04Kq2YhfoTSzT/gZdxUpPl9nNJPbuj8L5LWKaWyhDyaIAClgTmFBA/TuALI/l95
	 2i7yODW4+ASkdSlelQgLC3cVZi9LHeVR/PNmq1VMfzETFvMeuOpQtNN+Ac4en9uJrT9pi
	 NjP3CgmLO76veDkIJOW1mQCBV4cgHJQaguJhWoCgyF9kJTcft6idZ0OZKCpQx2Xcu81Xz
	 TXPlvB+OfhPt2+sUwAeJCp1wvn+nRAjQrlp84HsbAFeNxqmNNQTzU9XykH8SSDNGHLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793446902;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0HkCg/YnWhbYWbYZDdGBQDEn6UPPXchTb+/3lfwZnMw=;
	b=3WmGLwzt69De7l3XEcQZ0p04Y4aglmIPDv25bxjjuvzAr4sO36B/7pqToieJSHPql4g/
	 KWuJhmUhzLJC8dVhBrCSU73ITtKipkzonsvH6qSt5oYIq65gzioC7jsx9uhr/I17WPJ0F
	 ZbRa2cOaASdQIs4wUEdtQP13Mpm8H+jZMIB81XNR0XxF9zWmJnivF158iNZvKso1fhqXx
	 4vgFq5ZNoZODlkxuFs1rRM+s+U/bCYJNO/NJVygtce6y1+g+pJi89MG+aAI4X8IRCx8FQ
	 5tiMKUPykZ+hFQB5TBSt8rtGvkoj08VykhO7328nCNPjLauyBrWQ3I9T5Ix04n7kXhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bc7cToZg;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A73A6606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 11:41:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A73A6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bc7cToZg
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48e10a70540so934207f8f.1
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 04:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793446900; x=1794051700; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0HkCg/YnWhbYWbYZDdGBQDEn6UPPXchTb+/3lfwZnMw=;
        b=bc7cToZgfB/Q8+JCX7UfRYI01UsXNH6dckTKhXALoMqVL0aew2sCiwm3Pf8SGpFjU6
         nlfpsGUd/22Jy7FWHT6+N1uMEdziUhvZaA7kymyGcQuA10kBUKqiVNeQRi9WonYjy3WK
         ZOmkBXd3Cadq1eY0qMWgo/SvHSmhjEHgjqzYpo1fWl5apOYSZAWExbIgkh0OvObebeVE
         V8OFSsFZY7AnHQmxxCqQqh3frj+D8sNj6uoXea27l0cKmB9pjh5+9RwyJRVTPUQXcNG7
         gY4a06HXUITjRq3bYw+vcg6biXxvDbgrHM0y31ATwuQ9cUkl9/+zaDAZI0X+ykG9x8vD
         /axw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793446900; x=1794051700;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0HkCg/YnWhbYWbYZDdGBQDEn6UPPXchTb+/3lfwZnMw=;
        b=wh4EPBB9+tMWcDPYdqBbwCeTFjG51K96nNEg+z9AYT5+wcvmJQFwbfNsWkzzQIyGu6
         Y2eZvy+34Q9W3Rj99Z0FUQKFgkODLtT6Khy5eF+FR2lOYTFwpUzNnQ2yfQ9Ri7l8Vbgv
         VmKr2Dfn4jjf5xA+QbceNDn9w7xWH4n+csLrxvFXOkc/jaB/R2MucZGM+1BbVWRQGKul
         5Gt5OKZ1NlaIWhgwJpWAbUz1FHahPUfH4OS8ICyNI4xWMkoAOB19YhqyUKvofkLykzf9
         QC+dqUN1cF1tTuiD1UzvcSEr+4GfngD80pxYsWxA7N4htkQqnEah4kkRT1lj8Zej8c0x
         tqDw==
X-Forwarded-Encrypted: i=1; AKwUvBxxq0D64GazdpFbkG6U4DC7ydLEBFw2Mtpze2XgvuCwNnN5o4Ti/4GQbbeYLSlEoIqwVTYhHZusoQGevuc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLSF+KuuLkdi2PrBtfAk8DoFvbVSe1aQ3RKpO6s3XsjiDQTajMP
	OP7BAK9QJn5/dyMF/bdTXSUplGaUPFR4PHq0r3IG1bHQaCMpPhoJU3N3
X-Gm-Gg: AYBFou3/zjokjSbxMOs6NHfSp0cBmSxP9hhlVB88CazjnHdcZg9/ehORLWdKiaXv85X
	SZCz4X0K95zwvyBlYwpaT76N/v3rsA3OjjKBChD/ZL9eSKws4udXl1x4Z2YJhuXV7X2WKV9VKkw
	PsG9CFW5ikxNjrLBqpdhZ/SEfSIkyyeaS6QSIDj0FeLh1zJ1R/H4fm618JKKUp7RAFSMah95kBn
	b+YAuWpVx344bOn2/4rQgamhsUHze7MQMFxBHQ01BdROGuoo9pkgt61+LWioEOHk2JzHPSmX2Ka
	L4tmckrMZIwAaiAs3p9wwCcnvev5AODZj0AlH+z+W//ot6EG+Brc0uqHlHlay7WmLDDEZgf5uBl
	LA35PIaaShTpSPt4m2anEQ5mCtmSUKBmNgfKuRkETjlfI2sH76NYPPgv74WfdDdx4m0LR1nYPmJ
	lakerttbJ6E1wyUkxbZMO7+DOEeIHTOLzMyWTpUDQn5rJERpKYIeQTA15NKPq5rFVRdix5QOxuK
	P0Eb5s3JoHeuiXALal9WdecJj77DXonzDrnKt7s4VSvLvNdFmweVsRMBD8IMVFCf+tn4shngeQl
	QHVRw9Wd40sxfR3nUsSyDwjxGDK7AcRFyjaCVGa19Yuy
X-Received: by 2002:a05:6000:40cc:b0:48e:5ea7:b1b9 with SMTP id ffacd0b85a97d-48e6e30543fmr12313595f8f.31.1793446900015;
        Sat, 31 Oct 2026 04:41:40 -0700 (PDT)
Received: from localhost.localdomain ([2a06:c701:4773:6f00:c8d4:ec29:293e:f39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b78a4csm8353081f8f.23.2026.10.31.04.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 04:41:39 -0700 (PDT)
From: Avi Weiss <thnkslprpt@gmail.com>
To: netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Jason Xing <kerneljasonxing@gmail.com>,
	Willem de Bruijn <willemb@google.com>,
	Mina Almasry <almasrymina@google.com>,
	Josef Bacik <josef@toxicpanda.com>,
	Jiayuan Chen <jiayuan.chen@linux.dev>,
	John Hurley <john.hurley@netronome.com>,
	Cong Wang <xiyou.wangcong@gmail.com>,
	linux-kernel@vger.kernel.org,
	Avi Weiss <thnkslprpt@gmail.com>
Subject: [PATCH net] net: skbuff: reject zero MPLS TTL before decrementing
Date: Sat, 31 Oct 2026 13:41:35 +0200
Message-ID: <20261031114135.3784868-2-thnkslprpt@gmail.com>
X-Mailer: git-send-email 2.43.0
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

skb_mpls_dec_ttl() decrements the u8 TTL before checking whether it
expired. An incoming TTL of zero wraps to 255, causing the TC MPLS
dec_ttl action to pass an expired packet instead of dropping it.

Reject a zero TTL before the decrement while preserving the existing
behavior for TTL one and valid TTL values.

Fixes: 2a2ea50870ba ("net: sched: add mpls manipulation actions to TC")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
 net/core/skbuff.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index 48f676411724..9b057cc9cbd3 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -6858,7 +6858,7 @@ int skb_mpls_dec_ttl(struct sk_buff *skb)
 
 	lse = be32_to_cpu(mpls_hdr(skb)->label_stack_entry);
 	ttl = (lse & MPLS_LS_TTL_MASK) >> MPLS_LS_TTL_SHIFT;
-	if (!--ttl)
+	if (!ttl || !--ttl)
 		return -EINVAL;
 
 	lse &= ~MPLS_LS_TTL_MASK;
-- 
2.43.0

