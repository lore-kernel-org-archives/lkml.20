Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC1D17DA66
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 06:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790920895; cv=none; b=SX6sum89HLnYZQV8g2WjgQhOSXylz/h7fJ0zjNzVNZPjfojsY1cx30LlDtIN7rz0AXaNT/AdtfkFxclNZf+1iQd3nO8Q5yJ5iHVsEaqMrFKW4mhXbBAEsBrOtiDdGF8QcgXrEUWSzh7PGpcTSFdyfRvqE0YfAZU5pRUiAP3FYnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790920895; c=relaxed/simple;
	bh=Zzl8GQMYT4ovWCoYqlximp5PJDij3vOuu7nwytPtyeU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QHcCamHt3dToEVVG7XMWMEA+7PwRVvJ68VBO/BE10Y0/iCx7XiYtsiB7fOudue2eGsnawargMMT7enTuzBzad+AT3vXOT1LQDGz7hvhaJeBfTqLyxK0G5jhb6LUJbNukwuXdr0MARvS01SMvsc9sHops01dEiyFOnBQPVtaLebw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m0gEpkWA; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m0gEpkWA"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2dfa54c8ccfso5684845ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 23:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790920893; x=1791525693; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bvzqwuTjdPy91zWm37KIYjrvoEq9pY5JTP911vnp5Bg=;
        b=m0gEpkWAEcEMiKCKafImmMAllmDHp7tF1YDuCG9bClKS817yH6g98rM+ifBUMFhco9
         XU+LXB4EZxHBk/OxGklmcd/mPfq8lqNu43EHcKShAPE+YQ5wLAMAMfCzU6HCaBMNy5C1
         hK8QUh3KmcUNgqOdjJDmllVDIhv8XnBxx0lf1oNSE2xPvjowHGs3CCctLMfRIe31sy7X
         TnY7mU91UYauds2srysRM8X8F/UMCYhKVafRSDxTVDksMdo1YCu+nrcMDh4sVuPvBfjC
         +Z03FQeEgmIyuonYAAueWYBUhHmnwO5+Z2U2QB/SvVTK6V0iaKUguHGe01zFHxllooyT
         ks/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790920893; x=1791525693;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bvzqwuTjdPy91zWm37KIYjrvoEq9pY5JTP911vnp5Bg=;
        b=tEzUtpZ8ouHsrtxhOTK5JDVcUVFOW9L7RgenZO8qN/wugsWezMCNIuII1KY32ednb1
         cC4QROA1cBpvLVS4xrktOpDvtM82GxzKnc5lu8aZ4+EjiqdB58j+OQQfNRYqlJO1M/E+
         Mf7ji5Du04TJYF84gxT8N8vKKqjvrtIEMjoff1nmoBZiageZV3ctfzT4tlTVJ8Ty3xGJ
         ZpZRJee+BF8TEFKTZHJMPP6Tu1TcbeCYmaMS10uc4z95bnwbs/o0E8lcwNTJMwnN1Uzi
         SNro+xXIMIWgGdwC2R4OQRCFwAtRpZEDZwoTpPn5w5JExG8UI4kCPsDGgReheROYqcEr
         RTwQ==
X-Forwarded-Encrypted: i=1; AKwUvByoSzuPAKkNl2jKiNsCna/XC4t9/fWjesGfIobXrttlwjbY8+dVAL0mvTyiZ/QqfK6AKq+vH9cNmxCcorw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLWzqUINUDbuVtEoupM088UUGiXFx7t5K6tf+4M15cw9bRfzcYF
	VGjrnd8W9QA2tbrB1tC/5O6w1CVHrGzkOZA07sFmokI3WVgebDLT5ujE
X-Gm-Gg: AYBFou3V0lZRRR8whwFb9ckqrrt/nIf4fwhVwbyRF9zkkFZFTlEAg2D6R5Fa6Fkly2F
	rrLIO+8lqLqabfgYXUjoKOmy0UPx0CC8jxyEB51HKD45UIhC8Mej0rUE/NytA4MImywKUHAPQZF
	mJJy94hCVbYm5byVF5AeWwe/L8A84/rzHch8PFLQfSXs+Bpi8wUOxsAo2wR2OUHMKN24+bMg6m/
	tpAQAK5723VO6griUBTBZ6AIKTag7rjyRw5luwUbSt1+1XzmJuGzR2Ua8KgI+bMYaemnGqa1hlN
	DR5wzCNKOVnwgsuIKXzXuXJ6QlACJX6Xy7Svx7+OKBwgu3kS+qQ4PGZ7YoJ8bxMqkxfkhgXoXcG
	WEFouPpXR+LF0jSZt6qz/2gsIbSAtbL16/n+tU45EQaNjLN6dY/kVd6iqNyajS/omKI4McWdVCh
	dt+FDKwiK4q2lNtAB8SHydnfWZs3cFbzM7+3x/LugvZ1X79gilaxeDivLvNKF1
X-Received: by 2002:a17:90b:2644:b0:3a0:f2e1:8af9 with SMTP id 98e67ed59e1d1-3a4f3d124f2mr3588321a91.52.1790920893294;
        Thu, 01 Oct 2026 23:01:33 -0700 (PDT)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc9f721a6afsm519169a12.0.2026.10.01.23.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 23:01:32 -0700 (PDT)
Date: Fri, 2 Oct 2026 15:01:30 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: NeilBrown <neil@brown.name>
Cc: Miklos Szeredi <miklos@szeredi.hu>, Amir Goldstein <amir73il@gmail.com>,
	Kees Cook <kees@kernel.org>,
	Joel Granados <joel.granados@kernel.org>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Breno Leitao <leitao@debian.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Jan Harkes <jaharkes@cs.cmu.edu>, Hugh Dickins <hughd@google.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Namjae Jeon <linkinjeon@kernel.org>,
	Carlos Maiolino <cem@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jeff Layton <jlayton@kernel.org>, Jan Kara <jack@suse.cz>,
	linux-fsdevel@vger.kernel.org, fuse-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-unionfs@vger.kernel.org,
	linux-um@lists.infradead.org, codalist@coda.cs.cmu.edu,
	coda@cs.cmu.edu, linux-mm@kvack.org, ntfs@lists.linux.dev,
	linux-xfs@vger.kernel.org
Subject: Re: [PATCH 1/7] VFS/xfs/ntfs: drop parent lock across
 d_alloc_parallel() in d_add_ci()
Message-ID: <ar9IuknaJqrGoF-j@hyunchul-PC02>
References: <20260929034158.1455429-1-neilb@ownmail.net>
 <20260929034158.1455429-2-neilb@ownmail.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260929034158.1455429-2-neilb@ownmail.net>

On Tue, Sep 29, 2026 at 01:36:01PM +1000, NeilBrown wrote:
> From: NeilBrown <neil@brown.name>
> 
> A proposed change will invert the lock ordering between
> d_alloc_parallel() and inode_lock() on the parent.
> When that happens it will not be safe to call d_alloc_parallel() while
> holding the parent lock - even shared.
> 
> We don't need to keep the parent lock held when d_add_ci() is run - the
> VFS doesn't need it as dentry is exclusively held due to
> DCACHE_PAR_LOOKUP and the filesystem has finished its work.
> 
> So drop and reclaim the lock (shared or exclusive as determined by
> LOOKUP_SHARED) to avoid future deadlock.
> 
> Signed-off-by: NeilBrown <neil@brown.name>

For the NTFS part,

Looks good to me.

Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>

-- 
Thanks,
Hyunchul
