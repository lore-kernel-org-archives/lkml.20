Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 104FD12CDBE
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 00:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788568438; cv=none; b=hdIK4Zwv4X/2gSnld3zQ4bTRK5N1xbwb+2io3H6Sf7Mus7aRMwdwlLX2wT39gNoivtIuloxpmEe3wyD+HMczX9bReDgDkHoLIYIgPtrhK31+POkcv97NpY1XK6JC9R/lJGhDPTNGilE2a8j5yeBMJL2H2xZZXqv3EWM1r6WUK74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788568438; c=relaxed/simple;
	bh=MLuVVJrQjRRAIR5DHKZJITPTF+oS8VsUwfMDkNsMJRE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s5EiDgpgTqlgkBihjndQG5+9smRhT7/RTqbe9HMdf2zCpa/3D2sTSr8WAPOneRd/X37c+z8Ss2UjrUgzpJFwVBWhyAj9HWuIEAPtT8KDRBEzI2RwyE+Hp4GfR2kiWX/ftNwm0IoRPq4lL/xiYYW9pEgVQHFQPm8kYutbDKRnfZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fuLAAjU1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fuLAAjU1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 634D81F00A3D;
	Sat,  5 Sep 2026 00:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788568436;
	bh=lqZyjY0gACNKMPWrtd+e3HjlFJmM3ZqUfgqKWgfrELw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fuLAAjU1Zr15XoZgzochh9RKcgfbGmjnrD2DgRFc4BVfns4TsfrUYVA0QSol+DLIq
	 vZgM5+D7jNNgnldrfBhpm/LZk1lzR6Z+v03OegylJ5435xcPJYhwWF/eesHVzTFWLz
	 U9//6J/I+YA8mm7joFutE8d2t+klB2dkfvPHJEXTqyj3/VYjH7M8kt1jVcucqg4DFe
	 5kNyZwCb1x+v1T4V4o5bcGnhZWc/f0t3YyGiWK0/jtbHmAIEeizYME8IdJjWjIThOl
	 887CypAmZr2JxTbJdOkPbCxAuWYW3hdgXEnVp+KsxdhDfHB96qmlVV46sAQDbT1vQH
	 yAQB753xtbK/A==
From: SJ Park <sj@kernel.org>
To: Ye Liu <ye.liu@linux.dev>
Cc: SJ Park <sj@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Ye Liu <liuye@kylinos.cn>,
	Xu Xin <xu.xin16@zte.com.cn>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/8] mm/ksm: convert process iterator to for_each_process_rcu
Date: Fri,  4 Sep 2026 17:33:49 -0700
Message-ID: <20260905003349.68193-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260904083001.553587-4-ye.liu@linux.dev>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri,  4 Sep 2026 16:29:55 +0800 Ye Liu <ye.liu@linux.dev> wrote:

> From: Ye Liu <liuye@kylinos.cn>
> 
> Replace the manual rcu_read_lock()/rcu_read_unlock() pair combined
> with for_each_process() loop in mm/ksm.c with for_each_process_rcu().
> 
> No functional change.

Looks clean to me, thank you.

> 
> Signed-off-by: Ye Liu <liuye@kylinos.cn>

Reviewed-by: SJ Park <sj@kernel.org>


Thanks,
SJ

[...]
