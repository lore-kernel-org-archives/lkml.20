Received: from out162-62-57-87.mail.qq.com (out162-62-57-87.mail.qq.com [162.62.57.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 771513A7D73
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 09:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788082555; cv=none; b=ub5lyZ92daY7bC/1mOVeiRmC0SgT13j2NMdzJ1W+IJH7l0yPZ3JvJYAtLlgNOhVU9ebDKt9lujsdaqUkf5cg20OdzU5KVtfrWl4JHNhYSKpkmsJ4cx4+zPFRA4exOoqoSOyDbFmSEFsaDlzVnWHjJ3w+KIHrECRn0x/yCmIhiFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788082555; c=relaxed/simple;
	bh=8lGEwd68Jq+KcnBTrFhbjOAPR1hs/8l+XXU/N9+YI0E=;
	h=Message-ID:Content-Type:MIME-Version:From:To:Cc:Subject; b=N2LFfAQ3oRMompdOCh+SFcB0bcRbf6MiPcBY0kPFyVLnKtf91iGNsxC187sTrx/+IlKpIDMz+cPPojSHbko0fBd9Zig/lqOr226xVo5yGAD17rRbrF9xscssmERHRmtoiEGvFEv9xDP+GIrT7ZnGa1Iv/jPBuz4O5JR6Oeq/0zQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=hcvLu8fg; arc=none smtp.client-ip=162.62.57.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="hcvLu8fg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1788082542; bh=8lGEwd68Jq+KcnBTrFhbjOAPR1hs/8l+XXU/N9+YI0E=;
	h=From:To:Cc:Subject;
	b=hcvLu8fgk8OKec8n5crtMm9WbUKX3rPkDpeoGELwdwAZGYOd12cZFXCEICVVXthsw
	 ynbWXVV/1dCwK7D0W5Uu/KBcL2LSmdjMDGMZbilPOAA51aQ7Z09SHCZeEISZCTUuDQ
	 f9bcoOWIX429oAOFtw4QDE3qb6VzdtxVxSnnwyV8=
Received: from [192.168.0.110] ([2409:8a28:2472:b2a1:a091:db35:9bfa:8cc7])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id 8E838ED1; Sun, 30 Aug 2026 17:35:40 +0800
X-QQ-mid: xmsmtpt1788082540tbkqa801c
Message-ID: <tencent_2821C8E70DC11122A717BA875978E4ADC005@qq.com>
X-QQ-XMAILINFO: MzNwb/pqyJTkmakZ5yqyt7H9frgS6vOoH3B1ShCFba8y2fJ8wTi5YIGm02H/V2
	 r7TX59j6PTLRejlcn6M5g0La1MZzq9Wnp0vcMN3YmIs2pmc+uWc/UKu7Ysda5J+mvM1mZetf9GaV
	 0RayaAdw+/DPr8z4pZ7kYP0Q3aGgfUnNwNM32SjEegRDWoZDMnFOwA8Lupli0SEgJ6iV5qt0B2Pb
	 +keTaU2xZKmVrYM1thmM2SWb3YNBIOapkOsXHKLksxXlkwKZp6PYMg6Lh1kyYS8m7mQ1XSVXwFqn
	 Ix7xDkLPDSRP9bve4qikLL9hadhSMpgctcFZ+it7WUNMFJvi32eqt+mdTmZQvb1VR4s62zx3FURy
	 zwp8JUaZwCMoIIVtOTfIOMhdXlWIRGQeDnBw3hjBtAChA3HuRv5oxYfg8OJPp3CilJuVsDFpnHbT
	 RasxLD2uCzv5Z5nV1U1EAERFDJczEFAqGaKwUtW2bb4AvUpc+AdyTIrHW1aIpTJUqhQEQmHyRcbG
	 PWVTWvsPCf8euh9USG+Q7P07JoqepyEHmgRKCtEkX+qZi+pxC9MrvEo72c5A5Jtu05e3sjNSPUMe
	 yie80HLZODXuBCI6Eoyr/n285T2Sv+82n5qcBx7BMWxeuABL8wuN7uPyH0BPqScRJMKCcRHjzvBm
	 5vS4Cu6FQbV5H3g02GnOJu5Y/IM6OSYe62ET2qOCg/0IxQs5pEi0vpjVPPxk6YprL478i4umzdWp
	 AKpR5KxieOc7wAx8Julyjvh2bqZaa81kteB9QDLtgRC63UzqAd2OGBmJbamxHj9vOh9MUTheg+ye
	 lyWB81NFEJO2skm2viCym+4jumOnTlgu8+pQyHcggS+kjKaNT/K9J/c916BFC+7A5IcTHxK/dCit
	 4pzy/r1wNos9NHfrlI8+nG38d+o41mih2X1OZ3+bqDMgKmvQU0oczvL/mtHQeDixza8AX2BmHJD9
	 ZIYvECIxFjxJmOUosCmHAYyxdczckM8aZ3CLFfFMT2bqo9Z+9MGi0TVpgszpm95PsPuPEBpwX9QC
	 nUPLd43GodYSgdKrwu
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: base64
From: 3237174131@qq.com
To: linux-kernel@vger.kernel.org
Cc: tglx@kernel.org, gregkh@linuxfoundation.org
Subject: [PATCH v3] scripts/spdxcheck: add friendly error message for missing
 ply module

VGhlIHNwZHhjaGVjay5weSBzY3JpcHQgcmVxdWlyZXMgdGhlICdwbHknIFB5dGhvbiBtb2R1bGUs
IGJ1dCB3aGVuCml0IGlzIG1pc3NpbmcsIHRoZSBzY3JpcHQgY3Jhc2hlcyB3aXRoIGEgcmF3IElt
cG9ydEVycm9yIHRyYWNlYmFjay4KVGhpcyBpcyBlc3BlY2lhbGx5IHByb2JsZW1hdGljIGluIENJ
IGVudmlyb25tZW50cyB3aGVyZSB0aGUgZXJyb3IKaXMgbm90IGltbWVkaWF0ZWx5IG9idmlvdXMu
CgpBZGQgYSBmcmllbmRseSBlcnJvciBtZXNzYWdlIHRoYXQgdGVsbHMgdGhlIHVzZXIgZXhhY3Rs
eSB3aGF0IGlzCm5lZWRlZCBhbmQgaG93IHRvIGluc3RhbGwgaXQuCgpTaWduZWQtb2ZmLWJ5OiBY
aWEgWmhveGluIDwzMjM3MTc0MTMxQHFxLmNvbT4KLS0tCkNoYW5nZXMgc2luY2UgdjI6Ci0gTW92
ZSBDaGFuZ2VzLXNpbmNlIGxpbmUgYmVsb3cgdGhlIC0tLSBzZXBhcmF0b3IKCiBzY3JpcHRzL3Nw
ZHhjaGVjay5weSB8IDggKysrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9zY3JpcHRzL3NwZHhjaGVjay5weSBiL3Njcmlw
dHMvc3BkeGNoZWNrLnB5Ci0tLSBhL3NjcmlwdHMvc3BkeGNoZWNrLnB5CisrKyBiL3NjcmlwdHMv
c3BkeGNoZWNrLnB5CkBAIC01LDcgKzUsMTMgQEAKIGZyb20gYXJncGFyc2UgaW1wb3J0IEFyZ3Vt
ZW50UGFyc2VyCi1mcm9tIHBseSBpbXBvcnQgbGV4LCB5YWNjCit0cnk6CisgICAgZnJvbSBwbHkg
aW1wb3J0IGxleCwgeWFjYworZXhjZXB0IEltcG9ydEVycm9yIGFzIGU6CisgICAgaW1wb3J0IHN5
cworICAgIHN5cy5zdGRlcnIud3JpdGUoJ0Vycm9yOiAlc1xuJyAlIGUpCisgICAgc3lzLnN0ZGVy
ci53cml0ZSgnUGxlYXNlIGluc3RhbGwgdGhlIHBseSBtb2R1bGUgKGUuZy4sIHBpcCBpbnN0YWxs
IHBseSlcbicpCisgICAgc3lzLmV4aXQoMSkKIGltcG9ydCBsb2NhbGUKIGltcG9ydCB0cmFjZWJh
Y2sKIGltcG9ydCBmbm1hdGNoCg==

