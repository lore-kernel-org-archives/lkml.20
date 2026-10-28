Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793197096;
	b=Cf5pQslk+YcedfFx3XceVdMBSlrzlSVAH+aXuOy40tqx4fXB1n9Ir3Ao83Q7EOVyJDMV
	 jzajQJ9jq3svyQZqdgzRlHvHDQM9aAjec0B00x0KbWnR1d9rVJht8HmpXJ5bB80JNPbQi
	 l9RWAq9wmmKL3Cw01YLn2kXZdAgIAmXadpqoK7pbs6+5Y+EBqkmNuse02sG1MzuRZRB9/
	 3jed4aPh3KLfcMxnxcujCJqEsLr7biPjjP8uXdkoUzDNOBBUpScc+C6+gSmBmWsaidDSE
	 W+aPR2C4Q3zuHAxe280dOyxGyNesbntVyQe/fjxVoXWk13QoF8ynnoRf0er2BHdQqqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793197096;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=hVBdoLW9fkr5VdAnACGjL9+bMh3fHpmpbhIVBqSJe08=;
	b=kmQi8ZjSjq8/fUpTUFmUxz6jWc5tMVexSkXlX5fUUraN0ilaGAwJCjrMjTp3sXuRERd0
	 ioXnmQuIpyBVbaEmmW1GzV3jemx2IGwOHC9LUeItpnX7uXuN/HlIwRBvDUycZb9K7XXDF
	 0Mq1AZFZOEgSMJAjnvpJD+4n2KVyh3Hrwz5AJaO7vk5SMNTyDqwhJlJQAX5RGqUuw90wO
	 G/xu1GnjkGFZ0Qz+Egc1y7jNWxLQ07aft86GxuVLmJkHZTR6pB519OtpTB3yRxmK0GTGk
	 xKoj5sClHKBXEQdFZ6kcxIeCjOZSeMqwURhwgmaYMx/2ZCQM5jouOHWeJBcTVwzm2oQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T9ktbbCo;
	arc=none smtp.remote-ip=209.85.210.171
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94457606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:18:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94457606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T9ktbbCo
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8a070781f63so541074b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 07:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793197096; x=1793801896; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hVBdoLW9fkr5VdAnACGjL9+bMh3fHpmpbhIVBqSJe08=;
        b=T9ktbbCo5Z9/1NKk27IFpSLUNx4pqAmx3YUBiyXrp1gSRwpZggwfBaFje0lTEEPq2q
         iL3ErvfMZqAiObyLvDQjeFEW/h26o94H5RTglDTfEcJ7vVebSor1ZW1j7vmOwwRVWCIo
         dcN/L3S3r5e3R+0DauINd/us37UOm0/Z6GRAe/hcGl8f7rXmtHtt12/+Ff76GtuJvrbA
         QX64UBX4ryNzG+zlGssnzbtmnOxrIJZgGtNKD1V67qDQsB+1TPLJG/lGVY+wW0eHjUit
         7xFRbh0ql0lbEPLtSQkufQaMdpnIpKAN3q3mH6PPPh+nZOLsz5dsf2W0eeyk8bp/Pizr
         kTAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793197096; x=1793801896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hVBdoLW9fkr5VdAnACGjL9+bMh3fHpmpbhIVBqSJe08=;
        b=Hck0kwXNrjeJSmQTf6gf6yxnLJb/axK8wv1vER/OKlqd2yhyKqVC+q2aMkU3umW2Hp
         UGVq2BxoFg2BVMVCPmwwFN0lMfex+NNuWrACRymuaaaHqNQjxqvj0CLa+TbTjTpFFUux
         0QEtInzl0z4K8iB/eBxYTnqSrZ5U6bQnElEq/HgvBDq/vLV9SA2WJQVB3ILoNugN0Eua
         +ZLQBwBsGxla92iNxGsrgPKf3R1FFeVwYuX8j+MF35ULzQ3IofWz7ad4kgXOtLwjO88B
         EvIeYXP6VG1+C40JIkBRqnRTqQRTcbctB7jGJWFUPlNSnL5yOG95gaEBnzT1HDdxv1x8
         jKLg==
X-Forwarded-Encrypted: i=1; AKwUvBxghmP2C8LiLMEGN11Ekl1p411HK2mBF0eklyx9Czl3ZTh1wrfIbBGmKDU//0DttfuBWCWjE9F0037U+ek=@vger.kernel.org
X-Gm-Message-State: AFq9FYLzrQ5dv/UUJi+NQ8eyXEJn6nW0hSiUlBkBLYLr48CJ5j2YJuf4
	KxRt2MyG0BC1dA76+D/HeaMIV9SYWr6H9Lzov5z4Z8ERNur+rLef1CBB
X-Gm-Gg: AYBFou0DkC8L5e7ubpDWq2u+pCuALmkNxNHEFPDdDv8hZs0ER8zxDPpedtRhUmx50ip
	rcbIdAGO+5+bcGbz9xTlQQlGWVQCstbjrrI78kT/VMu7G2ytwCMGPcrKcpIF3g8jxkG9D0xjjrv
	gQE67lPM5B9KoN+GncJplLkiBf2JC7dGn9tvCj4OSwM2nwzHjLjXQLprQzlEar0OWL3iATutRiz
	YT5oG+6/dSjh5yUo+6vA1MwNU1JQ7XNbDAs2hS+4bmVWrlvGWSohmywPCugJXusRMDx0m3KkW/3
	YMpC+10vLySomsQejD9u5Mx1C3wyNc7bP9QiEeOqjUvOSXS/4kmXAFI1bYDBVrCCl3eHu4wLjDr
	h64hTbOFxcAxyketkGUWUf5KRf2OLv/XOdbkn1sd3YE45YaFLpKTh8ng0S93d5NlHsYJTERFwJP
	X3GEYir+HEzGJHthQWA0tW+grGS6xI5jwnzik8QP9ntw7V2CSnBtL5wkUbuAVI/Hg13emqAUTNy
	GRe6eQPrTlCb/VPYKKweX+UKEFYm4TmQftTVGPErhSLfR90ZLwmKLIDk6nawGDcpEMHksjre7Es
	YcHhmtOFk4l0ToZkZkDmkPFXkjp8JwhIJmpImpkXerr7R3AsSxA1jbnRtludBMTcP4IYn7WxKj3
	/+xD6TxZLbJ8Tng==
X-Received: by 2002:a05:6a00:2e88:b0:886:84c7:72b3 with SMTP id d2e1a72fcca58-8a6e81b3743mr2158463b3a.26.1793197095477;
        Wed, 28 Oct 2026 07:18:15 -0700 (PDT)
Received: from KRHW1CJW23.bytedance.net ([139.177.225.227])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a6a3d5e302sm1284996b3a.7.2026.10.28.07.18.12
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 28 Oct 2026 07:18:15 -0700 (PDT)
From: Zhao Li <enderaoelyther@gmail.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: "John W. Linville" <linville@tuxdriver.com>,
	Javier Lopez <jlopex@gmail.com>,
	Jukka Rissanen <jukka.rissanen@linux.intel.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 1/2] wifi: mac80211_hwsim: ignore non-generic netlink releases
Date: Wed, 28 Oct 2026 22:17:50 +0800
Message-ID: <20261028141751.6728-2-enderaoelyther@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028141751.6728-1-enderaoelyther@gmail.com>
References: <20261028141751.6728-1-enderaoelyther@gmail.com>
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

Closing an unrelated netlink socket can remove mac80211_hwsim radios or
clear the active wmediumd registration when its port ID matches a generic
netlink socket.

mac80211_hwsim_netlink_notify() handles every NETLINK_URELEASE event,
but netlink port IDs are scoped by protocol. The notifier therefore treats
a release from another protocol as a MAC80211_HWSIM socket release.

Ignore release notifications unless they come from NETLINK_GENERIC.

LLM assistance was used to find the bug and review.

Fixes: 7882513bacb1 ("mac80211_hwsim driver support userspace frame tx/rx")
Fixes: e9ed49bf4c2c ("mac80211-hwsim: Add support for HWSIM_ATTR_DESTROY_RADIO_ON_CLOSE")
Cc: stable@vger.kernel.org
Signed-off-by: Zhao Li <enderaoelyther@gmail.com>
---
Validation: A W=1 module build with MODPOST passed. Not
reproduced; source review confirmed that netlink port IDs are scoped by
protocol.
Sparse C=2 passed. Targeted Smatch introduced no new diagnostics.

 drivers/net/wireless/virtual/mac80211_hwsim_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/virtual/mac80211_hwsim_main.c b/drivers/net/wireless/virtual/mac80211_hwsim_main.c
index b9446577ff49..fcbc7f4355bd 100644
--- a/drivers/net/wireless/virtual/mac80211_hwsim_main.c
+++ b/drivers/net/wireless/virtual/mac80211_hwsim_main.c
@@ -7197,7 +7197,7 @@ static int mac80211_hwsim_netlink_notify(struct notifier_block *nb,
 {
 	struct netlink_notify *notify = _notify;
 
-	if (state != NETLINK_URELEASE)
+	if (state != NETLINK_URELEASE || notify->protocol != NETLINK_GENERIC)
 		return NOTIFY_DONE;
 
 	remove_user_radios(notify->portid, hwsim_net_get_netgroup(notify->net));
-- 
2.56.0

