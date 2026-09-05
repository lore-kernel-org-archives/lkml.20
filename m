Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5032045DF68
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 18:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788632755; cv=none; b=GZ5jnpk1zYkHR6ATnRwZOdZmVe+bN8pkqaV5PMUPCSis0SN2lQdumYO5gAwrvnHnwA305uJ9ZCjPrSh57ejYvhtBjS3YFmml5+/S4lCWefVVI2l7tNwQMWiiwcLm0P/larhj4tlvSEfuTE1ZwZ42fvfwrbOJpmzkveZmc22fO2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788632755; c=relaxed/simple;
	bh=rakUssaS3Z60N+MJ5OmiZGkRVrp4Fe3erHejZIlcqBA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uuXpmnVTZ5xz2Nqc8MFFVwtpnP4uMNqUWVvX746wc8SyAW4dqno8AbNVumQ0kXDp4XiOF/KN+Ar07JpPc/JrGOMeU00Rv8x77b/z17Cxcv2ViL3wfQeGWWW6kaw5SoSGRShwU5iikkvjK9br+yniQJnL+6fbLI+SfldtoFPbVc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linbit.com; spf=pass smtp.mailfrom=linbit.com; dkim=pass (2048-bit key) header.d=linbit-com.20251104.gappssmtp.com header.i=@linbit-com.20251104.gappssmtp.com header.b=x7nOgQT5; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linbit-com.20251104.gappssmtp.com header.i=@linbit-com.20251104.gappssmtp.com header.b="x7nOgQT5"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-499ac87c92bso24315735e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 11:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linbit-com.20251104.gappssmtp.com; s=20251104; t=1788632750; x=1789237550; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vh1tho+DMPBe6dOnmyRhQgSZf9FdJaDw5EyeCtsHdOA=;
        b=x7nOgQT57/9v5uuS/L3bp3Rp1I79CMDt3RPB6x5WzokX0qKuYgq/1Ks2QOTuMFpLBy
         wpXguFNBeyZ2i8pnQLtkncuOpnb0ezbdiDlynKW8mBU3m1mfW2vov8+x1uSqnS7DssjY
         x88hVLAZakH5j81wCIsdwPkxr+ca1SquUf2RR2/VTfv7pdR/IuQ4NGalxOBGClOZ2M2L
         xK2eUL/Q7OJQpT/4f0A7MURgRi/M8BEKc4YewZnOfnBOQu7lNu+XZClxqP9ZssV3d7n0
         NBL4RpAF08898ve1SqptTIhWZtKMAAjGxU9c75Bqbr6qSBlY6xyvvDc94WJvY/KcJjIF
         jPNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788632750; x=1789237550;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Vh1tho+DMPBe6dOnmyRhQgSZf9FdJaDw5EyeCtsHdOA=;
        b=K9ZhDWQR+wpJ2gVqzNtZPTQAKzq0Sjgan2Ge9c+hCKTiFq1JTW5QLbrKskrLZjW4Il
         FSSCUeHFZ6alWeE1x0qyB2f3Bqz2dWRADekQDEeiQZc/xPLh8VPCb/3HDkDeKutC8Tm1
         sw/NkMLZT+iyQ/OnnkcARaJ8/UnmTG1DiSDB3Qs6bZ8qgMMYpatfi2fIYan4HUy1osES
         Qh6DrobVCUkZm/xVYc4RMNi1W1fQQAt9u5PDB12MD26VteSksJZJjVwGsWLgOx89oGnA
         bvLHpRKuEo979qRCVxo942Y07As6lNFK8dHu3CNFvF7FQwGzuvNoD4yaTVcTRPB4k+Qs
         N+vQ==
X-Forwarded-Encrypted: i=1; AKwUvBxYByGIikBGrY/IUllYR0EKFlGlxy1GQqT8vV89e0N+B3Wb3MK09IuM2gPiz+0unZ9igoQ/GaC7LHjf9Vk=@vger.kernel.org
X-Gm-Message-State: AFuF++kmxlhgbP5B0T8y+yx7BuwOG/32mG8PAkiGZxsKFIhkPASZkcJU
	pCInVpdx3OtT1Ep6avzJDJwu2XncfICJRdDpPnjdBnp0BH/0+EGGma14tKXA0vdtTss=
X-Gm-Gg: AYBFou2Ef9JjEv2ysqRUTMzznC2CkEKqUChi3ITDkO/WoP8D1lfeCS/WWl46VpF48m0
	JRkLXVDuxlgDMt0k3WHo5G0uld5I8HSiUIo3EdSUYXYhdk5d+U0AEJZRJHl7Ipjfo2+kLODKCLR
	+On3NFIzJH8N/NcB0bcR0pa8F+m4xlIsxOtoPEVSXx8nO/WCKethgpwSpnqPcJ8TFdqzjpL/Vpa
	9UvRL9Q2e4Z1sGIimLx32SiTzC/sYKjAdlw1aUqCKauTVsiLwmqIvoe4jR6wVA8fVCUVNhBGfM1
	hqU7FespXEX/ZT3sPR+gY+9BezO/m7M8qZVVupKzIfzPxftqTPRrwwPd3DuzNBiiNXwTOSdZHNu
	GAPWno02OKVkq+KZSgcYiMgrt57ZlZKhJUTU0/3ljgcpVUtjYM0c1LxsLmsBF/1cx6Bx8RyIiq6
	Dbvl9AppWI7/94+2D5uWJd5XuKo+xZBhJ3SI9p6btBfpaWIBrf3GMlp8kk+teSWt9KiN103jHlz
	NgoxN1Za29tEbVQsOTf2wdI91yubXrm
X-Received: by 2002:a05:600c:3b02:b0:49b:9202:6f80 with SMTP id 5b1f17b1804b1-49cf8220edemr149030685e9.6.1788632750385;
        Sat, 05 Sep 2026 11:25:50 -0700 (PDT)
Received: from localhost (h082218129081.host.wavenet.at. [82.218.129.81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee60bae6sm298811535e9.9.2026.09.05.11.25.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 11:25:49 -0700 (PDT)
Date: Sat, 5 Sep 2026 20:25:48 +0200
From: Christoph =?utf-8?Q?B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>
To: Hemanth Selam <hemanth.selam@gmail.com>
Cc: Philipp Reisner <philipp.reisner@linbit.com>, 
	Lars Ellenberg <lars.ellenberg@linbit.com>, Jens Axboe <axboe@kernel.dk>, linux-kernel@vger.kernel.org, 
	drbd-dev@lists.linux.dev, linux-block@vger.kernel.org
Subject: Re: [PATCH 1/2] block: drbd: fix typos in comments
Message-ID: <apxeZOBtnBZtgjfw@linbit.com>
Mail-Followup-To: Hemanth Selam <hemanth.selam@gmail.com>, 
	Philipp Reisner <philipp.reisner@linbit.com>, Lars Ellenberg <lars.ellenberg@linbit.com>, 
	Jens Axboe <axboe@kernel.dk>, linux-kernel@vger.kernel.org, drbd-dev@lists.linux.dev, 
	linux-block@vger.kernel.org
References: <20260904113103.10805-1-hemanth.selam@gmail.com>
 <20260904113103.10805-2-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20260904113103.10805-2-hemanth.selam@gmail.com>

On Fri, Sep 04, 2026 at 05:00:59PM +0530, Hemanth Selam wrote:
>Fix typos in comments, reported by scripts/checkpatch.pl using the
>misspelling list in scripts/spelling.txt.  Only touches comments, no code
>changes.
>
>Assisted-by: Cursor:claude-opus-5
>Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
>---
> drivers/block/drbd/drbd_nl.c    | 2 +-
> drivers/block/drbd/drbd_req.c   | 4 ++--
> drivers/block/drbd/drbd_state.c | 2 +-
> 3 files changed, 4 insertions(+), 4 deletions(-)

Typo fixes like this are usually only worth it if they come with "real"
fixes in the same general area. Otherwise, they just cause unneccessary
churn for the involved maintainers.

Regards,
Christoph
