Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8893D4AF694;
	Thu,  3 Sep 2026 13:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788442033; cv=none; b=Q5/THg5OqVAL1E8JQu5s6DINSc/Ze2ECM/h3i0DZ6SPaQM/dUEJFoyaCazirLc2xms3110AkIfkX42sBHKLsXT6v4OoEID8Do43gkh4cPD82ifoIE3QcOuENOhSSonhOLI7sp9gbo41UN18BIjlAfdti3kXFA0WLyLN8xqs8WIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788442033; c=relaxed/simple;
	bh=mtUjoY/8GQw3j+4LddYJOpy7LT5LLyBQQqH7Kwfxv3g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=fldiukYKLmkwSXT2mWWiMusM/6IfEgccGUofCfDBREzK4lawH7Nr9zYTLARK2YYHYvRAPpwte3dNlKFN4OicqX0S430gt414AS7tikXG5Yz6gSmB5RDkx+mNXUSBviPS50m58g+13XbEvHKx9qOIgaO6A/KJCkge4pbRESah3zM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SqFKr0ut; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SqFKr0ut"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6698C1F000E9;
	Thu,  3 Sep 2026 13:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788442016;
	bh=lw9ViF11wKPe2eKXPB/tavLAOnAsDBdRW/k9AIyj8Qk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=SqFKr0utGQjANyHvbK5Djw6fBwLNrF8U3hBf8iQRDQoac5/+Ke7Ve9edLLBlUxQu6
	 cm/6CUvQbmwHMrQk46/DcwH76YCFm9O2fhAqo3kvuMmyCzoqgLeIsjrqz/TMoDNTz3
	 +JpCjaJ26u0gHIHUctHQ3eyoyIPzMYBPJNAQJOhGleOoiS7AHs/TE1Yp1vY9ceBvOr
	 OCetID+mI7oz2mythUez3gYOCfvy0dWAeU/KO8/JK9hW/xsy7Knw/MoRar77qqDzKd
	 Hm4m1yb/ghyk7X5heBmLkougL3MFB+68+1v9pkKTZJ+gusGTwfALJMacEq6qDqJWCx
	 cdcuBWXtkIFmA==
From: Lee Jones <lee@kernel.org>
To: support.opensource@diasemi.com, lee@kernel.org, 
 Hiroki Nakajima <3na7nanana@gmail.com>
Cc: mfd@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <20260823174248.833535-1-3na7nanana@gmail.com>
References: <20260823174248.833535-1-3na7nanana@gmail.com>
Subject: Re: (subset) [PATCH] mfd: da9062: Use DEFINE_RES_IRQ_NAMED()
Message-Id: <178844201513.2653879.2045887825159053688.b4-ty@b4>
Date: Thu, 03 Sep 2026 14:26:55 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Mon, 24 Aug 2026 02:42:48 +0900, Hiroki Nakajima wrote:
> Use the dedicated DEFINE_RES_IRQ_NAMED() helper for the DA9062 IRQ
> resources instead of open-coding it with DEFINE_RES_NAMED(). This makes
> the intended resource type explicit and keeps the definitions consistent
> with the DA9061 resources.
> 
> This is a mechanical cleanup with no functional change.
> 
> [...]

Applied, thanks!

[1/1] mfd: da9062: Use DEFINE_RES_IRQ_NAMED()
      commit: 8d0b4b0bef6538ace326afde928eb91f5bce0f9b

--
Lee Jones [李琼斯]

