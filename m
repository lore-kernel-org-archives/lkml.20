Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6BD4475346
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 21:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791150190; cv=none; b=F22dtTpiSXP6l8P3eNjt6b55iSrI3Pz3iqMmp53R5UpRU1L4dvWzYKCMhIxjtZA8NOOMiWSeoniqx8wyffThWLsCjEGzsp4NuW886wy2OY1DlidCN+oSchEa9dRWP1YEeJSoWbu+HN/iInqnQQx/fgWNW2d24pVpguOLujdyZgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791150190; c=relaxed/simple;
	bh=ONQ3/fm+VvJcbR2hGlWWmoJvTQ4LkcEql3G60OArTd8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SLQVOVgDTpbKY6Ab4OO3DD5V+CDTIslQXVSODveMOBiYGh1TpIJPpgPV0tUVKcK4D8XsPddQcbDvH/wIhs0QqiyUF783d9AqZcv9AGvJBTCvlJzsO/eo6SLpY9FoAx4cWh+IAeMgjUw7Nnfh+Ezw2oZba6aGZRFKiV3SWty3P7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tw05ZvwO; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tw05ZvwO"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48c5358fc28so429371f8f.0
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 14:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791150185; x=1791754985; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=44L+w1lo0aEfL1hM5su/VJjhXTZhdo5HD8XfCtpMzH4=;
        b=Tw05ZvwOODV1gx+0jiHCKped/cJPi82G8/unjkIEmDya/VLQZKaBXscApMH/ZHbGBc
         HrfqA+4hy+nXSBpR/NBvRa71qLYUzVBXZiJOKB9QujsOG13gJo3O0RvPBA7LHLh4UHY8
         59kiD3YQrCjUlAIX+NYoozOqpc9Ll5oLHIzngtxwbhkVaZJtekABeZXchxpJvbvncP+Z
         Tw5sfa4MRj5drP6/+hRFjUHznlyeLzMc+1NAtBDRx+MVDUVmFrJCdn7dtVFj5X1dTvJC
         rwk4/io0813IUk9ESbIa9EL1i/WtkIt99av2M94TNqDoOUhYvVLuTmmiSEROhO9kivzg
         no2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791150185; x=1791754985;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=44L+w1lo0aEfL1hM5su/VJjhXTZhdo5HD8XfCtpMzH4=;
        b=1mKuVBJ3yi+Vmfzfw7GtZ/EL/8aVi5A4BKDV4COS2aWMfSUkq+uzm8IEncEeixI0oZ
         b6fhsjoY5gvUpKs2bG2wN0KjLpr2tVNikc73F0CbqBmR0rXc0brJLRxhcFBKNXNTBH12
         1Q9ANnBnTdr3i8E/ehkFQVRycceFWbLkHvRwHhomhjh/rvqNA5FtEvu7t/xO1UJ7eN3e
         MpLUtCwLGel+wKIE61QM5NMNTh+efpvgOkTOIPGLx/YuiaqRuxGIWl+aJfDIvwnxrOjz
         +dJErL2GWLpmGXi2zjlf6Zkkff6KsvoIkMU2Ao0rm4BdF8QDg7Rh1O+kBguXVYy5A7eZ
         uP3A==
X-Forwarded-Encrypted: i=1; AKwUvBxcmRca5TB+lXVnHEcBhOnSy1mZywbp/jqlAmXdnhYRZLq+s8VIRLA0cAsXJHvupTkXz8HWcRJTArPuQdY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIZTMbBAiao0QbwJ6s6vD1i33hCpAwx4qyPpCr4bCL/K7mqi/hz
	9Co4IznsaROcy071VJUjfUpCyCPyvxghhuYpzBwJVkiQFZTCP/SUvZP/
X-Gm-Gg: AYBFou05Uxz56hyp7+iHB2Fx7ixtphRTvPQg+e7gL0mrNJr8nwSUHjhPZz8QYng+apz
	0fZoegAfvNJjmcPly7zOivLU0MD2i2mnPx2AHyKT5i6e1UaaMfs4IvxNE3mZlf9pZGAmo6Sr8AQ
	juoh1QPXN6JqTQO+gyMmU+2U5Mtj6bmPOLlKUqktWM4LJYya5QGlZL5Jf0OWOV2/cKDZJRo8Q7q
	y7Gw8EQoG8p3v1UuK/9itaJGxq6LGjXyoiRn1IWqcdnp4p+yT+Nmo1mhpaE2xIK+/1E20IUmpzQ
	cbXswn4Jl2/APQ1t9tJvaFlaQNHfOXaOYWcD8Gb1KlsAh9sP1o9/IY40eCgjzg5J0d+PNBgF19M
	0BNu5sK+FE+AihC5+NkqU40Y6a9U2VCLv1yphAwvQ+j3+pU36Sr2Sw/nqw5LvR6u2q+5vnlMRQh
	6pMteNbSmZ5tlFzXpuCppdy2DiY0G9k7eiORZysExuxXvIbxKWWe5QnazQsirs9yA4Xvi0teFPa
	6bOXOvBFsDNtQrOOPCiKtY00JEDuXbVN09lXxY02wN+B2rEsCiV/LdNvToq
X-Received: by 2002:a05:6000:491b:b0:487:834:9307 with SMTP id ffacd0b85a97d-48c48023772mr8504789f8f.50.1791150185325;
        Sun, 04 Oct 2026 14:43:05 -0700 (PDT)
Received: from andreayoga.localdomain ([195.122.200.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b38104e07sm19331801f8f.31.2026.10.04.14.43.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 14:43:04 -0700 (PDT)
From: Andrea Parri <parri.andrea@gmail.com>
To: netdev-bot+sinfo@kernel.org
Cc: Andrea Parri <parri.andrea@gmail.com>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>,
	netfilter-devel@vger.kernel.org,
	Phil Sutter <phil@nwl.cc>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Ido Schimmel <idosch@nvidia.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Bernhard Thaler <bernhard.thaler@wvnet.at>,
	coreteam@netfilter.org,
	bridge@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH nf v2 0/2] netfilter: preserve bridge egress VLAN tags
Date: Sun,  4 Oct 2026 23:42:51 +0200
Message-ID: <20261004214253.5432-1-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <179114935323.1402591.1020652042294576959@kernel.org>
References: <20261004212429.3648-1-parri.andrea@gmail.com> <179114935323.1402591.1020652042294576959@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, Oct 04, 2026 at 09:29:13PM +0000, netdev-bot+sinfo@kernel.org wrote:
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.

The issue fixed by the first patch was found by an LLM-assisted scan of
br_netfilter. The issue fixed by the second patch was reported by the
Sashiko AI review of v1 [1]. I then confirmed both with a reproducer
under virtme-ng; the reproduced symptoms are described in each commit
message.

[1] https://lore.kernel.org/all/179084999520.434549.4764913674478855382@kernel.org/

Thanks,
  Andrea
