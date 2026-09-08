Received: from out203-205-221-221.mail.qq.com (out203-205-221-221.mail.qq.com [203.205.221.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE6DD4F6475
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 10:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.221
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788863311; cv=none; b=T0bHeoZfxyc2MIlH4cVD5fwlhIPZbqoklwxBYC0stScDTBcvcyzWp3dsQJXOKuPJbu7WQHs3XGhmkhLWrm+uijp8ZBLzea+YPf27M1AiM65icvpoJ2iLGmgcrYtqVMwlwMs4FPmkPk2B9xiKb9M/DL6VdXfQjB/pM4ZUwh+xttA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788863311; c=relaxed/simple;
	bh=wri9jjVSnXb3f7mD1XDgExZHmsart+pPeoI+A1QedF8=;
	h=From:To:Cc:Subject:Mime-Version:Content-Type:Date:Message-ID:
	 References:In-Reply-To; b=Dl0ropzBaavvPqUMbATMGDXeO4DTBghs+rspXFrwTQXhpDJ+Pevxxg2XudiaYI/J7w9bb9lFpz+b3w/kQNDaUzzlZQrTlRcrc2DwaiQzxLqCDpFM752lCAhJeMotWjisCgq0cyCpcYYWXq1qP5kt6SpSt3E9q6EzC0F8BlKEWKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=O47nnkXD; arc=none smtp.client-ip=203.205.221.221
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="O47nnkXD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1788863305; bh=wri9jjVSnXb3f7mD1XDgExZHmsart+pPeoI+A1QedF8=;
	h=From:To:Cc:Subject:Date:References:In-Reply-To;
	b=O47nnkXDDtngXhzeEQpz2ic1hLkr3eIa9FEaR3MJFMaKNfR6TJBUQv4NJpSWn4DFC
	 FQH+xcvgzIgmqlHgY7LLImyHeO2adAwAyRflx2awsAab1zkwgkW9DpT46VJUjQ7dMs
	 jfbZ6nhOuSsvrR36mY3w9h5nRx6AzP7Ykvvi191o=
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-XMAILINFO: NH2c3QqomeNiWNQqj8mxT9byrIJNDiOpi5dKIBWsNahoMhRf44z+YmAKwJ45Id
	 TnE15FQ3KP7QH/jmKmKzniDO/rF07Hmlt/7nXkqXSKl6bjmInFZWNgDwmGauBsmFkpQldo0M0XFsZ
	 xlRSvDy4bm0PcW6/QGNpzvGQy1kQXcbEBNHLFRH0vsWQ4nnkOw6edK9gbE0bcPlO5VdVK4HTnN+Hs
	 Cln7CShgVAMEpO+IjrFZ7tYlNraj8LFepVQ1HzLeIXhIpqYNyWfWfrSIdKB0St8lAlGtAkC+k/mIh
	 VNhVF418lBA1Ci9DVnXzgGSixcqAFAW5P+juPHagTDaKy/O15mfXRI41EBV/megrFeVU37FjLEOar
	 xTJIpvRHDrEPnwHLasKkRQJTFtBtD3PcQqHxthNOp+UFBuGa2PtIELfe3vrEco9eL1dAt82Iq4Dea
	 X4o2ZkI8bVNEJEt6/lcHi83lxKxDIGshUZYWTChFE7in9y6oylNB6W0eGV/jkm3kkbBaEhpBwr8IH
	 dTWJxm6DHy28PozKPq+7RMKV/iyy0C5KLUEEGctEY3RAqQqk/WFekKtt/NyKGMnB8rchrFEDP85MS
	 KuIEFZ/ZAKVPXzmHDFiYPzhLduwIi7y9XPUGM452MjS3QB50ZHO5FOM0vc+V0kYt1RU63dot6GP85
	 6lgt+KgN6ENhEZrNgZzzlXdBzG+rw/cA1mWkznHABn1H+TMikZk/5qO0Vzev7X+Nc0BQ9Krmfgr64
	 O08gdaCnn9H2R64NT3uzdvDDRf7bhTUW27ry1xotuQqNhOAJsJMFoqi/VQJn9bYbHfSl1VvnpIf9k
	 bTERyWzVKT9oevr4wxRjysysuvCgIRFMJqn7MgVLoIGpA+JrqZjdjlRoIQMTpeYc9FPekLwdurcet
	 MRQeLfmz/0AVkDxXLFGSLx6Ckb3QAz1hPrkGxPn/WZq8+7VXLRhDDgICZcdvBIWIXaHZTepYO4Uli
	 0IycaDATiT4fDwvPwhbFod5juFf9wUzw0w0yZDhZE6oZdaKciUpkeuNU4eYnkxfLQR9DBqtVQsaiK
	 3qBBEdZHp2Cas4+F6KOIrL66teoKuysYjOAX+yLIwKHGQlIvsu3UnApHE5N1RliQT3DVDpvogq78T
	 qxI=
From: "=?utf-8?B?Wm9uZ3poZW4gRmVuZw==?=" <1768315307@qq.com>
To: "=?utf-8?B?TWlxdWVsIFJheW5hbA==?=" <miquel.raynal@bootlin.com>
Cc: "=?utf-8?B?VmlnbmVzaCBSYWdoYXZlbmRyYQ==?=" <vigneshr@ti.com>, "=?utf-8?B?UmljaGFyZCBXZWluYmVyZ2Vy?=" <richard@nod.at>, "=?utf-8?B?bGludXgtbXRk?=" <linux-mtd@lists.infradead.org>, "=?utf-8?B?bGludXgta2VybmVs?=" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] mtd: spinand: cache the last read page to avoid redundant SPI operations
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64
Date: Tue, 8 Sep 2026 18:28:24 +0800
X-Priority: 3
Message-ID: <tencent_43133A77AAB16DAC8E1182F821CCD6F8F407@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
References: <tencent_4C47F17C98F6F164274CEE84638558D62308@qq.com>
	<87bja8ulne.fsf@bootlin.com>
In-Reply-To: <87bja8ulne.fsf@bootlin.com>
X-QQ-mid: xmseua17-0t1788863304tkqjqzmna

SGkgTWlxdcOobCwKClRoYW5rcyBmb3IgdGhlIHJldmlldy4gdjMgaGFzIGJlZW4gc2VudCB0
byBhZGRyZXNzIHRoZSB0d28gaXNzdWVzCmZvdW5kIGJ5IFNhc2hpa286CgotIEludmFsaWRh
dGUgY2FjaGUgd2hlbiB0aGUgYm91bmNlIGJ1ZmZlciBpcyBvdmVyd3JpdHRlbiBieQogIG5v
bi1jYWNoZWFibGUgcmVhZHMgKFJBVywgY29udGludW91cywgb3IgT09CLW9ubHkpIHRvIHBy
ZXZlbnQKICBzZXJ2aW5nIHN0YWxlIGRhdGEgb24gc3Vic2VxdWVudCBjYWNoZSBoaXRzLgoK
LSBJbnZhbGlkYXRlIGNhY2hlIG9uIHVuY29ycmVjdGFibGUgRUNDIGVycm9ycyB0byBwcmV2
ZW50CiAgc3Vic2VxdWVudCByZWFkcyBmcm9tIGJ5cGFzc2luZyBFQ0MgY2hlY2tzIGFuZCBz
aWxlbnRseQogIHJldHVybmluZyBjb3JydXB0ZWQgZGF0YS4KClJlZ2FyZHMsClpvbmd6aGVu
IEZlbmc=

