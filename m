Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.196
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792537807;
	b=DWIUKgzkUngnt992ryB/Hpi+lxKNbqkxAMhLamBM/qmwYP0WukcV91AxIBKHuiRT+QVq
	 ozp/fyoUPBvfzgkHJEFBoteuCmLMzLyIBw0xkLpOTLI6uIBK1af/zm3LBTAt+PcO9wxr1
	 lQ6zlvMotIZFaKTh2z7GdJptX9za0430aF4t4W5kjy4tN2sPlOjxLKKlYMrQDLFte683d
	 6nl4DVu9Zj2QQcj/ntTGezI2+bA9pp5FNQsLxyASN89KHNYNJu/7soNOD1oacbukLjibW
	 jH6jLQdqvYAvmWrBqwtls2SJWbDshW0jOWtMQYoIs2yIOf9t8Ebk8pTHeyObshPubzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792537807;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=P2tX6F6c1b9WPZHS6VLVV3K2kSTZMFFjbVRLrh7B9c8=;
	b=2zg6jgwM+ctI7TtMeZtYoCJxvcNZXCeYmJsGoic+1MiyofqPCFi2rDHlPB/PeiCXXyCR
	 F9JxDUWf5Pt2pireQp8nkmU3LvtnptLpbGe21/WMv1CMtZ0Fiy4echGe1TQ6SwMBs3AmT
	 DbG1yAlKgvE7wPaXBfiGpZzZZAdGYCnNLLxPfr41eMEnNyy2KUsaN3UJWdoq5iGbZIfbq
	 /Z/Npw/S2THKO9C8b3lGa8jA0Igg08SXGzzCFjPGqCBLLexO/0284jzpSKdRnc2+jZMut
	 Ts7QXD296muVPYqA/kpTvmMOd4QN+hP59by0+iZbMd2O3f/6+CERtT3aAuDWshbAM5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FXQYyZ4e;
	arc=none smtp.remote-ip=74.125.82.196
Received: from mail-dy1-f196.google.com (mail-dy1-f196.google.com [74.125.82.196])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59842606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 23:10:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59842606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FXQYyZ4e
Received: by mail-dy1-f196.google.com with SMTP id 5a478bee46e88-35943f55c06so242306eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 16:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792537806; x=1793142606; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=P2tX6F6c1b9WPZHS6VLVV3K2kSTZMFFjbVRLrh7B9c8=;
        b=FXQYyZ4ee7N+OmcvvHjgLzE5KvKF6Es0Ggd9KBeTLLtMA0G1RiUBo41egIOT1n015P
         IVGvwSb2VzpoAqNsNIobOqfmvcge5bGmdY7XCL4cTgMJ59LjhcMTUBxKz3MxIBwkxhWF
         9LZO7B9xnhh69sXtDTrMwD+yWY1IC5KJaK91+TIf1K9MtbYVOZ8Cs3lyQfCVbDOR3uZr
         gDr+7e+py6aaqRGl5cf7ahuy0F80Rpf5OfTrBpeBLXrLmR5RMaO9IIsAMd9idozWNAZZ
         8WdthJSlQaqsPh+NEuugoh/Dcg2aLqrfOnoHZdowZXrzw5L5t3qIAQajZuezLh3eK09d
         wrAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792537806; x=1793142606;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P2tX6F6c1b9WPZHS6VLVV3K2kSTZMFFjbVRLrh7B9c8=;
        b=yNArVud1qVCIhhmyJ11Wdzw7cheC4XsBRxWhs/9OiKdbaybN9h1BkADK73zgJKqh5d
         RbDXGUI0dUyCv7h3+HG7v+byc4Dr895AGgArt1ebfU2kbDp47etJG+IRjnpPDDMjwVhO
         ju5kVgA6peDuvuMQ3pjlhO6FgRkAhhmFrFTRRfxfMLhMizkV4yMhmvIo9+lKoqyoTYqO
         vI5Fe6YarbXvMiJ0A0OmildWtfP2OssKxcp1zLDHAkGIfoSt6//knLpXNcretwCyVq/M
         qIFP9pXtx+ws5HGDkb/EVWzenKTWFakErrETiJRIltXGqP0VmOzVlsmLOUuUvZQ82yeq
         tgLQ==
X-Forwarded-Encrypted: i=1; AKwUvByRFGwNyU/DX1f1bOJcqqC1tou3cO/fohhBGZj8IVoy7yI8zZf5ueJ8uQtrr2lwj0bDqQamCigbKlu57ek=@vger.kernel.org
X-Gm-Message-State: AFq9FYLdX7/qAZT8Lwf8xi/wienVZ8Hv1lNBfw+bSaLzSoSE1vg4QBOu
	bph/ZP7wSqYqSjobiHM9SHlB5x9EbI7bdTu3G59H1OA7a0EaD+ItL92R
X-Gm-Gg: AYBFou3ROHIjDwA7y4a064I7jzXiv2JlgVnYjUqUSh9Pa8TE9OjID/rk//WEEbHweJl
	06X8hW+2tYKRCQ1lezZcdcAkqynTq71wf4hay4f7bOjt9/kXleuStlb4eq3Bkfd4giwVv622OLI
	TfX5Z83ndLJfCycAlAugxAlydp7CqvcbedkW+5+Tl2E/d8o5/jGTDCSxaYOTw7juJCLIIdhkN/g
	ZYMWJi8ivqu41fpxYpajAnWY/7FzfVBQIP+IYjfwJu5TIQDBY9PMwHroUY9Cb/0Tg1UQFHMvn9n
	XY16xhlCuCBD9nEwDMdsYnPl8sUWpvM2QEzBnSqJP4CdQjB7ncJK05T/+D60t4gwnsvypP6xs/s
	V/U9SQdkOj1TR0oJciXbSGrNmvvo7UopMOxOhEyCBxd5E2ePYwRmjXQZr2mYXZVQA21D/ESGpxG
	mIUT0pZ+fdIPCGqBb/tTPM+LUNjpKm31Qy256/77ONN0GpauXGO6kuG1yNiSFxO+WK9ukRZLr+p
	pO/8MvaexdSeHI/zWUvpnqzqoTEXYsZQbE40RUtPwGCQSUkS4fMu8qsqOewzxavcKrnhKm5DOTZ
	1+0nMt0=
X-Received: by 2002:a05:7300:4fa6:b0:35d:5e81:1d87 with SMTP id 5a478bee46e88-365fac8800amr4594466eec.12.1792537806333;
        Tue, 20 Oct 2026 16:10:06 -0700 (PDT)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36741f753f7sm1598433eec.27.2026.10.20.16.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 16:10:05 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH net] dql: Reset the adjusted limit when resetting the queue
Date: Tue, 20 Oct 2026 23:03:58 +0000
Message-ID: <20261020230358.6649-1-dennylin0707@gmail.com>
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

dql_reset() resets limit and clears the cumulative queue and completion
counts, but leaves adj_limit from the previous queue lifetime. Since
dql_avail() subtracts num_queued from adj_limit, BQL flow control and
qdisc bulk dequeue can use stale credit after a network queue reset,
until the next completion updates adj_limit.

Reset adj_limit to the new limit as well. With num_completed reset to
zero, this restores the documented adj_limit = limit + num_completed
relationship and makes the configured minimum effective immediately.

Fixes: 75957ba36c05 ("dql: Dynamic queue limits")
Cc: stable@vger.kernel.org
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 lib/dynamic_queue_limits.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/dynamic_queue_limits.c b/lib/dynamic_queue_limits.c
index f97a752e900a..acef6a35ba3d 100644
--- a/lib/dynamic_queue_limits.c
+++ b/lib/dynamic_queue_limits.c
@@ -191,6 +191,7 @@ void dql_reset(struct dql *dql)
 {
 	/* Reset all dynamic values */
 	dql->limit = dql->min_limit;
+	dql->adj_limit = dql->limit;
 	dql->num_queued = 0;
 	dql->num_completed = 0;
 	dql->last_obj_cnt = 0;
-- 
2.43.0

