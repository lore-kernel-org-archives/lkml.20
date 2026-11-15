Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794773402;
	b=RIq4jvtc2bhwwFJbBn8KUqzDKVOYEMl6xdbz7LIT1z40DPn0TuzmogHvcWQMgAsATcZl
	 z7b++Xz/OVfUkI4/qKuQI2eAV6WFM40SkAXGRpt0n6+3nVVLLijP2Hzyd3pPFd4fmOjaI
	 6MQCfNSddeoncUjBkzKUEYeANauEW5nZQQlzPwTew757a2YjhVaOSLi1PVtRSaCjCovYJ
	 n0tVgyBmz/TQI0rVDGzPRDJG35Zbcdh5U46iaz8k1yv+p5HNmUj2rG/zBU1pkh2In4vZh
	 uPH7JE5oKzJjoavkC8LPkI7Rp42udt8h6AVBvnqCvWC7oIsdakiBixYCZ0cPvuR5kwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794773402;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=6LdHhyQ4qYGaeUAtkR2L4ANZJ6ir0QFdHTHjhQDfZlk=;
	b=R80lQm8l0ufc79I9XXAUkLGPXrMppMD2s2YdywKe+32DRUKaOTl4vynu9Nue/Vzb/FVr
	 gKJ3DeGivKO/ohyeM0OLJFg3p+qwwyfB878ZZLw3zwbFjZHzfBFCrNecYIy9Z+uO8+qBT
	 +6arjYeQQO1MFpAO1S15VWLxjHlyR7DK3Q6j1NLra0Iz/C9Jp9pckEgtOsReheiNUUWEy
	 6eWZc+bfpSa12RjEjnMWTxBg+unpTIxId4qATNGr9Bken0g603gvYXsizoK/T1X7EtXeE
	 gWUATOKQkpoqLhXPv/F5onYeLE3Zh7pJQcDZNpbEnL9rFH/xD4JpMFw16CcAC4xhkrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cPsH9iVU;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=W9xTKvsb;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7503606A323
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 20:10:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7503606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cPsH9iVU;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=W9xTKvsb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794773400;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6LdHhyQ4qYGaeUAtkR2L4ANZJ6ir0QFdHTHjhQDfZlk=;
	b=cPsH9iVUbHSe3eeKQ7bJAA4p3sxZKK2HWOFoQp5eLevLmtR0OZLYojsrAsjeK6n/WE5FYt
	Gx7kf/8n3oDOVX3JwKIMiFXc0B6Opdk7jszoZ6buw6w2bW5tTziZ0cmg45oNZhmObKX8BD
	h4SHyXAEkfHU170dFpkV0mX+NnVhexo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-153-zNP120DdNSSeeH67sey5Mw-1; Sun, 15 Nov 2026 15:09:58 -0500
X-MC-Unique: zNP120DdNSSeeH67sey5Mw-1
X-Mimecast-MFC-AGG-ID: zNP120DdNSSeeH67sey5Mw_1794773397
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4b9fde3044dso18052485e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 12:09:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794773397; x=1795378197; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6LdHhyQ4qYGaeUAtkR2L4ANZJ6ir0QFdHTHjhQDfZlk=;
        b=W9xTKvsbmIpBLnpVpr9eqXDZsFlLCgrJLf+gAYKY8n+oN8arOqjCTrG1T1/PsU186v
         PookBUfAnsc2Xqioz3+XxBpifY2Y1NENJZCmlGBVRLR4hA8Aphsy4B4DysrDP22HD4mn
         PVFthURuZx6RheT8vLYXTry9Luh18p6BJsqNJ+dc0H09oJjMiHWCEcVKX6reCbafoeA/
         m7R1hWpb9qbQklLpBPgxOvfcQEaWMOm7Mgy7gmHqZNJ7SJcBzDUi47PK/+DUcekLFiHD
         QAPpK2OTVf0vjhXLwJPf9IqSjboV26NS3hnmfvfy4MQ6bIE5SgEAdEsUgijEr6LFns/9
         8ydQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794773397; x=1795378197;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6LdHhyQ4qYGaeUAtkR2L4ANZJ6ir0QFdHTHjhQDfZlk=;
        b=0kNB2Lk31iaj63rNB+MzdFcwyiyrSzZGhFO6Kd9DYNZPsdVMI4CHCh8LZGEhlbtOas
         nz0JRvqYNM+ICZJG6sIAIEoICabN1XvxJqQ9npT9dntci1NXos9MueFBLt2w0K5FouuQ
         +Bxl82Dm3n7tUwk7JuReyZhjV5Fs6xVwy0KGQzD2s8RGsJWbURzOSss3jyL4MwGoIvsT
         NILl6CQH7yHrSuZYWiAupMj6eZy239mcb0brtGwgJzzqagVVUGJeno93UbbMNYUaEWBD
         agnCaeaK8dA8tJnJjrWcr/8luvto98gOmNfQQ/FpDa99Cu176gCR6Dl9exj3tIs5o3C8
         Hy0Q==
X-Forwarded-Encrypted: i=1; AL+hErHI5uidynpRbCthbVmxl7Z0/mprQCkMpWTN63SrLjvRRRVucZa11NBomR5428yudAGD3oB5Xc9N113L2xg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/c3/s+evPa9627vmtIMepwIcEvnGvVNjqamzCeI4DDuNUtPlaE
	/HMqv33WoMKePx56ZmwwAjFBpji7e0IoBMObvyMuNJLCY5LjKoo56/lKybkn3acHKQY9R7hh59R
	jzuOFMvfaHrLmGXmoNy3Z7feOc9gMlBrslSgBACI6cIznhadPnezbT5nzoCMiO9gnYw==
X-Gm-Gg: AYBFou1vGa1AxeEwyodehEU7nvXsS7W29etzSdf4stHHbPjFVKPpuvdx+f144XOWPZD
	75qtw1YqsN+GXuUSSBHkl2h3ZKBsOLxDVds1PpXGiE3SQuiaJtsfNhNPKQXFP0pMYplXnUwVD29
	6vzaBzXwU8v2D2E9vJJnoqs82cic7VmKtzoCkAG7+JRGl4CkolKlBELkPLqmHc4QXpp39SiGLF0
	g32QQXAWY37MSvmVg/VTVubUUlBZKpgZR7R53whMLtNBqZ5Z8JfyMZt7o5C9XY8v84+EIVZIssy
	Sql6Xs14f4rovkusLIwrdRP6pqslBe8wJzm2Md6IDo8/93XHAzwwZKONp/WLoPx6rtxp+X71IKa
	kMf78FXHRGU9unbzLi2ijrC6lGH4plM9xtLRz29x/aw==
X-Received: by 2002:a05:600c:3551:b0:4a1:992f:d0e7 with SMTP id 5b1f17b1804b1-4bb55a99d21mr192253035e9.16.1794773397187;
        Sun, 15 Nov 2026 12:09:57 -0800 (PST)
X-Received: by 2002:a05:600c:3551:b0:4a1:992f:d0e7 with SMTP id 5b1f17b1804b1-4bb55a99d21mr192252645e9.16.1794773396626;
        Sun, 15 Nov 2026 12:09:56 -0800 (PST)
Received: from redhat.com ([2a0d:6fc0:151e:a200:7a96:1b15:81f:ebed])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2538b9sm514095655e9.1.2026.11.15.12.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 12:09:55 -0800 (PST)
Date: Sun, 15 Nov 2026 15:09:52 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Congjie Zhou <zcjie0802@qq.com>
Cc: netdev@vger.kernel.org, jasowangio@gmail.com, eperezma@redhat.com,
	xuanzhuo@linux.alibaba.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
	pabeni@redhat.com, horms@kernel.org, virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [BUG] virtio_net: RX stall caused by masking callbacks after
 NAPI ownership release
Message-ID: <20261115145652-mutt-send-email-mst@kernel.org>
References: <tencent_AA4F39DA7ADE330C721C03AAA832B92DD608@qq.com>
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
In-Reply-To: <tencent_AA4F39DA7ADE330C721C03AAA832B92DD608@qq.com>

On Wed, Nov 11, 2026 at 09:36:10PM +0800, Congjie Zhou wrote:
> Hello,
> 
> I observed a persistent virtio-net RX stall on Linux 6.18.58 during a
> multi-threaded TCP receive workload. After the stall, the RX virtqueue
> contained unconsumed used entries, but its NAPI instance had no owner,
> the NAPI timer was inactive and virtqueue notifications were disabled.
> The receiving TCP threads remained blocked waiting for data.
> 
> Completion sequence
> ------------------------
> 
> The completion sequence can produce this interleaving:
> 
>   old poll                         successor poll
>   enable_cb_prepare()
>   napi_complete_done()
>     clear SCHED
>     arm watchdog; result=false
>                                    acquire NAPI
>                                    poll, enable callbacks, complete
>   return false to driver
>   disable_cb()                     callbacks are now masked again
> 
> Root cause
> -----------
> 
> virtqueue_napi_complete() calls virtqueue_enable_cb_prepare() before
> napi_complete_done(), then calls virtqueue_disable_cb() if completion
> returns false.
> 
> A false return does not guarantee that the old caller still owns NAPI.
> The hard IRQ deferral path can clear SCHED, arm the watchdog and return
> false. Another CPU can acquire NAPI, poll, rearm callbacks and complete
> before the old caller reaches its final virtqueue_disable_cb(). That
> stale mask overwrites the notification state established by the new
> poll.
> 
> The watchdog is one-shot. If it has already run, there need not be any
> remaining owner or timer to recover after the old caller masks the
> queue. This leaves later used entries without a notification-driven
> poll.
> 
> Current source inspection and local validation
> ----------------------------------------------
> 
> We reproduced the notification-loss condition using a deterministic
> KUnit fault-injection test on the latest mainline snapshot fetched on
> November 10, 2026 (7.4-rc2, commit b3dfbde62cf1). The candidate fix
> passes the same test.
> 
> Candidate fix
> --------------
> 
> I have prepared a candidate change that masks notifications on the
> relevant completion paths before NAPI ownership can be handed off,
> rather than masking after a false return. It adds an ordered,
> non-sleeping, idempotent mask callback to a new completion entry point
> and uses it in virtio-net. Existing completion callers retain the old
> API. virtqueue_enable_cb_prepare() remains before ownership release,
> preserving the ordering required by the earlier RX virtqueue race fix.

so... can we just check for this case? Like this?

diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
index dd2c41ef6fbe7..41778d727a89a 100644
--- a/drivers/net/virtio_net.c
+++ b/drivers/net/virtio_net.c
@@ -740,6 +740,8 @@ static bool virtqueue_napi_complete(struct napi_struct *napi,
 			return true;
 	} else {
 		virtqueue_disable_cb(vq);
+		if (!hrtimer_active(&napi->timer))
+			napi_schedule(napi);
 	}
 
 	return false;

