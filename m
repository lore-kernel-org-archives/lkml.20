Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7584B4A206E
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 14:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788358522; cv=pass; b=OAwxiaeM55S8jU0NlE+4J/VdvtMD23WHYeXZ6uyniBuuJySBmfshbY0qwfZtAhUXwm70zPoGZ1mYSNlC1yROdWJMdgMdMOKoZ7kTJoTmm6l0e2Rg/7N1OojJ9Sd38TlSwFdslNEZlFaiOQ40CukU32JE7DJP8c3JdrMF7t2a6UQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788358522; c=relaxed/simple;
	bh=6RznMFxVVbC4OvOdC+iBHzOZQOg0QLC2cwLiQWP2ju0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MFm891iRs3XEi7WgOCe2NUhBu9ZxHXgdSEJZrDFWoHCYq/tO15/Q4UofqGZDtLLvUNJCCT4k+wnsZeRFweb4SkpkTKB8aIATgpSdEfbeJX0I5lYm3XMam59yAEo89FKHMJgSa3XZc3PS3+VFxPSb26gMK9Yex2POhLCVh7CbH0g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jpkap8J9; arc=pass smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jpkap8J9"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-484415c8cb1so849357f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 07:15:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788358517; cv=none;
        d=google.com; s=arc-20260327;
        b=cRpTb+2pyE7X+UzEjetUcmD1yWQ2zYjmaHWaCoTs7sLOrOIgT+MxvSOJ9EP6J4lrO0
         XGLBTUklq9Ws+3S5/LheP8Femx2wjBi4mUSy+cp+2PHQHt2bDdREgD327na1eViH/Qb2
         ZG7KluQB8Hi7eNHf+PX5EmNL+XuiPgobailf8aQe4YimckyVbhuLESZJfEMOuG11ysgv
         Ngiw76P0xo5I/zrh6AoifAbSIllhB7ezmJFaZuoROreb2SWsBmN/MyWRU8shxz0QxKdR
         AoLZen5vqRsOYrs4XyEx4pnB+GlES+Q0TfuwLASwbB0zRMwtkc9szs1MOW39oqwsnrxG
         +aLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6RznMFxVVbC4OvOdC+iBHzOZQOg0QLC2cwLiQWP2ju0=;
        fh=b/qeIYt5s6S5oxnDTprBZ33Dn8R8vfpkv7naXOoqqpA=;
        b=DWke7z7S0wK7KSmDUq3lGW2gnPF5X5S4nAsW66VoNfnWVfVsJbzEcI+kA1l13w94tL
         ZuLPIYz0ye+Vk9d3bowSudgSvGZWgOk1TfQk/v1IOy/OVyiy9d9fx0lLiarCfRkLCJd5
         tz8hvoqKZT+cYwqQwLJFjZU9W7skwetce+caZvvs4RYpJyy1vOwuMmcRfXI3sdwXmVfA
         X27ufSfC48ZFzt9nWplrpqvQoWOMMl7tAZkTQVFNwkBvfDJgg0XQb5xMaWMN4cEEXp3i
         QJit+0iEt8+nemhXzxH1astHjHSf46v9kRB0Jfw/buZ6XKEQXBf6uGEOKzZAb5hYQqeK
         uSUg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788358517; x=1788963317; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6RznMFxVVbC4OvOdC+iBHzOZQOg0QLC2cwLiQWP2ju0=;
        b=Jpkap8J9ExStRRFINrcF9j44vFHZFIsCw7zQMjyDU6joqOAY4wmYP4aUgp/4z6IAw1
         BjOylq6/D9vCpW7kusBxY0jtKXUcKdaTDfXMqCCkTTTMZgj9MSlCRRfuRT6QpZoT8iRC
         LM1akb571KmwGEc4EDpvRZDLA8K8zXR8dewg2WqPq9nYui+1Q5UznyucAtAVxBQTiT1t
         7RMT+XYolo8xuV2kEwjfM/K+vyrG7trWdaY1UFRY6PUUqpKI+mwuX/fWt1mtMD8ayfyB
         7gVkjcrwWc3f5pDX69lZyV95XVVqaKwohsNSZWNRhw+XW0GF9s7ZrRfM4x+TWkQCXXIH
         f5gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788358517; x=1788963317;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6RznMFxVVbC4OvOdC+iBHzOZQOg0QLC2cwLiQWP2ju0=;
        b=GU4zfB35prow9CyuRDbMW/1C45FhBLtcTs4OqGzphhPDIwulojFHBwRmWCXlexVbBW
         XUSe1lSjnIY5GsthZXd6XSkqV2HZFKDheuYYMUmurQRdo0oeLTdZEn1SvqbSSRySLxYG
         MTRTgn9ckEoL6LVkvU9x0jWbZMFhIUulLTnsjiwMj/oACwR/uR56QEjed2mzs68pAX58
         jq5j8bKQftIqHJLG/9k8DwdwnRpGBpzbENi1unYwcpmjKNtBJbI4w5olS7848LCzuY7C
         YkSJcd/NWM652zGKDMe3L9CJZtJR/tzy8VL8rFTvKy+uYf6tKoVL6bnxURa62gGO6BWk
         UAAQ==
X-Forwarded-Encrypted: i=1; AKwUvBxosTeLXEz7HhwzJVrZGkZ2aQUFgkkqX8WzHWQ0wa8rbHW4ljAAat+lzqMzE/rOHy1fzP83GP+8+2mY7kw=@vger.kernel.org
X-Gm-Message-State: AFuF++nduvF3HorNq9lE1j3XCqDP315tjG9Ig99HQd3Chch/lC31Cdi8
	fmycvX5ZtkRbEMlU0Kdsd8cu5+6NC5xIiBOIpo/PC9DLH5Zlyy9fFr4pSE9Ttf2qCF30Gznlin9
	kFeR5sQI12weon9MEa7Zf4cB9V0yug3Y=
X-Gm-Gg: AYBFou2lZ2BLy/riKPdUHRDCZExfqzQKE/S3aHVvOuPwbMeWG3an+7h0Qa52JfcKN6d
	gDEtU4wepuImApesEsz4AkxiQ98ivnYywn2Kpzo2ek+iVNsh54LdzcsDHTsGl5Ry69AsfW71h8K
	K2hHQTTGZZ/Mf1tFb7WMbv7NF4QCFvXjugYiQ11KToKCsp5cE+/J2embvrEQUu9wEs+ionwF9cE
	iJPzegpKtrQMCAl05Hlyc/2v9la17oVaVNQ93NXYaBBxJ1229mLbItLMEc/xOK4b5tq2MtfRTuU
	tSyT4J/HRDd/Hn6ExKy3Eeyq5LhyEPLYuvNCrPIUzQu60PmAsgDDW6SL7Ws1Zi595IhdY5P0oEZ
	Crg==
X-Received: by 2002:a05:6000:196f:b0:481:98d:b24 with SMTP id
 ffacd0b85a97d-484913b9a8dmr7353105f8f.19.1788358517128; Wed, 02 Sep 2026
 07:15:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260827094509.1016740-1-hebaoquan@kylinos.cn> <20260827094509.1016740-8-hebaoquan@kylinos.cn>
In-Reply-To: <20260827094509.1016740-8-hebaoquan@kylinos.cn>
From: Nhat Pham <nphamcs@gmail.com>
Date: Wed, 2 Sep 2026 10:15:06 -0400
X-Gm-Features: AcwNN1WAKxDXLmAG1e0SeJ_cyeDzb_A4NqukLANh0VTS2ERN4dof1j2brfMyzmk
Message-ID: <CAKEwX=P53GAmyPeBQ29XaHnGw5qpKkiKiBEwuhdRKdkMPT0GSg@mail.gmail.com>
Subject: Re: [PATCH 07/16] mm, swap: add xswap grow trigger on cluster allocation
To: Baoquan He <hebaoquan@kylinos.cn>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, chrisl@kernel.org, 
	kasong@tencent.com, baohua@kernel.org, youngjun.park@lge.com, 
	hannes@cmpxchg.org, yosry@kernel.org, shikemeng@huaweicloud.com, 
	chengming.zhou@linux.dev, baoquan.he@linux.dev, david@kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2026 at 5:45=E2=80=AFAM Baoquan He <hebaoquan@kylinos.cn> w=
rote:
>
> When cluster_alloc_swap_entry() fails to find a free cluster and
> the xswap device still has room to grow, expand the mapped range
> by XSWAP_GROW_CLUSTERS clusters.
>
> Since xswap is always SWP_SOLIDSTATE, no locks need to be dropped
> before calling xswap_map_clusters(), global_cluster_lock is never
> held on this path.

What about local_lock()? I believe we're still holding
percpu_swap_cluster's local lock as we invoke xswap_map_clusters()?
Would this lead to issues :/
