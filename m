Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 016833955F9;
	Fri, 11 Sep 2026 13:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789133521; cv=none; b=U27v1BhvtnEusJbEspN7rzAQ/9eAB1JZ8w8WLd8ua65baKpMzrrK4jQ28/6TVcqJoZKKVLKUGaoWrRma2hOi+fQFGO8vMq9rxcx1wnWtoS00fUU8NrlKSz6gULm3zIu8grwPHHy00tfKUutXrkpfPDsqLeWA5nPAIgP1JexeZoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789133521; c=relaxed/simple;
	bh=/I2uuwjWaxGY66U0trLeBUL6rVzxs+/pRjNxCZAMbGs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k0Tk0Nvis4OKG1vo+YCOstqL+FRQH0s4y/jHIrtdrwZNjviyj8HH0GRRUDJkMzd4ngzKRTLtba8CaGMKk6wC+SMCRbbwkhijISzYsyHvtdqGKY9OU3k3ClbdaoOXxuVDi1AwMHw0ZXrMqMVoyNvJFLP14HZ7iseOyHfM60x0Ad0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HaxbaJOd; arc=none smtp.client-ip=192.198.163.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HaxbaJOd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789133520; x=1820669520;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/I2uuwjWaxGY66U0trLeBUL6rVzxs+/pRjNxCZAMbGs=;
  b=HaxbaJOdVvt4SWyMQQ9HtC6oyGcnh4k6W5KUCRp/D9qZ8ZGSv4gCeXJ+
   A0OKN3NiWZIBRCHHRrkzDkiGMCl1563qIulYKoie2Tm3odNLQJuYHR53o
   I2oBJz+IqVOtfH3yVTvoOO3kjjlQPg8DuAiKKloropr08LJUez8VmaP1y
   RvSXQ5mriyj6q0xk2fpVfrULXJ8ZRemnSW5irWoWtU080oeQh7MOnROBS
   BUW2QDzlYv9nO3lAZusTBoaBIQ068DQ9P29e1nMx+lY86d/OMFOZ5tk86
   FMs5VRInPwimmyWDmHje6kai7UbfUFbBbVWSbc1+pkj5bo9eUHpvu0k4u
   w==;
X-CSE-ConnectionGUID: fb47Xgt5Sh+rdyrfMxh4yA==
X-CSE-MsgGUID: uKvFsdmuTzWFGDH3ftuFiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="104502"
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="104502"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa116.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 06:32:00 -0700
X-CSE-ConnectionGUID: sYo1BQJDSt2HuL54k0OvRQ==
X-CSE-MsgGUID: 8kYak2VqT+iHzwahbaSQNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="296907378"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa001.fm.intel.com with ESMTP; 11 Sep 2026 06:31:58 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id C5DB799; Fri, 11 Sep 2026 15:31:56 +0200 (CEST)
Date: Fri, 11 Sep 2026 15:31:56 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Jameson Thies <jthies@google.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	bleung@chromium.org, gregkh@linuxfoundation.org,
	akuchynski@chromium.org
Subject: Re: [PATCH v1 0/2] Cleanup UCSI DisplayPort OOB fix
Message-ID: <aqQCzNp9e6JfozyO@black.igk.intel.com>
References: <20260910233553.3477055-1-jthies@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910233553.3477055-1-jthies@google.com>

On Thu, Sep 10, 2026 at 11:35:51PM +0000, Jameson Thies wrote:
> Recently I sent 
> https://patch.msgid.link/20260825234545.2076049-1-jthies@google.com 
> to prevent an OOB array index in the UCSI displayport driver. This
> merged to 7.3-rc2 but did not include feedback from reviewers in a
> v2 version of the patch here
> https://lore.kernel.org/all/20260904234401.2339633-1-jthies@google.com/
> 
> This series reverts the v1 version of the patch merged to 7.3-rc2
> then applies the fix including reviewer feedback. Because this
> series is cleaning up the previous change, and not needed to prevent
> the OOB access, I've removed the CC stable and Fixes tag from the
> displayport driver update.
> 
> Let mw know if you have any questions/concerns.

I don't think this is necessary.

Thanks,

-- 
heikki
