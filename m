Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5DC84BEE5A
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 17:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790010338; cv=none; b=IuIPIvMuuU8PKD3e/ODQOTrxASS07o/xqXYJMGj54L6KPy3ua2IINo/i7HI99qi2KLjjm9jK//btZuJ34WryHbk7U65PmLUzTod9AmRbb4etHOF5kQjPfKwOrwHFjp0Is4Zb/MuRX9KE1Hxvq0oGfZuFmDCl8sLCcbXq9K+ai3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790010338; c=relaxed/simple;
	bh=sxrqKSwS1aorwF9WJCKcZM9J2sb1lpvGqut3ne1KxxE=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:MIME-Version; b=djBONKQOOJSI0zSNXeuceiypG0O/IcZZzUsvmgL3Na0TpPlMnZwi76yiCzQ+Q9HKQZj+VVJfre5z8W04ZQILYR0tcTZhYpF9HUEIawXjYpx79r1tNPcFwGWKr/lYGnY9cbn7RDrQpkfi9kFCIwnExLsEzSjisZUVBg49yfYYkYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e01Bk0ye; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e01Bk0ye"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-398a147688bso3356508a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 10:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790010336; x=1790615136; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hcS6tmFExHZcf0In9X6bDYXLCnLsTisUwJksVN/pUS4=;
        b=e01Bk0yez5VZ5jUF8jiqRrY251Qq/kSTJdfERazEX42BnRIDkYDNZ/C8j0HhleNTcU
         /f3E9VshD1wnSAyE9lPLaJnK/Vx1kVSHZatw+BpyspWm6SJxo/CRgrB0v2uProIj/hyr
         zZHDX2UNup5jUQqIpXz1sp7o2UV7Ta97oUy45gdn1PcZ1iguDHPFEM/OihLooBPqFDhM
         WEl+3uQoILBNuUDEJAhRnXxRg2INZ/9tiMkkXeGXfXNL8AlwM3jVSvh5Kf9t4HStwz7y
         gTuY2fVluSfv7ekX5Vj7C13kfns36bFVOBlu1c+GxWyhnbvB8WUQsrSE0ply5+1VCuAz
         +nIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790010336; x=1790615136;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hcS6tmFExHZcf0In9X6bDYXLCnLsTisUwJksVN/pUS4=;
        b=ETg/cqlLzrH53aDY0ee1PlEs2PUeh+++X5WWuDEYZNGoOA4fdprU0FliPvvm7yLM0A
         YCsfLKP/BfpgiEQgsrC5xluxTDDi3C40WGzJsXiVirxXTV9yUrXL+gW9dZ943B8E3Ave
         6N4zBoNCn+J3maDsuJiLTD0VR/SjKAKx86dtNsEuFYsT4BEiaDeujJTolSGAmdhPxE51
         yz3BUlRpldnZRo84caHuBofJXENilCOxrnsFZiu+E5BQmvBUoDHILK3xeUVWWYZNbo7t
         Ckb3PD59SLTtH2haVyByGHt5F2kkUGVVieRsZytp3F8DBRrtPh0tOwjiUJcoxf2kyTlg
         Nn/A==
X-Forwarded-Encrypted: i=1; AKwUvBxZQ1hCjxsszvA6vKPmPXTpX7kYDrkAXa0F6ifB/VcmS3cCdp66q3OAYXKttnnQG9dGXRuZca3hRVdiPNg=@vger.kernel.org
X-Gm-Message-State: AFuF++lbv3o0+euL+lxZE6aiS0TwGMFN177edfCro7pA2XTSvOKPxNy1
	UrLDwS8L1A/KuU640A93qH2XKRMvQQ+m1b1EVKKI9oKGNIP2TYnHtrYC
X-Gm-Gg: AYBFou2fFe+l3L8SRTo5VzwGqHv2SFDnqU7e9A4dnDgPDvHWvzOPjAEykxHJAE30mYM
	qG4Sgxx/a3fz4WRGs6PJ0Mj8s4xSTHkB7i/cbSoqIR96dggM44VwwGG7MfZX9tZ2J6mccHWi/D0
	VlxvB1S4BVfvvbmGOB/1kSr8DCs6G+bEacLiQErGBbIG3AEMAbha/7ryZ3piGkkirVssCcXqC+I
	pS+j+B6mHX4hClmkBmavWwpCH1cQzdJoO9KhyKSZZ3R8XhHLrwk8uhqgNUFuBbH8xjipr1ME9Cl
	Eu+yQeAiyFOXClWjApo8J7VksA4JytvQyShhdsrVtk2W9h+yLQ28zTa7uyy+U7uPhgVkAMamS74
	i6i3coUsOvEpciFbFYn6V9zS1dL3ltSXAZ2tHNMLXABz9OhFt/RZgrqNp51GJX0OZcmHj0nrjso
	6f32+5vURlG3cj+TFOAKjArzbIf5w35kwJ7GJRMku1ZXqoeZbkJsUSwoRjyXHk10zFhbkDiI99z
	THpxIsQ2SbckpBPuQC9aQL4aiDZaehMYaR3IsGCPY+faLhrunrNrvfXlP7UiTsXaeRyQD0vbdBz
	4A+PTywmbgJxvGc=
X-Received: by 2002:a17:90a:3f10:b0:39e:5cd8:2140 with SMTP id 98e67ed59e1d1-39e5cd825f0mr9887668a91.20.1790010335748;
        Mon, 21 Sep 2026 10:05:35 -0700 (PDT)
Received: from localhost ([153.61.198.251])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0673b64f5sm189723a91.5.2026.09.21.10.05.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 10:05:35 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Mon, 21 Sep 2026 17:05:34 +0000
Message-Id: <DLL5PFJLT64M.1W82K71YXNT3A@gmail.com>
Cc: <song@kernel.org>, <yonghong.song@linux.dev>, <jolsa@kernel.org>,
 <emil@etsalapatis.com>, <ihor.solodrai@linux.dev>,
 <john.fastabend@gmail.com>, <bpf@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] bpf: add diagnostics for rejected memory and map
 accesses
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Suchit Karunakaran" <suchitkarunakaran@gmail.com>,
 <daniel@iogearbox.net>, <andrii@kernel.org>, <eddyz87@gmail.com>,
 <memxor@gmail.com>, <martin.lau@linux.dev>
In-Reply-To: <20260921154650.130677-1-suchitkarunakaran@gmail.com>
References: <20260921154650.130677-1-suchitkarunakaran@gmail.com>
X-Mailer: mkdraft (claude review draft; edit before sending)
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, Sep 21, 2026 at 09:16 PM Suchit Karunakaran <suchitkarunakaran@gmail.com> wrote:
>  					verbose(env, "sign extending loads from arena are not supported yet\n");
> +					bpf_diag_policy(
> +						env, i + delta, "sign-extending arena load",
> +						"the current JIT does not support this load instruction for arena memory",
> +						"Use a kernel and architecture with JIT support for this arena load.");

Did you read what AI generated for you?
"Use a kernel and architecture with JIT support for this arena load."
?!?!

Please apply human filter to every single line of "your" patches.

pw-bot: cr
