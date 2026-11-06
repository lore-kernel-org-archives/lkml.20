Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794008303;
	b=26m01i/lbEDxtrhmDk1KlX0jT7vyQLDsIODF0dqvfjDhMnmZ20zTZdUslpKoVN/7H6pf
	 kRJAm7vQQTnWkx+aqIdWhMEnPUx+P3Fv0U7sEb80rU90Ji1JYldoxqt56avdGZZiy7/RO
	 YOWs8pSdp5R3cXwAeKMS5gId0Up72pUF8fBxJGFl83Yv0eBdUpdPZfj6LxwTJhSK6faPr
	 S0R6eV/xZXx98PxifYkUyfwW4XT3xl52X18HwIYIFVBt/yYzY1VjMGLedQMTNmtJdlu1t
	 EIScp/DyW9oz4Lqa1q3UYO6Q6QLpudasm9s17k60iLdLD7z7msYrOIFyfNk3ByAIrIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794008303;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 X-Relaying-Domain:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=N4DPvPiEv18XL9E0HU5NSnRDXM9pLl3JEb1r3sKAKNM=;
	b=1CgHSeC67gynlZf5/3rj810n/XyLsNyc4bu/RDxR5IBCy8+IvRll0wLP2nXxcZOJnNH4
	 PzrfaNE3pZMzbQz2RCjo7qI3moRgYfcKuh0t3znVkAs4AgYQmktRUqoxDh5DvxLLCSsec
	 3lQtKZVmDIqQ/fafgUqKPdHuFRKYMbZmNBPSEz0oM9Qk/ExLs/vGKUSjn8q/aUOORFF6F
	 Pfzme+7l68DyJ8F9P7nArHdXR0j359GO+0VdTM6NBi6ZBebxGiIOL0RYw0enzxByYc8lK
	 ZxUEfnSEmy7AoFQkkkP8IwqkRWZw4rj9aeiDo43zviMEMA8b+lsM5EnInxEc0HZcu3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=everpuredata.com;
	spf=pass smtp.mailfrom=everpuredata.com;
	dkim=pass header.d=everpuredata.com header.i=@everpuredata.com header.a=rsa-sha256 header.s=google header.b="uft3M/kZ";
	arc=none smtp.remote-ip=209.85.216.99
Received: from mail-pj1-f99.google.com (mail-pj1-f99.google.com [209.85.216.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937AC606A32E
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 23:38:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 937AC606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=everpuredata.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everpuredata.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=everpuredata.com header.i=@everpuredata.com header.a=rsa-sha256 header.s=google header.b=uft3M/kZ
Received: by mail-pj1-f99.google.com with SMTP id 98e67ed59e1d1-3b08cf16decso799681a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 15:38:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=everpuredata.com; s=google; t=1794008302; x=1794613102; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N4DPvPiEv18XL9E0HU5NSnRDXM9pLl3JEb1r3sKAKNM=;
        b=uft3M/kZNtWMfwjzHoEKEfcv0xeGY1LFpaLGdGijed3dylbSlMh+emOTfhlOLh9Zq7
         nRMyZWZfjTGaYcPX06pV0RViMhCeTv8CWuIbhw4/6gVn/bAtaz2dytdvNQkNPQzEi1eR
         KJ1vTeL5wSX8wMJkHUrNB2uDIaD4LVcxIZ1D7OVRGudzTX6qPX4I8Pnihx7TY6G9gs2K
         yj4u4DHfb7ZVkZS0LemR7LfNMhynMHLYil9YIsnRFPzFo5/usB1LpGMPhb+jwerJwIBk
         zqFTppoT9BI3Qz2q7fEeWTnYDxr8eHrOxbhwyV4M3Ui4UKUawhy/7UkCMCGBFotUEzRz
         pfVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794008302; x=1794613102;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=N4DPvPiEv18XL9E0HU5NSnRDXM9pLl3JEb1r3sKAKNM=;
        b=fTHicTSmbHtU2KVPeTtzZkWM3NAHcx9ikRq/1vuB2/Bv9n21agIMhGlpWU0yk1HJrv
         pzHAqyuiHNx1OpOG82pPbc3dSxCv1QU2J5UTrcydHyRLtTJacf3XeY0gUDsJP0QpCETi
         EEM7VVAENK8py6pAnQmlAtywa35xYwyBTA9X5fuytXkeWjy5m90jCMtugj4lI+lcom5K
         xFXsBIBAU7teRk3kEsJ40+Dd8KNfpfO+Nd7Va2SMi8LTac2twWYv/yGC9au9Dl2ZzviX
         geQcr4dXCf0iEv4O879NbhsNKDySboqUTn1c+OC7YrQ+Dv+Hjmugt9YFYCDPukno1J+L
         lEnQ==
X-Forwarded-Encrypted: i=1; AL+hErG6SdZGk3mnehSBlpsB7ZpZzi9R9CtFn8Yo4eO3TpHHiSudhg6ZVNvPKv67N47ECaO3yBWtuWK/f7EWCHM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8vTq92vdMSRlt9zKMRrjvcX8/A5vXzWW/wBuzedPMZotpOp26S
	9ijTvArr2GlYEOMyGwxg7koN27W3vwfeUGGbMfPn4g23y6VVqZwlAXCt9WjUoFrRWvo5og2jrxt
	lLLZ5/mnArmnJdoKuqk8c2fIWrcSBdoxZ6Zxe
X-Gm-Gg: AYBFou2jUWAnFgGw0q2IqqS4NEK1ixSbWEXGy0sp+OxBzm7QkkEb8cc5FSUF6DV7/J/
	tX5uLb76ees8MHcgNyqdL/8akDsK5qtqM3zfM1MiiPQzEyG1nVwpvynUXwiSBxcbvoY88VT2TqL
	VgAvX5yt/Mi9V4Pv/fgJUwr+f34kcIl56lewYEDV+X+uW8/vfYLP907P/4pICcS8lRX+w5BI+PF
	aWn1W22ZSapJt/83QaB4XMRzovmfZDEQvL4LOxD7dTjQ0DgmJEBXru7QoApOIi8E6SzkDd/R2AR
	ezE33pX7+E5xl9BqoWE2p1YLYTNcKhuxocZ5wXVfy06o3gfLOAL+GRR3m8UbYBC2bRamzqhRjbz
	6z2ibq+5JFXADr061YwT0do2KoKbqCVZalx61SHw=
X-Received: by 2002:a17:90b:1c0f:b0:3a4:b8dd:1447 with SMTP id 98e67ed59e1d1-3b0db6f69aamr3787723a91.34.1794008301864;
        Fri, 06 Nov 2026 15:38:21 -0800 (PST)
Received: from c14-smtp-2023.dev.purestorage.com ([208.88.158.129])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1058d66absm412329a91.4.2026.11.06.15.38.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 15:38:21 -0800 (PST)
X-Relaying-Domain: everpuredata.com
Received: from irdv-tmenninger.dev.purestorage.com (irdv-tmenninger.dev.purestorage.com [10.32.149.15])
	by c14-smtp-2023.dev.purestorage.com (Postfix) with ESMTPS id 1C11634039C;
	Fri,  6 Nov 2026 15:38:21 -0800 (PST)
From: Tim Menninger <tmenninger@everpuredata.com>
To: trondmy@kernel.org,
	anna@kernel.org
Cc: cel@kernel.org,
	ebadger@everpuredata.com,
	jcurley@everpuredata.com,
	jlayton@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-nfs@vger.kernel.org,
	netdev@vger.kernel.org,
	slingappa@everpuredata.com
Subject: Re: [PATCH v2 1/2] SUNRPC: add request-scoped disconnects when cancelling tasks
Date: Fri,  6 Nov 2026 23:38:20 +0000
Message-ID: <20261106233820.2182993-1-tmenninger@everpuredata.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261105170653.3200815-1-tmenninger@everpuredata.com>
References: <20261105170653.3200815-1-tmenninger@everpuredata.com>
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

> Would retaining the request/connection-generation scope, while removing
> the additional unconditional lock acquisition from xprt_release(), be a
> reasonable direction?

I've posted v3 with the additional unconditional lock acquisition
removed:

    https://lore.kernel.org/all/20261106232844.2176820-1-tmenninger@everpuredata.com

There is still a broader question about when we should cancel I/O in the
first place. This series does not change those cancellation decisions. I
still think the narrower disconnect scope is useful independently of how
we resolve that broader question. Where cancellation does require a
disconnect, it should not also tear down unrelated transports or a
replacement connection generation that did not carry the affected
requests.

I posted v3 to put that narrower change forward for review, not to
suggest that the cancellation-policy question is settled.
