Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5610A4A2A75
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792047885; cv=none; b=nFny4baCUSPo21PMo6nYKtNql+CYzaxd8sGbDoo/881UtPQxpgTAZqypiShzHaBkLl1bcWHgY+z36hq+0rGJGoQPebLYq3rJYTjgr7TZy507p56Qw/wknktQWiVVpJRK1mXyRUXzCmVHo+TkO4KcrQ+6GlPF3E1GMQ0S7L8skGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792047885; c=relaxed/simple;
	bh=QPgMw/YnIYnykJRwbLR9jTqsp42QiZscLPNCy9f1kb4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G+3aTCu/bQUHAo+zCg0C/SQhEpugakp1xcQvM14s/Mfeo0YwHlGoMOe2Xb98XXOYMgwKsZ8xUj3psSLfKtQU6KfCLcoaFd4ZHiUp+4u2pgkaEXakC9AxVgZQLxgWRSeJ7r50wRy+S5whezQs+kEA2LigdrTKhVpGao6Ce8N8Rhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=T7g842os; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="T7g842os"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a16af2a232so38278745e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 00:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1792047875; x=1792652675; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t/3aSoEQ03reUr8m22oz0Rnacm8T+cI8I55Y5UqdBhw=;
        b=T7g842os3rEj6ngo8JSYO7Fi1Z2DQ4aNeRB1kkzJNRpCeYQFiJ08GcJe4HrY6Sdhl0
         66AU/DyF6qqJh+b9x2urkfSduI6no+xbR0TT18Rit/Zm7a3aD/NB82NckxJrLRwciS2F
         WnP1eeJyC6it9t+UDzKgSviMOh/ttjO7wvdfRLGs7Jex10Q0LhrzAEut4xr3zyzM6TNq
         Wt2UySanhXSsCosWmfCrRabz51paJ+lmzbg7JFyzbOnFA11gEkbUs9QRizhTBumPTIO7
         RZOuJ7Mb/rXrZlCFWYN9SnuYOIhF8TgLhq12/V1epjVtkKG7UrB6z/2I246i57/VC5NM
         7TOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792047875; x=1792652675;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t/3aSoEQ03reUr8m22oz0Rnacm8T+cI8I55Y5UqdBhw=;
        b=ORv74K+9VnMpBb2BTwbqw9kohcAf01MvaQ4rDmtcgmqncieRN9eYokhkTt/pfVqAUO
         mhVDISR2NBsatunlwOnZ/WhmN+ahZeK8+PfAZd2//lToR7ODMSaXsKmJ++SeyTGamAfr
         FsUrX4l6+yBn30PJz9lejacp3/YNRbNwRyVpxGGeV/XIfT555A5cNGFuqNcaPzDCLnNI
         bxj26SPylfGi3xBBhExRiMpQSTLF13UTOLNHJJUOtNw4ltKxSCjW9vARhUqWI+xGofum
         xb79J/RqZ1f5ICw2qqKvw7t+raJhw1dDtpHGtCqfQosMM2avy26cMps/5qSXt8jJX2lE
         GHoQ==
X-Forwarded-Encrypted: i=1; AKwUvBxSryf0XBKbE27y7PFfWrMEaVzwZwtEuOlbSYjSsk+8gBAmCeh96OkthaDzaK8pNLKZ3utkorrYZRqE3nY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIlya2zAORrcx4vUJOYuibY81Yoy+XEnyhjJn1vje7bFMmw2rrC
	049AzOjM5tz2bsgZXaPg96C2bwXcnh2EAkZzNiBTbbcvDUFjoW11szHkw4bay55s1c8=
X-Gm-Gg: AYBFou25+iw8bEYFWBAXqitZcHMGRGIsx5r5GI8dY15GTQ8bimyUFOoUOji6APPC025
	P3nZeasOY/j3uRV9vdtIpOcWO/EIw/Dz8OJHVjAt0eOMvWxZaTA6csV5lObKvY/GkW6aJ/huwke
	4B4Hu72pVTcV4zdW6DkA8khs4sJa4qcRY6u1kckmeLsgIdTQRK7Ig4/UeW+XdhF1Gitxvlywxpf
	IDWU0ZuWpwu5k1NswIkRPy9ES+gyQWUC3iqYgsZDpY9B0LoH5GKOHEiKSUNWkm8xkiWdAsO0XVV
	SK2jgKBH2W/PisKt1q41uOZ+NmsZUGEQL/qeuLmY9u9EWGsSTZEsoaQgkVdA/mAJcjykvZ7E6fp
	c6c8fazALVvm3dprvUkAQygZvq5+alh10Qgf7dODIDjPUynHaII1Fo6MKTtdWZm1F4/CrCKv+Xp
	Jn3InQQx/qgxuJL8KsyKdZ1srpUVQz1AlUem4CeHMCQ/PV+gAOX4qv4jPEqIKbYtzkiCqnoce7d
	U5H2nDicdLD
X-Received: by 2002:a05:600c:548d:b0:4a1:71e5:9420 with SMTP id 5b1f17b1804b1-4a18e49c128mr367720005e9.13.1792047875368;
        Thu, 15 Oct 2026 00:04:35 -0700 (PDT)
Received: from localhost (109-81-30-108.rct.o2.cz. [109.81.30.108])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd69b2a2sm20612325e9.4.2026.10.15.00.04.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 00:04:33 -0700 (PDT)
Date: Thu, 15 Oct 2026 09:03:57 +0200
From: Michal Hocko <mhocko@suse.com>
To: Alexis Bouzigues <BouziguesAlexis@johndeere.com>
Cc: "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"liam@infradead.org" <liam@infradead.org>,
	"ljs@kernel.org" <ljs@kernel.org>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mm: nommu: set MMF_OOM_SKIP in exit_mmap()
Message-ID: <atB63fzpLyfWpzPn@tiehlicka>
References: <20261013-fix-nommu-exit-mmap-oom-skip-v1-1-cb957cdbfcc3@JohnDeere.com>
 <as80Rpm-VHhP14aK@tiehlicka>
 <BY3PR05MB82607AF910C023253C48CD26A09D2@BY3PR05MB8260.namprd05.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BY3PR05MB82607AF910C023253C48CD26A09D2@BY3PR05MB8260.namprd05.prod.outlook.com>

On Wed 14-10-26 21:58:52, Alexis Bouzigues wrote:
> On Wed, Oct 14, 2026 at 09:50:30AM +0200, Michal Hocko wrote:
> > > Set MMF_OOM_SKIP in the NOMMU exit_mmap() once the VMAs are freed, as
> > > the MMU version does.
> > Is this a real problem that you can actually hit?
> 
> Yes, without this change the oom killer can fail to make progress to
> resolve a global oom.

Are you really looking into the code or just relying on an LLM?
Go and check to learn that the oom reaper is only compiled in with
CONFIG_MMU=y

-- 
Michal Hocko
SUSE Labs
