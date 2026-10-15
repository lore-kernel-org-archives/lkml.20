Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24BD048E0DE
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 08:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792053692; cv=none; b=jhGMgsoNRci1bVZzxOJ0L6cojUsA3uvy5SBFnoXBwf0lqu+yb/t0zbE4WLwFYqs3kn8kMZ/e+0XmQbHsKz/kiz47uFJinxVfDT+FhldBHGCWHm3utKnxapWvF4RBqpC5HzWCU/VWR6OsvRv+/lZPhTlmMoWf1CqnQk2Mi/f3fP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792053692; c=relaxed/simple;
	bh=tdx46b4X8KT3uTDDgG01jx+zdIGIeM8B1mK4TlJVn4M=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=g4I2ZEtaLeosB6GmvOWHkh8nS3MZQZitoWzgYq01f5UpEdhK1LL7t74cvuuB78L0VwwiE9TEpmmvP7M+dUNL2MGQ0NMu+S3iHd3oSgAUpW1XqVJCMBJe8SBrrnZi12OAv0pYUBs9rKEFjEhcUZiG60LZbqkOr7mx5rDjaKucWRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=VkseKGKn; arc=none smtp.client-ip=220.197.31.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="VkseKGKn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=tdx46b4X8KT3uTDDgG01jx+zdIGIeM8B1mK4TlJVn4M=; b=V
	kseKGKnLBlcUzmjT94+Vscvtw3AEeOqO4xjrkw/ntV5BUROnMj2/E1XcmZ2yoe8n
	+4ejJR5F1WuH0X4vjdACyDazdiYEja6oMS/my8ev44mMRsju+PiWs+LfMiPzStqK
	5Z21S/Y6i6x8/z4bUT1MRhuF+0Uc0RJ53g2grkwmVA=
Date: Thu, 15 Oct 2026 16:40:29 +0800 (CST)
From: "Nanzhe Zhao" <nzzhao@126.com>
To: "Jaegeuk Kim" <jaegeuk@kernel.org>
Cc: "Nanzhe Zhao" <nzzhao.sigma@gmail.com>, "Barry Song" <baohua@kernel.org>,
	"Nanzhe Zhao" <zhaonanzhe@xiaomi.com>,
	"Juan Yescas" <jyescas@google.com>,
	"Daeho Jeong" <daehojeong@google.com>, linux-kernel@vger.kernel.org,
	"Dev Jain" <Dev.Jain@arm.com>,
	"David Hildenbrand" <David.Hildenbrand@arm.com>,
	"Pengfei Li" <lipengfei28@xiaomi.com>,
	"Bo Zhang" <zhangbo56@xiaomi.com>,
	"Kalesh Singh" <kaleshsingh@google.com>,
	linux-f2fs-devel@lists.sourceforge.net,
	"Ryan Roberts" <Ryan.Roberts@arm.com>
Subject: Re:Re: [f2fs-dev] [PATCH v5 00/16] f2fs: support & optimize large
 folios for writable files
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 126com
In-Reply-To: <atA24UMtAqkmz_R8@google.com>
References: <20261014064445.2835813-1-zhaonanzhe@xiaomi.com>
 <atAO6ykqwGgZq77y@google.com> <atA24UMtAqkmz_R8@google.com>
X-NTES-SC: AL_Qu2SAPyevE4p7yabYukdmEoVj+o8Xsaxs/8g2YJSc80Ooxvs5zIGU2d5Anvw/ei9Fi6BrjG2fgRi+th/Y6NKX1hlfeCqN0fUPJQN0mktSg==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <1d90a289.6797.1a13eb852cb.Coremail.nzzhao@126.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:cykvCgC3_299kdBqXiVQAA--.25521W
X-CM-SenderInfo: xq22xtbr6rjloofrz/xtbBsB1SImrQkX3B3wAA3V
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CkhpIEphZWd1azoKQXQgMjAyNi0xMC0xNSAxMDoxMzo1MywgIkphZWdldWsgS2ltIiA8amFlZ2V1
a0BrZXJuZWwub3JnPiB3cm90ZToKPk9rLCB0aGlzIGNvbWVzIHdoZW4gYXBwbHlpbmcgImYyZnM6
IGNhcnJ5IHN1YnBhZ2Ugb2Zmc2V0IGFuZCBjb3VudCBpbiB3cml0ZSBJTyIuCj4KPk9uIDEwLzE0
LCBKYWVnZXVrIEtpbSB2aWEgTGludXgtZjJmcy1kZXZlbCB3cm90ZToKPj4gSGkgTmFuemhlLAo+
PiAKPj4gQ291bGQgeW91IHBsZWFzZSBjaGVjayBJTyBzdWJtaXNzaW9uIHBhdGggZm9yIFpvbmVk
IGJsb2NrIGRldmljZT8KPj4gSSBoaXQgdGhpcy4KPj4gCj4+IFsgICA5My4xMDAyMjVdIHNkIDA6
MDowOjQ6IFJldHJ5aW5nIHVuYWxpZ25lZCB3cml0ZSBmb3Igem9uZSAyNjM5OyBvZmZzZXQgMjU5
NDQzMzEyOyB6b25lIG9mZnNldCAxOTA1NjsgSS9PIHNjaGVkdWxlciAobm9uZSk7IHJxIDAwMDAw
MDAwNjUzYjZhNzAgey5vcD1XUkkKPj4gWyAgIDkzLjEwMDQyMF0gc2QgMDowOjA6NDogUmV0cnlp
bmcgdW5hbGlnbmVkIHdyaXRlIGZvciB6b25lIDI2Mzk7IG9mZnNldCAyNTk0NDMzMTI7IHpvbmUg
b2Zmc2V0IDE5MDU2OyBJL08gc2NoZWR1bGVyIChub25lKTsgcnEgMDAwMDAwMDA2NTNiNmE3MCB7
Lm9wPVdSSQo+PiBbICAgOTMuMTAwNTUxXSBzZCAwOjA6MDo0OiBSZXRyeWluZyB1bmFsaWduZWQg
d3JpdGUgZm9yIHpvbmUgMjYzOTsgb2Zmc2V0IDI1OTQ0MzMxMjsgem9uZSBvZmZzZXQgMTkwNTY7
IEkvTyBzY2hlZHVsZXIgKG5vbmUpOyBycSAwMDAwMDAwMDY1M2I2YTcwIHsub3A9V1JJCj4+IFsg
ICA5My4xMDA5NDhdIHNkIDA6MDowOjQ6IFJldHJ5aW5nIHVuYWxpZ25lZCB3cml0ZSBmb3Igem9u
ZSAyNjM5OyBvZmZzZXQgMjU5NDQzMzEyOyB6b25lIG9mZnNldCAxOTA1NjsgSS9PIHNjaGVkdWxl
ciAobm9uZSk7IHJxIDAwMDAwMDAwNjUzYjZhNzAgey5vcD1XUkkKPj4gWyAgIDkzLjEwMTQzMl0g
c2QgMDowOjA6NDogUmV0cnlpbmcgdW5hbGlnbmVkIHdyaXRlIGZvciB6b25lIDI2Mzk7IG9mZnNl
dCAyNTk0NDMzMTI7IHpvbmUgb2Zmc2V0IDE5MDU2OyBJL08gc2NoZWR1bGVyIChub25lKTsgcnEg
MDAwMDAwMDA2NTNiNmE3MCB7Lm9wPVdSSQo+PiBbICAgOTMuMTAxNzYyXSBzZCAwOjA6MDo0OiBS
ZXRyeWluZyB1bmFsaWduZWQgd3JpdGUgZm9yIHpvbmUgMjYzOTsgb2Zmc2V0IDI1OTQ0MzMxMjsg
em9uZSBvZmZzZXQgMTkwNTY7IEkvTyBzY2hlZHVsZXIgKG5vbmUpOyBycSAwMDAwMDAwMDY1M2I2
YTcwIHsub3A9V1JJCj4+IFsgICA5My4xMDE5MDddIHNkIDA6MDowOjQ6IFJldHJ5aW5nIHVuYWxp
Z25lZCB3cml0ZSBmb3Igem9uZSAyNjM5OyBvZmZzZXQgMjU5NDQzMzEyOyB6b25lIG9mZnNldCAx
OTA1NjsgSS9PIHNjaGVkdWxlciAobm9uZSk7IHJxIDAwMDAwMDAwNjUzYjZhNzAgey5vcD1XUkkK
Pj4gWyAgIDkzLjEwMjU2NF0gc2QgMDowOjA6NDogUmV0cnlpbmcgdW5hbGlnbmVkIHdyaXRlIGZv
ciB6b25lIDI2Mzk7IG9mZnNldCAyNTk0NDMzMTI7IHpvbmUgb2Zmc2V0IDE5MDU2OyBJL08gc2No
ZWR1bGVyIChub25lKTsgcnEgMDAwMDAwMDA2NTNiNmE3MCB7Lm9wPVdSSQo+PiBbICAgOTMuMTAz
MDU0XSBzZCAwOjA6MDo0OiBSZXRyeWluZyB1bmFsaWduZWQgd3JpdGUgZm9yIHpvbmUgMjYzOTsg
b2Zmc2V0IDI1OTQ0MzMxMjsgem9uZSBvZmZzZXQgMTkwNTY7IEkvTyBzY2hlZHVsZXIgKG5vbmUp
OyBycSAwMDAwMDAwMDY1M2I2YTcwIHsub3A9V1JJCj4+IFsgICA5My4xMDM0NDddIHNkIDA6MDow
OjQ6IFJldHJ5aW5nIHVuYWxpZ25lZCB3cml0ZSBmb3Igem9uZSAyNjM5OyBvZmZzZXQgMjU5NDQz
MzEyOyB6b25lIG9mZnNldCAxOTA1NjsgSS9PIHNjaGVkdWxlciAobm9uZSk7IHJxIDAwMDAwMDAw
NjUzYjZhNzAgey5vcD1XUkkKPj4gWyAgIDkzLjEwMzY2N10gc2QgMDowOjA6NDogUmV0cnlpbmcg
dW5hbGlnbmVkIHdyaXRlIGZvciB6b25lIDI2Mzk7IG9mZnNldCAyNTk0NDMzMTI7IHpvbmUgb2Zm
c2V0IDE5MDU2OyBJL08gc2NoZWR1bGVyIChub25lKTsgcnEgMDAwMDAwMDA2NTNiNmE3MCB7Lm9w
PVdSSQo+PiBbICAgOTMuMTA0Mjk0XSBzZCAwOjA6MDo0OiBSZXRyeWluZyB1bmFsaWduZWQgd3Jp
dGUgZm9yIHpvbmUgMjYzOTsgb2Zmc2V0IDI1OTQ0MzMxMjsgem9uZSBvZmZzZXQgMTkwNTY7IEkv
TyBzY2hlZHVsZXIgKG5vbmUpOyBycSAwMDAwMDAwMDY1M2I2YTcwIHsub3A9V1JJCj4+IFsgICA5
My4xMDQzNzNdIHNkIDA6MDowOjQ6IFJldHJ5aW5nIHVuYWxpZ25lZCB3cml0ZSBmb3Igem9uZSAy
NjM5OyBvZmZzZXQgMjU5NDQzMzEyOyB6b25lIG9mZnNldCAxOTA1NjsgSS9PIHNjaGVkdWxlciAo
bm9uZSk7IHJxIDAwMDAwMDAwNjUzYjZhNzAgey5vcD1XUkkKPj4gWyAgIDkzLjEwNDQ0OV0gc2Qg
MDowOjA6NDogUmV0cnlpbmcgdW5hbGlnbmVkIHdyaXRlIGZvciB6b25lIDI2Mzk7IG9mZnNldCAy
NTk0NDMzMTI7IHpvbmUgb2Zmc2V0IDE5MDU2OyBJL08gc2NoZWR1bGVyIChub25lKTsgcnEgMDAw
MDAwMDA2NTNiNmE3MCB7Lm9wPVdSSQo+PiBbICAgOTMuMTA1MjIwXSBzZCAwOjA6MDo0OiBSZXRy
eWluZyB1bmFsaWduZWQgd3JpdGUgZm9yIHpvbmUgMjYzOTsgb2Zmc2V0IDI1OTQ0MzMxMjsgem9u
ZSBvZmZzZXQgMTkwNTY7IEkvTyBzY2hlZHVsZXIgKG5vbmUpOyBycSAwMDAwMDAwMDY1M2I2YTcw
IHsub3A9V1JJCj4+IFsgICA5My4xMDUyNTNdIHNkIDA6MDowOjQ6IFJldHJ5aW5nIHVuYWxpZ25l
ZCB3cml0ZSBmb3Igem9uZSAyNjM5OyBvZmZzZXQgMjU5NDQzMzEyOyB6b25lIG9mZnNldCAxOTA1
NjsgSS9PIHNjaGVkdWxlciAobm9uZSk7IHJxIDAwMDAwMDAwNjUzYjZhNzAgey5vcD1XUkkKPj4g
WyAgIDkzLjEwNTUzMl0gc2QgMDowOjA6NDogUmV0cnlpbmcgdW5hbGlnbmVkIHdyaXRlIGZvciB6
b25lIDI2Mzk7IG9mZnNldCAyNTk0NDMzMTI7IHpvbmUgb2Zmc2V0IDE5MDU2OyBJL08gc2NoZWR1
bGVyIChub25lKTsgcnEgMDAwMDAwMDA2NTNiNmE3MCB7Lm9wPVdSSQoKQ291bGQgeW91IHRlbGwg
bWUgd2hpY2ggbGluZSBvZiBjb2RlIHByaW50cyB0aGlzIGxvZ6O/IEkndmUgZm91bmQgYSBiaXQg
ZGlmZmljdWx0IHRvIGZpbmQgaW4gbXkgZjJmcyBkZXYtdGVzdCBrZXJuZWwgdHJlZSBhbmQgcGl4
ZWwgYW5kcm9pZCBtYWlubGluZSBrZXJuZWwgdHJlZS4uCgpUaGFua3MsCk5hbnpoZQoKCg==
