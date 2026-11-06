Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793926047;
	b=Jtxq3ErT5ra106OO2aSDGzJlmFNvLOQvj1Iyj0I3EwG5l7zRs5vE2A5kiPEjydNDJH4u
	 4mKUvMLemTO3L9LnI3bsMzIEEfvtsOcsIFBEGM0WNjtZQyOYXAP0w79P6Zd6LsMeWas4V
	 zrezT+RKCaL/rw3V6K7vgj/LZe9DnySdXMqDf+VlbOzgZ2OmtHiW0ZL/J9AgrDk4tKA1K
	 8mIxhF0hMB+MVVW1kDPs6L6ZjXWsZBl4P7GMmQCc1aTSvTBeovEkxVfZUwX/P3Zrip2iT
	 n99qydRJwO+9dC+qWPpz8tMhzs21NnarAXR4ieRqGwyN1CbZsQcg12iaBlpsyv4r1LA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793926047;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Q/Pn/3oT6XlOFb2SsTcDdo2UH2iFiBAGJC3TZJWHkxg=;
	b=qA46popD3bTCxgzy0HWaSGTwqy4AdkeNSagb7rHnq6J0TMn3cGDsYZ2pMSCMrIvJKcnD
	 1ZsHasrvxjba1r6l63EmHUZe1tKHywzoPiDT92XDsYGVmM82sbwAbZ3v598wZ0izq0vUE
	 HoD7nB4qzz6k4bmdePWnIJTZNHQz9srjWH5o2CHYFOC/DdxSBWIsNTGLJRpKW7YYIZjkO
	 bdesKWhb/VtAbeLtWwKu4J/rqrIxtvi5G9Q+UZqzG+9TXjESJ+KWK0++C30uiSFxSdxT1
	 CQ1ScmornXgF428sC8mxvvS6HQolXBwy9DvUYv64LMXWdaJ9mTeRtACVR/VcmLNgJYw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LIecB4O4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3FDE606A329
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 00:47:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3FDE606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LIecB4O4
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c4d28f75d62so11339766b.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 16:47:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793926045; cv=none;
        d=google.com; s=arc-20260327;
        b=IyJi5m6TTfkTs59zOj6pVvxdFNXS/96E0oDLP1R0rynlPNvHKzeEm8MOrMXxWyQP3R
         G0gyn1/Vk+T7GRNwy/kvPayrjVcuO9XenKDTrZQEAL15NHkMX7IDAESz+LC3hJrQeO+b
         9+ka+0mdBAKLLx5FN5VXko44kbYfZeCWWft6vli1k8n+6GQEg4k6wyKbq05WckGxaxXC
         Fw7wy0vOZPAZhsTqqDL1cs/bHfIqqtaaeaXnBUzKOxq9kxJ2CsEUWNNxcGteRUWD1oD5
         8ktcPMTMTGTda5PZ14Uf01p71F67lRWIbtm7XeSW3gsLfZBXiHmhCMJ/RcWlYKDsdbxe
         HlMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Q/Pn/3oT6XlOFb2SsTcDdo2UH2iFiBAGJC3TZJWHkxg=;
        fh=y4U+zyyauwiGtuhSWg1HV5cvqkku6alfNCXlQGJi6N0=;
        b=TA0jcS/qHHsWodoP6iFAnNQH2m6T7Zs0EmIOWZMvfYseMIrb4UetTE5z8zqa7JLcfg
         RNQBeRtvbquOpM9TVjY+D79zTwEz+SljJQYSxpVtXURRLbbPYMVKgyJO4jExU0bYqxmA
         SEo+gq6lUYA7qBHsEANGfGghOt0miNrz0SC9IJAeZyJ74Pk5G+lPzAXzOOj82zpAfs8d
         5m3iOsacPIYtQX7d+YRaQktEcYoSYuHuAA4P3OpkWclGXThWhDD6PoAbqauu8P6T7kwf
         B6iv5TNqV6eRVF8WvuIdlT6JmMnaaQhhdKGFb7dkxBSELgucuU6706Hgih2nb03nnD9F
         FRSA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793926045; x=1794530845; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q/Pn/3oT6XlOFb2SsTcDdo2UH2iFiBAGJC3TZJWHkxg=;
        b=LIecB4O4eRRofJzvG/tvhMmXYhpZUwPA4yerXfp7rVc7X2Gph9Vwlg1fKJRDBKiB+v
         bltFvkuSutP6NUJPujTY5Bf2qJxUuEvSIgLScLc6MmNyVYsK0a6XL9RBW2VEsy1hEl5w
         CyIlaoFv8GE3hhFrtCjbc5hWdtrudTSiVyvj2rds73tGX6xu3JT3gEqXsyZjIDw9psiY
         d5xo/cIn9UVGc0m9QgIeIyr8x4yTrp4HJba1n5Q/KJvI+79CbDI2BTutZtBCHxbBKdx7
         UxPa+C9LgG/ePsIOotML/nbEWEIqiiTCiHWORP5/pit0E2bmtumqXTxbeEfSF4oa/Zrl
         TErQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793926045; x=1794530845;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q/Pn/3oT6XlOFb2SsTcDdo2UH2iFiBAGJC3TZJWHkxg=;
        b=BTEwtJnLvatItcGK12y2WqznSEp7vwpWwC8tixBqA+A75q/j8+3gUChEaTkSXy7QTB
         isN59gPnqn+jHWHTk0MN+7fl+z2KLyGwqanocrJ+wS0jXsOIpdCgbRlcb+VodJgn0aXE
         MMdpbpWUz6KW0seEtCPprvLG/pXBscCQPJcjjUYX7PF+tUNDrIv7bTFgfgWamkqYBvGr
         qbQ3MUa4/IoHhdx2s97Ebd0+DqdmctfVPXjxq8Vo2skxiTqea61qrD/5jamC5ij6shSH
         JZVvvb5ybZZ6FmXhQ44bri/OJOGuy+64zVFWptDd/hX9yW/yH67AWt3q51q8xAEVj/eh
         HvmQ==
X-Forwarded-Encrypted: i=1; AKwUvBxnfOvW2ZWwOZkI9AqL0L/ptw3+Wme4rcBGH3TiR4Y+6ZjVXMKepoatb15hdPCQo7jYnnnySmsq9Ui2c7A=@vger.kernel.org
X-Gm-Message-State: APuU4Z9keW6f2M5B/U6vMrwLtXP3hovGGL9S2+TbJkaV4ds6LHnG7toL
	PvM4gsDd+kiMRsoHuX45Na+NolIs5lwyLX/nbULsNqUsa+RnGiWHVQXbGlyCmWlt8kzllGo2hCM
	R1oQzeSUkl8sRzKIWeNasqz21pa1ulRFq/P0qoOpi
X-Gm-Gg: AYBFou043vElGUEZgnKO25UAt8oLrbjM0T5xzDxo71fcmkoeW/ZeZxECKExeZSPqAZW
	VY+Kr2gmoca4NB9IhjsrUIH+1VAfjn2Hw/6+QHprF5GB2WJsHyy7lE+nIDAhe8t4ZJTLVkmPHcS
	SHkvXk0hueThJN4e1xpAqJe17B4UUQzh3jPL/1DBEWUEqDEAJvm4aJQCMlqO7U47YjbDP0F5jl3
	3WY1vG3aSlhK75rshsqO+mqYi8fZ7GdK4MM+TrZlWGPJkJALcVMwOCZg2P0fYC4weL97HXjtXVH
	A7RaFypQhJOCf/vLczQOlQCUcj8upZj0cmtk5PMaCusL0MUUZUvBbSU+SIPJu+3QZ8ZfxB7+MCI
	SD/nxTbfeAj+Nj89Cb6gNiKlzRhWwY9P8hwqtZQ==
X-Received: by 2002:a17:907:8687:b0:c48:a838:c16d with SMTP id
 a640c23a62f3a-c4d34c333bdmr88685166b.30.1793926044754; Thu, 05 Nov 2026
 16:47:24 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106004218.604799-1-dmatlack@google.com>
In-Reply-To: <20261106004218.604799-1-dmatlack@google.com>
From: David Matlack <dmatlack@google.com>
Date: Thu, 5 Nov 2026 16:46:58 -0800
X-Gm-Features: AclHuK-6t-LHK5FESHi0261vrVlL_qd-J_ZV2n6hQwmFkPQFVA0JTaSgUA12BTs
Message-ID: <CALzav=dOnBUdYKN8ucD8tMF_5RuQZOzYG2aW=K9Grd5itgvnMw@mail.gmail.com>
Subject: Re: [PATCH v2 00/17] PCI: Index saved capability state by
 configuration space offset
To: kexec@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-pci@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org
Cc: Alexander Graf <graf@amazon.com>, Alex Williamson <alex@shazbot.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Jason Gunthorpe <jgg@nvidia.com>, Jonathan Corbet <corbet@lwn.net>, 
	Josh Hilke <jrhilke@google.com>, Lukas Wunner <lukas@wunner.de>, 
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Mike Rapoport <rppt@kernel.org>, 
	"Oliver O'Halloran" <oohall@gmail.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Samiullah Khawaja <skhawaja@google.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Vipin Sharma <vipinsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 4:42=E2=80=AFPM David Matlack <dmatlack@google.com> =
wrote:

> Merge Plan
> ----------
>
> This series applies on top of v10 of the PCI core support for Live
> Update series [2], which is targeting Linux 7.5. This series is
> targeting Linux 7.5 as well.
>
> Both series will be merged through liveupdate.git, matching the
> agreed-upon tree in the MAINTAINERS entry for PCI LIVE UPDATE.

Apologies, an update I made here got lost. The PCI core support for
Live Update is targeting 7.5, via liveupdate.git. _This_ series should
probably target 7.6. I doubt we can get reviews in time for 7.5. And
as for which tree, I am not sure. This series is mostly PCI core
changes, so I lean towards merging through the PCI tree. Only the last
commit touches drivers/pci/liveupdate.c.
