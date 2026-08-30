Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 276C9253951
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 07:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788073457; cv=none; b=thQvOaKAhhY0vLuuT101ZX+6qi0WBoSnOnPK8plpexm9B6nhrsE98cuku1Bx6AdGQjER96/leG0sgkhLuY8HSPAe4J2yooKLYZgnlqG7HGiO8UNRjnQnAgZ0PtP0jlv+h/liNbO94/YG3zCjda18S1aUHKPlkJdcGdRnLqSoPzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788073457; c=relaxed/simple;
	bh=/fCeRGLBJKDhd1zxoKor8/347vytyDNRSfu4cMLTY8c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AMvSMsUQzp5Pl7Pq1NJ3z+Gb8qQFUWWMX0N1PBf5bydfM9HrhZEyrBryiHCAys5gO6VKenz6/DrWrwt9v9vCzopUO0ySjMSdjemW/criX8zEBhrxVUXI1IbcI3CWZy1moDWdwSJYuRaUXtStEYADG3uw2ysIkCwoQg1d0MKNpGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BOGvu4KP; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BOGvu4KP"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ceab75934dso27409295ad.2
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 00:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788073455; x=1788678255; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/fCeRGLBJKDhd1zxoKor8/347vytyDNRSfu4cMLTY8c=;
        b=BOGvu4KPpPJAGhwUV2oq1SohXW2nJ0RjUyq2OuR48wVaAMTmj4JYBITzoOio6P2rqI
         E2OKlNAXZjyEMnlUMsRo2H6I8zPGdE+tBt9LQJk09Di6A8KE57YOZ2J0kDoOYags0r6B
         U+f2tfb84IEUSn8H4+X/kykQ+sm2vw3MuEXhW5u4WX8kOxoqjirR7kRHoQgYF5MJYRtL
         MLn3zNrMXv5TcGHt21FkUPEbCLj+4rp8IaIgfmVFUeek8bxUQO84kwYDyDjaddyWyXmb
         ws4bXkiT4/XVNy4dXvGnDUVRja0JS7hwLy9lJ0d0nttLpZv94y9E2VNZRDbGee0G/iHC
         i2QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788073455; x=1788678255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/fCeRGLBJKDhd1zxoKor8/347vytyDNRSfu4cMLTY8c=;
        b=WWKQ1T9+UkWu2jsvoQHOllwDT32ZuoUTNRlIVobQ2z/dKk+izJXRv04mBaC2XgKGBh
         rZTiyKZIF4eHfum1GoijYIyVOcs4ZJ3LoZTjm2K47QSk+My3vOGa+z28J8uaHPBPueEK
         0RQyL0FAybfMPK/9JUqFfdFhj3HTiG7PUI2Naedg6N2G2FKmh1buBsXMDyr0gJ7Rhuo3
         Jq+Sf8CJT4qBhd9yaoeMAYP7I/cEEtBv/3C8LsJiw9ngrIV+PxL6rKhVgJTUvZiJKzQ7
         fOSnjH+In7Z5HqRF0Z7wWBphqAK8Cx30yc36Z+6puus/wrFXsZ/tSawf2Bi01klvRi3s
         7s0Q==
X-Forwarded-Encrypted: i=1; AKwUvBz9mmB2ngHLMXQDN23pQwPTJ6K/P/tqTTE5u5gIMxtl1xZvwFS1++QUrXiKcWU4XSpwJ7wr7MuuQQFPYcM=@vger.kernel.org
X-Gm-Message-State: AFuF++kz+so1xC+IKSfcLhjRMA24qHRZ+XbXJfvbqMonsWp2GXAuAifd
	/9r7uqZz7xUqJaspUlJ2tBezCDlx6dNlvIb7wtlqL3TdgbDL7avRsgfI0kUONg==
X-Gm-Gg: AYBFou293xHW/gZ97bZqp/2ITU6eylz70A8V8LEvIiiOs8K5jEaJ4DLYPelqg8xVhuE
	C+8F2WVN+WfKEiD4pFFIptjGduNeu7L2acAOMjaVNXYs5Z1QGf7q22zKZvXkDgjQmo8BJvvaizT
	MFMc4tC69B/Em64tiuuN8NPzb33g8DI5qYCvpJr04tNdCsztoYwmDwUFGWYqgy0GUFp6ORyEAC9
	CsFj9gGgRTUWLTB6dM/ll3d/J9pQgeSMpdVvxPu/6YOzMPpYWNEdFjyWOVqpX8wOpdca54L6saY
	DU5LwFyNuRjVCLacZkxFM3L22i1kRztvgHCG1uga9oeUth4fbFeHG4HrdE5iAvwZ8AWtAtNri3y
	G1pT21LbH1spYwFBHHCblpOwRP81VVi82JfhAuLHgKVX1uZyfMaWig20cVIYr6L4Zf+nsif/qaf
	8JCNMkY4qac0M4grBQQySR8rEinUf5fDPbaFWi9CWz5UCAt/Igg2eWQ4QvyWVT6i0wH29nFMVrE
	GOjaoAT0xuJK2Z/hu0FNqlHXDgC
X-Received: by 2002:a17:903:906:b0:2d8:d4d0:7932 with SMTP id d9443c01a7336-2d8d4d0796cmr169846685ad.22.1788073455150;
        Sun, 30 Aug 2026 00:04:15 -0700 (PDT)
Received: from localhost.localdomain (vmi2317720.contaboserver.net. [84.247.152.65])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d7598b8607sm20821615ad.72.2026.08.30.00.04.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 30 Aug 2026 00:04:14 -0700 (PDT)
From: Lian Wang <lianux.mm@gmail.com>
To: "Barry Song (Xiaomi)" <baohua@kernel.org>
Cc: akpm@linux-foundation.org,
	lianux.mm@gmail.com,
	axelrasmussen@google.com,
	baolin.wang@linux.alibaba.com,
	baoquan.he@linux.dev,
	chenridong@xiaomi.com,
	david@kernel.org,
	hannes@cmpxchg.org,
	kasong@tencent.com,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	ljs@kernel.org,
	lyugaofei@xiaomi.com,
	mhocko@kernel.org,
	qi.zheng@linux.dev,
	shakeel.butt@linux.dev,
	stevensd@chromium.org,
	wangzicheng@honor.com,
	weixugc@google.com,
	yuanchu@google.com,
	zhangbo56@xiaomi.com,
	Xueyuan Chen <xueyuan.chen21@gmail.com>
Subject: Re: [PATCH v2 4/7] mm/mglru: exclude folios promoted by aging from protected in inc_min_seq()
Date: Sun, 30 Aug 2026 15:03:40 +0800
Message-ID: <20260830070353.78030-1-lianux.mm@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260827234704.63163-5-baohua@kernel.org>
References: <20260827234704.63163-1-baohua@kernel.org> <20260827234704.63163-5-baohua@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Some folios may have been promoted during aging, so don't count them
> as protected, similar to sort_folio().

This makes sense to me and matches sort_folio().

Reviewed-by: Lian Wang <lianux.mm@gmail.com>
