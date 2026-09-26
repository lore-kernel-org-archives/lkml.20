Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE6D72FFF89;
	Sat, 26 Sep 2026 14:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790434240; cv=none; b=Vak1hHYaooJIlIj9Sp2WKw1MfbVVjvP5hW5vVPOoL9MU+ldkAlbXdb+C/VZBUDlP4UeDrd9AbvbiZUBgqWBig0LbaDhAZ7ftUhtCn9TX6z9eR5VT/gGZSC7NmbNiiQ/8cE6nJv7Am/krBy8lr3sbxcQRaHhHxJYZJkLB3sRc74c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790434240; c=relaxed/simple;
	bh=6TluokCk0KsgJRqzrezZUSE/eFpHkaod8YXq12c3l/M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FID/15fWpNCB1eJsnhF8eGutMTybAfecxtdNB/Vbs+S8WsrDeUrP+612G8hTbLX9vYhWCb0gNyW+K/ox7WwSYxUo2cb+Q0vnEtFr0kFroj1m357vzSDJ+fkoQuvqLaL5HOfw/TlFabbL6KnbUm8Uv4Lx7JtASxKe//qhSGf9M3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WXj0k3lP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WXj0k3lP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E35AD1F000FF;
	Sat, 26 Sep 2026 14:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790434239;
	bh=IuGwpOHeRjNLjV8Fq9b30mY1ktaZg7MQmsaIKLLH7zY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WXj0k3lPQ88DhFd3NStQAZNqS4sHup391qcDa6hYjkM90tKN7ThbGSHaCKcduzRGl
	 ATk8JwvY/5nB4N8cwiXCDrSvp6CqJq1A6u7+yzCaK0dOOgyTANuobplOanHGgGAfAQ
	 LcqQWKdfogFcICJnRZRppVbOaZ29xyVMcR9i6i4cx3fWlql2u39t2NXN9oNLeO+2di
	 T1x1+OhdU28kA5lT9SYi/s4HZwvHjB1zuK+oWjV43qK8SvpP0DA5/FLu9F0ado0cPR
	 4086Ib0QouAZ4Ve2SxCv6egv87udLNzXkM8oL+L0jMCg3cxevlM+8r7YeRmTAiXf0w
	 wDNrTs1Fmga8Q==
Date: Sat, 26 Sep 2026 16:50:21 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Felix Gu <ustc.gu@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, 
	linux-phy@lists.infradead.org, linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] phy: renesas: rcar-gen2: three cleanups
Message-ID: <jcv3cggtoxl4lyzaepopm5jrk4onplqdm5gc4bnwe3bco7odih@6dyxdvfivf75>
References: <20260804-rcar-gen2-v2-0-829cb84112ca@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260804-rcar-gen2-v2-0-829cb84112ca@gmail.com>

On Tue, Aug 04, 2026 at 11:24:16PM +0800, Felix Gu wrote:

Please add description to the cover letter to summarise what the series does.

> Signed-off-by: Felix Gu <ustc.gu@gmail.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
