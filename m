Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792519956;
	b=b7hO/nz4RGWgOcp1rzd7ptCgFgNZ6YtHWZzrfR9LFtcsCMS6pzST0RiVUkE9KcKAwO05
	 D+KEQylnXah+yWdCssZf80wrLEiknrOvFGKoqHjSgtZxkOOEnoeQUtkL4q4E5VVpcoPe3
	 j/PysSJm/eB4QHcWtvdm50qiwHiZwUJ4MpRPkqRICzt3OfiKc8DwO1s+KRSM18ygzUjDw
	 HshWst7apGKUkm3jDzt13Jsh0SLBtoHdFSzX1ZEXLJZuhpj00AiVv6K+zyleNUZl048og
	 iaAsoW5LYVCzyqI2ytPfqACmpfuBw4lI8eE1huFmhXXqND6oieneAGmsA85uPVIIszQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792519956;
	h=Received:Received:Received:X-ME-Sender:X-ME-Received:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=+C6ycQ+oN+TYj3nNGaZ3QZSlDcpsWKcnMQlN4CBAL9Y=;
	b=wPqy4wioa1VDhmRIcBu1MlamSMMNjPizYb8K+2EaTr2u3lMfNthjvOF8Yu03qxS7ai2c
	 cOPenmzbz8NVIp3POUyn6G4mQozwuB5Ub6so50IyH9AWi6yxfMJlPr24RQG8NKAIz5qG3
	 tIyOPtS1pW4/2butnvbuQt3/+n1I3eJVngLhTIwHe9HH61EqXSbhh1nevRKZUDy93e7I9
	 mrhKNELnzfTplPAaMPPZgxLv8Ns5sRMSq+lEyJ4njNWe+Ycrg2O3fFsgiMsNeHm4KXpji
	 7kWVl00WbK/fFKf6z60UoHq5B7GT7XVTZwhgcv6YF9D9D80LS9heIQjHsTMLsozWXqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B3F60A260E
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 18:12:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 719321F000CB;
	Tue, 20 Oct 2026 18:12:35 +0000 (UTC)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id 7E6C1F40069;
	Tue, 20 Oct 2026 14:12:17 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Tue, 20 Oct 2026 14:12:17 -0400
X-ME-Sender: <xms:Aa_XagYWLbjIYt_N_Nd6PU6YenTgPJwHyxKupEWzyIvelwxhvG2SMQ>
    <xme:Aa_XagScVeuXk0nFCFn7sjl_9Dki1cqHICiR7zLtasyDx51-hLqM3yB3NK-dsztJK
    J--SCgUzH4WCCpLZWTR6-BZfJcL-NxTpSl2dqDm4Prf9X0tw6gvOto>
X-ME-Received: <xmr:Aa_XajhOm5xD-7qNcI8z17gKOm-AJckSRzpsQ7djYCaQo82uWuPiOhz_BAhFpTs938xmTSb3To-2Xl1JY0rnDb-AP8fsrLyY>
X-ME-Proxy-Cause: dmFkZTF3CR5tUIMrZT4IWXUrbzvyIKYP26OXYm9gMSu9uTliunqceHPYsDYXzCwrrtaqYe
    lYjVXzusIy3LQ3LUtlsZk6dae6J0s0d3ZELRs741EOWV/lTF+MSl6ZUHFfvYwyBWlPEf4b
    sY9oZxEZFQUo2hMOUZTt3Sk/4XhbaWx+jBPI705wb9fEbFh9vJoH9bBeq+tC9glla4b5Kr
    Y1r9UbcC5uZjeGe/VSebLPOWT+W88IAOd4BIXsMTt6+V6GJbuY+rEgOOr82XWnMboMB0mp
    PoExY5thAeR5jzHGzxp7BvtA0A74yGkBlnUwRFgRodhgVUxxLtThffcKsY5fhtzyoObeTX
    A+XNeTtMZC/ppNUvL2tCekc4jBDS3JEPApSyGLnj7AuvP/TauOWxySWDB18uVKYMnJOlvx
    Jus+tztNJyB5kFAsJawJ0R3yuTgZkL5X8+shlxKW7KVRxIMp8MU1fRs/KeyXt+OEImkjcr
    qX79GYjjci1aobEaE/GuOj/eGRvK4l/uzod+MzxXlkkN/UCbfZllBW7ZxZYhW7f5lXVHL5
    8/rSFJX/FKs5XWdMAfP0qtCB4225SGLysM47bGn1noxGwXk1s53+gjv6Qfc4MdcPbQXxXh
    M9kL6m5kW0HYibZlGjQ17surEUVRBjbJVFzPWWWPzDOhE6P7yIjNJUAE9Nsw
X-ME-Proxy: <xmx:Aa_Xar7sCb7tzfxISUi4khRXSAC_bchX-AfROJon49I7Yz402e1p6g>
    <xmx:Aa_XaulnKOGtSvpQQG6sr9n7uy0RGR1JeZZUfQFl2u2paYcoZHQUBw>
    <xmx:Aa_XakN-zldHuTCuwAAYbGkC8L7BKL7sXWXiTKtJXJqRExSqXm4W0g>
    <xmx:Aa_Xaoqti-OIfajd8eWOSvRBhwifWLth0rCR632sY4R6TqDEixdfhQ>
    <xmx:Aa_Xalt29scg7V59JekhcwetldvIWbxh8yKDLyl1Di5NSG1o6WH3rBKf>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 20 Oct 2026 14:12:16 -0400 (EDT)
Date: Tue, 20 Oct 2026 11:12:15 -0700
From: Boqun Feng <boqun@kernel.org>
To: Bart Van Assche <bvanassche@acm.org>
Cc: Vlad Poenaru <vlad.wing@gmail.com>, netdev@vger.kernel.org,
	Jamal Hadi Salim <jhs@mojatatu.com>, Jiri Pirko <jiri@resnulli.us>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Davide Caratti <dcaratti@redhat.com>,
	Breno Leitao <leitao@debian.org>,
	Nilay Shroff <nilay@linux.ibm.com>, linux-kernel@vger.kernel.org,
	Vlad Poenaru <thevlad@meta.com>
Subject: Re: [PATCH net-next 0/2] net/sched: don't wait for RCU when
 destroying qdisc lockdep keys
Message-ID: <ateu_3PV81VuFK1i@tardis.local>
References: <20261019170225.729789-1-vlad.wing@gmail.com>
 <atZtYi_Xnz27O8Bp@tardis.local>
 <c3de29a9-8edf-4186-bc26-82d1d68c4c78@acm.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c3de29a9-8edf-4186-bc26-82d1d68c4c78@acm.org>

On Tue, Oct 20, 2026 at 10:26:31AM -0700, Bart Van Assche wrote:
> On 10/19/26 12:20 PM, Boqun Feng wrote:
> > I think my concern is still valid: for lockdep PoV,
> > lockdep_unregister_key_nosync() is an API that users have to use it
> > carefully, because it leaves the unregistration process in a stage that
> > you need to guarantee that the lockdep key reclamation is delayed by an
> > RCU grace period. Or in other words, do you have a way to prevent a user
> > from doing lockdep_unregister_key_nosync() but kfree(key), or some sort
> > of debugging to find a mis-use?
> 
> Kernel developers are assumed to know what they are doing. A clear comment

Well, if that's true, why do you need lockdep :) If developers know what
they are doing, they should write no deadlock or prove that in a
comment.

Is there any context that I'm missing that you want to shut up this
discussion and rush the change in?

Regards,
Boqun

> above lockdep_unregister_key_nosync() should be sufficient.
> 
> Thanks,
> 
> Bart.
