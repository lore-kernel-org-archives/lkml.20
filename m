Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793736401;
	b=mzPnBt5AxaWQD90171OcLTrkF/vZSLUwoGeiI+AyPht8XYgDcW+Re3Pp7M3tUtabVuvJ
	 mhPyNOVa7EpYDuXfj8HOd49ibje+1gi/MBHJo4X5LzF7e9nxljbSAZnoyQqDxgtt/NZHE
	 B1kPegDdxK+kns7oZIz7uaAUXWpTIT4eD5lgvSivoiK9x5mVglT9qs2SjlXYqcydw5VId
	 4DCVPmUSpUoK6hiwbXJzyht41P6VlVtaAI3IFN326LIjnoceBgWb5zyAQLAN9I7XuIfNg
	 N4tub3+sOwfjjbjRVvZx2gpyyxD+NQpnGo/MIUHaR+y8rSZFPDYbmi8+P9y02B3AfSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793736401;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=+Wkeggk9/I8XK/OzWemypiGDuPRyFGzMcFGwhba67BE=;
	b=oGgwPBAMdxwzBsJ4U8XVymDnr7bJlzrXXNNYln8COJBLctp8qdnXWVwTxxWUFnLBria2
	 5yJXGNSIAVcJN9YzmbcIMFcN4KPGAiiw5y8XAQTaIX7n8uHNWJNhbchLYzdEMvVnuPsQs
	 NgQOKyUtnAXamut+DL2WN8TYYdov4SCXFf71JJf5glLnFHLb6bCvSajiDDUpZ0AcK2GGe
	 Kpv6D8nxR2sUdv31rlqIzVgNtnQuSeXGsgYsS3E9dA9OTB1qVVnFCrYfmIPHZXsWiODtd
	 jYciizAos9/iYCMoCfgrQ43hmndILfyqewReRSvC8HuaxPSuP1K5E51J4ZxNJnA9czQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--shansinha.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=jW5vxALe;
	arc=none smtp.remote-ip=209.85.216.70
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8E9B606A326
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 20:06:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8E9B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--shansinha.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=jW5vxALe
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3abb4c24125so23372a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 12:06:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793736400; x=1794341200; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+Wkeggk9/I8XK/OzWemypiGDuPRyFGzMcFGwhba67BE=;
        b=jW5vxALevlVJMAlYih9ubNLJExjQ1Mpls//X//Ybk5pkxyOAZrNTUJy6eMe64j+kpx
         ipNUPBeEE137HaQchSjNEgLDr5ignUKWAKgGOtSrZKR2DkVfaWjRrBaOQNNJXj8v58kz
         T3icgK6Ws02vEgM1HKMyOT2QNxVmouSXzjrCjLoUmOwzXqgtxx30ctLu9pR6NJ6yQjDC
         VEejsYIjlul2oKd4VnaGZtcgNOihsQr5qS+LOwMOHFrNXtnImDNHDI43GyCUJL/28Cxk
         D5CPD1agtyTKdmtLSGE5K1UeNUvzpPObKbOflbg8opmawQaZ6SLDQJK0Uuqx00NFR/XO
         mVVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793736400; x=1794341200;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+Wkeggk9/I8XK/OzWemypiGDuPRyFGzMcFGwhba67BE=;
        b=esPovwUbRlXzIiblXatpHgwnrHb0+JcBz5B8/fRkgX69GUs6KDiazt0do9h6osSXbn
         9et1wanVJU/n34jmHx7DpjpjzTbDFxEwlJATaDQb31QyDyBsEbTdgsXhzfcQjKP8x2kq
         689OSXXDemxmRvwH2okHu9cSfcayAOfXn/UD90o7PiQDttd9Gw9eFkxeDIK3Prq7OreW
         AVf5HfnwobiqINesczkyYmFaasACl59JrKFOh2mOO8mWZ6/kOHzYdQniZf69qLq2nm9/
         EnDU09Hq7hEXjIshD8uKXpUjJWvWQNyF2Krab3xI8SM3jy7NnbKm+hWoqGXBJqw+pQE8
         R6Qw==
X-Forwarded-Encrypted: i=1; AKwUvBzuoYt3fy0ttPYlYiNhUl2IEppLWaZD3/V9+SRMy1Zs6YidlxQ7i7U7vUUutNn8Kwu3gIxRDXaq4MbhvJM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8dYp1cuU0ZQtwM+kbVGPrfun9xxCterXwsziHUxOVR2XtOkZjC
	DvDWpssJB0Cem5YLmjPY8FJvekSoCxCuWvsmD2wdVGcK/TAr5zxrhcs4FOTYlEnzqyyLGyssSSS
	2LIoXAbhnxcZhetm9ZQ==
X-Received: from pgkz19.prod.google.com ([2002:a63:a53:0:b0:cd6:5865:b9a2])
 (user=shansinha job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:514f:b0:3a4:9dd7:296f with SMTP id 98e67ed59e1d1-3ae897e224bmr10233131a91.40.1793736399648;
 Tue, 03 Nov 2026 12:06:39 -0800 (PST)
Date: Tue,  3 Nov 2026 20:06:29 +0000
In-Reply-To: <fe86fe10f9def87a2b463a6d4b44e266dd9497dc.1792599491.git.prsampat@amd.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <cover.1792599491.git.prsampat@amd.com> <fe86fe10f9def87a2b463a6d4b44e266dd9497dc.1792599491.git.prsampat@amd.com>
X-Mailer: git-send-email 2.56.0.398.g882cbad275-goog
Message-ID: <20261103200629.136230-1-shansinha@google.com>
Subject: Re: [Patch v5 7/7] crypto: ccp - Implement SNP Download Firmware EX
From: Shantanu Sinha <shansinha@google.com>
To: "Pratik R. Sampat" <prsampat@amd.com>
Cc: mcgrof@kernel.org, russ.weight@linux.dev, dakr@kernel.org, 
	ashish.kalra@amd.com, thomas.lendacky@amd.com, herbert@gondor.apana.org.au, 
	davem@davemloft.net, linux-crypto@vger.kernel.org, 
	linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org, rafael@kernel.org, 
	chao.gao@intel.com, aik@amd.com, tycho@kernel.org, nikunj@amd.com, 
	michael.roth@amd.com, shansinha@google.com
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 21, 2026 at 05:05:03PM +0000, Pratik R. Sampat wrote:
> Implement SNP live firmware update using the DOWNLOAD_FIRMWARE_EX
> command.
> [...]
> v4..v5:
> * Report original firmware error on rollback failure - Tycho, Shantanu

I've tested v5 on Milan and everything seems to be working as expected.
I'm happy for this to be merged.

Tested-by: Shantanu Sinha <shansinha@google.com>

Thanks,
Shantanu
