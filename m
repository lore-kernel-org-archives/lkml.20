Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net (zg8tmtyylji0my4xnjqumte4.icoremail.net [162.243.164.118])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49EFA1A6803
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.164.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790151717; cv=none; b=bVtkXlT4nb0tyLwIi76WOZwg3t3kfKOFckJn+kfNGhYDV0kXJY3dRbtXu6MksMBTqQXfxxEMup7vnbndJBZC4I7oKia8VfJqE/0fhz4wLKj6uRHX5CDIPKUnygLozAr4byBbtGeOtkPSDv1YJSCAZ/q03KUam/lKqRujvKt/MlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790151717; c=relaxed/simple;
	bh=7cWYj8nUimPQgLWMnVkDgPNsgpaXAYF17iaSLoeAjd8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=QvUcvX7yfUlCbXHYyyl/GnQZPerALwnBrcBrU+j9rT6d0/6cinvDqwc9toCNTzpWDNqiDoHnpCrdf1flO9pYKbrpeYNWp7yfp6dTxyD79mYWr9eT8p3Xqk0GfHcV3SfF+RjneCjjMPcVjPzmQDwTA7DZ6UcR4gnX2WoRFaJxF0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=phytium.com.cn; spf=pass smtp.mailfrom=phytium.com.cn; arc=none smtp.client-ip=162.243.164.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=phytium.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytium.com.cn
Received: from prodtpl.icoremail.net (unknown [10.12.1.20])
	by hzbj-icmmx-7 (Coremail) with UTF8SMTP id AQAAfwCnrcEWjLNqvGfbAA--.31051S2;
	Wed, 23 Sep 2026 16:21:42 +0800 (CST)
Received: from zhuling2709$phytium.com.cn ( [218.76.62.144] ) by
 ajax-webmail-mail (Coremail) ; Wed, 23 Sep 2026 16:21:32 +0800 (GMT+08:00)
Date: Wed, 23 Sep 2026 16:21:32 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: =?UTF-8?B?5pyx6aKG?= <zhuling2709@phytium.com.cn>
To: "Zenghui Yu" <zenghui.yu@linux.dev>
Cc: maz@kernel.org, tglx@kernel.org, radu@rendec.net,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] irqchip/gic: Fix UBSAN shift-out-of-bounds in GIC
 helpers
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2024.3-cmXT6 build
 20250512(e7b47ee3) Copyright (c) 2002-2026 www.mailtech.cn OP_ICM_ICMVM
In-Reply-To: <6b668efe-ef7a-474a-957c-893755ebba46@linux.dev>
References: <86ldjlp0qi.wl-maz@kernel.org>
 <20260921022101.20941-1-zhuling2709@phytium.com.cn>
 <6b668efe-ef7a-474a-957c-893755ebba46@linux.dev>
Content-Transfer-Encoding: base64
X-CM-CTRLDATA: dO2y/GZvb3Rlcl90eHQ9MjEyOjM4Mw==
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <dda9852.22f.1a0cd5b128e.Coremail.zhuling2709@phytium.com.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:AQAAf8Dw8nUNjLNqzNbbAA--.37064W
X-CM-SenderInfo: x2kxzxlqjsliuz6sx5pwlxzhxfrphubq/1tbiAQAFAWqwNEoBFQAI
	s9
Authentication-Results: hzbj-icmmx-7; spf=neutral smtp.mail=zhuling270
	9@phytium.com.cn;
X-Coremail-Antispam: 1Uk129KBjvdXoWruw1UAF1DCry8tr13uF4DArb_yoWkGrXEyr
	4qyr47tr1vyF1kWayrtF43Xr18WrykJF1jyr4qq3ZrGa4UJ345Ja4kua1jyw1rZr9rGw1D
	tF13W343Jr1DJjkaLaAFLSUrUUUU1b8apTn2vfkv8UJUUUU8wcxFpf9Il3svdxBIdaVrnU
	Uv73VFW2AGmfu7jjvjm3AaLaJ3UjIYCTnIWjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRUUUUU
	UUUU=

PiBnaWNfe3Bva2UscGVla31faXJxIGluIGRyaXZlcnMvaXJxY2hpcC9pcnEtZ2ljLmMgaGF2ZSBh
IHNpbWlsYXIKPiBwYXR0ZXJuLgo+Cj4gTWluZCBmaXhpbmcgdGhlbSBhcyB3ZWxsPwoKWWVzLCB0
aGFua3MgZm9yIHBvaW50aW5nIHRoaXMgb3V0LiBJIGhhdmUgZml4ZWQgYm90aCBoZWxwZXJzIGFu
ZCB3aWxsCnNlbmQgdjMgc2hvcnRseS4KClRoYW5rcywKWmh1IExpbmcNCg0K5L+h5oGv5a6J5YWo
5aOw5piO77ya5pys6YKu5Lu25YyF5ZCr5L+h5oGv5b2S5Y+R5Lu25Lq65omA5Zyo57uE57uH5omA
5pyJLOWPkeS7tuS6uuaJgOWcqOe7hOe7h+WvueivpemCruS7tuaLpeacieaJgOacieadg+WIqeOA
guivt+aOpeaUtuiAheazqOaEj+S/neWvhizmnKrnu4/lj5Hku7bkurrkuabpnaLorrjlj68s5LiN
5b6X5ZCR5Lu75L2V56ys5LiJ5pa557uE57uH5ZKM5Liq5Lq66YCP6Zyy5pys6YKu5Lu25omA5ZCr
5L+h5oGv44CCDQpJbmZvcm1hdGlvbiBTZWN1cml0eSBOb3RpY2U6IFRoZSBpbmZvcm1hdGlvbiBj
b250YWluZWQgaW4gdGhpcyBtYWlsIGlzIHNvbGVseSBwcm9wZXJ0eSBvZiB0aGUgc2VuZGVyJ3Mg
b3JnYW5pemF0aW9uLlRoaXMgbWFpbCBjb21tdW5pY2F0aW9uIGlzIGNvbmZpZGVudGlhbC5SZWNp
cGllbnRzIG5hbWVkIGFib3ZlIGFyZSBvYmxpZ2F0ZWQgdG8gbWFpbnRhaW4gc2VjcmVjeSBhbmQg
YXJlIG5vdCBwZXJtaXR0ZWQgdG8gZGlzY2xvc2UgdGhlIGNvbnRlbnRzIG9mIHRoaXMgY29tbXVu
aWNhdGlvbiB0byBvdGhlcnMu

