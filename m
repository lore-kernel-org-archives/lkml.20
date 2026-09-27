Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA15331A66
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 03:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790480636; cv=none; b=O94EYTzQf+H0Y+hSqTBfqbcRIwLmWmm5PoR3GYnn0cFw0WVnKDnJlp5O7An/PXSf6XPPrFdLjX08E0wU5dsVy/c1n7If27VT/WuOzoZs2CJ43CMpLEyJEvrR7X58t1nMs3rOYsK98YepZ/p+8wtzNIl9CPHNazed4X4AjFWyATk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790480636; c=relaxed/simple;
	bh=yjAyVFIWbLy6B446CpxAwXfdace4B+KIl16N1YcItJo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Em9R3RZHlP8ZIb6TtL5n0TYSnxiz+zIGd46+aTPNW7m9OqRfdUVe0KhcWlN/YcRFobEQD9z0zBf1PW5rpSi3tQNxs+tSNuAM0S8tXXflc9Wo4oY1iGMviAM27bqHZm7VEfqzddh+0VtryAs7J208GpEzorEEK9LhBWuVwTf/g1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=GHFlCEYl; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=mWKuhjoG; arc=none smtp.client-ip=202.12.124.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="GHFlCEYl";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="mWKuhjoG"
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.stl.internal (Postfix) with ESMTP id 91B101D00065;
	Sat, 26 Sep 2026 23:43:53 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Sat, 26 Sep 2026 23:43:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1790480633; x=
	1790567033; bh=s6wZLQlYTsc94WcJ2WglzCAi+tDC5b5Bl9a6t57xmm0=; b=G
	HFlCEYlOuhrarItJmhPDHGpwtaDAxcYNLjhPUXOMa1//lrZiEKUBXzpzMNCTfEN+
	/x23jjrFvckDNm/VpAyQ/JAxXsBIgFzoXu6vl1bsueCbAZmxlvWNuXUNIA/cBQ4d
	7gdHfULvZkYYBM8NsFAqVLFoP7VQc4Xze35IuRCEHJM7KsVXCyzBxzZ2f/zPLCN8
	tJnxP9zNLa+ww1UCMxpDMWqqCZmh4XnT4IUYGnXbMZjJluKVBE3hpAtYFFtt9fdE
	yLHeZUytATPsop2H0Zro2uWuYEkB+QHMmZ2jGQcLrNHXy6Y7/QZiNtps6rEqEqLI
	d1sT7vyRVgLuoK5g7jDZg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1790480633; x=1790567033; bh=s
	6wZLQlYTsc94WcJ2WglzCAi+tDC5b5Bl9a6t57xmm0=; b=mWKuhjoGC5NiXoU+/
	1QthFLyhyNpBD/8EGITLUGYUUOKvS7gJP9Cw3iUiBdTCD56ZGy5CHNfsmADpM8Ye
	eS1/bGxWi1WWbqr1jtV5YmbD7WNXSEqtKvqwJzPTVIb7P1doLPYahwE/MSQb/c9z
	QE7wlxxc64Yik0C1dXD5c3RAfS11XxcoajNsErow2F9QTe4o6mPexK8IB9/gE/lO
	TuVdaDGqZE+GgDMnp4Y+ujUq0HH41X1pY1j4OpCNrIWqtn0vmWZMilOMBpJ/q/IM
	qBkAVEUjRB/KgzaOtpjPnxnvZ6zR7/VhlYZ3TAXh4tmwYB6OMpqgHsqKBZTutCfi
	QkbDQ==
X-ME-Sender: <xms:-ZC4anZQqoWWLvty3WVndziv49-hsMj8Hy1ZHeHdPFAYmSTkyZ0IcA>
    <xme:-ZC4akWPcJYelQEqaCpTpdvXlD7KzQcGy-65Rvx6DyqCCmvqonqRGVo-lHJTBSuTL
    lrtvsLw8DlQMBSeEGGxlaT1tNkq0fbc-JBk2lIQOe49hzXU8EPWrxLH>
X-ME-Received: <xmr:-ZC4ahh8BwKvhqqUk4R6_fvOWdyhTa3k3AJuvzsUedneOOHNZwI0fXg0WDKvMIs64PHnz3HebyEuGL5HIx8ixOr23my9Oy34mr7OM10thPXuvw>
X-ME-Proxy-Cause: dmFkZTG4lT+eM/OUaCtoOYl/DyUmH6k9tq2VXzXC6mU+ZYl7CZZM+W0Br08Wif/3GBhDGp
    Em4hgAA9CUxyaNCqjaf/KtpIj1FEra4TRF29/NV/1S/y8EdHxPX88wYIaOiyDaa9NsBS5F
    +kvM1s44usrbRXVosvr7ETxX9g93L4NxUaiU6cXY08Lahq8sSjR6uinvDlZx12z/3pYizG
    V9zoLoiI3hYwl80Vv2me32vNfTt8/rRjnCTmT0nnPtU/WmBF9G8s8gMxryfkaCaDrerzaa
    bG5jinsMyQMBeDmNJGPF/S+Q9VsUgSIiUjYX/kygT771dTS82A003V47AUYrh8PeGKXPEH
    6Hh2efz3/lrSaKmaRXNO6nmdM8ZpFsVh4+6wxe3nrOCGhdt0jzFn1J9pfbXqieP74RJPmb
    DGyd3TOKvjhcM9xFJK0tTOunrQ70UAuhAXL7t7x6jtErMI/zq3R8ADjIWsr8dkOPPeh/AH
    2XfFyMGtIbzCDtOjyoJNxsKSmNJ9Tk5ryuGjjJ0gUeed7tpIdn3J19SBz4hAEmBqqk85f4
    +F5wwYawpwAATORduxMvIZ9ZsmtGbsjWBIOGDJ9pkMeCQG/FIo87Xo7SgsNggVJm6tdvsB
    V80wayZc/ILrv6UaPzwoX9HVcLh1rrgPhHM62uXLpWdzrXAdXeOGx1hzEbqQ
X-ME-Proxy: <xmx:-ZC4aqVRZWrj63zX2pH7WSurwvJigo6clLj0hMZ5Ew2KwqylEuRLtw>
    <xmx:-ZC4agO0LoqwvElPMWbrF2w1utEQUfrrHFTNMS3OgHvCKl0JxmVwtQ>
    <xmx:-ZC4auZOMwrxx0ndqszSt2ehO8Kjp8XhVytaUkgN4dFBzz9DY-KCHQ>
    <xmx:-ZC4akpEQdXh9srWc21kFlYnREapTenuqpemr1govZs2e5o5kZ5Mjw>
    <xmx:-ZC4akORpeCN4XyxFnkuHti_kDHYs1ML6xygYM3Kve9LRs_2XB73fipG>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 26 Sep 2026 23:43:52 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] firewire: cdev: refactor event copying to remove goto statement
Date: Sun, 27 Sep 2026 12:43:43 +0900
Message-ID: <20260927034343.28076-5-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260927034343.28076-1-o-takashi@sakamocchi.jp>
References: <20260927034343.28076-1-o-takashi@sakamocchi.jp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Arrange the local variables to avoid a goto statement when copying events
to the userspace buffer.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/core-cdev.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/firewire/core-cdev.c b/drivers/firewire/core-cdev.c
index 73a940d40b39..e017086ff641 100644
--- a/drivers/firewire/core-cdev.c
+++ b/drivers/firewire/core-cdev.c
@@ -348,12 +348,9 @@ static void queue_event(struct client *client, struct event *event,
 	}
 }
 
-static int dequeue_event(struct client *client,
-			 char __user *buffer, size_t count)
+static ssize_t dequeue_event(struct client *client, char __user *buffer, size_t count)
 {
 	struct event *event;
-	size_t size, total;
-	int i, ret;
 
 	// After the following block, the event pointer above is guaranteed to have a correct value.
 	{
@@ -378,18 +375,17 @@ static int dequeue_event(struct client *client,
 		spin_unlock_irq(&client->lock);
 	}
 
-	total = 0;
-	for (i = 0; i < ARRAY_SIZE(event->v) && total < count; i++) {
-		size = min(event->v[i].size, count - total);
-		if (copy_to_user(buffer + total, event->v[i].data, size)) {
+	ssize_t ret = 0;
+
+	for (int i = 0; i < ARRAY_SIZE(event->v) && ret < count; i++) {
+		size_t size = min(event->v[i].size, count - ret);
+		if (copy_to_user(buffer + ret, event->v[i].data, size)) {
 			ret = -EFAULT;
-			goto out;
+			break;
 		}
-		total += size;
+		ret += size;
 	}
-	ret = total;
 
- out:
 	kfree(event);
 
 	return ret;
-- 
2.53.0

