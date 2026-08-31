Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D5541D102
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 23:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788220392; cv=none; b=qc6sxO+DCTn48rXEadvcxQNrOprUyyWnCkz3dSgAWA3mID2fzpxg+tVg9XMkYKVI9HwP6YjOXm6P4G0V4VMaBiiS6i45Nal0Y2pQFNaIeFgum9P2eadotm2cpzhlp4/iNwCADHyhxQVwMgenrv8FFVjjIft0I4M8ey8TmR621cM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788220392; c=relaxed/simple;
	bh=+vGlQRIaqV66XlvTdUAKdcnZfYDwklQ3IsfOAyHmFo8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OdeL5sUdUsLBuC10IBxYKKwXpqgYZYa88TMwJeHAwsXMkumP7yK5zWrB8FLsUE4kdMKVVEipRaeB5xqLI5tCgHhsc92QEGAJl6VwmPo/0NcioiFSdchPXNtrI35NWq0kkskQa/Xj+pPuDVNHCba3bIfXs3RXPy539vZ2OaxKO+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qlinl+jH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qlinl+jH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25CB61F000E9;
	Mon, 31 Aug 2026 23:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788220391;
	bh=TqFjqXURdBe8I5vqT3GKQ5/LK5AuWuxvXaNXhPCmLgk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Qlinl+jHJX8QqYKlTyOq+ngvwVIB9USln3Xotp3R6gxcH+zwGm8on5c0DTpd/WXlV
	 xS2z2mlQsUGGXqxRDA/UpxnQWNbOudup0r70zGNWPEogoxsd14w15Wz52feIpMvbSP
	 zX5ewFCxmd7hsoj+yQkP4f/yR6J7aKQRJXu32x8d+PVLykXsPJXC2Sp1C//nwgBoAR
	 GDnDyUS27RraeTmMLE0hIwsOpeEN3adNx4X+hN6BJ6AMTAulGdv9iMbwzNnRlDqyX6
	 amD7AbM8xqVmPfdfVKFE8hpjzs9uePFX1oIyplYnozgWd/T1vcag3eX3PZ7DuCqg+B
	 skhFoFisLD/4g==
Date: Mon, 31 Aug 2026 16:53:05 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Julian Braha <julianbraha@gmail.com>, andersson@kernel.org
Cc: amirreza.zarrabi@oss.qualcomm.com, jenswi@kernel.org,
	sumit.garg@kernel.org, arnd@arndb.de, geert+renesas@glider.be,
	amirreza.zarrabi@oss.qualcomm.org, op-tee@lists.trustedfirmware.org,
	linux-kernel@vger.kernel.org, quic_eberman@quicinc.com,
	brgl@kernel.org, harshal.dev@oss.qualcomm.com, nsc@kernel.org,
	jani.nikula@linux.intel.com, kees@kernel.org
Subject: Re: [PATCH v3] tee: remove TZMEM_MODE_GENERIC
Message-ID: <20260831235305.GA2963642@ax162>
References: <20260807175041.3299349-1-julianbraha@gmail.com>
 <20260807190513.GA2638974@ax162>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260807190513.GA2638974@ax162>

Hi folks,

On Fri, Aug 07, 2026 at 12:05:13PM -0700, Nathan Chancellor wrote:
> On Fri, Aug 07, 2026 at 06:50:41PM +0100, Julian Braha wrote:
> > 'select' does not work on config options in a 'choice', so currently it is
> > possible to enable QCOMTEE without QCOM_TZMEM_MODE_SHMBRIDGE, even though
> > this is needed at runtime.
> > 
> > There are no users of the generic allocator option,
> > QCOM_TZMEM_MODE_GENERIC, so let's remove it. Then, we can remove the
> > containing choice..endchoice, which allows the 'select' to work as
> > intended.
> > 
> > Suggested-by: Arnd Bergmann <arnd@arndb.de>
> > Signed-off-by: Julian Braha <julianbraha@gmail.com>
...

> A note to the maintainers: We would like to turn selecting a choice
> symbol into a hard error in 7.4, so please consider picking this up for
> 7.3-rc1.

I would like to pick up

  https://lore.kernel.org/20260804-kconfig-warn-on-dead-select-for-choice-value-v1-1-e5c9a274d291@kernel.org/

for 7.4 but this was the only patch that did not make 7.3-rc1. Could I
take it via the Kconfig tree with an ack or be given a shared branch so
that I can pull it in before I take the above patch?

> >  drivers/firmware/qcom/Kconfig      | 26 +++++---------------------
> >  drivers/firmware/qcom/qcom_tzmem.c |  4 ++--
> >  2 files changed, 7 insertions(+), 23 deletions(-)

-- 
Cheers,
Nathan
