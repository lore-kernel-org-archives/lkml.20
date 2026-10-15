Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA44F38F638
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 19:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792093529; cv=none; b=EjNItIIKk/mAHgZKL6Pm3wQKA5haeCQlp3fsnW710RyMTltZLpWY/WntsqA20ys7e9XbnBXtKPIom55BPt3dEK0IxrieRCY6kvRftkwqOSETtI5SpZZKOgqsuU6pZoQysb86q5XOw5GnATUEiDYxoW8XH6yFz6Xb0g9DYxWSDs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792093529; c=relaxed/simple;
	bh=PvNRqwVY3U96lVu6LwTnjyNn7YRRoGPY+tOwZREgySg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qnAD2k0jbvxVUoHSwS3pM/94ZRDf2Ged4UB3mhEZPngVoVvmty+NuKCZflxm12oCrrvS5sHim0H0WXdT5o9GaNBzq4+0/XYySzaP7x9kQsFCxpPcSexAgoLSrc0fIZzvwHmZdEQsvNS4Etrd8R4dyzQ016xD4MUKD/0+6LbeSz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OnIeUNCV; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OnIeUNCV"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49fbb2acc90so48380845e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 12:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792093526; x=1792698326; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j3TScMJtX44eJCAHUzTz+8yigx8ZEb71Hc0vt5ePLJU=;
        b=OnIeUNCVK8KJA0IlGWgq2HAVTwLn20WrQw2Yp2QrX6/qgnX442Sh9+C//iUIpaET/p
         jHuY2EQOa1KLcTBXlz2Qd/nrmS5+V5joYbOLSyC9216G0y60oPpA/Q21F44/jRouOA2H
         j1jnn0nrgDPqdDT0hFjgcxzDcDIVTitK5rXxGvArKnnzjdYeHft2gbZc1ZQFKzw+wgZi
         tC9/FHGy/ACcWp6pnitccmFmpRlSi1odrFxQ4naATLjVsbXc+a6HbMQm/6vVIUuhfK/R
         WfXNz9ko36aOiufbm8oXJHlZJm4+UfAMSg4zMWclZ5mcMLFfa4lzTYfdlvu7M7QWcADl
         gdGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792093526; x=1792698326;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j3TScMJtX44eJCAHUzTz+8yigx8ZEb71Hc0vt5ePLJU=;
        b=0bwBhrbFgGB8sR4yXbBZUGKYZlAZ6qOa6Qty60SGwmHh4fbFB6UgKkaa0EJxWvMMzI
         UeAGYyCZUwIsYrbpEL+nQqHfeIKXT8bMmYYwX+2z42Tv04fsxMrsV8c3c6+UGyo1WwNW
         G9fWmy3FBH786c8DdtsMc+SKnXt+L9pldgoISyVRPa43xqtCjOxUV2TUDz0y0XyH2fA+
         m0chx+CM1/d13DocOtEn/k8vRXXyIhXpEYQpGKqOfqcPQQDVKaybKOhtG9no5ITTLANg
         jcfkqpIy+9QgX5xXBrmlA0M2oN5w3xV4y0URSUUlWv24W2VV6VJRX8NQCj0sdvEgjfRV
         hk6g==
X-Forwarded-Encrypted: i=1; AKwUvByRAcgIYwIw7gEv8+3Lf+Iw8EXBuLD+HDvQ0nAobwSRtzv+tV6872GSFt1nTb4nTCmEv02D39a8auFm+6g=@vger.kernel.org
X-Gm-Message-State: AFq9FYKCuvyqZs3KdQwlfHYAn5eVLEgRZZnYGwtHEoa9xNMIWcWOyCwE
	vrtllvY3Ist0uYIwUWc4xAxvsXEQZxXXIHhjSNMW9eoRxjiGL/68KpXd
X-Gm-Gg: AYBFou1ujcKSbFpKvnNRH3YpBvombXOee4XDlXpuroKBKeRmdYtCiBghwUGMiUETFdf
	YvIXcWBrrtsYUpVeBt8xHm85W0pZVY6QNjjwAgfqa2BwSDnyElN0EzIbUpHRiUFQKOCSXZrY3v8
	OyynJrVcU7e5MfWbdvFWY2lcrmmMvXeRIHHczb0i7SZp5fJl9+aYuKLe4I/tOWI1MdgUH81mpiu
	WncpYTGjPlpZQ+C5xGS1KrtfM8jW4Kll+2HpqRUcLCILP3KJNiGVf1rcrkAp4Hq3HPEXj/7SuhV
	KhkoFoE2bjKYXr43WK8EcuqagqW6GGr6IcjddcG7jNwb3uiVbnZjwgJCHCOBmTHgg0tDb7amOEm
	BDOnPSAmc7oY33ApYOw+A4JmIx58DULyMz/JK4txnAZpgLHI6CgqS7hfvSJUd6f8eZEsfep/wV4
	IwgHTUg1q+K2SyzGRS5K82YW9fbO8ZKyMjOilC+46K7kenuOi3kat8yhirL9jLjWXkVrQ=
X-Received: by 2002:a05:600c:6994:b0:49c:dada:30b7 with SMTP id 5b1f17b1804b1-4a18e446f3bmr402490965e9.2.1792093525743;
        Thu, 15 Oct 2026 12:45:25 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd9b8b5fsm100897135e9.9.2026.10.15.12.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 12:45:25 -0700 (PDT)
Date: Thu, 15 Oct 2026 22:45:21 +0300
From: Dan Carpenter <error27@gmail.com>
To: Ethan Tidmore <ethantidmore06@gmail.com>
Cc: Luka Gejak <luka.gejak@linux.dev>, pavankumaryalagada@gmail.com,
	gregkh@linuxfoundation.org, outreachy@lists.linux.dev,
	dennylin0707@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: remove unnecessary parentheses
Message-ID: <atEtUV5q9MHRSTJb@stanley.mountain>
References: <20261015120634.95218-1-pavankumaryalagada@gmail.com>
 <5d577cb1b4a91e8cdfda171bc7100105ae90d91e@linux.dev>
 <DM5IYFCRBE9W.1U3KCU36BUE36@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM5IYFCRBE9W.1U3KCU36BUE36@gmail.com>

On Thu, Oct 15, 2026 at 10:41:53AM -0500, Ethan Tidmore wrote:
> On Thu Oct 15, 2026 at 9:11 AM CDT, Luka Gejak wrote:
> > October 15, 2026 at 2:06 PM, pavankumaryalagada@gmail.com wrote:
> >
> >
> >> 
> >> From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
> >> 
> >> Remove redundant parentheses around the address-of operator to
> >> follow kernel coding style.
> >> 
> >> Signed-off-by: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
> >> ---
> >
> > Hi Yalagada,
> >
> > I'm just letting you know that this change is no longer needed as the
> > entire staging/rtl8723bs driver is being deprecated and removed.
> > Support for RTL8723BS has been ported to rtw88 subsystem.
> 
> So rtl8723bs patches aren't being accepted anymore? I saw Dan reviewing
> one earlier, just wondering.

I didn't know it was being removed.  My expectation is that we'll
probably keep merging patches until it's actually removed.  It's sometimes
easier to just merge easy uncontroversial things without trying to track
everything happening in the kernel.  We should obviously delete the driver
as soon as the other patch is merged.

regards,
dan carpenter

