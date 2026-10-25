Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792908925;
	b=HXOQEEj+LOApbGogbZWcDAWIcjlpu6o/lPaLgJY3b1MRxDFTx1jIqaDTgNBSz3ZV2d6j
	 RCrf68jhyZwXHlGMtfL16C50+hhwyLjTgknePUqbmjA2JVx5bug3qlwBxsY4fh68RlMAf
	 +l8n0PZNTbCExCQhd6fdFKcsOHzWzJJG6gJud4d7nCY+Qcut//4UoE8PKU4jXl3GEdkDo
	 TutLaBfSZeYPNoJmF7rOgrYqgpfT/z4co2w6CRUS+kO8rrBAG60nMAyZFADOl/sqOJMdH
	 GClLb1Dx/BK5IozQrO61E1P7D34pZkUaQWiLH8LRxxccWI2Sk0I0H3kGkv19STOJGpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792908925;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=1L7MYTJTd8WVGJ13nARkPhok0Xv7jBo+Dah16XPMJXU=;
	b=E4aMeApO0kZDwMDc5KhXNTuv5V8t8ieszZQGRUkjMVA4AHCTX7ftOJkcVqV2dyHKMpSH
	 EJZptRMXdH+TSU3gut8HDlmSrux/WTX7CX2y18Ps/7QJe11SAeVkFiP1GguQCORSP1JG7
	 udzTO+8Jw6TPm/5i+Raw32VRxUavtLJs2Fkbb9t6mg1PoW018CDA4mmKZXiz0fRNB3SQw
	 QC8FxiuNxAL7aRR44ndbyJP6b14ZP1gNc4h9h403UqlxVUi42YnJTbSYcw7AwPJDFjr1M
	 XVZXM9wmFB5/5kWcIhd3dqdxCr/jexbOwpd2jbL6ga0ERW3hqqDxibwk2VcQi+9WPxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=ID51PChc;
	arc=none smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FFC6606A31B
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 06:15:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FFC6606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=ID51PChc
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6acb57c2b88so2380745a12.2
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 23:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1792908923; x=1793513723; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1L7MYTJTd8WVGJ13nARkPhok0Xv7jBo+Dah16XPMJXU=;
        b=ID51PChcAixVVnmGp6/Y6fmP7QJ++uPibZVkw0od/01e2uuNtjvQOmjkW2KtHR4qJ6
         p5bUdNmjKfgurrqf1Ux4Kc5EEOONhcK2JanuZES9g+2WycVyWG2ufIDu2rUAO0XDCH5P
         rxUe+Ju1kH6i/T7X1cvOfLF+hAf/EV5o+oS3Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792908923; x=1793513723;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1L7MYTJTd8WVGJ13nARkPhok0Xv7jBo+Dah16XPMJXU=;
        b=I1Mr4jaoabUPVjyoUcG2sBA8Tv7BPUlrFK1TlrtJxrqK+bEe7Xy9eVsCtJOQ1DUMCu
         OCPKEBzPKoAGz3bsXiv9cGHewDGsMDQXSI0SG4D8+zn1rt/SCGZaq06sxt+77ir9tPNY
         xOKqeJwnom0pEjX4M6ekmt8wnZlrW730B7qNfhLR9Jd3H0g8Gy0E3GV50o3J2/cDOquK
         sSAd+KimaIv0+quoExjRNp73z0HoTDuusamRrtUpVu2iH3EYThtP0zha+5Q1DqKZASuv
         9zzxgNEAUb3/kvLEMV3IFxtdCb1oAtUZd3dHSw16rey1Dah1ydbOsbwFxOnxGhXM8VDN
         N45Q==
X-Forwarded-Encrypted: i=1; AKwUvBwENYZmRz2HWHAXl6IXbdQyRkqz/6+SyW9JaYTZ3Xk1knSz4G2Ce3NBoCcj2z4SMqPeOIlzplwMZuvDDJg=@vger.kernel.org
X-Gm-Message-State: AFq9FYL6Yz6xm/l7w7pD849tGavXcDwTxZ1dr9SY8hidKC9Hs7Sd9sV/
	1hQ+63URnvle4PVqC+e13/Jdh6ocA4xi5BucfTr+Dtpbm6e2FW6Se1XDLlFAKUUnz0Mb4pPQViE
	1Dennl7Q=
X-Gm-Gg: AYBFou2PZ5Tu+yA2Ri8E6mRoXZuqobiQOvZtl3N+Nu/Yi8avQbHaqbg9zGKF4+tL/Zb
	We0mLt+Gpvxt42tUX6SdoKf7xG6gGOEWx9jOgxSC6R/Z7h3zZeIOr4hk9bTAPdRLuCXO8Bg/Yxy
	s9ep9Z3qAH3/RBq3qysawPQZxbC+hUlsvZAq/JpnIE+tcUU5DZR/aFvPN6EL/9T+Dm4NxIn5NOf
	xnbaXuwY0LaWmopqe+fAeOCq43av+gTnKHefBo05O2qQqXtvRNdjW/MMknLv4rZgkgrhz8xpJkY
	VDLIEPm07coaGv5gGbraOlc3qNBxjNcZ5Ss6UXq4kNj7owdh13VrMl5HQVwU2Ino2s9/GyyUwH9
	qU06d3uHKo52WhGz4Zn97T6A0ZlyVmJqeLK+/L5j99GEinoZqY/k3p11oLPOLvays7AiDkDB+sA
	gOE+V3JlVI38zreTy/MS0IIA76gJJOx9lUHIzqqmb3thZ+TB6+erWUsXOHlkBlY+vXVrP3VoHY7
	HtUXdPRBCGv4Rb2kEp14JG4Ey29eT+OHjDPIWhVHzmjii00jbhH1t/5kh/YkkHJ84pWDvO7yO9m
	0RRKcwO0QDCjTvED26/KOfUaVVXPwQ==
X-Received: by 2002:a05:6402:1950:b0:6b4:1df2:244f with SMTP id 4fb4d7f45d1cf-6b44311209cmr4202580a12.38.1792908922797;
        Sat, 24 Oct 2026 23:15:22 -0700 (PDT)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com. [209.85.218.46])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b445991e83sm1959214a12.34.2026.10.24.23.15.21
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Oct 2026 23:15:22 -0700 (PDT)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c4395d31228so305820566b.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 23:15:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByfsWu30oD/P4Iov+3x5k2W382WPA3SDcspkMRZN3rnBZQB6EtKZxIhaK7B9dEOAODWrSlvDfpP+IcWNu8=@vger.kernel.org
X-Received: by 2002:a17:907:96a5:b0:c40:36ca:9d1b with SMTP id
 a640c23a62f3a-c46bde9d4e5mr422758366b.40.1792908921647; Sat, 24 Oct 2026
 23:15:21 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022195741.GA3409202-robh@kernel.org>
In-Reply-To: <20261022195741.GA3409202-robh@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 24 Oct 2026 20:15:05 -1000
X-Gmail-Original-Message-ID: <CAHk-=wi_=AAiRHLqW6DxBfaw0mY-KRtkd0JNS6SqTRmp+f2+Xw@mail.gmail.com>
X-Gm-Features: AclHuK8lPpA4JFhXTyry20nXxc5JcKa7_iIYA6Rr6nbO12sQCOuIinbGoDIc4vY
Message-ID: <CAHk-=wi_=AAiRHLqW6DxBfaw0mY-KRtkd0JNS6SqTRmp+f2+Xw@mail.gmail.com>
Subject: Re: [GIT PULL] Devicetree updates for v7.4
To: Rob Herring <robh@kernel.org>
Cc: Saravana Kannan <saravanak@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 22 Oct 2026 at 09:57, Rob Herring <robh@kernel.org> wrote:
>
> Please pull DT updates for v7.4. There's one merge conflict with
> mailbox tree and the mailbox.txt removal. Take the deleted files.

I assume you meant "git rm the deleted files".

                 Linus
