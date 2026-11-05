Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793893761;
	b=3B39R5b/nL25saHw/TSi2Xac7256Z6wM/qviUi7+2egm27BCXWEbMrES6EQUP7SAha3h
	 ri/yIYMttQMVVBjhgonU+Q1yddIfL0exTKX2EkHCDKejogNyW54jDHdOmqMP3ysIhylHJ
	 YPI214AgpRrkreb8uiYxNa86IqAthf4QtpiyiIeHhUW7UHjMFhX+9NJ3haIQuIPOosFv4
	 StFPF1cgad1JqhaE/iKP+UH3/5/GuDbCflZH16nmsErD7iqdMrYiGny7ehsCmY1wFSThy
	 +qjweruC6pO9T+5DkdYfaBAXjxQubsG/cmblGuZ3m7ECEyGhDCYMyEkvX0WcaOWmGcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793893761;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=OgbUVygjnvsVSQbwyZJMDnoTopq0YNzS1W2sthXmn40=;
	b=47fjng2ru1Fg2ZnCTJZvyGgvUL1b5o3puG1dPXir7jwELbG/GeX8eRshKXctTkWeE1UA
	 qRhq7X8/fHmDq2kw8ds/LEHZBnK/3f1Azh6zJyo1N0esa+uzwKDr6zzd1XeChHTGaTUx+
	 iE66o3tkoVqYTlPREMr3ldTyqD6K65jPN3jOeqhC2wWCXlW+8txdVZcv/0EBK6lZivVGq
	 dD83piPOMD3h3RVlGN3Ff9DSQZIq7oyZhda9dmuJ1WQHoOV41In2qlbiN8Bzz5Y3X2tph
	 qOI6AqmQjiKAaMRCXGsJ+i2HImAXbgH6ye+hq3piPmQbDxrPEAW2FGWE9RHJcgXhuJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=BhjSMlj1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 992E46082BFA
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 15:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=BhjSMlj1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F62C1F000C1;
	Thu,  5 Nov 2026 15:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793893760;
	bh=OgbUVygjnvsVSQbwyZJMDnoTopq0YNzS1W2sthXmn40=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BhjSMlj10LHFYyKcgj8XYR21xV9YFXShR3rsl2wHYwR1Yg6QMD8H4cy1VkrfT95bE
	 /Qk46F1Yoix/zcuOlodV2xvMbmntAN6G1cvuR5AlPO6iI/ues57hOI10+liJ/1pljm
	 JKZVO2OLqJNrF/0NznTRxXqViOY90FXBm0hre3ag=
Date: Thu, 5 Nov 2026 10:49:19 -0500
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Alexander Usyskin <alexander.usyskin@intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Menachem Adin <menachem.adin@intel.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH char-misc-next] mei: mei_lb: add info prints in flow
Message-ID: <2026110549-outmatch-slick-d72e@gregkh>
References: <20261105-mei_lb_add_info-v1-1-2668d32c7e05@intel.com>
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
In-Reply-To: <20261105-mei_lb_add_info-v1-1-2668d32c7e05@intel.com>

On Thu, Nov 05, 2026 at 04:28:03PM +0200, Alexander Usyskin wrote:
> Add info prints for late bind flow start and successful completion.
> We already have error prints, new info prints will add ability
> to trace successful flow and confirm that late bind firmware
> loaded to the card.

No, sorry, when a driver is working properly, it is quiet.  Never spam
kernel logs like this, that's just not needed.

thanks,

greg k-h
