Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 574EA125A0
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 13:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787922136; cv=none; b=uuRdvQWY4HWpRaNhHvrAuWmoSM+8lM0e27TyVwLYs6dIQ4wA4xTY1/kw2b3HPHkTKGUqH+q+C/O4UsKDZlHSuRdrgI/dxkIpbYF4ecXpjVCrQopim3H9dIoWiCfUh6ip2oDtf+GqtFW7k9yfCYv7AB4nf4WgPG/CwLszNRI1SyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787922136; c=relaxed/simple;
	bh=QqzBBu7p8nODo/RmFJm1kAQ41J+L+8YvaBuNF7HBWYk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z0CEHacp5ZOLiw0Dq37ccDMSnmY17383OAh5Kn6hUgi2xmyMWCwd9yAvuofqLhG1ML1pzZxdJJvbON+szgJG2R3qjt3EEPgf0bRYrsuZ6osyM/NnoMxPrTGA/RrC1cWtP3js2kzhdJWHx23P1/qbffYEkHDHeWPj2IzfO2At2ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MKsP1TlU; arc=none smtp.client-ip=74.125.224.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MKsP1TlU"
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-66c70f69d3fso1385415d50.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 06:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787922134; x=1788526934; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QqzBBu7p8nODo/RmFJm1kAQ41J+L+8YvaBuNF7HBWYk=;
        b=MKsP1TlUYUeUNOdu8V1C9pJvBi81lkXLkE4S1OivElINshuP9DPCx7gJEDVul60aHQ
         O6B8RkCPTl/CJXugP8mwR1OJ1p9m7ehYskD57AhN2ZDz4e3nRDERritZPgjVEu15LVRy
         nBSSaGRzdLC6jxTKqV4u0vJrtDSn3xph1F3hUgPdoFYxF7vkLRnykoDYMNBik2gI0Hdo
         lf2KGngS4ZsxTN9ChjAxBffVjb+DNyb+QTNJN9V28T1YjgIyqb3CULf4ziTeNelTNhBK
         xFeJxN+/grPnN1+fjaQDj8OD7TNyOnM0mfJ4naf1cgSoxicUCvnF8EEiZIsnEijpR/0v
         RPfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787922134; x=1788526934;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QqzBBu7p8nODo/RmFJm1kAQ41J+L+8YvaBuNF7HBWYk=;
        b=IWO/c7s6PyI+wlBlaqjY/7ylxB3HMopDoOG491z0/BWZNYgTRUjvDG2N/DWAQ4vMvf
         gp6MCp52WRL7yYrxYhB3Ak2EED0kQmXce/83ltjiXSB8kN1POHuxCt9ZeJhyJ63GnN5b
         96sZiwEnJ20vuzz4JKglxklNGlkcFeooMusprMtU9sBJ+B2z7EmRNkRUaeggdDKYiNpF
         GN4+B8owEJXtF+/Slaiw4ERmNE+TNqE2dI1f4X8AzHcjRu6w3MVY0mQX06//jzVdcQh5
         dV55cgrnxJQMdY9Yj6FRnqNbpvdWfxP2QlPGwgYjR9OffBHBIGf3BJxyN4TjhY/dWxUb
         AkyQ==
X-Forwarded-Encrypted: i=1; AKwUvBwM3De5XCiXb6e9Mju1W4owobagMzxgihCCn+kC6sWTijumb5lVTSWisFP0VTHXOWiPuyOkbXLVuvckoMc=@vger.kernel.org
X-Gm-Message-State: AFuF++k/rzx3xGdapprTEqNfxBGrG8xNwpDoMcpaSUYg5GDT6gwaeiVP
	+OFrJb0rwv8Nosa+cl7YqLnMg5P8Mn0LlOT7IVHikC5CqQKyQzMxaMSB
X-Gm-Gg: AYBFou26E0w1L/wGCcaUTjpneyUQG/VBv1iWXw9gUq+RI4nZYpkGgql1xgzZtSiAs9o
	fIR1LMfQOAryTKen6MtZ2vDlQrLY1tgw9g0FIiveOmHEyDJ5p7SkdMSL3ZyeReyrKEOMVmzGQAm
	Dq5PSjXlbsMVWvDTN2d9lGp83Mhx0RU44JLVlD0wye6Kd7im4MRN6rP9zbw2mMkX2CmzEyWqDti
	m2Ftthrhm9c7Zb+UCqRJVjVHM74n6LjM/bmFUGVcdK9kmShTy1HqMw588E5zqCHxDbHAmzU/h0D
	JIh0OIL18XhA+hI/6yvmKGpJalm2kf/qa40ZxoGz0YpS9A0C/8EoOduHohxUguPlBXW3snYfIFB
	BpR4QeAD7c3aF9/86KZ3S8uunN5T+t+ZXZwOUJ/GoGHdgEWPcoEHkqFpB1x+ZEVvV7Jvg/04idF
	VzM032ly9PsSNlj5s+IxAYxjtq6w7eNsDDxd8RLF71zYmrQTlS3mxV4ucTxaucYf8Dbc1GzXlqh
	bOpbA==
X-Received: by 2002:a53:c550:0:b0:66d:264e:88f2 with SMTP id 956f58d0204a3-66e4c6eb8f4mr1512029d50.16.1787922134170;
        Fri, 28 Aug 2026 06:02:14 -0700 (PDT)
Received: from mac.lan ([136.55.173.105])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66e4ed39d4csm770568d50.21.2026.08.28.06.02.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 28 Aug 2026 06:02:13 -0700 (PDT)
From: "Cen Zhang (Microsoft)" <blbllhy@gmail.com>
To: leitao@debian.org
Cc: AutonomousCodeSecurity@microsoft.com,
	andriin@fb.com,
	ast@kernel.org,
	blbllhy@gmail.com,
	bpf@vger.kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	geliang@kernel.org,
	horms@kernel.org,
	kafai@fb.com,
	kuba@kernel.org,
	kuniyu@google.com,
	kys@microsoft.com,
	linux-kernel@vger.kernel.org,
	martineau@kernel.org,
	matttbe@kernel.org,
	mptcp@lists.linux.dev,
	ncardwell@google.com,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	stable@vger.kernel.org,
	tgopinath@linux.microsoft.com,
	xmei5@asu.edu,
	yhs@fb.com
Subject: Re: [PATCH net v3 1/2] tcp: fix use-after-free in do_tcp_getsockopt(TCP_CONGESTION)
Date: Fri, 28 Aug 2026 09:02:12 -0400
Message-ID: <20260828130212.32968-1-blbllhy@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <apGBE3XHKeNohHF1@gmail.com>
References: <apGBE3XHKeNohHF1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> nit: Do you need to zero this string? It will be safely overwritten
> below, no?

Thanks for catching this. That initialization is unnecessary. Would
you prefer a new version for this, or are you okay with keeping it
as-is? I may need a few days before I can send a new version due to an
ongoing email account approval process.

Cen
