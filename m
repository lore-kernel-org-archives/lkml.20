Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C27A9282F1C
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 07:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789459120; cv=none; b=HBDuh9rXm4x+VOUl+QivrDSzD2/uKO26t3uMvZFJHKRsNSereAzW/aZS1pPAgRNSWHlEqAL4pDyuRNl4ntLalbTbvzwLnmPRmmRmFpaVgnDphiSYCM/EThkslKBcrK+WADKzKwAnW+RQoqbDYHKG1neFvCEdZEBzbiunOTZVntA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789459120; c=relaxed/simple;
	bh=tJghgEc3KAe2gcLPPW8cLa5RJgerTTihsmxjaivjCSw=;
	h=Date:From:To:Cc:Subject:Content-Type:MIME-Version:Message-ID; b=rs9soFIXK61+fH7dWzSQqrpx2efjfyqF9HgpxbqHmo9EJsNXjqQSzf1kztA1qxiPzbYXOiL7a49YaP2B0+m81JlJ2JjLy5F+TlE21y/tBm/xyaa3Zs770fgM5496qdEvn1xxh5oOBhptFa2cAv74J/klqihcSOZcCNsvaFJhZp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=qUMjMbwN; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="qUMjMbwN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=tJghgEc3KAe2gcLPPW8cLa5RJgerTTihsmxjaivjCSw=; b=q
	UMjMbwN4NjxUrWTe+CHs0dJmpL+yjVtL078u/5yRydTZF3F1qoJ0i1iCBj65DFdf
	TIzPYBYiUc86Xoe99isAe8m3GX4IQctfK4F365fFlTFUO80pE3nGcIBL2S9mCpFm
	Sw8H9FySVGaD7p9HDZWX/g4ABk2aH4Ps2aghh8UQDI=
Date: Tue, 15 Sep 2026 15:58:06 +0800 (CST)
From: CJ <firefly0158@163.com>
To: shaggy@kernel.org, yun.zhou@windriver.com, kees@kernel.org
Cc: jfs-discussion@lists.sourceforge.net, linux-kernel@vger.kernel.org
Subject: [BUG] jfs: kernel BUG in dbFindLeaf at fs/jfs/jfs_dmap.c
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
X-NTES-SC: AL_Qu2TC/ietkgj4CibZOkdmEsTju82UcS4ufQl245Xc98Figbk+QAgeFpPNFDG1NiRKyuJkh+TdQFs6cJxc45/ZEDRrfuWPqpnCz5BAMCdXg==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <1c495b9a.7088.1a0a412bdf7.Coremail.firefly0158@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:hygvCgD3_7yO+qhqbxAQAA--.21713W
X-CM-SenderInfo: piluvw1o1qikqy6rljoofrz/xtbC3Q6mWGqo+o70pQAA3K
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CkhpLAoKCkkgYW0gcmVwb3J0aW5nIGEga2VybmVsIEJVRyBpbiB0aGUgSkZTIGRtYXAgbGVhZiBz
ZWFyY2gsIHRyaWdnZXJlZCBieSBhCnN5emthbGxlciByZXByb2R1Y2VyIHRoYXQgbW91bnRzIGEg
Y3JhZnRlZCBKRlMgaW1hZ2UuICBUaGUgaXNzdWUgaXMgcmVwcm9kdWNpYmxlCndpdGggSEVBRCBj
b21taXQgY2VlOTM5NWFjZDgwNDNiZTA2NDRiMjVjMzRiZmE4NjYyM2YyYjkzNSAodjcuMy1yYzEs
IExpbnV4CjcuMy4wLXJjMSkuCgoKVGhlIHJlcHJvZHVjZXIgbW91bnRzIGEgY3JhZnRlZCBKRlMg
ZmlsZXN5c3RlbSBpbWFnZSBvbiBhIGxvb3AgZGV2aWNlIGFuZCBhc2tzCmZvciBmcmVlIGJsb2Nr
cywgd2hpY2ggbWFrZXMgdGhlIGFsbG9jYXRvciBzZWFyY2ggdGhlIGRtYXAgdHJlZSBmb3IgYSBs
ZWFmLgoKClRoZSBjb25zb2xlIHNob3dzICJrZXJuZWwgQlVHIGF0IGZzL2pmcy9qZnNfZG1hcC5j
OjMwNzAhIiB3aXRoIGFuCmludmFsaWQtb3Bjb2RlIE9vcHMgYW5kIFJJUCBpbiBkYkZpbmRMZWFm
LiAgVGhlIGFzc2VydGlvbiBhdCB0aGF0IHNpdGUgaXMKYXNzZXJ0KG4gPCA0KSwgc28gdGhlIHNl
YXJjaCBpcyBleHBlY3RlZCB0byBzdGF5IHdpdGhpbiB0aGUgZm91ciBsZXZlbHMgdGhlIGRtYXAK
dHJlZSBjYW4gaGF2ZS4gIFRoZSBjYWxsIHBhdGggaXMgZGJGaW5kTGVhZiAtPiBkYkFsbG9jRG1h
cExldiAtPiBkYkFsbG9jQ3RsIC0+CmRiQWxsb2NBRy4KCgpPbmUgcG9zc2libGUgY2F1c2UgaXMg
dGhhdCB0aGUgdHJlZS1kZXB0aCBvciBsZXZlbCB2YWx1ZSB0YWtlbiBmcm9tIHRoZSBjcmFmdGVk
CmltYWdlJ3MgZG1hcCBjb250cm9sIHBhZ2UgaXMgdXNlZCB3aXRob3V0IGNoZWNraW5nIGl0IGFn
YWluc3QgdGhlIGZvdXItbGV2ZWwKbGltaXQsIHNvIHRoZSBzZWFyY2ggZGVzY2VuZHMgcGFzdCB0
aGUgZW5kIG9mIHRoZSB0cmVlIHN0cnVjdHVyZS4gIFRoaXMgbG9va3MKbGlrZSBhIG1pc3Npbmcg
cmFuZ2UgY2hlY2sgb24gZGlzay1kZXJpdmVkIHRyZWUgbWV0YWRhdGEuICBJIGFtIHJlcG9ydGlu
ZyB0aGUKYXNzZXJ0aW9uIGFuZCB0aGUgcGF0aCBhcyBvYnNlcnZlZC4KCgpUaGlzIGFwcGVhcnMg
dG8gYmUgYSByZWN1cnJlbmNlIG9mIHRoZSBzeXpib3QgaXNzdWUgd2hvc2UgZXh0ZXJuYWwgaWQg
aXMKZjBiOWM4ZjAzNDY3ZWU0ZTU4NTIuICBJdCByZW1haW5zIHJlcHJvZHVjaWJsZSBvbiB2Ny4z
LXJjMS4KCgpSZXByb2R1Y2VyOgoKCnN5eiByZXByb2R1Y2VyOiBodHRwczovL3Bhc3RlYmluLmNv
bS9yYXcvN1JmelN0Rm0KCmNvbnNvbGUgb3V0cHV0OiBodHRwczovL3Bhc3RlYmluLmNvbS9yYXcv
M0tBdzYzM0MKCmtlcm5lbCBjb25maWc6IGh0dHBzOi8vcGFzdGViaW4uY29tL3Jhdy9BdlhncGRo
egoKCktlcm5lbDoKCgpIRUFEIGNvbW1pdDogY2VlOTM5NWFjZDgwNDNiZTA2NDRiMjVjMzRiZmE4
NjYyM2YyYjkzNQpnaXQgdHJlZTogdXBzdHJlYW0gKGxpbnV4LmdpdCksIHRlc3RlZCB0aHJvdWdo
IHRoZSB2Ny4zLXJjMSBhbm5vdGF0ZWQgdGFnIG9iamVjdArCoCDCoCDCoCDCoCDCoCDCoGU1ZTA0
NzI2Y2RkMDQzZTMwOTY3NzA3MWFiMWI2NWE0YjE4ZjQyMmIKa2VybmVsIHZlcnNpb246IDcuMy4w
LXJjMSAjMSBQUkVFTVBUKGZ1bGwpCnRlc3RlZCB0YWc6IHY3LjMtcmMxIChMaW51eCA3LjMtcmMx
LCAyMDI2LTA4LTMwKQoKCkxldCBtZSBrbm93IGlmIHlvdSBuZWVkIG1vcmUgZGV0YWlscyBvciB0
ZXN0aW5nLgoKCkJlc3QgcmVnYXJkcywKQ2hhbmdqaWFuCgo=
