Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C1103C343C
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 07:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790495315; cv=none; b=gmwH/Qhw7lG5s4tQQiAvP6xQpnU4LuM7BATa6zI79NDAubfzwY51l02ZG4F9G2MxwWtAnsq1VAA9YGqHIC1ne3RBxEhaKXmRUXE43UN+ZMcNMNYURiZPGqNlTph2EsNF+R0+iQ9tCxX30LJ90OBLc/9uDV2/hVcOJYty/iVpE6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790495315; c=relaxed/simple;
	bh=QlXZLc1ldzqTCA4Tjq0uFeQhHf0Ycrwc6JhSayp6bT4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nzFgYO9HNskteZbN0Dxe3JCbeEvgm61E1HmF2TVkRZ7xAficLNP7BoV424EyhhIp+LAoH327jX1HDGd4jmMzxit2KkE+/UO9zZGN8WJS+VNXS+ZLrLa9ap6Hj1GWGf2Vudpj+SMeUewYg2khmqlqfHgOF4oic0bJBcoBCYdV/t0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KEzRZx3V; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KEzRZx3V"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e69b9e16aso23018705e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 00:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790495312; x=1791100112; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jwf2/23SjrBtgOOR44N50l1FCtrYpbibyjJyaL6BnVU=;
        b=KEzRZx3V5tfbaV25DKNZww5KIX3Ixzf3CAazzP5EibHzeinAzc1NNrZ6AVJ1lgrOtj
         Kl3vvE2lEMQcUIkGTnjcnEHdAybNXL6gwuBOMBH13va9ghe82d1pUmaPhOzw0wgOEkg+
         PNtOFR3ywCuRtJ7TFZFHDJZffqPSujLBOTHI2OAyrhJRqYTWrkvEEv1VnUoNw4Zbbq+k
         nJqKfjAGvIfeyJX/wDOWYqoVqBdqf+Lrph65ttKlgg2iRWuLxL+EH0XIHu52xZQrBYbN
         fOp1FkGA5K+MfQlssZtus5tF8YahY/XmiN4ffjgKZ4RY2nhRrTHzCWlGO2btFM/NErdQ
         60Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790495312; x=1791100112;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jwf2/23SjrBtgOOR44N50l1FCtrYpbibyjJyaL6BnVU=;
        b=TE7U4/RsgP5FBIJa/+4mbgBc5Z1q6JNXcRlPQlgE4N1AzTL1YlxqAzFX1XslXSC+Ox
         a04MiZrKh+h+T2z9rBsN+JVfcqwBdDOeDmJRqBYZk0+L3iCIaCZ5pRzEk73DSXPNap71
         fXcXlR8yk+gcpuTxjMrgrzzY26tMD9rCVBboep5ZlX1MI+YjJMTO39FOUNRwXg2t40gR
         MPy+t68K+97Ce4detz0xdXLDEv0jOS5U2g+Nabihjdg6uS8GtuyZOg9fdXohL/+8EAVw
         hpn6QrpcYrdCHrBqR+DRC5GTc8jkeZurqc4G8yxPPC1Fti27Oy7da8l8RKApbbMTKSGt
         bi+Q==
X-Forwarded-Encrypted: i=1; AKwUvByqhlHxaqLTn6kIn5naEfPNUlm8R3fN8bmsLqaPZ50mBfyVfVSo4lA5pBdyTmZrRxWjCePsUdDMu04gFgM=@vger.kernel.org
X-Gm-Message-State: AFuF++laTsDKrRANexdV14L/nsmq8Pi3qhcJKhtK40TNh0M9pbMHpPbw
	LxB6jVnsg66+KPpKXLS2JZOuWP1RCeYN7pFUyITHGm2onQxatSKAreac
X-Gm-Gg: AYBFou3aJ5qFfdWxADz3NmKZI0DHnRJM95BfPl0REzhi6p9hXCyGIo3ltBZ19n1p2j3
	aTn2NeD3Bhx9RinUWDgguB9Q32QXHrPW1PW8/Yhna2M7/8Ii8ByPRAAyx0R/rKDq5eIFejtgCpG
	d+GM+YHQKZiSjUUW12N8Iq8eNlt8kEYv4MKu5QiiiTslCrU1N6sKANvKzmqOqTv783iWzwo49CV
	1ANn1Sl/Olg4BqbiVTNU/UgaY+btbOYV5imdumqGNAXcQInR2A76//oSwjctq+ZJ5BNyfGGp+OH
	0vuyihicAmdBM9IzlqeH9sMTQ8j3vw3ZxjO3hZ51IJ6VBFMmob+338aAsiMWfo2rejnvXL6VYM/
	hZ6oVZ+WmUchL/wnYRs2MNxYoSt9GNuc5hi9YSpjhtU0k2bR1Tg6xZcdeu5v1o7P9FaDwMnRViF
	0MZPfD6XGtIp7m8zxgOjC0lPKD0ZCz11WU5r7jMIHxKU4Y62h4mXcB0fQg0dk=
X-Received: by 2002:a05:600c:a413:b0:49f:f21d:b504 with SMTP id 5b1f17b1804b1-49ff21db60bmr100062465e9.4.1790495312237;
        Sun, 27 Sep 2026 00:48:32 -0700 (PDT)
Received: from gmail.com ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0016fd7b8sm42561395e9.2.2026.09.27.00.48.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 00:48:31 -0700 (PDT)
Date: Sun, 27 Sep 2026 09:48:29 +0200
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: syzbot <syzbot+89001660f14fb7684c83@syzkaller.appspotmail.com>
Cc: davem@davemloft.net, dhowells@redhat.com, edumazet@google.com, 
	horms@kernel.org, kuba@kernel.org, linux-afs@lists.infradead.org, 
	linux-kernel@vger.kernel.org, marc.dionne@auristor.com, netdev@vger.kernel.org, 
	pabeni@redhat.com, syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [net?] [afs?] kernel BUG in
 rxrpc_destroy_all_connections (2)
Message-ID: <arjJwc6yl3RkOTRK@gmail.com>
References: <6a73d174.5aeeccc9.207e63.000c.GAE@google.com>
 <6ab29768.514bccd6.255447.001e.GAE@google.com>
 <6ab8c8cb.e548f532.1ca396.0037.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6ab8c8cb.e548f532.1ca396.0037.GAE@google.com>

#syz test: https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net.git a7bfaba4823e

---
 net/rxrpc/conn_event.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/net/rxrpc/conn_event.c b/net/rxrpc/conn_event.c
index 611c790bc6d0..111f0844b0d6 100644
--- a/net/rxrpc/conn_event.c
+++ b/net/rxrpc/conn_event.c
@@ -272,8 +272,19 @@ static int rxrpc_process_event(struct rxrpc_connection *conn,
 	bool secured = false;
 	int ret;

-	if (conn->state == RXRPC_CONN_ABORTED)
+	if (conn->state == RXRPC_CONN_ABORTED) {
+		/* A CHALLENGE packet queued for processing carries a ref on the
+		 * connection (see rxrpc_post_challenge()).  That ref has to be
+		 * dropped here because the caller frees the skb as soon as we
+		 * return.
+		 */
+		if (sp->hdr.type == RXRPC_PACKET_TYPE_CHALLENGE &&
+		    sp->chall.conn) {
+			rxrpc_put_connection(conn, rxrpc_conn_put_challenge_input);
+			sp->chall.conn = NULL;
+		}
 		return -ECONNABORTED;
+	}

 	_enter("{%d},{%u,%%%u},", conn->debug_id, sp->hdr.type, sp->hdr.serial);

--
2.55.0
