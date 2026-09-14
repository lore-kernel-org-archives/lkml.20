Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D55247C11A
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 17:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789405844; cv=none; b=Nhp0rgcAD6wdq4flYfFX1hkMSYO2eQ0SZXGvAyhsesNV2Dm5hA55KC10mZruVk8mj64UAALZO3xvdzK+RUzdQDmNiTctSv0QiiZUdcEKDX2K2JijYTK+gPWFJi8FynRXg+k4ooKgU+qmkrQMeRBJWygXjdPsHe/wAQWnFkhDT3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789405844; c=relaxed/simple;
	bh=kDPTjFrg6wBIbxiAjuUNocFOT2xMrWbirHryM1SZfV0=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ga1Ub8hWcZotsW4sGxbD181VL6W++mXf1hrTqtRftfC66uRoNO33yI09U+69CEiVEktKyXqcYJ6RU16ip+aTsY1UNqwGXA+ENlzRT0G4w3A6AKuNpAGkW0NO6zTh+ROzjJsSQmZ3n686A1sZ0XAsECdmanrrSRK2kLL6Wl9yddA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mswa0AhP; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mswa0AhP"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6a9983162dcso4522249a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 10:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789405840; x=1790010640; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=s10O26OyymXqv9mIGwISr+cwCeJfHQLeL7WGGnIH+sE=;
        b=mswa0AhPdhyRKZJzogwQh91sieAnk93VZ2Bc7ZSomHRsPHZnr4P7eAcBXJ8o1kAM+T
         4gAuzhIZkWSDNnbsFwIoluSP9+E4fbL/Ep00iyMo9l2nb84TMFwf/ACC40jAMEtSy+6d
         Uos+5JYFykrsQD2vwktVz8Ii5D6s1ePokkkJ652I+FsUgpbQk94jf4QUpNIUt2Zo7bLr
         0Vrsmr5X+DEct+5Ha+gMaUmKu6qa7Gl35kS+IPmqmmEpCdDGZ/fqi7pglv6rFWpW3zAc
         X1uz1v5Dnrm9nkzZndJLLz3lXAkHWFrrhFZzMQyOU03WCpZFH1ypj3yKEuOJNo5TwBBs
         24HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789405840; x=1790010640;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s10O26OyymXqv9mIGwISr+cwCeJfHQLeL7WGGnIH+sE=;
        b=PfohXKeyvKXNZE6SaHs7+xaKxQd7h7ywE7fOjRKWPzBaeQaqdgk9xWalRAG2ZwFlh8
         XMZBEC8ve8gWtuFX3jpG552KOiHbTD+zgHhvWXd09bkU/rqwx54yJc23nuAEBmD6K10y
         aFUqdQo/nfUuUe6OW2EBiul1dPZdt+8zlMNjxknopam9ThqbIVCNSSKlM3CPLZPjIMAg
         Q/vrORgsDGSu9BhETt7JeVJDgJTxlQWRfxeDtJladQ2UcfQjlLlpgV0TWT1eBlPaYH36
         wq3IjDEOa88nNOpSUBm3eFobvIHlrTk2zqXxChvT0MXkX560cm9FganDSTVxC4njXQk7
         FfOw==
X-Forwarded-Encrypted: i=1; AKwUvBwP2ptQ1V7/RQx84eOurUU8f+Zg5C8+Ln1i2vy3sF/mtnKxnqjOGhcYu623ggalH10xa1nIQ9QpCn3jEC8=@vger.kernel.org
X-Gm-Message-State: AFuF++nYEDY33VCOqpcpVWd61G+c69e/83mVR6X+2RK69nC/3Ey4o2s9
	U1BrZ76emcLRT82Wicejnh3RhVf19FAuTy+i/3W11Mh6ynDkgHcExAJNaW3aFYrG
X-Gm-Gg: AYBFou26NgJduOiOC8Jrmx99SDl1s/ThO6wgwy3rqRtBtgM0ntDWPuDcCuppbN+R/lw
	84RUFjviERL9AWpozBd1i/8CrbaVpqb3GjYG9HNResiodqpFdrj/yVo+Q5j08K9IuKHaGuVG9li
	M5boKPR57vIBohw+Os6X/VPkfNb34n+qhtZ9kCugiBYIE3CxQV92EkR+vH7/Wbu/uToF/znlYwR
	zR4CNJfcvolf0xzkVxtb/v2bSlIh3/reITLztgc5jSeQcOUrLRH1Fg1NGyMKaR61cDEOu2MPmi2
	cLiEfncotO9bVJRROrsTKhsjMwCwMt2Q3KzVR0HOWxh7DpsqNNZTCSPEBsNX/b+BpTYFuhP1XH+
	Vq/hUStos9G1MwS42KOFZC3fIdqXxSX6WfA80Ak00fAvbxQ/jrPxLqWmLoUwSDs83wr1eeHaUMQ
	m60D0v3RbtbV6IvaVjaYpyDFtdvaL8NdZhsB/s
X-Received: by 2002:a05:6402:4615:b0:6a6:4004:4ae6 with SMTP id 4fb4d7f45d1cf-6a9f62132bcmr2007106a12.5.1789405840183;
        Mon, 14 Sep 2026 10:10:40 -0700 (PDT)
Received: from milan ([2001:9b1:d5a0:a500::24b])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9b5920f4asm4474021a12.16.2026.09.14.10.10.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 10:10:39 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@milan>
Date: Mon, 14 Sep 2026 19:10:37 +0200
To: Ye Liu <ye.liu@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, Ye Liu <liuye@kylinos.cn>
Subject: Re: [PATCH 3/3] mm/vmalloc: extract show_busy_info from
 vmalloc_info_show
Message-ID: <aqgqjRJ8qpYmx04v@milan>
References: <20260914-vmalloc_study-v1-0-526f68559706@linux.dev>
 <20260914-vmalloc_study-v1-3-526f68559706@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-vmalloc_study-v1-3-526f68559706@linux.dev>

On Mon, Sep 14, 2026 at 11:34:02AM +0800, Ye Liu wrote:
> From: Ye Liu <liuye@kylinos.cn>
> 
> Extract the busy vmap area iteration into show_busy_info, mirroring
> the existing show_purge_info pattern.
> 
> Signed-off-by: Ye Liu <liuye@kylinos.cn>
> ---
>  mm/vmalloc.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 797933ba9451..7638845377f5 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -5345,12 +5345,12 @@ static void show_purge_info(struct seq_file *m)
>  	}
>  }
>  
> -static int vmalloc_info_show(struct seq_file *m, void *p)
> +static void show_busy_info(struct seq_file *m)
>  {
>  	struct vmap_node *vn;
>  	struct vmap_area *va;
>  	struct vm_struct *v;
> -	unsigned int *counters;
> +	unsigned int *counters = NULL;
>
Is setting counters setting to NULL odd here?

Other than that, LGTM:

Reviewed-by: Uladzislau Rezki (Sony) <urezki@gmail.com>

--
Uladzislau Rezki
