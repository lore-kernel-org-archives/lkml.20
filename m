Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794769539;
	b=tzYTC1SoqiLxq3IQZ+GtmmuKYVpqg64k8hYow8r5hhKa/GRjrvtZlVP9VOIjb0xdSky/
	 ipcrrVuSDB8ZkWmC453tFSxI+yHmUOijlmuS/yzvd+FpculKDfJyIGMqsHAlo2VxxCMat
	 Cxx1Hm/a+0nCuZ723Xs7BhCEiKGivOZtmt3EIQm3gl+NaMD1HmajvblTeBPJ0GYTHuIEd
	 UtSGDwbZgx3j8R2H1rzbtMMdKZAuQ2QncD18+PsVv8y40B+Zn3la/d9Z6fkpNpKpzyB/T
	 hFn62wcIXn/wUJLMrYNEjpF8GVPndDQg4+75R4LXZgLONrKRL71dZ3rvp4RJrh1RsUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794769539;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=Tq4xesdJVsYbFH+IE5YV62oCmAd59kf6PcxuL9nbRkA=;
	b=JLDq1xYOh7cjguzXmyAwjuo0NRI/qdWoLuIgFLegvEaJFKYWZiC/de8ZXsrjJZpQR43i
	 JkAHZ0KqvSYy4V5rh/f8MSTv9E3cWZ678DR29vaAb1HMgcjUN4UzA++Y1gK+8A7ZcqH4F
	 6hKmLhprqL/neIgc2ccafgNCjohAoqMeJCFE+VYNS6ZIn2AaLEZjcgacAwMA5vaZILYBs
	 PCLXrUKAzLy878hTKG7nrtda8MPG4YZ2gVPF5u4rrSXxUiyTel2XjAFteWC16c/5TVHgg
	 6OotvDfbGA1T9UisD9iQoKoAeMiClI6yMMdsgQBMhjAEcSpsyUQ1jA/iirOuMPCBZTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Db7PmKDT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CAC1606A31D;
	Sun, 15 Nov 2026 19:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Db7PmKDT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B00341F000C4;
	Sun, 15 Nov 2026 19:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794769539;
	bh=Tq4xesdJVsYbFH+IE5YV62oCmAd59kf6PcxuL9nbRkA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Db7PmKDT/TzzMefz4L2Q8CxwgU86jKruAxcVdcXprSfHKn9Hp18exqmN1XCRrfKMT
	 1gRvJpr6wrRE1oIVI9erRm8Ny67+Wwu9cInGnz3A4zsqNTHJeL71wwqguubfzgIiH1
	 7QyVVBsHhg9f8Z1RxiYhw5vjQJBwSQ9fN/Gc4hVvKlqgBaLVQGtGFgxxtGws/tOXiM
	 T3P+Izf4rUJP891jgQ1YtqPMcmleRB6IJr4KBUYBXeFbi1IxWu07GFKFAo4ahojMOi
	 LT52UKbizjKClU7TFAx+5Mq03uaObcXXQIxfq0Zhc5cqDMgbLa10HiUpnflcII6Rr3
	 Xl7n8FPNCzHdA==
Date: Sun, 15 Nov 2026 11:05:38 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: "Frank.sae" <frank.sae@motor-comm.com>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk,
 davem@davemloft.net, edumazet@kernel.org, pabeni@redhat.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 lingyu.zou@motor-comm.com, xiaoyong.li@motor-comm.com,
 jie.han@motor-comm.com
Subject: Re: [PATCH net-next v2] net: phy: motorcomm: add YT8831 2.5G PHY
 support
Message-ID: <20261115110538.20b35287@kernel.org>
In-Reply-To: <20261109064332.3381180-1-frank.sae@motor-comm.com>
References: <20261109064332.3381180-1-frank.sae@motor-comm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon,  9 Nov 2026 06:43:32 +0000 Frank.sae wrote:
> +/**
> + * yt8831_read_page() - read reg page
> + * @phydev: a pointer to a &struct phy_device
> + *
> + * returns current reg space of yt8831 (YT8831_RSSR_FIBER_SAPCE/
> + * YT8831_RSSR_UTP_SAPCE) or negative errno code
> + */
> +static int yt8831_read_page(struct phy_device *phydev)

You need to format the return statement correctly, kdoc requires
the following format:

 * Returns: current tag..

this patch triggers:

Warning: drivers/net/phy/motorcomm.c:803 No description found for return value of 'yt8831_set_wol'
Warning: drivers/net/phy/motorcomm.c:964 No description found for return value of 'yt8831_read_page'
Warning: drivers/net/phy/motorcomm.c:1005 No description found for return value of 'yt8831_write_page'
Warning: drivers/net/phy/motorcomm.c:803 No description found for return value of 'yt8831_set_wol'
Warning: drivers/net/phy/motorcomm.c:964 No description found for return value of 'yt8831_read_page'
Warning: drivers/net/phy/motorcomm.c:1005 No description found for return value of 'yt8831_write_page'
-- 
pw-bot: cr
