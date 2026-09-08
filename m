Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8831B5519B0;
	Tue,  8 Sep 2026 13:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788875923; cv=none; b=ZdYwvei7axCXjK4+wYUwjl/gMKKrHVy1Uf/qV7vp5KqSyRzSjq7ZkPGhXcUYJCaj5fh2PU4f9DtWqWtexGRQbYHwzchAj1itzKsFcJYgSB+zyLQZguuAu1qh7kXQIkhXenWlxZiGfndR0E2TTzPQ2jzQh2dy1WKv4DJiBiDt9Ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788875923; c=relaxed/simple;
	bh=u7bq+aVY6Thbk8JHy7csRZZE3peS/+hq5NLfEKSrhu4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=cABpwl/sf/5ecf8jepURcoAp4Rd4P3WbB2YlY/vUwxnrSRxJgUhZfBRC5fVwQPnb3kL/r65GrPeHJ+UUhXryAv1mhCAJQq/TajGXJ11+VP95YCNM52GGIt6kPEBHlSty6bnxPkEinX9srDqNcflggGYnXkZYfzk09w1ugZkVaiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAA831F00A3A;
	Tue,  8 Sep 2026 13:58:28 +0000 (UTC)
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Hemanth Selam <hemanth.selam@gmail.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260907062930.18120-1-hemanth.selam@gmail.com>
References: <20260907062930.18120-1-hemanth.selam@gmail.com>
Subject: Re: [PATCH] soundwire: fix repeated words in log messages
Message-Id: <178887590825.2104350.13530437090644031001.b4-ty@kernel.org>
Date: Tue, 08 Sep 2026 19:28:28 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Mon, 07 Sep 2026 11:59:30 +0530, Hemanth Selam wrote:
> Drop the words written twice, reported by checkpatch.pl as a possible
> repeated word.
> 
> Only the message text changes, no code changes.
> 
> 

Applied, thanks!

[1/1] soundwire: fix repeated words in log messages
      commit: 1f26ff6aab686c5da7ef749bd14049d1eb3029e4

Best regards,
-- 
~Vinod


