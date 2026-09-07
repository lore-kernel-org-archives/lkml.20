Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D35C54F7985;
	Mon,  7 Sep 2026 16:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788798582; cv=none; b=L8Hb0Q7Is1g0ks3+qVHVkkTawINaQKLhFVKumaMKK5fWTod5Df8tg7Og0d8+rXmBJAdZNytDtrbkvYMHVUZPpr6o1okfQXgsGBMzroSadCj3hneF3sImQE75hrhxmEblBgd+oLifvOgk+EqFMID+EcS8gx2XFw7FLp2XqxG8xYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788798582; c=relaxed/simple;
	bh=XsoMnOBRk8fPtJBqt4lc7Osd6z9hEZ9vdfkIvE+dz+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q5hGh/yIz16sRfLuKHmvPxxwRt4Bgt2vwo30jUgLwlyKtEWrQZFZiHHw3LH6p7sHPsnwlm7jfAp0wyHbMACylVGBrOk5gevBCE/I/NQdC5WtEKNWfB791Sbz56pH3DZUINDXWmsLw49jzFqmqBZhi4V9zyvPJq95p9PrRCwFn4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=hNQD1Vpt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="hNQD1Vpt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBC2A1F00A3A;
	Mon,  7 Sep 2026 16:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1788798580;
	bh=RGCh5ZDm6bcpDZElQlzo7kaeeoMWy+kjUwKZoJgYCjA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hNQD1Vpt5jcsk/av2goj75GWBht2/u3x35Dtk8GiwRkyEcYsmPLXRZWsvAH9eCKsV
	 gfi9cE6203kFpTV8kJuQoN4c/j/z4CICvPyGJOPLvruKYafS41gj1y0S0pnW8DnqWn
	 NQO5a7OEvhryLSNakWHORlesg8LDw/XrcAUncuQM=
Date: Mon, 7 Sep 2026 18:27:43 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Muhammad Israr <7israr.work@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: replace msleep with usleep_range in
 rtw_pwrctrl.c
Message-ID: <2026090729-track-fantasy-2a8a@gregkh>
References: <20260905052614.8201-1-7israr.work@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260905052614.8201-1-7israr.work@gmail.com>

On Sat, Sep 05, 2026 at 10:26:13AM +0500, Muhammad Israr wrote:
> The checkpatch tool flags msleep() calls for durations less than 20ms
> because they can sleep for much longer due to timer granularity. Use
> usleep_range() for the 1ms delay to provide a flexible sleep window
> and avoid inaccurate task scheduling.
> 
> Signed-off-by: Muhammad Israr <7israr.work@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_pwrctrl.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Please see the mailing list archives for why this patch keeps getting
rejected.

thanks,

greg k-h
