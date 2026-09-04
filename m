Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC5F41C30F
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 06:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788503862; cv=none; b=Ra9DgTR2vMt4P8uwmpabtvEK9bkURPHPM9PgzqFzXaT3ErOjgJgMdwbbonnfrlQ+Ey4lQSx3VmYtKIkP1lSiDfbwaWHckaFbinX+rItIMH+AoJv6AGxeFcTfsBoqwbToeTgaCbAQpfoopDP6qGCif/BBSsg8RMf75/lt6xS9f4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788503862; c=relaxed/simple;
	bh=jteiOc/uTK7kiwgFOfKyJcB7EXxZA867PLv3w1D+yt4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=SygTtCW7xbcCakQ8E2dwPJhEmvs2cT/JheZt7a/4cLvgPLfXS2QTE6bIvwPXp73DV79hutNTdVjEmJEmsodTwRm3yNsVDZcri4wC6RTFDU3pR+MGRzpZXXoP6KNU3nYR6lRuNLo0RVuV75lzTGGd3qbWosi2BbnppoVZBsZaXrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dt20m1PQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dt20m1PQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C5281F00ADE;
	Fri,  4 Sep 2026 06:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788503861;
	bh=jteiOc/uTK7kiwgFOfKyJcB7EXxZA867PLv3w1D+yt4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=dt20m1PQ+crOJeTULOioCU/7W1j53UbelUQlhJYhJ5wDdMR40Gypr1OBN6gGF7gcr
	 yRKuKdZBzQArZ29JzDTImfQlXxXbijtooPIDRJoLRyewfCDLLoggEaoehgKm2zUsmb
	 rreFkjUbMQVpnbAqwhPbrREVv6dRn92uKK9b5796s1NLHwqTNTSmEdD0vKHJmJbqvT
	 azOUrlXI+341UhB9GnwORhwYN6S3dPXWDJ/Q/qroPtXjiT6toRNJQp/tFTzbr1bllX
	 qx3HhwmI2116svO7Qd2VZgkpj56Azhcg577sTvsAoeX7il4WpxyjrRFCFLueJwB5h1
	 urrgvmT//55wg==
From: Thomas Gleixner <tglx@kernel.org>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: linux-kernel@vger.kernel.org, "Jiri Slaby (SUSE)"
 <jirislaby@kernel.org>, Radu Rendec <radu@rendec.net>, Alex Shi
 <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu
 <dzm91@hust.edu.cn>
Subject: Re: [PATCH] irqdomain: Delete irq_domain_add_linear()
In-Reply-To: <20260901070450.255507-2-jirislaby@kernel.org>
References: <20260901070450.255507-1-jirislaby@kernel.org>
 <20260901070450.255507-2-jirislaby@kernel.org>
Date: Fri, 04 Sep 2026 08:37:38 +0200
Message-ID: <87pkyt8qtp.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Sep 01 2026 at 09:04, Jiri Slaby wrote:

Can you get your act together?

The very same patch just with "[patch V2]" was sent by you _one_ second
before this one.

