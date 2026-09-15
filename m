Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D92543C3F52
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 12:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789476961; cv=pass; b=vA4fwcdsrFbjqnWHeQrFo5KOobUqiU5iGYyhWJRLExX4/GvWuechXd5r8RvlACTPwbWHDGmVFVhPsWWcTY8O7lG3+4Xr7UDcKCTxa3e7FcvLOA+bY66vFdisFsrwbaif6vhD1wV/2cu0+kACzSIyl38u3FXf9iiMS0+ZQZcBnqk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789476961; c=relaxed/simple;
	bh=gRWFEbP0K6mz4ER0pAnlHWisjs7fcvaJ45EucA3FDp8=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=PPoAzyQIRd0TSMMd5Pp6jE42nxOBmmlddg/ZLoBhfHGa1Iyn2A2cbhPlYfXGWUUKKbMDJ9yjeIdASt99AYgTQUnZwo4NZvYFl4eei6d7GQ7Ja0Q1pz4Ibh4eyFScpWUz0O09T7tt9omHzE47haMynFeZ0Rfa0wOhjOhpGUbwM3A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MRRwU+xC; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MRRwU+xC"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-484366874b0so1812447f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 05:55:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789476958; cv=none;
        d=google.com; s=arc-20260327;
        b=CMe1FwhjhtfDD8lSXqf6L+3BBVdNoih/haHwfV08ajwKN/rbwqRDo1D2X15nAn9en7
         VaTK4QiUQQKXtKfiycaRtjP7iUy8cMNw9cCepblXu4e6jziOlacHVuJoESouZ3oTdAZS
         Pb20O+Gt7DM53HwCcnCFam5nKMUwZC6qle+p2oLDheeNthZzObrV9b/q4aaeDbNDnVgb
         +9cDKzQe2/1AsKNldYjf7pEwveIJ3Q68ZGWvqVm+289lWt/IE0S9bBIMsTfMLqBxmJ6M
         2QeEWyT4zUdYzIvpGLqwMmXKYzfsqhFIivX2cyza7sUh8b+QMX8E45haIDyBZGXRyKKP
         /gUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=LCY6wiS7H5vlF9gvkeI4sJ/c8CufgsZgQBs8l5c0dII=;
        fh=6RWTGhsk4A/7JNZ3b6xLBLZ8Zb+rwt6LFC1jQjxEMn8=;
        b=h+atEd/mPRWRLyd1+JkbUwHCqQp9DQHCSeD3LBGs/9T/sA5PUVTz5gby2ydz1ppXBr
         QhcIwQkAftD1gF+bXFGPE8g55nsKeXkayqVLAe2lZ0r0J94k2TXlBkmFJTDs8/m+FHy/
         WAdMsT1mtTwRSfz6h0Fa8nm0HBFo9+I4fp6DjjdkqeSer7gvrrfhTAHTDgw5wBpGmmBH
         mY6qIPf4OqcGY7G8byHsJnrUvjYetQS7VbxFtUSZXuISlKLGnMxobzpaMyoIkR1gKgXT
         iQIK7WPU43sujlmFAjXfo/mHoafW5fQzL5U4EenOI0KztJffpXN9UudRDDKmeVgiB1Bv
         3YkQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789476958; x=1790081758; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LCY6wiS7H5vlF9gvkeI4sJ/c8CufgsZgQBs8l5c0dII=;
        b=MRRwU+xCNo4ZRkqZcSupuxpSxEJirnwXJH1KMwbEvKw1cpfIeXNwTkEVxtcb7JAs6/
         gwktgXi7TgP2MwlCXdBztp93Zv4VWJKxHFck+rhXfNMbwAeYc4PQfdLrF4mMUh9gDQGw
         0g7zleOHUJeutUQPo2Yu1//tg+m+NgvT5OZI3e0qh6+caF8ANNuwfwnJy9i3VUH7W7XW
         EnodReV6VJYOHR8KqSqX4bwvBwdU6LBC5OoomqQzlypBfMUhkL7qGGnb03C3s7XVBxxM
         +Qn1dl1QvTpHZ5+OGAiiWvlkkRzmykKXt3gbfKEw0yHhwUKE2ZqXzjPVZnD0N9JjALLk
         OvQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789476958; x=1790081758;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LCY6wiS7H5vlF9gvkeI4sJ/c8CufgsZgQBs8l5c0dII=;
        b=UTfDN7O38p+Um357HfgIsLHwcqW49huy47QTGTP1kD6Pylm9woZP++bR6n8NscvicZ
         U+BPAJvtDsbBR6LnO8zkJdIJ0VjaUL4CqhoufXY9m/pK7LoB3hZK8wWfFWLLISTxX0aJ
         xk0Jh3SYqj4z4xk0s9q6tJIeB5l+q+W87JMZePOZh+yJeShhdezmWiBIwrIJqPN5+0ND
         wljo4XQhx5WJ8JcxW+JSX2CvWya67GyQPnDPW696KdJGx67adYQgt/tgKXrKHNjVO8YR
         iPdENf6dbNOj3j2GVqE3ZjovGpvt+Zy3K9PT2+4oNew2kK+Sognubi2WZCIYOtMhEnLN
         /V/A==
X-Gm-Message-State: AFuF++nbCKW0WOSRu321hARznCUYG5G0tUshItGxKqBlCAyZHV0/D7hz
	Caw5wbKwTCMFkRwkZ1X2xdc/4KhHWXNgQsPTO7GTMUyZysM9M/pqQJzmvi5gcofgf+sE8Bvj0Nz
	wYDOY0RBL2cJEmVn46KgI8XneUzayRgQAWXqoYRFID+WK
X-Gm-Gg: AYBFou2U4ZHeHCg/xPlrlnYlCNg/xNBWOmMgaOO5+YRd4Gun4ktwA64YtnDAdeDfyQh
	GnssGWKW3B1b6ULPyHpzXyg0+RxgA6a7P4tHQ+2v7CPeByxJEonfc4UVQOrIj5/4dD8jk14tqOJ
	DCwjKAyDaW0c/G5FwjKUjAHhdosdR8tetOd2+QyfNsckiMBoHcUxFhM7ADZRz9Cp0jUfnYwTTHa
	u0lr3lISmmAfvbOj08J/+hcgLI1nQx1xhQkSZmmy/UwkCwXxdf6wyga0bN7syYMG7YOeOMZndhZ
	s52TLcWKhZUeNYTjwQbcyORaJxUIwAXhLuXzUGZ/BFDqhaz1nsBx5Q==
X-Received: by 2002:a05:6000:460a:b0:485:8b5d:96d with SMTP id
 ffacd0b85a97d-48702b27f96mr17603937f8f.19.1789476958025; Tue, 15 Sep 2026
 05:55:58 -0700 (PDT)
Received: from 830778650420 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 15 Sep 2026 05:55:57 -0700
Received: from 830778650420 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 15 Sep 2026 05:55:57 -0700
From: Ruslan Vagner <rusya92266@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 15 Sep 2026 05:55:57 -0700
X-Gm-Features: AcwNN1WchfxuQRPpAJfs-l2yXysXkHfq26eqjZJbNOOnKV0N8sWIj5A6d7mLss4
Message-ID: <CAF9RqJ7HmQ+AtxZeeX42u-jHm0vYKP+L14_JgbDaw9hZJcJNSw@mail.gmail.com>
Subject: [PATCH] genwqe: fix comment typos
To: linux-kernel@vger.kernel.org
Cc: haver@linux.ibm.com, Ruslan Vagner <rusya92266@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Fix the spelling in comments. No functional change.

Signed-off-by: Ruslan Vagner <rusya92266@gmail.com>
---
 drivers/misc/genwqe/card_base.c | 2 +-
 drivers/misc/genwqe/card_ddcb.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/misc/genwqe/card_base.c b/drivers/misc/genwqe/card_base.c
index e602eb3c51fa..c9d6261e6356 100644
--- a/drivers/misc/genwqe/card_base.c
+++ b/drivers/misc/genwqe/card_base.c
@@ -904,7 +904,7 @@ static int genwqe_reload_bistream(struct genwqe_dev *cd)
  *
  * Condition for the health-thread to trigger:
  *   a) when a kthread_stop() request comes in or
- *   b) a critical GFIR occured
+ *   b) a critical GFIR occurred
  *
  * Informational GFIRs are checked and potentially printed in
  * GENWQE_HEALTH_CHECK_INTERVAL seconds.
diff --git a/drivers/misc/genwqe/card_ddcb.c b/drivers/misc/genwqe/card_ddcb.c
index 969178573940..97de35231042 100644
--- a/drivers/misc/genwqe/card_ddcb.c
+++ b/drivers/misc/genwqe/card_ddcb.c
@@ -543,7 +543,7 @@ int __genwqe_wait_ddcb(struct genwqe_dev *cd,
struct ddcb_requ *req)
 		return -EINVAL;
 	}

-	/* Severe error occured. Driver is forced to stop operation */
+	/* Severe error occurred. Driver is forced to stop operation */
 	if (cd->card_state != GENWQE_CARD_USED) {
 		dev_err(&pci_dev->dev,
 			"[%s] err: DDCB#%d forced to stop (rc=%d)\n",
-- 
2.54.0.windows.1
