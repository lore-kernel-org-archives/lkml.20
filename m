Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7490242D7B
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 02:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792290334; cv=none; b=h9A9PrqKNiLS9WZbrE1U2aeZIrBUpa5a6X+uQMzM/dr13yMSB92sOHuy1qOZWIjkQ6JpKl1QLl82slAlCx7swiVZLOWKhVVeajmux5cZRt2S4nnyyEY3KpLpI243vrvChoQnrjPUeLWJm7eT0AWxVGmf6dtQ/txbGqyboJ3vIMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792290334; c=relaxed/simple;
	bh=cOWgL4Y5aOSoL3opS9VqD9bwE2Ik8UunaS8+RLwbmv0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IghhErVbBmJ8FnRGa9VbMxfb0dDI63rkmtEO4vTdDiuxrv0u0gJJBMoBc+AJycUrER3QszMOVisS1cVlsBFmpwNpE8MsVhFL/dzjAg50xnANBSAsyKCK3AAjiB5kHMESvLoNPJMBqck3gJogZtVNQQZaRxnP7NVQek53OV5eOz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de; spf=pass smtp.mailfrom=bairaktaris.de; dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b=sJbwSk21; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b="sJbwSk21"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c315869241fso106818166b.0
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 19:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1792290332; x=1792895132; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cOWgL4Y5aOSoL3opS9VqD9bwE2Ik8UunaS8+RLwbmv0=;
        b=sJbwSk2180ZFZkpasPbMUs+VnMuDmisi/Ml/uMIqWgJu+Wy2c8tk0IPP8f1gNewA+9
         7j4qFEMLErx/AMNezdDNt1ya079p74pP1J2G07FVj4DcMBu3XwhRcP/KVRuQY9N/X8zI
         g3QUPlvDmAud0UDDID/3PKF3hyiMlNaFURBHy6HaQCah7yvngWZbyE8FWAZOz2EIZ6im
         4Ztw1lG2LyAbP/lJW1CMRQa/j1l0sWkuM+ufTN7wTzXQoxvLfe7no1E6s+oAoor7hb48
         dwwcD7adG3cEge0Ghw7bGupo+mxFmjjgLJHC5r5QdV9kGaSUvM0u0sObg0arJdHDXXcD
         VfHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792290332; x=1792895132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cOWgL4Y5aOSoL3opS9VqD9bwE2Ik8UunaS8+RLwbmv0=;
        b=bygbWAmM83IvNIU+wq8jzkkYkyKXH5pqjBCNOUJspVJmHLkn5wvZlJr+VJQnDxDhVV
         6+UgSNNniB6NieshXBnwl0LA1Ii9EmZxlXRcBOosY+xKyeodS0oZbqhOkEvRw1VR0N+f
         GAEV+v/00mrj4EAoQugRj0RNTt98GLUxMvq2Qw+EdXF00KUkWNXBzHPmbZP66+Xkkml6
         UXndqlC1Kgd+H4k1m/VkwnNUpK4xXxz1e2NM+mcNtk6sZVpRizVQVyncfkQU15hSm+oz
         KQad6s4kGq2UbSsD46pK6duIzWkQyNLyYHfHed2HNp6ccX6ABNJWjclZfKW3Ujl1wwAc
         kErg==
X-Forwarded-Encrypted: i=1; AKwUvBwDQG3WN1F8gP0rotF48caX6/Dk8z2xsFfQQvEM9i1gbW9H6XDhg76cQQeI6L41Lw90YtjBKiX1A6zhLws=@vger.kernel.org
X-Gm-Message-State: AFq9FYLgx5XMn+a04OkVeGiFxuYFA3qFeaNh0xIhKl2wCp8p+GQFHjHH
	YZyVn/PSu4g/pfvgfRCja68K1kuNSrNIHGV3JdWeQyfJ8ZtqvodLja3+qk3w9uzoMg==
X-Gm-Gg: AYBFou1XKjtiJN/9IzpE050Et+bxNQiYaS3mn0wLPc3BUO0anBMejPYbJh3jToiAsNx
	7OFwH9laXGRstLt/OjR9flp0US3i6XYjtN1PHPJEOu7m69hScDkqATlhjz2LnbDbYYZkD/2LeSF
	ZEmO1Er8Re7qV9Q1vrAXxGaB9vlI+9I104hCY3H6OOpeIpgiaw8UYw/l3UAQ8nrM3oOCg+1WFFN
	V6CEgfvhihhfFki2e4jc5QV+fm7crckKJ31+X0pyvmChN0gxG5BGNoYjPWlWDn77VQ+BSVwW1kP
	7et/Yot1D9EJm0QhowY38ruwenvefxQ1lKjdpq5BUwPmr3dsBljg653diJc/3AZQmpI57KupalW
	UEz2ae8T7+yTjqFIj/Cq99wN5J3u3JeokfFyduHwV+Qw1XgLXQaQrX7j6pPi18aJP+LrTAxZorl
	PjQjuYZ/mc89dkmeA6KdaP2iGAPaqs1WP2bdQnpvu7hvKUOiiMLNWPKd7UE1wxprCPMFrQ5PEsX
	h2s5p5OFYAwFKuvAqDic08woEHQGDfandPlnGQuvjeItNcMXzOmuoGQS1ju5jRUJvPQlOewuRI0
	xfmd5BUcNo8+aJSQOh0LmCoTYK5JaHURRaaMA9hgB/GiBfWxp1IbTfNzJVQUoAscLh81YZro3KJ
	hUG7UzQmG5v7z2y1Vc77eCjyxq2ZunqI+55Gd0MnqWJc1AmHETasx10UfneZAdcOmEs6R5tOx07
	Dfum+odeVh7+MNqgzXVEBgq78L/blG3hIGPBoJH5cJ90VG9M8mCb24xFWgntR2WA==
X-Received: by 2002:a17:907:e849:b0:c40:4320:de2c with SMTP id a640c23a62f3a-c419e73e2a1mr277700866b.15.1792290331870;
        Sat, 17 Oct 2026 19:25:31 -0700 (PDT)
Received: from Desktop.fritz.box (p200300f247429d100000000000000a27.dip0.t-ipconnect.de. [2003:f2:4742:9d10::a27])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40913c4c5dsm222994366b.39.2026.10.17.19.25.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 19:25:30 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: jianbol@nvidia.com
Cc: pablo@netfilter.org,
	fw@strlen.de,
	phil@nwl.cc,
	netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org,
	netdev@vger.kernel.org,
	lorenzo@kernel.org,
	nbd@nbd.name,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	corbet@lwn.net,
	rdunlap@infradead.org,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	saeedm@nvidia.com,
	leon@kernel.org,
	tariqt@nvidia.com,
	mbloch@nvidia.com,
	linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH nf-next v3 1/3] net/mlx5e: Ignore FLOW_ACTION_PRIORITY on flowtable offload
Date: Sun, 18 Oct 2026 04:25:27 +0200
Message-ID: <20261018022527.4065122-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <CAC1t37K0tEMzxmRhLeHnH-TPx61pZmCHt0xxTJ5Wq2Wxvzv8Jw@mail.gmail.com>
References: <CAC1t37K0tEMzxmRhLeHnH-TPx61pZmCHt0xxTJ5Wq2Wxvzv8Jw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Jianbo,

v4 is ready with your Reviewed-by on 1/3, the rename to
skbedit_prio.c and the consequence line. Pablo asked to handle one
series at a time, so I will post it once the fdb roaming series is
merged.

Thanks,
Julius
