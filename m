Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CADE24EDCA4
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 15:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791474434; cv=none; b=Rv74mNfs/gEatQdRkhL0/v5Naax6rZXBL7a2LHZiiJplllEzcf++b7S5zbIyNwXe3motZpD3Zzor/ehs9ehahd6Wzn4qRQ/KCKJbo6sHRiVZ5r+C4sZfx6Fz8kRUSUXDFuXjPcO9lnSqULk6halPKVT7xB/PWqdorTFoh9kZO7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791474434; c=relaxed/simple;
	bh=Fv69M9kf7M8P9lf/EOlij8e5fDTE4UYWx31vo2P5D5c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TYFELClr/zGXCYpF3oeyuLO/RD7a3aTbl2kXvfz2DDJ/Irp8fZc+JEc/5FX7lD2MEO6Kz3fqMGJ5GRuOW4XhJHgOR2Cdp7bThegTF0Id+bJGIku31zgsl3VFGRZElLDB3RvD7DP5iaOR9UkJHfB1CRnDrxCFL7FEn9lVJRNhsq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lUbiEFyX; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lUbiEFyX"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso55388905e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 08:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791474431; x=1792079231; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fv69M9kf7M8P9lf/EOlij8e5fDTE4UYWx31vo2P5D5c=;
        b=lUbiEFyX7Lo+LY5qtpIDeeTxmJqTmNAKPF0GUIRw1rA/tsFq8y/f46Sa3vBHfH1Wi1
         XIgkSkNe4T4jESOuTCRzjxhr3xm4RJx86Hp0zab1bufH20QhBDHS3Yc3bxGZBG4x8O+q
         sxhP8YF36B9bE77m+uH66ljcu0sWVQr/95MpB7shoevYPFB+FZvx24Ra/7Cpigm9SkmE
         O5JTga8/cU2V/1CEwEd4WgQRyTtD3s2o0VIykGwXboLmnnuky0yfm9R9fveAHfKnpvpQ
         itZtZSMvamorfhSQ+IUvlBoTeVBHw7/52h7+izITm7KADSpEIAAdcX6Stfm3VxyXFOdm
         X3+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791474431; x=1792079231;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fv69M9kf7M8P9lf/EOlij8e5fDTE4UYWx31vo2P5D5c=;
        b=Kvy/maNrLz86D1vZ5WkQaBdm3x3hyByMevgdGD8jAFrWTz5fmFzqH0BgvVYheJ7oRs
         7mKcTKhkPlx4/FdohUOw6zLB4Tn29/BSlzmpK2y5i16+i5N1HsKOfJk+bWAvCeYsR79k
         R0DQJchqFl6eZVg0ExPTf1GEpAtgl6HOiI6PwnbXgMSkljlZ3T7QOrpcbVyjCYzPiWol
         dNITIFGUXlk5FrT6dQe2UUx60lIkKzkpqMma6mu3Cshu9cOjeAQHWhcHqyQUzYmEPIV8
         NKZ398qbdC0IRf/PzOG4lbQD/72AJjY0HDuWUR6P2RwQRzzt5h2JEG1OZoZZOhkNe11S
         0DGQ==
X-Forwarded-Encrypted: i=1; AKwUvBzHfNhPVi4NULKIFRVTjYMWY3Oq4gE/JaFyDWf/yv1iKoWv/cb1Fg/ox2gZjU2aCrJqonz6hzCqvRa9iRQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lIe4rUCW+u3FwCWW/lkRGTo2eVsd7BNRZxLhfh2Sf153XcbnFg
	WhSAj9u1BruC+xX7LEnoLd0tJqEzYpkACCd+2sHfkWKc5U2u4JUb+H/a
X-Gm-Gg: AYBFou0jm1n7i7rRcMdFKEEWorFRynJ8tygTmrk9zF30UYDlDUIEE8E5us2BNYARX/O
	k4UqRo78N8uAM2hjnhgJ/toR8KL6hTCNzPvyVLiA9CDhqjB0nYSPfgMtaO60NrRT7E0Yw7B+RTE
	CZ2EVl4jCMlXGkkNoctKlrY8KQkvqpY/qqg+sCgRkQcQCKeOmrGmx9ww2/DhXc49iQcF8zKYoL6
	h+FM9Luwz7tOrbktGiMKHjBNhqf31uVb7z44WZ0Q7G0DAKE+of8fFdpKmslMtKm8jTdIJzvnNLd
	ugh5Z1UsT0FLjQF0vCUlsrNo025w0zMY4OiX1WJsie7ZGSNkaujYxryjoVSz8Qhjv5TZSLo7Q0Q
	iTa3RZQn3/ajyppJdOF/BC2YtqQT5hrqPsattp3uFZs0WMWqPZp1cWiSDEeP4UIULdx0SmFzG/W
	3UnfTg3tDUJIDQ6LpYTj2H7MddeO9RswwRFrK4N8Sw8Nc53tQwBBbs+gCzsU961K4vcNDzN0B2s
	VR+RcOv
X-Received: by 2002:a05:600c:3b98:b0:499:79b9:e220 with SMTP id 5b1f17b1804b1-4a180422c02mr105584275e9.10.1791474430445;
        Thu, 08 Oct 2026 08:47:10 -0700 (PDT)
Received: from [192.168.18.21] ([46.197.185.71])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db652194esm232749f8f.24.2026.10.08.08.47.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 08:47:10 -0700 (PDT)
Message-ID: <6cf2ac60-a9e6-4a2d-a7a5-7535441485a3@gmail.com>
Date: Thu, 8 Oct 2026 18:47:07 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v3] usbnet: fix EVENT_RX_PAUSED race in
 usbnet_skb_return()
To: Jakub Kicinski <kuba@kernel.org>, netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org, oneukum@suse.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261007220311.113827-1-omermetekaya0@gmail.com>
 <179141094859.2527009.4935200551311639225@kernel.org>
 <20261008084012.53e34d5f@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?=C3=96mer_Mete_Kaya?= <omermetekaya0@gmail.com>
In-Reply-To: <20261008084012.53e34d5f@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/8/26 18:40, Jakub Kicinski wrote:
> Hi, please answer these questions, and try to include the answers in
> the commit msg of future submissions.

Hi, I couldnt add reported-by tag when it comes from sashiko,
should I include the answers under the "---" for future submissions?

Thanks.
