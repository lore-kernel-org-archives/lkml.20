Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E31E73F1044
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 16:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792341497; cv=none; b=U4SDXj/6ZksngRKinShOC8pR9Kw2wG1hJexQybnN+0iOcWgW6GJ4ouXdkXSZukR9Qc3aHx+QRvzuYHJOiW4AqgoNQE2/XoxPyRyy449qwa4RutobhdernYzGYTI1VCRhUq6zEmZyKYVVVPc9wnoyfNBQHK4tFZP6aW040djQutA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792341497; c=relaxed/simple;
	bh=cWbrnQSlLPZR13S2XvAfyai9aYQ6B1FO4xtNhX/Qx4M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hBdNbz5CO4HSIGYDv66wybgC0y+c6l84YwNLPJmQE5spiMbxx0vKjutpIkdQOhN8pgCTfdozdHvLPp1zvh3xB3yyXnE17z6xJDrUWyHW38CV81hGSO+HXx6/CgnyRzG3lt6e+SNU2ZAntvtEUfOeszmn6DA0+LW5EcSJgrD6CZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iUr1RGgJ; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iUr1RGgJ"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a1e477fe16so2426425e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 09:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792341487; x=1792946287; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TUsjSvWYWV+jMep3Ewn28rSL6gnhBkjB2DvYwQ5XLq4=;
        b=iUr1RGgJrvWVubQmNgV6Brv5RxQCXzHv27D49TgZTx5jctorfkH9t10V7X6CoI8GIe
         3Z4YKok8jtpRQ4CE546T+9b/2BuMOxpxFCs2a2Gjappoj5BqF9SRHJsi/yjbPFv+2fVD
         ycj652tN7XbZckRChijHBlVI6A0kZP9bRwrRhf97kkh6+Jldsdj+AW16Y8VWdKwz5d12
         eQncEQQpE7WQ1vzFTivEATMXgFmAayd+FrHfI1aCr3FcxFe0F9nJRJDMTktbvSmGdg7e
         Ub5FefKrlH63LV7HhvipTIeRARZg9CAEIM+A1BuuugaDHbxBYE8Z4sSxhjb0nBwB5sQn
         srxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792341487; x=1792946287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TUsjSvWYWV+jMep3Ewn28rSL6gnhBkjB2DvYwQ5XLq4=;
        b=qJHgBL76NyK8nlGh2g5nUPMa71xJfkioKP3cMNx7P13wTEEe4H+q4kvnpvcxoAsNjt
         4c+LvFIn+ETKlteTVJojpanaSPY2d1aiabBsO3hviLOYq3c15iCz+4t5itW5r6sw8Axl
         1IqSC1nv0zqSGzI89OiSvHskZX+i8cuv+0P6rOolgS9ubmlSMDya3rYwqLvNkvwg7VGt
         YD7QXPdUDoRr4isc9i9FXyVsqzVQXIuTw1Zix+guzqsQKPRSLjN8DveEdvALSWE3vfza
         jR9m6MGXJZUtacBbb7+U0OZZoWAvJb42Z+KuIGEz50LGQTonWo9YivXCF1wZg9Krplt9
         n2Ug==
X-Forwarded-Encrypted: i=1; AKwUvBxedSj1Gq0NYXkusyH/aSSaXiQbyfxA+HoDA1xt1HuKFk8IU4unw/x34VTSqWUrhuUvAb8F6SrK5fRXpx8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJA0JKHUb5PiXuXgPOc/RtY7+BoE/WkHeR61HJCX/06Pi+6n8KH
	R4Bj9kZs5klaC70bEtt80H4St+OWuGkwIBAzYbB4+/4MG3MxE2Q2to2r
X-Gm-Gg: AYBFou0FxH7HNjGrL2eg0M+HyqNeo3OBwosIFVtZUqIPJADC+hb5SiXseAa7RoGljvj
	7JKiI/zn9CUjQxU8C6kxxugmW55BQd2fctYoW/ckPTZq6Si6ezswjuHXATf2CIMpA3kzZCIGA83
	g7gpKmmYgU/BkMWDy2axd6aNcYNOaPVe+54H0EocdhfrE2RleMhxN5qWB8vW/EiuYPrAbiRohT3
	UnYeG/9OQLXFYsdtj1lLBS2sSuN1PVSGBQAbtLTKUwOn5w6NdUK0rU83Jmbu8iMjUU7i99azE+F
	mHvoquGfOoDmEtMe7WYd0OUbRG7gFUbll/23S2BN9dDqk41ouED+mklm1pGGILjfMdOj78KvNwI
	QwBeoaM3+sYDczMZTvPAshrZHlUqiBTjWkvTw4Gjpk4k5CSB8sViIZga+5mf0/tOaC85+2zGo8C
	osZnGBZGPzHS1Dti3AizrDNfag4IbLeLXTuB0xoJu44NL+LdpxULQsltLSM4Dy8FO3na7PY6Eqe
	xh2rF+cwe667Ji3c1S6jthNqWMqkEDf+kLxws1VNdf5Hqn+cfXUbqcJ18MzabgkmQ==
X-Received: by 2002:a05:600c:1d05:b0:4a1:bd69:526f with SMTP id 5b1f17b1804b1-4a1d75ab235mr106971665e9.4.1792341486776;
        Sun, 18 Oct 2026 09:38:06 -0700 (PDT)
Received: from localhost.localdomain (bba-217-164-203-125.alshamil.net.ae. [217.164.203.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd47104csm19824339f8f.8.2026.10.18.09.38.05
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 18 Oct 2026 09:38:06 -0700 (PDT)
From: Ximing Zhang <xzhangjr@gmail.com>
To: ycistak@gmail.com
Cc: linux@roeck-us.net,
	linux-hwmon@vger.kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (coretemp) Document sysfs numbering and label meaning
Date: Sun, 18 Oct 2026 20:36:54 +0400
Message-ID: <20261018163654.45358-1-xzhangjr@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261015171759.704526-1-ycistak@gmail.com>
References: <20261015171759.704526-1-ycistak@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I tested the documented sysfs numbering on an Intel Core i7-10510U
running 7.2.5-1-cachyos, with all eight logical CPUs online.

coretemp exposed the package sensor as temp1 with label "Package id 0".
The four per-core sensors were exposed as temp2 through temp5 with
labels "Core 0" through "Core 3", respectively.

The topology files reported the following SMT sibling pairs:

  cpu0/cpu4: core_id 0
  cpu1/cpu5: core_id 1
  cpu2/cpu6: core_id 2
  cpu3/cpu7: core_id 3

This confirms that the per-core attribute number is core_id + 2 and
that the label identifies the core_id rather than the logical CPU
number.

Tested-by: Ximing Zhang <xzhangjr@gmail.com>
Reviewed-by: Ximing Zhang <xzhangjr@gmail.com>
