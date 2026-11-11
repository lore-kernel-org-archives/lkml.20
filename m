Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794425380;
	b=YSFmaqXvUqaSi/yUfabnefjhbK63ZvWv6BlpXQLDWwmsOh0Ak+D5jjkFHf1kYuNvX4us
	 zFp97spDZRmJaZKMilBVHTfU9vj1mlTtyeFeExzUNwNmFySVz4/YsGjW9jZck7pLqR8i8
	 5Ib2/a/1eSV4ODpteTjQ8+NFs8cE0f1gc3O64nLFVY8K4ak462GIGMZpDzh24XgwQ5nWx
	 IK9uvpMxLh8V6KamqWmIKe9i9ybegXt6tpnE2MtSgd82ESiEHEkJkuAkdr4StrvXCP7IO
	 2UjQR9kGECm9jaZtF9c7rXhsDSiSvtsYptCOcHXHYYLW68ch/h+zj9QyKgNMDbxjONw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794425380;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=0uJtF/nvnofFmtS9WloAogRLdDO2MBpuQLg70NOqM6Y=;
	b=kQPXEtvq1MzkeYAI2xfqeUQKqKyeVITa0A4yqH++mpIL8MKOrwV73xaob5LpfbRoutqZ
	 +31TbDT/7vljpnWLLnSLVJwwdUMLo8ywHJMVBNTCslUTKgqDfT8UZcGuGwddtMODAtUDz
	 KMO34WLoQKaPdJOQNsDHjacaYmM506oNnxmbS475g9HVD52DCcrTPS4mA28jIOaz675af
	 sx0ig0DuLCJkJvCg6LQK3pZvE7fMCF+8iQDLCLQY0zbMGtTLAcyqRZvRJpBCSatTNx1jK
	 93SyJvEjglmallb7u+Sy5B/yUrJDruaAD6lD2TbeUgAwRqWzPNNSglJd+390AzDRErA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=C6Xw8gPV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDDF8606A335
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 19:29:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EDDF8606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=C6Xw8gPV
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-491f34b4e0fso1573304f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:29:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794425378; cv=none;
        d=google.com; s=arc-20260327;
        b=CQGAJbNQrchbfB6SDqPM4PDFCsoplXL5m0Jwu9kjzaoGkN+uCxzUsZJCXdl78pCefr
         lPx/GmNorrLlPGdF/kvmzwuMaQnVO3QGNGBRT/5VUH8SOK8VXWZrho5tCJrrj1GASiGE
         OpzRwVdQvkYvQQSzPFtT1dMO6/0/kq/f0zM8X/ywhZ78aSaMP6VImoCRet7DJpjpFmkJ
         4jbCfHuNsazYLM5QfdlS2JTm1cGNLi5bv+9R+X28/Jc8CvUje3UcHXG7OfEitusPJMOO
         54E5p5KJtkWRYvSdcnYI1yxvGBYgljH8zt+E3MwaHGHk1/zvIAka8dGLblhJdVwd+pV9
         qy7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0uJtF/nvnofFmtS9WloAogRLdDO2MBpuQLg70NOqM6Y=;
        fh=AcW78EZBz4VRuQfvNcvWnoSUKpWZyVsORdSR3EC8gqc=;
        b=P3dY97aIxhTU9crCiYyUN2OGOSkjSvzWMtCPPRtAOg3rY7VGew3REpWXBnXk+7Kb0k
         rCoIKmqGvFj0Uw9f2AWZFe3ihxZRJYowgpdKA3XeKcgCC/ZF3J6x55LbbJHhgKUnbZoY
         v1R5hE0pYSp28bIfNAtiUw+WcqvDiesD82x640puJDQQbId1yruwvwWiSJnROWRL5hJa
         22SVm4RZhlmPoAn7uZIbhzAAxJwZIOTPHbPO1oOpGn5oeKe8EvWHk7EmOxl7ONbNXTuj
         gK67zYAPw8cbYhrZsrLSwIVDZ7f0EMeVc9pFkyoMhjwQJoZ3vdCJHuqMJwzWjIyopNeC
         Gzsw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794425378; x=1795030178; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0uJtF/nvnofFmtS9WloAogRLdDO2MBpuQLg70NOqM6Y=;
        b=C6Xw8gPVrG+mVNSSL9d2PJ+u870tFDnlvjeDZ2mQnJYEilOZUT9OnU0+f70Iera5Nh
         bWS+ysqt6bZl0O9lNSxqYjdl/6pf/xUanEGWmr69Xf6n1GXkU3Mmb4aEdGXLwgYAfTnh
         uOf8EK60UrvGhiECyCUzpgkTim8HxQkDOr76o5UualHotxYk3UhwpZ1v0+grlwhqqTz/
         hHxtMosW0AUgFaxzRpEtCuITz6JcD9C8ctvASr/Zw2zG59Tuok/r6ErXbzOhGWJTv3Cn
         kEHKNTiHUGlGPMelTpPmeeXWKW9ZIjdsq8K/InmNZObCCjNnIO8WEgBULdLaseFnQLph
         tUGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794425378; x=1795030178;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0uJtF/nvnofFmtS9WloAogRLdDO2MBpuQLg70NOqM6Y=;
        b=SOTfeJPE22ozSJG+Y58yHAYM2yx20qfcpCTUggQKT4S6hqb3X/V93xDTlbrfasokdC
         4we9RM99MSzTOMwqunl9wJsMpg6wnb1eKWzuVsvPm5tGH/w7e9dESk54jBJQzzXjpOoc
         BpV7A8bgPFlit5REo2u4QAx5+7+Y884+Ghgg6HCHd/0Pe9wJKfDthJzWV9N4iCUOWqM6
         AoSrBEU04W4sdoK00sOxy0u5sZtwVz/THKZUf0+oNyJFnbVnxhpF08vMj6L5UsWx8XGF
         UblsIfSMaSaNjeJ1p/s4ijDR4zdgCYbT8zIYUQuXVfHGHpv7VNqOpLzGhs6Y/cZeYjU7
         mHRA==
X-Forwarded-Encrypted: i=1; AL+hErF8+TE5qQMBczW03JxigGTEC3rn3D62O5RpRH7znFH2hEhJToPWXIf3c6UaZGoNtervFXxfZpIGRZmeMow=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ca5RQtn9W602cmwv4yOxNHCOtbvtyMklfj6vYlb+aqclcgkVI
	pNMTlgqpAPubtSNzAESv8vBWHgcFwE5E1xrAI8+67vkwQaZwM29g42iB9YgrpXymXyBB8Bzr9eQ
	spkRH6Z3v2FBlTnWBRlpOgN59Lmy/Ry3eZ9OpFld3
X-Gm-Gg: AYBFou2Gj+E8x9LLyi7XGeeDtyvbZLUGQ9THrA2FcAWIzJl0taNZHz2SmZtiUdqZRJI
	x81gJbvDn+L0RmwlE7p2RjGleU67M9BKRPh/MnYVRAZm3YUqkGUR2+ddWXcrz5ZBzKLyXhquuME
	3u5qA+dZePpqqb56Zp05I058lhmDQ4Hm14geJHdMBCrsDvTWKgqlDt8kCqjTaYKlUbJCPeVvQUY
	YAciV3Ml6Ed196+/rEfevr4a2EdF9LnAjhkz8q2+Id5TS2pJMY6j9vmyypqeSdaiqjgbXHo4B9n
	q29tAm2UF8xHDEeXnIZQsSh1SOa/UdmnqU6bWwNlRoZe7qr5NHCZXM7iOXrBj/pESS2Zp0HLHmx
	SaM7bQPnSsFHamec5xcjKkdxkDyc59g3EheT/l3T0+FWOWl/LqYWjE/WjKltE/UZccVjY9oHxQv
	b3poTru1RRu542/lwsfMXVQtR7COZbuDA57uy4OUwO6dWoK04ECQDldtxaSmZlVGG4rnSSsoosM
	M5GZZ55TI4flf+kldn3/cPoJeTk5pVkLfBkUQ==
X-Received: by 2002:a05:6000:2512:b0:48d:dc6f:219a with SMTP id
 ffacd0b85a97d-499c6405960mr5972764f8f.27.1794425377867; Wed, 11 Nov 2026
 11:29:37 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110-kconfig-toolchain-updates-v1-0-6d4fb636290e@kernel.org>
 <20261110-kconfig-toolchain-updates-v1-1-6d4fb636290e@kernel.org>
 <CAKwvOd=gkPRazfqjd2xpvW-Pr8gLXVvxBYuzuyAOWi2xwinRTw@mail.gmail.com> <20261111191013.GA2689488@ax162>
In-Reply-To: <20261111191013.GA2689488@ax162>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 11 Nov 2026 11:29:26 -0800
X-Gm-Features: AclHuK8M0r82CQVvygYUkMuWGiTf-D32nwsvHptLhG_qlCYowPaCQaKeVTzLjSc
Message-ID: <CAKwvOdn83etoZPhe9AGkHaY=Xkzxo3jwLgjAAySmgA_dbAxMCA@mail.gmail.com>
Subject: Re: [PATCH 1/4] scripts/Kconfig.toolchain: Remove CONFIG_CC_HAS_NO_PROFILE_FN_ATTR
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>, Julian Braha <julianbraha@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, Arnd Bergmann <arnd@arndb.de>, 
	Kees Cook <kees@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 11:10=E2=80=AFAM Nathan Chancellor <nathan@kernel.o=
rg> wrote:
>
> On Wed, Nov 11, 2026 at 11:06:06AM -0800, Nick Desaulniers wrote:
> > On Tue, Nov 10, 2026 at 9:42=E2=80=AFPM Nathan Chancellor <nathan@kerne=
l.org> wrote:
> > > diff --git a/kernel/gcov/Kconfig b/kernel/gcov/Kconfig
> > > index 04f4ebdc3cf5..f62de2dea8a3 100644
> > > --- a/kernel/gcov/Kconfig
> > > +++ b/kernel/gcov/Kconfig
> > > @@ -4,7 +4,6 @@ menu "GCOV-based kernel profiling"
> > >  config GCOV_KERNEL
> > >         bool "Enable gcov-based kernel profiling"
> > >         depends on DEBUG_FS
> > > -       depends on !ARCH_WANTS_NO_INSTR || CC_HAS_NO_PROFILE_FN_ATTR
> >
> > did you want to retain `depends on !ARCH_WANTS_NO_INSTR` (deleting the
> > ` || CC_HAS_NO_PROFILE_FN_ATTR`)?
>
> No. If CONFIG_CC_HAS_NO_PROFILE_FN_ATTR is always 'y', this whole
> 'depends on' line is 'y', so it can be removed entirely. The noinstr
> part of that dependency was only added because the "no profile"
> attribute is only relevant for noinstr.

SGTM
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

--=20
Thanks,
~Nick Desaulniers
