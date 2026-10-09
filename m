Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 716BB3BFADE
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 07:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791531993; cv=none; b=UL8xdO8g/1loO786cGAa3trypLA3lE6DlG7z5B8EOMbyo7/lFWZ9wtz5tF720kgpaiBjUU0d6PHuwGupeTLtsDJbWOsefSUiekkATzAsCQyYQOXO9wgJ2e6i6wyd2xDQk7ve6KEE4pH836iSWzQCVPnov+uM4ZTy/dpl/2k45QE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791531993; c=relaxed/simple;
	bh=B7W+3AyCdYjzHC3pUZSmmmmlE7OsuW7e3hHtTBY2Owk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=oqgfuqCAool9cRACwh88RBgWoVcz2c52MWxxdKT0sJ+9KNWKbHhbSsYj4Aw+MOLqUk+SqhSh3nGrBAVk+fabLFppML6iytfj/FGnaYBrndxIUKed0KEyZcQgMgXK6SyTELdBftU95oik6W3AJ7NkVfyupdM3Zdl488UA8Ro0Vr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OqkMRMeS; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OqkMRMeS"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6ae27f06c2fso9756715a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 00:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791531989; x=1792136789; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=hYcgBiPs6KqcLX6BMGdekbSCqBXKN+/xxrLfVzz+rLo=;
        b=OqkMRMeStXfizraaoRcksvRafrO8kHM2RMOf7byNpnP+mpv/JAHYgHmU7hU9yojAGh
         I4fO2EQZL9unZ2x1MyYYzthlRVDh5SGm4H6P8V3hwHPiMtQqNJUKZwiU72TzSvVrFERO
         B3GAzhfBzB49Lc1fLNJe2PCMmkc3KKi4gXHsoOZK+1lFtJNenESLq8GTeFLn3YyebqF1
         pHnIjeTFgYVqqUu8Za9uPqU1HF8lx+x/lT4tg8dsNcFhdRf8Zd0u/qfR6DtJwsuqhyEU
         ClMXZqWDTcU1Ghz6sHjH7iLW5mvpcM0ejY4RLqb79qCx01EXn6T19QbQnNCKWCUoSoZg
         3RmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791531989; x=1792136789;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hYcgBiPs6KqcLX6BMGdekbSCqBXKN+/xxrLfVzz+rLo=;
        b=PbZBKmYuR9AECdusjVGEajO1G14DpZFhplnoinIZszOSgirKFEnnl9bOeUvAITTtyD
         NNKH1DgCUXLB/pp7SeuitVofR4oWSk1iu2zHOjeOvnVdiv93IHv4ic5qyuSYmkYyYQLm
         TXg+vRCWdLy2QNtqHLezY3+uUBF8ykEAk3Ho2GFmNLvgbb3SEu90aPqSxncZ3uLpkQWr
         5hW3DsawDe/wMr3Wtqzpnq8PbJVTO+2OMa2CHMOou7UMsYg/NsdDxj7WPf+Xl5xanjAZ
         lCMxePieyQ1KLW3mYDfBo5azCJYpDYSEp7HYattSF3i01xPMNadHsc+JhqLxDpDpJrf/
         WhNA==
X-Forwarded-Encrypted: i=1; AKwUvByi2vV/O4ibHda+xOZVjrd53fn4pS+I6YpGJ1eTOOwsGXJvwuqREZPwDxTEXLzNtQoSg8fVj2M9Ro/zJxU=@vger.kernel.org
X-Gm-Message-State: AFq9FYI2Sn4Mg6+/bvZlOckk4XY/u7D9YYePDSNcE7ZccM0UxUUF4QOD
	Iw2B4S4K17L0AYDp0wqYzhbsvqeW/Shv4LXY9+4Bcjqa6IQ/lDV6Yctj
X-Gm-Gg: AYBFou2Tb2xD9UoPUP8bvJHWBufqTBhN5mbetJ0RLKlqwh2zj887Kjg90rWzK9xzTdE
	wm9UIGjZtj0xyYgDyZ5hObpE1xXCqx1GFM+K23t+Z4AY0N4SvH7aQRqpkq7dzKII3+bDf4wSm7C
	lTCJyB+Gzwjkp+pGfTwfNBW61Wt8y7G4VHQ7QQk5TQBIuROuI+56bjGBZcQdU0sc5NGee6uqbOY
	GfPiwWLbPZxxJ7a0+J5YCYrvUsQ9ztxIZJRxUtTcAzGI4zrY8FZMErtT3Lk400arTr/oOZrdypY
	zdOTBHfaLdnfZNNgc2QOo6UCCYKjNGrt7LqrSR+b5yPee51HPaUy8VtUuj5cxv6L9zNHheV93KL
	iksEj1Dd8HRMvdoA/kSvA1FE4vbswTedW6Vj6tqJoAPums8fNbLo5EwxV7A3YJpyNJ9W6vQE3JM
	kqUwdoIYF29hRspyJzy4ajGp+1oNe9NX2LRik2gNnnBhTq1LF+ySzdXIhkoIF2J4RRpQHV6nEz/
	Nb04106IJ6Jnjc/9SOS6l7Tzg==
X-Received: by 2002:a05:6402:21d3:b0:6ab:81e:e812 with SMTP id 4fb4d7f45d1cf-6b17c293fa5mr692929a12.34.1791531988489;
        Fri, 09 Oct 2026 00:46:28 -0700 (PDT)
Received: from localhost (c-85-228-45-68.bbcust.telenor.se. [85.228.45.68])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b179dd5e85sm670427a12.21.2026.10.09.00.46.27
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Oct 2026 00:46:27 -0700 (PDT)
From: Eli Billauer <eli.billauer@gmail.com>
To: gregkh@linuxfoundation.org
Cc: arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	Eli Billauer <eli.billauer@gmail.com>
Subject: [PATCH v6 4/7] char: xillybus: Use unsigned arithmetic for jiffies differences
Date: Fri,  9 Oct 2026 09:45:54 +0200
Message-Id: <20261009074557.19996-5-eli.billauer@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20261009074557.19996-1-eli.billauer@gmail.com>
References: <20261009074557.19996-1-eli.billauer@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Change the type of jiffies-related deadline variables from long to
unsigned long, and remove unnecessary casts when computing time
remaining as deadline - jiffies.

No functional change is expected: although signed overflow is undefined
in the C standard, processors perform the calculation correctly in
practice. Using unsigned arithmetic is nevertheless the proper way to
handle jiffies differences.

Assisted-by: Deepseek:v4-pro Kimi:K2.6 ChatGPT:GPT-5.5 Claude:Sonnet-4.6
Signed-off-by: Eli Billauer <eli.billauer@gmail.com>
---

Notes:
    Changelog:
    =========
    Change v5->v6: Rebase to current tree
    
    No change on v4->v5.
    
    No change on v3->v4.
    
    Changes v2->v3:
     -- Add Assisted-by tag to description
    
    No change on v1->v2.

 drivers/char/xillybus/xillybus_core.c |  5 +++--
 drivers/char/xillybus/xillyusb.c      | 17 ++++++++++-------
 2 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/drivers/char/xillybus/xillybus_core.c b/drivers/char/xillybus/xillybus_core.c
index 952ef149aba1..7acebc1e6050 100644
--- a/drivers/char/xillybus/xillybus_core.c
+++ b/drivers/char/xillybus/xillybus_core.c
@@ -694,7 +694,8 @@ static ssize_t xillybus_read(struct file *filp, char __user *userbuf,
 	unsigned long flags;
 	int bytes_done = 0;
 	int no_time_left = 0;
-	long deadline, left_to_sleep;
+	unsigned long deadline;
+	long left_to_sleep;
 	struct xilly_channel *channel = filp->private_data;
 
 	int empty, reached_eof, exhausted, ready;
@@ -938,7 +939,7 @@ static ssize_t xillybus_read(struct file *filp, char __user *userbuf,
 			return -EINTR;
 		}
 
-		left_to_sleep = deadline - ((long) jiffies);
+		left_to_sleep = deadline - jiffies;
 
 		/*
 		 * If our time is out, skip the waiting. We may miss wr_sleepy
diff --git a/drivers/char/xillybus/xillyusb.c b/drivers/char/xillybus/xillyusb.c
index 9182817c435b..ddd583304504 100644
--- a/drivers/char/xillybus/xillyusb.c
+++ b/drivers/char/xillybus/xillyusb.c
@@ -1121,12 +1121,13 @@ static int xillyusb_send_opcode(struct xillyusb_dev *xdev,
  */
 
 static int flush_downstream(struct xillyusb_channel *chan,
-			    long timeout,
+			    unsigned long timeout,
 			    bool interruptible)
 {
 	struct xillyusb_dev *xdev = chan->xdev;
 	int chan_num = chan->chan_idx << 1;
-	long deadline, left_to_sleep;
+	unsigned long deadline;
+	long left_to_sleep;
 	int rc;
 
 	if (chan->flushed)
@@ -1135,7 +1136,8 @@ static int flush_downstream(struct xillyusb_channel *chan,
 	deadline = jiffies + 1 + timeout;
 
 	if (chan->flushing) {
-		long cancel_deadline = jiffies + 1 + XILLY_RESPONSE_TIMEOUT;
+		unsigned long cancel_deadline =
+			jiffies + 1 + XILLY_RESPONSE_TIMEOUT;
 
 		chan->canceled = 0;
 		rc = xillyusb_send_opcode(xdev, chan_num,
@@ -1146,7 +1148,7 @@ static int flush_downstream(struct xillyusb_channel *chan,
 
 		/* Ignoring interrupts. Cancellation must be handled */
 		while (!chan->canceled) {
-			left_to_sleep = cancel_deadline - ((long)jiffies);
+			left_to_sleep = cancel_deadline - jiffies;
 
 			if (left_to_sleep <= 0) {
 				report_io_error(xdev, -EIO);
@@ -1196,7 +1198,7 @@ static int flush_downstream(struct xillyusb_channel *chan,
 	}
 
 	while (chan->flushing) {
-		left_to_sleep = deadline - ((long)jiffies);
+		left_to_sleep = deadline - jiffies;
 
 		if (left_to_sleep <= 0)
 			return -ETIMEDOUT;
@@ -1429,7 +1431,8 @@ static ssize_t xillyusb_read(struct file *filp, char __user *userbuf,
 	struct xillyfifo *fifo = chan->in_fifo;
 	int chan_num = (chan->chan_idx << 1) | 1;
 
-	long deadline, left_to_sleep;
+	unsigned long deadline;
+	long left_to_sleep;
 	int bytes_done = 0;
 	bool sent_set_push = false;
 	int rc;
@@ -1458,7 +1461,7 @@ static ssize_t xillyusb_read(struct file *filp, char __user *userbuf,
 		bytes_done += rc;
 		chan->in_consumed_bytes += rc;
 
-		left_to_sleep = deadline - ((long)jiffies);
+		left_to_sleep = deadline - jiffies;
 
 		/*
 		 * Some 32-bit arithmetic that may wrap. Note that
-- 
2.34.1

