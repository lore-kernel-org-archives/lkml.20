Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E215964FC
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 17:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788888934; cv=none; b=dxQJy2irTR9NNwHpr37gdT8IlU5BwPlNaEyyXGBAoTzikJraQSuSgSjOg+GAJhZiSMEDMKsW6oS4suMZ2I9HeopB0UW8h9NFrK0qXBwSCm9qYiFcDWTlUR8U7re/qmWxCWM0/IOfTx6UA48CEfSRU66NWccXeN8T6MtxWicPBUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788888934; c=relaxed/simple;
	bh=tAG8Lue9629kNalgMmNSSsTdNoA1itsPONjX7pCfh5o=;
	h=Message-ID:From:To:Cc:Date:Subject:In-Reply-To:References; b=SwXQLDE1raApJvKaiAJ9TcC4aZAQKClyH/JlqMnNli/tmE370IVvwwDUGfQHDwv88Q5BeARqaZr2jpmoAFglRjIP9yX4gfyhYB5oI3/ZaEhJMrLALdpM0LH4NY8FBdkUaXF/8CwFzyknm2/NSQ6CJSmU73azhU1p7gBjqVTLx5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fmk34loo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fmk34loo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3579B1F00A3A;
	Tue,  8 Sep 2026 17:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788888933;
	bh=kweM/m7GAV6aw6QrzV1oCtonVvC2T+OVbj32EAz2knw=;
	h=From:To:Cc:Date:Subject:In-Reply-To:References;
	b=Fmk34loondlloZRfd8F/RSBDV7XQ8BJtAW35kEPdE97NUZcYo+KfIxTV58UfiHJwy
	 Ussfeg/Likkf8dIfApzXIBrr+bIj6romkr/UpQpliFeZ6xU/h36MSG79eK55RqTNg9
	 8DVYHjDujGgL9GNj4usaAxs1bxG5ZDa38S/7VvxgiAi+iTAq/UT/c1fkiy3WPiMjQi
	 cFao7OvLti7dw1RGGrJhi+bxYeedY15XqBIMkTOO1zv9DJZS3SxnhSB9MEyHOK+U3p
	 RqKWH+ZxpbhM4k1Qr1guknRL3lXkglJenAHMMjRYbO2hDflPynBrveu76HupBkxQS8
	 icvYroSZljl+A==
Message-ID: <0674544ccdfa9cdc68d848fbed3f8f4b@kernel.org>
From: Tejun Heo <tj@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Lai Jiangshan <jiangshanlai@gmail.com>, Breno Leitao <leitao@debian.org>,
 Yao Kai <yaokai34@huawei.com>, liuyongqiang <liuyongqiang13@huawei.com>,
 Tejun Heo <tj@kernel.org>
Date: Tue, 08 Sep 2026 07:33:16 -1000
Subject: Re: [PATCHSET wq/for-7.4] workqueue: Make flush_workqueue() cost scale with active pwqs
In-Reply-To: <20260901210929.3092513-1-tj@kernel.org>
References: <20260901210929.3092513-1-tj@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

> This patchset contains the following three patches:
>
>  0001-workqueue-Add-for_each_node_with_fallback.patch
>  0002-workqueue-Maintain-pwq-total_in_flight.patch
>  0003-workqueue-Make-flush_workqueue-visit-only-pwqs-activ.patch

Applied 1-3 to wq/for-7.4.

Thanks.

--
tejun
