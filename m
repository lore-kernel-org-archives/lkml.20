Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 940AC2D8376
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 04:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791780199; cv=none; b=jZ6FYVYdZ1Mz2qdKUGWf8eu8JuZdK0GNCpW6q4QXAtRFO3m+19YrumnsHE8vc87qGijSgrF+OGjLRjMNR+hbheFU+ba3ywk8xLEhvD+BBnINMORfKZJ2CC5J3jpA7dN5xo4RtsiSKqRH+cg3BlNEM4VJbiEIBHg4FDmpZPGYwXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791780199; c=relaxed/simple;
	bh=0OpGGmyzR6hYInQ/o6poan46Ski4KQqLsvP8EMmDX+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fb/p4yHMjmPPsqZnaWUYxjU1fO15tKIi082l5u8p4GUc/Nfpu/2iu88y3PVEK7pa93OZeZ0u7GMK2RWg5GNtgN2jp6isldaBtT40H/zLfeTnQkWj2D7dB8YRLbqyInyiEa2H2ARsA1KYXw131M//3QRmK0DXdBiUX/YTU1Jf3Vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OfiTD/1g; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OfiTD/1g"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e8ad5b31c7so5974135ad.3
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 21:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791780198; x=1792384998; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zF0v8+RQpnbFgXQuQsdyCo7Vj/kY7YNKYw3p2wRBVZw=;
        b=OfiTD/1gpmhutmYYUCDiCNKF2rOy0QbT9f/tQ2HU7BR9UYQBAZEO9IaY6kSNHOn5oV
         uBueovMU1o/POzTFTi7455kg3Wm8Bz3a+phYjA/Z5/mVRHh+hRSPQCxHh3Fq4FZ1d16X
         /hIvce74J4xDU9Zv3gtSN50WXqgxY9zIw3hxh8c44bnrX6KKmpvsyzuyoCVx2CdHaEHs
         y21maHBAwoAGsz4IVVfYMyY25qGqsp5U63HTxc1Hh3d91vW8KagJ3xrZ7fKLnok4awag
         Ge677+am2KfVPfsMCN7dI8E91J3EyicUcdt2sSJLLTKCNWGk3/tSIO2y/jXw0tm1NNTI
         f74w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791780198; x=1792384998;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zF0v8+RQpnbFgXQuQsdyCo7Vj/kY7YNKYw3p2wRBVZw=;
        b=y5DxkluLRj3aVsstOGh8mnNjt7eGim33WTeFnvNtr5sw+8cqHh55SasVa2WVSopYbm
         ePz1BJPGDfS7eSpAU4Yr4vVf+cknr/ZZfpnDG3z2zPds+v3eLk/6iuRzaaTabyd2aSJm
         VMI013il3WVG0JzA4++gVNBZfjwi695zlA3OG9smBKVQr2xfUaYPddRKXysDUgPitGil
         tGzvtJlbq9lY+/bYm9lvWncQe1oEjJrBDok8cwyiGkayaqjswoGVZoFe4Uh/ptmzZsw3
         UyAZ8bKOVg2b17S45r1LKLHA9o9N1wRxK0QU5l56sgIm8DDyOhVKVUgLXQADZpNFpTWn
         nTkw==
X-Forwarded-Encrypted: i=1; AKwUvBz9Mq92LC3qh5K//+olkXkjyz/wk3XxDwmx/tI6gscvK72SnD3P2COSyQqhnmGQ7c2Q+nTb/1i6AEbrVZo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKBAzaJgqJQRUiXu0RXnyYoz3iE71zX0hyk0s5SZagkjLkho0+j
	bWf5Dmgp6a7OFMazsf1H/y1ZTomELSnpuHO3327UagMfkyQV5faxEUFf
X-Gm-Gg: AYBFou2aPssNBglVQNCdGKnVLyBZ4AmJDjmkzQSMWpEiLRmPhPlJA1KssqgoTMwzUiy
	Sb7BK5QPXdHXMJjXC86n6QRo2XbWjewphExwGmyV/5499MnjRIxUN3GZ686KCV8Ixo1wFr26KkX
	tUhZxKs9ZgrZ9u/fqsBZuOyeB7vN4CoR4ll7e0BkJ3ZsmHegPYI20sb4WXdV0aeUjtegI0PtgyT
	x6KazdRwUi417mFC3f3VOseD2E653gUSheYBRRIznRHCLrOS7lqnZro0gJlyvluIgAU9QpnoDI/
	MGm9eGIdbFjvWalaMNPM7con02qJm/iGrgDzWDi7WJz40qXqkCa8CLEacNgYdsZBGarPERZ316P
	CIi9+Q4W1OInTbpviedTu0OFsB51DBGmvB/fxM3PuqCPS2QpiAqpMphaIkp391+NBkAtHXJR+tK
	VGWgYM1xhM1/kP7Pu82WmgeqoVzAj7WnINXtJ/Ica8xJIrYofpzLJ5IyYOH6/m
X-Received: by 2002:a17:902:e884:b0:2dd:ad74:6d19 with SMTP id d9443c01a7336-2e842aba7a7mr73619335ad.31.1791780197695;
        Sun, 11 Oct 2026 21:43:17 -0700 (PDT)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e84219e525sm38919835ad.16.2026.10.11.21.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 21:43:15 -0700 (PDT)
Date: Mon, 12 Oct 2026 13:43:11 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: liubaolin <liubaolin12138@163.com>
Cc: linkinjeon@kernel.org, ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org, chenxiaosong@chenxiaosong.com,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: Re: [PATCH v4 00/10] ntfs: persist Linux file attributes in an EA
Message-ID: <asxlX7ysgW7--bE5@hyunchul-PC02>
References: <20260923060246.2499192-1-liubaolin12138@163.com>
 <1385152d-9e3d-46da-9a3a-299ad60d521c@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1385152d-9e3d-46da-9a3a-299ad60d521c@163.com>

Hi Baolin,

> 
> Hi Namjae and Hyunchul,
>     Are there any remaining concerns or changes needed for this patch 
> series?
>     I'd be happy to address any feedback.

No, I think he maybe have missed these series.

> 
> Thanks,
> Baolin.
> 

-- 
Thanks,
Hyunchul
