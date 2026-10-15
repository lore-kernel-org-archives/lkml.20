Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB35537CD2E
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 16:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792081707; cv=pass; b=keo/P+Cqj0bkjDftSEi1LIMVuKOQM27GHXve0y651xGGxPrGhpyW061xrmRX+H3apC+fBaEkx4W++y7se0SJx14hBU8Up/DydEJrz0DV740prsn7/5EaBcHO+pmVN+/4HjqRkdx1eJ8yL+gvwBUUI5PZpmM3Gio7QIWKDQZrhXU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792081707; c=relaxed/simple;
	bh=vgjMkfB5AFxaee5+Kwz2qMYoZ0igEfUvX5a78hOyGF4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cP29dM9mFy3lIIb81/AQu1XDXziRBzgzXW/9tlTDHw+cxk3taCNUFKPkqEHg6g/aKD5SBSNFlP0zoSqsXrpjnULWUfrPxxTueBxNP7adTpxyVgr3sQpNs8AaGuiF2zLcXyITIp2lp/Tqk8vXJ7f15YBe4OmWoWz24kmsFB97QvQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n6hJA2MR; arc=pass smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n6hJA2MR"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-8b0ca1ebc8bso18171767b3.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:28:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792081694; cv=none;
        d=google.com; s=arc-20260327;
        b=YCNp8qClXJtiQhmZ7qc9I8NfG7KH2yLyj/0nfN1Ps00y4zaDjIQPAKf41DCBiWnST+
         7mpB1F/DRBdBfEFpP0QEQK8S+ou5qHfePz9G4O9XH6ejToV/82vC1A1lBQQV7aHLRpdm
         Jk51/j1XkLXWpR/kvN00vdPuQD6nq1pJ4coGEP2Qt38Tg6xBwdMIzsD3QqXpn4BOLmbB
         q7EVicGyXeQmazJB+kV30w1jxZJeyhvwlBBdYgP99fsrhU51GMdMzik8jaJDeQcscCKH
         edMVHbDQMOaqllByKZHOSCKH5s1FGC+Uaw8iH8hi8UKryiDQS3SiLES/yIalMsCbJQBg
         2qEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=n2BZinCZ54N7UvTW1neOvwJj3/H4yG3CbAwjf384cj0=;
        fh=/3lS3TjFWh0ARLIhu3vpeRrP1nmIRXgafRYD0bL9EeA=;
        b=CE9IhMtV81cEo2bfbbUvYoaGbHNmN6AvpZS8A4EVUgHpzYr7peFrrcNYeE6YsunlIb
         G64yhub4R6DisF+I2slxC/ZOs52+0x22pQZYR2t6IvIqWFifuW7ib/TLgcGgw9Kr2Yai
         CiupxmAlUj6KiG9gUJiCDY1f93L3MuGp8YjieR8kmyDZOq7oDROCx+MEPx3PotyvYrGQ
         nWnb7UoMPw9XiRuM2TO2cD/fvaBWWZa3XVcTEP1qFnps3DCKWkuQX36QpKSgh/rHKq3Z
         OrCTYCgRP9kQZGxd0tAPzS2FMIIVoR9/T4RBFTND2DgL/EYBl0IeobA28mEBad4gD2Z9
         eDgw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792081694; x=1792686494; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n2BZinCZ54N7UvTW1neOvwJj3/H4yG3CbAwjf384cj0=;
        b=n6hJA2MR2RM9TRYvvc6KZz42TP/2t+clfAo45Yrchi4hcWjnvW93s3viU+Q5i8C933
         kylZxWrdI2GDr8/8MYRi641o9JEcVPGbQw63MaEGN9sHNh5ROnC8PbHhT3OpavEW6rO6
         kKusnchev8eeL07HDcckInZyoH046jljLUSEzoyc2ncfVp95sUjIHS8NDMYImTNDVVJJ
         JbbbFZKHv84Id+ni9Ja5Dfa5sgbk87SmSw1YTyWBrb1WfbT6iWU5qdDF7VwwF6q7LTHo
         R5bL2e6EkuDvy32h1JftWFIn9GaROwuGv8Qo1kWm7uBwGGEDAr/i2xzVxYrY7GyNvNu8
         mlbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792081694; x=1792686494;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=n2BZinCZ54N7UvTW1neOvwJj3/H4yG3CbAwjf384cj0=;
        b=H+Lb5k6WIjKUbl9rCx3Zz3B77kDvwJGQTxLclbztFNrN6SoCOpzaZrvUQqp4Ic1+vn
         yC1unXj+VqhR4CiilXlucjHdYFS1deDHHYDryK7m95Lm3fHOj10ONa3Liw/6PripnLP+
         F895Zccq1mkO6ctrqLRCIzUR4bCb0IgPtaAaebqk/mHbC2oC4J0VQ5Vi7T/Fz8NjRz3g
         wVgM9aDLCUM1NkidlMNEDPuMMo6pnn0zaDdCf8LoS/XdEgLjNpEHCSGVIyrd3FqNZOIt
         G0yBi8iVPCw1+9PBYSpsUyzJ6N8sXWUYluitAIYOndY78+AK8wanmYo5/PHjh98ZCyiy
         hU3g==
X-Forwarded-Encrypted: i=1; AKwUvBz7YCS3+a1eVex36i3Vq1WzTPSwH7S1jHZzJGS2hwsk6U4MObg4vwjS0hZS8WBhRgMpI4RqUyR3Mipn3gA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJdlwBwo9RFCa4AoI6Y3KLH1nIcT9njQQwIGQuPtSQuDisezRLO
	KEDLGWY3gCkmpyAZASTaEbFs5JzhgKRN3BRLksa9DmGKOJ1Pd9d77uLJKmJlvnCjBQMu5grx4Nd
	hyczzDKggNHYrkYwzgNXerIIbRayx0W8=
X-Gm-Gg: AYBFou3eZr2Yl2lussPNEHlanDKSWJbMku5dKVcWN/M2EdwJUrDAgm0dFg4uOZD42AQ
	9efTQ29vsc65uYgfJidB87Oqh8hEfSMeiXHZ5NZysmt+giNyGJ7ytzrlrArhaDu/XKSI/NYae1I
	EAK0PrHw6i/EZRrgoPFPSfTeOS0gkVOZ1Mv4AuMdBDhmzUzuk+acuIBaenin6lgwu3C+Gd1kfWx
	eXXZqACHcjinC4vyPWaBIBXVBXGhrPZkTs+xWhrBcNz5P8CSnBQiry75aiQbX/BBpvw/FlOv235
	KR5f8w59PHBTdfgnh/puIxbBs93KMPqmcOCBgQynVS0jdypzVZsvmJeqxg==
X-Received: by 2002:a05:690c:e3cd:b0:8b0:ad62:19aa with SMTP id
 00721157ae682-8b0ad6230f0mr43580797b3.33.1792081693632; Thu, 15 Oct 2026
 09:28:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <pm-pmb-9c80f858ccc13b3de84d-v7-fcd8c7aa0e837bf0b036@gmail.com>
 <87zewgcuhy.wl-tiwai@suse.de> <CAFRLqsX6Yz2dv_dV4BvV6_F-16WDWYTAk5ikC9WY7ZySkoJKUQ@mail.gmail.com>
 <87qzhrmnz3.wl-tiwai@suse.de> <CAFRLqsUY+RhE=CsMHAvcQtUmwE_hd4_WUhJKSJiwdUUE3a--Yg@mail.gmail.com>
 <87h5in6io5.wl-tiwai@suse.de>
In-Reply-To: <87h5in6io5.wl-tiwai@suse.de>
From: Cen Zhang <zzzccc427@gmail.com>
Date: Fri, 16 Oct 2026 00:28:02 +0800
X-Gm-Features: AclHuK-KzJZ7iZD0Ep4aQoIUqULBhdU-oUSqsjVTblhrNorNiC7ItfIWaHV51BI
Message-ID: <CAFRLqsWAkovmWbd9pf0hbTq=DRZOxK=W0JV0bo0K=L9g0f2zkQ@mail.gmail.com>
Subject: Re: [PATCH v2] ALSA: pcm: Unlink substreams before releasing them
To: Takashi Iwai <tiwai@suse.de>
Cc: perex@perex.cz, tiwai@suse.com, phucduc.bui@gmail.com, 
	cezary.rojewski@intel.com, cassiogabrielcontato@gmail.com, 
	kees+treewide@kernel.org, yilinzhang@moonshot.ai, sammiee5311@gmail.com, 
	kees@kernel.org, thomas.weissschuh@linutronix.de, tglx@kernel.org, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	baijiaju1990@gmail.com, jjzuming@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi Takashi,

>
> Yes, and it's covered by another patch:
>   https://lore.kernel.org/20261015112256.3902-1-tiwai@suse.de
>
>
> thanks,
>
> Takashi

Sorry for missing that. That patch looks good to me. Feel free to add:

Reviewed-by: Cen Zhang <zzzccc427@gmail.com>

Best regards,
Cen Zhang
