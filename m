Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 822B134252D;
	Thu, 10 Sep 2026 08:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789030511; cv=none; b=Tvi08Xg2tI0psPwVK4+MpcKEhQnpXEU7LPUCnClwJOMTH7i9jsDoWDUhUj/V+FheOLvPGrR4A/Y3mzca4bOh2HDSideEIKxxYXxPWA4fk7w0jHVoE9K7uIjEHBVUcIDKJ9Nnl1MY9zhoUm720+pnyImRW6ZNxirkv430TQTK1eM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789030511; c=relaxed/simple;
	bh=XcRCt2wWBi5FUPdm8silV4qj53oDXcUHtW3x3JttbhI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=omB1PDRlSpaHqPMoex9HYI6mnbAqQvoDd9LIXDESv4tEkh0eC4yWY1BvnO1ebbdj0T+PK0uJ6ftSVE0fmcc5NzS8XSHrGNETZHm3WZie2+3nw6KswEXbbOHRyBUt2POElXkbC4o8jdP/6zp7HcLI2xPh1j0fqdvMtx5Zid8eGio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NTKNowj6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NTKNowj6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A8701F000FF;
	Thu, 10 Sep 2026 08:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789030510;
	bh=6MkypYL64enajbLHCoiEDbgM4LVmFb/858jQz+T2EPI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NTKNowj6Nkvdmn9HwbRbjED6DQ6xVdsBDp07w00+yaxC6ysR2UhZx5HordqegHGZN
	 3CYwnENL6LfO1ynFisJ9rzXNX97j6O1cK8n712lJVZ1VO6WO+Lsat013vvVs1xKM2i
	 O80HojyzBMizMskG7J1sAs/zjWGZaAZOjDK4nXU15UncI89pROBY61Q9XBVsWPNnKi
	 1YjaFJLj99fpj8KxqMtF3SbVaL2WUVcOGYU+3+Zl0noPeMkFUQS49HB/JBrXtf/GLo
	 QvDRgWtC5JdgW4GBX3v+zIuJyUW5q1H1Xr5c2uItUdTzepRNxqwNmESvKEWGYk0VJ+
	 BbIvESCNbBp6A==
Date: Thu, 10 Sep 2026 10:55:06 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Petko Manolov <petko.manolov@konsulko.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, dinguyen@kernel.org
Subject: Re: [PATCH v3 2/3] Add Draeger's M48 board to the SoCFPGA family.
Message-ID: <20260910-certain-hidden-shark-5e837e@quoll>
References: <20260909111513.2259643-1-petko.manolov@konsulko.com>
 <20260909111513.2259643-3-petko.manolov@konsulko.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260909111513.2259643-3-petko.manolov@konsulko.com>

On Wed, Sep 09, 2026 at 02:15:10PM +0300, Petko Manolov wrote:
> Signed-off-by: Petko Manolov <petko.manolov@konsulko.com>
> ---
>  Documentation/devicetree/bindings/arm/altera.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Same review... Actually, even more - subject is completely odd. This is
not a sentence (just use `git log` to learn that) and you completely
missed prefixes. Again git log.

Best regards,
Krzysztof

