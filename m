Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BABB84915B6
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 12:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791375405; cv=none; b=qaHofnAVezXX46j3HvQLfbq3Vtx4q1bcPUzaFfj52BhiEmix1qa0A0O4hqQwC/D970ZzfMA2dUkAYToWxM6UdtNrARNrvupGObv5+voFPO0xduEuecbVNOrN4mObLeA6eV6PRGd5IS/m7Hn4It6e3pURsQSVaGlfOnPKAVYZnBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791375405; c=relaxed/simple;
	bh=P7lArZGY3fEDLB4DpPb2XiOzPN5vTRWHjS2RAjpCXPM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=BpBhFWHPlg5/ZqSNlQLVCGEoUiwRImpKMfUpy/cAZ9cIXPPbJ6t+IivRzzwzLZ2rskdtrfUqUo1DKmWj+bB6BTFlgyboJ+sPIIiNWZ9JTXakzoZkfgnHI7LJYS9C5Fcb5Honwfkqc2Fj6qzRtIpk1Mf5Tm3nieXtQPW+GBqdZCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=F8QeBa+k; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="F8QeBa+k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=P7lArZGY3fEDLB4DpPb2XiOzPN5vTRWHjS2RAjpCXPM=; b=F
	8QeBa+k4SK46pkYC2AzYG02CZ/C3QMclHQ1pIr+VtioRvg2qr0sLhFQz155cZpKB
	iojoFb6OxalzcvoYaIQ+a+yyzIiEjyzCvgadMsEzCjVeOEGT/KMd5quqNLEEkJ4q
	tOf7wc4ngtzBqyjc+7AtRTBkvqiAAQOWI5ApO4APYE=
Date: Wed, 7 Oct 2026 20:16:21 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: "Shawn Lin" <shawn.lin@rock-chips.com>, linux-kernel@vger.kernel.org
Subject: Re:Re: [PATCH] mailmap: update entry for Andy Yan
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <asFNukfzX4p0LKfJ@venus>
References: <20260924105052.768760-1-andyshrk@163.com>
 <0c542580-7da3-4cf8-ab0e-9e513842a556@rock-chips.com>
 <asFNukfzX4p0LKfJ@venus>
X-NTES-SC: AL_Qu2SA/+cuksj5yaQZ+kfmUgWjuw/WsG1v/Ul1YBSP556jADo+i0hZGBoOGPE0/CWIQqvjwmaSQZO5uhUdqdmQZsGu4QiJuFizSj08cyV6uHwXw==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <26d1a19c.3176.1a1164b14b9.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:gigvCgC3_5MWOMZqmv5SAA--.13169W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbC7hZfvWrGOBaSdQAA3-
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CgpIZWxsbyBTZWJhc3RpYW7vvIwKCkF0IDIwMjYtMTAtMDQgMDI6NTE6NTAsICJTZWJhc3RpYW4g
UmVpY2hlbCIgPHNlYmFzdGlhbi5yZWljaGVsQGNvbGxhYm9yYS5jb20+IHdyb3RlOgo+SGVsbG8g
U2hhd24gJiBBbmR5LAo+Cj5PbiBGcmksIE9jdCAwMiwgMjAyNiBhdCAwNjowOToxMVBNICswODAw
LCBTaGF3biBMaW4gd3JvdGU6Cj4+IOWcqCAyMDI2LzA5LzI0IOaYn+acn+WbmyAxODo1MCwgQW5k
eSBZYW4g5YaZ6YGTOgo+PiA+IEkgd2lsbCB1c2UgYW5keXNocmtAMTYzLmNvbSBmb3IgZnV0dXJl
IHJldmlldyBhbmQgZGlzY3Vzc2lvbi4KPj4gCj4+IFNpbmNlIHlvdXIgcm9ja2NoaXAgd29yayBl
bWFpbCBpcyBub3QgcmVjZWl2aW5nIGVtYWlscyBwcm9wZXJseSwgSSB3b3VsZAo+PiBhcHByZWNp
YXRlIGl0IGlmIHRoaXMgcGF0Y2ggY291bGQgYmUgbWVyZ2VkIGFzIHNvb24gYXMgcG9zc2libGUu
Cj4+IAo+PiBSZXZpZXdlZC1ieTogU2hhd24gTGluIDxzaGF3bi5saW5Acm9jay1jaGlwcy5jb20+
Cj4KPllvdSBzaG91bGQgYWxzbyB1cGRhdGUgTUFJTlRBSU5FUlMgdG8gbGlzdCB0aGUgbmV3IGFk
ZHJlc3MgYW5kL29yCj5hZGQgc29tZSBuZXcgUm9ja2NoaXAgcGVyc29ucy4KCgpJJ2xsIHNlbmQg
b3V0IGEgc2VwYXJhdGUgcGF0Y2ggbGF0ZXIgdG8gdXBkYXRlIHRoZSBNQUlOVEFJTkVSUyBmaWxl
LiAKQ3VycmVudGx5LCB0aGUgZ2l0IHNlbmQtZW1haWwgZmVhdHVyZSBvbiBteSBsYXB0b3AgZG9l
c24ndCBzZWVtIHRvIGJlIHdvcmtpbmcgcHJvcGVybHkuCgo+Cj5HcmVldGluZ3MsCj4KPi0tIFNl
YmFzdGlhbgo=
