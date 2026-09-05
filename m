Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21383241C8C;
	Sat,  5 Sep 2026 00:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788568155; cv=fail; b=uAwXVURCPAAa0qLFWeWLooSniU5OtYQqhaxwdBIbghX053ekt4ANZu6YDMdoCmfKvpdJFh/In7QEQ5WNzA90j8rDTEBEm6Aa+y81qttXvabcfDLoemZ4kqO1szXQCR/kGnxvMEnEObX4uJb1DaWQk/2PiFfuHx/Y6E7/fPUdloY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788568155; c=relaxed/simple;
	bh=8xv0lxk573kb77oMN7DB3bGYbvmvI9Dx+1B3VLyftU0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Om0g6dWO7YXmimR/6F+AgBO3vHruCUaThVQAUJ+9tgGqPbcBwtQ1f5u0Ozlm5OtcZQeL21XXUA6OqPASKdOaigAS4ZcFglQvaH2kvwqx+jz5JrFO7KEXmDF2jmUJTR84TOFSLUj1yta4aK4xrBvIZQ4Z+JJB5oIMaZ1krOl+trg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Ag+J/QyQ; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=VmkC87RG; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=VALwHlPV reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Ag+J/QyQ";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="VmkC87RG";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="VALwHlPV"
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684KcluS1143295;
	Fri, 4 Sep 2026 17:29:06 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=8xv0lxk573kb77oMN7DB3bGYbvmvI9Dx+1B3VLyftU0=; b=
	Ag+J/QyQ5En2xj6amlAwlhK2SApabXoEOVkK2fr3GsFfMEswWCpoGkOYUubQOlaJ
	LdUVLIiIpIWBrTpwhzVbLDrM+XfRMUhCqer5+sUbUBdA4x+tz28dRLKbgNLc35Qd
	w5ZByl8EUbKQjBMePUiwkktE8ooXLeqWA099eCg9GbMwIHdPBusgHdf93MYrROGY
	Zcq8XvduHIOvh4aMyV+U//da+XRwIQESLn1EKv44OUcn54Gkbx9BCFbVNyRdRCzi
	+RgJONfszLbo4R8C3P8sEAtSyiHmkYioURX0K8vMekXUsMznjwiRT0lw8tPIv9a7
	byvgo3DG7rG1fcOfLfFP+Q==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4gfrm1b3cx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 04 Sep 2026 17:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1788568145; bh=8xv0lxk573kb77oMN7DB3bGYbvmvI9Dx+1B3VLyftU0=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=VmkC87RGKwBfRUET5UGXVFtalSCc0c4Wt3hpuHZLNswU1636pJyKiRwsu8D0UjIAZ
	 zbccv4MRGiyTzWpBGOXuTpsvo6ggxE36GpkLTjbXCFGFD7nY7HDuqYyYX/q1AaVYZ3
	 ASCXFiZQTRDNjHykVSssEir3LX5v2BzAFD6W6qb3bRnsfxx2n6RBz9Hs+t1mxd8kM2
	 LAwRg285eays7KuvhgTRsOI9hHOJXFKJJy68B4os+ncAJhq4bBoTMc2PQvZm6W5HBt
	 De9GkHS+aSuoPj3JbKdk7T0EaERyLkJY8koV6PJsZsPWVSzoA02n6WQapT5qdQ9Q8P
	 dRy668n5MzfvA==
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 1AC2A4012A;
	Sat,  5 Sep 2026 00:29:05 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id CEF07A0340;
	Sat,  5 Sep 2026 00:29:04 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=VALwHlPV;
	dkim-atps=neutral
Received: from BYAPR08CU003.outbound.protection.outlook.com (mail-byapr08cu00301.outbound.protection.outlook.com [40.93.1.105])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id D01E6401F1;
	Sat,  5 Sep 2026 00:29:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wXvcs6xP0KTNMu0uIk81rFln+TU/46hw6mhJpJwuJJodsRq+VAU5T74RkREIETzekDpZVzS09mS12qEwWgFLz4R3UErU4SNvpT4lHDb2GXJEWJiJWfkNxixD+e1V4ixQGZX6AUkuZ6LR0wqwIo+90vL6Rr6IE2fSp8K4bO6ZcE3MzhdIX7oC4FmzDJUjiwaiQij0ZKaiN00mbi+gBpPpStCgIQHcY2xyx2zzxfNnMUz5qMOQ4dofbMdUFWGEO53iQwiOj4Ri1qc9cl71+bjmoRL/9e43syY6NnAhpbHpmQXIfZHhMGAtck8vd75l4HVrUiy1uC2fAZhRzQRO9xXNXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8xv0lxk573kb77oMN7DB3bGYbvmvI9Dx+1B3VLyftU0=;
 b=kZV7MNacReP7xHutEehgZOMooy56B6j52v+HrClbIj7P9Cy3Q0n9935Oo3h/WZHAGcx2o4kqFC/j2Re5WFVoD5fMjGSl3uKajphLWHZXAtSPWANOXI0QDOJEPuunerXchuVyKj8sp04A1X7435pv57w29fN8/KVkNhoFSR4/33cNx4OYE3Mo4CgnmKmwkERwFPyLhjNlCXw7sCFhtjZnrvhxwr7lKH/KTEGrUmk6I5MmcGA1SKppUEPnSJ329uuIvswvhmCcsau6zQIpk/aTsnd8GRYxRvY3gfbQ9KkvJURcyjExS/JOoYpxHtUFMV23cQc8dhns5F6W21JGvoUdYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8xv0lxk573kb77oMN7DB3bGYbvmvI9Dx+1B3VLyftU0=;
 b=VALwHlPVgOJvqyRkY2YnV6alNrZr4ooU+dGYhU7UK49q/Em4KUr6hEYqN7yX/MQJNTRD5erC8021ntsQaaDR6s+AhVY0k7XkyxsrSBEpiMaSBRmgFwa6Yi5a5giwG9+5mk9ilgeAcpwbeWYwE9PCPZsqrSDigLkyL03IIFoVodo=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by CHBPR12MB515368.namprd12.prod.outlook.com (2603:10b6:610:33d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Sat, 5 Sep
 2026 00:29:01 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%6]) with mapi id 15.21.0360.008; Sat, 5 Sep 2026
 00:29:01 +0000
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
Subject: Re: [PATCH v3 3/4] usb: xhci: Allow custom op for
 usb_link_tunnel_mode reporting
Thread-Topic: [PATCH v3 3/4] usb: xhci: Allow custom op for
 usb_link_tunnel_mode reporting
Thread-Index: AQHdOfmDvqc7mSQ2R0q63fFGk1qjkra/JyQA
Date: Sat, 5 Sep 2026 00:29:01 +0000
Message-ID: <aptiQnAoeiHW6Dmy@vbox>
References:
 <20260901-topic-dwc3_tunneling_state-v3-0-22fdced8de55@oss.qualcomm.com>
 <20260901-topic-dwc3_tunneling_state-v3-3-22fdced8de55@oss.qualcomm.com>
In-Reply-To:
 <20260901-topic-dwc3_tunneling_state-v3-3-22fdced8de55@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|CHBPR12MB515368:EE_
x-ms-office365-filtering-correlation-id: 699762e3-4f1c-4ddc-ada0-08df0ae4aecf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|1800799024|376014|23010399003|366016|56012099006|10067099003|4143699003|11063799006|5023799004|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 x+wSdnqTtWXFuduVdQ1qowNJPbB3aLAtScklX2smaXN5YFt++tLf2tYfJ5ezSS221Tir2T03w+cnoQvgHL6rwVaCnC2Hc3tEZl9D4bdb6NZn0btSq02bsfVuGdaz8BCoNAtPlW11S4bSWynqES7OsIxO4XWMwESsrEgjA27ByBcn4GIHZI34v5Bx+FkAfF3j9ZBB2SchW882gu+o4RvErbVuUg6fCXjCscN14MkKre3RzDHAhmgI47FsN12DBfNcOUg5z0P+AjVbqN7OIwUs1D/EVCBKNndHV33VZB8X7F5nsvv97UyDK2h7Hflc78OwwVmlUXOOSQAue3wX33W9h6taj+IqU7lc9FTc+7FEYgwLuhex0ncRDjnBqj/e1fsVXxnU7jpYqsEWpmrpNhGr7Brg6MIGCHEVN3ElygU4aFmCC+5oE4HkWJQJZMJD7v2Ey4erv0RcSXLaKT6GehuKXDW9FgA5sM8NX5xOqqx1ErjOfegnHi/l9xTTcnKH8OlhXs/57oKOY0TqGtPL58gNN++HiOuuhHIOvAoFmeHaH6W2J+JabPQPJr81ZiERHX7aNxINMglgU6zqzvvjFDJb6YdIXxIzeqqbNXI6wbm2v1gun2ds0MLKJoVTvM6g2LSUgTx1mOfFTA3+Nt5OFvhi6SWhfkRJHWR93p9bFtRgL50ubetuK+s4dOTgdpffFe5m3wS8mmCKpejfmzG4A62H74TlF2xZtiNRxY30m+/fzHU=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(23010399003)(366016)(56012099006)(10067099003)(4143699003)(11063799006)(5023799004)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ODhTRFdlRlVmdmVkUFdSQklPcDlNOWlWeXkxUUNpWGE4QklEd2dBN0pTS0ly?=
 =?utf-8?B?QWpMTEJ4b3Q0RzhoZHRUdlM1SVk0TlVQNkNTQU14VFcwcmlUVUkwZDh5RFhC?=
 =?utf-8?B?SUFNTStsWmdiTmpNOUh5MmRJWDVRZStVK3Bpb0V5MVFCTTZUMFVsQkwwUGIr?=
 =?utf-8?B?UkFLaWgrVkJkSGJ3aC9DbitJOWo1QzJ1WGZIcUJnS2JvcXFWTThMM1lXeU9Z?=
 =?utf-8?B?VlBxb3NvSkY4dFVlVG11ZTRIQ3pkSkE5UXNDNXJJd1E2VUw5ZjczWG1zYUFq?=
 =?utf-8?B?QmV1aGwwSEFJQnl3b3JhMHV2cGlSNVhpODRBNFRVT0YycGxqdlVHZzRMblRZ?=
 =?utf-8?B?TVNPSXVvN2txNTJCQWRtcEFRMzNNN1JmMFZhRUR6Qi92MWxoU2UxbzRZVkZ2?=
 =?utf-8?B?TEFLb0RvRWJvanJLcFdJd1AwQ0oxalFuY1ZrOWxVWnQvL2Fxa2dMT2EvZDRp?=
 =?utf-8?B?ZXh1MGlnVWR6RE8vREZBK0ovbTBlRks0ZUhWNVBmQVRiMTJKR3lCOHQzTUsw?=
 =?utf-8?B?RnZYQ2x1SHJ4bFMrQWdaVjVtUlJDVlptRldHSHZlN3c3blJQekRPSzJmZ2tn?=
 =?utf-8?B?NU5vS1oxK1NTWTE3cjJVMjBCVkRQQ3p6ZkdUbDVUMXE1N0ZFeXdVcWR0QVBB?=
 =?utf-8?B?Uys3VmE3aFJvbmF4T21iTDBBV1ZCVkU2WjQ0QlZQVG9ZbFZwZWFXWCtIdm5W?=
 =?utf-8?B?TTZ6bnI0SEtGZkpDWThjc2llZVAwTy9wbG5INzBWSG1GZ3VJc1o4TEhMY3hN?=
 =?utf-8?B?VGZRSlRlOU8wMnU4QS9za2orankrRmd0V0FGT3FhK2NkTC9Td2dyaEZIZWxp?=
 =?utf-8?B?bGVlaHBtN0dHT3d3dmdWNTJBUE05SkM1ZW9FbGRaelVUY3NsRFppME16eXVv?=
 =?utf-8?B?WWxDMjFZcS94Yy9UUjNrVUxTUldOYzM5aEEyekhxM2RKTmZOT0FDS2hxU3Rk?=
 =?utf-8?B?WFNLU215YlBsUUxiZjl6K09ZaGx3Wnc0ajZKZTRDYmRMb2JoUldFWFl0VGRP?=
 =?utf-8?B?aXBsN2U2bDV1bW0vZHBHbTN2T1RzWmFaNUVWNWlMeG5CNWFNT1IwOEQvMDdl?=
 =?utf-8?B?czRvTHozbkhqMGZWMjNoR0JoSDdiWnJrYVMyNnI0UzRnUlFTeCtkMUlaaGEy?=
 =?utf-8?B?MzFhVGJXZ1QrL0NWYW1mSXQvK0RXWEYrMmdBZ0dRWC9zZk01TUx3NGU4M3JM?=
 =?utf-8?B?aFlCcE9vZ2U2QW5mYTQrdXIyK3J1MUZJdkYyR2JNbVZkbG9VclNXajUyZTNW?=
 =?utf-8?B?blNIdkxMQlNMam5TRmF1QjV6NzNqd0pnQjAwNVYvellKR29wZnZoNGJiMFBY?=
 =?utf-8?B?ZlA3QVl0eU04MHV4ayt6WWUvOW42UXB2dmlUNWErZ0tId2gzNWdueTh2VGRl?=
 =?utf-8?B?SEEzaTdkejJZMFVBYTU2MHJLT0haSDB3WmNsWXIxZlRBNjRKWWV2QTkwZ1R0?=
 =?utf-8?B?Q2k3TVYrTGZ6aEtHajdCbWNrNGhabVZBTzhaMFdvZjVnNy9rZ0xPZmFSU2tN?=
 =?utf-8?B?NURRZUZJOEZvQjNoVVdXTXVGcVhOeVIvL2ppVlVsYkVRdjF6R3FBNUpnQ0Zm?=
 =?utf-8?B?STBPZHFjaHgrWTVBL01VMnhqc2JFT3VNUzg2RU05YXRjSEdXRXlCeEdVazJF?=
 =?utf-8?B?M0I3dFNXQ0hVU1c5bTYvdnNpcys4d0NxdnhFRkUwUno2SVM1OUhPSmtBcitB?=
 =?utf-8?B?RTZuNGlsMndkb1dNeU5SZFl2Q09wcXB1ai8wVHU4REZ2VzY0YXVTMDFSVjFR?=
 =?utf-8?B?OUpaemE2cGlxVm1Wd3h2MktzUVBLazZER00zV2QwQkM3M1J1K3E4Vi9sMHhv?=
 =?utf-8?B?NWM5S0FtRXZjNHFicWNyYVBsUGtJYWx3MmZaR2FnWjNoSnJFVmJVRy93ZXIv?=
 =?utf-8?B?SXB6SjlVVlNVTjcrMGYwTmFTV2ZXTmdoNi8zbWtrbUhOV3JQanZjbGllckpC?=
 =?utf-8?B?aTdmRmptR2pGeC9Hd01EZ3N3TVE4ZXJNelhBRitwTkdWWGszdWUxMU00R2ZK?=
 =?utf-8?B?dm0xUXBhTFlsNWc2UGFVY29Ia25PbGNWVno0NTVJU2VvVjhlbzQ5WDdNRWVw?=
 =?utf-8?B?c2YwaXNEaGo2NTUrby9qdFp6SmVpL3VUNWt1cFkzT2M5N1hzTXhKam10NEJZ?=
 =?utf-8?B?bFZGZ1NTWDhSczBKdkI5L2dPT21iNXBHK3FienpmNTlPczNpSHVkTEoyUldq?=
 =?utf-8?B?WUtGdDh3TGtvRHRoZVdmZGp1d0ZqSEdJaFdZQ0wrVCtMUU5tVDZMaVhTMXJH?=
 =?utf-8?B?RDVGRzdzZGgyTUtzV3FwekVjWU92MzVEV3BHOWlqZjJkT3QxRWxtWDlYZytY?=
 =?utf-8?B?T3BteGRmUDNwampUdkJVQS9PZU9QbWlPcjN5dlRjWFV0S1VtcWkydz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9CE6B0F44849364EABC2F0B2559193BF@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	nuzCsy0PE9PWxkTzglsFIE2Nrr1dpIQpRTamo/8KWGaBxTY2WzgVzmrYRYUOn5mAzhs27lKM3a0nOAIWmLTDcfl8rJTqE0gqPBOsyjNMHmqu717WIIqfxQpiDIbSJNaztqGDeZiE++wmL6EFOWQIQpLpPhtbgiVcMiAQP0PH14uSOMhhg6zpfgkCBXVifnJKR+ASjj4iP6spIa7V5ogvcCuPu1LQ6SlhzOqH4sQZRP0BG4VvtPQ7xadNA4Za1UwMlSYGz+s7uj2zLhWpv4pLt4HE+VsBJxg1EioCnoEorzg1oGMv0X2uvRbhyFz7sEvHLGAWttjBL/qfTifqUcRjlA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	PUqKlgr49V56Nd358iUwWx+TUMFDZbYpSb1on/TsENzgkgw4bRAdHWESpIEE2WjTj7He6/zLdl7OlfkwZgjOtH3Y8ekV04yGe1WjdAQYb97S0hnfm279BplTG7RinXVAjeP/LTRXRAHTkGuqd0FVuJgnSEMoDgi4vyhgNiSC3K65uCNWT0YYFBDJMFQVY/CgK0HNSw6s0J3fMPtm4PcrpniXIWcu7e1S/gAYXuAGawGkPmbWD2QahmTcRIzA3y9f/iMHh+zbR2luBvCAY6iuX3GUYIR/pbq+zFZeMINVCEAEFjQf8CNa3A2Nf9wHcRx6NftLpBkVvav/oMoY/Re1InALwwKgCKmeKq+qUiPE3T+NvegC31t8FWxI0pJ/xAaREQe/grbpmBhcg8aMEwQQmmOIo88M8tRnDQX3PUvc4LKqZ4o95NycDdax0xS7f9ihlnVKLSgDFHf3MzIkwRLz+cL13muU3m2Cn9X72G4/4onXq1vN/DKGuS6ovRxc6TpdXZtRHlVTnaQ92K/D0DKPgs23GNC/6o0gkmgqk8KzJtviQ0jIRvKnWRbbjyfzI4hDZJfqe+FeVw97kKRVYzwPJB1KQbL5A27cPKQmQgmGbl/1GqHtuK0/GogObgXq4HbLpp789rCjpXnzhq/cnhUuOQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 699762e3-4f1c-4ddc-ada0-08df0ae4aecf
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2026 00:29:01.1511
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4crrRK3RzKCLQShW1YmLY7RoXS6OJYvUNnMWvFRZUDfoDolqwfo1HHp3cfGmwS7CHrGdtszP4Xx76A5ajdyJnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CHBPR12MB515368
X-Proofpoint-ORIG-GUID: aNAqapE7oP7JPUnXZ9VAtwuERJf_ArRA
X-Authority-Analysis: v=2.4 cv=L88theT8 c=1 sm=1 tr=0 ts=6a9b6252 cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=-4-sGo8i1FcW4KD7_GeR:22
 a=EUspDBNiAAAA:8 a=jIQo8A4GAAAA:8 a=qNnEdJUOYBXo_JcfKV8A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: aNAqapE7oP7JPUnXZ9VAtwuERJf_ArRA
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA1MDAwMiBTYWx0ZWRfX2//EuBjK2bqA
 dXbfHILW5vMx6+ZBhPDRig3Xgsa/o4PnM4fn8OsKO05FBb68X0QaP42U1x/9Ye7fzFBt2Xq1yIx
 6SGPBsql6JGRzLj++mPPh7FIe79KCD0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA1MDAwMiBTYWx0ZWRfX82baf6OXNDo9
 WWoVDjlNCndvkicZ86GnQaEthASAz7QbE2X39+NxiJvavgBCItsWW8F4METW/qMBucdYdKUVkXP
 0bXMXn+0BRc0Ro3DN4y7P2g/x+du9C/SPlg+WQv7/26db2vDQ8vOV6jMcm3n0Qs2jXaXVGmLGkb
 ttSjqbqrHZ957jJNRXbCYQZ8aXj+Wnox5+ty7zzoWSQLJ6tz7Uf6YMhxN4n10fxiqnBi5mFqgxA
 stdO5TBvwokaDW/lNL60eOsuQLkjR3qIxk/iJweO1zC3og+BorgQI3JXuEbMAatBgMMAdnjxHgj
 lO/7NUcek44F+SYBwi2oiYsgeBVp6abvYeBruxmktBU2ZLBdSUAa64i5a9EXMbOAsXtpWEGvagO
 NDIVXX5zKjFDeY8b067hwyfNbbdFV3LGJsbc5ahmlxrBgqYhTuAa0XvJa4VvjZ034fjef+K5L2T
 jiGeWWxkDxdH9QVAzIQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_06,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 malwarescore=0 spamscore=0 impostorscore=0 suspectscore=0
 phishscore=0 bulkscore=0 priorityscore=1501 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2609050002

T24gVHVlLCBTZXAgMDEsIDIwMjYsIEtvbnJhZCBEeWJjaW8gd3JvdGU6DQo+IEZyb206IEtvbnJh
ZCBEeWJjaW8gPGtvbnJhZC5keWJjaW9Ab3NzLnF1YWxjb21tLmNvbT4NCj4gDQo+IFRoZSBUaHVu
ZGVyYm9sdCBmcmFtZXdvcmsgcmVsaWVzIG9uIHRoZSBVU0IgY29yZSB0byBjcmVhdGUgZGV2aWNl
IGxpbmtzDQo+IGZvciB0dW5uZWxlZCBwb3J0cywgc28gdGhhdCB0aGUgVVNCMyBjb250cm9sbGVy
IGlzIG9ubHkga2VwdA0KPiBydW50aW1lLXJlc3VtZWQgZm9yIHRoZSBkdXJhdGlvbiBvZiB0aGUg
dHVubmVsaW5nLg0KPiANCj4gQ3VycmVudGx5LCByZXRyaWV2aW5nIHRoYXQgaW5mb3JtYXRpb24g
aXMgb25seSBwb3NzaWJlIG9uIEludGVsIFhIQ0kNCj4gaG9zdHMsIHRocm91Z2ggYSB2ZW5kb3It
c3BlY2lmaWMgY2FwYWJpbGl0eS4gRXh0ZW5kIHhoY2ktcGxhdCB0byBhbGxvdw0KPiBwbHVtYmlu
ZyBhIGN1c3RvbSBvbmUuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBLb25yYWQgRHliY2lvIDxrb25y
YWQuZHliY2lvQG9zcy5xdWFsY29tbS5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy91c2IvaG9zdC94
aGNpLWh1Yi5jICB8IDEzICsrKysrKysrKy0tLS0NCj4gIGRyaXZlcnMvdXNiL2hvc3QveGhjaS1w
bGF0LmMgfCAgMiArKw0KPiAgZHJpdmVycy91c2IvaG9zdC94aGNpLXBsYXQuaCB8ICAxICsNCj4g
IGRyaXZlcnMvdXNiL2hvc3QveGhjaS5jICAgICAgfCAgMyArKy0NCj4gIGRyaXZlcnMvdXNiL2hv
c3QveGhjaS5oICAgICAgfCAgNSArKysrLQ0KPiAgNSBmaWxlcyBjaGFuZ2VkLCAxOCBpbnNlcnRp
b25zKCspLCA2IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2hv
c3QveGhjaS1odWIuYyBiL2RyaXZlcnMvdXNiL2hvc3QveGhjaS1odWIuYw0KPiBpbmRleCA4MGYw
N2JkNTA4MWQuLmM1ODVlNGQwMmQ4NCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy91c2IvaG9zdC94
aGNpLWh1Yi5jDQo+ICsrKyBiL2RyaXZlcnMvdXNiL2hvc3QveGhjaS1odWIuYw0KPiBAQCAtNzQ5
LDcgKzc0OSw3IEBAIHN0YXRpYyBpbnQgeGhjaV9leGl0X3Rlc3RfbW9kZShzdHJ1Y3QgeGhjaV9o
Y2QgKnhoY2kpDQo+ICB9DQo+ICANCj4gIC8qKg0KPiAtICogeGhjaV9wb3J0X2lzX3R1bm5lbGVk
KCkgLSBDaGVjayBpZiBVU0IzIGNvbm5lY3Rpb24gaXMgdHVubmVsZWQgb3ZlciBVU0I0DQo+ICsg
KiB4aGNpX3BvcnRfdHVubmVsX21vZGUoKSAtIENoZWNrIGlmIFVTQjMgY29ubmVjdGlvbiBpcyB0
dW5uZWxlZCBvdmVyIFVTQjQNCj4gICAqIEB4aGNpOiB4aGNpIGhvc3QgY29udHJvbGxlcg0KPiAg
ICogQHBvcnQ6IFVTQjMgcG9ydCB0byBiZSBjaGVja2VkLg0KPiAgICoNCj4gQEAgLTc2Myw3ICs3
NjMsNyBAQCBzdGF0aWMgaW50IHhoY2lfZXhpdF90ZXN0X21vZGUoc3RydWN0IHhoY2lfaGNkICp4
aGNpKQ0KPiAgICogZGV0ZWN0aW5nIFVTQjMgb3ZlciBVU0I0IHR1bm5lbHMuIFVTQl9MSU5LX05B
VElWRSBvciBVU0JfTElOS19UVU5ORUxFRA0KPiAgICogb3RoZXJ3aXNlLg0KPiAgICovDQo+IC1l
bnVtIHVzYl9saW5rX3R1bm5lbF9tb2RlIHhoY2lfcG9ydF9pc190dW5uZWxlZChzdHJ1Y3QgeGhj
aV9oY2QgKnhoY2ksDQo+ICtlbnVtIHVzYl9saW5rX3R1bm5lbF9tb2RlIHhoY2lfcG9ydF90dW5u
ZWxfbW9kZShzdHJ1Y3QgeGhjaV9oY2QgKnhoY2ksDQo+ICAJCQkJCQlzdHJ1Y3QgeGhjaV9wb3J0
ICpwb3J0KQ0KPiAgew0KPiAgCXN0cnVjdCB1c2JfaGNkICpoY2Q7DQo+IEBAIC03ODIsOCArNzgy
LDEzIEBAIGVudW0gdXNiX2xpbmtfdHVubmVsX21vZGUgeGhjaV9wb3J0X2lzX3R1bm5lbGVkKHN0
cnVjdCB4aGNpX2hjZCAqeGhjaSwNCj4gIAkvKiBGYWxsIGJhY2sgdG8gdGhlIGxlZ2FjeSBJbnRl
bC1zcGVjaWZpYyBleHRfY2FwICovDQo+ICAJaGNkID0geGhjaV90b19oY2QoeGhjaSk7DQo+ICAJ
aWYgKCFkZXZfaXNfcGNpKGhjZC0+c2VsZi5jb250cm9sbGVyKSB8fA0KPiAtCSAgICB0b19wY2lf
ZGV2KGhjZC0+c2VsZi5jb250cm9sbGVyKS0+dmVuZG9yICE9IFBDSV9WRU5ET1JfSURfSU5URUwp
DQo+IC0JCXJldHVybiBVU0JfTElOS19VTktOT1dOOw0KPiArCSAgICB0b19wY2lfZGV2KGhjZC0+
c2VsZi5jb250cm9sbGVyKS0+dmVuZG9yICE9IFBDSV9WRU5ET1JfSURfSU5URUwpIHsNCj4gKwkJ
LyogTGFzdCBjaGFuY2UgLSBpZiB0aGUgY29udHJvbGxlciBoYXMgYSBjdXN0b20gdHVubmVsX21v
ZGUgb3AsIHRyeSB0aGF0ICovDQo+ICsJCWlmICh4aGNpLT50dW5uZWxfbW9kZSkNCj4gKwkJCXJl
dHVybiB4aGNpLT50dW5uZWxfbW9kZSh4aGNpX3RvX2hjZCh4aGNpKSwgcG9ydC0+aGNkX3BvcnRu
dW0pOw0KPiArCQllbHNlDQo+ICsJCQlyZXR1cm4gVVNCX0xJTktfVU5LTk9XTjsNCj4gKwl9DQo+
ICANCj4gIAliYXNlID0gJnhoY2ktPmNhcF9yZWdzLT5oY19jYXBiYXNlOw0KPiAgCW9mZnNldCA9
IHhoY2lfZmluZF9uZXh0X2V4dF9jYXAoYmFzZSwgMCwgWEhDSV9FWFRfQ0FQU19JTlRFTF9TUFJf
U0hBRE9XKTsNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2hvc3QveGhjaS1wbGF0LmMgYi9k
cml2ZXJzL3VzYi9ob3N0L3hoY2ktcGxhdC5jDQo+IGluZGV4IDZmZDU5NWY4MWEzMC4uYzE5YmM1
ZDdhN2I1IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3VzYi9ob3N0L3hoY2ktcGxhdC5jDQo+ICsr
KyBiL2RyaXZlcnMvdXNiL2hvc3QveGhjaS1wbGF0LmMNCj4gQEAgLTI0NCw2ICsyNDQsOCBAQCBp
bnQgeGhjaV9wbGF0X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYsIHN0cnVjdCBk
ZXZpY2UgKnN5c2RldiwgY29uc3Qgcw0KPiAgCQlwcml2ID0gaGNkX3RvX3hoY2lfcHJpdihoY2Qp
Ow0KPiAgCQkvKiBKdXN0IGNvcHkgZGF0YSBmb3Igbm93ICovDQo+ICAJCSpwcml2ID0gKnByaXZf
bWF0Y2g7DQo+ICsNCj4gKwkJeGhjaS0+dHVubmVsX21vZGUgPSBwcml2LT50dW5uZWxfbW9kZTsN
Cj4gIAl9DQo+ICANCj4gIAlkZXZpY2Vfc2V0X3dha2V1cF9jYXBhYmxlKCZwZGV2LT5kZXYsIHRy
dWUpOw0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvaG9zdC94aGNpLXBsYXQuaCBiL2RyaXZl
cnMvdXNiL2hvc3QveGhjaS1wbGF0LmgNCj4gaW5kZXggMDA3NTFkODUxODMxLi5jNTA0Mjc2NmE0
ODYgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvdXNiL2hvc3QveGhjaS1wbGF0LmgNCj4gKysrIGIv
ZHJpdmVycy91c2IvaG9zdC94aGNpLXBsYXQuaA0KPiBAQCAtMjIsNiArMjIsNyBAQCBzdHJ1Y3Qg
eGhjaV9wbGF0X3ByaXYgew0KPiAgCWludCAoKnN1c3BlbmRfcXVpcmspKHN0cnVjdCB1c2JfaGNk
ICopOw0KPiAgCWludCAoKnJlc3VtZV9xdWlyaykoc3RydWN0IHVzYl9oY2QgKik7DQo+ICAJaW50
ICgqcG9zdF9yZXN1bWVfcXVpcmspKHN0cnVjdCB1c2JfaGNkICopOw0KPiArCWVudW0gdXNiX2xp
bmtfdHVubmVsX21vZGUgKCp0dW5uZWxfbW9kZSkoc3RydWN0IHVzYl9oY2QgKmhjZCwgaW50IHBv
cnRudW0pOw0KPiAgfTsNCj4gIA0KPiAgI2RlZmluZSBoY2RfdG9feGhjaV9wcml2KGgpICgoc3Ry
dWN0IHhoY2lfcGxhdF9wcml2ICopaGNkX3RvX3hoY2koaCktPnByaXYpDQo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL3VzYi9ob3N0L3hoY2kuYyBiL2RyaXZlcnMvdXNiL2hvc3QveGhjaS5jDQo+IGlu
ZGV4IDVmYjc4NjEzYTk5My4uYTdlM2M0NjkzN2ZhIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3Vz
Yi9ob3N0L3hoY2kuYw0KPiArKysgYi9kcml2ZXJzL3VzYi9ob3N0L3hoY2kuYw0KPiBAQCAtNDc2
Miw3ICs0NzYyLDggQEAgc3RhdGljIGludCB4aGNpX3VwZGF0ZV9kZXZpY2Uoc3RydWN0IHVzYl9o
Y2QgKmhjZCwgc3RydWN0IHVzYl9kZXZpY2UgKnVkZXYpDQo+ICAJaWYgKGhjZC0+c3BlZWQgPj0g
SENEX1VTQjMgJiYgIXVkZXYtPnBhcmVudC0+cGFyZW50KSB7DQo+ICAJCXBvcnQgPSB4aGNpLT51
c2IzX3JodWIucG9ydHNbdWRldi0+cG9ydG51bSAtIDFdOw0KPiAgDQo+IC0JCXVkZXYtPnR1bm5l
bF9tb2RlID0geGhjaV9wb3J0X2lzX3R1bm5lbGVkKHhoY2ksIHBvcnQpOw0KPiArCQl1ZGV2LT50
dW5uZWxfbW9kZSA9IHhoY2lfcG9ydF90dW5uZWxfbW9kZSh4aGNpLCBwb3J0KTsNCj4gKw0KPiAg
CQlpZiAodWRldi0+dHVubmVsX21vZGUgPT0gVVNCX0xJTktfVU5LTk9XTikNCj4gIAkJCWRldl9k
YmcoJnVkZXYtPmRldiwgImxpbmsgdHVubmVsIHN0YXRlIHVua25vd25cbiIpOw0KPiAgCQllbHNl
IGlmICh1ZGV2LT50dW5uZWxfbW9kZSA9PSBVU0JfTElOS19UVU5ORUxFRCkNCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvdXNiL2hvc3QveGhjaS5oIGIvZHJpdmVycy91c2IvaG9zdC94aGNpLmgNCj4g
aW5kZXggNDgwZmNiYWM0NTI1Li4yYjVjMGIzMDRjNmIgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMv
dXNiL2hvc3QveGhjaS5oDQo+ICsrKyBiL2RyaXZlcnMvdXNiL2hvc3QveGhjaS5oDQo+IEBAIC0x
Njc1LDYgKzE2NzUsOSBAQCBzdHJ1Y3QgeGhjaV9oY2Qgew0KPiAgCXN0cnVjdCBsaXN0X2hlYWQJ
cmVnc2V0X2xpc3Q7DQo+ICANCj4gIAl2b2lkCQkJKmRiYzsNCj4gKw0KPiArCWVudW0gdXNiX2xp
bmtfdHVubmVsX21vZGUgKCp0dW5uZWxfbW9kZSkoc3RydWN0IHVzYl9oY2QgKmhjZCwgaW50IHBv
cnRudW0pOw0KPiArDQo+ICAJLyogcGxhdGZvcm0tc3BlY2lmaWMgZGF0YSAtLSBtdXN0IGNvbWUg
bGFzdCAqLw0KPiAgCXVuc2lnbmVkIGxvbmcJCXByaXZbXSBfX2FsaWduZWQoc2l6ZW9mKHM2NCkp
Ow0KPiAgfTsNCj4gQEAgLTE5ODEsNyArMTk4NCw3IEBAIGludCB4aGNpX2h1Yl9jb250cm9sKHN0
cnVjdCB1c2JfaGNkICpoY2QsIHUxNiB0eXBlUmVxLCB1MTYgd1ZhbHVlLCB1MTYgd0luZGV4LA0K
PiAgaW50IHhoY2lfaHViX3N0YXR1c19kYXRhKHN0cnVjdCB1c2JfaGNkICpoY2QsIGNoYXIgKmJ1
Zik7DQo+ICBpbnQgeGhjaV9maW5kX3Jhd19wb3J0X251bWJlcihzdHJ1Y3QgdXNiX2hjZCAqaGNk
LCBpbnQgcG9ydDEpOw0KPiAgc3RydWN0IHhoY2lfaHViICp4aGNpX2dldF9yaHViKHN0cnVjdCB1
c2JfaGNkICpoY2QpOw0KPiAtZW51bSB1c2JfbGlua190dW5uZWxfbW9kZSB4aGNpX3BvcnRfaXNf
dHVubmVsZWQoc3RydWN0IHhoY2lfaGNkICp4aGNpLA0KPiArZW51bSB1c2JfbGlua190dW5uZWxf
bW9kZSB4aGNpX3BvcnRfdHVubmVsX21vZGUoc3RydWN0IHhoY2lfaGNkICp4aGNpLA0KPiAgCQkJ
CQkJc3RydWN0IHhoY2lfcG9ydCAqcG9ydCk7DQo+ICB2b2lkIHhoY2lfaGNfZGllZChzdHJ1Y3Qg
eGhjaV9oY2QgKnhoY2kpOw0KPiAgDQo+IA0KPiAtLSANCj4gMi41NS4wDQo+IA0KDQpSZXZpZXdl
ZC1ieTogVGhpbmggTmd1eWVuIDxUaGluaC5OZ3V5ZW5Ac3lub3BzeXMuY29tPg0KDQpUaGFua3Ms
DQpUaGluaA==
