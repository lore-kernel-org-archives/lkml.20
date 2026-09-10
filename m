Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A7D138A701
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 03:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789010492; cv=pass; b=o2DpqAyaoa2dxoHNQ6euZLAvhJiBR4cVUSZOeUTky1RaXV28eNMbv0uqZzx81yUN7nRmo8dJLsX7k3U0UsO+w09H+6sRQ8pDVGRJmVLYVNm+7UdZc2kENrhlgPr2+auemXd9QD6tDYBtTbHr1RkAAZiFpI9+3hmua2fzYCXTHMg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789010492; c=relaxed/simple;
	bh=d9sO9YfjOMtfhkKI218+Hml8pdw2xki6+3ssCBL+UVU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OB3rQLlMHH9HjL6MKuv4lqLd7R6xpQOMYpYXZLaEPSbuXDH6Kb/vbSzcPUhNdArAy7IBmH31bCUm3HIQ0Ug9cZOIK3TiaLCtd9lPwoY/jLTFTYtob/4xW6lz0BlC0XOnuS5EdSmGOY3PrXs/NJEFZSBYcftaXndBIGksArKaA+8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SWQ7MXUq; arc=pass smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SWQ7MXUq"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5b76515c0d7so408856e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 20:21:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789010489; cv=none;
        d=google.com; s=arc-20260327;
        b=g16vr9oOGJpPUBbAnquioKhPz/tzYg+aYMfQEfLln/Xtm6XaUhuPGM9oVqEn9/8/K2
         Djo7basWv1EcUOdRjxtYMFgqnIHnekfXm2F6J0A8yk3RbXIddSQntHZ2mG+S67lVwGOv
         Jqy8iUHb7nRuJ2s8wBFvKrp1dyvOfSnyLLvbEG/uNYkzDFF7mOlriOpyqRI2YwAH120I
         smsR9h2gN85erDb+hSB2kBlSwTSKmYP4rU79vy+teH80iRRyNT0vbK22JPR0R35cm7eS
         +JBNlosMbk1SW2i6U1L90EKfniD8k4c1LLxdqnMIneVScmThB8k5WpSGBDUDuUY2PAMs
         gWAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=d9sO9YfjOMtfhkKI218+Hml8pdw2xki6+3ssCBL+UVU=;
        fh=ih8J7TBUCTfgO/dJK5zLC9W6r8wz2rqywlEkgso3RFU=;
        b=BGA06qHWSW2GLiqFQbNHJzo2Hu0XZ4H648aC6xsyztE0LWkYCLVijxZb8F5khDKkor
         Hid/oYU3mQagcXDznmStkg2CpofOgXB3cnpxxwaPPOMLyFyKgrOOXdOkul/wOta2VFCj
         qr4FddR5FXki7ukin5luvZEFuBl400Rvt60SMnO6ZONbLFO9qX5ms0QFTPWLNPEgxt2z
         jCFNiENt5dG83aIpoSwU6o7mK7XbwprKXXF8Nst6VuMO1jI0/8w78Ito76dVrGrjCf+F
         2TBfmomahxt01Rp35o87MQMzd35bGp3+igDx2ESHvJ10NxxMGBLOW2UjXzQUfilIpds1
         6P2A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789010489; x=1789615289; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d9sO9YfjOMtfhkKI218+Hml8pdw2xki6+3ssCBL+UVU=;
        b=SWQ7MXUq8hWauQt3woccc8fdoH1ixQ2nrXNn/BjQWP80zEtOoB9H2o/2oAUCncxq6z
         +LYl5JKPujjfKOuRZ76JqFLukjKgbmksJ4vp5iXC2OUDcfmVXMl34PjJjnRXYewANJ1y
         PI5zLMp7k/PYQQMUluPqoy0KRqVRVxysSr5PUDc67xGZ9FPPAn3hU1B4KXC2G2rP+DVe
         jyzdov7KQg7afQKPXinC06msaYTylYaeiTuKa0i19qf0lKpD/sctOmNCz2brzq+u9bLy
         kFhBAROKwzpc3v5aogPct0eS8UDOyWnomU4AhnHctSIwZq7y6+0THzTK15vwZzN1lisP
         UnzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789010489; x=1789615289;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=d9sO9YfjOMtfhkKI218+Hml8pdw2xki6+3ssCBL+UVU=;
        b=W+VHSUeIpiWsxnNOxhhGA/ncrlgNA7R9NBSAv90feREQtirWJyQ4GXfeiYyo5OP9ZL
         Ib1/fIE3Oxd5I6eGbQXVmbYDpoII+RANyx4541RGYle6ZQOid5BYTyayeX4BYEu/ByVQ
         Ak5ofsCMkueP5hOqKGEFwAAJWmhvzGBG2nahbt5EOfmq9+upk42b3NEnRX8SZfXmsekL
         AivG3Sm3ghFAvBYVD0wE8vxXRNBi/Y9JBc9Vzfa1I1V4iQlIiQjvAIbu0QqRVy0hFfj1
         DJyDXdxJ9uFrdW63uDmq0gqcrnLmHdT6uPwx7LRt2B29SuOtOICCM+x+1CJmrWLxToQ6
         5bsw==
X-Forwarded-Encrypted: i=1; AKwUvBwKx0adKI8HeFjve7VYSeFkWEejOe7n6GGmVkTIU+MQsfo/CCdu7BVi6kGhoPLpsdp+1bt4AbJHQZ9Ad2w=@vger.kernel.org
X-Gm-Message-State: AFuF++kgrKNyxSIqCkPRr33Yc4NIbs0r5M8L+vfYxg+s1qaLb4LS+/O0
	s781nDWuQrllpn0YG8G0rIcXJQedSOrkLgHd01BjfqffN7nx+8DKD8OTkjknbrmjrdBDD+86JYM
	9HlOvuGfRvfqLELcwTIOkHikaSD51dwQ=
X-Gm-Gg: AYBFou2AQMPIWL793o2kjng2J/uwDHvVOncC69K0v0WxQTZ5SkZHsg22pVQmMFuHKQm
	ZkrwFzxihiGgV6vWiwEs6+Tv47IRAQ/h5KgYtx9xvxXXHTZGtPmYswcCk/4Z8z/sBi8kFiin5vq
	Yp69SGkhL9QnBu6ftIT/nZqJF2SS0CwGZR2FZmlURhMVbQuYP3NgVDFe1oIpyQhi1sfmHH//X0V
	Ez74iepZKVYmGKODSU3w1eKNa5izdCMbLcQo4eOMLe02XnCmVUrAdpefkYO/0J3vO1cier5IrW7
	bMh1ZAZFSqFvBOsJdt7iqY9xOScTxTKj9sMNthwMLspS/JEQkupKB7A0gpw0vBLcpXoY3KLBrfB
	XTspuNy4YxZ3Hv+2BafOq0/zWRqsgCYARHpNx2sMBHA==
X-Received: by 2002:a05:6512:1307:b0:5b5:e3b0:231 with SMTP id
 2adb3069b0e04-5b89a2fad8dmr399549e87.13.1789010488773; Wed, 09 Sep 2026
 20:21:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260909013401.14408-2-sigefriedhyy@gmail.com> <178900489222.219967.5701707176821161509@kernel.org>
In-Reply-To: <178900489222.219967.5701707176821161509@kernel.org>
From: Yuyang Huang <sigefriedhyy@gmail.com>
Date: Thu, 10 Sep 2026 12:21:16 +0900
X-Gm-Features: AcwNN1V7GyyXN-MLzIxbdYaXEdpcN2buyxt9nexIpKd7w-_caM0SlF_aUp8xaeU
Message-ID: <CA+7S2v+kkzOxwp_o7eJ6e8gCGhqvN7ua52jsBNsCM1hMW79VNA@mail.gmail.com>
Subject: Re: [PATCH net-next v2 1/3] rtnetlink: add AF_PACKET multicast dumps
To: netdev-bot+sashiko@kernel.org
Cc: davem@davemloft.net, dsahern@kernel.org, donald.hunter@gmail.com, 
	edumazet@google.com, idosch@nvidia.com, kuba@kernel.org, kuniyu@google.com, 
	nicolas.dichtel@6wind.com, nickgarlis@gmail.com, pabeni@redhat.com, 
	sd@queasysnail.net, shuah@kernel.org, horms@kernel.org, sdf.kernel@gmail.com, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Could the changelog drop or reword that claim?

Okay, I'll drop the claim in v4.

> This isn't a bug introduced by this patch, but can this copy expose
uninitialized bytes from ha->addr?

Not related to this patch, will send a follow up.

> Can this positional resume cursor silently skip dev->mc entries?

In theory yes, but this follows the existing dumps: there is no
generation counter for dev->mc, and in_dev_dump_ifmcaddr() has the
same window. I'd rather keep it consistent than add a counter just
for this one. If the issue is really worth fixing, I will send a
follow up to fix both places.
