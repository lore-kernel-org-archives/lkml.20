Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F9F41A3160;
	Mon, 31 Aug 2026 13:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788181252; cv=none; b=LQRL7sgIVM+8IKB43djc1zhTUN4q3c1YDBnThzqHXxjjrN9sgYVUkHtb1x5SZvLAcjy3VYWBDBM8p3r+xd4bEExZ05TVWjsh12sRBJqZsrjb1ozmgeaVgBL39ouJuGWqub7O1S09DncOUjfeCBQ9uRWSl0QnCNwTLlKmzSEYlgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788181252; c=relaxed/simple;
	bh=A9dPeq+3N5xzYFB/qfLVNtZJIe9CTDOzlAjk4ehBvIg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Anecv1waHJIIpLZG52lUC85b0LiTXZvYO3GDsV64b6Yo2K7ngHUra2rStgFFHi4y2Ddmt5Z4/2Fb0+WSd7AGw8CCXqcM59nn5ELoTa3anPjZJshaIAKp5bKqc+uLrLzJzkhGnjAA2/g4wyR4n/rQ+X4xlUN3tQ3zqYN2fkAjX2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hiPWxM3R; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hiPWxM3R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C06681F000E9;
	Mon, 31 Aug 2026 13:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788181248;
	bh=p9LxSMeH/ko7BUlXPC7Exyhjkk1AqMDJ8yUsctx5W/8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hiPWxM3RKlOVlD2jL6e02XR2dajTt86etJYY3FPaNnn498di42S9eG3xXmcsw39nP
	 9TnteGIUBFfrIXfhSNAznNNBO/5QZ9DxvP0ViTh1mWu8OBsCri1BtABgorGEsfkCdN
	 QcZbTsjreb3Gx2NTgLkpN50OggHE3HOoIoCBNZQ9in5uiKCiJkkRRdU3OQx57HYvwM
	 eqkBWca2y7CegJqD3dZD9tdFtlV9PurT+K6K7fzBLb5OCvGukbVy1Ge3DE/rUBvEeH
	 eOxdLfLpnPIWQD0M0nP+SURTMp2cBmi8ZO4aIq18vzoUCP0FmkOf3lMZQs8eTWw0dx
	 yxCy6maY1Ue5w==
Date: Mon, 31 Aug 2026 15:00:45 +0200
From: Frederic Weisbecker <frederic@kernel.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Marco Crivellari <marco.crivellari@suse.com>,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Thomas Gleixner <tglx@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Michal Hocko <mhocko@suse.com>,
	Valentin Schneider <vschneid@redhat.com>,
	Waiman Long <longman@redhat.com>,
	"Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH 1/2] doc: Change dynticks-testing repository name
Message-ID: <apV6_TKpQZOHKpCB@localhost.localdomain>
References: <20260831081823.67972-1-marco.crivellari@suse.com>
 <20260831081823.67972-2-marco.crivellari@suse.com>
 <20260831085432.HdW_Nrqi@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260831085432.HdW_Nrqi@linutronix.de>

Le Mon, Aug 31, 2026 at 10:54:32AM +0200, Sebastian Andrzej Siewior a écrit :
> On 2026-08-31 10:18:08 [+0200], Marco Crivellari wrote:
> > Currently the documentation still mention dynticks-testing.
> > 
> > Recently the repository name and the tool have been renamed
> > to cpunoise, so fix the URL.
> 
> (as of https://lore.kernel.org/all/20260815083728.15470-1-marco.crivellari@suse.com/)
> 
> > Cc: Valentin Schneider <vschneid@redhat.com>
> > Cc: Waiman Long <longman@redhat.com>
> > Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> > Cc: "Paul E. McKenney" <paulmck@kernel.org>
> > Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
> > ---
> >  Documentation/admin-guide/cpu-isolation.rst | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/admin-guide/cpu-isolation.rst b/Documentation/admin-guide/cpu-isolation.rst
> > index 8c65d03fd28c..6d8f91d2d761 100644
> > --- a/Documentation/admin-guide/cpu-isolation.rst
> > +++ b/Documentation/admin-guide/cpu-isolation.rst
> > @@ -354,4 +354,4 @@ Some tools may also be useful for higher level analysis:
> >    runs a kernel tracer that analyzes and output a summary of the noises.
> >  
> >  - dynticks-testing does something similar to rtla-osnoise but in userspace. It is available
> Shouldn't this "dynticks-testing" be renamed to cpunoise, too?

Bah, I should read other's reviews before posting :o)

> 
> > -  at git://git.kernel.org/pub/scm/linux/kernel/git/frederic/dynticks-testing.git
> > +  at git://git.kernel.org/pub/scm/linux/kernel/git/frederic/cpunoise.git
> 
> Sebastian

-- 
Frederic Weisbecker
SUSE Labs
