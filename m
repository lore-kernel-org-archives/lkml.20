Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B343D6CC5
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 22:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791497218; cv=pass; b=WAkOLKWCzhtS4uY9p1brp4J2sEZtgQBQTqwW6kxB1jFqtaKyrn/FX8pljRgmFgP/HUVdpX5VR/EthtRg9eP4NaHFjtsjw4AOmnXGFnkfwmN/H5b6JuJu+GW8EBwptMJidko8SqR+By3MlrQ8V6q0ZpfnOIaw7oc/Tf8iEQjOhZo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791497218; c=relaxed/simple;
	bh=Mm6Mq9jowhH0uQYJlH/2hj5A+8bxYxRNe0xd8Ii43Cs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DpDoq0AYHEDJ0VqhKcb4kZzZ44dhgw+LFixbau+qwBxjfzh03jspbSnEYZ0n4plHnJzylf2mCsUc5iUNhNh2RSpsdvdbxO5QajE8sBSDKOCYbpUt9GhqgAxTqBXIdWDt58NxgyqJnkx3rO64JtDFjxmxFqCVrh0sD1iVem2wnMM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f1vkKEqe; arc=pass smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f1vkKEqe"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1433e7b057fso4195766c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 15:06:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791497217; cv=none;
        d=google.com; s=arc-20260327;
        b=GMHjvSsAU4TF/mdIR5rnTDgM6fYpIjzDOSGuGnUZsp0n42tQNEqLkaS4o/PtHsGUds
         2f/spXt84Cu/ApS2WLgnyznF0bLAtL4y6axO2SljvuWys2PYJ28p6n7dBn7NhAduOk2l
         zfvwhv4SSTpJSgsxg1TXFdu4ZmWFxkpbC/VrEWRJZfWhFao5g0cNpVWu6h9MK73/J3ZB
         5DTJFPJ3EzYqd1gViD7JZeMQvlQIFs5/iaXgLbDFtUA2/sk2PxiDpPDEkHnJHXUmvjXs
         13eMt0D7B6n3G7Cp9SNjqVgmyVX25RKEd0qepUOmEumEuYNyMRg0iL4amOW93C0m3aJx
         O1aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Mm6Mq9jowhH0uQYJlH/2hj5A+8bxYxRNe0xd8Ii43Cs=;
        fh=CT44tvsqJfs38IpLEdUY6BVnWQ25OXNhxMRz4ko8/lc=;
        b=nyh83bYAXNkRZw8ssyMLkjAgw+16voySJSgpiqyRpAnBTvtOpa9kloKABSU7Qpb6fD
         UTTUb4oNhUXqYmgbE5pmrLiMciGLEczy0Tw4Vfi151OSSpMVrbQMp3hIeyz44tZuCm0p
         u94Tuzfl7SJH/9Mul/f1+xlmgO7DEnu+Bnlj/5ozTO5pR0SEkhCZ3dYbQUMZPqm9JZHn
         7ylCg3M6TWuu+Q8vAxLn0dOyWol6i7AvBfB2vwWeTiFWVtATGzG/nYlbTjOS2YgREr59
         eAO5qPI95M7RA+9UvBj/l6hjDwl3RZ4HZ8oryTJIjMxf7MQlK3i7ANXxpN1pu/iDjll/
         ZW+A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791497217; x=1792102017; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mm6Mq9jowhH0uQYJlH/2hj5A+8bxYxRNe0xd8Ii43Cs=;
        b=f1vkKEqet1+Rex5d2zo08YKGXcgamUj+Np1KqHjJ7UGhYY5vJUB08C+55i+THsyfaA
         6b/dTbqZN5yhbPuMDtZAd+k1r9ZxnAB7o0TGkW89nqziQ30QnJj0UQKLBmAkvLxRUW07
         rhmUHMHFNU4GLvn0ioeBc7j7MAe9IxYO2oPNh5a58kCjym5M2itxBvs6G+2Acq4WgGgb
         KSZY3QYTroABtUCBiUqYNazDEb3omGBdbiAi5THDwdNqriWcU+kVb2jFJf9T7hMEz3jT
         GZXVmlKInkwautUf76S0mxvBerrdVm+qUkjC+PL4m2bBP17icBlxN30qJt0uuQgV5PsU
         GWMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791497217; x=1792102017;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Mm6Mq9jowhH0uQYJlH/2hj5A+8bxYxRNe0xd8Ii43Cs=;
        b=LnlWzJm3pqSDSXSSshPbsvAmjLFG1grNSR8jSDU7Yq7vtLhv8TurXqncMK3UpAxysL
         PIlAw/Qg2noVJYPsqvkEi7D+yvqys3atD+WiNODQQSQy0i7FOCTEtdpJCVVeczplVxpv
         hvIo1tDwRRJQ1xXg507bWHm3Q3j3iJc+lMJ99Cz/GxtWgO8rrxvLtXOZA3G+v7dXrIS8
         qxopUGKHVa45A9GpM+W+vYmSxN3z4uXn2TXX2ogWE8aa2td/Zk4xGiZb6LrfmmUTY6n3
         ZIrLbF5AxdMVJMqBkra9zbJ4U2Kk599MSRdWrKdspLmWo+wgelX6uXn7fQGux1OxRWnc
         eSxQ==
X-Forwarded-Encrypted: i=1; AKwUvBxJf5xYKLEWYIl+iYBB57bKSPDKe6CXuOqzRddvURaPLMF3K2jzCDVyJqvxAtFD0iA6k96trkjb+W7CLPA=@vger.kernel.org
X-Gm-Message-State: AFuF++mNNCLCkO2D0TUQumO7W9CJLvRwrOl1LLRA5dvOBTPEGP1eDnNG
	713WK+C4rtTMh1RUPd67ci0PDaOS4/LY+89hJiFzpaFtmep8TrMZlcFG4hEKZXWOD1lmmBxtTPk
	NyJrvC+uYtX4Lh4k/bWxjJld2EvffvZQ=
X-Gm-Gg: AYBFou1GiznhGqiirtnWBFdbAXNR6JaGI47h+64KjaI1C2Q6wcFlIAo31DED9/jM1O3
	aBWj5djP9vzRYfXybQaUCXeobWaapdh0Aw5kanqlEvidtehyxtqQaaQIj/nSUaJ7RA5x/6kbNiU
	KSZLwV+g8K6U4qQ3xtu4W9D59bAqjizV32A/+TP9r3yTN4UaimZcNDSfFjXskKy6EsiEXkMhYaY
	m9K0CiOA0Ozz8fPlVdVPpDKvey69QBQLIhDu0KInGBFXhUa5Nc3mLybXhUcE/bnSS+LokSFSZxd
	5hZ4gSNz3UwwU/zQ5YueV/fWekgmuRimku9f/kzloWB4vDj6GgzghMfvymLbE7scfm2uWAUDb5h
	CKMQBoexaOXUA9e6MuSbzUkD4ljtMe2ZBUGS4qKyHlmDR99n6Fw==
X-Received: by 2002:a05:7022:3f0d:b0:143:3c9f:109e with SMTP id
 a92af1059eb24-16208be0009mr8318995c88.41.1791497216698; Thu, 08 Oct 2026
 15:06:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929134503.17249-1-qby140326@gmail.com> <20260929134503.17249-6-qby140326@gmail.com>
 <20260930015058.3076905-1-uselessfire@gmail.com> <CAObHBTwnv+kEaFdCp+cr31HtdSo3CaRq84T8vr-Pm75yZMTHqQ@mail.gmail.com>
 <CAObHBTxHQDfVH8Su1DLABtC5uUsAGBBk=KvcCOvtTs5gMGamnA@mail.gmail.com> <20261008-tm2307-tm2309-entry-uselessfire@gmail.com>
In-Reply-To: <20261008-tm2307-tm2309-entry-uselessfire@gmail.com>
From: =?UTF-8?Q?Milo=C5=A1_Vlku?= <vlku.milos.fun@gmail.com>
Date: Fri, 9 Oct 2026 00:06:44 +0200
X-Gm-Features: AclHuK_7edxLVp0ZmePKHkxTrJkoL11PIOzToLsoDZnlHxm62_q336927ucqfRY
Message-ID: <CAObHBTys45jfPro1PhNBgYVzM7mozMScE56k9Mt9mirmEuCCrA@mail.gmail.com>
Subject: Re: [PATCH v6 5/5] platform/x86: bitland-mifs-wmi: Add per-machine
 ops table
To: Anton Karasev <uselessfire@gmail.com>
Cc: qby140326@gmail.com, ilpo.jarvinen@linux.intel.com, hansg@kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
	W_Armin@gmx.de, ilya.gladyshev@linux.dev, kento@kekto.ru, 
	ericted8810@gmail.com, chris@miget.com, matias.civadda2342001@gmail.com, 
	btx342@gmail.com, wleizc7319@gmail.com, wolf109909@outlook.com, i@rsplwe.com, 
	bozhenpeng93@gmail.com, martiya.ar@gmail.com, aleksejirlik@gmail.com, 
	zsanya322@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi Anton,

Ran your questions on my TM2307 (kernel 7.2.9, for-next plus Chris's
GET-only change).

On battery the driver refuses balanced-performance and performance, like
you said. But if I write the mode straight to QFAN, both 3 and 4 stick on
battery without complaint. So same as your TM2309 - the firmware is fine
with it and these boards don't really need the capability check.

Fn+K only ever goes 1 -> 3 -> 2. I pressed it around twenty times while
watching QFAN and it never landed on 4. So I agree with your mapping:
performance should be Turbo (3), and full speed should be max-power so
nobody gets it by accident from the desktop slider.

You're right about the suspend problem too. My patch didn't handle a
stale 0 at all, so it would have broken suspend the same way it did on
the TM2426. Reading 0 as balanced makes sense. Thanks for catching that.

kb_mode reads back -EIO here on for-next, so your patch should hide it on
this board as well. I haven't built your patch yet though, so that's just
the precondition - happy to test it properly if another report helps.

Command 0x10 looks the same as yours: subcommand 1 reads SOH1 and 2 is
bit 0 of LONL at 0xA4. The only difference is that subcommand 3 compares
ADPW against 100 instead of 140. That looks like the most this board can
take over USB-C: ADPW reads 100 with the stock 100 W charger on either
port, still 100 with a 160 W one, and 0 on battery. The ports report USB
PD 2.0, so no EPR. My limit is off (LONL 0, AFBC 100), SOH1 100.

One more thing, since you use thermald: with int3400_thermal loaded,
thermald --adaptive sets the MMIO PL1 from the GDDV table here too (about
25/50/90 W), but the CPU still drew 27 W because the MSR PL1 stayed at
28 W. Restarting thermald puts it back to 28 W; profile changes don't.
With it opened after thermald starts, sustained load settles around 56 W
at 101 C, and balanced at 45 W. Does your MSR PL1 also read 28 W after
thermald starts?

Happy to do the joint TM2307/TM2309 entry with you once Chris's series is
out - either way round is fine. I'll put my Tested-by on Chris's thread
rather than here.

Thanks,
Milos
