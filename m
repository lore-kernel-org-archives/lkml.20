Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64BED438011;
	Mon, 28 Sep 2026 13:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790601172; cv=none; b=YBIXUMw09WxOhAwLbmfaznQ6nF+sDMRwcuIhlrC2jJeCqzxCSW1r2CxzaFJGD3kUfDrPkDsLkcrYPqmzGCZBgOQuFqgaEDnDlZHpGtEVssC/aeaKoGy4GwPes8y6MncwhQNR8KZK6srsveLzcMH30xOoFS4aXZLJyiF6wfotpJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790601172; c=relaxed/simple;
	bh=/stbMzjdJiBVrxr9jTsHUHl7oNQo7QKAbDD5SufJXOc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z1kR0TH0k1edUYZ3mKOG8Gkrt7h6sBUI2x6wlstoLvC8JrPc8qyh7iQ2fG325w1UlNIH1tZXntKDj5QaahbawBwepqqkggJUM4ZLJnhYJdXUHW1zKr0SC4orL3yc5DpNZ1oCd01FCUm5HdsYglRSLfdNbuxR+98i6I2ad//uwuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HtnS9MMj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HtnS9MMj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AB021F000FF;
	Mon, 28 Sep 2026 13:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790601171;
	bh=/stbMzjdJiBVrxr9jTsHUHl7oNQo7QKAbDD5SufJXOc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HtnS9MMjcAllesEvsoFtx85dI1eAboYTnrjnVT2RZ1XICB93FQfXl/CAZyH2/GrtH
	 jx4fiEvs2Ur0peg5EfIUvQs5DNsEBCzAywTlv+JmI0U1DLfy83HOAOZxP5doG1q5Os
	 PZA91Gpt4OhXtrGEESrhkhiFVuendBPJrglyf2wnX4zgijJrJBCYtpkMwOUxWZdJAa
	 zcjSTi1efXzifS8/b/WunI3kxipmKW6V/b5nI0f+IrFgDm9ZpO22hOxq6XhKWacSep
	 u+3rMnCuc6C9OFkCbiNXrtXf+JVmmmvhPhJdLn7hAkYSfnU7EF+kTZt2oLWX6T5AQe
	 HWviUPFjRdqyA==
Date: Mon, 28 Sep 2026 08:12:48 -0500
From: Rob Herring <robh@kernel.org>
To: Alexander Koch <mail@alexanderkoch.net>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Khanh Le <khanh.le.xr@renesas.com>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] SoC: dt-bindings: asahi-kasei,ak4619: Add PDN GPIO
 support
Message-ID: <20260928131248.GB3834499-robh@kernel.org>
References: <20260928114019.1441752-1-mail@alexanderkoch.net>
 <20260928114019.1441752-3-mail@alexanderkoch.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260928114019.1441752-3-mail@alexanderkoch.net>

On Mon, Sep 28, 2026 at 01:40:19PM +0200, Alexander Koch wrote:
> Add documentation for optional property that enables operation of the
> 'PDN' pin during initialization:

Also, s/Soc/ASoC/ in the subject.

Rob
