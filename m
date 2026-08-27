Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 843B8390209
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 03:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787803133; cv=none; b=MF4v2qqhE1a8YIj26JdRgHZ80pfDmhXuhjubNZVEziJr61MQRNJQccUYoWucXZBP75KjCKjcd6rsv2zMLKje2gEuOYcbQhGHQCXnYNllce3Ux3zsARIrrBTrbmrAT0tC5NIlXVN4HB02LFl2N5IQIevcPo/Qqz4bUmKy/PdnzH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787803133; c=relaxed/simple;
	bh=xVRZFbDUIViTRBkZ8muOyVesN8/ZBW2mU/Uvr8Y3YBM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SJo1neqSFne5zCG/PFOtYSkQybz7T91iW8x6hFvn0NtVz8QncvwdK2fyzVJ5m+L52dohr2smrf53q280oAAn1azK6M6d1vTpTCjcqnjkTAHDLnt43iVhwunfqxfpEkgpMX2grGPPY6HfXZoPZvIc7TjSzrPWBQBxhVRz8yNWvsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k/ZzM0wz; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k/ZzM0wz"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-482e5733a5aso702886f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 20:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787803130; x=1788407930; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CAzoKxSQ3b+/c/GS7UxwHGejvR1ze+cQZf36sXyzK8o=;
        b=k/ZzM0wzkjGJVIv06/2nIxQg0rw/2WFH8sB/IOe7PXW8XcOfZnsXM8QhviCoZdRfZ5
         MuWezIlSPnrIod1xOmGjZyVWzkAA0WuJelOZKlp7entOwl6sfD5Nbxa/4/dNs+o0TwWA
         dOA5GdA+J2QvP2VDbvv/aFkd/C3MyKxyWHpYy9K7q4pq9WvQq+ro6qrMKTPq7mwCbXYL
         HxIQOGJxJKvs6clxePKVGhuX0iTmOibG9Xli6vjjMnxFh7OklgIJeIb78QCjnYCqAW/0
         AfVzIJ76770I5mjCNn+5oZ4qnSo4cuIeW4+rXqsXc79m67VA+i0qWBRn+WvRs5wLw7oB
         /HZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787803130; x=1788407930;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CAzoKxSQ3b+/c/GS7UxwHGejvR1ze+cQZf36sXyzK8o=;
        b=kYvLxYegxTYvJh2Uns4EV0kDxtsktdJzdMcxpw3TL/ptodXH00s3Mu/fzEF+xTDoQ6
         RL3+Y8iFo/hijK8FxSWSUUJQVMkz8lLEObq2GGSzgzHKOhWJcx8py5fGT+KB9ynJEB5P
         Q7po/ENL0zHyVW2cH5rj9lEy50O+ZhZZAwC9u9YgcuZ3TC9HQQHpYVNbhU+mfSHPxcLB
         z8kzzNFYeG0GIj2azXxTlS4Wndb/EQZNQ5/ErkH4q69xGQvBLC2WvMZJqr59eCldECyY
         qmW6V6cpYNtfCHCauZrrEXLgpPkP6awlk37y2ACCpS8qPPsjGb0VMHuUQRd0JsnSTEbz
         hziQ==
X-Forwarded-Encrypted: i=1; AHgh+RrCXZJ+XZNwAbcs3WWTqeKt/wgbIYJ3OjJTAPPgq9kcwaHrQGAfnUwAxGd4aPi+FZPzpDmHpwjEi/zjbAw=@vger.kernel.org
X-Gm-Message-State: AFuF++mrLkRCIhVxfHz25UJaxnV0bRbPmrsAxVXkKKGZdXbdN3SFZkjg
	dNW1g17Uk6jFzq0c5JEQZ5loQCGSjWV4LvGNBVVHzK/oWstr68qhyyU/
X-Gm-Gg: AR+sD13VJQDJ8YpqBL/5NyiTbC4H3oFtPWAX0eFLJET/JZa8F/pqu1jL0uWJRESrWoW
	m3IHgTVUEUr1gouMpVIIZ4YRV6fzNSd5eMgDTR8NOkKq1y/yr1sNCkce1SaIQGHkD9fcp0NZMnt
	gwoApqLC0t7QbH4I5JhBvynGxyIoMCMtUFcm73kqUF5qUCHwIJBF1qCpwxRkloKh8dzLq7xLflB
	3Ihf9z1PZMebhEg3DTS3w5nnbhvMVcTJXGysgc0o8LVWvXRWhRb8uSV7z0+nd/XC7AgJhvNVYdV
	8DhKbbiazfq/Q/KceBq/6kNA3WnNtz8SGRlXbVqdZ2m1n8XWucuIqZxsvPM+kvxvQ55i6T5T1Y6
	Y+5tWeUXseVzFz5uEOwEPGEhnK84Fv3lh+DDJKGIORptVExW1GgLj/2KFTvtnQqY1S74mBBJNve
	3jrLDlmBk3AWEtscAxh8lpFHJMX/eSTtuHiDsD/0ZbHMacXSK2Qz7ErwSdnx/Uhu2yb1Aq3jPA4
	BBgvwriKlX4SbRy71xOYaJTgPhG75SSR+UEV9V7q+WcmBSkjuk37OIoBEo321u86Wfr4n75isfB
	WewTZZBYmi5rrKzlMxDYOLI=
X-Received: by 2002:a05:6000:238a:b0:482:e968:86f9 with SMTP id ffacd0b85a97d-482e968892bmr7778855f8f.14.1787803129596;
        Wed, 26 Aug 2026 20:58:49 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-095-114-154-097.95.114.pool.telefonica.de. [95.114.154.97])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e27ab569sm5601745f8f.16.2026.08.26.20.58.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 20:58:49 -0700 (PDT)
Date: Thu, 27 Aug 2026 05:58:18 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Arend van Spriel <arend.vanspriel@broadcom.com>, 
	linux-wireless@vger.kernel.org
Cc: Hante Meuleman <meuleman@broadcom.com>, 
	"John W. Linville" <linville@tuxdriver.com>, Franky Lin <frankyl@broadcom.com>, 
	Pieter-Paul Giesberts <pieterpg@broadcom.com>, brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] wifi: brcmfmac: fix lost 802.1x TX completion wakeup
Message-ID: <ao-1n5uWuVPKjhb1@gmail.com>
References: <20260811082702.44521-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260811082702.44521-1-kmehltretter@gmail.com>

On Tue, Aug 11, 2026 at 10:27:02AM +0100, Karl Mehltretter wrote:
> Fixes: 21fff75d2fb6 ("brcmfmac: use wait_event_timeout for 8021x pending count")
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---
> LKMM results with herdtools7 7.58:
> 

Just a friendly ping in case this got missed.

Thanks,
Karl
