Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DA4B483BD5;
	Mon,  7 Sep 2026 12:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788782830; cv=none; b=agJIn8e4fn43yb/N6Xg2CblgPRud9DqFs2ZzYQz91RbJsUYYoRlh5JAbjiP82m/giN5fqljwcaxIRKql5njKBCcEtrHvSzlDP8c5yPTlBN6OrRt0HF1EweRa8/7vwQpTsagP+NxKKmhfKrRG7Tmcz7XXABmmrjXsWy+/RYAbjo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788782830; c=relaxed/simple;
	bh=ND9F90qO6dQK4v4C5NfoZV0UZvPC3wUoxDlYFSIK2qg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r+zGmbhemyLrrzhcVeX25/aokaHpDO4Iz7vmBYpalVAzNow1pXc2Z0BKPf1VrM7j5W9WOpHYCRepiSVUow/RctH8Hr4aAEsJ6SB4iOXlBwyznPL3lFjd6df/mrMb2FfgFUx6+LPJYWZdQQH8POKfH2JF2avBT/YqoV2siEBcvtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HpcvtgwT; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HpcvtgwT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788782830; x=1820318830;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ND9F90qO6dQK4v4C5NfoZV0UZvPC3wUoxDlYFSIK2qg=;
  b=HpcvtgwTSgzboBAmjSlgyNlLyYI7JSyX5zLT4/NFoPOlCmH/giCuvYaN
   NzgEYr8NAMisdSc32iFZG+Py1gZu9Fa7PULWzb0XjRQ2ksYmCxxEJhgoL
   3wq4sOVx/qs/m/2NTnfEUi1g45ba9JjvAgZv6FtutL6/BrGiLtEbH8T7Y
   9krRYqUX08LBzs7qSD+Z7TZrxpdJm0srD4wEz2Gkht+s87M9uzUGy9vxW
   +0uihhe89d6OX8/DSRuWdmpYMjw/2xXtgXrlurvIrZBpoUHCDfug+j8pi
   EWDeEvbHwXJk+sD6vv0GdO6rCEEunKU7KG2uiKtX29JD0UJR0P/cRebjC
   Q==;
X-CSE-ConnectionGUID: tl5/LYobQ4CuWp+QtLifmw==
X-CSE-MsgGUID: Fjp2l4OfQaicUp3amqW35A==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="89029254"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; 
   d="scan'208";a="89029254"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2026 05:07:09 -0700
X-CSE-ConnectionGUID: +ALH0PbKT3WlfqBX9HeSuA==
X-CSE-MsgGUID: G/Hn7BIpShSfHWbutLcJaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; 
   d="scan'208";a="272623456"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa004.fm.intel.com with ESMTP; 07 Sep 2026 05:07:06 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 6DF1099; Mon, 07 Sep 2026 14:07:05 +0200 (CEST)
Date: Mon, 7 Sep 2026 14:07:05 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Jameson Thies <jthies@google.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	dmitry.baryshkov@oss.qualcomm.com, bleung@chromium.org,
	gregkh@linuxfoundation.org, akuchynski@chromium.org,
	abhishekpandit@chromium.org, marco.crivellari@suse.com
Subject: Re: [PATCH v2] usb: typec: ucsi: allow retries of ucsi_resume_work
Message-ID: <ap6o6VKQa2Vi2YIi@black.igk.intel.com>
References: <20260904234124.2336922-1-jthies@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904234124.2336922-1-jthies@google.com>

On Fri, Sep 04, 2026 at 11:41:23PM +0000, Jameson Thies wrote:
> On resume, the UCSI driver will re-enable notifications by sending
> SET_NOTIFICATION_ENABLE. The LPM/PPM may be busy during system
> resume causing SET_NOTIFICATION_ENABLE to fail and preventing the UCSI
> driver from receiving connection status changes.
> 
> Change resume work to a delayed workqueue to allow retries on failed
> SET_NOTIFICATION_ENABLED commands. Additionally, cancel resume work
> on suspend to prevent pending resume commands from impacting suspend.
> 
> Signed-off-by: Jameson Thies <jthies@google.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
> Changes in v2:
>   - replaced system_long_wq with system_dfl_long_wq
> 
>  drivers/usb/typec/ucsi/ucsi.c | 18 +++++++++++++-----
>  drivers/usb/typec/ucsi/ucsi.h |  3 ++-
>  2 files changed, 15 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index bef3f9b71d71..459aab574b29 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -2158,7 +2158,7 @@ static int ucsi_init(struct ucsi *ucsi)
>  
>  static void ucsi_resume_work(struct work_struct *work)
>  {
> -	struct ucsi *ucsi = container_of(work, struct ucsi, resume_work);
> +	struct ucsi *ucsi = container_of(to_delayed_work(work), struct ucsi, resume_work);
>  	struct ucsi_connector *con;
>  	u64 command;
>  	int ret;
> @@ -2167,6 +2167,11 @@ static void ucsi_resume_work(struct work_struct *work)
>  	command = UCSI_SET_NOTIFICATION_ENABLE | ucsi->ntfy;
>  	ret = ucsi_send_command(ucsi, command, NULL, 0);
>  	if (ret < 0) {
> +		if (++ucsi->resume_retries < 5) {
> +			queue_delayed_work(system_dfl_long_wq, &ucsi->resume_work,
> +					   msecs_to_jiffies(500));
> +			return;
> +		}
>  		dev_err(ucsi->dev, "failed to re-enable notifications (%d)\n", ret);
>  		return;
>  	}
> @@ -2187,6 +2192,7 @@ int ucsi_suspend(struct ucsi *ucsi)
>  	 * EC is stopped for suspend; state is re-read on resume.
>  	 */
>  	cancel_delayed_work_sync(&ucsi->work);
> +	cancel_delayed_work_sync(&ucsi->resume_work);
>  
>  	if (!ucsi->connector)
>  		return 0;
> @@ -2200,8 +2206,10 @@ EXPORT_SYMBOL_GPL(ucsi_suspend);
>  
>  int ucsi_resume(struct ucsi *ucsi)
>  {
> -	if (ucsi->connector)
> -		queue_work(system_long_wq, &ucsi->resume_work);
> +	if (ucsi->connector) {
> +		ucsi->resume_retries = 0;
> +		queue_delayed_work(system_dfl_long_wq, &ucsi->resume_work, 0);
> +	}
>  	return 0;
>  }
>  EXPORT_SYMBOL_GPL(ucsi_resume);
> @@ -2299,7 +2307,7 @@ struct ucsi *ucsi_create(struct device *dev, const struct ucsi_operations *ops)
>  	if (!ucsi)
>  		return ERR_PTR(-ENOMEM);
>  
> -	INIT_WORK(&ucsi->resume_work, ucsi_resume_work);
> +	INIT_DELAYED_WORK(&ucsi->resume_work, ucsi_resume_work);
>  	INIT_DELAYED_WORK(&ucsi->work, ucsi_init_work);
>  	mutex_init(&ucsi->ppm_lock);
>  	init_completion(&ucsi->complete);
> @@ -2365,7 +2373,7 @@ void ucsi_unregister(struct ucsi *ucsi)
>  
>  	/* Make sure that we are not in the middle of driver initialization */
>  	cancel_delayed_work_sync(&ucsi->work);
> -	cancel_work_sync(&ucsi->resume_work);
> +	cancel_delayed_work_sync(&ucsi->resume_work);
>  
>  	ucsi_debugfs_unregister(ucsi);
>  
> diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
> index dc594388dcd0..1996f04ed5e6 100644
> --- a/drivers/usb/typec/ucsi/ucsi.h
> +++ b/drivers/usb/typec/ucsi/ucsi.h
> @@ -484,7 +484,8 @@ struct ucsi {
>  	struct ucsi_connector *connector;
>  	struct ucsi_debugfs_entry *debugfs;
>  
> -	struct work_struct resume_work;
> +	struct delayed_work resume_work;
> +	int resume_retries;
>  	struct delayed_work work;
>  	int work_count;
>  #define UCSI_ROLE_SWITCH_RETRY_PER_HZ	10
> 
> base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
> -- 
> 2.55.0.979.g7e5102b832-goog

-- 
heikki
