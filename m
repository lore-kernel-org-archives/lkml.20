Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 013FF2BEC23
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 07:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789630255; cv=pass; b=Ry2suGQvVEqU3tvgHrY0/1hjAtYajZneZ0EAEz0+2EjrYGP5PcJKkEWEQiNftyjNCse+ElKilUTfqEcCd4lqGTFlRuizA8LBmgzzlY4UqCuGVo7JUFoqu4hL7zEYmN/9q06xcPQ2pA46AIzf44WoMdyc6Q60qX/ax9hlk9hKb9Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789630255; c=relaxed/simple;
	bh=t8ItZmTqSLECprYaxWqsWjLGwssGonbSk9ASbhpQUek=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MMWNAF7blpxqH9bVpJNFJL9Z9LWFPTVFKNziTgBOMomFTmigduti0+V0Wfvs96yiKdalsgK1uiHYV/JSSPs2p3ngFVgVozQCgy+v2cwzTh8mQRTkF3ts4l9ABX6tVXZbU8D+cg1aEFZfo7BOzhIpVSFkbOkaUpsMnOqBDyBvWHI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=khu.ac.kr; spf=pass smtp.mailfrom=khu.ac.kr; dkim=pass (1024-bit key) header.d=khu.ac.kr header.i=@khu.ac.kr header.b=OxSN03mf; arc=pass smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=khu.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=khu.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=khu.ac.kr header.i=@khu.ac.kr header.b="OxSN03mf"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b5e4f1e023so180345e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 00:30:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789630251; cv=none;
        d=google.com; s=arc-20260327;
        b=N+cSVpDNhAsFz9/O61KyT92CxEvDliYj3ZWx14wz1YUy2y/TFTs+wBJcPelnZYk6gJ
         WtctrphlQbXIxv6GhJw0ZDbX0Y1uuxGiw1W+4UhCLBN0InExQ/HEWafEmQmyjrkHnw3h
         4x/zXYSoRkDmllMaFtQjdRgT50uB4/hY/tO0hqA289EvwguA0mAbcQXHVHUiqR1JlLBh
         5lXCQtsbxFWdyLvoqqL+qu77SeTH9NHjI1yb8w3VM+3P3vbCBFv8hhljmK/g4GaPrS9A
         uAsGSlyRqpK845SQ+j8d5Yr+ARiDQn6QHXjlsV5HFuiWZQnT9ZapAqFRfjWg6H5j271U
         0gCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=t8ItZmTqSLECprYaxWqsWjLGwssGonbSk9ASbhpQUek=;
        fh=BlmySEk47iFi1+2WabxTJuewncrJuIBMXqXzEa0ZKmQ=;
        b=sal9+jmYzknH4MZFp+4Jok5woQkOdpiXtIDvr162vPeHFN19ZDJbiGTPV62iJ+A5cA
         o00SE9rG3akGSc+8A6uL6da69EqjHZS6LTgEeZ4sCABQFOQCjVHnzZjp7dXSCCxw8wt/
         nG5RCXZoAa2gs7dFZ7TXmIxnM31heyH+5D/uMV8Seu+IUx91klvGGUbpEEAHxs1JWaam
         O1JPJCDD2BC3G2YM0PGNJuqnnYaAggAi1+Ml3kZIXthrv0ASehhSAUIWt/9ON1whow6E
         sG73S0mh/p8UTLePcN8z6EJwbG8bVwuTeLXckaAEbNq/He3VW60tLaMk++hzeFR4NHm9
         nfuA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=khu.ac.kr; s=google; t=1789630251; x=1790235051; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t8ItZmTqSLECprYaxWqsWjLGwssGonbSk9ASbhpQUek=;
        b=OxSN03mfy+BV+dKcS0K3CeZx/hIXsY2B7LfXaWWRDwS02cXMQLWBe6nMvtUGIzJBAw
         9AZpbIdRELdJw+cmk80USygid4O5K6ONahjsFbafhTRUOIpH2hmk9zaJVFwskYPr8zH+
         a1pJCHAzbhAMAqJPAI1s3FSLl7+nnJWU1DhGc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789630251; x=1790235051;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=t8ItZmTqSLECprYaxWqsWjLGwssGonbSk9ASbhpQUek=;
        b=UGQ2RGJbNXE6wn6A1GoiOXXB6V8hZpsGlpNGRpj0Z4Il/hnKEW83mj0qJdKy1sjXg0
         88sRJs6bh7hiqCrSSJDyuBd7S0uo4+1GFF2q6vJ5B7Jvy5LExKbInJnG5zjHRJY+uIlJ
         P2AS1ab5Sy0f3Aa9/ugrW2PtQJnsd5140gxfzeyh1du74MF7wX+bhespTZcr/HtJdHE/
         S+u/tKdnpufNb9zrYLxqd62FRwBnp7dyY9w7Um6KTWKGygcTiY2L9Jn+stwxYna3gr87
         JwtrRQ7plPL7+5O1aloox9WHvE2XclyLRIkdUsxDPbwwHdftNQvq9Hxj8RWs21taHJav
         hiQA==
X-Forwarded-Encrypted: i=1; AKwUvBy6fK/7MmPdurjducR6aaFjsGcomxDogXTwj1Hl7SNjD7GAeaO/CWQhW7dlujgWkCF/FQFj4FwzBln1U2c=@vger.kernel.org
X-Gm-Message-State: AFuF++mVgzDvzYGMSGkJMfCWxKDL6WhfroT1STTOqYm/1u42A2s0BYq3
	sKQfv6uPwG7fU9JwPvo61kd0jbwHOUkP3g+YVKPDDAPBeI0LZMmMVeYeeG3M2DR2kc0BG0oIVP2
	dTv54JajFZdWMkXA9LMwvieXWCjJ3M0XZNFM5drmS0X2L5Z+spgk2d8wpKw==
X-Gm-Gg: AYBFou1wKcUHouLX9EFDl/Lr47/6Jo6/aT0P3LdR7pLghq1T9xIOcGL3SF6BpNZayEK
	Gf7yHGpz/u6sxhCPGjOFwjsRTngkoDL1b/x0fQy1cKUuabj24mZIeZotR+mgBfodTZyriVbGf/i
	MK7OJyZ55whrmFlFKQ6j5SgriFHgKBAEhhDi1qIbp3PBv5tJW4M7Q+yKuHXooDDuvuWNI4eTWNW
	AbrYt84ji/gGJzOyRGQj+OwI7npnE2wER6EffUBYL1JmPPIRDRo1c2bqSHQG6qyea8znf/DCHiS
	hm4U4ZjyXkM+hrsVA9nWgnYcUEQE2uvD6Qbxgrf/t0pBlGHgiW/pxvXsEeCKRXaxrg==
X-Received: by 2002:ac2:5282:0:b0:5b8:b419:b89 with SMTP id
 2adb3069b0e04-5b8ba5f11aamr486023e87.16.1789630250975; Thu, 17 Sep 2026
 00:30:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260913-codex-rtw-rx-v2-v2-0-f09c964e0b96@khu.ac.kr>
 <20260913-codex-rtw-rx-v2-v2-4-f09c964e0b96@khu.ac.kr> <0f0a4af91524425982d37b32ac8326d4@realtek.com>
In-Reply-To: <0f0a4af91524425982d37b32ac8326d4@realtek.com>
From: =?UTF-8?B?4oCN6rmA7Jqw7ISdW+2VmeyDnV0o7KCE7J6Q7KCV67O064yA7ZWZIOyghOyekOqzte2VmeqzvA==?=
	=?UTF-8?B?KQ==?= <5mghybrid@khu.ac.kr>
Date: Thu, 17 Sep 2026 16:30:37 +0900
X-Gm-Features: AcwNN1VXCiXPDOFzekvIqwLj-GP089oEzBglJCf8-OL0LXoLtZEOcEn6ywKSXBM
Message-ID: <CAH1Bc_yh5vM5jj-AUQdw5G9afgE0-kBHLr-+Obcj5Am2S_WLhQ@mail.gmail.com>
Subject: Re: [PATCH rtw-next v2 4/4] wifi: rtl8xxxu: test RX ownership and
 recovery across failures
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, Jes Sorensen <Jes.Sorensen@gmail.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Ping-Ke,

Thanks for the comments.

For v3, I'll leave the KUnit patch and its test-only hooks out of this
series and keep the driver fixes focused.

I'll validate the revised code with targeted fault injection on hardware,
including startup failures, RX recovery, mixed normal/error traffic and
shutdown. Separating the regression-test infrastructure from the
functional fixes should make the driver changes easier to review while
still directly exercising the affected failure paths.

I'll report the validation coverage and any paths I could not exercise
in the v3 cover letter.

Thanks,
Wooseok
