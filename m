Received: from mail-wr2-f14.google.com (mail-wr2-f14.google.com [74.125.225.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC14141D21A
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 22:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790289687; cv=none; b=oiYn7b7PcJIagvcgFE2ILBI0GpwKidhfx/tQuTV9hkHl3RsXhizkPZKcZYQmdIrwOQmQ1/CeqceBy4tXApXWbU2n9IpTF2ErrXFxv3gUAannlhN5lHCIeibaW4nyqixmU4jYc6xBtusPgTlTinLELqHgZT+I+PAjkaOfH83lZH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790289687; c=relaxed/simple;
	bh=TUXt6ktVt4Gz6z6+4bfN0D+POleMHD4yZINwWeHeufQ=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=XZjZrc0tNE4N59XhtdtOV6NvqcjPk4jacdRDLKQ6lKUkCF8jLBmOykzK//KGnYKk8ZGf4Z7kJfWbLhaBsdvM6VGz2SXAgpdTrMMDfCik4mtIdzTINixXcgh0lSTnDBq38RXVz4ksM//KTse0yR9Gb519UoTlJq2oHWi5PXePptc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IJOYKVGz; arc=none smtp.client-ip=74.125.225.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IJOYKVGz"
Received: by mail-wr2-f14.google.com with SMTP id ffacd0b85a97d-482f6350f88so164920f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 15:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790289684; x=1790894484; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=pbq8cg5hzV5CsgrEJBLzOPDrWzTdUyY1xmmm7QhjguM=;
        b=IJOYKVGzTk4I+9HZPZvJ33aLiJ2TzL7RRTWomONTWpRusH9cr/jwI5wj89t7hUIaMc
         dBVbcLoWIKGmSJikOlcSvmZTqXc8xv2NO4jVa7/4tc9oRoSTJvZxMUZM88MpVaorFRfs
         14mtiaOqPTG/Idmiqmt2DeOl/yMtuvCcaMjARlu043LCJnRMnYFCYjG6OiDZAZuSA/tP
         rPeeI+t/QQ3+S8kYRq8gN05Be+UG/A1eVKQJvHC1V/cdjEXLp0QJFbfn+de8oXg/3Eib
         A3bqV+SIdHbcvbnLWKcipuHyHIAYUpofyrTaayNiEfYrKkn7UDgA6UklLXbHkEo8vSwb
         UqIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790289684; x=1790894484;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pbq8cg5hzV5CsgrEJBLzOPDrWzTdUyY1xmmm7QhjguM=;
        b=k0MRKLUgg1oj4O08F1GerXyEkTSbCm2RK+5UtccOFnw17N0T1FErd8DMYlASmWIijA
         04DSFWlzh+xysvd5qELpMeKAAjTgUNcO4z2IZlqqW55ppRFw8hVeEhR3wYhSBy8k3O6S
         pgZ9j+K2rIJgDGafYj9YD5/l8GkNQHtdIEIQK8N8qEU70cbog/hpVgAuQWJISzmNXQLX
         ug7RTBND8+O2ZHAEJdiRoG0C2u39gBJtKdGRrsf9c56/AbpoIlcl77GDlWTCm56biryi
         LGrmK1mAH0BElY2ouBADXXoSQ8A8U6dgY928qLZUt1RI5NDdwarT7pnelDHfPwchOon/
         EYjg==
X-Gm-Message-State: AFuF++n97M7GCVkCxEcGX9hXhANWQCV806LnQiTNJ2RTKn/IzRYiGlKq
	E1vwvKTx6qWcXMYdmQIkRUsv+mvu+71z3arj1BuZRS2C2JkobU94wX6q
X-Gm-Gg: AYBFou1+UKWD7u8Tx2vG/nByxuCbFzser5Q+oT2nuOhQ685nrXcCXkiDE2PtArTTJlC
	pyGShWE9dbmL9glcXpn4cYVWOtLMVJD8i6XkrC3/qrKCpU7dPRbCajxrkORc+2y2b9MEuDN3Tdf
	4es3vlBq5Mwh5r1AQB9Iemav07uoK9mTUF+6lM837Zk/FzVuLPwceOFz40BwOzr17QjscwXX+66
	p8WjGfaQDxF+srqulIV5HlA1n87974UDGtYcTP5RMiaUv2H/F96qB2R5viEeIgMGl1df1Iot5Dq
	P5C4BnrfNpz8dxKP6kTnnkCFeJeBdMXrTwZnxAcePRJnwgO4qXDT4wteFgsQdUqhLQ8vz5E9z13
	NnRXS03Eg526EhrvlbhK+VX9myu4WifXR9O5anFL5kfTUmkNHTTKuik5RsQgz7xW/sq5HKeADiG
	QmqfvNxB34Feee2H89S+TTp/SK4t/HkMpSpA8zTU3qSQOM5JXLqyv5hHAZ1YZqPB6BHCVTQoy2x
	AirWWtz+tpsmWAPsYledvZk
X-Received: by 2002:a05:6000:25e7:b0:487:35d:cb0f with SMTP id ffacd0b85a97d-4887da06e28mr508409f8f.14.1790289683867;
        Thu, 24 Sep 2026 15:41:23 -0700 (PDT)
Received: from ehlo.thunderbird.net ([2a01:e0a:880:2dc0:3e8d:e7d3:a406:828c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a30b1dfsm2382883f8f.4.2026.09.24.15.41.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 15:41:23 -0700 (PDT)
Date: Fri, 25 Sep 2026 00:41:21 +0200
From: Arnaldo Melo <arnaldo.melo@gmail.com>
To: Mark Brown <broonie@kernel.org>, Namhyung Kim <namhyung@kernel.org>
CC: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Re: Missing signoff in the perf tree
User-Agent: Thunderbird for Android
In-Reply-To: <arWl_CVE0g8dSTSU@sirena.org.uk>
References: <arWl_CVE0g8dSTSU@sirena.org.uk>
Message-ID: <9D941A1A-2AAD-4542-BE8D-22B727A1A20B@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On September 25, 2026 12:36:44 AM GMT+02:00, Mark Brown <broonie@kernel=2E=
org> wrote:
>Commit
>
>  4c09f6c47b769 ("perf annotate: Fix NULL pointer dereference in loongarc=
h_call__parse")
>
>is missing a Signed-off-by from its author

I'll fix and force push=2E

- Arnaldo 
