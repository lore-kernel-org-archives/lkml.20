Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD7EF1DE8AE
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 07:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788419112; cv=none; b=WnvldeMpwozvNIUtuybSU7zBjPs6CtpEEES3H0PkvpRPIFCHYcR7mxXT+UQuiCnudy0rKsyF6dNdzcIhitSJLfBWSfJ+n8q7Wrimihok9QAwjQn9vPI4BbGw48yEiSFl42Q3ly7W5pa6bBXpiOOWx/cz5OOWkPo6bFRhY7tf82w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788419112; c=relaxed/simple;
	bh=60Ljm4JDdj5HCpI5xOkY0R7hzvDGyL5/vLdov4Jh79c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=naFw7Imp8cd6IJEPRoF0wwwQTfdX/6ruDaJ9h/xSZtpYZgaz48x/xF9Gw9OZpA3XVxL7s85uuBqTTZFZrZ1kYWh5dzlToEhlhs/qnsdPbRaCN7n3YcaFbDZmHb/3DZ2vs3dW7SyPl5dvZuJTPQiktKMKORZJKOqiYWoWwQ9//8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iO5LnTTW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iO5LnTTW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC3DA1F000E9;
	Thu,  3 Sep 2026 07:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788419108;
	bh=FR6L9I2AxH4isrQSTF3YV+9BlpxJIn0nFUvL/QzRmog=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=iO5LnTTWLL7eHjkE5kGyYlcZY7NmTUlyPScbdDsgjxLfHAbUIfO8Rn+0hUFKzmdhk
	 czMaBalQ4XAoQcPqae6ZcnqUzdSBgGq7KYh1rtVMMpXcwZ+7nCQV/ywMLr0Se/fPEm
	 ZIYC/cWKv0trq+ZBhfZ6KKrlIbHqVGFyUuV+UVTbCN2xFZWYp+jS3lxXWTAQnLs91l
	 TWrW6UxpXEnsa3weGzn7fPUPJs2ck+ezX5h3Rs/uLsyhh4lpGV/dlegboRUcYo7SL4
	 rv9DeV/IbTB9mI6XuGnPlg1pgV4wdA8bktSiHRUqaUYSYOlFKNs0+eRm0ufFVC5LDs
	 m2wC6E5Myhi4Q==
From: "Barry Song (Xiaomi)" <baohua@kernel.org>
To: baoquan.he@linux.dev
Cc: akpm@linux-foundation.org,
	axelrasmussen@google.com,
	baohua@kernel.org,
	baolin.wang@linux.alibaba.com,
	chenridong@xiaomi.com,
	david@kernel.org,
	hannes@cmpxchg.org,
	kasong@tencent.com,
	lianux.mm@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	ljs@kernel.org,
	lyugaofei@xiaomi.com,
	mhocko@kernel.org,
	qi.zheng@linux.dev,
	shakeel.butt@linux.dev,
	stevensd@chromium.org,
	wangzicheng@honor.com,
	weixugc@google.com,
	yuanchu@google.com
Subject: Re: [PATCH v2 2/2] mm/mglru: make retry logic explicit in isolate_folios()
Date: Thu,  3 Sep 2026 15:05:00 +0800
Message-Id: <20260903070500.76379-1-baohua@kernel.org>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <apjM5ZBOJrdGQM_g@fedora>
References: <apjM5ZBOJrdGQM_g@fedora>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Thu, Sep 3, 2026 at 9:27 AM Baoquan He <baoquan.he@linux.dev> wrote:
>
[...]
>
> Thanks, Barry. These number is very convincing. The retry for swappiness
> 0 is worthy. Then the patchset feels like doing two things: refactoring
> the for() loop; improving the eviction for swappiness 0/201 by adding a
> retry and this also makes them be consistent with (1, 200). While the
> cover letter subject, patch 1 and patch 2 feels like it's not easy to
> match them to the corresponding part. Maybe merging them to one patch,
> or rearranging them? Just personal opinion.
>

Hi Baoquan,

Thanks very much for your suggestions and review.
We have two patches:

1. `mm/mglru: make type fallback logic explicit in isolate_folios()`
2. `mm/mglru: make retry logic explicit in isolate_folios()`

One handles fallback, while the other handles retry. I think this
separation makes the logic clearer. Could we keep the current
separation?

But we may really need Andrew's kind help to squash the change
you found below:


From 1fb8046662a8b23be1b87a21cc9964e9ff9e1eb0 Mon Sep 17 00:00:00 2001
From: "Barry Song (Xiaomi)" <baohua@kernel.org>
Date: Thu, 3 Sep 2026 14:48:52 +0800
Subject: [PATCH] mm: revert slight behavior change for swappiness 1-200

Baoquan's review found that we unexpectedly introduced a slight behavior
change for swappiness 1-200. We could now have a case like:

1. First scan -> `scanned != 0`
2. Second scan -> `scanned = 0`
3. Type fallback

Step 3 was impossible before. Let's remove this possibility.

Reported-by: Baoquan He <baoquan.he@linux.dev>
Closes: https://lore.kernel.org/linux-mm/apfZQE1X6zGAsBb_@fedora/
Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
---
 mm/vmscan.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index bf2786c7247d..ba7adf36e69f 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -4939,7 +4939,7 @@ static int isolate_folios(unsigned long nr_to_scan, struct lruvec *lruvec,
 	 * We are running out of the current reclaim type. Fall back to
 	 * the other type if allowed.
 	 */
-	if (!scanned && type_fallback_allowed) {
+	if (!scanned && !tried && type_fallback_allowed) {
 		type = !type;
 		tried = true;
 		type_fallback_allowed = false;
-- 
2.39.3 (Apple Git-146)

