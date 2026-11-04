Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793832330;
	b=zd1Ve29Z1/RcXCfffelwXhNc+mtYsitqNZh7bWVrnVLlSh8Z//d5OiAeDR0lSzhaH4yx
	 LTVmCGON/5vXavUHvJPzqgLHjlx2p2rCP3QjS+LQc79vfHuF2/5O5gqI3NtHJkweVqSrX
	 LNeegIKf+Pr7hRmAUf86hS/8cdV/ggzuKWyYbVpXcr6deb0liLLLRxIKN6chphHf7CwV1
	 qbH4t8rHtwj9VeRX3Pr8FkfpgfL6ruWC1unuzBkxP5S+FJ5YtICWaQ8vLdN2NIfZaewe3
	 eUk4op4iNH4YufwxeEUJ2ZT7SQZK68aLjqy1X/P9XgrdgTCmq/theSn8EEI9+FvMqdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793832330;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=hzFtPj3V3YwVm22wvSL4bFfz+Nym6wX6N9afFXh5Zmw=;
	b=bist0oiDlA4NBYYgdjo6KWyFHEm/K0s8edPUDNAdnh9AjJXFwvaGLX6+tygQf6u9KTmx
	 AkZcTrFRsuGEb13JCc4Qf9mLCfXEjSkBzmA0ykV21ueCQET4qe4zr6QbQKoCxIDxDbZHP
	 o+TUGx0gB95C8lRheQPqsUU4cmnLMJa/9+nJDbn03Maz4BHrIXD4a+yvLBVaanBfR7HiX
	 yyQrhabj/rSZ1v4q3+V743TpI7q5qmrNWePfDvwlBMISleXvbWaZCY4pvE6P7fR36EMQW
	 BmEy4iV/bRzXh83qUcPrftcXYK5AW4+9pQU8QszUj63bl4APUGABYhcqqXHEtgVVoJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gcleRhrR;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27ABE606D81E
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 22:45:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27ABE606D81E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gcleRhrR
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4b4571ff080so13398605e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 14:45:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793832328; x=1794437128; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hzFtPj3V3YwVm22wvSL4bFfz+Nym6wX6N9afFXh5Zmw=;
        b=gcleRhrRtXnyp4zrzenEDYdVuGdQEOgrDxZfxv2J2agJH6IuZ+4pudUfcpS30Mqq6m
         +nhnHWp+q9sG+7FwRuy4b9wA3f11b5ouU2MBd79ETIWGvJ6ZJDknPJcHm9+3oCg+ssVP
         tbZM8fZ952ARRee33t/aZWuNQyZSDeDTMT7zTVRLVd0gND34qijxelCyIf+AwiePfDLe
         NfQI6PuAM3Biof9KzoaEFlllis6Lq7OMLxKCp3YVT2mBP6P5cgZY54c45mUhAqPEjnWv
         mh4woTky+oYT04Jd4UN24XzCKIYIAm1OiScHhGsASCSJOiZ80w+ylKnPHR2KmDVtUBAD
         7Ggw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793832328; x=1794437128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hzFtPj3V3YwVm22wvSL4bFfz+Nym6wX6N9afFXh5Zmw=;
        b=ilIAk58ZvoVV1v21iVOFAVhkV5O58ieWU+8XzVt0rNRw+3zPyCwCmcicbdULDENufi
         SJq6FngvHlq653OvrpAFwQFvJsHkSUmcnsmKMHR2cBEVtaFWtPINdUkJwQ5wCco6ihXR
         9Hor0Uzx5MPqc7q34CifmLyblDB/OZ+g21kI/umNMbSIsAfNukO3xBc+AimIONROJVUR
         bkGtJ3opcSz4k89TJ0D2nq2umddRcxBIl5VANxbv4RmMJ/s2qVJa5C0bz9Y6a70rHDZ+
         P6TDZk7oYo0NOhmci8IL4GGERyxc8usrLvo68QdGK+Qc7Fczpjteo7djxtFfbhtQ4FVm
         JJbA==
X-Forwarded-Encrypted: i=1; AKwUvBzqNr9yoyDTCERZDkuQs9XSrE4200Cm6hQecRn9W46Z3JOeb9nWjKZh1jmLySQ9x4ZXRrV5+7IOPXAZ080=@vger.kernel.org
X-Gm-Message-State: APuU4Z9lxfezxffdffJ5NQyNoXbyTaQg5F4Zc1STLoh2F/Riohcwd8aS
	XUg6HaCYefiduFcaMbg+Mi7kZsTmIV1zKpEIBgGXOkYjDqotJ1/PvvTM
X-Gm-Gg: AYBFou3cJuHdlll10kSSS1pTDZmVMXiJERi+IbfX1SxnvPZBFqvANFzFx0ij9iNkI2Q
	qgTUFGE9idK0kW4+f4QC7f83ef0nAPsRNJFSEzBtqgBIjNk6oY3U3duwglBjRSTakLap9KuLetc
	sEXe2P8TM4cPazsjCoAjAinC3fUQHg4Z41Ms4moYzCUMp0U0B1qbIthgx6WeqDk38MxHeAtYfto
	AjyObOTXxEDl89vmzJDoh0TMtviEcJXiODIxl2XotLuLPN6eNEY1G0KrFRRNL6wJxqCLvIfSsE1
	AstteDjjfet20c6Nn/e2+j8IMpmbsWxmBqIyCRwmYI8RxlHVYyDeXB42oMvO1JjCOJy9LSuSf28
	o/czTb4BLTqrdnbT9RY51s/krdkTqMw0XMBarJY+max0FH7ulssVlXM6UUrT3jPppFrgZwzyVx3
	jOCPiZKf7tEt77aFaE1YFYi2Zf+8FJQ93kaECWCQ09NYcxMBd5c592MNuW51ANhCPZurr534Eog
	+Rs3HFfFk3Pw2reUUfUqkWsbqkp8w635Q+XAoYfKKUtoLocxmvyYOgNwu5GBR+rSVIPUcwhlPw+
	widuYmS7stF5o7IEncTVWPkOpXhrWIOnRHmPMwBvNhLhBPMtnu50mVwW5FYADyFntXQ2OfBPRzc
	Tmpu7pHXMWn8uY5ZuBZoDr6Dhhr6uFHHBHq30iNPjeXIaDKdzJCzoRG4TdswDCzEDwgvzHOGsJ7
	s8GHJS+QLa4PuPjc7JaNYJYkIyH2wxBIuamGNjH2M0LFm6hqf5O3bZvg==
X-Received: by 2002:a05:600c:4f8b:b0:4a3:5d64:df91 with SMTP id 5b1f17b1804b1-4ac17ffaf95mr392832135e9.18.1793832328499;
        Wed, 04 Nov 2026 14:45:28 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a00-1028-8388-a84e-947d-5f15-1dc3-a8b4.ipv6.o2.cz. [2a00:1028:8388:a84e:947d:5f15:1dc3:a8b4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b4320efc7csm36604235e9.2.2026.11.04.14.45.26
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 14:45:28 -0800 (PST)
From: Josef Schlehofer <pepe.schlehofer@gmail.com>
To: netdev@vger.kernel.org
Cc: marcin.s.wojtas@gmail.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	maxime.chevallier@bootlin.com,
	w@1wt.eu,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v3 3/5] net: mvneta: unwind a failed mqprio setup
Date: Wed,  4 Nov 2026 23:45:16 +0100
Message-ID: <20261104224518.66487-4-pepe.schlehofer@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261104224518.66487-1-pepe.schlehofer@gmail.com>
References: <20261104224518.66487-1-pepe.schlehofer@gmail.com>
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

A failed mqprio offload setup leaves part of its configuration in the
hardware. For example, when one max_rate is not a multiple of
10 kbit/s, the command fails but the TX queues set up before it stay
rate limited.

mvneta_setup_mqprio() returns on an invalid queue range or rate after
it has already mapped RX queues, switched the rate limit mode and set
the rates of some TX queues. The qdisc then fails to attach and the
driver is not called again, so nothing removes them.

Undo the RX queue mapping, the rate limits and the traffic classes
when the setup fails.

Tested on a Turris Omnia (Armada 385). After mqprio failed on a
max_rate of 10001kbit, TX queues 0-3 stayed limited to 10 Mbit/s and
the VLAN priority map stayed set. With this patch neither is left
behind.

Fixes: e9f7099d0730 ("net: mvneta: Allow having more than one queue per TC")
Fixes: 2551dc9e398c ("net: mvneta: Add TC traffic shaping offload")
Signed-off-by: Josef Schlehofer <pepe.schlehofer@gmail.com>
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/ethernet/marvell/mvneta.c | 28 +++++++++++++++++++--------
 1 file changed, 20 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/marvell/mvneta.c b/drivers/net/ethernet/marvell/mvneta.c
index 79711a117c39..171111d7fe57 100644
--- a/drivers/net/ethernet/marvell/mvneta.c
+++ b/drivers/net/ethernet/marvell/mvneta.c
@@ -5277,8 +5277,10 @@ static int mvneta_setup_mqprio(struct net_device *dev,
 		for (rxq = mqprio->qopt.offset[tc];
 		     rxq < mqprio->qopt.count[tc] + mqprio->qopt.offset[tc];
 		     rxq++) {
-			if (rxq >= rxq_number)
-				return -EINVAL;
+			if (rxq >= rxq_number) {
+				ret = -EINVAL;
+				goto err;
+			}
 
 			mvneta_map_vlan_prio_to_rxq(pp, tc, rxq);
 		}
@@ -5289,29 +5291,39 @@ static int mvneta_setup_mqprio(struct net_device *dev,
 		return 0;
 	}
 
-	if (mqprio->qopt.num_tc > txq_number)
-		return -EINVAL;
+	if (mqprio->qopt.num_tc > txq_number) {
+		ret = -EINVAL;
+		goto err;
+	}
 
 	ret = mvneta_enable_per_queue_rate_limit(pp);
 	if (ret)
-		return ret;
+		goto err;
 
 	for (tc = 0; tc < mqprio->qopt.num_tc; tc++) {
 		for (txq = mqprio->qopt.offset[tc];
 		     txq < mqprio->qopt.count[tc] + mqprio->qopt.offset[tc];
 		     txq++) {
-			if (txq >= txq_number)
-				return -EINVAL;
+			if (txq >= txq_number) {
+				ret = -EINVAL;
+				goto err;
+			}
 
 			ret = mvneta_setup_queue_rates(pp, txq,
 						       mqprio->min_rate[tc],
 						       mqprio->max_rate[tc]);
 			if (ret)
-				return ret;
+				goto err;
 		}
 	}
 
 	return 0;
+
+err:
+	mvneta_clear_rx_prio_map(pp);
+	mvneta_disable_per_queue_rate_limit(pp);
+	netdev_reset_tc(dev);
+	return ret;
 }
 
 static int mvneta_setup_tc(struct net_device *dev, enum tc_setup_type type,
-- 
2.54.0 (Apple Git-157)

