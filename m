Received: from ironport.ite.com.tw (unknown [219.87.157.213])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6733409635;
	Thu,  8 Oct 2026 08:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=219.87.157.213
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791449251; cv=none; b=aJRFIkLFqU9UeSuj8vTY+qGEuQLWnMW8/zl6RGq8PSuGUnwnI5NHXr1Y5uiFL8/mbiH0PwnH7q2RotfmORLs0X6i9OlLBzCREFg2+G62Gx+jZO4ExcwU/AhtnWbh7+M2TR6DBMoLcqRH0I7ydJcp/Atepo3QyQdJcmYfAv5WBLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791449251; c=relaxed/simple;
	bh=stoxDGWoH6yUw3sx/BrMLTUT6/QvJj1QWQ9EY0GIJJQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZyD0lnd3Tu5W4xivZcU9SWLvdrrfoIUdnS5vVqrL8qNwbPos++at7hyFTDi56eOp+t7Bfi/W/G+KZTea4dIEUgm+Uq8tRGd21Ms1rIRf71dCk7umlh8tlQLVN2oGq/NAQ6hx0T7ucLunNS16A+4U6sB9C2z4qDxg5BL4RxR2Xo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ite.com.tw; spf=pass smtp.mailfrom=ite.com.tw; dkim=pass (2048-bit key) header.d=ite.com.tw header.i=@ite.com.tw header.b=QDh78vGV; arc=none smtp.client-ip=219.87.157.213
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ite.com.tw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ite.com.tw
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ite.com.tw header.i=@ite.com.tw header.b="QDh78vGV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=ite.com.tw; s=dkim;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=stoxDGWoH6yUw3sx/BrMLTUT6/QvJj1QWQ9EY0GIJJQ=;
  b=QDh78vGVJ5PQlKz9MRjuAY2+y/O1ucvvt/VFWeTofJAlE9R2TIV0BE/r
   udQHknZ3gbL2oP2Y2wXkEvssrKds6qPi+4TehxeICGwI+8mSnvyNjGi+E
   oCPr7trfcZvanvTkPxFtTPxm58ryOVRmVdFw4rb/y4YISq6DnB9zafnOP
   O9bC1ZAAaCpj9XoT5kslI1USNeER23kJKFKJgIYFjlnWYCRA3Fc88+0C9
   xJdjbYLJIC63WDrB0ffzJd9aJKgmk5n8MxYqZzn85XwgwqdTax73PnGzp
   1vX8um3qD76Q78bk5giaLwLmyguqQ/DERsSgXholMrLBx1bQMY1Omk5KK
   g==;
X-CSE-ConnectionGUID: iJakxy4MSHCN2gukJZvFPw==
X-CSE-MsgGUID: SENVgCivTZa8a0/1oljTFQ==
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
  by ironport.ite.com.tw with ESMTP; 08 Oct 2026 16:47:18 +0800
Received: from hscmail1.internal.ite.com.tw (HSCMAIL1.internal.ite.com.tw [192.168.35.58])
	by mse.ite.com.tw with ESMTP id 6988lECE013055;
	Thu, 8 Oct 2026 16:47:14 +0800 (+08)
	(envelope-from amber.kao@ite.com.tw)
Received: from HSCMAIL1.internal.ite.com.tw (192.168.35.58) by
 HSCMAIL1.internal.ite.com.tw (192.168.35.58) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 8 Oct 2026 16:47:06 +0800
Received: from HSCMAIL1.internal.ite.com.tw ([fe80::d4ad:7d1f:bb56:79ee]) by
 HSCMAIL1.internal.ite.com.tw ([fe80::d4ad:7d1f:bb56:79ee%6]) with mapi id
 15.02.2562.046; Thu, 8 Oct 2026 16:47:06 +0800
From: <amber.kao@ite.com.tw>
To: <ite_pd@ite.com.tw>, <heikki.krogerus@linux.intel.com>,
        <gregkh@linuxfoundation.org>, <jeson.yang@ite.com.tw>,
        <Yaode.Fang@ite.com.tw>
CC: <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <ite_pd@ite.com.tw>
Subject: RE: [PATCH] usb: typec: ucsi: itepd: Add DisplayPort alternate mode
 support
Thread-Topic: [PATCH] usb: typec: ucsi: itepd: Add DisplayPort alternate mode
 support
Thread-Index: AQHdUY9uhn56xvoHAU2tkm6QNnbJUbbzX7MQ
Date: Thu, 8 Oct 2026 08:47:06 +0000
Message-ID: <4fdd2c07a92046d7bb9bbf51619c7400@ite.com.tw>
References: <20261001-ucsi-itepd-display-v1-1-f3de9baa2467@ite.com.tw>
In-Reply-To: <20261001-ucsi-itepd-display-v1-1-f3de9baa2467@ite.com.tw>
Accept-Language: en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-tm-snts-smtp: 46B5359048491D65BF1848AC3F3976B601A3F2BDD659CD49642A7686CD6BE8C92002:8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MAIL:mse.ite.com.tw 6988lECE013055

SGkgSGVpa2tpLA0KDQpHZW50bGUgcGluZyBvbiB0aGlzIHBhdGNoLg0KDQpJdCBkZXBlbmRzIG9u
IHRoZSBJVDUyN3gvSVQ4ODV4IHN1cHBvcnQgc2VyaWVzIHYzIFsxXSwgd2hpY2ggaGFzIG5vdA0K
YmVlbiBhcHBsaWVkIHlldC4gUGxlYXNlIGxldCBtZSBrbm93IGlmIHlvdSB3b3VsZCBwcmVmZXIg
dGhhdCBJIHdhaXQNCmZvciB0aGF0IHNlcmllcyB0byBsYW5kIGZpcnN0LCBvciBpZiB0aGVyZSBp
cyBhbnl0aGluZyBJIHNob3VsZA0KY2hhbmdlLg0KDQpbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvci8yMDI2MDkyNC11Y3NpLWl0ZXBkLWl0NTI3eC12My0wLWE3MzkyYWEwODdmNUBpdGUuY29t
LnR3DQoNClRoYW5rcywNCkFtYmVyDQo=
