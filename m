Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E87EA1E0E14;
	Thu, 10 Sep 2026 00:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788999086; cv=none; b=Es6U1QA61JmI9Qxd5ibduUWuQ4UuOeEL5wNXCu0mYZow+et72ApZCkwJWavWod0kxDxQcnIcQB+TMIKgvYCkN40urmpsgYf1ziBOxKrDzu17FHzdaKsozMfWI6IMNibCMZAskRyv2A2/jbyTNDi5elCoZmL4gH6ZrxXx1X0ZmJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788999086; c=relaxed/simple;
	bh=zRmSLC+X5TZ+oSKfZzsz3fszHEeU7reKhCsQ0NyTym0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LKBePFB2Bt3ccr0llIANO7yYefdOBC5C82ZThbyjK9X0CeK5QtDnSPxWHRuudKMgOu0tCxhUSHqQikFLwIz9GmD/RhV9aoHEUrX3bbGR2BcG9GgAqI40bM+RaICKT9pG9Dw8C3mY41oYMUi3n+Y2BXpB8oJw2I1eQlbpVzhZrw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UPiTjEKH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UPiTjEKH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FEA91F000FF;
	Thu, 10 Sep 2026 00:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788999084;
	bh=PVjn/yGVC40o3886M+qzt6X0m+lWhLEzPx3J1VAtpgE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=UPiTjEKHZDLfgBDeOLBrJJvaqLtGTnFmbNW4za49axmICf4zMxXy/+ApX8a+sQjTV
	 eg0D+7INKKlft+vvG3BUdvyr8Ep2Zd9kTQ/D8uO3GEQKtIL+HYrbdCpV7vUUQnsSq2
	 0fAOAh212c2hljBrCneQ7LBZ6wAf/nzBkAygLstR/mUHf+8023W1C6Zp5QS2Ni4PLl
	 fDZ8eLCqDXp6/S6/GYudulnAh4oGN+TRoFFMh7p/uqLniqVrXHHbXXMUuViTTW7srC
	 QIMZsUuiW3lwveMUAESG2lfAn8M3R8wI0Vp4+1Qf7ke4Wev7b4rjXL6WU7fqwh/2ZQ
	 1FeNXCpcMvX5w==
From: SJ Park <sj@kernel.org>
To: Jani Nikula <jani.nikula@intel.com>
Cc: SJ Park <sj@kernel.org>,
	Manuel Ebner <manuelebnerli@mailbox.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: deprecated.rst: add to syntax highlighting
Date: Wed,  9 Sep 2026 17:11:17 -0700
Message-ID: <20260910001117.109969-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <d35909dea037d1ac5c6a919bf1a7d53d8d5fddb4@intel.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 09 Sep 2026 20:00:47 +0300 Jani Nikula <jani.nikula@intel.com> wrote:

> On Wed, 09 Sep 2026, Manuel Ebner <manuelebnerli@mailbox.org> wrote:
> > Mark key words 'gfp' and 'GFP_KERNEL' for syntax-highlighting.
> >
> > Suggested-by: SJ Park <sj@kernel.org>
> > Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
> > ---
> > Suggestion:
> >  https://lore.kernel.org/all/20260430010332.114100-1-sj@kernel.org/
> > ---
> >  Documentation/process/deprecated.rst | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/Documentation/process/deprecated.rst b/Documentation/process/deprecated.rst
> > index 22a5e62c9..4d4d29b97 100644
> > --- a/Documentation/process/deprecated.rst
> > +++ b/Documentation/process/deprecated.rst
> > @@ -404,7 +404,7 @@ become, respectively::
> >  	ptr = kmalloc_flex(*ptr, flex_member, count [, gfp] );
> >  	__auto_type ptr = kmalloc_obj(struct foo [, gfp] );
> >  
> > -The argument gfp is optional, the default value is GFP_KERNEL.
> > +The argument `gfp` is optional, the default value is `GFP_KERNEL`.
> >  If `ptr->flex_member` is annotated with __counted_by(), the allocation
> >  will automatically fail if `count` is larger than the maximum
> >  representable value that can be stored in the counter member associated
> 
> Single backquotes in rst mean "interpreted text" [1], not markdown style
> code.

Because multiple other parts in the doc are using single backquotes, I feel
this patch is improving the consistency.  Using double backquotes would also be
nice.  I have no strong opinion here.


Thanks,
SJ

[...]
