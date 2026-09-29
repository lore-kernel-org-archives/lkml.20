Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFE753CF021
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790690047; cv=none; b=Cc8D1d5MeVI5oebiiDE/HLpZyY/Pn/PPayMIe/9y3evILFiZ7UPUW9yrMhMuzW1wDEsjfp3iTUttsZCli880r8gnrmRmCnsFTwMPr03fYUMaudF4C5rLOhJvtwyiiInZ41rnEG4zeV9bN9IPlPf5mPJlQuajA8CdEry0vxQER2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790690047; c=relaxed/simple;
	bh=vLcCsZ0AEnqVStwjDRvg4m7/bRpbqShpkXNWquyKJNk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a9+cwWhT45iyiooKKCr/vxg0O0QrJeTJKB/9kAQRBQouPlA86jOroHPA0M6wgyYD+ITjq/sN4YJkZPCu6NYbcKHgWzqRPuM0Ur6hKb7D433HdCB2Ni09tYxR4gHlWMZ7zCJh0diCfsxfSmIYGAekpcwrl/ycORgbxk8V5iCVb+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=PGkhsrfw; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="PGkhsrfw"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e4b11so24949465e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790690044; x=1791294844; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=m29nOFWFvKiEYYSHlvE0PHl3qzmf4/fyu5zPOjVpGQQ=;
        b=PGkhsrfw6V450HwBYozmHFl3q5fERgLt3Xsls1ROSEnJSQWPRu0Rq/TjzCT89lw+hd
         Fx+82KmVn+o1JFK8x7OOBXlJzhZjxkO+EkOZiJZPPlLKCFS8uAxCBv6jgyqqLm9+xtya
         2epEzzwxOzVRLREJePx/CRQdAo7KWQU7COZhOtFus88je19KVDXMuwHAl2TyVLupOXAF
         Y8JODvwYaF+jCzvuma0drZyXranh8qFhZlOJQJiOt2qeM6NTIatCR5f+OytArU7i3vWa
         hLoJnBGEZWeJYZilzCCd2XRp01Ym6et4QCe6TWFeuOy/v+Ku58PliCMLojwTivlzneoP
         BviA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790690044; x=1791294844;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m29nOFWFvKiEYYSHlvE0PHl3qzmf4/fyu5zPOjVpGQQ=;
        b=aChUEUcKxd4xhY+Y7/c/z9jD/DDqRiFoLqlrcyBqRAeTXEqxC2gHRRpAL89afmgbOH
         RZO+QemkDDxxI9iI59OLsb5Jno8KFw7zE03O5AhAhqSaOApepVo5gpfVRjgvEEj/dTjr
         fbIsl1MTP+cvdH4swH5dHA4zP3DYbPSSeLO5IBpTVsSZ4Ok+GiKVVPZb74GRgIi62IWz
         3ZqobEt5+kKGsyaHg34xfclQbWQZeU0iwWaAk/3SwEChRZ0JF1wi/TMBuGqDRlnKbqRv
         vkUMrKYt5Q229tnFSLueemKZCJXLwZrK2zkI6zlalywMf+qFHYA6PBaYrX5MTFGTOKY0
         FXPw==
X-Forwarded-Encrypted: i=1; AKwUvByuIVGzXYCKw6zfJro3wkKUDpAvL4jXOcbicUEDRLLAhv8MKfngo3tfTe3dZCfDuxxO9SewRjTbVy3OSOw=@vger.kernel.org
X-Gm-Message-State: AFuF++nc78dpSr69US3HELfc/7HfJQCLSPaHkk4oCExRHbpjPSvLP4Rb
	Rl5I5QGRYqmjgnCqshHJ4y+Z38zv8XBAOK8vFyirHQ0z7iHJukukkKdCf8bj9QBoiNM=
X-Gm-Gg: AYBFou1aY+9DQXj+SvjP2REFedno1p5k4yxyEjSQ4AY2DCyuUWUG/RUi4uF5On1tk9S
	TienLuVd00HF9SH0F6Tq+itieSlMbboQW5PHtcaQmFSKQggGEQbLQ0vyhqIgDZBb0myJXCEhSjK
	sAl2rWu8SMzCC4PfaIyWA2vqi8UHTrv7DefbTVzkpilZy3oYeJ5oTaFfgyW7K5gSMs0UrZwGyN+
	wEGvGja23daq0Lg69dCKbs4/Ok52Rbfsi905vzaZ2272Xq90WOLhDJk81xvrr2Pen+wt9N7lrcl
	RxLJKUF1PLexIuW/MRLgg87QpAGDeLqKiX9ADiu59/fUPYMB9GIF5qlFuwNEwqu2wRR6/2InXl+
	HKueQ3KAOIsR+9evrgLB9SjiRsGJJ6uW+pNyVrXk8KIqKs92KWRYzxvwM0YzW9r8Ht/khLC7C15
	nIS16ijTlUtzyUDenS81Nhu1v+269Ym/T1uyaFewyvYtT7E+NtaQI16rZ93stVc41AekGgh/SRc
	sen/1zVtydugJuz
X-Received: by 2002:a05:600c:4703:b0:49c:fc6e:a3e1 with SMTP id 5b1f17b1804b1-49fe66fd374mr274306685e9.32.1790690043952;
        Tue, 29 Sep 2026 06:54:03 -0700 (PDT)
Received: from pathway.suse.cz (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a013d08f1esm6313585e9.4.2026.09.29.06.54.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:54:03 -0700 (PDT)
Date: Tue, 29 Sep 2026 15:54:01 +0200
From: Petr Mladek <pmladek@suse.com>
To: Sang-Heon Jeon <ekffu200098@gmail.com>
Cc: John Ogness <john.ogness@linutronix.de>, linux-kernel@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH v2] printk: increase the ring buffer for more than 16
 CPUs by default
Message-ID: <arvC-Xo6nlo7ogjq@pathway.suse.cz>
References: <20260927091756.50831-1-ekffu200098@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260927091756.50831-1-ekffu200098@gmail.com>

On Sun 2026-09-27 18:17:54, Sang-Heon Jeon wrote:
> The default LOG_BUF_SHIFT is 17, which means 128 KB, and
> LOG_CPU_MAX_BUF_SHIFT is 12, which means 4 KB per CPU.
> 
> By default the ring buffer is increased when
> (num_possible_cpus() - 1) * 4 KB > 64 KB, which requires more than 17
> CPUs.
> 
> Remove the explicit subtraction of one, so the ring buffer is increased
> for more than 16 CPUs, which is a power of two. Also fix the outdated
> comment.
> 
> Suggested-by: Petr Mladek <pmladek@suse.com>
> Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>

Looks good to me:

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr
