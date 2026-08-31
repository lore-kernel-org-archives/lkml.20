Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 414EE3E1D0D
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 11:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788176084; cv=none; b=GHQ1XGga5Cjoj29EWykcfzfjzpvuxMBWgjtvmwhxnJfz6s6czwh41Js3WTz+iNNKorSBA/iuW/PG/D23eD70JJOD/nGXAc5IT9WvRyvdBAxdPHTcDCT/rLoOXBEjQvP6vODAb/VzcLq8nJH8D1C8Q9/q4JBgVqlCQF7D8J3eKa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788176084; c=relaxed/simple;
	bh=V2W8jOJ06warbrDPILCkL8sgiW7WvfOtSLFf8/fDlV0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=qV3+1nFFuqgz1YSVrEEcXVG1IYoyhl5MbTySoev+irCqDAxSIwpsWOx2HNwPOiNUSBemul/OCfMu6osX+jWvUcrcvpJnAzGErSuipbfJO2hfEqDvC/mYWrL74axCBG/wBQq1YaeYWh8Pj5c9SuLrzoSWqLI754Xl/7exqeDeHWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cb92b7KD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cb92b7KD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CB511F000E9;
	Mon, 31 Aug 2026 11:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788176082;
	bh=V2W8jOJ06warbrDPILCkL8sgiW7WvfOtSLFf8/fDlV0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=Cb92b7KD7d1mr+w/4jwGvmN+x0rwgvSGHgB0SPP9kPfmFkNRriEA2ZPzdMjMwEAR3
	 q0TAQ1cpWs5QYUg4UxN1z1iG9IVPqbD3hCOwfa7xq2oa/0AgdeFQDkVd9FKVihw3w5
	 inWU+p7oYMZ5HLQqmjQOWbg15rP/GNBgH/cKsl+0T2Sk9qh6E1i1v9D8M8S6/vMV9a
	 GG/HJGtU4qnwbemjovKJFpE72NhN8ZbRCHCC/kIRzEyMISClxMfjSd2CS7YAMqBowO
	 Q92VwhCHPE+SFKBlVT68S4PHD0fAagqopMLwUWo07BGP3t71Hl/AyPADjYtRD22Ru1
	 49jB8Owt4kZXA==
From: Thomas Gleixner <tglx@kernel.org>
To: Tapio Reijonen <tapio.reijonen@vaisala.com>, Russell King
 <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Tapio Reijonen <tapio.reijonen@vaisala.com>
Subject: Re: [PATCH] ARM: fix get_cycles() always returning zero
In-Reply-To: <20260827-arm-get-cycles-v1-1-6495fc03369a@vaisala.com>
References: <20260827-arm-get-cycles-v1-1-6495fc03369a@vaisala.com>
Date: Mon, 31 Aug 2026 13:34:39 +0200
Message-ID: <87ecfecyls.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Aug 27 2026 at 09:54, Tapio Reijonen wrote:
> Commit dfc256dac54c ("calibrate: Rework delay timer calibration")
> renamed read_current_timer() to delay_read_timer() and inverted its
> return convention: the old function returned 0 on success, the new one
> returns true on success. The ternary in get_cycles() was not updated,
> so it now evaluates to 0 whenever the delay timer is present and
> readable, which is precisely when it used to work.

commit e1e3a0ab69c64eedaf53dce9306f8a090bf038f0 upstream

