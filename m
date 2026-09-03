Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 760A64C954A
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 15:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788448216; cv=none; b=BhCX0R/ioJQf/8NeGh8lpUfSbLA/aOqYApx/3Ey6WPqYf0FhW68KVN9LVC0ZlWd56CKDN8DR3HWh/Xrjqkz0U1AFCbKsMwyQccXea1P18vCQVSYPMO5xG6cl0O6U/t+Baf0mrNqsxuMzu7Bc+wct4WO2wt0xrPTr0L2U2PB6/Vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788448216; c=relaxed/simple;
	bh=8J90Ed2D/rtqP02MQLzuBC5Hms7Bsqc75+pcmBQqAac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=efUmCzmIt+sLJcBmAgWk9j6XYd9pFf+XgR+c1+eQ2PxdrqRzhbz+0zZroA/hqEBbYPrpwKwbXMIoqi+5xMaJCFy4PuEX6VpcV80j8xhBxkb5aL0cLx2ZzbEqe016IagM4gcJncUMMhzZoDvAnvEINKRfucBl2wnWRQFbmUKwf3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=DeIQCEvM; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="DeIQCEvM"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4995b0343c1so28063235e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 08:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788448212; x=1789053012; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SkAW4/zjROg/ZMAKrB6BCuRDhmC7IAP5Om0nwRBdBSU=;
        b=DeIQCEvMN/LygjE4MPesfpylmfThQDyxfZx3FSG0MkLxfSpWE/ACgPp30mWJPkLDm8
         QN/cR1ABFeaVPqG47iLQblxX+YNWl/WmfeKqBESs2tjdNbTsiYr16Bck7i3T+S9JDHWN
         mMsdx07Sze8TBuf+pSqSZwOLfwMVflF7QJFlgjWsqmXJF45yY6p+G8WSC5rh9C2akiDf
         bJT5kBBQvd56hozyCok3igpb52DGEi0Sjhv4rmnGj+Dy8mt2HOklll6697to1Ytk55sR
         ZLnncSFgqD4BLj1W37znBkVq5dBIi9mTpY6eLzLc2BhJ5UFn/ZtJqV5hp6HhR7gabUBE
         +4JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788448212; x=1789053012;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SkAW4/zjROg/ZMAKrB6BCuRDhmC7IAP5Om0nwRBdBSU=;
        b=DKtDXjLHGKmO/7xmKu/2CFMQ3aDd67hDYe1PWYdsLBcdyjviDkRaLcqBtSZGAV2qoj
         K0XLj0GqZEmfE8gf9O/4HPGzG1vhRPfAHvu8TOAgOt14lcL5yjOFL6/iZ+1nzqxS+KIV
         5dUbQ3lnZayeSSKlQlArgoEiqHoMM6SCZxUGSNz1S5wlbUQHMOHK0P+ndD6j622OtaX6
         Auht2it272XVp11Shxp1ZIC3kKnCxal/124rGWiO18tMxGem0nojcjudekEQcXgEMZiw
         LaUBA1+RmVZebeUm6t3WBV7uBsslIjNGatRXIH7v6SZH723csqLj1UQlPD/5Y4ZFEUr7
         nWGA==
X-Forwarded-Encrypted: i=1; AKwUvBy8g1UrsEnUqzv/82oARbHPz6Eir+u4ueG5897evD8uXCZpIVs1wpJB+PgFX6awz9aKHOIK/bhVD/Tg8IM=@vger.kernel.org
X-Gm-Message-State: AFuF++kTfgBtYY05tY6/KnlnelSEmEkFRP4qCrrMd69bHtD0c5BcPHUW
	/NTV/JImW/aeXBCGbi81ArbrD9XKP1T6AAH5eG3DtQjaKB74WWeHx7iz7yOMmK0uVu/gYIEbrzQ
	xrl3MQg0=
X-Gm-Gg: AYBFou0Xo7xS4j7AW2mmkcew2kbwFRKR813CKcHb2mEz4hvN/4w7vslvyr9drmOVZyh
	g2vS3Jjs+J4PHivJG6gCEIM73a2RU0Gtnf2tfBDVcmZ1x3EH7lR++G3pzYCcT0XnePiBflQNppp
	lLWZ1mrmozv/RoKCJVn0y5E2S6ipTAyZ8i1N/rMXJy1tr9YIDGoY1gr+FZC0FGZM2teFEHqxnse
	1JKb3m9pFtovvsuqBtANh7j5OgqRkvqKtSCY1dv0mmAyMx9v1nd06N/uTKlOAsXKHjPiZ7VWw0l
	3acj4F/2+aP/lIEH0dgnSeWXeHhYMKfx7Wn8krzTNfwzGcxWAbGFFgZteMX0BVdgLwrWKIofl8S
	9NqaHLnkq/jwDJi0IQgT1tMT2q4aUFjsEft7mfxpmcvpFzhREjF24vrGUAV+flGUL2oBzfmj3QZ
	MdlaKXM3PlqS8jsRe9VBU0eika5MPNsABfa/7YQHLc5WXbs+kteg52FlH/umW8+opiIPxsUZKr7
	jvun4ECFk78sSA=
X-Received: by 2002:a05:600c:530e:b0:49c:d618:e341 with SMTP id 5b1f17b1804b1-49ce584bb4amr261348025e9.14.1788448212253;
        Thu, 03 Sep 2026 08:10:12 -0700 (PDT)
Received: from pathway.suse.cz (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5d6029sm80054035e9.6.2026.09.03.08.10.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 08:10:11 -0700 (PDT)
Date: Thu, 3 Sep 2026 17:10:09 +0200
From: Petr Mladek <pmladek@suse.com>
To: Xiaochun Li <lixiaochun@open-hieco.net>
Cc: rostedt@goodmis.org, john.ogness@linutronix.de,
	senozhatsky@chromium.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] printk: Remove remaining boot consoles when a real
 console exists
Message-ID: <apmN0dNBL4anb3Qk@pathway.suse.cz>
References: <20260821071721.178517-1-lixiaochun@open-hieco.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821071721.178517-1-lixiaochun@open-hieco.net>

On Fri 2026-08-21 15:17:21, Xiaochun Li wrote:
> Boot consoles are temporary and should be removed once a real console is
> available. However, the late init cleanup currently only unregisters boot
> consoles that use init section memory. Other boot consoles are expected
> to be removed when the real preferred console is registered.
> 
> This does not cover cases where a real console has registered, but the
> boot console was not removed because the real console did not become the
> preferred console. For example, with multiple console= parameters using
> the same driver, a real 8250 console may be enabled while the early
> console remains registered. The result is duplicate printk output from
> both consoles.
> 
> In the mailing list discussion, two possible approaches were suggested
> to fix this problem [1]. This patch implements the first one: during
> printk_late_init(), check whether at least one real console is already
> registered. If so, unregister all remaining boot consoles. If no real
> console exists yet, keep the existing behavior and unregister only boot
> consoles that reference init section memory, avoiding a period with no
> console output while waiting for a deferred or modular real console.
> 
> Suggested-by: Petr Mladek <pmladek@suse.com>
> Link: https://lore.kernel.org/lkml/ahBsSW2bB2CRfW-k@pathway.suse.cz/ # [1]
> Signed-off-by: Xiaochun Li <lixiaochun@open-hieco.net>

JFYI, the patch has been comitted into printk/linux.git,
branch for-7.4-console-registration.

Best Regards,
Petr
