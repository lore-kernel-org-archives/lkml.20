Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F16204A5ED4
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 14:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791468319; cv=none; b=MEFtuLEuGzZCaFbCRTnGMip85XV8H9/MdQXsPq0BObtpbjBvNMf9jGNVlSIfmvNZ7FQfBsxeCaMF6tSkt80KD9g0GHwyZ5jKPA3x0ZHrkhzOqk0z78jKb8U98cXKbfFWxpMFELoJ5YGO1MGUZOaH3wE44DUheSRMYl32vKRooEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791468319; c=relaxed/simple;
	bh=rNdfnJLvOdC4gXIAlwcxEIU/PwHTMTZ8BUbT7HlnKdk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ENkagi1TQ5AfWjiCfnqpl2WRzys0GCWQosrmbbu49e6g0YDEnekA6HDxAOcFiNUWd47/Hkfi85AGg84q5X3extD5pfhGzYvDYJ8M4CrE/DSJuFST6+UEqcO+q2+U3PspRHObjcLJsarDFOE0G8EGnONJBoWNeN4iZFz/c0oWsnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=KPXR08cK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="KPXR08cK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9AE91F000FF;
	Thu,  8 Oct 2026 14:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1791468318;
	bh=rNdfnJLvOdC4gXIAlwcxEIU/PwHTMTZ8BUbT7HlnKdk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KPXR08cKeo4kc9PAJvMHiMFXQDyCkQ0VllST1AcX3Hr7KjyvZtn1RmIlacQ4HI9DJ
	 yvOnDafCeL63FW/NlYfhj6UcWTT+0CvL+3SKFduLAerJvSyKnyCIXpx4cH9Ok4IJTw
	 Zqq5bKFwM9m+gM9vfH+8OoILxQBrK+FxqC6pzCl0=
Date: Thu, 8 Oct 2026 10:05:15 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Matthieu Baerts <matttbe@kernel.org>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Joe Perches <joe@perches.com>, 
	linux-kernel@vger.kernel.org, users@kernel.org
Subject: Re: [PATCH] get_maintainer: only use THE REST as a fallback
Message-ID: <20261008-quantum-polar-kraken-890dac@lemur>
References: <20261008-get-maintainer-the-rest-fallback-v1-1-7d26d0b7aa34@linuxfoundation.org>
 <CAHmME9rh7k0vNrBt4yF7fOgir3yuhrFawPnmsJpeYBCLg-r6bA@mail.gmail.com>
 <20261008-quiet-lucky-ferret-3498cb@lemur>
 <e1f160bb-adef-49e0-acb6-628b259b7975@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e1f160bb-adef-49e0-acb6-628b259b7975@kernel.org>

On Thu, Oct 08, 2026 at 03:22:56PM +0200, Matthieu Baerts wrote:
> Is this list actively being used? The risk I see with this list is
> having someone sending a new version of an existing patch only to this
> list: this version will then be picked by tools like b4. If the
> maintainer doesn't pay attention to the info messages, a wrong version
> might be applied instead. Maybe b4 should catch such patches?

I'm trying to think of how this would happen. If the submitter users
get-maintainer.pl, then they should always get the correct set of lists. If
they aren't using get-maintainer.pl, then they aren't really likely to use
just the patches archive list.

If they use b4 to send the patches, then even if they do manage to mess up the
recipients, somehow, the maintainer should still be able to find it via the
change-id search.

-K
