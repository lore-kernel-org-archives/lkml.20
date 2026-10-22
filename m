Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.6
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792680147;
	b=qABligptP9r9gK/rqIjTG/8UaGkZK373BpWShHiQwD+ZMmR6x3rlMXQtCYp2o+K2IF1/
	 ki8You8fedSNZ0rQxOOBVdvk9DY+cu0V/2IZXOFAQJbnMViXUg8Vd2REnNbVmp51hKxev
	 stt4b8L7c24igC+EW0NKuWto9DpEIaB7C0xrGJDNV+cIesiBMyxIjI4XRB6+FF+bx8F5V
	 tfGYw5KDyhV9s/TQ7LjvaGJOLsxf0W4bJT2fw1A1Fn972z8fjzLFK1Im6G8Tuq8cpUsvl
	 e3n/vvFL9WK0ICfeZq27SLsR0OVDVDwD42Ynl8gzWHkbtNCc1kz3h7G+YJHObPPTkdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792680147;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Date:Message-ID:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=Y2wfDpQE4IPV/6hlJzWhRkXMd2sbxqFFifw6+/5xT4w=;
	b=K8xp7Gw3NbBXLWQKWmnoXoMR8+vp8QiTOc47UeQrGSzUQIxZ5XHGhWMh95TawVngmaI4
	 rH5Bb1GtQi/xHe0De6gKYo5QtdPPwuMg9w8rrSTlSdaFWxA6ck92Y9wTTmDePE7dy+kdf
	 NZF2x+LUXlXyNiMlOUsrZc30aR5cZM/seirOer4PSna6WhRRHdpXihGnRmloak+Ep0m0L
	 uSiYztZ8VuTXR68ARDxTRbi/3WF2q+K2y8TDsHtNuWXdltmJb9eLsXMkCUo/FegqBN7Pn
	 S81ytgHaNG4ts090Hs8Ejtd0xhTT+NdkJ0GLGwMCd9N1B2BR0CcMa60fWn4Atvziq2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="hjk5pv/O";
	arc=none smtp.remote-ip=74.125.229.6
Received: from mail-dy2-f6.google.com (mail-dy2-f6.google.com [74.125.229.6])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23DF6606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 14:42:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23DF6606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hjk5pv/O
Received: by mail-dy2-f6.google.com with SMTP id 5a478bee46e88-35adc681e1aso2786748eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 07:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792680146; x=1793284946; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:subject:message-id:date:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Y2wfDpQE4IPV/6hlJzWhRkXMd2sbxqFFifw6+/5xT4w=;
        b=hjk5pv/OP2Qj7q26tMEf68kbes0x0fH4qGzzS/ZULLDmOy0atAN4NxdBnjkHDVyBTP
         DRfKvQyUh9M2UQA3J2la0HvEd835j3vUW2acn3A3ed1EbEuRARD9x4QVJH+t0FNXqHUR
         DhrVEXvExtcgInnNQEKCT1kt7i3VV4BHKYL2mU2c0s4EkqfaFWq+BsS0dHmy4Xd5f1HL
         8Hacw8TItS05a8GJ55JSFtRbGvBmw3DNlL7e2okxXo19RdTCiNmeE2r+Cio5gKm8eWAF
         OSh2wNZ8jBR3Za08fHHA+12jLZ3luxnZuuXOm8NrNVN3Eki75wUNsEowVDy9amqFBVVb
         84mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792680146; x=1793284946;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:subject:message-id:date:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y2wfDpQE4IPV/6hlJzWhRkXMd2sbxqFFifw6+/5xT4w=;
        b=P0AQUU8zcYgKYaBHDu39DLicKTJ50zw3nFevqTqkFj2An8bZbTM0HC4Hi7NqHrIG1I
         aF6AYV1GqF1UWgrHPE4R3AUefPnOmQx+My+fyZVeZT4YOCIhsXeWPZvhvoICiPyb/ijj
         WkbyUnll6mEq40peTyXEjv0v1mpgcorg7aFnLKngienroQ0AbfsmPC0qrrJ0oTitwCjp
         rsVspSs5oTT1CLh05NqK1XfozOVEA2MExJxxV4PtFdiL95uJ7FOeU0yNGW8wowVnDput
         CcTADdobywzCj32168i92p5zLNHhuse3dG0HPIPTCSOwgONLPootmpuTDCqaxAg6w3SW
         EydA==
X-Forwarded-Encrypted: i=1; AKwUvBywLYTMCT4MeAdxlbs4JXxgEVYx1rBwPleTOuy+SxqyME7NS5vAGhCtL30GCCYDG7P0NT22TqsMuyWtv/s=@vger.kernel.org
X-Gm-Message-State: AFq9FYI1ie3RBPv7pLk5BaLjgPUP/BEaQWlBt/E6It6NoV2OfcTxtcH1
	G5lLpxfaDYpTmw1tEHDgOCn1U6jN5oiyzunmCCbDrdw4K0+AZyFAthZk
X-Gm-Gg: AYBFou33k3An3P3c+yLxDUUjvbmuxQnz/W5bMrbfJBsg+aXF2B111TRAwOFlEEH+Xdx
	5L6cneJBk/qoQe/77kkS+Woxxch5E7JXPgl5zZ0B9QMBoUYboZuf7MJx61zb8b7Uu/Sr0awHGwp
	kVnOerEgBf/C6BoUu2HqEOvNpYGgPwCDHqBkYP8YknykSuoysrzBuVJR/kiNEi4MioxQm5C8JmX
	ciU3ZKYmfMDOe+PTHAfFyI9QuaQZgeQZNkQ+JwNpoUcZRTPQsQV+3MLbhvlNSZ5fqOoCcS/8FLk
	PZInCk2Ai2nvUyxodH0jdlxxNPN2OW+Tn5rPxff56tnWSNUJWNcnmhHdeU+ttwB95TBYTiNDPA1
	lLX6HlFaDgp7d1yn5S8JkDyjvlCNbUV16EBY0skQ/wGDExmkwzAH9HUaamaGuk+lZoC43+tgmXL
	qSr2ZnT/x7P8o9aXh1Dds0I+70664JyTkUp+wHM7ng/MxDw8S1OG5gPvq5m7l966V5BQu0o9s0P
	9QfedImZgCeF9rDjnP8uzwiUwxm5hz8KVF+F0U5K7LNMFiXLtfi+NDhaIjtJ0Bo7dGQfLnkQ2yT
	8wO86+XwnVC/VSANXWQfS9iiJId46SMmoJxANoCv3Pk4xQ13qgA71lg0ZOfL6Dx7S7tudU+eig8
	=
X-Received: by 2002:a05:693c:638c:10b0:368:72f0:353a with SMTP id 5a478bee46e88-36872f035d6mr4190014eec.38.1792680145876;
        Thu, 22 Oct 2026 07:42:25 -0700 (PDT)
Received: from localhost (n106-71-19-159.sun21.vic.optusnet.com.au. [106.71.19.159])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3674198e2d6sm15218724eec.22.2026.10.22.07.42.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 07:42:25 -0700 (PDT)
From: Aveline Noir <jm5905938@gmail.com>
To: "Shubhang Kaushik (Ampere)" <sh@gentwo.org>, SJ Park <sj@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Fernand Sieber <sieberf@amazon.com>, Shakeel Butt <shakeel.butt@linux.dev>,
 SeongJae Park <sjpark@amazon.de>, Leonard Foerster <foersleo@amazon.de>,
 Shubhang Kaushik <shubhang@os.amperecomputing.com>,
 "Christoph Lameter (Ampere)" <cl@gentwo.org>
Cc: damon@lists.linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Date: Thu, 22 Oct 2026 22:41:50 +0800
Message-ID:
 <179267916870.2.6178717610514277514.damon-pte-review-draft@gmail.com>
Subject:
 Re: [PATCH] mm/damon: align MMU notifier range when clearing PTE young bit
In-Reply-To:
 <20261021-damon-align-pte-young-notifier-v1-1-d0365ac45b66@gentwo.org>
References:
 <20261021-damon-align-pte-young-notifier-v1-1-d0365ac45b66@gentwo.org>
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

Hi Shubhang,

> Align the address before both the primary PTE operation and the
> MMU notifier call so that they cover the same page.

Looks good to me. Tested in an x86-64 KVM guest.

Reviewed-by: Aveline Noir <jm5905938@gmail.com>
Tested-by: Aveline Noir <jm5905938@gmail.com>

The PMD path has the same issue. I will send a patch for that.

Thanks,
Aveline Noir
