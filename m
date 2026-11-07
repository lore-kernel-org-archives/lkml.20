Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794033457;
	b=wdSC7PoS+x9qsXTImEzFZf8AZ41I3olEf3L3LhPxT7SmL6wIPwgOjVMPyN31y0Hbd8gg
	 D3dgI0TmP65P731uWTfTHlAA9Od8eSHo4peOf5YyO5O50FMEBaByNp58LkqJW1iaUkfx7
	 3VZrD1q/OZ7NAySlv8jz75yq25NETBucsmDtz38BEMwDvt5jdGHH8+XWEkhdA7Wne+U9/
	 chHWHAvHyg0wXQXkh2WyPB5jc1HS/GvoKv4yYjkvNM+r8Yl/5NkBzs8HMaojZIPUZ7lKy
	 R1t0B1K2+M6rLjLBJRr9KE1gWkZfgJNfj/y+OesJSEpX2TLw4ifwYqEZpYfttP6/3bQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794033457;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LHL2l3rOn22wCea5M4iQzvY4HHhth4DONcB31HGYom0=;
	b=O1VTqHZPZa1weKFRByaStHetV1cKgQFOx2vU921r9PiLOXJgA5XOI1Hfol3xLaUwLaL0
	 vSoXKaS8+Row+iDMoPoneUPxqlXX7X+waXPh2DAQ5dN3jotS9xbulipK8Rk5lsL5stslA
	 baHgbVcTgz7qk2lQpfGjcVpMQpVpZWX97vOzgxpSP3u3JUlPQVS5JL0DMShnEDZTJNlVT
	 NzSygDQtiyak85fb8VsnbbKyMIhi/ip70ayYdM6m24q9wkQ9KN6AhZ3DFJlNganD9ABks
	 mrnmavfM8ADmRyiv2AHluc1L5SzWFVTEaQ3ZvFLsRafWfvNcXzNTOwK/vQ+Mmg6ew9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Fu7kgJQA;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B09B1606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 06:37:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B09B1606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Fu7kgJQA
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2ed1414df17so5136665ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 22:37:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794033456; x=1794638256; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LHL2l3rOn22wCea5M4iQzvY4HHhth4DONcB31HGYom0=;
        b=Fu7kgJQAT1614CBoJ/v0QNumGTnN/XUwli/MO4kPZrVn02UGb3hXhv0UJ8xGiIno5h
         VGMRKshITnOzwHw1He0nsL8KGGbk6zAuorEA2hAvA/EEyQzQWnaQ9bGh/Zos4PRJszvU
         pauSU4gZxBeZb5H9xjnRSiFhV7SBhoB4crHhtV2Am9bxSj2E96Vy1nkaAwfCgDk5RaWS
         ZcnWEJ0Rd0xVZhd81TTQvkGu2mwVAFtlXxC3QDhP0KnL3o5OQKENwpjJUH6n4/qtD0zu
         0yu7LrqB+xWnnKugjwas6+PvPI39yp5p88b3J8LeoIKVFH60Yvp14bi3LgZ/Cp6Ni84Q
         Id+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794033456; x=1794638256;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LHL2l3rOn22wCea5M4iQzvY4HHhth4DONcB31HGYom0=;
        b=LXvTpncHcpjp1/mgnnS24dtekVY+ebS8mIOfbxlKLZye8yPp5vYQtjhYwfs+xmvGeu
         oYHHOK8Go8jvEmZbLoVSlQ/Iw+K+5iAL/MfEd67cb8WrdkQMuUzA6LuA76RWCPprZfPE
         ofTPzV48g0BSCdDEXmXOwzkJr58uZVcHAlwr91O+CuJdfEuu8K+pLLU66gQDc/HzkQTT
         0Aysn+VvgQ8wEuCn0w/EnQ/9El+IU2dVisxSzYh+7aCyFTCTe+nmQDAaXSbu1aUQhWml
         oNvbOAEL3Fwk4SlGwgvktIWQ8znmnu1yLNsUtXbiDwVn4dEEjXa+TfGGc7T3h5Wh2BEY
         ei5A==
X-Forwarded-Encrypted: i=1; AL+hErFXsadypOV2GzHNl0uDBIr74hRSCt+0N5eGywebc6a6VpoaZWmupk9eCVx2dMry3f+grEWk/gPmIU1/0uA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Kra2kvShIWdE5tW0ADtKh7vLOQ+1vmvcQZAW1hvMrW6TQbztv
	R+ElPAhYp4YPKtJrtFTXFN4b9G695sdrmS2sYyBAJkXFaaU3c3kacOOzdk+FB9SV
X-Gm-Gg: AYBFou2E70imtVFFN4SMbpbPBX1H4XWUBRvpWAkxaCh8WtU9idBch0YJcWo5XE9ABpO
	w9jXU5+d+zC7H9xDzVJhQt9VEnhnhLmpDOx1BOJHrNOm//ser8u63AgOzMljwpiaP+9PQeZ3SJ2
	QR6zlXpScHpvY1LGRl4gVU2W4ViZUGObig8r9WdlVoMgnzDzeWX6aaLJNiS1+T7cnfkadw9I6v2
	Q2pVl9O9QrUt/5KK9h36WBsT7SRyz4hMt8cqjvWRlxe9vLjhkDhPpt+Bbjrqiv7j7NkS0Cn0MrY
	YRBzu6iBfSh8bEZU87Va5GJcOMHjGAA7Q1YWhx4m4b0+pTFSYwnTR1zHh4dWEIJxESDb/u5Q3uW
	XhmGRskg+bvnueMaC2ByV3eAEa5+0g0Aey6QcvyBmL1sL4kgh2P9QmRDSm62Gkohzz7BnU5sjWD
	CqDfxzMOZCfxF+8XxKesRqgah23KIAvr31aSit0JIHSi+mUzhGaoCEXZ4ZioERLyB2dI0iJbkqX
	QbPstJnacrz9Eor8MPE+lClNYZ9xX9Xk42yYrrNTwciMAPxMchUxcq6RD7pB50slXP4BN7gXDAb
	efLFLgOX1pEaqsC/0aHmoLsxRtUfMbmIvmjdYhV0QkRnogWi
X-Received: by 2002:a17:902:c403:b0:2ed:892:584b with SMTP id d9443c01a7336-2ed40c4950cmr61777055ad.32.1794033456039;
        Fri, 06 Nov 2026 22:37:36 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed477a9301sm11315185ad.23.2026.11.06.22.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 22:37:35 -0800 (PST)
From: hyunjungg <hj351016@gmail.com>
To: MD Danish Anwar <danishanwar@ti.com>,
	Roger Quadros <rogerq@kernel.org>,
	netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH net] net: ti: icss-iep: fix deadlock when disabling PPS
Date: Sat,  7 Nov 2026 15:37:26 +0900
Message-ID: <20261107063726.3388730-1-hj351016@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: Hyunjung Ko <hj351016@gmail.com>

icss_iep_pps_enable() holds iep->ptp_clk_mutex across the whole function.
When PPS is being disabled it calls cancel_work_sync(&iep->work) while that
mutex is still held.

The work handler, icss_iep_cap_cmp_work(), acquires iep->ptp_clk_mutex at
its start. The capture-compare IRQ (icss_iep_cap_cmp_irq) schedules this
work on every CMP1 event while PPS is enabled, so a handler instance can be
running when userspace disables PPS. In that case cancel_work_sync() blocks
waiting for the handler to finish while holding ptp_clk_mutex, and the
handler blocks trying to acquire the same ptp_clk_mutex -> deadlock.
lockdep reports this as a possible circular locking dependency between
the work and ptp_clk_mutex.

Unlike a teardown path, the capture-compare IRQ is not disabled here, so
the race is reachable at runtime simply by toggling PPS off while the
hardware is generating CMP events.

Drain the work only after dropping ptp_clk_mutex. The hardware compare is
already disabled by icss_iep_perout_enable_hw() before the drain, so no new
work can be scheduled once the mutex is released.

Fixes: f18ad402cd8b ("net: ti: icss-iep: Enable compare events")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
---
 drivers/net/ethernet/ti/icssg/icss_iep.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/ti/icssg/icss_iep.c b/drivers/net/ethernet/ti/icssg/icss_iep.c
index ec08589..6264061 100644
--- a/drivers/net/ethernet/ti/icssg/icss_iep.c
+++ b/drivers/net/ethernet/ti/icssg/icss_iep.c
@@ -579,6 +579,7 @@ static int icss_iep_pps_enable(struct icss_iep *iep, int on)
 {
 	struct ptp_clock_request rq;
 	struct timespec64 ts;
+	bool drain_work = false;
 	int ret = 0;
 	u64 ns;
 
@@ -607,7 +608,7 @@ static int icss_iep_pps_enable(struct icss_iep *iep, int on)
 	} else {
 		ret = icss_iep_perout_enable_hw(iep, &rq.perout, on);
 		if (iep->cap_cmp_irq)
-			cancel_work_sync(&iep->work);
+			drain_work = true;
 	}
 
 	if (!ret)
@@ -616,6 +617,15 @@ static int icss_iep_pps_enable(struct icss_iep *iep, int on)
 exit:
 	mutex_unlock(&iep->ptp_clk_mutex);
 
+	/*
+	 * Drain the capture-compare work only after dropping ptp_clk_mutex.
+	 * icss_iep_cap_cmp_work() acquires ptp_clk_mutex itself, so calling
+	 * cancel_work_sync() while the mutex is held deadlocks when a handler
+	 * instance is already running and waiting for that same mutex.
+	 */
+	if (drain_work)
+		cancel_work_sync(&iep->work);
+
 	return ret;
 }
 
-- 
2.43.0

