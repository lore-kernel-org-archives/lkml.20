Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E992E612E;
	Tue,  8 Sep 2026 08:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788855928; cv=none; b=S/l63O//ubl4mODzyRcqfzmsoOcMxlDIMqbfgIRsz5P16aaVf8dO/yJ+iwg7LG7EgUodrDzW5sct3P3ZPekzFnbf1jXP3yuL3RA1VOEX2GcaYZZHqc5vhclk1VbJSAwrqRDo92U4IwZsbCod+XbtSsq0ZzMfaB+RMi1eRljPn98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788855928; c=relaxed/simple;
	bh=MNBOqjbiFY5cvbGJa0db+s9GIphlrm1cbRc2huUpNRk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X4W4CgzIzwD4tJ+zVydJX0YHodbbLmPZK5PpYDjbcfbg8VSFZPGmf5R9qNPd9SaZ4V9h38YCe1tCFUt1pROEjt05F3iBxupr8FurzP0osrryttkghiGjvuK360VdSEZxwkl7h/FrejiSHhvWxjEpzgKENQmCUHh3y0RUlijbO5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OoRH/r9A; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OoRH/r9A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788855926; x=1820391926;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MNBOqjbiFY5cvbGJa0db+s9GIphlrm1cbRc2huUpNRk=;
  b=OoRH/r9AYaiOZ/4k9e4g/J9lTrOIaVc90W5TQKBk7ecRKGTvPxJy0axp
   h5Iggg1iWKiH0GcAgtDXdxiUemNwuGX54f1B+oMiStC1fUh7xDwTkF269
   S+JtL4f0n5eVJ98JL8FKecXI43IWOGEvmUz4nhFovICn65mR2zoh36Qw0
   99HcPtZMyNbfltp6LdWkoIaQlieFhtMhjiY9ZLk7qN+hWbRaCFVWEXfKk
   Jz0i1GM8f8FPD4jKCSyhp/dJYRXwcyKNdiHbQ6C1INPBTYt7m2HPEVMHS
   HYihVz2A5+JwPGqjGecrLAWgZ3WIM0hx+IQMI3jomaPa8tlkfcuK9dHrn
   Q==;
X-CSE-ConnectionGUID: ntRf0cCmRta7f+5Tb3ttRQ==
X-CSE-MsgGUID: 1svADnLyTg2LQxCNZUynSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="93114668"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="93114668"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 01:25:25 -0700
X-CSE-ConnectionGUID: FvNg+61LQ+2F8JqhAbC94Q==
X-CSE-MsgGUID: kH58JbXiSn2WhYPwc39J2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="269196840"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa006.jf.intel.com with ESMTP; 08 Sep 2026 01:22:19 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 08F8E99; Tue, 08 Sep 2026 10:22:18 +0200 (CEST)
Date: Tue, 8 Sep 2026 10:22:18 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Sven Peter <sven@kernel.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 10/22] thunderbolt: Unlock host router ports during
 startup
Message-ID: <20260908082218.GA106095@black.igk.intel.com>
References: <20260906-b4-apple-soc-tbt-v2-0-1f80085f93fb@kernel.org>
 <20260906-b4-apple-soc-tbt-v2-10-1f80085f93fb@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260906-b4-apple-soc-tbt-v2-10-1f80085f93fb@kernel.org>

On Sun, Sep 06, 2026 at 08:36:33PM +0200, Sven Peter wrote:
> The downstream ports of the host router may still be locked after a
> reset. Unlock them when the software connection manager starts before
> scanning for any connected devices.
> 
> Signed-off-by: Sven Peter <sven@kernel.org>
> ---
>  drivers/thunderbolt/tb.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
> index 47753a5c0f2e..bf1c192ec10a 100644
> --- a/drivers/thunderbolt/tb.c
> +++ b/drivers/thunderbolt/tb.c
> @@ -3016,6 +3016,7 @@ static int tb_scan_finalize_switch(struct device *dev, void *data)
>  static int tb_start(struct tb *tb, bool reset)
>  {
>  	struct tb_cm *tcm = tb_priv(tb);
> +	struct tb_port *port;
>  	bool discover = true;
>  	int ret;
>  
> @@ -3049,6 +3050,14 @@ static int tb_start(struct tb *tb, bool reset)
>  		return dev_err_probe(tb->nhi->dev, ret, "failed to add host router\n");
>  	}
>  
> +	/* Make all host router downstream ports accessible to the CM. */

Nit: Drop the . from single line comments

	/* Make all host router downstream ports accessible to the CM */

> +	tb_switch_for_each_port(tb->root_switch, port) {

We should introduce tb_switch_for_each_null_port() at some point, not the
job of this series though.

> +		if (!tb_port_is_null(port))
> +			continue;
> +		if (tb_port_unlock(port))
> +			tb_port_warn(port, "failed to unlock port\n");
> +	}
> +
>  	/*
>  	 * To support highest CLx state, we set host router's TMU to
>  	 * Normal mode.
> 
> -- 
> 2.55.0
> 
