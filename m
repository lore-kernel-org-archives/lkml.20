Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEDBE5328B3;
	Tue,  8 Sep 2026 12:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788868814; cv=none; b=Ei++3EJQ4D79qacBP7bHPE59zZ5fIiLqzwKvBf7/9BZt8xtqIovhlr5aKtCbXuT7M9/H0zKLdGYguHjuAhJMLTfupdsnifWEqAyn+b5o0rUHysYJ8NpxCnHtCFTw7zDQMeFdgw7xujtdvhXvRsAzk/opEzCpTfjJvszGy8ceSxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788868814; c=relaxed/simple;
	bh=W8i82HOkiZbVbSBZCtn5Kofxi2cYhcgb58khxqBCrRA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dM/AkOS0v5DorC3f7tEsQsjw+pTgTXS9iDDvBxmyKDZMIXCrUlqKcIul+Jcm6TWKtx50Gl+ozDn9bDJSrKCkzQhYPs0bFHA5b6x6ZMiRLbUOwr3zxV4VoVzgJY93mXNctbObykUkwB5FebuD+u1khXu5GjxRdGkGTESDMoNIEYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LkVvsKPS; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LkVvsKPS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788868812; x=1820404812;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=W8i82HOkiZbVbSBZCtn5Kofxi2cYhcgb58khxqBCrRA=;
  b=LkVvsKPS2RoqtCBfVtdptMPgVvS8w0kFBwF80JotWcUNMl6Xa2TMNRYx
   YmEg7hTb/JSe7DrQsjWSaNXs2oEJMsvB5p7yOnOwgYNlc3TjHgdtPDm5F
   uqWis2MXjU1IWGciRXiQA+18Ey0jf1Wd5ssUVEZHVh9bCtk5J951eUWHO
   cBCYBbSU3ZEchqqgkIghFJnDHFui439GEsnkKHKblqy9O71hVemTjZerW
   0yudj4WPiy0GcA7+cJPm5ryphSjRq/Y0arTXUW2sG284grHYjk4OhWUXT
   6QLGiJaqd2N6X9sF0SYPt9Xde/lUuQg1K4AXEFkuVq+UKlofQMPFwiduu
   w==;
X-CSE-ConnectionGUID: Oj7bv9X1QXeQNTk5fIKmJQ==
X-CSE-MsgGUID: 1tFAZGHQS7G62E/ntEFJyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="100625101"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="100625101"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 05:00:11 -0700
X-CSE-ConnectionGUID: eahnnXcoR9aH1T7npJNTXA==
X-CSE-MsgGUID: RWz8rladR3e4r9kcUpNVlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="274502608"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa003.jf.intel.com with ESMTP; 08 Sep 2026 05:00:08 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 555E399; Tue, 08 Sep 2026 14:00:06 +0200 (CEST)
Date: Tue, 8 Sep 2026 14:00:06 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Sven Peter <sven@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
Subject: Re: [PATCH v2 01/22] usb: typec: Add alternate mode state notifiers
Message-ID: <ap_4xnV_SJg1FoL_@black.igk.intel.com>
References: <20260906-b4-apple-soc-tbt-v2-0-1f80085f93fb@kernel.org>
 <20260906-b4-apple-soc-tbt-v2-1-1f80085f93fb@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260906-b4-apple-soc-tbt-v2-1-1f80085f93fb@kernel.org>

On Sun, Sep 06, 2026 at 08:36:24PM +0200, Sven Peter wrote:
> The Apple Silicon USB4/Thunderbolt driver needs to be made aware of
> cable details and whenever USB4 or Thunderbolt is entered. The cable
> details are already available as part of the typec subsystem but there
> is no way to get a notification on typec_altmode_update_active() so
> far.
> 
> Add a blocking notifier chain to each alternate mode and call it
> whenever the mode is activated or deactivated right next to the already
> existing sysfs and kobject_uevent notifications. Replay activations when a
> notifier is registered.
> 
> Signed-off-by: Sven Peter <sven@kernel.org>
> ---
>  drivers/usb/typec/bus.h   |  6 +++++
>  drivers/usb/typec/class.c | 59 +++++++++++++++++++++++++++++++++++++++++++++++
>  include/linux/usb/typec.h | 16 +++++++++++++
>  3 files changed, 81 insertions(+)

...

> diff --git a/include/linux/usb/typec.h b/include/linux/usb/typec.h
> index 10a783b738ef..914a6f0844c5 100644
> --- a/include/linux/usb/typec.h
> +++ b/include/linux/usb/typec.h
> @@ -19,6 +19,7 @@ struct typec_plug;
>  struct typec_port;
>  struct typec_altmode_ops;
>  struct typec_cable_ops;
> +struct notifier_block;
>  
>  struct bus_type;
>  struct fwnode_handle;
> @@ -184,6 +185,21 @@ struct typec_port *typec_altmode2port(struct typec_altmode *alt);
>  
>  void typec_altmode_update_active(struct typec_altmode *alt, bool active);
>  
> +/**
> + * enum typec_altmode_event - USB Type-C alternate mode state event
> + * @TYPEC_ALTMODE_ENTERED: The alternate mode has been entered
> + * @TYPEC_ALTMODE_EXITED: The alternate mode has been exited
> + */
> +enum typec_altmode_event {
> +	TYPEC_ALTMODE_ENTERED,
> +	TYPEC_ALTMODE_EXITED,
> +};

Mode entry and exit are not the only state changes that can happen.

> +int typec_altmode_register_notifier(struct typec_altmode *alt,
> +				    struct notifier_block *nb);
> +int typec_altmode_unregister_notifier(struct typec_altmode *alt,
> +				      struct notifier_block *nb);

This is basically a partial revert of this commit bbe80c9a89b8 ("usb:
typec: altmode: Remove the notification chain"). Can you check if it
would enough to just completely revert that one.

Thanks,

-- 
heikki
