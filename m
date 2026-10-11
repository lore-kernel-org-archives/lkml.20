Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7727B640
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 17:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791739724; cv=none; b=S6gECeUNTQu+rxUdWLGapoIdeX17qnevaJYMAQflczDlgQ15b13p6KrQv6r2uOm1PoC/BAwLeIlGe1hJ7N4jjxYX/x+dqy77MkPZfkQCP8s3aVnK+3NtzTiyG8KKkKsHhKNlLPuLgtULCPddTsxeHlBMvauuFIEnR3IxSiKWNxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791739724; c=relaxed/simple;
	bh=urABzvQsl7hmC3VT2TdbErAzv2tk+B+j4Zx1D6mmC4k=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZwEvVLevmROuO5/pamhCo1MxeiTAMo76wrgdYNweSwS1M50Yx5UQE7cIClbiaDmJ2z1jYcZSgOYG4oMxjp2t0E09oyZ9k6IZvQBVw99AXx7/kQ6ouWU1mwDFCD5EmjvxrWQnFpGILSVRdzJFvXxIj5zDk8DHhAtNmKhfhehGBjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lZ7dtnBP; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lZ7dtnBP"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48b03f23305so997995f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 10:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791739721; x=1792344521; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KKHjvAionpRnh537vE64rAPf/zZKwgVi1HI9ARBHrww=;
        b=lZ7dtnBPEdiEcOOS18vlESNOOyHTDFTkxt72pBxemL0fUUHg6CVbPVJWaZuMyBn1Tq
         cPRyv6HJAhxHOyjmJiGsxm9l7pcIhMaySloXfMcBIC7w9Pr0bmJcx7TiGbRVG/yuy6DO
         XP882eOZKHfqlxAUxmemBSSgavwoBfthNPaRvsxPM156AGriz+mhYfEP8xolsqoTsHpB
         ClQj9WHRqwtzbQqVmKr9LqcJrtzdLEpYFW26n8afX6pWkNZukcCY/xoa3GwcmHxBCllQ
         1SVtyjNsh/EYuNFqVgx6AGkvNV3XU3wzwBUbVy2DsADwg6ykOQbm0Pve2INNFo1UVe0J
         Xgeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791739721; x=1792344521;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KKHjvAionpRnh537vE64rAPf/zZKwgVi1HI9ARBHrww=;
        b=Cv64JSMuJnIgi/Or3vXuhJddn9MCvE8B6LUqpJGQ2tnsvqPJ6dMMItm/ZdUC8M33ev
         fS2LOVoELcGdTfzQStyBGgnW2d1fskzPBYmnZeb+yLmrhvO1dezSBru30bwJxcm9pB6K
         NW1RyEjP4mwD2m27k9RiAORCQdKMpVvs+QY3xqeRrC1bSwby1rScOHmUpTlKvcbtqvIN
         qVvx/CFrObkLzJxPthUSVQH62VuxwIi6qwhfmyyHBpVmQS2Z9+AreptnNU1x8Z+pubmj
         ae6S23hVUaC4Jzrt1P7cBQMmRTbpWw48sfuPSnoWR3N2RfE9LHyV4FmBI1fwwb5uHbTC
         tImw==
X-Gm-Message-State: AFq9FYJRuxgWroydTGggaMznf4uXNJSj1KG7e5EKPp8AMIEdDM3CO6y6
	CFRanpyd3zZLvHBu8f6mFPnkgOAy9PB46+rqP4scTWnwCviD/0FqhM3+
X-Gm-Gg: AYBFou2Y1HnW04lWvDKW/39hL+owtrwm3YMQMAY8jEmLz+/OTipEKxYTiVPauC1Jg5V
	lXDLdNIBn92d+A13PYEAUdN6PrrdOtXJmFpXP5FfkVjZPg0LprGUsQzQVa38xkpBIgFUB75NLr0
	sevljntK5PE6Bm2P5ilx6c+M3A4FuOjbi/SUo1RDLnGKujggT6CF3Xsc3GbMBQiS1bqNigTL71J
	kktolhowkUcQOs4zZTlExJkR0N/jKxmMqU7AaYrwp8IO2871V66BN6js3tREjMa5ECIEybDPIIg
	o5tYPmyZbrIHiUe0brsg1rWAxsGXNDpqnJ3WSuE4U3JsI74RTDwdqenK6Z6u0XbHznHMDmFC/tS
	CNo3ocehXrYzcboZoQ2jAHrMGhj31a1SdN2AflnsbdE1cE3bLTep0G7CJe9eQ86jx2yYWJ/SwWm
	nHoGo2DTufqKjUOS8dlPt0SK2KkZWzX0wD0stycNkDXhuiqMkfug1Kp1/crMIu5D1lO1JAHBmoL
	5xiHrX0t1ogcjHJ+U7gAmFwQZZ4ykABD2Lh+N2mho4X49GiiOvd8+NHlAo1ZnNQF40LsIUojtTD
	9hJfrMXbTt2Yhk13b6KSBMeH0syBVDLN5KjTOI7rcl8qgRbndaT+a22w9ZF3f+PXWjd5gTrxFZd
	85X/+o2TghOo/crDPILjDaBaOZJrQ/N4=
X-Received: by 2002:a05:6000:2c05:b0:48b:118e:7454 with SMTP id ffacd0b85a97d-48dbaaed0fbmr12464725f8f.31.1791739720893;
        Sun, 11 Oct 2026 10:28:40 -0700 (PDT)
Received: from systembl0wer ([2a02:8308:4092:11f0::f9f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db99b800asm14739092f8f.22.2026.10.11.10.28.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 10:28:40 -0700 (PDT)
Date: Sun, 11 Oct 2026 19:28:38 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Julia Lawall <Julia.Lawall@inria.fr>, Nicolas Palix
 <nicolas.palix@imag.fr>
Cc: linux-kernel@vger.kernel.org, cocci@inria.fr
Subject: Re: [PATCH v3] coccinelle: api: add a checker for
 pm_runtime_use_autosuspend() usage
Message-ID: <20261011192838.4f9a8b44@systembl0wer>
In-Reply-To: <20260916095616.1394-1-joshua.crofts1@gmail.com>
References: <20260916095616.1394-1-joshua.crofts1@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 16 Sep 2026 09:56:16 +0000
Joshua Crofts <joshua.crofts1@gmail.com> wrote:

> Add a checker for ensuring that pm_runtime_dont_use_autosuspend() is
> called in a file if pm_runtime_use_autosuspend() is called and its
> devm_* counterpart isn't present.
> 
> Assisted-by: LLM
> Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
> ---
> Running this in drivers/ yields 195 results, due to
> pm_runtime_dont_use_autosuspend() not being documented well enough.
> 
> Changes in v3:
> - Remove note about resource leak from commit message
> - Link to v2: https://lore.kernel.org/lkml/20260915064327.1377-1-joshua.crofts1@gmail.com/
> 
> Changes in v2:
> - Send correct version
> - Remove unnecessary position variable
> - Remove metavariable
> - Link to v1: https://lore.kernel.org/lkml/20260914151145.1328-1-joshua.crofts1@gmail.com/

Hi, you can drop this patch. I have a patch merged that removes the
need for calling dont_use_autosuspend() on unbind.

https://lore.kernel.org/all/20260919-move-dont-use-autosuspend-v1-1-f6e2d1315c23@gmail.com/

Thanks.

-- 
Kind regards,
Joshua Crofts
