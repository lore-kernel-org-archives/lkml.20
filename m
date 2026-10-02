Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4851732B112;
	Fri,  2 Oct 2026 10:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790938663; cv=none; b=bsxkH3/xWUVIsAVCJLo3uWErxB/3nuU2iAFULjPCk+S14Je0DbkvEE92vdhj5Ek3CeUlsSc7wOk2nAdb3/JABCpmg0hZRfk8C08UxT7+Zhfh4Sjeq7aZxfZqHigvfT6+/gqzSxv7JJmhjLN77IXqxIvHJOKYY5mMtsAKGFJCwQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790938663; c=relaxed/simple;
	bh=+skM5yR5HF6KLsxPmRb/+Y7o5CPDCAqbX49Q1i3pFm0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BAcX98Oq4UYqvAmCr3C81nwbvkYz+7wkiNX8qWn0Gyo76Ej+C3y93Yy0/5Edfib5WM+RWntQNY8M7+uFFEKrlpkbq3xhkSJg29yUc6ywSMdM3jGl6ZbfMujh6+EM39DJwirthxDElYCWFVYmO8K+IcT3e64vqgwx0uDVEX0QdsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TpAe+mkU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TpAe+mkU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60A651F00893;
	Fri,  2 Oct 2026 10:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790938658;
	bh=SHg91Ksqvf3Cvh/KCCXM4k6wGGlpfxIC6AG7VPfG8g0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TpAe+mkUIGkt8kLdcOzTU1emWa8UkRZC+zN4io2XOMLrBgeXrNNObzCGWxRuR08lY
	 JpFs0X0Vcrb+8XCcPbBHxVB5u59Mk9TF2EYKOFvQRSMEgf7cbl1qsPpipw5OnUJCiP
	 nZsu5/4zByRyx+XyG7jhgdOME26GynOHiDoGyM2NqTkBBWqpHmPgpEJA94JOWF3CrN
	 PsaseARK/tM70lfG3Ph80rwWnodetTLVi4WgZ26AQO3y9YmfD08Ldq6YrP4CUpGKnC
	 u/Z9HwIHiuPWpcHAbcp2BnSAYoJa483gk7TY+4hHI9Oe3jlMS5zH6Ra3+18C8/bTvZ
	 ZFzh9F7TvFXow==
Date: Fri, 2 Oct 2026 10:57:34 +0000
From: Yixun Lan <dlan@kernel.org>
To: Aurelien Jarno <aurelien@aurel32.net>
Cc: linux-kernel@vger.kernel.org, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	"open list:RISC-V ARCHITECTURE:Keyword:riscv" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support:Keyword:spacemit" <spacemit@lists.linux.dev>
Subject: Re: [PATCH v5 0/5] Enable Bluetooth and WiFi on K3 Pico ITX
Message-ID: <20261002105734-GKE51329@kernel.org>
References: <20260928205012.3689405-1-aurelien@aurel32.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260928205012.3689405-1-aurelien@aurel32.net>

Hi Aurelien, 

On 22:49 Mon 28 Sep     , Aurelien Jarno wrote:
> This patchset enables Bluetooth through USB on the K3 Pico ITX board and
> adds the rfkill nodes for Bluetooth and WLAN so that the devices can be
> activated.
> 
> Note that WLAN support (patch 4) is only useful with the following
> patchset, but they can be applied independently:
I will just take this patch, as it doesn't cause any trouble

For the series
Reviewed-by: Yixun Lan <dlan@kernel.org>

-- 
Yixun Lan (dlan)
