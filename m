Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3BCC4C2276
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 12:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792413397; cv=none; b=HbApOdTMI6tFOweoYhDB+7kHDVzrYu78yYBUOAf//4wHdtSmbSGZEcN76nnmDDafEplcetnFjVV8pdawdRm2yh619nnJ/DikbmqcvCSM1Yt3c4WnfJMb+Q04g5JcvH8M1ch7sgaIHQTrZTiMlb2aZ/4bdLzk6s6A0sS5k847n8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792413397; c=relaxed/simple;
	bh=UKlFAIv61fd71VUwUM/FKMoaKXoEHin6opnNpKyBXpE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m4Tf5y61erbWfi2Xfmu0SuCZdNHjQcbip2qI45Y2Pa6EzaicrgfZXoLUozoUGtkuERuKm5AXLKEjldCXtmbeHWF7W42UnuIuthLG9VmYBMwbIl3HUieW/ZJ96vnUs23lHCYXhXRsa9Ypj8yuyJ6xH7Wsb/wrpTAfkLlkzuXcIZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H4mjYjMq; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H4mjYjMq"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6af8620a7d2so2383818a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 05:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792413382; x=1793018182; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=em0NrM2bDMBNAYsHZhxOy8+BDCr4wFVKc/N8ia9VJ7Y=;
        b=H4mjYjMqUV/z+0JH+ng370uNm7gGmtJIjtxj6aI0TnV5wziionG2XVzoRLZwfEui8A
         SMf3jSBZoBIfi8kpUTCPRLYO9yGoAGAILg1vJ9T2/N3KM1CLpFqkstwdm0Ko4ojjfP8u
         hgKnZftpXDSkQnMYncDcDxDzsNOKbpo7IuKKh6SCFgEzcIGVrN3HaFpHv/8iyeAkJ32+
         hAwK4bjTn9cGAnKVLfhGko/3RiD3jQ5scbt++k1OcY673v9Coi2+aEo9qYYOLKGsXWYL
         s8Lz3BCI2c6Gor6qoUdqB6hSakahtg5+SFftsMTiBdY69y/zNu3nC3Wbk3PApHvZlW96
         TNEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792413382; x=1793018182;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=em0NrM2bDMBNAYsHZhxOy8+BDCr4wFVKc/N8ia9VJ7Y=;
        b=QpzoY7Qrs9gqmlFHku7KRy/NrpNLvoFo7hpM+Xl7MfIVbnJlSjMUpaOVVxDT6wNmVQ
         z93Y1E1uIbHPH6mt245LQf2DtmylckWFgfBm8OOgibYMqGfQ+2/x3vTBWA2X8wIQOEZM
         Q/zomtAAs0OlZrv4kyBhrxtU2nbQO7KTfKk1O1ImhAJgc4hnw+qZz4cw10sRKD4vtY0D
         UqJw05GncvBSCtTf1DdgyUFi1Sgkv3iwHnbLt5XUssE2aCb7Mk2EMH9/7VMK3vShOkX4
         ioqBJcf5/I3pNdAad6GO7fZ02OJZz3AGQWSH92dyzXuM66tNEZOkINFuGzt2Y+V5GmSt
         d+6Q==
X-Forwarded-Encrypted: i=1; AKwUvByO2dDbRrI9lH+SRq6FJixn+KA3NzVWoc0SVt1xbSCfJEefY2ausnL3kcoTOeUIpVGS95yPu9dOgDd7Tqc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJDSUUXzn/6Up5oDaPaWhE+RXZQwCtG+xIEVVply2dCMfM+woxG
	nvmzP+Z2iYETNef5KWNLAdcN16ydW0Z6K9wT9EMuQorMMxChqyAwULMh
X-Gm-Gg: AYBFou1j61MEOXmRNU9qz7E2ySreb26iC+NnZdoDc31WG5irAaVN5gEXS8UtvS/WfEE
	6GgyNWlg+IIaSxv1HzMnp8H32N//sfzIZae6+i86vzsAGn23KgpLSpXI+0p/5gu6HWFrQKanpo0
	Jk2BrndOMS17kVuSfkOZWHgNwkRHZhVeoiq73bcDD+Ir8t/fOvS3chiUUt/RDIyPpvEu2fy8ecm
	5zzs+Apq9ATsyDsAAl2ZJINJsXAdJXGT7vm1jeV0oz9SGLQf8uzyNp6oj1NCQUeMOWrqaavn83z
	GxnEVijjETo0K+98gEn6In1lm0sMXpbLT2LEvL0S+9AxH5BSo9X2qXBtaaBz08edM+pCnhNDd2J
	wDu7rF5XyHzz9IAjnzcm2rAQmaG8C90me0YuzcoRBxFCNGIjb8Q+H72+zUAPS3htiyF6oO1q7J/
	ZQRxCMvo/yr8beclYugcrAM7q1ZrzevWjitcNLUFf9kaiFO82DkZVQS8pj6Lo7lhYfQyI=
X-Received: by 2002:a05:6402:4551:b0:6b1:c355:c7b3 with SMTP id 4fb4d7f45d1cf-6b3a818633cmr3493949a12.25.1792413381456;
        Mon, 19 Oct 2026 05:36:21 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1e70c1sm3799334a12.30.2026.10.19.05.36.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 05:36:19 -0700 (PDT)
Date: Mon, 19 Oct 2026 15:36:14 +0300
From: Dan Carpenter <error27@gmail.com>
To: SeongJae Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-mm@kvack.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] tools/vm: rename tools/vm to tools/mm
Message-ID: <atYOvqkdVSgjXZVM@stanley.mountain>
References: <20230103180754.129637-1-sj@kernel.org>
 <20230103180754.129637-4-sj@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230103180754.129637-4-sj@kernel.org>

On Tue, Jan 03, 2023 at 06:07:52PM +0000, SeongJae Park wrote:
> Rename tools/vm to tools/mm for being more consistent with the code and
> documentation directories, and won't be confused with virtual machines.
> 
> Signed-off-by: SeongJae Park <sj@kernel.org>
> ---
>  Documentation/admin-guide/mm/idle_page_tracking.rst | 2 +-
>  Documentation/admin-guide/mm/pagemap.rst            | 4 ++--
>  Documentation/mm/page_owner.rst                     | 2 +-
>  Documentation/mm/slub.rst                           | 2 +-
>  Documentation/translations/zh_CN/mm/page_owner.rst  | 2 +-
>  MAINTAINERS                                         | 2 +-
>  mm/Kconfig.debug                                    | 2 +-
>  mm/memory-failure.c                                 | 2 +-
>  tools/{vm => mm}/.gitignore                         | 0
>  tools/{vm => mm}/Makefile                           | 0
>  tools/{vm => mm}/page-types.c                       | 0
>  tools/{vm => mm}/page_owner_sort.c                  | 0
>  tools/{vm => mm}/slabinfo-gnuplot.sh                | 0
>  tools/{vm => mm}/slabinfo.c                         | 0
>  14 files changed, 9 insertions(+), 9 deletions(-)
>  rename tools/{vm => mm}/.gitignore (100%)
>  rename tools/{vm => mm}/Makefile (100%)
>  rename tools/{vm => mm}/page-types.c (100%)
>  rename tools/{vm => mm}/page_owner_sort.c (100%)
>  rename tools/{vm => mm}/slabinfo-gnuplot.sh (100%)
>  rename tools/{vm => mm}/slabinfo.c (100%)

Is there a reason we left the tools/vm directory even though
it's empy?  Is it for backwards compatability or something?

regards,
dan carpenter

