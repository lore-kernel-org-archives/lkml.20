Received: from m16.mail.126.com (m16.mail.126.com [117.135.210.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC2101E260C
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 05:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792130020; cv=none; b=W+m413LArgp6Ziv1fd4owSvFrw4xOkdT3a9aZ+2whgv5WsBjEj2cjGNZzm57A8u6BZcB8Fsby/ukIKq982TPsCGPW0NNoqC7HN5UjRxwed4yYSazAw6PbTVRyOtd4iSbBn/0zSR8Eww14XMSdaqM8RnEvCQy5LF8W0C6A19d9Rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792130020; c=relaxed/simple;
	bh=gxxJ7t8PmHmqWd0Zl5m8j55pw8ZjQSvr1vPwKZmXGhE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=KPgSBezJhshGxIWi+Mj47NFJv+y5OfmLdJdoZovHD5gsZkxq4sbmkADjvfja5IVzVZcbjBiZdFN15RMTrn8CfysH7CCBuddfUgU2ieV/jy7i5bm+48SCOwgPxeopf9b1xtKPxQeXD1w7uVjiNll4QY/YQF7y9DufBuMimXSMvq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=mst5Lq8I; arc=none smtp.client-ip=117.135.210.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="mst5Lq8I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=gxxJ7t8PmHmqWd0Zl5m8j55pw8ZjQSvr1vPwKZmXGhE=; b=m
	st5Lq8IvndQW9xdfHyEs2JAK34IG5zslFY/Y9w5nIJWqhL04SITsDt9idWa7bBad
	7SBJi2frhnqpX+bjTN6UzNGdYUu2NWbMFzn+edONYuVcu9BMrsTnvw1ir10GTW1o
	ubINAw90l/EhGF2zOW6zsTFH5l+OiZONnyw7joyZn0=
Date: Fri, 16 Oct 2026 13:52:48 +0800 (CST)
From: "Nanzhe Zhao" <nzzhao@126.com>
To: "Chao Yu" <chao@kernel.org>
Cc: "Nanzhe Zhao" <nzzhao.sigma@gmail.com>,
	linux-f2fs-devel@lists.sourceforge.net,
	"Jaegeuk Kim" <jaegeuk@kernel.org>, "Barry Song" <baohua@kernel.org>,
	"Nanzhe Zhao" <zhaonanzhe@xiaomi.com>,
	"Juan Yescas" <jyescas@google.com>,
	"Daeho Jeong" <daehojeong@google.com>, "Dev Jain" <Dev.Jain@arm.com>,
	"David Hildenbrand" <David.Hildenbrand@arm.com>,
	linux-kernel@vger.kernel.org, "Bo Zhang" <zhangbo56@xiaomi.com>,
	"Kalesh Singh" <kaleshsingh@google.com>,
	"Pengfei Li" <lipengfei28@xiaomi.com>,
	"Ryan Roberts" <Ryan.Roberts@arm.com>
Subject: Re:Re: [PATCH v5 03/16] f2fs: support regular file buffered writes
 on large folios
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 126com
In-Reply-To: <1349f52e-af6d-48ab-b06a-4c8f5b3f7e68@kernel.org>
References: <20261014064445.2835813-1-zhaonanzhe@xiaomi.com>
 <20261014064445.2835813-4-zhaonanzhe@xiaomi.com>
 <1349f52e-af6d-48ab-b06a-4c8f5b3f7e68@kernel.org>
X-NTES-SC: AL_Qu2SAP2ZtkEt7iaRYukdmEoVj+o8Xsaxs/8g2YJSc80OnBD3wjIGZFNdN3b84eyRCCG3vRavXhpezMdoeLh5/no9kIvx6gZOH46EorBpHQ==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <7ce0ac29.3f00.1a143452a3e.Coremail.nzzhao@126.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:cykvCgCXf3ewu9Fq5apQAA--.31231W
X-CM-SenderInfo: xq22xtbr6rjloofrz/xtbBoxAq+WrRu7Bx9wAA3W
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

Cgo+PiArCWYyZnNfc3VibWl0X3BhZ2VfcmVhZChpbm9kZSwgTlVMTCwgZm9saW8sIGluZGV4LCBi
bGthZGRyLAo+PiArCQkJICAgICAgUkVRX09QX1JFQUQsIGZhbHNlKTsKPgo+QGZvcl93cml0ZTog
dHJ1ZT8gbGlrZSB3ZSBkaWQgaW4gZjJmc193cml0ZV9iZWdpbiAtPiBmMmZzX3N1Ym1pdF9wYWdl
X3JlYWQoLi4sIHRydWUpLgo+T3RoZXJ3aXNlLCBpdCBjYW4gcnVuIGludG8gbW0gcmVjbGFpbSBh
ZnRlciBob2xkaW5nIGZvbGlvIGxvY2ssIGNhdXNpbmcgZGVhZGxvY2sgaXNzdWUKPnBvdGVudGlh
bGx5Lgo+Cj5UaGFua3MsCj4KPj4gKwpJbiBmYWN0IFNhc2hpa28gYWxzbyByZXBvcnRlZCB0aGlz
IGlzc3VlLCBJJ3ZlIGdvdCBhIGJpdCBoZXNpdGF0ZWQgdG8gY2hhbmcgQGZvcl93cml0ZSB0byB0
cnVlCnRob3VnaCwgYmVjYXVzZSBJIGtub3cgdGhhdCB3ZSBhbHJlYWR5IHJlbW92ZSBHRlBfTk9G
UyBpbiBmb2xpbyBhbGxvY2F0aW9uLiBBbmQgSSBhbHNvCmNoZWNrIHNocmlua19mb2xpb19saXN0
IGFuZCBzdHVkeSBzaHJpbmtfc2xhYiBhbmQgc3dhcGZpbGUgaW4gbm93YWRheXMgbWFpbmxpbmUg
YW5kIGRpZG4ndApmaW5kIGEgZGVhZGxvY2sgaXNzdWUuIEJ1dCBJIGRvIG1pc3MgdG8gdGFrZSBw
b3J0aW5nIGxhcmdlIGZvbGlvIG9uIG9sZGVyIGtlcm5lbCBsaWtlIDYuMTIgaW50bwpjb25zaWRl
cmF0aW9uLiBBbnl3YXksIEkgZGlkbid0IHJlY2VpdmUgcmVwb3J0IG9yIHRlc3QgZGF0YSBvbiBk
aXJlY3QgcmVjbGFpbSBjYXN1c2UgYnkgYmlvIGFsbG9jYXRpb24Kd2l0aCBHRlBfTk9JTywgc28g
SSdsbCBjaGFuZ2UgQGZvcl93cml0ZSB0byB0cnVlIGluIHY2LgoKCgo=
