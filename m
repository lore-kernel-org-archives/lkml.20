Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E41B9511187
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 19:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788465060; cv=none; b=dNnTu6yd5Vf5r8k153/LaozE4s6ruREQO8OiuxhqC5I2KZlCM12/qTBpJMMut2b/S5vmh/D+bcfQQGnHTwimuMomkhrNrFpMhHfKf9vPSHR7KSUW+CZHzccigd02mkpU3G5d9H/9RSklQzt2o3lVrzmuEe6xtZF0m4vhYX9H3sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788465060; c=relaxed/simple;
	bh=Vqij/XyfWWBAn/N8UeaWu2TQyOe9gV4MPFIdlCvWqd0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g+pNOHXdi3gqOZ7kl1SPRpv7LyW2Ey0/Sq6cNTOkAKFABUFM7+MLZDHWTv9jOnMnYzP4zx7hh68GHmAwRu62ExgbMouT5KzlKVf+dmoPCE+tE4ajV7jpk+u/cvo7BjyOXsrD1zOd+o4rix2RsXc70grt5eeO6HQE3YNKNFkTWgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nAsPqqXD; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nAsPqqXD"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48586861639so163323f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 12:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788465048; x=1789069848; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GL8zkxepuP0M8EFbInFuzbe9GFtIatxdF7aVOTnQFtA=;
        b=nAsPqqXDfs8Mr/u2+hJp5acvBXtJsKFxZy45UHP6zD1cbsOzsA5LvYG6HUNVDszGf7
         1A1I2U/+l4wH1Xe56sixyLKTjr5ufsf1+fCtuTl72o6i0sMSgmvEu9vHQXEZJgBUoWSX
         ER5Ey7enG66zASspuOwqql1/6dN1ZLeVc1S6f7F2NuhOrl62pekGvpq/a03+ogtZ83D9
         aln5nuQjw5MudHjoB8UXCs0Pva6HQYS2hXG8UH6jCx01soYUbCugeEAaBnmVCKec8nRv
         4paSmzo/u7CmvLlMj0nG6x5iOqsVYzzfIhfHPzE5bPqhWBOxef11vCD9KfubHyX7FPuI
         1a8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788465048; x=1789069848;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GL8zkxepuP0M8EFbInFuzbe9GFtIatxdF7aVOTnQFtA=;
        b=ooEwJokN3ikHafxwQXUgXkRVSXYdLbexu4Ve2tkcccnYndyL5kGvScWE6D7SUWRMTD
         O2PLrOurcIl0FdK3e6G75mExyyW/y+SnB+AaMXLarHEQSlb/I81mTmTSy+7Ldv6PQVP2
         D43OSmkoKZ/16EXzmXUEi0uMxUz7ohatiMwE03i11efVkVzY6IYUP72pT7xgtwRNsJQW
         NdPQ0ffHzYs4/49WZ8PfOdv1sVAft7kr6SurjRksWhBV++DlFLSOb5MjMgr1dnpzi1NI
         Czb7wfnBTsoD7R0cjZGyQdx6y9JenseMaJnJgliBTT1k35zkj5PaSdGePuDDGsKMIF9u
         0rOA==
X-Forwarded-Encrypted: i=1; AKwUvBzPzW/JKftSAzIi1DMFBx9Q+v3pZ2YGWod820GwnhkKJJcqUatVd5mOXgJp4p7BA67a3nh4l7ZGH2oGu78=@vger.kernel.org
X-Gm-Message-State: AFuF++mN4R40XBodIvYPQAT+zRL4mavqMbxLx/Qj1S2QlhxrEq/t1CuT
	6Y7s3RmpdGjpETHJfM6VPD4O+TXNCR33MjPBqAAnDidhhEvt8iPaje35
X-Gm-Gg: AYBFou1ppSLDHdh+nbUU9YdDKYMy67h6x8T5MmOW/ltiwYje77wTjhsLF6hrUCvlcre
	Kt+XYcQ22dah57aJsACz+yVRZVwAZvBTASWiVI95p9XOKt9XtJkL65lKD8jQaww/XCeoQcWOaNE
	IR+G8qkHyvEJl0J5Vk2VpUTG+amZoBegvgsaO3C6exmw3lwdyIm6bBWLFJsnEuMbpjTkyymcQgq
	teHuWqDeg/0NgfSS4bda52hmMkB/zrYxf2K+svTeo8P5v/RVL82Z2+ptnO8dRdMbn6GsgWavlKZ
	a0s4uHEIHE/ERkzOdneiZBJI5tTxU1ygn5LuBBVttEQMp7Y23AlXShFwkFxuBQWqddayqryqAK1
	zUWS7Cd2EBgFdr63l8KEHqCHAEtGWPJ2O9HdxrYPg1QJGF0oBS2IBtACUYIZ4HUeV88SVeW9paD
	pL+FnnZHtraar4kfAEF/rw7aKhTtB+YGHaZwht3FyzyvlPkWPiNhF4GePUXreyOyhlbKmmxY2z+
	kd3G0p02Pof1+QAw5zu2agofVyWp8pxuGWNngIZGiEBhPibbFxiwdr92lUatwozV+n1ONXyfNS8
	RD8G0QERAqrh3LzFBlCe0JFzG5KdOFoVSGb5qy9NozruOvheXIjcGgW1PASWkOX2c72h68tBuzR
	k
X-Received: by 2002:a05:6000:460f:b0:485:8226:c69e with SMTP id ffacd0b85a97d-4858226c95cmr7200438f8f.29.1788465047884;
        Thu, 03 Sep 2026 12:50:47 -0700 (PDT)
Received: from MacBook-Pro-von-Karl (dynamic-2a02-3100-a979-9501-3df6-d7fa-8a5a-06c5.310.pool.telefonica.de. [2a02:3100:a979:9501:3df6:d7fa:8a5a:6c5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885b1320sm792490f8f.27.2026.09.03.12.50.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 12:50:47 -0700 (PDT)
Date: Thu, 3 Sep 2026 21:50:45 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jan Kara <jack@suse.cz>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Oleg Nesterov <oleg@redhat.com>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] super: remember whether freeze holds writer rwsems
Message-ID: <apnNew8Exp44CgQh@gmail.com>
References: <20260903060855.4610-1-kmehltretter@gmail.com>
 <yly6lgithikpjfvmozn73zvcivoftko7ou6qozsf6xntaoi6yc@44aw3yj4i7rh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yly6lgithikpjfvmozn73zvcivoftko7ou6qozsf6xntaoi6yc@44aw3yj4i7rh>

On Thu, Sep 03, 2026 at 12:40:42PM +0100, Jan Kara wrote:
> This looks like one of these theoretical issues LLMs come up with. Frankly,
> I just wouldn't bother. If the fs gets forcibly remounted RO due to
> metadata errors, a frozen fs is likely the least of your worries.
> 

You may be right that this is not worth fixing in generic VFS. I tried the
real filesystem paths anyway:

          Without patch                 With patch
ext2      next write hangs, unmount     write and unmount complete
          gives three RCU warnings
NILFS2    unmount gives three           unmount completes cleanly
          RCU warnings

These tests use FIFREEZE, FITHAW, and corrupted filesystem images.
Other filesystems have similar error paths.

The f2fs report fixed by 930c6ab93492 exercised the same sequence. The ext4
change d3476f3dad4a removed the analogous SB_RDONLY assignment because it
confused filesystem freezing.

The VFS patch only makes thaw release what freeze acquired. It is needed
because these filesystems change SB_RDONLY outside the remount path.

Should I send a v2 with the changelog limited to the reproduced failure,
look at filesystem-specific fixes, or leave this alone?

Thanks,
Karl
