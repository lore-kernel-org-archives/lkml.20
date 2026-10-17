Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A23A4CF482
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 07:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792222274; cv=none; b=qY0RFYW1gf+fSzm4D79Wg3gedg6wqAg4h5FjPC6pnOp1YypW64FI4dF1NcdDwl+vp9RoSGPxGYShcu0yJJqOUAcfzOa4xHUz6Cy88xvhJa5VtDT1GmGR1j53i5f99ZlQd/glA8EqD4VPgZL5pVYP9frAiJT7q1/rqP7Ff7x1CuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792222274; c=relaxed/simple;
	bh=s7Jp/43JCGcioHrezXAQzyss1rOMOoJtpTpqn9ONHl0=;
	h=Date:From:To:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=E7E/SeKCDNxzTE7m8toTWD6hoiih4VUwSja/NHtzU8pBBODAKPRMxI+znOednST/VHVKufp9KnMPHleL3iapGvZm5fGZTppqbbOhEu38oDb1PdyrjZQwWrrWJoMsq39LVvwwv+d21U50tuS8oHRA90pDYpnApWd40p/fdM/0RTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=lKkmUHs8; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="lKkmUHs8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=s7Jp/43JCGcioHrezXAQzyss1rOMOoJtpTpqn9ONHl0=; b=l
	KkmUHs8dycvmPGR8TvXE6m8i8nAUwGViOw0a5F4bLhhnXa8/kAPHbuCu07YF5t16
	Tp1HtM1mQ/oHYNOWTxGQfmrtCoNP+CXfLbADDGy6jppXGRnCt7kvGtAHSr7su966
	XtuwSDDQDpvTJJUlKreJIb3GkUZ+jlh5Llt9LJPgOM=
Date: Sat, 17 Oct 2026 15:30:44 +0800 (CST)
From: "jiale yao" <19888972804@163.com>
To: "Lorenzo Pieralisi" <lpieralisi@kernel.org>,
	"Marc Zyngier" <maz@kernel.org>, "Thomas Gleixner" <tglx@kernel.org>,
	"Radu Rendec" <radu@rendec.net>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re:[PATCH 4/6] irqchip/gic-v5-its: validate MADT translate frames
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <20261016141357.2793046-5-yaojiale02@163.com>
References: <20261016141357.2793046-1-yaojiale02@163.com>
 <20261016141357.2793046-5-yaojiale02@163.com>
X-NTES-SC: AL_Qu2SAP6ZvUov4iefZukdnEkQgO0/WsS1vfQu2Y5Wc+wEgCbN4z0YdHxaDHHN8e6DOSarnDiOagNHzNRcb4JHLLJCVivUBoruVTrV2HBgPQ==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <1c8e50a6.184c.1a148c52fb0.Coremail.19888972804@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:ZygvCgD3T3ckJNNqXPtaAA--.855W
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzQSh22rTJCQNhwAA3A
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

QXQgMjAyNi0xMC0xNiAyMjoxMzo1NSwgIkppYWxlIFlhbyIgPHlhb2ppYWxlMDJAMTYzLmNvbT4g
d3JvdGU6Cj5UaGUgR0lDdjUgSVRTIHRyYW5zbGF0ZS1mcmFtZSBjYWxsYmFjayBhY2Nlc3NlcyBJ
RHMgYW5kIHRoZSBiYXNlIGFkZHJlc3MKPndpdGhvdXQgY2hlY2tpbmcgdGhhdCB0aGUgTUFEVCBl
bnRyeSBjb250YWlucyB0aGUgY29tcGxldGUgZml4ZWQtc2l6ZQo+cmVjb3JkLiBBIHRydW5jYXRl
ZCBmaXJtd2FyZSBlbnRyeSBjYW4gdGhlcmVmb3JlIGNhdXNlIG91dC1vZi1ib3VuZHMKPnJlYWRz
Lgo+Cj5SZWplY3QgaW5jb21wbGV0ZSB0cmFuc2xhdGUtZnJhbWUgZW50cmllcyBiZWZvcmUgdXNp
bmcgdGhlaXIgZmllbGRzLgo+CgpGaXhlczogYTk3ZWZhNWJhNTk0ICgiaXJxY2hpcC9naWMtdjU6
IEFkZCBBQ1BJIElUUyBwcm9iaW5nIikKCj5TaWduZWQtb2ZmLWJ5OiBKaWFsZSBZYW8gPHlhb2pp
YWxlMDJAMTYzLmNvbT4KPi0tLQo+IGRyaXZlcnMvaXJxY2hpcC9pcnEtZ2ljLXY1LWl0cy5jIHwg
MyArKysKPiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCj4KPmRpZmYgLS1naXQgYS9k
cml2ZXJzL2lycWNoaXAvaXJxLWdpYy12NS1pdHMuYyBiL2RyaXZlcnMvaXJxY2hpcC9pcnEtZ2lj
LXY1LWl0cy5jCj5pbmRleCAyOGUzOWIwNjVkZTAuLmRhZDNiOTViYTE1MCAxMDA2NDQKPi0tLSBh
L2RyaXZlcnMvaXJxY2hpcC9pcnEtZ2ljLXY1LWl0cy5jCj4rKysgYi9kcml2ZXJzL2lycWNoaXAv
aXJxLWdpYy12NS1pdHMuYwo+QEAgLTEyMzMsNiArMTIzMyw5IEBAIHN0YXRpYyBpbnQgX19pbml0
IGdpY19hY3BpX3BhcnNlX21hZHRfaXRzX3RyYW5zbGF0ZSh1bmlvbiBhY3BpX3N1YnRhYmxlX2hl
YWRlcnMKPiAJaW50IGVycjsKPiAKPiAJaXRzX2ZyYW1lID0gKHN0cnVjdCBhY3BpX21hZHRfZ2lj
djVfdHJhbnNsYXRlX2ZyYW1lICopaGVhZGVyOwo+KwlpZiAoQkFEX01BRFRfRU5UUlkoaXRzX2Zy
YW1lLCBlbmQpKQo+KwkJcmV0dXJuIC1FSU5WQUw7Cj4rCj4gCWlmIChpdHNfZnJhbWUtPmxpbmtl
ZF90cmFuc2xhdG9yX2lkICE9IGN1cnJlbnRfaXRzX2VudHJ5LT50cmFuc2xhdG9yX2lkKQo+IAkJ
cmV0dXJuIDA7Cj4gCj4tLSAKPjIuMzQuMQo=
