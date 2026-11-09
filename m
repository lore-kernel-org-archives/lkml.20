Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794221584;
	b=omWp4A9oI6xqWnSVQgshY4/KqXq7JA0rzEgyaI4m8gGrDtQPkjgGCaPE3PE3Z48bI7RX
	 BYFnipvtXB7AU3gMRc1uveDmuphIl7/7kK1sc10zpnK2h2maigBCGum1gKuszefv132bI
	 RxD4z+iybZNxV6YbS5y+bnndyokgd+YYp7n71vGD0YH2gIWbKojB1u7YSXLdeELvIvrBg
	 +AuxY0IDf6YdSCVWFtM0cXx64EU7AcJ/E2mldVCKGQlkbae5HB7PF+uDawUDLwR2ZeHUD
	 buekgdPGQgYbPmu+I6FnyZlgNEldMApIWgYuf3kFlHA538GpJSS24TpH1pxVpMBTY5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794221584;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7gQkAftGc6feY9izPoJt+dP0xjoWhSwyQPi0WVN939U=;
	b=uDq9GXR98hpfPJYf6hCwKvhtgfCKmUoKZv01SihCMW8PovYTKTm2TWSeV9xU7N+vvnUm
	 JaG2KAy5U5Fe4iUzHX1R3HqUBzB4H0zR16u1OpwdE4Y8+xA57S+j2XmN5JZVF85fxgy+p
	 vXKSvE6DBAnfx+pTKTKITqQp1jYO0f9nI0I45u0kBoX/KhIrhcKJd9ndizbla3NR9yTK7
	 B9i2OgAQg2DnOoYnaGm2Ke/jPWlGxHHR/8QxHeyTE5/pxKqiBu4P59D/qTNFqoYNREy3U
	 ppBWIxjuOUBVyVGVWRadOVSKLTIRpCag5Nv1Aln5i6bUXOjX2gQ704E4USxy6CPMFfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=is.s.u-tokyo.ac.jp;
	spf=pass smtp.mailfrom=g.ecc.u-tokyo.ac.jp;
	dkim=pass header.d=is.s.u-tokyo.ac.jp header.i=@is.s.u-tokyo.ac.jp header.a=rsa-sha256 header.s=google header.b=iuwFimSr;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBF56606A322
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 10:53:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBF56606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=g.ecc.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=is.s.u-tokyo.ac.jp header.i=@is.s.u-tokyo.ac.jp header.a=rsa-sha256 header.s=google header.b=iuwFimSr
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1b2513decc3so795589c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 02:53:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=is.s.u-tokyo.ac.jp; s=google; t=1794221583; x=1794826383; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7gQkAftGc6feY9izPoJt+dP0xjoWhSwyQPi0WVN939U=;
        b=iuwFimSrqv9XlDbzpW1iOYqtZawE7Uk8u6Mmd5lCyb4oscwXFUkWIxbvE8TtA+B/9S
         ZL/mgAeaqdw29LV4vO7pODn1BiuVvrQYpM5sTA8f6DbqEXfoEPeko4goDe/x4ErWC+zg
         +mODSEvFq5ljQbezobel1yT8x9XnU9x+FhdIYHgKNmWpmC7F8BECM6OYnhPOsQ0fyeVt
         YBJ4g1M23Apn+MSghcLnFUBB94s470TgEjMgU1+1iA1sU3XnwxLiIm1wyvD8SRaXtyZS
         76WQ/wBqIlMIyzzqrowOvVe0TL6FFxqOQ3bRWcwgVgz0HYZ+5GzUwjs8CYqUjWpOrh8+
         uHaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794221583; x=1794826383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7gQkAftGc6feY9izPoJt+dP0xjoWhSwyQPi0WVN939U=;
        b=iVbQMkOpfEXFNYBq0Px32fzejemG0K3yQppnGzZWs8kar4GWrmz8q+EI2mKGhutJuK
         1n/42NFbwo1CG198YD4S2VUGQJNOn762o5VCzntjKe43/VGMCJkeJkL3CrH6naP7xH4N
         u63T39+SitJx2D2B5jGrdQJkPwVVv6El8cNV0JqCA2jnWogIGfP+JUwQeaCNaObfoZ4B
         NaewFJjCnuVBMWJLnTXLMJ2cQ7BPMHBtlACW+NNg/yxJ49A8EP77sOIyxWVwOS9/Ut59
         TvAaVq/ReSQ/Tpi944IG6R7IOjj8LPtcDikxaUvvVUbcNV5YBPalaH+S3UJr4CEJcJQz
         fNlA==
X-Forwarded-Encrypted: i=1; AL+hErHc1jMAsfDZ4nmLXDrEWnhXX9bwTlwlvAWLR9dIK4t/Y3mZSXFai54cM9e13WmcMJk6KJGWv58/O8lA/Ok=@vger.kernel.org
X-Gm-Message-State: APuU4Z9KOoeGF5qtOR396PN+4Di2NyOEh4DIV4SdAp2yvjzTPx4g9EXb
	asvht28FC9q5fCs/BHwRzKlu+iJX3LkHSw2NIkCTJSe7NLIr+VUMdcEjXLY6vOVlMA==
X-Gm-Gg: AYBFou32TOaw8kS5WupDplVYT95CXGqOOL+0kgWV+/JkGstN2mxCROdBygDqLRrBB9K
	jnJNcvCW8nxhRknluViVOAAEAPTJaxThJT5qPXHCYZMDqpLkrHrSzS4/M/hYW+k8flNQs2Q0vF/
	huK4zjFg3tNTasbiI9qBbJOywiTAHea+7BJg5M5fjtP84xSYCb3cGd5GrjNbJSKL9fL+ti7UGC5
	92bRWkGm+NtoPtDQGg0idGb8cxBYF5tj5t97lQgSGPL1PoPpjkw90M54cLfBZAOfTagbTQsWTiq
	Jmc6r/fBCE3hivPI4l1fyoPuzqCJQvqtRsrXg7oHsYMf+i+cuFNpuotBmgn0oUudIswdhQc4rgk
	CXVoEwvF4mYqa5JpZDIi71Yv8fyHVIfDaFiGcmcq3LWZUKO+uGir66U/AXiXYEj9b6y63ojiNuD
	ll+YG5X27s6rB94paMbcAp/ryYf5HpY2NsI1cJbmQRDO78SnWwLF4n/kNeqyG4Skr5IsrBysQiH
	92/C4mksuJ5KRhJX0+08VLTFG2hMQfJ/ukqfz/StcrzV85F9PAQ7ndMh9oyj+NgSxnYlIDxw7d1
	NyO5RtBJDDloL4mHRNcJVFoVXopKb8N5H8+LAdQ+9dm9fz9YHQNaR+SIcndT
X-Received: by 2002:a05:701b:2214:b0:16d:1e24:5cc3 with SMTP id a92af1059eb24-1b39feda859mr6171128c88.19.1794221582983;
        Mon, 09 Nov 2026 02:53:02 -0800 (PST)
Received: from wang0.localdomain ([133.11.33.33])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b375726fd1sm12228744c88.14.2026.11.09.02.53.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 02:53:02 -0800 (PST)
From: Lianjie Wang <lian@is.s.u-tokyo.ac.jp>
To: Eric Van Hensbergen <ericvh@kernel.org>,
	Latchesar Ionkov <lucho@ionkov.net>,
	Dominique Martinet <asmadeus@codewreck.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Lianjie Wang <lian@is.s.u-tokyo.ac.jp>,
	Christian Schoenebeck <linux_oss@crudebyte.com>,
	Simon Horman <horms@kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Tomas Bortoli <tomasbortoli@gmail.com>,
	Chirantan Ekbote <chirantan@chromium.org>,
	Greg Kurz <groug@kaod.org>,
	"Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>,
	v9fs@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Takahiro Shinagawa <shina@is.s.u-tokyo.ac.jp>,
	stable@vger.kernel.org
Subject: [PATCH 2/5] 9p: ignore a zero-copy reply that arrives after a fatal signal
Date: Mon,  9 Nov 2026 19:52:48 +0900
Message-ID: <20261109105251.2545764-3-lian@is.s.u-tokyo.ac.jp>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109105251.2545764-1-lian@is.s.u-tokyo.ac.jp>
References: <20261109105251.2545764-1-lian@is.s.u-tokyo.ac.jp>
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

When a fatal signal ends the wait of p9_virtio_zc_request() for a
zero-copy TREAD or TREADDIR, the device can still answer the request
before the RFLUSH, and p9_client_zc_rpc() parses that reply.
p9_virtio_zc_request() has returned by then, so it neither bounds the
reply size nor moves the error string of an RERROR from the reply pages
into rc.sdata, and p9_check_errors() skips its size check for zero-copy
requests, so it parses the error string of an oversized reply past the
end of rc.sdata:

  BUG: KASAN: slab-out-of-bounds in p9pdu_readf+0x151e/0x1c50
  Read of size 8179 at addr ffff888004724009 by task zc9p/155
  Call Trace:
   p9pdu_readf+0x151e/0x1c50
   p9_check_errors+0x23d/0x510
   p9_client_zc_rpc+0x4f0/0x970
   p9_client_read_once+0x237/0x6c0

Also, the error string that fits within rc.sdata is parsed from
rc.sdata, but the device wrote only the header there, so
p9_errstr2errno() can print the error from uninitialized memory.

Fix this by ignoring the reply when a fatal signal ends the wait of a
zero-copy request, since p9_client_zc_rpc() already returns -ERESTARTSYS
when the server cancels such a request.

This patch is assisted by Claude Opus 5.5.

Fixes: f615625a44c4 ("9p: handling Rerror without copy_from_iter_full()")
Cc: stable@vger.kernel.org
Signed-off-by: Lianjie Wang <lian@is.s.u-tokyo.ac.jp>
---
 net/9p/client.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/net/9p/client.c b/net/9p/client.c
index e63e8c2a853df..66980ad52bca8 100644
--- a/net/9p/client.c
+++ b/net/9p/client.c
@@ -706,10 +706,11 @@ static struct p9_req_t *p9_client_zc_rpc(struct p9_client *c, int8_t type,
 
 		if (c->trans_mod->cancel(c, req))
 			p9_client_flush(c, req);
-
-		/* if we received the response anyway, don't signal error */
-		if (READ_ONCE(req->status) == REQ_STATUS_RCVD)
-			err = 0;
+		/*
+		 * err stays -ERESTARTSYS even if the reply has arrived, since
+		 * the transport moves the error string of a zero-copy reply
+		 * into rc only while it waits.
+		 */
 	}
 recalc_sigpending:
 	if (sigpending) {
-- 
2.56.0

