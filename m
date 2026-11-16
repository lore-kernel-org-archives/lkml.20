Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794826430;
	b=BA3KDnTCwtXxXsGTbbdPwNoLHZTyn4wMLPq+w27u6dYTVqscskW2GkZZTDcXfutjxpt4
	 9H/izRZ+3CP7eWxxmWB3hRUKEQ2u4PF538kQ7yWQX0jIEFf3lakBT9wAjne3JIf1rZ3fE
	 tGwFd/accbyR0av+Pd1Gua2sfpALdeal+R0fae9JVuUD1HyDTRjmDmKwh5PKlcF0hrTAN
	 QWBxnIEp76Q0kw8r7oBHARLvgt2Fx6TTsutqZ2QiFOKoVaw2e6zZm99x1d97NLnVdyAAJ
	 FmrySoLEL70AtJyVxDyMblMv8w2vdMX1p2Eq8ll1B27ud2ZeCOGLIXFWTGaoeTqoUUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794826430;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cdKuq3/Fu2jW7L/YxaeYVgsN39DZtPGFu/e9jRJDqRI=;
	b=HYcPyaRT8vOPS6k2AEQSSoALcAyUbNTPQ1B5yjxSLCJhmEb5BcHcbGMn2ZyDtAKhIklm
	 CVqR1E6J5CVLAxf9Q4KevNJuZmxlH10dkkRI75bwH0hlIwz+QobgFqLauJVqzfi6Pn60D
	 9xSNjcVYPn5KmVkqm+IN0rwPu/J/APpnLzppeP7ecLp1H80O7/g4nAOGvcZrGbGYVo78W
	 QNszeK37+PrQGmEjaRKh+y7Kks/3e74uZdAY6/ni2wFidt8UyOtSiD27sVKuLV5MbpYFt
	 RaFFRzGlSc/66z+F6wj5J+tK2cHQ1ufDIFQoMMxWGad6fjBX/wVJpHSW1P9Qy80HrpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HoZT4au9;
	arc=none smtp.remote-ip=209.85.167.53
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B9A606A885
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:53:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7B9A606A885
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HoZT4au9
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5c14f7768acso2612993e87.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 02:53:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794826428; x=1795431228; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cdKuq3/Fu2jW7L/YxaeYVgsN39DZtPGFu/e9jRJDqRI=;
        b=HoZT4au9qzAEswBsmTugwBXmASMwENaAUHQKmqUeoMsFemp059HKPKC7CTPYIuem+W
         ywS7IszCjKJmb1QZiIrGMcBpZ0/ihMwadbUFK9WYyogd6g4NkdO2vqhE6sGns6rRU1JG
         aoNY+FPNufZ60sUVIJfw9RMHYgq6dWirwFO12PJCzJrB5iPFh4cgTEm6l8DQdkGklAjC
         9OJsIQStbdpdPVrKROBD0BvvvuCyeFyIuEQh+XwTeQIHBrqZT9zN7LpIcx/vpuMzn92r
         F0Njg62kQO0MquH/L5CzEi6vWJIi5IDBNeWgpQlKDeQG5auxH1TGBOGtrPKjybHRpLLA
         2x6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794826428; x=1795431228;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cdKuq3/Fu2jW7L/YxaeYVgsN39DZtPGFu/e9jRJDqRI=;
        b=K5zbR5lS2dao/MkE4uIQ1myYEDim3XDawhmUnzofuggRQl2IVEZdDpjvAU2kqvX0si
         ypQ7OFDtUoNt/SskoYOBIYKjkP86Qpi8Xr8ik/dbg80egyOT/BJngmuOsuvD4yYhVSBR
         r/skFMUOxekmUWWWBIHUGTw8hFX/ybzNPncoNZ6rgoIZlw9rGmZCTUitbrVsHrW1KwVK
         MpahMcB1J1OveGNEycEc+GzY+DUQQia5UMK91CcPYY9fOw7ByLiHdLAIBeVGLWq3MmcO
         igZeMwp3PDKd2lG88qSa0Fu1Ic53WEANLzvNmgG0ZpPJO01mp3HJ/6bOZyHK2MymPXTE
         wz9w==
X-Forwarded-Encrypted: i=1; AL+hErFa5aYwrtsqiJ26BxcPrJM0Ra0pkK+bTJChII/DgpEBx9jJCxE18JXB9n0mjk+cz8OuU97XA0ixiVJpH94=@vger.kernel.org
X-Gm-Message-State: APuU4Z8aXV9UoBYwRPRzidLgx4UumODZLj3Okrh4qthT0SL/vHoYu34p
	zKo5jB48OoDQ/88puBkxu8mAFue2HzbQ4aUV/+mUebuhBbiGTOEmn/VQ
X-Gm-Gg: AYBFou3aSHYmau1RcrKo4nEzpDkOree8zDLejKsFLmibHLR1QyxWEKVvsjh9wDXOsKx
	e8IyVfFHg+HDR3h8ZT28noFyhxITZiqruQyqE9lcJ2O6vvo9GQrrtfY9715HohahOxLj4BVp1ts
	mRvJkNVMEY/QmGPLmPqrDfZyd1xq+hRnCAsm7AF+Pl4G66Ng4t0LClvt0qjohkOm0DmAtXkde1g
	kQIz+3PihBwNc5mD6O3pAtCzca2BjH49Yjzsa6tDagsI8YJ7jhJOi8vb+qy8f9n69dcJUDoLmqz
	BJLXiusinWlMIw7VLN/ylRik7YCkRkp12s42f/2xVQ0AQxfgj9c/+un5KDu7FuDd8abf/YQAEf7
	FXr/MIuEdaLoJ/yzp2yqL9WLQ/w7tYATCXDtXN1DI2KTOzKd70HAS3ZlQCi7xGlALhA6BGan3Ex
	vUOuYqzLSI5F5WEVw59J3p20QqpmkMUn9RY1MImHhsNQbzEVtedTub7ALITzZKdWBlpgMklYqz7
	9NZtx4wVn2CpItdBa6HUL2EBUQxQiFq02tlvXCi80APmTSmMNn21QkXSI5j2nei75799r01Apjc
	GzraChsOT60+8owzmoPX
X-Received: by 2002:ac2:51c9:0:b0:5c1:4cc6:718f with SMTP id 2adb3069b0e04-5c1709c9d8dmr3878682e87.41.1794826427819;
        Mon, 16 Nov 2026 02:53:47 -0800 (PST)
Received: from fedora ([5.131.7.59])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c17135783bsm3089904e87.79.2026.11.16.02.53.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 02:53:46 -0800 (PST)
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
Subject: [PATCH 5.15] selinux: prevent KMSAN warning in selinux_inet_conn_request()
Date: Mon, 16 Nov 2026 17:53:32 +0700
Message-ID: <20261116105333.89809-1-petrvaganoff@gmail.com>
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
