Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3502361959
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 11:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788263854; cv=none; b=jLnlqI84/NjHol75DMmRAH2XYCcJ6VREqJlVzM04C/D17gNL7lkE3bzcbJVQlc+6lkFPB49s/cnfjB6w7vszRYxfq5/Nvm0n7DA21/StN8JlE5ap0IFU0uud6kwe2zY+7Kq5oqbj7Yh7Z4xGguj8zifAb3YEdRzdnUXghzIX+Rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788263854; c=relaxed/simple;
	bh=fYX0YsAcdzC3xGEnENhr8nj3ott/n5K1kE753y4IEY4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sUHFJn+zn7F3R01N7Y5pQF2W2qEjMoR3A9MLjck81u/0EbvNTes7Ef+rbfOxHACeC4Q1aGK8fK+7fzgklOPWG6HKrUkOvWTNNbhH/RgDT6uI2OT91hvNmwuUuJ63+E54eRuZxzIFskKP/mDlXAYavo2LPg5PsozI78fk8IWhork=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b=ZZobjISj; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b="ZZobjISj"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2d8fd3b729dso26130125ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 04:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1788263852; x=1788868652; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vhTA2r8ETchpWXwEm0IQgD6dzKUlsK2Lh7nqwYCs0is=;
        b=ZZobjISjfj2FXJOdLSNPxxP+qsEfbeuJs9jBORYUd8TArWG0YcQQX/iCoDufCvU8Ey
         9vtA68YxO9j1Ijil2ZPAaKYq6ra1+UEHEk+pvPr9Aw28xFdl1x3AK7ATw8aAXXlUUeDP
         aEcXKAkMR32QohYN5//ShcumNTOsC3+hK5qEFSqmaeYnxPi7aqcNxdELRIaCSXFEZphr
         pX7Pa6Q15rKIRGrRi7hZKqo66j6K11EfCnJfnDqUB/mLlxMjbxSw2Xgu9oWge12flbNQ
         /enWngI+0t0NM37dHKVK88ypRD8aV1v3pcwAih9XGvbCdkBcIR1JZ0ABt8PR9cPvS+gl
         08DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788263852; x=1788868652;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vhTA2r8ETchpWXwEm0IQgD6dzKUlsK2Lh7nqwYCs0is=;
        b=LQTkYzBf9OFK0xzXcsiMuLD5YgcdO49rrc0XGGwKiQE52T3P6tGtLRkDwJ/UE79/+l
         L51BJVPzi+iFf0G+pOH4JZZTKYMVv2hf46rYP/3UO6bX7hJPjPgvx92tE7+rNXgEkkbn
         uw4vW374Q0eMcMF6Pfxi9YTrWBccwkHodYOwx6oDOGV2SlL1CPFtt2uESy7/cW3iddq5
         Uk9kycu7LAjuPGMufgx/2ERcEXeqlW6Kg/7G4fhqJPSvGyGZK4ee4oQgJW4j4gHxj27B
         f9dvSs5Ka+Tl2xKPKF3ok3WY6ZPrufn84W6wb0xOwIoAzMMPg1tfpyVyTaKAewttfka6
         GnRA==
X-Forwarded-Encrypted: i=1; AHgh+RoY7Jqvy5bPxVCm/TRhzLkwVOpKApnOlhBWmdPgu2w9+3QEf3U0O+zZsq4Am684Fue9YE26ynukbpEHLqs=@vger.kernel.org
X-Gm-Message-State: AFuF++n8w0Sg9fLD3jSphx8sQENuNN7f+qjJFvH6UZU5DvzqCOd5MooL
	+eFQgQ4fUGaYb9u485MEw1rhkFqQS0Uv1xuLvPDXeFhZTATJ7DoIS+0oqSr8uMqRtek=
X-Gm-Gg: AR+sD12q0JE450g8dIszOcSBvR87pASqjtTjyvQCjR6fhxFe3v67af2eBwMTae502S3
	IiMIngIpd8j6sSrZUpN2Dmitwfzrq41uJjC9cS+2gsuXsG5ikqu789Lde168piJ7EntFgyE1uUF
	gJZp3d7jTzgTAvZenag0IEy75X32YZjzcfGgCdUj/HWpRXaEVLGZ4ZKw0xsqY9gOFDVtmTyqoGH
	pTBm+EgCnBLe/K5FA4R5cZGK3g2F5m6VkIhUIEwqso6CnJQR0aNCZ2tlIPYnknnBfyPpiukVVgy
	t/CduXqekdopsycDits9A9c8DgH19bXVkcfDTevW43oFf/HZIH15Meu1TD695tOqiBeR2+eJSk6
	nP+bK1irvFmNRtOXKUonSkL38A9ymfrAmDjkXPVduI0y0Obqon126UfWrwMh6X/YHfhU/nskwcv
	WYveM+wg/use3Rdr0pFPGB8PRQjuPwhGgj1/nPYU7kGw==
X-Received: by 2002:a17:903:350c:b0:2d8:d4d3:da4d with SMTP id d9443c01a7336-2d94a90e6e6mr107425595ad.17.1788263851931;
        Tue, 01 Sep 2026 04:57:31 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:4b::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d911a9651csm34613995ad.21.2026.09.01.04.57.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 04:57:31 -0700 (PDT)
Date: Tue, 1 Sep 2026 04:57:30 -0700
From: Joe Damato <joe@dama.to>
To: Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, Michael Chan <michael.chan@broadcom.com>,
	Pavan Chebbi <pavan.chebbi@broadcom.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Kalesh AP <kalesh-anakkur.purayil@broadcom.com>,
	Rukhsana Ansari <rukhsana.ansari@broadcom.com>, horms@kernel.org,
	colin.winegarden@broadcom.com, linux-kernel@vger.kernel.org,
	raphaelcf@meta.com, stable@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH net v4] bnxt_en: Bound SW TPA IDs to prevent crashes
Message-ID: <apa9qofhuatqGTra@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, Michael Chan <michael.chan@broadcom.com>,
	Pavan Chebbi <pavan.chebbi@broadcom.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Kalesh AP <kalesh-anakkur.purayil@broadcom.com>,
	Rukhsana Ansari <rukhsana.ansari@broadcom.com>, horms@kernel.org,
	colin.winegarden@broadcom.com, linux-kernel@vger.kernel.org,
	raphaelcf@meta.com, stable@vger.kernel.org, llvm@lists.linux.dev
References: <20260828190900.1767611-1-joe@dama.to>
 <1c87458d-7d76-4da4-9981-51756cef391b@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1c87458d-7d76-4da4-9981-51756cef391b@redhat.com>

On Tue, Sep 01, 2026 at 10:16:54AM +0200, Paolo Abeni wrote:
> On 8/28/26 9:08 PM, Joe Damato wrote:

[...]

> > ---
> > v4:
> >   - Moved bp->max_tpa_roundup_size init out of the early return path and
> >     documented that TPA is unsupported there, as suggested by Michael.
> 
> Clashiko quite convincingly elaborates that the above is not enough:
> 
> https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260828190900.1767611-1-joe%40dama.to
> 
> Could you please have a look?

I looked. There are 4 separate things Clashiko reports, so in order from top
to bottom:

1.) "This isn't a bug introduced by this patch, but the line right below the last
context line here still uses the raw firmware ID as a table index: ..."

This seems impossible. If FW emits an ID > 1024 that's a firmware bug and if
we wanted to guard against that possiblity that would be a separate patch and
a different Fixes.

2.) "This isn't a bug introduced by this patch, but the loop count here changes
from bp->max_tpa to bp->max_tpa_roundup_size,  ...."

I mentioned previously in my v3 that this is real, but is pre-existing and is
a different Fixes unrelated to this change.

3.) "The new assignment sits after the max_tpa_v2 == 0 early return, so on a P5+
device whose firmware reports max_aggs_supported == 0, does
bp->max_tpa_roundup_size stay 0 while BNXT_FLAG_TPA is set? ..."

Michael commented in the v3 that this is a false positive, hence why I changed
the code from what it was in the v3 to this.

4.) "This isn't a bug introduced by this patch, but the loop bound grows here
(for example 64 instead of 48 when max_tpa is not a power of two), so there
are more mandatory allocations that can fail, and the failure is not
propagated by two callers...."

I mentioned previously in the v3 that this is real, but this is pre-existing
and unrelated to this change. Fixing this would be a separate patch with a
different Fixes.

Michael: please feel free to confirm (or let me know if I'm wrong here), but I
think this patch can be merged.
