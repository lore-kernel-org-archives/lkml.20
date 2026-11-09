Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794212372;
	b=uo3T3DsIuDX4imo0AnlFA9FQq4+KW07XMkVzqq5Rz2FjNULwOv4pHG1qzGT/xlHKioha
	 8chz0ALQirHM92iN/5ecCgKUzy9mv2hEceLQJKn5gU4QpMX9AxcCyZ0gp1DacH/zP/OuY
	 zbA1dFrKsPA2UIB2KeLTNLSJ3eXPlpS2SdLWUxSZ5bBtQq38r4KNASNkoBUl3eYDQgAgk
	 /OFGH0aqHMK0COQaYTbO+uekNTGVNfFlDQC8qC1z8IruWwF/2Et9t0KxQJvnlklQTdU30
	 Ohwa84PwGx0wXH8uhkzVIcFaRcOydTxhYd90Mu5/x0rvF3VKNMpdnVwJG2I2lssZH0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794212372;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=FD3v7AJwy8DIFmDfqblW2JXd2GdEynyzTfuggqPhEMg=;
	b=raDnvsLS7aY5op0VU6pm/bh6eOhOmP7wgl2ZKfBqdGcVLEMJDeX3AA4WaUxcT46vmdYU
	 McncahdASW/6irKmMV6tE32AlB4rYp7gpjcO2W/slxU2pmKVwjE4TKToizPKoCZHlbliX
	 EXtlICUh530EznM0j9vttj7pgTaAw6dh1JozdN8O/eG0tXmWfTTa9fSg1HYBdu1eBZgTa
	 9r/R+01B1PBAko4v0xoopWEPKfi53wCs7yQQEblGZwrSaWz74heIdFcGMomJZ5Z9xqQ+F
	 m7jwp0eC5nh+rbg3NPzJkh8fym979lLSX4aRGV0w6WZBF3kR2Mvd8Of41pKvB59aVgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=modelmiser.com;
	spf=pass smtp.mailfrom=modelmiser.com;
	dkim=pass header.d=modelmiser.com header.i=@modelmiser.com header.a=rsa-sha256 header.s=protonmail header.b=MF2yaVXa;
	arc=none smtp.remote-ip=185.70.43.20
Received: from mail-4320.protonmail.ch (mail-4320.protonmail.ch [185.70.43.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75FA2606A326
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 08:19:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75FA2606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=modelmiser.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=modelmiser.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=modelmiser.com header.i=@modelmiser.com header.a=rsa-sha256 header.s=protonmail header.b=MF2yaVXa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=modelmiser.com;
	s=protonmail; t=1794212364; x=1794471564;
	bh=FD3v7AJwy8DIFmDfqblW2JXd2GdEynyzTfuggqPhEMg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=MF2yaVXaYM+VMnZcgF2uk9v79PkSQEk97rWpg7qMLROKI7tx1b4TX2nGyuP0Zfj+d
	 xS1jYjasA6uh/jR/uhEa/0qD9yNzcFBWCICm3n1jlg5FBfqb+mHR7KqeKPaNZjWbgN
	 o4AS4ohPtWsi8GA7eeBD0JNyZ6pKvUiRX1GaFBLyeGLeZ6xJ80cqjJRtLk+/2/s+Mj
	 Re3DJBTG8Gdq1TqWpkTNEuBSDb5YydZMys+GAmSPhB7AP2Q/SX8xzJ8MtVcAXRBwef
	 OOQArHXR9/TjyglIaw9x1QvBQp3K9274w0EvEjXkPZ6PcZU1e15jTf6+rGYsXXG/UR
	 snq9oMJzBq5Ug==
Date: Mon, 09 Nov 2026 08:19:20 +0000
To: "Rafael J. Wysocki" <rafael@kernel.org>
From: Chad Aldreda <ca@modelmiser.com>
Cc: Len Brown <lenb@kernel.org>, Chen Yu <yu.c.chen@intel.com>, Shuangpeng Bai <shuangpeng.kernel@gmail.com>, linux-acpi@vger.kernel.org, stable@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] ACPI: pfr_update: keep the state until the last file is closed
Message-ID: <20261109081914.276006-2-ca@modelmiser.com>
In-Reply-To: <20261108233900.4043941-4-ca@modelmiser.com>
References: <20261108233900.4043941-3-ca@modelmiser.com> <20261108233900.4043941-4-ca@modelmiser.com>
Feedback-ID: 232753253:user:proton
X-Pm-Message-ID: 41114a838137cb3b14372a20ac78bf9b88533a33
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Shuangpeng Bai reported this bug in June, with a reproducer, and I missed
the report when I sent this patch. It is the same use-after-free after an
unbind with the file still open.

Reported-by: Shuangpeng Bai <shuangpeng.kernel@gmail.com>
Closes: https://lore.kernel.org/all/178144969601.60470.7781990940097306115@=
gmail.com/

Chad

