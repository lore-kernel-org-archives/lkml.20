Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1DF244AB88
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 09:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788773507; cv=none; b=skUv+EX20ibLdLOViRnSxqmC4ETuL94R9VtLoaiuuE8EwSGJVw4+QSnS02QYa+V6d3yC/5W/pi8tg31QWsur5GS2llSdArRZVIlaOIxMm1D5C/U7sy13qr5MqGPPFocynyiHui75iINMHXF5DmSeukA7wy3S1a9cyxUYqCr9Ntk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788773507; c=relaxed/simple;
	bh=Th+Z1q0V4zPiQYGZPxtT9YSQKgS/aF+czsGn/Ny+bDQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cIFv4MCBV4peWVnrsCYRbfebuDgz+oLLjL6LSzCb4156Yunj5+zNzrgDygeTsi7QX0EZleMe4d5eum11DomJUznrqlT/Snsfk4YEApNEex7HF1YQGrbW3uUa8oD3IU9K5ftNSOl8yWKagnCvTJMgGB8wd2y5c58H2SXWS5kVGeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dW5+NEID; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dW5+NEID"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7f0167e59a3so2247195a34.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 02:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788773505; x=1789378305; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Vh36yaSDktV57csBdLTXMj3w1R2afjebrhYltH9Evw4=;
        b=dW5+NEIDIDCU1lIVCZE0WcbWayJJFOY1wVqVu31s1DiKcsB6R4NT1x8NcP5cQWvsDF
         rwJS+vQga1XPrjYW54uFjpgPMueZzOMok+BnGLzAPK75rQq7u5y1fiCqqINlT8CrOU0s
         f0jTHiyH16LXl4s57uU5G2vPSSqfLVtIs5pI6mrUxEigN9hxCh/jJyiaeBCs7FE8qx2W
         z+v25oJhDw9C1jzY0vvp2dkJhjbTk9s3LS/yq7Rz8UQcC9G4BKf9pTi+P7UCIGtgwi29
         deAQC+i6zpZcSh1wjC4QMVNU/LHVOp39fOoLL+15s2BQtf9N3r8s9cl9fnuFwwp58dRV
         hIiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788773505; x=1789378305;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vh36yaSDktV57csBdLTXMj3w1R2afjebrhYltH9Evw4=;
        b=oU24+D3knDGfRP6f6tedrweGaJv+npw5387Kyc+6qtZJ894voIR/ysGwTgw/1UL6Ge
         3zt6epuBthclAOcZY2JZ9ujiv3s2xpuw+zVBW53MhWVZYMbSdq5aNFcSggg7tr5M0xgn
         NB0T8XuFTipE52MGDZH7jEdidViAw9exsBJ9frX8goCtmWlMHJikSNrsO/RLQFtlFJXf
         f+sHOFWgEFYEY5t+wjYP79N5fHH1l/3uLOQ9lP9hRailzM5O85jAvlht4qdP69xKcGU4
         4XM7fjlRp71G6YxN0TGldjY4THLGa3dDljXPidtxgB2WCjr6yRSEmntpkwbTTnSTVMYw
         NB6Q==
X-Forwarded-Encrypted: i=1; AKwUvByKiULHrPp2ObWN84gRdDujZxUZ881O1QH8JC/Hve7GHBwPi5AgVHl9tIacRkCr37cp4gKbn5cieaDr0uU=@vger.kernel.org
X-Gm-Message-State: AFuF++nMfUhaSxrLTZfA2fDwAV7odOA0txwsZdze869PIDFsyP1ONVg6
	GwGLtk0pj43lQ08QRrVMk7kWTNo4cTaGHBRuEk/bK1b8Jg0GNTYkjfKo
X-Gm-Gg: AYBFou0VWxLpPiHv8dpsJbNUTLI2fqmt9a4SBEemB/EepcZAbAYwRfa4vjZ4XVg3vXX
	7Rr3BoOkF6R9r+shC+KH4PNuFNaNpvNTqA8iF5anP9aW3CwbEAygWYEbXnndIfeGY5jl3eE7S0b
	BmwYB55aL4KF030WMYlqwacCieAf0UtYyaMKYgpAixsjtnAXJJ8ABvyagM8fJDddtcf/oUgOU5E
	ncxZYq1X6XTyopZpfgtM62vmKszyUPK1CgKyi2ugdMw98Eu238nr6tJN1q8UADCAuqRFQXAHKxK
	ZGnAJgKN1L79OvihrvLe3LrDIUpr+sX2sy/nQ3oFNp0sAqzGpMYliBPsT2GMLE9Z6qnJxxZ8HKb
	JTLCskwDc1rjuBWX+lWh+Ohwrb6CYGL9X6Hx2NYP1gsN5Wu3gvOlujvgCU0qRsWoBKD0fR/wenw
	tJTPjxwtS5xi2XzqWP4ZqzCphwzWWSHUpvngA0OzxBk/2+Bm6jIyQHmbjBmdFdNfMZbqeRi2i7Z
	dpIHloqVQ9rzQ==
X-Received: by 2002:a05:6830:34a0:b0:7fa:ab72:9e04 with SMTP id 46e09a7af769-7faab72a877mr12868818a34.28.1788773504746;
        Mon, 07 Sep 2026 02:31:44 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33517b57ac8sm16320232eec.28.2026.09.07.02.31.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 02:31:44 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Xuanqiang Luo <xuanqiang.luo@linux.dev>
Cc: osmocom-net-gprs@lists.osmocom.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Harald Welte <laforge@gnumonks.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH] net: fix repeated word 'to' in comment
Date: Mon,  7 Sep 2026 15:01:38 +0530
Message-ID: <20260907093138.24589-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <aa963ff1-0cfb-48de-ba76-d37467676a78@linux.dev>
References: <20260907063804.26581-1-hemanth.selam@gmail.com> <aa963ff1-0cfb-48de-ba76-d37467676a78@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

On Mon, Sep 07, 2026 at 04:16:00PM +0800, Xuanqiang Luo wrote:
> Typo fixes are cleanups.
> Please specify the target tree: use [PATCH net-next] instead of a bare
> [PATCH].

You are right, and thank you for the correction.  I missed
maintainer-netdev.rst on this; it asks for the tree in the subject and I
sent these with a bare [PATCH].

The same document also asks not to repost within 24 hours, so rather
than resend immediately I will send v2 tomorrow as

  [PATCH net-next] gtp: fix repeated word 'to' in comment

which also fixes the subject prefix, since "net:" does not name the file
being touched.  I will do the same for the other patches I sent to
netdev today, and use the right tree for the wireless and wpan ones.

Hemanth
