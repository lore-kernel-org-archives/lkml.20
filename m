Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25ACA4349A7
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 07:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789630300; cv=pass; b=qhB9nfqlxJ7Ykro3u1mAZm3aRFLhAIpC+7LhMJnbl0LREOXw9jCClarfddH+SgBR7jruM9PjIAPG987NOEZH6HCQqXS9jhv8iZ3IqRZR+9jXONAzKmiSB1XUo1IdiqwbxJdUPd7DaEITC7vShZ1H7dvOwASIAbMnyLKtC2W7OOI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789630300; c=relaxed/simple;
	bh=ae5tnOSxy7PX01fMqSfgZugTF/eY5ZCZKg3uruhZrKQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZQgfidnO4gxGkyVcQPI3f5JtIJVx5h0MEOv/hG17K5cpWI6uO7+JoXdSE8psOQOaQoiP+437johUdxtsOSRNQsI9TFnIjx8jZUaOG2m6Ng83zh3DD7YExM3/VHXWGlcuyOaVivj1TSPDEvHmHGUW5njS2rDfrHFjnfZ/WvUIJ1w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=khu.ac.kr; spf=pass smtp.mailfrom=khu.ac.kr; dkim=pass (1024-bit key) header.d=khu.ac.kr header.i=@khu.ac.kr header.b=J1XJKIZH; arc=pass smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=khu.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=khu.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=khu.ac.kr header.i=@khu.ac.kr header.b="J1XJKIZH"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f1b846so553261e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 00:31:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789630297; cv=none;
        d=google.com; s=arc-20260327;
        b=XhLD5tQIzwmMaSfSzVbvyFMDORr0JYes/zYcwNoFzcHzYbvM0AN+jrpz+tmQNHd1iU
         A1MGriFl8/lJG8rl12BTDZ1OHlOLsz91RoXQ6YrIFnLg+2zb1tIMJXAqB2CSprdpmxhn
         li+7bLfwKQLEVqsoDgvU43y1O4RqdLuhRJC8G42NH5FHpgEqPqsAobPkMREgN3cIpvoR
         qtD64msGKFvS6zCTVIWqYFbltw0mNJfrAKoyOkrXlFuiHXCXHiPvFah5qdNqPNtAr+H4
         NRGqzbibRTaSopEuN4PvIMpmv2bAZqtbT5SiPgfqacTboyuj4ABjp8sDxR7pxBagPq7m
         H12w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ae5tnOSxy7PX01fMqSfgZugTF/eY5ZCZKg3uruhZrKQ=;
        fh=jiBolb6A7EQfLO8jfKNyey+o3FV7QBNeg2LQqBK0bHI=;
        b=pgCYXD3MT5Yf1O05mTK7vXGIpcvCtmY/KdoBA+IDP/+2dzCKzeMjyZ+3uGueSBOwSj
         co5DzrzPCcouV9Gcm6X1agUbPHnC79bC3ZO9wtd16sk3AG7f3sYUTqypjblEkrwlEjRN
         hNx7BnET4xv3SkrCAOcNqaBQ7pD6Pd92EsJkmAFVIxcP8Hc4CnOSlGIJDrHo3U0Kqtqa
         CGB4uTELeNZn1UWPbFTVsIzxrVci3nytAb2cbtg2JMYwvmkaX7p+of7c/cVSjv5utaVj
         AgkvM4OF0+d5IeFJCExJJBozVC2b0Ve2qMqVsIVARX6CteXJQFp8RoEl3FrH8rpoyUXA
         tykg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=khu.ac.kr; s=google; t=1789630297; x=1790235097; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ae5tnOSxy7PX01fMqSfgZugTF/eY5ZCZKg3uruhZrKQ=;
        b=J1XJKIZHnR9GF1vsxtPxybFLmQeriTroIhrV6ObXesABxVVsDttd63+umIx0T3VJoW
         j0g7+LK6RXGOVZybUBvOTrbdrJQOwcQCnWs8IYgnoTZolnIdY2emZRQcJ58ioHNuz2mA
         kwBdzGFqwBCbkjC0ABTdXoUtYU3S3PW5ckJ8g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789630297; x=1790235097;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ae5tnOSxy7PX01fMqSfgZugTF/eY5ZCZKg3uruhZrKQ=;
        b=TqMUFxxeYC+EZLjxz4DLE9GNRbW5SiRsXCVuoH95dF8aCCJ011115VyMfBC8oHdkYN
         nycvvpukqNmB/xKUI7atbWkdY6BXa35zi9CHOXdOyIbaL4PFQotnvJEQ8SkmwNS9k4Ch
         vimT2EdKcac5pIfDQ/DzpXKG59nqZqzN6wzIIMaV8d/NSJsB5TNEjbFOMRuItFrox1b8
         lSjnfY2bcZ5enw9zxczJc5vieRVMifEsnbP74MqCs4lRnYXW6OuDWdlNfuFVK63QuwiE
         iCpBsiYrgDUImrNErIJ34LQfmM8T+68xoFqJQrQJiVxziRNKjJQqqLl3Ys6uEr8GcyIR
         KwQw==
X-Forwarded-Encrypted: i=1; AKwUvBzpFU9p8TnRX4i3DLcpswhRFws6XdqI1ti1JHy3LXmrZApzVHmBPqNU2M5T4YRBshs9lH0q0WE1rEb/LEM=@vger.kernel.org
X-Gm-Message-State: AFuF++l8pwvNgjj8uwZ9x4nqyDAVcvFTFljFpGSabZLdu6dL6e6V/Xfd
	d06BpRhwem5DjsxpWx5f8Q91NLyG5jeBI28rz51pFJj5sL5k/lCWF1+b0IJRErn7i2oIy4ZmL9R
	r4t/2zZlliJ99gJ9reUfwZetlBEADUZ0LVs51lmRG4A==
X-Gm-Gg: AYBFou0G6loE3Ldh1cbW34/4nmN7hyUOyxXaZkocz5WxXseY83WTmvOak/ICZ/0NRUP
	nFOaENmXFysvSWS6uTdPm7ZXI7IHdK19KrcNBG6Nc8gLVSn4p/WnYXImKTefzwxUeS5IYbDZD4W
	EjecVpWqGRpGzxaHsVkEgrc9LT1ON4w43D4e97KhlO5PvKw65AnAG7oMvevvcRXwiyd6ANDEjEo
	dcGP9AL/1pFGd/dY7Ug9lghmM5R+Ly7sWolWDwGXeAvTjkqJW/yaIzCKHWpLbRkSvE7rrMxcBAz
	dZWTKITnwoVyLQtr5lHZSjASjk19wVnUzO0o0j/QCBG6HOSM49FfMao=
X-Received: by 2002:ac2:4e11:0:b0:5b6:1a7c:aa20 with SMTP id
 2adb3069b0e04-5b8b6655f65mr1537553e87.56.1789630297169; Thu, 17 Sep 2026
 00:31:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260913-codex-rtw-rx-v2-v2-0-f09c964e0b96@khu.ac.kr>
 <20260913-codex-rtw-rx-v2-v2-1-f09c964e0b96@khu.ac.kr> <de086af71cc346d9ac8ca4e7bf8787e0@realtek.com>
 <CAH1Bc_xaD2kjBRp7aVjmAcz4Pv=zK2Tx7ro38UsdZZtXRY3Oig@mail.gmail.com>
In-Reply-To: <CAH1Bc_xaD2kjBRp7aVjmAcz4Pv=zK2Tx7ro38UsdZZtXRY3Oig@mail.gmail.com>
From: =?UTF-8?B?4oCN6rmA7Jqw7ISdW+2VmeyDnV0o7KCE7J6Q7KCV67O064yA7ZWZIOyghOyekOqzte2VmeqzvA==?=
	=?UTF-8?B?KQ==?= <5mghybrid@khu.ac.kr>
Date: Thu, 17 Sep 2026 16:31:23 +0900
X-Gm-Features: AcwNN1VM7Ul5-ZzzznvgaBYRYVLvcxfNybxj9wjgAwgqIQF4TFclQX5o90vV-mg
Message-ID: <CAH1Bc_xZD7m+=obYMAtMfbFxrJDS87OGSwd_Mu7vZjHF_K3SLw@mail.gmail.com>
Subject: Re: [PATCH rtw-next v2 1/4] wifi: rtl8xxxu: free RX skb when URB
 submission fails
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, Jes Sorensen <Jes.Sorensen@gmail.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

I'll use a more formal name in the Signed-off-by line for v3.
