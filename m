Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 335621A6836
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 03:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.30.148.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790566062; cv=none; b=uqerSsNDyuJbE5AUseHgtH5fz6WoAQe/aU0HK+OCo20b8AQSmulHlH4vd07ycDJbbWxS5qLvJ8w7JW3d2XNpvpgMtjzt8jtMZaG9tScdJWdSxqCvfasQ3NSSTMTcwOSJUT17jdClhsO8UL9mash4ZxefCGSmtucShp/sSCRS6d4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790566062; c=relaxed/simple;
	bh=sedImywa5W0xPN/8f4fPxLzXdd8bALmVSkrG9ZA79l0=;
	h=Message-ID:In-Reply-To:References:Date:Mime-Version:From:To:Cc:
	 Subject:Content-Type; b=UVmhG9vyMIxnebLOYHmSIfe9A5P8TEVHQkJCJFRBWuEvZ8/gQrLjwGudZUXap4jfHFvBa/Mf4XQed3UgyDzwKqjHXtIANtMOKlA9prDtdaoZQubUIG+JIMkeE14euLZHLicdL4o3mew5IjOaup29ZSmWC26500pjWgHgMcnrQOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=160.30.148.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4htRZV2JyJz8XrrJ;
	Mon, 28 Sep 2026 11:27:30 +0800 (CST)
Received: from xaxapp01.zte.com.cn ([10.88.99.176])
	by mse-fl2.zte.com.cn with SMTP id 68S3RN2b017790;
	Mon, 28 Sep 2026 11:27:23 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp05[null])
	by mapi (Zmail) with MAPI id mid32;
	Mon, 28 Sep 2026 11:27:24 +0800 (CST)
X-Zmail-TransId: 2afc6ab9de9c506-8a47c
X-Mailer: Zmail v1.0
Message-ID: <20260928112724693W-nfLMNeKTh8wDFIc1yZs@zte.com.cn>
In-Reply-To: <20260915152656708z04s4oSYY2BGj34F36RZa@zte.com.cn>
References: 20260915152656708z04s4oSYY2BGj34F36RZa@zte.com.cn
Date: Mon, 28 Sep 2026 11:27:24 +0800 (CST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <shao.mingyin@zte.com.cn>
To: <pjw@kernel.org>
Cc: <mikey@neuling.org>, <aurelien@aurel32.net>, <troy.mitchell@linux.dev>,
        <david.laight.linux@gmail.com>, <qingfang.deng@linux.dev>,
        <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>,
        <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <zhang.yue5@zte.com.cn>
Subject: =?UTF-8?B?UmU6IFtQQVRDSCB2NF0gcmlzY3Y6IGxpYjogRml4IFpCQiBzdHJubGVuIHdyYXAtYXJvdW5kIHJlZ3Jlc3Npb24gb27CoGh1Z2UgY291bnRz?=
Content-Type: multipart/mixed;
	boundary="=====_001_next====="
X-MAIL:mse-fl2.zte.com.cn 68S3RN2b017790
X-TLS: YES
X-ENVELOPE-SENDER: shao.mingyin@zte.com.cn
X-SOURCE-IP: 10.5.228.133 unknown Mon, 28 Sep 2026 11:27:30 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AB9DEA2.000/4htRZV2JyJz8XrrJ



--=====_001_next=====
Content-Type: multipart/related;
	boundary="=====_002_next====="


--=====_002_next=====
Content-Type: multipart/alternative;
	boundary="=====_003_next====="


--=====_003_next=====
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: base64

SGkgUGF1bCwNCg0KR2VudGxlIHBpbmcgb24gdGhpcyBvbmUgLSBpdCBoYXMgcGlja2VkIHVwIG1v
cmUgdGFncyBzaW5jZSBwb3N0aW5nLCBhbmQNCnNob3VsZCBiZSByZWFkeSB0byBiZSBwaWNrZWQg
dXA6DQoNCiAgQWNrZWQtYnk6ICAgICBNaWNoYWVsIE5ldWxpbmcgPG1pa2V5QG5ldWxpbmcub3Jn
Pg0KICBSZXZpZXdlZC1ieTogIEF1cmVsaWVuIEphcm5vIDxhdXJlbGllbkBhdXJlbDMyLm5ldD4N
CiAgVGVzdGVkLWJ5OiAgICBUcm95IE1pdGNoZWxsIDx0cm95Lm1pdGNoZWxsQGxpbnV4LmRldj4N
CiAgU3VnZ2VzdGVkLWJ5OiBEYXZpZCBMYWlnaHQgPGRhdmlkLmxhaWdodC5saW51eEBnbWFpbC5j
b20+DQogIFN1Z2dlc3RlZC1ieTogUWluZ2ZhbmcgRGVuZyA8cWluZ2ZhbmcuZGVuZ0BsaW51eC5k
ZXY+DQoNCkl0IHN0YXlzIGEgbWluaW1hbCBmaXg6IG9ubHkgdGhlIHR3byBib3VuZGFyeS1jb21w
dXRhdGlvbiBpbnN0cnVjdGlvbnMNCmluIHRoZSBaQkIgcGF0aCBhcmUgcmVwbGFjZWQgKDE4IGlu
c2VydGlvbnMsIDIgZGVsZXRpb25zLCBubyBuZXcNCnJlZ2lzdGVycyksIHNvIHRoZSBzY2Fubmlu
ZyBsb29wIGl0c2VsZiBpcyB1bmNoYW5nZWQuDQoNClRoaXMgb25lIG1hdHRlcnMgZm9yIHN0YWJs
ZSAtIHRoZSByZWdyZXNzaW9uIGlzIGluIHY3LjEuMTArIGFuZCB2Ny4yOg0Kc3RybmxlbihzLCBT
SVpFX01BWCkgcmV0dXJucyA4IGZvciBhbnkgOCstYnl0ZSBhbGlnbmVkIHN0cmluZyBhbmQNCnRy
dW5jYXRlcyBuYW1lcyBidWlsdCB0aHJvdWdoIEZPUlRJRlkgc3RyY2F0L3N0cmxjYXQgKGRldmlj
ZS1tYXBwZXIncw0Kc3lzZnMgbmFtZSAibGl2ZS1iYXNlIiBiZWNvbWVzICJsaXZlLWJhcyIpLCB3
aGljaCBicm9rZSBibGl2ZXQvYW5hY29uZGENCmluc3RhbGxzIGFuZCBMVk0gb24gUklTQy1WIHN5
c3RlbXMuICBJdCBoYXMgc2luY2UgYmVlbiByZXByb2R1Y2VkDQppbmRlcGVuZGVudGx5IG9uIGEg
RmVkb3JhIDQ1IHJpc2N2NjQgaW1hZ2Ugd2l0aCBaQkIgZW5hYmxlZCwgd2hlcmUgdGhlDQpmaXgg
cmVzdG9yZXMgY29ycmVjdCBiZWhhdmlvdXIuDQoNCkNjOiBzdGFibGUgaXMgc2V0LCBhbmQgdGhl
IG1pbmltYWwgZm9ybSBzaG91bGQgYmFja3BvcnQgY2xlYW5seSB0bw0KNy4xLnkuICBIYXBweSB0
byByZWJhc2Ugb250byByaXNjdi9maXhlcyBvciBhZGp1c3QgYW55dGhpbmcgaWYgbmVlZGVkLg0K
DQpUaGFua3MsDQpTaGFvIE1pbmd5aW4=


--=====_003_next=====
Content-Type: text/html ;
	charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBjbGFzcz0iemNvbnRlbnRSb3ciPjxkaXYgc3R5bGU9ImZvbnQtc2l6ZToxNHB4O2ZvbnQt
ZmFtaWx5OuW+rui9r+mbhem7kSxNaWNyb3NvZnQgWWFIZWk7bGluZS1oZWlnaHQ6MS41Ij48c3Bh
biBzdHlsZT0iZm9udC1mYW1pbHk6IHNhbnMtc2VyaWY7IGNhcmV0LWNvbG9yOiBhdXRvOyI+SGkg
UGF1bCw8L3NwYW4+PC9kaXY+PGRpdiBzdHlsZT0ibGluZS1oZWlnaHQ6MS41Ij48YnI+PC9kaXY+
PGRpdiBzdHlsZT0ibGluZS1oZWlnaHQ6MS41Ij5HZW50bGUgcGluZyBvbiB0aGlzIG9uZSAtIGl0
IGhhcyBwaWNrZWQgdXAgbW9yZSB0YWdzIHNpbmNlIHBvc3RpbmcsIGFuZDwvZGl2PjxkaXYgc3R5
bGU9ImxpbmUtaGVpZ2h0OjEuNSI+c2hvdWxkIGJlIHJlYWR5IHRvIGJlIHBpY2tlZCB1cDo8L2Rp
dj48ZGl2IHN0eWxlPSJsaW5lLWhlaWdodDoxLjUiPjxicj48L2Rpdj48ZGl2IHN0eWxlPSJsaW5l
LWhlaWdodDoxLjUiPiZuYnNwOyBBY2tlZC1ieTombmJzcDsgJm5ic3A7ICZuYnNwO01pY2hhZWwg
TmV1bGluZyAmbHQ7bWlrZXlAbmV1bGluZy5vcmcmZ3Q7PC9kaXY+PGRpdiBzdHlsZT0ibGluZS1o
ZWlnaHQ6MS41Ij4mbmJzcDsgUmV2aWV3ZWQtYnk6Jm5ic3A7IEF1cmVsaWVuIEphcm5vICZsdDth
dXJlbGllbkBhdXJlbDMyLm5ldCZndDs8L2Rpdj48ZGl2IHN0eWxlPSJsaW5lLWhlaWdodDoxLjUi
PiZuYnNwOyBUZXN0ZWQtYnk6Jm5ic3A7ICZuYnNwOyBUcm95IE1pdGNoZWxsICZsdDt0cm95Lm1p
dGNoZWxsQGxpbnV4LmRldiZndDs8L2Rpdj48ZGl2IHN0eWxlPSJsaW5lLWhlaWdodDoxLjUiPiZu
YnNwOyBTdWdnZXN0ZWQtYnk6IERhdmlkIExhaWdodCAmbHQ7ZGF2aWQubGFpZ2h0LmxpbnV4QGdt
YWlsLmNvbSZndDs8L2Rpdj48ZGl2IHN0eWxlPSJsaW5lLWhlaWdodDoxLjUiPiZuYnNwOyBTdWdn
ZXN0ZWQtYnk6IFFpbmdmYW5nIERlbmcgJmx0O3FpbmdmYW5nLmRlbmdAbGludXguZGV2Jmd0Ozwv
ZGl2PjxkaXYgc3R5bGU9ImxpbmUtaGVpZ2h0OjEuNSI+PGJyPjwvZGl2PjxkaXYgc3R5bGU9Imxp
bmUtaGVpZ2h0OjEuNSI+SXQgc3RheXMgYSBtaW5pbWFsIGZpeDogb25seSB0aGUgdHdvIGJvdW5k
YXJ5LWNvbXB1dGF0aW9uIGluc3RydWN0aW9uczwvZGl2PjxkaXYgc3R5bGU9ImxpbmUtaGVpZ2h0
OjEuNSI+aW4gdGhlIFpCQiBwYXRoIGFyZSByZXBsYWNlZCAoMTggaW5zZXJ0aW9ucywgMiBkZWxl
dGlvbnMsIG5vIG5ldzwvZGl2PjxkaXYgc3R5bGU9ImxpbmUtaGVpZ2h0OjEuNSI+cmVnaXN0ZXJz
KSwgc28gdGhlIHNjYW5uaW5nIGxvb3AgaXRzZWxmIGlzIHVuY2hhbmdlZC48L2Rpdj48ZGl2IHN0
eWxlPSJsaW5lLWhlaWdodDoxLjUiPjxicj48L2Rpdj48ZGl2IHN0eWxlPSJsaW5lLWhlaWdodDox
LjUiPlRoaXMgb25lIG1hdHRlcnMgZm9yIHN0YWJsZSAtIHRoZSByZWdyZXNzaW9uIGlzIGluIHY3
LjEuMTArIGFuZCB2Ny4yOjwvZGl2PjxkaXYgc3R5bGU9ImxpbmUtaGVpZ2h0OjEuNSI+c3Rybmxl
bihzLCBTSVpFX01BWCkgcmV0dXJucyA4IGZvciBhbnkgOCstYnl0ZSBhbGlnbmVkIHN0cmluZyBh
bmQ8L2Rpdj48ZGl2IHN0eWxlPSJsaW5lLWhlaWdodDoxLjUiPnRydW5jYXRlcyBuYW1lcyBidWls
dCB0aHJvdWdoIEZPUlRJRlkgc3RyY2F0L3N0cmxjYXQgKGRldmljZS1tYXBwZXInczwvZGl2Pjxk
aXYgc3R5bGU9ImxpbmUtaGVpZ2h0OjEuNSI+c3lzZnMgbmFtZSAibGl2ZS1iYXNlIiBiZWNvbWVz
ICJsaXZlLWJhcyIpLCB3aGljaCBicm9rZSBibGl2ZXQvYW5hY29uZGE8L2Rpdj48ZGl2IHN0eWxl
PSJsaW5lLWhlaWdodDoxLjUiPmluc3RhbGxzIGFuZCBMVk0gb24gUklTQy1WIHN5c3RlbXMuJm5i
c3A7IEl0IGhhcyBzaW5jZSBiZWVuIHJlcHJvZHVjZWQ8L2Rpdj48ZGl2IHN0eWxlPSJsaW5lLWhl
aWdodDoxLjUiPmluZGVwZW5kZW50bHkgb24gYSBGZWRvcmEgNDUgcmlzY3Y2NCBpbWFnZSB3aXRo
IFpCQiBlbmFibGVkLCB3aGVyZSB0aGU8L2Rpdj48ZGl2IHN0eWxlPSJsaW5lLWhlaWdodDoxLjUi
PmZpeCByZXN0b3JlcyBjb3JyZWN0IGJlaGF2aW91ci48L2Rpdj48ZGl2IHN0eWxlPSJsaW5lLWhl
aWdodDoxLjUiPjxicj48L2Rpdj48ZGl2IHN0eWxlPSJsaW5lLWhlaWdodDoxLjUiPkNjOiBzdGFi
bGUgaXMgc2V0LCBhbmQgdGhlIG1pbmltYWwgZm9ybSBzaG91bGQgYmFja3BvcnQgY2xlYW5seSB0
bzwvZGl2PjxkaXYgc3R5bGU9ImxpbmUtaGVpZ2h0OjEuNSI+Ny4xLnkuJm5ic3A7IEhhcHB5IHRv
IHJlYmFzZSBvbnRvIHJpc2N2L2ZpeGVzIG9yIGFkanVzdCBhbnl0aGluZyBpZiBuZWVkZWQuPC9k
aXY+PGRpdiBzdHlsZT0ibGluZS1oZWlnaHQ6MS41Ij48YnI+PC9kaXY+PGRpdiBzdHlsZT0ibGlu
ZS1oZWlnaHQ6MS41Ij5UaGFua3MsPC9kaXY+PGRpdiBzdHlsZT0ibGluZS1oZWlnaHQ6MS41Ij5T
aGFvIE1pbmd5aW48L2Rpdj48ZGl2IHN0eWxlPSJmb250LXNpemU6MTRweDtmb250LWZhbWlseTrl
vq7ova/pm4Xpu5EsTWljcm9zb2Z0IFlhSGVpO2xpbmUtaGVpZ2h0OjEuNSI+PGJyPjwvZGl2Pjxk
aXYgc3R5bGU9ImZvbnQtc2l6ZToxNHB4O2ZvbnQtZmFtaWx5OuW+rui9r+mbhem7kSxNaWNyb3Nv
ZnQgWWFIZWk7bGluZS1oZWlnaHQ6MS41Ij48YnI+PC9kaXY+PC9kaXY+


--=====_003_next=====--

--=====_002_next=====--

--=====_001_next=====--

