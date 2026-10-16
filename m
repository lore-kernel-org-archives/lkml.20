Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C0B04DD3AA
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 15:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792163924; cv=none; b=MvxsUDHitWzGgS1Hz+lXUGHgkj1lccMoXX4LEDzidbMvUOTuEAmeIoYFqdq58DFvgKDIPAYXOfRLt2u5UZlchB4hj+R9GhLnDP9EEEMVDLw9hK6QmRSygicY+6fsz7G2snvpR/athtzSObEGTaj3iHNoPCVuC4TwnFcaQaMESDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792163924; c=relaxed/simple;
	bh=gTsOfT7qc4+y/R1b+Q3dOr5vhFSgpJC8pEs2pNorJ7A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oaeOPui5aLMbda99rUD/+247Ek5Dlp5SKo85xRCLClrQQ5UPnfOnYbY8tkYV+cqig8rR34MUbxofU3PoAQgTEu2/1Ut11/vfVu32BYZViX83CCuTIFvGBmGuXKYCcrtWqF4efHBPpP2i36svzjNnRtSMZ8HdVVzVB3p8h/jXPoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=I8paqOTn; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="I8paqOTn"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-917a707f37eso1323586d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1792163922; x=1792768722; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gTsOfT7qc4+y/R1b+Q3dOr5vhFSgpJC8pEs2pNorJ7A=;
        b=I8paqOTnnBFl4CkOn5U2tiES1BNMEhJ9AhGndoNW6nis4nPUdDSdPf+KFX41YXHqEX
         PHEu+27JD5JaY2CtLXAlUvIL7At5OVKogRdkeOqcQqIAuuYTxulfUoLUU148ys8nEvHv
         zh6rZ2bLk+Z78gGyJPZPfDXTrL1vgSl9dr+zFSLToUp9FpCdsJueLcMMsmdy3K438/wx
         06jj+HxmusbDb/dflHBzRuXq6HWFKD7jdSs+dMWn/qCSsxoi5N3IaTqIScZdbw4Fvj5T
         qCbeT443JGf+uDJJZrMd2nBB7hFJY9b7F9QO6muUFZLVU7g6YPPLoGvlLSMQKdyVREgG
         DjsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792163922; x=1792768722;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gTsOfT7qc4+y/R1b+Q3dOr5vhFSgpJC8pEs2pNorJ7A=;
        b=ubISfIUR/x4B0j5Jna6vaAsnt7Tq1C53Rk5gBUjQnyC8KG6bOl28eOt5MK5uOpDyUh
         7zg4faw1YcRWTaWWXs5rWuZIo1kBTpMr2gHPQPBKf2nGD8wugDP/XIvZUGd9Dwb7Heso
         oNqfY4GNVIAygngtHH/n+AJ9ktft323OW13qSghH+YdmZt8nKyfsu37i8E8VK9wyC8L+
         rHYfRDJ4RgmMdNogIGLn3T3435g0h7iJDYj5Rojo3/+/K+31+euPcxP0nrQfgWvOFlVC
         VZlunF+a8/G7K7ZpklPb31x/UTjI7vLNq1grWLc59ZIwn4h60hmTgxXsSpt0fmWU5P25
         XBFA==
X-Gm-Message-State: AFq9FYJV5UMtbDRfzfAo31WWtG+yOkSOg6XUl051jdcd5lAwQnOaQJ0g
	+vljXexhIf6S0gGXE/Xt0xneGjwnyJyoLhXvUDixaNrDskHyXG38mWvMwlYHtrPVAnU=
X-Gm-Gg: AYBFou3CIZzE7H1/te0krCh6rZ0avDuwZejDHw+oGswkHkf56y/ms4yrkZifI5WGv1T
	YeUFNE2pFIghgub3QaAbRXzEWhfCxZ73OPxBkGkUK/f/fO6AWX9+TSKLLXEXdFHb7dQS0FA1hQK
	xVcgL3Ypyz9dU9i19kjW8tPUZRQLaOof7iPUbSu+lusTid5Y0qI6s6imFZEVyCjkE3+H0LdpaC3
	4Rz1mzc/yfk9Iu+CPwj3eu/1hM7lAuwb+4SpjKB4333DrhY88ILjDQHQ0tAQzT4VTdjvhjV6k7w
	eNKmDwhmpxUVHouf3Cp4sZOUyThLRrTPTNREq249dfRfHGAeP5VYOqg0nsd/FoJowqURgKU4nwd
	5kRqTFz0JDEhtq4cU77usaRgW1r4/ElK1NWrvM37RD6DreL88ckU1um06W47XnCii/+1HDYenFk
	zrU+j8Bn1Gci7YTOzaP3zjtfxMKuDrEDvNqeDMzJbU0lucgYrLc8v27fm15Wkle20IFJ/cE2wPB
	/Z8NnGLlS7eUnWp+LUei07KSkvmmWWWJlY4Kf+17LdpO45ktPgoy+E=
X-Received: by 2002:a05:6214:202c:b0:90c:b843:d679 with SMTP id 6a1803df08f44-91bdf063686mr5556436d6.29.1792163921793;
        Fri, 16 Oct 2026 08:18:41 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91bcbade61csm24949136d6.26.2026.10.16.08.18.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 08:18:41 -0700 (PDT)
Date: Fri, 16 Oct 2026 11:18:39 -0400
From: Gregory Price <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, kernel-team@meta.com, 
	akpm@linux-foundation.org, vbabka@kernel.org, surenb@google.com, mhocko@suse.com, 
	brendan.jackman@linux.dev, hannes@cmpxchg.org, ziy@nvidia.com, mgorman@techsingularity.net, 
	stable@vger.kernel.org
Subject: Re: [PATCH] mm/page_alloc: validate zonelist slots against
 concurrent rebuilds
Message-ID: <atJAIfZ55x68Ft8p@gourry-fedora-PF4VCD3F>
References: <20261015210539.3243563-1-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261015210539.3243563-1-gourry@gourry.net>

On Thu, Oct 15, 2026 at 05:05:39PM -0400, Gregory Price (Meta) wrote:
> Onlining the first block of a zone (e.g. via virtio-mem or a DIMM)
> rebuilds every node's zonelists in place. An allocation in flight can
> then be served from a zone it never asked for: a GFP_KERNEL allocation
> can get a page from ZONE_MOVABLE.
>

Sashiko pointed out some other race conditions (related, different),
i'm going to repackage this one with those fixes because they're likely
to conflict and they'll all want to be backported together.

~Gregory
