Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BCDD37F30C;
	Thu, 15 Oct 2026 18:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792088652; cv=none; b=f4WIB0wxuvGqspn5zdG4l3KZfpQgfINw583/Ulos1zFS+XvJXtGeWc9Lq+kT6sBMK/myO0Q0urno94cGO1a+FSiSMf3yoCoQA8N//Mn70Ea6tnOxKpoknc0MZfv3TkAViAUqvl9NUWeCR1e+PEmtg3wu+uuWKd7t/c0UqR2UEkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792088652; c=relaxed/simple;
	bh=+dSo6jOK+EVtMlh8EnYN97wOjoN/ktEPgeiVNsuVkD4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BW/AptTAMcPyIWob/ZdJxkNPQD1Yd1ONtU403LiAacrX3hPofIj9+LKNFiBf9Ro5fMfF2rHwY/7xS5VOeOh4vF989Sd6r/K/P3PNRrel879xDZ0/C3o+wc4/PYqGTdupo2TyEWaHtDiP9uw87sI/p7Qti5oB5s6ABJeve6+skYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YI6LO+2E; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YI6LO+2E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A68B1F000C4;
	Thu, 15 Oct 2026 18:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792088648;
	bh=uA57A2DWEvF/qcxiPG3vFpzt2rPKzW0R+wSjr1T3+xk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YI6LO+2Ez6GeyOjH80TxYg6+SlCszBAeDhXDr6EW4UW4d940nyW/89Kk6N/ASctEh
	 H1YUobP5V8tpKrNLlu99o7KCbWXAE45BHRBixSsWwE8ptHPeGzmH97JVc0x2cyYXQi
	 t/KHa6MeND9tUcZkxhuYA3OCYRSdr36nvqjX+safhonE6GfjjGg2QkCqYivJEqQrXq
	 uglJB9sch1HJuMbIuLAyIa1OK2TcfqrgbQWeJUm8V0oxnG33WOgAcVV2rpt6iJsixD
	 bv7uvYxO9fzxtVme0/D6ZHyH8qlk2LuJnYaJyaCKQ4VVb0eV2YASDA5XpZZAFPeu5O
	 l0Nf0B6a6lr/Q==
Date: Thu, 15 Oct 2026 13:24:06 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Sashiko AI <sashiko-bot@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Yanteng Si <si.yanteng@linux.dev>,
	Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org,
	Alex Shi <alexs@kernel.org>, Dongliang Mu <dzm91@hust.edu.cn>,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2] of: overlay: remove unused of_overlay_remove_all()
Message-ID: <179208864454.2159760.12479056769082812070.robh@kernel.org>
References: <20261014-b4-of-overlay-remove-all-fix-v2-1-cf5ea2cc9dc3@nexthop.ai>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014-b4-of-overlay-remove-all-fix-v2-1-cf5ea2cc9dc3@nexthop.ai>


On Wed, 14 Oct 2026 15:59:36 -0700, Abdurrahman Hussain wrote:
> of_overlay_remove_all() has no in-tree callers.
> 
> It is also subtly broken. It passes &ovcs->id to of_overlay_remove(),
> which zeroes *ovcs_id once the changeset is reverted, before calling
> free_overlay_changeset(). Through the aliased pointer that zeroes
> ovcs->id itself, so free_overlay_changeset()'s "ovcs->id > 0" guard is
> false and both idr_remove() and list_del() are skipped: the
> overlay_changeset is kfree()d while still linked in ovcs_list and
> registered in ovcs_idr.
> 
> Rather than fix a helper nobody calls, remove it, along with its
> !CONFIG_OF_OVERLAY stub and the paragraph documenting it in
> overlay-notes.rst and in the zh_CN translation.
> 
> ovcs_list itself stays: overlay_removal_is_ok() still walks it to check
> that a changeset is topmost.
> 
> Reported-by: Sashiko AI <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/20260901014554.83A8D1F000E9@smtp.kernel.org
> Suggested-by: Rob Herring <robh@kernel.org>
> Link: https://lore.kernel.org/all/20260928182658.GA185307-robh@kernel.org/
> Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
> ---
> Changes in v2:
> - Drop the one-liner fix and just remove of_overlay_remove_all(), as
>   Rob suggested: it has no in-tree callers, so there is nothing to fix.
> - Also drop the !CONFIG_OF_OVERLAY stub and the paragraph documenting
>   the function in overlay-notes.rst and in the zh_CN translation.
> - No longer tagged for stable: a removal is not a backport candidate.
> - Link to v1: https://patch.msgid.link/20260917-b4-of-overlay-remove-all-fix-v1-1-920441cecae2@nexthop.ai
> 
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> To: Alex Shi <alexs@kernel.org>
> To: Yanteng Si <si.yanteng@linux.dev>
> To: Dongliang Mu <dzm91@hust.edu.cn>
> To: Jonathan Corbet <corbet@lwn.net>
> To: Shuah Khan <skhan@linuxfoundation.org>
> To: Saravana Kannan <saravanak@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-doc@vger.kernel.org
> ---
>  Documentation/devicetree/overlay-notes.rst         |  4 ----
>  .../zh_CN/devicetree/overlay-notes.rst             |  3 ---
>  drivers/of/overlay.c                               | 23 ----------------------
>  include/linux/of.h                                 |  6 ------
>  4 files changed, 36 deletions(-)
> 

Applied, thanks!

