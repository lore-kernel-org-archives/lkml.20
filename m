Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 435C33C1985
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 21:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790283804; cv=none; b=ZYvdw4lkL35o7QO45qj69hqWoOpzLST2DuIRLfE2ZPjtdVF+5tS6iF5y/YuWQTZxeVy4MjZqK0RQT+rH3bigi3/RilimYT2jXo/0Ga7Fr7QYyGTcBr1XxB1BJTxiM3+sAxf+z/KZOesLPbDX9oQAqcpMrxQepkImu8dAJdHRhhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790283804; c=relaxed/simple;
	bh=wWhkspSvuUaP79UFlg0tjhLS64ZcoVHeFAMlQFnyJeE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WKr5VusYD9XKndiB1sEC5VgxuilrCf/HVkYitJtP1rIboL5hzN8TA8NfHrpecXjl/DR3qssmKI2DhZJSJAsYHigpDOia4rlKMdV8CM3ZRhxiEMS7y2GIy7Q/4ntCb4Kttmx9g2M/kEyiYMPPcbzgMJZfW3hFHXfd4ZkFUPOO/rY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=KY35iQGf; arc=none smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="KY35iQGf"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2a8b9acbc6so38660366b.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 14:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1790283798; x=1790888598; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HZUM5CMnMFQnOGiBLbND2ls6ZG2NSvPjkHob8MA8y/Y=;
        b=KY35iQGfhU29+shzq7Z/HzTukmzZNZlwyhUXdb6H/WLiiEOhPOJaWqU0MZoieOShRg
         6KLQDx8ML05LGOhISezKfHrQswv6hEWt0nBjrkjVRmQTKZPuoBmvxfBHRvuRoMPFoGxq
         WFAA8COImXNh/0BDpCO+wKx2/4PUF+DhuUrl4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790283798; x=1790888598;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HZUM5CMnMFQnOGiBLbND2ls6ZG2NSvPjkHob8MA8y/Y=;
        b=X+2yEP7BI/+fFYk8rsDbpAp1W53UqdRVRPGw2iPWlKJ3TbX8jrkHQcpAAwQ9ajVU2I
         qdYwIHLkfMLra0GSP4kSuQqzf/CDzfhtzDPISnHz03cGxwAhHmGc6ztYpjUi4IdXAd9R
         LNK3+10dBLksjLXLRWkBoZ1rJUBabscyuxZXjdh6ubp0+YCR5Hgv4hu560H3ZrJKzmZR
         DqOuGu/aF1JeSh0JNGOsFG299VhLInFSTxBFBWsUWxsSQBkHUmjeDYkHghBCqqnhmkpF
         mFY4o/K71LwRch5rQRcaon1jveMjsbjHoQJhWJlYIJeDn4Sgak9/M8VmxCTyRShXGxCs
         KBxQ==
X-Forwarded-Encrypted: i=1; AKwUvByVW0MpvEBaU8RtSlork31FI+18ug0FlagzaVcKq75awBOZr6ENTj5w+N964a6h38y5qbSPUDuvAbvH5MQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mCpYwCOhn36MGTqTJ5XHEe3yOtmNctor425yv/phnfSCJzHaPv
	46sdK1DPBTI0FD0iSoLu0xXrfAVVZ6ZUwLQHWKn6HS8kGbUq7+OesSLMnpgNOQPHI9i4o5GnI2A
	aHvBadekyPg==
X-Gm-Gg: AYBFou0rxWZyaNrSQvk5q6M2fqmsODM6yjNfvha/2ELW/jxSW2e6o5Zieh1B8yA7AQU
	wOqph0NOzL1D4uyDFE9yn/aU4RSN3onB5CWsumj2VqDCe7OQ6uj6B8amzMOgZi321qrnj4475vF
	6gAqqemZPy15mc4qC4VTO0ttKW/idK4ZlFHVDpun8M0BXZ0fKsRaqyeTy2/NpEb/jzkWuC6xGnc
	SlL0RwGVF4rUfdaqxYGzbslf0XblWeMwYc2AGEYQHpwm0XQhBbxOWF9osDZhJuxV8sWwfIkuLSi
	ANlZuIBPgarFY6lIOj5e1de0kD+wuBgNVXCSvRA6D1bnTGXCCESTLQeSOBkUrMBfkWYdRf3B1WS
	BSHp44gjBtvjLTpgwI/B0+2zEzweaAp62c1Rl1AIv5POeRUW/9uQW4oQZN+uubm7eVdwO8coiCg
	GGbURyqN/kl10vY39IO38nuQKKA807tvPQ+URmWVkam0z0hKx57f3MWCq5B0o/NHgyao9ya+xB9
	iH+zccRN62XJ8qpxN77Kz2gkabzC5ERMuO5Ka4MNaZGKTjkIA==
X-Received: by 2002:a17:906:c115:b0:c26:22ae:b66b with SMTP id a640c23a62f3a-c2ac2328075mr336048466b.15.1790283798610;
        Thu, 24 Sep 2026 14:03:18 -0700 (PDT)
Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com. [74.125.228.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2ae735cb45sm14514766b.10.2026.09.24.14.03.17
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 14:03:18 -0700 (PDT)
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254fa663bfso36530666b.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 14:03:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwSWqMc7d2dB08W+vfnSb49EYeDjqOUBuogGlUQeSyLitEjx8wCyerdXnRxYRvCZeIa2mQnr89qnbgzw6Y=@vger.kernel.org
X-Received: by 2002:a17:907:7242:b0:c29:f5d5:5a95 with SMTP id
 a640c23a62f3a-c2ac23ec443mr340930766b.31.1790283796794; Thu, 24 Sep 2026
 14:03:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924183257.2700506-1-kuba@kernel.org> <CAHk-=wiSnTE9vBZ=5_v+3EEkdazCCbBM5YABRzRHUAeRdyd4Xw@mail.gmail.com>
 <20260924132743.50090cf5@kernel.org>
In-Reply-To: <20260924132743.50090cf5@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 24 Sep 2026 14:02:59 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi9KzKG0EgVGBXB4njb_sO2Jtuh28M8g7y86ge+z2DgFA@mail.gmail.com>
X-Gm-Features: AclHuK-N49J43BUn0smXptgPxT_qHCVXiDpg9getC64BOZbVJUhn1rST0kTDE0Q
Message-ID: <CAHk-=wi9KzKG0EgVGBXB4njb_sO2Jtuh28M8g7y86ge+z2DgFA@mail.gmail.com>
Subject: Re: [GIT PULL] Networking for v7.3-rc5
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	pabeni@redhat.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 24 Sept 2026 at 13:27, Jakub Kicinski <kuba@kernel.org> wrote:
>
> At the same time I'm very impressed by the overall code quality these
> days. Regressions are very rare for us. Even mindless slop that people
> send is an order of magnitude better than code we used to merge 2 years
> ago.

Yes,

I do think the AI stuff is actually being helpful. I mean, it's a big
pain *too*, in how it adds to the flood of patches and puts more
pressure on maintainers. But I feel both the generated patches and the
review really does tend to be raising the bar overall.

               Linus
