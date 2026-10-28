Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.243
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793205376;
	b=YNzDZbBiPpdrpBuQbKnx3BC8PmWAqfmdR/XL1iAzY/q1uFyqg9Dx6RxkxhliWhWxLRzZ
	 mwQ1wckZxwPf1ffjoHIvqXwKp5i2q6KcnUWU7G9VeAuQsD+53TIDymXMMsCJQmpvqylHU
	 AjtsclpEi/tvcnVLmbj7GP6LvluYnJJDa/VPEwDJ/8pdSOG1+zSecqjkNOjUFKlLkO+jd
	 zDLocncdnDVnW45NoOBotVutyxiqLbBWtY7x/HCs7ihQXV923iezPAjXbH2qj63ZdAwQp
	 RSbePBkBbHAdKJujBR4w2paTlrVeo/8vnWTMtOVae53Kx6JmI/PW/WAMTGjPi9JdPsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793205376;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=j18R/u9AFwxow4H4xAXgdYr2II53/V49eYYOKd0B+TM=;
	b=jQNDBR50UlvYl18KySxvpAthBwH925Zczl98TdpAFjBh8Vpv6/49fPuapDlUMqlP8YYr
	 XyQTwuIjTvloAMAj3/ZEvRzC2VMn0hOfYCDklqHuzzJlOpBwhn/Ab690PjnTn4OWcvimG
	 40QBHOsSFctLaI2nR78llXlsjmTg0RnB+AR5sADpeZ6/2KT078+qcw0VYJl7Cip+zliqc
	 1vvPUY1dYvkrwXBSC9tAliPxFt/KHJXZWBgerNvAv/hX99JhdNfPVeTReQJ0/QKMktyBv
	 bH5M83K0J1lMEDlkGVjUpvitR4UlEcxiRWyOsTmwn/ih463nlkAqnNy0sXHVUO8AGUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=o7gqYsmt;
	arc=none smtp.remote-ip=95.215.58.243
Received: from mta1.migadu.com (out-243.mta1.migadu.com [95.215.58.243])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 801F6606A325
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 16:36:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 801F6606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=o7gqYsmt
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Jkj1eD+MmhP3VhWyT7x0V+pjjQ5A/qULoxmR4y16hyU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793205373; v=1; x=1793810173;
 b=o7gqYsmtdEyGglZ3DvThu8BiWr9fZtcCrBqte9bFtrxhRiU74BpQJb7c8+3FGKLIrlrAXRfw
 uggBvhLMDtifhYHpTDcHFUuT+8qo2r2hLgxb5cqnLiGmjGUMCH/0iBhlU6d+hq+Xu9wQsyb962l
 S08mQQc7dx96T/UnWX1GxIVs=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 0a69350423016007;
	Wed, 28 Oct 2026 16:36:13 +0000
X-Mizu-Trace-ID: 0a69350423016007
X-Migadu-Flow: FLOW_OUT
From: wen.yang@linux.dev
To: Joel Granados <joel.granados@kernel.org>
Cc: Wen Yang <wen.yang@linux.dev>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 06/39] sysctl: convert core table bounds to numeric values
Date: Thu, 29 Oct 2026 00:34:45 +0800
Message-Id: <667add68291d43432ff3bc7323d265ee74f3b7ee.1793204511.git.wen.yang@linux.dev>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1793204511.git.wen.yang@linux.dev>
References: <cover.1793204511.git.wen.yang@linux.dev>
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

From: Wen Yang <wen.yang@linux.dev>

Use numeric bounds for the write-mode table and static-key handler.

Suggested-by: Joel Granados <joel.granados@kernel.org>
Signed-off-by: Wen Yang <wen.yang@linux.dev>
---
 kernel/sysctl.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/kernel/sysctl.c b/kernel/sysctl.c
index 7d0bcd2b24ef..ab25c75cb3ac 100644
--- a/kernel/sysctl.c
+++ b/kernel/sysctl.c
@@ -1348,8 +1348,8 @@ int proc_do_static_key(const struct ctl_table *table, int dir,
 		.data   = &val,
 		.maxlen = sizeof(val),
 		.mode   = table->mode,
-		.extra1 = SYSCTL_ZERO,
-		.extra2 = SYSCTL_ONE,
+		.min    = 0,
+		.max    = 1,
 	};
 
 	if (SYSCTL_USER_TO_KERN(dir) && !capable(CAP_SYS_ADMIN))
@@ -1375,8 +1375,8 @@ static const struct ctl_table sysctl_subsys_table[] = {
 		.maxlen		= sizeof(int),
 		.mode		= 0644,
 		.proc_handler	= proc_dointvec_minmax,
-		.extra1		= SYSCTL_NEG_ONE,
-		.extra2		= SYSCTL_ONE,
+		.min		= -1,
+		.max		= 1,
 	},
 	{
 		.procname	= "ngroups_max",
-- 
2.25.1

