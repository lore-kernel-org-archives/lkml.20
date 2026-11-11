Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=199.89.1.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794431152;
	b=q5XRouJ7An5OtUfwRr9U74Nur4/K4ppfCZPv+8PegUzDvvZ+fD/YcmOJVU/gaV16aCpi
	 4QCKTeOFY95/ou3hcxAY8rc6BpJoNqzvH1ZJbNx4kCC/1T9st82bNOcsvRy2HjB0OQSZL
	 T4QoHz0Tq6skF+qh/QmUe/BLzO8Miev5jE26yW3FLQaKJPvB05B9EtCbUrbLOs8XnOGAi
	 pYz5bDRRvYDt/FXv+aZAypbIqfXIsDI6kPjOVwbepuqiRF+KTycAtA+t1BFr4c7kPfllV
	 755VHCNmWwQ0vAkxTILWEq5Eh9iFAe/FNftgsF2/j81s2yx293I8p0Lui2R0eN4z+zA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794431152;
	h=DMARC-Filter:Received:DKIM-Signature:X-Virus-Scanned:Received:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=0aSno7noNI3FW3ofwPPvucH5lc3cIw8g/eaXqt7qoNQ=;
	b=baNim6OWoGDbYR/zC5HV2etV8d2fCLjjkjtTr0X8GTgfaRPKwfrnKdMbd8UIdTzh4gJU
	 exgRFFYnhR7MbczW5qTmRSf/5FghjamHgcFdnrdPLntexwNx+/j08rv2cih0UQUYA99pb
	 P57k3oJqbF0lR9spnKTrR189yYq8q9bPLHfw2mau7XrhXYju6WZ6RAimuOwrVIxe4HwRo
	 T2LM0yaw4SLd8B0zvHbaL1e+/GHKvongWnhw6HpQuit3KfV3EhX/lAtmiUhZCw+IUobqf
	 oznZIavU+zaQQFJzol6qXPFvew8LOTlyvj4Wit/WSuHpgZDDztH5y2EYR8ZcdXlUVJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=acm.org;
	spf=pass smtp.mailfrom=acm.org;
	dkim=pass header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=gmtvSXyZ;
	arc=none smtp.remote-ip=199.89.1.14
Received: from 011.lax.mailroute.net (011.lax.mailroute.net [199.89.1.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A12E606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 21:05:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A12E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=gmtvSXyZ
Received: from localhost (localhost [127.0.0.1])
	by 011.lax.mailroute.net (Postfix) with ESMTP id 4jPwzM3S0tz1XM0ns;
	Wed, 11 Nov 2026 21:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1794431149; x=1797023150; bh=0aSno7noNI3FW3ofwPPvucH5
	lc3cIw8g/eaXqt7qoNQ=; b=gmtvSXyZAzULjFu3WsxEBMz1MFlfs/DiPTsd1MdR
	GFOnWA1B9PbaIyqrqfen/ie+hdzjYVq1lvK8WgQfhVjPq4aQEuHi5a4mF/3KAeD7
	/TNNXwCEA5F4RKxgU1lnzs6UTeDlRIpRmCQylSkfKeGZT0b8qOwc+GcytdGwHC9C
	h85OLDOuF2prHZaf4B496313oOT49vOlZedvzamm81F1mtHYXTzK4dbhB+YJvYVN
	GlO+ij4HG+cdM4ucojU3q/ys6G9PhuQ3kfi/D4D5Z4E3goowz8WxzR4pMURU7y8+
	et+a7aa+p43QJahCdWuMGHubk5VkKLRTvPwoNYTMrHG/CQ==
X-Virus-Scanned: by MailRoute
Received: from 011.lax.mailroute.net ([127.0.0.1])
 by localhost (011.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id G7XAW8mVMgeb; Wed, 11 Nov 2026 21:05:49 +0000 (UTC)
Received: from [IPV6:2a00:79e0:2ed2:d:84b5:8550:bb39:9920] (unknown [104.135.182.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 011.lax.mailroute.net (Postfix) with ESMTPSA id 4jPwzK3DP2z1XM0nq;
	Wed, 11 Nov 2026 21:05:49 +0000 (UTC)
Message-ID: <c4f5a8b7-340f-4bba-b874-8956215a9c1b@acm.org>
Date: Wed, 11 Nov 2026 13:05:48 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/14] Stop lockdep_assert_held*() from assuming lock
 ownership
To: Marco Elver <elver@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Waiman Long <longman@redhat.com>, linux-kernel@vger.kernel.org,
 "Paul E . McKenney" <paulmck@kernel.org>
References: <cover.1793654853.git.bvanassche@acm.org>
 <avROwpyToVNLOolq@elver.google.com>
 <40be79da-af73-480e-b3e0-155173f3ad28@acm.org>
 <CANpmjNO51WYife2NhvS08n2En0WjP+XOzD9Mtjsj_Hc=_nw0Qw@mail.gmail.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <CANpmjNO51WYife2NhvS08n2En0WjP+XOzD9Mtjsj_Hc=_nw0Qw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/11/26 11:14 AM, Marco Elver wrote:
> The point was that the Coccinelle script could be used to add those
> annotations tree-wide. We do not need to make the lockdep API worse,
> if the legacy-code problem is solved another way.

Coccinelle is way too slow to be run every time the kernel is built
and hence is impractical for implementing compile-time checks. I'm
not claiming that what I'm proposing is ideal but the approach I'm
proposing ensures that all lock context checking happens at build time
and doesn't increase the build time noticeably.

Bart.
