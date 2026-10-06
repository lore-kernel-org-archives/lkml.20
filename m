Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A0DD38F935
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 11:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791284993; cv=pass; b=eMeGKSShj31jE94LRZxfctyS03yCVFd3oKBHhX3ZuaN5kZiF1QYmfLZXSOStqQGLlFe6GEuWEGeudfxW+ZvFO4j6Dk4dRCqUDIU78l7e+1ECYu5uSpkHDgDrd3KUvXrssjnYuGQfwn8HjT6XcMyHdJ5l3OYmAo8y6o0xsOMKMaw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791284993; c=relaxed/simple;
	bh=7xITqmbUx1hnbG2Hl9SahyKAW7y/XppnkWMsC01/JTA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cv6glnUhx8H54AdpYtER2G/Jh9vOx6QgvZDaEDc7TYPkSJGPU0S2pwSdJE8CbATvvuPnGGiQgEV5eZSM3osI7fRrObwBU3yJUM8QmE/uolZGVc++qjYBxSODCSir/PU5FgLAQoZv54baPoZKmb3tJv2eX0VW2JJYznENVMHUT5U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aykrGAa+; arc=pass smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aykrGAa+"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2e2e0f3dd40so17640665ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 04:09:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791284992; cv=none;
        d=google.com; s=arc-20260327;
        b=ZxjB15vw17qyrQd93etf24PmS/9WyD/SWQ+Ej21rE359HqJT5TqQm1dCDVy8oo/jIR
         kuGmp7ahlHcCqryAKZbUp4qqInIc42B5r0e0HHjJCQUVcwKso8OLuL2JPwmOtrNlBfOs
         ZzpsHib0iTIfGpBjXEG/udp9GY52wbDfHsi+ms31k2wXdjYR/EfjhebnIxgWvFlaqhMk
         jHqrbBrcLlJ4Yd37Tj0UvM+QD6mQJ9MkdyUaDsm5HmYtaerR3/o/AYfEWtbdH/E3FW+l
         55+E4j5Av4C8Zj8CltPdjx/aP2ZHhiTKnVnlg4BD9F0mO6bFO8KDH1QqLaRthtYH3gXQ
         ToAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=2gHAHJjsWGwgVyBCVP7AcOw/LnAUaiF4NONapI8nsJc=;
        fh=hcyKquqD2DRAPvv3z3SyL0zijaauqWKZkdyd1o/1/u0=;
        b=cSTAK2yojf7K/6BEGPQVNlpVcvmeXC1AbxO/3LgWDlwIHpoa2fBxt4B1N6gntQAHYe
         Nu85pjajlVzuznlggCewAf/klD2MgjN7Buy2TlEFL2vTxc0ztwy1rONAyNcerQoeo03P
         5BOQmYYbLBU2/EdMP+QsvUvnnJufotMpjBVtIx40Rv3f5tvFWjMBw/wInPIc7j/5oKh5
         mnXUuNAEjkBCPqnSmaaSR38dO4GUHbVn0kkMYAx3BUpAhzLvTvUOg8/6k9XXjN7phb21
         aTz5Tzpc0NqXOJ1S69P9rQAT+XGh0pLD2ObEdD/ha5Vi4IIyXbEOi/oQIKkbaZr2DOqu
         R70A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791284992; x=1791889792; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2gHAHJjsWGwgVyBCVP7AcOw/LnAUaiF4NONapI8nsJc=;
        b=aykrGAa+40PqyMSYbyIZuRWgVthc5SOSuvMm8p3TE6+e8OtOmS+qN3rwUqVh/I9dgU
         jLl1GjUnwM4GG2PBwdxKHnVwd7SwCZzQkhj95tv3a9h6pBI41X2uVF327jymglioP4sW
         JnjcGg3PGq42mVsusHDq3U2o0Y4t1NNlpMFPmPdVo3JaGicMV+G0vuESHNwgsjGuux3Y
         kDf9SndSAO11NPgPhTVo9gE29D3ziepMa0r2KcPDcV8JQ44vR6eXks4wSW9OtkUlTHLL
         6myVZV7N5/HddXcNjQHtPlmD2QP0+peZtTNl0LMPByvM6KavlKMbmSCK0u+MxDpXaWdk
         gDkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791284992; x=1791889792;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2gHAHJjsWGwgVyBCVP7AcOw/LnAUaiF4NONapI8nsJc=;
        b=LB/6gRGWIgNSdk4d2D95AKG2ovv1O6YWT79hkfdd2okykpjNjVjRb4WqyWWimZQ3y6
         s3jfbfwsfxXSs/LW448/8c27w0wdmdVRQV6g7nNXgTKzK42qH7MfJSG5FnpkjnNWyax2
         /Wsn/6Oo1m4C65oGnzscQU8bVlzCpX1iwTsRoGxFECOgIGMWqaPuXlPz5SptExpQYZL6
         RAymCdDwk9wZ8YGGgj7Br6EuO1k7HEUV658aUyfM7JEVmpVe7kAWA8pb69IEDl+aas68
         bXO0Jp5k7HrOChcK2wZp/uJGhEAlthfjWnX7m2N0yM6qp30ZjPmUbnzgbcn+F6S2tbub
         KqmA==
X-Forwarded-Encrypted: i=1; AKwUvBzKPyXdUAsYfYpGIGdM2zx7KotUx2MfKmzxjn/CBlK394wdCwDt6emaB+PJ0c6/NfcmjQq2PLz3NEZAO5Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYLL/slMNHzrk2nzwPGExHlx6+/z/DL9v8AgWOchJZWClw5LaKvG
	489qR67pRaxcU7O+vKCSIz6zn39AUQXKXl6R4+Aml7U1hOLhJhd+DAhHK/ANo3XjmQU3Jhtp0FZ
	DWEmg9R8te996elH/8Py/8E/DztTqApY=
X-Gm-Gg: AYBFou39jrVwvyu2uBxbcdKnZU09HRgd0eJb0mr7Xld6OjuSpP4w8CmVpVqerhl8yLd
	wYo/oZCXwz9OEAG4bfV9bixAs6i9P2F0M00az/5UfhAs3je8Fi9zfj/jv1F3heWFTyolWOF2AFU
	vogf5fvCDggkEAWPO9vnEWK2YBzJjdpB133KA3kXHd0JjlQm1xlRJnsewVFu6+u59g6frQdVt4m
	5DstcahbwoftCcDZMdMhuKyT7NrmJKjwhMmSQ3DqDDgKamw5WdaPUGN6HlXGdQIltId/hewGcfh
	7166YeWJmxD+N8r9PVMo0JujOsRJOpKl1+EnWajaI124zdrMjiF1QTpwsZWVDKrWNkYSDJSTz03
	dK5G0/meUhIf6e026ngl+Hr7y2MhYPD+7GKetCDnOm4ghvimLQSBGbeb7cUc+z2y4pO8=
X-Received: by 2002:a17:902:d2ce:b0:2dd:ad74:ac28 with SMTP id
 d9443c01a7336-2e5dcda3da0mr8813935ad.26.1791284991550; Tue, 06 Oct 2026
 04:09:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261006101606.54079-1-phucduc.bui@gmail.com> <20261006101606.54079-3-phucduc.bui@gmail.com>
 <633be718-a5c5-4e67-b9e1-5d4422944f2a@intel.com>
In-Reply-To: <633be718-a5c5-4e67-b9e1-5d4422944f2a@intel.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 6 Oct 2026 18:09:38 +0700
X-Gm-Features: AclHuK_Pc8LShx91NLSv5hh9JwqBTqHJzVOnbNwPcfyhu5KBMevAfkIzcISxmg8
Message-ID: <CAABR9nEp+-cM921ONe068QQ9OGH5e_+sqTpfBV73xcCCh8uu4g@mail.gmail.com>
Subject: Re: [PATCH 2/4] ASoC: mediatek: mt8188: return 0 from
 mt8188_afe_fe_startup() on success
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, cassiogabrielcontato@gmail.com, 
	Haotian Zhang <vulab@iscas.ac.cn>, Christian Marangi <ansuelsmth@gmail.com>, 
	Cyril Chao <Cyril.Chao@mediatek.com>, Tuo Li <islituo@gmail.com>, 
	Rosen Penev <rosenp@gmail.com>, Garlic Tseng <garlic.tseng@mediatek.com>, 
	Alexandre Mergnat <amergnat@baylibre.com>, Dan Carpenter <error27@gmail.com>, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Trevor Wu <trevor.wu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"

Hi Cezary,

>
> You can reduce the delta by leaving the original if-statement as-is and
> following it up with:
>
>         else
>                 ret = 0;

Thanks, I'll make this change and include it in v2.

Best regards,
Phuc
