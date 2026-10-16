Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587DA34EF05
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 14:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792162137; cv=none; b=Hcdvs23cPJhqBierX+7wWo1hmPFLC2upIvm2bmStkJAQYHnTgakfmqth9jZsMI2BMG0eAS8QWcf+5u/6eR8QRdMu+BL3SPCUXriJhuFOQZQ8rMDWaf1+x71i7pLtkCPvLCzssLdtiKYFUtObUzxpWsHs8FN5wxReVg65diOU+r4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792162137; c=relaxed/simple;
	bh=gj3wE3tKC5/eIlP+bFvEKPBktyUQp6ShnPK82oCwDFc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nG34+rM3o7tH7YX3sJK38Cyv1CrXALLDwZLmvl7L+KE5l+1s34mn0avORf8HU6qlZWhtxxxv3ArM4HXH+gSj9WzgXu0tusas0lPotxNp/nq7V7vDFUj9XN5jM3L6ZTfOdmQrTnMDz7gLiYq4s9fAYNOdF2A1ZBScLE19ZeaNuPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lT/kzjbN; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lT/kzjbN"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8917c712f32so3113253b3a.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 07:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792162136; x=1792766936; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=euwyB0Hu9EKnWTfQGDAfCyg2u8gsMszPEB2wlSrIzaU=;
        b=lT/kzjbN2ELM3ANZrQKeajMvfT9aGBEfMwbyQ0KfK3TwX156iwB6Ju0/PJcb8li3ux
         SRUwzrxIXjdL62WGQlxCFwsqFajXoXjZyiW70AD53UOStiJ08paqZYSDYn8G+7yyTNpY
         4UKb3XorvPxp0KiBw1nsFLDgs279/e5GYi5MwYFK/Yzen7rBET98cRWmj/kew7SnyMI+
         kgmeucauOodhoxPuKAcSoac5ekyrqHwOF6YIbdhfeJ3MROpE3Ez/PPAAsszNC6hBrLKa
         OO+YgiGaZVO5IS3232m2f+h3XbHhK7K8zeuYVUFlM4qwGZ90VfrqjCkEtuggW5faqLPy
         mAqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792162136; x=1792766936;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=euwyB0Hu9EKnWTfQGDAfCyg2u8gsMszPEB2wlSrIzaU=;
        b=aGvbpQaSE1934dxJ72UJ99pNK2ZVRzVuLPwZ2iLBmLgW4vNQHQBhXmTAA3waZvY5MG
         IG/CX609FJ63f6yr+xurBn3wqvhYWq+7qnjgaUdIhE5zxBwn1ZgAbRfFkMzi5rQRQAld
         Ak2p4i22syA6UjxvVi7gI/mi2ZSZrzUpwthiC6fBfnPzCqlwmzJuEQQ/nNCAd37d/rzf
         JHKGwHYBTcsyLRp1oY2qN1VbdHmFetZ+TZvoDTckrtFZhi6exkx9206Cv+GI6p0C/ehe
         XPvXYojiSmhskpOnC11TxXovEOyM9lof1VumcOSB7cScV/9fHl0HfrSwxCnRE3KfI2sq
         jQTw==
X-Forwarded-Encrypted: i=1; AKwUvBztRl6PKbQz07qsvysnzMYQ9tUzI34EhovScBKfC5ghkDoAtkDCo1K/WFs4zOfhfN+Dif6inoe/c/LjPGY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJmJ/7xibplKdeUKnWY14QD2c6+EhJqbEAQop1lh2iNnXt9wslM
	8ARGd06tYDPiomdHKR83XucJrea8aFZGVdHf0YtMg4v2RRsgXa3PHUPue0TcD+21AyxhqT27ZaW
	3POFO
X-Gm-Gg: AYBFou36SAYqfnK1XW3vsMtbtJbfOC3VBEKXsI0A2tZLFmIhjaq2BKuQ3WLf0Jf88yY
	ny/BaV+WV1LetiOcnas90X37B2etr4cvfpL2tup12mtcA9+cUU7SXgQ2tZyC4n/QOSUJ8W7Tp/4
	9j1dh5eyj07E2f1KbD1rQjkXhs8vq++TTipjShqkieE0tZFTpMetiVBFx5yMRuPEXbuEERsAXze
	IJvlRAGI1gT/gvn7bjLi4l7uxT9JfBv5F+ANxX0zq1Wg5XwtKCVByZ5DwRdEh380J+RdI8IJR8M
	U9/cvR9ijexEIH3zz7I6hQMO291+TTeV+sQL7kxlydcNQRE7S1/dqIPYSjT2xUbu8G/NMqVzOnU
	6Gr+/2VkpGpsfZF0GgGL73ZIG6Pl90O6BlO0443lehepPS2TRj5ft5cZi43yQxM0bYIPiRtxiFX
	aXmu3DE3MXCTWg2kUAyOD377VI95hJfs6L4BShObd69+meqnecBOlUncO1dV1wNHLEMPpCdUGww
	w==
X-Received: by 2002:a05:6a20:eec4:20b0:3e1:bb25:126b with SMTP id adf61e73a8af0-3e1bb2515f5mr8280336637.36.1792162135553;
        Fri, 16 Oct 2026 07:48:55 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:ff2f:8a9c:5623:f753])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd654850c61sm1273911a12.1.2026.10.16.07.48.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 07:48:55 -0700 (PDT)
Date: Fri, 16 Oct 2026 08:48:52 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Atul Akella <atul.akella@gmail.com>
Cc: bjorn.andersson@linaro.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 0/2] remoteproc: mtk_scp: fix da_to_va() bounds checks
Message-ID: <atI5VLH_CiIBu0tq@p14s>
References: <cover.1791198233.git.atul.akella@gmail.com>
 <20261015151938.1331-1-atul.akella@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261015151938.1331-1-atul.akella@gmail.com>

On Thu, Oct 15, 2026 at 08:49:38PM +0530, Atul Akella wrote:
> Hi,
> 
> Just following up on this series. Both patches are compile-tested only (arm64 defconfig, W=1).
> I haven't tested them on actual mt8183/mt8192 hardware, but I'd be happy to help with hardware testing if someone has access to a suitable board. I'm also open to addressing any review feedback.
>

That patchset did not show up on my radar because it did not include the people
listed by "get_maintainer.pl".  Please resend with the correct recipient list.
 
> Thanks,
> Atul
