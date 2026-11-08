Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794099918;
	b=eOHMCgJqs8fMuuJRxGXIS+Awb7Pvfp2skD64gXByH4W/NOsTl4oqvMkO4eQUUp0QMill
	 mX6FkbFAqcvNOKLH7/aTl9VLPfO9p6INkKWlD95Rg/kY4RM4kPaztei32FqLcmULku+0E
	 HOu2wNCsrHySnhhQlZs3DbE2PD6g0wSct1wUIj3z9+oJZKx4n9VAJF4XHtLZfoLTykilv
	 hcOknrF2x+vGLGNy2/Vhn2KbLDxRcgBgakRYMjKE/1c9X8fXT5i2ay2v/UVmi+YvpEJsG
	 jVGwqylL17av23LA0hsVo2HMTozCD0CVviYD49d5ClXF7LezD5EClefssk+pdEfEUQQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794099918;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=1gDHVgeysvDkk0Op5CbmuTYEbWhhaugXlDTTytEHmTA=;
	b=m0xIqihX10gdXKgfOo7jn7knH6zkqry7Ry/ZlxfviqKIUaXbBn22JL00lL014RJiV1Fs
	 tkRCUzHXzoak5Bxbu5XM7kEW1YIwbNdIqArdCclH1sZaoCPga89v82BrKpflxGA8J7P9e
	 bexiIt8oDKe1Yh581vaXYvm30FDVIXlyYjDc7NHl3XamjAx/hqDafC3N8NRW9ZixR3A+T
	 YzB2OX43z1Eli40jsPp7s0VfqM4GydWbV3iLGV6q7QO50O66gHZD04P0pWtdLiuerRQXA
	 kWhBy7g9vtmqUyFB9dG9lgB6ZepAkYl/mxsLqRJomZDAk1oM+dPkxMwhwQ4fDXcYefw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cxJaP07Z;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.48
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F959606A330
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 01:05:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F959606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cxJaP07Z
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-7d2b25786d9so67846137.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 17:05:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794099917; cv=none;
        d=google.com; s=arc-20260327;
        b=o0+YMAYZlil8QVEdKiHfPivLAlCJaGHfmeNpf5k2cOR5xzNuiQvEARHM3u9664Rndk
         EOqHWAOwPcppt3UA+hmIyhW7tI5tVOxh1hHige9qlJNoOhnOfc1oH2h+Vb8txuXsqw0A
         FRQbCJ999adODuPazlz/ejcvTDfyUSI3iAzkgahmQ9hbLrWHNQzTHePOWGGeO5Of8iri
         VCT5pyAhKuLxXKqIzzRSk2eeXTE1TA4AefpkeqURb1AsbEt2pxhZ41viD2SdwvsGvm5o
         p5ABsBhk1zB6fCdrSZDGj1Q3WLUcVlt51bhbMMrcKStXcrzv9WRFtWeeLvvklLydMBgp
         7Ahg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1gDHVgeysvDkk0Op5CbmuTYEbWhhaugXlDTTytEHmTA=;
        fh=pEM3a6R0nSvDN8JM6NrQ+du98JD9W4DBfTpprSvRmBg=;
        b=HY5hZH3K9QLnlMZupjonx37rbLX8hhgGJf51RjB1E/kCl7HBKOp0BRUwS5YcHsNv4M
         ZaubLm8ltAIXA9rsyNWZ5jjLb6xObm72DZbbWFBFDo2aEiPDlFUdG7+8Zb/cFFc18mrZ
         YN0HPMXfTp0/IHgd/ZJ2ZUqj2UKSqwPQ0SsB/hsJWGIB4UlD4+/siJJzy5bN45eSkzQZ
         4B/asLJ/YLHzsR3QE2l5iYmJXJsP1L05oCztY1U+G59XuTZXtCACPpwm1Ci6kGdOPf0U
         oukJVxMdRMUOc81lOl5AQRNoS7hd07BIm0tBlSP8eGj8zKKOvHZYzszqOuzqOl1pTIff
         HbwA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794099917; x=1794704717; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1gDHVgeysvDkk0Op5CbmuTYEbWhhaugXlDTTytEHmTA=;
        b=cxJaP07ZBajHbLeCMPXcDYXFnO5H8F5+pbIMXuQjmDk4MeSaZuEfJZV2ZzPCYfppFw
         FZmXHs62vcgJUwu66Yhlb5+DcBn+XldQntiwD+SlxaW6JDQb570Dtf9ZazqKYcj8kQ9E
         D4g1Jo/sfww07HZ8ExlAkVSO3Eb6cfMZ8s2jDN/WpZRQ2/l2S88L6NBr4Fj8RjiVlIOx
         z02w8Dgp/luWMiCILHa/0/02zWDyuIbk+bqVYBzSSMDRlZRfy1uFWNzPmlzp+a7YNIv/
         O9UABHbWEcVPw7CCwF9V/oCFRlIAW+UGm3vXQnR5CagREcU6OUb7vzcHN9JFsSXsqCH5
         CQVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794099917; x=1794704717;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1gDHVgeysvDkk0Op5CbmuTYEbWhhaugXlDTTytEHmTA=;
        b=E1fly4+KOQ7Vvrg4qr2eCmKuxGMsUJzmdCvK1kCA/dnRKgQefMP9M1H4EWzigPf0cS
         NHM0hgmTttn77QvL5EU51udFRD7pnCMvClOzIlU6Us32oo9jUd8z58qsxdvmyQNoq9wx
         vLF5CUbkutGyfJ3EZEujrK2ZHYKL2Sa8RLCevS3znjFdh3TWBrPwBcLU7EAmqbG0Crxm
         qaMEv8mHoL5w+7Af5tW04SOcnvCz7AwX8DnnfIkSM1c9Ut6C/rvSxr1S7n0Rddcy/Txl
         dl2z8jubwF+P1ETMFe4MMMW/LItuIeHu6Uk4MLSeHnYMH/6ov7YjbN6TouQ7Iyj6u7OJ
         qvjg==
X-Forwarded-Encrypted: i=1; AL+hErHJmzIqdy+dBYs8e5mTRHRDMKo3N4xvtW2TmzOY7JUckq+JIey1hK2SaE4hEcbwIjQ343dCi/0N18/XfCQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/JfjMNANu31ff2jKrhSbSDKrW33ZwAqZk/OMhwCpYkEeI0E7o3
	1rackkk+Ag8BQcustDc9q6clMsER8MQr7W0I0hHLAh8k0kVuQwsHroR/lBoeZT4ug0okkQl5OV/
	XYOvsArSDsTQ233oLzjGdFdgCf/3cmQg=
X-Gm-Gg: AYBFou1zN240sBMBOp26Dtt7AsfyxELwgkUN+LHm8xBK0UNummGjL26wOwhYZlc0V0l
	7v6vRsVkTcivozMYkIqd7IdCf7OmsQYGQ61XFXkhmXNUAEUZBUwOdzKNwCeLhTOn2iUqYtQTkvB
	b6eg7XkvLQraQU9eEQd9LcEYIFjMube3x/+FPONUqQ1bvMM46zsa9Nuv5YKiBvPxBLHdvtPQ473
	vp+1AuZqcBpiocONebiDQZuUuMNM5bcM10U7pkNNdDpCe/T1vJtE9TaL3+PHZ03vTYyZPDqevsY
	0GcZFa6SZtQnnn3zNrW5IG7mBEGFhwEJeSPhIY2NW0BDjC3jYS5U/XVnsiOt8M0uyVFNAGtuWvV
	nNx/JzqstICdOg2e19gUjfkRjzi576kZaji2yWRziHtGNIpORuX5oejISuvO5Ss+lAV/z4f0A3v
	uUEJzP4BsExtGkwyyc
X-Received: by 2002:a05:6102:914:b0:7cc:25bc:3b30 with SMTP id
 ada2fe7eead31-7d2db10230dmr109887137.21.1794099917401; Sat, 07 Nov 2026
 17:05:17 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028-b4-mac80211-tailroom-v1-1-f3cfbab9ef5f@gmail.com> <CAKobHXBw6Vb0UEuViBE+SvwHHSRL0csPgA4DvhJ9Dn4Snk3h1w@mail.gmail.com>
In-Reply-To: <CAKobHXBw6Vb0UEuViBE+SvwHHSRL0csPgA4DvhJ9Dn4Snk3h1w@mail.gmail.com>
From: Christopher Griffin <christophergriffin05@gmail.com>
Date: Sat, 7 Nov 2026 19:05:05 -0600
X-Gm-Features: AclHuK_6GVQ66_E7UYM3o2g7CODSKxMHnMvYY__--thhVTYDM9E4X1eUTiNTW2w
Message-ID: <CAKobHXBE5b3huEiGOwFbvWmgm90wPxdeDaxRVkU6x1=xosq4Zw@mail.gmail.com>
Subject: Re: [PATCH wireless-next] wifi: mac80211: flush TX for a new key only
 if it needs tailroom
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

(Resent as plain text; the lists dropped the first one.)

Hi Johannes,

I see this is marked Rejected in patchwork, but I didn't find a reply
on the list. Could you tell me what was wrong with it, or what you
would want instead? I'd like to get the underlying problem fixed one
way or another.

The problem, in short: ieee80211_key_link() counts every new key as
needing tailroom before ieee80211_key_replace() uploads it to the
driver, so whenever crypto_tx_tailroom_needed_cnt goes from 0 to 1 the
key install waits in synchronize_net(). On an AP whose driver holds no
other software key (no PMF, so no software BIP key keeping the count
up), that is every pairwise key install at the end of a 4-way
handshake: 30-65 ms at HZ=100, with hostapd blocked and serving no one
meanwhile. We measured it on ath11k, ath10k and mt76 APs; with the
patch the same installs took 0-2 ms.

If the problem is the ordering (the count now goes up only after the
upload, or only if the upload left the key in software), I can rework
it. If it's the approach as a whole, a pointer to the direction you'd
prefer would help.

Thanks,
Christopher Griffin <christophergriffin05@gmail.com>
