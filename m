Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0B9035C68F
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 01:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790559994; cv=none; b=V+30t0aUPrBl4bhALjvO60FY1zimeDa4q6URL9TtUb4gf8z7Yzh0WqPGgq+fogCnPFiYYiMfKv2daJAdN+eZfTchLW/J0QAhTV3egnAWlFOBjg0oDGAMmbyjYA7/2mpJFLtxYOHO1XzEKzzMgupkcNQKGMQjAd1CjcIoG6MM/Qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790559994; c=relaxed/simple;
	bh=CwEEGkb5LfhUqFL6X0D0pZZFTVWEORWMM1J8tgNwZCc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iahUR1n71nSK131QEGL1cVD3S0OT0jiDojlYDNal5yUcNopzOFvWJQ74felJbyv2PGed5dmuWCGjzFuD4mYpLFVBN2zWUd2v+GEg2+hEUl0AscLierRTPWB+yOS+x9zntOjPIy2m7mhWWE65VmM2i0UI6PgEBVHKhThtrIHxcc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YgYzCDGn; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YgYzCDGn"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-880cb967dffso994684b3a.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 18:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790559992; x=1791164792; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iZ72eAXwyDEfXVZpzALXLpMAf0n4c5H+3pOzJgid/94=;
        b=YgYzCDGncyPOwqLA7dyW7IWNJi1MDDT+YwJbt5204Bh8EL7+vuzI5vvgqNmTKFrMLk
         3GRHlcj1Q4pbu33S6Ymj37ym7vgBX+COk2wvEdM9kdJ2LtvJ2THoxGOg+wViSEY0RCSt
         QhOwlSo4ylKhq8zXYrexAb6E3uCMh6BY86iAs3FccI4cZ98X5M6WUtmnMhsjBdRvg7PM
         kraVPNcanT8XRJgrt1fMm3LXX+L608bo4TfodLgLrss75j7rbaos3smcl0rQA4h83Gs+
         FWFz8R6KhlVxEiy44pODDS5sAGpf//AmNz0dx38GBriiZkRUNHRRoUSoAYM1Gvrw+1fM
         4UdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790559992; x=1791164792;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iZ72eAXwyDEfXVZpzALXLpMAf0n4c5H+3pOzJgid/94=;
        b=zzPMJgDfFltfh6vgwOFHy2IYDXVwOIkPKnMZLt6IysLFNjTTuiQ8kqO07gZc+HTDc9
         3HPxS/f0zCqeaWI2SZ7z0rc0gb7Zh/9QYpNPzcMmBTWN80sZzYuZfXN3f5O2wossRdgR
         Bqw+hcI8/+Q8NlIu6HLUH/fXhXcegNI/rQFy5CIH5cul3AIZdy4VJU++y44IDLle1dbn
         85yCSF+47Zf7AZO5N0shmT0PcDtBfF6xKi9xKb0LrzvJJFvO2tHAOyVkjCLsVcHq67+q
         aBrZkdPjK0wXvQ+YbjLdlYLW225/p5ZmSPigt2IASyeIWiDQZrYip90djxOD+UqgMe+C
         EvIg==
X-Forwarded-Encrypted: i=1; AKwUvBymIfl8T3dME0rxwUPARu4vHf+MvOhbQEpKj2RGs4iLqZF4m/ae9T4ddM1ms7Huopy/TcNdB79RTiJv9Gg=@vger.kernel.org
X-Gm-Message-State: AFuF++njCsc+nLKuMDuxyXCtVocMI8L/HHrmTYC+Cz0AU4R8aXhXBsfe
	onYown0gUr9VOWITwzDJjjRz4UeFdfFmYJKS/t3sst4RG1z1IgKJptf7
X-Gm-Gg: AYBFou0o8c95+HxZhmzvcuTi03aoeV96NfLKE+hGGRFqNSYnVcOQoTvimGGL43FQ4CS
	N7sUSqU7kJV+/WYNhz2IhQ4ihcw4qbBW/5yOvCaEffE+JFBI7ccTi3786dJLvcfBUb+KbEA+JDI
	Ta2ixlnZYGpB/y3tASUN0vJKCZve21G6Kmq7wvlyUFkp7xu4CBDRVWah3eiTk5/LoQpRFP5C8QT
	V2OTd9Vt6cSJmZ3gPULMz0Myq0JxXahxbhoJhoO19stoWxNL48OmPjImzXxjM4zbLVnwCD+mFZW
	nmSYPdG0lmxVEqxOuJ+icc6q6BhkhenbH46p5MBt13GgL0mOxJ27p2NMH2Wrl773lUGHlDlBJGk
	24yHUWgLqyBAL0dpoop2wN7KPNlswd2GvsLqcJIVrDjUgZVm3zqPMUjbKekZRLLimrZauv+0HuG
	l4hCf525ZxMDR3gcS/XzwLx9HkMwAwl9SwBzSOE9QCLeM2ZfJy1/ztbv3BHhIQ
X-Received: by 2002:a05:6a00:6c8d:b0:87d:fc55:c995 with SMTP id d2e1a72fcca58-87ea166efb5mr7008558b3a.50.1790559992025;
        Sun, 27 Sep 2026 18:46:32 -0700 (PDT)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87feac93380sm3342874b3a.33.2026.09.27.18.46.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 18:46:31 -0700 (PDT)
Date: Mon, 28 Sep 2026 10:46:28 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Matthias Goergens <matthias.goergens@gmail.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>, ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/6] ntfs: do not turn an unmappable runlist fragment
 into delalloc on write
Message-ID: <arnG9F6dyChrAWNg@hyunchul-PC02>
References: <arMoap0ZgeORuktT@hyunchul-PC02>
 <cover.1790417653.git.matthias.goergens@gmail.com>
 <20260927050831.2739166-2-matthias.goergens@gmail.com>
 <army_CjLBEcEiJ_o@hyunchul-PC02>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <army_CjLBEcEiJ_o@hyunchul-PC02>

On Mon, Sep 28, 2026 at 09:21:16AM +0900, Hyunchul Lee wrote:
> Hi Matthias,
> 
> > +	/*
> > +	 * As in ntfs_attr_vcn_to_rl(): a runlist fragment that could not be
> > +	 * mapped is not a hole.  Treating it as one would put a delalloc
> > +	 * extent over clusters that are allocated on disk but unknown to us.
> > +	 */
> > +	if (lcn == LCN_RL_NOT_MAPPED) {
> 
> We should handle LCN_ENOENT also.

Please ignore the my previous comment about handling LCN_ENOENT. I had
misunderstood the code.

> 
> > +		up_write(&ni->runlist.lock);
> > +		mutex_unlock(&ni->mrec_lock);
> > +		return map_err == -ENOMEM ? -ENOMEM : -EIO;
> > +	}
> > +
> >  	max_clu_count = min(max_clu_count, rl->length - (vcn - rl->vcn));
> >  	if (max_clu_count == 0) {
> >  		ntfs_error(inode->i_sb,
> > -- 
> > 2.55.0
> > 
> 
> -- 
> Thanks,
> Hyunchul

-- 
Thanks,
Hyunchul
