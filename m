Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=199.89.1.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794934439;
	b=2NEp2smvOiRPkOy4s8lsw1eiACnOkpzfyssW0b0vCxr+zMCEtzDgVFtNp68Qee5UPC/Y
	 V5anAJz9R+scKHbw2+i0Dfd2zgYDYZdV38le84K2wHETTpGrsTNbRzB+tQuqyBWARqVXS
	 WZCT8pJHKKMRuD9YEqQKIXD/ddlOOI8GiDitAHt/D/U6RLwgEM8pYaaYs2Rxg2B3wGa+W
	 noCMCI2AmHbsGVOecapiZbieh96fOsJ5RKJX7Kt4ZrlPH6K0M0uUXfXb/JBfs9bZs5Nk4
	 cRE/SAJXJjVdniq304JiFOab3EoF7ePKPlBUQcTZL00UeiN0rkOIUrOEgd9HypEm2zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794934439;
	h=DMARC-Filter:Received:DKIM-Signature:X-Virus-Scanned:Received:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=fRlYlAiWGBkXuRMQpSo2yb5ayhryL862FXRyTIc4wVA=;
	b=LqJ+IpTYalUSjzRXccIIyS07j0KpcwXaHPwo9hVzKS5ZljlsEChlXN7dK3+HUiFBEzxT
	 sW2sX29m6MxBCJUe6q+3i2OSGVO0UXMIUQuPkjOSSU5bTSGVy79RMrpVebec8PtPRO8ER
	 S5f/DuYv7Mxdag2vBZZEmR1oHigxyRd211Vn119k58edLzrY3rI3dSn1pTWhpP4YhTJIQ
	 x5ApnjyDuaVcVRgrhYFzTFODvwmM3WkkFJ3QN4HHK2irhbfo8rar82zBrBE2NzZRsAaOJ
	 SvecAskTJjhzupH5TMMgGTdXSdI+ygIGHxRVCbpnLV5vX/7gyS+Q283pLsEgCduwWdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=acm.org;
	spf=pass smtp.mailfrom=acm.org;
	dkim=pass header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=Eya54bto;
	arc=none smtp.remote-ip=199.89.1.16
Received: from 013.lax.mailroute.net (013.lax.mailroute.net [199.89.1.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4404606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 16:53:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4404606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=Eya54bto
Received: from localhost (localhost [127.0.0.1])
	by 013.lax.mailroute.net (Postfix) with ESMTP id 4jTW5y1cW2zlg7KN;
	Tue, 17 Nov 2026 16:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1794934434; x=1797526435; bh=fRlYlAiWGBkXuRMQpSo2yb5a
	yhryL862FXRyTIc4wVA=; b=Eya54btom5lqTr6gaSzfno5nJtgMImY1EMyZthp1
	NRpGgCwUxCGhxZY7xHBfUWzEi94rwTJwewfaC0i2OA405KEJUubnJqTQNHfKMNIg
	ZIsrsRmiTgjRS0vJTdu5vfWdCjuCyyHbwZrxzptClwGA93rUSIt0wX8G7lbellrX
	gGgIinhDM25+6ORQ71h9PCsJirDMxqRqBEV7StlmUcdXQoZQ56mDnmPn39kR152x
	+gDsWDWeONxg1KeWyHC5C99cmaBOnY60kvB4oTRku5dkw6M/++A396F9jYN62bhy
	clfqLRkCdsyO1G5jq7wn8urMcH3EcKd8ZmC0LBEDOmkL5Q==
X-Virus-Scanned: by MailRoute
Received: from 013.lax.mailroute.net ([127.0.0.1])
 by localhost (013.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id vT9_LRv0NaxA; Tue, 17 Nov 2026 16:53:54 +0000 (UTC)
Received: from [IPV6:2a00:79e0:2ed2:d:44bf:cc75:7d8e:9159] (unknown [104.135.182.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 013.lax.mailroute.net (Postfix) with ESMTPSA id 4jTW5s72w2zlfcpp;
	Tue, 17 Nov 2026 16:53:53 +0000 (UTC)
Message-ID: <c935da68-bd05-46b1-b837-e62cda95c0ea@acm.org>
Date: Tue, 17 Nov 2026 08:53:52 -0800
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
Subject: Re: [PATCH v3 3/3] srcu: Remove check from srcu_dereference_check()
To: paulmck@kernel.org
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Waiman Long <longman@redhat.com>, linux-kernel@vger.kernel.org,
 Marco Elver <elver@google.com>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Josh Triplett <josh@joshtriplett.org>, =?UTF-8?Q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>, Nathan Chancellor <nathan@kernel.org>
References: <cover.1794869902.git.bvanassche@acm.org>
 <8114def6bdc259f670f3d84f3ae0dad6809cd6c6.1794869902.git.bvanassche@acm.org>
 <723856b0-e1c9-41c7-a6d3-32a45ef1f88a@paulmck-laptop>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <723856b0-e1c9-41c7-a6d3-32a45ef1f88a@paulmck-laptop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/16/26 4:51 PM, Paul E. McKenney wrote:
 > Should we invoke __srcu_read_lock_must_hold() conditionally, only if the
 > value of c is zero?

Hi Paul,

Thanks for the review. I don't think that would help. The Clang
context analysis is a compile-time analysis. It does not know the
runtime value of 'c', so a conditional call to
__srcu_read_lock_must_hold() only behaves differently from an
unconditional call if the compiler can evaluate 'c' at compile time:

- If 'c' is the constant 0, Clang removes the always-false edge and
   the call is checked. This is what srcu_dereference() does with
   this patch.

- If 'c' is the constant 1, the call is never checked. This is what
   srcu_dereference_notrace() would get. srcu_dereference_notrace()
   calls __srcu_read_lock_must_hold() directly, so it keeps the
   check.

- If 'c' is a real lockdep expression, e.g.
   lockdep_is_held(&foo->mutex), Clang can't evaluate it. The call
   stays reachable and is checked. That brings back the false
   positive for update-side callers that this patch fixes. With
   CONFIG_LOCKDEP=n, lockdep_is_held() becomes
   ({ (void)(lock); 1; }), so the result would also depend on the
   kernel config.

I checked this with a small test program built with clang
-Wthread-safety:

	#define deref_check(c) ({ if (!(c)) must_hold(&s); 0; })

	deref_check(0);                 /* warns, as expected       */
	deref_check(1);                 /* no warning               */
	deref_check(is_held(&m));       /* warns: false positive    */
	deref_check(({ (void)&m; 1; })) /* no warning (lockdep off) */

A conditional call would also evaluate 'c' outside the lockdep
checks, so it would run even when lockdep is disabled. Today 'c' is
only evaluated inside __rcu_dereference_check() when
CONFIG_PROVE_RCU=y.

So the only case where the conditional call helps is a constant 0,
and srcu_dereference() already covers that. Callers that pass a
literal 0 directly to srcu_dereference_check() can switch to
srcu_dereference(). The runtime check is unchanged: lockdep still
checks '(c) || srcu_read_lock_held(ssp)'.

Thanks,

Bart.
