Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49DF935AC0C
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 07:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792221882; cv=none; b=nkuI7s/UFCeSp7vy/LvBsS1RL0KMrmO8CBkqIFonAIUp0u8ztw38K2HshNmxmnqBkQ0EuF6fJXvmIIXoltmVKublcHbqu56g5AG1LK04jBy7bPKgTvlSPZnPPtpefm6T/mz32Ixpjqma4VTOd99AHsDetuMyZzOlgWh5dgjfzW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792221882; c=relaxed/simple;
	bh=7NaE/3zRo7xekn1rkPOnOLfrga4c8pUsAQ1q1yMFQBA=;
	h=Date:From:To:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=tKZPLD1n6iQHXoAVv7bcVt7xQZsdTrrxJcAA8hh5h2VW09NAD76hSaETOsX9y5RZmtC47F1cNpYOsP2+QdFfvlML/ahg5IArCfLjVgeovi6vgmoBQceBn8oK279NJnQHVv+LpFLcjcBNjtZkcF4rSK1s3NvrjVfp2c/Nez6fGqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=BBzwWr4L; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="BBzwWr4L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=7NaE/3zRo7xekn1rkPOnOLfrga4c8pUsAQ1q1yMFQBA=; b=B
	BzwWr4Lf2uHCmHWBLywe+0c3oOr5Xt2dBhPUZbKOgQIM1Mrgzb1iDhBgVIpp/hp8
	yZRIACi+U1c+p2OIUoIzw7x8sWmKc6uhYAhObHFwWFgJ0QMOkkLM67aqUq+o5rv1
	JIoN5xEvk28QcEVsx96YaIPgIgS2cFpuiid/k1llCw=
Date: Sat, 17 Oct 2026 15:24:20 +0800 (CST)
From: "jiale yao" <19888972804@163.com>
To: "Arnd Bergmann" <arnd@arndb.de>,
	"Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org
Subject: Re:[PATCH] misc: bh1770glc: queue proximity work on freezable
 workqueue
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <20261016101034.2586548-1-yaojiale02@163.com>
References: <20261016101034.2586548-1-yaojiale02@163.com>
X-NTES-SC: AL_Qu2SAP6ZvkAu7ymRY+kdnEkQgO0/WsS1vfQu2Y5Wc+wEgCbN4z0YdHxaDHHN8e6DOSarnDiOagNHzNRcb4JH3Xn2awzfA2h4GfmxGOGUeQ==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <40afdae2.17e3.1a148bf50a6.Coremail.19888972804@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:ZygvCgD3P2OkItNq1PpaAA--.155W
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzQRBe2rTIqT5UgAA3n
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

QXQgMjAyNi0xMC0xNiAxODoxMDozMywgIkppYWxlIFlhbyIgPHlhb2ppYWxlMDJAMTYzLmNvbT4g
d3JvdGU6Cj5UaGUgcHJveGltaXR5IGZhbGxiYWNrIHdvcmsgcmVhZHMgc2Vuc29yIHJlZ2lzdGVy
cyBhZnRlciBhIGRlbGF5LiBTeXN0ZW0KPnN1c3BlbmQgcG93ZXJzIHRoZSBzZW5zb3IgZG93biB3
aXRob3V0IGNhbmNlbGxpbmcgdGhhdCB3b3JrLCB3aGlsZQo+c2NoZWR1bGVfZGVsYXllZF93b3Jr
KCkgbGVhdmVzIGl0IHJ1bm5hYmxlIG9uIHRoZSBub24tZnJlZXphYmxlIHN5c3RlbQo+d29ya3F1
ZXVlLgo+Cj5RdWV1ZSB0aGUgZmFsbGJhY2sgd29yayBvbiBzeXN0ZW1fZnJlZXphYmxlX3dxIHNv
IGl0IGNhbm5vdCBhY2Nlc3MgdGhlCj5wb3dlcmVkLWRvd24gc2Vuc29yIG9yIGl0cyBzdXNwZW5k
ZWQgSTJDIGFkYXB0ZXIuCj4KCkZpeGVzOiAxOTA0MjBhYjM0YWIgKCJkcml2ZXJzL21pc2M6IGRy
aXZlciBmb3IgYmgxNzcwZ2xjIC8gc2ZoNzc3MCBBTFMgYW5kIHByb3hpbWl0eSBzZW5zb3IiKQoK
PlNpZ25lZC1vZmYtYnk6IEppYWxlIFlhbyA8eWFvamlhbGUwMkAxNjMuY29tPgo+LS0tCj4gZHJp
dmVycy9taXNjL2JoMTc3MGdsYy5jIHwgNCArKy0tCj4gMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPgo+ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWlzYy9iaDE3
NzBnbGMuYyBiL2RyaXZlcnMvbWlzYy9iaDE3NzBnbGMuYwo+aW5kZXggOThmYzU5NzBiMmJiLi4z
NDExOTQ3ZDkyODMgMTAwNjQ0Cj4tLS0gYS9kcml2ZXJzL21pc2MvYmgxNzcwZ2xjLmMKPisrKyBi
L2RyaXZlcnMvbWlzYy9iaDE3NzBnbGMuYwo+QEAgLTYyMCw4ICs2MjAsOCBAQCBzdGF0aWMgaXJx
cmV0dXJuX3QgYmgxNzcwX2lycShpbnQgaXJxLCB2b2lkICpkYXRhKQo+IAkJICogbmV4dCBleHBl
Y3RlZCBpbnRlcnJ1cHQgdGltZS4KPiAJCSAqLwo+IAkJY2FuY2VsX2RlbGF5ZWRfd29ya19zeW5j
KCZjaGlwLT5wcm94X3dvcmspOwo+LQkJc2NoZWR1bGVfZGVsYXllZF93b3JrKCZjaGlwLT5wcm94
X3dvcmssCj4tCQkJCW1zZWNzX3RvX2ppZmZpZXMocmF0ZSArIDUwKSk7Cj4rCQlxdWV1ZV9kZWxh
eWVkX3dvcmsoc3lzdGVtX2ZyZWV6YWJsZV93cSwgJmNoaXAtPnByb3hfd29yaywKPisJCQkJICAg
bXNlY3NfdG9famlmZmllcyhyYXRlICsgNTApKTsKPiAJfQo+IAlyZXR1cm4gSVJRX0hBTkRMRUQ7
Cj4gfQo+LS0gCj4yLjM0LjEK
