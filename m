Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793375313;
	b=LMqvvjdnT7Snztp9wE/tsmOrO9dv+nmDN5p5GoodT6lf1yaklywGHI+EuXeyAGNGIL2P
	 0Vg0dpTZUBGCWwhaX5TODL/gRI69aQM4VvGcDyyDtEEdmPs+quNcrXyNeT5UACbU2t6z6
	 MC+379bmnmk9uazrmij+NZwUqycShbURPj/4ILzu0Ah5cSg1n9MDKbdDL3cRW79tK1tIQ
	 TcgFbCGdTcnLrbKHHPLxElE8UGGHNQc9H8e8GPuRshXINo4rq0kETAooBUIZpC0TvcByO
	 5oya1z8Tuk3aXjDs2zyxtn7IVycJDkhg0gVVj/t8NNKkbxNRcqyHzhuz7HM7vb79LHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793375313;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=D7Nb739quckQ77jV3KqYZdtlT/t+j69ACdTMkdCt/y0=;
	b=OzygtglSzNsYppMhGs+e+HZsqZDI5/NUj6PiN4gT8vJYoDCvBEc+boC9mKZxbrCLSwFD
	 W8AJ9ELe5LUWumcO9Pc+VcOtCFAOu8wgcqsDbjoAPTEqyBI5H1nmFElMPHmVMF+YDMfYt
	 gsp1T0mNESU/IS8gdsOAxCF/+VVCWnasoVucohF9OsZnYjezkhFn5LTtt0rDhO688idPk
	 ELxq6KQY2vuKiZId6rSH5q0+5b4YJLoplif/dmRk1G91S2YudzDUPXUjUWRWY9xRWKXE5
	 vvdPMs6uBQNZZZ8voaUOqhstO+3AaNvwko2QVULXKocLtZriaGEwNhbheBSJITYDgEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OEJIFHpV;
	arc=none smtp.remote-ip=209.85.215.179
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6C41606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 15:48:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6C41606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OEJIFHpV
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cd3310348d2so900741a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793375312; x=1793980112; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=D7Nb739quckQ77jV3KqYZdtlT/t+j69ACdTMkdCt/y0=;
        b=OEJIFHpVPFrGr4CkWoHlYmWOOF8kMQsksBU5UMSDoP1X/xPu62z03DMXun1AIiu2Ua
         I/gkes0i+OOdh4IeZ0jQCIxOnriU+k1YhfWSk8o7S4CY+/5hG0bRHepu+vS8hfcHY6jk
         5/SFVcnOTwlGmGNUme8gsDz6BRAKum+1H2+L6WMJ57NlxpBlTLlqWWVeh5hs3r5GK6gL
         6xuLtNS6UZSyBOz1SLqYpQ4p0guBcivY6AUY10MwJadZfZTsX/udoocNkV88a0Xw+daB
         K+MgaDbhVw+De06il5TBRChZ6SQEg3mgPVqP00/kZir10oEd7PHbI4jFOwFmzlFXbQkI
         dQ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793375312; x=1793980112;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D7Nb739quckQ77jV3KqYZdtlT/t+j69ACdTMkdCt/y0=;
        b=pbTavX573jLZ3HP/sjvHH+aNF6eSYJZQT3z88trTw0oMI/z4ErvoAh6ljqjmeTyEYw
         FcL1ySVB7JCW3uJ2zBELVJpA53oUCj4qfoHBFUi2YFTSqN3sEpja133W/ewtrQGhHewW
         KRM7HA2gqv7/wud8GRHEKsRIY16MGx9sBNtcTFqq/haCfJokli/0ENhTkNGql2GkhZvj
         lEf0lZUWO217taZ5DZ4MOGB7/OlHm31FPdn+QFK9dOR2bfhTHWSIdvEfD42Il6n/NRLV
         vEa/d6t9t20lDMBUFSJ68Cc5WtGSjHClInQDq2yaOg720NP04SWp6J1V0ik+8ztgnnMK
         9l/A==
X-Forwarded-Encrypted: i=1; AKwUvBw0R/iSFTSSbxMy2xX8+/daALkycPEgUgQPLfYSrqgRzBQeCcktcHen7zFTbfa1+LxBaz73SljV8lUe9wc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKD2rVxFto5U0KQXZZ+hwwB7OUen5Plwvyz0X099ysIaTY6qQZj
	lJKhCvi5sIfj8PmqrdQnef46xIN+9N0uExI82JPmiWGThM0LHHXfKRyI
X-Gm-Gg: AYBFou3TWfwkho+b89HBFskiQVVu+vIaSq2RVK59i5fdIIOlfnf8BhXua11Uh3Smibp
	Uu6lgFhCScyxVaYcGktKvxKJKRPtMuRs+kILOyUlSGf2TMyGQQAYm52nCfZfxVwUj3l/Mwcu80l
	SfYGm7yD31To8EEB9wNsPOEwKm//1ZPB3aoH6Bkjc3BcDPkA5nakgHK2rmwnBItOuQju9TSYWzu
	Q0hl9el0x1wbcMGyJSPxvVn1ZOymPO6NqNE/QUFOdGr2IDL17fJAVliacdKdZnhlJL3I3yzBpX0
	U8VmWHOOdugyI8YXjL+qohuOatp+932P/XxrbBmn4yHyaq1X2yIYEDU1l7g9tlTQQ3hAk1SSYJK
	Nw9qdC+QktVf12HpVQOfI7NJ+KXGC0wA5elSDXsjNLApWeZgVbdzs41qbBwfa6OIqMMZ7sYBo6h
	br6Drlwd5ur6cmxhRpAlIhLEUaFOXxQs5caqu5X/WLz86Tmo58O13iJ6tltlZp5ech6RvURhE9+
	b8djC8ZEsRiiMu+vW//DNW1DUd0F3Fl0FT45x4W6VXriVjEvpW4ZVAXkcDBaqui/EyaFa3aL4ns
	x2K3Pd2sngZPtQ15jku6XEUuFY+krAVtjcwOdww2wamwGhpD3SBRCWUQr+m5BXyRhbWJf+ocHuT
	2OQ==
X-Received: by 2002:a17:90b:2ecd:b0:3ab:b39f:41ca with SMTP id 98e67ed59e1d1-3ae8979834cmr1401026a91.31.1793375311893;
        Fri, 30 Oct 2026 08:48:31 -0700 (PDT)
Received: from kernel-vm ([117.28.251.181])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae8441a6f0sm4530737a91.1.2026.10.30.08.48.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 08:48:31 -0700 (PDT)
From: Chengfeng Lin <lin2530632123@gmail.com>
To: Vincent Guittot <vincent.guittot@linaro.org>,
	Mike Galbraith <efault@gmx.de>,
	Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 7/7] sched/eevdf: Move to a single runqueue
Date: Fri, 30 Oct 2026 15:48:18 +0000
Message-ID: <179337109231.3.7251804829997058390.sched-thread-link@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <b1002150c3e4f877d04790cd8e85d2149d17722f.camel@gmx.de>
References: <b1002150c3e4f877d04790cd8e85d2149d17722f.camel@gmx.de>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Vincent, Mike, Peter,

Sorry, my earlier report was sent without the reply headers. It contains
additional will-it-scale pipe-handoff results for 333238da9a19:

https://lists.openwall.net/linux-kernel/2026/10/30/1506

I'm linking it here to keep it connected to Mike's report in this thread.
The measurements and reproduction instructions are unchanged.

Thanks,
Chengfeng
