Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793038309;
	b=xOwUJQ9KIpnIZxSww1hgi64t29pooG5cP5x38WudAZyE1ApoiLYv/z8PmwwO13Xd7W4J
	 Lm2j93z08mR7Xtx63TgcMlEg9mdRpqevcBY86ne5b5ZkqPfvazb2bnv06H2yBMuPHs/h9
	 c6VKgStBFz3iVszrog5Jq1YMgBX/STW6tW0Kv6F+3J4fsh6vzzQqobe2+l6bf2dJ4R/Pa
	 RU0UVG9StmnX4vyM6tB3Ui4zs+ZkijXk3Y1jGAPWzaQBd94bzXHwLaOgCEbpYVA9K0Mj0
	 n+IRyLDO3xxs0lCzJALvNWILM51+DCo8ii6JOigdWq1IQN2ZjSmeR2F3sOlCLkrGwIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793038309;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=dKZQGmpkqBbaYMDOWkJ2IvHQIpl030vIHdXqdzHEmeY=;
	b=embvyInvqKj3CGWJAAzof+wnyPmjgXPQjySnsTRCVUIYKFa1zwPtwH1PuBaKoLuTV11I
	 1HVuEW/eNmjJdxkYIVQ0t7YYWnMVNRWyBLnaTM5FARv94Le++C0FS3te2tGV0qii9Ftgq
	 0FfI5gLt8jUvgx/XqtmwHnSNVQevV9zPhobaI7dITKchx5bEnH7dGi4IdbSWPZrm2vrvm
	 V4KDv3Gnjck2wSOVbOAFJoBNyHjf9kgleBuPDuEl90JIO7NBCteJMbf4KQSzA+M9PDs94
	 yPWNYvaGvpwiwaCKFRnNqIrEARe+oywz+Xga7lzsUBXrL9BKphNoxeOlG2lFauAf4Gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="N96cCwQ/";
	arc=none smtp.remote-ip=209.85.160.46
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08700606A33C
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 18:11:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08700606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=N96cCwQ/
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-48e9476e26aso1158971fac.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793038308; x=1793643108; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dKZQGmpkqBbaYMDOWkJ2IvHQIpl030vIHdXqdzHEmeY=;
        b=N96cCwQ/43Ar2T0LsDO5t0baZsWuCMSpKTC3NnKx+TRRhcbextYRuL3yMbs99AzRMa
         +/ejSMk5xs+FrDT3oA6yCczdIvzec/w02QBezremJ7/xfDs5/zet/hm3KHrGAr9eAVWy
         LD+BD7W/HCy69rkR5/6RBhkEHf+zRauDniBagleatWwEF2PldzTXS7U9hcn9+fud5M4Z
         QP/Tbr6xhkkun24k9C71hjxmcx2WpiZRGphNpHpgETOwkRUKXBrtnoLEsNvnV3Vj+08b
         9W/MxTrVn9wrFTqP55Z9axwqZLx+ZYGjg4ZFdCcI6wtfR/3vMweAap8sStFlRWI0G+7Z
         fPww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793038308; x=1793643108;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dKZQGmpkqBbaYMDOWkJ2IvHQIpl030vIHdXqdzHEmeY=;
        b=pRyJUFfVFkLnZkGlskbddrmOel23yMwnh+aiHzaZ5q0oGLA1aPsVkaGove9umI9rNm
         SvOodyeiMuT0vCdD5Bnj4bMSfpBqgaaT+T1S/QL+PCJvOwGhQTmMR67vZPoFp0ApuZ9P
         Mqy+RgUOoXrWdM92oByrWrnf/1ybolsRtwofU0sXcQs1zvD5jKeZyTBpILiO9N7omb54
         Zn/us0x+fkLCSuNvuT147b4BKFlO/fYN6gJ/0iGtJKt9xVW6jzQeFRZoC8HS0Ned2CYR
         c2GXmzPX3fiKTo/mnimUbN0kjsPOKH1SMEHRnJw8dFZLSXZlWDI7sR+4QTIJ6Wt5ReUN
         oiJw==
X-Forwarded-Encrypted: i=1; AKwUvBxfBq+OMPbVvLsUvVJPeEqIGWqC004e1uyH7fyMu8r93qxlkrxySXQc29qFZlQoqTNsbXdqeXfeV6SPA6s=@vger.kernel.org
X-Gm-Message-State: AFq9FYLX5awSODlKC/UEdR+Ao/1lTs3GFTjW9XZm4/9iFd0Xq1fpnlcr
	4WhlSfyVPNjLVzwBSj7kAWypBndhyj8LXmll+m75taDPiZQ0M+ByTBk9
X-Gm-Gg: AYBFou2QCZntsUmhAaz342roB8H7c6vRF+hCYO4MjywzdYIkSZfgaQ8x46ok3n2ol28
	py0ebMORiOQhRqMYcNqNWNxsdHmopMKBewmDmBtTcShSIK8U+oqQ8rJonffOj2w5C6nGw3TtF8y
	khuWUsqWvugIs0qGWRR5bIhuvJzQ5/kZk7Z8NL+rnAMSp93KT/AwjGeAbsh0rOPClIqMmkOeegX
	fB3Nw01tMsCEr/Hb6dynPwiSPWPVH3sxoSgJQCcTKCVxzgbSUf3FCMKEh3wh56iVlpGf3QVYNFN
	eGpbxRyx7IG0PG2dWoccuG9O0tsMNrYoacg+1MjCY8IMmYzYoWIg91FyzlLKrvCAz/b9MvJirKl
	hCZ2JQ06ObjX9cQ7SdnC7R9kt+lwrwL0Z2TcKK+CT35aP7Do+/kQY6njfyH76Cm3817dGGSOrv3
	sDW2lfD/iqiRNfVjPNCJPiWofODrAWpKMEfWLtNnNhYqSnLWKnNsSBJ876xWt20dOW5aoAxKOmd
	AQ1YRpPxgSGsR562tOsVTwzbynBMVMxlY1M9NVvzhyaFS6SLmFGEX53XjdTTSy/En9UXI30HotD
	YaIaAPf0jZvhq0d4HQsP6FdzNpVGisFBMWAmLc0AE7U3gPXs5n53gCq8wUggcPUuHjZvniNunwA
	VM6rK3DwDJtO6dPdjK3agYeCoEHZ119T7AyvusIyq8yQUIxZQStvh7BkW39r/vh5h3hb34XvzWi
	8EP6B7Ji8N24vbGTMheIppbbY2OBQy3rh/2rvQDmtRESpo1T6nGjo=
X-Received: by 2002:a05:6808:1919:b0:4d6:90d4:6bc with SMTP id 5614622812f47-55c002d9eb8mr6400473b6e.46.1793038307885;
        Mon, 26 Oct 2026 11:11:47 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-55c043115bcsm5795251b6e.15.2026.10.26.11.11.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 11:11:47 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 26 Oct 2026 12:11:31 -0600
Subject: [PATCH net v6 5/5] ptp: vclock: preserve missing hardware
 timestamps
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261026-ptp-vclock-sampling-v6-5-e705612541f1@gmail.com>
References: <20261026-ptp-vclock-sampling-v6-0-e705612541f1@gmail.com>
In-Reply-To: <20261026-ptp-vclock-sampling-v6-0-e705612541f1@gmail.com>
To: netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, Yangbo Lu <yangbo.lu@nxp.com>, 
 Miroslav Lichvar <mlichvar@redhat.com>
Cc: Eric Dumazet <edumazet@kernel.org>, 
 "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org, 
 Vadim Fedorenko <vadim.fedorenko@linux.dev>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Socket timestamp delivery converts hardware timestamps to a bound
virtual clock before checking whether a hardware timestamp is present.
A zero timestamp means that the packet has no hardware timestamp, but
timecounter_cyc2time() can turn that zero into a nonzero virtual time.
The socket then reports a hardware timestamp which was never supplied.

Return zero without conversion when the input timestamp is absent.
This also covers skb_get_tx_timestamp(), which checks for an absent
timestamp after the same conversion.

This was identified during review of virtual clock sampling changes.

Fixes: d7c088265588 ("net: socket: support hardware timestamp conversion to PHC bound")
Reviewed-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/ptp/ptp_vclock.c         | 2 ++
 include/linux/ptp_clock_kernel.h | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/ptp/ptp_vclock.c b/drivers/ptp/ptp_vclock.c
index 679ae40916f7..e9cf4da3ed8a 100644
--- a/drivers/ptp/ptp_vclock.c
+++ b/drivers/ptp/ptp_vclock.c
@@ -326,6 +326,8 @@ ktime_t ptp_convert_timestamp(const ktime_t *hwtstamp, int vclock_index)
 	u64 ns;
 
 	ns = ktime_to_ns(*hwtstamp);
+	if (!ns)
+		return 0;
 
 	srcu_idx = srcu_read_lock(&vclock_srcu);
 
diff --git a/include/linux/ptp_clock_kernel.h b/include/linux/ptp_clock_kernel.h
index 36a27a910595..56f6ab1855d3 100644
--- a/include/linux/ptp_clock_kernel.h
+++ b/include/linux/ptp_clock_kernel.h
@@ -496,7 +496,7 @@ int ptp_get_vclocks_index(int pclock_index, int **vclock_index);
  * @hwtstamp:     timestamp
  * @vclock_index: phc index of ptp vclock.
  *
- * Returns: converted timestamp, or 0 on error.
+ * Returns: converted timestamp, or 0 if @hwtstamp is zero or on error.
  */
 ktime_t ptp_convert_timestamp(const ktime_t *hwtstamp, int vclock_index);
 #else

-- 
2.53.0

