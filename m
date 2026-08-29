Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98CBB3ABD8F
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 16:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788022596; cv=none; b=VJ0W6C7bM3FJ130Rv81+ztGKAzZJEy7eUVEI5z0ur0rVahk2xSKj6HeFY6B69jyCV4GIjzAwg1ZCIUu92rvlOjofrpx4txlgCY2uwxwqNAqmRU0u+cu5FLv1KBMEn1YsIDtgmGp16CHAGnAWXZbVmXrWtWHxWWWAhs0sOAeal5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788022596; c=relaxed/simple;
	bh=1uEW+6SOlAFA8NY9T1gSTaZvUlQQS478fgHHsQ7CsWc=;
	h=From:Content-Type:Mime-Version:Subject:Message-Id:Date:Cc:To; b=oszJV40GhNyckCYMSBLyEVbI+kWiLKuLVm2iTqpQ4109xHcSq+NoRCqj9nMo2nXxUTakjoELZLCRT9Yw19YK7ra9aQlxvEAYq8gefhcJ2tTEywgi1rh/8K1te2oqWNRAOPsX3xsUTFFPYSxfBjEpTdsBNqnk8s5a8DXKGWnJYuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=doyensec.com; spf=pass smtp.mailfrom=doyensec.com; dkim=pass (2048-bit key) header.d=doyensec.com header.i=@doyensec.com header.b=WMuXIup2; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=doyensec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=doyensec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=doyensec.com header.i=@doyensec.com header.b="WMuXIup2"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c2530cabcf4so323043366b.0
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 09:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=doyensec.com; s=google; t=1788022592; x=1788627392; darn=vger.kernel.org;
        h=to:cc:date:message-id:subject:mime-version
         :content-transfer-encoding:content-type:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2JHuNFyBqBV7i/n9uU3aIKvff48cRNUPOa5Ukv7rkvQ=;
        b=WMuXIup2SHzZ7f19VvJe+M3YxHZVzuf7+Km+X+tOXymo1rZpPtX0CoxGynXZfGaUk3
         /LIij0c/z8rEDTmW5LH1BQFzngJ/45blucQBaMUJma7iByJHaEC6hXdubjtG90K8vhHZ
         5TYSYUN8KKjJs3ouGQKRpO0a9hLTgj+EjdFv22tdbzjECUUktRoURAojdWSjGP6vQr+R
         gwLdc0Mg49vrKxIHSpWTXdnIh0EwUYSnuzgrKjL2F6ol4o4DR73y1f42D09LBjIhbhbt
         o2neFqpFHl347jgtP/Ikgt4YNVrNz+23WwSK4aKK6JFxzdcI+f+GJcDpNf45p06UzWhA
         kg0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788022592; x=1788627392;
        h=to:cc:date:message-id:subject:mime-version
         :content-transfer-encoding:content-type:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2JHuNFyBqBV7i/n9uU3aIKvff48cRNUPOa5Ukv7rkvQ=;
        b=MQ2vrvySKDghhjJ1Ot9N3c85LLPlYm9vOAGZOZnPRY1sWXep1Reig83Ar9033B3q3i
         2YeA0izQtLnzmcRrNJAeLGbcHBIFPF6tYOeFSeOOfBAiy5PZ3ox1kuLrltODVR79e8pE
         LJ1aJmPnSg4k+Bvpe0ku2Jjc953v7arH1WvZcAAnYFqu1P/BtRgfPAQGThGvz7M6ZVwB
         H4UGwFQgl9dFD34kUaVr4YNMha5gq+1BqDdhrLtU4fGKXwzAlLkFO+wSdHMCINjhMBE+
         EGWSvTq6Yq9y0ILB8PysM3nN8CqvndORUEabu+fAINz8308yNWhmJGim6zaS32o57yvO
         qh8g==
X-Forwarded-Encrypted: i=1; AHgh+Rp7cx7rd+v4zxaYL2SBBQ4IgxYWhYn1o1SDNUFgkMdXi6QwoAbSSZGNOJpqvVr44uK3y6hAD0gCVPRDo+Y=@vger.kernel.org
X-Gm-Message-State: AFuF++lFTA5rSDj9ejYi8v3wBVobpM2wiusYhK5aU5tkZiPsGf2cBK9y
	FiOhexw6toqSTZAyqsZ1mRpWv7BoYKZh2UZPMuQcYaEtlYhYMpFIm6MtjsdgmZJnyew=
X-Gm-Gg: AR+sD11QTnprvyUo7IGesgtbI0GZlnRdfTzdCP0wte6s89wQPoc/ayxEhg8aWGB0uQV
	Oc+TC3BL5b0Aj8GzeG5LoCCOGGcud4Yf4CaLwTIiG21ajQ+wuROjAfOitnvNViNvUeFnlCo58qq
	t7++VquNiBeLDbzLhnMFbq7PTs7IgCNHXbG6Dzbf35CpyQqmS/7SJirqt7mjjuffrtn+NwbuCwW
	kd6QwAV9Tm3I5Ri/6K2xT2iL2w2cqkqSqLkNnWGxx9yOEczmVvmRriQvSGTiXqAaGXk98CBPIpO
	OU+dlc6TgkfjZl8guFcn1JNEdVJ/EaWtwQOzUVPU1ErChyyd3RFKVTfGVLGOKlCamqYUZjVDTAg
	ZS3DT6c2h6OjTVRMJuJynIN0rw61p1a3hl20JKToS67y6bm0Ndcy5EnUg/iWRkKVwnJr4LWKu1g
	Brmmf+sevczaGimx7GtDSGZ2l/pOpDSehh8XHVz07Ic0pLx5vHxMicmMJlxenKsSwXf81DushQH
	6eZyPXHxbN58flG2uiZkh9t6jzy0Fl/Rc3w8BlOA/sTQKLwnP+IB8f0LEwSQWsaBrsJthryqgb+
	liEGRNzsv1bwmqBY0epKvRroCCo=
X-Received: by 2002:a17:907:ea7:b0:c25:4f7c:8ec5 with SMTP id a640c23a62f3a-c25571fb792mr967095466b.23.1788022591667;
        Sat, 29 Aug 2026 09:56:31 -0700 (PDT)
Received: from smtpclient.apple (83.10.35.35.ipv4.supernova.orange.pl. [83.10.35.35])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255f1fa3ddsm210342666b.45.2026.08.29.09.56.29
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 29 Aug 2026 09:56:30 -0700 (PDT)
From: Norbert Szetei <norbert@doyensec.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.4\))
Subject: [PATCH net] net: psp: do not inherit the Rx association on clone
Message-Id: <BC10EB92-ABB3-41B2-AB16-266BEEBE18C0@doyensec.com>
Date: Sat, 29 Aug 2026 18:56:18 +0200
Cc: Eric Dumazet <edumazet@google.com>,
 Kuniyuki Iwashima <kuniyu@google.com>,
 Paolo Abeni <pabeni@redhat.com>,
 Willem de Bruijn <willemb@google.com>,
 "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>,
 Simon Horman <horms@kernel.org>,
 Daniel Zahka <daniel.zahka@gmail.com>,
 linux-kernel@vger.kernel.org
To: netdev@vger.kernel.org
X-Mailer: Apple Mail (2.3826.700.81.1.4)

sk->psp_assoc sits past sk_dontcopy_end, so sock_copy() copies it into
every socket accepted from a listener without taking a reference, while
inet_sock_destruct() puts for every inet socket. psp_twsk_init() does
refcount_inc() for the timewait socket, so a child closing through
TIME_WAIT cancels its own put and leaves the association with one
reference and N timewait sockets holding the same pointer. Closing the
listener frees it, and the timewait timers then put freed memory.

Rejecting the association on a listening socket is not sufficient: a =
socket
can acquire one while established and then be turned back into a =
listener,
because tcp_disconnect() leaves sk->psp_assoc in place.

  BUG: KASAN: slab-use-after-free in psp_twsk_assoc_free+0x6f/0xf0
  Write of size 4 at addr ffff888110f9255c by task swapper/7/0
   psp_twsk_assoc_free+0x6f/0xf0
   inet_twsk_put+0xda/0x1b0
   call_timer_fn+0x53/0x2e0
   __run_timers+0x764/0xa80
  Freed by task 99:
   kfree+0x1a7/0x500
   process_one_work+0x7ec/0x1100

An association carries a per-connection SPI and key, so a child must not
inherit the parent's. Clear it on clone.

Fixes: 6b46ca260e22 ("net: psp: add socket security association code")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-5
Signed-off-by: Norbert Szetei <norbert@doyensec.com>
---
Reproducer available on request.

 net/core/sock.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/net/core/sock.c b/net/core/sock.c
index 1ad41904db25..fa60b7494c58 100644
--- a/net/core/sock.c
+++ b/net/core/sock.c
@@ -2494,6 +2494,9 @@ struct sock *sk_clone(const struct sock *sk, const =
gfp_t priority,
 #ifdef CONFIG_BPF_SYSCALL
 	RCU_INIT_POINTER(newsk->sk_bpf_storage, NULL);
 #endif
+#if IS_ENABLED(CONFIG_INET_PSP)
+	RCU_INIT_POINTER(newsk->psp_assoc, NULL);
+#endif
=20
 	/* SANITY */
 	if (likely(newsk->sk_net_refcnt)) {
--=20
2.55.0

