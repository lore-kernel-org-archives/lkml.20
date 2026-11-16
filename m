Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794826404;
	b=euRCDHJj+kQMO4SlGwBZ5T/FWMm7RMVs6RjQtEv332pp7iAKZRFRXeILdmb4eqk8pNr4
	 NWaXgRPolQsE1V+CpcvOgYhxD3zpDh+wYro/26PgDF96nKFNgU+ftQ835ZhCz539ePFwY
	 LABjk+yoKTTQ1fBiZ/9AU3LUU0uG8713KaM8uOrsF8/CFtMohR1ypu7Tlf/4Ut9fsUFZk
	 V7KXW91myl4/jCDvDZzkZiEyuEiSfux1bUB8OT/VfHdqJr7EVWO2+EEe2hI5CfI3h0XF3
	 k5OvffvPd2NNyztK7xWHP4i8STcSieLiBZMCY9ZDDJ43LvMTGp4rkRgJmlK4DC7iYEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794826404;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=C9XkwvpUokenqd29JuI3QrAxLajRAdLPVH8Z6H0RKZE=;
	b=x1dTjeY/IvJF9x9FBqwLXmN/6lFeJqXV1T+2keJvITDT6fJj7/3cfHugaVP/XsaHBBr1
	 rOWRILEdVzla3OvO6xN4VE5PvjNq3dSILeEoyNSXW0tdMLtZmfn48x4JXU/6vLmJq4yDN
	 YMKHc5Fet7IdNKwXkTVQ23O/73qZp7m17VwGMbTMHZmojWDhAZrlkMyVz7giZVdJyWHmz
	 5DnobyDaqfxXrGuxnlnVWASQhU57Zg/B5HxHIikaD1JhwIxgWv/pqnIF0HZUUd7FnHJmA
	 F3J6fHvUZKwLg80rHiohUJ9M0v5sIqGOvKwgL2kQtnJ2UpPn1FoDNc5NKz8Iw9JrHAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lLuQW7u6;
	arc=none smtp.remote-ip=209.85.167.45
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3144606A8BB
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:53:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3144606A8BB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lLuQW7u6
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5c14e307f29so3806389e87.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 02:53:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794826402; x=1795431202; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=C9XkwvpUokenqd29JuI3QrAxLajRAdLPVH8Z6H0RKZE=;
        b=lLuQW7u6Q4kNTLsC5pVKBRxBayX4JLg406lxIRCZFZ1bJsl2ZonFKAGhFUcKIUbxir
         6SRCnCrcGHktrMrZJbi5RBAEiU1H+qGGu7ehhIEFTNQ3slkKYdr2jASll5CPlhj8Q/wN
         9DYGY8N/GFolGvAOj1TJnTYI+3qM6hnwO5IJlwZjOb7NzZNIXdfjNf+3rZ9PCYk/xNk9
         MEfisYR8O7amsgMOS99rxPjT68zy2QaFbPL3eCGhh387KoJREMMqhoPGPrUcVJ01oWNG
         s31Uqe6ppoP2dv0Q1gnaCg6OrfWFKLNdc24I2gw7eq+BvW2oXisZNC+ybQ7wQrbdiokb
         +HPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794826402; x=1795431202;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C9XkwvpUokenqd29JuI3QrAxLajRAdLPVH8Z6H0RKZE=;
        b=CAXh9olMbbXCrtrIUT6/SpKIzjf4Ys1FuSxb3ju/Xr53rezt9LQQ7xRAAcrzwhmheQ
         zV86PE8snwRxEJbSlaqOPyYt9xoQBVgbyAh3TMP+KyFoOJoP1z1vNrRLdeuftpW2Rb9D
         qRT/WTQkimYtMXq4hxHPYl15kc3G8Z2hNNABzIX8ppDLR+uEzGduQjLros7ybzhl2JUD
         Cr5s/5QHErSDVwTrReNh1vekNvTOtIQpllsBb9HI0U63pL0xjH7X70VezyfDLkzfemoQ
         9SkukSNMWCx9LN6mIfBrJqbSjOaAHrpvDWXuntR5a7fKjHYmxr16tfAN4vi01H62uujE
         iFvw==
X-Forwarded-Encrypted: i=1; AL+hErGvdF4jFAKm+etViE8Y9kW126vE6sGCekuz9SkvG7xp2lpDTSqzgJYqZE4mZQbab0/ZLaWG26R0gUWkNjk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Nr1M0n+WH9DRR+d3DBEntFb6q+55x2oAuugjm5cHHC1M2a5fD
	OEeSNY1aufc2JW65uPXRfa841P1eVwm8ZWWIf3yGaQAwEDyS5BM9uvHG
X-Gm-Gg: AYBFou0uCt3dZHs9Kr8dLf/tgilKv5RYXoWbERczTG5auyc8EoTvlj+jb8OXE67RqLg
	8UHznMqrcFP4gu8sWVrElYDVS+2V197NVi+AAbJqG5SQkyT61S1CnVUgHEhqIbGovftW+h+dxnc
	3D4LckwDjuRlCFYQ502T/2lUm2muwuognAPyGuP0omG8Wrj6W+Wwpiw3Lu7Jyj9elZR9r4T7F3l
	QvOYcDAuDLbzStLAYAJK60TdNjJ87zxYwe6lj20d0yaKeXL24jhe90sjjwxeTxDFl7Zo96SR0B3
	Ep6QDHa72He1wnbttdGU5STky6B+5l5Av/BcAckmHxxvl2Sll5bhbj9N+7TFrPFALF7+8gMqU9p
	1zC9TCCN00vOfMp5U2mwJ1sBa3X92iQqg+2tNraerzBI5i3YZJWNUKa9aFIFr0IdrO6oFLCpJwK
	MOAYLKHDhXHAKrWMbbhCyaVjVErL5NI5bYlCrlrIRQXHAVkx0Tc1WkrwTn0gSzEmbHEyEnWh/Tj
	mv3W7pBgGPPdvHnCi4H/DOc9eeYv2OHnCGJpEJzTeKLx8cf0iNpwnglQaUGbDKIy7IEtezbRtjQ
	D+KXt7vMYUpDZ/jzopO1RQ==
X-Received: by 2002:a05:6512:3345:b0:5bf:b603:365d with SMTP id 2adb3069b0e04-5c1709d6b21mr3686877e87.10.1794826401844;
        Mon, 16 Nov 2026 02:53:21 -0800 (PST)
Received: from fedora ([5.131.7.59])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae2b7ae909sm31601781fa.25.2026.11.16.02.53.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 02:53:20 -0800 (PST)
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
Subject: [PATCH 6.1] selinux: prevent KMSAN warning in selinux_inet_conn_request()
Date: Mon, 16 Nov 2026 17:53:06 +0700
Message-ID: <20261116105307.89727-1-petrvaganoff@gmail.com>
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
index 800ab4b4239e..1c316af68bf3 100644
--- a/security/selinux/netlabel.c
+++ b/security/selinux/netlabel.c
@@ -196,6 +196,7 @@ int selinux_netlbl_skbuff_getsid(struct sk_buff *skb,
 	struct netlbl_lsm_secattr secattr;
 
 	if (!netlbl_enabled()) {
+		*type = NETLBL_NLTYPE_NONE;
 		*sid = SECSID_NULL;
 		return 0;
 	}
-- 
2.55.0
