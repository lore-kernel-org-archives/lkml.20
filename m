Received: from outboundhk.mxmail.xiaomi.com (outboundhk.mxmail.xiaomi.com [118.143.206.90])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C54C631B10B
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 13:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=118.143.206.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791034889; cv=none; b=cnHnXMijznv1PUQHjDfPJjV6ghlojQRAMgO0QsFTB3YoDZw/DAB8eFzKkLXKaSqgw8BA1enp3hDi9esCRQoqi//tC8Kn1558FkgOXgAUAXfmuW03XUAL5dfyZJ5t7dgVsZxrhEuv+NimBXtQJ+MXMCbXnOtX2iwYJT5Yfw0GHLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791034889; c=relaxed/simple;
	bh=v853H5nbgkgr1qTo8CTt2cgimrFmXWP9hw3M8VPC68c=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=gV0zw1o1KbClEzpTDUPH5A6ZCcfF6ayn/zWnRphUw7FIDS37cxBIiilm719yINTH52xLnuaQGAR65j4TNJZ8lsrSoeaOlv465OLUJJm70fEJTsHlZ+678P4mODLg5pIGG5+JNKEMNO5AHGOK2rWUm1H5nnqyy62nohbdiDFZUQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=xiaomi.com; spf=pass smtp.mailfrom=xiaomi.com; arc=none smtp.client-ip=118.143.206.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=xiaomi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xiaomi.com
X-CSE-ConnectionGUID: doLpPFXHT3SmBJwqDKhSFg==
X-CSE-MsgGUID: SHV/oX2PSWCdmyWyROdTzA==
X-IronPort-AV: E=Sophos;i="6.27,138,1786982400"; 
   d="scan'208";a="164483996"
From: =?gb2312?B?1dTEz9Xc?= <zhaonanzhe@xiaomi.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
CC: "linux-f2fs-devel@lists.sourceforge.net"
	<linux-f2fs-devel@lists.sourceforge.net>, Chao Yu <chao@kernel.org>, "Barry
 Song" <baohua@kernel.org>, Juan Yescas <jyescas@google.com>, Dev Jain
	<Dev.Jain@arm.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, David Hildenbrand
	<David.Hildenbrand@arm.com>, =?gb2312?B?1cWyqQ==?= <zhangbo56@xiaomi.com>,
	Kalesh Singh <kaleshsingh@google.com>, Nanzhe Zhao <nzzhao@126.com>,
	=?gb2312?B?wO7F9LfJ?= <lipengfei28@xiaomi.com>, Ryan Roberts
	<Ryan.Roberts@arm.com>
Subject: =?gb2312?B?tPC4tDogW0V4dGVybmFsIE1haWxdUmU6IFtmMmZzLWRldl0gW1BBVENIIHYy?=
 =?gb2312?B?IDAwLzE0XSBmMmZzOiBzdXBwb3J0ICYgb3B0aW1pemUgbGFyZ2UgZm9saW9z?=
 =?gb2312?Q?_for_writable_files?=
Thread-Topic: [External Mail]Re: [f2fs-dev] [PATCH v2 00/14] f2fs: support &
 optimize large folios for writable files
Thread-Index: AQHdUP5ie3mQoHhgTEqJEObMEGLkWrbr0dIK
Date: Sat, 3 Oct 2026 13:40:16 +0000
Message-ID: <6ccdf4eef9b242bc96d28d511f754a30@xiaomi.com>
References: <20260915041909.2903887-1-zhaonanzhe@xiaomi.com>,<ar1CJBRumJ0hcNdB@google.com>
In-Reply-To: <ar1CJBRumJ0hcNdB@google.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

SGkgSmFlZ3VrOg0KT2guLi4uLi4sIEknbSBvbiBob2xpZGF5IGZyb20gIE9jdCAxIHRvIE9jdCA3
LHNvIHRoZSBuZXh0IHZlcnNpb24gbWF5IG5vdCBiZQ0KdGhhdCBzb29uIGFuZCBJIGFwb2xvZ2l6
ZSBmb3QgdGhhdC4gSSd3aWxsIGNhdGNoIG9uIHRoYXQgb25jZSBJJ3ZlIGdvdCB0aW1lLg0KDQpU
aGFua3MsDQpOYW56aGUNCg0KDQoNCg0KDQoNCg0KDQoNCg0KDQoNCg0KDQoNCg0KDQoNCg0KDQoN
Cg0KDQoNCg0KDQoNCg0KDQoNCg0KDQoNCg0KDQoNCg0KDQoNCg0KDQoNCg0KDQoNCg0KDQoNCg0K
DQoNCg0KDQoNCg0KDQoNCg0KDQoNCg0KDQoNCg0KDQoNCg0KDQoNCg0KDQoNCg0KDQoNCg0KDQoN
Cg0KDQoNCg0KDQoNCg0KDQoNCg0KDQoNCg0KDQoNCg0KDQoNCg0KDQoNCg0KDQoNCg0KDQoNCg0K
DQoNCg0KIy8qKioqKiqxvtPKvP68sMbkuL28/rqs09DQocPXuavLvrXEsaPD3NDFz6KjrL32z97T
2reiy824+MnPw+a12Na31tDB0LP2tcS49sjLu/LIutfpoaO9+9a5yM66zsbky/vIy9LUyM66ztDO
yr3KudPDo6iw/MCotauyu8/e09rIq7K/u/Kyv7fWtdjQucK2oaK4tNbGoaK78smit6KjqbG+08q8
/tbQtcTQxc+ioaPI57n7xPq07crVwcuxvtPKvP6jrMfrxPrBory0tee7sLvy08q8/s2o1qq3orz+
yMuyosm+s/2xvtPKvP6joSBUaGlzIGUtbWFpbCBhbmQgaXRzIGF0dGFjaG1lbnRzIGNvbnRhaW4g
Y29uZmlkZW50aWFsIGluZm9ybWF0aW9uIGZyb20gWElBT01JLCB3aGljaCBpcyBpbnRlbmRlZCBv
bmx5IGZvciB0aGUgcGVyc29uIG9yIGVudGl0eSB3aG9zZSBhZGRyZXNzIGlzIGxpc3RlZCBhYm92
ZS4gQW55IHVzZSBvZiB0aGUgaW5mb3JtYXRpb24gY29udGFpbmVkIGhlcmVpbiBpbiBhbnkgd2F5
IChpbmNsdWRpbmcsIGJ1dCBub3QgbGltaXRlZCB0bywgdG90YWwgb3IgcGFydGlhbCBkaXNjbG9z
dXJlLCByZXByb2R1Y3Rpb24sIG9yIGRpc3NlbWluYXRpb24pIGJ5IHBlcnNvbnMgb3RoZXIgdGhh
biB0aGUgaW50ZW5kZWQgcmVjaXBpZW50KHMpIGlzIHByb2hpYml0ZWQuIElmIHlvdSByZWNlaXZl
IHRoaXMgZS1tYWlsIGluIGVycm9yLCBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIgYnkgcGhvbmUg
b3IgZW1haWwgaW1tZWRpYXRlbHkgYW5kIGRlbGV0ZSBpdCEqKioqKiovIw0K
