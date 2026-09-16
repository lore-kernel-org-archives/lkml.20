Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 958754E80D8
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789555685; cv=none; b=Jr5gC1Wdca0EZqVhewD2n+mBUEEmdYVC6aVM1VqKEyVuq6sf7YZJH3qCSz54CqgiHI4ChRb4FjHNyAp6E4z0cyEvufEZTyGqFZhufz8FMzMN7qOFK4mhbjf8h9Ct46et5dRfeBYmiewf/+CDF/up92szEsLGKIbJJozFDUFGXNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789555685; c=relaxed/simple;
	bh=gORq06kFiaKSuUrx2+KGXHaIgNprnR1kIbi63V6GOBg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KkF2laB1+nRnrbSfKHIIHUqdGBdPBDJp3Ig8y8hx3dGV4dHCfB6ORFoubH7wVw/YB61w4fLNKjJgEFdz6UnXCeu4aInH/d5fZ/+5ouB+8lTg6YhTp0Lp1aPZqSMDCI2lch6sQKNbIJa2NRgcpqFyYC107k7eDMs/RaLLcB9fdfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KirY8mi7; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KirY8mi7"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482e1b55da9so82840f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 03:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789555658; x=1790160458; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=76GMWQIvKjlJe1CdRTk0Pogc11DUdKxGhexn5fkeDUo=;
        b=KirY8mi7gzJednMl68NK+QxUO/gQvCwByhbVaJEZHqalnwTGpp+3KDne9CgQ+Z569I
         UtFIc4PQ4li6PzNkoSo4Yk0gZVK0Gs1DID1r8WFgb/4xH/hv4FAQP2WNcUnyalAAx7dd
         7G93pyXbrLNYy8QafyGqEeuDRcLzB7w0yi0HdBnCaLsQ0MVgBxpTXvRcaktPvq/bH4EB
         ulNUbXtGwtvNrdwYG7WWoVA9EdTGwITDu9eMS/ibbsLZy+olop4svJrzhhKUJ3M+jPnE
         kjuDonIy5pW4AOCsah3u+eCnWYtfXt4yk+LH4Hy84wXBUG23Gp9jTGZXBtW3C8+QR98F
         61Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789555658; x=1790160458;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=76GMWQIvKjlJe1CdRTk0Pogc11DUdKxGhexn5fkeDUo=;
        b=zdnEjg19m6vMWdKTHTNqBIP0EO6xEjr4g3xPeW45iOLQSsJ0iiws5xjIsZ1CRtaIA7
         hmNwRN2mQuQg/mQYEkaLsVIfrFshC9ieWqEom9rvjBcnBZkAimrQeAnQ1wWQtaNMPQjh
         cYMcbMz1b5gqVlQEb7uo7nDSZawydp3bVhyFqyYpFwaLVZvyj4gnrDHxk5NKD+5907DK
         OkZDgcfGKCDRapUGhblDWCr1F8wDmibSxLqBkZ3FTRuR72DlZQhePEL5T0TFiO2ZZE51
         Pvvbm+l49zstABqScIOq3WB3HMrHOaScTLZHnH93uFnbD/zDbdlefmFFRE7U6MCYWgdB
         /RdQ==
X-Forwarded-Encrypted: i=1; AKwUvBz3KIcrckRH/MkaQqQuXtZYSlDvw36LPn4IPmjwMx5zKbRyJtVr4VstsfFRKxTjgpYnAmJjCBXpstTISLo=@vger.kernel.org
X-Gm-Message-State: AFuF++nDOkoiAalcE5m/+wMHLJHxUn5+Mf/jc9UJZsvEWrC9z6vvuV1R
	MB8Z/uicXuEmSZIh1TeLGM6vkV62kSsFyz/BM0V+a0IDEZliBSvPLgUi
X-Gm-Gg: AYBFou14VEpw0M12cI9cT926yGhQb4fSa16rbaVCmoC484rbEf1skZB+bRauxF41td7
	D3zSxShR0w9jB3JfnnaNPrax4ITEyPv2sYSO/2YqhAgJpI5gCLAA8KAhlQECgfqJ5omQekOZ6Ad
	zTHLG7pxQkadQVkj3Z6y78XUPgK/aiZfxFYRkNc/4dnS7pGTG+yWSQIy6SGMPG+hpNfJikIQnya
	7S+Z+8xqzjUwcXaX/ufp1K2T0qouZPJ3o3QsvTixDJmcj0dPrf51jznW5120xA1v3doXvDL49I/
	fToQmrx0qMfTPTqZnvbs1pfX39qZbTg92GEg4CdO39y7ErbLNCEsV4GQT/Uwjgg75efxCNyxZtZ
	Y6qoFCpWsJaFxWX1sQj48r2y7MqNDBFGTuUYCJ28Z0h9Mfq0NCkVpJYq9JicK0kIRFoDsxD9i6u
	cUPJGbr3OaLATlTmt1G+FvpB91v+FrANo2ISAVp91A5GsGI6cj053c+XzQa1V3n0LJdgGLNS+ah
	VcyIllFDgtvqW5Vtx5CpsA5PmpHxTjHzcufc3g/0bfYaJs4Kkqpp19TJC7nyBitd0Wwv6+7Vsba
	BfR4IMBbfgZ/ZgZ4zWqvSVIE
X-Received: by 2002:a05:6000:460c:b0:487:aff:995e with SMTP id ffacd0b85a97d-4870d26fedamr2236660f8f.3.1789555657656;
        Wed, 16 Sep 2026 03:47:37 -0700 (PDT)
Received: from pop-os.. (98.102.222.87.dynamic.jazztel.es. [87.222.102.98])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf34440sm6117407f8f.25.2026.09.16.03.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 03:47:37 -0700 (PDT)
From: Miguel Garcia <miguelgarciaroman8@gmail.com>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+44efda9647c52be29d9c@syzkaller.appspotmail.com,
	=?UTF-8?q?Miguel=20Garc=C3=ADa=20Rom=C3=A1n?= <miguelgarciaroman8@gmail.com>
Subject: [PATCH net v2] llc: stop connection timers before dropping sap ref on release
Date: Wed, 16 Sep 2026 12:47:35 +0200
Message-ID: <20260916104735.3565609-1-miguelgarciaroman8@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260916074158.3375909-1-miguelgarciaroman8@gmail.com>
References: <20260916074158.3375909-1-miguelgarciaroman8@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Miguel García Román <miguelgarciaroman8@gmail.com>

syzbot reported a KASAN slab-use-after-free in
llc_conn_ac_send_sabme_cmd_p_set_x() when a connection timer fires
after the associated llc_sap has already been freed via RCU.

llc_ui_release() currently does:

  llc_sap_hold(sap);
  llc_sap_remove_socket(...);   /* may drop last socket's sap ref */
  release_sock(sk);
  llc_sap_put(sap);             /* last ref -> llc_sap_close -> kfree_rcu */
  ...
  llc_sk_free(sk);              /* timer_delete_sync() only here */

Connection timers (ack / P / REJ / busy) are embedded in llc_sock and
their callbacks run llc_process_tmr_ev() -> state machine actions that
dereference llc->sap (e.g. sap->laddr.lsap). Those timers are only
synchronously cancelled in llc_sk_free(), which runs *after* the sap
reference is dropped. If this was the last socket on the sap, the sap
can be RCU-freed while a timer is still pending or running, and the
softirq timer path UAFs the freed sap.

llc_ui_release() already keeps an extra sap reference across
release_sock() so backlog processing can still use the sap. Extend that
window: after release_sock(), synchronously stop all connection timers
while the sap is still held, then drop the sap reference.
timer_delete_sync() must not run under lock_sock() (timer callbacks take
bh_lock_sock()), so stopping after release_sock() is required.

llc_sk_free() still stops timers again; a second sync delete is
harmless.

Fixes: 9708d2b5b7c6 ("llc: avoid blocking in llc_sap_close()")
Reported-by: syzbot+44efda9647c52be29d9c@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=44efda9647c52be29d9c
Signed-off-by: Miguel García Román <miguelgarciaroman8@gmail.com>
---
v2: Correct Fixes: tag to 9708d2b5b7c6 ("llc: avoid blocking in
    llc_sap_close()"), which introduced kfree_rcu() for sap teardown
    and opened the timer vs RCU-free race. v1 used f7e43672683b.
    No code change.

 net/llc/af_llc.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/net/llc/af_llc.c b/net/llc/af_llc.c
index b0447c33dbf0..4fc397fad4d2 100644
--- a/net/llc/af_llc.c
+++ b/net/llc/af_llc.c
@@ -215,6 +215,14 @@ static int llc_ui_release(struct socket *sock)
 		llc_sap_hold(sap);
 		llc_sap_remove_socket(llc->sap, sk);
 		release_sock(sk);
+		/*
+		 * Timers dereference llc->sap.  Cancel them while the sap is
+		 * still held; llc_sk_free() runs after the final sap put and
+		 * would otherwise race with kfree_rcu(sap).  Must run after
+		 * release_sock() to avoid deadlock with bh_lock_sock() in the
+		 * timer callbacks.
+		 */
+		llc_sk_stop_all_timers(sk, true);
 		llc_sap_put(sap);
 	} else {
 		release_sock(sk);
-- 
2.43.0

