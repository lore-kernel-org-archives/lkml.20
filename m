Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793231509;
	b=Cp6DXLhu2RciOMEXvCLks2uUMhfs2vlqpJQQuiynOtZhWAkyKOYh5lte+rr6bR83q0D+
	 NTEFq8uFBxr/QEaKN4O9i+lRdN1O7K1jvpNDsr0jugQDN1m3rwIabW4MkRfgXgWgCyYGt
	 ZXThVnWzINxrEqiKAuWTJtbBtjMY5/2bMh9CzXfVxYErI0sxa3YIvQlbPO+0hnx+9z/pz
	 /7CT7TRGSGMa6oSIHyg/eanWsyhbEhK5g4bsens8COc4CQ1UzdlOARd/Hw7xJXpBOJaoK
	 xinUkHOkJV1o1g/Y9r+qZ++VzscKinFwseDiPPK9ifLeup2n0FAi13zVArHKSOoENBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793231509;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=9aqlUca5Z2Dix4R9/uyjhIevl9A0MEDe7rswOfSHfFU=;
	b=2CL2jyFEwueaEqNVKZIxo5HvcnUq/R5RbXW6SU7DRYO+MnEO8ZKt5C4izVuSoQPb4DHE
	 I8sgGNwfH8xA/maBjnwjehmYFj75+GQ8RKgl621Y5qoeELAAP1nEJm/63UazfbsHtR0bR
	 mSqCOBKd254vjc8zCRNnh7KyrleI5vt9hneHsru1ELvmINtsbTRKxbvOo7aLj2xgwFitU
	 cVtYV6EhnVDDR17TE4CPK9u5uhQFf4zPVV9qVvGudpjn0uoB0KVpQ3IrclEhiOMOwA3gP
	 QHFbWb3C5+ALhyTp6AjOpUvQ1zHZ65DZ0FpdYTFjv+mW3u7sJQne8YRCn1D6mxYMpHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=osandov.com;
	spf=none smtp.mailfrom=osandov.com;
	arc=none smtp.remote-ip=209.85.161.45
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6D24606A320
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 23:51:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6D24606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osandov.com
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-6b199e4ba99so80316eaf.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 16:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20260707.gappssmtp.com; s=20260707; t=1793231502; x=1793836302; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9aqlUca5Z2Dix4R9/uyjhIevl9A0MEDe7rswOfSHfFU=;
        b=C6y1l2pry9W5jC8gMQqyEXs572O1glS7gJwNi5E5Pev3o3fsisHScTM0QjjoEJ4UIc
         q+dXK/EnfJdMD0KGixsCI/tc7DwWwOrMLeB5IWNAEUum9mqVmBb2EQUvqu+GHhNisDP4
         wTJGdbOSOfv10TFbp69zQ+kzsjpMSfaFK6hliupd/RXptVPOclpIHN4ON1CBiGwmfbIV
         eMLIK/GJdvW4bfnY6+m1YuwbTDajAVyLr10mfZv5eV0OhzlsBqN2Qh44Dr/gdhsP5k+Y
         TkXVulmHTkhXdURBZwGvOu9avbrR08xNr2xqvRmt0v/7YkMLxpGq9en9VU0BeDn/wCf1
         JJsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793231502; x=1793836302;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9aqlUca5Z2Dix4R9/uyjhIevl9A0MEDe7rswOfSHfFU=;
        b=tLBf2vaH2gpDp39v3SkEM9BNDBV0gqBPXM48fNm1EQXEXlePOdVL8/qtsDkPZgL5dl
         9Mv5S2wd5kH26D/YXkmbYH/jm0HtBVTvXhhmWQ4/k95d/EDKKPoZKhQY+HF+efIhozv9
         kVKr/MEDU9xtQcyhFT/FJ6n83jIDV4rSAzerRKnOhBM3soLDqgPvtwM8GaLKY1nIr98W
         deLxT7S8SZOu0h++Gf8+fVmhSXFiQbK2Kci07C2X3OmzfE4HeUuwhZNoOZo6exHHqZoA
         SFjML9kGdbFTdRo0XdnUH2Cwyw9f7llCAOsNmc9bRd7x2AD53rSE8f9HmYhJMjqXH066
         2tkg==
X-Forwarded-Encrypted: i=1; AKwUvBz/2XQjjl0hcOBHR+hRmSIdIAmrjSKLjev8qq6MnRqJX+ocSlN/UAkTkJ+2YnR6hk4ZCLsuIFSaV6pvvho=@vger.kernel.org
X-Gm-Message-State: AFq9FYIFchteB+O2+OmWqk++hUp/6jzVgOErdOHwpxAt2McFNh+Vcumh
	aVOE5IAplQ3h4H99xQaEGrJHNmVwBxcXl436Y0SwFJuqwVZniCAC4SUdxCAOJ73qJh0=
X-Gm-Gg: AYBFou2NqliKAsXuAbyGJogDCXGyqz/4b3n2LQczkthLwcRIGa/1CMTpmsbaThefYe6
	MdvJQwTelGWnHhq0K1P9Gak3P6tadSwnuO9UgDAtcpUJc5RzZKTisIc3rjEj8EcYMebAN+O+ggT
	hQY5KDj1M+Al94BX7zm17DtM6mS8QioQI/DFHRbT1sYmtZBzEq3CkFwE0oVn8GIG7zSKFumUoa2
	7k6m9A4y3d7g2BJg8/4JXEXuE67pmKgSXtMZT6Gp4S98dp3s/DjXdh3MSEbBAMk6gEPRWWmETJn
	Td/+gIMBzKgfN3OflzysKR6ZZkeLfQnZA2eCternyJnOlc2h2J+oT6zGQlIG8X1HvP69/qg20WR
	ejrjslFNVGECgDh456uS1EoaJOnZW/9wfrbjPhDeBrtX+gw3dXtHm6EERWvnqiVCWTKHTExJoDl
	FP0tUOYBJxYuFBw8lli8mbIahr2UnP3nK4r9pbSHnNc9gennYVyd1IUM0OqJriwkPgN4LOmR+qG
	IP/RVheiNytFRdFj4wHyF0m5kiI/KzWGSyAyloGrAqjxa/jF0VaqEBCdyvrSseKWXqGhzFkJygg
	Dg7eZnUMrcAeXJB77vZ1v46ocuKxmQJCjz028I++3d6iyHRi1xTMM9LdZ1L3c+TgGq/q+9KPhLZ
	pHtk=
X-Received: by 2002:a05:6820:6204:b0:6f6:5595:915e with SMTP id 006d021491bc7-713ee85fbbemr3135112eaf.1.1793231502506;
        Wed, 28 Oct 2026 16:51:42 -0700 (PDT)
Received: from os-N5J97HY9XQ ([208.184.142.138])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71426f16f66sm2615609eaf.0.2026.10.28.16.51.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 16:51:41 -0700 (PDT)
Date: Wed, 28 Oct 2026 16:51:38 -0700
From: Omar Sandoval <osandov@osandov.com>
To: Chris Down <chris@chrisdown.name>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-debuggers@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: Re: [PATCH] proc/kcore: Allow disabling /proc/kcore at boot
Message-ID: <auKKisespDm1xLLg@os-N5J97HY9XQ>
References: <auAmuqZyUodq3iqk@chrisdown.name>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <auAmuqZyUodq3iqk@chrisdown.name>

On Tue, Oct 27, 2026 at 12:21:14PM +0800, Chris Down wrote:
> /proc/kcore lets any process with CAP_SYS_RAWIO read all of kernel
> memory. That's a pretty large read primitive for anyone who obtains
> CAP_SYS_RAWIO (and it also gives away the KASLR layout).
> 
> For this reason on some hosts we want to turn /proc/kcore off. However,
> on a kernel built with CONFIG_PROC_KCORE=y the only ways to block it
> today are lockdown=confidentiality (which also disables many other
> things we perhaps don't want to disable), or LSM. That's annoying,
> because on the majority of hosts we do want it on for things like
> drgn/crash, so today we build two separate kernels.
> 
> Let's add a "kcore=" boot parameter so that this can be disabled at
> boot.
> 
> Signed-off-by: Chris Down <chris@chrisdown.name>

Hey, Chris,

The code looks correct, but is there a reason that /proc/kcore
(CAP_SYS_RAWIO) is any more concerning than other ways to read kernel
memory (e.g., CAP_BPF + CAP_PERFMON)?

Thanks,
Omar
