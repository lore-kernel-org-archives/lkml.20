Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB0D9477985
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791798661; cv=none; b=RdrFnbEY41k9wcgY4DJN8mlP2nSLfs4CU3DgkqtApp/L04rFl47adz4yO37W72gO4OU08fTsvhM8/tO4g1KTEZ2S9Ox73j1nNpPrSuNGI7P4t8nFbx9Ll3J3XDjNCpV4gkvCEZlheLJ35Qq9dmZz299jJDq21gfavisZLg0CCNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791798661; c=relaxed/simple;
	bh=71qqR+pCMiukbKnB4A4qdR4muOlXqPo3oA15wKmYqAc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nCrwWIkXsTQsho4plAoA128DGoIM8/gxVJcepyLjX8Y9eOQraFZgD3p1iYSPZHLQCMvZrcQD3N7tYIMtKN1JbilQWHFKqTLixiXiIEFDce5rJys88CUO4ML/upALyB+sgfOJaWJa15A9M2DrYAsBnxAtmqb4tPGA7rEhuS0KKis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zaw652Vo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zaw652Vo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEBB61F0089B;
	Mon, 12 Oct 2026 09:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791798656;
	bh=mtp1EGHAfNWkCgpoDgidzM3ipP/8kfdDhQyh7QgIsls=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Zaw652VoTUaN6K8mZnOCwQawPhCNG2cDBRhGMKbL/O569B3e5eJ3dIRUTXSWJljk7
	 6+1imYqawsGZlQWRlTdVD/xuhevFiUh/bkCqEYmNfsw05LmL7VASJaokxAQrwgk6bl
	 vEThj8V9xfLQ/FDIntbdgciITt+VUYhMZiJYJCosmWgwG6dxCE+7+NNrRE7m74+DhD
	 VeMxhz7lnn+dxktFsmTVMMeyaw+zza12nj2fmYNuXNuJh3jIrMjTmP6Ubcp2N95o6e
	 i1W00VV9MA9huCtZTqrpfEGD1TEGwmJ3uNnDdfvGTen/sx7Yku2kfPeEFyW0j8NS5D
	 GNAxFq/BXnYmA==
Message-ID: <3408fb1a-b957-4591-bf75-1eb44af73584@kernel.org>
Date: Mon, 12 Oct 2026 11:50:50 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: fsl: cpm1: tsa: fix wrong clocks released on cleanup
To: Haotian Zhang <vulab@iscas.ac.cn>, Herve Codina
 <herve.codina@bootlin.com>, Qiang Zhao <qiang.zhao@nxp.com>,
 Li Yang <leoyang.li@nxp.com>, Mark Brown <broonie@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261009053720.3146117-1-vulab@iscas.ac.cn>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20261009053720.3146117-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 09/10/2026 à 07:37, Haotian Zhang a écrit :
> tsa_of_parse_tdms() gets and enables tdm->l1tsync_clk and
> tdm->l1tclk_clk in addition to l1rsync_clk and l1rclk_clk, but the
> error cleanup path releases l1rsync_clk/l1rclk_clk again in the
> l1tsync_clk/l1tclk_clk branches. The tsync/tclk clocks are leaked --
> never disabled nor clk_put() -- while rsync/rclk are clk_put() twice,
> underflowing their reference counts. tsa_remove() has the same
> copy-paste bug.
> 
> Release the clock actually held in each cleanup branch.
> 
> Fixes: 1d4ba0b81c1c ("soc: fsl: cpm1: Add support for TSA")
> Assisted-by: DeepSeek-V4.1-Flash
> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>


A similar patch is already in linux-next, discarding this one.

See 
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/drivers/soc/fsl?id=46201d760c48e771fa2febfcb0787f22c3b71387

