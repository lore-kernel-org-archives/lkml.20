Received: from out162-62-57-137.mail.qq.com (out162-62-57-137.mail.qq.com [162.62.57.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A9B834041B
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 06:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788935377; cv=none; b=EKNKrhrH2IlxNhVJHEgELlQCEeeMshlWLrm507aQts2xPfGrIHUqEyuTBEBE3uX2w3+mKI9FlaT/Vn0YXdYha34Po8fX1DCCCV+sxhZQkt8s1UHD9ZIZszQu0MDOfjdz+QIqA+qtlK/79TUZ0+ddzX7wBNlkP2pNv/rQnlZ4tX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788935377; c=relaxed/simple;
	bh=+pdap0uuKbgUosOmANRUk/9FWBKtG/h+1HwPpPjHqds=;
	h=From:To:Cc:Subject:Mime-Version:Content-Type:Date:Message-ID:
	 References:In-Reply-To; b=SFHrxjKO5x7l8OIq8n6fZ9YW4gZQ1DjkyyonMtJ4CNgSkXCLi4y2A0Ca4+CvU+XMSps7u/p8le0Ouz0sih0DIkwTASzl9quawoNuW4thg2X24Yer0Uqnu7OWyNgIF3KyBpG11ptBcW0Ea49hIUKrQUDsTMIijxYNsuySH/cXEGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=dxH19Z0K; arc=none smtp.client-ip=162.62.57.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="dxH19Z0K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1788935363; bh=+pdap0uuKbgUosOmANRUk/9FWBKtG/h+1HwPpPjHqds=;
	h=From:To:Cc:Subject:Date:References:In-Reply-To;
	b=dxH19Z0KKkFbAQefwAc5DO9SgqdIykbdo9l9hAPvGKfm5cWEoHRkeeoRvxGSJst+R
	 kx3tagDs2WCfahZFWAhsaan895UhMCbzpcmlLMaSUbo3iCzyiguSWSpbiaYRKKm3PR
	 u0RuAah/FvbaPOdrTLUZC/XKEPAlrQUq0f0VSC5E=
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-XMAILINFO: McF9JvsryK5Jcya3w+KH97a3P5xXcr7RMjBnG+rEcCCWzNC9IH3WVGp6sTNGXW
	 s/qYu6oYEOp36cyxBBIxDQc+bGnh831VmBy64GLTwROHQ1eK6qL3eXQBC+MMSi0ZlRhzTJKtfwoJf
	 pfXJ69iKHquhSEZN7+GRfwRlzofl43O1gVkMog5lCS/+wo8lCaWRlaiPvdvxp+etUaEqrt4cJgwCY
	 u2Oz7YUquYH/RDzZXnQmV5OpI6K6JTCmQD65sEzo6eCSEyZ7BXvVa93mbNah3NL+l78iFP3Ez4dug
	 rR0IAfnZup899cnaPpa9QI7abhA64I42x+1BpCPjYItF0y1qElaxJDxA22vAfzRMEWyWgaAcdEfXy
	 Ixweue/j2ixELDnfS7hUzuF/LxOlSlILbxvR0WCL9bluYz5nljkhekJ1iT/vvsCHue07lIMAXur9P
	 vruwu7RTojGVl0ijdq1IJ53njkUmIJcbxvO+a3QMf3mvUHt+O8urfoI3BFZDF8hOxlds5yF/uFXOX
	 pPKA4/8YuBzO4m5D4Uj1YGQLHh5IY5RVmzDCazyI/4/F3NuR7qDD9mSUxOJwZ7/xZ6FANBAmhHvIW
	 30KBcGAuDOxITm9Esu9kWrY0ZG9Bb85xHjHMPX91dtYI3CpMFFztt208Q6OhfsVOOt4KWxUREIUin
	 6+TFJXtMwSToEOaffjA1hpzSdo7Hmzdry17m3+2KkN6gHqCLS1oOYCdL7JYW5GBfytXzhue4DIrz0
	 SrslpLlOsLaexwSdcOn5HT2uzhcfBM3OS9sSZoF/R1famtRU+geZl+zFEbnDRRXOXh4ybioOowqP0
	 Hr2LNNxXXHZynsFVj7rUgomH8zauJFo26MZ5U9HJsVc8JI+d3hHpNwvXi4BZ/d6c6l34ahmJ1IFoT
	 MoHWaFAhpqRSW9cW3VJVDbaFPVxmWPIPXQSu4YQKQNSze4qNLKjXZpzUPXB0URGmZGxiuo3V7ggS3
	 X2OKgW1WJ/BX5s66gDn36NkXntSn++n+f/QPa536gjAU+a/6OGQ3scTUlcCP6IfegGUrJCXg==
From: "=?utf-8?B?Wm9uZ3poZW4gRmVuZw==?=" <1768315307@qq.com>
To: "=?utf-8?B?TWlxdWVsIFJheW5hbA==?=" <miquel.raynal@bootlin.com>
Cc: "=?utf-8?B?bGludXgtbXRk?=" <linux-mtd@lists.infradead.org>, "=?utf-8?B?bGludXgta2VybmVs?=" <linux-kernel@vger.kernel.org>, "=?utf-8?B?cmljaGFyZA==?=" <richard@nod.at>, "=?utf-8?B?dmlnbmVzaHI=?=" <vigneshr@ti.com>
Subject: Re: [PATCH v3] mtd: spinand: cache the last read page to avoid redundant SPI operations
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64
Date: Wed, 9 Sep 2026 14:29:21 +0800
X-Priority: 3
Message-ID: <tencent_ADBE12933F3EE6A4DFBD640C15CB67442305@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
References: <tencent_4C47F17C98F6F164274CEE84638558D62308@qq.com>
	<tencent_E818586423F2F16D98DEF1EC2723EE4A6308@qq.com>
	<87o6e7u8jt.fsf@bootlin.com>
In-Reply-To: <87o6e7u8jt.fsf@bootlin.com>
X-QQ-mid: xmseua17-0t1788935361t91bksk78

SGkgTWlxdWVsLAoKVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suIEkgY2hlY2tlZCB0aGUgZW1h
aWwgdGhyZWFkIGFuZCBwYXRjaHdvcmssIGJ1dApjb3VsZG4ndCBmaW5kIHRoZSBTYXNoaWtv
IHJldmlldyBjb21tZW50cyBmb3IgdjMuIFRoZSB2MiBTYXNoaWtvCmNvbXBsYWludHMgYWJv
dXQ6CgoxLiBDYWNoZSBub3QgaW52YWxpZGF0ZWQgd2hlbiBkYXRhYnVmIGlzIG92ZXJ3cml0
dGVuIGJ5IG5vbi1jYWNoZWFibGUKICAgcmVhZHMgKFJBVywgY29udGludW91cywgT09CLW9u
bHkpCjIuIFBhZ2VzIHdpdGggdW5jb3JyZWN0YWJsZSBFQ0MgZXJyb3JzIGJlaW5nIGNhY2hl
ZAoKaGF2ZSBhbHJlYWR5IGJlZW4gYWRkcmVzc2VkIGluIHYzLgoKQ291bGQgeW91IHBsZWFz
ZSBmb3J3YXJkIHRoZSByZW1haW5pbmcgU2FzaGlrbyBjb21wbGFpbnRzIG9yIHBvaW50IG1l
CnRvIHdoZXJlIEkgY2FuIGZpbmQgdGhlbT8gSSdkIGxpa2UgdG8gYWRkcmVzcyB0aGVtIGJl
Zm9yZSB5b3VyIGh1bWFuCnJldmlldy4KClRoYW5rcywKWm9uZ3poZW4=

