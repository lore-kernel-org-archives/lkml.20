Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792463540;
	b=pdDdmeegO95JKA0uEj/Sgiq05ZCM7DCGXdDQrkou3u8nh4KNDwd52u9ZdZh6zCqPLMpZ
	 clioTcm4fNIoBDO7WJa3IiQn5fwT+WqJsdvsViSGlXd1NspalZVuliAsjN7PBzNUY0uCo
	 2h0FELJ/uA9glA4mGDtxyVTGAAPB+JR6OJlEilCMvBQOFFTPM796bQL0OywIz2V+K5VmZ
	 hzOGwyDv/5KX5k4+1YpyRGiFxcIlKYjG8HmvjQnL3fUfLFsrUAeu+vBrrfF3LzzwUsnEj
	 KMVJo6Ghi5toiWk1wNEIfAjKiscipsm1QY11zBC6TiPjOllechn4qkoB5JJz0uRIsMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792463540;
	h=DMARC-Filter:DKIM-Signature:Date:From:To:Cc:Subject:X-Priority:
	 X-Mailer:In-Reply-To:References:X-NTES-SC:Content-Transfer-Encoding:
	 Content-Type:MIME-Version:Message-ID:X-Coremail-Locale:X-CM-TRANSID:
	 X-CM-SenderInfo:X-Coremail-Antispam;
	bh=ZFVTmrRXGP2jQhE1zaEcfiz4mIyP5pkWrbaNtTIcGJo=;
	b=wHeMZRHsJqC8oacPOrjqfCJ8jzyyl53OpZQVDyFl1EJ+w83/9iWfrZiS/ay0JP5Yy1v/
	 kProL8sm5CnvUa2mvtgJAnOiDzzP4N1qFFOn07SsHVyrszqgeVzr3b3JcpuhzAldwzr05
	 Fk6LpyYavXlFHgwJoIGQyi+iDChwZbP6P+yV6W7XI1RCnwKmPdNszYfVkK2iArBJZGLMy
	 KBcjqDLH1ylr943ayZ8xCUZ59alsex9k3rlJU/OPP0nj7ZQe6rWF0Dsl9MxxX5SmXyRqe
	 UL+sJQ1CJMKX3Ep9fSpkVQFXeXl/UWwbyAA73eT1fWioSMgVFoZHJMZakC/IspfU0OA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=c6hXxvl3;
	arc=none smtp.remote-ip=117.135.210.2
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E920606A31A;
	Tue, 20 Oct 2026 02:32:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E920606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=c6hXxvl3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=ZFVTmrRXGP2jQhE1zaEcfiz4mIyP5pkWrbaNtTIcGJo=; b=c
	6hXxvl3h6CY37ijlO5V/S4VH+o7dBRbz1GOftx3HlAEDd6Q1aa7udy/w41p0JZKK
	s0rHg5ATaDlF4rPYSpNgUYoKwJoQxKF4CA+tyGuAP8WG4veSk2Ltig5o/wjZtCaP
	GBU+hwQxYPWqcfKc6fBPbgYOEioDwmaOPHan2fdKKE=
Date: Tue, 20 Oct 2026 10:31:58 +0800 (CST)
From: "jiale yao" <19888972804@163.com>
To: "Huang Wei" <huangwei@kylinos.cn>
Cc: "Heikki Krogerus" <heikki.krogerus@linux.intel.com>,
	"Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re:Re: [PATCH] usb: typec: ucsi: acpi: Check ACPI companion before
 use
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <20261020022707.3691899-1-huangwei@kylinos.cn>
References: <20261017064321.3816776-1-yaojiale02@163.com>
 <20261020022707.3691899-1-huangwei@kylinos.cn>
X-NTES-SC: AL_Qu2SAPidvE0q7iidZOkcn08ShO49XMOyvfoi2YFTc98FtwD2/gAgcWZ6I2D88/+uBy+FqSWSfhhg4+5wV5NyeAm3pi/5BR/nSBDAMsiQiw==
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
Message-ID: <105b5747.252f.1a15726bc8f.Coremail.19888972804@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:hygvCgD3f7+e0tZqVT0lAA--.1104W
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzh4sZmrW0p4hRQAA3O
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

SGkgSHVhbmcsCgpBdCAyMDI2LTEwLTIwIDEwOjI3OjA3LCAiSHVhbmcgV2VpIiA8aHVhbmd3ZWlA
a3lsaW5vcy5jbj4gd3JvdGU6Cj5IaSBKaWFsZSwKPgo+QSBoZWFkcy11cCBvbiB0aGUgaGlzdG9y
eSBoZXJlOiBhIGZ1bmN0aW9uYWxseSBpZGVudGljYWwgcGF0Y2ggd2FzCj5wb3N0ZWQgaW4gU2Vw
dGVtYmVyIGJ5IFlvZ2VzaCBHYXVyOgo+Cj4gIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4
LXVzYi8yMDI2MDkyMDA5MDcxMS4zMDAtMS15b2dlc2hnYXVyLjgzQGdtYWlsLmNvbS8KPgo+R3Jl
ZyBkZWNsaW5lZCBpdCBvbiB0aGUgZ3JvdW5kcyB0aGF0IHRoZSBvbmx5IHJlYWxpc3RpYyB3YXkg
dG8gcmVhY2gKPnByb2JlIHdpdGhvdXQgYW4gQUNQSSBjb21wYW5pb24gaXMgdGhlIGRyaXZlcl9v
dmVycmlkZSArIHN5c2ZzIGJpbmQKPnBhdGgsIHdoaWNoIGlzIGEgZGVsaWJlcmF0ZSByb290IGFj
dGlvbiwgd2l0aCB0aGUgcmVzdWx0aW5nIE9PUFMKPmJlaW5nIGlkZW50aWZpYWJsZSBieSB0aGUg
dGFpbnQgZmxhZyAtICJpZiB1c2Vyc3BhY2UgZG9lcyBpdCwgaXQKPmRlc2VydmVzIHRoZSBwaWVj
ZXMgdGhlIGtlcm5lbCBlbmRzIHVwIGluIjoKPgo+ICBodHRwczovL2xvcmUua2VybmVsLm9yZy9s
aW51eC11c2IvMjAyNjA5MjEzMC10aG9uZy1zZWNyZWN5LTFkZDRAZ3JlZ2toLwo+Cj5UaGUgb3Bl
biBxdWVzdGlvbiBsZWZ0IGZyb20gdGhhdCB0aHJlYWQgd2FzIHdoZXRoZXIgc3l6Ym90IHN0aWxs
Cj5leGVyY2lzZXMgdGhlIG92ZXJyaWRlK2JpbmQgcGF0aCAtIGlmIGl0IGRvZXMgYW5kIGtlZXBz
IGdlbmVyYXRpbmcKPnRoZXNlIHJlcG9ydHMsIHRoYXQgd291bGQgYmUgYW4gYXJndW1lbnQgZm9y
IHRha2luZyB0aGUgZ3VhcmQgYW55d2F5Lgo+WW9nZXNoJ3MgdmVyc2lvbiByZWZlcmVuY2VkIGEg
c3l6Ym90IHJlcG9ydDsgeW91cnMgZG9lcyBub3QsIHNvIEkKPmNhbid0IHRlbGwgZnJvbSB0aGUg
cGF0Y2ggd2hldGhlciB5b3UgaGl0IHRoZSBzYW1lIHJlcG9ydCBvciBmb3VuZAo+dGhpcyBpbmRl
cGVuZGVudGx5LgoKVGhhbmtzIGZvciB5b3VyIHJlcGx5LgpUaGUgYnVnIHdhcyBmb3VuZCBieSBt
eSBzdGF0aWMgYW5hbHlzaXMgdG9vbCwgd2hpY2ggaXMgY3VycmVudGx5IHVuZGVyIGRldmVsb3Bt
ZW50LgoKPgo+Rm9yIHdoYXQgaXQncyB3b3J0aCwgdGhlIGZpeCBpdHNlbGYgaXMgZmluZSAtIEkg
cmV2aWV3ZWQgWW9nZXNoJ3MKPnZlcnNpb24gYXQgdGhlIHRpbWUsIGluY2x1ZGluZyBjaGVja2lu
ZyB0aGF0IHRoaXMgaXMgdGhlIG9ubHkKPnVuY2hlY2tlZCBBQ1BJX0NPTVBBTklPTigpIGluIGRy
aXZlcnMvdXNiL3R5cGVjLy4gV2hldGhlciBpdCBsYW5kcwo+aXMgcHVyZWx5IGEgcG9saWN5IGNh
bGwgYXQgdGhpcyBwb2ludC4KPgo+VGhhbmtzLAo+SHVhbmcgV2VpCgpKaWFsZQ==
