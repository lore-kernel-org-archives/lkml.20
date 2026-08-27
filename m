Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE4CC3C5DDE
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 08:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787818328; cv=none; b=eRyGOFKiktgJGjZLf5fAKumDlXhx9GkXaPb8ZjiEXqW5Lnwld+AADLB4c/W/BpcCIn+dLLFuSCptpR/pBbxTfgPUodIxE4lQ6rGWMr0gDF6FfkCcqnMBVZ7/Z7AJdQDCXTb2DQimeEwvB/D6JzDCH35J28ViWN/B4d44wWcAQbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787818328; c=relaxed/simple;
	bh=XXvcOg7psB4DZp+ToXMNSc3t80UQlypy5XmnMsY69s8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KQnH1BxgenHt6TZrRvFx/KdayWbi1iGCNgJEkuGaa5wAJnWnlTG0KCHBNfGsyTiqzB4KbLq1SJcj9D9FsJlW4PPtw8hhGgzMLNe3SeTmtV60UrkqbpAawznq+X4tcKRbgefHiumadaRuIPffEXZloR/yYJsvOIeCY1KoN5pSZt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YAnGWMKU; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ds+CB0t1; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YAnGWMKU";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ds+CB0t1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787818324;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kkXgBrvkEFF+FLr+uh/pkSXPW3YzeXDokkwBP4HpY6M=;
	b=YAnGWMKU9mgc7asLQiB4caJjTuK82xu9f+xYK6C1NKeB/38X5x/giOXAbDAkx543oCa3r5
	AMGwdNcOQU9qzIbs2e1bf0lSXg328cF7ICm78MMEDrJJFTpjNbapiNviJES+vnSux8jpRg
	1d1imgDd9K2XtSGl9U6mlbMuN1JriC8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-607-crrTrJauOjq_1KI6UfG7jQ-1; Thu, 27 Aug 2026 04:12:01 -0400
X-MC-Unique: crrTrJauOjq_1KI6UfG7jQ-1
X-Mimecast-MFC-AGG-ID: crrTrJauOjq_1KI6UfG7jQ_1787818320
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-482db84a6eeso342276f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 01:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787818320; x=1788423120; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kkXgBrvkEFF+FLr+uh/pkSXPW3YzeXDokkwBP4HpY6M=;
        b=Ds+CB0t1EeJUc0/dDoK5yHrT4gl1Q+rwhi5x51pCd6Fexiqy453xFLiq03dSJkuADz
         ZcqyS3lccNNN10yrexcMSlzC1vMxGcUjY0jkARuja2vduowJqv3ek5SQZzZn8JpcRlfX
         yeBRARSs4PD7hR224LbEE78TjEUqcSPeU+P9/nFdzWh/2aobnZbyVfSGRLiFp7rwqhWZ
         dngMySMp/Qiq8tODO1NB9rxz7FSHqUJBzq+fU1RDstshoqCq7qWP5bNQWnrUQEUFnV8Y
         SBQoVOpm9SNWHuhas9MJidSTJ6ydLDhl8wrB4RkUwCdUnMP/4Ojv/QrCbnYb3ISqbfcF
         2jgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787818320; x=1788423120;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kkXgBrvkEFF+FLr+uh/pkSXPW3YzeXDokkwBP4HpY6M=;
        b=ZdUoFp+z8RGUc34gEXmzsr5WECTH8zbpsA8aTIlQkw6/muOOuvKQ/6xgRy2G/lak8K
         YuYSvZvH6KLBs7YTAtKpkV/F/8NhVzXn3FiMdReCiTYzG3IztLxGljPCZ2jGaj6KvcP4
         CKX16eRUL+wacsdTonyzWQtWLGGwwZIqtAaXsyqFGGtxPldvBE189F3BXVEJjC0gH1iq
         Ouio5Zfv1fuE+Zch6jsevUe+fGUuqXNxkWatostgqxUtMFsHlKE6kvECKQYyWt9IVOq8
         VIfptbmIeDzAwFtv/JywLgc3CT/aMi+KehH1cKJ495aLJmww+7ycgo/XY288G8cEQGjU
         zlPg==
X-Gm-Message-State: AFuF++miKpW9D1oPJob1AiuhxLO0aSwqD539BoNr4u78qSyOXcZNnTBJ
	SfR0jaNXODxpH657I+W6IHAOmdzHDk/iKKpwMprA5jxNzUGmiiDO3whO8ONDkk5R57jp2ncbH8g
	zj2AcURes3mwEURAYRvus4/IA+dkm1CXPIoMdeGca2uW/JeV0Qp/ezPBIN6VyqQCLsA==
X-Gm-Gg: AR+sD10OJkEjwNVEYoG7o6EtOrxVeDvKASZxAgZUMnyeDHNN7/F0qKTXWYTK5NBjluR
	QydnBvx4cjAK3sm5FuK66ym0njok/ZLnLCmKTOJl2Mw0gluBiRnNnpyGQ1ly/8/nKYpxrjTyHun
	/Qd5OgSrJl2gegPH6wvG6S+RUvjHaIN6pWTZ4IOctNcEuxi8ikNPfitW2jgAUaBuN2OnbXjT+nK
	rdhMZHW6CYYMwtRuhMFaVKunTR8m2EJ0FB7rlId+ZIoSm8ZfWDdGzOUbw8oUNAHV6///sO4niCK
	zrldV90zOrMh3eHlY0F6K2z3B4ODlX+MK3TGMx4VZl29pbg+4mmDnvdv0O1LJGAeD27lUrHo+4C
	sce/mXCmkmh8vgnNYuqDKPYCV2pYZ4Eg5jYJWPdf5VPP1sgu62lt5yjbh4sAd5ti7alM6tOE=
X-Received: by 2002:a05:6000:25ed:b0:482:e4bc:51b5 with SMTP id ffacd0b85a97d-482e4bc5453mr15956936f8f.4.1787818320132;
        Thu, 27 Aug 2026 01:12:00 -0700 (PDT)
X-Received: by 2002:a05:6000:25ed:b0:482:e4bc:51b5 with SMTP id ffacd0b85a97d-482e4bc5453mr15956834f8f.4.1787818319636;
        Thu, 27 Aug 2026 01:11:59 -0700 (PDT)
Received: from [192.168.188.103] (ip46-47-231-195.pool-bba.aruba.it. [195.231.47.46])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e28e8fb5sm7064565f8f.29.2026.08.27.01.11.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2026 01:11:58 -0700 (PDT)
Message-ID: <8d53fc95-c945-4cdd-bdb7-d76491b27eea@redhat.com>
Date: Thu, 27 Aug 2026 10:11:57 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] net/sched: act_sample: reset truncation settings
 on action replace
To: Khawar Ahemad <ahemadkhawar123@gmail.com>, netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, jhs@mojatatu.com, jiri@resnulli.us,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, horms@kernel.org
References: <20260825160143.86866-1-ahemadkhawar123@gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
Content-Language: en-US
In-Reply-To: <20260825160143.86866-1-ahemadkhawar123@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/25/26 6:01 PM, Khawar Ahemad wrote:
> When replacing an existing sample action, if TCA_SAMPLE_TRUNC_SIZE is not
> passed in the netlink request, s->truncate and s->trunc_size retain their
> previous values from the prior configuration.
> 
> As a result, a user cannot disable packet truncation when replacing a
> sample action unless the action is fully deleted and recreated. In
> addition, the hardware offload state and netlink dump continue to report
> truncation as active.
> 
> Fix this by explicitly resetting s->truncate to false and s->trunc_size
> to 0 when TCA_SAMPLE_TRUNC_SIZE is omitted during tcf_sample_init().
> 
> Fixes: 5c56784d852a ("net/sched: act_sample: add support for packet truncation")
> Signed-off-by: Khawar Ahemad <ahemadkhawar123@gmail.com>
## Form letter - net-next-closed

net-next pull request for v7.3 has already been merged, and therefore
the net-next tree is closed for new drivers, features, code refactoring
and optimizations. We are currently accepting bug fixes only.

Please repost when net-next reopens after Aug 31st.

RFC patches sent for review only are obviously welcome at any time.

See:
https://www.kernel.org/doc/html/next/process/maintainer-netdev.html#development-cycle
-- 
pw-bot: defer
pv-bot: closed

