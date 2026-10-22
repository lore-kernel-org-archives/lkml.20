Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792685397;
	b=RlSDVCRNS+COUY+Rn0Q81Fv0obdBR2U1ux6fMVVmFtQDvcYftKfYs4vjpmcaC+uPEYtW
	 NXO/WtIrgLf3jyvhgkwtQWXb8KtQxQAlUrVj75VDaPaR2+jmlMzeJRP5kRgyb9TowLn9m
	 d1aJBvrKPF3etzbVaQYLJcP+YNdrotZ4pythzWDIX9n4yoiyLnlvYIT64LCQOikYRO36+
	 UOWv92GwzautUO9e7tZciBhG7z+TaEu5lWWt3nDfnME2ld1tb+eDevgdQiYLODS9sgCLG
	 KPBcgPYNyXaSk2vrRGX6PbzjbHXa+cJagLPAKr/XPtHVj5awjQ849TPG/HO8NwuKjvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792685397;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=TIhLtdd73+BRgQ3n33WlKdoMKFDFngH6r5DDdY1gqoc=;
	b=O6J4NWlJVyQkkyXosJt+otFAa5f1nsApLxT6DO34Rv9m/bC2Ate5KDIewiYN17NowJkK
	 gWCgf54/sJCEnm0xWLLtmaci6YiWJlMHu1HDrc5Mq+JRf0aq3Bf0Br1rxmeKXHskmdRtw
	 3H0FKorZ7kDlX66dZd84VownifXpGhHUYaUkGnOrNpi0JkF38G9fB5fH4C4E60XLkzKbB
	 rz6Q+ui3TnYRCgejQ2CW8C5GtAAcGuxZW7Z7QOWKw1ExbnspRfOI6pjOqWaWJixzQhbzd
	 hyuZUa+ranKmaGr+RPD9iNnP155NZ3+FUcFO9pfZFYRbLlM1KI9ZQUxC8k7ID1/irzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fws4Q0b8;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3FC0606A31B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 16:09:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3FC0606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fws4Q0b8
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-185fd3a4ca3so1284579c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792685396; x=1793290196; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :subject:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TIhLtdd73+BRgQ3n33WlKdoMKFDFngH6r5DDdY1gqoc=;
        b=fws4Q0b8g9s5I5mCl9U/tX8R77A68BHnAZRwCmIFqYo8FJFAlZJgB5RBbV6TDRHKP9
         Hb05EBprBImY90nAxjoS9BZQ2dmRFcUAUWsA2emBapps0UMu5dQYoYUf2xkWdPvH3vuQ
         eb34ASKJRnOaL6BDuTe1j36T2nqTwTkvvirpK78w0a7P+d7t6QyaPtIIGif0dOn2SR6j
         SuHscAOcrhRXEgwl7K27cJKugD/lA7COSw3Tsf1ZRWShHGRXHwR84ELZq9V1MAWU5NSx
         1anzO1aOt6MljYMRBBwDM0TzafcFl6YhLabVWSSA4RhrX8KztVrUjnWOvpC6SyJhV4wF
         kP2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792685396; x=1793290196;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :subject:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TIhLtdd73+BRgQ3n33WlKdoMKFDFngH6r5DDdY1gqoc=;
        b=dctYHpJrVYOQy1xDWYtdSyWLsXwIFLBKGGPf9+lQa7vfm4WRpPlkjzuHbDIm4aw05Y
         M0EBUSBac2/O0p3pFd7nYlWoDJ4bI8JFvqGi2nUJQKmkE5ZfCxUSzpJspW+J+47p3V58
         g/iR5GLVkDeADkTRhN+vFnS9XnDUTo8Aud7f9Vkcd0aWcFtJcwmdBM/iDQsBEAxdd5vP
         LiA7tAeW5L4J6U8/Skh/aZAM4aeSXojek3Hijwr5HEkdnQl7RNHD4VS1eApJMo6cdQkR
         lpX0jAnjLupPuSnFqZ2HwcFkn5JsbkuQviTJgyozVGcIX/HEf8D12+tNB+OoU5/KZIBF
         vgXQ==
X-Forwarded-Encrypted: i=1; AKwUvBz/HmNm8FjPJEQxYtyI0RiohnFu9cFwXr2pMkSqx3GCF3znpGRvFXzrvmX6FVxe8FGa2/x1nQrTJGow8no=@vger.kernel.org
X-Gm-Message-State: AFq9FYKZvAjwHvSIeesj/UnPmg3UCBXhx3mPbKT7LiObjReGee15z2np
	1Iv6mc8lyNAGRuzGz9vJ9Pf62Qf952M56VijxN01ImPUJEK7w7PtTxMC
X-Gm-Gg: AYBFou1yuOQ8Tgg3VIlU96i/Z0b5bTLqtqUzrgvqASBK4SpGFiMhtUAmT0E7oWPooJO
	ijd3RzKCApOTSsnf+f3wkainqZ9Ipp8G2nfqCYDZZPJbur0G6eh9TaAX1sPIg8LyPgqRWL175gY
	sLAWFTUAzygYfHp8BPoG12KxHD5cQnRMPkEB+Mexz5TLYdHkzzHVXetNrIsiyIE29eKeLPui2mF
	W/IiVrdGlavzD4cnYCRAs+YVzfhzdZ7/RcJZUC6/iCKn9/TJ4ifPR2zDb2IlPAxBUviOgUQzNTz
	1uLFi7nNMZRMDXG1eJNnFBtwA+NDyShY2IQEDcoO0PNpqnIC/Jf2WGPsF8khyicByvnpqb8/p4p
	0P7C/YVirSH6QPTdBLrhSOuyF7x0G2HKG3DPQ5h9zlyR6BhtQgHBiKru1hh/4QloW3q8btYr9jB
	eBUKWD9OSPqdO+dw4N8d0P3qUDh9U5ruARdNnoNWmjCvv+PrzlJJbMgt/BaAXN3Txw89COxctDl
	YeLZ7pskKzjfI3LKymN9eNVGWHyvbP9Qbq3HociwMkc8HNOJzpiH/hVmJnE6Ta+vPIRc/JO/M63
	CTZm
X-Received: by 2002:a05:7022:6b96:b0:188:ecb4:489 with SMTP id a92af1059eb24-190a73812b2mr10005892c88.34.1792685395834;
        Thu, 22 Oct 2026 09:09:55 -0700 (PDT)
Received: from [127.0.1.1] (67.216.200.102.16clouds.com. [67.216.200.102])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903e4f2eacsm14594124c88.23.2026.10.22.09.09.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 09:09:55 -0700 (PDT)
From: Cheng Yongkang <teel4res@gmail.com>
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Jason Wang <jasowangio@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Petar Penkov <peterpenkov96@gmail.com>
Subject:
 [PATCH net] net: tun: hold napi_mutex when deleting NAPI in tun_detach_all()
Date: Thu, 22 Oct 2026 08:26:48 -0700
Message-ID: <179268538303.70821.16548460883330758972@gmail.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

With IFF_NAPI_FRAGS, tun_get_user() takes tfile->napi_mutex, gets the
skb from napi_get_frags() and copies the user data into it before it
enters the RCU read-side section around napi_gro_frags().

tun_detach_all() waits with synchronize_net() and then calls
tun_napi_del() without napi_mutex.  netif_napi_del() frees napi->skb
through napi_free_frags().  A writer that is still copying has not yet
entered its RCU section, so synchronize_net() does not wait for it, and
deleting the device frees the skb while the writer is using it:

  BUG: KASAN: slab-use-after-free in skb_copy_datagram_from_iter+0x175/0x720
  Read of size 8 at addr ffff888077def990 by task br029-poc/9406
  Call Trace:
   skb_copy_datagram_from_iter+0x175/0x720
   tun_get_user+0xb42/0x3d00
   tun_chr_write_iter+0x113/0x200
  ...
  Freed by task 9405:
   kmem_cache_free+0x184/0x670
   __netif_napi_del_locked+0x2bb/0x3c0
   tun_net_uninit+0x566/0xa70
   unregister_netdevice_many_notify+0x1a26/0x2090
   rtnl_dellink+0x514/0x710

__tun_detach() also calls tun_napi_del() without the mutex, but only
from tun_chr_close(), when no write on that file can be in flight.

Take napi_mutex around tun_napi_del() in tun_detach_all() for both
attached and disabled queues.

Fixes: 90e33d459407 ("tun: enable napi_gro_frags() for TUN/TAP driver")
Assisted-by: LLM
Signed-off-by: Cheng Yongkang <teel4res@gmail.com>
---
 drivers/net/tun.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/tun.c b/drivers/net/tun.c
index 7cca1a6f72ff..850318482697 100644
--- a/drivers/net/tun.c
+++ b/drivers/net/tun.c
@@ -688,14 +688,18 @@ static void tun_detach_all(struct net_device *dev)
 	synchronize_net();
 	for (i = 0; i < n; i++) {
 		tfile = rtnl_dereference(tun->tfiles[i]);
+		mutex_lock(&tfile->napi_mutex);
 		tun_napi_del(tfile);
+		mutex_unlock(&tfile->napi_mutex);
 		/* Drop read queue */
 		tun_queue_purge(tfile);
 		xdp_rxq_info_unreg(&tfile->xdp_rxq);
 		sock_put(&tfile->sk);
 	}
 	list_for_each_entry_safe(tfile, tmp, &tun->disabled, next) {
+		mutex_lock(&tfile->napi_mutex);
 		tun_napi_del(tfile);
+		mutex_unlock(&tfile->napi_mutex);
 		tun_enable_queue(tfile);
 		tun_queue_purge(tfile);
 		xdp_rxq_info_unreg(&tfile->xdp_rxq);

base-commit: f4377bf85887f57b59abb5479f7660a81ffe4449
-- 
2.34.1

