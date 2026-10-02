Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE1A33689D;
	Fri,  2 Oct 2026 01:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790905773; cv=fail; b=eC0F7sdcc9WCLuiKWbZzkqnYyAoW6WS5QFQiYOPik7LoTGSual6XaS9BuNuzT8pcz3jIN8PVKto+9HtaLX4bKGMLjBYCk+heyP3Ewwtso8BeOFsJnAjpZac4L00UCLBrFViGilAN63+Pp2Ji546ctgF11B1OGIvmttDNJ1vj/40=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790905773; c=relaxed/simple;
	bh=kMFC6FWQT61FSAEW8kQzgd0AeX2J63W44aMJWO7Ef/E=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=AtcP+43SgP8SjhCrQt6GHU6IoSokazFyaYatj5fSQMtvGA9evWFvmb12RoIeQhm35bopKXlpKVyN5zwuIGPMt4CFQ5HY+Rg9k7LJi2sOx79/q4O31IuoKhMW0YRY+NQ5gqQ2z2849W4Ilsx5VmesOQpuILGUpf4VIcTGck05aaU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=mMW/B8zW; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=PLjQ8qkd; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=pfoZbFHX reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="mMW/B8zW";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="PLjQ8qkd";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="pfoZbFHX"
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691NGYIJ2408148;
	Thu, 1 Oct 2026 18:49:19 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=kMFC6FWQT61FSAEW8kQzgd0AeX2J63W44aMJWO7Ef/E=; b=
	mMW/B8zWU/O6Ns/xAj9P0krT5K/8LJLjRU5MajsJ12wYtbxbrNznZY6IDIpw+//a
	TQAPIeDe+SnkupHjp2fpOLQKfTOPU8I7WO6odMk29BCExpwfFfn3JXfCwE4uOz0z
	S2SjsiL/cmhL1vv6V5DLk0CClhABsl0Qus4FzZ6mhl1nad/UNqAVLdd9feEInAk+
	wtcS83B5Cx2YXoKoATnDLm/yXdhe1uo8jbWmL2C+xKW5tnIlb0s08phKq8PkAHvV
	KtpWQRYqOsvlUeOerSEO8mM6A3Vg1LzOpTA4Gqi8DBtFb0konWv9w7yLqlq1Wmlq
	8n20rtkJAeBN/gYw4WzdkA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 4h1f3j8fg6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 01 Oct 2026 18:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1790905758; bh=kMFC6FWQT61FSAEW8kQzgd0AeX2J63W44aMJWO7Ef/E=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=PLjQ8qkdChBffg5EPvFphlTFcPVaIKwhdnPw5PQZVJr/fErP/6X7EaUvB6Juiu4cV
	 Il3CJSBdXozFb51bED8yZCl3CDISkOh7YyUGyAHZcnBYOk+z2N88z4I4PpS+kX8SDO
	 8u+BUQWyCnRqnEQxXNaJ6IonpjguRy0XJU/VTFKyXKfos8S4kCi37NRhFhcCChexyy
	 i1epXdQlfaSVsJqtshwMMw4LcT28cUFt5HkgVJzJ1L9gKK48uqSj0yn8mJ9ySowopQ
	 D1RYJYKBXqArRP36Ds8ovvZFVBmMEvDwDjeEcJORk8k2ZumFeuesCODk9IF9xByBTx
	 TRzSVPRqtry7Q==
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 3064F401C1;
	Fri,  2 Oct 2026 01:49:18 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id A602CA03A1;
	Fri,  2 Oct 2026 01:49:17 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=pfoZbFHX;
	dkim-atps=neutral
Received: from CO1PR07CU001.outbound.protection.outlook.com (mail-co1pr07cu00104.outbound.protection.outlook.com [40.93.10.92])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 2FD7540549;
	Fri,  2 Oct 2026 01:49:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CIx2lL/EmKKcPJ0Fwg3420sfKw7K0H9WaInFaC/eABcvHSBjSVMnscFpqrG+U6KUsXYVhh9uglEN/q3j0vqsLXy7cOKot9XmNyDrNoLBbOrNxMe5HvkpD9+/OsR1HQIXrLPLWvZaesb8/bE/gYBQUsXq3ql86xVzY7W87s6M/lkxn8NZyLon5BkMt1dczhIdxcbMbHNCK4O3UqXrWkzbJ4tN2k/x2BMB7Vky5tgyItO5hZ36GgHG1jvS0Wp+9/bW0/Ymn/N7ts2+MUub0WGn4rAzaoS0JIB+GbbXX/hZgk+16GixHHk4Hy8eBK80yPXypljnpHnBXYZGyh5uzJVkJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kMFC6FWQT61FSAEW8kQzgd0AeX2J63W44aMJWO7Ef/E=;
 b=JIYgCKw20Yng/EDPj8rUTW5lzigxYEB3JlDuHZ94Jdwu/dnWJSTOyi0NwIRqgBjTLgMFq+u0ZO+pao8OqQ7zRv4oIvQmYt/DaTBQIcJ0RDnPQN7EdJRYI2QCx3FwtIEbtFRfe+R8n5OjNNYkXx0S4obhMNysm3a/5rD+ZeZJVDAvCDyyrQNSB+HA12eDfYXLNzqeqrBug2UcV+OdOtkDmaW51nhHSUyD2GkFLHtOykQK5Qv1nB10MRTTDvN8YSMyStGp8lB5wZ6xt5q6Ijn6pVou4Io76K+9HiCzsIaCEDhGlfJb6nHPocLhYimVmWudkfJqpCh/sWMX1spdW7cqkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kMFC6FWQT61FSAEW8kQzgd0AeX2J63W44aMJWO7Ef/E=;
 b=pfoZbFHX116oZccxX+XkIezN4l9EojRTGatEzSMWjb/liw9z79TG2l9qwq5r+1HW08VqjzaidhwI4TvITlbLvVJIMrNCvlBGmdRIjylNdgsXFzC2aTDgpf31Ek6X+ENRzJ+6+NPt9/Ojqv+ReaVOMqCYQFQ7ySarZWslUk5OO0E=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by SJ2PR12MB8012.namprd12.prod.outlook.com (2603:10b6:a03:4c7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.26; Fri, 2 Oct
 2026 01:49:11 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%6]) with mapi id 15.21.0451.026; Fri, 2 Oct 2026
 01:49:11 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Minda Chen <minda.chen@starfivetech.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH v1 3/3] usb: dwc3-generic: Add Starfive JHB100 USB 2.0
 device controller and adapter
Thread-Topic: [PATCH v1 3/3] usb: dwc3-generic: Add Starfive JHB100 USB 2.0
 device controller and adapter
Thread-Index: AQHdRzztITagRuB8aEm4X/jTDdNGV7bpkc6A
Date: Fri, 2 Oct 2026 01:49:10 +0000
Message-ID: <ar8BQsbISdiZw48k@vbox>
References: <20260918071103.24482-1-minda.chen@starfivetech.com>
 <20260918071103.24482-4-minda.chen@starfivetech.com>
In-Reply-To: <20260918071103.24482-4-minda.chen@starfivetech.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|SJ2PR12MB8012:EE_
x-ms-office365-filtering-correlation-id: 6d9a0dd8-bac7-40c4-617f-08df20275acc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|10067099003|11063799006|56012099006|4143699003|6133799003|22082099003|18002099003|3023799007|38070700021;
x-microsoft-antispam-message-info:
 qdvcpJFvUKSjFlllwrd3f0ThxoA+cL2ZXXJ3adF17qYia67RiJVywEg63a2xJKTyqRmkEVpXsvI5aFkdxb98M2U9ezJ8xwCh2qI0wKz4tAbzvN62li+SppBcVA0W2lumXXqPtFs8wLFZfQCK68cjwr2jfSqG52u8D2V9xVnF6cZrYmP2YYhMJkVXBbgGceY7XkQiYqi/km8bbXO+iRkfjAO0AdW5dHE8oy6daSAkPsGc+UKF6af7W7NpI4t93w3+5qVIzAuAIDVLwLu5uCooXk1GiVG0H0DnfCk35uTG+DKHyoTFZLOZv6f5+3Fl47K5ihMfFb/C3OMj84Nb10Q4e4QOo9NsxeagP+R/wLlH2MEXdspBqdY3mWMALIrD//sayRujFEly0B5lNBEASXdO33wTyU1fsjIxeyoKsccv8fP/fTuN3Fih3l7q/ogx6MdEnCrj/law2sutOd5Nj5qU0yRRQF+kTnaC5yixkl5l0Ic9Q30guVw7IIK4N0WwSPJVFRLT7xM2ujY+DVpKtF8oWqGgdvZ5qqP25USXdtrbk8RxzsD5sX6qs6wGB4TLzKnoJKUYq5nTQSJP8r00ldWROp3bFMRK2BQid6oK+H0c0pzqfFAya885LK13awTPOJSU5g3FhPB1bhUPpNKZzgEOyrH/86ggMEY1+/PNlQngSCjSDilA1qBNIEhUNxNqMe9MfPrkzMqIbis47xjVrbK41LlJUdkJxJta+Qn1C+yUIsw=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(10067099003)(11063799006)(56012099006)(4143699003)(6133799003)(22082099003)(18002099003)(3023799007)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SDJVcTJHNjBjS2RKUjhuZkdZUFdBcHVFbmU0SXRoN1hjak1vclhOTHc1czVw?=
 =?utf-8?B?eUN3TWpqMXlVVEljMXp1Z0NWT2xtRnJNUUpqRXpXaHJGYTlRMUVlRmZsZnZ3?=
 =?utf-8?B?WFU3eXR3c1l0NmJqTjZOdWVERmVsNHA3Z0J5R3FWOFBNRzFRZmJ6YTBHUlNz?=
 =?utf-8?B?bTRxaDZ6aVpjLzlxTnRsM0czN1JVcEREQW5XVTlhSFFPb0J3WEZsaHZlUTVv?=
 =?utf-8?B?YnZ1NG54ZldDbUc1LzBDYW9KSTNhVXgzN3lDVGV6TytWOFo4dlU5YkhpTlZJ?=
 =?utf-8?B?TTlSOXNSUWJNZCtJeGNJUUlRK3ZUaTlCc25qazczOXNDbFNmNzRGVVNkaXZH?=
 =?utf-8?B?SFNpcld1WHRYWmFQQjJzZUVTZ2lYeVBsWTZUa0Jla2MrY0pneTJLV3lKNU5T?=
 =?utf-8?B?MFJiMW1vaFVnaUFRQ1FrTzV5c3ZPa0I1Sk4vQVM3UjY2dVErSlk1Nm1XUWRG?=
 =?utf-8?B?SjhZT2pJZ0pzaVZKellLZjl2a0tKb1lRVkYvRnMrMm9nWTNiMmR1Q0dwK2pq?=
 =?utf-8?B?aTdhTnpCZExnaURrQ2IwUnZ4UWR4M2M0bE5VK0dIVzZNMlY3WE9xMzRybFVh?=
 =?utf-8?B?NUxBMExjcW81dlVpTjE3T1Y0Y25LZE12WWhCaXR0R2t1aTY1SEVFYzg2OW1Y?=
 =?utf-8?B?Y3V3UjRMV2F2OXc0Z0J3RWdvc0tad29rQXJXblh5S0o5YzIwcGVYTEd6V1lR?=
 =?utf-8?B?WnY1K3JJU0theGxQcmdHTnFzK0dFeHBxVGRyRGJBbXZURkU3eEpCR0RwSWIz?=
 =?utf-8?B?M0pHODI0eUhFaGJpNHRNRER1S2FwZXpkL2VtNGZ4R0w0bnBzdGxGQ0VKOWFa?=
 =?utf-8?B?b1A4VjFDRDlPenBzRkFXUXd1K3FCZmt1REpyWlNOYyt5L1Exb1JQOWdxaVJq?=
 =?utf-8?B?Wk9ESFpEZHBHWFBQUmRaamxxQ3oyejNVL0lZV3dTWVRHUE5NK2JKTER0Wkpv?=
 =?utf-8?B?ay9ZL2hub2Z3VHZpSkIxT21kamlYY0xDUXVGMC9GMXNaOVFJZnNqdk9HWFJr?=
 =?utf-8?B?QXFGRnowNkJvUm1kdVFObXFSQURoYTByeTNLQ1QzeS80MEI2TjJ5U0g3T0ll?=
 =?utf-8?B?ZWFENFVUVEVsZlA4NmxxR0IrMFZXRGpiWkR2eUhIUzIwSHhibXB3TnBsMk9z?=
 =?utf-8?B?dXROc2o2Q0RxcHU0dmQ3UTBaTFMzbDY5L3RXQ1FYcm5wUHkvMkhoSTVyTWhK?=
 =?utf-8?B?YmVpSFE3cWlvejRPOUVWc1BVZXJEanc2OTdJYUJLQkUwSzBYYjYwRUNhc0xh?=
 =?utf-8?B?emVJVXR4dGsvZmk3R2d2ZzNxeUFEbDA5RDFTWFdTd216YitOQ0YyYjkycnUz?=
 =?utf-8?B?OVl3TGJ1VDc0Zlk1V2NIMWZ1QzFoTlhMWTlPb2E3Nnh6ZTY5TzVuMWZSeWJC?=
 =?utf-8?B?eGlLRFliaDhZOWJBY25OdHYrNzQxVjhmOExsNDlGczhwcVZ2MEd2VkMxdmZW?=
 =?utf-8?B?cyszYjZGTG9WZFVkT09ZYU9NN0s3TUJ5NDVmSVFPZm4zS0xSRTNpZjdJODFV?=
 =?utf-8?B?bVN0bXFVNm1oWjdqbmFsTUU3L3NMaE95OUNDVkdTTzN1WnNaT0NJVjZSNXhv?=
 =?utf-8?B?SzdOZXVUZW5aZXFaTmdrTTROS2xrQnJiYSs0R0h4TE1EVjB2eTVCMFVpbjF4?=
 =?utf-8?B?ZGE2NnRGR1RKcGZsOGkrcXZNVkM3WUNIQ2RnOVJsZndGcG9wdXd5SDBUdGhD?=
 =?utf-8?B?R3pHMjAyVWxDTHc4UlcwaVphU0dHM3ltK041WDE4VjZaQzlTcGVnVFFSVWtY?=
 =?utf-8?B?K1FrT0pTdnVzM0thdVplcmFTRWVGc0dUQ0ZsVkZSbWFMU0Y0R05RWTNNQ20v?=
 =?utf-8?B?M09zbzFFWndhMVJQVGdnU2M3a2ZRL3F5d29DMmIveUE0VzduMDAyRmljdlNy?=
 =?utf-8?B?MFcxNHlDbUlMSzlLMWRwVVpYVHBoeGRUTUJOT1VUbkQrbVozcUUrQkpQSlM4?=
 =?utf-8?B?RVBFb01JZlFtYTNBMHYyVTBEa0NUZHQyMGFmYVc2TjZwQm0vRjRZS09IM0xj?=
 =?utf-8?B?MjVFTVQ3ck11eGFpeVNrbStJNGFLbTdPUXQ2NUlLNnBObWpTRG5tQXVhd2VH?=
 =?utf-8?B?RkhwNXZpREZEMEdZSGRwR1lDM2pibFBxK3JrQUlIU3FJbmFkWk9LRlJsbEw0?=
 =?utf-8?B?UTRadU9adUtxaENRZnpYamRIVmd4VWNQVjdzTGxQT1FoWlBCV3AyMi90YkdO?=
 =?utf-8?B?TDdHK1dLTk41dHpZd0NlMXRVaG9NT2sxSlZ3TjdtVWxkWS8yNG1JWGFRUlNG?=
 =?utf-8?B?YkI2b1VJMDQzOEZ2OGxCb25OYW91N2phWWs0Nm52Q1NmejlpRWtNTll3aStu?=
 =?utf-8?B?VjhSUjFjclBabituL21oZ2ZGNWxSWkVkTEwxUUZPMU1adm5EQXhGQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <27A04E80D51D974086194220AE6B0603@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	fAbiPGk2mzuaxekPQmH8P5Dwy/wO/MnA97yGY6tm8c1+w+MD9wM8C4HWS99GmldJDcsGGOAT39WK0kz7m6Jp2CX5zRFm00AI7Hwd7tOWsf9FZag8N0Mg9n93nfFH9cL9dy9Pl/CK/O3SnsETvd/WZPldLAiaH1MImLu5Ryag8NEaoMEoYELcg7BYGOadvBhNkt0L4MzK67pb2SxcnpE6ANygN8dC/4eoH8Ey0GWilB+NAjLJk+oe5Q6fzjTK3FRXPTH/9dOdElj/rglkWS+tPWS/rk4uq9yva8K/N9Oc1XEM41q8vM7yuOlvybB9VmfH5gRB0FDi4XWnVbPwUEvVfQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	dj2UM7LVrDTAE1sSApb1Iy1OGXKE257cWesBRULtSHKNLDdSdMNuw2iOHrlLsi5DVlNg+tUCpFxU3tzdWhmSnHZHFEdO0W788+N/Bkdz7anzN5ZBaaEQZKX8rb3cvwNJuYXguANeCpcNKrb5Vrujen43mKx440oqp7QmKsgA+mWJHxQZkLGmqREomBjp7SwBcg4ewuIae2mXumopiWi7q7nL6FaHjG7ZsYNh7nVukrs63oQ/o0nA8OLSiAyLlkR1WLr7oGGybhHhvyWUpfLIdSWrEF7NSQhp/KAfOIel5gt1SpzIyfIHf6/KClmJuplnoi9ewr/d2RrdUHysphHZuptmBaS01Y/9anPgARruzLBm9AjQClgXbSbth9Dcgu2xqQvpAy0XB8eZm4D5bgVrLHEzrwqLLNlUd0nCl+dMLYCncKvPU1kJjtXI4jLXIPdVecYIM38HKHpbPppfN8AP2oS2IvCLr7g1DlYjiX5NXjJpNP/GcML/bBd0NkLaa3fRgMJp2EZNn428gQSxLoP5fFy22xicqA4AqnS1WwtUTG7EyhLvW5Spj6zibF1dKys2YVP2Gz2G/w7KEhfTupwx5BRQiYDXZOFdS2asCs1yM7/GsNH/3JelEnJrxD1KS5lSUntdPj8Dr/hMw1Dce7AZ/g==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d9a0dd8-bac7-40c4-617f-08df20275acc
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2026 01:49:10.8994
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qqDsBMI4tudFXSbfAaxvD2QMWNQ538cm6LTsWtb2D2hSfAV8GKuG6+tTz5yaqWHFjSnUULKHepw4Tbr8zLahiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8012
X-Proofpoint-ORIG-GUID: F_KCJXmvct2s_V2Q_JCjrVOVT-LXV33v
X-Authority-Analysis: v=2.4 cv=AfkkjHXG c=1 sm=1 tr=0 ts=6abf0d9f cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=jSPayVjLy6xbsuKauFBc:22
 a=Bq6zwJu1AAAA:8 a=w5EJJNrBnGaUZm5E_wAA:9 a=QEXdDO2ut3YA:10
 a=KQ6X2bKhxX7Fj2iT9C4S:22
X-Proofpoint-GUID: F_KCJXmvct2s_V2Q_JCjrVOVT-LXV33v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDAwNiBTYWx0ZWRfX/iI/oGlI5rdp
 i90wiW0k/YR5Jr2fBmq7QBuLlzxQjXKO9VtNbC7khAE4WorDrKMBFZsFzSh8uVnlpIaXIbp90/q
 elcdpbRISCHClIoWVxeH8UcsoNq4smOHsmjtdWQB/zXywRU5HyMDwOSp/x8PJ5Af9HNyEDuU5u5
 OtIWr3wHx+GRoCQb9BT0bSoCU8Ru2a/olkxUnLXmM5+R9kkfxKhGBSbj5MG8Oo1dTRtszwN764h
 6GlJwnnV41PQwjU7jwmzGqNAOZ9T3v6z8OFpmwAqRUfrnUlVQfXtOvlOpaqfrMqqMatbYtOABTx
 +XizkBbceF21A4ENUnBHeyYNKikmsCHnm8epT9Ifp+eikASCf1XNlTTM69i2+T32NPRNEqeLPal
 Fw0E3a8ZvIw4yZJU+S/xtU7ubY1hCsKGhA9fQzpt+F50PvIyKlzdsDqPwrjn9LsAvqs5ezrXx05
 mZ2SK66oUIiKryjLwZQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDAwNiBTYWx0ZWRfX/aXoZRduzOVr
 GNZVWOuVkdhjdChV9LjF4aeaF3CLU/eWaGBMMb0sKymgH22PdBOwLRk00WcydiyrZU1n8WxObMb
 ZvjH/jAl8MZVBg1f2ZoKtoXM0p0JswM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_05,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 suspectscore=0 lowpriorityscore=0
 adultscore=0 phishscore=0 spamscore=0 bulkscore=0 clxscore=1011
 impostorscore=0 malwarescore=0 priorityscore=1501 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2609040000 definitions=main-2610020006

KHNvcnJ5IGZvciB0aGUgZGVsYXkpDQoNCk9uIEZyaSwgU2VwIDE4LCAyMDI2LCBNaW5kYSBDaGVu
IHdyb3RlOg0KPiBBZGQgUEhZIG9yIFBIWSBhZGFwdGVyIGlvbWVtIGZpZWxkIGluIHN0cnVjdCBk
d2MzX2dlcm5lcmljIGZvcg0KPiBkd2MzIGdlbmVyaWMgcGxhdGZvcm0gdG8gYWRkIFBIWS9QSFkg
YWRhcHRlciBzZXR0aW5nLg0KPiANCj4gQWxzbyBBZGQgU3RhcmZpdmUgSkhCMTAwIFVTQiAyLjAg
ZGV2aWNlIGNvbnRyb2xsZXIgZ2VuZXJpYyBpbml0DQo+IGZ1bmN0aW9uIHRvIHJlbWFwIFBIWSBh
ZGFwdGVyIGlvIG1lbW9yeSByZWdpb24gYW5kIGFkZCBhZGFwdGVyDQo+IHByZS1ydW4vc3RvcCBm
dW5jdGlvbi4NCj4gDQo+IEpIQjEwMCBCTUMgc29jIGNvbnRhaW5zIFN5bm9wc3lzIGR3YzMgbXVs
dGktcG9ydCBob3N0IGNvbnRyb2xsZXIuDQo+IEFuZCBleHBvcnQgaXRzIHhoY2kgY29udHJvbGxl
ciB0byBob3N0IHNlcnZlciB0aHJvdWdoIFBDSWUuIHhoY2kNCj4gY29udGFpbnMgOCBwb3J0cyBh
bmQgZWFjaCBjb25uZWN0IHdpdGggb25lIGR3YzMgZGV2aWNlIGNvbnRyb2xsZXINCj4gdGhyb3Vn
aCBhbiBQSFkgYWRhcHRlci4gU2VydmVyIGhvc3QgVVNCIHN1YnN5c3RlbSBpbmNsdWRlcw0KPiBv
bmUgbXVsdGktcG9ydCBkd2MzIFVTQiBob3N0LCBtdWx0aXBsZSBkd2MzIGRldmljZSBjb250cm9s
bGVycw0KPiBhbmQgdGhlaXIgYWRhcHRlcnMuDQo+IA0KPiBXaGlsZSBVU0IgYWRhcHRlciAyLjAg
ZW5hYmxlIGJpdCBpcyBzZXQsIHRoZSBjb25uZWN0IHN0YXR1cyBiaXQgb2YNCj4geGhjaSBwb3J0
IHN0YXQgcmVnaXN0ZXIgd2lsbCBiZSBhc3NlcnRlZC4gSWYgdGhlIHVzYiBlbnVtZXJhdGlvbiBp
cw0KPiBub3QgcmVhZHkgZm9yIFVTQiBnYWRnZXQsIFRoZSB4aGNpIHdpbGwgZmFpbCB3aXRoIGVu
dW1lcmF0ZSB1c2IgZGV2aWNlLg0KPiBTbyBUaGUgSkhCMTAwIFVTQiBkZXZpY2UgY29udHJvbGxl
ciBhZGFwdGVyIHJlcXVpcmUgdG8gc2V0L2NsZWFyDQo+IFVTQiAyLjAgcG9ydCBlbmFibGUgd2hp
bGUgdXNiIGdhZGdldCBzdGFydC9zdG9wIHVzYiBkZXZpY2UgZW51bWVyYXRpb24uDQo+IFRoaXMg
Y2FuIGJlIHRyZWF0ZWQgYXMgYSBoYXJkd2FyZSBxdWlyay4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6
IE1pbmRhIENoZW4gPG1pbmRhLmNoZW5Ac3RhcmZpdmV0ZWNoLmNvbT4NCj4gLS0tDQo+ICBkcml2
ZXJzL3VzYi9kd2MzL2R3YzMtZ2VuZXJpYy1wbGF0LmMgfCA0NyArKysrKysrKysrKysrKysrKysr
KysrKysrKystDQo+ICAxIGZpbGUgY2hhbmdlZCwgNDYgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlv
bigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1nZW5lcmljLXBs
YXQuYyBiL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1nZW5lcmljLXBsYXQuYw0KPiBpbmRleCBjYTY5
YWMwZWIwN2MuLmUzMzk0MjA1YTUxOSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy91c2IvZHdjMy9k
d2MzLWdlbmVyaWMtcGxhdC5jDQo+ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1nZW5lcmlj
LXBsYXQuYw0KPiBAQCAtMjIsMTIgKzIyLDE1IEBADQo+ICAjZGVmaW5lIEVJQzc3MDBfSFNQX0FY
SV9MUF9YTV9DU1lTUkVRCUJJVCgwKQ0KPiAgI2RlZmluZSBFSUM3NzAwX0hTUF9BWElfTFBfWFNf
Q1NZU1JFUQlCSVQoMTYpDQo+ICANCj4gKyNkZWZpbmUgSkhCMTAwX0FEQVBURVJfUE9SVF9FTgkJ
QklUKDIwKQ0KPiArDQo+ICBzdHJ1Y3QgZHdjM19nZW5lcmljIHsNCj4gIAlzdHJ1Y3QgZGV2aWNl
CQkqZGV2Ow0KPiAgCXN0cnVjdCBkd2MzCQlkd2M7DQo+ICAJc3RydWN0IGNsa19idWxrX2RhdGEJ
KmNsa3M7DQo+ICAJaW50CQkJbnVtX2Nsb2NrczsNCj4gIAlzdHJ1Y3QgcmVzZXRfY29udHJvbAkq
cmVzZXRzOw0KPiArCXZvaWQgX19pb21lbQkJKnBoeV9yZWdzOyAvKiBQSFkgb3IgUEhZIGFkYXB0
ZXIgcmVncyAqLw0KDQpUaGUgbmFtZSBzaG91bGQgYmUgZ2VuZXJpYy4gQ2FuIHdlIGp1c3QgdXNl
ICJyZWdzIiBhbmQgZHJvcCB0aGUgY29tbWVudD8NCg0KPiAgfTsNCj4gIA0KPiAgc3RydWN0IGR3
YzNfZ2VuZXJpY19jb25maWcgew0KPiBAQCAtNDIsNiArNDUsNDMgQEAgc3RhdGljIHZvaWQgZHdj
M19nZW5lcmljX3Jlc2V0X2NvbnRyb2xfYXNzZXJ0KHZvaWQgKmRhdGEpDQo+ICAJcmVzZXRfY29u
dHJvbF9hc3NlcnQoZGF0YSk7DQo+ICB9DQo+ICANCj4gK3N0YXRpYyB2b2lkIGR3YzNfamhiMTAw
X3ByZV9ydW5fc3RvcChzdHJ1Y3QgZHdjMyAqZHdjMywgYm9vbCBzdGFydCkNCg0KQ2FuIHdlIGtl
ZXAgdGhlIGR3YyBwYXJhbWV0ZXIgbmFtZSBjb25zaXN0ZW50IHdpdGggdGhlIHJlc3Qgb2YgdGhl
IGR3YzMNCmNvZGUuDQoNCj4gK3sNCj4gKwlzdHJ1Y3QgZHdjM19nZW5lcmljICpkYXRhID0gdG9f
ZHdjM19nZW5lcmljKGR3YzMpOw0KPiArCXUzMgl2YWw7DQo+ICsNCj4gKwlpZiAoc3RhcnQpIHsN
Cj4gKwkJdmFsID0gcmVhZGwoZGF0YS0+cGh5X3JlZ3MpOw0KPiArCQl2YWwgfD0gSkhCMTAwX0FE
QVBURVJfUE9SVF9FTjsNCj4gKwkJd3JpdGVsKHZhbCwgZGF0YS0+cGh5X3JlZ3MpOw0KPiArCX0g
ZWxzZSB7DQo+ICsJCXZhbCA9IHJlYWRsKGRhdGEtPnBoeV9yZWdzKTsNCj4gKwkJdmFsICY9IH5K
SEIxMDBfQURBUFRFUl9QT1JUX0VOOw0KPiArCQl3cml0ZWwodmFsLCBkYXRhLT5waHlfcmVncyk7
DQo+ICsJfQ0KDQpNaW5vciBuaXQsIHNpbXBsaWZ5IHRvIHRoaXM6DQoJdmFsID0gcmVhZGwoZGF0
YS0+cGh5X3JlZ3MpOw0KCWlmIChzdGFydCkNCgkJdmFsIHw9IEpIQjEwMF9BREFQVEVSX1BPUlRf
RU47DQoJZWxzZQ0KCQl2YWwgJj0gfkpIQjEwMF9BREFQVEVSX1BPUlRfRU47DQoNCgl3cml0ZWwo
dmFsLCBkYXRhLT5waHlfcmVncyk7DQoNCj4gK30NCj4gKw0KPiArc3RydWN0IGR3YzNfZ2x1ZV9v
cHMgamhiMTAwX2dsdWVfb3BzID0gew0KDQpTaG91bGQgdGhpcyBiZSBzdGF0aWM/DQoNCnN0YXRp
YyBzdHJ1Y3QgZHdjM19nbHVlX29wcyBqaGIxMDBfZ2x1ZV9vcHMNCg0KPiArCS5wcmVfcnVuX3N0
b3AgPSBkd2MzX2poYjEwMF9wcmVfcnVuX3N0b3AsDQo+ICt9Ow0KPiArDQo+ICtzdGF0aWMgaW50
IGR3YzNfamhiMTAwX2luaXQoc3RydWN0IGR3YzNfZ2VuZXJpYyAqZHdjM2cpDQo+ICt7DQo+ICsJ
c3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldiA9IHRvX3BsYXRmb3JtX2RldmljZShkd2MzZy0+
ZGV2KTsNCj4gKw0KPiArCWR3YzNnLT5waHlfcmVncyA9IGRldm1fcGxhdGZvcm1faW9yZW1hcF9y
ZXNvdXJjZV9ieW5hbWUocGRldiwgImFkYXB0ZXIiKTsNCj4gKwlpZiAoSVNfRVJSKGR3YzNnLT5w
aHlfcmVncykpIHsNCg0KV2hhdCBpZiB0aGlzIGZhaWxzIGZvciByZWFzb25zIG90aGVyIHRoYW4g
cmVzb3VyY2Ugbm90IGZvdW5kPyBQbGVhc2UNCnByb3Blcmx5IGNoZWNrIGZvciBlcnJvciBjb2Rl
Lg0KDQo+ICsJCWR3YzNnLT5waHlfcmVncyA9IE5VTEw7DQo+ICsJCS8qIEdlbmVyaWMgYm1jIFVT
QiB3aXRoIFBIWSovDQoNCkZpeCB0aGUgY29tbWVudCBtaXNzaW5nIHNwYWNlLg0KDQo+ICsJCXJl
dHVybiAwOw0KPiArCX0NCj4gKw0KPiArCS8qIHVzYiBkZXZpY2UgY29udHJvbGxlciB3aXRoIGFk
YXB0ZXIgKi8NCj4gKwlkd2MzZy0+ZHdjLmdsdWVfb3BzID0gJmpoYjEwMF9nbHVlX29wczsNCj4g
Kw0KPiArCXJldHVybiAwOw0KPiArfQ0KPiArDQo+ICBzdGF0aWMgaW50IGR3YzNfZWljNzcwMF9p
bml0KHN0cnVjdCBkd2MzX2dlbmVyaWMgKmR3YzNnKQ0KPiAgew0KPiAgCXN0cnVjdCBkZXZpY2Ug
KmRldiA9IGR3YzNnLT5kZXY7DQo+IEBAIC0yMzEsMTIgKzI3MSwxNyBAQCBzdGF0aWMgY29uc3Qg
c3RydWN0IGR3YzNfZ2VuZXJpY19jb25maWcgZWljNzcwMF9kd2MzID0gIHsNCj4gIAkucHJvcGVy
dGllcyA9IERXQzNfREVGQVVMVF9QUk9QRVJUSUVTLA0KPiAgfTsNCj4gIA0KPiArc3RhdGljIGNv
bnN0IHN0cnVjdCBkd2MzX2dlbmVyaWNfY29uZmlnIGpoYjEwMF9kd2MzID0gIHsNCj4gKwkuaW5p
dCA9IGR3YzNfamhiMTAwX2luaXQsDQo+ICsJLnByb3BlcnRpZXMgPSBEV0MzX0RFRkFVTFRfUFJP
UEVSVElFUywNCj4gK307DQo+ICsNCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lk
IGR3YzNfZ2VuZXJpY19vZl9tYXRjaFtdID0gew0KPiAgCXsgLmNvbXBhdGlibGUgPSAic3BhY2Vt
aXQsazEtZHdjMyIsICZzcGFjZW1pdF9rMV9kd2MzfSwNCj4gIAl7IC5jb21wYXRpYmxlID0gInNw
YWNlbWl0LGszLWR3YzMiLCB9LA0KPiAgCXsgLmNvbXBhdGlibGUgPSAiZnNsLGxzMTAyOGEtZHdj
MyIsICZmc2xfbHMxMDI4X2R3YzN9LA0KPiAgCXsgLmNvbXBhdGlibGUgPSAiZXN3aW4sZWljNzcw
MC1kd2MzIiwgJmVpYzc3MDBfZHdjM30sDQo+IC0JeyAuY29tcGF0aWJsZSA9ICJzdGFyZml2ZSxq
aGIxMDAtZHdjMyIsIH0sDQo+ICsJeyAuY29tcGF0aWJsZSA9ICJzdGFyZml2ZSxqaGIxMDAtZHdj
MyIsICZqaGIxMDBfZHdjM30sDQo+ICAJeyAvKiBzZW50aW5lbCAqLyB9DQo+ICB9Ow0KPiAgTU9E
VUxFX0RFVklDRV9UQUJMRShvZiwgZHdjM19nZW5lcmljX29mX21hdGNoKTsNCj4gLS0gDQo+IDIu
MTcuMQ0KPiANCg0KVGhlIHJlc3QgbG9va3MgZ29vZCB0byBtZS4NCg0KVGhhbmtzLA0KVGhpbmg=
