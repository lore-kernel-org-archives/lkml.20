Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792445221;
	b=klLwH6w3IORWXW6uVLR/ol0vMbt1hGNqGUtY0eOuxqBFGfQxWR46sMAtwzl/CZiDQFYe
	 9gaobNp4YJ7K+SchSn6a3EUJXajn7qKPC/Rmzgefl0GMG13MMzdvcx4HhRr3hNZNdObdc
	 OajfRHEL6P8r+n3U6++bEEDKraSE9jt8ds5DdxNf18cgUOXL8YMQAjuH9l4Z6gm2PLN4Y
	 5s2YbktBG3xejIvzvD+kE5O9yYhShaUeiWZxLdTbQZ8+aAxYwxY9BMyjT5thzMsdtEwF1
	 uxctCzLheW/5f6gpk05EBcKVQYETO0wJEB2lTJ/a0cAHZIaoxO8JLAzWNpziHrcgKiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792445221;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 X-Relaying-Domain:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=B1di3TzqQctz9kRhw9bHhZony65keKfMNyZ1xG2QpHc=;
	b=x1dOpOPaiAWeIYQBpJBEd3Ac7eNXKMOH/q2nDduVeX1J6hjeT6RpUb0E0UKrPzlMt6BH
	 sG4p9TnuklcHW/pUetS9+8R2gCSXs9WV9/7CZDv8xlGwetaMzKylSSLqWIbCr4R7KSZMI
	 DW5EoO8uipRXELN0ug/nwZut/pb2pBqkTDFYMNYDj8Gj2K6XdeFYbi15xyLA36e50IfSE
	 9lH81O5UT87Y6t55OGI2c5CeNXupiX3I+HTH64t2GV2Nhv2fS3lFv+S1WK3KVt2GY1Py1
	 l3m8JJTJq6IjctDXGuyEdtApiR54j2dKIqkzKKebSG/iijjjmzVfjg8GHpBUS2fiaew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=ZdJ673ga;
	arc=none smtp.remote-ip=209.85.222.225
Received: from mail-qk1-f225.google.com (mail-qk1-f225.google.com [209.85.222.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13F1606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 21:27:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A13F1606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=ZdJ673ga
Received: by mail-qk1-f225.google.com with SMTP id af79cd13be357-93f22a8515eso241070185a.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1792445220; x=1793050020; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=B1di3TzqQctz9kRhw9bHhZony65keKfMNyZ1xG2QpHc=;
        b=ZdJ673gaeDG3cV1to9nMf66D5iaBPjjTbH3dUdaEfRr6Ctpe3JOLnPSQjDTBTk9g51
         fsT4vsKZ+54k4OeYEmlC51JIWPzIY0h7BBxIUCfuonZ0er6xeaoUXurw9xOvTuf1/KRa
         KCsqDH8eHyuBmArANS/6qcOsF14FUrfGTJCKe9aAUr6eJWzjqi+m+thIeG3e7ToDXuZm
         5h3nVP4caGzyVfM7/MnCF+xYbqXRpqZIk44Cc++eikQz/vzqk5Tt2TcYN6U8oDVxHSN1
         pZshE4QeDleMU4jrAradK4UV4vfzAuPvEOdS4JCnZDe04IewhfHTN2jzAMixBgR7dzZq
         bVeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792445220; x=1793050020;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B1di3TzqQctz9kRhw9bHhZony65keKfMNyZ1xG2QpHc=;
        b=nrYLWMiGJb9jY+JMIjHzaJkHZjAXSsHgMmSZJBzi4pqLNR63DU2pguPlI84eKnBtVY
         SSVUDVsCTbftya7ak1xnrwU8B7hI6D/u7EuNq2MTGBoQg5+jxzXQy6j7yIu7ZHNVTEu9
         VNmDcyASgZb5/HMNmRpF28yF/eDa8I8g3Qdvv6rXUGAKCLvba7uCelOebnLgXtZY8gs+
         oIlcexkkuXaICISR5+qNvj5eUfdfM+aTxvwAHtBOxBc+Wx2zinKs2Qi1BvRbtwTd1L9e
         ar4DeVIltrMoeyqiEEv/n3l6NoA1ClJQm/bTwff+gImcc0duCmgW9FICBMHAQE4qgLK1
         +RDA==
X-Forwarded-Encrypted: i=1; AKwUvByAH670W6l9AB8WVCeDWg0zXq5J/2h2X4U9VXhvm9UxubGT9+YUnpzI5PBX7yV0FGQESa3gl60JygqItuI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLmz58n8I5E7DWK73EIxfE/PFlsr86/rDXuwWdowfpfqtIiYXB9
	/s+f6EQD59g19OvF6LVVyiKFib36OSyJyRYxxlUWE4Y+DENBWdsMhkajU4VLCHiJ2xnLPitDimK
	d4CJNzAZHxoKlG1IZHpVK7Q+F359A/MsIDtze
X-Gm-Gg: AYBFou1NTcbdz+WD/slnVCZKGxOiMKe4Gv94mWoS/mToTc903tSbI+V/pCSqC0O1bgd
	6sBgr4aNbDYHGcb2OUlZAxmWBm17hy72EzqbOESbxx1DBMJplQYUdvM+QVjRisuxAEmu5pf/bwY
	Ao8zBGRUTT0JEGtH9dvOd4OSaxu+3kjLTY2b/77nTs+7pDXlP286bRvVjHid1yBr8sBSXIcS4df
	i06K9Xk9+hH2+rsFeOBFwq3zUf7JwjH0yiW+kw8Fc9j+m4uZbruvKS/P1ur9Qx9AeR7HAWaUmhC
	epoRKbqPGexYLVWlr/rApO3AoARGjzEb/nmDNSDPE6tZ+0MpjK84nxNt28qw9Y8RgxFDam+G9qM
	GikY3+1flAp32+2/FIDAyI8pj9CFcsrI+b9Y=
X-Received: by 2002:a05:620a:3710:b0:93f:43a4:a479 with SMTP id af79cd13be357-93f43a4a615mr460264585a.66.1792445219472;
        Mon, 19 Oct 2026 14:26:59 -0700 (PDT)
Received: from c7-smtp-2026.dev.purestorage.com ([208.88.159.128])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-93f4b03ee6esm8517385a.17.2026.10.19.14.26.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 14:26:59 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-rjethwani.dev.purestorage.com (dev-rjethwani.dev.purestorage.com [10.17.2.234])
	by c7-smtp-2026.dev.purestorage.com (Postfix) with ESMTP id C3AF0402B8;
	Mon, 19 Oct 2026 15:26:58 -0600 (MDT)
Received: by dev-rjethwani.dev.purestorage.com (Postfix, from userid 1557719937)
	id BB53CDC0D6A; Mon, 19 Oct 2026 15:26:58 -0600 (MDT)
From: Rishikesh Jethwani <rjethwani@purestorage.com>
To: netdev@vger.kernel.org
Cc: john.fastabend@gmail.com,
	kuba@kernel.org,
	sd@queasysnail.net,
	davem@davemloft.net,
	edumazet@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Rishikesh Jethwani <rjethwani@purestorage.com>
Subject: [PATCH net] tls: device: keep tls_sw_fallback() from encrypting its own output
Date: Mon, 19 Oct 2026 15:26:51 -0600
Message-ID: <20261019212651.733565-1-rjethwani@purestorage.com>
X-Mailer: git-send-email 2.50.1
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

A socket offloaded through a bond has every skb validated twice, once
at the master and again at the slave. tls_validate_xmit_skb() passes
the master-level call through for that reason (netif_is_bond_master()),
but tls_validate_xmit_skb_sw(), the validator tls_device_down()
installs, calls tls_sw_fallback() unconditionally, so it encrypts the
master-level ciphertext a second time with the same rcd_sn and IV. This
cancels the CTR keystream and exposes plaintext on the wire. For a
complete record encrypted twice in one skb, the second pass also
generates a valid GCM tag, so the peer accepts corrupted data without
an authentication failure.

Guard on the content rather than the device. Offload plaintext always
carries the decrypted bit (tls_push_data() and
tls_device_write_space() send with MSG_SENDPAGE_DECRYPTED), so
tls_sw_fallback() can pass through any skb without it: such a skb needs
no offload encryption. complete_skb() now clears the bit that
skb_copy_header() copied from the plaintext original, so the fallback's
own output passes through any later validation pass untouched. This
also does not rely on every path validating a skb at both the master
and the slave.

Tested on two hosts back to back over a mlx5 port, the only slave of
a bond0 (balance-xor, layer3+4), so each transmit is validated at the
master and again at the slave. Run from each host as sender, a TLS 1.2
AES-GCM-128 TX socket kept open across an administrative bounce of the
slave leaked every later record as plaintext before the fix; after it
each record is encrypted exactly once and the kTLS peer reads the
stream intact.

Fixes: c55dcdd435aa ("net/tls: Fix use-after-free after the TLS device goes down and up")
Cc: stable@vger.kernel.org # needs commit fc6d80eb5044 ("tcp: prevent collapsing skbs across boundary in rtx queue")
Signed-off-by: Rishikesh Jethwani <rjethwani@purestorage.com>
---
 net/tls/tls_device_fallback.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/net/tls/tls_device_fallback.c b/net/tls/tls_device_fallback.c
index 3b7d0ab2bcf1..24fba12febd1 100644
--- a/net/tls/tls_device_fallback.c
+++ b/net/tls/tls_device_fallback.c
@@ -192,6 +192,14 @@ static void complete_skb(struct sk_buff *nskb, struct sk_buff *skb, int headln)
 	skb->destructor = NULL;
 	skb->sk = NULL;
 
+	/* nskb carries ciphertext now, but skb_copy_header() inherited the
+	 * plaintext original's decrypted bit. Clear it so the bit keeps meaning
+	 * "still-plaintext, needs an encryptor": a requeued nskb would otherwise
+	 * be re-validated and encrypted a second time on any re-entry into
+	 * tls_sw_fallback().
+	 */
+	nskb->decrypted = 0;
+
 	update_chksum(nskb, headln);
 
 	/* sock_efree means skb must gone through skb_orphan_partial() */
@@ -371,6 +379,17 @@ static struct sk_buff *tls_sw_fallback(struct sock *sk, struct sk_buff *skb)
 	s32 sync_size = 0;
 	u64 rcd_sn;
 
+	/* Only skbs carrying the decrypted bit hold plaintext that awaits
+	 * offload encryption; anything else needs no work here. That
+	 * includes this function's own output (complete_skb() clears the
+	 * bit skb_copy_header() inherited), which is seen again when a skb
+	 * is validated a second time, e.g. a bond master handing it to a
+	 * slave via bond_dev_queue_xmit(). fill_sg_in() would map it back
+	 * onto its own record by tcp_seq, reusing rcd_sn and IV.
+	 */
+	if (!skb_is_decrypted(skb))
+		return skb;
+
 	/* worst case is:
 	 * MAX_SKB_FRAGS in tls_record_info
 	 * MAX_SKB_FRAGS + 1 in SKB head and frags.
-- 
2.50.1

