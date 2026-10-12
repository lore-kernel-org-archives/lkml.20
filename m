Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA2FC4A4983
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 16:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791821921; cv=none; b=S7iPQdMqjxsudSnzyXBdAhW0Role+ir4XThe+vxDM2tRNI6rWThwfRMsQxyqFPR4idZY/dfSyMaO0gdcVrBP4Tds9X5EFRIEaZoaCQlarkfCjFZf9uMqjVql9g5K0zl5fyGhT9ABURpZrNL90XkHSkXtBMjdSrY+FF3seZG+w3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791821921; c=relaxed/simple;
	bh=4YpWVz2t7P3nkCK75u6xOdBsc4nHUlNeMIe6NmdDkAs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YNqCkYD7TK17eIC9DdxIN5vyJ+K4uTkv5bHiMpJTrXxCY7SrXuAWuYM99spx+QaIu66cCryPeY0nPdcFbDuc5T50T6QkM+bOAiOKlbeUCG//yk4Qz9DTAbCVm3Khhm0g+LfAMsWg8WiuXM8Vb3po/TJKN5AR/7qIN3GWCBoF8mA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=LvvoZaG6; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="LvvoZaG6"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-91791ec1b83so18189866d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1791821919; x=1792426719; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ycCA/46fGP9bMzNSUFEULycpfUfNegmWCSDBNo9iDiA=;
        b=LvvoZaG6fsq8hB0FOotQh35EMoCepkvvzptzfAzU/s1zJC7dhg5PSKIPvRHtUNIUBP
         w9gvhZ87eGhXWdTMd4p/TK1h1+ue4Fr7gFP9EBJo7NiJyYTitoai0dUHr0lFLGA30I4P
         x0LV6t/aKncAdIxJf1RpJN2EUnV8Jc6gOa7sDXczYruPnhnW0AEZTntu47jpBq4qmz65
         XZ29Cj0zf+pzoYW7+Sqi+LWrGr7lNlQ6BbmCinaNxPHEK+0fy08RT5N9oE+GYxegAK2R
         c0TFCts30Tzfsr89JZpBW+/suz2o049I6GsqorKmvKbg1H4thRkP3HGJRwS3IdBsjHZn
         P06w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791821919; x=1792426719;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ycCA/46fGP9bMzNSUFEULycpfUfNegmWCSDBNo9iDiA=;
        b=NM8ZQH8q5GaDM2de5GG7dK+cgB5ldCJpL++kYjNsuVufM+RDKQPXGJhCyWZ8BYbIu1
         P1tg3Qorr6IUIKzPPcUMYFzhNfbpmpzPY9FzHsTxVctwJuB/xdnAAgu1C1N32BoXA/zV
         fCu4axLBMel0eZ/izxYa9fvuiiOEm0menzDua8AkXoZAvQa9B9FHS79H7Tx4abOWeb0H
         sep1Wps+kUbok6Pxb5TmK7jogx+6IciviBnr5Y27FJSaD0wCYJOv3Br4hnrWmEJMjZVF
         /Lz5yhBz7aIx99uxvkB2HIiHYWfG3ghaztBUzsmzTWWZkBBD7NrW7vtTBPbgUp94MJL7
         r2Cw==
X-Gm-Message-State: AFq9FYL3ItE4yehkQDcv9bttOVupLr35LpoZhzdUK/GZno0guSRaHfdL
	BvhKPoQGvMX90I8AKBNlq43aBgC8aOwRS/bIjR9PcR6XsEEKRpkpOb/dJNeWmutRmh8=
X-Gm-Gg: AYBFou1/Ox2xl9M6EwbZFVgE9fVf1vdEs015B1kQK9X7zwAjtQaUmiK9nF48WAbWPGK
	ppRdfE7z2LhL433jGTzn+fif3iEzvzNODPPhlsj2Jr65l4QOR54xbZxY4kJ6krDSvfQvRusvl6x
	SGJDPdEMoLByKFibVRTZN4YJ+T9WHAHUtOXcU9UE2hsAQfSH5AtDALLDb32tiDaypsq5c7QWjHa
	G/lcq3oYmqVzzDmPNFYT3nG1goL6nE5T9NuR8RLIre+Ko+VIIRnGYnfOUZqHIjZVGgDjKDkwIhW
	1E1/8kvOa9XLtSojr5651bGL1i0szJIz7jMxZR6NtDhHIoww29Lv2MjN0BtyIa9IaSPxw2tPVkX
	8ERyQh753zgmpgEVJtg5j+QxOSC63OTBqHgHP9/fw2x0f3XZm1R58CV057dKpyq2YtCzxaqKneE
	JNWhlg3p0TwQFfR4MDxN/Hm2LfErM6BW1Ss9+j18ri+e6UEqKxKGUrzZ78k85K2wqEZBhyDhQAJ
	9FYHQvsi8GNuHo/lF4UJXWyZ8NHVrARr0rFo8lYgWE25dtbUn8b95w=
X-Received: by 2002:a05:620a:2981:b0:939:6df7:73f1 with SMTP id af79cd13be357-93ebd27484bmr1635268185a.51.1791821918598;
        Mon, 12 Oct 2026 09:18:38 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93ef50295a7sm20807785a.23.2026.10.12.09.18.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 09:18:38 -0700 (PDT)
Date: Mon, 12 Oct 2026 12:18:36 -0400
From: Gregory Price <gourry@gourry.net>
To: jianyungao89@gmail.com
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Dan Williams <djbw@kernel.org>, Vishal Verma <vishal.l.verma@intel.com>, 
	Dave Jiang <dave.jiang@intel.com>, Alison Schofield <alison.schofield@intel.com>, 
	"open list:DEVICE DIRECT ACCESS (DAX)" <nvdimm@lists.linux.dev>, 
	"open list:DEVICE DIRECT ACCESS (DAX)" <linux-cxl@vger.kernel.org>
Subject: Re: [PATCH v2] dax: fix dax_core_init error return code
Message-ID: <as0IMU-uIENTAXSW@gourry-fedora-PF4VCD3F>
References: <20261012151857.22534-1-jianyungao89@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261012151857.22534-1-jianyungao89@gmail.com>

On Mon, Oct 12, 2026 at 11:18:57PM +0800, jianyungao89@gmail.com wrote:
> From: Jianyun Gao <jianyungao89@gmail.com>
> 
> dax_core_init() mistakenly returns 0 on error paths. Change the
> error return to use rc so the actual error code is propagated
> to the caller.
> 
> Fixes: 9567da0b408a ("device-dax: Introduce bus + driver model")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jianyun Gao <jianyungao89@gmail.com>

Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>

