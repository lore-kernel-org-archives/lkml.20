Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B93F44E64F
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 06:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790836097; cv=none; b=BYwmdrRXWMyYStOgeDkFXoolccb7Xrpz9dJt3FHt599pUhUUMPQoQj9U3t0Hg7gGpZZ3CWxMYVLSHeGxXZZRgsBxBfyCThCdrmsEoLVHhm6rUS63L5GDAxcNPgOsqwpSARHET14zSfyK0+xA0Spzz/r74mIq9BGqo+FOoGpsQoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790836097; c=relaxed/simple;
	bh=1LKuc+j7fPCOnVcslCs2pb6L2qo2nOSf117ZUwzJ6xk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OPJimwMqtvRdSbcSc+CAR+nhwoK0WdTi10pt3cEtC3cRSMOSu6x1YgKCIS1c7ebRcM/RHlFduOCMlCbs7pT9vLIUFDp75p7Zf5cumbjdDXilMhiBvWUotLUncwNatt/LZ3SvgXCzouWhNy2fsC0QsRrTi2qnt/wJc2Jkp3JxpNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=aronleigh.au; spf=pass smtp.mailfrom=aronleigh.au; dkim=pass (2048-bit key) header.d=aronleigh.au header.i=@aronleigh.au header.b=Q973Ui5W; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=aronleigh.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aronleigh.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aronleigh.au header.i=@aronleigh.au header.b="Q973Ui5W"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-9104e54b1abso73022276d6.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 23:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=aronleigh.au; s=google; t=1790836094; x=1791440894; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uyL9j5NsMH6VVd620xtlYO1n+HYd0As7KHaBAMxrv+Q=;
        b=Q973Ui5WtJV9KI74wwqvnGe0Tf/6VLTmKeXp7P7JJmIPSkz+VvlQktP1ghm14jHd/w
         38iAuOfpaGgW8usBYKCeQZq7QXvMKmjaFa1bGFjzPBw8c0hyQMsGAeqqp8vuuS+oM/X0
         KD/zvGwfLRTUhqJFXx+1K306BPw2C8E5RnVWk8EET522DtR02/PBnB3eSy5CmDPhrVKI
         hZ5KBC4fE6tbOOGv/uOE+AI4nzowAF9OFmfoP2vj+bbAgJXEV1OxkI87T4WmQgKZexfg
         ddAhGIBEQe5R0JHsdLkcH4VHOjXfr38yuGXY7YzH6y3TpJBBfeq8NP5hfebhouSIa6k2
         lO1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790836094; x=1791440894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uyL9j5NsMH6VVd620xtlYO1n+HYd0As7KHaBAMxrv+Q=;
        b=U1XNGsMmXM5s+/ow2rIahRw+lttPsh9xwihEdT47WCoFsDdhWk7omWe2UH2NSGve5S
         vG7unpJJhQjcT7/F0mmv6u7jvS+Eepxotxdad30aI8ks4n8ziyUd+jMBba6zPcX1FZ5I
         /WwvtYsM26S7iP9ZrmzHE5+FOah2ucnoCqBE0q8rsfah6wLxiIMYhasw27Smxy4EVi9v
         7b/EslUoMXaITO7w7axdBAzWVecDZlc4E1l9psp77Ykl1G4XDXfIbXqQ8ZohgfYWxmwU
         hxiI4g6KZcoqsTLqwvZcJhWNLNt9a/hbNBcCU5b38+J3eOO3p7OGgKUFkIhHWmwVxuDj
         nUhQ==
X-Forwarded-Encrypted: i=1; AKwUvByLQFOYDdXjFZUvNhNHjlIW7i8s43BlNQTd+K+A/8DT2e9usgzKFmEgRkflW0KUEiuKBIU0Fv9zMg37Ejs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLhQtAkZG3SJW4POrXArTzNX9g5TbkE0G1RTqOB9/UnQKoWt0yS
	3uZeyI1xVeylNODfQrnB1vCc6Q755ZQMeCbPthN2OGND0YoKbVLxam99J9dYBOA+ESojc//LVXz
	idavkHaopJIU=
X-Gm-Gg: AYBFou0Jt+dB6j6IuN0qPgEy+oZFYaLVBilF8z+9Q118LF1RdQwZJZkK2mI+NI6hvM/
	4qo60E02MscVOXFHl1JB4SpcD57B4zZuUPiMc70FdaAoz2kryc+Kkn5yVquDvkG5abkOy3t6jtW
	en0M9ICGPHvH+mRRnAPxdIugTFYIeRP9Pmx/uEz3NN6HLV7NhoEizYSTP5pt+gz42zEZVr38KOY
	XLKReZHCyfsH+v7UwXOV1bgBZRdr/dHC4sNcmGebCtRiJVLKOVTZHLKk3mC/I6cLAnyZURKLIj9
	S8S7JJzCelzn4HLHgC2YrR6LXX/xZ7Ky/iPIF+fPV6zxIDjjQ9Ng8zvD9Bto6DydZqxJTFqcP9o
	lHD2NsR5HRuYqPFr0jW5XKs5hvSbhA8K/8lqbXe9odYGbW54VQG8PIXvop1O0zq1r92S+NgMrfX
	IBtNw9icDGN6uTtQiZ6sqTMi/Wa8sTxmQ/LX6b3I03ppmsSPeL2siy5Qt0dgf7P5S8z1hxANu9L
	waq5wB6PjKVi0cttgt6hXOGKyEsVl1j
X-Received: by 2002:a17:90b:2247:b0:3a4:6e84:e7d8 with SMTP id 98e67ed59e1d1-3a4c00cffd8mr926323a91.54.1790731952097;
        Tue, 29 Sep 2026 18:32:32 -0700 (PDT)
Received: from ghostoverflow.. ([103.75.11.57])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4cae71827sm562531a91.14.2026.09.29.18.32.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 18:32:29 -0700 (PDT)
From: Lilly Aronleigh <lilly@aronleigh.au>
To: roshaen09@gmail.com
Cc: chopps@labn.net,
	davem@davemloft.net,
	edumazet@google.com,
	herbert@gondor.apana.org.au,
	horms@kernel.org,
	kuba@kernel.org,
	lilly@aronleigh.au,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	steffen.klassert@secunet.com
Subject: Re: [PATCH net v3] xfrm: iptfs: avoid canceling reorder window drop timer
Date: Wed, 30 Sep 2026 11:32:19 +1000
Message-ID: <20260930013219.280290-1-lilly@aronleigh.au>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <179065460863.1915782.14730367973310266066@gmail.com>
References: <179065460863.1915782.14730367973310266066@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> I am preparing that as patch 1 of a two patch net series, retaining your
> reporting credit and links to this patch and the review. If you would prefer to
> post the corrected timer patch as v4 yourself, please say so and I will base
> the device lifetime patch on it instead.

I am happy for you to submit the two-patch series with the retained reporting credit. 
Thank you for your assistance and work on this issue.
Please CC me on the patch when it is posted.

Thanks,
Lilly
