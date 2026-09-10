Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1877048F831
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 15:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789052592; cv=none; b=A8dbTTSmiyzq2d/hIkFH4S8EI7p910o+soa0ZGq4QHQLtoejwTyRVQicK8FDvuZRRpurcMTTBf9dEkpVRAvF8qEUAnObIqTCS27Q4v31ivYNM5gUoFdUvy0eUvbXlFwukzY5NoJapcSzBBzt4WHTO2yAdXVgVIfBDNAI2Vd6uU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789052592; c=relaxed/simple;
	bh=4kjGyemxArxxhc3VTMbOFpJbiKYGbVIDU2MSJN9ZDHE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OYzq1hgkV/fRJk4ub3Vu+2rd3lV0essZsAEld00i8PfyJwX40RIsVA+/LwbNApWrCg20Slm4dtsTxomUaA8/FSosEW0RPoQjwTX3eQoMlg+uivHgkQqBj60BQBUf1Rrv+9ybIa5e7yWngiQprGfehAVpFqPT1/cMwMaHmShQHXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=quSiOawu; arc=none smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="quSiOawu"
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-6b1b9c3af5cso5923072eaf.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 08:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789052590; x=1789657390; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8whDIqBhsAHgrrO6NDVanhr5yk0i6lWH6hgEmhFdyNQ=;
        b=quSiOawuAubdgswVVUK46Yv/471hnY/wOK5iSUu5KQQAzgWRj8qH/vRfTbcENkMNTg
         tHPd3TV10qmtttSkYZMMafA7kpFzWnAnd4pBlcyKNv1MZlrKBs833j6/yejETK1tMlmu
         MjYH0vXT3v78VoDcOcobZK1nQJtFMJJYy9DQmwBuE/c2n7dY+YtZjOtphXVYU8GSo3xD
         JDjf+stt7BcM8PzdnNkpvSOepvOYiT2IifCXfm5SzX+e/AGvlfjDPqje53K82SC8cdSO
         PnIHly/jitklwmlzhBMcPoGeBDzdsuf/y5N5lweCeh/cMKAkiZJqhJ+PC3HKP4a1Ng7v
         qEvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789052590; x=1789657390;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8whDIqBhsAHgrrO6NDVanhr5yk0i6lWH6hgEmhFdyNQ=;
        b=alBLspd2GcEft/o0vybHEPOtuerKz8V4ToaH1MavczStSANrrZ88hCBogphv7YhasI
         89Pp5Ez7HCmW296u66ZxqO347dfMtr87CvdBAIjAmCr8TscZLjA7RHewNLvEhxaLLCyv
         2C4s7i6LL3CJrrLIn1sPChC/mHoy2geWzIyV8JFVm2e31BMkdGawgz8zbEKRbWXCMuOH
         VhTsjLDvHCSPPscJkIXuJX9Xlzk7wC/AB7pqF/OfMAyAqC7OI/fiqo1WKvfceSYfOiqS
         j6EPefloMY1cygvqTxS+PNE133kBpHLeZkQQALV+a5Vl3qF+SSE2x8a4XoZmRUaAjFhm
         Yrxg==
X-Forwarded-Encrypted: i=1; AKwUvBwbnvxrgr8sYH4btkHa2Y26m8Ygv6F4vZ+BLuJi6M8sGZf+vYKqmQTUESBiKBYmxCHjI0HDqW3zDsTUU6k=@vger.kernel.org
X-Gm-Message-State: AFuF++lpOiC58xEwtWFzYZguK79rQO+olxPiazcU2o50bqHmhPVyvYt0
	bAsOaOUUJnm7SiuMQtB5oDpeX3XTVA4I/o07q+3cF3BaAVyyUqULF/1q
X-Gm-Gg: AYBFou3rW5PqiU9hnE1D6K3GLKht6ZSyWRKMnYGl2KYBx1R+VT7qXLijlfdnVXKmtQy
	iZxD7J3Iuqh7p0v5Gm1y7w86fH/f2219Xg1+Q7ThlZLKqrDZ0tgZXlcpC1pg1kTK1x+XVznY99Z
	z9aCydt9ZNXZI/1UefSUlFFkLEYU+y6huMklPHHyF2/Kpdqu8V9Ij3TPSpZ32SS+oVeCcq02aZE
	Inl86vsgG+SRHa/8M184Mlgt5VARGHFw1G/Ns8ZNSLhhP+DaToUX9b6JaZZt8AeuYWsUJrnIQv/
	Ds11xkS6JyqJepZncmdsadOnoctnv3gTrDlK2lmiX/gXTrr3mRCil2xKRgrOixamUPh0TkBsxFj
	t+SJBMWDsuIon9wif0WHN8ZcpnOCs9ay6yy6fUCOq68e2aK3AjeRT9NQu4gZdF513W33EvObHtm
	udr5Rg2dlTJWwkdzz8IHx14j3sq0tcEz+PzlP21psVVNZNuP5mdAQQgtd/RILVCjiWvZ6Is3jUD
	VBSDTqH4j9k1Aw=
X-Received: by 2002:a05:6820:1f03:b0:6bd:d2ad:55a1 with SMTP id 006d021491bc7-6bdd2ad62a0mr7279865eaf.9.1789052589688;
        Thu, 10 Sep 2026 08:03:09 -0700 (PDT)
Received: from ASUS-TUF-Gaming-F15 ([49.205.200.100])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-336c2571039sm31536449eec.25.2026.09.10.08.03.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 08:03:08 -0700 (PDT)
Date: Thu, 10 Sep 2026 20:33:00 +0530
From: S Tarun Kumar Lywait <tarun.k.lywait@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: camera: Fix function declaration
 alignment
Message-ID: <aqLGpAmMRRwQiTwl@ASUS-TUF-Gaming-F15>
References: <20260908171011.4122-1-tarun.k.lywait@gmail.com>
 <2026090928-playtime-carwash-eb07@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026090928-playtime-carwash-eb07@gregkh>

> That does not look correct at all, what tool asked you to make this type
> of change?

I used the checkpatch script itself (./scripts/checkpatch.pl). At first, it showed me the following issue:

CHECK: Alignment should match open parenthesis
#267: FILE: drivers/staging/greybus/camera.c:267:
+static const int gb_camera_configure_streams_validate_response(struct gb_camera *gcam,
+               struct gb_camera_configure_streams_response *resp,

So I fixed the alignment as follows:

static const int gb_camera_configure_streams_validate_response(struct gb_camera *gcam,
                                                               struct gb_camera_configure_streams_response *resp,
                                                               unsigned int nstreams)

But after making this change, I ran the script again and found another issue popping up, replacing the earlier issue:

CHECK: line length of 113 exceeds 100 columns
#267: FILE: drivers/staging/greybus/camera.c:267:
+                                                             struct gb_camera_configure_streams_response *resp,

So, I finally ended up with the current patch, that didn't raise any issue pertaining to this, when running the checkpatch script.

Please let me know in case of further queries.

Thanks,
Tarun Lywait
