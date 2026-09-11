Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A5B402B99;
	Fri, 11 Sep 2026 07:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789111363; cv=none; b=QDuIy97rtpohnaYiAH6iOf+TJmumSoAbFJs2sDgoE0q2EiZ9sxeWFXeZg/GAAUCvP9QVzvQEF6rtq5uXbPJDw5PdIIK2zCuCTvuyuMn9reGgmGqs443ftluu4Yd1sU9g22wazLe+cZEDKFx3u2JfSO6ccsScTPFjxJpNN3tOYzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789111363; c=relaxed/simple;
	bh=50IXBY7AwpN6hNA9U6XMin/cPoC2m6Pto0sxbOUYhfQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JQZM+q2YNvaT++vUHkxbWqxL4KUQcDalUlAGHyTZaVGihgM3NP45P+T2I1+eQuV8jFTY6ilXmyC/M2VSWTqidfoH/ATDiIYUDf/9ExtsvkzIlkCWtDYxXO8OFFVGwn2SSpnDwlLkwAtC/T7L+T6EKqEzyjB6u9+87Reu6z/qZFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=itFjBIA7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="itFjBIA7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA40D1F000FF;
	Fri, 11 Sep 2026 07:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789111357;
	bh=8aYR4FqXrDE153uPV2taEH6zaCiAyqbUjSVXYPQ70sM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=itFjBIA70aZyGVebec/wT7RWIFY5OfJP9l5I6swL5ktSIxnL+UhopZSnSMUSeKaiI
	 t+yeXmqjX4cTFzCRGaZu6qVFzQL5gEBV6mVaxhwJeUBLYnJ8Bvyzupfrqb8LM56LdM
	 k5K4EJCiXEzxacQ1dLviZE0eHABo00GJGdoxma8054wnfpRkSm4s88Oa7GUQvZTCIo
	 G8atjaFyKMCxfBWyu9jL4A+JZBR78EHRH1RsmhIazXx5sIvkz+J4BDg0MxaXBrQ5+m
	 PnFquE0oA8CTxqQv47klOAOwAg/lucHM5V8XxklOeR839zsBY1DladJF7SmU01eC0n
	 PblUoR+llU0qA==
Date: Fri, 11 Sep 2026 09:22:33 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dinh Nguyen <dinguyen@kernel.org>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 3/4] arm64: dts: intel: agilex5: remove usb0 in
 Agilex5 SoCDK
Message-ID: <20260911-elephant-of-great-certainty-4e0bbf@quoll>
References: <cover.1788886615.git.adrian.ho.yin.ng@altera.com>
 <6c324c1953c6fb9e217e878bdd42c06bc4b6bceb.1788886615.git.adrian.ho.yin.ng@altera.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6c324c1953c6fb9e217e878bdd42c06bc4b6bceb.1788886615.git.adrian.ho.yin.ng@altera.com>

On Wed, Sep 09, 2026 at 01:04:39AM +0800, Adrian Ng Ho Yin wrote:
> The Agilex5 SoCDK daughter card only provides a USB3.1 interface (USB1).
> USB0 is not connected or used on this board. Remove the USB0 node to avoid
> unnecessary initialization and potential resource conflicts.
> 
> Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>

Same comments.

Respond to the feedback or implement it.

NAK

Best regards,
Krzysztof

