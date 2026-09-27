Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF795282F3E
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 07:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790494863; cv=none; b=nsRK1Xhi3DbMlNfQc8kJ+C+R3h5+LO6R+ld6U1umMMSginwBQnxRhWToZ8PRSoD7uvPC2RUFyjE/lGHyDjsbnrKaD2DXZJFw3FaMCGGGYcat90riMvDufpi3zY7eKfU725YAmB7ISVUQTLugEBr+Cfh0xZQrInZvakR9i30yZGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790494863; c=relaxed/simple;
	bh=wL5CQOPFGQgN9kAiy33M9BaGwqNuBlYJXqd4ypXRE2k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t8hTiIu2mjTpyRLZ2BgZLGBcymA1N6TbaY0fmza6a/eRkd8l9TUCAZ9mKNg6RzaMyX0H5s+LM8blww3+qfZ8SJDv+JDGpAWIh0Q/D3kR0v3UNLFkJtDsAvcLFddGMyhaWo2k6av0SZIKAS8MC5KT7x/R8aXnb1YGpK0or/kdUdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A6WTv3BV; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A6WTv3BV"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffb83bf7aso7528865e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 00:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790494860; x=1791099660; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vaMkfOeTY7WAaAgMRdIMicY7X4DXefg1bKqcol366WA=;
        b=A6WTv3BVsduxgfzbzr2nHA7lFAQa/ptaAEnUUUHz9aL2fq7KxPs+WGPpnF7qCgVNs7
         DuOmGmKtdjE3a52aMFpWDTii3NVY21EMpUFVZtWsLEIlylAhNBN170VRdaUkGmPKHiz7
         RG/X+dVlh+zblRE3PjiQKL5NxKE/4Ox+IJHJ8SC4gNmW1Y034lNR98czCTzYO88urdR3
         dfm8boY54LkCtcnPTu9YgVP8AyatbQyfBWjhQouwP2zezjelIY6XTn/4RnlR4yHDZfi6
         qKatZFuoxpU9cVhDkmRgFF9HAb1Riv8oMVDRPC/B61GRbAune2mSHqlJywM38bHb+QG4
         0MEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790494860; x=1791099660;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vaMkfOeTY7WAaAgMRdIMicY7X4DXefg1bKqcol366WA=;
        b=t7vUdzHUSVYKxH0J8gJSXi3K2+JSP/pwgHaqrnaLXbOw6cnS5RLKSJa0PbTScNRS6a
         44/Re17ElmbL+OJdPa63PbBrcNQKhPAOb+0ESWHPcfOc/lSphAMGgMQlvTKxdWQ9juZf
         s21IAyic3cQXco0cKQ6AfIb0M+aJHmmN3ItGvvPsH14o5RMMWtX8PryHHyC5/E0XvH/z
         v78bUrsONBl5nx80yJVL9wDog4QxefGOOkhmRF2yhmlyeKwqlzWbdpKcCu1fLG+epzVe
         XAAzXGO3Wc2+V5+LNE2I7Ezq0msTaxxQJOdbRqvxdKGdxMRAGn8SYsNVDVKfo9fi4g9L
         7W+A==
X-Forwarded-Encrypted: i=1; AKwUvBzlht6QUCgPwbL9QkMZrpdByosPbnioDj1GqPtCvQcFR31W04nGh0NZx8xx0gYDENDaYS/D8OQuwad3AnQ=@vger.kernel.org
X-Gm-Message-State: AFuF++k9hOBNKBFwQKaNeSqUWcUpSTYOydTPx0/f8SPhv8LvHxZYA0St
	Lh+aSW3siT6owRn7CWZv0tpmijjWl0FlAx4OW9Vbw2x/qVd2zqXnxWVs
X-Gm-Gg: AYBFou3XSulLHrZ01YkSq337fP5dIAURhfGo2JBBnJD/rXrD2wkNkxucyInJveiAqod
	S8Q1BLSy+NxhPoicze00sBryIKwjqGqw3rAgjNPHQZJdjsbN0dHoQidXDgKk+zQg6T7G0fM/u0I
	Q240C3TmhD2imYLxBfCOr9EbPrVbj4o+XIyeOYWuDsaiu89PaNjKuctGMpNqgY+3PNGKtOYWZKI
	s1HyX0YOeBb3m1MY/gcmAE76kAdfVUqFPj+58/YCxcEnhp6HBmR1CCCodPxh13Irg/y6LVgRa1Q
	4IEL49ff/tRL9Hd+8vUlad1vlwbgfq5kU6g01a1anawZ8Dr76QNlZOJVsxdW/9S7j43xKH8opaW
	iYcM/KZ+mhhaRahCZclo5SKHQGzWhBggqpKdadNoRqKNC3QCwuqyH29FYFiY4NkrSHe/VfNjN4Z
	2jp9i4tv2UrQEGLAp958sv1zJZqWIJhL5J02a6iLDQmL8rYule09WGtvgHA88=
X-Received: by 2002:a05:600c:348a:b0:49c:cee0:e7c1 with SMTP id 5b1f17b1804b1-49fe66f4ce7mr174454285e9.16.1790494859604;
        Sun, 27 Sep 2026 00:40:59 -0700 (PDT)
Received: from gmail.com ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0018dd0ffsm40453775e9.2.2026.09.27.00.40.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 00:40:58 -0700 (PDT)
Date: Sun, 27 Sep 2026 09:40:56 +0200
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: syzbot <syzbot+89001660f14fb7684c83@syzkaller.appspotmail.com>
Cc: davem@davemloft.net, dhowells@redhat.com, edumazet@google.com, 
	horms@kernel.org, kuba@kernel.org, linux-afs@lists.infradead.org, 
	linux-kernel@vger.kernel.org, marc.dionne@auristor.com, netdev@vger.kernel.org, 
	pabeni@redhat.com, syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [net?] [afs?] kernel BUG in
 rxrpc_destroy_all_connections (2)
Message-ID: <arjFl-vgg5vz1WWN@gmail.com>
References: <6a73d174.5aeeccc9.207e63.000c.GAE@google.com>
 <6ab29768.514bccd6.255447.001e.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6ab29768.514bccd6.255447.001e.GAE@google.com>

#syz test: https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net.git a7bfaba4823e

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
