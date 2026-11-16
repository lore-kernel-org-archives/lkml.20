Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794822789;
	b=RYwYUCa2jn0BrMWjfiWkUs7EAQY7ZL5TRFBpEffnCHaTcpMvGaukpko85VNuqE45atBK
	 JEXvvYRcp0Khe2RS1m2uA4gPcQs11sh5t6HIyGIYHan19rL1liYmxrB4WneVsvqqDEq8N
	 2l69bqwQIwFENtQbftBnMDSQA7QU++0CIsP29ZbRjNhVPDMe3+aWpAO6bWQiD92fI3tC9
	 4mY14znAh/OfiX2vhcGwYxDLuLkaVXwoha3D4wojDr0o32L0sydadBCvgAid4GaK9fqtf
	 iSRvTC+r7Iluj9vRVzNjoI0h9SA67EZPdMudNgNzMd0Kski8nNAkTgG7TNAX72TvX6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794822789;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=SgMJefBKejfBBWtoRWd6v8uWkLAJ3E6A5yIR7lhjHIg=;
	b=Fl6CdoJ5SrN0fHrZMPHERNTYSzddsX3LtVJXxv/urZI0+ItaWAcaPWyk8kef5OVojJCb
	 /GGn3bytcKZoaY8cxFMdiODtk4G5yx4DX3HqB5OsM6yqeDXvuLIOH46qewvFswMYJ6GXL
	 fzOV9qrGw+h3TgfZJK6P3TZIJC654d8DsmRY8I7lq+E7dlsN6yg9GJoeP5DlbYAQL+kaK
	 6YYXjGVT4mIeh2rU0sk8BEa0kiJAdBVsPUZvW+5cmL/zKfb2Mt5+RNayZ8PNlZhmfngEI
	 V4Ulgcsh3vn+pfVi9gXwR7DFq+VagLmCPSNz4yDxt1SlgjF30a0wgrL6dSKqUjUqaHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Slsq3ar2;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=PVzHjUQM;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2252606A32C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:53:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2252606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Slsq3ar2;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=PVzHjUQM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794822787;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SgMJefBKejfBBWtoRWd6v8uWkLAJ3E6A5yIR7lhjHIg=;
	b=Slsq3ar2chBKeeKWE/wSZdTt2+FHZ39DCJQCcqRusdB5a31309o7RLlU9Cgdn+FaJ0dXlq
	5T9CWlc5+5wXVYsqeN5nN2Y+nTdhGOhOQnIBA+rpRjiMLJhQzHa4Y81Z/B7OMtaUMR4g4r
	1uTm36Ve0SmX0Pncc+rHQciwn9SkHqI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-44-5JKORyD0PUe0f1Hzk1Elnw-1; Mon, 16 Nov 2026 04:53:04 -0500
X-MC-Unique: 5JKORyD0PUe0f1Hzk1Elnw-1
X-Mimecast-MFC-AGG-ID: 5JKORyD0PUe0f1Hzk1Elnw_1794822783
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-492b5408dedso1761338f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 01:53:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794822783; x=1795427583; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SgMJefBKejfBBWtoRWd6v8uWkLAJ3E6A5yIR7lhjHIg=;
        b=PVzHjUQM49dhCS8Jnfv8i/P0buidgGFeSeUY/F+OE34JnJEXY24RWF1Pb2rYMg0F9o
         Zi6H+uytTJpfvJSG0qeqsoGs/sJ977LGIazJbJr2+GWlOOjQtvPslm/j+8gYScMlM5BY
         WxJCWQ38Lvt4UmASjyEc93LvHN7dLpqZvl0QvduIBKsVzuTdEOrnBJboftsckhvRACHz
         bm6LFSTlL3OFCqAy9lkwJLkw4umJaiCEPkk0J77wfFYPeWL8D46Zkqa8x87oFQO4ShV6
         sE9UuJdNsHoTj0k2fM+slJx3oiVSqsGreDGbdvMUShode9OHYDAg93NMFOswYNkRFAfp
         pfHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794822783; x=1795427583;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SgMJefBKejfBBWtoRWd6v8uWkLAJ3E6A5yIR7lhjHIg=;
        b=YlWI2/nwc4nLmr/AbYDlfEk12YAjogMzN3dJQmyDKkBnYa+4m16R0O3lOopPZMmDu/
         apnrm9BvPx+qDu3gcRFN6kPTRBcQbPdenCaWiFlIa2NSZ8gOsmO1yh2+Abu0x75+mbUG
         Yn6kIn8aGwfWlyaystdWl85gxEj3RFC3b6BI+OkwsF7PHwoIlZFeKmKrZvcFOh3i3vsR
         /TkUYl7cjZzji2q+PfgS4m1Fd3ypNuYZ6BJS5TwNTikQ9U+hOHsOFoNBGWSxWDd1NcR7
         c/B12lQojj1+nsF5QqzjHbbIo56VjibLTbcKeEAkLplr04rPrleRM0MESe0qy2qWxSZb
         k+eQ==
X-Forwarded-Encrypted: i=1; AL+hErG65fO9xjIBAx9+o0v6jDq+hRX+GQ9eT3W6Rs8c+Vxb0Db1D8gL13WdtrCOvY76FU+okV68RlscTc/4eN0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9o26NRSmGOxWmFK8+2Wvg3wVY2P3nD5988OxdoRvJA4zwvQt6S
	o3WspG3OwI/1NSvzYXG89UAq7f1uGL8YWVGH3uraaN3EUEKmrppmyKUcsFnLJfJ6RywrxrVXely
	6m4uc+XqzNkOIN+NsRtMyjLNLL9Q+Qna1GVU5YCqzWu+LFp5RmHCQ904I2c3zXuaetw==
X-Gm-Gg: AYBFou3sv1WaqhazhCrazW/O/V5NZIGSF6r5vBCoxYNEtiZFWU4B8NC91Ocangh0GXG
	6kLAH4ptqaNdbbvGXVdtpBEBicfLiNRWQ/fkLNEhBsR9xZmo0u9A177CoW25XFXZLdMpMXIN/aU
	fuKuCM9H5o0sCMkN6h8puvO+uZsKWWqpQTV1oRsVFnyv0wejC6fhT7aCi5Wl0Y1zcJ+L6pIoIGS
	yeBHCppbxJR04FSm5fyr/eMMv+UO9yEYbzTJILNZU1x99Rl4925+7ImBldNs7raEuo4iJJFs8pK
	imIQorgpk2eBj0t2vXu2JeBwh3U5HQi9i3qWLx5Z3fr4JahRXYLNCNm78Kf4bEBzQa62gkUwyTF
	3TIjrD+3Hw0yvnyoTU+OX3Faeu3NOWeSt4PhhvqR2Jg==
X-Received: by 2002:a05:600c:524a:b0:4bb:6cef:d14b with SMTP id 5b1f17b1804b1-4bb6cefd40dmr73286075e9.2.1794822783075;
        Mon, 16 Nov 2026 01:53:03 -0800 (PST)
X-Received: by 2002:a05:600c:524a:b0:4bb:6cef:d14b with SMTP id 5b1f17b1804b1-4bb6cefd40dmr73285555e9.2.1794822782478;
        Mon, 16 Nov 2026 01:53:02 -0800 (PST)
Received: from redhat.com ([2a0d:6fc0:151e:a200:7a96:1b15:81f:ebed])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2842e6sm384663765e9.4.2026.11.16.01.53.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 01:53:01 -0800 (PST)
Date: Mon, 16 Nov 2026 04:52:58 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Congjie Zhou <zcjie0802@qq.com>
Cc: netdev <netdev@vger.kernel.org>, jasowangio <jasowangio@gmail.com>,
	eperezma <eperezma@redhat.com>,
	xuanzhuo <xuanzhuo@linux.alibaba.com>,
	andrew+netdev <andrew+netdev@lunn.ch>, davem <davem@davemloft.net>,
	edumazet <edumazet@kernel.org>, kuba <kuba@kernel.org>,
	pabeni <pabeni@redhat.com>, horms <horms@kernel.org>,
	virtualization <virtualization@lists.linux.dev>,
	linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [BUG] virtio_net: RX stall caused by masking callbacks after
 NAPI ownership release
Message-ID: <20261116044750-mutt-send-email-mst@kernel.org>
References: <tencent_AA4F39DA7ADE330C721C03AAA832B92DD608@qq.com>
 <20261115175445-mutt-send-email-mst@kernel.org>
 <tencent_94953697D2BA27275BEF7A26404E69800605@qq.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_94953697D2BA27275BEF7A26404E69800605@qq.com>

On Mon, Nov 16, 2026 at 04:47:17PM +0800, Congjie Zhou wrote:
> Tried your patch with my earlier TCP test. No more complete NAPI
> stalls so far, thanks!
> 
> But LLM found another possible interleaving, though. I reproduced it
> in an instrumented KUnit test with injected delays, but haven't hit
> it in the TCP test.
> 
> With defer_hard_irqs=1, it goes like this:
> 
> CPU1 / old poll                  CPU2 / busy-poll
> -----------------------------    -----------------------------
> Complete: clear SCHED,
> arm timer, return false.
>                                  Take NAPI ownership.
>                                  Enter busy_poll_stop(), clear
>                                  IN_BUSY_POLL. The final poll
>                                  enables callbacks, then pauses
>                                  before completion.
> Watchdog expires, sees
> SCHED=1, exits without
> scheduling or setting MISSED.
> Disable callbacks.
> Timer=0, SCHED=1, so skip
> napi_schedule() and exit.
>                                  napi_complete_done(..., 0):
>                                  defer count=0, no MISSED.
>                                  Clear SCHED, return true.
>                                  Queue is empty, exit.
> 
> Then the device adds a used entry, but callbacks are still disabled,
> with no timer or poll pending.
> 
> So SCHED=1 at the check, but that poll has already enabled callbacks
> and won't enable them again after the old poll masks them.
> 


Oh good point.  Maybe let's just check the poll list.  And I guess it's
cleaner to add a helper in net core than poke at low level fields like
this.


diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
index dd2c41ef6fbe7..0984f81848174 100644
--- a/drivers/net/virtio_net.c
+++ b/drivers/net/virtio_net.c
@@ -740,6 +740,8 @@ static bool virtqueue_napi_complete(struct napi_struct *napi,
 			return true;
 	} else {
 		virtqueue_disable_cb(vq);
+		if (!napi_has_pending_poll(napi))
+			napi_schedule(napi);
 	}
 
 	return false;
diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
index c0ae442c4344b..f728499872e8d 100644
--- a/include/linux/netdevice.h
+++ b/include/linux/netdevice.h
@@ -22,6 +22,7 @@
 #define _LINUX_NETDEVICE_H
 
 #include <linux/timer.h>
+#include <linux/hrtimer.h>
 #include <linux/bug.h>
 #include <linux/delay.h>
 #include <linux/atomic.h>
@@ -553,6 +554,21 @@ static inline bool napi_is_scheduled(struct napi_struct *n)
 	return test_bit(NAPI_STATE_SCHED, &n->state);
 }
 
+/**
+ * napi_has_pending_poll - test if NAPI will be polled again
+ * @n: NAPI context
+ *
+ * True if the deferral watchdog is armed or a poll is queued.  A
+ * false answer is "best-effort": a poll can be queued right after
+ * the check.
+ *
+ * Return: True if NAPI will be polled again, False otherwise.
+ */
+static inline bool napi_has_pending_poll(struct napi_struct *n)
+{
+	return hrtimer_active(&n->timer) || !list_empty(&n->poll_list);
+}
+
 bool napi_schedule_prep(struct napi_struct *n);
 
 /**

