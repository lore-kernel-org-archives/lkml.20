Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96EF23AB498
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791813000; cv=none; b=mBbjttpXHi0xKoBOSjUiEf7zWCGQeDKDdym/g5GU+tUuvXrrPlAAGKbnjJM5aVJ3eG3rraSDp+B9b7xlU63/CqLIke2+W9ldjvQuXB4SxkNy3dcowRIdmSx3K4g/xXzVllcTSpfp3pspSg9Zi4MpPIGdSOSq6r4cpnh0yxJAuao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791813000; c=relaxed/simple;
	bh=6QHe3gCwglIjK90q6m6GkJpBsYmYtm7uNJvBv8QiNOM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ClG5WXCwTv4y6zADoewpaBFYKTsdfpsy/TzLtgLjjSHjUzmpNLVBNa9T3vEuPqKoIsTKxjDok2nwu840e4+qSunzQKzV9xLvhK/Wsl7TdAPXcO65SYNrbPbeLgrf56QYVOsn0kRdP+uEfL6g0/0R17RXMmJIsJA2NAnVpcb7Zxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iPhMzjg0; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iPhMzjg0"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c2e5d08214dso246152766b.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791812997; x=1792417797; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4q8tx/vqsoUyoRGyu2AvHT6woUinvEI46vsxfOxlvRg=;
        b=iPhMzjg03qo3VjzKOHMnYWKB6CCotLGA25LVgnQrXXRmEaUqE7KTvQ65WdpFkCTEdP
         ef55VPVpXLCMQuMT2KZWvAWB0gsBSQpAbIupzVvAMgs7f+RxgkcWcbBazaBbYzkqy4YC
         rRn1GT22Sh3SskgRfEd8sUpI7GCA7Fp3zTuYtPaw7176tbJCY9uXoQDRgKNulyqpBDyH
         t5aLoZiIOCqi1A2wzoJx3DRQVXYt054b1UhliILxcucVCtdxkWa6cc0uNr/tprQI7Lkz
         FyLobfesX200aht6EBFa1nlkG7tCh0sjnTLByMPgYrVZ8X8Y2G79wipL1uK90jRcbkUr
         +E6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791812997; x=1792417797;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4q8tx/vqsoUyoRGyu2AvHT6woUinvEI46vsxfOxlvRg=;
        b=BMSkMEu5dtysi63rg7/Hv1uge0WMFx2EPZ/mUux+EtMZ9TaMKk/bJ/+2V8AjJE4TpP
         2hBnOnij1MKasGwYMStdy4dunVcThhNkwFua8hzsH45VLZm9XByvrZnPDBoZ/zOI2LQ6
         4uLHrUAWYIn3eF4VKSTXfcSCavVgpV6xKuxiEWneLavtjZow2rXiujJW6MxJundkTS4d
         +4V2GF+u4XfGp1oodceJL5C3m2+YvFU4pudoeDX8S/EuYbpn5CD8bCZDCmBJx7XDz2SS
         L4TCKD7H/8KKXGLHViKVkpNp4E9IRPjPMs74lxhYeHUZUhJR0wZl9tliFhqS3FMi7mAu
         cM+g==
X-Forwarded-Encrypted: i=1; AKwUvBzylaFMplY7IO78DeN8VFPyx8uuKMkqEccXyCJMTSDUd+Ef3LAqEBOfZVJOwdB3wcAWZ3BPEy/xrBYyBr0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIJBiZup5rIqgaGNC+wdNl1ucgAQ+nO0gtaFeiEn0xsUm6reLUm
	A2knayejH3EWxflcBYCkmk11hEc0zHBj8NMa6rxGg0I6mWfuliLFjjTb
X-Gm-Gg: AYBFou3nGDHdCPCbUiYad0ejjrJgkK98TBXjiwL7oOJZGk0ukY1HIjSLB05clATcTLY
	My1pa7fGrp7rI1Axlv1popwkIEG6i7oMthYJHZFQCVf7pufl8Qn2hlea58KWe5l4wdXwJMjIJUN
	/clCKp5rQNAK0m2zXGL9e7yHgzj1eCC24QzzdK5/bMdcs0RCT0BZhB3sI4Nbn98j4uPxl3S59gw
	hKJfZDr7uWQ2GjNTofQP/5ZpTEGNdEeUfMGGolrSSzg6EuQOiCPpem6eCUUn6nOhfM5cIccZSjU
	5xHeTZof8dtHj74bcyGhE+a9tN4HdglptMTDxdTwb41j0eAnLmpvPmvI+bs3mTTUOTsgHMLrtgK
	JvEhWebzsjwKcwppsSoYJuqNWLGSmzHS9/6XHqTrg8AFTw+ZWTMekMOpxRm2rUV4jCzD12WnzM6
	GGg9rWOTOAZZmO6OM21g+8rU4qz6t7PQID4PGwn4wLZ1g5ABK6epzpG9ZYh4aDYTdXovjVrJxL2
	IkxKwZfgzHwns8EYAv1R0odVjW2TaO7+XtaIFjN7XsT7L2jnVbZj+/lRVpJZIPK/5xXo89KdRqq
	NRxZ4ivjCgvP/Hfn8grEhHy3p0aVBtRgsGYyZZoL+sJGYX9xrubIqOkEtbb05dl48vsXrXjxYnE
	wNPkbm+9yZiD5byWXn66nZoVtDu25P/Uxybe145TzGaGUR/12EUOZNonzocGWET0nLiiyA0k23T
	Xy2trjAbNDRoqr4wI=
X-Received: by 2002:a17:907:8d8d:b0:c26:306f:289b with SMTP id a640c23a62f3a-c31a9b0b097mr807813766b.13.1791812996554;
        Mon, 12 Oct 2026 06:49:56 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9aac6a4sm19827476f8f.28.2026.10.12.06.49.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 06:49:56 -0700 (PDT)
Date: Mon, 12 Oct 2026 15:49:54 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Antoniu Miclaus <antoniu.miclaus@analog.com>
Cc: Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>, Michael Hennerich
 <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>, David
 Lechner <dlechner@baylibre.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, "Shuah Khan" <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Marcelo Schmitt
 <marcelo.schmitt@analog.com>, Radu Sabau <radu.sabau@analog.com>, Janani
 Sunil <janani.sunil@analog.com>, Salih Erim <salih.erim@amd.com>, Jishnu
 Prakash <jishnu.prakash@oss.qualcomm.com>, Jakub Szczudlo
 <jakubszczudlo40@gmail.com>, <linux@analog.com>,
 <linux-iio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>
Subject: Re: [PATCH 4/4] docs: iio: ade9000: document ADE9039 support
Message-ID: <20261012154954.000075be@gmail.com>
In-Reply-To: <20261012111342.48040-5-antoniu.miclaus@analog.com>
References: <20261012111342.48040-1-antoniu.miclaus@analog.com>
	<20261012111342.48040-5-antoniu.miclaus@analog.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 12 Oct 2026 14:13:40 +0300
Antoniu Miclaus <antoniu.miclaus@analog.com> wrote:

> Add the ADE9039 to the list of supported devices and note that, unlike the
> ADE9078 and ADE9430, it does provide the on-chip dip/swell events. Also
> document that it exposes no total reactive power attributes, since the part
> computes only fundamental reactive power.
> 
> Signed-off-by: Antoniu Miclaus <antoniu.miclaus@analog.com>
> ---

Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>

-- 
Kind regards,
Joshua Crofts
