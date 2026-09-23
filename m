Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C78DA3A75B8
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 16:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790181693; cv=none; b=uRjiJjim5YUSP/40xzyJZj3qjOSuExkqy6dzwybQdDcIzz6HSlhojHBTFqK0nHW9rAaaljArXxHA9wrQAaLFzVtUxGjlzTZ0Gb/yE2wss+e3FiBMQ6DzEsnLHZNIkxToCkqjB8FwIKNxTNTCJphwikdDbv6Lt0RvIymhYAYHKVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790181693; c=relaxed/simple;
	bh=Z8XEHb1n1t6otZovQjQ0kiiXzql5nBBKA0LjXK4CdnI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iLwkfmn37ig3S7f8TTEPpLTAWkTQhoUPz8vxhxaocT3YShkWLPKHO8+mvN8D2XHyOGMQU/Xh778Ujd1+5ZKN4p2v+y1b/E/31/Rwjynfq/3mwAsnoes+ek6RiEz22Im9+bDKhh1nYnRSzjvSw4W9RtaUcAdiyK/lOswoxizughA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NqmS+eJS; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NqmS+eJS"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-90cdfcb5cb1so10139816d6.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 09:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790181686; x=1790786486; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7BzNuazOcXSzuWsG/mzzOpckUomlPcZX4HNgS2NA/iA=;
        b=NqmS+eJSwQUp+H/hLytHI+0Li/PkOZAqIoIrzBy+OSgr2+CWxoGEghDauMbSwAp0gK
         BJEQNF9RqJN1CgCSy87Q7vj+4Wo5rsMIfh/aJXsqu9TKYkW1Jma/u5cM/B8iC41JNj67
         7OmS1XsgMrxhMYMlnZ97acPhYvCf5OZzG5xYI9Ka3v2bCDHD/J4fAE6a7wfxzZe4rzmE
         f4jecTwDOAatIDWZjZOJ2Qjl5gsGH4a13zkP7jAhVuScUPrciYxpVBM1WU+mcKj/HRV5
         N0tGzefbMuSAJ7J+DxMZorbZPW+dWR/DeioLlUUTx4tn6p/sHLRFawXZd+H8sdYezd7V
         rFpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790181686; x=1790786486;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7BzNuazOcXSzuWsG/mzzOpckUomlPcZX4HNgS2NA/iA=;
        b=jOqhFr+u2TyoZgVmqz15zvG3Gqy51k6DfbvcedssHG80hA7bYQwSqMg1LoY0eWQF1r
         jWg2YI3kDU7pkZ80jUPbqsmDAK5NWPRxmUpntRueXIpJeCIL6MYhvusgXC52fkuqW3st
         HvG3Lf1D17of9zqLtzf2EAH0dZG0BdAxqXKKVTE2qEyM80Ge31wCKzVVs6X6wXNjpGE4
         ljjn48opET24sNuGuxmm1vrDMaswDMYOCJdNYUCYumogMakqRdnYK5WOGQawkQqr0C9a
         uG8iGJCKhh1w3JWZOccQ93agiqHExU0dhaIT6b7ldJFBrFyBGyXggHFW6wveFG5fOq2w
         te4w==
X-Forwarded-Encrypted: i=1; AKwUvBwb4zKbW+8S9zyZx4sX2zAKOojAOprMJ3RPdRTaAS+Dmlobwl2typArf/jV9M4xjYahG0mN5CPVEpAU6ug=@vger.kernel.org
X-Gm-Message-State: AFuF++k1NPtunk7gRYvmVcVKyycCpNg7EZzoj+cBDXQCkxk7lu+NbC4e
	LjukTUU1ePgb1s2QyyHUH7AE+cHjd1MKKo5a0PnGCXatZ10jFqlHb1vKHcd/nuEJ
X-Gm-Gg: AYBFou1MGO3WeWujXfBNjtBbaUhTAgBGcnDIUxY9UGrAkKqIq3OHwOzKpLPMEnplxLg
	hT1Qc4QuhTjfKxVT6HEYqhRuiZH+1xbDh2HMIlObzNTT1kgvirq3StbVCtAxVtuP0nQb8uGcUpZ
	tPE/K87nuZfWmcQ6UHxHEdl6qIseGviCARt6F6yUzBHVlQVd0lt1rhkzaexhIvzlyolIpgFjj4p
	kx6bZjcqNkFBmSimJ7PEvshdfRZMtJKSNG6G/mhKwmHDIkm96WQp8lXCF4+VWBgwAYKAGwOOgOu
	IsNLIww04SUA3FvtNffD6BopAJNtPYvvSE3MyVsYh8RZZnXsNBJBL9VRlZu19nmSKF4JJjE7/tH
	43NihU/08iEbAwMO0nkis4jOFulhBUqr8ng/upnS7EzJfkcnd54pNT4l+md6UdjLpgPL8VzFN66
	vAL0bFeavd8nuxHbseFwNetOgjdFVisUAlg1CFtM5Bk0+71aCaftqHtlh2S7o5lPpDtwqbUw4dg
	QJtb79wAjsZqiQsjsVhgt96cwPYxqAp
X-Received: by 2002:a05:620a:1994:b0:937:27fb:96f8 with SMTP id af79cd13be357-93c251e0964mr496039185a.41.1790181685674;
        Wed, 23 Sep 2026 09:41:25 -0700 (PDT)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c248e22f7sm258625685a.47.2026.09.23.09.41.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 09:41:25 -0700 (PDT)
From: Yuho Choi <oss.patchbox@gmail.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>
Cc: Nicolas Pitre <nico@fluxnic.net>,
	linux-arm-kernel@lists.infradead.org,
	soc@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yuho Choi <oss.patchbox@gmail.com>
Subject: [PATCH v1] bus: arm-cci: Drop cci-control-port node reference in __cci_ace_get_port()
Date: Wed, 23 Sep 2026 12:40:55 -0400
Message-ID: <20260923164122.596910-1-oss.patchbox@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

__cci_ace_get_port() looks up the device's "cci-control-port" node with
of_parse_phandle(), which returns the node with its reference count
raised, and only compares the pointer against the probed ports.  Neither
the match nor the no-match return releases it.

Drop the reference on both paths once the comparison is done.

Fixes: ed69bdd8fd9b ("drivers: bus: add ARM CCI support")
Signed-off-by: Yuho Choi <oss.patchbox@gmail.com>
---
Found by code review; compile-tested only (multi_v7_defconfig, W=1).

 drivers/bus/arm-cci.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/bus/arm-cci.c b/drivers/bus/arm-cci.c
index 7f2baf0571286..223b1fe19ba06 100644
--- a/drivers/bus/arm-cci.c
+++ b/drivers/bus/arm-cci.c
@@ -167,9 +167,12 @@ static int __cci_ace_get_port(struct device_node *dn, int type)
 	cci_portn = of_parse_phandle(dn, "cci-control-port", 0);
 	for (i = 0; i < nb_cci_ports; i++) {
 		ace_match = ports[i].type == type;
-		if (ace_match && cci_portn == ports[i].dn)
+		if (ace_match && cci_portn == ports[i].dn) {
+			of_node_put(cci_portn);
 			return i;
+		}
 	}
+	of_node_put(cci_portn);
 	return -ENODEV;
 }
 

base-commit: f0100363d8c374bd8e9ea7c9ba02744f0b802ca4
-- 
2.43.0

