Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04D8D3314D2
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 07:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790147945; cv=none; b=BZRkj6kYyk/Zx5lDkdQzD6lJiCShQBea6pvL1JfIqMGvPNxyNzlhwbYfl0Rjpucvs1z8tH8qReq2RPaF45iQh79oWMkyu46Sp+OjscWrItHLNJ1T5L9bC58c3WwWqLMUQI7R/jpnUPkd3HGZ6Ln/KK9JUZZnp/7iAJQ+bQ6LRb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790147945; c=relaxed/simple;
	bh=rYNhXNY9sXeWg8bHkzc4ViWau0owmg51LGJInuniVd4=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=US4zMCTx/rXalCfo4bP5u8QUDNzb+VPHdZLpeJWGJvUVIonh48wYsMYSFAkYLzvHXueGlig6BLoMQI60unwUi4IRuJBiptg6RZ9W9r8x/FA94tc9GYfafn06N1ymgOL7aNVlGB/LlqS6VCU6vTvT24+jMd9Vbj/IM1pbQ9Db0zE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wh5TQzDa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wh5TQzDa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6361C1F000FF;
	Wed, 23 Sep 2026 07:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790147943;
	bh=rYNhXNY9sXeWg8bHkzc4ViWau0owmg51LGJInuniVd4=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=Wh5TQzDaFlFh/3eIDQvw/pQ1nRyfPQCy0gprJJ/LhQLv2tOd1ORryRLy7I6lDi93S
	 x2HCtYHRJtdaAp7puiMmJpcwHnri89IAAQ5jteMKc57B8DbQIHRrFhIaNwAkGtEplQ
	 J9/NAg++jNlH6hSMLxriJOmpH+lNWvWoYBA7MftWa4iSjTP8NjywQMQK3XfwCQL9RZ
	 5HM222YR783+GXIw1bAuoWpay6QpXS7GYcXxTdK8VKKjfuIeuCnG6qB5uy+OCE7u6K
	 qo+EX8P2/hjSidkAmvzToX7V5Q8Z0EZiKGN1AV8xRlDYouD/JhTE3vDX8Hvf0cBIRD
	 oCMBh/BsW9nBA==
Message-ID: <d7a99050-74d1-4b31-b8f9-7502ac7a3785@kernel.org>
Date: Wed, 23 Sep 2026 15:18:59 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Jaegeuk Kim <jaegeuk@kernel.org>, Barry Song <baohua@kernel.org>,
 Juan Yescas <jyescas@google.com>, Dev Jain <Dev.Jain@arm.com>,
 linux-kernel@vger.kernel.org, David Hildenbrand <David.Hildenbrand@arm.com>,
 Bo Zhang <zhangbo56@xiaomi.com>, Kalesh Singh <kaleshsingh@google.com>,
 Nanzhe Zhao <nzzhao@126.com>, Pengfei Li <lipengfei28@xiaomi.com>,
 Ryan Roberts <Ryan.Roberts@arm.com>
Subject: Re: [f2fs-dev] [PATCH v2 10/14] f2fs: handle partial truncate of
 large folio dirty subpages
To: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
References: <c4e0c6d3-ad28-4e5e-a938-08b7658e9931@kernel.org>
 <20260923025035.2202070-1-zhaonanzhe@xiaomi.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20260923025035.2202070-1-zhaonanzhe@xiaomi.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/23/26 10:50, Nanzhe Zhao wrote:
> Thanks for the review. I think I may should change like this?
Seems fine, thanks for the update.

Thanks,
