Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794439535;
	b=QFNmrBKJKLZJE4kXR4WG57/AsKZmkFpDC0jfnCOvP3Xf8WoD/daLvNM2miruZ1k4kYZb
	 qgZ6lsQjSAyoClnbxaSeJ7VG5Ey7IYXzPLO68Q9JumZY2oW7hvrhYDzLm3JUHFHEXY1bE
	 PBy1jMO0zD5uZAwuVspOUARWpZ5t8k0M42Dzf94QQwWp0+SJCdfqu1nt2uTP59KBKccwJ
	 mvuAt/WCjFVyI6ib10DqkC7mbkn88bG7FNxZgCzqAKxiSStEPZxaKKBtfnbiCvB4eDgHm
	 cJdZ87l4zzMXN2q7zswxKF3h7mKTU/Yai8XhXNih9wK6rvpJHOFZrbiwlovUm7lCjzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794439535;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zeKs1Z2Pv2GV4AuEhN0bB0lWtBNEb9bqfYfvbaF4KSw=;
	b=avKlfqIGbtZ4zTSdw9JPfR5g5ehSH3JtTx+mEokrLpS79NHP6ghtp3EfWVAW0mWClOPE
	 p90xMxkOraEiheJoyYbTjVUcppBjYHrazxuFuXJ4aZk0V8wJhBCCBZmuNXznr89J2LJYQ
	 M+f0aaXMz7p8oHxq4MrJd1Q8kCql5siK8mirqQarlfscWe0sRBXM6BJwt+rWWeer1sjLN
	 nmCNMKYMkmkLmFubpysZAJpseNEyPjEHkjIcu9dyrSV5Di54UE0dRmdfgobbDdTAF3qFi
	 Q0wKZUyLZa73Ku9N/Y1yTpgAs1tWO48f/P3IHxJryFUdcrvWQGb/L3Ny46ncURTKpeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g6rDl+61;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46090606A331
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 23:25:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46090606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g6rDl+61
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3704d30b84fso4661591eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 15:25:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794439534; x=1795044334; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zeKs1Z2Pv2GV4AuEhN0bB0lWtBNEb9bqfYfvbaF4KSw=;
        b=g6rDl+61FuluwKbbZS7ohA76XPgzqchxtcwXJ3U+HFc1OENnRWxdAn32yXJDPMx/cY
         DLNbHcnYk7OaVfliE4zcBYnk8GZU2ryb6+ds6fRQj/xAAKwuXtzaaUbuW75CI+ylIu53
         Cm2yDRQuLlSfQRZhT+f7PCsmuVlqddZL+JrgUEBE/KrmsTiz/a6lG3PvoAjkyk7SRhXu
         gmhjdIl6uWGSxPwxh+kvHetunL2HG0oMdNCrAnakOR7loWLSPrTBcjJ/6czzZ27YeLdp
         dci6wLyO5Re90EgmB7ZVzkSPuwgJxgDhzx5Y3S9VjOeb1TTRlj7pUgu9h32zyR+ejNO6
         wVcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794439534; x=1795044334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zeKs1Z2Pv2GV4AuEhN0bB0lWtBNEb9bqfYfvbaF4KSw=;
        b=hnePNfzmSqei64tEBiOx5f49R4p0G05AkAfUZ6SC6JuZ79IQrp50erXIAjSypgJT3g
         NKSAawP0epvK3R6DBlBzz7cVdNYhnCpqmTG3MtO7b3oSyAQxDdpp5gcwNknI1N3LTF9T
         ZeWPa3W6ZuBnmbA6FjUG7NPI74MNEl1TC7C2tJGQcQsgcI3bYeFMhn9XMMlBihfsB/+M
         XS0ffdrecjJB7FhznfvbDBA1ZLcnRV66GOVef4xg4q4HOKowDX8Z/KI62w70Yh9LXbHc
         XvbzxBtTrJxYhlXlbCtYpaXlKa7FqNRqLEGHiDk2p7M1AIQjoNQ6DIL9gB6lTwlZji/3
         Yptg==
X-Forwarded-Encrypted: i=1; AL+hErH+6zAN6UFIK+0+qp/NJ9g3lP6YIl6QXJ/+ICLFEYlsTXM6nKRi4M+G5VOCCCAotO4UOMHlkjLtnAj+Hlc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Niw/SvAhBnm9kJ0tOtmQShzpKKeKzLYHZtptiJ2ANgPG56xRu
	N7yTzDkJzg3alMRgMlykJJrDzGD2Uw72NOIVUcydLCA3zJe62mlFToFi
X-Gm-Gg: AYBFou0zulBSNUrD+SjiT1bneJ/fwm6NjEUGTYShHk9rWIT5AGLc0QXWnolgVvoA58S
	Fj5bNOU2E3yp+Bbwff0m4krpr+ff7eO4KPGkRmkWk5JzEv1nWRkLhOcgmraaeMDNj3aB3xs+yCN
	W7j0DE63nzZ6DYP4af2myOknqyiWYMyjzXHAeSLTxKeDpKIt91fnJfrBulO2Z3iYqYf3OVmFsNy
	Ls9MGhs4cJil15phzThN+c0EeBpM2ykgjv1ecXehXZx4v4LvcfZ1gmAc1rYMBf8YtvzepiBI308
	errrpn7rvCD9c54dg2xE7KudF+0HQJI10z7GWTf1U8b0qsqaflWLFlBlBgwJBSBmFKJVOxJox9A
	drGxUf70Gkt3ibYWB2r7Tzmwjy0YslXzf+ly8Gl0XiZT49cEY1uCmH6aXx23KbBE5Ehi2WmE05/
	8VV+CTbbKvMfed89RUaumhO0e9YJgQk2cH0OQaLSaVJbtKYNerZ9vozdWiotxUNj0NjZ89amUNa
	KIpGFM0soytRhCXq+tAgCmQXf6KgM4aGkA2FssV1Ypltpj6C+ytVePrvNKEwoh7vvBa0AxOSSeC
	xBuBRz3B9TJtCji8PIzriIwdbRxc6YrDvtCMTO8LPeQ=
X-Received: by 2002:a05:7301:d807:b0:378:2e89:3958 with SMTP id 5a478bee46e88-3782e893b15mr219848eec.19.1794439534310;
        Wed, 11 Nov 2026 15:25:34 -0800 (PST)
Received: from Alienware-m16.lan ([79.127.217.36])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375212ec002sm22626946eec.26.2026.11.11.15.25.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 15:25:33 -0800 (PST)
From: Andrew Luebke <andrew.luebke@gmail.com>
To: Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>
Cc: Aristeu Rozanski <aris@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andrew Luebke <andrew.luebke@gmail.com>
Subject: [PATCH 1/2] i5000_edac: fix slot number passed to determine_mtr()
Date: Wed, 11 Nov 2026 15:25:28 -0800
Message-ID: <20261111232529.407154-2-andrew.luebke@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261111232529.407154-1-andrew.luebke@gmail.com>
References: <20261111232529.407154-1-andrew.luebke@gmail.com>
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

From: Aristeu Rozanski <aris@redhat.com>

When the logic mapping branch/slot/channel was reworked back in
64e1fdaf55d6 ("i5000_edac: Fix the logic that retrieves memory information")
i5000_init_csrows() was not updated and kept passing twice the number
of slots to determine_mtr(), which leads to acessing past the end of
i5000_pvt.b1_mtr[]. This was found by KASAN.

Fixes: 64e1fdaf55d6 ("i5000_edac: Fix the logic that retrieves memory information")
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Borislav Petkov <bp@suse.de>
Signed-off-by: Aristeu Rozanski <aris@redhat.com>
Link: https://lore.kernel.org/all/20220921181009.oxytvicy6sry6it7@redhat.com/
Cc: stable@vger.kernel.org
Tested-by: Andrew Luebke <andrew.luebke@gmail.com>
Signed-off-by: Andrew Luebke <andrew.luebke@gmail.com>
---
 drivers/edac/i5000_edac.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/edac/i5000_edac.c b/drivers/edac/i5000_edac.c
index c0faf55f7812..342b69909600 100644
--- a/drivers/edac/i5000_edac.c
+++ b/drivers/edac/i5000_edac.c
@@ -1253,14 +1253,12 @@ static int i5000_init_csrows(struct mem_ctl_info *mci)
 	struct i5000_pvt *pvt;
 	struct dimm_info *dimm;
 	int empty;
-	int max_csrows;
 	int mtr;
 	int csrow_megs;
 	int channel;
 	int slot;
 
 	pvt = mci->pvt_info;
-	max_csrows = pvt->maxdimmperch * 2;
 
 	empty = 1;		/* Assume NO memory */
 
@@ -1271,7 +1269,7 @@ static int i5000_init_csrows(struct mem_ctl_info *mci)
 	 * to map the dimms. A good cleanup would be to remove this array,
 	 * and do a loop here with branch, channel, slot
 	 */
-	for (slot = 0; slot < max_csrows; slot++) {
+	for (slot = 0; slot < pvt->maxdimmperch; slot++) {
 		for (channel = 0; channel < pvt->maxch; channel++) {
 
 			mtr = determine_mtr(pvt, slot, channel);
-- 
2.47.3

