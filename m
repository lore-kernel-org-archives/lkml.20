Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4B3C44F548
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 07:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790148876; cv=none; b=JwNm7oyMTEdRYAWyHxZJLzAdV6FZTFVJu4jx8Mj1G5CmbT/VnAbIyZ5mXo9EWu1QEgzwYf6srVO/jJmBurdq6Ntyw7dhCykhmQg7EX+dhoJXZurP4+fRKuSO/36r4t1GZ73Z3JGzaE6TM2siI0VPyORgi5yv+k3SgLEvyfs4eZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790148876; c=relaxed/simple;
	bh=oxjEu3g1JDs13VRgHPDWh/8ulg6HFNUl6DeNgeFs1Ng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XP7xaPHi60QJ6lOeKnLA9yQk1ck3z4tLIWVxNJxG8MtQF2C/10028yjLbQPtuteBJcCTV0rzMxFfT5Ztn01RqND8v6x1DcX6vUtTamqqiMA526rmBsHYTsx2PfRAM0CmnbMPiZ6pH3aFBV3xuw6i2gIzcC+UD1vHlJd/gEFTs/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MLvRPAh7; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MLvRPAh7"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a985e8fcddso797695a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 00:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790148873; x=1790753673; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=d5uHsM00XwjcAY5oHukw8fi+wOputRr/BzL4BNlEpqM=;
        b=MLvRPAh7Qj7+m8JY66nfUZxW4zkE/vIAKDwxVb9w9jszP3Q7fZmck936DRkLAmYOTW
         7aRh6x5yp4QNas7EKuJfDdvBWbjFIfbOwkjyZcfxk/7mV5BhI0yFtAfqLqISWjLYsM2l
         kkiiAs6cTzW7LxnsKVBZe+Nc3q9ilxE3hcR/sHfhPctqXPk4NWI/GkYbi5HNnCWZkI7a
         WhxtZ1s9YKdTxQxxTKPZwOM6lN2XVXJKOxjSoUqoC2A7wIQKjTcRevvyagW5wnS5U1mX
         1AHlhZ89jrcpwEQDK+UnO7s6clUdCmgJAOboOGrpoyLW7Fg+TnnFpv+au1UEt2qkMJHH
         oabA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790148873; x=1790753673;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d5uHsM00XwjcAY5oHukw8fi+wOputRr/BzL4BNlEpqM=;
        b=ZzEPhyQrJjHFpsY0ZZvRQFLKBuPYyTpu/AfpBBeTSfdXirxT7A6KWKKdlF0IQ3dUqr
         yo7z/b5h+27ifgRgcMvK38Ru2VzGTgcFrarTSGFZQ3xchxeLKN73fbNwOqvgCItIsbFs
         eB1nK3tQVP7FFN6UdLlFyYFTbP2DBTZGE3LvTK51dzxUztQgoEbx1Z3neWgcmFFdcbi6
         OSfXYlKFdF98XkKiKB2U/AEb0EGSZZFEE9i2fyySe6eqxRNqpJ2Lrv25FFtNkek1y0ZS
         EqjW02Wyb2F6XuQxlTJRQM1C420qSeBwBuv3dNFovou2FSG08z/6IccLBCgDasfwG0aH
         E51Q==
X-Forwarded-Encrypted: i=1; AKwUvByyPHVOSiezkUwu9eZ2+PtPbeg+ns1at2MYTdi+qrZJ+6Zi9jIVQiKm2Ja55056jOKNG5thxmTAI5bjnUA=@vger.kernel.org
X-Gm-Message-State: AFuF++nCRTA/9WnjMxO/KBk2MP7+1TF5mAePb980/smGU1lhU82AmEs5
	T6YZuq262dt2zftLLxfJN3CgWGZ7o2syehFv4MbKTzZwbllgI3PckuZF
X-Gm-Gg: AYBFou1HqO2X2gWuFqMwZ7AryqyKD8+JZS52/BeeW1xEtRbot4sxeoR294ec758jxy3
	lnTfZT70RK1CJZGp73N+LARCLnBaVp7UZJJHRbKkXp5ZTgxxIFsAMrW7m/3UfShJbrCGkF4xuu2
	/gwsKbvj7F6c308RERYDlIE3NTd0YDHgp6y8LE97+AJozQ9Zmbq/RRGZOZ1IK7uYn0zDJtwcvU+
	LgZnoa1VLz1mdPOWHBe/VKxrDu/nmh8ijXX7L7I/uV+/IP1VW0nsTyee6h4VsbOwfeP8IuZbnEu
	4JncDfhkUlmfokFD+P3olyUg87t9XbS9bUbSb/z/g2mn8I3uFxfmTkCfvDUp6Ghsja8ey5Ay3wi
	AvokSLwdKxgRsod1Nlaxude84RvSLaWKtskzMhJ39GMqUh4xb9PH/wLW1BAogwGxwFrD4t6cSrk
	pXxVwMW5Q8qDLLNqVxf/lwTSVKZjZ/0BhZKJc1Ppze/LYGfow39H/kJylqpv8M1xTPYCA=
X-Received: by 2002:a05:6402:51d4:b0:6aa:1db:f7f3 with SMTP id 4fb4d7f45d1cf-6aab3b7f6aemr1427318a12.37.1790148872625;
        Wed, 23 Sep 2026 00:34:32 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aab3896c88sm970410a12.20.2026.09.23.00.34.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 00:34:31 -0700 (PDT)
Date: Wed, 23 Sep 2026 10:34:27 +0300
From: Dan Carpenter <error27@gmail.com>
To: Eduard Zateev <hackerowskiy@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	linux-staging@lists.linux.dev, linux-fbdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: sm750fb: remove unused variable 'tmp' in
 sw_i2c_wait
Message-ID: <arOBA2jJ7_9a1XMs@stanley.mountain>
References: <20260923013526.12225-1-hackerowskiy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923013526.12225-1-hackerowskiy@gmail.com>

On Wed, Sep 23, 2026 at 03:35:26AM +0200, Eduard Zateev wrote:
> The variable 'tmp' in sw_i2c_wait() is written but never read outside
> the loop, triggering a set-but-not-used warning with W=1. The loop
> itself is a fixed-count busy-wait with no side effects; remove the
> unused variable and keep the empty loop body.
> 
> Signed-off-by: Eduard Zateev <hackerowskiy@gmail.com>
> ---

Search the archives to see if someone has sent a patch like this
before.

https://lore.kernel.org/all/abfFn_AET_xAVjji@stanley.mountain/

Compilers often remove empty busy loops so that probably explains
why they added the nonsense code.

We don't want to silence this warning because the code is legitimately
bad and should trigger a warning.  But until someone can test it, then
it's impossible to fix.

regards,
dan carpenter

