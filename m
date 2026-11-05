Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793918426;
	b=BTsoLi00D37xonOkxYOPLaiyCgEjCZXiIW08Inu4pAtCGGAfB+jwPoKT6zbnz/MnR2+c
	 BXCHYKie4XcrIO0xdLGY+MZsTenVpJ8ZXGhmL929UCnJ/6zevhNxHsuK4yyedxd35B2lP
	 4W/hD6/v7Wxc+kbpDlFr+iEg/XY/5RHQSIIzKYw31Pzf4r0w98aZYUouOqZlg45lb47Px
	 nq7sENxWeoukJi9gvPKVByDcGToA59jdk60pEntm01QRSUHJE8BXAsR80Inyr/8wkX0zG
	 M8nXLzM8O+KxqsfXoibTTy0/zagyridrwJbMOQ3Br+OUlfXrIt0pBt7lKie6YrT1pkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793918426;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=UXtE+j/cqcFyda/TqGBQWXHPqYIyz06WBkp/r9gDWMQ=;
	b=r8oCTAZ4NPyD5bmWHwxeYN01F/5ugzo7BptcgfQiTtHsWNjLasK+H0u+xigYJRfe4nvl
	 siAmatnO1BpXuiKCJrUofJyoNUAB52/9rZOR49cc4lNj/CC2GywuwsC+X5xMDbaGSHDHw
	 k2fYATJHSpZ0pPo40vUISdj3VGW4aLO0INaGzgC5OuQPeUkXZFF32dVkabxbPyvxblNqP
	 cGnKDTGce6e9aiOqijv46aCFayACMfCuuEAOuSNa+Ecr1CrZIftGMAkni7GuFw2kxwNht
	 h5eZVrhknN00xsFtQh5ZGYKr0XlJguesWijtRSBvZ7DWhuYy7k4pNlrskbQP1U2ulyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=asu.edu;
	spf=pass smtp.mailfrom=asu.edu;
	dkim=pass header.d=asu.edu header.i=@asu.edu header.a=rsa-sha256 header.s=google header.b=WdsK6ZAQ;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC4C8606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 22:40:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC4C8606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=asu.edu header.i=@asu.edu header.a=rsa-sha256 header.s=google header.b=WdsK6ZAQ
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-35c76e9614aso34141eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 14:40:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asu.edu; s=google; t=1793918425; x=1794523225; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UXtE+j/cqcFyda/TqGBQWXHPqYIyz06WBkp/r9gDWMQ=;
        b=WdsK6ZAQI72EOCMYCYaXRSMKwuGuxqbLxfLR1dRJuKcVkeKCeJf9a3fdRINIKra6BM
         TwnrBSX6pDDF0nK6ZFsaT2KjbT9jRQeMlwptUPIGgVGW/SyftUmoH6wBvym51nGWfaRU
         vW6ecCU8IrQKAWJHprqrTaYTLdvWuGfO9GOXAG56OCjZ6sSO85HXV6bKjRdTB9CuCeGQ
         p1BSIw3f3dVcRxdkmIZgfVb91pjuXsWPyLvBtb5rsXWFVI/vju2AFJFTIpnMi8dXEt5q
         ymGtUvIgJ63WFzFgJAXFW+PklozGO0UYW+n2ZTLZHFcsv3IsjgLnurBwHfaStrO8ug4S
         Ni4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793918425; x=1794523225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UXtE+j/cqcFyda/TqGBQWXHPqYIyz06WBkp/r9gDWMQ=;
        b=BUWhts0G3KunR43WIPaTY9DC7tasH/d26YGZ0MMEiAk2zxihWZiZu5U0SlO43nswGi
         jFxgiyml2tGwrKNJPEwveIhjcRl9lh5p/iNkajSvPGiVBnOc32KB446hCtpHS183Q3+S
         7IqAauPVG65h3vPWTjNrO3OyrY+Ymr3WPVBEhJO4lh42tX/AhZvJofTaxSZf3ZSZDC8F
         pZyu4plwM6Qs9XbUoVC3Wg/p+IApkYBJgZdFdZulSw5bXvVeuZgjRwzDkCFkt6QkMJc1
         x4Ajs8sqbIz9VeiuLZa6layJWkjI429taPDSIHU2AIWoApkWd9YDboq/YhGmg+G7YmLE
         0wqQ==
X-Forwarded-Encrypted: i=1; AKwUvBxe1eDmR3OQHEfJLg+eeTkP4l1g1zXIRq7W5JMuhAcrQf+TUglJ4OgfTng6zOLX+RNcp/MY65E1cBImYMw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/MW+lZBVbm/SZztH6nssoExQT3NUbNSv0F0WpLiE6lbJbTcfYI
	9+4M9R1F0f3RkHhA4l/gTcPEqwiVP8SWbIBTGP8Nt82V86tOyMglZADYMNNDlff1Bw==
X-Gm-Gg: AYBFou0kgK5QvGpnuE/uyoZDUofrPrk/gLk9+WwA2e2GJYR0jh70KGwPoWNzf4kiNTj
	tdnO6ZJPcTSWR04R1Eyqm/0h9usVEI7586FjvUdwt7prtAgf/TMg2RyHlTELy5cyNCZSyJufeP0
	UuEs3X9WLD1JYYjBerSCcxPqWKYBMt6y+BDy91kKZjWd+VTARMFgjZGecIcmD94wrPVBF6Yj0IS
	LITkf8rcX3xfus6iqy2iwY6fkm10eh4PMU0DLXGmRkDsgWqGfdOHzWjli0Asg3GCSljUSpjNWpm
	keJb8QI/Mcdc31lyIymLqeMZx30b8vCWWG0nfS4wwHtCPehmKVri5fN7Dp7hqSMj8ZryLNApOdG
	W/+MHMZ2ZM4IRiBd7vjBUTLLbd0Ei2U/EWDKSFlOABeUUKIGVQy5u/27pBRUzDiA3j6cS4y/BEk
	Jea6adNax94W62PxGreCe9ZM+NWO/L48sLXEJPUtHfy1x0idcHJXJme360MVOGIwkw/LDpB6Umr
	KZOEygnxgwRVGeCju5os/SzR+0bcQSRljBs1rllyPmPLzL/I7M0tbpY7i9gftS9RtBCV55ZrtBt
	L11Ht6pAir0LteDnX++UGdv6EcpD/LCUQp8wLYZPoJc374iVEC5Ji8xTnw==
X-Received: by 2002:a05:693c:41d6:10b0:36a:1008:5815 with SMTP id 5a478bee46e88-36f729d054amr794897eec.5.1793918424869;
        Thu, 05 Nov 2026 14:40:24 -0800 (PST)
Received: from localhost.localdomain ([206.206.222.26])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa651c57asm251536eec.2.2026.11.05.14.40.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 14:40:24 -0800 (PST)
From: Siddharth Mishra <smish149@asu.edu>
To: Qu Wenruo <wqu@suse.com>
Cc: dsterba@suse.com,
	mason@kernel.org,
	josef@toxicpanda.com,
	fdmanana@kernel.org,
	linux-btrfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+dc9291cf132691aeb478@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: Re: [PATCH 1/2] btrfs: overwrite a leftover balance item instead of BUG_ON()
Date: Thu,  5 Nov 2026 15:40:22 -0700
Message-ID: <20261105224022.254528-1-smish149@asu.edu>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <4c59541a-3f19-4ad3-bef3-59b9c42c2e90@suse.com>
References: <20261105214738.111967-1-smish149@asu.edu> <20261105214738.111967-2-smish149@asu.edu> <4c59541a-3f19-4ad3-bef3-59b9c42c2e90@suse.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, Nov 06, 2026 at 08:39:01AM +1030, Qu Wenruo wrote:
> >
> > Both assumptions can be wrong:
> >
> > - insert_balance_item() inserts the item, then commits the transaction.
> >    btrfs_commit_transaction() can fail without aborting the
> >    transaction, for example when btrfs_start_dirty_block_groups() fails
> >    to allocate a path.
>
> I think no call site can handle a btrfs_commit_transaction() failure
> without transaction abort.
>
> This is a way bigger problem than what you're fixing.

Are you suggesting that the right fix is to make
btrfs_commit_transaction() abort the transaction when
btrfs_start_dirty_block_groups() fails?
