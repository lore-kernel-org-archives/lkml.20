Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793096513;
	b=Gi38BqnPBt5efkL3WyjpjCZXnObzlr+3mSs4YSfXdArYo/L8hsijhDJP6t9H0/8frhYg
	 CZWS0r2l+XXnew+V8t/VvprLbeT4D6HUIqzs7H20RtYzhQVNssb/QDIS/e5+hU0Q2Hdnt
	 SpigOh0rm8b9wQL/YI219j2PXUbn1L32ATew1IeYdaYZAWhIUjuT0Ae0/DLNR90Pg+faF
	 H0fYgPi70lU/K2gaATtGjd0oJFDS+h9t4V8CjhpSuh7erMtj1Wyt/XD88Gz9+QkNuSBu8
	 LUqZVi+h2SVOAGSjAXrpshochDdMZLH3iwbDW+/F6QOyX0C6JsUnStI6sMUBi7ApwOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793096513;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=iAbG4TXaudHPChAgyQZBjxq+/WagALvzGHQc1mnxCRc=;
	b=IiaQ2i1406HmQU9HlKwBbKrobMuXYzkfD38vIQ6+SZEqD7hyOQlE9YluHEoLg/z4EnnB
	 UpmBFOTpVyoL8Vduzc8HuqM0bgzQDzfq0BYbjtIP7NPMzCBRm0nxOO5ASPpJAjdiUyH2B
	 /wa3eSV85im2l4M0wi7AKN6bve4EMiSdgq1lN1eK+zIquexfTo1XqlpByaQF8p6MIK/bY
	 UAEQr9LadYOnpyJTgQ4SjTAUEn+R8PSi6phMVsz8uY0Np/yFy8i8Yz/Y7we7ZY44nYirS
	 f+s4MPUHJ8AcmDlg/jOE3qD/CCvsgjjUk6t3YetZMdnG9MwHlccXWQ+gQhCDyOYqV2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=sR8Z5JL6;
	arc=none smtp.remote-ip=209.85.216.72
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45F3B606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 10:21:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45F3B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=sR8Z5JL6
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ab1e771632so691227a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 03:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1793096511; x=1793701311; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iAbG4TXaudHPChAgyQZBjxq+/WagALvzGHQc1mnxCRc=;
        b=sR8Z5JL6Mqy4Khp2MuMfkZpi35b7KLCz+a3IRQcP9qtIz2dbW2lXv7fLGKBj1EkpGP
         c7DvVrAKk83QnaJ4lWiB0SZJAkk8DJHTnYFOtu9QntQTXvg5g7ekIDHvfnDQDVX6y3G0
         60vAkUvcR56pAsP9JinrfYMd5FWlKAU8yf4I5bFXLiOlVwg8/4TvDXotqbCtdOD+PSsJ
         +4mh56N1g3wtqaBE2xCtxOV3iVe2foDh7SyVIkspXKbXQAt8MtuQMBkexCX9AKEqXZ4G
         wpTeqN+m5HSF1d1Owi/ZFpJe2qP8Mkr8v2avrYL1uAxjGkmFSmWOP8oiZksz4K4W3R84
         8nHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793096511; x=1793701311;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iAbG4TXaudHPChAgyQZBjxq+/WagALvzGHQc1mnxCRc=;
        b=mOzgo1pDnMaxr3WaXbFaIUOZpJ8OMmh0xi4djdr1CBDcOYpEvssocqkXf4i1ljBKnr
         Hp4NWIRpqqRFd8/5MKDQVuDnezcsfM0KcH3vS9XURxX1YvmdRQNz0qts1A0MfVr7CYuU
         8tj1m8Jaj3hRKcRe/jJhIf9SAQpmZyOIc8NLd2IHm54AI0cVAVEKEZX1E7ULgcYJw2pC
         KCzpC2L9VEaJcqhfwsLvqVBkT1TC8eRJlQZF9TsPtKP8k5tiZLeRE8p5AKo1IWkc3iv3
         qOXzjy+Xiz/g2oitrilc96lairIlfn/4tYpXXbvytBH8DpbvVpr4NtLtExW/Ba036MQz
         KDAg==
X-Forwarded-Encrypted: i=1; AKwUvBw939CkiMO9Xx1ujAK6qSPuGwzfmkEA8CveA6r7oMWqFBt2zasMc4T8z2X7kJ23hN2HmSWo8Z+Ckw+iVKQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYL5RhNKLqdcDouYGyomK5woXBfVtR1fX+A0X/9g1OWbbEiKAdYn
	J8kaYJRPQgjDrM+SFEEK7ASzkbRzBrCaFh3xOa6Ks0EmSQouDL8MD9oaTukDwigXceM1L3Q1kKR
	Pnoi/t1dhH8xyj8XYGVKjUw==
X-Received: from pgn17.prod.google.com ([2002:a63:d51:0:b0:cc7:9d5b:c2a1])
 (user=stanleyjhu job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:4a07:b0:3ac:67cc:3ca2 with SMTP id 98e67ed59e1d1-3ae4025fbe4mr1373440a91.2.1793096511293;
 Tue, 27 Oct 2026 03:21:51 -0700 (PDT)
Date: Tue, 27 Oct 2026 18:21:49 +0800
In-Reply-To: <20261027021037.3398180-1-hy50.seo@samsung.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261027021037.3398180-1-hy50.seo@samsung.com>
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
Message-ID: <20261027102149.3863280-1-stanleyjhu@google.com>
Subject: Re: [PATCH v5] scsi: ufs: Change the error check sequence for auto hibern8
From: Stanley Jhu <stanleyjhu@google.com>
To: HOYOUNG SEO <hy50.seo@samsung.com>
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	alim.akhtar@samsung.com, avri.altman@wdc.com, jejb@linux.ibm.com, 
	martin.petersen@oracle.com, bvanassche@acm.org, kwangwon.min@samsung.com, 
	kwmad.kim@samsung.com, cpgs@samsung.com, h10.kim@samsung.com
Content-Type: text/plain; charset="UTF-8"

On 10/27/26 11:10 AM, HOYOUNG SEO wrote:
> Fixes: fcd8b0450a9a ("scsi: ufs: core: Make ufshcd_uic_cmd_compl() easier to analyze")
>
> Signed-off-by: HOYOUNG SEO <hy50.seo@samsung.com>
> ---
> Changes in v5:
[...]
>  - Move the Signed-off-by above the "---" line and Cc stable.

- The v5 changelog mentions Cc stable, but as far as I can see the
  patch has no "Cc: stable@vger.kernel.org" trailer. Was it meant to
  go right below the Fixes: tag, in the same block as Signed-off-by?

Reviewed-by: Stanley Jhu <stanleyjhu@google.com>
