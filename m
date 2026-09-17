Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 896CB3C8719;
	Thu, 17 Sep 2026 22:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789683812; cv=none; b=BjqWknEehtkD4zaWhH7viTiKixVH92O7HuHUn7ZZMDgLe0XVFyeT55passVpp5WVwZFHIG3v3bK2+FWYBGnjorb+CNZLWM/3epYFOyX1tPj0OPyExkGl2rspyqu62R61VWoFo81dXd3KFvbqyXLXnYZCn3nXf6kTTH3JfJd/3Dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789683812; c=relaxed/simple;
	bh=0zAy9xdSFgzKJmsDXU5ND26t5Rv7FmsbYI6r6qpvkv4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C/MkvBDW/gmTbm0Djuw08IOX5yVHzcIo5f6LBHHoJc9A0/EVMQ9GkH4Wb8PcfsLfWJra87o76Gt6qXxdLX5hQRKStYxdkm3+lKuTg9nBoLd3rhd8vx09tZpxRFelpA7X2ZaRtYjPmlyLZSM6HEvI7MQc0bYCGZq7lhhN421APkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lDXuboUI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lDXuboUI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 375B51F000FF;
	Thu, 17 Sep 2026 22:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789683811;
	bh=lX+4zZ1GwgFVGnJEt+IlGAhNt0rjBpCRKN8ebt/PRS8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lDXuboUIw4VX/kXLk1tluxSVSlUPftr84fN4DHI6jOc94GmIFWar57gRDHd/DMqEH
	 LPkJawrpPI6DTOq/GbNIQMvz1m4NLc4yV+zDl5LILjJup7pIfYGdUNOAtJUzPP02X1
	 12Sq5kThOkr5H0mP/pRi9CSlFv6zep9ovZjhxhpz6TIFQp5T0jn9Wwq6wM7DQWj80Y
	 ynNTYJUa+pOP3CHwmrsXRQQD+2Hc87F/FpKqKVwt46LicLFUzR4fmikyhgEqmKnIjg
	 kmf43hsZ4A1pC9R/4EMnI7+iD1Ayn9MpWh7ZJePNYIDpMWLS2Fc2/Mq55w6wmuT3R+
	 1s08qDb1wZcjw==
Date: Thu, 17 Sep 2026 17:23:29 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Thomas Gleixner <tglx@kernel.org>, linux-kernel@vger.kernel.org,
	Radu Rendec <radu@rendec.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: interrupt-controller: chrp,open-pic:
 Fix dangling reference
Message-ID: <178968380863.4077914.17527160056576392391.robh@kernel.org>
References: <cover.1788426169.git.geert+renesas@glider.be>
 <86dd3544f7286fc117dc7ad0f6d799761283ec54.1788426169.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86dd3544f7286fc117dc7ad0f6d799761283ec54.1788426169.git.geert+renesas@glider.be>


On Thu, 03 Sep 2026 11:06:30 +0200, Geert Uytterhoeven wrote:
> The target of "[1]" was lost during the conversion to json-schema.
> Replace it by an inline reference.
> 
> Fixes: a241f1a1b338b714 ("dt-bindings: interrupt-controller: Convert chrp,open-pic to DT schema")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  .../bindings/interrupt-controller/chrp,open-pic.yaml         | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 

Applied, thanks!

