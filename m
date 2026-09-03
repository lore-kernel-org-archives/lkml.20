Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D513F54A7
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 07:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788419710; cv=none; b=lW4kTB5696Nz//BbSb9GJfg9b2+J7lZkGbkqJ67HaPz4Zh089UAej6A4b2momPyDKksRLPO3us4NBxXIo5iTTnA2UN7UmKF2Kma3WhIJf4/MZ4wRIexrrCUJSQ4kBSdK3pQoiuj5JhZhVJzNgMDnwdx5qBJunvsNiCgijqVnxzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788419710; c=relaxed/simple;
	bh=7I1TM4mon99cdjX6OXkeFOr+D3Q+nPVjU9R5xcOg7WM=;
	h=Date:From:To:Cc:Subject:Content-Type:MIME-Version:Message-ID; b=JnLAVmS3uOgUcavtGBFqB7NlLz8WxTU8y5ZwcrjsGi6Qiuv6vsemo+pLgWNevpMuaPlMxy4gu32DchPrrW/WvmIeCQGEHDwmOiww0rOuw2Y3ZEngtqQYK4HLYH3lnm2NxGbqIFwTZOfG0lhROVeJTUWJY4AvyxK4haaXUBnMmiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=G1sblck7; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="G1sblck7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=7I1TM4mon99cdjX6OXkeFOr+D3Q+nPVjU9R5xcOg7WM=; b=G
	1sblck7J5VGed5JYzu0Nir4PCiMcfWad17tD/6oIqrn9haI2JIs/ji2ZAso2x8tR
	pB6QCQeItRrsi4IcjDMij4Yj4x1Ip7ZcZArywwLm6oBohPyGMYeFLL8A8vp0//HP
	Jq1Wep5tr9oC+Y95i6rCiFDRZeAFXe64h4dsbkI/Q0=
Date: Thu, 3 Sep 2026 15:14:26 +0800 (CST)
From: CJ <firefly0158@163.com>
To: jack@suse.com
Cc: linux-kernel@vger.kernel.org,
	syzbot+61564e5023b7229ec85d@syzkaller.appspotmail.com
Subject: [BUG] udf: possible use-after-free in udf_close_lvid
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
X-NTES-SC: AL_Qu2TCviatk4t4CeaZ+kdnk8aj+g+UcCwufkj24Bfc+8GgRv84DoEfW1FPnbL6uekLwG0vT6TaBlX0txmU4J4efaUhMPSIW1gqtWASNPqmA==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <451669fc.58e2.1a0661e7329.Coremail.firefly0158@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:kygvCgD3n+lTHplqE4o+AA--.7610W
X-CM-SenderInfo: piluvw1o1qikqy6rljoofrz/xtbC3ROcTmqZHlO4TgAA3U
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CkhpLAoKCkkgYW0gcmVwb3J0aW5nIHRoYXQgdXNlLWFmdGVyLWZyZWUgaW4gdWRmX2Nsb3NlX2x2
aWQgYXBwZWFycyB0byByZW1haW4KcmVwcm9kdWNpYmxlIHdpdGggYSBtaWdyYXRlZCBzeXprYWxs
ZXIgcmVwcm9kdWNlciBvbiBMaW51eCA3LjItcmMzLiBUaGUKdGVzdGVkIEhFQUQgY29tbWl0IGlz
IGExM2MxNDBjYzI4OWMwYjdiMzc3MGJjZTViM2FkNDJhYjM1MDc0YWEuCgoKVGhlIHJlcHJvZHVj
ZXIgbW91bnRzIGFuZCB1bm1vdW50cyBhIGNyYWZ0ZWQgVURGIGltYWdlLCByZWFjaGluZwp1ZGZf
cHV0X3N1cGVyKCkgYW5kIHVkZl9jbG9zZV9sdmlkKCkgZHVyaW5nIHN1cGVyYmxvY2sgdGVhcmRv
d24uCgoKVGhlIHRhcmdldCBydW4gZmF1bHRzIGluIHVkZl9jbG9zZV9sdmlkKCksIHdoaWxlIHRo
ZSBzdHJ1Y3R1cmFsbHkgbWF0Y2hpbmcKYXJjaGl2ZWQgcmVwb3J0IGlkZW50aWZpZXMgYSB1c2Ut
YWZ0ZXItZnJlZSB3cml0ZSBpbiB0aGUgc2FtZSBmdW5jdGlvbiBhbmQKdGVhcmRvd24gcGF0aC4K
CgpUaGlzIGxvb2tzIGxpa2UgbGlmZXRpbWUgb3IgdGVhcmRvd24gb3JkZXJpbmcgYXJvdW5kIHRo
ZSBsb2dpY2FsIHZvbHVtZQppbnRlZ3JpdHkgZGVzY3JpcHRvciwgYWxsb3dpbmcgdWRmX2Nsb3Nl
X2x2aWQoKSB0byBhY2Nlc3Mgc3RvcmFnZSB0aGF0IGhhcwphbHJlYWR5IGJlZW4gcmVsZWFzZWQu
CgoKVGhpcyBpc3N1ZSB3YXMgcHJldmlvdXNseSByZXBvcnRlZCBhdDoKCgpodHRwczovL3N5emth
bGxlci5hcHBzcG90LmNvbS9idWc/ZXh0aWQ9NjE1NjRlNTAyM2I3MjI5ZWM4NWQKCgpSZXByb2R1
Y2VyOgoKCnN5eiByZXByb2R1Y2VyOmh0dHBzOi8vcGFzdGViaW4uY29tL3Jhdy9UUzJ0M1liWgoK
CmNvbnNvbGUgb3V0cHV0OiBodHRwczovL3Bhc3RlYmluLmNvbS9yYXcvRjNLdzh1VWIKa2VybmVs
IGNvbmZpZzogaHR0cHM6Ly9wYXN0ZWJpbi5jb20vcmF3LzhkVGd0S3U1CgoKS2VybmVsOgoKCkhF
QUQgY29tbWl0OiBhMTNjMTQwY2MyODljMGI3YjM3NzBiY2U1YjNhZDQyYWIzNTA3NGFhCmdpdCB0
cmVlOiB0b3J2YWxkcy9saW51eAprZXJuZWwgdmVyc2lvbjogNy4yLjAtcmMzICMxIFBSRUVNUFQo
ZnVsbCkKdGVzdGVkIHRhZzogdjcuMi1yYzMKCgpMZXQgbWUga25vdyBpZiB5b3UgbmVlZCBtb3Jl
IGRldGFpbHMgb3IgdGVzdGluZy4KCgpCZXN0IHJlZ2FyZHMKCg==
