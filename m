Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793314853;
	b=GQLzySOhkeoNzEEgXAfWpxwRS3xWfPYiL9k7drZMm3CHlGqKXHVgblU0Xvd/lzr9gG9B
	 XEp9bj+oz4AY3JXaTDbe/25MsbJm2MRu9B7AODzCjBwMJd1B6G4jeys9qYOm27KG+wjAA
	 l5YUxkhsF9eWXikni5T+oXGEN3mpG+uSTEXz4F6qbGEqmBlJIquwhzDipPnVORk+XZTJS
	 kpFPCchA0nKkIsO5XZNtB+SgZ0OpA2lNN+Y2qe4CIbuBTzMi7qiZ343VOdB80xaUBRSNn
	 DKRFgWGDq3oLll73UoBqE5XxH+AekRFmQsHjQb37Ip7A/o6W11RCw8fWT9Gae58mJLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793314853;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 X-Relaying-Domain:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=wAkmuO04uLZ+w6vmRTOyMcrwMg7+Yeu0ajM/FtCfLDw=;
	b=WwTd/G2GMUqJgUk3USjFi8sf97NOTqPbYpHxVFyNSU1LVUFJKk/SO5wN6vTgjHoY5udw
	 07bAGhN1dXHy74sZajcY8S5CgCgX90p3knvou8h5ueoDhZuHpZxSzt0w0XnphB8dNVSdu
	 h52NckKHpGur5R4UKdwDq4gPiqzEnj1Wikco3iMWBFa05R9/b3T97nqIP5Oh4tRetbBak
	 5bfQpQfsd75K2IO9E0I5ZcqmoDi00pqzMTi2H7gwfvtnuOOuwNmmL91yk1CSELUFjLfif
	 tnbMCnQdc06OxjQLndCLUHUxeeiKNNddPX/u0ylWiWACC4HBBhsEz/Aaebm8Y0qX92w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=everpuredata.com;
	spf=pass smtp.mailfrom=everpuredata.com;
	dkim=pass header.d=everpuredata.com header.i=@everpuredata.com header.a=rsa-sha256 header.s=google header.b=GCbi1D1U;
	arc=none smtp.remote-ip=209.85.214.227
Received: from mail-pl1-f227.google.com (mail-pl1-f227.google.com [209.85.214.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA793606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 23:00:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA793606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=everpuredata.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everpuredata.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=everpuredata.com header.i=@everpuredata.com header.a=rsa-sha256 header.s=google header.b=GCbi1D1U
Received: by mail-pl1-f227.google.com with SMTP id d9443c01a7336-2e8246b13cbso1120445ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 16:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=everpuredata.com; s=google; t=1793314846; x=1793919646; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wAkmuO04uLZ+w6vmRTOyMcrwMg7+Yeu0ajM/FtCfLDw=;
        b=GCbi1D1UmJ92ke82TBFSwVWyiHVpUnp9ZTyC42iQ4udcBo2eCz0oMhXae06qQwsX+P
         3oBx8srzu9/J7nk03R0ySyKWycHTO+M3NzGbKv/uVDHnsBdnBDDIz6jnNC9lZK/Pn5Lh
         kRPv/tigWoF2fkhBDWUXfkSxbIlt60RKTEkdqWLw0UQtSJ4xF3CyqYP6ZAqA93PyqUoG
         3HrACz/6h768x1TrrVNUTaxhOo4Ze0zrCpCvaHLAewuGOWwqn7UQll1IgIRsXClhhgZ0
         D1i0NBlWyal5k7cAgRXHqD3BvWWm3BQe3Mcft0g1a+LXnxL41jEA86NxSCFJ1ToF+g7P
         9Acg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793314846; x=1793919646;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wAkmuO04uLZ+w6vmRTOyMcrwMg7+Yeu0ajM/FtCfLDw=;
        b=JGze6Ftw0TJEf/O4Oa7gDETGKzRoc3ZcgztUiNEdT2ReGuez3jhAn3Uk5QNsV8Y1vY
         lY5Q37jjhMTWt2luUWFTH+5Ibg0j3dyQgHpQI9ee8CAu58QefEqcEfLDlMsqFrA5owke
         /NAz4xLqH3Hf7EL3nQ9jz5nCjFcZ9ol6C/hong+0+4hi75iCtOnzZzwBoiKuCfiP3q88
         oKXC7MpD1q1c9p4soiYtwvzdwlIHSAyBmgR88zvWQq/zZ6YwzrlxhO2TWdSZf6JCIDI8
         yhVh47J0QEISnb82X/wcTpSQ+M5/rUKwpnkYAWOokGAkPWPadU8TDWzBoRWPPc+eUeFc
         1vLQ==
X-Forwarded-Encrypted: i=1; AKwUvBwa99k9Y73qmO/e9w2wJT86f4wLPdWrun/hHLWFmKuHzXhcnaRnGfema81hIGIrkUaP6JTT/2Wa4mUAwb8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIiG2LM2H1MF5Y0v7tMr9/afPTWAqO/LgeFRbLv7yimI2OscFYD
	48DJ0KKTalkpYzztCm0sNN4PT30NIPTRg+/k7Kf9/KrfDoAVPhF5e1inl0iXgTcfdKrahTpr8HM
	271oagJeoQE/A3OCNgSmfhDyADDRAnKBfjnQx
X-Gm-Gg: AYBFou0rOFHSMxqjlggplqAZoKMK+bpiqdMjO8BoWPaLhg1yGglH3iBJ8Mp88SNTGpX
	ZnnNis3r2ktOjno/wvWz1f2x6Pd90Qa+VwBFZl7C8XeOKyz5zATMsixDEMOypfaGKCmNt/l+KxB
	VhQXC5Ub8nZazTu306N78rfU2KBBrOZ4y0M3uetkPjpgrgWfU7OMWqDZG+keKSgeRxuFNXro8hc
	besEfanZFPYHXHRym6mLIe5zJCnkt3Ro9OFjJM2ErqcXSc85gjrw+aYRQUZDQhWq1W4ZlOEdKYc
	CI6xf3Fgany71YgRc8Iw+aTJkfLEaZwXSWZv3MFgkPBUe7Vu3aHm+0a8mS8DB1sus0j3xtmxlMx
	YyzKfcceacq/iG2d7OdjjV8V3Bj7sCr+qz7E2NsI=
X-Received: by 2002:a17:90b:5827:b0:3ab:be66:ddb7 with SMTP id 98e67ed59e1d1-3ae897bae26mr304143a91.47.1793314845971;
        Thu, 29 Oct 2026 16:00:45 -0700 (PDT)
Received: from c14-smtp-2023.dev.purestorage.com ([208.88.158.129])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae6e88749csm2871364a91.7.2026.10.29.16.00.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 16:00:45 -0700 (PDT)
X-Relaying-Domain: everpuredata.com
Received: from irdv-tmenninger.dev.purestorage.com (irdv-tmenninger.dev.purestorage.com [10.32.149.15])
	by c14-smtp-2023.dev.purestorage.com (Postfix) with ESMTPS id 22C0E3417A8;
	Thu, 29 Oct 2026 16:00:45 -0700 (PDT)
From: Tim Menninger <tmenninger@everpuredata.com>
To: sashal@kernel.org
Cc: broonie@kernel.org,
	anna@kernel.org,
	anna.schumaker@hammerspace.com,
	trondmy@gmail.com,
	trond.myklebust@hammerspace.com,
	cel@kernel.org,
	ymu@everpuredata.com,
	linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org
Subject: Re: [PATCH linux-next] xprtrdma: fix up the nfs/nfs-anna merge of the Write chunk head trim
Date: Thu, 29 Oct 2026 23:00:44 +0000
Message-ID: <20261029230045.1259914-1-tmenninger@everpuredata.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261020161346.3711926-1-sashal@kernel.org>
References: <20261020161346.3711926-1-sashal@kernel.org>
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

I applied this fixup and A/B tested it with my reproducer. Both
configurations pass.

I agree with the merge resolution; keeping the head trimming and
buflen adjustment together in rpcrdma_inline_fixup() makes sense.

Tested-by: Tim Menninger <tmenninger@everpuredata.com>
Reviewed-by: Tim Menninger <tmenninger@everpuredata.com>
