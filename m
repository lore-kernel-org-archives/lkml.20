Received: from va-2-40.ptr.blmpb.com (va-2-40.ptr.blmpb.com [209.127.231.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D5B415F1D
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.231.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789388293; cv=none; b=IxsL/QQIX5tpeilvU9fB/bh5WqEPYbdL+TBj+k5O1IcDcuzVYL1WAVJ3uh4J4ci7I06mi76sEvKkYSqS3SQ70qX4934KMV2f/oh8bzyJQqqzr5fEtcfRoZyCo48+eHxzpzm96rBwHsXw4gBcwdWqB+1FP3WPEOF06tRCma+5hps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789388293; c=relaxed/simple;
	bh=hbYulF5G0XpH6vk4F0+8iONPcKXPa6GZc0v7vKbDV0M=;
	h=Date:Message-Id:Content-Type:To:Cc:From:Mime-Version:Subject; b=EGspJ8dS5P5N2bCyKeD7+heF92Ql2KjKykeYChAvar2xtYboz/pdaR/xWYQKQXULHvY2aqZFKLU+nLh+hgqR4Yid1tcz+4U/6L+imol1bVGD6P8QlE5n4H7DkyWulrDlwix++6xxXYpUl5nqFisnhT1UHXR8A1l+PA5ccNY1UpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fnnas.com; spf=pass smtp.mailfrom=fnnas.com; dkim=pass (2048-bit key) header.d=fnnas-com.20200927.dkim.feishu.cn header.i=@fnnas-com.20200927.dkim.feishu.cn header.b=S7GFxBwO; arc=none smtp.client-ip=209.127.231.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fnnas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fnnas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fnnas-com.20200927.dkim.feishu.cn header.i=@fnnas-com.20200927.dkim.feishu.cn header.b="S7GFxBwO"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=fnnas-com.20200927.dkim.feishu.cn; t=1789388280;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=G7A7gpVT9wFNI7+T5wV9bi7VlzmAAT52yyMbcA3FgJo=;
 b=S7GFxBwObKOPOwBnrcZQwNiTXHvquldujaKjuXhqIUDuy1RZOuVFqyMftlATJViK0FcCRb
 KuEaeRfdX9dBqp/allfffj6KMXnJdQLAZYhnQb6cpFcPkWj0Z4mnGsqe6jQb2pePfCx5Dh
 76wCV7K0DIjetHIsAlauhpc0EmsEOz4d/xqP7AMDEa0gWth8M4ap435ZNUKwVrfBhWMQLn
 kRxr5q4UNOilW+ZPYxhVl0XvKw6HzVBNWYPvLV9r7/BP62Df5EGXSCL1fRbvls6O16j4On
 YSN19rsWtHxxcKun5qKDhQQg+mA93if2Vr43wCGQolce9HNirsglAp8KB1A/1w==
Date: Mon, 14 Sep 2026 20:17:45 +0800
X-Original-From: chencheng@fnnas.com
X-Lms-Return-Path: <lba+26aa7e5f6+e4fbd6+vger.kernel.org+chencheng@fnnas.com>
Message-Id: <cover.1789387793.git.chencheng@fnnas.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=UTF-8
To: <linux-raid@vger.kernel.org>, <yukuai@fygo.io>, <nixiao@fygo.io>
Cc: <chencheng@fnnas.com>, <linux-kernel@vger.kernel.org>
From: "Chen Cheng" <chencheng@fnnas.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0
Subject: [PATCH v1 0/2] md/raid5: validate disk count before reshape assembly
Received: from fedora ([183.34.164.60]) by smtp.feishu.cn with ESMTPS; Mon, 14 Sep 2026 20:17:58 +0800

From: Chen Cheng <chencheng@fnnas.com>

The previous patch rejects raid4/5 arrays with too few disks in
setup_conf(). During reshape assembly, raid5_run() still divides by the
data-disk count before that check, so a crafted superblock can hit
division by zero.

Extract min_raid_disks() and reject invalid reshape geometries in
raid5_run() first.

Chen Cheng (2):
  md/raid5: extract min_raid_disks()
  md/raid5: reject invalid reshape disks in raid5_run()

 drivers/md/raid5.c | 28 ++++++++++++++++++----------
 1 file changed, 18 insertions(+), 10 deletions(-)

-- 
2.55.0
