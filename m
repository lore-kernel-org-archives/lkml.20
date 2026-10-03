Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D347F372661
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 20:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791060092; cv=none; b=tmxuNswWzEAzcbPjKVngTaprGZWl+rWz+ON6gplTx9a1QXm1ifuz+/GdyQ5mr98EnBbA1DQW+k7ZpnA0IJbRKTSoTkXbBrx3Ep1XQdNoD7AP22mEJawxhGpKAZ4vbuqWOarkxwRHiaJ/fvLauSMwFpLCHDz19R+0kNeO9bo/wgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791060092; c=relaxed/simple;
	bh=E6OYkIaqPnUxrvuUCIn54MgF/0vP3bL77kQ5vHowhhU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S2WaSyquu3Q4mH4ejzmHa1CYeBwd/R31AJQR+Y0hIhLfdxzhmv/7v3EgukcixN7w541LTyPIpIXcOIeBMaLtldiYBnSDOYA87SnWNmlay87C6sSrCUcOfSBH7iUNyx1H8p1qMJsZXhQ2bGL6RG+ojxC4Vrh6mRyhr6n31srxDW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E8DzpLQ4; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E8DzpLQ4"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a1626d6a6cso3759635e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 13:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791060089; x=1791664889; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E6OYkIaqPnUxrvuUCIn54MgF/0vP3bL77kQ5vHowhhU=;
        b=E8DzpLQ4BKQgvWvxXVaW+Gl43J2+DyddDb4+0WjX7UnbFdmicwyQpUxUM55+l3dldI
         3GZh8oHjwVl9+KpzS82iw9oAWQyBxCX+iCGI57TekQ7gSQy6MaQygANQNVoArFpPdZkW
         TliQljcE0KalYhmI1z3hy9K5hgiJTbNaBDhie+6ApvHQH7wRdUPk0pn+KJf0V+aTktrZ
         ohzW47SHyhgqOqWD+stxeHN/qTc/+AuIwcXE6quFMYRNSrS4YcYmwlQNMb0ruRxEy81b
         FvJ21qHTbrdUgHrBdf0FJFSHP/nk4vknaVOHX+zaaZ6MU4s88QP5IuldKI2lqhvJ0iS4
         z7xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791060089; x=1791664889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=E6OYkIaqPnUxrvuUCIn54MgF/0vP3bL77kQ5vHowhhU=;
        b=agESNsi4L4D3vyWgkzJ/ycccr466UuTEwyBhzkC8yztmC4AzZoF6kJc20m+KAQHUOY
         +LsIhDNNSK1eEsxYqSCdl2SNfDUePkTlYVdCadRUFv7RLgpod4IcCItDss/SpTt6hWnJ
         Ua1ZWuXyNP2zTFgN/NnZACPpkvYIDR30IOyFYtHiFsYXJxD6E70GPgOHkewg2J9XcTfI
         D+2mXG9v01TC4kXCtTtBlm9ZS9LPXyhe3HHEgumEeFYI5ERibVS7G2ikNxXty44jU8vN
         WvQ8L2AgJwaM475EFbygF7/EOHYy03EojRMrFId7/vgeRyGsdsaV6mqKksORuzadvy09
         KeCA==
X-Forwarded-Encrypted: i=1; AKwUvByjf015Fr9MZFXOIbNC5K8Lr7x9YHFyT1+hv03c7h3QXTQ31xZ4X4N/clfByIAQW4ltuIg4l+CSHPNooyw=@vger.kernel.org
X-Gm-Message-State: AFuF++nGc/1jj7vPo5Mc5sek6nx0nkbvPVS38A4lPnlVVygrKGC1EJ72
	F+DOruWTLuM+g7UobjXWuVULelUesAcqQr2Oza9FgPexKE28k/KRjHMm
X-Gm-Gg: AYBFou3W4O3wTbnKkhFcAmPJJC2OxK0A6GXobzImmxIbVVLZ+LXsOoS7LHEhLmvgOmq
	CdkrzO5+qnQpGYfWzPOlvD+MFjsPvn9kLhubeQQ+iD1dipda+5ipu9/0WMj1t4m1xNfOZsEBofX
	RkvzFvp/IMK41Uzs6YTSjDlLS5wzkndA9UXmsYdDu6yzxGNxErGWN0L6RrP+WBDVsqppW7l/Eme
	HUlprX3V4l37erhNJs5EOEHS6C57UrR1CDjuMBr4ToNveWqDC9qhdMUyht6OWPZfsqWaPL0UKUG
	0+Dev5E6PtDNa+YUx3Wga8tmuXqltBYT7qeuhXAuOqt6gkhZBgBeNmw0y3en1J0+cyi46gdfVvU
	UgxmF23fZwWWR43bUaAnxS7z2TfuxcHB6TxQS+qXClS5lDoWOHIFOIAHoyVfz/VHiMSjJvWJA6A
	Jd/j8oS1VYVMO1Wt3f2BeikWDSTdMDCPwWSFYUfVJg4GldWabWiwUfvrDg8ArAsIzcQ3qGcrGN6
	TE=
X-Received: by 2002:a05:600c:6212:b0:49d:15b9:2a2a with SMTP id 5b1f17b1804b1-4a1680e9466mr44010265e9.10.1791060088970;
        Sat, 03 Oct 2026 13:41:28 -0700 (PDT)
Received: from Mac ([188.163.8.107])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027741586sm197124835e9.14.2026.10.03.13.41.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 03 Oct 2026 13:41:28 -0700 (PDT)
From: Andrii Pasichnyk <apasichnik9@gmail.com>
To: "Jason A . Donenfeld" <Jason@zx2c4.com>,
	netdev@vger.kernel.org,
	wireguard@lists.zx2c4.com
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org,
	netdev-bot+sinfo@kernel.org
Subject: Re: [PATCH net] wireguard: peer: free packets left on the per-peer queues on removal
Date: Sat,  3 Oct 2026 23:41:27 +0300
Message-ID: <20261003204127.15139-1-apasichnik9@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <179105878022.1402591.10615903497956533993@kernel.org>
References: <20261003201625.4572-1-apasichnik9@gmail.com> <179105878022.1402591.10615903497956533993@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, 3 Oct 2026 20:19:40 +0000 netdev-bot wrote:
> - How the issue was discovered, e.g. hit in production, hit during
> development, syzbot report, manual code inspection, LLM or static
> analysis tool scan.

It was found by an LLM-assisted review of the peer removal path, while
I was working on a WireGuard change for single-CPU systems; it was not
hit in production. I then checked the mechanism by hand against
__napi_poll() and the WireGuard history, and confirmed it with a stress
test in the WireGuard selftest VM: remove a peer while a UDP flood keeps
its receive queue busy, re-add it, repeat, then run the selftest's
created/destroyed object check. Unpatched net-next leaked a peer and its
keypair 5 times in 2140 removals; with the patch, 0 times in another
2140.

Thanks,
Andrii
