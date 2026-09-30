Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com [74.125.228.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E5D439320
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 22:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790807560; cv=pass; b=FSopacoslF8R9KlF7I1e2WvxXtWLlHtB5NkiIfoQngVq2P+N5xg8yWP/48i4Votl17Ng3i4gOUfvBlGS4t8pWibjC+2oZoYlP29yUIB4kJi2486KDvyAX/g5rveYw65vjUVmIYALeBLODyRF5bc90mWAkph2kSPqDwa/+F/66Iw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790807560; c=relaxed/simple;
	bh=41zHe/K0N0YlTXyKVd4alQL08QPKvIb2rovNiRRenF4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nqx7azQjLLWTEqi7TmDgp/aB/ZIWbC2a4GloeT3pwgG4PwgQDO1HDw/UG5J435YDjbi3/KhwAHVAyKfyDOgq/ehHqn+0JbJNwu6GUVnIQJrfzqgDqY3Hz2NvEqRaX3ImGcpYc+B2ZEkrpxyOgjyautU5iu5y5oUV0+MhJjCzvMk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oxsunMc0; arc=pass smtp.client-ip=74.125.228.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oxsunMc0"
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6aa1d00daaaso10383693a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 15:32:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790807556; cv=none;
        d=google.com; s=arc-20260327;
        b=g2Iw9ka0IGd6my6+MOIudBeLiCTXc7npqmA2Tz3lgIgnVVUw108SBinIE74G0inh0q
         ZKjY+EKqjrmU/MO9PZ90LhfvQFI6WIfeoi9rhul74VW4g/Wh2/BfcTHrYWl8QBbKpSzE
         iJ7hxB+QtuD6eQKMbaWxfDSztsfY2W0tD54tVRAPmy7CDBzCIGgyK1xUZMDBRNRCMmxT
         hR8UrXjWP5Fjheylr1Vhx7cTQ2h29ukTqbumpxBY+cW8VpUA0yFNzlM0erPpaXw2dnxb
         fpBduUTr+x2554yhSm8GBOMtqX0MAkh8CZyjGViE5yM5YlvY79isCh9YfTfWCKFpylzU
         Lg4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=BKIG/76pbPLgFFPRNg72x+oOwy0I50VygoCLcB5wFPM=;
        fh=Lptah8JXuDjzS2uYr8Xw/YhokwDdK8y1LLB5B/q3rgM=;
        b=OVNYvbXw4Kx3uc4HxjdI/qStupPyDPJbgzAxiPYyKHbqHkZVtY1C2Bu98LGJRGeiX1
         tkUeCmpdm1rsUhvN3tNbJiOZNI08PDZrZEerfbkV63oeKmataaaAEkfMcZ8ZqdQk6EpL
         /4VQoE1Fl/Y0p2PqR20eYwjTSMcskXFjTeiWT2PRVLgm9oo+30ilgBs1g81t8DGkrHta
         tnlhX4ncpmu7C0Y4QxKChbONhZjjWQ1vA5s0apticnPkXY4LrZ0iRRFFf0IFaq3Fz5V1
         4MZsw+mJRJPphdZ4Xfuym8MnlAdFsZXHyRdAPKROkL5M1aNSo5uE9u7dU4CVuc2kQbz9
         KfTg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790807556; x=1791412356; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BKIG/76pbPLgFFPRNg72x+oOwy0I50VygoCLcB5wFPM=;
        b=oxsunMc00sYDokCiKAqu9EnLkd3Ha2oCguW9tcgjPsyySE/nIqxZkl1QgKwzf2S5/b
         OCXelFmvjLb5daZWBSPRSjVOyItYf4LeSda7x5xQ7HxNEF0w69eeFL4XJ1PJUvPAT5JU
         bvpUeguizgAs6+tZEjKRq/hxNO71ugweswqBzV40Qz74PuN1PBLS8fXdyM2KvX0MNNf9
         KxPJIf1L+/d2qamkBJu3v1jpiSQAlDaxyr0kZ6IwrIp60Su4JD9HsRDqpEsGtbaFT/DF
         nBCgJjL/OFGgPSs4bupNfcj1PdwWzOEEt7pO6YSVjIPHNHzLaf5+2UHApH7Nl3DhR0mO
         RzLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790807556; x=1791412356;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BKIG/76pbPLgFFPRNg72x+oOwy0I50VygoCLcB5wFPM=;
        b=OnfqqrrDzd+OQRB8wq5BixUF9XwsW/aOisJQcpAO9grrQkWz1mJls1sTz5V6zReKMd
         k++eGM1uGMo4qXRKscwqqMIeEHiDnSIxCQZiJZVgSmlPAYY4aV9TA6LPynXssTWCmEER
         9gVi5ISqFtRiTGScGJcUhzgXPzPjIQ9+B0vCd3LWiHgTX8Zd5ZtLhEoDpeOjlkjqp+n2
         akoGHA1atZgABWyV1zZjd9OIx8GdBFqhqUZNPCUWvVH2WS9RQSNqp2u+ChS5sw2TaBzT
         N4Ykhq06rqZeoQnJnzNNF4gHYY8WvNyo2wWQlsgseLOQQslYR4t3zvaK6VkTwMnFaJHO
         pdEA==
X-Forwarded-Encrypted: i=1; AKwUvByCTPOY6M8KZjQU7Xej4v3aftLr0w2LZBAQX6djlSvLmexgPsRsseDRJjN4KE81i7+QeX65Bbb03gycqho=@vger.kernel.org
X-Gm-Message-State: AFq9FYLR/lnKGiGIQ6FEYmxUgj5eRf3oFb23VjAFihfU05KKuvi51QxD
	NajMkym30JdF2B5iljJW9hyDWducs4likJ5iAvWzcR0voUmLUTMtunC98T4v3IWjfY9/5opc1cQ
	KcIT9zPZlUfzQ+g+Q9WPxJVzAQP1BcPI=
X-Gm-Gg: AYBFou3V2WxriqR04LZA3RFqN7nwmcR27fl1vUs2XD0qVCAKXnz3GVXSkMekkIbsRQz
	VQs858e6XCtf94HNojAWqoDWTbR0CokUYTP0aN+Xf6ajZcLn3LEPk+nY3mHqNpiWLOzVyiaDqSc
	7qjz+UPiglDRldoI50YCXl3EaYFGJLfeYKk1HpkrHgSO/i0B/TS1e6P4fG6SJmXp1HjCIICHqCC
	L97EUll7wCZry1SIJrrUoOaLefc5XldyZYdF4T+8G9nZg6uQhIjrJknyBjgNkgQ9wnhdAlcQoqx
	+9+X8noNjKZnk9nPqmtqLXj/moj1zLq3uCTma9TtKyqoNNEWN/1adAXcqvtIwzovgkNv+JFFApU
	fjwbG+F8o6axP8UvfKFzb//EWom7x0dbsEfvEJGCQRw==
X-Received: by 2002:a05:6402:51d0:b0:6aa:9f53:221b with SMTP id
 4fb4d7f45d1cf-6ae1988fb77mr2014945a12.4.1790807556270; Wed, 30 Sep 2026
 15:32:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260728122423.358416-2-simone.chifari@gmail.com>
 <202607291626.TnSyWh0f-lkp@intel.com> <arwp1oCq48PBVmNx@zenone.zhora.eu>
In-Reply-To: <arwp1oCq48PBVmNx@zenone.zhora.eu>
From: Simone Chifari <simone.chifari@gmail.com>
Date: Thu, 1 Oct 2026 00:32:25 +0200
X-Gm-Features: AclHuK_dMoVuR_HSmOdtup3JFWShsutsoR1OXuAiRbxPtcD_ducDXt7oVtB0A0E
Message-ID: <CABe7xuZeeVPHhrU77M1poZnjVmCHb_84782-wrWmo0cWdDCWiQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] i2c: imc-skylake: add Intel Skylake-X iMC SMBus adapter
To: Andi Shyti <andi.shyti@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, 
	Stefan Schaeckeler <schaecsn@gmx.net>
Content-Type: text/plain; charset="UTF-8"

Hi Andi,

  On Tue, Sep 29, 2026 at 11:14:00PM +0200, Andi Shyti wrote:
  > Please, be aware that with a test robot failure or warning i
  > don't look at the driver, but I expect a new version coming.

  Thanks for the heads-up. The warning is fixed in v4, which I posted
  on 2026-08-08 as a new thread:

    https://lore.kernel.org/linux-i2c/20260808212414.217511-1-simone.chifari@gmail.com/

  The interference check now casts the complement to u32
  ((u32)~COMMAND_OUR_BITS), and the changelog carries the Reported-by
  and Closes tags for this report.

  If v4 no longer applies to i2c/i2c-host, let me know and I will send
  a v5 rebased on it.

  Thanks,
  Simone

Il giorno mar 29 set 2026 alle ore 23:14 Andi Shyti
<andi.shyti@kernel.org> ha scritto:
>
> Hi Simone,
>
> On Wed, Jul 29, 2026 at 04:22:57PM +0800, kernel test robot wrote:
> > Hi Simone,
> >
> > kernel test robot noticed the following build warnings:
>
> Please, be aware that with a test robot failure or warning i
> don't look at the driver, but I expect a new version coming.
>
> Thanks,
> Andi
