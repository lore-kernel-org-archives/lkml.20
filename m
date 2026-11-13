Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794602426;
	b=ILBhRsJ/I7faUGHgKxUVzMaPgZeTlnxdRfYEkzYAEwY7yTRHdWcQl3X52Pc7M9wlENXe
	 S4E0R4e77cbll+QIjG9u8fOF26feVmwe3eY+koiFntwLw+8Kz2Hrvjiztmg8e6DZiAzmP
	 doVQLllJdghXdMkzLTqlr6c4othsFZO8Va0NFafdYDIDpsmROJmBiro/RpgMEu5MXKXly
	 1RJLShDONKwrayjsZxhryF0ccqhJP2l1jGBet1xf4PORadt12M8UMB9MK3F6vhQDYKtC+
	 zY/7OONFZf+frL3no4jxyeS6OOoZu5qK3IrK9ivTnj9uZrP5c+xnRCNI+R4whn866Lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794602426;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 User-Agent;
	bh=Gva92hpZXsSkRMkfT0SQN1NM3rMcVOHaB5xwNHXkVls=;
	b=KjejV4Kn8icexWv3frB864QauDFDFzqpZouAOIrLIAQuq0TdzChdDa189CtyzIe6br5g
	 4XaiTAzJZORupyZbyso1sVzrpmhA30aKHOEdWGi/E/RI89jKG0e3/xPUdKwJH2VFh19F5
	 nJ90EL5MgRgWVRkxp1j6+kQZKSLa8yXTp4UvM5o+7FRUWuA+17uVcsQC/8MhceTrVWgM8
	 /M2TCGa+DdQOOwdFBgenbYnMHc290mjlQtc/jYyyCn3vCu5d0ItsXZZ4GwUO+MS+nxQer
	 TSXgqtTYkUcvYHyE/m8HjB10e+FUgj2wS6MAktgCBjyFLee3gqcvRuR1VKF1CAG5m7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kxcoLjCf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E5C606A885;
	Fri, 13 Nov 2026 20:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kxcoLjCf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44E941F000C4;
	Fri, 13 Nov 2026 20:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794602426;
	bh=Gva92hpZXsSkRMkfT0SQN1NM3rMcVOHaB5xwNHXkVls=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kxcoLjCfBeBzqhXZDuR7BTHq+RUGCA1cFvm/3viROnTB6MweNguh6OaOCFPte3TPc
	 jgwnUm3XW+P2RrT8oyHnCUk/nihTghDJtB6/ByoD7I967ZqLcy/IAAnZT352L0t4U7
	 gjmzXyvI9Nojs9TVeEvtB5kRky8JG6H7wyfhOSgVX0HcC3MClCmyZWP5RIvZxjJCVS
	 eLvYw/+ZGcL5rG7GrVU/pZYjeGvnADUFeQ/tJiwM/bk77vgmkWHuZ8xvPfsoHerJO1
	 Qs9YODx47K5OJhKz7Bj2oWuYcIZf11fyfQx/cTeAzSm4QXhI+BmZTv5IF0OfmZlFmo
	 a2LUg1lq6etIw==
Date: Fri, 13 Nov 2026 15:40:24 -0500
From: Brian Masney <masneyb@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Brian Masney <bmasney@redhat.com>, Jerome Brunet <jbrunet@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>,
	Kees Cook <kees@kernel.org>, Kees Cook <kees+treewide@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the clk tree with the origin tree
Message-ID: <avd1uEWBWWFZsKT6@x1g10>
References: <avch0WAFqmKQHd_1@sirena.org.uk>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <avch0WAFqmKQHd_1@sirena.org.uk>
User-Agent: Mutt/2.4.2 (2026-08-30)

Hi Mark,

On Fri, Nov 13, 2026 at 02:42:25PM +0000, Mark Brown wrote:
> Today's linux-next merge of the clk tree got a conflict in:
> 
>   drivers/clk/socfpga/clk-s10.c
> 
> between commit:
> 
>   4dd10fbbeb9c3 ("treewide: Convert devm_kmalloc() family to the devm_kmalloc_obj() family")
> 
> from the origin tree and commit:
> 
>   51805c5218c7e ("clk: socfpga: stratix10: register the SP timer clocks early")

We've had 4 different conflicts in the clk tree this so far this
development cycle with that treewide commit that was introduced in
rc2. The clk-next branch is based off of various topic branches that
are merged into clk-next, so we can easily rebase clk-next. I rebased
clk-next against 7.4-rc2, and kept all of the topic branches at
7.4-rc1 because I don't want to rewrite any history there.

If there's any other merge conflicts within the clk tree this
development cycle with that treewide commit, then Jerome or I can take
care of it on our end.

Brian
