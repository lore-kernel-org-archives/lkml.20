Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C37334D4CE
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 17:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788888072; cv=none; b=DkfqRMg5TXyf+30DmQIkhiKAzMG/QE8PXpBRIOYG0Cd37RyJ+gb/y9V5NlxuksbyWo9h4aQULDaskh4HBbg89fr1HXkjtkgxpNI3s4sStVOeIkGKea3iE8e2HlCgwBfBNiRXDn0sV3ZBlAzaGXH0+6lZtqIjmzVKXRfl8T5t4z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788888072; c=relaxed/simple;
	bh=XqCrvpPr7Wlfw8QLYqvwPScbQmSXdxP1mItvqh8i8z0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jUIceeGaW3ZP+cE59qGgK/czkW8t5XJEaV1iLAiy/dW3Dcl7YiEPBVySqQOCXqhOCwbTQ0w3ZKmGPnr/Ek1RPdKURdMQqsZ84juoHCob7W4a0zf078lsg8djZG8pvU4ns86hfhs7FpRwRe7QBFhp757bcumj9kgqXR/vprb3y78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E+wR46kc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E+wR46kc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95F871F00A3A;
	Tue,  8 Sep 2026 17:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788888070;
	bh=1/vb7Cc4kB0hzrF0Spe/++h9XI0PZHyqTHHB7O77o2w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=E+wR46kc7c/0P11JxZJ5o+P5ov8Hp15jaC9PG6Rg/aKjIMXDSONQFsZ3bDFzycbXj
	 9QMLjn7oxUc6HYbCR+G94tcrBwPWZFku3sCi/mPvVZHuXW10YvZz53ujEguJaH67wf
	 mn5pmAYfX0SAqG5BuAIWKVewazSBRP5kT4j7wVtiBG/xyl3PHvxIx2K/Q9UXwDy8gm
	 Jx2KeEAqeRszizUKmWPC8QWiS2RLk1x55j5HC30aQbWXgM5Wvs4VTd+o54qxqnOFtb
	 HnzrIH7tw34CW/64JXj04qcG7ehHv4iQAyIvvNJBqz6sb0NhgwCTbiRvHc0Dn7PjRi
	 Y1jByMVcdAkMw==
From: Tejun Heo <tj@kernel.org>
To: Hemanth Selam <hemanth.selam@gmail.com>
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>,
 linux-kernel@vger.kernel.org, Bradley Morgan <brads@mainlining.org>,
 Breno Leitao <leitao@debian.org>
Subject: Re: [PATCH] kernel: fix typo "upto" in comment
Date: Tue, 08 Sep 2026 07:13:02 -1000
Message-ID: <178888758275.2.16639051884520853687@kernel.org>
In-Reply-To: <20260907062338.10890-1-hemanth.selam@gmail.com>
References: <20260907062338.10890-1-hemanth.selam@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hello,

Applied to wq/for-7.4.

Thanks.
-- 
tejun
