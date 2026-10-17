Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7954F3E1692
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 11:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792235053; cv=none; b=HvDN29+uslayQjaDDj+D4xZqA4QjU8UJT+EiOl35Y8aH8601OkTgHzAm60JoWWQB/OldrEKMpJ8FzfmYfiOuK2K64V23b8h0y0L7TPHfqAdZw143iC2oj5rnWHmQgh8Ftkaf2UB7diADh9HOstPchW5ybzkAjlFYlWRrDAhMgsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792235053; c=relaxed/simple;
	bh=Rf7YNCL8qZoDiA9pZ5Q4C7iNelijmn8IlqFSt4Pcxcc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=LyrGzoLiSkh0IMHlM3pobQxiX9rKtImXTZtpbc3ZEAwQ1/Y8PwxrwdZ8ohqHW0atNYDo5RJA6iWbrgWcnR9tQwv++dNfVFnsmAMNtYTXxHB1rtgjejUV+1nHEIF6Q7fejSLDHxQIAQqMiZ1SrB76ws8hBZBnRdCbCDiMfsbEKy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=G98g1pXw; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="G98g1pXw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=Rf7YNCL8qZoDiA9pZ5Q4C7iNelijmn8IlqFSt4Pcxcc=; b=G
	98g1pXwS5YbGNBuLT9A4B6yzcltTUTa/tZPwF9mhuFZ1Y7RVU8jAlUP+s4K/63QA
	vw0sn3oDZCuujWhQYJpU0G1Mv6sn+DSRaE1ISTto5Xk0NOlQ7vHJcFBz/CwUAVVS
	IRWRhjLYYSSeyugQEy3NbV061C9xbV3v1vUvvF+8yc=
Date: Sat, 17 Oct 2026 19:03:45 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Heiko Stuebner" <heiko@sntech.de>
Cc: linux-kernel@vger.kernel.org
Subject: Re:Re: [PATCH] MAINTAINERS: update my email address
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <179182161341.3798543.15754027777678561940.b4-ty@b4>
References: <20261010134705.2131-1-andyshrk@163.com>
 <179182161341.3798543.15754027777678561940.b4-ty@b4>
X-NTES-SC: AL_Qu2SAP6Yukgp4yaQZ+kdk0gQhec/Xce4uvsi3YJQc+sEuRHc0y4KV3NaI3bW4uurDCuJsDerSTh36895ZIt037tprUyx/emwdR8aRfIEJg==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <77d3eab.24b0.1a14988351c.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:ZCgvCgD3_yISVtNqKwJbAA--.2458W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbC7hIph2rTVhIVbgAA3U
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CgpIZWxsbyBIZWlrb++8jAoKQXQgMjAyNi0xMC0xMyAwMDoxNTo0MCwgIkhlaWtvIFN0dWVibmVy
IiA8aGVpa29Ac250ZWNoLmRlPiB3cm90ZToKPkhpIEFuZHksCj4KPk9uIFNhdCwgMTAgT2N0IDIw
MjYgMjE6NDY6NDggKzA4MDAsIEFuZHkgWWFuIHdyb3RlOgo+PiBTd2l0Y2ggbXkgY29udGFjdCBh
ZGRyZXNzIHRvIGFuZHlzaHJrQDE2My5jb20KPgo+QXBwbGllZCwgdGhhbmtzIQo+Cj5bMS8xXSBN
QUlOVEFJTkVSUzogdXBkYXRlIG15IGVtYWlsIGFkZHJlc3MKPiAgICAgIGNvbW1pdDogN2FmYzM2
YzkyYTI4MTJkZTM2ZWMyZTE1YTZmMjgxZmNhMDgxYmVhYgo+Cj4KPldpc2hpbmcgeW91IGFsbCB0
aGUgYmVzdCBvbiB5b3VyIG5ldyBhZHZlbnR1cmVzIGFuZCBob3BlIHRvIHN0aWxsCj5zZWUgeW91
IGFyb3VuZCA6LSkgLgo+Cj5UaGFua3MgYSBsb3QgZm9yIGFsbCB0aGUgd29yayBhbmQgZ3JlYXQg
aW5wdXQgeW91IHByb3ZpZGVkIHRvIHVzLgo+Cj4KPkJlc3QgcmVnYXJkcywKCgpUaGFuayB5b3Xi
gJR0aGFuayB5b3UgZm9yIGFsbCB5b3VyIGNvbnRyaWJ1dGlvbnMgYW5kIGhlbHAgYWxvbmcgdGhl
IHdheS4KSSB0aGluayBvdXIgY29kZSB3aWxsIGNyb3NzIHBhdGhzIGFnYWluLCBzb21ld2hlcmUg
dXBzdHJlYW0uCgo+LS0gCj5IZWlrbyBTdHVlYm5lciA8aGVpa29Ac250ZWNoLmRlPgo=
