Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793618902;
	b=dqi1NZj2zK6BfjaAXmr1kjUpCVzHx+cZvlneMefxukO3Y1lWX2jyIA4l19aA6vyxEWFG
	 onkqabfGAEDMkD6YBuRtAqPmQHnXrm3aEsq88kFz50SHohRbg8LM1a4mo3oxMTGcImxNX
	 sRaMWdRnUvD1qeP6C8/buyQEfaNE2cTOalVe/CSo9akidpSmPmlNMYm1At2/TFJ4yPsLV
	 FMcaICWmx+NLowKQaq4O+puCYEAX79O66/pw6V1NrcLcyBZCbFUuDUJzvQ0LQL+PfZMZn
	 ElqVFDBcV4Y8W9u1ygnODzFWb9Og5bf+9OVjLNtvQ5yDIV3GGZGliOBUeTWLI0j3w/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793618902;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=9IaU7E11XexPelfZtk6vTetrl6Nh5YFdFoxHGj01jR8=;
	b=EetCDVMjhO5W/Jbcewj7yNSbyQIocS5cD8CusLSNWEQv01a4zhnaUOgZ5FyeB/Q9Sjlp
	 hh4zLWKP5RNGYtqPbY0sS6ommsbRzXhweUy5aSx2LwoGxws/O95PAVB5tTgiVKDJ6Lfk2
	 h3QmyAGwpwhbx929eePA699GDeTDNuYh8tA6qncuowq78XTGfhj7il/pTfNuXovzi5dp/
	 3teeLOBVTCzLRrfLAYJchLENnPKbnXA7mbMnG8Kak8vp1tXiUJkLS8U2m+kuT1vY+9loF
	 fS3A4lbuXoBS88ryVWc7DLYruOflcnC/yfmH72azIdbtKHdkMLTpXMhTFanXEuhfJgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bZCgOQEb;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD8B606A335
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 11:28:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FD8B606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bZCgOQEb
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49d05d51553so17962655e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 03:28:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793618900; x=1794223700; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9IaU7E11XexPelfZtk6vTetrl6Nh5YFdFoxHGj01jR8=;
        b=bZCgOQEbKdTB7Mq/1mVJibyJv5VYt9bsdDpVaATR/g9NEFzYmp6J+g+vXxRB2THxvY
         OV8kGKwlV657qRQoy+L0rNZkxusWf7KnJXSYkyhfxGbbwVMxlQY+YKV2xbDlsqG8RVPk
         Y8RZ6eMRexd5EjciyWP5zLOp+DMEHjOYEwm9FqqaaIhuUX2wKAhzvrSn2XgE1Dz9d8k/
         5PXeLOinAczQPPoOz1zRUVAwai4yCFQWAuVngTFw6tPIUhfmmQUTMgTTRfnrrqcBqHXN
         g3lUYrlWO7jk6qPZs+cIpAsTpKZ7O1O7ohhEqjJTvbPh91iQ1OS8unewUErqpyIw3ro5
         0FLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793618900; x=1794223700;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9IaU7E11XexPelfZtk6vTetrl6Nh5YFdFoxHGj01jR8=;
        b=10p9Tb81KabCjb4YO9CNl9i4SuyhqHroXOfpxMhjqsHR3gSOx0idgbUhlq7CtI4FB4
         lPrsGgR+uA3nZZw48vKO6nmBSuMPrgO06+05ldG0d/lPXCfPQ9ttsZQusbJrDXmKYS09
         0e7Kd6jSPFKLHa4MhLPmy+n/SIva7v3z0KEsiRNvMUVJdH4T/U9nl7zFcpMbkXruG7HE
         MhhB7QWhRPb4JCUEY98RD3Sud1TDCGBOl5HHsCeqKVpaOlWcw1ByXubt4byEOX+O4w6/
         6dZVwVO6jft5uWNcKMxnQWj5qNBu7thc7me/sfzydMgG4MtSHZx+b0uMdsmuVirs9tRf
         /lYQ==
X-Forwarded-Encrypted: i=1; AKwUvByykN80n2isTO3U45ZwtRlBRRXMz/QNs8FeW7zfkc6fpc+aoAGkC/NUB3xOZbhXqP8NfoCEg+Kw2shZ7zM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKYqpk/ctKiAdCaAevCx9UI2pq1ENsOHYhKp5CNwFtrYXr4Ko0V
	y0+o1Xysa6wMvaZv9c3ljwUVgELx6Aokiiks/s9gLGcjA0RivlRDQ6NG
X-Gm-Gg: AYBFou2ytsl7JF+mAzj5ffsxzhwl2HgUTF/rvzg/ll8bhENQfUqX2Boh/aHEYSVnJhy
	GVkgLQvsUhOjm84TnEAvAkypXMar6VzsBFss3kwQXHtU9EUBJ5TDTsfuehqt3DEzPYNoN2z+gQG
	FqUN3MraZOe4K8KqXatHOzcxRe67Eq7Rk8CYJQZKi3FdOqu0SiEY/dLR/mje37GsQCw5l6gvXrC
	xL97IwePts1FclBMc++GqulavqysG0VmJME4V0NEBTD4EBiELhhweg92CcthThRO4o6r5jZFZwa
	YBHNTvW4dRpH+uSKsYVQpeKhvNqcJBwVsBE2RfWdIim8yV8gGycB8yuaBRcdWBD2yB1JW47enVp
	8xCZ89NXjwd3IdJXm/B4vRgLv/n4wfxuIDXRB44y7BVumJ9WoUytHJLRbNFQWnj/3stZTwo5o36
	iQCmNwjQYu1SfdtM8IiK6B2o2upcBCYhrmM6gRdLmEwD5Ht820ePPG0seJoowLxi1EX3aQ0rPgH
	nIsrxGUAH+wj7RmPXp5wYpsjO9I5OsP8uBCzACpTWTkYM/qxO3osttP4w0MxRSAsCMyNrXtYXkq
	7bEvaIzcM3orDSGoKyw+lmqSieazooijQC9pO1VX3Kmxxagh4nF70OcR5MLkYp4iTCIR26Tom5C
	rXj0DsDwu24WkyU7LyzR4kH6TELvD90DqobLwiCMD1g7LzXbsNJl/ZZOUmH+JyuAdOMV4TryLPH
	VhT37XLnPE+QINEWiiHdlHyJ36LNost0VcBXBWb2mshHvHdWVNtQPOkGhEHmvHtbS6DYuoMt5Jo
	kI=
X-Received: by 2002:a05:600c:8b04:b0:4a1:fb01:13 with SMTP id 5b1f17b1804b1-4ac17a3683bmr230033685e9.18.1793618900268;
        Mon, 02 Nov 2026 03:28:20 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a00-1028-8388-a84e-f91d-46ab-c9c7-94fc.ipv6.o2.cz. [2a00:1028:8388:a84e:f91d:46ab:c9c7:94fc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ab61d8b9f4sm311382215e9.12.2026.11.02.03.28.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 02 Nov 2026 03:28:19 -0800 (PST)
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
Subject: [PATCH net 0/3] net: mvneta: fix the TX queue arbitration and the mqprio teardown
Date: Mon,  2 Nov 2026 12:28:13 +0100
Message-ID: <20261102112816.12322-1-pepe.schlehofer@gmail.com>
X-Mailer: git-send-email 2.54.0
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

The NETA TX arbiter is left at its reset default, which serves the TX
queues in fixed priority. Under load a busy queue starves the others.
OpenWrt has worked around this since 2017 by sending all TX traffic
of its 32-bit boards through queue 0 [1].

Patch 3 serves the queues in weighted round robin. While testing it
with the mqprio offload, two older bugs showed up. Deleting the qdisc
never reaches the driver, and turning the shaper off leaves the
per-queue rate limits in place. Patches 1 and 2 fix them.

The series was tested on a Turris Omnia (Armada 385). The other NETA
variants were not tested, but the driver already programs registers of
the same block (MVNETA_TX_MTU and the token sizes) on all of them.

Replacing an offloaded mqprio qdisc under a new handle still loses the
new configuration, because the old qdisc is torn down after the new
one is set up. Software mqprio behaves the same way, so this series
leaves it alone.

[1] https://github.com/openwrt/openwrt/blob/a5e96c837ead549820867bb83c1ad471e39f5ace/target/linux/mvebu/patches-6.18/700-mvneta-tx-queue-workaround.patch

Josef Schlehofer (3):
  net: mvneta: lift the per-queue TX rate limits
  net: mvneta: fix the removal of the mqprio offload
  net: mvneta: serve the TX queues in weighted round robin

 drivers/net/ethernet/marvell/mvneta.c | 36 ++++++++++++++++++++++++---
 1 file changed, 33 insertions(+), 3 deletions(-)


base-commit: cb284914e749388eef402938bdb3115fe1f6d337
-- 
2.54.0 (Apple Git-157)

