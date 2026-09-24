Received: from mail-yx2-f42.google.com (mail-yx2-f42.google.com [74.125.224.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D9BA4A2E00
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 17:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790272325; cv=none; b=I48sFUYXn93lC63mJlvUWUWl8JRBHNNo4uQm7hX1rkvgq0ozJF5ZTUWjZlcTTnGUJH5J6LwQdZK/br15zY/zENtVZnEUNyU14XGUDLZJWCUBhr/bxYzNqNOFYabXBA4NUX+uQPypBJTSjROi9xpsI8OMpPxafRzDV187+lbl9Vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790272325; c=relaxed/simple;
	bh=lqKZKprNseAnNL68Qm48AJ7YdmaWNYaS2rikkdTye3w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fqj4SNg43vnrtuNdsMrbCWu/d/3ZOo+MB4Uxgnf5khIhmd2365Ima98YOkB4PPLfpOdKX9sMTIKGC6csU4JNJonQOaQWwDluculjtHvuOzyRc9vZCinX2pStt8Ulvjw2zdeQr+WEiWKB2PklrJgw76BsyaYsAvXFicp+NG0dvAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=W3UYRyOC; arc=none smtp.client-ip=74.125.224.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="W3UYRyOC"
Received: by mail-yx2-f42.google.com with SMTP id 00721157ae682-895fd505832so810167b3.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1790272322; x=1790877122; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=l5iUQbHVoGs8+CjCsGk4c/TY+BmqzXWWcR0ocJIehM8=;
        b=W3UYRyOCCUlfR0V5biCtyvIzeSt5vDf1cLOJTqVxGVFnoVgrKUzh/iTPbVYY2E4iH+
         c1LBhX5O3jOWkQOlEV5j5QP8UVBsmxWRkNtS9FEyzRD2XoCHUoGD3ivl7qlXxll0sunT
         TIo9VkdQAIysfSjAy3fS2M2VoSjjIPO4lnc+x208YFjFIM4hqA5NekPSSLvmguQKflih
         hwb+1R1HhyaljVZMoxX6YheUdVBGODPCpBJKxyaw9yD2pe1qRaCbT3x37MY6Z32+7w7R
         I4N8gNPnWdlYNDqbJ03bC391I/zY5+CS5HKdRx4wr3pR0BhARyfU596xwnWVbhDLlEFF
         cW8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790272322; x=1790877122;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l5iUQbHVoGs8+CjCsGk4c/TY+BmqzXWWcR0ocJIehM8=;
        b=bd1WczpGe03W/7ZdInVPRFAPSIEKFS1JQDX0pzPQ2J6EHTaUK1MpGuvkDcu+EvwVrP
         eFTrHBiqadISHCo85LfR6E82GQ8xTAjrm6h2QzEde1cD84vd2b9oMNHpjYmqIc6V0lO8
         6SCBZT2aW92XUCkgrN+GJib+8JX0wGnO6VR2rPI190YzWLbAGa+Z9XrPQ1MVuqSLbNKM
         bb1+oYxrrNA53gy+bIBOq7W2BzFpd5Pf70TSGtLOyQr+Tpo9YV7B8j1Zwbi/mLuDq1AB
         +ewNLzkWpyDtFDeEizjitc/pKnaYRYCwghwW9PUQjq97yNY+b/UeP0nImXfYkd91Z8qy
         ySjw==
X-Forwarded-Encrypted: i=1; AKwUvBxq0iDBCxE/ol/hdlKgZIV9+Z0BdXLHF+Ya3NyAJC1bPszzgCKc3izZghNZWK+UBWf0iDE9ANVPENbF+KE=@vger.kernel.org
X-Gm-Message-State: AFuF++meRFgaOlqZKeFHE+fa6ROaR0d6QWOuRvK/0j1gCxU141z1gVsd
	nUO/XiHaAU9kvMBqaDZSuKrjW70nXmlLMTyYrIDF18NNR1elFo7bnlwY9i2j1f2goSs=
X-Gm-Gg: AYBFou3cwJOmolmk/nS+4tfOf/DEDm/h2f981rLQPSaSitxzdd5jOIOxZMl6oiTK8aW
	3bnK/KyS8gOun15WF7hsCTbCocKEHfX85WkidYQEdJhztNVpxyzV6K83x6ixYk4VkAtxuC3kSmI
	GWqvkE5GTm1fd6PmWeEJWROuv/Fl0IKbd738N57YHGdjU9vBp7EPR5aWsCMtZOZp+xVsLbFrmer
	w/3AZusovuSMmliXHLj7gyg0gNcSNm1uXVjJKkLsxd3odn0tUsBpQ4/kSqx0mPSUZ0PjQgxOM13
	kiORVtn2KRm/nn7puV8tMX0dtG51SZVl8E5f7/ynrfKBZCbphHuEzbts5qniJv+Kex6Wn1NAx7H
	hGpR1FCpXuL8sBQf2B0LZCBupRtuL/7mrMmHGY5riRobGSWBlTg/Bh51qChrP9kR7THeaXqTSoI
	UplUWhQqonKvt9VlBMRRPUQ9fHzIIYsZiZD/1tdarVaI/vzeBsvt0N1G/LIXfDCC73+3wjbyEtI
	OphDgb0v4tLpvLPojq0npSXVoehfXdeVTuRsl/qSE4ek6N7
X-Received: by 2002:a05:690c:312:b0:882:27d8:8ca6 with SMTP id 00721157ae682-8a64d9f08b4mr26331337b3.53.1790272321920;
        Thu, 24 Sep 2026 10:52:01 -0700 (PDT)
Received: from toolbox ([12.55.13.134])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a86106b298sm165627b3.46.2026.09.24.10.52.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 10:52:01 -0700 (PDT)
Date: Thu, 24 Sep 2026 12:51:42 -0500
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Drew Fustini <dfustini@oss.tenstorrent.com>, 
	Joel Stanley <jms@oss.tenstorrent.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>, linux-riscv@lists.infradead.org, 
	linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: tenstorrent: use regmap_assign_bits() for
 conditional set/clear
Message-ID: <lv37wl3d5oonioc562vl25hs5yfytqpi3qlmxk6c27tmjbvqrb@msrlsxkbisji>
References: <20260924083439.461769-1-peng.fan@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924083439.461769-1-peng.fan@oss.nxp.com>

Hi,

On Thu, Sep 24, 2026 at 04:34:38PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Replace if/else blocks using regmap_set_bits()/regmap_clear_bits() with
> the simpler regmap_assign_bits() call.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/clk/tenstorrent/atlantis-prcm.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)

Thanks for the fix.

Reviewed-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>

> 
> diff --git a/drivers/clk/tenstorrent/atlantis-prcm.c b/drivers/clk/tenstorrent/atlantis-prcm.c
> index 6d4386eeb7dae..854b9c48816f2 100644
> --- a/drivers/clk/tenstorrent/atlantis-prcm.c
> +++ b/drivers/clk/tenstorrent/atlantis-prcm.c
> @@ -205,14 +205,9 @@ static int atlantis_clk_gate_endisable(struct clk_hw *hw, int enable)
>  {
>  	struct atlantis_clk_gate *gate = hw_to_atlantis_clk_gate(hw);
>  
> -	if (enable)
> -		return regmap_set_bits(gate->common.regmap,
> -				       gate->config.reg_offset,
> -				       gate->config.enable);
> -	else
> -		return regmap_clear_bits(gate->common.regmap,
> -					 gate->config.reg_offset,
> -					 gate->config.enable);
> +	return regmap_assign_bits(gate->common.regmap,
> +				  gate->config.reg_offset,
> +				  gate->config.enable, enable);
>  }
>  
>  static int atlantis_clk_gate_enable(struct clk_hw *hw)
> -- 
> 2.50.1
> 
