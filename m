Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793377781;
	b=IUJBHanzpuh3Z+qNsNKettHUJr/XnfL4hf4SbvOk41TFYWuf+MZXk6OIMvuScTZKVaX4
	 77ObhuqljWca2innjvWcas7dAiq2mFnRk2dc/gDXJESIoDj6/Rfo/dAgwWeOEzbwd4cBp
	 u4Ck4P6XIvu52GnZm0BzlzwJ7kQpKtzrYNAWQLLwVO+RakZKIjiPNnpm7n7xpC9kCzmRp
	 sDJKXidHc9rmVN7nRlc+D/620Cpar+/rBVNPb1C60oBpbVBZZ+VLoeOgPF0su34EvqUmg
	 laTWJtdwfhcx4xer0GIOpsah41Ip/4DiFOY6r4MvkrRmZ3h5NvfAOSVU8BgePjZKOvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793377781;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=eEemVxIYPLZzm0VpVM+WbSW6gURefcaBuIFbSg0HBAE=;
	b=3IrNdkKYXfx0ALz1RiilBlBjaCwYBsl+vjg0YWc3sc36tnk9c+tRIwJXPYgQIbKmZQf7
	 yVVNf5ZCLGFdy1pgB+V+dU86pV2MkQGzs8DShQ3vQcupZ+yenf9peTaMcV6MWfGaYf4o6
	 S4PdHkfR9N6gMJFqTCR5V7ELJC6sDJnWX9epgRKl2FOqyUhbfFzWFCLQl60QhFyrU99VO
	 gXREOsVV3paPEuNfHqtF2CPN4wOkrI7pWBTIaA+nbNfpNZKZQou76oiIzM4EG/sIMsCse
	 nKX7vy/yCzkO4bEFVkF76NHcPFhbjtlc/GneBT4ArycO97jSRDg4cC6hY0jewkpI7Sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AvYUzGSR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 304A4606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 16:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AvYUzGSR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3882B1F000C1;
	Fri, 30 Oct 2026 16:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793377780;
	bh=eEemVxIYPLZzm0VpVM+WbSW6gURefcaBuIFbSg0HBAE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AvYUzGSR3VX4lV8GjpFGkrR3T58w9lbJPB2f6pEZoxQEOUwaQwOBOpF+jB0lyU/K9
	 5x96bgDoCVbxbD+I57jdvuDeVZGkwyqUcGGQAS1Q7lNLUIAR3M3r2NcIfq/TOGbS7I
	 kn20osSzdc/oaFvlqJ4Poo1d1gtt0GTZ5X3Q41bbblQC8VVLGqKE8jhyXwAWnn7ig3
	 WHYNt5bnMBhpEnpel2bDdVPM8JHbaiTi8Q90q88trXbmE6SaQ1RH5IVOxgGR59meea
	 3hJP8L867lCRzFRhgOK9flv3im/yOTplck/B6+9j8KS0zvyfOhhGv/wBO6fYttFg12
	 Ihf7GjBthInHg==
Date: Fri, 30 Oct 2026 17:29:37 +0100
From: Christian Brauner <brauner@kernel.org>
To: Oleg Nesterov <oleg@redhat.com>, 
	Nickolai Zeldovich <nickolai@csail.mit.edu>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Thomas Gleixner <tglx@kernel.org>, "Eric W. Biederman" <ebiederm@xmission.com>, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] signal: fix endless loop in complete_signal() during
 a non-leader exec
Message-ID: <20261030-specht-grinsen-vererben-aedb50f4c96c@brauner>
References: <20261027025055.842038-1-nickolai@csail.mit.edu>
 <auM7-dpXdaNZQFFc@redhat.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <auM7-dpXdaNZQFFc@redhat.com>

On Thu, Oct 29, 2026 at 01:28:41PM +0100, Oleg Nesterov wrote:
> If you agree and see nothing wrong, can you send V2 please?

Send a new version, pleaes. I'll pick it up.
