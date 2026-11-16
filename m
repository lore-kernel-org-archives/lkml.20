Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794827511;
	b=EQzyJFflvTRY1no1EIPuyOFQnvEQI4XIPtrmgFMmDy63/S7QWat7kQNtHP2gYgnIkzGe
	 5/89m8cENNRgvoTKZkSkBC6r2PG22/6+cSWCDC4MogJCKMiGsek3eUKraoU1IonyFBOKK
	 LGXwUwqVq7t7wzLDowqWJFkPAI/1U99qFkKynmiKlvmHZSUdp19mhlXgB8/6yynfBDc3I
	 AzQhy5wl9y9GuBWadisPEluDpwhqMbpQ2BRC6vZx+aw09Fqkm4NhPEdwJPogC3mGia/Oq
	 EK6djeX3I3ikzfL+dfag+o4MtB/SkzHky19ZuaK242gHQPjMR31HHuwgYQZ/GV1FnBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794827511;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=X92jc3HOiTUE60p5qYpnfogS3YHWVykNZQDGs9aRJi4=;
	b=sk7lxjwi5Khn21N2NnUerA/+NZsrzyLKcM1Pwvlxm753SmOdLbyXiLXmbneUtg12XRPk
	 qopk7T2ZTPtjKvuutnbBdkAAC0siun2C3GnTKE0o5EBGlTU9D77SnYf9tGX/qjv76Ng2o
	 cbTCGFrcFMO18fDDAqmPxXQrXUu1uarJ+J6nySwBPYxpXeZgTwwWz/38RrrUmQj0m/Mix
	 YqVMoZWNDVgQQKdXMusbKTwWT4p74vfwIPtivaBcCseYGryDN3lxd34kimV8S2myCAbvA
	 ViHOpquaz/CHu1xJBno/UwrjKlsXI+GQXtWLYos7e8eOKV1jA21Dj6MVDAATfwYnMsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XvhRGNuE;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC60606A8BD
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 11:11:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EC60606A8BD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XvhRGNuE
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3b08cf16decso1801286a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 03:11:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794827510; x=1795432310; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X92jc3HOiTUE60p5qYpnfogS3YHWVykNZQDGs9aRJi4=;
        b=XvhRGNuEpRT2Zo/9mCTTw+7gqHSe/jmEHLoj4sZ2Nz9qBgmisLHpN0Z2GLasVLDop6
         l9cqpBtTirK20HFfEsHPsQ0SdJUooUZQkCIcVO0AgQhsK/feqV5erCY+H0YXBGxVY9fd
         ZPxAEvAVFShC9ISFwdzjOWF9JQn9dB+AzWWFdGqnkvgFdwWqVK2U0D4JAe/5gE603gz6
         CkFYtKOfFRhytnd9ZJVbeaqJMpTL0mynNee74STyJ5CV61c04JuI8wos/H8vqboon/fT
         bSh6nirirpDg2yHS0Jsq4f20njD+hSODNZ4aq4jSdsOlLuUodhkT3XAl04EecEn5fnA8
         qLUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794827510; x=1795432310;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=X92jc3HOiTUE60p5qYpnfogS3YHWVykNZQDGs9aRJi4=;
        b=SD7wRqueUG+TzGkGwY14DRN5fL57TVDn+jVle/ieKzdEZ407SoT+rY5K/tGB64DwmG
         X6a1dzgom6M75ksZlO7q+VWDn3T/pkzF9YUTefiZntnqfmMjyxNEFVxfMEt9kPYeDo64
         iZ8vTNK+Mnjq77z7iynjIq3wmD2zwHFuRxfhxH2/9Qt9712iFe1ZXsv9Pb5g/UGqYEbD
         e2F2yGh4GjxPeJ0JRYpSXBc1H1MaaCmDQ+MP/SKiV+vZNbGqgj3hSEi/dtGaXbOh5sX1
         BiBbGzT77HVRo3sOKT28FPsVIDryhHKEbwk274SiRUq4j60a8JpgTL7ENkQihtL7BDfa
         E1IQ==
X-Forwarded-Encrypted: i=1; AL+hErEj820K5Y1/m+/GTlUODC0M5dmcPA9mCwrthdB7s4qxL/GBBvIQtsRN8WSYClC3Clm4Kb/TrreCeqDL8cY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9mjSMhxEJaH7ZIwObriRF93mQj6FmIJVll6aK0H+aPEmqz942b
	WtM/AuCAmH3kv9lWdVYqUiAhGEyhYM/KI3YcY7GMTx3TxfLQOTyw7+J6
X-Gm-Gg: AZFdTZe5hhOjRwIvwS5jyruYlanWKmJ2+tyaqI2DtrztFbt19dcXZhmoU9e0I4CsLR2
	cQZogGRl/J90cYFq1VCPXZJakmdXgrf3G2w3e+MwxfyAFTrN2zgc2gk7ritijKqM5DNYRD/r1Yq
	6jWp/hQqXQsYR9tC1V4GdJtbUem6PkwNKVhb6wZ4hacMN1S8cpixNmJCfkTXdhCUlusWTBG/I2m
	/LTQGuO7LnHV1c4FAajnCG4Cttrrk+ch3g8TOjMMHnXmqp9fyvEwovXtkdcW0q/ZNUFKHRpXqKJ
	GBxJMGl5OCC0wBD3IHNEgz93vQwYZb76vn26wlyvY7vfCqyIooM+FHTjLLF05fT8uNtKmFjwa/5
	JfXMXJ4i0+QXu0a5pUy4F+dXtPkZniJp9y1DIcXUAju1NtxeKoN6zQIBS8RAfRpVzqaibZikvHi
	bZfVbqS2N953CwH8RDUSCe6k9edX2cYqbBUIxACSE49gzWNnNbHmsDdR+IsnadAVs5nTAUlaYzm
	e4YFkZHO0kxi5IGOpmXYoSCq7ClkkTtCa1wW3L1ttSI+57YaeFclERE7ahzybZPQX+rgizR/rh3
	WiK7njP+1j3cK+DI76FtEwVSGa2FCKdpVsVsCzMs7WO9Y87durq8fX4raDR/TjHcoUC7
X-Received: by 2002:a17:90b:4cc6:b0:3ab:2737:3392 with SMTP id 98e67ed59e1d1-3b1b0ba9108mr10216941a91.53.1794827510403;
        Mon, 16 Nov 2026 03:11:50 -0800 (PST)
Received: from localhost.localdomain (vmi2317719.contaboserver.net. [84.247.152.64])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efcfd7e302sm1080965ad.13.2026.11.16.03.11.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 16 Nov 2026 03:11:49 -0800 (PST)
From: Lian Wang <lianux.mm@gmail.com>
To: Kairui Song <ryncsn@gmail.com>
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Chris Li <chrisl@kernel.org>,
	Nhat Pham <nphamcs@gmail.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Barry Song <baohua@kernel.org>,
	Youngjun Park <youngjun.park@lge.com>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Jihan LIN <linjh22s@gmail.com>,
	Kunwu Chan <kunwu.chan@linux.dev>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	linux-hardening@vger.kernel.org
Subject: Re: [RFC PATCH v4 10/18] mm/swap: add priority queue for swap device allocation
Date: Mon, 16 Nov 2026 19:11:23 +0800
Message-ID: <20261116111136.28790-1-lianux.mm@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <CAMgjq7BnyM76DR8cdaz4o5PEg0=4rBAcGvWwoHqFDfPpoqu4BQ@mail.gmail.com>
References: <cover.1794666741.git.lianux.mm@gmail.com> <62dce3641b589e9cd42edccf0d4e9b31e7d91e36.1794666741.git.lianux.mm@gmail.com> <CAMgjq7BnyM76DR8cdaz4o5PEg0=4rBAcGvWwoHqFDfPpoqu4BQ@mail.gmail.com>
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

Hi Kairui,

On Mon, 16 Nov 2026 11:51:22 +0800 Kairui Song <ryncsn@gmail.com> wrote:

> Hmm, this patch is now quite different from what I posted in the link
> above, e.g. there wasn't a "struct swap_queue_cursor", and some of the
> naming in it is quite confusing:
> e.g. "ring_only", I think what you actually want is "fallback_allowed"
> or "no_fallback".
> 
> And since there are three iterator-like structs, we better reorganize
> the naming; 'iterator' vs 'cursor' is confusing. e.g. maybe reame
> swap_ring_iterator to swap_queue_reader_head.
> 
> And why do we need a "cursor->valid"? I see a following commit dropped
> that, so perhaps accetable to keep it as intermediate step though.

Thanks for the review. You're right, this patch has changed quite a bit
from the original. I'll give the naming more thought.

I haven't explained the reasoning behind all the changes clearly enough,
especially with the adjustments following Sashiko's feedback on v3.
I'll go back over the changes and make the naming and intent clearer.

Thanks again for taking the time to go through this.

Best regards,
Lian Wang

