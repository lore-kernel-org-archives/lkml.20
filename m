Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1CDB370D6D
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 08:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790496872; cv=none; b=iH4v+4LMvU20K2n9NvnHbZpZUAluSxZ/4NPEWH3oy+VHHWXX22iGT5vqcEA6E40qvD9ihkz9Hk/ATOJ2KLGNuDnXV23Zs4NbNGyTgJy3i1K8ZSgiolpZJYw5bZDKA8a+u5Put+MEhL8lLqFqml14rNGCZ1WPtOquWta4USlvtLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790496872; c=relaxed/simple;
	bh=dAWVxC/OYmorFhr2s/I59x2nCgD2yGNjyjqnWaTeP4Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Be0F6zggqguaxVBngRGTbBYB9as4r4IcP2lwDUfxxtMi3BbHufhc2EDVOUzSG99iXf4Ce/4ACvBZYyGHYe134ATrEVwLc9ahGOwGO0f9IDLVQO1RnCPW4FrnXigaRaavgNK3AAfFT/7VtbC3+Gp/mDXVEQDt5fRbUX9uxiHI1pI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PZH82y6D; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PZH82y6D"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d3931so16430135e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 01:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790496869; x=1791101669; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WQUgiPs4tmKVhr6VI6GahJDVSjaQB4aL5i8OrCuC+Dk=;
        b=PZH82y6DvgkSX4ofsOuPCPF+u1XuAr+zmB9Skm9LYuKDldlbsjFcKhI81M5+f6k0oD
         JgarPO1LTxkFjot08UlAG/AvfBZcndOma3KbFhgbkg59MSoX70EqV63f8zSxZw4aDgVB
         uCJTIk7npqTxWgj9QEkSkVZQHBgrESNoikM0jXSfFbwQTvhFvw3C7Vg9nIp8vKZPnHOq
         DMuBMUbzeXMJIDv370oz9wh91Pazh/PuungkRdkBNpfe+/fYIjeWPBRLeZnxHA2HM6a/
         doIo2b3h+u36t/akwCUhubQ7JAA5SZc3fHPAb9mJaxShY3a5tjczyCKmuDNEUstvFofO
         vdnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790496869; x=1791101669;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WQUgiPs4tmKVhr6VI6GahJDVSjaQB4aL5i8OrCuC+Dk=;
        b=Wc2P4HyHBpbkiZrTF8MpRUheHtyU+vY3iwoMnvTVuFrSmfos7oOFerNqwWMYSEBGW8
         ceF1DsR7Aas0cmKRa06EFTpT0Z93lDQ7c9nOIJHxXn7lFU+FyjBugzNum9VfQQeSVuCc
         2UxpWFsGyzlWec2IUfFstwwEiM+/P9N8LBHcZ2cznQaSQpt1/Ie7Gjjeuy0dm02IU7i0
         y5qbE+B2jDcapGtts4VvJa8sXQXxn53hvsxxDm9qiPmIap+5q2zmuy20Hd1PMEYbOQsA
         DxU1t8FLkTQEL6llUjTalqvyNFCgxJ2DSchVuw6S/DEgGsDYzWXETFXmd/M2b5s8ypmF
         ro5A==
X-Forwarded-Encrypted: i=1; AKwUvBxQwAxEQBNP5me4Jqcd3bfNTe6YuKCRu1YR45fFdpvz7T/2lfdDVg2M9Fpde7Z75Xk0i64GYhFmch5hHlA=@vger.kernel.org
X-Gm-Message-State: AFuF++m6jG4sllibiYQPPN37FN0hY0HZ29tV3THLG8bAGZ/N0zVQjM8a
	akanLlMWgSx+8J1ljgNcKjM1gCSTLDChu0KZHTP6Gq/jh9ADSY7zEbIs
X-Gm-Gg: AYBFou2dr0S9KtbNZ4yoS55HI5q2J/3ZQI3s+A9vKo45rVyjjN5oIQxftkkdS0tTbuK
	y7jy65NJ7ugVXyehvvWzpKnCa7inpdLLgmMvswlHWBRIgEdrnvHcDEPyb4ZAAuGeowigTuGT0bX
	ihHki4rdJrpHRBo53IDJd6CWbUTIzEDqFna4T85zxAFZi9tdguEvfbLZQQYahuoAtkudUB1qzsc
	gRyab7a2J6TysyE7pBKKp109SSdaHr5L52xbN95OLnJ99QK2aSMBfBquH8ChLc8Y3Oqv9R1SQYt
	N1ogjBqoJ7u4hVWHrSURDXKYqiOp4n+YmC6EIsodFYSnt49/jHAkNLwyEM2FVQusVBIVrP0Menm
	83c4fPTGUq4wIy2KPkzE5YYtMWUkWr/8Br/w6g+a7n+T/3VE5a0af2Djt4tCk0CBKFRp/DdCxfS
	IrDyr69qXeKMbvKbrD3o9A+oor17H0kVj15YApvsBjmdTqiihpf52QuM5b+x0I
X-Received: by 2002:a05:600c:3486:b0:49f:f9d4:674d with SMTP id 5b1f17b1804b1-49ff9d4695dmr52148935e9.13.1790496868724;
        Sun, 27 Sep 2026 01:14:28 -0700 (PDT)
Received: from gmail.com ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00178bebasm42909255e9.11.2026.09.27.01.14.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 01:14:28 -0700 (PDT)
Date: Sun, 27 Sep 2026 10:14:26 +0200
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: syzbot <syzbot+89001660f14fb7684c83@syzkaller.appspotmail.com>
Cc: davem@davemloft.net, dhowells@redhat.com, edumazet@google.com, 
	horms@kernel.org, kuba@kernel.org, linux-afs@lists.infradead.org, 
	linux-kernel@vger.kernel.org, marc.dionne@auristor.com, netdev@vger.kernel.org, 
	pabeni@redhat.com, syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [net?] [afs?] kernel BUG in
 rxrpc_destroy_all_connections (2)
Message-ID: <arjO9qbNdbvdi7ao@gmail.com>
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

I just don't understand why it is failing... :(

#syz test: https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net.git a7bfaba4823e

diff --git a/net/rxrpc/conn_event.c b/net/rxrpc/conn_event.c
index 611c790bc6d0..111f0844b0d6 100644
--- a/net/rxrpc/conn_event.c
+++ b/net/rxrpc/conn_event.c
@@ -273,6 +273,17 @@ static int rxrpc_process_event(struct rxrpc_connection *conn,
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
