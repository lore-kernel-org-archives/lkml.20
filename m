Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3F1547063
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 16:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792082772; cv=none; b=rq5kX0e7HbU83giHwFBjvmxmGPyt9aRksP5b4sU2h4NAVcBVT0POdPtBagUh0x40TdSqTpNCvFprihCC9z1PJ2/OltDtDbWQybez5vY0Bbz0WtnQLIsd+IXxgp0YRCV338XG5yv/o6DtJ+bLWkufB7cNhqqP6hfLWHjenpzvFRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792082772; c=relaxed/simple;
	bh=4CG7Q72yRGz5EsH68xLRNRJVsKA1jOWn98uDNF0DgEg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fxwcFFtnJIlcr675JtfYTQ/O5HsDL8Pa2+zK6IYkQ0x3AEYaMFxUQddeOxc/nW32Cri43Z/0SrvWMHJdDAF+yQIq8ev5wcsAXuMXHECTsF+e5I9niKYYMp+2cOhzIDdJuT1COj+sSCX6iGIQ33IdcB5kUNeEnwpQnDlCjVeOMIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZmQVP98D; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZmQVP98D"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48df4f7ccf4so121922f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792082761; x=1792687561; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zrXV9sC8WQ9ZwV/XmjLuOdbNwXh/8tikKfM8d34Nfhk=;
        b=ZmQVP98DfOHlSUbELiu6x61tUnZxQv/cjYguiIw4ZotPnbGjGiy72CtJv2UVKI7krx
         bvzdZZOhNYZxKHAALvo10l+68tbRcEtoVN60fQMVaKrRho9eYMFsfe/eULzvyA9SJQav
         H6zBB/m0u9F2YczUVDpIbv6WUSfBssAinUhluoUtbZG6JRdNEBR7FMWeOHYOc3QID0Z2
         j6lu3x8SAvadnPPNcBlCTG3zefhfFCm0RpCTxtSvEc+Nzbv19Px/wy6VPfdSuiiMO8jT
         hCKinGWDCe5EopYbqvmeW4PGMqXdmE0gyV5JaqewaWg98r4gWqczXJADQJkdz1Pc5ep8
         8ovQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792082761; x=1792687561;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zrXV9sC8WQ9ZwV/XmjLuOdbNwXh/8tikKfM8d34Nfhk=;
        b=BjzBNowF9LTggMZhbeD+zswBVTz0nQSrl4N8qJC/8Ysp2MXAKyoIx3cePcRUWEVqjS
         592Ci3MnJW25nJcLInBiDJKki4C6aIEuT7OBJ9/waGBTUXrlXDTDDTsSDN/x9APorAcP
         S0Kp7Kg4nsmISto6K8CO12dgdmg5bWni5tQDR31OeR1BIXzr2ZHEP5xpYnkwfWcDqaCF
         /REpD3xfPvm4N+nxlqPpwJ/VhOoAEdhh117U3H+1lsS+X4iM9+iRXBsaDtzC5iAUX9Cb
         6TZnnnI3JnDM1V7E7kQsGsLmlYcA3NKmsPZrwNw8uCtmrgsxwywNFnz/vqqPUTF2lMm7
         uIvg==
X-Forwarded-Encrypted: i=1; AKwUvBwUy1nhSRyxZIEG344PTwIm5iygn6vPM9V8nWYgOmOflBOLbh2tX78hNyZGqHvXdAhvCXX8spUSZZCbDhA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIvUse3/QcZFua0MC5rkrfxH06Je++wEQt29u5jgzsep7t+dFda
	cjf9+7ofMZPyNZFUCxs/rwSBwIgXSyvTB0oVA0rq4g57lCIIIMkIXK6o
X-Gm-Gg: AYBFou2hHAqNRODmsuc3fqgP86/KmQh5GLHjPHCPQRiTRQCGaptwYqmpE3Ywjv+jQQy
	jhLnfKefwT4SdArRPs1GsLO/IhMcVzsChytA83FYqE9u/so8OR/zQhh4mbcpptSrxlmxXwIzmC+
	1iRugOIwA/lCHP4Qi+W7W3ZA9QoYZELe9C7dalSy3OD4oq4wjABddRplba0zXLO+CLdyp7PHFiE
	uQ0df+FCHMHjpZjQjynWX1JlU1eawIxBWUUyierWH9bM82uNLYsh8J4Ulv5SGdkw8lcFFLCDPfe
	UzHyvE+uYo2sZ5ffkNjDj25JtaPzYqrsf3o6wDPx3CcMAl6Hq9XSx0gtIrmNS6S0GPRAU8mft9Y
	boX87rn+Eu4n4cIAY8ZgoyFsmGA3aBw/TwbJUc9mq2jmaIDFAak2LiWkMZgyY/CECVwpWyvBH7J
	oKcDo/I4oKuH4S+cu3B/bSTrM1rbqy1TXn48HpVoMeGw2BA5OI/DwiVPqTwnP5Qk4v69TAYZSev
	EcHa5+zMXfhUPXo6uG7
X-Received: by 2002:a05:6000:24c2:b0:48d:f102:aba5 with SMTP id ffacd0b85a97d-48df102acfbmr9440964f8f.0.1792082760502;
        Thu, 15 Oct 2026 09:46:00 -0700 (PDT)
Received: from Nuel20.localdomain ([105.118.74.201])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0bc85b1sm19110712f8f.54.2026.10.15.09.45.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 09:46:00 -0700 (PDT)
From: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	mchehab@kernel.org,
	paulmck@kernel.org,
	linusw@kernel.org,
	Julia.Lawall@inria.fr,
	gary@garyguo.net,
	rmk+kernel@armlinux.org.uk,
	hemanth.selam@gmail.com,
	emmaonana18@gmail.com
Subject: [PATCH v3 0/2] docs: kdoc: fix TRACE_EVENT_FN and DOMAIN_NS parsing
Date: Thu, 15 Oct 2026 17:44:46 +0100
Message-ID: <20261015164524.14066-1-emmaonana18@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <8733u7t8xq.fsf@trenco.lwn.net>
References: <8733u7t8xq.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes two kernel-doc parsing failures where the
prototype was misidentified and parameters leaked into garbage:

- TRACE_EVENT_FN() family tracepoints (e.g. gpu_power_status)
- DOMAIN_NS() wrapped function names (e.g. iova_to_phys)

Rebased onto docs-next and stacked as a series per Jon's feedback
to avoid both tests landing at the same spot in
test_kdoc_parser.py.


Omokefe Emmanuel Onanaroghene (2):
  docs: kdoc: handle TRACE_EVENT_FN() family in tracepoint parser
  docs: kdoc: strip DOMAIN_NS() wrapper in function prototypes

 tools/lib/python/kdoc/kdoc_parser.py  | 18 +++++++++-
 tools/lib/python/kdoc/xforms_lists.py |  6 ++++
 tools/unittests/test_kdoc_parser.py   | 50 +++++++++++++++++++++++++++
 3 files changed, 73 insertions(+), 1 deletion(-)

-- 
2.43.0

