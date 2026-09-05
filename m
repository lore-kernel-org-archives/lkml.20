Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10A6F23D28C
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 00:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788568368; cv=none; b=dR+jvEecZ7aIK7tmzyD4jgtioi9mfwkC4ShxGII4lHsdAsNqn6lbXRoaz36Uhqwl8LYM4lyofzZVMqO9XSNSS7F6Vald3jh6lxs+ilW64YROLoeW57CtwBz/cxVS3UZiirOd5PviO/gRZVulzjXTgdilgYXKkq7JaXh+tmlGod0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788568368; c=relaxed/simple;
	bh=LzifNNzyxob20MAj/BylBsNG5hVA47kSF0gkQmEZc5E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fa0yS5IJcVzvaTs527U1Pfy7MWCsHQYZfOO0K2faZU5xkOTWYa3dgPHmQOL3mbEo+NoN+xrNqzqTtFUK2qyv3fQy4nMaZO+Ker1L+MCMVcAvo0lFp5aSmJamL0WJhOWzlxbFqj9GkAkfSMNtPk/n7KDe6awg9IvNehdPo8e7AHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kUmtwxlj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kUmtwxlj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FC931F00A3D;
	Sat,  5 Sep 2026 00:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788568366;
	bh=1ZGSo/wx6Gpxvgtz7JFDR5HrEIDwWaXUEU46GxXEPYk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=kUmtwxljSOu0DtqF3BOYN9BT2IjZ4jJJ+JTLIdMIQMrWWxAoIsxdUZMasEqJVxLLQ
	 mGrQLTrTouiXaN7SBI1hVjNLyHMtJySAI4KmRjBPGXH9PxdgoWcG3rA77atCMa1q4u
	 aW2phhFygK/YqRjEBWxTqrQBHuZuTV+EIn6PnOkvqxo22/aESSlTLw1XJwRyUAcJI3
	 mDAVIXuVyAlSn7sKLuvRie55QZAdRSudmW8BYPD4/wFua5+piTgdYCGpZovg0XRpDI
	 cTLkxKRN6OIWajWIu930OJg71DGZVBLnYdtXnITZzCe8+LLbNfgzlU7E/9Fy/pILtS
	 WMfoahHmzMO2g==
From: SJ Park <sj@kernel.org>
To: Ye Liu <ye.liu@linux.dev>
Cc: SJ Park <sj@kernel.org>,
	Michal Hocko <mhocko@suse.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ye Liu <liuye@kylinos.cn>,
	David Rientjes <rientjes@google.com>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/8] mm/oom_kill: convert process/thread iterators to for_each_*_rcu
Date: Fri,  4 Sep 2026 17:32:38 -0700
Message-ID: <20260905003239.68043-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260904083001.553587-3-ye.liu@linux.dev>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri,  4 Sep 2026 16:29:54 +0800 Ye Liu <ye.liu@linux.dev> wrote:

> From: Ye Liu <liuye@kylinos.cn>
> 
> Replace the manual rcu_read_lock()/rcu_read_unlock() pairs wrapping
> for_each_process()/for_each_thread() loops with for_each_process_rcu()
> and for_each_thread_rcu(), so that the RCU read-side critical section
> is scoped to the loop body.

Looks clean to me :)

> 
> No functional change.
> 
> Signed-off-by: Ye Liu <liuye@kylinos.cn>

Reviewed-by: SJ Park <sj@kernel.org>


Thanks,
SJ

[...]
