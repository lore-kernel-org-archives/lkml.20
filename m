Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EEF5579815;
	Tue,  8 Sep 2026 15:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788882996; cv=none; b=e5dCdxgZBP2CoHv5swkAHpkH1AaUHQyxx577vah6jSd5RZ7P22ykip17iFQyPYvIyZcGMYslgcSLDJm59TlvYoK+ys7oZw9x4KE5QYgvnBly6fcfg/Gvb2VqIRC/f05Tp7me0pO1K124IaKcD1NKCOKd/w1WbWimhHcRivlshA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788882996; c=relaxed/simple;
	bh=bgGTg7AIvSl8TrPSZ5iXvDEx/sXnRLRPObuk8inb50Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aFVewhTPrQX8gvoy6Qe96zYZD6D+cyQlixhRlUEIVZ28GkH21nbe3SEYM1KV45qxAL35qkg7CKyWZlmB3qFziac8KdMiPyj8E58cTjjmiomo29DuakNQn9gUv+nlsfOIAZSt9tIaY/+DVFxURI35y8SIe9sPuucTrtX46qOKusQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=deCWNnZ2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="deCWNnZ2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BA731F00A3A;
	Tue,  8 Sep 2026 15:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788882994;
	bh=sLFxr9ERzMOwRmfNohSacYm8DdBRRyU8CpJZ0uhark4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=deCWNnZ2UOqbSJc0sV+LQiCShgEaY1Zyh1zP6x03+ohUaJ/V5KdV4cJv7KzDJNkOS
	 GMrJQtuXVANdXphLKz4h6K8Ypet6piqhU46zph1Kw98agRaKKMafLnSiE+F4btgqc5
	 hkMA2j9AX8hOCbECzdvqzVjYIjhql2Dcs4R8gKVSeb+M6ApcXIuluv9hd+3BDKDixW
	 6TfigBXYeAVZTp36gMyuGZg3PZXvz8LpjGte2kCONDQeBTitePuojjJMRuX6AxR0hw
	 jFwj/JXAQX3B9qzXIpmIAyuIcW9qzYRmMWzs1w1JLK87hSknG4ohpp5Urrwq94DpVO
	 VWXKpup38jEUg==
Date: Tue, 8 Sep 2026 10:56:32 -0500
From: Rob Herring <robh@kernel.org>
To: Tapio Reijonen <tapio.reijonen@vaisala.com>
Cc: Peter Rosin <peda@lysator.liu.se>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: mux: gpio-mux: Add enable-gpios
Message-ID: <20260908155632.GA3264563-robh@kernel.org>
References: <20260904-add-external-mux-enable-gpio-v3-0-1b868e669e43@vaisala.com>
 <20260904-add-external-mux-enable-gpio-v3-1-1b868e669e43@vaisala.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904-add-external-mux-enable-gpio-v3-1-1b868e669e43@vaisala.com>

On Fri, Sep 04, 2026 at 06:17:36AM +0000, Tapio Reijonen wrote:
> Analog multiplexers have an enable input besides the address inputs. On a
> 74HC4051 it is the E input: with E high, all eight switches are in the
> high-impedance off state, independent of S0 to S2. A 74HC4067 works the
> same way with four address inputs.
> 
> Two things need that input. The mux-controller binding describes an idle
> state of disconnect, which a gpio-mux cannot reach today because the
> address inputs always select a channel. And the address inputs are plain
> gpios that may live on different gpio controllers, so they are not
> updated in one go and the mux passes through the intermediate addresses
> on every channel change unless it is disabled meanwhile.
> 
> Add enable-gpios to describe the enable input, and require it for an idle
> state of disconnect.
> 
> Signed-off-by: Tapio Reijonen <tapio.reijonen@vaisala.com>

Missing Conor's ack.
