Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792483127;
	b=2mhrvfyGaOq0sOj0CISXlTUuaRpqhOL37nzM/lxWasNEBEQpN5p5NLxC+xZjwLm2zFA+
	 i+UHQ2F3khv0yiJMhpLXuhAkukIIDQizT9OwJo/LyDLnmxiqR/oGxIthliDUQwzHqh0hj
	 peO8kik08ngrKHtP37ssMDxZLpO4VjiGX92bcjk1XKrcG+HEX82cJyK9Ln9LEmUV7/HkM
	 K6DLUmkiF0ujM+hYZemsy2NUjVEiFse5F79bfbAQF/3kWwdIyvdv8k/V4bwDp+ZjAMqW0
	 JR1DmafQGyeiQsj1Xl+tyFT1l7O6oqVz+0tH2kFbkanz46gUjHVVgke7nOMBW679/xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792483127;
	h=DMARC-Filter:DKIM-Signature:Date:From:To:Cc:Subject:X-Priority:
	 X-Mailer:In-Reply-To:References:X-NTES-SC:Content-Transfer-Encoding:
	 Content-Type:MIME-Version:Message-ID:X-Coremail-Locale:X-CM-TRANSID:
	 X-CM-SenderInfo:X-Coremail-Antispam;
	bh=BzwHU1QIdUNgRDahrI2DApNe1+Mn4e/vatv2bCfy92A=;
	b=bmS77hCkpn37e3Wpyyyh6ZSY5HaoSyK2aNN1nbRKvQT1VJexFhQKWvnS0qP6/MFp3sgq
	 4kmWKT4JEuuW+8bHz8n6Wl7gUrhfEslhbOMIx1LCOQiaxHp5W+iq3eJSfMzn0fv5xrWnV
	 jXXcx3ywssknZSzZUUjEnfJ0gowCmf4aznfBorB2sKg8gYNTUkrTXxFLHpl1tJXGN71rD
	 0mD3xAf2uK4OEI9BKsFOR+iB6swXVZmG4UdtH3bvCWocTIMbwJ3cFhrQ2xM5JSxLf2s7b
	 mNPu1LTsBZVcBjaP2USsvZsuuWzlYstfuZNdmBJoY0nz40k0Dm2SbMDiBP3XJn9mGqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=QitZLQjG;
	arc=none smtp.remote-ip=117.135.210.4
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 983E6606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:58:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 983E6606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=QitZLQjG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=BzwHU1QIdUNgRDahrI2DApNe1+Mn4e/vatv2bCfy92A=; b=Q
	itZLQjGNEqSzKGVwBPZaw+dlWf+zKMNT8N6ATznjbzdFn51cvVjZ0R+vVPINFOHE
	TwMHzNQM3YOu6TaT4fz6rmJyE86QA+vScMHbu0GvY5xPaDCUiq1SwDozA/gyjUWR
	8T+9vCBfd2T2aiopQXKN0iUIcxjV5Zij4xvq2D5vq8=
Date: Tue, 20 Oct 2026 15:57:48 +0800 (CST)
From: "jiale yao" <19888972804@163.com>
To: "Joseph Qi" <joseph.qi@linux.alibaba.com>
Cc: "Mark Fasheh" <mark@fasheh.com>, "Joel Becker" <jlbec@evilplan.org>,
	"Heming Zhao" <heming.zhao@suse.com>,
	"Tristan Ye" <tristan.ye@oracle.com>, ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re:Re: [PATCH] ocfs2: validate non-coherent freefrag bitmap inode
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <f4f403bf-efc4-4629-bb7b-2c3b2cc35303@linux.alibaba.com>
References: <20261018114118.927071-1-yaojiale02@163.com>
 <f4f403bf-efc4-4629-bb7b-2c3b2cc35303@linux.alibaba.com>
X-NTES-SC: AL_Qu2SAPiTvEgt4SmRY+kcn08ShO49XMOyvfoi2YFTc+MEpyPT/CwnXV1dJHjX9MKlLySpjjK2QjZX0MN8TZd4g5Xh8tKCGuF5+LNrsl2ORA==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <16659eba.6c9d.1a158510868.Coremail.19888972804@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:bCgvCgBHjiT8HtdqhMhcAA--.857W
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC8BxXkWrXHvyhZAAA3w
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

SGkgSm9zZXBoLAoKQXQgMjAyNi0xMC0yMCAxNTo0MzoyMSwgIkpvc2VwaCBRaSIgPGpvc2VwaC5x
aUBsaW51eC5hbGliYWJhLmNvbT4gd3JvdGU6Cj4KPgo+T24gMTAvMTgvMjYgNzo0MSBQTSwgSmlh
bGUgWWFvIHdyb3RlOgo+PiBUaGUgbm9uLWNvaGVyZW50IGZyZWVmcmFnIGlvY3RsIHBhdGggcmVh
ZHMgdGhlIGdsb2JhbCBiaXRtYXAgaW5vZGUKPj4gZGlyZWN0bHkgYW5kIHRydXN0cyBpdHMgY2hh
aW4gbGlzdC4gQSBtYWxmb3JtZWQgY2xfbmV4dF9mcmVlX3JlYyB2YWx1ZQo+PiBjYW4gdGhlcmVm
b3JlIGluZGV4IGJleW9uZCBjbF9yZWNzIHdoaWxlIHNjYW5uaW5nIGNoYWlucy4KPj4gCj4KPkNv
dWxkIHlvdSAgcHJvdmlkZSB0aGUgZGV0YWlsZWQgYnVnIHJlcG9ydD8KCgpUaGUgbm9ybWFsIFVQ
L25vbi1SVCBwYXRoIHVzdWFsbHkgcnVucyB0aGUgdGFza2xldCBmcm9tIGlycV9leGl0KCkuCkhv
d2V2ZXIsIGlmIHRoZSBETUEgSVJRIHJhaXNlcyBUQVNLTEVUX1NPRlRJUlEgYWZ0ZXIgdGhhdCB2
ZWN0b3IgaGFzCmFscmVhZHkgYmVlbiBwcm9jZXNzZWQgaW4gdGhlIGN1cnJlbnQgc29mdGlycSBw
YXNzLCBuZWVkX3Jlc2NoZWQoKSBvcgp0aGUgc29mdGlycSB0aW1lL3Jlc3RhcnQgbGltaXRzIGNh
biBkZWZlciBpdCB0byBrc29mdGlycWQuIFByb2Nlc3MKY29udGV4dCBtYXkgdGhlbiByZWxlYXNl
IHRoZSBjaGFubmVsIGJlZm9yZSB0aGUgdGFza2xldCBydW5zLgoKQSBzaW1pbGFyIHRlYXJkb3du
IGlzc3VlIHdhcyBmaXhlZCBieSBjb21taXQgMGNhNzk5NzkzODRmCigiUkRNQS9lcmRtYTogRml4
IENFUSB0YXNrbGV0IHVzZS1hZnRlci1mcmVlIG9uIHJlbW92YWwiKS4gVGhlcmUgdG9vLApmcmVl
X2lycSgpIHN0b3BzIHRoZSBoYXJkIElSUSBidXQgZG9lcyBub3QgZHJhaW4gYW4gYWxyZWFkeSBx
dWV1ZWQKdGFza2xldCwgc28gdGFza2xldF9raWxsKCkgaXMgcGxhY2VkIGJlZm9yZSByZWxlYXNp
bmcgaXRzIHJlc291cmNlcy4KCkZvciBteHMtZG1hLCB0aGUgZGVmZXJyZWQgb3BlcmF0aW9uIGlz
IHRoZSBjb21wbGV0aW9uIGNhbGxiYWNrIHJhdGhlcgp0aGFuIGRpcmVjdCBhY2Nlc3MgdG8gdGhl
IGNvaGVyZW50IGNvbW1hbmQgYnVmZmVyLiBUaGUgdGFza2xldCBjYW4KdGhlcmVmb3JlIGludm9r
ZSB0aGUgY2FsbGJhY2sgYWZ0ZXIgaXRzIGNsaWVudCBkYXRhIGhhcyBiZWVuIHJlbGVhc2VkLApl
dmVuIG9uIGEgVVAvbm9uLVJUIHN5c3RlbS4KCgo+Cj4+IFZhbGlkYXRlIHRoZSBpbm9kZSBibG9j
ayBiZWZvcmUgY29uc3VtaW5nIGl0cyBiaXRtYXAgYW5kIGNoYWluIG1ldGFkYXRhLgo+PiAKPj4g
Rml4ZXM6IGQyNGExMGI5ZjhlZCAoIk9jZnMyOiBBZGQgYSBuZXcgY29kZSAnT0NGUzJfSU5GT19G
UkVFRlJBRycgZm9yIG8yaW5mbyBpb2N0bC4iKQo+PiBTaWduZWQtb2ZmLWJ5OiBKaWFsZSBZYW8g
PHlhb2ppYWxlMDJAMTYzLmNvbT4KPj4gLS0tCj4+ICBmcy9vY2ZzMi9pb2N0bC5jIHwgNiArKysr
KysKPj4gIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykKPj4gCj4+IGRpZmYgLS1naXQg
YS9mcy9vY2ZzMi9pb2N0bC5jIGIvZnMvb2NmczIvaW9jdGwuYwo+PiBpbmRleCBjYmU1OWQyMzE2
NjYuLjgzODNmOTAwYzg0NyAxMDA2NDQKPj4gLS0tIGEvZnMvb2NmczIvaW9jdGwuYwo+PiArKysg
Yi9mcy9vY2ZzMi9pb2N0bC5jCj4+IEBAIC01NzUsNiArNTc1LDEyIEBAIHN0YXRpYyBpbnQgb2Nm
czJfaW5mb19mcmVlZnJhZ19zY2FuX2JpdG1hcChzdHJ1Y3Qgb2NmczJfc3VwZXIgKm9zYiwKPj4g
IAkJCW1sb2dfZXJybm8oc3RhdHVzKTsKPj4gIAkJCWdvdG8gYmFpbDsKPj4gIAkJfQo+PiArCj4+
ICsJCXN0YXR1cyA9IG9jZnMyX3ZhbGlkYXRlX2lub2RlX2Jsb2NrKG9zYi0+c2IsIGJoKTsKPj4g
KwkJaWYgKHN0YXR1cyA8IDApIHsKPj4gKwkJCW1sb2dfZXJybm8oc3RhdHVzKTsKPj4gKwkJCWdv
dG8gYmFpbDsKPj4gKwkJfQo+Cj5vY2ZzMl92YWxpZGF0ZV9pbm9kZV9ibG9jaygpIG9ubHkgdmFs
aWRhdGVzIGNsX25leHRfZnJlZV9yZWMgd2hlbgo+b24tZGlzayBkaW5vZGUgaGFzIE9DRlMyX0NI
QUlOX0ZMIHNldC4gU28gYSBjcmFmdGVkIGdsb2JhbCBiaXRtYXAgYmxvY2sKPndpdGhvdXQgdGhh
dCBmbGFnIHN0aWxsIGxldHMgdGhlIGZyZWVmcmFnIGNoYWluIHdhbGsgaW5kZXggcGFzdCBjbF9y
ZWNzW10KPmFuZCByZWFkIG91dCBvZiBib3VuZHMgZnJvbSB0aGUgYnVmZmVyX2hlYWQuCgpJIHdp
bGwgZml4IHRoZSBidWcgaW4gdjIuCgo+Cj5UaGFua3MsCj5Kb3NlcGgKPgo+PiAgCX0KPj4gIAo+
PiAgCWdiX2Rpbm9kZSA9IChzdHJ1Y3Qgb2NmczJfZGlub2RlICopYmgtPmJfZGF0YTsKCkppYWxl

