Received: from mta0.migadu.com (out-9.mta0.migadu.com [91.218.175.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84AAC306779
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 13:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788181690; cv=none; b=cAMujLbqoTInxWNblmuBFiuqU7N+F2rfLCfmXmvEQT5Bt4LU/by8C6zpiQofp86HSVTMk7u7BhGOjMLpGaMg5+MNyISm6KxgqDzc1/3UhSbBe0xH79Zo89CpYAecjj1hG0q1S9jR0C7HH0REmgQ3dgsDHswbCMUMstH3a2uU4Cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788181690; c=relaxed/simple;
	bh=VBqI/IghHvC2RTrTY1+537dq4U8RmmQq+9ozBVZIBxk=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=JNyq98FvXgv6TxgUgqaOinydthED4Okh96XZDWmm8p3YchhWfv+c6DFCeGzUij2mZllHemSkNqSDVVdoqQVWu+dCz5Y0kzc9YH76AteZn6uPUlIcpdjZtuoyNO9L4EZ9qcn4ZVo3WcV6hokHDC9so9AAZ5DYo7bjBbnkqz7blHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=onjoQ/Oz; arc=none smtp.client-ip=91.218.175.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="onjoQ/Oz"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=VBqI/IghHvC2RTrTY1+537dq4U8RmmQq+9ozBVZIBxk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788181686; v=1; x=1788786486;
 b=onjoQ/Ozsf4mvZQQyi7j0UaXFoiPjs1PsNnu7QtsagNHViWhrvHZpmmnLr32yhUJgmigJK93
 AHxe9KfH7SfnPJtAO2dAQTrH+bQ00t2BWmIap+k7bHS3Qn/BRzpueRO31vM5bjFrn9VO80InJoh
 stpEyh7awf05HX2xhvoFtec4=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 371797c864099445;
	Mon, 31 Aug 2026 13:08:06 +0000
X-Mizu-Trace-ID: 371797c864099445
X-Migadu-Flow: FLOW_OUT
Message-ID: <5d152da3-bdda-4a3c-8067-f3a8b7d9f786@linux.dev>
Date: Mon, 31 Aug 2026 21:08:03 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: cui.tao@linux.dev, kees@kernel.org, cyphar@cyphar.com,
 containers@vger.kernel.org, linux-kernel@vger.kernel.org, cuitao@kylinos.cn
Subject: Re: [PATCH 2/2] userns: don't clear the install target map on
 map_write() failure
To: Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 brads@mainlining.org
References: <20260828091659.358700-1-cui.tao@linux.dev>
 <20260828091659.358700-3-cui.tao@linux.dev>
 <37ur33kehusvq7scjflrr3df6d36xtaminoricp6ituocpapef@3we4ql6o2ozz>
 <20260831-ammoniak-blaskapelle-abbitten-db32791d39b7@brauner>
From: Tao Cui <cui.tao@linux.dev>
In-Reply-To: <20260831-ammoniak-blaskapelle-abbitten-db32791d39b7@brauner>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



在 2026/8/31 18:08, Christian Brauner 写道:
> On Fri, Aug 28, 2026 at 11:51:10AM +0200, Jan Kara wrote:
>> On Fri 28-08-26 17:16:59, Tao Cui wrote:
>>> From: Tao Cui <cuitao@kylinos.cn>
>>>
>>> At the out: label of map_write() the destination map is also cleared
>>> (map->forward = NULL; map->reverse = NULL; map->nr_extents = 0)
>>> whenever the write failed and the extent arrays had to be freed.
>>>
>>> However, the destination map is written by the successful install
>>> block above, which has no failure exit; every error path reaches
>>> out: without having touched it.  A second write to a mapped
>>> namespace is also rejected with -EPERM before any parsing happens,
>>> so the clearing can never roll back a previously installed map
>>> either.
>>>
>>> The three assignments just zero an already-zero map.  Remove them.
>>>
>>> Signed-off-by: Tao Cui <cuitao@kylinos.cn>
>>
>> I agree this is a dead code but it kind of makes it easier to argue about
>> the correctness of the error handling branch. I guess I'll leave it to for
>> Christian to decide whether he wants to take this or not.
> 
> Nah, let's leave this as is. :)

Understood, that's a fair point.  I'm fine dropping this one.

Thanks for the review, Jan.  Thanks for picking up 1/2, Christian.
And thanks for the Reviewed-by tag, Bradley.

--
Tao

