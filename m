Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFBF6413796
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 23:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792194619; cv=none; b=SdznscuL2RrdiEfAacKUhpue/D644bp1nTryyqwBZhJft80Iigc5iA5bT480QsbQiITwOY0PjCNIkjsyB9G01eYplJZySGjFkl3sGOUQVWCqA7DjVa+2JE5YaA05YKhQZ05bTJGieQIJWmvfv5yPkY84UqStfvx+ql9fGFdXXVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792194619; c=relaxed/simple;
	bh=GYVffwSyA/tW73L1hgZM9lALroKhDjOBd+0Vmma8slA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BzUK4wSfFY78uTnWixDLILCWwtIZv3Ti/yL1hMdg49Ib4C7D0mXYYPGpMQ/8/d/QAru6ruCKiuL9SR5WtGRLnig3w4symj3CxCcE43yEPJ89m2zV7hPvMasd4zQjhOfF/tK5Z9DP9ku1iIGo5uM7GJnATZi3sHT4IH9WZ1eLwU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i4Aze8AD; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i4Aze8AD"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-35943f55c06so615076eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 16:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792194616; x=1792799416; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8SJKkat+VQh4F6rl2h/cHjhe4hX3sReiQ/IZr42ROVM=;
        b=i4Aze8AD4LPj67SIkh8SFlX6kloK9gL9PCBImYYbYKmEt9HoXZRsNhy/Izbeia7i55
         726dWqkP6JUR9W+39hEgrcJOYyu4M3Ooyz1zq5xtNWejha93Jvd8+8QDiure0Sa90Fhj
         MK/vDyxflCMJI+v8mM8zwS0T1nEKUgNCkX8ze4GKW8Eb0HUFE/05IfIJy08o0ou+pRni
         d0ydc8Njc/eKtvXZR3JiIBNE9a/czChKlVW7fxrqzBJEBBMqNW9VJEB0Um5glB+ATAOv
         BQWbyMPAUn4e6tw0DXfr8wX+BqV9132OY0FclNavMRad9lSRbKcl7U4YQFOVfD0YtrlY
         4ddQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792194616; x=1792799416;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8SJKkat+VQh4F6rl2h/cHjhe4hX3sReiQ/IZr42ROVM=;
        b=Rs6SalwrWjTgJ2R/41xTuk5H167Ibm19Gm7ixKkk2gRfUI5iAMBTnFMFAXw0f3Tm+v
         HDEXDUptWVrT3gylQaMgIPyzU3vMf9KeeZERDdnjXzKjnYX1PFU+68zVoO0lzBrnwcMK
         A7cb9Y0MYCKTGEyLqInuy3x8P693jxCdZCGFhB70WVnWKGaLl4HKu9F7JR/Y5ytqjW1f
         mhUEjQQGUMkTZcbo74bVrKECBiLiT9LZFEv62DsIYqlsmaCZ/SUwCMm1PO4ybAfCW1Cl
         Vbp8/hbSNRR6BZuP9N3oCWGM5lh7JsUTW4c8Vjmi8Q78Te+TVEZszyghsSMLlD8zFpaj
         t9CA==
X-Forwarded-Encrypted: i=1; AKwUvByw5m3vbYPa8lNVAYhTx2o48t4tc4L5vRfTg36lpjndUWpEjxYHmVxVCce71YKAe++tm7J89qzCYAIAUJs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLdQFQ9jw50cK6EanDURs3ftWTCYgJDALe2Iod+s8porpYb5rLn
	hFBbqvxmLPQTRQn1jF1TClhyT+CsuLYjM05RaRWIqLmkCm2/f0a989Xuw2T4KDGF
X-Gm-Gg: AYBFou0Buj+dyQY9ebdNv6j0C/PpRHr7XNBCWKdiNjf9eE0B3Y2Gmi8zbBOcC3nuiQO
	0gkAgblyA7Ln9ZazlnzHmWfZ4/bBRhxBZhBDpYm2IoohgXHjofvMHCYqbIvtdM1wAUlc+N/rX4o
	ctOqHCOM7iHNgnza21fMjJxjg22r7Wq6RGbbef+qbuFs2k6dxABY61hlzphPzwaK1FrlIeKnuAn
	CPMriAzRB0CLKpHoGeGVNW08CVQwu7G6Jfpzleupnqf6tw6/jmbtN+t7cztPuOXjBWe/Diio2/2
	9TzWsbf1XRCvzuhkqOLXrUuasuyAEfEZXNlEUYE84VQTTu5iPHYxVzQ1llVONrURCYLeoxAdzFC
	AXV0TTeTZFkWI3cYlnDFTXvK2PNVib4wV70LJJftKC+9XXxs/K7PTAiN5ipvkxBYaXOZARiUURT
	OBVJzbRmlUzl9JCQF7VqAsSsWC49q8btSn4hc0LCzi5SRmZsF64O42mN+u3sVDLCTUE0sXR1cwt
	vo=
X-Received: by 2002:a05:7300:f0c3:b0:35f:ab1:4792 with SMTP id 5a478bee46e88-3602d6e460dmr5639283eec.6.1792194615855;
        Fri, 16 Oct 2026 16:50:15 -0700 (PDT)
Received: from user ([2405:201:c052:b00b:a69d:8570:9766:5ea])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360820a79c7sm9584342eec.18.2026.10.16.16.50.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 16:50:15 -0700 (PDT)
Date: Sat, 17 Oct 2026 05:19:59 +0530
From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
To: Ethan Tidmore <ethantidmore06@gmail.com>
Cc: pure.logic@nexus-software.ie, johan@kernel.org, elder@kernel.org,
	gregkh@linuxfoundation.org, rmfrfs@gmail.com, vireshk@kernel.org,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Subject: Re: [PATCH] staging: greybus: Align function arguments
Message-ID: <atK4JxHU2SmM-HbV@user>
References: <20261016063648.22795-1-pavankumaryalagada@gmail.com>
 <DM6MD2KJ8KS8.33P7OXVDIFUEP@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM6MD2KJ8KS8.33P7OXVDIFUEP@gmail.com>

On Fri, Oct 16, 2026 at 05:34:44PM -0500, Ethan Tidmore wrote:
> On Fri Oct 16, 2026 at 1:36 AM CDT, pavankumaryalagada wrote:
> > From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
> >
> > Align the function arguments to follow the coding style and
> > improve readability, addressing the alignment warning reported by
> > checkpatch.pl
> >
> > Signed-off-by: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
> > ---
> 
> This doesn't apply. Are you using staging-next?

I'm not using staging-next for this patch.

Should i rebase it onto staging-next and send v2?

Thanks,
Pavan

> 
> Thanks,
> ET
