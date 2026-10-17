Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FCDF394470;
	Sat, 17 Oct 2026 16:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792255619; cv=none; b=qWp+M+dYrgjpP2yGuw7RaQVY0VdLvHJ5x/cFXaUmE/MXPrYJrgh6XVruNY1OHl4vor97rXd3yZ+Ci4n92spVkXajkgj8aDpr9IbkvtMBYvHEVXGD0GepLQrtioQN+hw7mrbobQM/tK1qUdDB/WUGVM5ZKWfOZvROE8cYB0vlz8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792255619; c=relaxed/simple;
	bh=CQbrhhLKidtf1UWtdAEFbq90r73GdHLgD5eJk2qWG80=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DJIT+gM3NSpztJbMs8G41+USXIQFJUF58XhEtMLzvHKJhSIyGfxsFhzkAIDKrF4/wOe9InlhEh8+ri3uj6g86oJLqD4E5rqrS+oQV5x/ZhTEP1Wu6Tav5Fr+e/W2QaeThhay44PjYD3TLnoYWPlvYIjfNfFrTencpTN1uZaUFxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=muK3phXV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="muK3phXV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49BBF1F000C6;
	Sat, 17 Oct 2026 16:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792255618;
	bh=2L9t0PStXoy1aMEjoZZmzqqaAJGqJKhPaP/NUg0hXmE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=muK3phXVaW36MMzWTXlUWfd/hjD3JMMqe/tKxhpbIdWBiUPf0iF7W2mwV0BYsYbJp
	 BYdJwfAeXMTyD6K7ZQty1RSkVNIesW18vfg32Nnxf7UcdYzFZfkZvB7vIm2TZXy7/Z
	 /mZkSUyK5U7VKXvkLQUdx3z0/j1jNxCRz1lKuNxuuEG32HXraQxSS8TkgDqqxqqF81
	 6kWpK3EUIMCqpimN4cAdQ6HIDSF191qc6CCBtt7fHyXPMPUDg+nU2JhAXfKUnLlByn
	 szkHFX4dLL9JdQKOqNLT+xODVSLDjQ/ti8ve0Cw4BXLtlgQBJ7QmBg45FgmjLx7TX2
	 rimfr7+Zekthw==
Date: Sat, 17 Oct 2026 18:46:55 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Frieder Hannenheim <git@fhannenheim.net>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Robert Oscilowski <drgitx@gmail.com>, =?utf-8?Q?Jean-Fran=C3=A7ois?= Bobier <jf.bobier@gmail.com>, 
	phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: oneplus-kebab: new device
Message-ID: <20261017-lively-trout-of-hail-8fbaed@quoll>
References: <20261015-kebab_dts-v2-0-e783463bffd3@fhannenheim.net>
 <20261015-kebab_dts-v2-2-e783463bffd3@fhannenheim.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261015-kebab_dts-v2-2-e783463bffd3@fhannenheim.net>

On Thu, Oct 15, 2026 at 02:32:37PM +0200, Frieder Hannenheim wrote:
> Add initial device-tree for the OnePlus 8T. Downstream reference is [1].
> 
> [1] https://github.com/LineageOS/android_kernel_oneplus_sm8250/blob/lineage-23.2/arch/arm64/boot/dts/vendor/oplus/kona-kebab-overlay.dts
> 
> Signed-off-by: Frieder Hannenheim <git@fhannenheim.net>
> Co-developed-by: Robert Oscilowski <drgitx@gmail.com>
> Signed-off-by: Robert Oscilowski <drgitx@gmail.com>

Your SoB is the last. Please follow closely submitting patches document.

Please run scripts/checkpatch.pl on the patches and fix reported
warnings. After that, run also 'scripts/checkpatch.pl --strict' on the
patches and (probably) fix more warnings. Some warnings can be ignored,
especially from --strict run, but the code here looks like it needs a
fix. Feel free to get in touch if the warning is not clear.

Best regards,
Krzysztof

