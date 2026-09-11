Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C14637B3F7
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 18:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789151169; cv=fail; b=qKBF5RGTmSZDEHcrbp5edqQsKtqFQkzhcbr7bRNi9b0nC6NHQnRA5BrlANvAvmq9noksd+ECfT3FMMeIWsb8OGIoSlIQqbRmdTnX/Ea8WEnxjJhcebjcS8XE+qhbVq842SuDUT2tPomFw2DYAdPEBOxH9juWd3aF3Lj8dKjKRzo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789151169; c=relaxed/simple;
	bh=v0Sjxs+9QpjxWai1P18ra99G8+RvUDhsWXFZ5/rmnT0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=r9bN4xyZxlh/KdSAHaOwmmEfxuVfbdq7iN7aWapp5WySgVdRqQgol8crMgjbqfbH4Np83h28Vlp6BAk8V9A/zhSSUH+ZBxq1zLkZAkSyhloMESprCBzpGINXU9Hwqy7nZCRPZ9lZrJSp9OFafLWpDVPHTcnaK+hiV2gcGhhTX3Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=KN4x18jF; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=qUojQ79Q; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="KN4x18jF";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="qUojQ79Q"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BHfiKR3293182;
	Fri, 11 Sep 2026 18:25:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=v0Sjxs+9QpjxWai1P18ra99G8+RvUDhsWXFZ5/rmnT0=; b=
	KN4x18jFy08vtm3THiMXzTRBc8LdoYQvEsuOOkp/13BF6x9wXxcZd4pG277jP8A7
	SN9wltZqCDb3RyznKbEwygyxinkgd35gssp1nFaWkkLMqbYNzbgD9iO9Qvb0mxDI
	t2RNWA1CFcnL1LK74y2K429vb4gPBtSvTyu7fnSwadXqEzTvAdupW3osyCdfgNsm
	bj+lfILxU/CvIfO6M7GwcpyHJpzDOQDKcTmh5lwsjVxqVfo977sCSdRk0oPZYBCS
	gMosqeBQWTAVSZ0D6513sZ7UN9yevrLrx1TxwwaJBk5xXOjv79XBGT/i6DB/Pnwm
	/EHQoG/jb7JHlYHaz4LrEw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4gkcyubfv0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 11 Sep 2026 18:25:26 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 68BIPEHQ029377;
	Fri, 11 Sep 2026 18:25:25 GMT
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011020.outbound.protection.outlook.com [40.93.194.20])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4gkck9w7am-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 11 Sep 2026 18:25:25 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kAtl9OzAhHU5O/VsabZ4xHTcgSsN//5X3A55BM+6h/9iJV15ycWB0Ck05LsFMzfj8ZcIWlnFyFqVenfZqBcW0qBzjPqjnM52YjtODUW+9gsMXtcGKptvbKa0SjGoGmbhbAlPgD/yLbshbDfYFIRzg0/6CD7wE6DwTAZx15pAj7DJoAmiZ0jN9dxtXsbOi7KYWOqcAbq85jJ7kYXGQteiJvLE2BbQj51NhYpwMnPJIDvm1LRPaFUIVtV/Uf3XRIld42FPQsZ4aqYOT+mI4rXEAsILD2HmL1vtO9Mfef7T6hmteJVkEzEN0l6uqYcoKQGdRjCChtutsotOWoxrcLWEAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v0Sjxs+9QpjxWai1P18ra99G8+RvUDhsWXFZ5/rmnT0=;
 b=jcHXWqPumSxR3CxiHqCpA3cmxD0LvwavDN1uzkt644pFLlM+1S1hOPET/lXM3mZL8aw/zK3GUJC3EtzH2AFoeFJ2cJUVCaFFZDE5uEK5Hi/mrme0R77d/FSgKUf2bV2ehIf7ep8/HCOw2110MZhvTZa1P6dAn9pv9af8aLmqaac+lWfcaqwiTOg1qTIX5nuTcwZTZ0vcNTcaaQogtpCAPAyrOYXiFciZMP/mkcTgoPFy505iQlX/3p4N3hlB53Q1b2W3i3+LOC/FMOOSrdMEw/rfacqnk/n1eLfDFpUNwJslOQrGMBXAp62Kq8Xr2Fv7R2bAP23uhfdtW4uwnfjIjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v0Sjxs+9QpjxWai1P18ra99G8+RvUDhsWXFZ5/rmnT0=;
 b=qUojQ79Q6Ujzpwx4nE0u7Lc1v8LY8Q4MWldoxuh3NAj2rbdVRgcnWCAmYleqPnwTjTJK0nIjbRX9C1NGNiLdLe7xhYK49Z9jYEgkJwGfQoS1OgMPu4mjCWzaATnvFzubMMdYJeHd83EL81rzUxUgfTief/FDkIHzFNBwtLNSXx0=
Received: from CY8PR10MB6708.namprd10.prod.outlook.com (2603:10b6:930:94::7)
 by SN4PR10MB998046.namprd10.prod.outlook.com (2603:10b6:806:1ef::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Fri, 11 Sep
 2026 18:25:09 +0000
Received: from CY8PR10MB6708.namprd10.prod.outlook.com
 ([fe80::2f56:a3e2:8667:417d]) by CY8PR10MB6708.namprd10.prod.outlook.com
 ([fe80::2f56:a3e2:8667:417d%6]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 18:25:08 +0000
From: Aruna Ramakrishna <aruna.ramakrishna@oracle.com>
To: John Ogness <john.ogness@linutronix.de>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "pmladek@suse.com" <pmladek@suse.com>,
        "rostedt@goodmis.org"
	<rostedt@goodmis.org>,
        "senozhatsky@chromium.org" <senozhatsky@chromium.org>
Subject: Re: [PATCH 0/1] printk: Yield console_sem to blocking waiters
Thread-Topic: [PATCH 0/1] printk: Yield console_sem to blocking waiters
Thread-Index: AQHdQcTLMKEPEmf2MkOwwBQgVD8QvLbJsiiA
Date: Fri, 11 Sep 2026 18:25:08 +0000
Message-ID: <44239E18-2EE0-4451-9481-EC4283473AF0@oracle.com>
References: <20260910203331.4139656-1-aruna.ramakrishna@oracle.com>
 <87zexocir6.fsf@jogness.linutronix.de>
In-Reply-To: <87zexocir6.fsf@jogness.linutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.700.51.1.1)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR10MB6708:EE_|SN4PR10MB998046:EE_
x-ms-office365-filtering-correlation-id: e078bb56-162c-4290-e06a-08df10320258
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|18002099003|22082099003|38070700021|10067099003|56012099006|4143699003;
x-microsoft-antispam-message-info:
 lLzqcOtJPsYyUYbk9Ee1XVfuovpEk94jxFTFuyiWaJ02bP0LitvvvpAjxEVSBQPoI+95XJN3+74ZsmpXN25YfmAgNeVq82PAZFE1UK0GvpLHqN5iyIUiFc9YhLeAI6fcMM8o9anNs8H+80OlDDdTeoNXJz3pLl3TNmTppZ2l1ScZkMYb7C9gBo53FFv61qge+Xq0f6re4sUpfWGYSm829abdL6XtPuP9hoTPV2R0fOCbSC9VyaIXzPH1WqBIM+Btpt90rJn/tgJemQ2GFWtXUZ4GoiyQijGyQ/Vy3NGVjbUBjOVusIolsbrwUQRVEHK8OnS0tT5AvF+7tRK0ZLftRSuPVL4rWfsmXWtcxvcS9eyaGvSJH3Oz+UTctNtS+NJGOk39bMHXisRy+fElUkkbUPRDXQ6IInjS/q899du36ML4cj0E4681iD7GLhKaP+8zT+KxtV14qdd10DIfa45GuzA8L0glGm4L7ao+rIfs59CdIEuHQnfY5cH7hSxvWndbFEdYoVHnMI/A//xdChrZTLeIywHSHAeRKEf9Y20d3SHgUEfG0ApuQciamdp4/xoJtlybGlM8XDGBIQPOx4ZRBf40FDJzdtGzmnWUtM4ssydSULSTERYjvbFPzARgz+baV9CQyvFbfh7uhgk1wESG/RUFJtu3CQNFVmO49KyaU9wzrnPrO6mznHy5BHkKe2SUw0dAZ0KHVKAKHaz3FqWiKxqVV18usHONaOXBS74EqWU=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR10MB6708.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(18002099003)(22082099003)(38070700021)(10067099003)(56012099006)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?S3Q4blNIdy9KMElSMGR6bDI2dVlsQ1hVY2ZyTldwVlRQdGVxckhMM1ByVTRr?=
 =?utf-8?B?MnBxZVpCU3pmOVlqQzdPN0hwY3dwVXBlc0RibVFFUk92czRmUXdpWE8rMGIy?=
 =?utf-8?B?MC80R0MxbFJBRVVKYW9PNXg5b2tIWUUwUlArQjFVb0s4Q24zNXZqUnhkZ1Z5?=
 =?utf-8?B?ZUY2b2NLQ09aUXlDZGg1dEpGYUM5QVFPTU0rT1hYdXJITVVvNVZrL28rOXZj?=
 =?utf-8?B?UW80c01TWW1ZT280MlhiRmw3ME9Hc1gra1NRYXJGb0tRMW5lQXFLS0ZkODlx?=
 =?utf-8?B?YUJ5SVowV1g2WGpLVjNPRng2anpsNG9xaC9NQWxlZ3ZZeGplcWlRTkw4RmQx?=
 =?utf-8?B?dUllN253aDhBV1RwVlVFRUtkOTFEMDg4UG1kQkE2dHlzMVphNXdWb292dHZS?=
 =?utf-8?B?bHd3dDI1WVdvWklnM25KcVB2dkEweDQrY2preE5yNW5qMFJnUGhBZVVrcjRz?=
 =?utf-8?B?YXhySkROMWtvYklsV1RTWjBNcEtSQU1DOFhTWFJCLzN6Sy9ibzR1c0JxVkwv?=
 =?utf-8?B?NlNlT1hQTE5NUnNZVUovSmJIWUQwaCs5emdxQ0hnT1F4dVV6RHlGUytVMzJq?=
 =?utf-8?B?b1FpK0UwV29ZVHBrTDBCbXdlZ0xDM2xIMGY4SkFJQzAvcVV6TU9KSnFOazNx?=
 =?utf-8?B?d3AzUU9lZjlhTjlVK3Ircjczay82aTBJV1RkM0xDZm9ScEFkaThhZE1oSDlP?=
 =?utf-8?B?elJ0L0hXeTFNQ3g5L2pjMmE2aGQ2N1l0c3hWbFFJdHF2ZU9TdDRBbmFTMVlJ?=
 =?utf-8?B?NS9zcE1SK3Fkam5YZHJudng4RTQ0QnFQWGhCT2pFOS9OWHJPTHcwRERZUzhS?=
 =?utf-8?B?OFgxN2pXN1FYY3hYUVlOWXZsbXM3UUtPc0VnMzR3MGxJSmNobm1RRzMvcjFF?=
 =?utf-8?B?MU9wR0RJc2VCRkhwMXdhekM5VWRtOWxEak5NQ2w2SGpsblBCOVNHY0szc2VN?=
 =?utf-8?B?cE1BdTlWK1c0ZUFraGoxTVZDKzFvby9jUG81RnkxZjBFS3U5cUhjQkFPQmJ0?=
 =?utf-8?B?LzFLQVJESHVhVmNMdmtnYi92OHZvZnlMY3pPM2dCWXpFS0dIL0ovT21vTTJm?=
 =?utf-8?B?ajA3VU9ZTDNpSS80V1FhTWN0SVplMmc0UDJoejZkdlZqbkY2bmJvZFowVTRw?=
 =?utf-8?B?MVMxZDIvaUZKNkhVREVqblJoSXhMUlQ5THR0dHY3cjE0NFRIcHFYQzhORGFD?=
 =?utf-8?B?czYzN3g3UzRSd2ZOMTlHZ1lwamQwRi8vZGVRcjhiSmIrNFNBSGJRWmxFc3BZ?=
 =?utf-8?B?Q0pVTjZTc3dqRUJUQmJxbmp1OElxMXVhb0VtczkxcE1ESXhXZ25QdUNyb3RT?=
 =?utf-8?B?Q3RHc1ZHb3ArZC85ZXdkRkg3KzNEbjNoQlZvUE5hOGNUNnRqQ3hRdThpV3VB?=
 =?utf-8?B?YXpCYTE3OFhNRTJVSDYrRFROSEkrN25iVVk2T0t0bTUvNENnSmpMZUtyMW1E?=
 =?utf-8?B?bWJMVnJXek91NjlzMjQxS0N2U3ZMdjJDTENJc3VYeVBIMmJWMjVwSUF2cExz?=
 =?utf-8?B?bTQxRVFIQmg2bURSRUhQQ2UwVm83Qkc1ZHNIeVkwTXhoZFcyNXMyb2lMUDRa?=
 =?utf-8?B?Sm1MeUZJN3M2cjJuOWFyOTRnSnNPd2JQa1VTV040V2xialM2T3hnV2VyN3Q5?=
 =?utf-8?B?NjdteW9VWDJ4elpIR0dZRGJ5SlMzRVcvdGxKUDBDZU4zSElYVXp4OVdCd0NJ?=
 =?utf-8?B?YXNhWDVMYVdGYXlGbkJCdnVkdlRQTnEwZVFSRnVXWkRRUjlTQTVDSkJGRDha?=
 =?utf-8?B?M0NJckt0N2V6WTNJaFU2a1psOW9VMlIzYjBFUDc2YXF0UTFsZ3Q5bDlWT2E5?=
 =?utf-8?B?dDBURGNkbStRbnlHK3A0QllsZkZINms0ZlNmYXFhMXZnRm40d2h1dUZoeWxO?=
 =?utf-8?B?V0I5bUVxY0ZZQURNeW00clZsbnBLdmx5dE1Lb2dIRFowb2IwOTRBUXpJQmFs?=
 =?utf-8?B?Yy9NT3N6dGpEYUN1L1Bia2dqN2tQZUZTcGxmV3lJNC9sdURtSVFRSnFFQVN6?=
 =?utf-8?B?YW5seEQ0cnRiQUxmUGtSbGNLK0RFVVJDbE14TWN0a25iVTdhTmxMcldOSXNE?=
 =?utf-8?B?MTQ1RjRQMmtDRklZdzNOOXdSOW9WNEVZaVdEbGI2dGFEVHdSanVLclNWMnB5?=
 =?utf-8?B?Q3F1TDBOeUFuNHdwai96TEpWMGNWKzN2cW1lWnJjS0RUYmZvc0swOVlKZ0FS?=
 =?utf-8?B?cU4yamNxeWNzMytUTXErRGttTEZXVEptTnlxVVhoTUl3emNnMWwycm9ZV0VT?=
 =?utf-8?B?ZTd4cTIwbzlYVDFWdVRjbno3WDZ1eUpDVWRBbjlxS1RxdWorSW9JS2ZQQkZa?=
 =?utf-8?B?OE1ickxVNXc3ZWtSTlhwOCtuYlRRbjVTck5UTlN1TVdKOXYzS1VIditQVjVM?=
 =?utf-8?Q?/TyTJEQvGt1UH78E=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <22574B50BD7CEF4EA5055A17F126D3F6@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	ITrEtuCZXgHJqAvJYnCYHM9Q45XtyeQd+5nF5gKbxR8rSL0d8UpjBtpmJgTIjvyoM9xcbWkC0DRh10yBw5UrWZK9y3+KBm1r4Zn2TD6BNNomDyMhqSMekUW8lzh3fztljdamdGLEIfDQuIHwnc1UuVwoiY9PES6Tcjv6qhYzEgWHZ3ZdOGqhzPwuguSSY5iC0YvkJHdxoq2qmHj6I6gZpqD3jGas/pgnbLGxVhX2H7w3pgYzSD6xSFy5PKmER+qdEpujPz8uFDyvPe2B+bgVSSyPt/OgY2sTYbHrBqE7JobwsMMxRnsarHZtGpfnGSz3g8Jc5evJeUUIzyDGPffqFg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	04Cn90t1dN7PyP2xoutU3xW7nAkh2yhbLicW02KNMc9c0vmRCVy8nF5gT4gZtsyfwhXrqzpVH2s1gg8nFcZNjz3CFhpPfsIeFJH0nW6ffB6EctQykMSYAv54V2GWvaTWHZRiYJxwrBHsXkJmdRKdRi+celh18hCn2rzCFGF5WiZF9uaPxdlB3iR1rRugBySA9nE3AjypOk+8g1+qQKId5KHcJZ76oHsw6esYtw/9w1b06MtIi2XFmIVdqKG7qSwSnqMKC9Zwwzcn2McFhw7bTX9b4clsuKEULvsW2B0yR79Sg/+DqZND2pWjjo1TgbqAdi68k8O0deGoTtYHxDSqNrOlxNY0wTNKSAalNv7Uemm2h/MAg7UoyDoLsQH1xzCkkrVuZbqa/g3ksh0Xs+0cgj+efb+2p996gLkrGkwoCRJ+SaQQ6evIwH+9hjmlNfo4YT1Z1Mg6G0GDDLxaXS8X8TNuOmLPYMvFhfTHKijsZPl+n/sTrtlXduBdWoCQXuAXI2XkhOyjbAWlunXFtj/6eXjcCgapwZlvY7BLjD3mo2WsOF7kq0OA5GnDrX6/ZDZFVxrq2JmJxhyUqvpKsGJtr1oNUbodiofSVc7ZtvMfhds=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR10MB6708.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e078bb56-162c-4290-e06a-08df10320258
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2026 18:25:08.3447
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SdWkJH7q25q4K1ZzdO/Z0Pa2zbE2j9O7S5mlyzSUvoP+sqM/lLCZpsb6beajR40sTJXH/U2f3Uf8AYWvZcCBGhPfCQYqnRRsKvW+eUzZkMA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR10MB998046
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_06,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 phishscore=0 spamscore=0 mlxlogscore=999 malwarescore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2609040000 definitions=main-2609110258
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDI1OCBTYWx0ZWRfX674wuqkr03cT
 5EiFNjZsgGicA0k9CjpB+HX73cS6wzX+qLJunuAl5udadOW5JimnnQnKds1CqQ8UzV5bn0w/6pE
 YG42RnNVD6mj8TJziw5f4dMHtsUqFjyvMt+leLH0Ca6ZOW9B1Ucexs5fVkWhfEwrFDSuQ6q8hyN
 hQ8oJwV8qqc0ggW786DvT/B4jKpOL1OQj+7gnS4b+vIKE2M20DrR70wd81GnQ6+hdU7R543fELe
 H9iTpnoz6fVbtZbzbTdPxFViXDtch+ZY7jQvYXGjGCkC2hovxE1qqRnUe0IcKmgwhDQVi01QTES
 /HiPYg0f+PsSuVgHmZI7W7oo5xrHYmkRX+65mPdcN0ivdcXt4ln2DHE5auiHQoG8chj8iSXGW+/
 tEA8zCkwgMtIVeSJyMsnBbw+7+rocFwHh72UHfJpF0s5J+DPvtrxJLQfpf7l6kBWoi+JwKuIXx9
 ceobIdw90okhWssS8ag==
X-Proofpoint-GUID: EvYLfR9_mU7SdAZKyJXZTV9P4jHfpXix
X-Proofpoint-ORIG-GUID: EvYLfR9_mU7SdAZKyJXZTV9P4jHfpXix
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDI1OCBTYWx0ZWRfX+6gEAKGavS5X
 mWaLTV29fqsxkKNvFtQ9vdCI78ZWJLw8b2EgULwT1zoI1ZTuxxS5V9qnzIDxbFra6zPKN/7E6gH
 EGmdl1zdIuOUW4/034hZBjz5EeMXvXhCVLROGxbm6x+LzbW4VDky
X-Authority-Analysis: v=2.4 cv=GPSdgeNK c=1 sm=1 tr=0 ts=6aa44796 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=GoEa3M9JfhUA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22 a=RD47p0oAkeU5bO7t-o6f:22
 a=yPCof4ZbAAAA:8 a=0jd9SufgFHOoxhxJDegA:9 a=QEXdDO2ut3YA:10

DQo+IE9uIFNlcCAxMSwgMjAyNiwgYXQgMTowOOKAr0FNLCBKb2huIE9nbmVzcyA8am9obi5vZ25l
c3NAbGludXRyb25peC5kZT4gd3JvdGU6DQo+IA0KPiBUaGlzIE1lc3NhZ2UgSXMgRnJvbSBhbiBF
eHRlcm5hbCBTZW5kZXINCj4gVGhpcyBtZXNzYWdlIGNhbWUgZnJvbSBvdXRzaWRlIHlvdXIgb3Jn
YW5pemF0aW9uLg0KPiBSZXBvcnQgU3VzcGljaW91cw0KPiBPbiAyMDI2LTA5LTEwLCBBcnVuYSBS
YW1ha3Jpc2huYSA8YXJ1bmEucmFtYWtyaXNobmFAb3JhY2xlLmNvbT4gd3JvdGU6DQo+ID4gUHJv
YmxlbSBjb250ZXh0Og0KPiA+DQo+ID4gQWZ0ZXIgYSByZWJvb3QsIE5ldHdvcmtNYW5hZ2VyIGZh
aWxlZCB0byBicmluZyB1cCBpbnRlcmZhY2VzIGJlY2F1c2UNCj4gPiBzeXN0ZW1kIHdhcyBzdGFs
bGVkLCBkdWUgdG8gYSBmbG9vZCBvZiBwcmludGsgd2FybmluZ3MuDQo+IA0KPiBOb3RlIHRoYXQg
a2VybmVsIHdhcm5pbmdzIGFyZSBjb25zaWRlcmVkIHNlcmlvdXMgYW5kIHdpbGwgcHV0IHRoZSBD
UFUNCj4gaW50byBlbWVyZ2VuY3kgc3RhdGUuDQoNCkkgYXBvbG9naXplIC0gSSBtaXNzcG9rZS4g
VGhlc2Ugd2VyZSBub3QgS0VSTl9XQVJOcywgcmF0aGVyIEtFUk5fSU5GT3MNCmJlaW5nIHVzZWQg
YnkgUkRTIHRvIHdhcm4gb2YgY29ubmVjdGlvbiBmYWlsdXJlcyBldGMuIEEgZmxvb2Qgb2YgdGhl
c2UgY2F1c2VkDQp0aGUgY29uc29sZV9sb2NrIHN0YXJ2YXRpb24uDQoNCj4gDQo+ID4gU3lzdGVt
ZCB3YXMNCj4gPiBibG9ja2VkIHdhaXRpbmcgb24gdGhlIGNvbnNvbGUgbG9jayBmb3Igb3ZlciAx
MjIgc2Vjb25kczoNCj4gDQo+IEFsc28gbm90ZSB0aGF0IHRoZSBjb25zb2xlIGxvY2sgaXMgcmVs
YXRlZCB0byBsZWdhY3kgY29uc29sZXMuIFJhdGhlcg0KPiB0aGFuIHRyeWluZyB0byBtYWtlIHRo
ZSBsZWdhY3kgY29uc29sZSB0cmFpbndyZWNrIG1vcmUgcmVsaWFibGUgYW5kDQo+IG5vbi1pbnRl
cmZlcmluZywgZWZmb3J0cyBzaG91bGQgYmUgc3BlbnQgY29udmVydGluZyBsZWdhY3kgY29uc29s
ZXMgdG8NCj4gTkJDT04uDQo+IA0KPiBXaGF0IGNvbnNvbGUgZHJpdmVyIGFyZSB5b3UgdXNpbmc/
DQo+IA0KPiBGb3IgdjcuMyB0aGUgODI1MCBkcml2ZXIgd2lsbCBiZSBOQkNPTi4NCj4gDQo+IEpv
aG4NCj4gDQoNClRoaXMgaXMgZm9yIHRoZSBsZWdhY3kgODI1MCBzZXJpYWwgY29uc29sZS4NCg0K
VGhhbmtzLA0KQXJ1bmENCg0K
