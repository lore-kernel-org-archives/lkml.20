Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793555066;
	b=mNpwgiDnPZv3CsSnxuFthIUI76NueCbFDUbZnNsz5jUL9svWnQdUK48b/rBzherGn7Bx
	 drwmjI5lS/LHXiBEKO51a4uQKcW6Hj9eSRCdz3bar5Pj1muwoEvA0JiW3AZ+21ePi9vYw
	 BmKleb7dL513it9GRdyx2MhbIK3sh4MOIMoj7VdhICbd3yxHbFoNpNX9jy5e7N8Nae3X8
	 +f3IznRjCep8Yem0PY8RbFWr10DX9fpzBXlyrCms2Lryw/kCKJa6nUUwF9yDziBDvRh3D
	 OR60h+5hxHy2jfCzbpfFlhcPfl/TZpz29FMh+iynBrvtmbTiwik9Nu7WTSAK6LhF+ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793555066;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=9O61ATkKp+DlIEXsj3DD0qBP/WN9VXV3+UsO1P4gT6Q=;
	b=E01UzprjdFINREUJcdmBARW5rA3JEKkCX0T4ZRVNB6UL9SDAre1CDEfnW+CN+tT37FxD
	 KjavHQdYnqQ/fFKZ4XZfG60fbUP2ufIO/aKyNwgTy9QX3VD/4PZ0yRt65NTQZptcJeK7A
	 No4yL46wLgbkiEiWIdPoOVRoqdQUFVh5f5prvas2Veo3nZ0gv19SZejS7dGO66LOWmQn4
	 kleK3eyVGUb5VahZl9HdGLaR+fiYW6IePibr0GtgAzJyKfHEhut7kzcxUBauQJgy5C23s
	 4sYvEuMmFSg5X1rEXhOJSbJ8EmYAKGnNkcgVNUD1T4B8b9PhMcuiIkeSg6mAiYFiCxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b="Axr6b2C/";
	arc=none smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FE38606A32E
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 17:44:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FE38606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=Axr6b2C/
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b47c1a3c74so3027695a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 09:44:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1793555064; x=1794159864; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9O61ATkKp+DlIEXsj3DD0qBP/WN9VXV3+UsO1P4gT6Q=;
        b=Axr6b2C/htBA5mpk/A7z04dUTzsIIuRRDwi1GBxebzzC2Wr8Mj+BOuS4O5dONN1yZ2
         fFczSqudfLWZpQS4yaHhhl47jufjbZ8fOSmRGeFpwJRAtxXn1mgKHJaoap+PZ+OdrrXH
         +Yzt71aga+okNJ4AK4sp85zltvrNWePW7mgBlscR+SoTIjkq3HGj0JigZytcBsRjbvqx
         AEuM+XMtdwPKbx7s1FsLoW8NA9vOqey8NOgImB0T1spm4yeIzoXsBr81NrITfTjGd4jp
         QmHObgnt4Rs8ZrcJvOxldrUdxupBDSvPe/dAiFWyAKsFWM7aTAXx0HjTZhypALvYtOSP
         Lcig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793555064; x=1794159864;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9O61ATkKp+DlIEXsj3DD0qBP/WN9VXV3+UsO1P4gT6Q=;
        b=IBhsaPWQnLNxwGiMmwVE+gb0nCIQ1N+4QwMlspRBepab/AJQWLAzAQaV11h3r4ojiV
         LXtnjlw1ioJaM3SyfDSaWhndcWUunqFpNYz/M+m4tfC4gB7XBnZfXwa6dQpKqGIRa6Mk
         gZetP+84KyWLHPJN7KewvEFEVbTre63iw8sYjWu+nmmLHn/ZJWBmXwts5nmDkRbGSxaD
         xfKd8Y0kf8McYsBrYlJcj0lQo+c3TfUF53dAM34jYCBj1rmar0cV76jEjqw4TjjzEtqx
         H4+LMJdQ05Gn82FqbRkmck4ZsmHB/m8LY6XsWC7PApHjI2I6j5XCz04ZfHWD31vjoan0
         6wKQ==
X-Forwarded-Encrypted: i=1; AKwUvBz0kswVs5Nave+Lj7MKiqIiXsynS2XQfb3jbgPAmGiXbA5rua5rxl8ujxM9+Nu42sZexrgVkzLnrNRv0mk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Gjrz67mYJdN4wL19Oz4PkTyWuy9iskSyKB6GIv9jr17pKMlfB
	qd2h3EH/fH6jSgO3SX/FV6rm7c5NodHzW6XR2ji37NwSbTpovlxW4iSPFq5EZyS2Np8UeUf6ipD
	s8ktsrSri
X-Gm-Gg: AYBFou1pniu8Bpgq+dBCezVzubfRKE/sBFnMS4jd4RKXZQzzBXSU8aIquvBgybY9Hfj
	BdSN3kR55tNs0tMsgZzL1Ksod7b+yQHjaloc22m7fuPet27ePoMjFqP9KId7M0B2qVcZRBro0Jc
	A21t50/bzOs+tnWC0YO7Jt9W4SJO++F3M6LR96Yl8EmmRhzXPA3/gcyG1Te89+b/JlXE9gbTXuZ
	Ez7G7qVtRIfoK5zj/Q/PAweRudWnZsITBfrVgcw0ufAGkjeGiAWfDQFos5KHc5S9yFA4RCO5XK+
	VFMX/AGfZxPhQrqzM8HpHeztLMJvJvfqPGIuQuZSUVlcMwfp30lzg+xV7M/8gIOrgwUDzet4r0n
	ifyRjZyiD76z8iB4a56iCiHiM1C9M0riu1s8J4Dzjwa+woFUk2tvbxjWMT53mQW+LnC1x43pVt+
	AvDbVXF8bhtkuCDKReY/vItzZlzmGeM7J4mESIMBlwAiv2l7nuoZSDYjzaKUtafGfHOI8RYc64H
	lZMABzU8DUY8rnpbYs5Hjqb98Sdee1tdEVlLsoYwC5uGQ9a8FHPvx2hHpNlcL1jrySv1rd9cai1
	RO+HshTNOkqMH+wQXcgi6b8xyG42Qw8f/BNcIIIjl/AwXJag5EAxF9cme7jizHNNa/M/a0kqK2q
	kBwxfnoUx4+0qcBBBUbrJeT4qfULIEPQzpAhsY+IHAkX5u5mQ6Bz5qoN8V7e0+ej7C+5Ql/+V8m
	l/yMh+7IEisTvW17bwNVBQfqLaHp+QtoJSK1RJODOAf8RaA+yaCVWMv6t4RzatA98vqE9kui/Nx
	B8Ud4izb8TPtjk3aAMYbKmsHuqbmq45T+yEpNfYA7EIE9GIEGyqAzDYtqhEfuDxmTy4FPwzZrs6
	nCKAaCwQq6Yst1CgrAA=
X-Received: by 2002:a05:6402:1d51:b0:6ab:7700:9371 with SMTP id 4fb4d7f45d1cf-6b4d468b63cmr5289419a12.25.1793555063954;
        Sun, 01 Nov 2026 09:44:23 -0800 (PST)
Received: from Desktop (p54aff7cf.dip0.t-ipconnect.de. [84.175.247.207])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4eca21356sm2369094a12.35.2026.11.01.09.44.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 09:44:23 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Subject: [PATCH ath-next] wifi: ath11k: do not fail down transitions of the station state
Date: Sun,  1 Nov 2026 18:44:22 +0100
Message-ID: <20261101174422.1275413-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
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

mac80211 requires sta_state to succeed for down transitions and warns
when the driver returns an error for one. ath11k returns the result of
WMI commands for ASSOC -> AUTH and NONE -> NOTEXIST, and these fail
with -ESHUTDOWN while the firmware is down. A station removed during a
firmware crash then triggers, for the disassociation:

  Driver is not allowed to fail if the sta_state is transitioning down the list: -108
  WARNING: CPU: 1 PID: 5952 at net/mac80211/sta_info.c:1561 ieee80211_sta_eosp+0x119c/0x1668 [mac80211]

and for the removal:

  WARNING: CPU: 2 PID: 2080 at net/mac80211/sta_info.c:1652 sta_set_sinfo+0x1118/0x1144 [mac80211]
  Call trace:
   sta_set_sinfo+0x1118/0x1144 [mac80211] (P)
   sta_info_destroy_addr_bss+0x34/0x48 [mac80211]
   ieee80211_del_station+0x1c/0x54 [mac80211]
   nl80211_del_station+0xf4/0x174 [cfg80211]

Both paths already warn about the failure, and the removal releases the
host state of the station either way. Return success for every down
transition.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.12-01460-QCAHKSWPL_SILICONZ-1

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
ath10k and ath12k return the same errors for these transitions.

I used Claude (Anthropic) to help write this patch.

 drivers/net/wireless/ath/ath11k/mac.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 1a237adaa37d1..e5bab84a36bbd 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -10074,6 +10074,10 @@ static int ath11k_mac_op_sta_state(struct ieee80211_hw *hw,
 				    sta->addr);
 	}
 
+	/* mac80211 does not let a down transition fail */
+	if (new_state < old_state)
+		ret = 0;
+
 	mutex_unlock(&ar->conf_mutex);
 	return ret;
 }
-- 
2.53.0

