Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85AF04CDDCC
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 18:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790965740; cv=none; b=s9Xw7mxTzOuUP55K3/Aqi/fsitqvmpNcUZZItLOkxxK/G7FrYlgJz/NzpMySpgAyi0j2O10krR0PMcn7NVVpYoTWALiz7+cfzJaJHtH5rifkhdkVOdPaVUJuF4wKw74ZPJZ2Of5pOAbDDJBWgPC0xDJfYuVUjIxhOio54srWL/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790965740; c=relaxed/simple;
	bh=5Sl2JcBwSl2/nHPxJT7b/cOrI1RzRK/FtdGHgb/dJBU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BvjEb9ZbUCenPyRK1nbbHnpssswZuMT5dtJl3wiR9QcmM63i0wAuOZdwavkkZa3BMruifR/lKunxspwrdUDvHJuKK/cIhNx0T7VF38mg2r5J2Y5ecgpxG6hium0OZuP/6OZetSk94WBjaEeFzIkNEHUUuM0Vy9Ib/r7pZ1NOYTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=lLZBOGos; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="lLZBOGos"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49ff680331aso1244375e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 11:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1790965733; x=1791570533; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yop7qOc5hOSleMKDtWQuK9wi6ARl8ykYetb7shbGu2Q=;
        b=lLZBOGos2/mH3t8lXs6HGxeWNGqOziZvrYsbp+u4znUptAfyvxOV3Ge0yFTYmZuEbA
         L2ZFxM4UMD0kBykIU6Mxqgrc6C+f59S2wWkIMPXjJk9FuupmZYFlT5Gpz6dqVIj5yaP0
         IZPKLVF3LQniHwVwYfWRhDKeaogR2S/nUq1jOi9B1RqrWbd/YqHnQYgDGtPsiYL9l2iS
         57P/LCMBXb+tP/+Pnwm/4QVJfcZ3V+9Aeamv2Cz728j6nfYeYCCGgt+/IoI4A37xUtf4
         VsV4I9IgMUPOGByRV6qeTUxwqavaYS4twdQvSWvetaD9mG4+oY8bFNe/oCL17bM8Q/6Y
         35rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790965733; x=1791570533;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yop7qOc5hOSleMKDtWQuK9wi6ARl8ykYetb7shbGu2Q=;
        b=gwi9ZUIvq6fKgdtRmxjdV5Ua54psnwVtzTqkzZWaSk4ugFNxVj/nnCos6SWJyr01R9
         XVlM9/YGlHKVZzab+pz6FMx5vbTplhgk1xgwrSl83ykw6mngXfeZILQ8j9lwzVAjGpL1
         8OUWt9UCNhicMfGLVHGUp70s90MUKk6pz2Ugn4RmdOjQa/8iIW+IJlYsDuz0ACMhzpAm
         vWPumOMMU1JrTVHs4nM1L/f4LYJlGjG6jMkGztXLRNDA/VXFdpMXnrz4zZm+16lSPxa1
         mt+C5Qw1YTHj3LYlbi2vJq0Gx4axrkrJv+kcVgVce2kXF6kQRBhlXSnYbEzPaOi+l34v
         Qx8A==
X-Forwarded-Encrypted: i=1; AKwUvBy3IkiFM1U3YAXqxQ3KI/Id4KzE8u6AFCtMwR9nFoD3GzrM80GEWk8N3zYOLdeUbuK0N3/MVeQJg/dq8mU=@vger.kernel.org
X-Gm-Message-State: AFuF++lqu3ZGAr3m2wTIJ9tMN55Z57sMJJAwDuT+34Sdt4WtXz6zMzrZ
	TBy5MDQaF3r2P25w6L0jLErSCgnxDc0niwxWAhBBIwj5p0WBKX8BxjD0f1BO/mMDySc=
X-Gm-Gg: AYBFou3UAWigsiIF/FqTTTVDeK1zcrOGrq3b/kMWNTmJyx3xAEbbUl3JHwEydP3iTpg
	6aZmz10XH+FJYN6VyH2F03jh86a+7j17iTBMRhcqc6x96jVFbKmQAMPo14lpClUp7kxSyfMe/bh
	RyFdDBMdxZM48wTfJ94gGYqLFEB4yRXnHhB3vozWUhpKEgPAMNfx4DS4E9LPqjLWX+iSymaQ3d2
	1Gu5cT8jPieOxiEPB3/lppB4FdJdDHPcgof8JszJQkGnbdmXWPcNLNCoYgjyOo5xQzkzpBusERE
	K9RW2qruprE27wv+pfFnBU8w9SVF48PXyollt2kOAfRRCcZzem5FzxU2llzofe0FkGFczku79iU
	ZIRGpbFPLoUynarTbVRy4F5yZ1iNIQCl4rA6kqUysb679qnqphRJUKkX1kQ/Vi1xPMu62Mdh4nf
	o4hCCpumJHMOHGai+WzDhoORRJXmLW2DsZ2ySTgbrzLJhx0p/EgyydKaUNbFGmwohLBQo=
X-Received: by 2002:a05:600c:3c98:b0:4a0:37d:9e21 with SMTP id 5b1f17b1804b1-4a168101d2dmr5201745e9.29.1790965733358;
        Fri, 02 Oct 2026 11:28:53 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F ([2620:10d:c092:500::7:9b19])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b380f0858sm8166687f8f.8.2026.10.02.11.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 11:28:52 -0700 (PDT)
Date: Fri, 2 Oct 2026 14:28:51 -0400
From: Gregory Price <gourry@gourry.net>
To: SJ Park <sj@kernel.org>
Cc: damon@lists.linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, kernel-team@meta.com, akpm@linux-foundation.org
Subject: Re: [PATCH] mm/damon: use damon_get_monitor_folio() for hugetlb
 entries
Message-ID: <ar_3r2fNKNRjmzjP@gourry-fedora-PF4VCD3F>
References: <20261002140727.701709-1-gourry@gourry.net>
 <20261002181136.46472-1-sj@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002181136.46472-1-sj@kernel.org>

On Fri, Oct 02, 2026 at 11:11:35AM -0700, SJ Park wrote:
> Hello Gregory,
> 
> This patch is applied to damon/next [1] tree.  If this patch is not added to
> mm.git in short term (~1 week?), I will ask mm.git maintainer (Andrew Morton)
> to pick this.  So, no action from your side is needed for now.  If it seems I
> also forgot doing that or you cannot wait for my action, please feel free to
> ping me or Andrew.
>

All good, thank you SJ!

~Gregory

