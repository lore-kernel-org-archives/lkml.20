Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C09DE6FC5
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 06:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789454215; cv=none; b=o8mlknIEatPpyKWoT7mxjU/RO7cTgRFk8DHkiqosdHKGUwFA9WwIaNr0Bu6Wi3/I1A6vsRjlRsueAXZIukOW7COzBI25/etwAGnZzrzF/XzvlNoaYgEQxTD+wKKohzbXygu4BfzPjfB3ozPgJ6NjfMwEt1CwwAu3kwjWihdyrNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789454215; c=relaxed/simple;
	bh=bjwpWAiphqxpbr7Jg3Ug4FNbKb7vOKPhKHgO/HrGxWo=;
	h=Date:From:To:Cc:Subject:Content-Type:MIME-Version:Message-ID; b=ZhM3XMJ4Ocn/DeXLM1bXsRT51MK+MSuXqKI61aewzmLAWjPTlovh+YAAl7Cn3k9x8bot08QqO/+XXNYcqNRfWTx+N1lCirL4W+G1+cyPUku6LmiekKWP//l5Ovha3zFSAI3yLQcskdo+PuU7nx7XKcm6jjQerLK382mbPBUiSoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=kWqL3las; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="kWqL3las"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=bjwpWAiphqxpbr7Jg3Ug4FNbKb7vOKPhKHgO/HrGxWo=; b=k
	WqL3lasUJslTJ/rtcAjuG5aB5Ftpo4b4BTpcD9FdFakBr7U8NwFBuleeXoG79vPk
	cHMOcwJUjxO3TwV41TlBTvIiRlSQMoyYQ3FapJh2oDdUG35Sg1m3IHXXMLEZ/LQo
	O6KeFgx1qXEUCTGBM3M8xXNZxgzQXs+lC4NRii7VKI=
Date: Tue, 15 Sep 2026 14:35:54 +0800 (CST)
From: CJ <firefly0158@163.com>
To: shaggy@kernel.org, yun.zhou@windriver.com, mjguzik@gmail.com,
	brauner@kernel.org, ssrane_b23@ee.vjti.ac.in
Cc: jfs-discussion@lists.sourceforge.net, linux-kernel@vger.kernel.org
Subject: [BUG] jfs: kernel BUG in txEnd at fs/jfs/jfs_txnmgr.c
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
X-NTES-SC: AL_Qu2TC/ieu0ku4iGabOkdmEsTju82UcS4ufQl245Xc98Figbk+QAgeFpPNFDG1NiRKyuJkh+TdQFs6cJxc45/+dSwiiU+syDjEGxTnyIuZw==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <443ec676.55de.1a0a3c7799d.Coremail.firefly0158@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:hygvCgD3H7VK56hq3+wPAA--.20930W
X-CM-SenderInfo: piluvw1o1qikqy6rljoofrz/xtbC+QrQgmqo50pEKwAA3h
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CkhpLAoKCkkgYW0gcmVwb3J0aW5nIGEga2VybmVsIEJVRyBpbiB0aGUgSkZTIHRyYW5zYWN0aW9u
IG1hbmFnZXIsIHRyaWdnZXJlZCBieSBhCnN5emthbGxlciByZXByb2R1Y2VyIHRoYXQgbW91bnRz
IGEgY3JhZnRlZCBKRlMgaW1hZ2UuICBUaGUgaXNzdWUgaXMgcmVwcm9kdWNpYmxlCndpdGggSEVB
RCBjb21taXQgY2VlOTM5NWFjZDgwNDNiZTA2NDRiMjVjMzRiZmE4NjYyM2YyYjkzNSAodjcuMy1y
YzEsIExpbnV4CjcuMy4wLXJjMSkuCgoKVGhlIHJlcHJvZHVjZXIgbW91bnRzIGEgY3JhZnRlZCBK
RlMgZmlsZXN5c3RlbSBpbWFnZSBvbiBhIGxvb3AgZGV2aWNlIGFuZCB0aGVuCnRydW5jYXRlcyBh
IGZpbGUsIHdoaWNoIG1ha2VzIEpGUyB3YWxrIGEgY29ycnVwdCBleHRlbnQgdHJlZS4KCgpUaGUg
Y29uc29sZSBzaG93cyB0aGUgdHJ1bmNhdGUgcGF0aCByZXBvcnRpbmcgYSBjb3JydXB0IHh0cmVl
IHBhZ2UgYW5kIHJlbW91bnRpbmcKdGhlIGZpbGVzeXN0ZW0gcmVhZC1vbmx5LCBhbmQgdGhlbiAi
a2VybmVsIEJVRyBhdCBmcy9qZnMvamZzX3R4bm1nci5jOjUzMCEiIHdpdGgKYW4gaW52YWxpZC1v
cGNvZGUgT29wcyBhbmQgUklQIGluIHR4RW5kLiAgVGhlIGFzc2VydGlvbiBhdCB0aGF0IHNpdGUg
aXMKYXNzZXJ0KHRibGstPm5leHQgPT0gMCksIHNvIHRoZSB0cmFuc2FjdGlvbiBibG9jayBiZWlu
ZyBlbmRlZCBpcyBzdGlsbCBsaW5rZWQuCgoKT25lIHBvc3NpYmxlIGNhdXNlIGlzIHRoYXQgdGhl
IGVycm9yIHBhdGggdGFrZW4gYWZ0ZXIgdGhlIGNvcnJ1cHQgeHRyZWUgcGFnZSBpcwpkZXRlY3Rl
ZCBlbmRzIHRoZSB0cmFuc2FjdGlvbiB0d2ljZSwgb3IgbGVhdmVzIGEgdHJhbnNhY3Rpb24gYmxv
Y2sgbGlua2VkIHdoZW4KdHhFbmQgZXhwZWN0cyBpdCB0byBiZSBkZXRhY2hlZCwgc28gdGhlIGxp
bmtlZC1saXN0IGludmFyaWFudCB0aGUgYXNzZXJ0aW9uCmNoZWNrcyBpcyB2aW9sYXRlZC4gIFRo
aXMgbG9va3MgbGlrZSBzdGF0ZSBtYW5hZ2VtZW50IG9mIHRoZSB0cmFuc2FjdGlvbiBibG9jawps
aXN0IG9uIGFuIGVycm9yIHBhdGggcmF0aGVyIHRoYW4gYSBib3VuZHMgcHJvYmxlbS4gIEkgYW0g
cmVwb3J0aW5nIHRoZQphc3NlcnRpb24gYW5kIHRoZSBwYXRoIGFzIG9ic2VydmVkLgoKClRoaXMg
YXBwZWFycyB0byBiZSBhIHJlY3VycmVuY2Ugb2YgdGhlIHN5emJvdCBpc3N1ZSB3aG9zZSBleHRl
cm5hbCBpZCBpcwo5MTRjM2NiNzVlZjIxOTcyOWEyZS4gIEl0IHJlbWFpbnMgcmVwcm9kdWNpYmxl
IG9uIHY3LjMtcmMxLgoKClJlcHJvZHVjZXI6CgoKc3l6IHJlcHJvZHVjZXI6IGh0dHBzOi8vcGFz
dGViaW4uY29tL3Jhdy9WNE1jMHZycAoKY29uc29sZSBvdXRwdXQ6IGh0dHBzOi8vcGFzdGViaW4u
Y29tL3Jhdy84SzNyMHhwcgoKa2VybmVsIGNvbmZpZzrCoGh0dHBzOi8vcGFzdGViaW4uY29tL3Jh
dy96UnoycDBCRQoKCktlcm5lbDoKCgpIRUFEIGNvbW1pdDogY2VlOTM5NWFjZDgwNDNiZTA2NDRi
MjVjMzRiZmE4NjYyM2YyYjkzNQpnaXQgdHJlZTogdXBzdHJlYW0gKGxpbnV4LmdpdCksIHRlc3Rl
ZCB0aHJvdWdoIHRoZSB2Ny4zLXJjMSBhbm5vdGF0ZWQgdGFnIG9iamVjdArCoCDCoCDCoCDCoCDC
oCDCoGU1ZTA0NzI2Y2RkMDQzZTMwOTY3NzA3MWFiMWI2NWE0YjE4ZjQyMmIKa2VybmVsIHZlcnNp
b246IDcuMy4wLXJjMSAjMSBQUkVFTVBUKGZ1bGwpCnRlc3RlZCB0YWc6IHY3LjMtcmMxIChMaW51
eCA3LjMtcmMxLCAyMDI2LTA4LTMwKQoKCkxldCBtZSBrbm93IGlmIHlvdSBuZWVkIG1vcmUgZGV0
YWlscyBvciB0ZXN0aW5nLgoKCkJlc3QgcmVnYXJkcywKQ2hhbmdqaWFuCgo=
