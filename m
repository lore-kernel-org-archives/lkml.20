Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D422D781B;
	Tue, 13 Oct 2026 06:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791871294; cv=none; b=uXpFE29Vvl+5jyRpNYd87KMh3WIRxp831fhFDzoqU8cDqNQXDih1zTu8rjC//Eyw0zdpthhu/Z67mwOe3L+4GLJTtYoZvsWjB/xYKlmIiC40inQhtbIgk1uFK5vismjiiozN8Tmndg09gZaQbyK34QUVaIYsHy62AmUQIygUmJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791871294; c=relaxed/simple;
	bh=F7Wd0/Fjhmt+7AT8PB4Ig/sPaqmMhyjNQiTLn/HoL44=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vhpi7BwKwno24IepwC4uy8VzCfwjEDX8CbQL6Vv+TZiA3eb2+Xy8tEXN3YEvRdhrvzIxiQyxkb+Zpw4srLQc4n5GkksYDnu7WFKYf2yKfBalwmsaYLANSMSv1wYBd80s2u6cqTjvT5NOzm8B0YQvH391K7EhG5xBjI3LwWL582Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=mcGGhGZX; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="mcGGhGZX"
Received: from killaraus.ideasonboard.com (i68975AE2.versanet.de [104.151.90.226])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BD6D6230;
	Tue, 13 Oct 2026 07:59:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1791871168;
	bh=F7Wd0/Fjhmt+7AT8PB4Ig/sPaqmMhyjNQiTLn/HoL44=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mcGGhGZXWxo+GKwIEQhKb9yO5mkZ2XYd3hVSqSBHhlpsp4FP+ipBKCs+kN7cgXpG+
	 goX1U6sSEbKAe++WgHfvb/mZ0Jg0/MQyB+kv1LPGe2P7/t0VYpld1Z2vexObzY/pi/
	 Mx4mJdk+O6ByYsI1RQCnJBMl+XOE0YbNEYsDB33I=
Date: Tue, 13 Oct 2026 08:01:29 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Nicola Fiorillo <nicfio@gmail.com>
Cc: sakari.ailus@linux.intel.com, mchehab@kernel.org, hverkuil@kernel.org,
	dan.scally@ideasonboard.com, hansg@kernel.org,
	u.kleine-koenig@baylibre.com, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/7] media: Add GalaxyCore GC5035 and GC8034 sensor
 drivers
Message-ID: <20261013060129.GD56180@killaraus.ideasonboard.com>
References: <CAJn-UjW-tKNRWTjVOQPe9d-wh-Pdmnw8EEd1vmL8k=TQr--t=A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAJn-UjW-tKNRWTjVOQPe9d-wh-Pdmnw8EEd1vmL8k=TQr--t=A@mail.gmail.com>

Hello Nicola,

On Tue, Oct 13, 2026 at 06:08:59AM +0200, Nicola Fiorillo wrote:
> Hi Laurent,
> 
>   Sorry but I am not an engineer and I don't speak English. I only tried to help
>   solve a problem that has been around for a long time. If it can be
>   useful, the repository with the measurements and all the material is
>   available at https://github.com/nic-fio/chuwi-hi10x1-cameras
> 
>   (Translated from Italian.)

Automatic translation is fine, but submitting code that you don't
understand isn't. The kernel requires contributors to own  their
submissions and understand what they're doing.

-- 
Regards,

Laurent Pinchart
