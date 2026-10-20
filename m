Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792526338;
	b=4YFcQY2p+qDx12IOTDurF66/tT4N2kDYeuzrunm8yCKz/hraOM04BSp8IaMqwa+YdUwx
	 tADv0sMjF2PKKWzhgIRkTL1XUHnbxwJxN/8v3+5ImlH4PLF5SuuONeY/9VcVXP60sQ4ZQ
	 7LcNA7GUONX/F3IE3ek8nefDt7NTOOjVgbWTvWNGyWAjBE3LjZtWKu7KmxuXjlELW0VoG
	 5QEDEkfu42RazaLENyUlB01hJeAjg+SYOqJ/4H7pg9lT39itaxPfI8oNhhQMuJ0xF0+Sb
	 R9Fp9nOoBaV8Iv5pJyMDb3zZitngI8NJgNWvaF0dus3wbIri7mdCZC7GgIkEkrBpKaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792526338;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=d4lLCzzpRL6P4ForBOyjOrBe3fXm0rVhcelSyIuV9yA=;
	b=bCd0HjC9msMW8HSi74hU3BeUmlBSKu2NcmSPYbLBKK5stPHo0O1Ri21ohoaKt+NmwCLz
	 bm7yPEYhHi8WkuHGOFnef247cvEw9F5NAXV7TGdesgIxMwZDVuVl3ccPjNM2a40cofpR1
	 vv7Cp+Zm4mUq23c5HwsJZ3Mdgx9RwhyNjgxskETKgYsqGa9jYu5nVbK3OEGUp2swZdoND
	 DfU3pQ9z1piEr0p//0hZKHba4yBmQ2RGbsxIYR3GCLXk4vAYfuDm2AjcG1VZGoGneXlBa
	 Bn8LIqi1yypvSS/bYKVm4Xf8gyuCTPAy9S1bGDGYgnaWCHTJj2OVnBtj0XlpMxYdImA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=LzCo8A4I;
	arc=none smtp.remote-ip=209.85.160.177
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C405606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 19:58:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C405606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=LzCo8A4I
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-5361e313e63so517061cf.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1792526337; x=1793131137; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=d4lLCzzpRL6P4ForBOyjOrBe3fXm0rVhcelSyIuV9yA=;
        b=LzCo8A4IvZ8Z1W18X3GnCQ5XNacmwpBGDkf4X5K7kvbm+ig3VfG5k4rwKTVQgheeSp
         IBZ8spJO3jGGMeIixxTvpB3IEO0O0kcquIbfV/AzSmsLFHBr7mcBCONId4usExtE1Cgd
         3bQ940R/MZ1/Y3dUk53IlaOegRkUySxL7eNI0kIURK6XbVoG5OiBJZ0IYjkFNjGonXfz
         LVORTp47yxPQVlxa6W0QAVKV6nvgJSeiOD7BHxGQH1KSXtzhDAkKVG9bMPAkoZzIGVYh
         74365UTEj2OwivSFI5lkdvzEio1W3A+I1tlCXUjgSKMWG/W9L87KlgTzPIit/R7MJa/g
         +INw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792526337; x=1793131137;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d4lLCzzpRL6P4ForBOyjOrBe3fXm0rVhcelSyIuV9yA=;
        b=atFhqR0NsZLglCz+HADVBsDCDRgL8T1FJpwnsuBxscILLaZv5vrwV4WSC2/tezivwg
         wWqEPTrITvPZImidjKfS6byePq209S5zMBt7pDmBQwW+pjXMOcewMwB+Ai0IFpV4vpvb
         Ggsjhklhu1p1nSDvgsBdEEv1zsD88Z9qEfyvEWCaraRuoGvOFzzBUnzUC9+gmdpGMudi
         UNP5XJmscKiV02MB0obPJPSjtkRadJyTVt+/T+dVYVvuNVzFDbHfV6aZwSgliJRbwlN8
         iu4KQ0J1Iq/IMeE9q/EVhJ1srOEiH3smPhALaTGE/0w7iiSgAwDhGhLjeMoSDo3K9iqF
         oVeA==
X-Forwarded-Encrypted: i=1; AKwUvBzT4uZSUHbmEYeZh6J+lfYFGN6OuBKI5o9v82UY6nwkcE8plegfFIv1Qgfo9Rcw/BjPMukPqP7CvP6b7EM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKehGIOF4w9Ob17lGd8akNiCaBWeinvo2uUelo8ozEm/7cPcJba
	h1wcfHeeE/SDsxZ+C4ooe7U4QDRGJOr4lppwRLc9JNxvml0mAnx9jxovEaKtPM2lhAE=
X-Gm-Gg: AYBFou0wa6U96avG90q9j7D4DhpjoeL/NH3GdqtZROmeUc7IahjC5fGOXMzwPnklZ8C
	+YkjY38pK0yNaX/hKEwbiZBOM4rwizYBc4MWJv0i8HqT7/L/y6Tc967bNglll+l3z2hgGiD+EBU
	q6oGAOzx042NXcRoj0vSl8PKXN/qZYcLb5ZhtfrpWHnLK0zt9zpNX9XnmZqoRRCZnuHP4d67sJ3
	FhdJB/YdWtukZ5Ixa8DHzgkYg91asRLWOXwq2NIplJeVXmvsKbcVQB2IU+14vhPHjQS8u0suNkt
	tiLbhO41T5UKpPr8yXmXCKC7rjsKgAC6irpNIGncGqylFjf66kyieMusA5dzAIT8S5a6j0Zxcty
	7Zw/UWDWYmGvGFpywtvo7A8/fovEekQGIgRMW+frUwVaiIo1Z0VoxDhCZs1rXzRB1+R8ASNRn6K
	I54nzJvfmZkq731r/8Wuc1AKlxGYdirCnK2hAFxRBVcaw6qmGX5J8BJU0s9ufk3oV94iDzd7cHf
	olaEcQLeW7EQzfjxIJm6hgnTrPU+XMeI83GhMTeAoVzvQ==
X-Received: by 2002:a05:622a:148d:b0:530:d429:c70a with SMTP id d75a77b69052e-53645fa0b84mr188171321cf.26.1792526336944;
        Tue, 20 Oct 2026 12:58:56 -0700 (PDT)
Received: from [192.168.86.58] (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53698b427f5sm3856891cf.15.2026.10.20.12.58.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 12:58:56 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] mm/vmscan: reclaim every zone in per-node proactive
 reclaim
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: Michal Hocko <mhocko@suse.com>
Cc: "Gregory Price (Meta)" <gourry@gourry.net>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, kernel-team@meta.com, 
 akpm@linux-foundation.org, kasong@tencent.com, qi.zheng@linux.dev, 
 shakeel.butt@linux.dev, baohua@kernel.org, axelrasmussen@google.com, 
 yuanchu@google.com, weixugc@google.com, baoquan.he@linux.dev, 
 baolin.wang@linux.alibaba.com, hannes@cmpxchg.org, david@kernel.org, 
 ljs@kernel.org, dave@stgolabs.net, roman.gushchin@linux.dev, 
 stable@vger.kernel.org
In-Reply-To: <atcc-91WerBlJ_Q5@tiehlicka>
References: <20261019185002.3428594-1-gourry@gourry.net>
 <atcc-91WerBlJ_Q5@tiehlicka>
Date: Tue, 20 Oct 2026 15:58:53 -0400
Message-Id: <179252633386.238494.13826191476140121288.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-10-20 09:49 +0200, Michal Hocko wrote:
> 
> Would it make more sense to 
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index f11491ee9ed5..e07db9514e59 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -7963,7 +7963,7 @@ int user_proactive_reclaim(char *buf,
>  	int swappiness = -1;
>  	char *old_buf, *start;
>  	substring_t args[MAX_OPT_ARGS];
> -	gfp_t gfp_mask = GFP_KERNEL;
> +	gfp_t gfp_mask = GFP_HIGHUSER_MOVABLE;
>  
>  	if (!buf || (!memcg && !pgdat) || (memcg && pgdat))
>  		return -EINVAL;
> 
> That would take care of try_to_free_mem_cgroup_pages too.

funny enough, try_to_free_mem_cgroup_pages does what my patch does:

struct scan_control sc = {
	.reclaim_idx = MAX_NR_ZONES - 1,


now, whether the gfp_mask should be GFP_KERNEL, that's a different
question i think.

(tl;dr i think my patch is still correct)

~Gregory

-- 
Gregory Price (Meta) <gourry@gourry.net>
