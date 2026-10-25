Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=92.243.27.206
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792952059;
	b=X/Ni3ICvjtnKKg/7nsmlcZH2dI/zeyoVrF+TexGI/TSbqvhmqrKKY9k9UCosDApkhtDm
	 V7/mFq2akNaxOuhbQOirRqUGBcp78GRpOSRTdrNYhfnIuhMJbwE9LZeIUYcW4Cl+mPqh9
	 4x9P4LbOsIOtQEEkNk1ONnbu1SJfrPc3rmKKBV8hBpUirkavvYnq2KXsDfQOpxvx9hEJ/
	 5sdNZDNtVXcEtTOicNTVe55X1F7qI5j0cH7ZNa8vtXGaN1gIHL0/1P+AlFB6dqyhB8wd7
	 bc4LSTwrUXcQchByuvUCDguh3jkhAABmjvP3cQGdgHsOM9uMPpu3ZXfCrzHJmXgnaKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792952059;
	h=DMARC-Filter:DKIM-Signature:Received:X-Spam-Checker-Version:
	 X-Spam-Level:X-Spam-Status:DKIM-Signature:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=TNYw88M4A29vHbzbKjQAA7G+8DSpZxiBpO072ArpD/0=;
	b=D8Sq0lP5Bja6y/JFwC9jiq78TUB8nYtSL2V1MRKw1nZUdF65/ObOIvsNV+yzLi/ulKKY
	 NZ2NEFfX8qMoheNF11Ljo06Wk6oLPSF12B/wAHTbNd/3ZVOgkxUwdN4ECvjG61I1r/aAs
	 v3+WkZHmB8oTJFHFqSepLmo8D4DEcPf8Xt+y6vP1PrRXFY/HMBz3Gd9WukXd9Up0IMnhb
	 5wc7C7HgVD0JDzuI8+F1uR2CPTgxKN7MUnx6seDlmzglJ9IKIcTDEhldLBjIMKGyI5QuC
	 vHg/QDJe1kwQKX+un0p5I56Vm8RJLaEzMNf66Q/8T0epej3AfYf7tK39lZLa2N72Tww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mess.org;
	spf=pass smtp.mailfrom=mess.org;
	dkim=pass header.d=mess.org header.i=@mess.org header.a=rsa-sha256 header.s=2020 header.b=gMs4N1dt;
	dkim=pass header.d=mess.org header.i=@mess.org header.a=rsa-sha256 header.s=2020 header.b=O8GSMK0n;
	arc=none smtp.remote-ip=92.243.27.206
Received: from extorris.mess.org (extorris.mess.org [92.243.27.206])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C87A3606A31A;
	Sun, 25 Oct 2026 18:14:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C87A3606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mess.org header.i=@mess.org header.a=rsa-sha256 header.s=2020 header.b=gMs4N1dt;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.a=rsa-sha256 header.s=2020 header.b=O8GSMK0n
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1792952051; bh=hwvs/h4DvGi0GNTtscYC9kCibySva20OyB9j0haLeSs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gMs4N1dtM0HA7BDGCxCjKhJFb/ODTmicHvtxhteyMSw7yYbmpChr0jxeaBL8bVWNZ
	 nYmlOFceTUTIn6ZASIpH4/F3E7uOBwQNaYvk0PdDLt7MUpcHy+MI4ake/tGBrB/nRB
	 7U33aggulKzJwvIWAvTaRF8g66ecB+phtma4Rilv6cKNecF7ZnSww7kYkRLUJICBQD
	 jy+XMiehg+UhLRtm/hRGwrliO5W/B6K4tZV/rpLUOBmEIT/hkb1xvN2m0H5GVy38Fi
	 864xxCt9wEtuC6/b9rvM8PXc3FTzVMGfx9sXGkVuxdzKbXzXCcmN89TjOKqCNgVt8u
	 7n7cgq5JPZAVQ==
Received: by extorris.mess.org (Postfix, from userid 1004)
	id 5FE1D40B2E; Sun, 25 Oct 2026 18:14:10 +0000 (GMT)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1792952050; bh=hwvs/h4DvGi0GNTtscYC9kCibySva20OyB9j0haLeSs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=O8GSMK0nmAZi4gN6SwVhhVYqywepn6xBcZvoPel1jIADqG9ndaz4qdWuiFbqMPQMv
	 2Q+8Nhxz0ImjncE8rJmIYr+rcvAFLiCEdLdTKqZGm/kJmpAgMXCpHwJ+pyFTYzdW6s
	 UqyxxjLqtetTE0gJvbM5cRBFA3+RZ1JTlm6XV2lFBrFlPQcf1t90DDg0GnxBm36BSD
	 5SBemQcGWDExia3J34gNZaggG8hy+dCTWXc9fV0K82jFBMWpeYtwIxFg030q3nwwiF
	 6tm56FOEhMr7+QFhCOAh+NVwpQjwJT0DPux0Cr/+EgsYqqMlt03JBxnjT2WEckfGUb
	 eO83C/n7f46sA==
Received: from maru.home (host86-145-132-241.range86-145.btcentralplus.com [86.145.132.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by extorris.mess.org (Postfix) with ESMTPSA id E5A8F40B2B;
	Sun, 25 Oct 2026 18:14:09 +0000 (GMT)
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org,
	Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] media: rc: Remove pointless msleep() after request_module()
Date: Sun, 25 Oct 2026 18:13:41 +0000
Message-ID: <bb325a849f8319f3851e9ded7a03331a957ca8a5.1792951808.git.sean@mess.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1792951808.git.sean@mess.org>
References: <cover.1792951808.git.sean@mess.org>
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

request_module() already guarantees that the module_init() function
of the module has been run.

Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/rc-main.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/media/rc/rc-main.c b/drivers/media/rc/rc-main.c
index a867bf9e8416..f8cc7e4a3d95 100644
--- a/drivers/media/rc/rc-main.c
+++ b/drivers/media/rc/rc-main.c
@@ -8,7 +8,6 @@
 #include <media/rc-core.h>
 #include <linux/bsearch.h>
 #include <linux/spinlock.h>
-#include <linux/delay.h>
 #include <linux/input.h>
 #include <linux/leds.h>
 #include <linux/slab.h>
@@ -114,8 +113,6 @@ struct rc_map *rc_map_get(const char *name)
 			pr_err("Couldn't load IR keymap %s\n", name);
 			return NULL;
 		}
-		msleep(20);	/* Give some time for IR to register */
-
 		map = seek_rc_map(name);
 	}
 #endif
@@ -1278,7 +1275,6 @@ void ir_raw_load_modules(u64 *protocols)
 			*protocols &= ~proto_names[i].type;
 			continue;
 		}
-		msleep(20);
 		available = ir_raw_get_allowed_protocols();
 		if (!(*protocols & proto_names[i].type & ~available))
 			continue;
-- 
2.56.0

