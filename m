Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C2E03AA9E2
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 06:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789455598; cv=none; b=isgiTil7zoA1uiWsPAZ12rSPaS0dkOAM0AuOTrUad3+a41u9LemEdY1DDFBcAqyWNHOu/VI5jxAQHIS4L0XoaFIt+JsSJVSQn2T2n5akmnpYubAtcBeZAg8XVnYutNsFjDUTxMjPW4krMJh6cV8pNbfmTaU+g1usU0mhZwHRUj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789455598; c=relaxed/simple;
	bh=lXmPoHjfQCEwiZnNo3niVSiF5uqfgBNXLhvlYQ6O04M=;
	h=Date:From:To:Cc:Subject:Content-Type:MIME-Version:Message-ID; b=JqedasyKF3/8fCgW6ZXofjV2UvpSK8kPoMSx4FFwzibcfw99UWa3WzrB4PqSTHIuyrRKhwD393Kqb6dnbaK8T5/EsigOaqIZz/K7sAiWzMkqFW7qLkOOy/IWAfMQvXjR2ClunkCB2KOOAPs6Bbb1lKcViMZ5IYjv+c/n4xQRzOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=aMEF/vO+; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="aMEF/vO+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=lXmPoHjfQCEwiZnNo3niVSiF5uqfgBNXLhvlYQ6O04M=; b=a
	MEF/vO+KRM9BXm2GRsad1STGNtLJMbCyJG8DNTs8YGU0Gnun7/QD0GbGFGEvEX/T
	kDE9CP7+uvtF0FbyeGJ3sDuMBSPVV2KxTy3hHhTckTm6VdrVVf8Kd9CKEAOhZ6C0
	Db21Z4ofD90uArjCRvZ43zz+HDkvB0a6QXNin6hSTI=
Date: Tue, 15 Sep 2026 14:59:28 +0800 (CST)
From: CJ <firefly0158@163.com>
To: shaggy@kernel.org, yun.zhou@windriver.com, kees@kernel.org
Cc: jfs-discussion@lists.sourceforge.net, linux-kernel@vger.kernel.org
Subject:  [BUG] jfs: WARNING in dbAdjTree
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
X-NTES-SC: AL_Qu2TC/ieuk0t7iGbbOkdmEsTju82UcS4ufQl245Xc98Figbk+QAgeFpPNFDG1NiRKyuJkh+TdQFs6cJxc45/iBnA6U2rA9ozFisZ0s+bGQ==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <1ad18b52.5cab.1a0a3dd0d16.Coremail.firefly0158@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:hygvCgBHr5zQ7Khqz_UPAA--.21272W
X-CM-SenderInfo: piluvw1o1qikqy6rljoofrz/xtbC3hA05Wqo7NC2VAAA3D
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CkhpLAoKCkkgYW0gcmVwb3J0aW5nIGEgV0FSTklORyBpbiB0aGUgSkZTIGRtYXAgdHJlZSBtYWlu
dGVuYW5jZSBwYXRoLCB0cmlnZ2VyZWQgYnkgYQpzeXprYWxsZXIgcmVwcm9kdWNlciB0aGF0IG1v
dW50cyBhIGNyYWZ0ZWQgSkZTIGltYWdlLiAgVGhlIGlzc3VlIGlzIHJlcHJvZHVjaWJsZQp3aXRo
IEhFQUQgY29tbWl0IGNlZTkzOTVhY2Q4MDQzYmUwNjQ0YjI1YzM0YmZhODY2MjNmMmI5MzUgKHY3
LjMtcmMxLCBMaW51eAo3LjMuMC1yYzEpLgoKClRoZSByZXByb2R1Y2VyIG1vdW50cyBhIGNyYWZ0
ZWQgSkZTIGZpbGVzeXN0ZW0gaW1hZ2Ugb24gYSBsb29wIGRldmljZSBhbmQgZnJlZXMKYmxvY2tz
LCB3aGljaCBtYWtlcyB0aGUgYWxsb2NhdG9yIHVwZGF0ZSB0aGUgZG1hcCB0cmVlLiAgVGhlIGZh
aWxpbmcgY29udGV4dCBpcwp0aGUgSkZTIGNvbW1pdCB0aHJlYWQgamZzQ29tbWl0LCBub3QgdGhl
IHN5c2NhbGwgdGFzay4KCgpUaGUgY29uc29sZSBzaG93cyAiV0FSTklORzogZnMvamZzL2pmc19k
bWFwLmM6Mjk2MiBhdCBkYkFkalRyZWUrMHgzMDcvMHgzZjAiIHdpdGgKUklQIGluIGRiQWRqVHJl
ZS4gIE9uIHRoZSBrZXJuZWwgd2hlcmUgdGhpcyB3YXMgZmlyc3QgcmVwb3J0ZWQgdGhlIHNhbWUg
cGF0aCB3YXMKcmVwb3J0ZWQgYnkgVUJTQU4gYXMgYW4gYXJyYXktaW5kZXgtb3V0LW9mLWJvdW5k
cyBhdCBmcy9qZnMvamZzX2RtYXAuYzoyODQ4LAp3aGVyZSBpbmRleCAxNjIxIHdhcyBvdXQgb2Yg
cmFuZ2UgZm9yIGEgczhbMTM2NV0gYXJyYXksIHNvIHRoZSB0d28ga2VybmVscyBleHBvc2UKdGhl
IHNhbWUgZG1hcC10cmVlIGludmFyaWFudCB2aW9sYXRpb24gYXMgYW4gb3V0LW9mLWJvdW5kcyBp
bmRleCBvbiB0aGUgb2xkZXIgb25lCmFuZCBhIHdhcm5pbmcgb24gdjcuMy1yYzEuICBCZWNhdXNl
IHRoZSBmYWlsdXJlIGNsYXNzZXMgZGlmZmVyLCBJIGFtIGRlc2NyaWJpbmcKdGhpcyBhcyBhIGxp
a2VseSByZWN1cnJlbmNlIHJhdGhlciB0aGFuIGFuIGlkZW50aWNhbCBzcGxhdC4KCgpPbmUgcG9z
c2libGUgY2F1c2UgaXMgdGhhdCB3aGlsZSB3YWxraW5nIHVwIHRoZSBkbWFwIHRyZWUgdGhlIGNv
ZGUgY29tcHV0ZXMgYQpwYXJlbnQgb3Igc2libGluZyBpbmRleCBmcm9tIHRoZSBjcmFmdGVkIGlt
YWdlJ3MgdHJlZSBjb250cm9sIGRhdGEgd2l0aG91dApjaGVja2luZyBpdCBhZ2FpbnN0IHRoZSB0
cmVlJ3MgcmVhbCBzaXplLCBzbyB0aGUgYWRqdXN0bWVudCBpcyBhcHBsaWVkIGF0IGFuCmludmFs
aWQgaW5kZXguICBUaGlzIGxvb2tzIGxpa2UgYSBtaXNzaW5nIHJhbmdlIGNoZWNrIG9uIGRtYXAg
dHJlZSBpbmRpY2VzLiAgSSBhbQpyZXBvcnRpbmcgdGhlIHdhcm5pbmcgYW5kIHRoZSBwYXRoIGFz
IG9ic2VydmVkLgoKClRoaXMgYXBwZWFycyB0byBiZSBhIHJlY3VycmVuY2Ugb2YgdGhlIHN5emJv
dCBpc3N1ZSB3aG9zZSBleHRlcm5hbCBpZCBpcwpjZmZlZTQ5ODdlZTE1ZDExNmEzMi4gIEl0IHJl
bWFpbnMgcmVwcm9kdWNpYmxlIG9uIHY3LjMtcmMxLgoKClJlcHJvZHVjZXI6CgoKc3l6IHJlcHJv
ZHVjZXI6IGh0dHBzOi8vcGFzdGViaW4uY29tL3Jhdy9mR3YwYWZpRQoKY29uc29sZSBvdXRwdXQ6
IGh0dHBzOi8vcGFzdGViaW4uY29tL3Jhdy80QUtmOGVmdAoKa2VybmVsIGNvbmZpZzogaHR0cHM6
Ly9wYXN0ZWJpbi5jb20vcmF3L0hwSGVmQVRpCgoKS2VybmVsOgoKCkhFQUQgY29tbWl0OiBjZWU5
Mzk1YWNkODA0M2JlMDY0NGIyNWMzNGJmYTg2NjIzZjJiOTM1CmdpdCB0cmVlOiB1cHN0cmVhbSAo
bGludXguZ2l0KSwgdGVzdGVkIHRocm91Z2ggdGhlIHY3LjMtcmMxIGFubm90YXRlZCB0YWcgb2Jq
ZWN0CsKgIMKgIMKgIMKgIMKgIMKgZTVlMDQ3MjZjZGQwNDNlMzA5Njc3MDcxYWIxYjY1YTRiMThm
NDIyYgprZXJuZWwgdmVyc2lvbjogNy4zLjAtcmMxICMxIFBSRUVNUFQoZnVsbCkKdGVzdGVkIHRh
ZzogdjcuMy1yYzEgKExpbnV4IDcuMy1yYzEsIDIwMjYtMDgtMzApCgoKTGV0IG1lIGtub3cgaWYg
eW91IG5lZWQgbW9yZSBkZXRhaWxzIG9yIHRlc3RpbmcuCgoKQmVzdCByZWdhcmRzLApDaGFuZ2pp
YW4K
