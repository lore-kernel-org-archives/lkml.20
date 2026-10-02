Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AB8B361DD0;
	Fri,  2 Oct 2026 21:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790976482; cv=fail; b=ClYnxypa1sJnFIvdXrJvauqXxMChbWalbN1RpbqI52LSXnHFAUBB0yJmYSCy+eXoV/UzkxWxlNL3OR4woqk3223nk5K5mJoO7TzviRTg0C805dCcqUByEBJOv07cSntolk7BBWHXtmjktvmfImTfCido81LV8v1lCiQG/rGp5C4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790976482; c=relaxed/simple;
	bh=j701RY+CvWEKj+Th79nHfwi4EKPNGYRhfGOZPAyS6CI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=QInvhBSO3Oof+StUcp2PVaaKFYlOzWswtr85MEg8C5K8yoiYcT6UBZwYEGE3RtXh7E+NG+nr1WIJujThfJKwW51zpWQEJREhPlXClHRjeBajCowUi7A1SQsZ8X8tWvMuQRU1ILdG2s4D6bXr5QOWBy6SlYkq3MbhfnSgsvGtw4U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=EQMB6QSn; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Hw6ArkxF; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=TxgV+qka reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="EQMB6QSn";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Hw6ArkxF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="TxgV+qka"
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692L8XHs710613;
	Fri, 2 Oct 2026 14:27:48 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=j701RY+CvWEKj+Th79nHfwi4EKPNGYRhfGOZPAyS6CI=; b=
	EQMB6QSnwPiKI2Bl+5CNd3Q7Vf/rde44qfDaLinEZx8DfyHCYOrnllIP6Ia5U983
	0gZPGEiOrNRMppRx3ZMw6vTH0Ea2UJC1VQRw16Ua4r/2Cg5/vo3n2MlBYtZbfL6Q
	tMu2qO15tmUUKewP22A4+C/LAjzjG5//DiiFqjPBmGaHBvlJMxtfF/X/pvNmuVz0
	6ddSnZjmIPN1XAojRyvVSC9+1qBw8TNU8eIpc/3mrHi+XXwp2dW6AGXt0z9dP5Md
	ivbi8Db7m/Z15xZlymT83jiWPEEa2fjk3D0TWMrr20DKmwR00Vqv0/z0lnFdN6AP
	xTFHwCb5hXUIhXnbvcMicA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 4h28qymuck-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 02 Oct 2026 14:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1790976467; bh=j701RY+CvWEKj+Th79nHfwi4EKPNGYRhfGOZPAyS6CI=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=Hw6ArkxFAy7sF+fBDFDyFctnf6zR/FKP22QMxmwjiHfpSLVGE8srNzqLuZFJo1+jg
	 9EPy2sWhLF+IesIDbyMaSBCN0qdvdBAyMWReSTWyZG0ullSSLRPic/JrzBzVF6TIaW
	 5lzUrL0ErmqFalqcgmz1oJeg1UoWXMs9ggs6i7NbAjvrvkySbkXOYih2d4r5QV4Pte
	 gCM39DnfsE5XXVbCR8v0KK9kw1IwdZiUmvEsS97SVN7B7TWjdXbOeMXak/k8N858pS
	 2Ea/TQtPKV8075t23u6NzGDjpDrcPGjUZnYA7eGmn7w2uhSXkDY7nBuApKWu2EnM7f
	 emknbMNtbkD+Q==
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 5D559404F0;
	Fri,  2 Oct 2026 21:27:45 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id DE634A08EC;
	Fri,  2 Oct 2026 21:27:44 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=TxgV+qka;
	dkim-atps=neutral
Received: from SJ0PR08CU001.outbound.protection.outlook.com (mail-sj0pr08cu00103.outbound.protection.outlook.com [40.93.1.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 51EF140235;
	Fri,  2 Oct 2026 21:27:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k7a48EVVnEhnoDmc9YXX4K3ofU6gzLxOP6ty+mp7o5PDBfX0562SwKd5u5g2k/3CFmCIAMnTxQCrn3wqNE1OLqzqRAUh+MPec4/mCgQRcq0ozIRB8Kl1aFrL1NAevSRgFdyZ1Ae0Mr8nOyANQ2kulzgDjcIJgc4yA3EuARhtXKRc4TvjMRgNm1TPrCVeCSuq0kq+DNpCk1xgLq4vF8yyDubrJ4CWV/17G0MEYCoTl3Mx0TpQfxVdt7PH0SLooqucmSvtYnThXF56yPq9OjZ6BQUpFNSKEEJqdQmylE2prgJBPVUWqkm3x2BGLHp+1tlXNHMXwV/RAEhKza2vFf5O3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j701RY+CvWEKj+Th79nHfwi4EKPNGYRhfGOZPAyS6CI=;
 b=C7kI9KQONO9ajo7Qdb6GiUbli6g49Wct8QepjtlZCXbLuAY6gzQxYlFgnHIcJnd3IPxLlyBjh/zv6BlX8HHpsMQMGIhaojT3KoItthfxKuEXWe1VubKznOLLPPGU5D0y4JUJ37RUn1lEIWom/ZbgIBnuMcNjgGvaI0Zp7LvSW4Rjwvo6gVbMaVFL1yXP/a2rMq0LZsZs3zcM06oN9puFXguJ3mz/Zi7RpXaG2PrOD/lK2vkrM5VAxmGfYkt85p/PWADw6xoJzIdIqafCIT7S7Rx3LpGQg2JVn7c0/2OrTLBiAufFmCe6HDRPkwvG9UT7AbyUgv8vNohF92xMOnySGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j701RY+CvWEKj+Th79nHfwi4EKPNGYRhfGOZPAyS6CI=;
 b=TxgV+qka3wFbIlLKHdol1euEdI9Rroxj155kRS86SQBR8oiqtj7DO4qfPvYR4HdBgbo8AIgcCHM16OGwroBSqqVdjjU764i0oPD5UwRyKC8qe7OFMgILeavi9wXiw3T7IsFZKnEAxHDZ8XnsWayhXiXzIG/pFWDQGr5D2xuEGHk=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by DM6PR12MB4482.namprd12.prod.outlook.com (2603:10b6:5:2a8::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Fri, 2 Oct
 2026 21:27:39 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%6]) with mapi id 15.21.0472.016; Fri, 2 Oct 2026
 21:27:39 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "michal.simek@amd.com" <michal.simek@amd.com>,
        "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 0/3] usb: dwc3: xilinx: error path and teardown fixes
Thread-Topic: [PATCH v3 0/3] usb: dwc3: xilinx: error path and teardown fixes
Thread-Index: AQHdT0EPhBhDwEnqjU+ZcFqJhC2z1LbqyvYA
Date: Fri, 2 Oct 2026 21:27:39 +0000
Message-ID: <asAhNsmiBunddm-W@vbox>
References: <20260928120015.3152461-1-radhey.shyam.pandey@amd.com>
In-Reply-To: <20260928120015.3152461-1-radhey.shyam.pandey@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|DM6PR12MB4482:EE_
x-ms-office365-filtering-correlation-id: 02c67e97-3117-495b-49af-08df20cbfc62
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|38070700021|11063799006|5023799004|56012099006|22082099003|18002099003|6133799003|10067099003|4133799003;
x-microsoft-antispam-message-info:
 OM7L6vl0YkRb4Q6JJZiIBoMz+6DlR3CKocmmYV4Qj78moQdeqi+H8Qa0QXa8kdWvVn+QQaS9Wk+UMeLtUKrj11QQxaGKQIqhMXvxlp3Cu9y+Lja/AZUqWN4bEtidwhd1DSw4fmPcU1+pwyE0/Sd+E8bUua+8uspSoxvTovFpzxjedrYa7bfKT+RyP/D0NBXoQB4PRJeYz0Z66pc6cUi8ulz/hIpNiiFtaIk7bLDKUA5HypgJfRpga3cB38pCMKeb3p0sgyUScvh3BCZFgKqVnmXRXogWkPpwb3bfFBOIaQfto3nemLwPIrp4Ys00P9xh+P9GAyTBmAZEq+Zjsz6vus59Do3QSxiyQD/E1qqjiZv89Y80YuiZpjJ0ESejEE8gk+CrzC9+EQu+xT4wWXO9kCnRjbVHXUWRKXo8VDGJiEueGgPU8O8hnd7NlTa4ZyIckduqguGrdgdhWMB400YtF9sxKwSaloB4ygwcnd2r7iKY4z7aAi1MrtlJpzogAT4ff5cYo9OiirEVBAIUYia7ubMWktuy2ICcbXrku/gE57vbo+ko3H4uKONz8MXxGBuMc6bs7ArK/Hq869LIxc6WtOjKfT8Tb/TMQRuxHDmrYxd5KxNqU2BjaZbOhRdZMOsEEJy+rclfDsk5+72KiDV/UsGa1g1LbHbdmVlL//N7DilKPUEtb0vBi4E60bxSF9YshBrAvM1Apb+sMoIdLyvXFeyFZLDGcetjbgin+mu/FRM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(38070700021)(11063799006)(5023799004)(56012099006)(22082099003)(18002099003)(6133799003)(10067099003)(4133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?V1RXVldpZXFWbUMxT2ZLbHc0c3F3VTBnMWJSZmJkNVNWUTg5U1pNSDlNbTFi?=
 =?utf-8?B?eERSOU5zejVUUklwbDkxTDE4UU1GOEliaGJMRGVUMUM2M2xjTXdqaFoyWGRP?=
 =?utf-8?B?M1lYUUlnRWZXRnF2SHRGU3FIakQ0amlFaDdublRuYUdtdzluN1FLV2ZnMktl?=
 =?utf-8?B?ZHh5UldraFMwME51cGl4SCt3UU9TQ3BPZEhPaHpJUytwSWxldTNERFExS1d2?=
 =?utf-8?B?T2xvZjlTODdpSFBlNnhlWUJESGlDcnR0WmR4ZjRDTU5nZUp0ejR3bnpaaExS?=
 =?utf-8?B?WERiUDF6bm9wUDlxbTE4Y0x6RXpHUGxXZ3J1LzlOK3NRY0Z2NGp4OERWZHdV?=
 =?utf-8?B?cDdwM0xGdWxucVZiZGk5UDNJM0ZFc1JrRlYxR2hSVjdha01ZZmZPYm5jYy9P?=
 =?utf-8?B?QlVCa3VKcEkySkx4V1NuTXlJb1hyVHh2MldMRi9PY0N5YmpHTXUvZHFWSlZ2?=
 =?utf-8?B?TTV1RGxRRk81RTRYUWd3ZWc0Rkg1eGZ6SVczVjJJMTJZMW8vTmdwdGtBZXJV?=
 =?utf-8?B?Ri9kMVJmRCtORWsxSEJ5U0pUQjR1MTJjUGxhRzUyRGV3S1ZGY1ppdzFwQWpx?=
 =?utf-8?B?aGErcDB3ZHBMV1cvQ0VYZnBQUTVtb3ArTHdaejl3T0lJK0VyVzJpRWR2bW5p?=
 =?utf-8?B?MUljZ3dFbGxGRisxRGhpdldDWnRRUXRyenJ4VmI5eWhEc2RrU0NoSDRlblFl?=
 =?utf-8?B?WXh6dCtqMU41UlVFN3ZwR0hqUXpNTVZrNjVaZ3dyZGdXcGt3MUI3dlI0NnVq?=
 =?utf-8?B?dHNVZE1YL3VEWm1aMXIyaWVKL2g5dTlEdWQyMWlSWWk1WVFsZko0bytaQjBU?=
 =?utf-8?B?S25LT2tlOHc3NUtGZWdDTHZYWTRiWU9HY0oyNERPT2Z1ZHRmOHArUHBFYWlX?=
 =?utf-8?B?d1hyQS9WS1o4YXNlR3E2azRpVWhTMUk5WWcrM0Mvd2dHeEpsZ3RQNkxyZXFN?=
 =?utf-8?B?dENiMndBamxON3JMYUFCT3FvK3BFWUdyTkVyR1RENk9lWXFPVlRZZTgyRGFC?=
 =?utf-8?B?MktRRXBSVnFpL1phTjVRUUJXdW44NlFKODlnUm1yT1RZU3dPNFVXQUkzN2ZQ?=
 =?utf-8?B?R1BCNEFZblJESENScHFBeWJCcTBOTjN0allTNVR0ZldoSnp0LzJyOFpUeU9Y?=
 =?utf-8?B?dzZZcExEK3g4bjhHS2w1K1htSjBGcE80U2ZXZ3VWVkdzN0xqd21KRm9RVTRn?=
 =?utf-8?B?NVhaT2V1T200U3RXR2hRL1VpQ25Idk9yc2tJSkdRS1d2d1JvM29mU1pIVDRL?=
 =?utf-8?B?TzJhVFNXVkJxbUxlRjFvVzVCZGRnK2dCTG5Fd3YrL1lFMzg0aFpqckJ6RWQ2?=
 =?utf-8?B?OSs0enZ5UVI2aFBpMTlTZmZwK29rMW5kNFlXZ0tiS3JlZzNvNWd2REdBZ2x0?=
 =?utf-8?B?TXVYWmo1cU9GODdzNVF1OGd5T05NNEtyR0VGY2ZUZFJuaFlhWEViMHJiQ05U?=
 =?utf-8?B?TlpuWm5oeDVhT25KNG5tYXlQd2xOUnpOOTFEWXR1Q1k1OS8vWUxBWjdrOW9L?=
 =?utf-8?B?YVEwOFg3TTl6RkpsWmpGd0gvRGhxaGQrL1FCM3VjT0l6VGNMY1ZSTEgrL2dN?=
 =?utf-8?B?Z0Vjdkt1YldtWG91dFArODRyMFJKM25wV2FUMXZCaWp1akVHbVlHNzRPWlN5?=
 =?utf-8?B?SnYzWDMvWDNSc2F3V2dQUEFnZ2RQYldJOENoUXU4ZVIyci9DRjFENVdJNk1S?=
 =?utf-8?B?eW43a3ExdjhuRXFPM0g2NTl3L3V5U2lJQ1gyaCtuVXlwWUdSYnRlYm5nWnJO?=
 =?utf-8?B?aC9mNE1oR3g5VGNJbXRHMGJ2eHc4Um9pLzVoTTM2UkVUdVVyL0tGdXdtb1Qr?=
 =?utf-8?B?MWM0UDBGNjhkMmhZbzBaTzlSVnRlei9wN0RJcnVRT1cvd0o3dHVGNGxob2Zz?=
 =?utf-8?B?TGpTZ3grb2R1YVB6S3J3aEpjZ2tLNUxZTy9sMkdDMGNROXZEWGNSKzVlMldO?=
 =?utf-8?B?aG9hRElWYnp5VjBzd3B5RTBJWjR2Y2tmT0UrNjlKdVd4REJvU2dZSkdkWW1Q?=
 =?utf-8?B?TW4walR3RHo2NXRpZ1VSRDhOOWxTMG1PdVJxSUFvdm5ua2dnUVJDeUFaQWdB?=
 =?utf-8?B?dWI0Vm1ON1NRUWxjU2l5bUxMUWswUWR1bzBwbG1rRjd0d0NLZUxYZlgwbzVq?=
 =?utf-8?B?TzJNNlN2c05aaUpvSkx5b1FCYTViTWJ5NEpEa1N1L2RLWjBkK1R4WldUb0pK?=
 =?utf-8?B?Wmt1M1hrbkEwcWg4dExlTCtUTjc4TWViQStLRzFvR2QwTndQRzQ1d3dsR1A0?=
 =?utf-8?B?UGt4UjhVVVdpRzNSNnVQK29wZ09FSS93MkVQbG9haWRudUIzaUx3RkxINGh2?=
 =?utf-8?B?VWovRjVnamZreFgxT2Q0bmlncW44TVFQRVJZRll4RnBjYmpjcWVVUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4672754C2396C2418851036A02A57F2E@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	O/zy+zVZeG0Ra3c/rEILo9JIxvzd/NWjx+xWoP6hvUzR2dZiB0Yny1+GTn6HgsAdTlYjIwp4kLceUAfrIM1aTo4eb8HBhAfWNSHH+kYTo0+eEXWAydTtJ0gsWu2hMdq+IHDPQ9CiG9Cvv3hbCIUX7kE0OLhDEhODuZWXF/NQbj1dkq8ddg5a7eFZjLVklHOtM3ddShLFJJilSYWeZn/V41ajpDHsnvZkyo1ZGffEoSUjd34pmZdF4nYDt/v2UxOeurAOBLwtC8vvE5uDgMumAC3HH0BmsbAHqeixr2GuEeOYs19zzP9qFOUjGt/jgXye0osvGR5L2PCxP5WrYt9ANg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ruCI2kxUKJAfshtlmXOCHjOKNzZQ9ftxkWOzrtLLNTtuZdTMEmk969JsiVOyMDRE9VIQ7rTv+SAyaSPq1HwRIDn/ovFmJAv5BMbXLB0lMNIcRzMKU2WZloq0U4bEAzJX7famIbqkoqQjoGJG4sMb3oTRFawA92qKBl63LXEo0C4nXmpl5olM0OHJs9HabAi5XCl0frY8nRs7ZqlrtBpcapDkmWrck7N3F++pLJg7XN6hSpAnEbGUWrvMOCP14ar0vGo6CR3T5CTIKx2qGLvMiYo+5juX1WXHS5EZKy0iyIXD0xyq1GZeJcYBUXLDARV/+r3yLSiYWGz25CitoNFWfqMICsVG+TKAxyzrdcuuiyKnbB1ulF0eiIJL5A9VjtLJ1JpODTH1g4QGW3cff5AL3rC+KHzAkuPx9+0txavcRS8eSZ/ZJOsLQIVtWfOE0NWRLok6G0BeeeRNh7co/q7ybyZuu8zrGm6fe4PeA1WyZDJG9pnSRh/1e6O5ffSmuPZKSSrnTGjSKVyZ7rzhh/vAaKfpwsqS5dimZPmowuh/wz+b51JdZhfuBZe/ASTnPBFCd8GJhVJXEMMKWsnicht2qga/r9AKBSA7qJ7NJUy3R6HJAzbtS2C6DEgNGz/pguZSutmobbXv2qk1WfBsPZaytQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02c67e97-3117-495b-49af-08df20cbfc62
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2026 21:27:39.4332
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xtwhCzcXMCb1MSMEGGR4XQL6mh+8uBbwCLD5wxcL99c5JigtNvy5MfNCdh0CgAzlZnyYogrnspSJrsw3Mxnp7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4482
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA4NSBTYWx0ZWRfX3KTFwrOfmjtZ
 hCwwTId71E/+a4IWVf+nKuJ+UvkEHlcz8T9PuKi4rvW68bCQdshXhPNvYtZh+L1oqUgH9i0zqSu
 3dS7LZutnYRwQOUK6ht3DGp6pdLSVsI=
X-Proofpoint-ORIG-GUID: _UuXiNRVK10ZtBL2oz6mkqAD0IYadVGT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA4NSBTYWx0ZWRfXyAwD8Qb0YKfw
 jKe7d1+xGIU4otYp4bLGQVpVW5x//3LjuGe0YgYXjQIrMzkHBg9uU3uqNBxK/TcJJRYRgZaNv9P
 SIddTLUdLRVBUJQOtRvVGsoOpNolAIT8CLP0Hm6KaYoJsSPGEV3s+eq/y2MEzK6ZdtRoBkFWn83
 dghGaXRT5GWQDyaS9ycmXRB0EeUwRnPzszGzOPx158gTkvDT0ZdlknGJRG5RxDt7KjUaVlusU/n
 HPcC3lmGwAANtghVvsRc8BnSAfVBbn4lFVdPdL6ifKjiwZC8CWJ4xudal0C51eT5sjoTcpc3h+B
 MgXb9anY+Cam8g7hxI6lJ9z0mc1qgCFTbEepYpku7GE12P1hXo1e1hg5Oby9Uvx74XD5kC6FRMG
 ZV6tkEtUu+qdL1mvUxOZkXEdPsQ/MQNNDKdYatG59KYmulJTcornsdkE5O2pVylGCiRRFWOoyRn
 2PMhMJwkboVhhp8WVWA==
X-Authority-Analysis: v=2.4 cv=Vrm2kO2n c=1 sm=1 tr=0 ts=6ac021d4 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=jSPayVjLy6xbsuKauFBc:22
 a=VwQbUJbxAAAA:8 a=zd2uoN0lAAAA:8 a=Lc_GExvxsZFfizQ3bgEA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: _UuXiNRVK10ZtBL2oz6mkqAD0IYadVGT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_06,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 spamscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2609040000 definitions=main-2610020085

T24gTW9uLCBTZXAgMjgsIDIwMjYsIFJhZGhleSBTaHlhbSBQYW5kZXkgd3JvdGU6DQo+IGR3YzMt
eGlsaW54IGRvZXMgbm90IHJlbGVhc2Ugd2hhdCBpdCBhY3F1aXJlczogc3lzdGVtIHN1c3BlbmQg
ZXhpdHMgdGhlDQo+IFVTQjMgUEhZIHdpdGhvdXQgcG93ZXJpbmcgaXQgb2ZmLCB0aGUgWnlucU1Q
IGluaXQgZXJyb3IgcGF0aHMgbGVhdmUgdGhlDQo+IGNvcmUgcmVzZXRzIGRlYXNzZXJ0ZWQsIGFu
ZCBuZWl0aGVyIHByb2JlIGZhaWx1cmUgbm9yIHJlbW92ZSB1bmRvZXMgdGhlDQo+IHJlc2V0IGFu
ZCBQSFkgc3RhdGUgYXQgYWxsLiAgVGhlc2UgdGhyZWUgcGF0Y2hlcyBmaXggZWFjaCBpbiB0dXJu
Lg0KPiANCj4gQ2hhbmdlcyBpbiB2MzoNCj4gVGhlIHVzYl9yZXNldHNfcmVsZWFzZWQgZmxhZyBh
bmQgdGhlIHBsdGZtX2V4aXQgcG9pbnRlciBhcmUgZ29uZS4gIFRoZQ0KPiB0ZWFyZG93biBpcyBu
b3cgYSBkZXZtX2FkZF9hY3Rpb25fb3JfcmVzZXQoKSBhY3Rpb24sIGd1YXJkZWQgb24gdXNiMy1w
aHkNCj4gc28gaXQgb25seSB1bmRvZXMgdGhlIHJlc2V0IGN5Y2xlIGluaXQgcGVyZm9ybWVkLCBh
bmQgaW52b2tlZCBleHBsaWNpdGx5DQo+IGJlZm9yZSB0aGUgY2xvY2tzIGFyZSBnYXRlZCBvbiBi
b3RoIHRoZSBwcm9iZSBlcnJvciBwYXRoIGFuZCByZW1vdmUsIHNvDQo+IC5zaHV0ZG93biBnZXRz
IGl0IHRvby4NCj4gDQo+IENoYW5nZXMgaW4gdjI6DQo+IFNwbGl0IG91dCBvZiBhIGZpdmUgcGF0
Y2ggc2VyaWVzIHNvIHRoZSBmaXhlcyBjYW4gYmUgc2VudCBhbmQgYmFja3BvcnRlZA0KPiBvbiB0
aGVpciBvd24sIGFuZCByZW9yZGVyZWQgYWhlYWQgb2YgdGhlIHBsYXRmb3JtLWRhdGEgY2xlYW51
cHMuICBQYXRjaA0KPiAzIHdhcyByZXdvcmtlZCBzbyBpdCBubyBsb25nZXIgZGVwZW5kcyBvbiB0
aGF0IGNsZWFudXAsIGFuZCBhbGwgdGhyZWUNCj4gYXJlIHRhZ2dlZCBmb3Igc3RhYmxlLg0KPiAN
Cj4gQWxsIHRocmVlIGFyZSB0YWdnZWQgZm9yIHN0YWJsZS4NCj4gVGVzdGVkIG9uIFpDVTEwMjog
dW5iaW5kIGFuZCByZWJpbmQgY3ljbGUgY2xlYW5seSB3aXRoIHRoZSBkZXZpY2UNCj4gcmUtZW51
bWVyYXRpbmcgYXQgU3VwZXJTcGVlZCwgYW5kIHJlYm9vdCBpcyBjbGVhbi4NCj4gDQo+IExpbmsg
dG8gdjE6DQo+IGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwczovL2xvcmUua2VybmVs
Lm9yZy9hbGwvMjAyNjA4MTAxNzQ3MTMuMjMyNTI5Mi0xLXJhZGhleS5zaHlhbS5wYW5kZXlAYW1k
LmNvbS9fXzshIUE0RjJSOUdfcGchZDRkSDRSWUJSS1lZeFJPLTNNR21ISlo4NlVYTjRKWUd1c3ht
aFg0akRQTFg2SDVXNjJpTEppTGFjcHRuNVJwNHhSRUgtVnoxSks2eXlMWGM2WGZ1b2I0ZGs3Z29y
dyQgDQo+IExpbmsgdG8gdjI6DQo+IGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwczov
L2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNjA5MjIxODIxMjUuMTEwNjctMS1yYWRoZXkuc2h5YW0u
cGFuZGV5QGFtZC5jb20vX187ISFBNEYyUjlHX3BnIWQ0ZEg0UllCUktZWXhSTy0zTUdtSEpaODZV
WE40SllHdXN4bWhYNGpEUExYNkg1VzYyaUxKaUxhY3B0bjVScDR4UkVILVZ6MUpLNnl5TFhjNlhm
dW9iN29TUHA3S3ckIA0KPiANCj4gUmFkaGV5IFNoeWFtIFBhbmRleSAoMyk6DQo+ICAgdXNiOiBk
d2MzOiB4aWxpbng6IGZpeCBzeXN0ZW0gc3VzcGVuZCBhbmQgcmVzdW1lIFBIWSBoYW5kbGluZw0K
PiAgIHVzYjogZHdjMzogeGlsaW54OiByZS1hc3NlcnQgcmVzZXRzIG9uIFp5bnFNUCBpbml0IGVy
cm9yIHBhdGhzDQo+ICAgdXNiOiBkd2MzOiB4aWxpbng6IHVud2luZCBaeW5xTVAgcGxhdGZvcm0g
aW5pdCBvbiBwcm9iZSBmYWlsdXJlIGFuZA0KPiAgICAgcmVtb3ZlDQo+IA0KPiAgZHJpdmVycy91
c2IvZHdjMy9kd2MzLXhpbGlueC5jIHwgMTIzICsrKysrKysrKysrKysrKysrKysrKysrKysrKy0t
LS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDEwMCBpbnNlcnRpb25zKCspLCAyMyBkZWxldGlvbnMo
LSkNCj4gDQo+IA0KPiBiYXNlLWNvbW1pdDogYWJjMzZjYmRhMjlkOGYxOWNmM2E1ODBjZDg2Y2E5
ZTg2NTE4NmE0MQ0KPiAtLSANCj4gMi40NC40DQo+IA0KDQpJIG1pc3NlZCBzZWVpbmcgdGhlIHYz
IG9mIHRoaXMgc2VyaWVzLiBMb29raW5nIHRocm91Z2ggdGhlIGNoYW5nZXMgbm93Lg0KDQpUaGFu
a3MsDQpUaGluaA==
