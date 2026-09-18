Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE38A4C10C1;
	Fri, 18 Sep 2026 10:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789728291; cv=none; b=kboPbkcEpHvK2MT8VsneUrmFb3jBZALnnnFBr4hejL85fd2LPgyysNQHrmBV7NshD8fFqXrk/1UK+C0nKLnphXzJzAFXz5LvcNZEqwWu4TPcBsEYXgfTcRzeBpIzAKNgVRtwYGcn7wN2rdriFiiHoWTn2Ud032rP+bChrJfLqUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789728291; c=relaxed/simple;
	bh=v4jIgm7kLc3/OdCphuswy3jA8yKFtjqPFd8AOXf20WQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IU57vLpeziSbMAvvdk5JNP354wCMLZxypel78Loe91KWN++cP/28nMEjfrW4f7VEs42ZGgB4ZRdGHJE9v4ctVIgHmKvtM9r1tY97TosYDRotMvnQPQ0tTjEmCu54QuHdBtgzcp2jRUXbRUYGi9eQ0SlKlAxR/fe2XlfK8zqw+lA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a/ebx6ZE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a/ebx6ZE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E075F1F000FF;
	Fri, 18 Sep 2026 10:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789728289;
	bh=hIzulSOfGcXVqsgqU0OwvsRiP5B9G3lK3Cp7l6JKQPs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=a/ebx6ZE3GhCdIC9wVB4ASAmLQpKwpiY/K9Mfznw6N9dPYwguxfHQZNhzmCWFeUv5
	 pleWqu9AShpPNcTX6adwqqadsCifUFfBKICey/vFNuzcenhmtJoYeG63IibsyvF923
	 mo39/42EPT1S/WTH9i89g0CF3Mavj472+NxSkXv9bdF74xCwUkTF4gywhCduu/NWbt
	 Wg0kFye//eV3aS5SJ/lJSmHOIQTS8C33Cqw1nsmDvTXsOa//3l39roD/PcQXNXC6SI
	 DWTHVWILJc2FGgvBQWgYZv8K2ZmDWizLGesd1Cmdwc4vetjE3mPFth0wqVyf9rgKWC
	 QTUFV4d5qXV/g==
Date: Fri, 18 Sep 2026 12:44:45 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org
Subject: Re: [PATCH] media: dt-bindings: raspberrypi,pispbe: Fix example
 indent
Message-ID: <20260918-amusing-rat-of-nirvana-cda3f9@quoll>
References: <20260917002554.362516-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260917002554.362516-1-marek.vasut+renesas@mailbox.org>

On Thu, Sep 17, 2026 at 02:25:18AM +0200, Marek Vasut wrote:
> Fix two spaces before { in example. No functional change.
> 
> DT checker reports this as follows:
> "
> ./Documentation/devicetree/bindings/media/raspberrypi,pispbe.yaml:56: example 0 [redundant-whitespace] extra whitespace before {

I already posted this for more files:
https://lore.kernel.org/all/20260801195528.235230-2-krzysztof.kozlowski@oss.qualcomm.com/

And doing such changes file-per-file is quite a churn, so better to
combine commits.

Best regards,
Krzysztof

