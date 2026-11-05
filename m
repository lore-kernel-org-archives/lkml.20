Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=199.89.1.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793898058;
	b=oZbKle6gJ5+mWY19bgDqS9cmaCiUhQHdqTupE20ILxBuHaJuwXcWVv02dYv4S/GgVR4I
	 JOoJdtoUIk/51wvi8NAkPeU3Qun1bzHpcoEMrCVjVePijmeCBgyRgOvIMRxGZEHm8V20d
	 VkveqyDGMe7SM7nJk3B3D9LfYfaIwc5h0rT9h4YXDu0FzyNm7k35RSNWv7fNnyNXBSvHM
	 +7LDBgO+9Oq5dZFFgeNyjTHmT6voje4OufY3bjlljk7y4b4ruo2ju16dFByo82mvBmPXn
	 bcpfDAmqGCfcjJUCfT0tOjBTEPqnS37gdqhS9DyIUqzBvBUhllyQveiMWnqI7rm5f1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793898058;
	h=DMARC-Filter:Received:DKIM-Signature:X-Virus-Scanned:Received:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=tbCUHl4y5HovwaUeMGq6C0bvM1RnT2yTQvcoQa0gqu8=;
	b=IScnnTG0ge+8jDBmGTCvWbw1SwXh/6qBOp58huAPGe8ompGY3/95ApX+84JxHV2QcZac
	 n+cnMbqDR48ATy6Njo2jxo4rJeya+3B9RL6XLfv6F5AySlW10Nyxn1Y1aDvnlmBfQ176j
	 OciapiFN11GbLi+smS59NbbYfkX/Xl105i0QirT3Dqp3IxUBnEQSFrmOR0OKeaEoim+Cj
	 d27JSdqxxXyhPZsGiY8qN6K6JKPCvXrnhbW6C7OMqbHqDZtRcHCrkaf4qatqjGNfS6j1U
	 WdEmxX3HyQdNnP+IiWkrvxcK37MhfwMDsnBIlz8PpZ0HUZKqUWLM/ozpRIXmJ7mxQLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=acm.org;
	spf=pass smtp.mailfrom=acm.org;
	dkim=pass header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=MkmhxjtJ;
	arc=none smtp.remote-ip=199.89.1.14
Received: from 011.lax.mailroute.net (011.lax.mailroute.net [199.89.1.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2742606D807
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 17:00:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2742606D807
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=MkmhxjtJ
Received: from localhost (localhost [127.0.0.1])
	by 011.lax.mailroute.net (Postfix) with ESMTP id 4jL7qX1HsPz1XMYJP;
	Thu,  5 Nov 2026 17:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1793898053; x=1796490054; bh=tbCUHl4y5HovwaUeMGq6C0bv
	M1RnT2yTQvcoQa0gqu8=; b=MkmhxjtJRjn9QPOg4MdlhkB/HIWmKnIWWU4nbAzB
	O9nlpYg8OPA1K2XG+TAQyxhUHkIo6b3/i+a+Etv00jlvvJtQJ6q3RCe4nRNYI6y+
	Jc01y2c1OMwu5C+z9ApgEol70AwACjVxaeEPo5O4zRY73Y+TsIjPahVFDHkyIlVC
	D8VHqtoh5XtPKYccWtGb34EC5HEek7IcpWb4gppp2zkP4mRqpLOrKmaA3bCOXZ3T
	mc3RL8AGIZRuk5hc7t4BX3pV91Rc9qu2cP0R1sZZEwn3JKKr9B62mZ2t6vHwGgOQ
	mKRFjwv4EMqIxzue+Xr7oRp4JIFVvprksQrDfy6LmKQKXg==
X-Virus-Scanned: by MailRoute
Received: from 011.lax.mailroute.net ([127.0.0.1])
 by localhost (011.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id M80NR6roc9QU; Thu,  5 Nov 2026 17:00:53 +0000 (UTC)
Received: from [100.80.231.125] (unknown [104.135.182.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 011.lax.mailroute.net (Postfix) with ESMTPSA id 4jL7qT3R9wz1XM6JB;
	Thu,  5 Nov 2026 17:00:53 +0000 (UTC)
Message-ID: <300807c3-7892-4c82-93c9-d069c7fe6208@acm.org>
Date: Thu, 5 Nov 2026 09:00:52 -0800
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
Subject: Re: [PATCH 08/14] lockdep: Introduce lockdep_assume_ctx_held()
To: Peter Zijlstra <peterz@infradead.org>, Marco Elver <elver@google.com>
Cc: Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
 Boqun Feng <boqun@kernel.org>, Waiman Long <longman@redhat.com>,
 linux-kernel@vger.kernel.org, "Paul E . McKenney" <paulmck@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Nathan Chancellor <nathan@kernel.org>
References: <cover.1793654853.git.bvanassche@acm.org>
 <71bc2361d8676f1eea3c945cbf21a0c2542d5b92.1793654853.git.bvanassche@acm.org>
 <20261105083746.GP2668804@noisy.programming.kicks-ass.net>
 <CANpmjNMaDwcm+tQ-cOUjnE3n+5x8WgB5CZ037uurbwVa4Jn0BA@mail.gmail.com>
 <20261105145844.GQ1813469@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20261105145844.GQ1813469@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/5/26 6:58 AM, Peter Zijlstra wrote:
> Aaah, so the 'solution' is to rename lockdep_assert_held(), such that
> the pre-existing annotation doesn't pre-pollute things?

Yes.

> But if you start
> by converting existing lockdep_assert_held() to the new
> lockdep_assume_*_ctx_held() you'll run into the exact same problems?

The number of lockdep_assert_held() users that has to be modified is
very small. There are only three cases in the entire kernel tree: futex,
kfence and Bluetooth. There three changes have been included in this
patch series. I have verified this by adding lock context annotations in
the entire kernel tree and by enabling lock context analysis for the
entire kernel tree. I'm sending the patches that add lock context
annotations to kernel maintainers as time permits. An example is
available here: "[PATCH v4 00/54] scsi: Enable context analysis for most
drivers"
(https://lore.kernel.org/linux-scsi/cover.1790360262.git.bvanassche@acm.org/).

Thanks,

Bart.
