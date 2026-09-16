Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00BA54457DF
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 07:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789544540; cv=none; b=QB4gE7aWqtgERTX5+YSHw8GZuEWT0h8QeXC+kkNfjhd93gohLGZ4G2n+MwJhEfpeyZpqzOhP/4rV2QjOwjcmUMTUofooEdtjf8sLS4fU+H5FQvlBkDJ++dWFuB6Rfxo71/WtVniFtfsrgcello3r2gM94vWc1m6AOo7KOGt6iHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789544540; c=relaxed/simple;
	bh=SDIDKPg/XJMTZDlOvDmfh7gZvs1x/8ehV8Jyie8JsEE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=oh2ia+9KdE/PeoPVgdTnD93oEqa1dZNKVJX2Z2ywaGAAf/llbKJ6NN99GOMI4k/Z59cvxO9ICsRTVSIIHZgngHGJ8kCPTRAx1futzORExdA1SSoBfsrnCA82ZE/qw/PwPRKu5lTESw5SxllMeHjfE5UjEiFOaKHUkSxw73tPfG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mlTJroID; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mlTJroID"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49d1ddd5d0aso468515e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 00:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789544521; x=1790149321; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6GWQnH0rufvFzfswnGUXgjHTCIj9a7PTjKQcqx1m/30=;
        b=mlTJroIDRJ2YBcJca0H2URZCjI8ADE6sKm6rQzXRd3cvq2+uw5qBXxjbKszgK0mpUk
         zW9A1rbglJ7TmPsrOXdfrfBCDRC2gd70e43CI+a1eFBdcnra2l8HaQWe7VNIbxiE7fxj
         LKtqhUEWjrXNHkRhGECcXyHWOZuesHZvhGZcuv5X83fgIFJGqDC7CKCAmRI1eCVGS7Wn
         aiDnqkdNCthn5xY0lDchvrznBtlS5EQ4+H4MY4awxjPp8fsaXFhxGpvXx83FASJg0Xuu
         4DgL2NXM6F+vonpUdsIAnTNScKGEvsLXsrgO+vIvqAjjVDwvyJ9OLa4zdEDfA8g1OlSs
         /kFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789544521; x=1790149321;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6GWQnH0rufvFzfswnGUXgjHTCIj9a7PTjKQcqx1m/30=;
        b=j2vWL19j+jFtIkBogmtYSloL/652Xrins2H4A91nSrYaY99WcgzFSKOzkjU6iILbao
         T2GDL1OB2o1Bk4YytIWUh5Jexjys/OGDPfLUdkGLn3T9Y6sSqDq0lRhC1LZ0sN/v3gAR
         V3vFSNfom4SytQsacFnJ+1KMl0buiz1Z6U/XNOXlHsMtJl9d7+xclGx1lelMimbl25X3
         FwjMylBJWaccj75/PZbtrRydJ6Kg0d7DP4cgMd5OtIC2Z3rMsk1pKtKc8zYGBBI7Wm0N
         u4ybmIShiD1gymgoLIOycXvM7HiFK6rNVS4jbwZUxVA4WzKWQF5gMzhGqi5v+SeDNJbp
         VUAA==
X-Forwarded-Encrypted: i=1; AKwUvByDx+lQzSkdYSoA4wHtRuaCJ3ON4rOFlGggy6mjHGjd3guD7yLRGqLeq56erONixhf4B5kdRHeCEUWf5z0=@vger.kernel.org
X-Gm-Message-State: AFuF++lTMCXVohfJPOPGZl3GT2jjLzXA9JoDVphEs2xzOHFmV67SWnPN
	ZiYTmndXdj/mAFLA8A1Ex2X8Vo2gWnop18zSvsPsINt5yqEKniNlx/+F
X-Gm-Gg: AYBFou2PlyaHKGeym083m0hpzlrCNPqF9NUsY3hDjfplpEOKoe39Q9Eh2legYslaeGN
	/7s2j5Hen3V+GH1QQzXSnpKnZAylePcJlwMZ1kpulnujFh3Sdj/M4Q5SMyp4fSaD4ZBMug7NrBY
	SlHeKVLNAi1rInBHYYaGdDXHZlaLNCuhaZQNABDORYtWDUoUn57LWgQPoC5AEF43CL+9omrfqVt
	Twpd8zeFaGIPj3U2YN66oDnsYCjlGpiDhL6HPXDfs2nJ14Ak3rJkFQxxx0X86O/zXnEwrBOg93w
	rSvWKzntvw+ltY14DsZlLpAsVaK4NnAWsP7Ea9w/mDVu+wVLXzipwThuGbHfDZbjTQDNOgBIYS/
	EgRZGQyXhAfWMCU0pUhAsV9q4GGfKBeCKqP3a86QHIYEfSjf591vcHPxMK9Ul/dWINf0yxyrz1a
	9xiPtK2SJEbUDqePUUnvrtwJ/8j3uzakG8N1avYc5TDHzRyPzd0eg6NbOFpBzrbcT6j2NcfVztR
	/rBJ09AD9THDhB/MYhVqXjaLRIFCCSsf4fqQSNAi1V8ipkk8mV5y5AYtP41ymq6YCIsQuxkogb/
	mSki0DDfuzlQOVfy9aTouIS6
X-Received: by 2002:a05:600c:4e48:b0:49e:7186:f36e with SMTP id 5b1f17b1804b1-49eb731c39emr16252885e9.1.1789544520893;
        Wed, 16 Sep 2026 00:42:00 -0700 (PDT)
Received: from pop-os.. (98.102.222.87.dynamic.jazztel.es. [87.222.102.98])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf1f7cesm5023219f8f.10.2026.09.16.00.41.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 00:42:00 -0700 (PDT)
From: =?UTF-8?q?Miguel=20Garc=C3=ADa=20Rom=C3=A1n?= <miguelgarciaroman8@gmail.com>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+44efda9647c52be29d9c@syzkaller.appspotmail.com,
	=?UTF-8?q?Miguel=20Garc=C3=ADa=20Rom=C3=A1n?= <miguelgarciaroman8@gmail.com>
Subject: [PATCH net] llc: stop connection timers before dropping sap ref on release
Date: Wed, 16 Sep 2026 09:41:58 +0200
Message-ID: <20260916074158.3375909-1-miguelgarciaroman8@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

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

Fixes: f7e43672683b ("llc: hold llc_sap before release_sock()")
Reported-by: syzbot+44efda9647c52be29d9c@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=44efda9647c52be29d9c
Signed-off-by: Miguel García Román <miguelgarciaroman8@gmail.com>
---
 net/llc/af_llc.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/net/llc/af_llc.c b/net/llc/af_llc.c
index b0447c33d..4fc397fad 100644
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

