Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFC434A13B9
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 11:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789730706; cv=pass; b=mvQNQ5wCpPyYJqplX8IV5JgN7xXEE5zdB/+oTHeF72G1AU9+6KLllksQecTp4C9Zmq4yc6eVFVkEHk9a62kOxZ3RYpe+A/lLXxWtqruGZfkJtnlRqO42JbyA2CwJwyS57tpV6PYMvAWSmsmh9gtaN30UrOWxRu/D0qH2lVdqLvc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789730706; c=relaxed/simple;
	bh=fxNae09A1OnN2DhU/tJerCjit10PKrqeq902N6O9xkU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=spCGZXfiaSPkJPTXLme7DXFSSOQeaPGZwccGcwqapXsROc0Bkn48n1ioUevoYEKO0NlnmPDLZhPwMrRgTYzy9l0MYKpwax3GpltRjukegU5gkY4dNqUyPvCVQgZpDKdPu6G7pveobc9ZUCxEOsyqOfTPEda/+FeoWzkh+JpEBdc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net; spf=pass smtp.mailfrom=tomeuvizoso.net; dkim=pass (2048-bit key) header.d=tomeuvizoso-net.20251104.gappssmtp.com header.i=@tomeuvizoso-net.20251104.gappssmtp.com header.b=P7hKKBGU; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tomeuvizoso-net.20251104.gappssmtp.com header.i=@tomeuvizoso-net.20251104.gappssmtp.com header.b="P7hKKBGU"
Received: by mail-qk2-f12.google.com with SMTP id af79cd13be357-939109fafd7so52281485a.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 04:25:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789730703; cv=none;
        d=google.com; s=arc-20260327;
        b=gWFItsL2kMp7hd3+fDbKkE5IrDZEK87MFLGJKq8XuJH4zKSyOpdOZdnkE+0uNrrgh9
         6ooOar5Rt57MEkempzEshKUyOHe36J+8+sDCR2BWMbpiFqDKLrYbWDZQAYjcz+d5Mpov
         0D3jJFeN91gob2d5RdH+OOBRFoZ6dLJHRRrDq//eCFs6cSd6PDzgZwG8C/jONQs5NsPG
         bsP/TlthMfQj6f5fuxBa3UOijRpA3pZ0Wb5h15XH8il+Z13peZwyesrv3IHDP9NzOlEW
         4B3UgGNbP6nKCgZReZsGlGXf/KXqSDlR14PMRMT486BFIKhG7ErpNUDD0XSsPZNULprL
         KkPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fxNae09A1OnN2DhU/tJerCjit10PKrqeq902N6O9xkU=;
        fh=XTCiW4kZwLdx4a1FRIj3r9V3/d35OITIHDL6url8dcU=;
        b=Yo91zKTBXejl+C5C5iVkHeOMGbbz22oupDAD4OtoaYeBnc8DZG13G1AtR32llZCwbV
         /rPOo7JBX2JZCjAKQJzxh+ZWYNrnGW4ZH2i+gpO7ySuIkDesm0sfpTSaBBiCbLbdWhQZ
         3iscAmpmWjkLT1T+iQnnQnOcaMEw7cLMFImRlSvjZNVbPc4bDsLvyQi0f7gBIwwn8R51
         jBL0GW/ISGQprGwtOLYGgCxKzwxOfec6PKOmehjyjRK7Ow9z9HhMAkiYRcNd+Wjk0FD5
         npjlPVFJvnGB0JZqlvYTwGy2AV15l7p9SOTm67LTUF0HHDRvshEaGycFjk2zkhkBjcWh
         jUPA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tomeuvizoso-net.20251104.gappssmtp.com; s=20251104; t=1789730703; x=1790335503; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fxNae09A1OnN2DhU/tJerCjit10PKrqeq902N6O9xkU=;
        b=P7hKKBGUjZIowKpnru3at7bFSePHGNg9Uu4liqLA6d6Xhne6zXABV+CVud10iy807J
         s/Lwh1+S22rGZTUck++OVIPTWd8R+21cL0lDunbpKIb1nBlUxSF8yRUgE6qthjVGoI2r
         1G19E0DFZaG6OssYeyQZS7X/c7n6tyizl9Jg2fSLiES8vPmwDjE0/ndrGCJGW99Jrd+u
         mfFTJrC73w4GHSawyMJzuOqVx7yKrjHTOmIp8aYR9pKMFXUE3bdAunXOYbr6/2HYEbDy
         ROOtn/yPpToEViVj5ndsLekwwMZqenFlnML3tK6raKoCfeXA5A1xUOjfVfPSBRz99mKv
         fDkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789730703; x=1790335503;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fxNae09A1OnN2DhU/tJerCjit10PKrqeq902N6O9xkU=;
        b=kj0CjeHP0zA3vpjl3zbMmDOYYRaagTmSu9tWsuaxTsjXENFEUsEWxR7VTGlfF0Vev1
         GpNQxvbqwrzU7AlcUso/dj2aIWBD+jgg29+GyOCt9uIAVhvoRnnuHdh0nGDiOvqJZjfQ
         1EL1EmZ3Mcn1JjqbqIY3kyeQc/Tq2rVhTYBlL1sJVgqw1BsbnXNfZG5c+qNXjn26qhw6
         ZkUWFQtppfevppC7dtGL8Mu8wKyoLwHO+pelST21W5+o8qYGe+rzpHed3swEmB4ZCIS0
         bD3CFWgMrTZe7M+zuX/7aC6h2/qtPpM7TaD6RtTTEuxwfZvkL4/IY2LrcZvFhsMyEpG/
         u9lQ==
X-Forwarded-Encrypted: i=1; AKwUvBxgqYXZc9siQHC92M7Rt+PEEPt9QYzymDb6qMOm8RadtXoWjGDtchmQvWPpfD8UywwfPdhQ0YuoTosLbIM=@vger.kernel.org
X-Gm-Message-State: AFuF++lyuFO6XUqHtmYJF+7QvSZgTzImiryVxwDlBUsDMPwHF/jS7IbR
	8koTnLvgbRMSSwYWi5Jv/hyYbbm45xGWFaHC4ZpGkAn19ncPalOybPMV4OboFQ68MBP2vqLNa6X
	4zkPm2VeONCsBjzcTUAEyMx4+y+sVZZTGfDSBtoe8hvdxnT1MgP/nghB75w==
X-Gm-Gg: AYBFou1w15fUtN5mEp2feO/gzC2vjjG5GjG+LyZs2lNu6DSQaOBUwskAocJVCOHGA8V
	bQ/zmAomPKaH6NBl7JaGUI+tDfnlBRixa+Hx7QOceen9coTslAfcawo07ovTvbue/gVRqIaZI2d
	WQs76i0MpbAMfaOH2TIdG3igEk/9gFhebb4JsuIEVa4VTj+iJw7nXKAlFlhUux3HtJhhcJLc7O+
	//K7IwhoonjdvrfVjXphwzMQwCMQQJVSz31n4l6yHL2P2WCdCHrqcSWhPdh4FbEqmA76dQ2oSW6
	zsDfkbiSY5c/KqsHMief4YBeo28SNpx21432buVGKtrf6unOvEZGvixVkldv9pHRxA==
X-Received: by 2002:a05:620a:6288:b0:93a:14c:3296 with SMTP id
 af79cd13be357-93bdc64eb85mr265730785a.15.1789730703288; Fri, 18 Sep 2026
 04:25:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904130858.27803-1-royalnet026@gmail.com> <20260918100543.23974-1-royalnet026@gmail.com>
In-Reply-To: <20260918100543.23974-1-royalnet026@gmail.com>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Fri, 18 Sep 2026 13:24:51 +0200
X-Gm-Features: AcwNN1UuXA_zYpic264Z4jBxnVkM0kgrR6zKknS_YOh0Jo6_SD-EuICl1_jx1Us
Message-ID: <CAPsqS2QXQda2ftbEJb_-Qeva9ay4+4ysdpUtj8jAvbyAsYiAJw@mail.gmail.com>
Subject: Re: [PATCH 0/7] accel/rocket: DVFS for the RK3588 NPU
To: Igor Paunovic <royalnet026@gmail.com>
Cc: Oded Gabbay <ogabbay@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sidong Yang <sidong.yang@furiosa.ai>, Diederik de Haas <diederik@cknow-tech.com>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, Jiaxing Hu <gahing@gahingwoo.com>, 
	Nicolas Dufresne <nicolas@ndufresne.ca>, Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2026 at 12:06=E2=80=AFPM Igor Paunovic <royalnet026@gmail.c=
om> wrote:
>
> Hi Tomeu,
>
> A gentle ping on this series, two weeks on.
>
> Conor acked 2/7, and Nicolas's review of 3/7 means a v2 is due.
> Sashiko could not apply the series, for the reason you gave Jiaxing
> on 31 August: its prerequisite, the slot-search fix (link below),
> is not part of it. With that fix first, the series still applies to
> today's drm-misc-next without conflicts (git am only, no build).
>
> I can send v2 with the fix bundled in, so Sashiko can review it,
> or wait for your comments first, whichever you prefer.

Hi Igor,

Please resend with the fix bundled in so you get a Sashiko review.

Thanks,

Tomeu

> An LLM helped me draft this mail.
>
> Thanks,
> Igor
>
> https://lore.kernel.org/r/20260904125936.26234-1-royalnet026@gmail.com
