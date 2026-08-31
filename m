Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6D7346DFF6
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 17:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788197454; cv=none; b=hn3w5tA6d+MGVr8c7fbNm0Tf5ANT6CJqI0+wawemjRclnsvsuv7Zvq+fsqnlv5pivsLm7fJelYrMc0tYeKjD7pPgPegiWd6iksUiSHmJjlJyKMbt5qRsh3toxYTpm3uSemqSzI0PB5LwwQ1/WZtKnLDOc9ZJkYvtSLZVa3ESRRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788197454; c=relaxed/simple;
	bh=TPxfmVITnJAC7XH19Z25TGAKWjN7Qa3bTlZkWUxxBl8=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Date; b=b7zhhQSDWts2oNPd1LEMg9tyLiOOCYZFTzdrNF5DZewmq7ydgTRqKtCwgZYeqndj+P0vqIEq0is9kz6gXs8CbHYvtEsVef+wKGky2kXQTkTYRbvEIr1drI3MbOD+pYA10hnGXS2SqlFKWrDS7RCCDZx8hXpgg1BbZbxrAeNeAsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YMNynLF2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YMNynLF2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD8E01F000E9;
	Mon, 31 Aug 2026 17:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788197453;
	bh=TPxfmVITnJAC7XH19Z25TGAKWjN7Qa3bTlZkWUxxBl8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=YMNynLF2mTTpTRkHIUIDztm1G8IwD2R6mIOuLwjgMPxjEqGX+z9MhWbKlnAQWQZlV
	 m+xDuqbD1dxLj7E1hJciSlVIEOfp8XphFUBo0BlqoEgNoKoimq9vkP/PRXqdtK4273
	 ZAh2a/dASFDeG9DaKw7bwaeTr4f1b3O9BYtmL0b6kYaM0NizT6PwqZWFTBEfWAekju
	 1d74+wtQRA+i4cSQiZhhKkk2B5hC/UMBfdsuY0uv54yXGN5HuwM6LF2xz5ThRfLWIQ
	 kY7lT25LCy+AOtCPPwbtu45b2lW4T0aCwqb8zHruvafeSefKN0MR3iPyVI6ZAgb2Pn
	 igi7W+/w4VBJw==
Message-ID: <3fb7f42e44d4803dd9a492bb2089d587@kernel.org>
From: Tejun Heo <tj@kernel.org>
To: Yao Kai <yaokai34@huawei.com>
Cc: jiangshanlai@gmail.com, linux-kernel@vger.kernel.org,
 liuyongqiang13@huawei.com
Subject: Re: [PATCH] workqueue: Fix unbound pool lifetime for pending pwqs
In-Reply-To: <20260824035852.2727765-1-yaokai34@huawei.com>
References: <20260824035852.2727765-1-yaokai34@huawei.com>
Date: Mon, 31 Aug 2026 07:27:48 -1000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Hello,

Applied to wq/for-7.3-fixes.

Thanks.

--
tejun
