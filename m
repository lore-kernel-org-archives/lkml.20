Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794079826;
	b=F4aCNUhGaK6zLatLenDOOguIMsBDZeQxNeLdgc9hIDVhQJNFcukR73mRsWXwoj9XINDs
	 Hv+O3Y27+Jr8lQMEd/dfSYiPhbIy9kG6yELgl7ci3Sg9VR8QmyxNHrLcB4Hj2UGGAii+O
	 tuJtRWJh5UwFhf8sP0oFSCsKoO2LHxDLjph4882rL2nev45vTwhpmyIS5V5/ozkaXLAFq
	 QyE13ItP0Zsn81Ne29mbGX8FQsAa7DCKG4ueknHfnMD0r9kCRe3FV8mFoBkLhO6PHpjY4
	 aPcbTWncMHPjE6hQrIxDIHwoM8tX4/C4c3G/1XJM2gcGuMs8xONrDz0T+bu6QQS53+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794079826;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=8g7cR/WfR/eUbHCF+GE50Sz7JEA0/fNnj5WKAgXjCvk=;
	b=Jd1YALtAA8EoLflzBIQe6VO4yGnhRT3+jF7weRHPGEZzqfVgLZTZV14cnjC5GcHOQe3G
	 Od3Z2YWyfH8elxvks7ymo20CQmxN+7GpT94smBbAsRGzoWNAqq0eNJythqqYrMthmdDM0
	 fJZvNrkviQXrcrxgIdjpgzkpH+xy0uFzYusPFlOVhLqkrfCZTx7v4LDaHpz84CEDndiw2
	 KaNyle2P3oMpRD+DDVglqGiYHddomqV4ofhwkh6FXZxhNCtFKYfhRx88N1coj/Z2cdew7
	 8I2jatQzNwQ3jct5ddB2q9735xLNoEQTQD6p+noThdoR3OStcj2Mw7zgm3xk6t6g1Gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=Iu9B80J0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD79E606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 19:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=Iu9B80J0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EA731F0089F;
	Sat,  7 Nov 2026 19:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1794079825;
	bh=8g7cR/WfR/eUbHCF+GE50Sz7JEA0/fNnj5WKAgXjCvk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Iu9B80J0GHvWl1iKythlXI69JWmaLbTzgDj3ALnFzjrBft32lr3EnGZnBO3SUlawO
	 TfKG9S4+LI/D2utxjyA3wmHmWyQEKfZu9jVfK+owsh8TT8eIE4f7bK11dF+zbJTF4f
	 aLv1aq7l4bkHFojQoj8y1lSPME3+EKwY6xgRyuBQ=
Date: Sat, 7 Nov 2026 14:30:22 -0500
From: Greg KH <gregkh@linuxfoundation.org>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/i915: Fix vm reference leak in mock_gem_device()
Message-ID: <2026110723-lure-fifteen-b69d@gregkh>
References: <20260916171935.2087305-1-vulab@iscas.ac.cn>
 <178962823827.28653.5098493516220452854@jlahtine-mobl>
 <1794071392.2684479.vulab@iscas.ac.cn>
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
In-Reply-To: <1794071392.2684479.vulab@iscas.ac.cn>

On Sat, Nov 07, 2026 at 05:09:52PM +0000, Wentao Liang wrote:
> Hi Joonas,
> 
> First of all, I sincerely apologize for my very late reply, and thank you
> for taking the time to raise these concerns.
> 
> I have read your message carefully. Your criticism is justified, not only
> regarding this particular patch, but also regarding the way I have been
> submitting patches to the kernel community.
> 
> For this patch, I failed to properly assess the severity and scope of the
> issue before submitting it. This is a selftest-only cleanup, and it should
> never have been marked for stable backporting. I also failed to pay
> sufficient attention to the subsystem's coding conventions and teardown
> ordering. These are things I should have checked myself before asking
> maintainers to review the change.
> 
> I have revisited the relevant code and revised the patch to address these
> issues. The v2 removes the Fixes and stable tags, corrects the subject
> prefix, and adjusts the cleanup ordering. I understand that correcting
> these details now does not excuse the lack of care in the original
> submission.
> 
> I also want to be transparent about the use of AI tools. The initial
> finding came from static analysis, and I used DeepSeek and GPT 6.1 Sol to
> help examine the finding and prepare the patch. However, I was the one
> who decided to submit it, and I am fully responsible for its correctness,
> testing, and presentation. Using these tools does not reduce that
> responsibility, and I should not have submitted a patch without
> sufficient independent verification.
> 
> More importantly, I owe you and the other maintainers an apology for my
> broader submission practices. I submitted far too many patches in a short
> period of time without giving each one the attention it deserved. I also
> failed to respond to review comments and requests for changes, including
> requests to acknowledge AI assistance. I understand how frustrating this
> must have been, especially when maintainers are spending their own
> limited time reviewing contributions.
> 
> You were right to question whether I was taking the review process
> seriously. Looking back at how I handled those submissions, I can
> understand why they gave that impression. I regret that my actions wasted
> maintainers' time and undermined their trust in my contributions.
> 
> I am changing how I approach kernel contributions. I will stop submitting
> patches in bulk, review outstanding feedback individually, and prioritize
> resolving existing discussions over sending new patches. Going forward, I
> will submit changes only after I have examined the relevant code paths,
> checked the subsystem conventions, and performed appropriate validation. I
> will also make sure that any AI assistance is properly acknowledged.
> 
> I understand that trust cannot be restored simply by writing an apology.
> It will take consistent care and follow-through in future contributions,
> and I intend to demonstrate that through my actions.

Thank you for finally responding to these massive responses that seem to
have been ignored.

Please go back and respond to all of your previous submissions and ask
the maintainers involved to ignore them and not accept them so that they
do not unnecessarily take the time to review the patches.

Then follow what you say you are going to do here, one patch at a time,
and build up some actual experience doing fixes, not blanket massive
patch floods that are obviously wrong and harmful to us.

greg k-h
