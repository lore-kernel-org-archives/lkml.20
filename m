Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794575116;
	b=Ndd9F2MjeiwKal0HcPOsqnX81Rkb0xPkWEW14WCda12YFEisHCd+WYARKTlnaWZ0HXiL
	 jGUvms+iNKqqhqP1a89wL3yi+8yPyha7EmRRHWWNGM3prMCT8NndVpFQe+jC1FpUfM8vF
	 vbsJd0+PL/inSTnRiUTlkv2n2iORC8xktuUez2siah4VJ1cd0aVEQ/MLEuxauy6Hi97q8
	 Gd9AmpvwGffrHcPILgWvb6N+zpTFVpfow5hlP1v3ThuoY0SENyU9I4P6K++c9QvKGpIwd
	 Sp0R/JSluSZYIbhbB594roub6iCJRUcZAZTHaj/LCf5WVKuPAiAoIg7SgRROC2qqh/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794575116;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Pv4z+EGHs55+YETm9Uv1vhzwGShZ+7nlSwaLJI5dR70=;
	b=gs5cmgzXNBftTcK9GaGc1xRjfgW+NDwm6coy6K19Ng/Am3HQwrr+47zRks5d1uG7+MC5
	 zpDpuy61tutOJZN3Vi4qNHkq7LqTPF6cg3WlUqpwwV4k0wyFUvXXKQsjYtHTjrNrTEGYD
	 SOBcQx/IfQEseRATIGkIixoAyDsW2CLZhlw8ouIPcxqI6yH8ODOPNHU6Q0vrG3gZSw0Pj
	 I0JyUffiYY5uUdO+rzzbTsQWY+VZV2tOMx6k40ILx4SWeVsAj3usDxgbYt2zkjITKl/6A
	 KE42rPr9vWAqE78NIXEfkEJZ/S6cTNclv+g7eCqbmZtImQwIw+ue3MLwF3VBbHNlNZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pDs4nbx5;
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBF73606A8B1
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:05:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBF73606A8B1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pDs4nbx5
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cc4c02ddd62so377896a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:05:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794575115; x=1795179915; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Pv4z+EGHs55+YETm9Uv1vhzwGShZ+7nlSwaLJI5dR70=;
        b=pDs4nbx5YIkcv5EMWzVzfvxBmiRCUp045RZJDx+PGOqWqq+ScZGwI32/3srX+5mWTg
         oia2KRJ2NPqAd3ct9lmfPzMDmt0OX2F7Bq93M2G87nkHF5+c1hgNQIuExy68qqxbjdT2
         cDoHpXVfQ8iAMIncI7xGoVJfo272RobJ5Qr2V/bsT/cyAImf77TJw/fSya6fe5BcEIyo
         /WE3a2fHbxNalwQUprAphy9/9uOrWfEs+fzLXf95g8vXg1iJ8UdFal/C9DGD/aFS1qJ8
         ARU7cMIrKh9mdJcV1MqB4qYOVsqOT5zHstlvwBqnvqC/6DaYTcKZw6JbXKI65n/KDLxD
         e+QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794575115; x=1795179915;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pv4z+EGHs55+YETm9Uv1vhzwGShZ+7nlSwaLJI5dR70=;
        b=PVrH9Etq8UlaA6fjbCZRdFgwygodSDh4u9OgSvTPqyOTeJCyIcyZS6oMXe7hzjXWjg
         PXWnvSn3EsVtGPmQ2vXb1OuyKkcmc69wc5rKGer2J1dIm1gir3V5vB5TeWSjttB6C21h
         M3vboD1SMvZyGhBXBfWavH/d8BtrxtvWsiSnWKrnBqs6udjJDiY8OpP1+4qqmWGH/5OS
         VSDicGmIsFCxTasTriNwQ/RIr56lksstPzXY3lpCZTcDHZBbhOswOKhjBTPLbTPUVqql
         p3fp2wE6TTCtr9yG1UH1Exr6oUc73wX1mPEulR+d3n7E0GLu7zubJvVgv/mVjtHDkUsl
         hZTA==
X-Forwarded-Encrypted: i=1; AL+hErElahG2iVN3kvy+WWyxER7tyEtj94rWa9sDB4UDFK/JxkUnBPPk8o79dyFhKV2nBgMsIOlBile2DXDRDRU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8/mgYg7SYBP9pP2uZ63Fy4U09EYNCY94JqF5WRxrB2SfHiWPrW
	Lfq1vMa+6q4axWx0cxEyIgYVms+IHZZsGjyMYFpxDUJQC/mxI2LxV5zf
X-Gm-Gg: AYBFou1TLdg3nxHylxDtB5Ub8+b1ICoVuQxPLGPuRqqtJDQ2Pz8tvRXLn65z8kMb6/s
	T+WaC1K2+jxlakOo5qWw7D6+TkN1P95v7I4Q75fJ5euKc+Wke+rQwDA7s5IgpvSClrOvUQwN4z0
	0dMk2AQctYGwIdPLac4OPBngrxg1Tr8ugOqvm0EdmMStSU6OlvGQ8RQV7N7zavJzJYjKK1guxix
	4Q0+8/dsjI4nw07MUH1V2sgZ/ZPVyA9GH7ei1gk4WcwXWsLO0m7fUWymOf4ZbQMIKo7NB354Pjc
	vO9Tc8xeb9S1jYWcneIvK65U2PY5GPrmnxYgfV2S2Nj1mLPQ0jGg8NmZc9JXY7znUdMYsAJmgla
	hyN94Xf3KylOhNMONyPEZOo9AXu4q3qNz8WEzGJB9Tawyq2h9KdHEiIhaWmE+TzZV/A6zot7O3t
	5AQCl8G+K9fI4e1e3YKez7Jp8vv/Y+oKoe4ft/LXuxvFPqwGPCGeStn0UFc/vGDLUoeHizFIxhQ
	OFVZ57G2i7CLy9339m56zDHj5jD4WfqLq9YcJNmS88HWCfgxwjTQABMVXxHLsZFp7Z+CXJuw9mC
	CK7E9z1S+GeAAih9JoDCX70eEUwLEguJZK9oe5LsWsi2pK/ZxlVBdaJWnFvzdu2W6pNHDGjrmoz
	Su00kvO8LDcDLVnVfBik=
X-Received: by 2002:a17:90b:3148:b0:3ab:2d17:51c5 with SMTP id 98e67ed59e1d1-3b1b07ff58amr2210632a91.6.1794575115173;
        Fri, 13 Nov 2026 05:05:15 -0800 (PST)
Received: from JIAPENGLIN-MC0.tencent.com ([43.132.141.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d04336sm9916729a91.7.2026.11.13.05.05.12
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 13 Nov 2026 05:05:14 -0800 (PST)
From: Lin Jiapeng <ljp1205831794@gmail.com>
To: jv@jvosburgh.net,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	sfeldma@cumulusnetworks.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Lin Jiapeng <jiapenglin@tencent.com>,
	TencentOS Corvus AI <corvus@tencent.com>
Subject: [PATCH] bonding: unbind 802.3ad slaves on enslave failure
Date: Fri, 13 Nov 2026 21:04:40 +0800
Message-ID: <20261113130454.63032-1-ljp1205831794@gmail.com>
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

From: Lin Jiapeng <jiapenglin@tencent.com>

The 802.3ad enslave path binds a slave to an aggregator before publishing
it in the bond's slave list. This lets the periodic state machine select
the port and attach it to a LAG while enslavement is in progress.

If a later step fails, the rollback removes the slave and frees its
ad_slave_info without unbinding its port. A port selected in the meantime
can remain linked from another live slave's aggregator, so later LAG
processing accesses freed memory. A test-only kretprobe forces
bond_sysfs_slave_add() to return -ENOMEM, after which KASAN reports:
     BUG: KASAN: slab-use-after-free in ad_agg_selection_logic+0x1a0d/0x1fa0
     Read of size 1 at addr ff11000109be946e by task kworker/u16:0/13
     Freed by task 110:
       kasan_save_stack+0x30/0x50
       kasan_save_track+0x14/0x30
       kasan_save_free_info+0x3b/0x70
       __kasan_slab_free+0x47/0x70
       kfree+0x1b3/0x550
       slave_kobj_release+0xb6/0xd0
       kobject_put+0x17e/0x300
       bond_enslave+0x1acc/0x5090

Call bond_3ad_unbind_slave() in the common rollback for published slaves
before unlinking the slave from the bond. This detaches the port under
mode_lock and preserves the invalidate-drain-free ordering used by normal
release. Successful enslavement and earlier unpublished failures are
unchanged.

Fixes: 07699f9a7c8d ("bonding: add sysfs /slave dir for bond slave devices.")
Reported-by: TencentOS Corvus AI <corvus@tencent.com>
Signed-off-by: Lin Jiapeng <jiapenglin@tencent.com>
---
 drivers/net/bonding/bond_main.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/bonding/bond_main.c b/drivers/net/bonding/bond_main.c
index e9f5e753f677..60cc9a6a4fc7 100644
--- a/drivers/net/bonding/bond_main.c
+++ b/drivers/net/bonding/bond_main.c
@@ -2355,6 +2355,8 @@ int bond_enslave(struct net_device *bond_dev, struct net_device *slave_dev,
 	bond_sysfs_slave_del(new_slave);
 
 err_upper_unlink:
+	if (BOND_MODE(bond) == BOND_MODE_8023AD)
+		bond_3ad_unbind_slave(new_slave);
 	bond_upper_dev_unlink(bond, new_slave);
 
 err_unregister:
-- 
2.55.0

