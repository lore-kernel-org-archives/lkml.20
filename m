Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B4BB3AFAE0
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 01:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788226467; cv=pass; b=RGI1SYmbKX2NqbdRrboBcjc1fxoZEl+9bBv53n2MIYYfw6eAJ1U0ZNYZVOn4ZZLRjKNvMy0uG5FWmnAyYidKUJhQzA3X2AQQ2YcDKkXZXghDsKH4lqqOSO842uqRuR6Kr7F6rW+6dqEyCw073PbSuT/1CypqjKzt0+o1OvSJS5E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788226467; c=relaxed/simple;
	bh=aUEs5vxH9jF9nJCwZv5RTXkU9Sge3nUc5EckvCSY/FI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s3HiLS2mDRVCt97qj/u8xx5lwrCd+CabDcxLk6MryGAl8svIXydCv4YznZNmw/wXRGsPdQ+F5klOhy2O984vNO/CHSk6gKZ6/iKC6wn4EW7pAixPRFERXetCjbqVQVLFbZ1KqG3lkzqPsvuwZkXoIsbXsFAKNhG9ID0nZm2shzw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=d5qUVcIC; arc=pass smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="d5qUVcIC"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-51c10e86e52so78131cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 18:34:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788226465; cv=none;
        d=google.com; s=arc-20260327;
        b=Rv+IvFPScL19eSmKb5hc7lZTOJsA5xsYJoac+XuRzFtBHEdD3XDS7k5ZIbHkwW2iQ/
         ZVgGqvfr/cfqolhdRVY/aMxEN25C2LUkTX4bJQiiHgVP1K30fBNGlHMyIg0lEnSRjgSu
         Jg3EQyODLBYSEiZHQlcLE0hWx8UPoyp+mEtF43YEbo5JjOd+VH1/JA2nDE0VWMoToYic
         icyCgvb7SjRU9tsl11LaexN9+0sX14MoUqdweSw5MIe/UmpX1mQeExspvxEnw/BawBUP
         pPcLoLO3U26ffzauQdP4OiddNyCMQFUFdjh37V9Rey/tYm78oheUhTEUlvQdfaeiSWCH
         2LpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=VounH2TLCX+icK8ohtB74w58kkdgdhvjkS5XdKNJR7k=;
        fh=Tlb7WlFg2ubHDcWx46V0euZ5HKCn9PwHoIFej3sO8Z8=;
        b=llTtMq8jP4cqdWCRHjt/krU/NySM8GFp36Yuo74pLkO/NGa9aNXuh0O9WbNEb2IL44
         8WhyibS7WZQ8Kks2qnBca5LE+gncmKY5+seYbxZqjOt28+r1Wj/GBkOCuQHL/aaDm7GV
         lkSA3vRC1LVuZqXgeHhuc58NIGyvbSgkfW17BqC4uhIuk/YsSh4kLMMReao0lu1mc0nW
         uQmlpJETqsjKXvJQdZNSt2wSGjJAyVWMjS6Qz8c54B4hDQvo6vVK3XDIP6iIQ2aT6Vh+
         OtUpj1rAuSXdRQ2YOLJSYL4pUjYyaloVOJ2yKpwLNGOdyZccRAz9+CeGQ4viLvSqHsUb
         ZE1Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788226465; x=1788831265; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VounH2TLCX+icK8ohtB74w58kkdgdhvjkS5XdKNJR7k=;
        b=d5qUVcICWnFtxMFQtrpeF5zHkErGJIKPjeIs3PU7Uzti1/fUQWWZxTiuOM6KfvOCEt
         ymf7tMqdg4ZMhZ98hqUJtnpnsLYxwnEe11rHW7WGUWO0zNH1nWyhelbFZFkCnDXkp16y
         RkhaGlGCqnemDbzc/scNrxHRyeKBPhZL5AN7YvQD3nLJ+inVtqRYiyOutVRiUJ5nFGtA
         nUWb9eg84wCm3q6PmL+QrKoA92I4AROyKtrSOK8BiE64u78tWHmffUKUxnnZ4Ya6c53v
         jzRhDhjWIyTyljXz2iMT/mDQUvYUPPMDCUtQ0gohhbvW/8j/PS+uZIqzSR4lCnd53o6/
         fe1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788226465; x=1788831265;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VounH2TLCX+icK8ohtB74w58kkdgdhvjkS5XdKNJR7k=;
        b=oZKqkZ4hBPtLsNTKq1LpuNTrLO1pj+aehnHlKVPDvSYn54HNdJZQd/xPdd5gj+gfxj
         709dPHW05rzcZFqWjEl1KyHhLWdn0oxeuadwcrgEKAyqiOegVTM1Dzv4Qj1Owy2s71Rd
         5d98B9woaxPgRFkLAw2byalXsnKcDwhtLzpGe+l+omXvqWXfp3fU0FkXs0pLjgPg5x4J
         zIn8pau6cm73GCBUDOFx4ZhelDZ6rAzdjrKRsbEUatMi4vABe0Sxs/BNBuOOBMSb35ki
         8TKUOLkn+3jxIspo/Ld8k5XxFcTBQrcX7bR/n8TPoTtKf57hGIVoJpcWhft0Br0McgyZ
         MPOg==
X-Forwarded-Encrypted: i=1; AHgh+RohmPByknQ6H+cmKlNpv7BG1SFfPedjYiP/3JL3i+WRCkx9lMogCo2+8opGBk4Ni9dQ/9fEooIAm+zkf1k=@vger.kernel.org
X-Gm-Message-State: AFuF++mtwaY5YZEPN/DOyDMOTeYTRfGGOavOB59K/o9yS/xJVHEeY2el
	7YI7dI4peXQzyLApGXiYT/Q2jJgxpoLor0+NUsag47hNWE1ZlWq41bAJmYkM4AKamyYqFYge0FG
	Ka5111KsFDzpsBO9Srekx0lEX3Kc79xOEONkEYA0x
X-Gm-Gg: AR+sD13aaYsSy1zly+u5bmCXpffsl2sOEsI4kuHveHYXmDW81Sy4+FOwHM8mEHkSJ4B
	zASXtJG96tOTxIu2TGxr6t4j3Xb9kKFRX00PmH2q0lG8NHnOjf214lILCgDhssKWEpzc4elYTYV
	N57g8imfupPI+E6q7dAf0iXy+hK4MJH83zrqZf8K8GrtR6a+7+Od+6oPrlBGr7Lq0ggMSUNiWbf
	JNtSULxBsoTVMhMo9bOY9BBOSbqN9FMHQmTpJxlQ2V0qr4UWPwLMbHcQHspWnL5go26HHdumeb1
	n8jXEeZuWslYbM1bVPPv6cLhndmCtTJIP7QYKONplgapEr7Eg4P/GaXl8hmZwE1s6kMDYUIHCEA
	dYe4r3fKqmA==
X-Received: by 2002:a05:622a:2593:b0:50f:af60:3496 with SMTP id
 d75a77b69052e-530274756b0mr5249191cf.1.1788226464562; Mon, 31 Aug 2026
 18:34:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831130129.3979454-1-beanhuo@iokpp.de> <20260831130129.3979454-4-beanhuo@iokpp.de>
In-Reply-To: <20260831130129.3979454-4-beanhuo@iokpp.de>
From: Stanley Jhu <stanleyjhu@google.com>
Date: Tue, 1 Sep 2026 09:33:47 +0800
X-Gm-Features: AcwNN1UR0AZpDFzuH5KotfUNB6xie5KyQVQlfhTBFVnUWK0vU3xxZdDP2DIKgiM
Message-ID: <CAE14pddCf1VhLVC_H-Nv30C4BzK_UO4Eknd27g72d1nAjdBdpA@mail.gmail.com>
Subject: Re: [PATCH 3/3] scsi: ufs: core: Report the current clock frequency
 to devfreq
To: Bean Huo <beanhuo@iokpp.de>, MyungJoo Ham <myungjoo.ham@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	"Martin K . Petersen" <mkp@kernel.org>, 
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@sandisk.com>, 
	Bart Van Assche <bvanassche@acm.org>, Jie Zhan <zhanjie9@hisilicon.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, linux-pm@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bean Huo <beanhuo@micron.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 31 Aug 2026 15:01:29 +0200, Bean Huo wrote:
> +     /*
> +      * target_freq stays 0 until something scales the controller for the
> +      * first time. Report nothing rather than 0 so devfreq falls back to
> +      * the frequency it last set.
> +      */
> +     if (!cur_freq)
> +             return -EINVAL;

If ufshcd_devfreq_get_cur_freq() returns -EINVAL here, devfreq falls back
to devfreq->previous_freq. However, because UFS does not set
devfreq_profile.initial_freq, previous_freq is also 0 at boot. On platforms
with use_pm_opp=true, the initial sysfs read or the first transition before
scaling still ends up seeing 0 Hz.

Would it be cleaner to initialize hba->clk_scaling.target_freq and
devfreq_profile.initial_freq to the max frequency in ufshcd_devfreq_init()?
That way, cur_freq is valid from the start and we wouldn't need to handle
the !cur_freq case here.

Thanks,
Stanley Jhu
