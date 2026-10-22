Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792647085;
	b=qume+WkQWx7KAfK3uNn9XoRakuaQhsAYJKjLNvLAfXqJAxLy/RCuNw5Nd6seaOF026d2
	 Erx8fS+RzE+yKFfIIrqP4L8S0T2ZL0G9sMSOI8ymByE6UaJrUqogPC7++4Jsoh9zUspu2
	 3fhK1OMIR9WlKvp+IUKPaIutDVoS65o8kJFDoV+GVvu3LWa3bUWp7eZB6uZTl774gEaWk
	 30t01pihIXf092+yOaVJI5pp5/YetAPJvmKYwFs7HU0GSOEw4tFyDFDRhJhOBfFkccDbm
	 RA0FAikPa/gdeW6zEcYDBgmP77sPjDn6ctJ+hRCw+SPXKBs8EHvXqkqNWJ3pkLXdXtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792647085;
	h=DMARC-Filter:DKIM-Signature:Date:From:To:Cc:Subject:X-Priority:
	 X-Mailer:In-Reply-To:References:X-NTES-SC:Content-Transfer-Encoding:
	 Content-Type:MIME-Version:Message-ID:X-Coremail-Locale:X-CM-TRANSID:
	 X-CM-SenderInfo:X-Coremail-Antispam;
	bh=G9kPqGb8yTwic8AFEFdkSNrD228AcoyDeb4bve6kiw4=;
	b=psGnMrJ4CNXo1RivbGx3k9U0tVXWquH6frKOtVZ6he+SId9gBtwd5FCz/qg25lRAcIY5
	 +sBqa1Us62HNnBlDyjpqQZZT9odHmHipcSSPiyqzui9Ev07kHN1S8iRwZ+gjxtBhpP37k
	 4dPnMNgpp3QHEKqwKSLsnzih/DCLLZxEmyHVKyS+rZi/RLs0NAd4CthRRupQnA/aZU3sU
	 dC/So4yFUHRi2GRIV+UvzvxD7kVVuwSXqzjoSdYDzmUJCBhpT0BbsBb5H1GkLxvJiu2ZB
	 VdONMKV5ZJWVooH2AsU1tzG9/xn6hxkUzfUOwmMkqT+mnnHhfrbPuCweGtvXlPkVOjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=126.com;
	spf=pass smtp.mailfrom=126.com;
	dkim=pass header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=YprDm0M7;
	arc=none smtp.remote-ip=220.197.31.7
Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37BCD606A31B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 05:31:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37BCD606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=YprDm0M7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=G9kPqGb8yTwic8AFEFdkSNrD228AcoyDeb4bve6kiw4=; b=Y
	prDm0M7rdKhb7lWolggVpMnhha0YcKwIcrLRnC6Nk99k/hAculb/uGCHQxBQkPGq
	JQI/fAqksmyj0j4fX5aWCePYAk/KzfKW/XXU/mBifqD2ueAaypaWTBy1Y1Zu79VN
	jRNWUfOKlenTHVL3hxfGA/iUUl/iPzf0GCvp+JFJVY=
Date: Thu, 22 Oct 2026 13:30:42 +0800 (CST)
From: "Nanzhe Zhao" <nzzhao@126.com>
To: "Jaegeuk Kim" <jaegeuk@kernel.org>
Cc: "Nanzhe Zhao" <nzzhao.sigma@gmail.com>, "Barry Song" <baohua@kernel.org>,
	linux-f2fs-devel@lists.sourceforge.net,
	"Juan Yescas" <jyescas@google.com>,
	"Daeho Jeong" <daehojeong@google.com>,
	"Pengfei Li" <lipengfei28@xiaomi.com>, "Dev Jain" <Dev.Jain@arm.com>,
	linux-kernel@vger.kernel.org,
	"David Hildenbrand" <David.Hildenbrand@arm.com>,
	"Bo Zhang" <zhangbo56@xiaomi.com>,
	"Kalesh Singh" <kaleshsingh@google.com>,
	"Ryan Roberts" <Ryan.Roberts@arm.com>,
	"Nanzhe Zhao" <zhaonanzhe@xiaomi.com>
Subject: Re:Re: [f2fs-dev] [PATCH v5 00/16] f2fs: support & optimize large
 folios for writable files
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 126com
In-Reply-To: <atY1gNfX9Lhg3zC6@google.com>
References: <20261014064445.2835813-1-zhaonanzhe@xiaomi.com>
 <atAO6ykqwGgZq77y@google.com> <atA24UMtAqkmz_R8@google.com>
 <63e416aa.2fb2.1a13d9f3491.Coremail.nzzhao@126.com>
 <atD9Csw1-lj5_SR_@google.com> <atFFXafuVyyimmUk@google.com>
 <15373a26.1e3d.1a1494e8d1a.Coremail.nzzhao@126.com>
 <atY1gNfX9Lhg3zC6@google.com>
X-NTES-SC: AL_Qu2SAPqfuEgv5CCeY+kdmEoVj+o8Xsaxs/8g2YJSc8gOtgfUwzsQWHZeElbTwO69ABq9sQGSYCZS08NTWLJT60AsczzUxNuhu9GFt67lOg==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <36f5c73d.3a87.1a162171418.Coremail.nzzhao@126.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:cSkvCgD3H76Cn9lqbzZUAA--.58994W
X-CM-SenderInfo: xq22xtbr6rjloofrz/xtbBowIZ6GrZn4JAFgAA3o
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

Pgo+SSdtIHRlc3RpbmcgdGhlIGtlcm5lbCBvbiBteSBwcmltYXJ5IHBob25lLiBBZnRlciBhcHBs
eWluZyB0aGUgbGF0ZXN0IG9uZXMKPmFnYWluLCBJIGhhdmVuJ3QgaGl0IHRoZSBwYW5pYyB5ZXQu
IFNvLCBjb3VsZCB5b3UgcGxlYXNlIHNlbmQgdjY/IFRoZW4sIEknbGwKPnJlYXBwbHkgYWxsIGFu
ZCBrZWVwIHRlc3RpbmcuCj4KCkkgIGhhdmUganVzdCBmZXRjaGVkIG5ld2VzdCBkZXYtdGVzdCBi
cmFuY2ggYW5kIGRldiBicmFuY2gsIEkgc2VlIG9uIGRldi10ZXN0IGJyYW5jaAp5b3UgaGF2ZSBh
bHJlYWR5IGFwcGxpZWQgbXkgdjUgcGF0Y2hlcywgc28gc2hvdWxkIEkgc2VuZCBhIGNvbXBsZXRl
IHY2IHBhdGNoZXMKdG8gYSBkaWZmZXJlbnQgYnJhbmNoLiBvciBJIHNlbmQgdGhlIGNoYW5nZXMg
dG8gcGF0Y2ggdjUgb24gZGV2LXRlc3Q/CgpUaGFua3Ms
