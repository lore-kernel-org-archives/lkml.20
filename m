Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=180.76.5.236
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794881931;
	b=O9SeWAGWsAqe3tNPurxKgKHen+A3i/sqh7Sur0pZm7zi1G+upwLKOiLyiY3H1pgo47IV
	 xb674J35364qg3Tjbbg/UxY8Uy4MSTZgfjxVhi/Mxs2Axk69ND1ffvoFK347vILuPZk2M
	 jtDIZPxXajXlbUrODNGhSc8O0Fy3wnI85Zko7iPUPdb/UE88UGuTWtb9oOCBs7/ulGhgr
	 bqGVCdA0mJQ+mOZ3WUWN/KTWt9V7Zai9x1diHqa78e2lNzkj4O+BLPCyhYC+JFZKtWdXm
	 gs2el+DyBbgUVIqoF2U0nYHFncqRArI3Z9xGD7gVhYB+VBrtz6mWPMiDhVrg9cU43dQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794881931;
	h=DMARC-Filter:X-MD-Sfrom:X-MD-SrcIP:From:To:Subject:Thread-Topic:
	 Thread-Index:Date:Message-ID:References:In-Reply-To:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version:
	 DKIM-Signature;
	bh=KxA1gat61zqasH5kjJPMHKq4Wocgk1fldQZmos+bezg=;
	b=F0w769ySD9Ga//eShR0zW1qRorVuIeQz6sGTsowegsPlsc0DPac6dc6K8TWqjoZd7f4I
	 EGu/hLXd1xMb0TJqIAh8qiZAVMPzeh4y3DUeI5etyF1M9q6GNS4YzCHR04X0Z7/5W1Khu
	 8aczgl6qKSRPQ2PWII04j/wdWNOLSGEJxVE5HoJTiIjFghFkYLpfWkm+5al8sCjGdakAt
	 2EC/PvoWwM+G9UCdxdecXdZkkQE13Oh0GELWKMnntGaJAwyWwRD5wZPjQhE0gZdjV72OA
	 HpOyUjLyvo/PWMJ16mojwBJ9zI/Inbi6unHdMi8N9Juz2v2sc1mBYcGJ2S5O8rnJZoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baidu.com;
	spf=pass smtp.mailfrom=baidu.com;
	dkim=pass header.d=baidu.com header.i=@baidu.com header.a=rsa-sha256 header.s=selector1 header.b=W5kQloRF;
	arc=none smtp.remote-ip=180.76.5.236
Received: from outbound.baidu.com (outbound.baidu.com [180.76.5.236])
	by smtp.subspace.kernel.org (Postfix) with SMTP id CCF1D606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 02:18:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCF1D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=baidu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baidu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baidu.com header.i=@baidu.com header.a=rsa-sha256 header.s=selector1 header.b=W5kQloRF
X-MD-Sfrom: lirongqing@baidu.com
X-MD-SrcIP: 172.31.50.46
From: "Li,Rongqing" <lirongqing@baidu.com>
To: Vasant Hegde <vasant.hegde@amd.com>, Joerg Roedel <joro@8bytes.org>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Will Deacon
	<will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	"iommu@lists.linux.dev" <iommu@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: =?utf-8?B?562U5aSNOiBb5aSW6YOo6YKu5Lu2XSBSZTogW1BBVENIXSBpb21tdS9hbWQ6?=
 =?utf-8?B?IFJDVS1wcm90ZWN0IGlvbW11X2dhX2xvZ19ub3RpZmllcg==?=
Thread-Topic: =?utf-8?B?W+WklumDqOmCruS7tl0gUmU6IFtQQVRDSF0gaW9tbXUvYW1kOiBSQ1UtcHJv?=
 =?utf-8?B?dGVjdCBpb21tdV9nYV9sb2dfbm90aWZpZXI=?=
Thread-Index: AQHdS/CJ6R9FuVCvj06ptfGQFjiYz7cwlTgAgAFGkLA=
Date: Tue, 17 Nov 2026 02:18:43 +0000
Message-ID: <ea2a95095eba47a99df64adde16fd71a@baidu.com>
References: <20260924064709.2194-1-lirongqing@baidu.com>
 <301430f5-c96a-42e2-bd81-de564650f9a9@amd.com>
In-Reply-To: <301430f5-c96a-42e2-bd81-de564650f9a9@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=baidu.com;
	s=selector1; t=1794881926;
	bh=KxA1gat61zqasH5kjJPMHKq4Wocgk1fldQZmos+bezg=;
	h=From:To:Subject:Date:Message-ID:Content-Type;
	b=W5kQloRFr8oumZdm0r03hS3Ak+o/rpdafkuIAyCPNwkWY1m+gM9PYDF16mQuo5SSw
	 6wWput2nApuBsKsN2nfq/LUBTTDsq4fVzpVCIVakIkIIQq6++JC3s+lmmdyiz4DDOJ
	 4RvBMunbdqjpDcIv1vASVpZ8AOCwdbnLg/QTIJTN5b1GGWLh0/ZwOeursLCJAbtOB5
	 Sd4Xz4QSttJwMcPbezT0wkz4YWIudB6vbb3aUe7v8PrcHUI8z5dp0GocQfqouoaT+7
	 Dsf6VrDtIQOPl6dXbUJYBEZskEB2dnQ08Rmjzq53ffXMZ2gMiAq1OQum8Vo6PNkz14
	 u1TslrMMzsFvQ==

PiA+ICAJICogRW5zdXJlIGFsbCBpbi1mbGlnaHQgSVJRIGhhbmRsZXJzIHJ1biB0byBjb21wbGV0
aW9uIGJlZm9yZQ0KPiA+IHJldHVybmluZyBAQCAtMTA5NCwxNyArMTA5NCwyNSBAQCBzdGF0aWMg
dm9pZCBpb21tdV9wb2xsX2dhX2xvZyhzdHJ1Y3QNCj4gPiBhbWRfaW9tbXUgKmlvbW11KQ0KPiA+
DQo+ID4gIAkJLyogSGFuZGxlIEdBIGVudHJ5ICovDQo+ID4gIAkJc3dpdGNoIChHQV9SRVFfVFlQ
RShsb2dfZW50cnkpKSB7DQo+ID4gLQkJY2FzZSBHQV9HVUVTVF9OUjoNCj4gPiAtCQkJaWYgKCFp
b21tdV9nYV9sb2dfbm90aWZpZXIpDQo+ID4gLQkJCQlicmVhazsNCj4gPiAtDQo+ID4gLQkJCXBy
X2RlYnVnKCIlczogZGV2aWQ9JSN4LCBnYV90YWc9JSN4XG4iLA0KPiA+IC0JCQkJIF9fZnVuY19f
LCBHQV9ERVZJRChsb2dfZW50cnkpLA0KPiA+IC0JCQkJIEdBX1RBRyhsb2dfZW50cnkpKTsNCj4g
PiArCQljYXNlIEdBX0dVRVNUX05SOiB7DQo+ID4gKwkJCWludCAoKm5vdGlmaWVyKSh1MzIgZ2Ff
dGFnKTsNCj4gPiArCQkJaW50IHJldCA9IDA7DQo+ID4gKw0KPiA+ICsJCQlzY29wZWRfZ3VhcmQo
cmN1KSB7DQo+IA0KPiBXaHkgd2UgbmVlZCBzY29wZWRfZ3VhcmQoKT8gd2UgZG9uJ3QgaGF2ZSBt
dWx0aXBsZSBlcnJvciBjb25kaXRpb24gdG8gaGFuZGxlLg0KPiBJIHRoaW5rICBzaW1wbGUgcmN1
X3JlYWRfbG9jaygpIC0+IGNhbGwgbm90aWZpZXIgc3R1ZmYgLT4gcmN1X3JlYWRfdW5sb2NrKCkg
aXMgZ29vZA0KPiBlbm91Z2guIFRoYXQgd2F5IHdlIGNhbiBhdm9pZCBtdWx0aXBsZSBpZihub3Rp
ZmllcikgY2hlY2sgYXMgd2VsbC4NCj4gDQo+DQoNClJlYXNvbmFibGUsIEkgd2lsbCBzZW5kIHYy
LCB0aGFua3MNCg0KW0xpLFJvbmdxaW5nXSANCg0KDQo=
