Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3256544898
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 15:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788881246; cv=pass; b=AF8bZBwuosT+8MKRwZf5TpnC/y6rSkWXe3cpS91AzcvYEF0SJaRexnn2fMSp4xF5LbccT6p68uZaml2a7PejkzsJitF6gKWNLACUxPMPb5Y48csQGjtwsAIu5fP8G7s9tqz7ISHi2zGFmPYGDcOA5QuzSTNFuJMbnIVEKw20GWM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788881246; c=relaxed/simple;
	bh=NpWv1MGIw8lJhJkXRWnWsKfLORSzk3NhbHC5pDb1BIw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R6Elt0fC3h8r6BcotxzcL9hBc6Z1vlNxfXiPYz/uMMCZyJGI7Jj2eEbquB1rE5Eez6DJs68GgvlTVDtumHPfnxjq0Epdm7aqSmcBZT0FgJUuQKERmaQAzfa8VLFec4O0Rr0w6zWQV/l3yLfN87uHXdkhqFYwJhz6gGta2BpfwEc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N1p2XThJ; arc=pass smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N1p2XThJ"
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-78eaf0ca713so274079137.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 08:27:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788881240; cv=none;
        d=google.com; s=arc-20260327;
        b=rT2mOTq4AovuO7lV6ajdFB2ycnziiO+YLGE+YuPlxIcwKKo5kClilnB1hQf40Prjua
         kxre6ZYQGSpTzYwSoeLH1tJuskfV9thnR/6mnZy/PE8UkOqLKfBKVNdKbD9CA6inyqrE
         Shxxiho2vjbKnxhnsrB0CotI+r4rPtbSd4r2AZcJpkzrD1zHe0UtixP0f/KXnUWYOxIE
         fSNjFrjv71FYgdNK9k+TbBAIzdugFKB8KFNk/76IUDBtpSaJX3ReLG6XnK38cxP2tXUe
         y8p0Dk7xBRaFntV4v4UdEW/C0jVfulPv4eZeLs7uoJoY7+7opLeG6CMdhTxHJ/VZ+z7Q
         +i3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NpWv1MGIw8lJhJkXRWnWsKfLORSzk3NhbHC5pDb1BIw=;
        fh=RBZZUh8opNkW+/NnWmEYWiTsA/VCawAqJpA2uFGCvG8=;
        b=TK9j8g7wxmEBt6xQuBXSlKbevThWvdCqhjwfykZTqjr/tsgpfJpgMyN498Mf0TJ3lQ
         J/3q/iIgbacV0dMb9nOlr9gLM9bS0E7B0l5FhM0s61586Ttvg02sy4mxZn2VQAAHZeQ8
         TNKJSDye3mc3zSJlD2vL8fiF80EjShcYsolwQXSiotIsYEYiOP1RKuNTKeOf5XqRT2cO
         12usV8Epp2U0QqoCuHtSePD9bESQnuFB2Epu7MaHzgJ0yoK550dTxBX7n1bR18pc6v81
         L9u7/7eULkHLQJRkCIMZVa1wYYCVCRouVPclCe5YLyfWkxXduSdheXP0HAPtwsGdLl+Z
         RQfQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788881240; x=1789486040; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NpWv1MGIw8lJhJkXRWnWsKfLORSzk3NhbHC5pDb1BIw=;
        b=N1p2XThJ7MPQ6W1JyiFLQjAPF/zeq8dAeqPk5v/cmim9EYeAw6l2VzIbg1SFi5F1ui
         Nu5dnWjC0X5SAmJje6Cjo2T/LF1DjtadEJqtK4JraJa6WqS4gupfpIygNr9Vvn4C96Ai
         5ZI7eVczrNP+aRAm2g8zvhYaAPr1VHCuKGOetnc+u0I7Hz42Gzhlj168GJWfCFH8fNs/
         vWkddnQmHjM4h8bMaZ1Ov4PiTQ8JjztRPcL2oSuyUjmKrgQpbLipvas6fY6QjQIl/zXl
         coFTwYE7UTLdSZ0telsICJ56f9CErE+9ZQ47tPgMxU1eEsHsj1l54q9XJ51JILjiQuat
         r8kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788881240; x=1789486040;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NpWv1MGIw8lJhJkXRWnWsKfLORSzk3NhbHC5pDb1BIw=;
        b=MAM3gl+hQKLgtG78e/HZnNlLY6IYbHKCxzyNau7fIUCpYtOfUttk1aaztqlIv9x+Ou
         NJQo648O9B/9HZuFdAhriEhvdWLsf9OrnZhV7MeOcZG56DSoPNmiKsYmvuvsBbtjlIhq
         KKVNQpA88z5QdOATHkB+rRRnxdbKHqUp5FVYlZwSe6vnO92vY24DjIEYnxfOWIcIHEch
         mVteGyOXvbDY8q9K0oOMe6d5ubgVlbc9cYl04OQoV3LHud1nWdAKUzV4EFfaMkqnLmR+
         m84J5iM9vddq7fnCIVCS3bPPfLoZQit4aWXA5nrJEgU8XY1liMVsJmVP152sFseEnoI7
         93Sg==
X-Forwarded-Encrypted: i=1; AKwUvBzl+2K8FtYDXtZdFayEZ+p8EU00MQpFD2d1XCeLvO5XnlmV2LwHTyHcNNnPsriHh7e/r0jUeboqh0Nfl9I=@vger.kernel.org
X-Gm-Message-State: AFuF++k1woXd00gATvQ1Du9/y5Y5Lo+LGL1mYJgn/+0FKWNolVH5Jo5x
	4SIqf6b3Xx18MdA55brA/jJWeBAleQZIu7L9hG2oQj108e54T5SKip0C6YG1C/0s1qFNM17M76l
	Tl23HCBE9JSUnE7xXHspWIp4eAwDhxFTXODdj
X-Gm-Gg: AYBFou2rlFsS1y2tT+4vfJhKOM3wblddi4NLOREZ5wMlLsu2MKz5MdxXkyoQ2fxwuHx
	cvcNdqh34HhiiTDOp4d1NcK0k21n8xLeDkBVDIBQ3XrsoyyVxqc7dBvkOuyYw0l1PlkRtcCBCny
	/TvLdvZljeJOtdQ0WPMBtupPgtMQmUQr0tVsZRutub7hfIVSjrICsNZrAlTD4bznyhLqHMcJeYp
	mlWndWylC6HJaOifH+ka9xTiPP42VKu+Oiu4E93pYECmrgqZMQ5C6OV4wFCvPCAY+fFU/azLQ9A
	bqk3TZS3sh+Wx7AdAV0rAGi2dcXaXWLLVq9vDxqHEa1v1ccFo8XgNieIJgjfgenWfK1Yz4lOV+W
	e8VWTzBclPLrHUkOUNO1dP3x0jct65nLdVlW4D6JgC1r/ne/VYxHF3KuIkZXLB9O3F3v1sRym75
	pX46HiHYmwnN0UmgqAGnKuVMnD4/aIIUhe+4/vjw==
X-Received: by 2002:a05:6102:3b05:b0:78f:7135:b4ff with SMTP id
 ada2fe7eead31-78f7135b567mr108498137.2.1788881240558; Tue, 08 Sep 2026
 08:27:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904-submit-sunxi-nand-ecc-step-validation-v2-1-6e3ba6200948@gmail.com>
 <87zexst5ze.fsf@bootlin.com>
In-Reply-To: <87zexst5ze.fsf@bootlin.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 8 Sep 2026 09:27:08 -0600
X-Gm-Features: AcwNN1XTfSZyHBIe8pqnaVApbMCPBzAi1LuuzXv-U_kf3BpB2aghA9-Ue90Qud8
Message-ID: <CADvTj4rFxwgYZgKzcHZG738UV0_94gxG1Dhy--ET9jC=E1dgoA@mail.gmail.com>
Subject: Re: [PATCH v2] mtd: rawnand: sunxi: fit maximized ECC step to page size
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Boris Brezillon <bbrezillon@kernel.org>, linux-mtd@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 8, 2026 at 4:03=E2=80=AFAM Miquel Raynal <miquel.raynal@bootlin=
.com> wrote:
>
> Hello James,
>
> On 04/09/2026 at 16:39:27 -06, James Hilliard <james.hilliard1@gmail.com>=
 wrote:
>
> > When nand-ecc-maximize is set, the driver unconditionally selects a
> > 1024-byte ECC step. A NAND with a 512-byte page consequently produces
> > zero ECC steps before the available OOB bytes are divided by the step
> > count.
> >
> > The older sunxi NAND controllers support 512-byte ECC blocks. Select th=
e
> > smaller of the page size and the preferred 1024-byte step, using a
> > 512-byte step for a 512-byte page while retaining 1024-byte steps for
> > larger pages. Unsupported smaller steps and controllers without
> > 512-byte support continue to be rejected by the existing checks.
> >
> > Fixes: 4796d8655915 ("mtd: nand: sunxi: Support ECC maximization")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>
> As reported by Sashiko, there is another use of 1024 down the road which
> must be modified accordingly. Although, in practice, 512-byte page NANDs
> have disappeared for quite some time, so this is a theoretical fix more
> than a real problem.

Does the v3 I sent look like it should work?:
https://lore.kernel.org/all/20260904-submit-sunxi-nand-ecc-step-validation-=
v3-1-931cec317c10@gmail.com/

>
> Thanks,
> Miqu=C3=A8l
