Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792482344;
	b=kKDe4MXTEY53Viuxr7MKThTIcsPEEDE4dNdhrSuFubz01zuBh7n/oloFLBbmch0iExHW
	 jeljOiw/MppS+vOGyTP/UhaBIRVhI7OutHZPxm90Wwu7gV84YB5/+d3FK34dEdPySdLGn
	 nxf2ccr+7BRoy2F3kBYdwF/FoIYlzJ5w3pu+F+i+u0+VEU/hBMMiCIezSA2cmieSkJ6Yf
	 YimnYx9vLh+uFAxQ7iVTfjDJwb/P2CxcaFpw4RSKHmGIFvLhRAYoF2goQbpEpk4QqVmRQ
	 ChfLHHH6H3cQFtwCt6S4KF4s0cn82QZfF4l52sRK4xPBnJTIwDPyWzTPWQ+G0/tWsbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792482344;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0MDgn22B2Gln4kDn6jyy0QtZqKwhZqAtnn1/NKsmOP8=;
	b=cn5FmEZ6oDs7lMaK6HrjmEt4cfihm/8ltf3dwLpUDzJXyHZHBrygCTk1lclnFgaqOLwO
	 omjesdjhK9jHuUdi1eCxxS63ORjjEgrLWzVeTDkoUIqqwwMfapKAdnre/J8ZWZUYhDtA9
	 tYM4okNTps/r2RbvJCGgmSU4dDMQYQZ8zWWZYl3no3n9RAoa0U+ZPlJwMxQhhibYBoPmu
	 qlXxOepimspb9g/Jnvy4qyM5gM9bWbVPqRjNI5MSoCoNRwbqqrSZpZx4cMP191JuHPRTj
	 WMRODSOrjttmEI6hBLi0Ix+yb00zIK1rWsMHd76YPvBGvKhwvel+asTrcX6qu+gx1FQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=s4hvmFub;
	arc=none smtp.remote-ip=209.85.167.43
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3143606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:45:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3143606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=s4hvmFub
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5be47aa555cso3039567e87.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 00:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792482342; x=1793087142; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0MDgn22B2Gln4kDn6jyy0QtZqKwhZqAtnn1/NKsmOP8=;
        b=s4hvmFubg/23R7MjICEaX0RocR2izVlBWbQXLheVV3yMxO5xs5fcApUOoYUL5H0VsA
         39kw/f9IEjsNHHvxrQrKN5ZlVZd7p/8vgwc7NvLXcZ4iGjXOyHH7SjzMx8tXeQFxqPOU
         VQknwi0YwUPaWl0aGAKhr+AHJDJju2DaCIS/fdMhGcYgondcaUPlbsAplMhLQX2pW5AP
         +Z2g8iSReQc7aonc1syHO0HKtOIJCs9ACYOOV9PDK7K+ZvhUWC6XbykK+vzinxttypWC
         zS8UweaejF5EJULZyobQ4l96edwqN9U1NemR8C5tMjrO+L0Sy5ez5e2IuKTp9GLF8kdi
         b+YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792482342; x=1793087142;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0MDgn22B2Gln4kDn6jyy0QtZqKwhZqAtnn1/NKsmOP8=;
        b=ec1cu6Jp7emd/W/IkxrrmYSckwEqXGlHBUrkTzPVeKTZ+D1GFbEOySmNwu+8aPBGCG
         L0tT+OiwrQbSSr+Pnu4YsHqM0FqqtQ8XzxbEwgBxtnQfuDx6FmIcAK4hiVglTAVNKB8r
         h0aoIeohOLefgsoHGyGcKmAPgFJVtm2M8wwY0GONo8PfDtWj4DAYS90npCk8bvZdnrN1
         Uoeu1E8BFQyBpsnCkOQVqAhfF58sL0Rmy2FtyW6oCaA2jkvgP+gdP/sd9iPW+DdOOfKr
         JxYRr5Zch6iEpMT0pTu8tn/QiDfV3JkJ4NdtEvwmC7pmRaKmAh9pye2cOBacJWYtrJzt
         uHSg==
X-Forwarded-Encrypted: i=1; AKwUvBwKDxVAY8WEWPsb5J52qy/z2yAAv+ttRus8A3euSeUb588FqvYZTPLhuyalVqa7pP9lWwjSq7C2jbng+qw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKru2aHp6qrXKX90gPccpqvFcNPB/cFehBxBrq+yGUJr3Pq+0BL
	p7zhFrIWV3djRG72gY+IFt+d13YzxCEE1iA7iotbBJg0oOHUIVdk8P/2dZTjcIm6
X-Gm-Gg: AYBFou1i0e/ny8eOTJ4/Nez7O7JpplR6GqX2ucE45PjOxef79u5ftdgpbaXxWHNBf9I
	mJdDtWF0kl54ImvsygayRgJfGjntoZpiACkmyj6yLMz/e261Dd0nXxmPkEUN8VLf0PBUyicgxz4
	VblABI31RK98UdbVJnCsePrQTYkQk11VcGLMR20dbLqVNHk9RL6t8RkVDu0Bvag9mDL9LhMo263
	6IM/csyOzdJTjj6Ph1D1jhGS4mwMqikUZ3pXa4qtNS+YiI9fzj4lHwZEC3vJaG4wuYuiTWQpn/b
	3b3biRD4wXPJ8xt2L58/GkWK3iWpdQappLrzwC8JJaNjOx86grKbnSWd8n7rff+Bf8bH5y3BxTy
	xGd917eAoVY79keDETZC0eNC0oze/5KbqxwBjmjD5+FBZT1xSqURufCZCSRWtmeC62rLQyE8V2V
	FGloGv2ls7Zi0mIyOYTiBYT/hR7aE9EA0OevuVgSWdSBOX18yP+Tds+S4uMZd+2y+1Zza7jvBYT
	dwLVopRI/XcYa8qlyhD
X-Received: by 2002:a05:6512:10d3:b0:5b8:f16f:d4b6 with SMTP id 2adb3069b0e04-5be50a79196mr3315671e87.39.1792482342024;
        Tue, 20 Oct 2026 00:45:42 -0700 (PDT)
Received: from grower.astralinux.ru ([38.74.72.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be4a42abf1sm2466787e87.19.2026.10.20.00.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 00:45:40 -0700 (PDT)
From: Alexander Martyniuk <alexevgmart@gmail.com>
To: alexevgmart@gmail.com
Cc: co+0ea1ac045375cf05@bugs.sh,
	davem@davemloft.net,
	edumazet@google.com,
	gregkh@linuxfoundation.org,
	horms@kernel.org,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	stable@vger.kernel.org,
	xmei5@asu.edu
Subject: Re: [PATCH 5.10/5.15/6.1/6.6] vlan: require the MAC header to be present in __vlan_insert_inner_tag()
Date: Tue, 20 Oct 2026 10:45:33 +0300
Message-ID: <20261020074534.277692-1-alexevgmart@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012163331.45783-1-alexevgmart@gmail.com>
References: <20261012163331.45783-1-alexevgmart@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

just a friendly reminder
