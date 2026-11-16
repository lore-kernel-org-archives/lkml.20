Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794826449;
	b=vO8zEFmHQdRPlHtXGVX/0uf/zNxO+b69WLPM53ldKkDXgKHY+hS4ghFFchazXERWx7nS
	 1T/mT6UxkpyXhhDGKZ3s2lbI54E5HyHUbpnC1ZvIr4SInGa1fO36dz3eFTVmHk947Ht73
	 t85ob2KExxd44wE37qztoiixrkPbN3yIgi+w7/7hTAFhrWCB+hh5zr7L1GasafFRa6hJk
	 B0F6GxE6ySExT/AcYUh3e0KaWpzRrAcWaA9gjponWtn3KAr4B/mfKMH7Zcj0mVkzludgm
	 eKRsPy7gCvQQ+B2BjXzIuwAz8a6MKdoi5k5FoBJ/7EB/xWQ4sGTD+314yPHPhuDeHMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794826449;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cdKuq3/Fu2jW7L/YxaeYVgsN39DZtPGFu/e9jRJDqRI=;
	b=OFqaXW9jggdsiK2hgUVdcyyx8zYZ7vzATq0Xk9EC9yy2oslPETmltrP8NL8gh1UhbUqS
	 b6SwTNBuoGflzgz9uOIFhgOmWAbpysM+zUvJqH0ljdSZ2Tn/ysCj56+1IsA4fW6FKaFRV
	 cPRV20RJlyy9/iKfchLSIa4CfbFzMhFpTX0vMh3nNthsR2CMMkZAUaSvB3O9gAUwITcbX
	 cMOACzNyCaowNzwxcEsD+whnNbMVjpwOAwFgZuysSDC3WIkpn8VgxJmh6JT2hPhbQSbSv
	 ZLWSitu+etJ+oqFBy6D25VYWZ+6UwaOJSdypxll3k7qxuBlkhZllB5U33tDN8Nqcc2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V6uqr42W;
	arc=none smtp.remote-ip=209.85.167.48
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40C41606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:54:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40C41606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V6uqr42W
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5c158c4c15fso4097911e87.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 02:54:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794826447; x=1795431247; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cdKuq3/Fu2jW7L/YxaeYVgsN39DZtPGFu/e9jRJDqRI=;
        b=V6uqr42Wj5tCt2pj4NsxEWUA9ZPV2hJ8vbtfEJHqEWup61LERHaYBhxJtqUNRTqLwu
         xjS8Wcw1MkaEVKEW2FlvbzSlniIrC4yQncyGGWN7oyxOkcmIllBELJ3GHhZ1eM1mV5lk
         DtJy3osQM+taLpTs1LMUb0MlchzFAVsx54QVwlRbrGzDEGJzBoizYdOJWp0TP5ytlmXb
         ZS+NlW9pzXwzAy0GCVNgPoQfZt58VL4fpFeqUBnlW1PkKFGWF5lBPZcB22zzj37sQbBC
         aEV9U5r/FbgH2GaZXhpQgTBC8htE5gWHKQOlkUFAZMtEI5pCvGVxE1kfJ8ruW8PzjV1m
         EE3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794826447; x=1795431247;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cdKuq3/Fu2jW7L/YxaeYVgsN39DZtPGFu/e9jRJDqRI=;
        b=yYpxrnfoOZfprXaBpzir7G6D8I5UUNfSNeQ29dhz9sLwDDhSswBn9aD3Zx+V/VU/ea
         TC0kI6TBTQV5ie3FBji1M2q2JfAQYqLK8vFgpvDBx8yIGu/MM6KMccGdiqXMZXj2UTI+
         j1TBPa+KmkW7feWuxkSkC0So0iCM5lTUKU3F1K6UyhF900SjN06av7EQHmHQBEG6Tl9A
         dg7WgBKngd0aCM3Kvvpe4e/PKtNysWrP2ejbzP3++wA39mV5Vid4deVzJ+E4K1ILw1ju
         v/0OC+IH4I4jiyrWabRTRuN9kfgiGlBcO9IupQQP+eRISXAyfl4iI652msykbo9ZSHAk
         v72Q==
X-Forwarded-Encrypted: i=1; AL+hErGYQLRZ+67c44gq2W7rLrRl/Yqte0jAnCRbHU2Ul8oWwHiM0IHzqaSFj5JEDwXkPQrPwTgM+IfRcqr0JwU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8YT9iYyxgUzNJhfa76Vb5U7INMcJYaFDlQR2ozFfSZLUqlOm7l
	JijPSBX+YT3Boy4bZeqD4woZ4CScNtvQwDs/a2Q8w9LXhOazaS8BSRn3
X-Gm-Gg: AYBFou3ntxrWooCLihZdLmw9WJsFifdNm40gW4SqKX9MC63PPRmCnJSCyXXgmvUFCIn
	sgB9TWit0nRKoedvbrKrJ7aYXJg64xo98pcXzDTVsGhhYYg5QxiTc0CVBEjhDOpPFJFwH9e/7OV
	UfzJV2a3b6iTl+0897/xsGQditxURIA/AfhOmnRLNznXf0Gw24Nm44jQlKdxHRjUSEpaxmh1WWr
	hg5szyt5dzTGCUNC+ffx/NGtdAw4BY+jO7FZ44c+iEyt+FbgC4qZHa9yNVfP9WVF77OyuxugphV
	EA8D/0mPidtvtCmRxdQZdgMDYJTl5H6liKdjRllWvK1GM7Vczz7zvJaNXJbAeux/Aik2tZDeDgA
	ecbyQwrGVPZtOLoVrd/tMA0ySFNRe/1rvVdsld16J5z8DVvGNPworFGdMJEN8yAMMOiF3QiO0YZ
	sPOJoV1m58FigF4BU20S20OdsMi1BfYRCwDT1Ahvm3grEeDxz6iwv7s7D4P06wtYu475izn134a
	OEKDqi6JpwydJ3ve8Ro6lnoYvOd+GMhvLcsRyviqzpMWSobH2pg1Y+4dbJNBOB7xv5IYGmWArxz
	q4nCQnjfHHBFMzC32oUm
X-Received: by 2002:a05:6512:1322:b0:5c1:5b06:27c0 with SMTP id 2adb3069b0e04-5c170731f7dmr3105250e87.3.1794826447410;
        Mon, 16 Nov 2026 02:54:07 -0800 (PST)
Received: from fedora ([5.131.7.59])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c17133c663sm3069194e87.34.2026.11.16.02.54.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 02:54:06 -0800 (PST)
From: Petr Vaganov <petrvaganoff@gmail.com>
To: stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Petr Vaganov <petrvaganoff@gmail.com>,
	Paul Moore <paul@paul-moore.com>,
	Stephen Smalley <stephen.smalley.work@gmail.com>,
	=?UTF-8?q?Ondrej=20Mosn=C3=A1=C4=8Dek?= <omosnacek@gmail.com>,
	Andrew Kanner <andrew.kanner@gmail.com>,
	selinux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5.10] selinux: prevent KMSAN warning in selinux_inet_conn_request()
Date: Mon, 16 Nov 2026 17:53:54 +0700
Message-ID: <20261116105355.89902-1-petrvaganoff@gmail.com>
X-Mailer: git-send-email 2.55.0
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

commit 1df83cbf23a27174aee6ea5e52462f03f7e48a10 upstream.

KMSAN reports the following issue:
[   81.822503] =====================================================
[   81.823222] BUG: KMSAN: uninit-value in selinux_inet_conn_request+0x2c8/0x4b0
[   81.823891]  selinux_inet_conn_request+0x2c8/0x4b0
[   81.824385]  security_inet_conn_request+0xc0/0x160
[   81.824886]  tcp_v4_route_req+0x30e/0x490
[   81.825343]  tcp_conn_request+0xdc8/0x3400
[   81.825813]  tcp_v4_conn_request+0x134/0x190
[   81.826292]  tcp_rcv_state_process+0x1f4/0x3b40
[   81.826797]  tcp_v4_do_rcv+0x9ca/0xc30
[   81.827236]  tcp_v4_rcv+0x3bf5/0x4180
[   81.827670]  ip_protocol_deliver_rcu+0x822/0x1230
[   81.828174]  ip_local_deliver_finish+0x259/0x370
[   81.828667]  ip_local_deliver+0x1c0/0x450
[   81.829105]  ip_sublist_rcv+0xdc1/0xf50
[   81.829534]  ip_list_rcv+0x72e/0x790
[   81.829941]  __netif_receive_skb_list_core+0x10d5/0x1180
[   81.830499]  netif_receive_skb_list_internal+0xc41/0x1190
[   81.831064]  napi_complete_done+0x2c4/0x8b0
[   81.831532]  e1000_clean+0x12bf/0x4d90
[   81.831983]  __napi_poll+0xa6/0x760
[   81.832391]  net_rx_action+0x84c/0x1550
[   81.832831]  __do_softirq+0x272/0xa6c
[   81.833239]  __irq_exit_rcu+0xb7/0x1a0
[   81.833654]  irq_exit_rcu+0x17/0x40
[   81.834044]  common_interrupt+0x8d/0xa0
[   81.834494]  asm_common_interrupt+0x2b/0x40
[   81.834949]  default_idle+0x17/0x20
[   81.835356]  arch_cpu_idle+0xd/0x20
[   81.835766]  default_idle_call+0x43/0x70
[   81.836210]  do_idle+0x258/0x800
[   81.836581]  cpu_startup_entry+0x26/0x30
[   81.837002]  __pfx_ap_starting+0x0/0x10
[   81.837444]  secondary_startup_64_no_verify+0x17a/0x17b
[   81.837979]
[   81.838166] Local variable nlbl_type.i created at:
[   81.838596]  selinux_inet_conn_request+0xe3/0x4b0
[   81.839078]  security_inet_conn_request+0xc0/0x160

KMSAN warning is reproducible with:
* netlabel_mgmt_protocount is 0 (e.g. netlbl_enabled() returns 0)
* CONFIG_SECURITY_NETWORK_XFRM may be set or not
* CONFIG_KMSAN=y
* `ssh USER@HOSTNAME /bin/date`

selinux_skb_peerlbl_sid() will call selinux_xfrm_skb_sid(), then fall
to selinux_netlbl_skbuff_getsid() which will not initialize nlbl_type,
but it will be passed to:

    err = security_net_peersid_resolve(nlbl_sid,
                                       nlbl_type, xfrm_sid, sid);

and checked by KMSAN, although it will not be used inside
security_net_peersid_resolve() (at least now), since this function
will check either (xfrm_sid == SECSID_NULL) or (nlbl_sid ==
SECSID_NULL) first and return before using uninitialized nlbl_type.

Signed-off-by: Andrew Kanner <andrew.kanner@gmail.com>
[PM: subject line tweak, removed 'fixes' tag as code is not broken]
Signed-off-by: Paul Moore <paul@paul-moore.com>
Signed-off-by: Petr Vaganov <petrvaganoff@gmail.com>
---
 security/selinux/netlabel.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/security/selinux/netlabel.c b/security/selinux/netlabel.c
index 6a94b31b5472..e5af391023ba 100644
--- a/security/selinux/netlabel.c
+++ b/security/selinux/netlabel.c
@@ -195,6 +195,7 @@ int selinux_netlbl_skbuff_getsid(struct sk_buff *skb,
 	struct netlbl_lsm_secattr secattr;
 
 	if (!netlbl_enabled()) {
+		*type = NETLBL_NLTYPE_NONE;
 		*sid = SECSID_NULL;
 		return 0;
 	}
-- 
2.55.0
