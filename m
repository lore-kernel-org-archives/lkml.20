Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793617047;
	b=GVgCFozYIjCesINA3U6gFEzgMK4qrYv27Blrkr8egBldGDYBQ1zkdGUB8Tl+dEQ0kRFs
	 TxPlVg1+f/JuwIz/y3kyEiT6f63gxrhDYSSNbRtv/PpXykVEaUZXa/70AhTsNebwd1nvw
	 fVrLhUoB59ilQpQKouMlK1jwa+bWPvhvpAm9TVBvwb33vaMIUgx5A5rxXobhFnM+glPnl
	 ymwCBz8c9tc3tZNx/YMj8AbZXRw8fTalfSx7YfsVY58FUeOg1+r+WXwaiT8Clp9ra5rkN
	 Fmeu8e2IyuL2f3PRW+R1T8FG/xAxqa5+p3Y6CU9eV5Rlib37B9AQD53Ebt1G2xelkaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793617047;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=stidbQEu/b8LEL0TyEMNxXUt/GPxYyfM90OUzht8BOA=;
	b=agJPXG1bMdkC3iZyMyINJG5NKui/v0BASZMlNm7IKfTKHnB7dTGlno5X7mZhrBfhcEgl
	 YnAwa/PimuqF9IdaDIJlzmMMA/ptZmE1rAMXYWCPhGbe1TmsAxrzp/Zuv/UGVZiFXmMyB
	 +htVYybBUqWuaiW7SMnc2YILHkNGUIIiw7yN70FvR1Xq8agGTktKGmM0CY5/jh5HhIiZa
	 51F9MwOc4hv7khB4zY2nqGDPixmBIvIOQFwCT4EsGYu1O8G5Fn81fkJCeUonZkHu/35J4
	 ZjhPv2mEg89e6+TlYwsfQAH0o9pHsqubWNDIJLoEZjrk2BYy4Q0fmLRWflNWkZYCisA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=RaxvoYKn;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC09606A331
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 10:57:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BC09606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=RaxvoYKn
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso28903245e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 02:57:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793617045; x=1794221845; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=stidbQEu/b8LEL0TyEMNxXUt/GPxYyfM90OUzht8BOA=;
        b=RaxvoYKnYtR2+CwR4nFSRn0rvyUjPA3n8mzJZ7FLNf4iniFp60DqhSsUgLv6lnZY7E
         1l8vJESyxl4ts4rFvJUyCQ71sHEpqnA6a6reLjhDpqMADZLjxX4ezomvutoVUwEv0/Rc
         brdz89jK3PUTPRJI89ornTXKbgzAxLPpx3OYgg+Xoqc12xI1XzlXlN5s73sFIq9fh3x9
         ofqpSscvYIWjnvsc9Y9IlyIjRmGGVC5gjH7mvql6IFeHEIPfj67FRumdn9MyWfdYpV+b
         2c9S8Ai5yoz1tkmWaEzegH0O7xwXUwgKT+5kc/0D60bJtRJoUWLWfH6Nj//NgPs+bEaG
         RRWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793617045; x=1794221845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=stidbQEu/b8LEL0TyEMNxXUt/GPxYyfM90OUzht8BOA=;
        b=cEHMZhUEs6/HkO3olEQ32lJPapxnnbIhY6ReOqIKDIRzpJKzQX3Eq/t9OghpNQt6bj
         W5XXlpTLzn5/CRdr7aylhKMO0MhYp/JQs0GE0NUJgIzj6Hb9SxRoYU4mWfNz0mBCgyei
         eqe85wgSdneaPHA/0deH/lX7Zw+JH6TKjBGhie+ITLKIw53yJYRjSfoOgN4U9FMDA1hM
         dRqPAMY+uoiMgyc2U1ztTVieODSEd7/KmmlsjLec+4ADh89DigOc8y6UkK6Vggt2hBRF
         +QB1++TzeNX54XQCC8FNnKU9eITb0kZumpb7SRB1kgS3RjoayntJdlJTseCjbwNYR5yy
         sHhg==
X-Gm-Message-State: AFq9FYIu9b0L3cZVg8UIzZnSuI02PLQgTkK92hCSRhysaQO/vB3Fhgp1
	QHIwfkC0cvXY95ZDh5CdS15FgJlLnAxdycpQuGfn5G/4nyUOyKx1tF/9UI0E1emGAvE9dEQvGqw
	/4OmP3rw=
X-Gm-Gg: AYBFou16M0X7e6g3KChPz4THuubHqhdq1/Vhr8Xf2FKiEki+V6GvZ9EyTVk5EoYym48
	2iPHR1aUJns9zYBy06sDf49FJRel1pr25TlRv+c5fWMxirvEBvGNhtlUs7voZTNKl23IZT6uEnB
	H+a/bvWiSP9LxIw/wgjxEIOtDdgq4Na98YudENA7lFXRn3wQE/U52oMPh9P0M4+t11Oue541jL+
	ocuwP/J58rbgh6hnRP328mZ5HZ10kccsPPd1JO+H/KKVjqz5xftgJHRYR2P7QVWxxZvb26DUh8q
	lkeZogbZPi6QrHxcz8gq8tfMTkAb3KrkcjQZlcOQHJvO7K2XsXI9DRWHklD2d4+wg0PORNHfXjR
	TLzyA6aycXccg97KUzaXGbVjZhjtuxBMcTKUY4ApfXTtvm9sauslFJkf8JEc3m6jyMCxBEeoNte
	8SPSVh9uCvn2B7S+r16hB6zzZi8t57rYxzGwHnL4PgSwmvl3dycHK+bsfw7IOuA2Pvxod52mKKw
	9wTO/+f1enpspifT7hjuWNlk9ZRC1WaubnnlZTokYEOkLKRKXeUpEsXyXYQ+8/3ygigOaFq/u4Y
	ssp+p/SJC+nzPnRzW38pFUVCdQ8O0CYPVi7Ryn7ddp2VoP4k/poI1w==
X-Received: by 2002:a05:600c:6216:b0:4a3:5aea:21e5 with SMTP id 5b1f17b1804b1-4ac1737c533mr210391055e9.9.1793617044701;
        Mon, 02 Nov 2026 02:57:24 -0800 (PST)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abeb77af8csm363171175e9.1.2026.11.02.02.57.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 02:57:24 -0800 (PST)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>
Subject: [PATCH net-next v5 4/6] net: thunderbolt: Move long delayed work on system_dfl_long_wq
Date: Mon,  2 Nov 2026 11:56:54 +0100
Message-ID: <20261102105703.111844-5-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102105703.111844-1-marco.crivellari@suse.com>
References: <20261102105703.111844-1-marco.crivellari@suse.com>
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

Currently the code enqueues the login_work delayed work using
queue_delayed_work(), on system_long_wq. This workqueue should be used
when long works are expected and it is a per-cpu workqueue.

queue_delayed_work() ends up calling __queue_delayed_work(), which, for
a non-zero delay, sets a global timer that could fire anywhere, enqueuing
the work where the timer fired. With a zero delay, as in
tbnet_handle_packet(), no timer is armed and the work is enqueued
directly on the local CPU, i.e. the CPU that handled the TBIP_LOGIN
packet.

Unbound works could benefit from scheduler task placement, to optimize
performance and power consumption. Long work shouldn't stick to a single
CPU.

Recently, a new unbound workqueue specific for long running work has
been added:

    c116737e972e ("workqueue: Add system_dfl_long_wq for long unbound works")

Since login_work doesn't rely on per-cpu variables, there is no obvious
reason that justify the use of a per-cpu workqueue. So change
system_long_wq with system_dfl_long_wq for login_work, so that the work
may benefit from scheduler task placement.

Cc: Mika Westerberg <westeri@kernel.org>
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
Acked-by: Mika Westerberg <westeri@kernel.org>
---
 drivers/net/thunderbolt/main.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/net/thunderbolt/main.c b/drivers/net/thunderbolt/main.c
index cf51b9c39f4e..e36a4e1da05d 100644
--- a/drivers/net/thunderbolt/main.c
+++ b/drivers/net/thunderbolt/main.c
@@ -316,7 +316,7 @@ static void start_login(struct tbnet *net)
 	net->login_received = false;
 	mutex_unlock(&net->connection_lock);
 
-	queue_delayed_work(system_long_wq, &net->login_work,
+	queue_delayed_work(system_dfl_long_wq, &net->login_work,
 			   msecs_to_jiffies(1000));
 }
 
@@ -470,7 +470,7 @@ static int tbnet_handle_packet(const void *buf, size_t size, void *data)
 			if (net->login_retries >= TBNET_LOGIN_RETRIES ||
 			    !net->login_sent) {
 				net->login_retries = 0;
-				queue_delayed_work(system_long_wq,
+				queue_delayed_work(system_dfl_long_wq,
 						   &net->login_work, 0);
 			}
 			mutex_unlock(&net->connection_lock);
@@ -723,7 +723,8 @@ static void tbnet_login_work(struct work_struct *work)
 		netdev_dbg(net->dev, "sending login request failed, ret=%d\n",
 			   ret);
 		if (net->login_retries++ < TBNET_LOGIN_RETRIES) {
-			queue_delayed_work(system_long_wq, &net->login_work,
+			queue_delayed_work(system_dfl_long_wq,
+					   &net->login_work,
 					   delay);
 		} else {
 			netdev_info(net->dev, "ThunderboltIP login timed out\n");
-- 
2.56.0

