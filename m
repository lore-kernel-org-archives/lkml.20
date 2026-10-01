Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A77C64A0911
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 12:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790856509; cv=none; b=a8wZOKVrmwK2EeNUM8NrIhKK/0rmokewuC3lzkjegAC5142aaj9F7hH9hunVLHX+ROO0B3kanrd0G14OU4sP3ARezKCTrX+GC81hgGvPoFNMCyg+prWZn426dDiHoFf8iO6qstR64jYCW8hXPecOr8ZpKBLfPs7sC+Ey4eC3xso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790856509; c=relaxed/simple;
	bh=ySkViwPd+/y9z/0LpuDhq2ZGRUq0zC7P6bSMhKNJfZg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sZxkt6zkoV2AubOu/GKACy5k1PDYzTJai3bwfD/VTb3kzg0Vu/XDuptOUzNJFZHsZXTBgoaA39DHZrRft7MgOfi3CJA/NXVgrmu6CtSKnHOcJ80J9I+uj+dUglUJW+6M3vLibmNU7RTAs9dzWGkWT786pggAkZ/QW7zqJ3pjXcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=J7EGBoEC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="J7EGBoEC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64A721F00899;
	Thu,  1 Oct 2026 12:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1790856491;
	bh=mlHyUPkAKhtnaRHqk4oTW7GqOpQjsIndexSVdjrjBbo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=J7EGBoECmsrailKaJlWvcrwz9QroxtVIL21W8kCcnGLQn0h6dfObOjf2Fq2+Y0mfo
	 k45F9+WtYYK1dDO6+vhAYPsLT3Xe70T/160MNZyggPu9JVDjb6AD3s0xT7XOYesp0t
	 /dzsAAuZot/jZe2ql9Qnul0DlGwjVTbVgZ3mBAI8=
Date: Thu, 1 Oct 2026 13:57:18 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jiawen Liu <1298662399@qq.com>
Cc: Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrei Simion <andrei.simion@microchip.com>,
	Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] misc: atmel-ssc: handle clock enable failure
Message-ID: <2026100111-tinwork-unglue-3b65@gregkh>
References: <tencent_95E7173942FAE82639FD03E6FFCE5516D60A@qq.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_95E7173942FAE82639FD03E6FFCE5516D60A@qq.com>

On Tue, Aug 18, 2026 at 05:22:40PM +0400, Jiawen Liu wrote:
> Return error from failed clock enable.
> 
> ssc_probe ignores clk_prepare_enable return before register writes and
> unconditional disable_unprepare. Unchecked prepare/enable may be
> unprepared on failure.
> 
> Check temporary pclk enable before SSC register access in ssc_probe.
> 
> Signed-off-by: jiawen <1298662399@qq.com>

Does not match your From: line :(
