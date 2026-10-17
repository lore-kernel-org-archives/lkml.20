Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2455D3D6CB0;
	Sat, 17 Oct 2026 07:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792222930; cv=none; b=jzY+UTRZMX2xmbhiAKItkwx2YrUkZ7gTEyYVXnMVk6jqSpnk4TwrctlQ/amX1LEvJxPUGOfys4mLPaybaCAbNQw0uKbN7Wuu2VAoh3URqSbDJRVcizbf/nN3a0mZMACmI15hGq2Xp1WzIeg79gKfo1RQllRV2aM2BsTny4FjWr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792222930; c=relaxed/simple;
	bh=Gxjg79urtXTLn0Tgb44Qi1UvYYCwR6dxegZ29k4F/ZA=;
	h=Date:From:To:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=JE5vJfo1QMn09CBubBfqaRNPnDE7eVoLAhwjjbdurFFDdHaBEU2lIMIt4SUZPDWT7iOvCSUID422Ws6oiQam2FhG3LjXQOAAEQZ67s9SdHyDTnjx0APD4eH/lu2ylF3N7ff0iwvxTR72eCPHGOOCIKWnanceFtyXd2hSvIJNpKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=k2xJIrjT; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="k2xJIrjT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=Gxjg79urtXTLn0Tgb44Qi1UvYYCwR6dxegZ29k4F/ZA=; b=k
	2xJIrjTKrHPGNDzul/4ENm4AjZoods8crKduRe+WNaw4ncVv9uwT2Nbq/t6/oLOx
	S8ZzvxNBp5x4hYWssXnXHrWBZ0o93nOFJSbmnafosUUroQDYLzesCJHf9Wosuj9o
	iz81o0yHhVilqKxhltQAyngQKxHKGZpexKanWzVZtI=
Date: Sat, 17 Oct 2026 15:41:47 +0800 (CST)
From: "jiale yao" <19888972804@163.com>
To: "Heikki Krogerus" <heikki.krogerus@linux.intel.com>,
	"Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re:[PATCH] usb: typec: ucsi: acpi: Check ACPI companion before use
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <20261017064321.3816776-1-yaojiale02@163.com>
References: <20261017064321.3816776-1-yaojiale02@163.com>
X-NTES-SC: AL_Qu2SAP6ZvUEr4SCZbekdnEkQgO0/WsS1vfQu2Y5Wc+wEgCbN4z0YdHxaDHHN8e6DOSarnDiOagNHzNRcb4JHPCKXWyWmgBSoITwxTBUIjA==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <2df74bd8.1902.1a148cf4a95.Coremail.19888972804@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:ZygvCgDnt2i7JtNqXvxaAA--.176W
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzRtHgWrTJrsxewAA3+
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

QXQgMjAyNi0xMC0xNyAxNDo0MzoyMSwgIkppYWxlIFlhbyIgPHlhb2ppYWxlMDJAMTYzLmNvbT4g
d3JvdGU6Cj5QbGF0Zm9ybSBkcml2ZXJzIGNhbiBiZSBmb3JjZWQgdG8gYmluZCB0byBkZXZpY2Vz
IG91dHNpZGUgdGhlaXIgbWF0Y2gKPnRhYmxlcyB0aHJvdWdoIGRyaXZlcl9vdmVycmlkZS4gdWNz
aV9hY3BpX3Byb2JlKCkgYXNzdW1lcyB0aGF0IGV2ZXJ5IGJvdW5kCj5kZXZpY2UgaGFzIGFuIEFD
UEkgY29tcGFuaW9uIGFuZCBhY2Nlc3NlcyBhZGV2LT5kZXBfdW5tZXQgd2l0aG91dCBjaGVja2lu
Zy4KPgo+UmV0dXJuIC1FTk9ERVYgd2hlbiB0aGUgY29tcGFuaW9uIGlzIGFic2VudCB0byBhdm9p
ZCBhIE5VTEwgcG9pbnRlcgo+ZGVyZWZlcmVuY2UuCj4KCkZpeGVzOiAxZjM1NDZmZjNmMGEgKCJ1
c2I6IHR5cGVjOiB1Y3NpOiBhY3BpOiBDaGVjayB0aGUgX0RFUCBkZXBlbmRlbmNpZXMiKQoKPlNp
Z25lZC1vZmYtYnk6IEppYWxlIFlhbyA8eWFvamlhbGUwMkAxNjMuY29tPgo+LS0tCj4gZHJpdmVy
cy91c2IvdHlwZWMvdWNzaS91Y3NpX2FjcGkuYyB8IDYgKysrKystCj4gMSBmaWxlIGNoYW5nZWQs
IDUgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Cj5kaWZmIC0tZ2l0IGEvZHJpdmVycy91
c2IvdHlwZWMvdWNzaS91Y3NpX2FjcGkuYyBiL2RyaXZlcnMvdXNiL3R5cGVjL3Vjc2kvdWNzaV9h
Y3BpLmMKPmluZGV4IDU2OTdjY2MyNGVjMy4uZThlMzIwNWNhYjliIDEwMDY0NAo+LS0tIGEvZHJp
dmVycy91c2IvdHlwZWMvdWNzaS91Y3NpX2FjcGkuYwo+KysrIGIvZHJpdmVycy91c2IvdHlwZWMv
dWNzaS91Y3NpX2FjcGkuYwo+QEAgLTIyMiwxNCArMjIyLDE4IEBAIHN0YXRpYyB2b2lkIHVjc2lf
YWNwaV9ub3RpZnkoYWNwaV9oYW5kbGUgaGFuZGxlLCB1MzIgZXZlbnQsIHZvaWQgKmRhdGEpCj4g
Cj4gc3RhdGljIGludCB1Y3NpX2FjcGlfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRl
dikKPiB7Cj4tCXN0cnVjdCBhY3BpX2RldmljZSAqYWRldiA9IEFDUElfQ09NUEFOSU9OKCZwZGV2
LT5kZXYpOwo+IAljb25zdCBzdHJ1Y3QgdWNzaV9vcGVyYXRpb25zICpvcHMgPSAmdWNzaV9hY3Bp
X29wczsKPiAJY29uc3Qgc3RydWN0IGRtaV9zeXN0ZW1faWQgKmlkOwo+KwlzdHJ1Y3QgYWNwaV9k
ZXZpY2UgKmFkZXY7Cj4gCXN0cnVjdCB1Y3NpX2FjcGkgKnVhOwo+IAlzdHJ1Y3QgcmVzb3VyY2Ug
KnJlczsKPiAJYWNwaV9zdGF0dXMgc3RhdHVzOwo+IAlpbnQgcmV0Owo+IAo+KwlhZGV2ID0gQUNQ
SV9DT01QQU5JT04oJnBkZXYtPmRldik7Cj4rCWlmICghYWRldikKPisJCXJldHVybiAtRU5PREVW
Owo+Kwo+IAlpZiAoYWRldi0+ZGVwX3VubWV0KQo+IAkJcmV0dXJuIC1FUFJPQkVfREVGRVI7Cj4g
Cj4tLSAKPjIuMzQuMQo=
