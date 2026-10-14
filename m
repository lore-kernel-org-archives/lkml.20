Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0D824BE425
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 13:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791984130; cv=none; b=fvobHcefnOcuoEzqfjr0y7hlsQ57o5DAdCjoBGm7hCzV6LMFwAMGIvJk2/S8uDYUl1+oop2eP6DcMqrGvpEXVKF7AcidRcjhyGassgghTEohme5H07gVwQ4yvwnPxb/KXWuXQlhlBGugTaxXKYBdmEkBQPrybXoMZb4e+yoVWno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791984130; c=relaxed/simple;
	bh=BMzn+8vcpzL3BxHNOZt9jrVdurBtNn82njl6Gt2nLpo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ge2FJZ85UaPzYH4Eb7RJgUJAXeMQ44DrxzS+nxNJgMd91Oppd6Hgq/z91OFo/o6jTTyjGd5uEBMA+/BsxxLK7/eJflI+51UeyA8AkI0WmJhxggtdSJ/5+2QPOxHM2vPPj6teVkmuixepkgsbWECwnXCxMzNqgTxQzyVVKo6pGBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Y6Zx2JxG; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Y6Zx2JxG"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a021c809e3so39892125e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1791984127; x=1792588927; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HRyh3yxUCmzbXRPyb5nWPnjFRrPSu7Z6KeWOosgtJBg=;
        b=Y6Zx2JxG3KQfa2yDtRFAknydmhcpV3gcj3B5YxzIA6RpyJsE8E/ARBr7S6M1iR/HKQ
         caO7nZQGybO530U5v02qo8H8MoJ3XwgFKETwswVj9WDXoLaQXhEEOkfKWvQbhZavNFx+
         vgEnYGYiFcApUwnT4pr4Q1qQ6dNaxPCaK1LVNyw+CRyCqIRGMmt52kUSQR9vYEQ7Qow5
         ttpcO6M7Y3yIOPsg5ejn2RxBOGVWzaAIJea0JdDK0IY43tsRRTASTLAAWEr6QgO76jAw
         esb1m0QAUSmNvcNa/iijiK30zWr4VKChwCgrcp9p2QTSWCE+wc5sIG6bwKA6EzKlCq1s
         pO1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791984127; x=1792588927;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HRyh3yxUCmzbXRPyb5nWPnjFRrPSu7Z6KeWOosgtJBg=;
        b=r53PkIIARZzZqFCIareak60ky1EK1Aki5K3Rswl2aiPGDJIJia+EnJukjjRK/GzY+/
         +aij/AQ9eSy7ePF2t9Tg7D+BieTQ0YrLZPUaWPMV2oHyzI9NK33wHuihAXkmm+EU3End
         0T/0z1QoCvDohs6hoesnnEDK9achGn0YnwGPvUVbPk/p3uue4ZSGFMlRno8nAZ+29pHp
         KsWI+huDdzKRKM/hpb8errdAg9mZO0pO5y/ubmbJlEf45zxhIsRq4oNuuQcdB5Tw3Euw
         FEb7uEYuEXEaVGZivP/efR9h+IGIwA0F4mbgD91W0SILz1kP1kuvkyG1dFaRaUoUnwQ5
         e0QQ==
X-Forwarded-Encrypted: i=1; AKwUvBwK5QtGl7r2Covvcb+S+QQm2KcxiCVq0foatMMAsmNShyATNeVgZIb3H92Jo+z85doRwZISRrFH6GJwxl0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKu8OSPH+QAk+OPBU/LE2zMGHUzQVC7EgIQ+cWu//J04Lclsu7P
	qrSF+VgSXsJowUdFnIFXF/xcGUQuXvaiMkL/9EbLGsVfQ2gMKUoBV7Fd3uMbu/LQWec=
X-Gm-Gg: AYBFou0bU6UvAKFlnPVw85/9FR80lCXMojo031lZ5fK7482dO/n9yt90ZsAgctneSSR
	QtzUS0BDkxfseIHB2OONvyhimBcPooacykIdLY7SVIf26To3ZUliEbvUQtBVAYf1KeSgFBntid9
	L7swzsrwUJNDlWZUNBzjli4UJT0LYi+MeQ8QBl1sejdv2HSoERtiDsWSd4Un4bdZ3u/cNKzRTK2
	XNdjRfhPAT7+Ydb/SU00/F0e0GGW2h1l/CenIsMf3DvxMhIELq15d4KbIK1iKPverzl88Hf7dLu
	H3xoMhonJ9TZZnMA3mdK7mrCN/j/YNUnReTwUyZQYz4XjV8QDKx27KvO/0isZhaZwa/WYRqny1U
	9KV2YKZI0lcl2mQgL55DRDDMABy+LS2KjiUTtZ+F8n+P+X2JnhjWBvXZvkQvJ0mx4uwATBvJg+5
	m/SF9y7y8b5conpddL1QNoA3eppl1qBmf44qSJ7ctuDnqXP8kQNr/oKiXCg5x+f0bSgHzTnSfh
X-Received: by 2002:a05:600c:3f0c:b0:4a1:85d9:13be with SMTP id 5b1f17b1804b1-4a18e498471mr338714535e9.20.1791984127077;
        Wed, 14 Oct 2026 06:22:07 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bcf552e8sm1272195e9.13.2026.10.14.06.22.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 06:22:06 -0700 (PDT)
Date: Wed, 14 Oct 2026 15:22:04 +0200
From: Petr Mladek <pmladek@suse.com>
To: Muhammad Mahdi Amirpour <ampr.mhd@gmail.com>
Cc: john.ogness@linutronix.de, rostedt@goodmis.org,
	senozhatsky@chromium.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] printk: fix kernel-doc name for
 nbcon_write_context_is_braille
Message-ID: <as-B_A2ghFnCu2ya@pathway.suse.cz>
References: <20261006163141.304554-1-ampr.mhd@gmail.com>
 <20261013151300.75966-1-ampr.mhd@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261013151300.75966-1-ampr.mhd@gmail.com>

On Tue 2026-10-13 18:43:00, Muhammad Mahdi Amirpour wrote:
> Use the function name in the kerneldoc description.
> 
> Fixes: c83e3d291243 ("braille: nbcon: Allow to use a serial console with NBCON API as Braille console")
> Signed-off-by: Muhammad Mahdi Amirpour <ampr.mhd@gmail.com>

Thanks for the fix.

JFYI, the patch has been committed into printk/linux.git,
branch for-7.3-hotfix.

Note that for-7.3-hotfix is the branch where the original code
was committed. Obviously, this fix is not a hotfix on its own ;-)

It might actually still end up in 7.3 because there is another
urgent fix in this branch. Alternatively, it will end up
in 7.4-rc1 if there are some problems with the other fix.

Best Regards,
Petr
