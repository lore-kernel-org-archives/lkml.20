Received: from sonata.ens-lyon.org (sonata.ens-lyon.org [140.77.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25E7C3438A6
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 09:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.77.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787994705; cv=none; b=jcqA81/hgPQnFIuhwMOeswuvTRkzpNIqdNkEcNDaB9/BoVmXhohdB33043zN8dE9wR0f6E2KvsGFFXQ+xsLgXa7KQN+K+62uJgTsjUun8aR40G+4xHCTzqUTcd8Sjvv2U4hdkmyWiQEIg4Aa/vhQbtDQv24sU7MWdMrjgN/jhug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787994705; c=relaxed/simple;
	bh=943jiWORQ2Ou6grUox4N8r3lPmpFuPEHxX/sxcYfq0Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iCy3X3ZqDWJhG+Hq/mFdgqr9eG/u6PCAbP4A1iePdG2htBMo22rSSfP0NRG5Gmb85R5/KN1GDPdBGSBBXqTbyOBRXv9sVyhTk+qTyU7CrKxpLiO6N6lsb5jDeWcD80YY5xMMb5f0evtstex0wHC4jpxvZE3/S/AWge/WVRdJT0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ens-lyon.org; spf=pass smtp.mailfrom=bounce.ens-lyon.org; dkim=pass (2048-bit key) header.d=ens-lyon.org header.i=@ens-lyon.org header.b=GmaobcMi; dkim=pass (2048-bit key) header.d=ens-lyon.org header.i=@ens-lyon.org header.b=GmaobcMi; arc=none smtp.client-ip=140.77.166.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ens-lyon.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bounce.ens-lyon.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ens-lyon.org header.i=@ens-lyon.org header.b="GmaobcMi";
	dkim=pass (2048-bit key) header.d=ens-lyon.org header.i=@ens-lyon.org header.b="GmaobcMi"
Received: from localhost (localhost [127.0.0.1])
	by sonata.ens-lyon.org (Postfix) with ESMTP id 3129FA03DB;
	Sat, 29 Aug 2026 11:11:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ens-lyon.org; s=dkim;
	t=1787994700; bh=943jiWORQ2Ou6grUox4N8r3lPmpFuPEHxX/sxcYfq0Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GmaobcMin6x1mT/S3E1q24fhepaDWujE9y9rGCD3WcUitRnfeUrvT4yBzBM/9tQND
	 rXs8qAO4doNuPRyy/GmXeVLj0r7NgJGOmfhIzsESOBx2BI2rXLlu0q0qvr6iZKZ9qt
	 DoAR/G7VdumYyE/1fhv6N7rnWGuT7uxMx9PSw0VPaD+5/FrCKrqiXDq+sjpbmnZegX
	 uSpxbELFZU5G1ve9XLmlBM8kDWSQclvojc1QS+feCH0bHn6TORpd6M2XU6+b2GAzgz
	 ILW/CQDUfyWYwJL2jz/a0vfCBE4aZ7bY26udrUOXCc3NpBabxeOnctWwmmJeYVCwkR
	 cV8Cy9vmtIbzw==
Received: from sonata.ens-lyon.org ([127.0.0.1])
	by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U3zchhcYL7By; Sat, 29 Aug 2026 11:11:40 +0200 (CEST)
Received: from end (aamiens-653-1-40-48.w83-192.abo.wanadoo.fr [83.192.199.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by sonata.ens-lyon.org (Postfix) with ESMTPSA id E4271A03D3;
	Sat, 29 Aug 2026 11:11:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ens-lyon.org; s=dkim;
	t=1787994700; bh=943jiWORQ2Ou6grUox4N8r3lPmpFuPEHxX/sxcYfq0Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GmaobcMin6x1mT/S3E1q24fhepaDWujE9y9rGCD3WcUitRnfeUrvT4yBzBM/9tQND
	 rXs8qAO4doNuPRyy/GmXeVLj0r7NgJGOmfhIzsESOBx2BI2rXLlu0q0qvr6iZKZ9qt
	 DoAR/G7VdumYyE/1fhv6N7rnWGuT7uxMx9PSw0VPaD+5/FrCKrqiXDq+sjpbmnZegX
	 uSpxbELFZU5G1ve9XLmlBM8kDWSQclvojc1QS+feCH0bHn6TORpd6M2XU6+b2GAzgz
	 ILW/CQDUfyWYwJL2jz/a0vfCBE4aZ7bY26udrUOXCc3NpBabxeOnctWwmmJeYVCwkR
	 cV8Cy9vmtIbzw==
Received: from samy by end with local (Exim 4.100-RC3)
	(envelope-from <samuel.thibault@ens-lyon.org>)
	id 1x0F6A-0000000Ae4M-45ch;
	Sat, 29 Aug 2026 11:11:38 +0200
Date: Sat, 29 Aug 2026 11:11:38 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Weiming Shi <bestswngs@gmail.com>
Cc: co <co+e5693071d903b832@bugs.sh>, speakup@linux-speakup.org,
	William Hubbs <w.d.hubbs@gmail.com>,
	Chris Brannon <chris@the-brannons.com>,
	Kirk Reiser <kirk@reisers.ca>, Petr Mladek <pmladek@suse.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Oleg Nesterov <oleg@redhat.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Song Liu <song@kernel.org>, Greg Kroah-Hartman <gregkh@suse.de>,
	linux-kernel@vger.kernel.org
Subject: Re: [BUG] drivers/tty: NULL pointer dereference in paste_selection()
Message-ID: <apKiStBokkMZfNUy@end>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Weiming Shi <bestswngs@gmail.com>, co <co+e5693071d903b832@bugs.sh>,
	speakup@linux-speakup.org, William Hubbs <w.d.hubbs@gmail.com>,
	Chris Brannon <chris@the-brannons.com>,
	Kirk Reiser <kirk@reisers.ca>, Petr Mladek <pmladek@suse.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Oleg Nesterov <oleg@redhat.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Song Liu <song@kernel.org>, Greg Kroah-Hartman <gregkh@suse.de>,
	linux-kernel@vger.kernel.org
References: <sQDn678D0YppKseC8dIUC0I6uKmzsrOVtoN1@bugs.sh>
 <apHnwT7aG3Uy4oyC@end>
 <CANgPUi0MxMtnx2JcWJtrTB+EwLbYExX9Lmp569Y+F=nkXMgY6w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANgPUi0MxMtnx2JcWJtrTB+EwLbYExX9Lmp569Y+F=nkXMgY6w@mail.gmail.com>
Organization: I am not organized

Hello,

Weiming Shi, le sam. 29 août 2026 16:00:32 +0800, a ecrit:
> One correction: this is triggerable without root. I reproduced it on
> Debian 13.6 with espeakup enabled, from a tty1 session with:
> 
>   uid=1000(tester) gid=1000(tester)
>   CapEff: 0000000000000000
> 
> The process called VT_ACTIVATE on its controlling tty, which is allowed
> without CAP_SYS_TTY_CONFIG. Switching to VT8, which had no getty in this
> setup, left vc->port.tty NULL. Pressing the Speakup paste key

Pressing the speakup paste key either requires simulating it as root, or
pressing it physically, who in the speakup security model is rather
trusted.

Samuel
