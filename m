Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A4E1DF75B;
	Mon, 12 Oct 2026 09:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791798204; cv=none; b=RcRo6mkPygkM0smuikLpfodSSCv9nXI6gvwLm44LZImVvbeRsh0M9dthpu0oq3uY/cR56EpGzzDt+mQ7bQ4lBlQ1EPpbPQsODqf45OXE468swux0WxC5/jScov7+fYjkS2eZuzRi7UVxmBjgSodqRbl7TB93u2CJ9NFevODmXaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791798204; c=relaxed/simple;
	bh=3O+w6Yb/rfEfT7+xD2/MjpD5Vlk6U0mZ1nNO67z2NO4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ocDgIW53K16xzKNwj1txn17/1sp3W1zGSY/txsE72fY3RLKJt2HTj43reBIbzG3BamOLjnrr7Zb7cLEqDMc50R5FefEYC7jsrSXha/yKyQLFrlvMrdNZBbC3Mllh/Xd3VEX0b+9OTMKkv55MA4zLs0oLoNh5VMhXSATLk+/lp0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QJj8tMAC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QJj8tMAC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0DC81F0089B;
	Mon, 12 Oct 2026 09:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791798203;
	bh=xIdQC/igpl1nz8ot81cLXJwNaA5/Di/1/53YpNpdmRM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QJj8tMACfnSPnxPNlScBAT/wjfch/GQtzPrsPM0sPuZFeV5mXe2KoUY+HiU7P6mBw
	 kDt7To4qpJ+u82DGRK9iUh768v+rj9M3DW5g7g3ytynQeiIHJ5tXwjOjJMlmcLXsiZ
	 rdStoU6pIRO2jdgW9mq6k86xdeuv3hfUpISZ9PKqcOCJVTCo7TBv6/mH3gLEbzQvlO
	 pL2JVK1gEo++ge158shQqQhwF47FeygVYKDH2EffL7lwRQa3A4uAizYgdp9tvZMDHH
	 1JQH0poe8r/Frq1zViIRLFdzuoPLjhehDi+wiPXPhYuQ+qGy9/+tRU7qOij1dwV2iJ
	 mb1k6fFKw0czw==
Date: Mon, 12 Oct 2026 11:43:19 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Navid Ghahremani <ghahramani.navid@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, arnd@arndb.de, linux@armlinux.org.uk, stefandoesinger@gmail.com, 
	robh@kernel.org
Subject: Re: [PATCH 01/24] dt-bindings: cache: l2c2x0: Describe ZTE
 device-read serialization
Message-ID: <20261012-eggplant-nyala-of-mathematics-5005e8@quoll>
References: <20261010130024.177503-1-ghahramani.navid@gmail.com>
 <20261010130024.177503-2-ghahramani.navid@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261010130024.177503-2-ghahramani.navid@gmail.com>

On Sat, Oct 10, 2026 at 01:59:39PM +0100, Navid Ghahremani wrote:
> Describe the observed interconnect deadlock workaround separately from
> the ARM implementation. This property and API remain an RFC requiring
> ARM and DT review.
> 
> Assisted-by: LLM
> Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>
> ---
>  Documentation/devicetree/bindings/cache/l2c2x0.yaml | 9 +++++++++
>  1 file changed, 9 insertions(+)

Please organize your work per respective subsystems and then CC actual
maintainers.

If this was intentional due to RFC, then it's fine. I am dropping
everything from DT patchwork as it is marked as RFC.

Best regards,
Krzysztof

