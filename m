Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794238763;
	b=33SfHOrcNH0PpOReMSwnoXPrEhGdKnMEf0EZTIJXV3srQZ5Lk2GtkJti6QUYwGqpAQ4l
	 QgTBSoWphCid4p4sd4IzSC4ixmuraKWXtsSUwl83TGL0gG05rRzU8BZb6/ro59FZ44PXh
	 c3+n2LpKta33ppPhgfh2iyFV+hj2yrKretg8TKykSlvXWwsUNuaOOM+QvMJK4sKvJ0Jtf
	 aw2gM1557FfBGrJ5v7EQejd49ZLKQPPQcUocF5uy48jlyena/MJkuizMd36Li9RaizaKM
	 DyjjwFTwZlEK5/haohQ4hqiJ7NWgoj5DEhuXZeAOIlAdWCz3WwJkxANH2PeyzMH6/ZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794238763;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=nL0IF/YmuAg98DBAGyGyZcFLc0hJUD80Dr2gsrocgZo=;
	b=JWA3rPx27/VG1Cqiz73fiS2tBjz1vaIkKVOGTfb7OoeGolGbIBcrDBd2BRlsG0lqkazp
	 M3dAVvJ9AgErNcrElRSzFEumylgrTv48OPYmY5gcqx8E01x3fyd3X3Qkk+b2rcd22/4Ag
	 KRQoM8c/G6pbYw2kca0C05NM5M15ZFejKnhwVKGN3/WNP6tvGWUZFt3qTHQt8c1lwUnHT
	 I0m8qGdRLhhCkwmV6V3oIX0HlwVOfrw2kxPKN5nZzjEp7F3UUJPxmrWAnobnCzOy0u1KD
	 g8KDAw+TiuE9+AJ0/YaPf+SAqZXwRGALbMcugn2xwtqhJzq3jx93W9erTgZHwBNRIDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RdSDdijr;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E87A8606A325
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 15:39:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E87A8606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RdSDdijr
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3b09a83d12aso669003a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 07:39:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794238762; x=1794843562; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nL0IF/YmuAg98DBAGyGyZcFLc0hJUD80Dr2gsrocgZo=;
        b=RdSDdijrqnnbq00rXmYWS2nQclZ6+qsK7Tlab49IqOye5Ua9a4IsOT+wI4KPwGh5Rv
         LHc+JKi4Woj+R3KvYNsAG7U+UshdKFar6LKClaIptGVdojiB95Vt5gZGx78aclcTRavs
         mpBeTMd+Fl5qgRhKdrZ5R4/E18K9RGFJO+UyIHHUyR9WAgX1Exs/r2mS+VCfwt22hqsS
         0H7UWtQ/+zI6w4yd0/V3MBtj+G8M/SRiWOa2hgSfiTdgiVyProfNaiVW7IKvkM01Bs9l
         7L8EG+reC6uZPH+qN46R8C/X1FEkO/CtIpH6QIEKN9UKYKxmfLx10WTlWZxIVexoTrpe
         8gvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794238762; x=1794843562;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nL0IF/YmuAg98DBAGyGyZcFLc0hJUD80Dr2gsrocgZo=;
        b=ruvrruaySKQ91nt7AFqPs15apSDJIgXGNFLHdTwkDPLOB9r9l6g/9VRvbi0MNDiLsA
         SStmICcoEBLKOUSGsZEuUpbKsBUfUJTDiC/52UonmiDVBpabMrmJdyAUGBu9u168Tkck
         3OAR2y6Wt2J9egtMCybiFlTKHosD4mfh2YYjaLu624Bcn/3RzV9h3+AAW68mzLXmRFXO
         3F2Wh0lNZpOeRnAeCXjwe7BL+HriXz4LDG79I/ojoT5/lHsE601zUQOQrF0SOXXBllzu
         cVSVJoVO8fJmdVjyjAS6XEFW0skmezY54HanY8CWdiU1ffhE2GNwFVsEuBt53WclQjW5
         FAOg==
X-Forwarded-Encrypted: i=1; AL+hErEL74Mq+SuOQHZQ8k+uzBACDM1Z7Kqn+jj8/xzevuInOBloN0U2WV4+X9QFvh9bC5oXEJ2mV5JFTdHU3N0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ZVmZpvWwmHrWe0sG9htmFOzRwcIUIXrq4CwDslLj5S1wJd1zo
	Ua65ZWBctvqRtVeevWA1TFD3BZvXnmHpYkhk1mj+h9W9tbbwVAAChcKI
X-Gm-Gg: AYBFou0rOivEcYDuJiFZNZhb5aXfBJuNLBWq/r1htvVoObxxH61qxSOZRmAS/32mUzG
	cBWQhyNnmuOkMXloDJr7Ht/ePna1CmBo8ow1ml5pJwHuZ4ndLWlyKJfezhNNndh7kmgBJD3Vq8U
	t+EtE1D/R11LhT1rm5r/+eWtyIMTwVFXJamESJHWewdRIyopt9C4fke4nq0ptboIaJ7rYAte3FY
	7yyYxg4e3tIdXbX5+/DHif90lsZ9LAwo8k5/HTUwg2MjjVHDdoo9NJZwdqtQG7/CLCZyF2hQaJJ
	Ld/lay8PAhYXuqcBdDCtNkXQXp8uV7TYauD5GULmnVcQGQzYbH/mqdXsta3yhjUT89YMgFNWG/p
	dYYqIj1HPhxMyk2ZKviEbSPJqhq5kefN1zE49LK1Lbcym7DeBCDmtvyRYt5jxSWadapl/Q5Vb8M
	1r/iA9xf4LwI7aWrnPUJP7TFgga7wOoUK0KdVVbuJ5vtJspawr8PXdoPL1nBLYcV1VmWkHD35JK
	ioFbUxC66rX14+fq2R23V5kdAI6RauR6jG7J96EViNOBZLqbUXusHmmJOTRIX4njVFX2fDznPoS
	1kfxpGpeu+o+PZRCY0YKsGWTVG6vxZmNyryNduKoFj/vutOIOV9GzdqElook7LAKehveHqsCe3S
	6YfCrC/vFieSnVB2lvgcpLk5L
X-Received: by 2002:a17:90b:554f:b0:3a8:10e2:ad08 with SMTP id 98e67ed59e1d1-3b12d51f0b3mr4293568a91.48.1794238761542;
        Mon, 09 Nov 2026 07:39:21 -0800 (PST)
Received: from 0.0.4.7.1.0.4.2.ip6.arpa ([2401:7400:c804:b668:b272:9904:c32b:2ee5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1054a53e4sm11062029a91.0.2026.11.09.07.39.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 07:39:21 -0800 (PST)
From: Ho Jie Feng <hjf3108@gmail.com>
To: Ulf Hansson <ulfh@kernel.org>
Cc: Maxim Levitsky <maximlevitsky@gmail.com>,
	Alex Dubov <oakad@yahoo.com>,
	linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ho Jie Feng <hjf3108@gmail.com>,
	Maoyi Xie <maoyixie.tju@gmail.com>,
	Yifei Gao <gyf161023@gmail.com>,
	Hemanth Selam <hemanth.selam@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 5/5] memstick: ms_block: add the missing newline to the parallel switch error
Date: Mon,  9 Nov 2026 23:38:04 +0800
Message-ID: <20261109153832.7377-5-hjf3108@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109153510.7161-1-hjf3108@gmail.com>
References: <20261109153510.7161-1-hjf3108@gmail.com>
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

Allow printk to finalize the record immediately instead of waiting
for the next message with a newline.

Fixes: 0ab30494bc4f ("memstick: add support for legacy memorysticks")
Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
---
 drivers/memstick/core/ms_block.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/memstick/core/ms_block.c b/drivers/memstick/core/ms_block.c
index 66672235a4584..7237a6789e0ca 100644
--- a/drivers/memstick/core/ms_block.c
+++ b/drivers/memstick/core/ms_block.c
@@ -778,7 +778,7 @@ static int msb_switch_to_parallel(struct msb_data *msb)
 
 	error = msb_run_state_machine(msb, h_msb_parallel_switch);
 	if (error) {
-		pr_err("Switch to parallel failed");
+		pr_err("Switch to parallel failed\n");
 		msb->regs.param.system &= ~MEMSTICK_SYS_PAM;
 		msb_reset(msb, true);
 		return -EFAULT;
-- 
2.56.0

