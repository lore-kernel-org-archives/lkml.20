Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793381064;
	b=wwl6R5nH8JX9ZWGJvcbzpKsL2b/m37Bf1As2u66tOPfYvzBnPjRhufxZBv17m4Menpok
	 bVuaiqzSkRGaqO7i3ZJjZ7b3zjym6GjAR1Gb5YwwolXGCtG4zOHBj/EVliLdVC+e8Zf/M
	 rl6Ce9j2Spg6Fgegh/0xF3AG6E7jRFV1OqxRfzfWLZsalzxk4w9McTfy8NAM37gxOLF3A
	 G3q/BRPrI8lcVfw0hbXol4SK8w2rxgXfCoEcOZPriJ4i+ZZl0IxMQ94Uh3RRcfZ8Me2pR
	 al7zXH84M7+8g/2pK0Ydi5PBzEkalfe5Wb86Px5E4Dquu/Rr02vdGlq2XIka+hqcojQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793381064;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=Mg6aSAW2nZlqKBjxYch0/lj+ItuvCiiIEV6k8koKlxI=;
	b=qn+RZpL5wsNZORCqPW4XyVipr9ge+IAemku3x+c/tTIMZPkfLd1bA1s8BzxOhp/2bQJb
	 orDinvikkySwoybSB+iTSEDZ8ZMtQoeVVwK20/U95DuqNaqaXeJQOM1shIHAHZrzszuDO
	 wNbcmaeX+wr7d0KjCb9jx7JHWhhVIIPCuZejO6XRQW6ooU/4GxU//is+x6RdI8mqKWhhl
	 g0GnMU2e4TqeQXZgT7Jd2VXx+8W0Cqg8PcJ5WLNdg/meHQ1qiac0JzHOTjBzS529zII2d
	 53WfOBpQ+fM1i44z9UI9ZQ5sgz4Evb3PDQKvOwFK8UJ/Qybr+4l51ha2xAH9XwcR9AQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q6QALrR2;
	arc=none smtp.remote-ip=209.85.222.51
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F0D606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 17:24:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5F0D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q6QALrR2
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-990835cec4bso676626241.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793381063; x=1793985863; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Mg6aSAW2nZlqKBjxYch0/lj+ItuvCiiIEV6k8koKlxI=;
        b=q6QALrR26xp1pZTmOjBiJQd/a5Lm6Yd5RIj414nvPbtFArwCkl4wUob15cgpXIyDRf
         9EknwI24ica7HnQO7BghZtSGSkaBZSJK+p7X6WBqw+bXQBoL1bBhv89fPR60Z4/Qi96a
         +bF5Lf+BMQWaAoXCHEmXvOz4vGc2+/sEcaiPbRTqIDMSsaSjAve7hszrtyf+0nKKSCxR
         NsIdPQLVMrvEd2eJ7LTgiSWGdBVliDx5BOsaMRKna+p/UhIzXUWRVFO/PTaJDZP829Mr
         vadxyEYXk3wGsiQp/pO/2kwKVC8NZFm19NaGDhhcrcJaWtLeYFS5MSIc09y0Z5y31+HL
         vFug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793381063; x=1793985863;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mg6aSAW2nZlqKBjxYch0/lj+ItuvCiiIEV6k8koKlxI=;
        b=xW1eA3LGsYGVHBwkx9BTLIBmjwUVed6550LP18y1+OsrxaeVbXxKzDFWqaj+JL4PAn
         T0LuNoJdgVazV+OitcMkRF20SBCULMaRPpzat6cAdpq+fxK/lkRvLLF707NgVKyVZYIr
         2RilKSEGxTlETzm30SUdnV/nZZeuiNNgLTosG7HlMHMxsNvcZyBHkVQbJdFRQhAd0DEl
         BL4V11yujB+egbwo+A81Oey6WLVxcxfODn+8iqfIYf7q3SuSFFdth5cgeROBmMeV9LNZ
         +IW/PfO0v4Gller0y7Q/f49bri0cPms5+fMfREl8IwHfsQp9ugf4NQkqMdIoV6TxLf8T
         wZJg==
X-Forwarded-Encrypted: i=1; AKwUvByzAXCh35cdhsQU5H+jyvd7nVa75cbluQvSinGW/WD0CVFLWdM1M8+EbeybBKp3U0mzedfV9OsjDxkdKQE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJd9Tc9uNW01wX2dtIAnF9xuWM65La9tnP9cJY8pmeQ8llhyzA6
	m+GOMKP82WBGBe5GnMJtfKOhQKCdOY01VJD5/cxfcjSECupTB9B+bXgv
X-Gm-Gg: AYBFou2BSL2Y+yeXmFp5z1C1H/S426eVQY9lSg02DRiO/pFTA8GoNpPsQL41agnlqhV
	ImhxCXO6ZCKGKs6ZmWEC28t1q1j0Fi0500XdO3JNa/Pdt/nLnZVKN/s0hTwmmn9anHSrmVxyz5D
	k3jefW5DyBkV8Sm04EqFeMAFZ3Jx0bt2TMPIePHavyHm71CKgNNVxl5oIx70gDy1u/j/UXrw03t
	qfl/MWyURVk9cCEMYw2JEiWhtCOEHyLo3cGzodo8m2ThCmcfsdbS8bgONA+UGsmr4Avl0nDcr63
	XOdCY/UNCOJczOhcu+qqtzWdBpZQOAmZNbaSSb9WgVG3qGM9jkyqOBtogLSPc16gQs4BMT3Gd9X
	c649qZRE5ds/wWJNsEbIyS6rCpmzJa/C2WEB2ZqssSSRAA+gkjuWsI5DrccOdxIblbkwg01JT1L
	knzah1MAnF0Xanufd0S6JTJf4bPs9QVwtVUWkNlKVOuTDyd95YJtbSw5iS4rvDPQdlUiP3bC30M
	dBBt4Ud2zFCUCTKeWYVSqtsNdicpqGOeavwX99zOUQWAkJCh6A4eK4KC1gPiSGPB4RSKbNkFNZQ
	HA0bk6j96NvvdqQi2tYyNtNbY5KvFg8VPe0mpkfgQqS7RSVz0v32AX/URG/s6kpqi11URTd+Csz
	l1lwmSSbl144OPEOH/RzJs5eeLEnkvD8Cwjp945e3Qud2sL6AG/wdWaumspTZj23o1dQU72Wz/8
	WIukM6BjrJcE84q3rcJA==
X-Received: by 2002:a05:6102:c01:b0:7d0:5688:f507 with SMTP id ada2fe7eead31-7d072c596c4mr1583521137.20.1793381062741;
        Fri, 30 Oct 2026 10:24:22 -0700 (PDT)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([2804:18:15f:b9ba:756b:b70a:a34a:8232])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d077393404sm2868377137.2.2026.10.30.10.24.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 10:24:22 -0700 (PDT)
From: Joas Antonio dos Santos <joasantonio108@gmail.com>
To: Tung Quang Nguyen <tung.quang.nguyen@est.tech>
Cc: David S. Miller <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Jon Maloy <jmaloy@redhat.com>,
 netdev@vger.kernel.org, tipc-discussion@lists.sourceforge.net,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v4] tipc: raise the minimum bearer MTU to fit tunnel
 and crypto overhead
Date: Fri, 30 Oct 2026 14:24:15 -0300
Message-ID: <179338105585.65961.17235832504055289741@gmail.com>
In-Reply-To: <AM7P189MB1137B1760C380E81E5A3CD8AC66D2@AM7P189MB1137.EURP189.PROD.OUTLOOK.COM>
References: <179322942644.17111.4355153262478871713@gmail.com> <AM7P189MB1137B1760C380E81E5A3CD8AC66D2@AM7P189MB1137.EURP189.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Tung,

The only items in that checkpatch run are about the Assisted-by trailer:

  WARNING: Non-standard signature: Assisted-by:
  ERROR: Unrecognized email address: 'Claude:claude-opus-5-5'

That line is there on purpose: it discloses that an AI coding
assistant was used, in the "Assisted-by: AGENT:MODEL" form.  checkpatch
does not know the tag yet and parses its value as an email address.
There is nothing reported against the code or the rest of the commit
message.

Thanks,
Joas
