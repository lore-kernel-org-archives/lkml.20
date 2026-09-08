Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F3F4233941
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 08:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788856068; cv=none; b=sZ9k5NC64sgpldA7Mh+C8UoZmy9cMpBQNJ6VYImaG8g3AzZNzRYr/IdCEAiKjBuKFM1yuKXC32ZGVOhCyzxOWgY5ghqf8NIFMNqjseOUGuu0vIWtPq1aPaGr4sDUPrazWfdZVsr6pVpIZdhhfZ947gFuiscpWpL99eOVVWiXW64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788856068; c=relaxed/simple;
	bh=wGWJGM/NS2T9XuzwoW91+XbZD5uWEEXTuVbuuctBpkY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bP07BG7wXYZ8yQLqEoeBNx1xOSQ9mfq40zQbN/E+hjscD/LD/+308vq8BJRtkA4jBsxOHVjNeMs2JAX1o6CC5SOnmwpS9pBRwKh3JiaBXzuahZdMxXnoOLNF4P+dihe/s7mhVan3H19jctt8k/zI1/CPV2cYAeuX/bF8pC3zujY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I+q7KJ/n; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I+q7KJ/n"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3966791a6eeso5236996a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 01:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788856067; x=1789460867; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cDCa4a8fieQ7UPqOtYIBeaZ67Cj9e1mlkdWpIAId3Co=;
        b=I+q7KJ/n/b43/m1CfsFZ/ELR9WDP2Vi6jawa3zCOI/2VXyUdA3HFU+K5fLuWCKXhc7
         9bgUnRK1/dFDq/Tpvpq4h7BYpo08Iy6UQLe2u5dw5kdJM4Fsv4c5oijxMH1B5l8mp7p6
         QZyL+13qTH281gltcITaVrKcXjkVrMlSyJTiHuDuyxZiV7z2TDDBazRfSqGzV0E/Trzd
         v4YhrErCiB8hNie4/A6fTAjQiHxhlU3FbSgqCcjjqZ1nwF0xesaws4EuyHgqMhhm45Bi
         GyTNNzHNh2itYjz12IuLl9NfJFD1Ho0djuDmjGzjjXbDectLknK7HSMjFBNqp1vYD3dy
         A/kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788856067; x=1789460867;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cDCa4a8fieQ7UPqOtYIBeaZ67Cj9e1mlkdWpIAId3Co=;
        b=RKkuVFA1LwFYGrMcL+ypBArA9moWh/COhFmQqJqqlH/qQD/LtVnzhpZ02qJIc6zYWH
         v9EyL2xj1CczjWZ5gBvt0xFSyO8IIR6K5LSWU2kSF+XheOpUVNZ60Jcf+T0jmwpXknQV
         COpJOvQTP3nY35afo9xF6LeISi4h6gbZ3XT71Nbpex1Ac7aGmvTOzgGipiC3Kv/f4eiq
         3XpgKfQqSEJDynYY9DS3Q508N+e3MhTtsvJSCpH8RQEc6vnktoBrwtDLZyTcpfRVrn1Z
         YP8MQP1pH/p6B1eWjrVTELFvzEaojF3a1kvLdzb5d0tGYLsn2KpPH4nkUzG23w04bxCo
         GcTg==
X-Forwarded-Encrypted: i=1; AKwUvBxMQBMGw8nQ8+CGh6vmAKTO0mqIxQ5tz+yhMVED8qshspidrHCmfCCdTodF0/Zp1X3tw8IV/h9bOSBrLdc=@vger.kernel.org
X-Gm-Message-State: AFuF++mcWns5zuy1jOaKjM0rq+P6ciq+np402oXTuL64t8CyAhK53QsR
	CQlXhYzxQMbZhJCoAcYdNrNW6ymzKrAE+ud8z5LbtC1n7Cl8HXwVOJrq
X-Gm-Gg: AYBFou2FwjLfII3+NtBdj3oMZGaJlHw34Pdk9erNCxZrcS1kKXlLiB3nHPHa5WncJa6
	iIpMElhTbw5pI+9345uVF//+Vv+HLX8KEctYE0ZrYl8FePJGAxYD63WEKFaJkaWItu2k8IaFiJD
	NisV6bWg9NIlzrnnKE+5uZlAzF9H+61UoDmSHsdoWWMz+glFrKUDiPyWwujSm+Jlj+dRu/wCFeI
	lli3kFvUzCkVJSYoE81z0ZO2qe3F4mRyq0n4C5FA/KCMqIrx+aorenC/KJrkgBqjDRN69bJzcGM
	u9aL98j7rBW1ez1D8cfRK7t3u7cTmoV3SLlve6ADZ9HNUAxhyVaT4A0S3Cq6IsDu710kYJWQxFy
	kNYPeEQoj+cQaC6foTruTHDcdTqICPpx3d3IK50ZFSjVY/X3uXAXinjkAy4mAwQ1gJNnYbItbfB
	+Rcz0UKgvxvwEp7MhG3elrVFjUUkcPzVylvtrA1bVov5ajZSZrhSHbksQf7pIZPSVhU7ceMubnv
	dFcNmLEqog=
X-Received: by 2002:a17:90b:1b44:b0:398:ba96:1afd with SMTP id 98e67ed59e1d1-39b2613249fmr37760083a91.8.1788856066863;
        Tue, 08 Sep 2026 01:27:46 -0700 (PDT)
Received: from ancienth-X870E-Nova-WiFi ([125.186.72.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db1495b57fsm55110925ad.24.2026.09.08.01.27.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 01:27:46 -0700 (PDT)
From: Daehyeon Ko <4ncienth@gmail.com>
To: Stanislav Yakovlev <stas.yakovlev@gmail.com>
Cc: Johannes Berg <johannes@sipsolutions.net>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] wifi: libipw: reject TKIP frames without a full MIC
Date: Tue,  8 Sep 2026 17:27:29 +0900
Message-ID: <20260908082729.209627-1-4ncienth@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

libipw_tkip_decrypt() accepts a frame containing the TKIP header and a
valid encrypted ICV even when the plaintext MSDU is shorter than the
eight-byte Michael MIC.  After it removes the header and ICV,
libipw_michael_mic_verify() subtracts the missing MIC from skb->len.

skb->len is unsigned, so a zero-byte plaintext makes

        skb->len - 8 - hdr_len

wrap to 4294967288.  michael_mic() then attempts 1073741822 four-byte
reads starting at the end of the 802.11 header.  Generic KASAN reports a
slab-out-of-bounds read once the loop leaves the skb allocation.

The ipw2100 and ipw2200 receive paths call this from a tasklet while
holding spin_lock_irqsave(), so the OOB access can panic the kernel or
stall a CPU with local interrupts disabled.

The trigger requires an affected IPW device using host TKIP
verification, an active TKIP key, and a sender able to construct a
non-replayed frame with a valid encrypted ICV.  This conservatively means
a malicious AP or a peer holding the same TKIP key.

Require the full MIC before entering the verifier.  A valid-MIC control
continues to pass.  A zero-payload frame with a valid encrypted ICV is
dropped without a KASAN report in three fresh boots through libipw_rx().

The KASAN reproduction uses a white-box module and the registered TKIP
crypto operations.  I do not have the hardware, so this has not been
tested over the air.

The initial candidate was supplied for validation.  AI-assisted tooling
traced the source and receive paths, prepared the reproducer and fix, and
ran the build and runtime checks.

Fixes: b453872c35cf ("[NET] ieee80211 subsystem")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Daehyeon Ko <4ncienth@gmail.com>
---
A tested source reproducer and full serial logs are available privately
to the maintainers on request.  They are not included because this
finding was validated with AI assistance, as required by
Documentation/process/security-bugs.rst.

The source-equivalent one-line change was apply-checked on every current
supported stable tag from v7.2.4 through v5.10.269.  v6.18 and older
require context or path-adjusted backports because libipw was moved and
the Michael helper was later changed.

 drivers/net/wireless/intel/ipw2x00/libipw_crypto_tkip.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/intel/ipw2x00/libipw_crypto_tkip.c b/drivers/net/wireless/intel/ipw2x00/libipw_crypto_tkip.c
index 24bb28ab7a49b..1fe543ea9dd26 100644
--- a/drivers/net/wireless/intel/ipw2x00/libipw_crypto_tkip.c
+++ b/drivers/net/wireless/intel/ipw2x00/libipw_crypto_tkip.c
@@ -476,7 +476,7 @@ static int libipw_michael_mic_verify(struct sk_buff *skb, int keyidx,
 	struct libipw_tkip_data *tkey = priv;
 	u8 mic[8];
 
-	if (!tkey->key_set)
+	if (!tkey->key_set || skb->len < hdr_len + 8)
 		return -1;
 
 	michael_mic(&tkey->key[24], (struct ieee80211_hdr *)skb->data,

base-commit: da2ca406f45a6e21760243152ed8d2e8e72915c2
-- 
2.55.0

