Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B11A3603EF
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 07:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789458696; cv=none; b=GR3xWqg4/wQfDHS+iZwNGMdZwlhCipyT2v7u0tINGIpPqkAcjvALvGZ/Czk8LUaNRJkAo5Y1bKC1tclfInETCNzK6+misdX6nkCzG4sX+Tmi3x5WhcbNytnVx7kh+Fq//YWvdDJRamRCrpc8DE5lL7R99enoxwtEcB4MflllvKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789458696; c=relaxed/simple;
	bh=LoRM7x+NJoaF+LjOdayvSv4rrTQjM9W0JjI2UcIRgrE=;
	h=Date:From:To:Cc:Subject:Content-Type:MIME-Version:Message-ID; b=FRuwWfUBxtTxgRasBo7UFT2Fyng+jqofrgrHFOOl4XiLz2KaQzF1rZM8nRroZqU0fRxCrAmHZW52Bn696wbOuaWgjUxufPr2u1fbQewWDHWZcEnzPymM50j9zQmD9ffBwOAvBBIFfe0hTSA7zL5JaKP+1O6IBGh/ITgxvc0w6Lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=EKT6Pba3; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="EKT6Pba3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=LoRM7x+NJoaF+LjOdayvSv4rrTQjM9W0JjI2UcIRgrE=; b=E
	KT6Pba3LxaLgvdMdOAVTCiCCpBTGhsY2W2dBGDs1RLVBytn8+1/AhL21JV9YAJyJ
	DmVTvKa9uz6/M0NE6MqzuAGFP+Kq0MvS7juzYPgIzZDki7WiMSLKmsVLwK42Zl5R
	7NlCKWr47Smz6jbwS+Oy2/1+U9zvrzVIA4bEqmOVKc=
Date: Tue, 15 Sep 2026 15:51:10 +0800 (CST)
From: CJ <firefly0158@163.com>
To: shaggy@kernel.org, yun.zhou@windriver.com, kees@kernel.org
Cc: jfs-discussion@lists.sourceforge.net, linux-kernel@vger.kernel.org
Subject: [BUG] jfs: UBSAN shift-out-of-bounds in dbSplit
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
X-NTES-SC: AL_Qu2TC/iet04s5iOYYOkdmEsTju82UcS4ufQl245Xc98Figbk+QAgeFpPNFDG1NiRKyuJkh+TdQFs6cJxc45/cawM7cD/kjzc42PV91aTPg==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <4f5505ef.6e0f.1a0a40c62eb.Coremail.firefly0158@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:hygvCgC3553u+KhqJA0QAA--.21623W
X-CM-SenderInfo: piluvw1o1qikqy6rljoofrz/xtbC3g4+72qo+O7ccAAA35
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CkhpLAoKCkkgYW0gcmVwb3J0aW5nIGEgVUJTQU4gc2hpZnQtb3V0LW9mLWJvdW5kcyBpbiB0aGUg
SkZTIGRtYXAgc3BsaXQgcGF0aCwgdHJpZ2dlcmVkCmJ5IGEgc3l6a2FsbGVyIHJlcHJvZHVjZXIg
dGhhdCBtb3VudHMgYSBjcmFmdGVkIEpGUyBpbWFnZS4gIFRoZSBpc3N1ZSBpcwpyZXByb2R1Y2li
bGUgd2l0aCBIRUFEIGNvbW1pdCBjZWU5Mzk1YWNkODA0M2JlMDY0NGIyNWMzNGJmYTg2NjIzZjJi
OTM1Cih2Ny4zLXJjMSwgTGludXggNy4zLjAtcmMxKS4KCgpUaGUgcmVwcm9kdWNlciBtb3VudHMg
YSBjcmFmdGVkIEpGUyBmaWxlc3lzdGVtIGltYWdlIG9uIGEgbG9vcCBkZXZpY2UgYW5kCmFsbG9j
YXRlcyBibG9ja3MsIHdoaWNoIG1ha2VzIHRoZSBhbGxvY2F0b3Igc3BsaXQgYSBkbWFwIGNvbnRy
b2wgcGFnZS4KCgpVQlNBTiByZXBvcnRzIGEgc2hpZnQtb3V0LW9mLWJvdW5kcyBhdCBmcy9qZnMv
amZzX2RtYXAuYzoyNzI4IHdpdGggYSBzaGlmdApleHBvbmVudCBvZiAxMjEsIHdoaWNoIGlzIGZh
ciBiZXlvbmQgdGhlIHdpZHRoIG9mIHRoZSAzMi1iaXQgaW50IGJlaW5nIHNoaWZ0ZWQuClRoZSBj
YWxsIHBhdGggaXMgZGJTcGxpdCAtPiBkYkFsbG9jQml0cyAtPiBkYkFsbG9jRG1hcCAtPiBkYkFs
bG9jRG1hcExldi4gIEluIHRoZQpvcmlnaW5hbCByZXBvcnQgdGhlIHNhbWUgcmVwb3J0IHdhcyBy
ZWNvcmRlZCBhdCBmcy9qZnMvamZzX2RtYXAuYzoyNzA3IHdpdGggdGhlCnNhbWUgc2hpZnQgZXhw
b25lbnQsIHNvIG9ubHkgdGhlIHNvdXJjZSBsaW5lIGhhcyBtb3ZlZC4KCgpPbmUgcG9zc2libGUg
Y2F1c2UgaXMgdGhhdCBhIHZhbHVlIHJlYWQgZnJvbSB0aGUgZG1hcCBjb250cm9sIHBhZ2UgaW4g
dGhlIGNyYWZ0ZWQKaW1hZ2UgaXMgdXNlZCBhcyBhIHNoaWZ0IGFtb3VudCB3aXRob3V0IGEgcmFu
Z2UgY2hlY2ssIHNvIHRoZSBzaGlmdCBpcyB1bmRlZmluZWQuClRoaXMgbG9va3MgbGlrZSBhIG1p
c3NpbmcgdmFsaWRhdGlvbiBvZiBhbiBvbi1kaXNrIGZpZWxkIHVzZWQgaW4gYW4gYXJpdGhtZXRp
YwpleHByZXNzaW9uLiAgSSBhbSByZXBvcnRpbmcgdGhlIHNhbml0aXplciBmaW5kaW5nIGFuZCB0
aGUgcGF0aCBhcyBvYnNlcnZlZC4KCgpUaGlzIGFwcGVhcnMgdG8gYmUgYSByZWN1cnJlbmNlIG9m
IHRoZSBzeXpib3QgaXNzdWUgd2hvc2UgZXh0ZXJuYWwgaWQgaXMKZWFjODRjZThiMzg5OTJjYTM0
NDEuICBJdCByZW1haW5zIHJlcHJvZHVjaWJsZSBvbiB2Ny4zLXJjMS4KCgpSZXByb2R1Y2VyOgoK
CnN5eiByZXByb2R1Y2VyOiBodHRwczovL3Bhc3RlYmluLmNvbS9yYXcvSzQxcnZXaTgKCmNvbnNv
bGUgb3V0cHV0OiBodHRwczovL3Bhc3RlYmluLmNvbS9yYXcvcFVjbTd4SkIKCmtlcm5lbCBjb25m
aWc6IGh0dHBzOi8vcGFzdGViaW4uY29tL3Jhdy9EbXVkYlZDZgoKCktlcm5lbDoKCgpIRUFEIGNv
bW1pdDogY2VlOTM5NWFjZDgwNDNiZTA2NDRiMjVjMzRiZmE4NjYyM2YyYjkzNQpnaXQgdHJlZTog
dXBzdHJlYW0gKGxpbnV4LmdpdCksIHRlc3RlZCB0aHJvdWdoIHRoZSB2Ny4zLXJjMSBhbm5vdGF0
ZWQgdGFnIG9iamVjdArCoCDCoCDCoCDCoCDCoCDCoGU1ZTA0NzI2Y2RkMDQzZTMwOTY3NzA3MWFi
MWI2NWE0YjE4ZjQyMmIKa2VybmVsIHZlcnNpb246IDcuMy4wLXJjMSAjMSBQUkVFTVBUKGZ1bGwp
CnRlc3RlZCB0YWc6IHY3LjMtcmMxIChMaW51eCA3LjMtcmMxLCAyMDI2LTA4LTMwKQoKCkxldCBt
ZSBrbm93IGlmIHlvdSBuZWVkIG1vcmUgZGV0YWlscyBvciB0ZXN0aW5nLgoKCkJlc3QgcmVnYXJk
cywKQ2hhbmdqaWFuCgo=
