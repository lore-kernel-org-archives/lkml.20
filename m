Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B5C55476F0
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 13:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790082448; cv=none; b=uhfe8nZCilB3D4PujG6LyzGA8geH2rRqrSDjsMijXYFBfVv2t3FuVmyZ0OUXwA2M1M76DAtHWIHOwLrod2RZRiG+xHNnGQjAOC4XPWQNroSobJuFlrK8atBonKP6tHbKz/DOmcOQExKzMycpqlqw7r8SHuN64wn7dGBV9d1ROxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790082448; c=relaxed/simple;
	bh=2w3z6ow+WxSS6tfmO9zAuGEfiXgTQeVHqmMTigZHSkk=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Bmo4ttPLVxmBvQjvteYTmElcOO+0Cfwm+nMdqehN+bHBjErqXYVs3iHLy9XQ4PP9d+54bnHLnU74E+gl8vyWjLZ0rVAdZaxtJPUx/ZgbiHy6TpKIOGBoMzEhS0voAauzzH7GpXWEOgRD+7qnZCgkApLqrnoZa+M2AkQ2rVqgwFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IlPr60kY; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IlPr60kY"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485ac898fa4so3591167f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 06:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790082445; x=1790687245; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2w3z6ow+WxSS6tfmO9zAuGEfiXgTQeVHqmMTigZHSkk=;
        b=IlPr60kYY90B+mgOP1P8ygnVvsR7/ubqvA2UnvMwIhLh+qWdT5RxdPaYud8oB8KSSP
         gNoYnfiZz2LIj/6nPt4EDwp3GrRSnoo2l16rx0lazMUfn8W56ijSHLE15jOEXIR/pNSf
         PblQNO7jCd+jhEWNDoZ94x1heUWAJgWF0cdYZBKnKuiHGSW7X7QDz3/YnPCueXte7/7J
         WediWXy7FiT4ZD1OlK2xuo9f80/c+Ks6+w+grfAEYNj3uNkhO5xZ+VtA2I7flZOmNKgj
         Jc2O/nRml5vzH+VdERbxe7uXTVf9G8eiOyzfjScUGKkU3dm2zDm76nSV/2vK1/5eXJ0/
         FgQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790082445; x=1790687245;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2w3z6ow+WxSS6tfmO9zAuGEfiXgTQeVHqmMTigZHSkk=;
        b=uuF7Kup6HBpi8STN8PnuzmViPMgKr3yP8K9uukLhZUJfCc3gS9U0MluloA1AQTsjWz
         ITSClG6pR9jHkiEXx5u1duT8DBwFpiMJDxs2DkVXcgyp4F4iI09Z5rESfG9XmQuDGNNn
         48cqlhBGda+IGmgh12R8io4L8MZPqowyYdVwdxZaxfdezkx5gRFmFnAcmNkko17JgAnr
         DReVBHzVtVemEyuvpa4Qd57NzqnwN61AkT5N8Jpa8LB2dGjjeHAVVvr3OlTkIniXnJ5H
         Tp5mCni5b9gUTeDI6dGH0h7t8KE2xyfhee+6goh6XW9G3QnSEuFwdDrnVem5UddEoSNC
         kcfA==
X-Forwarded-Encrypted: i=1; AKwUvBwahcf1hcGjSoG0xJL3EHP02lpFLNolrcEwIlg3QoLnfoSnfnsJm+LbpBjwTo9PQQ+topyLf17GXLWewhA=@vger.kernel.org
X-Gm-Message-State: AFuF++liw2KVB/dsR3LpA8Dm86qoL5ZkoTpp+i4mzdaGrZk48FV0/rnP
	sK/6JXkPjYgVZahp/AQjKDzFZzaiW7+9XHjlilHvmr7xygVUYF8C1gLo
X-Gm-Gg: AYBFou3znaH6KS8wwXlBugPM+Ox33b1KmhnnEULZGtRJmsnu0N1Aba9mO/uw5HtTp7F
	KdDB1S4eWdA9NA/b45L+gtTJ0/p+ec5NxhmO7GNEhgEjCRKRmmt8GUdfVa34KNuh7He20MtcPsb
	EeFrXGrSnQedaYHpWJtLqT3DsCV3ieUKrXGkj7Kyya7+Yd3LA9vxTeTit2fzptlCEGE4VYJulam
	6q69GtMHN3besTpkcwHzr2qs6BFYPiwWRKQrx4Fofvf0yBuBAGIb/tgH4Z5mcRfwSowb+8lqWWB
	EMdtOURPMGLTJUVjTYckF7lau/Se+2UH/EcLsiV8ldjNkD67qleXAozQkmURHrQPCT9KwRKA8DV
	OxmmUVh5qmH2Bjsx+nJ6X/ywHBZiNLav2UnoBvy3zxcNJrSU2X9Xls4vgtfzbAylfFjvZy5pKpH
	mELV3Vj5WbCKWCMT1za00GXEvCnIn4wQJopa/R12adjsXY8sGVTpqODwyei0v6/bkrtKyls7Klp
	f4=
X-Received: by 2002:a05:600c:5306:b0:49f:d778:be09 with SMTP id 5b1f17b1804b1-49fd778be18mr71329525e9.24.1790082444477;
        Tue, 22 Sep 2026 06:07:24 -0700 (PDT)
Received: from [192.168.1.220] ([176.74.141.242])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fdaaf97e2sm27886695e9.2.2026.09.22.06.07.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 06:07:23 -0700 (PDT)
Message-ID: <07e750dc-570b-4f69-9ec3-68de51416a06@gmail.com>
Date: Tue, 22 Sep 2026 15:07:22 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/1] dm-crypt: allow encryption sector size up to
 PAGE_SIZE
To: Itai Handler <itai.handler@gmail.com>, Alasdair Kergon <agk@redhat.com>,
 Mike Snitzer <snitzer@kernel.org>, Mikulas Patocka <mpatocka@redhat.com>,
 Benjamin Marzinski <bmarzins@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, dm-devel@lists.linux.dev,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Ondrej Kozina <okozina@redhat.com>
References: <20260922120330.127262-1-itai.handler@gmail.com>
Content-Language: en-US
From: Milan Broz <gmazyland@gmail.com>
Autocrypt: addr=gmazyland@gmail.com; keydata=
 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
In-Reply-To: <20260922120330.127262-1-itai.handler@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/22/26 2:03 PM, Itai Handler wrote:
...> Exercised on arm64 with a 64K page granule: plain dm-crypt with
> sector_size 65536 over NVMe, block level round trip, fio random

Could you please point me to at least one consumer-grade NVMe drive that
supports a 64k sector size?

Allowing a bigger sector size in dm-crypt means you can end up with
partial dm-crypt sector writes (after power fail), which opens another
can of worms.

Your dm-verity argument does not apply here; it is a read-only target.

Also, arguments based on cryptsetup/LUKS2 do not make much sense for
kernel code. They must be compatible and work together, but dm-crypt
can be used without any userspace validation, so all limits must be
checked in the kernel.

LUKS2 limits the sector size to 4k for multiplatform compatibility.

dm-crypt itself can support bigger sectors, but I just do not see much
use for it with common NVMe drives or other storage.

Milan

