Received: from mail.noirlang.tr (mail.noirlang.tr [217.18.210.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D604498E0E
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 12:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.18.210.29
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792325944; cv=none; b=qRET+SFChi1pGsVC7zadXhel/Ddh05xIlUBUpspmoY+YNODU6+TvygtfLSCQWn8pRFdvyMngMZ4w+s0Eb/4ioaYvtT73Q1KXT7f9ny3uYMsFLm/lwYzz8AkF6Qr7fn6Xp8Eq+G7j4wWXqs6hVLsIlCqwFYtQhbp8X1nAm6F5Tgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792325944; c=relaxed/simple;
	bh=Gg55PsbPGtcN7IiPxEHl7XyjGCUmgryzK6hatiGnGjo=;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:In-Reply-To:
	 References:Date:Message-ID; b=YamFPOfEcbF5ab5TIZdSYbkVChxnLw+07olLS7WNoEOpoFya/MdBC2KZu/amtNBUZ2epwlS0s6YQF63U+ovvHgmGivqtdhU11/wr0pKijj6Hl4FfP9mFrMCsxE7Dp5xb/rkuCj+5R9Yyd4GZGvNKsG1wOkIOPkos3Zk8aBssqH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=noirlang.tr; spf=pass smtp.mailfrom=noirlang.tr; dkim=pass (2048-bit key) header.d=noirlang.tr header.i=@noirlang.tr header.b=N8lpprFy; arc=none smtp.client-ip=217.18.210.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=noirlang.tr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=noirlang.tr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=noirlang.tr header.i=@noirlang.tr header.b="N8lpprFy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=noirlang.tr; s=mail;
	t=1792325938; bh=Gg55PsbPGtcN7IiPxEHl7XyjGCUmgryzK6hatiGnGjo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=N8lpprFyhEcTwi9DxQIHpXympUP7FlDNI8v6NnHagCtedwD5hjZxmP3p9KQQ7/jzt
	 ZGvJupdxUXOiEgF8AH7+UoyQ1raIJisCZXtm2m6TonJFjH5m3KV7UNTJmiC5RdggKu
	 iaYJxrPuVtvaNAY0p/nxi/0kFHVtHvO2qYwcJpfMN1iLxjmnM2WyWYUSeNULdnieXT
	 2/FGpNmZ6uaBIqqdnDnYcg8g76LNnj9wKKPkgJFoICfourEoojH54cMI+IvDkU3hpT
	 k98dwFDLZJoC//cWErFCbd+g/1AF3Agtp6ZvP2uWlMr/xgczhiqs5lA1IpHEJZJHC+
	 qOgESIx/bRvCg==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: base64
From: Melih Emik <melihemik@noirlang.tr>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <error27@gmail.com>, parthiban.veerasooran@microchip.com, christian.gromm@microchip.com, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: most: dim2: remove redundant dev_err() calls
In-Reply-To: <2026101833-envision-landless-4b41@gregkh>
References: <20261018110058.296436-1-melihemik@noirlang.tr> <2026101833-envision-landless-4b41@gregkh>
Date: Sun, 18 Oct 2026 15:18:57 +0300
Message-ID: <179232593722.414429.5720805089949576862@noirlang.tr>

SGkgR3JlZywgRGFuLAoKRmFpciBwb2ludCwgYW5kIEknbSBzb3JyeSBhYm91dCB0aGF0LgoKSSBh
bSBhIGJlZ2lubmVyIHRyeWluZyB0byBsZWFybiBrZXJuZWwgZGV2ZWxvcG1lbnQuIEkgYWN0dWFs
bHkgYW5hbHl6ZWQgdGhlCmNvZGUsIGJ1aWx0IGl0IHdpdGggVz0xLCBhbmQgcmFuIHRoZSBRRU1V
IGJvb3QgdGVzdHMgbXlzZWxmLCBidXQgYmVjYXVzZQpFbmdsaXNoIGlzIG5vdCBteSBuYXRpdmUg
bGFuZ3VhZ2UsIEkgdXNlZCBhbiBMTE0gdG8gaGVscCBkcmFmdCB0aGUgY29tbWl0Cm1lc3NhZ2Ug
YW5kIHRoZSByZXBseS4gVGhhdCBtYWRlIGl0IHNvdW5kIGxpa2UgZ2VuZXJpYyBjb3Jwb3JhdGUg
QUkgZmx1ZmYsCndoaWNoIHdhcyBteSBtaXN0YWtlLgoKSSB1bmRlcnN0YW5kIHRoZSBzdGFnaW5n
IHBvbGljeSBhbmQgcmVzcGVjdCB5b3VyIHRpbWUuIEZyb20gbm93IG9uLCBJIHdpbGwKd3JpdGUg
YWxsIG15IG1lc3NhZ2VzIGFuZCBjb21taXQgbG9ncyBpbiBteSBvd24gd29yZHMuCgpUaGFua3Mg
Zm9yIHRoZSBmZWVkYmFjaywKTWVsaWgK
