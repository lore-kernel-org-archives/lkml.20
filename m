Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794298778;
	b=XmA9qp8GZo5VZrs+9jz9hwu5wiLok2WH3QLYagkkQ1mGhINfb3RT9Dj9IsOT3kW89Wod
	 k6/m676FmX3ax3bXfktrauNIh4In6/uvpmBeXAgngp+9tFjOfGkzUbLlE/honlNSN+iuF
	 GACWOrCtsWE+y8ju2v1wEgNA3sCHFPb9UVkmCdKTYmihKOPvv2Yi8Z0SFME5D9W/ypysA
	 G7UcuJnrC49I1GySjBW0DNi0K3JqNQmBjuXrGP18VUBqvo/83/+V9YSqof5Wqip46Jw62
	 jbYc3zlptH/+9c+h/WWW2gLd3LgArxgujwSIcMLnMOvDzsSh+VCEYDmOFDgqFIrLy2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794298778;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jHh8QP5RizpiZ/rOn8/fPhqoJKsZVAfXdzIBsu2Zprc=;
	b=eIDHZ8MyxQa/hLrTR5yumUcBKn8YQy1ICf1Bbz1dcGrFy8/xG9gmwFfW+aLKBVFAgveB
	 YQIHEktO1X3VslflwVRE9MMBF3mr28MaSJJCpPoe1Cben2YnuTirSOr/Qf2wURxvljCC3
	 l7aOICasieMGhgPMWA+e0GEf9Uu2YysBTKRoPpbhfherd+So+oZN/WM6BDl2tu4f4yUlJ
	 ba/nWgcYrmQNUiqnL04sXb/aL/mMNHSYjlT+3EkUp34rtyS0VJjlLEUPHWKKyp8bn8mlH
	 Dj5JsKwGI5GzDLLOgu2E8mxwqVY61gSVGwtN7m9SetuoJKHaKL9KQ6g3g9oO9AHsi5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=oirsN4Sz;
	arc=none smtp.remote-ip=115.124.30.98
Received: from out30-98.freemail.mail.aliyun.com (out30-98.freemail.mail.aliyun.com [115.124.30.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF066606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:19:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF066606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=oirsN4Sz
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1794298774; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=jHh8QP5RizpiZ/rOn8/fPhqoJKsZVAfXdzIBsu2Zprc=;
	b=oirsN4Szv5wSU9MpqgtBIrQkbdqRzertWo4NV9jIcIrZPZp0ZWK3NDmvQM15cuVK8szTEcq3iUw1NPE+V3wd+C1YGaWsjDvc1Kpt0jEGzKdPusXGpADcvhPkngBsCeuUl0Z1OkWyRC3Aozt/mByOyz9sgmvcqKFHgN7ExCwyHjY=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R511e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=tongweilin@linux.alibaba.com;NM=1;PH=DS;RN=5;SR=0;TI=SMTPD_---0XEUf1sP_1794298765;
Received: from x31l07246.sqa.na131.tbsite.net(mailfrom:tongweilin@linux.alibaba.com fp:SMTPD_---0XEUf1sP_1794298765 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 10 Nov 2026 16:19:34 +0800
From: Weilin Tong <tongweilin@linux.alibaba.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Weilin Tong <tongweilin@linux.alibaba.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] mm: kmemleak: avoid long RCU read-side sections in reports
Date: Tue, 10 Nov 2026 16:18:25 +0800
Message-ID: <20261110081828.2446101-1-tongweilin@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20261109211709.133122f9f10091f06c4acbc1@linux-foundation.org>
References: <cover.1793871596.git.tongweilin@linux.alibaba.com> <20261109211709.133122f9f10091f06c4acbc1@linux-foundation.org>
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

Hi Andrew,

Thanks for the review.

Yes, this was observed while reading /sys/kernel/debug/kmemleak on
our downstream distribution's 6.6-based debug kernel, without injected
delays. Here are excerpts from the original log:

[1023772.105996] rcu: INFO: rcu_preempt self-detected stall on CPU
[1023772.152485] rcu: 	(t=65047 jiffies g=357990333 q=711371 ncpus=96)
[1023772.491019]  get_object+0x1e/0x70
[1023772.501186]  kmemleak_seq_next+0x91/0xe0
[1023772.512982]  seq_read_iter+0x482/0x1160

With CONFIG_HZ=1000, the grace period had lasted about 65 seconds.
I should have included this evidence in the cover letter.

You're right about *pos: it does not advance when get_object() fails,
so an unaligned position can miss the periodic checks throughout the
skip loop. Our deleted-chain tests checked safety, but missed this
progress issue.

I'll address this in v2, preserving safe traversal across concurrent
deletion, and add targeted coverage for this case.

Thanks,
Weilin
