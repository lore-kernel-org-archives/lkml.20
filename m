Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB88D4E5323
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 12:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789732924; cv=pass; b=Ms72CUVjNh3KRsoNYaFpjf6R1ebGWQDais5qxuxrcfqnGE0ji4g6ceKX5JJkkOpr2ZpCt3By0T+o1zjMaOQ2RXvTRn3VI7y0w9jFVU8QQkc3myauPVmhKQE4G0l42cgzNoF7+Wm+GgSkgHHcKTbncM1SDVd+4CN23oQi0HXQn5Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789732924; c=relaxed/simple;
	bh=6ayaWbsmcz83d0RD1dqGD3+lcx2KhLYJ1JU2hHA60YM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FVVF4wiwCqQ8t1U/OCWcy0qxFjn3OzgpXhHjirwUKIQuf8JO3YOIyMJUYmMaepYx1XjRFP4tZbR1G8rHrXEPXJnI7eJ0+79V0vIKf3CmAlBNRNSc43ltRmPUP0mgFABKnDZ4s2ck3CO/7lqB+T1ziGlynRE2xftI2Ep1Q7w5lSk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HU1DyoUA; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HU1DyoUA"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-52fb76543e2so2764551cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 05:02:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789732922; cv=none;
        d=google.com; s=arc-20260327;
        b=m+n+O0YZR5n3m618h8MqOv2sifH3SuIeXjaqwGskCrnUHWRcQT5j1sdQYL+k7D4+q2
         UhcKng4A3L2ppP5pf34MCE4dGkh89xSJtzNzhGXuyGFr4HwFe5xBTUaw37GAsE0u9oXY
         YbwCJlyMbYMrFkcl+OX/qh4HyUie11ePKaO51l475vCxRZv2n08chJGtjeTiHbxkZGrc
         422NCFU/lEV3R1SMdiCbeNGVQdo3GuSdWPDDx+8YP0EnspAVfmuPxbQq3b9CCsz2h1Tg
         plDb2H+SkfDd6EsfJ6Ae7OpPz3Y4HNXmhRgwNEUOyoxtagn2uZLCmexgmmpkjwZ6qWiA
         luuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=6ayaWbsmcz83d0RD1dqGD3+lcx2KhLYJ1JU2hHA60YM=;
        fh=A3fqwXrUZ2EBclcB8WurPqIsJfyoKX2HvQe5PshYCak=;
        b=ArJXuK1HMvlTogs92SYOJRyl8l9HUO5KPeqGhLkx2nT7LK6BqmyJgbOfBDzj1uJx+X
         5cggq5KArrOr8BLtmLuxBGJ8+6QH+68H5uhy+iEPCJ+AaVlPfawOXHG9i97xg8O7ufsv
         v2yRYgG8YUyXRZSTnWnqakgd06P0dgr4yesVkcZPauLVbbTUvKzLSAer1ZUtVecAIrUz
         YQ8U2qv7fE7Us/NjMi15kKh0s6TQ9idrLPoXwKDoKcs/w+xo5qjfjxgCk79YxkpxnJwS
         8l2XIwJSmQXU6PHgJHpP4e9+8RKTvCJlKiEyAGLafUry2epbJEIs28bup2H2Ttd8u52T
         /KVg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789732922; x=1790337722; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6ayaWbsmcz83d0RD1dqGD3+lcx2KhLYJ1JU2hHA60YM=;
        b=HU1DyoUA7W3ZObi2Xqt9/2fae8wZ7EEnYH+PQWyTnRYjXhp7IW+ZNKKpYuiJr76b5D
         PyeFLJ/g829YoI4RD6A8FdQ3piPTlDr9QFaLLbQ35IWhcQDEzZ34hz+nsXvtOT0IvcKV
         3JEPAt+XZ/5oCvDsLOLywp9dZ3t4L1Swq3smkgbSH3rOth1rjI2GaS2JNNUjpVBYYrX7
         /4Vm8Z6QrcMGGPftPU5CYO6YBqW3+pf1ZjasctfHTjleDSZh5UrOaDecldkPuTVHVOr4
         gVKVQ6kCf9mLp/l0mZBffjR1Q0SqfsUT2Y1qjsHzQ9IByQN3wUYVCp4QHr3p4nBtQaAv
         b/iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789732922; x=1790337722;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6ayaWbsmcz83d0RD1dqGD3+lcx2KhLYJ1JU2hHA60YM=;
        b=oJFJsVbQQ281vsEulXFFBBipA49i5aJiVKkwQrQqRZCRfXXOeragSvgjYqHhGZAGJi
         Lv491idNX0R+LFhbsL1YZ/J9nWATzLgDmjn95apuQC4cQfdMJi/cAIGvyR9qK2ATzsaS
         Zs2SfTCUY/VSg899aOSOR01J96SeBeWkI9dpgnzqt2JiW5oDbO3wN0iF+6fFfEMqPUNy
         Ua1364wmxf2CD2nXdGenAKUsEU7FaHgbbDEegdrDOWw/sl2iPZpSS75X22oSocgWqIAf
         wsiybYzwbNjPZWxRL2rSPFTkJzV7bmRkjfkmDtQbf/83thmryZ9VaDA3mXZLfydrEEpM
         HD6A==
X-Forwarded-Encrypted: i=1; AKwUvBzCkhV4rWykiiWnABBvBxLqRjUMhp9KX7MR20Th5PIWpv+9l8IPND+//jTmbAjFUsTxVfAo6Kgqnl3dJng=@vger.kernel.org
X-Gm-Message-State: AFuF++k6nzckMwSBTIzq2TbRmB1apSmv0e1I3i9I9rvXlihVxyZqmuQH
	NQlmkzIZWLYTF26vyb13brcObzV/XhFEad9Yu0Vh/mkhC+xDhgxK+vUaSIGouabLrq/SjghmG/D
	TLVQQUO7mc/GPJr9kbEHne2t64MR9zGQ=
X-Gm-Gg: AYBFou0YXSZ1jCXAACOELyDxcEB/K1yBQvWadkeXPqshtA6ZFGpJmBFutrnPsPOLfyo
	Y5i4InWQ8B2Anc24ZIPES6/8DZo5GjCxYk4gtMmTLZ7o2E2HZQEV7EcbYVA41Ei//RUfYUw0mMM
	8eD5L9geX2u4l6WmbX5wHmN1sxfCl+dPkJjPDWB1DADbmAPEjScRPRKy2feu/Hqg+cVdQHKq9/O
	gfSegELMxQ0Xfex275X4KNADZIq3KFsLcLx65ysduYgExKVwV/ADr7yNhegStgHSYQM7nvvBcIR
	qoicHH8+tFcsdpqLKDbnaHx5EUQgBscEIUC0Xwjw7YHNtebAZ+DSIe4n3Xq11I3YMVE5LHblE4F
	0uYg33z9Vy0HP943IVCDPFQ==
X-Received: by 2002:a05:622a:244b:b0:530:ea8c:1b6c with SMTP id
 d75a77b69052e-5329e976b4amr30710831cf.29.1789732921860; Fri, 18 Sep 2026
 05:02:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917080905.7654-1-palaomer100@gmail.com> <20260918-inescapable-crafty-cat-b03a46@quoll>
In-Reply-To: <20260918-inescapable-crafty-cat-b03a46@quoll>
From: =?UTF-8?Q?=C3=96mer_PALA?= <palaomer100@gmail.com>
Date: Fri, 18 Sep 2026 15:01:33 +0300
X-Gm-Features: AcwNN1UohY9u8D1FB3Y5bUT2HvOqBkA66e9QPA1W3DSDZ76z-GyXly1_UBbtjCo
Message-ID: <CAKhZXnqGPPFFKttTCxswx2cpSJctJxAduRLZ77NEVLTk8T3xWA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: iio: accel: add adi,adis16203 support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: nuno.sa@analog.com, Michael.Hennerich@analog.com, jic23@kernel.org, 
	dlechner@baylibre.com, andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux@analog.com, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Krzysztof Kozlowski <krzk@kernel.org> wrote:
> Bindings are not for drivers, but nevertheless you clearly did not read
> the discussions I linked in your previous post.
>
> That's staging stuff. Are you again fixing some issues only because
> checkpatch told so?
>
> Best regards,
> Krzysztof

Hi Krzysztof,

You are completely right, and I apologize for missing this. I will
drop this patch since the driver is still under staging.

Thank you for your guidance and patience.

Best regards,
Omer PALA
