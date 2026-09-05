Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3031E281503;
	Sat,  5 Sep 2026 00:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788568002; cv=fail; b=oI11Kb0h8obnenA177C1v+mr1w7CZiiAZsYZn/JIelLVmE7qbl0/cGBj3clpw+N7p/oHUGkXkY0eyt2NDAMMAT8Eo+v0TLqt8/1u2dZGn3/X5aZ9J2knfWHF4CPw84v3CCt+QvYdnTvKPztOHB7tVcX+QkAeQ759Ih252+DZ/BM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788568002; c=relaxed/simple;
	bh=665F/szX67NSebhTOeYpR1/67ZJImepl2mKrPRrTc5k=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jlWXn6obcf0zgVsM3ypaS+AS8iUIPUIJQXdRCu+CWlCRuGFZWrYPqKBw4AmTTZ3I8BVfNdxsUf6EUuL/XF3oBm7v1xcoErILVE8m/qHXWLpSV+LG+wYapHu+PiDElomBWlC1Dz+ofRcsXvCm5WdkwAMmxvbDLAQ5TJv2A+uFgdU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=eLEZeq/+; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Szfg5Y4o; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Ku0qk+dB reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="eLEZeq/+";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Szfg5Y4o";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Ku0qk+dB"
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684Kcmqb1143298;
	Fri, 4 Sep 2026 17:26:29 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=665F/szX67NSebhTOeYpR1/67ZJImepl2mKrPRrTc5k=; b=
	eLEZeq/+M8TzYDCd4AeD9lkKyQ+mxOCBf0/3UqUjytjt+/DXmANY+xI5ZRNVDX4T
	qXlFqlTbsmGc/zO7+GwoaKOsxMf9Lz6m+W6v4XC9RYunV7bdcmjmiukXoaFE+Tbx
	xif9AsoN34R/WkbuLMnWxb60TlhdFdXwIpMC/sWYRNAhM4QY630F9yNcAY/Pimy1
	YNMb2ZmBkAtCyiFQSRdqJTXF4gJh1u4cBQZP78DbXa12DB9hOMHOd4SfWL9KeTp4
	nTp5eu3Ho3EbuAH5jZYo5lqv7k0rtrcDK7lo7gG0wQfjRRqy6OqzSbSY99BPojJ2
	i75txG5SHtzsMEYfv9F/Kg==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4gfrm1b2x7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 04 Sep 2026 17:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1788567988; bh=665F/szX67NSebhTOeYpR1/67ZJImepl2mKrPRrTc5k=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=Szfg5Y4ot1FhcKQBsyOXyr8BpHTstMrQhSdCzU8pI3i9GQ4LuNwBRpW0bARhZhD/w
	 V7bBKtbkXs9y8t3Vv9Y62dLXDndxiHYOsHeTq13zliG3F6AHFdMk3bmPbF6v0BM7Lc
	 TM7HgA1CG6L63BQ/lur6Eu7xIfJHmjj+Ndc+I5wTE5GJMXHJlvVcg58NCEPe8VFtbO
	 kWfLIv70NNlOkE1rFNLZVGIQAKOE7i7NTnWohZkFl/uYCX5ae1GXjeeiypW0xIUiHU
	 Hj8J/MsYRFWj53GRRkYhuxpC7/XA5ZbG4BQJpEJ9tVfLdzj6HdQqoK0xnVSkCkRkpO
	 dw37Weaj2nkYQ==
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 3C5084014A;
	Sat,  5 Sep 2026 00:26:28 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id B4ED0A0070;
	Sat,  5 Sep 2026 00:26:27 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=Ku0qk+dB;
	dkim-atps=neutral
Received: from BL2PR08CU001.outbound.protection.outlook.com (mail-bl2pr08cu00103.outbound.protection.outlook.com [40.93.4.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 9568E402D7;
	Sat,  5 Sep 2026 00:26:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=POZhoBeaaMYij4b5sGA3ooPcuey002iiBQmDLi6S2h5JLJVyTR1APHaNq9aTxl4/ty/AnrW9I/nwboYEtmLzkmg/CzUHbaXB0vxpZ9h2+WkijLxmDAvnDiEC6KhllX+trCG6dwUxMSliVJsMQjnysd3NzQJVswwg4R/4qjpmweHUbjpIWkayj2mQ/j87F8pP6m+wT0I3ADUgQEQ5oMLfXceeN+wMLoeb7JRvWg/wmUVESu9t0ZHVYj2a3eFaZFyGLX2na4abBDRRaia0vsoxJaGfDI99Eq+IauLyrUicGTJo8EenNOzFKZ4ZRMEg++IqzYFilCwlny14HQNBA6Gg8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=665F/szX67NSebhTOeYpR1/67ZJImepl2mKrPRrTc5k=;
 b=ZMHhCKOopprlUEzBs25qTGWpxy9jlQ67jkf/r9nUeopBm08sgLxbidiHbb59iN9ip+n7kQywZ/Ef6HG1e5xImwafOuMxnkGQOSdgEwF7UuYYr+kz4RXKtnVg43YvNn3t7r89XkIAvoHPX6VpvDBWZGZCWzYmhNFrAn2MDwsbCqp+ZD0kmnwumT7xK064D7gXMMYBcpoo2vOoqmZSa6AL5GxSNnfSFnTPNOoOweh9qa3H7Pf2tnzxp6MM8IjhiUiji5ZOBk+/8bPUzELJ4N6hjBp2w/dC7rz9i5FJq2ONGEtDPD/yZM/BkcJVCWeoVnZwqjvTaUOUthlwAp7hM6RwBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=665F/szX67NSebhTOeYpR1/67ZJImepl2mKrPRrTc5k=;
 b=Ku0qk+dBjBl7h/QSuTz/jHxRybdit5kXHwUbARqyjtkCnxVB3po97ja4If65grLB4/cZpNdzNn9o71fDKFEatVO4aWZjekIGomYr3FFtNqeAIo+lHIy7F5XlP3JeCpqOZ3onCzRHUnc6H6asRusL02j/FZlRcas3EJF3GA/C4WA=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by CHBPR12MB515368.namprd12.prod.outlook.com (2603:10b6:610:33d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Sat, 5 Sep
 2026 00:26:23 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%6]) with mapi id 15.21.0360.008; Sat, 5 Sep 2026
 00:26:23 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Konrad Dybcio <konradybcio@kernel.org>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "usb4-upstream@oss.qualcomm.com" <usb4-upstream@oss.qualcomm.com>,
        Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Sven Peter <sven@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/4] usb: xhci: debugfs: Expose the USB3 tunneling
 ext_cap register value
Thread-Topic: [PATCH v3 1/4] usb: xhci: debugfs: Expose the USB3 tunneling
 ext_cap register value
Thread-Index: AQHdOfl/a04bUcejxkuPd1u5t5yqAba/JmcA
Date: Sat, 5 Sep 2026 00:26:22 +0000
Message-ID: <aptho8cZ41FxqI6K@vbox>
References:
 <20260901-topic-dwc3_tunneling_state-v3-0-22fdced8de55@oss.qualcomm.com>
 <20260901-topic-dwc3_tunneling_state-v3-1-22fdced8de55@oss.qualcomm.com>
In-Reply-To:
 <20260901-topic-dwc3_tunneling_state-v3-1-22fdced8de55@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|CHBPR12MB515368:EE_
x-ms-office365-filtering-correlation-id: 74013c80-b10b-496e-41e0-08df0ae45091
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|1800799024|376014|23010399003|366016|56012099006|10067099003|4143699003|11063799006|18002099003|22082099003|38070700021|6133799003;
x-microsoft-antispam-message-info:
 XKJ6jNBiZYel0As7lbRDQc5nhcVj7+ActuL6670ujbvdAq4mzz0XMfl4dZwa5br3IZsBP8W5EBe0Ce8lY2HxjoajXQMEkjwgOHklj20gCYcMBS6cxy8aCIMvgtKtNksm91jshRLObeVh5bPjbz1eERxeiqehzH7VnIDvGZdzyuZQNA80QKPIgTPp7zDU5A2es/JCPZglD8xmuSvwUS6CJALJuDntCIePQjaDTHP4ppK8m56DW9sjdWJapFlX5NBqHLZ+SI1TeA/UUiYAyiQ0XqIPRpJx+fx16PFLs3TaKo57d/CYbnZvEO09ibO4fDsTKeTRE4BeICHr/4JkkvSBaga6Yw7BzB6jBXDuEDdQJda71YrORMiz6tIglPs/SFG/BVX2lu/TMigwTvByKKIQ9ggc+kUXrtSImWpNlPKPFDIJCVxZZuHYscrJFlxPSz8cH2kaw2RjFn9ftsem1bKPcynmqcUeszh+jYGW0li/JoSn8F18kUZH7YcQ9D19KgIddx2zqRSkhca3AY6zTZAcf00Ly2IY7ohuggqw0DpnxyY0vo87Ldcg3H3PKOoy11m5J1FsJi9I+97hfnSIuakXTGhzaLywi+EV+e0Zr0gE5G8TkfXDpwJ9Zpg1JnOeQr0lzcfQlG+S0ywz0z1DCkrHKkwmXo3e9EKh/y2FPVg/Qvc0tJw6NAcJJAKVUj0yXYzPPlIkjtU5tOlt5xqo0HDeRocr+0JB+LmTBr3peCC4Ybg=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(23010399003)(366016)(56012099006)(10067099003)(4143699003)(11063799006)(18002099003)(22082099003)(38070700021)(6133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?S1NWdmtoaFZ3S25NUkY5LzlrajhzY0hzY0o0T1hiMUtRcEliWjNBV2F0c2xH?=
 =?utf-8?B?SUltQlBKU0Q5RTBCdmVwclFBbDNkTmlKelFkMnQ2ZEgvemVGbVBFRzRQRnBh?=
 =?utf-8?B?Q0JIK3VCaTFWV3QzNGxBckVLc296N2MvazBTOVRzZ2p3Q1pvN2VCSzZTSUVu?=
 =?utf-8?B?ZnpLMmNGbE1YNkFIVkFwdDNMYnRBMC9jcDRXbDFqYXlDMTd5Q2FubmNYL3M2?=
 =?utf-8?B?amZ0ZG9ZRlFkSTU1R2FuTWV2NmwxNWJac0RWS0VYMFE5Q0R3bHZ4eFg4Smlo?=
 =?utf-8?B?ZGhHdDAzUlhWcVo5VFpzWXhzWkdBb3lhNGJWdmJIbk1QanBHWWhjaFZ2M2Ni?=
 =?utf-8?B?Qjg1M255VjI4ZHI5ZWNSTGxza203NnFXQ1liNG1vZEJVRmpZQlcvVENtMzY0?=
 =?utf-8?B?Um1RcmlkU010Nk0rRXRTc2ovMXFJNlN2Yko1bWNCTExrY3pFQUg5VEN5aTlZ?=
 =?utf-8?B?VU1XQ1dtVXZRTW1mUlF0OFlKejBzSVBUNk1HL1krUnB3aDZFZDBBNmplYlVT?=
 =?utf-8?B?MTNVa2Eyd3VpaVdySDJIYnhVb25FckxZa0FqWC8zNTFUNFJrR0tyaURrSlVT?=
 =?utf-8?B?N0wrbW1udzNBNG4rVnVEbC9xSnBVb3J3V0xmSlNQY0JIODFXOXN5YmRwMzlx?=
 =?utf-8?B?MDhPSXBzb2pGNFB3Q1RaU3poVTRXZHhqSnkxbEJzK0ZCVFNFUnB6Z2lEVGJR?=
 =?utf-8?B?NlJ6aFV1L3R1bytRaDR2cGovVUhGbEo2K2syTjB6Tzk2TThZdnpqdUFaUFJM?=
 =?utf-8?B?MDNEcnRHSzRzcWZlWFRvWjJsQzhKWWZZeWtBU1lpQ3VZNDdqdXpwYlpHd1RS?=
 =?utf-8?B?SCtkaWV6dkpDTXJTZ2lCSGxEZExVWDhFOEk1WUJPZzhwNDA1VUdxWWVPNjNU?=
 =?utf-8?B?USs2RzFUanA0ZStWM2h0QlNPSHNuM3ozT0FoQTREeFZKb2o4WFRmaW53SVJC?=
 =?utf-8?B?YXN0V2Y1VGxEMDhSZE9CRDlaa3h5ZWcyTDA1SGVrZ0F4UlNuSjJRWkVaYWtM?=
 =?utf-8?B?bG9kZjFNSW1CbHhobHYzOVBUS3MyS2pSUXZuOHBjM05RTzVFQno2OW1XNHlV?=
 =?utf-8?B?VDJCMFQ0ZHFyS2w5UG1pTE92WUhvN2NrUWhpVnJaek1nNjAwUjhvOWVFL0hi?=
 =?utf-8?B?Q0c1aksrdjFEdzMvdlBvZHBnMTZJM1hSVFE1dkJyMzBzWFI4SnE0TDQ3ZHJR?=
 =?utf-8?B?YURheGVHamlHSURRTndiRFhmK0U4Nld2NmtOcHljYmVFMmRqcS9EQ0NuQURF?=
 =?utf-8?B?ZFBqWkxBRUxTZzJjNTU2S1orRlVXd29QTWxNVWlOMzViRHNaTEs3UDlhSUN3?=
 =?utf-8?B?RWd4b3hOZ3NGRW9HYWw0QVJkdlBLWFVJMmJkTlFLd1hvcmRMaVp0SytDOWRK?=
 =?utf-8?B?bTRXNGZhVXRubXpvS1A4SkY3dTkrdlUySXRQVWwwT05pTDZXaHpYdDlhc2c5?=
 =?utf-8?B?enBpYjlZRGVtLzNkK25KL1BNb2ZHU25JcWthMzBUNWh5d3lUbVNETE53bHpK?=
 =?utf-8?B?NlJVRmxOMkwyaG13ZHIrdEV3NXYvVng4Y2hwckE4WEVFZ2syQitIN3A0V1Jk?=
 =?utf-8?B?all6SGhvWWdCT2M3dGFnR3ZSeFlIbWZyY3VSbkVSMWlTVVRTUmVZTEU4UW1X?=
 =?utf-8?B?VlJ2UElhZ1pweTdIZkNldTJDMklYUEhVTnJDdVp0UEErS2RYMkd3MjRGQ0JY?=
 =?utf-8?B?T2o3YmljQ2xvNm96ZnRvZXlDK3pFcUwvNjFmL1FBRzkzSEp2bDNjY1dlK0sw?=
 =?utf-8?B?eStsM1Y3ZllkVE5ENzkvVU16aGEwSDJCUEhEWXVYNE9JRUdVbzlKb1E0a1VU?=
 =?utf-8?B?L1VmaGNnazFxWGFrakVtVVEwWnFDdFI3am9ob1NLKzQ5Ump1RjU2aytXYkt2?=
 =?utf-8?B?UE96cEFqc0RDaTlza0ZwWHhqb3Fzd1hnMEgyS0ErOXZaMFVqd0dQbitBb0lw?=
 =?utf-8?B?VWFxYWJoaUlhVmVSUVZaL3NBbjZPYnFtVmQ1UExxdHE0SWhSRjBwcFVjSXhi?=
 =?utf-8?B?ZXdJbFc4T0Q3NnkzeEV5MTZTaEoydEI0b2Z0YkwzK0hEV2lsU0ZVaW9OMDJJ?=
 =?utf-8?B?Y3lmQTdOTHBFaU8yeFU3YUtPYVpJdHBvUWpNb2lFMUUyV3BOWkd4T0JrTWpD?=
 =?utf-8?B?d3V5UlUzcDhub1VWWXFOalljTzJiajRtdno0OG5TQVVhNUhrR1R6cGJ4Z0U2?=
 =?utf-8?B?STUrdG1hQ1kzZUFJYzQ4eHF3bTBCalVrWi9KWUtzaExIZHVHOWFxWFg3c3JX?=
 =?utf-8?B?R0EyY3BZdHR3UStKYkVFSzBpclIzdHcwQ0ZFcXBYVjJDUnJBMlpHRk1zZlFq?=
 =?utf-8?B?c3FZOHM3bFJkaFF0bjEyY3BYOFRPYzVseWRPVkpFM1RkaU5NT3ZNUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A0331E5FFD706D42BBFD2096F4A9C686@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	vIYLllyD/scU8clav4bIPN7/5S2pcDJZnLmVz3Zp7Ja2zCz1QKv88XaB+9BzkCJgmHu62/ikUL/hf5qJUyrVYSEq5lRywGAISU3FoR3I0HJ1Hm6wyMxWpjMFBoa58cdi4I4tkEuAZnlUrhfMgIoGRPCgdzKj/0/00ivOIfUFIHowVHuODoxQzP+WyKBwt86dMBOYPeCpvnk1nstJZPWVHz9ZEIPZQBHbLL6nWtAhqeNuQqsI5NOeEoy5GNed9zHEbErUMXxCO1h0b7UGW3qLpdHXlDkkZfh8jHnf8eTiPMEm3YMcLku2VnuNC7aJ9sc53vA8KEvc12l0VsT2x0wZWg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	YZ32eh3PY1Uvr8eYwPNhP8gsR6W3Enw7B+s4sys0PM/MLeo+qQo1QFZkANz5hyxfKbW8g0dOhQGLl0kjST9Oirw3XVGHKFfv2OqtjWUsehICMszOagoGmyf6npPIpkjzJvZ3FDIudFDpnFLDYXdUUUdWlVhK6p74Typi8E73legGs/EPYx3VW0FJ94uEn6FHJU11ygtLHYR7nG37vhxZdwE23/MpnIKVdHYljJh3KzOsMK3WQRuPnGe62TBmBheJJkfTDF1R/1T3LjzNmhrQvsHEla8gV96rKQphL0si1DoYSb+yXg2dl0Qzgai+zzJGfK+WOtpym9xj1BWFZ8zGaOZrKmLUlrVL9TqZROvYB9+I4uSMC04kq/BD2ct2qwArLRqOWePcQwoVlxjX/Bcc+5JeaY5jwAYwKL2ESjFovFbBkqgd24S+DfmYeclVkV0/FNy55FXs6whIJjQJtAUsAU+r5Fwhz9/MvuOZXuT3z6Yj4awJxjjQdNNfRtzZvqteUIkhAA3VeNS79gzXDkWzuNKofXUHKxzLZypqujWVipnH/2QcSSELzvsoku+BODM5YAvWdKsl6Zg0bpD7riBPXWUEDpVsMlLuTeFUz/rqA8hyXJwnqSGZNakNX7VjFoDQ0uWGM7qh7sOcXfs1FEC3uA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74013c80-b10b-496e-41e0-08df0ae45091
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2026 00:26:23.0002
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /rWH2ePP7b0vlyoVMYArTAnWrMDpDD3O2r2EXlRUzaqsmZF2JDLQk/FI12n3leqU6Xw2C/o8ozjuL2Km5BQkbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CHBPR12MB515368
X-Proofpoint-ORIG-GUID: vQ__oi_c6uhutG9oePmhfS1Sji1GZ0sq
X-Authority-Analysis: v=2.4 cv=L88theT8 c=1 sm=1 tr=0 ts=6a9b61b5 cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=-4-sGo8i1FcW4KD7_GeR:22
 a=EUspDBNiAAAA:8 a=jIQo8A4GAAAA:8 a=8rtHVNEMkMfaHrUsqE4A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: vQ__oi_c6uhutG9oePmhfS1Sji1GZ0sq
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA1MDAwMiBTYWx0ZWRfX823BQqtCoHwz
 w1/jd6dHJiD4Wx+TqnVBpctb77j0UIZwn1+DSta78gucxHwLQ24T959ZstMrffCpXv/vWF/x4dg
 egx1Z1Bi/BpMV8GGvkLG8H+Qout1NiY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA1MDAwMiBTYWx0ZWRfX4UUrJkNDmYGl
 MQY3lp5uQGBlXAxn05kmXrN7pprDtdHqQq5g7EnU9tvSeJmo0Dlkn3plwIsLIIkOU9Scj7J5vZz
 tkk9l0NHSVyX+pR5oYkraxfUN3JmIBEZ/G2xlnuDEA0lIumFo4wDBvitTVpl2GvCc9ismdfYKDn
 QdbQDnVi7Qf5bAUVOVPnvO4D/I2+ORIbB6gJ1zy4vR1LYF3dYprappntxuRaiamgH9RpMDfBSkX
 Bfz1+j6+NoYjFATqoFPllPfa2dVVZkAEj+gqwQR2P0UCbDh6r43oRTwwAjdbvNFmeU/Ntugb1Wj
 3CCwncxD0XKuzpOuvh9PhzzsdO6b/F43BnoU/SNZV+lEp0dbY8GhIOMWSwP6g6cQpbEDQpvxeZB
 dVfnrztZsHgGZcDIp5229h1cD672IqjdLwbNsv8X4Lar6WMWY3uHKJpC9pnrVeogSF7o3Z7WEIs
 zkKRyhjNmhm5JmJZfkQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_06,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 lowpriorityscore=0 adultscore=0
 clxscore=1011 malwarescore=0 spamscore=0 impostorscore=0 suspectscore=0
 phishscore=0 bulkscore=0 priorityscore=1501 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2609050002

T24gVHVlLCBTZXAgMDEsIDIwMjYsIEtvbnJhZCBEeWJjaW8gd3JvdGU6DQo+IEZyb206IEtvbnJh
ZCBEeWJjaW8gPGtvbnJhZC5keWJjaW9Ab3NzLnF1YWxjb21tLmNvbT4NCj4gDQo+IFRoZSBVU0Iz
IFR1bm5lbGluZyBTdXBwb3J0IENhcGFiaWxpdHkgKGlkeCAxOCkgZmVhdHVyZXMgYSBzaW5nbGUN
Cj4gcmVnaXN0ZXIuIEV4cG9zZSBpdCBvdmVyIGRlYnVnZnMsIGlmIHN1cHBvcnRlZCBieSB0aGUg
Y29udHJvbGxlci4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEtvbnJhZCBEeWJjaW8gPGtvbnJhZC5k
eWJjaW9Ab3NzLnF1YWxjb21tLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL3VzYi9ob3N0L3hoY2kt
ZGVidWdmcy5jICB8IDkgKysrKysrKysrDQo+ICBkcml2ZXJzL3VzYi9ob3N0L3hoY2ktZGVidWdm
cy5oICB8IDIgKysNCj4gIGRyaXZlcnMvdXNiL2hvc3QveGhjaS1leHQtY2Fwcy5oIHwgMSArDQo+
ICAzIGZpbGVzIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL3VzYi9ob3N0L3hoY2ktZGVidWdmcy5jIGIvZHJpdmVycy91c2IvaG9zdC94aGNpLWRl
YnVnZnMuYw0KPiBpbmRleCAyYWEwMWQ5OWYyM2QuLmY0YmI2NmE5ODQ1YSAxMDA2NDQNCj4gLS0t
IGEvZHJpdmVycy91c2IvaG9zdC94aGNpLWRlYnVnZnMuYw0KPiArKysgYi9kcml2ZXJzL3VzYi9o
b3N0L3hoY2ktZGVidWdmcy5jDQo+IEBAIC04Miw2ICs4MiwxMCBAQCBzdGF0aWMgY29uc3Qgc3Ry
dWN0IGRlYnVnZnNfcmVnMzIgeGhjaV9leHRjYXBfZGJjW10gPSB7DQo+ICAJZHVtcF9yZWdpc3Rl
cihFWFRDQVBfREJDX0RFVklORk8yKSwNCj4gIH07DQo+ICANCj4gK3N0YXRpYyBjb25zdCBzdHJ1
Y3QgZGVidWdmc19yZWczMiB4aGNpX2V4dGNhcF91c2IzX3R1bm5lbGluZ1tdID0gew0KPiArCWR1
bXBfcmVnaXN0ZXIoRVhUQ0FQX1VTQjNfVFVOTkVMSU5HKSwNCj4gK307DQo+ICsNCj4gIHN0YXRp
YyBzdHJ1Y3QgZGVudHJ5ICp4aGNpX2RlYnVnZnNfcm9vdDsNCj4gIA0KPiAgc3RhdGljIHN0cnVj
dCB4aGNpX3JlZ3NldCAqeGhjaV9kZWJ1Z2ZzX2FsbG9jX3JlZ3NldChzdHJ1Y3QgeGhjaV9oY2Qg
KnhoY2kpDQo+IEBAIC04MTYsNiArODIwLDExIEBAIHZvaWQgeGhjaV9kZWJ1Z2ZzX2luaXQoc3Ry
dWN0IHhoY2lfaGNkICp4aGNpKQ0KPiAgCQkJCSAgIEFSUkFZX1NJWkUoeGhjaV9leHRjYXBfZGJj
KSwNCj4gIAkJCQkgICAicmVnLWV4dC1kYmMiKTsNCj4gIA0KPiArCXhoY2lfZGVidWdmc19leHRj
YXBfcmVnc2V0KHhoY2ksIFhIQ0lfRVhUX0NBUFNfVVNCM19UVU5ORUxJTkcsDQo+ICsJCQkJICAg
eGhjaV9leHRjYXBfdXNiM190dW5uZWxpbmcsDQo+ICsJCQkJICAgQVJSQVlfU0laRSh4aGNpX2V4
dGNhcF91c2IzX3R1bm5lbGluZyksDQo+ICsJCQkJICAgInJlZy11c2IzLXR1bm5lbGluZyIpOw0K
PiArDQo+ICAJeGhjaV9kZWJ1Z2ZzX2NyZWF0ZV9yaW5nX2Rpcih4aGNpLCAmeGhjaS0+Y21kX3Jp
bmcsDQo+ICAJCQkJICAgICAiY29tbWFuZC1yaW5nIiwNCj4gIAkJCQkgICAgIHhoY2ktPmRlYnVn
ZnNfcm9vdCk7DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9ob3N0L3hoY2ktZGVidWdmcy5o
IGIvZHJpdmVycy91c2IvaG9zdC94aGNpLWRlYnVnZnMuaA0KPiBpbmRleCA3YzA3NGI0YmU4MTku
LmNhNmI3ZjJkYThlMyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy91c2IvaG9zdC94aGNpLWRlYnVn
ZnMuaA0KPiArKysgYi9kcml2ZXJzL3VzYi9ob3N0L3hoY2ktZGVidWdmcy5oDQo+IEBAIC03MCw2
ICs3MCw4IEBADQo+ICAjZGVmaW5lIFJFR19FWFRDQVBfREJDX0RFVklORk8xCQkJCTB4MzgNCj4g
ICNkZWZpbmUgUkVHX0VYVENBUF9EQkNfREVWSU5GTzIJCQkJMHgzYw0KPiAgDQo+ICsjZGVmaW5l
IFJFR19FWFRDQVBfVVNCM19UVU5ORUxJTkcJCQkweDAwDQo+ICsNCj4gICNkZWZpbmUgZHVtcF9y
ZWdpc3RlcihubSkJCQkJXA0KPiAgewkJCQkJCQlcDQo+ICAJLm5hbWUJPSBfX3N0cmluZ2lmeShu
bSksCQkJXA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvaG9zdC94aGNpLWV4dC1jYXBzLmgg
Yi9kcml2ZXJzL3VzYi9ob3N0L3hoY2ktZXh0LWNhcHMuaA0KPiBpbmRleCA2N2VjZjczMjBjNjIu
LjIyZTUzYTc1MGUyYSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy91c2IvaG9zdC94aGNpLWV4dC1j
YXBzLmgNCj4gKysrIGIvZHJpdmVycy91c2IvaG9zdC94aGNpLWV4dC1jYXBzLmgNCj4gQEAgLTQw
LDYgKzQwLDcgQEANCj4gICNkZWZpbmUgWEhDSV9FWFRfQ0FQU19ST1VURQk1DQo+ICAvKiBJRHMg
Ni05IHJlc2VydmVkICovDQo+ICAjZGVmaW5lIFhIQ0lfRVhUX0NBUFNfREVCVUcJMTANCj4gKyNk
ZWZpbmUgWEhDSV9FWFRfQ0FQU19VU0IzX1RVTk5FTElORwkxOA0KPiAgLyogVmVuZG9yIGNhcHMg
Ki8NCj4gICNkZWZpbmUgWEhDSV9FWFRfQ0FQU19WRU5ET1JfSU5URUwJMTkyDQo+ICAjZGVmaW5l
IFhIQ0lfRVhUX0NBUFNfSU5URUxfU1BSX1NIQURPVwkyMDYNCj4gDQo+IC0tIA0KPiAyLjU1LjAN
Cj4gDQoNClJldmlld2VkLWJ5OiBUaGluaCBOZ3V5ZW4gPFRoaW5oLk5ndXllbkBzeW5vcHN5cy5j
b20+DQoNClRoYW5rcywNClRoaW5o
