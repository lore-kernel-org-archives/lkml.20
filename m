Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794796868;
	b=Yj7Bcm1chcw8BPoNmKdSplvmuxxUFwK/9LT323aKyZ4MZ99c8uJhtuudRCmj1cAbxAIT
	 Ii/2Zhiot96aTVx7IFy75K+LugK4TgPLDNpbAeFSDvPtJVCX903WoyL91eW6Ha50b6eBb
	 rORfkDEcpBD57r/iUKHji6ZIf+0d+pgUc0ofE9+H6m4dklWrbLe6DCQrG5Jf/Zcg5Bp1s
	 A1jEdhU8Ii3dauQuVeSbn9/zAgaoD1a6N3hifxnVlanZvamQTNiJgm3NA1iS5A9go5h80
	 nB8Vfpv0VjPTXfhHqtwQxgv3C5gf2PFfQJmWJazlhi1cNe4VwRtmMUjlYilz9/O/3bQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794796868;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=V2OEn9tAKSN4sXOsuonmkzU2ywS3aimW3cs+6O3cqU0=;
	b=ogn9rBe6thQREnCQNf13kXuG6ZgkdYEZjX7rE/F43wVnNL/tKFWdec834k6jFsaJAFBL
	 L7j4JlbB1yJGTjzD1wyclTNhwcS0gZEdbGEY+i0CwP5YWVGbvMtwol8HAo5dVu1oQc9sW
	 IKD29X3LVu+ee6mIJblNLqZypaSlwmwAuD04Pr1+47C0M8jUC0G15anj/KGeZ0eQLkIzF
	 mvQeH3bweCjcgzPDNahSijxjsI8Kapbva1g97r06EnBu8nsNIHLXuKnhaxZfv9Yro2Rn8
	 p2obgOsrrGHfLygmcnT+S/5Qm5W0C8cwAQ+XSHT6s5SaInaPqCthImjkz1wqT023P1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Fu067Wwl;
	arc=none smtp.remote-ip=74.125.231.130
Received: from mail-oo2-f2.google.com (mail-oo2-f2.google.com [74.125.231.130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97307606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 02:41:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97307606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Fu067Wwl
Received: by mail-oo2-f2.google.com with SMTP id 46e09a7af769-862a00144f1so513944a34.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 18:41:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794796866; x=1795401666; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=V2OEn9tAKSN4sXOsuonmkzU2ywS3aimW3cs+6O3cqU0=;
        b=Fu067WwlnNSDgeNFNMmXlAGr3qWf+wNIlIjF2/UUs3AZ8BqwuTRFwaVLXHoMHoitjQ
         OmMHs8QjjIG/z7o5xJVKWU6KoZem/ZW4M6O4f/pOFff6k/kSbzm5+xMc+P5DgKzp2lrM
         5xzY81eA0Pm0GWb57FNA/P65VmrDZkBmNaYBlCvhxUNUg4+9DfHuBCXEXJBWMSW7WYxL
         2ZYuG+Txsf8zqwIpFd2WHnpd6YvQeh2EmkTDGvRGAFWhNRqeeZeFemYypUfXgNV4vsP7
         CVq6WOVQ0m08vDz+xoOssyE3rQms0RWtsbprbqw91wGuEUVfBfVNwbZVYCFYdypjrAPx
         v0og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794796866; x=1795401666;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V2OEn9tAKSN4sXOsuonmkzU2ywS3aimW3cs+6O3cqU0=;
        b=DCHfWezqhVEI6XaXK75/VEdyvbSUoJdZFEgswV5ergdFCaaWO6qat+TZwUsj5a9u7p
         5m272HXNBwptkxS77ipO5TDOFOVeRPpaqt5YrRcXQlqUTgAwhTshQFhbYMXnH0W4eLoK
         iGByD6wDu1dixqkC8oKVhcLNhFrpVFic0cdvIRujdvF27nfz/EatoYABhDTyb/yf0/Gk
         T3XbmsRUy68rRj+z6a2O9Tc1hLJ3bCUvWxgwtntW3Zs4PH4lH244qcuV34FJWZaeqa4D
         QyT+OQDqso6yfKhSXKL4HFi6rcLnCk/L0rDhQflA5XTNx/uLd4v7yo2akoIgaNOnOEUx
         IctA==
X-Forwarded-Encrypted: i=1; AL+hErErL89+LJXALWDxrwlAXDn55agDuknrwhAwQWWxtBlTE+4vrjcCBKscYvpPJh8S3KUAYd8pRpP0yc1V9Sg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+q75LYARjHPcWVjVRu5RJVZP5H7L2a6JyHI0X/p2zdDbLInwYZ
	EGYJwcr3LO11Qn5JNsaEWnIu9/WoAiwJJ+EmTfNOlstxz4pvXF1XulTN
X-Gm-Gg: AYBFou2WUF47qvyLwWGDrGvhppv7t0wH7Za6M+cOYO+3UEcE4V2XjXo2m80qw833zmP
	OhRY0GfH+s+XN+gMwBznCJbnWObrsNEtqHRFfYU8oOzYoRjOpCZeQff0S7cyxK7qRxvJZQbnFNJ
	pYWABLZyUuHLfDsKx2fqLUqMN1zVS+XqZ1xdxgJM2PydWGomTI0TxYN9CzPFyIjVda+2pDMmmAn
	W22b9akTBPxHeg2qOrGdH4RQcuhYmhwYPnBlw0ci4BHqk9Y/KwenR9Cv5dMc1LruPdpFJQCQB27
	VT5gvI1AZy5R+uOCVNCZzb7rWyFTLzoGf9xrrOMo1SK2/ANuLDVToqGbEqrqckjJIO0hIcvy3nz
	DDvpOtgAc+ITZiW/+fT6jflU1KrpPR73Wa08mPoLyMn8OYS75kafvb3jYMhlTbWezYJj/+kR10u
	UquHGWdFX2RlZHe+rvWCslO8g/GTwtd4SADRHvBkPTCmR8ZXaqqCNpG3gGOYILg7fcHYeDtTzSB
	yNgN/NvLQhySvwjMWd0700k27h1OvzNCVgj5wUG9C5CKG/WVxQbn5hSwSnTzCbf9eVDLHnnAPXE
	PZuNA5igLi6UcGStbncLa+Z0pI7j2cgf5ZKAgEJHfbTxd0XMQMq4wSntgS6dsy2rkGE=
X-Received: by 2002:a05:6830:a21b:10b0:81c:a6c8:8a65 with SMTP id 46e09a7af769-86289905565mr5197772a34.25.1794796866535;
        Sun, 15 Nov 2026 18:41:06 -0800 (PST)
Received: from localhost.localdomain ([14.22.11.162])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862a82c4625sm5441937a34.22.2026.11.15.18.41.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 18:41:04 -0800 (PST)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: Paolo Abeni <pabeni@redhat.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Stanislav Fomichev <sdf.kernel@gmail.com>,
	Nicolas Dichtel <nicolas.dichtel@6wind.com>,
	Yuyang Huang <sigefriedhyy@gmail.com>,
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Henry Martin <bsdhenrymartin@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] net: fix uninitialized heap leak in multicast address dumps
Date: Mon, 16 Nov 2026 10:40:56 +0800
Message-ID: <20261116024056.1274402-1-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.43.7
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

__hw_addr_create() allocates entries with kmalloc() and initializes
only addr_len bytes of ha->addr. Dump paths emit entries using the
current dev->addr_len, which can grow after the entry was created:
tun's TUNSETLINK changes a device from ARPHRD_NONE (addr_len 0) to
ARPHRD_IP6GRE (addr_len 16). Both the RTM_GETMULTICAST dump and
/proc/net/dev_mcast then emit up to 16 bytes of never-written slab
memory per entry.

This discloses leftover kernel heap contents to anyone reading those
interfaces.

Zero the tail of ha->addr at creation time, so dumps can only emit
initialized bytes.

Cc: stable@vger.kernel.org
Fixes: a748ee242681 ("net: move address list functions to a separate file")
Link: https://lists.openwall.net/linux-kernel/2026/09/10/320
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---
 net/core/dev_addr_lists.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/net/core/dev_addr_lists.c b/net/core/dev_addr_lists.c
index d827cc21867b..53a2dfa2706c 100644
--- a/net/core/dev_addr_lists.c
+++ b/net/core/dev_addr_lists.c
@@ -100,6 +100,11 @@ __hw_addr_create(const unsigned char *addr, int addr_len,
 	if (!ha)
 		return NULL;
 	memcpy(ha->addr, addr, addr_len);
+	/* Entries are dumped with the current dev->addr_len, which can grow
+	 * after creation (e.g. tun TUNSETLINK), so never leave the tail
+	 * uninitialized.
+	 */
+	memset(ha->addr + addr_len, 0, MAX_ADDR_LEN - addr_len);
 	ha->type = addr_type;
 	ha->refcount = 1;
 	ha->global_use = global;
-- 
2.43.7

