Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.205.221.236
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794647207;
	b=BZjI5cYgl3s1GZOpcO5U62icnXNfiG++uTxZPQIGXR/wmZXLlNdzbmwTBEKRWkwDzGDp
	 o2x3WfOo0w/LsdcLkNxm/5DhK7djKeJ088DgfPd1M570SQTicc1YpHrooyPw+rIRxoCH0
	 GkvhoCtHARMKnZH2tv8NDXLrQOU3IbV+TUqpvWgRQLKyLpYLTmQImMlKdOxWb9XG0cDB+
	 W3oEzFF94inCHonWh3LthB52fRNpyBAF/cZjt8763zr4A4APhm5tzNNrnmBKecpX6anSE
	 7Uv8nTaMIR6ck55kTvI5bVfZf4P2s6r2TXtWtlNDTpffSmDJfl26i36GlQfh4IW5PrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794647207;
	h=DMARC-Filter:DKIM-Signature:X-QQ-XMRINFO:X-QQ-XMAILINFO:From:To:Cc:
	 Subject:Mime-Version:Content-Type:Content-Transfer-Encoding:Date:
	 X-Priority:Message-ID:X-QQ-MIME:X-Mailer:X-QQ-Mailer:X-QQ-mid;
	bh=89bJHpkich3hGtKxUwZbiKaMsUywzBBIlLysOT4zJ6Y=;
	b=FOFfHOodH7pRvIlSQxRyARtyoTz+9OYgSatLALAdm7QjMmdXvFXtkaIqPnJqjr1V5J/G
	 2B2EUSzn677GQ+cCKh+VpriPrF4438ZxohxeoVYSs8OgUzjWBonQ7YNhjexewgJx2VRPq
	 K32RZCXHnV0+QbTKuffB6DX1pgZFV4geuNMkvHs0c+6CETYL8BzdKUuLDtdHpktaxKwIa
	 aPWKI3pIR8Pa7J+qKbQNP7K7IQ2EtLHdofGTQHdiFl0EuAOErSUPMyjVxqLn3MVs12AoA
	 +UWBJUIWsZFAJkgXRLjbl7i7vdory3g6lADv6vf9sIG53O2X7WjEWZPM1rVIP/PzMAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=tYW+ijhV;
	arc=none smtp.remote-ip=203.205.221.236
Received: from out203-205-221-236.mail.qq.com (out203-205-221-236.mail.qq.com [203.205.221.236])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EBF5606A882;
	Sat, 14 Nov 2026 09:06:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EBF5606A882
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=tYW+ijhV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1794647198; bh=89bJHpkich3hGtKxUwZbiKaMsUywzBBIlLysOT4zJ6Y=;
	h=From:To:Cc:Subject:Date;
	b=tYW+ijhVllIWkJf92wpfhFXXtjnp9/ScJmNhdREQER1cjBzshoMur4Q8DoF/07zB2
	 +ricHaWG9CZuDBtq2A/516loBu6HO56eT+QajTyjGLAuM8+0GwoRdVTSRnnwSbCQX1
	 RvtwuvwBjbqay2UyzlQwqC5EH2NIBDE7vFepOcao=
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-XMAILINFO: MdmyWVu0InhA0PQlinfSwl6AErPBSNhGfVWHqROTKqnv9PLktoKeo0c2UtLXff
	 zYworFL+OCG8moJr4XIxIm93hdv4hc3S+dOSoPdyC4ZDy1rcW99nEDTEz1Q2IQUXusfQAjMtr1NMA
	 6onP1hcWTqNUvU1IvqE60D+94aEHzyWsMoBaiZtXFa9vKQvYuhSLLSW8f1lwBZqD2pc6U1Nr67x8a
	 jfEsg9dd0TTvCIJNTpvlN/dKvXC+YEcf5lG4RhL6dnO/p/VNgoZJ7/nuHktvdYb8GJZYa0KhZkX5H
	 TUTTNjcBMajs1KJV+B3tBNo+06KKqnvs19calcfBpClUVcPC5BT2RCv2at+0R5+8JutVoBGBq3bs9
	 nCLGjbHYJ3Z/CC1pce9r8W327z9bDVtb3eXHcFBMrV8IVfT209hVUp8338If3R42YNatRs8YSKYiH
	 5ncZJBmST7kC9CW5i/oX4iG27oCPZSVE6RaxMNAMsLpteBLs89dLp1wSvMs8nU/F0Bqu4ViOCWI30
	 2C5EDGhHwx4Fle5TN9+fzzAavCrDZTSseFWLeIg2ZaEnHAq3MFc8nt4UvdkJrNlmFDjKs1d8VQNLT
	 OmX+0BB5xhYF3BF8n+e7klE4UMAyVm7D/l19HuaqyDsfoT3798/Rw1GUrNENnhtuLABb2P+3/w5a1
	 IDyt7fOU6ksEaAQqvNMFDJ6TImpZ3LTnAFIpR1YGDH8byo9Pms6zZfesALcKPGmxNab0VqtWcLTG0
	 5QtuYj7RnTNUQTU3utyMJ7DWP/Rt7F9nUeTVAHF6w+wFXUR0ki1vRMAUfE3LJcVklALRv8V9cy8cb
	 /NabJswiV8DAPfkLjdkY7smC/mxwlACoi/at6b2XzQiRO3bRX6OSM6j0ThMpCSinlR7jb5JbRSCMs
	 0VIJtXW8+C7YfMvFt/m9YFUdBcRBOW430l7RSzoeEzr890Y1X/+tPi8VQF15arVTOHsQdk+pPruV9
	 CKftZoue1rAmKSxkhliaMsWLxmNU+pFraN91+tUG1ZhDazckgEifxPtWMlR5GgJ5nkPUo9W9sqDsQ
	 7XqgMW+Y34jmSjMMuyBg/A8ukLXHg1ks6odVGELornfLSpFJGjk9bH5OBZIAf8uFJap0721JpOtE9
	 zI3IblZP2ylt8Q==
From: "=?utf-8?B?6Zey6YCb?=" <2368492046@qq.com>
To: "=?utf-8?B?Y29yYmV0?=" <corbet@lwn.net>, "=?utf-8?B?bWNoZWhhYg==?=" <mchehab@kernel.org>
Cc: "=?utf-8?B?d3k=?=" <wy@wyuan.org>, "=?utf-8?B?bGludXgtZG9j?=" <linux-doc@vger.kernel.org>, "=?utf-8?B?c2toYW4=?=" <skhan@linuxfoundation.org>, "=?utf-8?B?cmR1bmxhcA==?=" <rdunlap@infradead.org>, "=?utf-8?B?bGludXgta2VybmVs?=" <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 4/4] docs: kernel-doc: import sys for YAML failure diagnostics
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64
Date: Sat, 14 Nov 2026 17:06:36 +0800
X-Priority: 3
Message-ID: <tencent_50889D4FAD577261C37393C80A483FA47906@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
X-QQ-mid: xmsezc52-0t1794647196t7xvdd1xz

RnJvbTogeXVlaHVhLW1lbmcgPDIzNjg0OTIwNDZAcXEuY29tPgoKTWlzc2luZyBQeVlBTUwg
YW5kIG5vbmV4aXN0ZW50IG91dHB1dCBkaXJlY3RvcmllcyByZWFjaCBzeXMuZXhpdCgpCndp
dGhvdXQgaW1wb3J0aW5nIHN5cy4gVGhpcyByYWlzZXMgTmFtZUVycm9yIGluc3RlYWQgb2Yg
cmVwb3J0aW5nCnRoZSBpbnRlbmRlZCBkaWFnbm9zdGljLgoKSW1wb3J0IHN5cyBhbmQgYWRk
IENMSSB0ZXN0cyBmb3IgYm90aCBmYWlsdXJlcyBhbmQgc3VjY2Vzc2Z1bCBZQU1MCmdlbmVy
YXRpb24uIFRoZSBtaXNzaW5nLWRlcGVuZGVuY3kgdGVzdCBkaXNhYmxlcyBzaXRlIHBhY2th
Z2VzLgoKRml4ZXM6IGIzN2IzY2JiYjFmMSAoImRvY3M6IGFkZCBhIG5ldyBmaWxlIHRvIHdy
aXRlIGtlcm5lbC1kb2Mgb3V0cHV0IHRvIGEgWUFNTCBmaWxlIikKClNpZ25lZC1vZmYtYnk6
IHl1ZWh1YS1tZW5nIDwyMzY4NDkyMDQ2QHFxLmNvbT4KLS0tCkNoYW5nZXMgaW4gdjI6ClJl
YmFzZSBvbnRvIGRvY3MtbmV4dDsgbm8gZnVuY3Rpb25hbCBjaGFuZ2UgZnJvbSB0aGUgc2ln
bmVkIHYxLgoKIHRvb2xzL2xpYi9weXRob24va2RvYy9rZG9jX3lhbWxfZmlsZS5weSB8ICAx
ICsKIHRvb2xzL3VuaXR0ZXN0cy90ZXN0X2tkb2NfeWFtbC5weSAgICAgICB8IDM3ICsrKysr
KysrKysrKysrKysrKysrKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgMzggaW5zZXJ0aW9ucygr
KQogY3JlYXRlIG1vZGUgMTAwNjQ0IHRvb2xzL3VuaXR0ZXN0cy90ZXN0X2tkb2NfeWFtbC5w
eQoKZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYi9weXRob24va2RvYy9rZG9jX3lhbWxfZmlsZS5w
eSBiL3Rvb2xzL2xpYi9weXRob24va2RvYy9rZG9jX3lhbWxfZmlsZS5weQppbmRleCAwYmUw
MjBkNTAuLmViNWU1MWMzNiAxMDA2NDQKLS0tIGEvdG9vbHMvbGliL3B5dGhvbi9rZG9jL2tk
b2NfeWFtbF9maWxlLnB5CisrKyBiL3Rvb2xzL2xpYi9weXRob24va2RvYy9rZG9jX3lhbWxf
ZmlsZS5weQpAQCAtMyw2ICszLDcgQEAKICMgQ29weXJpZ2h0KGMpIDIwMjY6IE1hdXJvIENh
cnZhbGhvIENoZWhhYiA8bWNoZWhhYkBrZXJuZWwub3JnPi4KIAogaW1wb3J0IG9zCitpbXBv
cnQgc3lzCiAKIGZyb20ga2RvYy5rZG9jX291dHB1dCBpbXBvcnQgTWFuRm9ybWF0LCBSZXN0
Rm9ybWF0CiAKZGlmZiAtLWdpdCBhL3Rvb2xzL3VuaXR0ZXN0cy90ZXN0X2tkb2NfeWFtbC5w
eSBiL3Rvb2xzL3VuaXR0ZXN0cy90ZXN0X2tkb2NfeWFtbC5weQpuZXcgZmlsZSBtb2RlIDEw
MDY0NAppbmRleCAwMDAwMDAwMDAuLmUzOGRkZDEzMQotLS0gL2Rldi9udWxsCisrKyBiL3Rv
b2xzL3VuaXR0ZXN0cy90ZXN0X2tkb2NfeWFtbC5weQpAQCAtMCwwICsxLDM3IEBACisjIFNQ
RFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wCisiIiJSZWdyZXNzaW9uIHRlc3RzIGZv
ciBrZXJuZWwtZG9jIFlBTUwgZ2VuZXJhdGlvbiBhbmQgZXJyb3IgaGFuZGxpbmcuIiIiCisK
K2ltcG9ydCB5YW1sCisKK2Zyb20ga2RvY19jbGlfaGVscGVyIGltcG9ydCBLZXJuZWxEb2ND
bGlUZXN0CisKKworY2xhc3MgVGVzdEtlcm5lbERvY1lhbWwoS2VybmVsRG9jQ2xpVGVzdCk6
CisgICAgZGVmIHNldFVwKHNlbGYpOgorICAgICAgICBzdXBlcigpLnNldFVwKCkKKyAgICAg
ICAgc2VsZi5pbnB1dCA9IHNlbGYuc291cmNlKCJleGFtcGxlLmMiLCAoCisgICAgICAgICAg
ICAiLyoqXG4gKiBleGFtcGxlIC0gZG9jdW1lbnRlZCBmdW5jdGlvblxuICovXG4iCisgICAg
ICAgICAgICAidm9pZCBleGFtcGxlKHZvaWQpIHt9XG4iCisgICAgICAgICkpCisKKyAgICBk
ZWYgdGVzdF9taXNzaW5nX2RlcGVuZGVuY3koc2VsZik6CisgICAgICAgIHJlc3VsdCA9IHNl
bGYucnVuX2tkb2MoIi0teWFtbCIsIHNlbGYuZGlyZWN0b3J5IC8gInRlc3QueWFtbCIsCisg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc2VsZi5pbnB1dCwgbm9fc2l0ZT1UcnVl
KQorICAgICAgICBzZWxmLmFzc2VydEVxdWFsKHJlc3VsdC5yZXR1cm5jb2RlLCAxKQorICAg
ICAgICBzZWxmLmFzc2VydEluKCJ5YW1sIHBhY2thZ2Ugbm90IGF2YWlsYWJsZSIsIHJlc3Vs
dC5zdGRlcnIpCisgICAgICAgIHNlbGYuYXNzZXJ0Tm90SW4oIlRyYWNlYmFjayIsIHJlc3Vs
dC5zdGRlcnIpCisKKyAgICBkZWYgdGVzdF9taXNzaW5nX2RpcmVjdG9yeShzZWxmKToKKyAg
ICAgICAgcmVzdWx0ID0gc2VsZi5ydW5fa2RvYygiLS15YW1sIiwgc2VsZi5kaXJlY3Rvcnkg
LyAibWlzc2luZy90ZXN0LnlhbWwiLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHNlbGYuaW5wdXQpCisgICAgICAgIHNlbGYuYXNzZXJ0RXF1YWwocmVzdWx0LnJldHVybmNv
ZGUsIDEpCisgICAgICAgIHNlbGYuYXNzZXJ0SW4oImRvZXNuJ3QgZXhpc3QiLCByZXN1bHQu
c3RkZXJyKQorICAgICAgICBzZWxmLmFzc2VydE5vdEluKCJUcmFjZWJhY2siLCByZXN1bHQu
c3RkZXJyKQorCisgICAgZGVmIHRlc3RfdmFsaWRfb3V0cHV0KHNlbGYpOgorICAgICAgICBv
dXRwdXQgPSBzZWxmLmRpcmVjdG9yeSAvICJ0ZXN0LnlhbWwiCisgICAgICAgIHJlc3VsdCA9
IHNlbGYucnVuX2tkb2MoIi0teWFtbCIsIG91dHB1dCwgc2VsZi5pbnB1dCkKKyAgICAgICAg
c2VsZi5hc3NlcnRFcXVhbChyZXN1bHQucmV0dXJuY29kZSwgMCwgcmVzdWx0LnN0ZGVycikK
KyAgICAgICAgZGF0YSA9IHlhbWwuc2FmZV9sb2FkKG91dHB1dC5yZWFkX3RleHQoZW5jb2Rp
bmc9InV0Zi04IikpCisgICAgICAgIHNlbGYuYXNzZXJ0RXF1YWwobGVuKGRhdGFbInRlc3Rz
Il0pLCAxKQorICAgICAgICBzZWxmLmFzc2VydEVxdWFsKGRhdGFbInRlc3RzIl1bMF1bIm5h
bWUiXSwgImV4YW1wbGUiKQotLSAKMi41My4wLndpbmRvd3MuMgoK

