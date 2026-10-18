Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EED07399CE9
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 15:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792338007; cv=none; b=pcOf+dEVOFBX8YpwSsz7lkWO54k90dHZnaPz7ICVP3bG4wvfJebKGou0Ha3ac9J/GfcQceqgLPaK32x9gJDWA8/eWVDlX0tmLhvPXYKJoUh9Mp5icywrwBmFkqYErkbJ80l2OpW/KNHVgQfdXTyNN+0GkIL9WYRO2A6Yp89DvY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792338007; c=relaxed/simple;
	bh=9kce7fsbYEg8ixtIkmlAmfJH7Iu01tFp4/06C6lwBc0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=f3GJTXlMtem7/R6WT3fzAljkYGpE0W2FnXCTBc1zX3IMDgmGqQ8PyXloDfENdSh/pxM+Tn9NQhsLcuB2aLFypKafmga9RhLajw+4kn0RaX2yeCODZp7xCbtf4uEXphueaEN7uq1+EBKX6D415VyE6d7kE0j/Kx7zSWCq08Ph6uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lw0fSaXM; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lw0fSaXM"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c423b145922so88017866b.3
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 08:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792338004; x=1792942804; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LpVfLiNPs0OQlpSkKCUQyoFk2dyYHH/SWsGcZu3oWUo=;
        b=lw0fSaXMH8D2qo/O30jDyePsj4Xc6M/lJygMKqyWRmMKdwJT/KdoCvyH7duVriYVxT
         ajGcJYqHQJQWo7h6UWFEoCdQLZPHqxqLLFbFvMBbAlt5Jxd7/5nO8+9XSC+K2FMaQEFM
         HlfM5MAfVS046fY/G9g66KSi4MdLFPRCWbrEMXbLHGB+RRkHHf/YbquLkym/VMq80bJe
         rSVQ5ZHCsJXKIyl1/3RGDvh8Uzquqle3F9Apc8IqDyQrrRQCPzeYcQGNoQy4VkAEpzdU
         q7OeKP2QvR4TjtaN2CO5+cDupJrB6buoPFkETJLli6mt2+VJd/nQ++0TqFCmZOIWy+z0
         Ej3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792338004; x=1792942804;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LpVfLiNPs0OQlpSkKCUQyoFk2dyYHH/SWsGcZu3oWUo=;
        b=KsiNDJiBEDLR6b8hArzC3L76PZh0i7PXdOOtmy6cM5e2usnwpnPk7Ujhr25Hn9Qrs/
         jklBmFZSBnRtVQeDpFCxzuWfDSmaZUIKKAv0P4lDY1xVWK7wigu2YeyX8WD+kbPPkp3r
         L8vEhH4lOI1n+DBpuPkqVXS5jlWPGfb0z5AkDWo5e8fnD+R7AWAaDMRRNtsLK//nISXa
         a3FAbT918FJh5RaF0zs3O+HLRcknipIr1qUq03Inw4HVjxdXDRnmaTgxF+zxVrB+0XHl
         8S13hiTD2dtYPYqng01w8+HvNBOz2oLBDVd7eRzDs0FPecb+yCgIxLbEnrATrjLI1nbw
         Kspg==
X-Forwarded-Encrypted: i=1; AKwUvBz9yUizY9F9JohjMY0VUuKk/GRZ3PbcLuYebRSz0CXMG6KBNWdAQTDT0UZ39BvyvrIHFjFhSuElu4kqWoQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJgVDePZ96ubD9MYWDF7p9/aH2re0h2JTprmClFCtnRqYIqJePT
	+WgLxbBRfHT+0joGb+ZBHaWUc4defVSY1wwut1ifZILKgr6sZKZed751twx+pg==
X-Gm-Gg: AYBFou2IXuAlIXYRXUkpLwHZgEQrTYqP1pp4QWDYk1Ot9xWZMClxCqrWirsCCURNxsy
	HNqSMbxQuAgnNEZLjzZk19MPQs2OPdEAPAknjA5n5a2fmPvQFMVCVSc/8nu+Af05yWbnwrgqDUA
	PdqtKQrnBTNl5FrdJZwjAiggtmnGNVSD2Mf3Z8EWS+BJzh39muDPDWToZYS33IfwgJYrx7EhRpC
	HNCemwP+DPqp7RVKWsXw8rW5IGncEpW8ZXUmXsrKMgoSoSTuyT65BuRVmqboqh9AzQgDPGDYJ1G
	xFZVLNkO67VuuY/B9mlEko8aQNJCo+UkNuA0XZXFiAd8oheP0RoB0Tqve2rnhmNAPHXFov9GxBh
	4szxWYVbczrMHEtR/TRktkTuV7oxtcImkrVYM8638mHqB3nlSUbAjLNusAXWjEzNtZkxHvHV8rC
	qY4RAHyYD5GF/rr5qjQolNsXkPAw1WJU2an3UAzfJTW1GDHgRnYzte1Mf4xSJyk/LvwlYIVoDng
	bJgcU25vSi1VNmlm5G+5T9WjsRu3grTPrlm0P7zrw8ZFBipTfZthyWd8rnJf2LhqrR28FVnV0rP
	P2HDeu4ItsB43VR45oajQarvqZauZuQhElMp7TvvVxesUaWcE8ESVmTYsdEMqG6Ne1JDbNUzx1H
	aSYkeDsw05+SyaNYmtMvViYzd22aCuZKr2FauFII6vFb+X+N/LeXW0jFGF/0aqK9D
X-Received: by 2002:a17:907:6e9f:b0:c21:9b4b:2690 with SMTP id a640c23a62f3a-c419d34fa71mr381776866b.17.1792338003922;
        Sun, 18 Oct 2026 08:40:03 -0700 (PDT)
Received: from systembl0wer (brn-rj-tbond05.sa.cz. [185.94.55.134])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4091eb4ba6sm268672066b.75.2026.10.18.08.39.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 08:40:03 -0700 (PDT)
Date: Sun, 18 Oct 2026 17:39:44 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: wrmfwv@163.com
Cc: nuno.sa@analog.com, jic23@kernel.org, robh@kernel.org,
 Michael.Hennerich@analog.com, dlechner@baylibre.com, andy@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, linux@analog.com,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Tenglong Guo <admin@micronull.cn>, Sashiko AI
 <sashiko-bot@kernel.org>
Subject: Re: [PATCH v3] dt-bindings: iio: adc: add documentation for
 adi,ad7816
Message-ID: <20261018173756.35a0eca9@systembl0wer>
In-Reply-To: <20261018110015.39497-1-wrmfwv@163.com>
References: <20261018110015.39497-1-wrmfwv@163.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 18 Oct 2026 19:00:15 +0800
wrmfwv@163.com wrote:

> From: Tenglong Guo <admin@micronull.cn>
> 
> Add a YAML binding document for the AD7816 family of ADCs.
> This fixes the checkpatch.pl warning about un-documented
> DT compatible strings in the staging driver.
> 
> Reviewed-by: Sashiko AI <sashiko-bot@kernel.org>

No, an AI cannot be credited in any tag (except in Assisted-by
but it will be deprecated). The v2 review returned several
issues as well, so it's definitely not worth a Reviewed-by tag
either.

As for the binding, I've sent a patch removing the AD7816 from
the kernel [1].

[1] https://lore.kernel.org/all/20261006115119.1416-1-joshua.crofts1@gmail.com/

-- 
Kind regards,
Joshua Crofts
