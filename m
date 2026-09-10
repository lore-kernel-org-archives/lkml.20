Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B64AF196C7C;
	Thu, 10 Sep 2026 00:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788998955; cv=none; b=ICEi/RRpZLlbfzMW/o1OmdnKxWOwJKq1VVPjjMimyluvknAngOfZZ5fxKmMWmpB3UZJx7sMRjfdyHZS9gkCbh841R/BvDKmoiqMzkxR1b1AeXPsoaPx6EdDiMQOhs0BhNx77a1PqRfspRROyMWCiOOIvk8XVkE+/kj0MocMe4rE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788998955; c=relaxed/simple;
	bh=I+o7AjrM2xCZCj4IATGwYo7nvYWn6lHg1A/HevpjRvg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ftRgntBO3nGmOf4c7MX6IrWkEfvOQS9WGpo/m9ocEpR4bDZRqD4HeQj0zUPEUBrS0q3rUOqWiiZXlfP9TfqVx4T5WHx/qTuHTpOmasyE9ahavPJY6GI49RJoXyc9vyB+RoCqt5BxSfYb6Dx4F+BXrHcR5SVBg3goZzCOJ8VorrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ce52o/UL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ce52o/UL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDC0A1F000FF;
	Thu, 10 Sep 2026 00:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788998954;
	bh=9OxXbnwyAxlPwzEZL8hT+2QRRpJ+yNE0N5kJQ96FvbA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Ce52o/ULhA8/ETXjLVGjMsoWueKje8Qh7pVk9fQLe7QshPIECkKEEd8lzzZ29xnvf
	 3gI8/H+xBUvNvkNlfG0SqINF0CTsMpG488nRolvrRZb95RzilhECa/6SjS+6SxX4S7
	 iKBtWYe/jTfnhsM26WupMaV6n803IpJGDrJWfZwc07uqZMn3vuMc8mvpSxYIaxVwNU
	 O/N+So9thv+2HOsZ/DdDqWvuvZpZIu0RrV3lUdaMoH7SDLNjwHXnkjPvPWnD5qfhHU
	 82FcN5PaKxkwuWHgUYcbDHSTj+ZbxXxJvD0cdTR5rxe4HMkeL/HELnYwteScfxvl10
	 0TrL6T3qB4uow==
From: SJ Park <sj@kernel.org>
To: Kees Cook <kees@kernel.org>
Cc: SJ Park <sj@kernel.org>,
	Manuel Ebner <manuelebnerli@mailbox.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: deprecated.rst: add to syntax highlighting
Date: Wed,  9 Sep 2026 17:09:05 -0700
Message-ID: <20260910000906.109828-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <202609090913.DA27C376@keescook>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 9 Sep 2026 09:14:25 -0700 Kees Cook <kees@kernel.org> wrote:

> On Wed, Sep 09, 2026 at 07:25:26AM -0700, SJ Park wrote:
> > only the paragraph more consistent looks making sense to me.  So, how about
> > doing same to "__counted_by()", too, as it is also in the same paragraph?
> 
> I think that'll get auto-marked by our tooling already because of the
> trailing "()".

You're right, thank you Kees!


Thanks,
SJ

[...]
