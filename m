Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD23374A0E
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 01:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788485666; cv=none; b=C5gKwMMWSsaQNFiBNLOFOn11dHOkx1lkhYCpYll/7HBMLY6/61u2imS7gav3UYRtootdrS1544p5KxUqrrMWKMY5dl1loqI/12NAm/dOuh4bnuHJzcZILcFgwLR2AChJi30sv2aKF4rgFYdlpAqNU8wv8x6MfxjjmKoyrRZmP1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788485666; c=relaxed/simple;
	bh=GM8/BdcwHHDlK8fXJoRjxtrO0P68RwvXZANwkAZwyEc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LQYv03DmMBH6xK5SP5oC6ecz3T9kIcp/pVJLHh8Ky7+S35xzcxCuzvfiDaQSeO/tmEkCH0VcDXOAoBbu6IHPMxJTdFTcJG8lKMUl2j0/TGtsFfJ/Wb+B6kO/Dt3BgrDZ9qdCOvyuhXeWm9ANXYWuikgAQHHnq2wFVreuZSw27OI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B1xv2Rva; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B1xv2Rva"
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-4b21f09ea42so422333b6e.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 18:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788485661; x=1789090461; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7PoxR83fGLuNsJ934ewOiy/11x/6BnghjXL+0BJ5Kwc=;
        b=B1xv2RvarlTI7Hb2agNNNAZbSiMyabEzyjghkdY3pJQF7uyVMZWU4y/NAoaqcZtAk9
         Dw/K3k/Ul3ZfZTdoBkJ+aREw+43ftsbpnqB0xJFNSC9AgMznWnROpxVb4TjGrBHx9jt2
         1Z3pREj64B+HWSVSiq3pa0N5Q7SguNs6+qenfaBwuV1938sMZLCXqs63troMALBOQVMu
         cwk7TQ6+/DGLYmxeidK+7l6cVvulqMqIxZXoMdtRwvdah2na8uFYPLhjM/BuORK/hcIw
         VMAGVGapl/5bVKkZIHH5J1XyPqxlndmWjnydywFCcOH3QbMnBalUOjJI1CxkybF4R1l0
         yoTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788485661; x=1789090461;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7PoxR83fGLuNsJ934ewOiy/11x/6BnghjXL+0BJ5Kwc=;
        b=oJZyDAXJNwxvVbSmCb3MvNHOoecqRuuHGmwK7nXYWTp0oSxhuRfpKwOCLKshJMywK3
         XanirZsfoOC2Ae+JkcrmvHkkQ7QWSKtJONrFu23/esCS3ekbFzhtzk91T6HRIQydevsL
         GG+okk2b3SoXdA1Gco7Pd1zzUJeahpQCQrXheLhKNXFDXhuQ3sbor8r+VowfsK9nG0UF
         ANwbT8jz6R68DvLZecpaUr7j5IM5kKmID5h7LG5n88Smfj74eb++sZSVwIcXLrfG6mEE
         c2j9lD6KB5n1lwXN0i2yYO7zbOLu/1DI7l7E7p1BYRcob+CHUOI+PIqxtwKUjMALMMNh
         +rRw==
X-Forwarded-Encrypted: i=1; AKwUvBwYpxRYocjvctpGhAbzgZlkoMI/J42rCWZMBDqBK/khh2GmGCRuEbWkzmL9UL6khyYoyOtSRc8fyfHHkM4=@vger.kernel.org
X-Gm-Message-State: AFuF++mSpk1UDcE16f1j/FhiwlwSxNz60yAD/+8KxE2E6jSYTuv/9h7C
	pfJY+5DAEAML6cvz4TkS5DfV2HfZpqgxkc3Thh2DiuYhRONEvByzTOd1
X-Gm-Gg: AYBFou0jO9jrPkq419ERqJizSWQ5INH1Xd63+RE5JuHCSoQXkmwfvoZTEPUuoTD5YWL
	F9XcDce7jLnp2qYFRJYOgHPDzDOq+HJZCMpMKY4ZinGT8a/WZeMGd9OZaFmJ6Xo2eiqkzOmxkzA
	1lijuC5HB3dySX1we8JzpPoWczS/Z1A+6SyYcwnaR8C8RhngyDRa+WqfrJd00RtP7FIVWN8jLzq
	uj5rt/tqFdNb2pmObOrAkOXalVhLo5W7LWBld8E686D687+9ZviKkfFOuePlF1T+EE2k97avl2f
	cxBLwNdhDAC5WAC+wQfOH6fj01Eo5+ndJw3gXwIKIzbB0OpqJNgW8zvxgsplga3GFy84/WFrA/5
	+15tDZrCw8ZxshXyacFwxhq9vE58vRv1pGJiBO7PibO0+icjy8xz2hUjuIcWSYUzbX4a77rqFRe
	LRb1TD9HS6sQeQ6pQ/9achbqgA9jA7u60dwThFokvHKe3Em4BPy+8hdIXIPNvMcZ8MyV/6
X-Received: by 2002:a05:6808:e8b:b0:4b9:a829:f00a with SMTP id 5614622812f47-4b9a829f91dmr560749b6e.22.1788485661343;
        Thu, 03 Sep 2026 18:34:21 -0700 (PDT)
Received: from localhost ([2a03:2880:30ff:71::])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b971b97c72sm1056345b6e.15.2026.09.03.18.34.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 18:34:20 -0700 (PDT)
From: Daniel Zahka <daniel.zahka@gmail.com>
Date: Thu, 03 Sep 2026 18:34:00 -0700
Subject: [PATCH net-next 2/4] psp: move code from psp_sock_assoc_set_tx()
 into helper functions
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-psp-prep-v1-2-d47e9c4c375d@gmail.com>
References: <20260903-psp-prep-v1-0-d47e9c4c375d@gmail.com>
In-Reply-To: <20260903-psp-prep-v1-0-d47e9c4c375d@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0

No functional changes.

Lift code that needs to be called from both initial tx establishment
and tx rekeying into functions that can be reused in both paths.

The plaintext in recv queue checks and mss adjustment only run on
initial tx keying. The dummy psp_assoc machinery will be used in both
paths.

psp_dev_tx_key_add() absorbs the dummy assoc machinery, as its main
purpose is to populate the device specific psp_assoc:drv_data.

psp_assoc_set_tx() exists so that a future change can allow
psp_dev_tx_key_add() to be skipped entirely for devices that don't use
an SADB, while copying of the tx spi and key into the assoc needs to
happen regardless of SADB vs. no SADB.

Signed-off-by: Daniel Zahka <daniel.zahka@gmail.com>
---
 net/psp/psp_sock.c | 102 ++++++++++++++++++++++++++++++++++-------------------
 1 file changed, 65 insertions(+), 37 deletions(-)

diff --git a/net/psp/psp_sock.c b/net/psp/psp_sock.c
index 045389671d7f..36eb06faa54a 100644
--- a/net/psp/psp_sock.c
+++ b/net/psp/psp_sock.c
@@ -78,9 +78,28 @@ static struct psp_assoc *psp_assoc_dummy(struct psp_assoc *pas)
 }
 
 static int psp_dev_tx_key_add(struct psp_dev *psd, struct psp_assoc *pas,
+			      struct psp_key_parsed *key,
 			      struct netlink_ext_ack *extack)
 {
-	return psd->ops->tx_key_add(psd, pas, extack);
+	struct psp_assoc *dummy;
+	int err;
+
+	/* Pass a fake association to drivers to make sure they don't
+	 * try to store pointers to it. For re-keying we'll need to
+	 * re-allocate the assoc structures.
+	 */
+	dummy = psp_assoc_dummy(pas);
+	if (!dummy)
+		return -ENOMEM;
+
+	memcpy(&dummy->tx, key, sizeof(*key));
+	err = psd->ops->tx_key_add(psd, dummy, extack);
+	if (!err)
+		memcpy(pas->drv_data, dummy->drv_data,
+		       psd->caps->assoc_drv_spc);
+
+	kfree(dummy);
+	return err;
 }
 
 void psp_dev_tx_key_del(struct psp_dev *psd, struct psp_assoc *pas)
@@ -156,6 +175,20 @@ int psp_sock_assoc_set_rx(struct sock *sk, struct psp_assoc *pas,
 	return err;
 }
 
+static int psp_assoc_set_tx(struct psp_dev *psd, struct psp_assoc *pas,
+			    struct psp_key_parsed *key,
+			    struct netlink_ext_ack *extack)
+{
+	int err;
+
+	err = psp_dev_tx_key_add(psd, pas, key, extack);
+	if (err)
+		return err;
+
+	memcpy(&pas->tx, key, sizeof(*key));
+	return 0;
+}
+
 static int psp_sock_recv_queue_check(struct sock *sk, struct psp_assoc *pas)
 {
 	struct psp_skb_ext *pse;
@@ -175,12 +208,40 @@ static int psp_sock_recv_queue_check(struct sock *sk, struct psp_assoc *pas)
 	return 0;
 }
 
+static int
+psp_sock_set_tx_key(struct sock *sk, struct psp_dev *psd, struct psp_assoc *pas,
+		    struct psp_key_parsed *key, struct netlink_ext_ack *extack)
+{
+	struct inet_connection_sock *icsk;
+	int err;
+
+	err = psp_sock_recv_queue_check(sk, pas);
+	if (err) {
+		NL_SET_ERR_MSG(extack,
+			       "Socket has incompatible segments already in the recv queue");
+		return err;
+	}
+
+	err = psp_assoc_set_tx(psd, pas, key, extack);
+	if (err)
+		return err;
+
+	WRITE_ONCE(sk->sk_validate_xmit_skb, psp_validate_xmit);
+	tcp_write_collapse_fence(sk);
+	pas->upgrade_seq = tcp_sk(sk)->rcv_nxt;
+
+	icsk = inet_csk(sk);
+	icsk->icsk_ext_hdr_len += psp_sk_overhead(sk);
+	icsk->icsk_sync_mss(sk, icsk->icsk_pmtu_cookie);
+
+	return err;
+}
+
 int psp_sock_assoc_set_tx(struct sock *sk, struct psp_dev *psd,
 			  u32 version, struct psp_key_parsed *key,
 			  struct netlink_ext_ack *extack)
 {
-	struct inet_connection_sock *icsk;
-	struct psp_assoc *pas, *dummy;
+	struct psp_assoc *pas;
 	int err;
 
 	lock_sock(sk);
@@ -208,40 +269,7 @@ int psp_sock_assoc_set_tx(struct sock *sk, struct psp_dev *psd,
 		goto exit_unlock;
 	}
 
-	err = psp_sock_recv_queue_check(sk, pas);
-	if (err) {
-		NL_SET_ERR_MSG(extack, "Socket has incompatible segments already in the recv queue");
-		goto exit_unlock;
-	}
-
-	/* Pass a fake association to drivers to make sure they don't
-	 * try to store pointers to it. For re-keying we'll need to
-	 * re-allocate the assoc structures.
-	 */
-	dummy = psp_assoc_dummy(pas);
-	if (!dummy) {
-		err = -ENOMEM;
-		goto exit_unlock;
-	}
-
-	memcpy(&dummy->tx, key, sizeof(*key));
-	err = psp_dev_tx_key_add(psd, dummy, extack);
-	if (err)
-		goto exit_free_dummy;
-
-	memcpy(pas->drv_data, dummy->drv_data, psd->caps->assoc_drv_spc);
-	memcpy(&pas->tx, key, sizeof(*key));
-
-	WRITE_ONCE(sk->sk_validate_xmit_skb, psp_validate_xmit);
-	tcp_write_collapse_fence(sk);
-	pas->upgrade_seq = tcp_sk(sk)->rcv_nxt;
-
-	icsk = inet_csk(sk);
-	icsk->icsk_ext_hdr_len += psp_sk_overhead(sk);
-	icsk->icsk_sync_mss(sk, icsk->icsk_pmtu_cookie);
-
-exit_free_dummy:
-	kfree(dummy);
+	err = psp_sock_set_tx_key(sk, psd, pas, key, extack);
 exit_unlock:
 	release_sock(sk);
 	return err;

-- 
2.52.0

