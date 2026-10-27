Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793094090;
	b=fV8D4T0HJ2Z8w5Om7IJPYjxFyT06pJ4fgBLMHwrDqZCFJo/uLKOnQjyoYfSasyXr+GZq
	 ljUtkEgk1ga2j/LSThUTeYFpLnToU2/EolYZN4bdHEKOZE+ooW9/LKPBx1+N2wdd8GDqB
	 2VrM6H4PoA0rzMcWcu+EfbkJKwusK/oNybSxqNsZysmjPP7BBd0AJY+PEZRUY7OgWic1r
	 agYgCQV/j4+QiX4C4wD1qmrbZBGwHVXcaZPvoAfWVaIPWi+63jVlrDiu6ZEgRhLN5mSdM
	 SaIQDecaJEcQxXKlmQJIBDUE+BM2S9BlacFcKpZX6dHsQbhR2ClqVN07mTkTqhw17Dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793094090;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=UDSipwswQiKOFZETfFd0sP/sXqxajC2VdO9O8E2arqs=;
	b=Fxk5UnrMFYhUrMwEaguevYLTU5IdDyO5HySgvPZNPPttTrSfGLubbw5osmHVMaxRgJpk
	 mjat0fnsWgGVGc47NY3Mq0AM++2VyH/v9hlGqShnkXBzbShLcC7KlKVY06KayU36buwS2
	 Q31gcTEdpLlRnN8ks5jo74kcOPSKNdSjijeP4JS0bVBhGENtwlUGm+6R69aPCynu8pGjQ
	 iimiiX4BJPg5bn3HpDx3PxKoTQhk7QwLw0iHi3krz+3mmvqEePo8LqoMSqFNXGJJCxI5I
	 ENwFFZWqAxcYyrsR1UYiq3HBXVMUTsZGW690Yrx21dWZ+fts0Uta/CDJ26Yrz+uthGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=A8J8lbBW;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1882F606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:41:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1882F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=A8J8lbBW
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-36661f953e4so7193510eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 02:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793094089; x=1793698889; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UDSipwswQiKOFZETfFd0sP/sXqxajC2VdO9O8E2arqs=;
        b=A8J8lbBWFpci3PVBaMCaWnW5Z+hQkw7snfrchHPOGAZXAsrJkFuyHLrU5uhLycHaLx
         2FK8TAA3hEU/4+CnI1/oON1dEZfa/TNTYleoytAZPjl66uMgDq+1Mj1B6uog+HJIns07
         hHf8LQ6C/l2hoAKOH+qZR4IeQ26/aaFxKELU4aGzcJzpT+705p0t7BL8HVq62FgBvxcK
         GrItPLBJp1K03l4O6ZCOTf0L+/fA/h4xkIQbtXh9mNzwWIaFUE1Sv40TASNr/0+6bp70
         bJcSEa+7mZXTljgsNVFkLrwUNVgzJguaviKD1MOVL14KOxJdIxjgu5In5cnK/qzC1YPA
         fgBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793094089; x=1793698889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UDSipwswQiKOFZETfFd0sP/sXqxajC2VdO9O8E2arqs=;
        b=i5A/iSCqmIQ60pE2CPsxqroOA710mUgAq2HaTa8z7BP3LMCoTuLbhdNBhW1llX3yio
         P9D4OL5uKXAiDOPTw37A0g3BfdWGKV8kHay/RHob5IPFPE44xBR+4cSVqiN0M1jOGpYz
         paxS+aDUDmibas10WEwSa60z1pOVMNWkQFheJEH41XFZ8OnI6HJhH2HF3P/O0IwEZL2L
         JubJot9tpHMfSdL4yZ4wnD4dzRgZ3G8ZFdcmCNXglaJlBK2s74P8SCTpJOHMgYp+o+I9
         NuQekj+I39/vN24UFf3VwJq717x3RHw/p3olJDKk59UATC/lLZ4BLgJxIeajZPvkBWH/
         jmSw==
X-Forwarded-Encrypted: i=1; AKwUvBxQvyTXufsudhMSqbQ/WgNo7QF+erOl6WATsazQ0sUeE6irX6duY4nRN/U8xf7wJsRUu0zmo0gU2LJLFBA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKzi8lTUOr7f34vlvSFH1uEaiglarszPXj7gkGvh9Px5c023nl2
	UJ5d+XB4H1ma7CX38Be03NB/kczkdiHsSUyec2fEQGwUC7KqlUjcTYiU
X-Gm-Gg: AYBFou08+UIQddCgeYlkvB3Whq4NIxzdgztrihZOf2Sy1RaX/XYCLA4LO5E/Cm54Vab
	ownuajXOHlUgVXA+fTaECS+zB3ncdMjUOtqaBvs2u22UpXxDgBUyBbxV159FH+Er4r10dspGYo4
	x1swcFxf2OV5lH91m0E4OYw8YAyimcWsiXYw3n0dd4CgfPnCrz7XaYnqaRRt+dEd7bd6iXDRpKb
	Q1BUeNlRqN6XnDLRtpvG7M9yx0UQ9Fy/T3MIuFKyoay3A0Vx4GTatOtQ5hLri6EJ+yK5nF8g7IJ
	IRvTK+4w0pBVYOjsf9G83IbN+mAClB1xOOIuWQVHyaKSktx8Vd4gVxxQpGyCdH6Riq/WrREqneb
	z53CJOPCfmRXziftKvNkwk92MQZPsyx8er48Qui8KMq5Cvo8FbKn5qhALO59PWQQISmFPgtekXQ
	K8W4mZL2OyHlm77AM0hNIBKGUdWok5w96dS77nTN9y31XzhoyLYVwZPme3swlOxPvRxc5XOgZkC
	N62SXvqxGO6aA6k98WaWpfp6C/1HRQ3gyMbElBMhCOHlJzIFipAY8Pjk2SQ1XNaA6L9guo2P517
	6FTw+vJT63AySzPLaiKHgI9fzFnhIVhLAdQp4BWka0kWGnnI/5b/VcoX977waCgBuXiCCWPN1SX
	ro6xSfxDh+/It
X-Received: by 2002:a05:693c:87d7:10b0:366:83dd:46f7 with SMTP id 5a478bee46e88-369e84bc5bemr13599484eec.17.1793094088758;
        Tue, 27 Oct 2026 02:41:28 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec50bcsm60208024eec.23.2026.10.27.02.41.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 02:41:28 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: even.xu@intel.com
Cc: jikos@kernel.org,
	bentiss@kernel.org,
	srinivas.pandruvada@linux.intel.com,
	rui1.zhang@intel.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] HID: intel-thc-hid: intel-quickspi: validate GET REPORT response size
Date: Tue, 27 Oct 2026 18:41:24 +0900
Message-ID: <20261027094124.223069-1-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261027025820.3085067-1-even.xu@intel.com>
References: <20261027025820.3085067-1-even.xu@intel.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello Even,

Thank you for picking this up, and thanks to Rui for testing it.

On Tue, Oct 27, 2026 at 10:58:20AM +0800, Even Xu wrote:
> -		qsdev->report_len = sizeof(body_hdr->content_id) + input_len;
> +		report_len = sizeof(body_hdr->content_id) + input_len;
> +		if (report_len > qsdev->report_buf_size) {

One question about this bound. The DATA case accepts a content_len up
to max_input_len, and the GET response adds the content ID on top of
that. A GET_FEATURE or GET_INPUT_REPORT response of the same size then
gives report_len = max_input_len + 1, which this version rejects when
max_input_len is the larger of the two lengths. v1 compared against the
allocation, which has the output report header to spare.

Can a response that large happen? If it can, comparing input_len would
keep the same limit as the DATA case:

	if (input_len > qsdev->report_buf_size) {

Best regards,
HyeongJun
