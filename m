Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=199.89.1.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794601668;
	b=S0dePjocnLkQSl3pY8q2U7gQfbnpUlkHoDAyT+N5zavo6ROgFZh1vSJOXRnheWNxsP4a
	 qJlQlrVG/INtIKHPGTp03+AO6WIbxnNg3sB2PZ0PU5njxGNE9G+ol0WqvQDbJgt3zoK1J
	 jO0f/UVrmClgMfSJp8QGVw/E8pmwXvmtqBogU9B2105XsH0siF5tQmR6vv7nAz0GbIusl
	 HYh4ls/AVBEMMYRd5rlCaYIx1GCvXDxSIwqrO/vbpvbDKBZEHEevypgY1M5vVXBXNCI5L
	 ivEL+dvK+3C331X5M2ItT3zUUxZS/yWiWFO2j5+adzrNi13tyLPCq2YFSi/3ILotQ9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794601668;
	h=DMARC-Filter:Received:DKIM-Signature:X-Virus-Scanned:Received:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=xYdZ6tf5hf9eRe+dTg92xWoWDx+Pq4PlZnUnGHv+B0M=;
	b=iJOmLY7Q427BO9BoD4vk/8g4ClnDeRXF3LOuJbLUk4wjPUckVnTlXAmRX+9DBYKRV0xU
	 mTmKwDOKRwInpopqOH/kQhn9TMECrVPd+RuqKIrdKuIb+tKJEh0b/cW9KUUVSO4JNTKdk
	 PIZYIdOSXluSuAhro1TVJO7iLO4iiyGue3AgFQbhYBpM5u9X0BEkA4AOCHk/fcKWDvDd/
	 mN+NRU6cp2UqSHSOXJDk79lHmU2LceO6tTb+g4sm73YvGZ/sLu+2vJscuYmSSxJRuQei1
	 +41blKO+rb0QQMSq4y89JhYTCwv0b60SocTYA2jiCx5CHCNLhS82KoqqmWm24M16GkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=acm.org;
	spf=pass smtp.mailfrom=acm.org;
	dkim=pass header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=PyhHkMiP;
	arc=none smtp.remote-ip=199.89.1.14
Received: from 011.lax.mailroute.net (011.lax.mailroute.net [199.89.1.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77A3E606A33F
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 20:27:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77A3E606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=PyhHkMiP
Received: from localhost (localhost [127.0.0.1])
	by 011.lax.mailroute.net (Postfix) with ESMTP id 4jR82Q5kltz1XMG49;
	Fri, 13 Nov 2026 20:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1794601660; x=1797193661; bh=xYdZ6tf5hf9eRe+dTg92xWoW
	Dx+Pq4PlZnUnGHv+B0M=; b=PyhHkMiPSXi63kxtjpdu8KIOZ8qf78R0EhfqlWIq
	tRn0MwbvmgCzlWdYD7HqoX5WAWXeqmxuEtvS7HwLFKXX/XL99OMR6fttEuFJPwJl
	U/quWpjuftJmxrvs93OIgwpFhg8Jo8xdUjdPzji/gaeKuMq0ppir/TR+3oTtvNRA
	xM+R3P3amp0vCRkPfC76E3EKs8Un4lqTjgYbbvJmn/jllmrS1iK4pHs3PojDV+JO
	wiNZVw3s5T/01d8AxJWs+z5Ion5/A6SL49hyMBs4ndOXcG2u0VOJo66aVrpt0gui
	s+6wTg4m1HK8qloZJGwP3AyGpHSjcQBY2t6ttlE/T/m3Iw==
X-Virus-Scanned: by MailRoute
Received: from 011.lax.mailroute.net ([127.0.0.1])
 by localhost (011.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id nqrXo0Ejv2yD; Fri, 13 Nov 2026 20:27:40 +0000 (UTC)
Received: from [172.29.66.119] (unknown [104.135.180.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 011.lax.mailroute.net (Postfix) with ESMTPSA id 4jR82N3zckz1XMFx7;
	Fri, 13 Nov 2026 20:27:40 +0000 (UTC)
Message-ID: <b9f7b3c4-0af7-4830-ba35-60807677fc83@acm.org>
Date: Fri, 13 Nov 2026 12:27:39 -0800
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
 <c4f5a8b7-340f-4bba-b874-8956215a9c1b@acm.org>
 <CANpmjNNM=qBJMvBkRu-WbhKA0hnkb_Bk8fyF9DTTsVmENDvZuQ@mail.gmail.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <CANpmjNNM=qBJMvBkRu-WbhKA0hnkb_Bk8fyF9DTTsVmENDvZuQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/13/26 1:11 AM, Marco Elver wrote:
> I think it's as simple as running the Coccinelle script, applying the
> __must_hold* annotations that fall out of it globally, and we're done.
> In a few months we can run it again and see what else has appeared,
> but we should converge to 99% functions properly annotated and can
> move on.

I will drop the locking API behavior changes.

Has it been considered to contribute your Coccinelle script to the
Linux kernel in directory scripts/coccinelle/? Some kernel developers
run these scripts periodically. This would make it more likely that
missing __must_hold() annotations on new kernel functions get added.

Thanks,

Bart.
