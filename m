Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793635127;
	b=u4WDsPd6XkuPQ20e/BIc4clBwujWXTg38NkNbvTVzf31/9/EUkkDEt+BpNym6RDV8rZa
	 gFMfN2/bu9wgm/vWSAnD4ERZt51aQmUAxiYwD1zn0+jwiio9MyjxwGKPIDfN8O82h/lZ7
	 DZbiaIDuc/T9QFZHTWbRj4RUUvBeb8I9nfYU8dka2bsE33J8A3KAgiuLwGJ90PRllDYGW
	 Vsxa/pQaoRx0fhI0bYOXWfL1lHwAoboQyMJjfmWFyTuBPsNZGkT0dudFdYHPHjkIP4IRY
	 OY8IdQd4puCyrzlrIxwijsJGKeIaPA6q6HRO1wnJTJ/KN+mXSAuEWSMcB7pYp1vYmNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793635127;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=YfFUwr93Vcj0jqj/f2BhJnmtIuEuXP2aOzsozQyEEdU=;
	b=s0EULJNtMAdt0svtIIhYAFD1lUFsgT0hWa9ZL89mdvAtpLkPyMxtoYJ5lVrduQzLV4BU
	 bbWJbZfjFCIl9o7ug6UPqV4yJI6HI/U8DRlg5ZDqG0/KDbdTS3bbrVffQcraMMdn7kkGO
	 RjzNsHWjKBhaklc82pCkFLpizUTpjjxcDImRs3C+he+1W0FnheQJYJhZuqLOt9F5+UnDW
	 kq3N6aWUPt8nQvnNg+Phdvytx6udmUBg9RN4q+uQslcwGWWWsUirIFfRdvNX5Tv7hymsw
	 6ZGKcK9ox6RSoaQh+fEM37YHRwwnMXi6fynUTxF3468xWsFop2qCb5sxuMnXAqIJTjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Rngf56Pp;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEBC9606A5A4
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 15:58:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEBC9606A5A4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Rngf56Pp
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3ac9f49b984so1804898a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 07:58:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793635126; x=1794239926; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YfFUwr93Vcj0jqj/f2BhJnmtIuEuXP2aOzsozQyEEdU=;
        b=Rngf56PpU4IGjFdOCYHAQULBmDzlyozEeMPqw0mVhu7drgDF9CoiKq/+hT4IYGoz0F
         QcRQREfmYdBYWnQgJTFjALPHA88iIDJheI19XzEt6WifTEAttfHQglU+sqiNBrRd/rVr
         yzxu7PVrXWD9M6KZmJuoYSs/kAUixqF6DrFO0tR63VEEr/D3s3oHpjaNICGD/nwe+6U5
         KulvG0Hw2n7vPgJV5/ZULkHLSu20wLYJ5USTgpKp5dSBxFNtfwjAC9hqdHTFIcKibOkM
         SmT6mRmYUpmWDI4OYzlNo18W5rROkfBZlBLYdA/lRcr4cKkchGVZoLLdCcN7ld9Rb/bV
         RlLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793635126; x=1794239926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YfFUwr93Vcj0jqj/f2BhJnmtIuEuXP2aOzsozQyEEdU=;
        b=DD65o2XbbcO057OKnpoGVBcgG4tehG8oxHswfqwZysbK07bT5vEdazNVOv2Mk3T0ZB
         OWEa4W0imsNLPvhcoUztnfIxL4SxeWjcAxk3q/YFSVyQpKbR6Wj1PcMjV+0mofVbiBXr
         rlupV419T7zb598XHVmmhy4nhXwsPID9sneYN4smt9dP6UpwII0+v9G7rimGLga1KiX1
         TiSHDcYACTVBjEfwy0THZSThKaDIdZ06UqoF0BmFuYNNNBQd3pXhgym4Eb+NN+IgUJLm
         lvtofCAPQu3ZrUPJKYW570k/gLGp255cdy3Zy4SqhKjVgYxjhTYK53FG/x8v6UvJQeT3
         bVXA==
X-Forwarded-Encrypted: i=1; AKwUvBwbQ0ZObfn1XTnBr04sqt4vudJIf/g8Rjzs6h8BK2dgkOmuZx7MSddzANYjm88/ls+/giyJoy6GsLnUZVw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8mgCgMOIsftSwkgBKZZK0j2ewU6XxCjWjWA7JPgOo+LQsi2Dbo
	ZnZNJQ0UlLhf3xs3ZAPH6YQ4dIwDz2jmkNk0BHtUJCD7V8+hie9/juDA
X-Gm-Gg: AYBFou2SotiIZyX5b8PhQUD1eMvQcq69vK4oRjK9cXyW/8uF5bydCUe5r8udgIcBlff
	G+4D5mHjrNuyiYPw4HExCBIx8oD+ILaNLG7aUNKdQDcE6xGjAIrNNxhudfgTjz5d9QpXAikrQfV
	3Hy8emxsSzXXWAbldZqH1hv0qngjwgifPPhf91kOIwQRaGdbIy0yVIUHdtx+2zlsYo9tqDikK8C
	6fSW9qRLQPXUMh80YBgAFRWUcKvkbor+mivzjEyG1AdXPc+cjxx7lXna+kPzWOremijrqIKIHQU
	62YFdvJtaZNfgX+QDitQDfVG8+w+eCcbzFTG7m+p5FdXPnI+2WqEOGpvU+U2uSdRm+TJdK1twMi
	OP7AgT4ak7KOqHsHsRFmMJdC6ccVTfhFMlvG6lOxXpfw6blLg/Nr15YczNKCqn0FA80q8wpUszC
	gPMSdSHTcWZAs2l5bTYnItuoAchj2Lh+zmEVNez7pdTLB5D8mW8Tim3A325QNtyTYm+dN23DFcy
	TlDjQDhYG+MtvQPzKbJx3H+Y9oK6bVRUSOqjj9UujnKAVYxfgPBVFpse7Xv1OWNXXzCQp2JY7Bm
	I/MSWCEojqQPwV5XLWY5YyE753GLYwegIydEWr9ixzmd9dJXSUqb
X-Received: by 2002:a17:90b:184c:b0:3ae:3b3d:c617 with SMTP id 98e67ed59e1d1-3ae89778667mr5392634a91.29.1793635126023;
        Mon, 02 Nov 2026 07:58:46 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:7680:28::4:396])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e7d429fsm19183949a91.2.2026.11.02.07.58.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 07:58:45 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next 5/6] net: dsa: tag_yt921x: handle FDB suspend copy tag code
Date: Mon,  2 Nov 2026 23:56:37 +0800
Message-ID: <20261102155641.3682626-6-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261102155641.3682626-1-mmyangfl@gmail.com>
References: <20261102155641.3682626-1-mmyangfl@gmail.com>
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

Prepare for upcoming MAC Authentication Bypass feature.

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 net/dsa/tag_yt921x.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/dsa/tag_yt921x.c b/net/dsa/tag_yt921x.c
index 294784ab6694..b8a5b6cdb5c5 100644
--- a/net/dsa/tag_yt921x.c
+++ b/net/dsa/tag_yt921x.c
@@ -49,6 +49,7 @@
  */
 enum yt921x_tag_code {
 	YT921X_TAG_CODE_FORWARD = 0,
+	YT921X_TAG_CODE_LEARN_SUSPEND = 0x16,
 	YT921X_TAG_CODE_ACL = 0x17,
 	YT921X_TAG_CODE_UNK_UCAST = 0x19,
 	YT921X_TAG_CODE_UNK_MCAST = 0x1a,
@@ -135,6 +136,7 @@ yt921x_tag_rcv(struct sk_buff *skb, struct net_device *netdev)
 			/* Already forwarded by hardware */
 			dsa_default_offload_fwd_mark(skb);
 			break;
+		case YT921X_TAG_CODE_LEARN_SUSPEND:
 		case YT921X_TAG_CODE_ACL:
 		case YT921X_TAG_CODE_UNK_UCAST:
 		case YT921X_TAG_CODE_UNK_MCAST:
-- 
2.53.0

