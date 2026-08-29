Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A52491799F
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 01:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787968353; cv=none; b=jkKpAwMS5Tq8vljk6NoB5ThtXOWcqlQ9tIDSBHrmCwi1ca17RiwMvxC+F1hsLZ9+UqvQ+O60/Wp28Uk7WktsjG+0lXlcNtAve/+/3gbPXvd/MShqSLuwjCGMrp+oiOYH6qHCXXflvXCop+7T0UzFi+8RCJMaF8CAjtZRW8afq9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787968353; c=relaxed/simple;
	bh=Q1fxs9Cuh7MABhOUaj3Dq6spYafZwoVaMo6QE7grAIU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YQZdxM1JZIw7Sv+y9QT2I4HjIiqeMppVfO2o03JwLsjcCgc3KN/YR04RgXYDGxh2qWW3G3QiM+e1Rez13uux9zlqwSBK/kXfD7cC0wp7JwwOMyc3o6fhT0I8QZdcnboLBqeRZ7kxEjdzTX47YlMXLXR5jmB0IfYfwFlDkBwWi4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dQ4nFmH1; arc=none smtp.client-ip=209.85.214.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dQ4nFmH1"
Received: by mail-pl1-f195.google.com with SMTP id d9443c01a7336-2caced6038eso16880215ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 18:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787968352; x=1788573152; darn=vger.kernel.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q1fxs9Cuh7MABhOUaj3Dq6spYafZwoVaMo6QE7grAIU=;
        b=dQ4nFmH1sNXv+lRIDrFlX0HgFYX2rWlgI3u9vqP3WFN5lvMDjSlujDPoTTIvbAk7HL
         YnaqeiZDBVR1Z8X2WM829yk5Uch7jZ5pn0rYpgMwQQAsl94f/j4H+p1KajmXdsoPaglG
         mGxHRAiczMrC3v4O3/jweqqJIN8zKnOnb55MJWj1v1BQj2HMplMrn4UmVQiYZahKICG9
         qCgCiskPIrGcZ0F8Be8dAwqurn4M0DIuJXdoBbpxM9mA3spWNbpYSlV/cf+fiKOnYXN0
         Uks82Th8zaShVNOkMkXm7ymjrsgEossdICxvU1ulcjX53jIiAYeCb1LbySc2CbN03E7o
         Y04Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787968352; x=1788573152;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q1fxs9Cuh7MABhOUaj3Dq6spYafZwoVaMo6QE7grAIU=;
        b=Q8KNw1lhhIIU0NV1fTH+FGHIpvLAzF2BT5P4fPgB70JKQ/XR5HeSPMSHJzfWmhNhK0
         RmM856IiweZDjn/FPS+TvmhcswHwtaUf5bd6kgDCeQpz1mwkGDlZmDfpwY3JBSmiHfGy
         41jfdl089XpJKmZTk105AlDvTasM7drAg99NyPMRn9qmq0HPhwFxRWSB7S7YdFJ9QJVz
         QIm1UGFsmQA0kELTFO5nECeFktinNG52mjreWUpOH5I5R+uquE18h9Pk+KsGLeZFUZK1
         fzjrEvs+gxG8Gw2fW7cJzrv34NkgIu+3nTSC+Qc17DxZXB3ugKcDiMsYhCUZ+DaVt7uv
         9p1Q==
X-Forwarded-Encrypted: i=1; AKwUvBxZ+H7lSkkgLD4jbQtmJKxOt1T9eMPu3hTPcEX8ElKPvqYQXpJynr6Rrla/r8vvTmPdrIYh/Bqq9PEyUW0=@vger.kernel.org
X-Gm-Message-State: AFuF++ml2NeNBdtvG0dMQPKv0S2G2X3wXpVbVBNfM8vyjfECpYbyVmsl
	WuVWbSLbDBVK9ypKgjmEuVQKELOQHw8K687Ajz2F7HiZ6r+KNDQMnhN4
X-Gm-Gg: AYBFou008yLcgHtUiXikwjM/IyD5KnEYtnw0jYimESMmfaxMzcbIymAKfdrio+LZ6xz
	Xb+O+aoXUBOF/QToG15d+THnZqBBXB+T49G3SfTpfHztqTmcjkmeLNSQtl2t7Yo6P0Zp2GR/uho
	Jn9xsirZlIhZZTSErVlXO5v8awfQ0REJ7eJa5EBYg6J1nS//WJnKIKXg+Qhw0Oh9tIIKFE1de0f
	nOazWX9vhTOEFUCF5B0BApMq5rZt+yWM8jiohzXtjDhI4bxCBkyr507/o9YygY4ExyE/xc+NnlD
	a97l31Rh3XWtfj7Q1ieEiegUFltv4O8f3mvrdgUeUJhbzEvAOM3u0RG1N9shxE8+GbSgoNYfQ2Y
	XW4Ev4GGYGVDaSjGUHJ+FRrf4HT/LEOPsaRZuwawFepZG9ddyP9tR5Cux0zNolhqLKEw7LopLb3
	boGh+PH3voHDcdnk0HOVUq+oCKPBKa04tLpZHw1Eh0FWo/LC1y/Dx8NBedw50C1hCU9XwWgk6md
	RgC+M5P
X-Received: by 2002:a17:902:f68a:b0:2d3:c3b:c7cc with SMTP id d9443c01a7336-2d725df6dc7mr197429485ad.3.1787968351866;
        Fri, 28 Aug 2026 18:52:31 -0700 (PDT)
Received: from hppc-archlinux.localnet ([2408:8240:c13:2170:c21d:681:ea:d5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f9e2a95sm9335864eec.23.2026.08.28.18.52.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 18:52:31 -0700 (PDT)
From: Yukai Wu <xiaoyewuz.ruster@gmail.com>
X-Google-Original-From: Yukai Wu <xiaoyewuz.Ruster@gmail.com>
To: =?UTF-8?B?5oWV5Yas5Lqu?= <dzm91@hust.edu.cn>
Cc: Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
 Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Shuah Khan <skhan@linuxfoundation.org>, Alexandre Ghiti <alex@ghiti.fr>,
 linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH] docs/zh_CN: Update arch/riscv/patch-acceptance.rst translation
Date: Sat, 29 Aug 2026 09:51:25 +0800
Message-ID: <qEGu0mcxR2u_YYmRciJGuA@gmail.com>
In-Reply-To: <14a7a290.91f.1a048b9be40.Coremail.dzm91@hust.edu.cn>
References:
 <20260828061834.3645176-1-xiaoyewuz.Ruster@gmail.com>
 <14a7a290.91f.1a048b9be40.Coremail.dzm91@hust.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi Dongliang,

Thanks for your review! I agree that "=E4=BB=85=E6=8E=A5=E5=8F=97" should b=
e changed to "=E4=BB=85=E8=80=83=E8=99=91" to match=20
the original "consider". I'll include this fix in v2.

I've also addressed Weijie's suggestion to keep "Patchwork" untranslated.

v2 will be sent shortly.

Best,
Yukai


