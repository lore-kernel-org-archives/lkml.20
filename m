Received: from irl.hu (irl.hu [95.85.9.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C76AA360EF5;
	Mon, 12 Oct 2026 10:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.85.9.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791802726; cv=none; b=q4iA5HHh5qH8wELfXLS+jqJ+4aTkuUHkuQtysbeUZK210X9gYgbevboKRzAh1oWWzsFZEgx5AOSvGmJL3YCqFZXTPfHDSYoEFsoHAkH5tVIep/Xv8B/nEleyCtvHBI8PafoR1Z04OKPw4agHOXRM0ClvWxCRtb4oj2vdpmNVNCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791802726; c=relaxed/simple;
	bh=GukRYsRjTQQnhmISVcxKD2uCMtiqdM/bzG2vZDaC/+A=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZBuKWkLbqCTYTBhKWfwZIKU+MB5ReD8cMvBbe4BqZdYh578WoFDOGF0dJ6kC7/x5Bl2wRIT9BJtBSLJyD8rO4ZbZ/LBWo+2cvYkMhr+9kPI6Nf/gCu2BIi7YVx7expVffEeswKXSVDZwRj83pUaStpfzV3sM1L8FitR2wNHJSxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=irl.hu; spf=pass smtp.mailfrom=irl.hu; arc=none smtp.client-ip=95.85.9.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=irl.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=irl.hu
Received: from [192.168.2.4] (bc24bec8.dsl.pool.telekom.hu [::ffff:188.36.190.200])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 00000000000C70AA.000000006ACCBD62.00335E2B; Mon, 12 Oct 2026 12:58:42 +0200
Message-ID: <368151886b753a44feb5b56fe9c7147d9956ed4f.camel@irl.hu>
Subject: Re: [PATCH v2] ALSA: hda/tas2781: Enable bass speakers support
From: Gergo Koteles <soyer@irl.hu>
To: Georg Wenzel <g.wenzel@gmail.com>
Cc: tiwai@suse.de, alsa-devel@alsa-project.org,
  linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Mon, 12 Oct 2026 12:58:47 +0200
In-Reply-To: <CAKnFnk5ZY1njMkqwLPtOrv817LFfXS7jfh6vaEvqA03s8uorUA@mail.gmail.com>
References: <87cxtw2y8b.wl-tiwai@suse.de>
	 <20261004071202.89116-1-g.wenzel@gmail.com>
	 <08164314db94522865dd4681d414bc42939da545.camel@irl.hu>
	 <CAKnFnk5ZY1njMkqwLPtOrv817LFfXS7jfh6vaEvqA03s8uorUA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Georg,

On Mon, 2026-10-12 at 10:47 +0200, Georg Wenzel wrote:
> Hi Gergo,
> I'm not very familiar with kernel development.
> My problem is that the subwoofer doesn't work without the patch, but it
> does work with the patch.
> So I figured others might be having the same problem, which is why I
> submitted the patch.
>=20

My problem is that this simplifies down the TAS2563 part of the driver
to setting just these few registers, bypassing the firmware and the
machine-specific calibration values.

Could there be a problem with your kernel config or your hardware?
Have you tried it with a distro kernel? If you live boot into a Fedora
it should work.

Best regards,
Gergo
