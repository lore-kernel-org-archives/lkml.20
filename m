Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B2D539734A;
	Wed, 14 Oct 2026 06:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791960565; cv=none; b=kCG3K7jkJ66UfYHPhPv0vPIdc93rW7lzPl2Ey+XKy7Knb+y4VjA/BCsxXM/LDmZZ5IFzoXUcahlhIK34fRT30HmXqauCkPHbyHqxbgKBxgttINrvzlZpVO578kVhOEs0BTbvzYsKm/0wjWdDqeS0lGjN/LVs2CYX3zuv6E+44Mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791960565; c=relaxed/simple;
	bh=aZrv7adkCiuMGdBtBLWV4dVbDAD7hH2HMFrxJJTQHzc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WirwPaWBNp89nIhOZCyuUSwyn6t9cXAYmejIkKYYjfaTIwoTEQMcoOw5rq7HjQEb8yqc1T7kqFrmt/X+xcK5txsss7Hqeg0OIiiAWtYJojrDfbL2Jq7inDtDyJLs9es6wRg+7U7Gh1lgKS5VvlSnbUWDPZv8iIAV9OdzMehEKmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CZWMifVi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CZWMifVi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAF3C1F00893;
	Wed, 14 Oct 2026 06:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791960563;
	bh=pncUlMDikQkgCgOkDPW61TO4UY38RFp5paMgtZqftfI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CZWMifVizIfG+onbuswr1c2TAaG28Uc/Pqe+dpkFEK9skZH2YvUKUBwTu56PNnCyV
	 mXa80bxQYLXaVKPCWD0hdwsIS54nMUxE2tivI5v+JS9Ozmdqpkq553fgmnl/Z71/iv
	 efm3BMkj9VtuCA0SucqjS/XVOdSjDDd9MV9ITl5hYpy3wIcw7OJ9O8pQIK6Vr0ystq
	 E14P2UXOormnKOqKZmwqN1+A/25yOKG1DuO+JX3HLkGlS3Jw9fLKC28KdbDCFhdpPB
	 7e7WbZn9LMdzMhCh66x7EJntmuMB9zVNfyI19RoHOTXV1Fy9qxiknW/4hZ87+dgxiN
	 0YfzZdWDwbtIg==
Date: Wed, 14 Oct 2026 06:49:20 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Satyam Gupta <sgsatyam@google.com>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
	Gwendal Grignou <gwendal@chromium.org>,
	Scott Collyer <scollyer@google.com>,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] platform/chrome: cros_ec_sensorhub: Increase
 MAX_DRIFT_PPM to 5000LL
Message-ID: <as8l8OYwgCr7rv3k@google.com>
References: <20261013105806.1371175-1-sgsatyam@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261013105806.1371175-1-sgsatyam@google.com>

On Tue, Oct 13, 2026 at 10:58:06AM +0000, Satyam Gupta wrote:
> diff --git a/drivers/platform/chrome/cros_ec_sensorhub_ring.c b/drivers/platform/chrome/cros_ec_sensorhub_ring.c
> index 20fa47cbee32..a5215955470f 100644
> --- a/drivers/platform/chrome/cros_ec_sensorhub_ring.c
> +++ b/drivers/platform/chrome/cros_ec_sensorhub_ring.c
> @@ -22,7 +22,7 @@
>  
>  /* Precision of fixed point for the m values from the filter */
>  #define M_PRECISION BIT(23)
> -#define MAX_DRIFT_PPM 200LL
> +#define MAX_DRIFT_PPM 5000LL
>  #define MAX_M ((s64)(MAX_DRIFT_PPM * M_PRECISION / 1000000))
>  
>  /* Only activate the filter once we have at least this many elements. */
> @@ -278,7 +278,7 @@ cros_ec_sensor_ring_ts_filter_update(struct cros_ec_sensors_ts_filter_state
>  	dy = (state->y_history[0] + state->y_offset) - y;
>  	m = div64_s64(dy * M_PRECISION, dx);
>  	/*
> -	 * Clamp the calculated slope to a realistic range (+/- 200 ppm).
> +	 * Clamp the calculated slope to a realistic range (+/- 5000 ppm).
>  	 * Temporary large jitter spikes can produce huge slopes (e.g. +/- 20000 ppm)
>  	 * that would otherwise corrupt the median filter history.
>  	 */

Applying: platform/chrome: cros_ec_sensorhub: Increase MAX_DRIFT_PPM to 5000LL
error: patch failed: drivers/platform/chrome/cros_ec_sensorhub_ring.c:22
error: drivers/platform/chrome/cros_ec_sensorhub_ring.c: patch does not apply

Until I realized this should apply after [1].

NACK, you should either form them a series or squash the fix into [1].

[1] https://lore.kernel.org/all/20261013105753.1370713-1-sgsatyam@google.com
