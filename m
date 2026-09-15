Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A483F0756
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 06:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789455359; cv=none; b=sVIXpbylq+EuYnoB6gCpLk7ScF7eDKpzMbBAWqeb1q8RYZ9lzjj8xhlMe0p3/QBkaovCcveo4gES5yc7+RSRjAc/0UWCf3Op/0dBF/EqZs9y5YzWuuqFHn80OFlfekYvnuJlhjy/q+paN97g5y3CRT05DN44L2uN5XJJlnTr2hE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789455359; c=relaxed/simple;
	bh=kvrelG0qR1fYZO9feFW36MoxJo4LeVxgR5Kiclj9pgs=;
	h=Date:From:To:Cc:Subject:Content-Type:MIME-Version:Message-ID; b=a5oLca/wfW6mu+jidkRozSlXIWkBjGLmjE56YM3fpuYiUfj21qwT412aULEzsQnr0UVHbN8Z3THuNaKEKeyWkwSE1MpzWOIN++fkgTx63bOQ+CgGU12BJrKYkSyxiQ0/xvU7l5/iAPL0jY17iKi6l4BMV+7iiTKtHTCrvX78oWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=lISxbIv2; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="lISxbIv2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=kvrelG0qR1fYZO9feFW36MoxJo4LeVxgR5Kiclj9pgs=; b=l
	ISxbIv2m9dZSUMQ++5TQ8b/0x6mh88PlZ0s6LoIHwbvlt84iYIFDCnyOm2ZKoQzI
	jTVBulGMA8laZiwIrY+yO2Mt0SWCXH2jrhZiT8wZdYlcw6pxYxof9C4TLWiD431p
	kM7gM7ZqNNA4zT5+ssA2anTsMoQQv2/y/G2qkHEk1w=
Date: Tue, 15 Sep 2026 14:55:42 +0800 (CST)
From: CJ <firefly0158@163.com>
To: luisbg@kernel.org, salah.triki@gmail.com
Cc: linux-kernel@vger.kernel.org
Subject: [BUG] befs: UBSAN shift-out-of-bounds in befs_check_sb
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
X-NTES-SC: AL_Qu2TC/ieuksv5CafYOkdmEsTju82UcS4ufQl245Xc98Figbk+QAgeFpPNFDG1NiRKyuJkh+TdQFs6cJxc45/hAvHpP9WJbSeJhoVD6wqhQ==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <65089c18.5b94.1a0a3d99c5d.Coremail.firefly0158@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:hygvCgD3X6_v66hqW_QPAA--.21234W
X-CM-SenderInfo: piluvw1o1qikqy6rljoofrz/xtbC+Q76rGqo6+6wBwAA3R
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CkhpLAoKCkkgYW0gcmVwb3J0aW5nIGEgVUJTQU4gc2hpZnQtb3V0LW9mLWJvdW5kcyBkdXJpbmcg
YmVmcyBtb3VudCwgdHJpZ2dlcmVkIGJ5IGEKc3l6a2FsbGVyIHJlcHJvZHVjZXIgdGhhdCBtb3Vu
dHMgYSBjcmFmdGVkIGJlZnMgaW1hZ2UuICBUaGUgaXNzdWUgaXMgcmVwcm9kdWNpYmxlCndpdGgg
SEVBRCBjb21taXQgY2VlOTM5NWFjZDgwNDNiZTA2NDRiMjVjMzRiZmE4NjYyM2YyYjkzNSAodjcu
My1yYzEsIExpbnV4CjcuMy4wLXJjMSkuCgoKVGhlIHJlcHJvZHVjZXIgbW91bnRzIGEgY3JhZnRl
ZCBiZWZzIGZpbGVzeXN0ZW0gaW1hZ2Ugb24gYSBsb29wIGRldmljZTsgdGhlCmNvbnNvbGUgc2hv
d3MgbG9vcDAgZGV0ZWN0ZWQgd2l0aCBhIGNhcGFjaXR5IG9mIDEyOCBibG9ja3MgYW5kIHRoZW4g
dGhlCnNhbml0aXplciByZXBvcnQgZnJvbSB0aGUgbW91bnQgcGF0aC4KCgpVQlNBTiByZXBvcnRz
IGEgc2hpZnQtb3V0LW9mLWJvdW5kcyBhdCBmcy9iZWZzL3N1cGVyLmM6OTY6OSB3aXRoIGEgc2hp
ZnQgZXhwb25lbnQKb2YgMjA2Njg0MjgxNiwgd2hpY2ggaXMgZmFyIG91dHNpZGUgdGhlIHdpZHRo
IG9mIHRoZSAzMi1iaXQgaW50IGJlaW5nIHNoaWZ0ZWQuClRoZSBjYWxsIHBhdGggaXMgYmVmc19j
aGVja19zYiwgcmVhY2hlZCBmcm9tIGJlZnNfZmlsbF9zdXBlci4gIE9uZSBkZXRhaWwgd29ydGgK
bm90aW5nIGZvciBhbnlvbmUgcmVwcm9kdWNpbmcgdGhpczogaW4gdGhlIGNvbnNvbGUgY2FwdHVy
ZWQgb24gdjcuMy1yYzEgdGhlCnJlcG9ydCdzIGZpbGUgcGF0aCBpcyBwcmludGVkIGFzIGEga2Vy
bmVsIGJ1aWxkIGRpcmVjdG9yeSBwYXRoIHJhdGhlciB0aGFuCmZzL2JlZnMvc3VwZXIuYywgYmVj
YXVzZSB0aGUgdGVzdCBrZXJuZWwgd2FzIGJ1aWx0IHdpdGggaXRzIHNvdXJjZSB0cmVlIGluIGEK
ZGlmZmVyZW50IGxvY2F0aW9uOyB0aGUgc291cmNlIGxpbmUgYW5kIGNvbHVtbiAoc3VwZXIuYzo5
Njo5KSBhcmUgdGhlIHNhbWUgYXMgaW4KdGhlIG9yaWdpbmFsIHJlcG9ydC4KCgpPbmUgcG9zc2li
bGUgY2F1c2UgaXMgdGhhdCBhIHN1cGVyYmxvY2sgZmllbGQgcmVhZCBmcm9tIHRoZSBjcmFmdGVk
IGltYWdlIGlzIHVzZWQKYXMgYSBzaGlmdCBhbW91bnQgd2l0aG91dCBiZWluZyByYW5nZS1jaGVj
a2VkLCBzbyB0aGUgc2hpZnQgaXMgdW5kZWZpbmVkLiAgVGhpcwpsb29rcyBsaWtlIGEgbWlzc2lu
ZyB2YWxpZGF0aW9uIG9mIGFuIG9uLWRpc2sgZmllbGQuICBJIGFtIHJlcG9ydGluZyB0aGUKc2Fu
aXRpemVyIGZpbmRpbmcgYW5kIHRoZSBwYXRoIGFzIG9ic2VydmVkLgoKClRoaXMgYXBwZWFycyB0
byBiZSBhIHJlY3VycmVuY2Ugb2YgdGhlIHN5emJvdCBpc3N1ZSB3aG9zZSBleHRlcm5hbCBpZCBp
cwphZmZkNzhmZmY4MzNjMjY5NWQwMi4gIEl0IHJlbWFpbnMgcmVwcm9kdWNpYmxlIG9uIHY3LjMt
cmMxLgoKClJlcHJvZHVjZXI6CgoKc3l6IHJlcHJvZHVjZXI6wqBodHRwczovL3Bhc3RlYmluLmNv
bS9yYXcvU1Q0cUVma1MKCmNvbnNvbGUgb3V0cHV0OiBodHRwczovL3Bhc3RlYmluLmNvbS9yYXcv
eTRkSzZwN2UKCmtlcm5lbCBjb25maWc6wqDCoGh0dHBzOi8vcGFzdGViaW4uY29tL3Jhdy92d1Fu
UU0xcgoKCktlcm5lbDoKCgpIRUFEIGNvbW1pdDogY2VlOTM5NWFjZDgwNDNiZTA2NDRiMjVjMzRi
ZmE4NjYyM2YyYjkzNQpnaXQgdHJlZTogdXBzdHJlYW0gKGxpbnV4LmdpdCksIHRlc3RlZCB0aHJv
dWdoIHRoZSB2Ny4zLXJjMSBhbm5vdGF0ZWQgdGFnIG9iamVjdArCoCDCoCDCoCDCoCDCoCDCoGU1
ZTA0NzI2Y2RkMDQzZTMwOTY3NzA3MWFiMWI2NWE0YjE4ZjQyMmIKa2VybmVsIHZlcnNpb246IDcu
My4wLXJjMSAjMSBQUkVFTVBUKGZ1bGwpCnRlc3RlZCB0YWc6IHY3LjMtcmMxIChMaW51eCA3LjMt
cmMxLCAyMDI2LTA4LTMwKQoKCkxldCBtZSBrbm93IGlmIHlvdSBuZWVkIG1vcmUgZGV0YWlscyBv
ciB0ZXN0aW5nLgoKCkJlc3QgcmVnYXJkcywKQ2hhbmdqaWFuCgoK
