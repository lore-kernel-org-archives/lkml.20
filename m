Received: from mail-lr2-f35.google.com (mail-lr2-f35.google.com [74.125.230.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69580499F30
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 14:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790001634; cv=none; b=a3n16gXmRuysZD3mUq9WfNzgRjIJYpSPUYiPM5SIenEayHCBFTT0kIdi+8QzmePzGssxBDNHWq2OZzvrxLLxrKWC/sLhh0E3osPa90iF3V/ZasDNpEVvs99QcaOX+qLqdNnKWjyJv+eQszPtPfEuLFwJW5JOUD2A2oC5rBdC2Vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790001634; c=relaxed/simple;
	bh=Vl0OH64ORajM0i6lG8nxGo2msKO1rkc+VGS7OyBftRE=;
	h=Mime-Version:From:References:In-Reply-To:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ijDPA59pkHhqXsOruRM8d6JXRvjbedqFDpRLUJq2hD0M6oqBByUhBjQPx9/GqV1vEi/Td7ixAKgCOgDdu4W9pwBmWUs2oewFuA13u8Zf6UGnS+Kv5GYZywMcDVjZdT+AX8q0VKmnD7PiIAlOwfJYmyQCn4nnlwxnh+OK5zS4nj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=black-desk.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.230.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=black-desk.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lr2-f35.google.com with SMTP id 38308e7fff4ca-3a612404718so14818131fa.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 07:40:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790001630; x=1790606430;
        h=content-type:cc:to:subject:message-id:date:in-reply-to:references
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wK8Ax2x0Vv+Ao4SYzfPnuD71riCqpwrI+YZyG1LhWaM=;
        b=PV31QhH3QJK8ToTegCyHeX3cNn+zOzoFUZ1dD2wEDAsP4gipGcBTB5jqUWZvikB58W
         +/nqwxXcqstRlJ3RdTVFY2DXbkDrrQeSdpzC/z0NY+is5lL/sqDnM6wymVjziiDBQqk8
         oxGs1IXn/+Evhnevt8K8+8HwVCB97iPB3Smp/VM0kthS9sOwbYqMQQ9DASd8/vwIlF/b
         6XMlxpfW2eBIX4LYG+kI7z3B9awmbf5CTEPF3GTOwLcyXh4I/A/5XdMb/qsGtSk2PMTH
         rsFS7xvY1/yx4Fb0suxFyaw/JWS+i34Q6mw+qPkGAgbIz9FyWO5a6CkJTjE/X8MFXXIc
         XOOw==
X-Forwarded-Encrypted: i=1; AKwUvBykeg21QRNolinsmcZ2vA4nqKKJH9yiLogIUdUwMaH1W7m1wZe4aaqJ94fkPLZk3T3SZmDJG3r3jWCpYeg=@vger.kernel.org
X-Gm-Message-State: AFuF++kbe3Y7WK93FGBHaFHjfRa+043Zq5irRn7q+GGR/hjXOAMjcRN0
	3G8RpbTmmnkmUV8JxsSOJ3gUE9eL+9ExhNIdh+Vx3fDrgcIU7Q9Mb9biw5KB0uYG9wc=
X-Gm-Gg: AYBFou2LsU6SI1tToRVqLyjRRVs1YtQCJ0wN5ZX0gP9DKsthBDypn+ICBM2ESmKYYvu
	f6QCdhmO+6L6DhLZWhKME7RDTeNjSvdfUa3SqPuQgOqBqByrohJkS7prt6jt5JhuUZ1l1/KXwAy
	68/HaVXLbdpZnCP/Cd4YB/tZFhXVQu0iI7pj7M+1CNGqfXG1lVYo/rbki1ZSF5/SKsGnbMoASDV
	T1LZ4yxObTC4je3iv7sFnugMr35hhGuCEdCKGTkKuqNh7e3ssfgs0qoqfHq0W56fghz2PRdElbU
	4X29pX1R6Jx0oNBloYGk0cEQ2i0cb/pPvljr3H9Nt3jLNp9uAJq02B0U7lxNFzGbKsg6xuA1eUp
	zozFUPp0etmkW5oPDK+mUxBa9UYaWt+Y/zsIqIoGSw8vSaAwR1BG2ZlcqeoL7rNk/VhOZlVjDf1
	aDW8ecbFmPyQF10yS85CUDBH+4ZDCWAQVrCo+SGf02Iz49Y9nNLWbuTEYgCVn6QLscSMAWT8Iwc
	YG4C9RwvX1arHXizAe2BmK34McrfxXvwpqOseg8TzUh4IW/stF1j63HkdcrP5tCQL73RjFbJgM=
X-Received: by 2002:a05:651c:222b:b0:3a1:476:74b3 with SMTP id 38308e7fff4ca-3a5fbe55a7emr24669051fa.9.1790001630092;
        Mon, 21 Sep 2026 07:40:30 -0700 (PDT)
Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com. [74.125.229.205])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a607598061sm22411141fa.15.2026.09.21.07.40.29
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 07:40:29 -0700 (PDT)
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b8c5231570so2535857e87.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 07:40:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByZd0XNHqMGdnG5nJivvQ2xlLlGnXDFQevrm8wTdRW8g1jv3vtGOOTdgC4uU6ai4E1KsQTcsWSm9zAH88c=@vger.kernel.org
X-Received: by 2002:a05:6512:110c:b0:5b8:997b:c5e9 with SMTP id
 2adb3069b0e04-5b8c184ca3dmr3514194e87.48.1790001629394; Mon, 21 Sep 2026
 07:40:29 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 21 Sep 2026 07:40:28 -0700
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 21 Sep 2026 07:40:28 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: Chen Linxuan <me@black-desk.cn>
X-Mailer: aerc 0.22.0
References: <alpine.DEB.2.21.2609191504030.27665@angie.orcam.me.uk>
In-Reply-To: <alpine.DEB.2.21.2609191504030.27665@angie.orcam.me.uk>
Date: Mon, 21 Sep 2026 07:40:28 -0700
X-Gmail-Original-Message-ID: <CAC1kPDMo9WCLwuqBYAa3WJhgCjYAth=T66wg9+WRQ1F5CQ8ocw@mail.gmail.com>
X-Gm-Features: AcwNN1VAir1nnbSI5uURp46t4W_M-ZztrmEs-WQGJqbvT5kjopuQVRFVgrr5PXw
Message-ID: <CAC1kPDMo9WCLwuqBYAa3WJhgCjYAth=T66wg9+WRQ1F5CQ8ocw@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] MIPS: Resolve build problems on decstation_64
To: "Maciej W. Rozycki" <macro@orcam.me.uk>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: WangYuli <wangyuli@aosc.io>, Chen Linxuan <chenlinxuan@uniontech.com>, 
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat Sep 19, 2026 at 11:14 PM CST, Maciej W. Rozycki wrote:
> Hi Thomas,
>
>  I chose to rework this patchset on behalf of WangYuli after all; I'm not
> sure if his address cc'd works.  I've reordered the changes to put fixes

Thanks for taking this over. Just as a quick update, I checked with WangYuli
offline. He did receive your email. But he's been quite busy recently.

Chen Linxuan
