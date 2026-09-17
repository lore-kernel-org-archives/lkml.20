Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7069E4B1CF8
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 23:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789688703; cv=none; b=FmnkWT3hCTbWa4qshx/Rnm4rV3bJmMfj1n/ZK8zGmmjnvdTZFZ4+p7caLBXvZIxhM/QLLTbLcUjwXdz5PAQTXz9DnYVFOSXZdTEt3Bb3yVFwS5+12ijEYT2hoKfa5zBtNp8qpfUAidtiZ69YqmtoiVx+k/cRp33Hv1beCLSPZvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789688703; c=relaxed/simple;
	bh=388rFBgeu+8MFiw1XJ1xGKSDVsrfo13frUk4Z/Q58vI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZjPwssDgUudx3vFL16ugyZZEDrnGbG70WEkmnZG86YgSb49/iZiu/TWdFPWkGxzvVUQoD4OtdjFmB7dzJGnyjyNT/7uXStr9naW1IaG4DRLlvz0HRNSSJF/wWCvKOJkrEWursuiliMnNgx3ccQKMVqfIOMKTP80aOfusHDiejLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YsqSf2Me; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YsqSf2Me"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92FFB1F000FF;
	Thu, 17 Sep 2026 23:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789688701;
	bh=tdagK5hSqGq/Ri3qTRfmlEEmMLaB5aYrPXTv05/dT5Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YsqSf2MeYxljNQLqp60U1Ydq6q5dSvRhyM5Fb4lB/pgPnT+qB7zn2tVOhKHsJvS7f
	 PAOCigqbOQtB11RRew6HwZsLm9f/gfgOwgun7mwquCH7w2OLrSKBIELu0lAm2Qrx76
	 xTqWNa6jbR/NGQl32gI2Z5sf8damQUsODIA89i6g02s2pa/0QOLSL/agmwaEZLCYqm
	 lIGLGHZeKBPPYKO23Ba/9RE6ZgsBwdn0ug1I/DnJND2P8xLa5/tP1/b++Cdt7lc8DJ
	 ijkrul4zBpIS9sjUV0SNfKqOFxynXS+v/ofoo686Pr32BnluJUncx6zdeN7wL2iWzu
	 WOLPa9pVXNgbA==
Date: Thu, 17 Sep 2026 16:44:56 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Julian Braha <julianbraha@gmail.com>, andersson@kernel.org
Cc: amirreza.zarrabi@oss.qualcomm.com, jenswi@kernel.org,
	sumit.garg@kernel.org, arnd@arndb.de, geert+renesas@glider.be,
	amirreza.zarrabi@oss.qualcomm.org, op-tee@lists.trustedfirmware.org,
	linux-kernel@vger.kernel.org, quic_eberman@quicinc.com,
	brgl@kernel.org, harshal.dev@oss.qualcomm.com, nsc@kernel.org,
	jani.nikula@linux.intel.com, kees@kernel.org
Subject: Re: [PATCH v3] tee: remove TZMEM_MODE_GENERIC
Message-ID: <20260917234456.GA1570097@ax162>
References: <20260807175041.3299349-1-julianbraha@gmail.com>
 <20260807190513.GA2638974@ax162>
 <20260831235305.GA2963642@ax162>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831235305.GA2963642@ax162>

On Mon, Aug 31, 2026 at 04:53:12PM -0700, Nathan Chancellor wrote:
> Hi folks,
> 
> On Fri, Aug 07, 2026 at 12:05:13PM -0700, Nathan Chancellor wrote:
> > On Fri, Aug 07, 2026 at 06:50:41PM +0100, Julian Braha wrote:
> > > 'select' does not work on config options in a 'choice', so currently it is
> > > possible to enable QCOMTEE without QCOM_TZMEM_MODE_SHMBRIDGE, even though
> > > this is needed at runtime.
> > > 
> > > There are no users of the generic allocator option,
> > > QCOM_TZMEM_MODE_GENERIC, so let's remove it. Then, we can remove the
> > > containing choice..endchoice, which allows the 'select' to work as
> > > intended.
> > > 
> > > Suggested-by: Arnd Bergmann <arnd@arndb.de>
> > > Signed-off-by: Julian Braha <julianbraha@gmail.com>
> ...
> 
> > A note to the maintainers: We would like to turn selecting a choice
> > symbol into a hard error in 7.4, so please consider picking this up for
> > 7.3-rc1.
> 
> I would like to pick up
> 
>   https://lore.kernel.org/20260804-kconfig-warn-on-dead-select-for-choice-value-v1-1-e5c9a274d291@kernel.org/
> 
> for 7.4 but this was the only patch that did not make 7.3-rc1. Could I
> take it via the Kconfig tree with an ack or be given a shared branch so
> that I can pull it in before I take the above patch?

I have picked this up via the Kbuild tree as

  35abc3cd8ab6 ("tee: remove TZMEM_MODE_GENERIC")

to allow me to pick up the above patch. If you would like to pull it
in, I have added a stable tag.

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  git@gitolite.kernel.org:pub/scm/linux/kernel/git/kbuild/linux.git tags/kbuild-tzmem-kconfig-7.4

for you to fetch changes up to 35abc3cd8ab65dd7d07d4fc48a0d7048ce47d055:

  tee: remove TZMEM_MODE_GENERIC (2026-09-17 16:34:13 -0700)

----------------------------------------------------------------
Stable tag for "tee: remove TZMEM_MODE_GENERIC"

Apply "tee: remove TZMEM_MODE_GENERIC" so that the Kbuild tree can turn
on a warning about selecting a choice configuration option.

Signed-off-by: Nathan Chancellor <nathan@kernel.org>

----------------------------------------------------------------
Julian Braha (1):
      tee: remove TZMEM_MODE_GENERIC

 drivers/firmware/qcom/Kconfig      | 26 +++++---------------------
 drivers/firmware/qcom/qcom_tzmem.c |  4 ++--
 2 files changed, 7 insertions(+), 23 deletions(-)

-- 
Cheers,
Nathan
