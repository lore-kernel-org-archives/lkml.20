Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794784065;
	b=1jz9sm6BPMeBziqPPGjLU9nS3RFFeChvIUcb5pHrdeQSsUUyU33A3CWR+vdP5l1Jbws1
	 /sl40ODk/T8DWd+YL+4ipsH2qvDAih3dbgrBdHK76mEonUw2eSOxWfgubuZ2kBiANkD43
	 Lhf2QPpXDDCxuFS28ABkPcgxeqCyZUC/W/IrbaAkpYjh4MIsktFUZodeHM8hpgH9c2rbk
	 p6WkdDTrZnE1vltUUL1mQ3znX0vTIxQ1FYvrLe7IlP8DwFO3R54Y5L/UbzYgT0JRywYYJ
	 plgdBESxHGXK23NY5lak69RX5HHcRc8TG09ZkFStmB7lM+hSMR3AoBB+IK3IU3+EmtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794784065;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=qSuk1jbsdV+iZEtNlLpPi3t1jVjwwjZENkNYPa18BIE=;
	b=HYfvh7inD1CRzq87UjTbp6c+mmifQDsFYEmoitUWR7WCuQEvDtekVdzlNvrkTdGNQM3L
	 XrudQW0vxATZs+RKEOl9Vo28XgcCN6ce2oVIxE84lwGniWIooqWyLLkU9BrcmUAoO6H4i
	 3QjFYcNx6KB3l8kRX561SM8oL11J35w2gs1LpeuBQ1SMSKAlvT69QS/Yk+E3J13zBgOq9
	 Sq6oJcU9SYSVqRDflX7X3pfL5DvE0DfREZejL/p/CwbsgBZt9o30m0f8Moe1MpSx0jmaL
	 mcKNzEmktGFptlyifrDXC3XqDNM8eWgIQZh6efCseauYZy/psTlvEbeSRZWP4r7/jog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hk1x1wV9;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=JjVOT4V+;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24289606A32F
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 23:07:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24289606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hk1x1wV9;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=JjVOT4V+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794784064;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qSuk1jbsdV+iZEtNlLpPi3t1jVjwwjZENkNYPa18BIE=;
	b=hk1x1wV9PY7+tEv7OxpQ7i325IjzCasykmQLW61Wj+HTl3sCUY9VtIuAHfw5XbLxsluhZR
	ULiSbRCrwQG6wIJmVvaLMmhsSXejPy9cvEJ+sAX+GSNJ3O80KjegQ/WOdAIZvgEk/Umyb2
	XzT/5YEiFGuOaJDmr34uPMbIiwyQ4/M=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-433-Eno4Gi3LPbiwPZ7ch1pkEQ-1; Sun, 15 Nov 2026 18:07:40 -0500
X-MC-Unique: Eno4Gi3LPbiwPZ7ch1pkEQ-1
X-Mimecast-MFC-AGG-ID: Eno4Gi3LPbiwPZ7ch1pkEQ_1794784059
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a1f03f2e8aso22719535e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 15:07:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794784059; x=1795388859; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qSuk1jbsdV+iZEtNlLpPi3t1jVjwwjZENkNYPa18BIE=;
        b=JjVOT4V+TGCb83VkIVmnJav2JUK96bzcgADChkjgU+4zOTuXmPfFS6k/KToTM6Ygz8
         z5T2fMjC53/kcIflVr18eAN90VW6bmNqg8DA3kftQDf6a5e1Wv4AuiC/s2tF/0B+Ojsr
         JBkwUDBMWd0kSH0LTMLUcqkitniPnUTsjhxSNZoiOGPFd+aErPF5k+HKhq2NL2yMtNCs
         qPudT2HkxtAkg112E3/K/43SwkyGlEbHYIOPSxE3H+PyYglTAnRteCfCfWrPvdC2UPwp
         xg/PnP1/W9jNnV8gX036w+/ujAaH7uKFOfGL/4oQVvMEvR01YJPzuViaZuFuyhTBoQxP
         hs0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794784059; x=1795388859;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qSuk1jbsdV+iZEtNlLpPi3t1jVjwwjZENkNYPa18BIE=;
        b=JYS5rxvEkkaXUBZZ9Ft7/wV5PpaInrol9EdexL/hUnoYKdurkcbpZ5BI7KpbY/j228
         TnFuymSTAeBEk96U0e1dGNy8aJHPmeRgvRy+oOdg9Cocbe8XpWGVGnafFsmo8I6DCUTa
         SeOFTGtYHzVSeTCEqlOdEU0TG8mAtvkondtnZS05A9JqV9GmwjEDA5do9sGATnuP7sOo
         t68ErZzcj3+uDBnjXZE9Rn+Cw653/2D+usjstoMtgjgZOyDF0tMWXNZg9+sygUYcubrx
         SZ3rr7xxoVeH6j+8j4f0tGX3jiJjWPnx8OZ2IGrBKjm/s5yJcmYNXUmEx6swsMwWBOCi
         UrrQ==
X-Forwarded-Encrypted: i=1; AL+hErElc9T/DCDPbX4ixwelD4G/TjYa93ypcVfyNiIc5MptU/C999brwZJkZz/fxfdoTPMCHmUQVBDkHm1XfnU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/4HrMfOEFljWtHAJNyH8R0OOc/cYjX72KIePOoTnqTFgwcn39l
	JMAS1Ri8bR5TWJnsCaqN3DSqdjQ5BZ4r1QnoKHtB8f1YnnOQEbdVU0YrlAYeWEEJ0rki+8OrjVD
	G6K5DYbx26P9A7y0Pcspj5//dqQhjHtMslkrz+CbENFUXjsTyMqZtgSSWNKKUw4IbAg==
X-Gm-Gg: AYBFou2ZJOd9xRrLWEEssyXT0DTTtiqMXGIHxEEtx/KuN7i6K3AV50Hmtt7uJJ79ErU
	Lka7jP5ESNp4Q+i53Ty4+9LLJsOi3QUbfbBZyqyP4R67RHOMUVPgzz+Qr3jvkDKGKWDAgy/CH3H
	DEGMm/16rcHY/rCudu6R1Y+sO5A4jDtqiBxwqV15p72z/E471HA9W4vIWGilbhTJdtf1pzfFR98
	EJ3MhvhNv+YCs28U1G1jReqUfjryxaugQakiR/3AYOHTK2FjW+V/dQUWDvtE5N3RkCfaqEyFQNA
	ZyHylXj7RinonDSGF4kA5Z50sinualovVIorazTjz2BOf8bu9v3NbUtNJ6c0C5MQeskvs4+4NV1
	IMp2AWlP5UEBR0oJgvEhHErdAS54AiZHP8LAvJnTiRg==
X-Received: by 2002:a05:600c:8b6c:b0:4a3:5a7b:6002 with SMTP id 5b1f17b1804b1-4bb649d4148mr97699695e9.28.1794784059285;
        Sun, 15 Nov 2026 15:07:39 -0800 (PST)
X-Received: by 2002:a05:600c:8b6c:b0:4a3:5a7b:6002 with SMTP id 5b1f17b1804b1-4bb649d4148mr97699295e9.28.1794784058388;
        Sun, 15 Nov 2026 15:07:38 -0800 (PST)
Received: from redhat.com ([2a0d:6fc0:151e:a200:7a96:1b15:81f:ebed])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5b4a3fcdsm213451595e9.0.2026.11.15.15.07.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 15:07:37 -0800 (PST)
Date: Sun, 15 Nov 2026 18:07:33 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Congjie Zhou <zcjie0802@qq.com>
Cc: netdev@vger.kernel.org, jasowangio@gmail.com, eperezma@redhat.com,
	xuanzhuo@linux.alibaba.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
	pabeni@redhat.com, horms@kernel.org, virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [BUG] virtio_net: RX stall caused by masking callbacks after
 NAPI ownership release
Message-ID: <20261115175445-mutt-send-email-mst@kernel.org>
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


Played with it a bit since. I think the below should do it?
Can you confirm?

diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
index dd2c41ef6fbe7..7bc7306231521 100644
--- a/drivers/net/virtio_net.c
+++ b/drivers/net/virtio_net.c
@@ -740,6 +740,8 @@ static bool virtqueue_napi_complete(struct napi_struct *napi,
 			return true;
 	} else {
 		virtqueue_disable_cb(vq);
+		if (!napi_is_deferred(napi) && !napi_is_scheduled(napi))
+			napi_schedule(napi);
 	}
 
 	return false;
diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
index c0ae442c4344b..2199750825d4f 100644
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
+ * napi_is_deferred - test if the NAPI timer is armed and will schedule NAPI
+ * @n: NAPI context
+ *
+ * A true answer guarantees NAPI will be polled again without driver
+ * action.  A false answer is "best-effort": the timer can be armed
+ * right after the check.
+ *
+ * Return: True if timer is armed, False otherwise.
+ */
+static inline bool napi_is_deferred(struct napi_struct *n)
+{
+	return hrtimer_active(&n->timer);
+}
+
 bool napi_schedule_prep(struct napi_struct *n);
 
 /**

