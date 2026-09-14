Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E2B3A6B9A
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 18:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789411800; cv=none; b=P6FbZHl6M3Fyt3/BuXgmC3Md6/IUKS/CgcaDB24naV7beFpG0PUBgk2rlsJid/z8wwunyWsVjobZeFr5TjuI6fmV5VjfMhliuzzQ6a1SQ4cIVxn48NZpegBeaXQduwtusMJPZTGbluXTQNsiJjUz1tOQzxAdAPaH9K0mQQHYu74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789411800; c=relaxed/simple;
	bh=dTEB7jHCZIGb3s8n7cHMenylPff/cDh3KM7G/7WhDdM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RsGXqKWVNMPJq0E/FJxpiQnq+rGqEruSh9AFimxb61a065Nn3mEEbV5mHy/4IHZWEnPqU72rMwRTfU/mecPg7tjctYLxovC3dIYPamIYkdM0/yYdZuzNDQroXey3OMgV4o75EbCnoyBW702qGUd2C6Iqb8f4aH5HOKWB0yykUuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b=NpPwfYsK; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="NpPwfYsK"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 5FEA2240029
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 20:49:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net;
	s=1984.8680eb; t=1789411795;
	bh=dTEB7jHCZIGb3s8n7cHMenylPff/cDh3KM7G/7WhDdM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:Content-Type:
	 Content-Transfer-Encoding:From;
	b=NpPwfYsKZ2eKirQUZ6P7niHgYD6huYWFLQI0M2ujkVSfS+vIHwcRtDzjErF9D+Djr
	 4Q6Si9PuB578+inRuFc4Wq9GODJZG8EgXFkVpQ3vuYQo5dGhAWgqonI4fxwqV9usNB
	 IdLguSAXdmli2NjZpr0Id2Evfr4mD+S7gjEk5Mv9pJMQ9ObBuFMUVvAuzMT87ncb9x
	 MQC9B6bv85+b0XUCtRNFeLgQYU9PhRHqpJC6cLpZ5QwvKmAVg7Fbu+b1NJBp2AiPjL
	 Wue70igWxh2EUss41ThqbHAsINSmGlqPlIPKamjNfw8v7cAC6IOS49M+D5tRhErHwo
	 UhYWHq3kAGW8g==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4hkDjG26sFz6tsg;
	Mon, 14 Sep 2026 20:49:54 +0200 (CEST)
Message-ID: <cdd43477-ce5b-4c7f-aba5-1bc323c8172b@posteo.net>
Date: Mon, 14 Sep 2026 18:49:55 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] nvme: bump genctr when cancelling a request
To: Keith Busch <kbusch@kernel.org>,
 Mateusz Nowicki <mateusz.nowicki@posteo.net>
Cc: axboe@kernel.dk, hch@lst.de, sagi@grimberg.me,
 linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260913124053.86565-1-mateusz.nowicki@posteo.net>
 <aqgHGefyCPcoNoB_@kbusch-mbp>
Content-Language: en-US
From: Mateusz Nowicki <nowicki@posteo.net>
In-Reply-To: <aqgHGefyCPcoNoB_@kbusch-mbp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

> The sequence you're describing is weird, though. Your controller
> has fatal status, the driver hasn't done anything yet to recover the
> device, so why were there no completions available the first go around,
> then completions became available on the second? The controller
> shouldn't have done anything in that time, nor should it have been able
> to since Bus Master Enable was off.

Thanks Keith for the feedback. You're right, vnvme (a virtual NVMe
endpoint I use to create corner cases that are hard to reproduce with
publicly available drives, like delayed completions) ignored BME, and
that is what produced the late completions.

I have seen firmware that ignores BME too. Unlikely in the field, but
the question is whether the driver wants to be resilient to that class
of firmware bug. If not, I'll drop this and can test the unconditional
nvme_disable_ctrl() variant you suggested instead.


