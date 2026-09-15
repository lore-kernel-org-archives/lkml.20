Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E7BC387590
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789459489; cv=none; b=iGB9Kz4qKa+p5MAcdffMhFGC80Tkfvsfm1EIsE5dJNLE77JKiURIgUSF28m56k3lNAe0SpN9s3918Ckrsbo/RTVmIcKZEmqjiZLafNb/l+rsEwtDXxTvMEJmwUcomK0ijB7lO06ahPlYODSiB8Gg19ceHME9ZcRhdfh7Agh3mS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789459489; c=relaxed/simple;
	bh=3wO+URdvSBFVxX9Tuwun1pw6T4zTncXG6LsOhjmrjps=;
	h=Date:From:To:Cc:Subject:Content-Type:MIME-Version:Message-ID; b=KmTKfDzW+TdrWdHAFhRhCa+TDM2OzUBdMYBPprSIG8btNLFxTSjCiBQMxORkYtRSq74OcT4HgHwdwfBkxPRf1GU7M47BDYHH0nf6zVHh5oPZh0nC2ttRWmQxhKEhhwGS14CnwvDmWxWkVIMWmqU/ITeug8cga+fu7y4mgBWL+04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=T/44S0xL; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="T/44S0xL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=3wO+URdvSBFVxX9Tuwun1pw6T4zTncXG6LsOhjmrjps=; b=T
	/44S0xLfFiXzoIzajWOaxbS30znaqhYAKbxLKzHzZ1pieFniAqF6131Gh+nolh+o
	KpbC4YlQ3lBCqYgoOc7kDIe6LMokw5uDiNhbcj78XsAFx/VFLwxXfizac02LeY0X
	wzGom9ezhSUt8sr8e8GwlWKV2fENp/iY9S+Tzx9C5M=
Date: Tue, 15 Sep 2026 16:04:01 +0800 (CST)
From: CJ <firefly0158@163.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [BUG] drm: lease: WARNING in the page allocator from
 drm_mode_create_lease_ioctl
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
X-NTES-SC: AL_Qu2TC/ietkwv5yCRbOkdmEsTju82UcS4ufQl245Xc98Figbk+QAgeFpPNFDG1NiRKyuJkh+TdQFs6cJxc45/N+o2soxKf38hX/xFTvZueQ==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <389fe79.729d.1a0a41825db.Coremail.firefly0158@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:hygvCgD3n7Hx+6hqKhMQAA--.21669W
X-CM-SenderInfo: piluvw1o1qikqy6rljoofrz/xtbC3REAsWqo+-Ee1gAA39
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CgoKSGksCgoKCgpJIGFtIHJlcG9ydGluZyBhIFdBUk5JTkcgZnJvbSB0aGUgcGFnZSBhbGxvY2F0
b3Igb24gdGhlIERSTSBsZWFzZS1jcmVhdGlvbiBwYXRoLAp0cmlnZ2VyZWQgYnkgYSBzeXprYWxs
ZXIgcmVwcm9kdWNlci4gIFRoZSBpc3N1ZSBpcyByZXByb2R1Y2libGUgd2l0aCBIRUFEIGNvbW1p
dApjZWU5Mzk1YWNkODA0M2JlMDY0NGIyNWMzNGJmYTg2NjIzZjJiOTM1ICh2Ny4zLXJjMSwgTGlu
dXggNy4zLjAtcmMxKS4KCgoKClRoZSByZXByb2R1Y2VyIG9wZW5zIGEgRFJNIHJlbmRlciBub2Rl
IGFuZCBpc3N1ZXMgRFJNX0lPQ1RMX01PREVfQ1JFQVRFX0xFQVNFCndpdGggYW4gb2JqZWN0IGlk
IGFycmF5IHdob3NlIGxlbmd0aCBmaWVsZCBpcyAxMDAwMDAwIHdoaWxlIHRoZSBhcnJheSBpdHNl
bGYKY29udGFpbnMgYSBzaW5nbGUgaWQuCgoKCgpUaGUgY29uc29sZSBzaG93cyBhIFdBUk5JTkcg
YXQgbW0vcGFnZV9hbGxvYy5jOjUzNDAgd2l0aCBSSVAgaW4KX19hbGxvY19mcm96ZW5fcGFnZXNf
bm9wcm9mLCByZWFjaGVkIGZyb20gZHJtX21vZGVfY3JlYXRlX2xlYXNlX2lvY3RsIHRocm91Z2gg
dGhlCmxlYXNlIG9iamVjdCBib29ra2VlcGluZy4gIE9uIHRoZSBrZXJuZWwgd2hlcmUgdGhpcyB3
YXMgZmlyc3QgcmVwb3J0ZWQgdGhlIHNhbWUKd2FybmluZyB3YXMgcmVjb3JkZWQgYXQgbW0vcGFn
ZV9hbGxvYy5jOjUzOTggaW4gX19hbGxvY19wYWdlcywgd2hpY2ggaXMgdGhlIHNhbWUKYWxsb2Nh
dGlvbiBwYXRoIGJlZm9yZSBhIGxhdGVyIHJlZmFjdG9yLCBhbmQgdGhlIGNhbGxlciBpcyB0aGUg
c2FtZSBpb2N0bC4KCgoKCk9uZSBwb3NzaWJsZSBjYXVzZSBpcyB0aGF0IHRoZSBsZW5ndGggdGhl
IGlvY3RsIHN1cHBsaWVzIGZvciB0aGUgb2JqZWN0IGlkIGFycmF5CmlzIHVzZWQgdG8gc2l6ZSBh
biBhbGxvY2F0aW9uIHdpdGhvdXQgYmVpbmcgY2hlY2tlZCBhZ2FpbnN0IHRoZSBudW1iZXIgb2Yg
b2JqZWN0cwp0aGF0IGNhbiBhY3R1YWxseSBleGlzdCwgc28gdGhlIHJlcXVlc3QgcmVhY2hlcyB0
aGUgYWxsb2NhdG9yIHdpdGggYSBzaXplIG9yCm9yZGVyIHRoZSBhbGxvY2F0b3Igd2FybnMgYWJv
dXQuICBUaGlzIGxvb2tzIGxpa2UgYSBtaXNzaW5nIGJvdW5kIG9uIGEKdXNlci1zdXBwbGllZCBj
b3VudCByYXRoZXIgdGhhbiBhbiBhbGxvY2F0b3IgZGVmZWN0LiAgSSBhbSByZXBvcnRpbmcgdGhl
IHdhcm5pbmcKYW5kIHRoZSBwYXRoIGFzIG9ic2VydmVkLgoKCgoKVGhpcyBhcHBlYXJzIHRvIGJl
IGEgcmVjdXJyZW5jZSBvZiB0aGUgc3l6Ym90IGlzc3VlIHdob3NlIGV4dGVybmFsIGlkIGlzCmYy
Njc0NGI1MmFiODdmMjg2NGUzLiAgSXQgcmVtYWlucyByZXByb2R1Y2libGUgb24gdjcuMy1yYzEu
CgoKCgpSZXByb2R1Y2VyOgoKCgoKc3l6IHJlcHJvZHVjZXI6CnIwID0gc3l6X29wZW5fZGV2JGRy
aSgmKDB4N2YwMDAwMDAwMGMwKSwgMHgxZmYsIDB4MCkKaW9jdGwkRFJNX0lPQ1RMX01PREVfQ1JF
QVRFX0xFQVNFKHIwLCAweGMwMTg2NGM2LCAmKDB4N2YwMDAwMDAwMDQwKT17JigweDdmMDAwMDAw
MDY0MCk9WzB4MF0sIDB4ZjQyNDB9KQoKCgoKY29uc29sZSBvdXRwdXQ6IGh0dHBzOi8vcGFzdGVi
aW4uY29tL3Jhdy8xUzRQRUJRVQoKCmtlcm5lbCBjb25maWc6IGh0dHBzOi8vcGFzdGViaW4uY29t
L3Jhdy9WdTVLeTR1agoKCgoKS2VybmVsOgoKCgoKSEVBRCBjb21taXQ6IGNlZTkzOTVhY2Q4MDQz
YmUwNjQ0YjI1YzM0YmZhODY2MjNmMmI5MzUKZ2l0IHRyZWU6IHVwc3RyZWFtIChsaW51eC5naXQp
LCB0ZXN0ZWQgdGhyb3VnaCB0aGUgdjcuMy1yYzEgYW5ub3RhdGVkIHRhZyBvYmplY3QKwqAgwqAg
wqAgwqAgwqAgwqBlNWUwNDcyNmNkZDA0M2UzMDk2NzcwNzFhYjFiNjVhNGIxOGY0MjJiCmtlcm5l
bCB2ZXJzaW9uOiA3LjMuMC1yYzEgIzEgUFJFRU1QVChmdWxsKQp0ZXN0ZWQgdGFnOiB2Ny4zLXJj
MSAoTGludXggNy4zLXJjMSwgMjAyNi0wOC0zMCkKCgoKCkxldCBtZSBrbm93IGlmIHlvdSBuZWVk
IG1vcmUgZGV0YWlscyBvciB0ZXN0aW5nLgoKCgoKQmVzdCByZWdhcmRzLApDaGFuZ2ppYW4=
