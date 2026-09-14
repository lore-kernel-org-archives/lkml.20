Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D2F38F255
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789376937; cv=none; b=YidjUgt6DpBqX6s7mKZzm41OD6IZTBIkh+ylQkxFwneT0eZvowbGlzqpQLnu220zTJL887wiwC5REfs/VZngm9Yg/jsEHmqYJRmEf4zTdhIzq+plHntDNccOZ35itSByKPHWZ1pjEXzzYoY+Iak+cf+he+cqoi3VIZ2hL+Qy/gQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789376937; c=relaxed/simple;
	bh=SjGs3SF4885RJWqLclTH9OVUr04eLBGfU33c2dnnlsI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P77Rd7Cz7yAUptYxFSs/nXNwzGKSfbt9WYvq7R46wxKC31Jn9BALKJQS/3vLZPubPgYxXLHeACPdjql65qKySg4As1E6K64t26sdCc8lgqgKxJcUvU++BpMB4MpMqYGOpWRVJeV81HZlQTw8F6LhPuUqtzpsbjzhr4okG5DYkg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WQ4cxgnS; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WQ4cxgnS"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747f0135fso15370715ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 02:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789376934; x=1789981734; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gJQtgcoFrhEVPWWCr25rEos1Thppun+lK6sg8RjAs5E=;
        b=WQ4cxgnS9ZOJMxjCyLqvg9c476BbI4GQERjsBa33M1uZSNgj6bTDsKkccAaGRcon3M
         Dz980q2hPE9JzA2saKMKoIlfk01lhqZV/2io5hHZjGA+A7MKmjOfe8+JJR4fEL3pLd+G
         IN2CyEuzIBIxUdSLQD1p7zyHwCEodspeufL2PSuzYy8fbYQk5US8EyqtE3fIRyItSWKW
         T6AAqN911xj9IJOJg96TjBToAJx3xsRVBsmr8JevUkysNxv1QyPWw/Ryb/6CSNs6chEP
         e4kxxBgBDDlFb7qg2qhMd8TNY691vci03/ijUOyLiUy4gehe3QDdvtqi9KuYYk2xsyxB
         HZFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789376934; x=1789981734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gJQtgcoFrhEVPWWCr25rEos1Thppun+lK6sg8RjAs5E=;
        b=DVrV5bhku7r78+0LS8++ENXOfkYYLG2CRV8HdeU/EFp8Wqonm6jYcUtv7nlTbq+VBg
         0rRUAC0XVdhvAEie2aYCxJarMgH5ttdW0TBRF8kc0aSyH4cQNi96pRgnZaE5QwaBwtHs
         es3LfptNk1YvH1lVVpoobQxItlc/j9DiZqBG8vYV9ihLXr9hrytqUOFZBtVN4c/2YCur
         QKwa/4daL4rT1rQEkB2hTgPlrwtN0VwxpJSTviIvz6Hv2EpJJUK5PEbcUrXLEZGuc/mg
         LobZhYXYpCMScORYAbNb+ybiEe0or/f1Dhpl5UZ3K1ccGbpWQrrmdisOg2nUCkas2DDr
         GT8g==
X-Gm-Message-State: AFuF++kEzwLLEn6u9Qpt/o1Jyoq5cyppSy9ipY2RABA2cczOwLD5qCj8
	B0JPsUSXuWyOeokdDOP1G1j6P5xRX3B7Cs4dwkYNSdk7vnsxr1weuPU=
X-Gm-Gg: AYBFou2eyWevdo36g9kYHMBVrXHXFQPigs16GY8C/oi2y4MrtyK5kbQr6T9JFTI7QCF
	tNRc4rMBAWNQLT6Mffa1Fk4m47dynlltAAjtctm+n/MOL5df9DKche2/Ry9lP3naG1bpOsTvow+
	MOt8uHORegbZEHUUJBacA/RauCOP1FPCi7rFBQb1AIz4nIzOavOHD5tZ7Q0hC46iaqNM8NseXB+
	Ke8yEtrJLJUlKl6Py1AwnqMAu+EWvC7OQgmp8mejWb8/56OBVHzb5kkQjNXzeR5/q9lvHQpv/5T
	yc9ddCJLHbwnWTeo9bsSt8kGpbmFNm7M++JvpBr/haG3lflICkPKlNMj8KCBZg0hxksg9MDWDaL
	yD1A0yL48ykffam8/o13SMf0b5EFcN78y7sxA38ImZ50LAYfjl/uimuOXfucebmugyjG/ddpsNP
	W29nM8sBxbok2u1KHkXwJ0AzLXLwQ8ZG+0AtBTNgI5OZiIlsEu9+i81s0E1ORIoUF8z80B0f6On
	lKWYpAN+jH+7iQUefwSlvE=
X-Received: by 2002:a17:903:1b50:b0:2db:8ae7:a5d2 with SMTP id d9443c01a7336-2dd6c5f39camr39121085ad.9.1789376934032;
        Mon, 14 Sep 2026 02:08:54 -0700 (PDT)
Received: from DL2XHKPB4.dl.net ([103.63.104.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2ceb7720sm44951065ad.37.2026.09.14.02.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 02:08:53 -0700 (PDT)
From: Triet Hoang <triet.hoang.dev@gmail.com>
To: radu@rendec.net
Cc: linux-kernel@vger.kernel.org,
	tglx@kernel.org,
	triet.hoang.dev@gmail.com
Subject: Re: [PATCH] irqchip: st: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
Date: Mon, 14 Sep 2026 16:08:50 +0700
Message-ID: <20260914090850.897017-1-triet.hoang.dev@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <f2acee4027dfc48515091bc75422d52494ec7547.camel@rendec.net>
References: <f2acee4027dfc48515091bc75422d52494ec7547.camel@rendec.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, 29 Aug 2026 15:40:50 -0400 Radu Rendec wrote:

> Thanks for the patch! The patch itself (the code change part) looks
> good to me. You can improve a little bit on the commit message format:
>  * Please realign the text to a 72 characters line width.
>  * Please avoid using the first person in the second paragraph. For
>    example, something like "This allows dropping the..." is better.

Thanks for your review! Should I send the v2 to improve this?

Regards,
Triet
