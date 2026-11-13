Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794560406;
	b=u7Lf+dD+mPORNIBJNoVnh1yHyaWqcMnNJPB4FYt+5mZMh6NFkjT6YHib+XmyWEbkVQcm
	 U9+APjEeTak5thmxhcnGFjFgZLZFt6ezxBJVOkSaJVU2XaCYvf0chMcPgZ16ZvapGydkF
	 pQqADDAixXl6Mt+gTtmjwQmS3gwC1cKzjhYCpdi9U9xEKV/Bc899pLmXYxk+6KvgNdGqW
	 pRfNTwnt9tDutXk1BwvyAty3zIK8W/2mqR2ZvB064HjJyuBx1FXz4N5jD67mjlpi/6lwx
	 ns6/kFKni8V2vpmuMa19QjGkJ7fyH584/cgV+SDjXPcZbvs6HCsTDe/oAmlbssn4PbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794560406;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MdbPg10Nu4QUmPPwJMGre1ifKk4CLtSLgtBFQEV4AHU=;
	b=PW/Omj7jdC80Uvvb8anv9PvyJEhVBjKwWBxCnGyxe1YfdW3tsYoq8sJ/nniIHynCD9J0
	 WulfDBF8Hg85MUw3zP/up5fpmnIVkISs5BneEbZ0umaCq+YR/V4oBGiCrlbuuNWi3W2Fa
	 UdXb/7mwJoVZYzpGjvfVp//pY/QLO9CtVbHIORvpwU7jrz8oUHkwCIYY9qVulOVdwXFSE
	 B0MWZC4KwUwuA/q9nqYiz5zv5NeYhLtBB9ZEQ1lfJBIkU1rhluMb2ETJARj2PewSadqbf
	 7c2WQtPb3DVONM9brZvf3IYeQHUVZNLQ+NmOzxPXblKpvkKABalrL4coyGeWt6X7sOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="tjRf3Oc/";
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E48EA606A323
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:00:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E48EA606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tjRf3Oc/
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-490d59c3edaso350384f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 01:00:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794560404; x=1795165204; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MdbPg10Nu4QUmPPwJMGre1ifKk4CLtSLgtBFQEV4AHU=;
        b=tjRf3Oc/WVhaxuk5uYM/h8Cm57hl4wfFADq5g/slpD/8L5wJuGsP647rhZ/4mKv0qG
         ut7obRF1yW0efslni1ipWxEb2gw4xhTW5b6PDKWsCURm50k3C94a9r4vm8kNm2l38rGq
         stL9OlS62lbiNcqKVMstWNFf7w0JPHeHedqmW3xIADsWhxvnANqiZzTx/t4G2nPbnxLT
         K5cgevgyCehSCUJbm4cNxdxyDybiBSu+Iz5iZZdGYKib3YldSTjgtuiuKGaUsPGOAawj
         eSuxa9EqJ3T2y8Zv6QtvzTY0y6QiCuxBfpnOuH1tki+f4DbnM1maH/c1Lph1cH+WPIyf
         tk5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794560404; x=1795165204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MdbPg10Nu4QUmPPwJMGre1ifKk4CLtSLgtBFQEV4AHU=;
        b=JxrJwr97LCR+5qsw4HN91fr+xnyL0MVvTur4QndDcQt42cOf3BtGLpfnnedrZMlGJA
         d39NkXohUPDymG6UCPeR4FUroeX6jLp54UspEkQKWyvxnYmcoayztB0EPAL2BxPiEzLM
         A9nABS20WfHVUIAXMzWXEWpU8tV2LyTXjUEuZhEZu73Vq7kDS8l0mJKrgjZRVu+kwCnO
         boVqUmG6/UgxJfHTfI7So/bH2mHNGOUQBPVnq5mHnPIbhkt3InzqYWN6GtQQ9lD0Y9jd
         tOn6asq66J2FbZsLWCBdKvl9Tf/jBz5ANxEmq1+F6oLvCWI7SLWUrQCfpODgnKGQjrVO
         XyuQ==
X-Forwarded-Encrypted: i=1; AL+hErHQGg0NKnGeS/xFmx+AjODhkyMUW9AFZlFLhtqH8KWAzD9IkoLTFpkA4gNS44JDK9Egzz9AqU7MgKqd/EU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ZP00z+iht3+cm+XTVxy3jlto1v/1PvjeGQMSKwByfoVy3R+pk
	lE3xFOIWOXMRsYSDX0GHsapYgZNbwJoAbM1kM432asdhmMPTzqZyZna/EFgLMyn5
X-Gm-Gg: AYBFou1GgzkpCeR3jcSRaStBH16GvTdLHvrtgNvniLYCoGCz4sgyaGcgZSGbxVq9LJy
	6I8mwLL8jBn1DN7nO260W5kvXX3mM1shG3tD9TAS2uqWqUiJEQ6JLB7Gr5V0wkreSsoTVOuBb2S
	/hrxapE7GAlnChqcDm52mVEs8dmYpt4BnQR7pwCOHs4SO/ipdGEPnqZ16W4Sfj0Fv2shHU7/yRC
	FFdVvv8JihkkGeCqH8D+P/1XCT/R39gOCUFkPACHt9w/Sloeb129GYdV+KqZTjMskCoj327/m56
	WwM24mVn7LOfWQEFeGkJzBW/5IQj45V1ZNBOpmHf5LvOv72V7GdxMm/LMBb2uQ6y+JezgMJ3ZVf
	WNXDiRbIlgFwBoaXVWpUs0swJgLo5iDi2LCC10lrVCnJCbWhxl0QknaFadgJw/mK6iwa7sQSYSc
	NxIKkJv/XNG+Zb9hFX4hHp1F5f5gFEhUeN3EqyM6fR3dtcGAQdK4Gs4ZlG9RM3BUEp6aRGAzdYM
	GRoJ70xmWaE21ZNuH+wnnt9c3+jeXI/bDXiN04Owc/ZnpOxQWZGO1pFy1uw82CKBnKGezxaqDrD
	iboioPdVJnCjAHOkW/eXwl9UdZ5ZgjtRkQ==
X-Received: by 2002:a05:6000:4202:b0:493:72f7:1d5b with SMTP id ffacd0b85a97d-49b03217678mr12033138f8f.29.1794560403891;
        Fri, 13 Nov 2026 01:00:03 -0800 (PST)
Received: from kreach.multipass ([77.37.5.67])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d223a29sm4204553f8f.8.2026.11.13.01.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 01:00:03 -0800 (PST)
From: Jude Gyimah <jude.gyimah87@gmail.com>
To: tiwai@suse.com
Cc: perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: aw2-alsa: select SND_PCM
Date: Fri, 13 Nov 2026 09:59:55 +0100
Message-ID: <20261113085955.19796-1-jude.gyimah87@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <87a4ndqi39.wl-tiwai@suse.de>
References: <87a4ndqi39.wl-tiwai@suse.de>
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

> Applied now.  It's interesting why this wasn't caught by build tests
> for long time...

Thanks for applying it.

Yes i agree. Quite interesting that this flew under the radar.
The short answer is that none of the stock configurations can express
the combination, and each one misses it for a different reason.  On
arm64 at v7.3:

  defconfig       SND_AW2 not set     SND_PCM=m   caller absent
  allmodconfig    SND_AW2=m           SND_PCM=m   caller is a module too
  allyesconfig    SND_AW2=y           SND_PCM=y   provider built in
  allnoconfig     neither set

The failure needs SND_AW2=y while SND_PCM=m, and allmodconfig and
allyesconfig are each wrong in exactly one coordinate.

randconfig can express it but is unlikely to find it. And the reason is
kinda counter-intuitive i.e., 110 stanzas in 44 Kconfig files select SND_PCM.  
Any one of them at =y pins SND_PCM=y and hides every caller that does not
select it.  So the configuration has to put all 110 at m or n and this
driver at y.  Treating the tristates as independent and uniform (which
randconfig and tristates are not, since most sit behind PCI or a
platform) that is on the order of (2/3)^110.  The real figure will be
different, but the shape is right. The more drivers select a provider,
the better hidden the one driver that forgot to.

So SND_PCM being selected by almost everything is what protected this
bug rather than what would have exposed it. A sampler would have to be 
lucky in 110 places at once. Solving for the assignment instead takes 
it in one step, which is what turned this up.

It is not a one-off. The same y/m shape found 14 missing selects in
sound/, all of them now applied i.e., five Rockchip, three fsl, sunxi,
four Amlogic, and this. Reproducer configurations and the failing
vmlinux link log for each are published at
https://github.com/JGyimah/kreach under results/, if the ALSA side is
ever interested in running it over sound/ before a merge window.

Best,
Jude
