Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 765CC36A341
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 06:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788848262; cv=none; b=B/DkcSlxqK9iyYf4/fPg0nt5U10GxN1n7yBM6D4+AAPMa0axsZhwB0oIngXJlMIqlYVwJSNgzmuy+3c4J3NsHs8URPdTqW3NrBcTH81NsW1xGPC2EyFacEF2xCkRnfNfhH1q7wSK7L6dBkb1x5RvAcTDQJCH8HlAefFQZurNw9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788848262; c=relaxed/simple;
	bh=SHa7MhiH4KffXnv8vcKF3Xh1XMKP8VpWfvBOySk+YGM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TNamAjRa7JHL6bl3xJ7eiZ1CSI1Jr2lSjonsWM8aXH0W/zXhj25YHHOdL93I97RNg+wGnNdyU1ECkodsB5j2WcpmxJhb1DZ5U5+oox6TAXSYzZ8xbmeOLSKOaR9SJSDWrmVPg6Ur4wLhDy6Nj352c4/BQ+3ydvp+8sBIrhNBmN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=jcsuRr61; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=jDuConuS; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="jcsuRr61";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="jDuConuS"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh_=28Schneider_Electric=29?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788848259;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mmUPyPwhOCilctbfm0dnkCpPOce7cqhzRfMvgs++v/o=;
	b=jcsuRr61YPGySVkCACwzoruusomM1JoIDitDtb6GBGvqztwJltD7NuZjm6vvFB9Op1ezea
	T6SUFm1x5E+tBHgQAlTdJyf5PlztyI5NFckWglS4iwsIX5zwwlfz/TREA5zYT2gt6CCIce
	IpSMWsqKgXKtKtyrUDar6g+Z6onG9BU8J3Nzu9Yq0OC58M3kfQ7BJmWEt8vmLA3vuAJm8r
	vEfZdnpEj2sHr2lfkFLAw46qVAX0wx+79o25IQGT2DNiXhxZAf/WCfZYdqyE7HElMCOYGs
	W5jecv+5pNDGrZvFnjWFKk2/98KrJGxBWG0VxYl5kCEMJSiLTAqh1zr7Ymh4Cw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788848259;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mmUPyPwhOCilctbfm0dnkCpPOce7cqhzRfMvgs++v/o=;
	b=jDuConuSIlhk6XzH/A6CREdqJlx0rjRQiC6FO9QFom3ybb5uGx4gGRJqhUc3e9+7sCxZ0C
	eiImUgtDq13FZ8AQ==
Date: Tue, 08 Sep 2026 08:17:32 +0200
Subject: [PATCH v2 2/4] timekeeping: Use timekeeper_is_core_tk() in
 timekeeping_update_on_shadow()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260908-timekeeping-conditionals-v2-2-5ebc3e7e1da0@linutronix.de>
References: <20260908-timekeeping-conditionals-v2-0-5ebc3e7e1da0@linutronix.de>
In-Reply-To: <20260908-timekeeping-conditionals-v2-0-5ebc3e7e1da0@linutronix.de>
To: John Stultz <jstultz@google.com>, Thomas Gleixner <tglx@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Miroslav Lichvar <mlichvar@redhat.com>
Cc: linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh_=28Schneider_Electric=29?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788848252; l=929;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=SHa7MhiH4KffXnv8vcKF3Xh1XMKP8VpWfvBOySk+YGM=;
 b=jgO0D6Hv3YUM74ZyPp/TuiU4cgIOHkuFjzH6lLJ06K6Y7+odZ085fEZMXIjhjGqlPdKeh0WfK
 1+fw9jt6XvuCudV62+g6LzuZzxNaLnIKh44df9382nLV/zRmSjFfd6C
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

If CONFIG_POSIX_AUX_CLOCKS is disabled, the timekeeper is known to be
the core timekeeper.

Use the helper to avoid the conditional at runtime in this case.

Signed-off-by: Thomas Weißschuh (Schneider Electric) <thomas.weissschuh@linutronix.de>
---
 kernel/time/timekeeping.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/time/timekeeping.c b/kernel/time/timekeeping.c
index 2249d7fb3cb6..12bd61e9b5de 100644
--- a/kernel/time/timekeeping.c
+++ b/kernel/time/timekeeping.c
@@ -842,7 +842,7 @@ static void timekeeping_update_from_shadow(struct tk_data *tkd, unsigned int act
 	tk_update_ktime_data(tk);
 	tk->tkr_mono.base_real = tk->tkr_mono.base + tk->offs_real;
 
-	if (tk->id == TIMEKEEPER_CORE) {
+	if (timekeeper_is_core_tk(tk)) {
 		tk_update_ns_to_cyc(tk, &tkd->timekeeper);
 		update_vsyscall(tk);
 		update_pvclock_gtod(tk, action & TK_CLOCK_WAS_SET);

-- 
2.55.0

