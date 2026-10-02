Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4482B3E3C4F
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 18:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790967114; cv=none; b=Qmq5ufgC4+/6ZlAhuZOTTHre9XWIFqYjTZRScswYSr/AmzKXftxq0RPpAAlhI2ql4b3EMfpCWDimxWKgjFKwrUVA9BZFWnJUcCJhb+q/zjWPrNjUlTXKaTtApwfmDCRY0KyQSFXODTSxvtOrJY3IiEbBJHwT5+F7VgfA1+++u5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790967114; c=relaxed/simple;
	bh=SvlLnlt6KHX1Jrj2D3pJtCaILFR/9gRc9iadqwmEB5E=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=Yatn8qybqIglmz6I9BTBQquvc2jmNWXl8BQ5vLv4GIMoSKX6FcHh3ta8QQ57SWuyjkhCDAMxhuFCdYikPUfVSA65+XHzd0tlBMdJ/KVVqx1gjqjnWY6KRfZkrgL+hPqhlQPJXDZaK0+aiAh91UFNrT5PKEL5RegBuEIsUq9VGuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AWpa7z0u; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=p6ftKHjN; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AWpa7z0u";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="p6ftKHjN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790967112;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lViRkD+J4l6mElusP3QWY+NSQ6ORF7js4Y4aeDT+mp0=;
	b=AWpa7z0ukoQgwGG9HhZrs2nPndVK12Rd5Ui+rTSjt0jyKJH7ley3EWQz2nE44bMfUtGbeH
	Qa0chSRyMFYh6QSIlCyY4lVMW+Q7sQDcSO4T0nS84t/hK1/ZMbhK9XFy+pKkVL9pG0O3MH
	j5yhN19XM1qjqyubEgTJbS862jq4Y2k=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-434-WYZKuxjCMCS3wP-tIOSpEg-1; Fri, 02 Oct 2026 14:51:51 -0400
X-MC-Unique: WYZKuxjCMCS3wP-tIOSpEg-1
X-Mimecast-MFC-AGG-ID: WYZKuxjCMCS3wP-tIOSpEg_1790967110
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cb6391e89so489073585a.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 11:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790967110; x=1791571910; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lViRkD+J4l6mElusP3QWY+NSQ6ORF7js4Y4aeDT+mp0=;
        b=p6ftKHjNYQtBqZI/7NBFPU13edKoK5+rVbCZqPUYL+bnN+zzBb0VYDLjONRe3oH8Yq
         ZsO5Q1pJwyJGZG+G/oND+B9ey1skQW61vSQ4TdCBkzOsWHmunJsX22DJaOgB2tflQHn6
         HJa3zqpocSCqFnsooTIhhls4jzwv4sp0+iyZmgt3WFdPGFuylrvB6qPpb6+0fqdrE5ZY
         oqQU/7o9fYFHjEeptqHx2HHLAgcaDQ+XcCllPzX7xGseIJoMNa4BYtsA9qSmqXSTxAbR
         GCeXPnDJwPZmN0A+fl87/s6OHcx/DBO6J1tJ5KP8UB1yZdQz/aATPw81DMB6kU8ScYQN
         9Eew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790967110; x=1791571910;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lViRkD+J4l6mElusP3QWY+NSQ6ORF7js4Y4aeDT+mp0=;
        b=vc0SVTtRZANDZxGRkOriRPClHN7jxBIPs1B0P3M82E/fQtzJSgkjBF8VV9KKhsjFpJ
         U52dMmVRfoALj05bW4qascR0OFA5Z4b2Ee4BnehkIzzUz9mZR3/aAgqOpU7triIu3YkL
         7XkMZFfm9JNRFS1HeZyfV4yzDpwbalzgAhpLrajNrjkFA2zQGy+drqCoOn8qVEZXNiID
         K5l1cd/bgBPMEdlToTGJA7MSqlekKUV0W6OJMDQhRr8/89qQuWj1wpA5YNbQiPndUssA
         mad7D8c7952PR3i7ovkwhuNA9UjA0zp82/vWu8RC7fYvL81RHkJRoEqzNoizlyZNqTAn
         GR1A==
X-Forwarded-Encrypted: i=1; AKwUvBzM30rLVDrXIU1u/GxA0OkwbBo4TcdbLXCgO/jNLIkUu14p+dzv2P2JhUzkoeVAyhRFa28PnEAQy1GQAaY=@vger.kernel.org
X-Gm-Message-State: AFuF++kE1vTbdQ01Z1pWcNPv+vo7YChpP0isiy614vlMaQ/4GlkvQhog
	YhSmCYc5ZKbcrRDnPEUFv3pq9EaRsWf2qnosPJ+qaQ2tzcBiUhZUOmXGL/BR8vvreBCux+W/rT7
	AuTKq6qRrCfM5zBHoaImYsi6JBjQqkTKH5tQA4Kt1eHZQrk+H+UH/OFmREjO28MctQQ==
X-Gm-Gg: AYBFou3KJkh1TT+Jzlz3rHCh+pUtRg+b7R3UJbEeDO65nc0IfEDGwDcmn5pFITyi5wl
	eh1E9btARGNEPJ9cNwygF2+yrvwz3WyDOZVRUM2a/397ExuWSwHTq1x94qGI0pgVLyRY15TlJ6J
	5HMsymXZbS2uR3CSWvUmu+qfnLemcWLz4qPHDZd/+eK8Ul6NL4tVkeGFd5FEPohtFpQVJHa8GkY
	r8rfGvpW6yWnz8FvJBTGyXIYsdHw5WUOTNYy/Xaw9g9+8LTFYi4Oyjd+BKS7kCDPWsoPQxrZYQw
	rmYFMwyZDa6sGE7S0awD2xMVcsHMQL0fBhtRxL0sgR9SgrjgKbMtqvAV02FLKPIrhL6Ce4GZDm6
	sh93aCAwHOr7Cfg==
X-Received: by 2002:a05:620a:bd4:b0:93b:c58c:d3be with SMTP id af79cd13be357-93cf17664b4mr670122185a.37.1790967110494;
        Fri, 02 Oct 2026 11:51:50 -0700 (PDT)
X-Received: by 2002:a05:620a:bd4:b0:93b:c58c:d3be with SMTP id af79cd13be357-93cf17664b4mr670117885a.37.1790967109968;
        Fri, 02 Oct 2026 11:51:49 -0700 (PDT)
Received: from bmasney-x1.rmtuswv.csb ([2600:382:7723:4eba:66b1:961f:1a2d:af55])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93cca03a1bbsm290352485a.1.2026.10.02.11.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 11:51:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v5 06/23] clk: starfive: Add JHB100 System-0 clock
 generator driver
From: Brian Masney <bmasney@redhat.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
 Brian Masney <bmasney@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Emil Renner Berthing <kernel@esmil.dk>, 
 Kees Cook <kees@kernel.org>, 
 "Gustavo A . R . Silva" <gustavoars@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-hardening@vger.kernel.org, 
 netdev@vger.kernel.org, Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <20260930124317.5648-7-changhuang.liang@starfivetech.com>
References: <20260930124317.5648-1-changhuang.liang@starfivetech.com>
 <20260930124317.5648-7-changhuang.liang@starfivetech.com>
Date: Fri, 02 Oct 2026 14:51:13 -0400
Message-Id: <179096707364.821688.18177370718453496156.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=922; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=SvlLnlt6KHX1Jrj2D3pJtCaILFR/9gRc9iadqwmEB5E=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLL2/7X6vESXVZZr6Wxj3c4lz4Xy5qcm7nt4+OjFy0fUf
 A+ZPjGe2lHKwiDGxSArpsiyJNeoICJ1le29O5osMHNYmUCGMHBxCsBEEhsZ/ue2hf3l4ON+PnHv
 SvOQsrfpJYHf/Bvm7VBe9Kfo56vsPbqMDKs+HVC7yjLx7g35VuZFnkG3JLSO37uqbflrXT1jv6R
 dLzcA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Hi Changhuang,

> Add support for JHB100 System-0 clock generator (SYS0CRG).
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4f72b4ac27ee..a0e5b4df96aa 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -26097,6 +26097,13 @@ S:	Supported
>  F:	Documentation/devicetree/bindings/phy/starfive,jh7110-dphy-rx.yaml
>  F:	drivers/phy/starfive/phy-jh7110-dphy-rx.c
>  
> +STARFIVE JHB100 CLOCK DRIVERS
> +M:     Changhuang Liang <changhuang.liang@starfivetech.com>
> +S:     Supported
> +F:     Documentation/devicetree/bindings/clock/starfive,jhb1*.yaml
> +F:     drivers/clk/starfive/clk-starfive-jhb1*
> +F:     include/dt-bindings/clock/starfive,jhb1*.h

The spacing after the : doesn't line up with the other sections. It
looks like this is using spaces instead of a tab.

Brian

-- 
Brian Masney <bmasney@redhat.com>

