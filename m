Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.12
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793250874;
	b=c4WkOL49P4jYOepb7JdaXnZkVhq2hhxxx2NH/h4oofAvbAEExs55hEKh1rWsqUP+8mMs
	 6JSIsGKSX1fIxomuWz3Uy51jNy4DOaW+3QyfeRPW+mOWkBtKTherQJLljzsO350FJC/gn
	 5ok/Vh49hLO2oSq+424dhDGi3WbDrYgLatpOoQuyOrs763MRhCXhBGUrhtwguWpwS36bB
	 GKoaOblcdItkm4f8o/fPu1DNFagaxjK1k+Fw13MxmpZt+ODIZQjgYWCK2Z9BMaKdFmCyB
	 +zgDwUrqyip0yk19lABoNPbQq8iyKH7hdO7bJQK9bxZokscciZtBDpWQvk6P9yxEI9Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793250874;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-AtpMessageProperties:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=eLt9R3+stVym7VnepFmwMZEhKxC68kHQpv91HQs7S7E=;
	b=3WaVVLUbry39dHpk4kqqoRW3B3bI27+ucsU9DbfQmwgBT6ubnBjm8tApltmdzcJTTR2F
	 byflGSfE9ENkh8ypcLzBXtAaD3P1WKJVgcvAxA78KN+Y7KBwXIXVslaJn8991Q9/I1wwP
	 2AOcncG9up/Fgo3x8qwZek4umWDXX1sKDLD+xwTTfmiojqz37JXeKbURO6mGSMY46ewjt
	 JYaWA5QT1bh0YA7LHEnJZHLZa37nqOMVMyeJg/rMXwdNE2xn0oWSfi2b9Kfcz+BSm8TXO
	 qqTLHRoi8KbEHYibJ140zDEvOJzuob3qDaU8zULw8ZfhvwPDewc+o423ROxEOdpXl5w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=altera.com;
	spf=pass smtp.mailfrom=altera.com;
	dkim=pass header.d=altera.com header.i=@altera.com header.a=rsa-sha256 header.s=selector2 header.b=drqOUGEE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.12
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011012.outbound.protection.outlook.com [40.107.208.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F376606A31C;
	Thu, 29 Oct 2026 05:14:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F376606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=altera.com header.i=@altera.com header.a=rsa-sha256 header.s=selector2 header.b=drqOUGEE
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MbLnwf53TWHD+J1/fFnOcyRYzxBRemfOJ+1kbeMgRJmZXlztkoMmagyosRT8i/IYAyw7F4aK69T08GJ4Y+t6FEd3SFz6CbzfWkDwFQEhkV5AC21ymVFzocX0usCz2jhMk+BWwjnm7Iwze9gYkDVqyhnOXQxIFYClVn3lAwWx79TjisJH7bo0pHuk37ur/tYUq71No8L62unXU4qOY9aRsOV+gUu32jFHgKzTyx4yAAG23YNfcB0yBgIJLB/mpwIRrOZRQ24BeWfRJ32IBnzfDNy7RxHVCgLf3xJ409p1jOmri8CVIvccUgj4/EbTDB+c98xc2eswHirTxqW0SHx48A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eLt9R3+stVym7VnepFmwMZEhKxC68kHQpv91HQs7S7E=;
 b=kswbpLlSrnaS8VUclXc6ieRab9+4vjJIlbkKNdLoSEbLG03U7oMJonSJQIFsUa8cGIRW3eKEY/txggWjwgDeR1tDxIo6/Ma230jgnk1BYGt3znM84QnhvmPcuJnZDvZWnHjRmBjWfg2XtQDTQHo2idh+MiHozQrNQlMimLOHQ2KWetSaerrvWehY2+dMboxs7MnsQM/OYPg1xEK8Xw1wbnc4rUUtjCmFTFwHQEgCLkpEoon2xwYwJKVZY7HIq+FtPvUgpp0ijmVr5e+/JGHUSwL5QOMdW1geQkdbyBbwwuI4ABeD6hEXQqfbXeKsn1SDXpj6ekiqTsMuUiKK9nKKlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eLt9R3+stVym7VnepFmwMZEhKxC68kHQpv91HQs7S7E=;
 b=drqOUGEEjeaRBV9iggcsT2cMIfx8/5FhiXYVMyD6/UBFK+MM/AWaEjxag5sT6/hSNaQwcqRBVy3wUO3s85MDBZ8UQ3TPxf8YHcvhz0M7s+hjQff/S8gjzVMIIpNONXAeF2EXWqocSWu2cxiVHK37Jdg0/cdGH+e+WfgeEaIq2mJ/0DHRf8B8UJhUP5dqFSCRK+3dmIG41brcpT6gQcbCYABc4riTViansnWu7vVr6g6sR0sRzi8aZciSP9WM3xlZ4/MiL92s1of/NbEzKtrBzRLLHqLMBnU4LOqpTztEhSp5TcColUvyVyFFnm0NVXBlDW3SPnCJYAIJMXkiVEaAzg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DS3PR03MB097838.namprd03.prod.outlook.com (2603:10b6:8:546::7)
 by DSSPR03MB989214.namprd03.prod.outlook.com (2603:10b6:8:374::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Thu, 29 Oct
 2026 05:14:31 +0000
Received: from DS3PR03MB097838.namprd03.prod.outlook.com
 ([fe80::fa39:2c18:c265:1d59]) by DS3PR03MB097838.namprd03.prod.outlook.com
 ([fe80::fa39:2c18:c265:1d59%6]) with mapi id 15.21.0569.007; Thu, 29 Oct 2026
 05:14:31 +0000
From: hang.suan.wang@altera.com
To: Dinh Nguyen <dinguyen@kernel.org>,
	linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Gabriel Whigham <gabewhigham@gmail.com>,
	Kiryl Shutsemau <kas@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	Will Deacon <will@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	linux-doc@vger.kernel.org
Cc: muhammad.nazim.amirul.nazle.asmade@altera.com,
	tze.yee.ng@altera.com,
	chee.nouk.phoon@altera.com,
	genevieve.chan@altera.com,
	adrian.ho.yin.ng@altera.com
Subject: [PATCH v8 3/3] firmware: socfpga-fcs: add Altera SoCFPGA FCS driver with SDOS feature
Date: Wed, 28 Oct 2026 22:14:21 -0700
Message-ID: <d2a662d1b783146e48642dc85c920008a02b433c.1793197438.git.hang.suan.wang@altera.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <cover.1793197438.git.hang.suan.wang@altera.com>
References: <cover.1793197438.git.hang.suan.wang@altera.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0016.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::21) To DS3PR03MB097838.namprd03.prod.outlook.com
 (2603:10b6:8:546::7)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PR03MB097838:EE_|DSSPR03MB989214:EE_
X-MS-Office365-Filtering-Correlation-Id: 18883793-e756-4a39-6f9c-08df357b8334
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|7416014|376014|921020|261028144727099003|5023799004|56012099006|11063799006|261009223027099003|261022075727099003|261022113327099003|261022115727099003|261022105027099003|261021121427099003|261021123027099003|261026130827099003|261026135527099003|261026140227099003|261021130227099003|261021135927099003|10067099003|261021133027099003|261026121527099003|18002099003|55112099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	UKOexeJon2N20tEZxJsuASwrFp4bOgxl9j6LfI3qbeiG5sf0o+psrPINbbLJKMbaVnVKbHDsKTBwftS/FOMXiL2P+W+XRvCLs66CIVeVpT1dyMjjEF7D2EuJL4CGnfIUCF7HU4gDif1CEd5jim8G1L/cC8ETe14UVdDJQ1urLioSROTqNRE6LVbAHHPBSrQJmlIH2pgOVQcVFzZk94Yum7Wjr1UY+thqdWeuzc2aU6BybtKWyqU3Nfi3ZdEdASbd2fwErP3FxFjDFarCKHuPUf7dBIzeRyPg63tz6tM7I3RSv1TXBRXYSMI5lh75PrKpO7nVwznXD/Vmvbx7SHsv1f5UwPPvY6l9bdAcvV5whhDJlh7Ax5MgaCeqj/AmR3xtdDO1Nqw1L2OSxZrlW622ecA8TrMM42ugXlJhcVOJIYXFyNR2ri/9eIjDqz9wqv9Wq06RcfhRyVHLk+ANFusRcWqunHJzFPCcI7ejbITnSwCCN/fAi+5YQALL3RgP63LIgRKnxP6O3ZTx+57LvgwLk/ubp5lCyRQBiudoj1Z3hV0sPUG2x1xvTIcUe4R3cZ99JYrW8YLbllXv7Id1vKIJABE4b+J2GTy7phlpy5CzCrzSzGUGy/Kolct1FjZ4ngeeKUk/Q9BvUL2MQSlh4Jive/5kY+K6UEH+skLGXtAI/yiRyWfOiiO0zlnsdpyXAQOrq9x5/1faO6xMMrJuWbAwqQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS3PR03MB097838.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(7416014)(376014)(921020)(261028144727099003)(5023799004)(56012099006)(11063799006)(261009223027099003)(261022075727099003)(261022113327099003)(261022115727099003)(261022105027099003)(261021121427099003)(261021123027099003)(261026130827099003)(261026135527099003)(261026140227099003)(261021130227099003)(261021135927099003)(10067099003)(261021133027099003)(261026121527099003)(18002099003)(55112099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eW9mT1NSeGpLT3BtK1lrZjNOZElXVmRINmNpbGRLUXZGL3RsaWE5akZyaUxh?=
 =?utf-8?B?SXZUdTdidFQvMW1xbUJoSTJmdDVWVWxHQzhKRTJndHNBRW8vMEttdGVRSmo4?=
 =?utf-8?B?Kzg4U3dVT0VoUlBQQnVWMXNvUWVBTmQrTTkwVkFTMlppNVYwQy84bm1QRUJn?=
 =?utf-8?B?RXRqalBOS1pRa2U3N0IvUlJTZEFvZDQzNkJLaE1Ta3o1MFBxYktoTWdWZkJB?=
 =?utf-8?B?cFZCaEZ5Vm95WFVUWGpjQTMyUWhNRmRLY1NCNDJISDNXZ2xiaituTWFwYnBC?=
 =?utf-8?B?RStqYldMd1BBZXcvcTFWa2tKNnpTa0tqVUU2UnRRRktIUlR5aUtUU083TjdT?=
 =?utf-8?B?cjBuck9ZWHRFRFRMNGdXUDR1bEZvSWErTDJ0TFE1eWVkR2VGQWRKNmt1Mk1I?=
 =?utf-8?B?MHJtaHE4MTRMN1l1Y09jWUVteGFDTS9YL0YyNzBJRUVtd1ZjSEJtSkxGbE5G?=
 =?utf-8?B?QkRlRjBKVGRtOTVHVWpnWEg2MEVyWTI4S3lEU0JyWGxVeE1yY2RwRGJGUnhx?=
 =?utf-8?B?WFFTUHZLc3hxcUhvcDgxS3lreDVJU253U29iaFdBSzd4VlFtbGxjRDEzcWdo?=
 =?utf-8?B?OWNJa0pmV05SWG9jSkoydDU2aXQ2VEkvMlZRM0tEY25ycmF3STJDREFTaEE2?=
 =?utf-8?B?REYrellISnNJSTB3bDJLVkp1UkRjSi96cDdXUkU5MExNeDVWM21JL3ZrOW92?=
 =?utf-8?B?bkR2ZnE0emhpdFJRRUtLc0xlYkY5eU1DWVdUN0ZiL3VGZGd2YldVY1VvbmJ5?=
 =?utf-8?B?cDZoOEFUWi9KeS82bnAzcVZua0VLNU10VFAwSk1MUTkyV0Q4ZU5QU0tvWGJW?=
 =?utf-8?B?QnU2VmxpSnVrSk9YTXBIK0JwY0lWUVZxL3ZISUxMNG8wVDdrZ3g2RGhuWlJ0?=
 =?utf-8?B?UTRxZDN1MkZMTThTREZPbXFTTWF2VXFDSjhQUVdPNE1WSnBUemVzOW5pWFFi?=
 =?utf-8?B?Qk9JZkFHQ1I3Z1pIejBBSG9XdEVVQzluTzJMaGJqbWVyM1d3U05oV29kU2ZB?=
 =?utf-8?B?d0VGY29mVTZEWjZaTnJwazB4NUhjMHFXbHN3R2RpM1QwakEwRjd6SXJselpF?=
 =?utf-8?B?R1hjUDFBbzJQeGhnNllFMjJkenE0TmNNMC85Ym90MUF1eVd6M0F6NUJ6dU5P?=
 =?utf-8?B?ZXU0Q2hjdTFLM29GOEI2TDdiYXplR2lZaHZzNWhUa2lzamtneGFZNmgvdjhN?=
 =?utf-8?B?bFlTcC9hQnhhZElveXowYXRobGtDcmVEVVFCMW54enRZajFyV3piQUJIMUVz?=
 =?utf-8?B?VC9sNUFiU1NGQVh0bEZHcXhnSlRnQkdnb1BtbnIra0ZGL2VTblNDV0J6VWVE?=
 =?utf-8?B?NlkxbC92SGc4b1UyWW40bDdRUlQ5Mm1MenYwcFVzbnMwZGRMS0tpTndyQUVH?=
 =?utf-8?B?SWZFQTdjQ1h3OEdyTHlZMzVNK0JwVmIyQllqSHFQZ2VqMmdyeUx6NHlkMTdq?=
 =?utf-8?B?K3ZWRXpqb2JycW9JYkpUcU1Wck5PZGl3Yng2WlFaY2lOT2hybEk2R2xsUzk2?=
 =?utf-8?B?NmtPZDN4Qkx2TDJDa1RlWHU0UnZxM3haWnM1UzZSRDB5Zko1VGZCQ0dEQ0cx?=
 =?utf-8?B?UnhmUXlvRTEyMm1ua2dmRlU3ZjRNOFJTeU04ZTVYb0IwL0VhMm16b0RGUFl2?=
 =?utf-8?B?N2lIUldLd254VTBIellEaXhNVVlCcVl2QkJsWGJNTnNXWCtZSFNWVCtsWVpq?=
 =?utf-8?B?RVVRbWRQeDRZc0ZvMzhONGNuUVNEWTFsbGYxNWl2SzN6RkRJVzJvSjlMVk5N?=
 =?utf-8?B?TXpBTjZYempIOWpicjJtSHF4TkV6TmpaUGlSSEs2WFpNNUNialBvVmptMGxP?=
 =?utf-8?B?dVJKRjZTS0VNazVWcmdiNlFwa2E3UkNnNTBqQ2JHVGtuUEhidW1hOTNTMm5L?=
 =?utf-8?B?VXpoVHcrbUEweFJLQlVDMFFKSFZ4Ti8xZngwdnA0TXA0MUtBVDIyVmJrS3h4?=
 =?utf-8?B?SVZkaXRoV0NoMmNpK2w5TDlIZVVNSXc4RFd3T1F1YWxhMmlYQzdzdzE2cWEr?=
 =?utf-8?B?a0R2NFJrcGR0dFRSUG0rT2RUdnVNWVFzLzdnYVlOV1FEeUFKMVRESzFMczl5?=
 =?utf-8?B?WndyZXRTNURKNEpseVhmVHcrRFRwWWJYVnZaT0RpTUEzOUU2MnA4NS9jSDNa?=
 =?utf-8?B?S0YzSURnemxyMG4wclN1T05lMzExRm9hT1BVbk5ZUjI0OU4rc0l4cmJWbXRV?=
 =?utf-8?B?aUo4YjZQd0NEaS95bllZRUxDd3JWT20xR3Z4VjduYVBhcHd4WUNHZW5BaFAz?=
 =?utf-8?B?aWprWWc0QTZUVVltL0h3ODFOL25nRGNpVG1sYWFXN3BmWWo1NmlQU0xNRWVo?=
 =?utf-8?B?am1RSnFUbzl5aGtqcXJYT3VLSG1lUWpxdjBCdlRON3g3T0QycTBqZz09?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18883793-e756-4a39-6f9c-08df357b8334
X-MS-Exchange-CrossTenant-AuthSource: DS3PR03MB097838.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 05:14:30.9469
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IhogITBC01XR9+Zbatb4xuCG4hsNArTaTJXxevxIv6pSvjRxYBOYZW+8ly3G8JGPK1nWs7eQWucgCDxzHBw5DI/PKZ4HbL2x/h3Kie8459Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSSPR03MB989214

From: Hang Suan Wang <hang.suan.wang@altera.com>

The Secure Device Manager (SDM) is a hardware security manager in Altera
SoCFPGA. It provides the Secure Data Object Store (SDOS), a service for
encrypting and decrypting data.

This patch adds the Altera SoCFPGA Crypto Service (FCS) driver, allowing
non-secure Linux software to request SDOS operations. Requests pass through
the SoCFPGA service layer (svc) to ARM Trusted Firmware (ATF), which
forwards permitted requests to the SDM.

The SDOS protects data at rest: the SDM encrypts and decrypts using a key
derived from a device-unique SDOS root key plus an SDM-generated IV, so
the host never handles raw key material or IVs. It only submits plaintext
it already owns and receives authenticated ciphertext objects managed by
the SDM. A primary use case is installing operational keys without ever
appearing in cleartext.

The driver is a standalone module and describes no hardware of its own.
It binds by name to the "stratix10-fcs" platform device registered by
stratix10-svc, so no device-tree node is required. SDOS requests go to
the SDM through the stratix10-svc asynchronous SIP SMC path using
service-layer memory pool buffers that the SDM can reach via physical or
SMMU-remapped addresses. Userspace talks to /dev/socfpga-fcs via ioctl
and sysfs exposes atf_version.

For encryption the SDM returns a structured object (header, ciphertext,
HMAC). For decryption the SDM validates the HMAC and enforces the 64-bit
owner ID from the object header so only the creator can decrypt it.

The user opens one SDM crypto session, sends one or more commands such
as SDOS, and closes the session when finished. The session stays open
across those commands. Each command takes priv->lock, so only one
request is in flight at a time. If the file that owns the session is
closed, including on process exit, the driver closes the session.

Signed-off-by: Hang Suan Wang <hang.suan.wang@altera.com>
---
 .../sysfs-devices-platform-stratix10-fcs      |  22 +
 Documentation/misc-devices/index.rst          |   1 +
 Documentation/misc-devices/socfpga-fcs.rst    | 171 ++++
 .../userspace-api/ioctl/ioctl-number.rst      |   1 +
 MAINTAINERS                                   |  11 +
 drivers/firmware/Kconfig                      |  17 +
 drivers/firmware/Makefile                     |   2 +
 drivers/firmware/socfpga-fcs-core.c           | 760 ++++++++++++++++++
 drivers/firmware/socfpga-fcs.c                | 304 +++++++
 include/linux/firmware/intel/socfpga-fcs.h    | 148 ++++
 include/uapi/misc/socfpga-fcs-crypto.h        | 118 +++
 11 files changed, 1555 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-devices-platform-stratix10-fcs
 create mode 100644 Documentation/misc-devices/socfpga-fcs.rst
 create mode 100644 drivers/firmware/socfpga-fcs-core.c
 create mode 100644 drivers/firmware/socfpga-fcs.c
 create mode 100644 include/linux/firmware/intel/socfpga-fcs.h
 create mode 100644 include/uapi/misc/socfpga-fcs-crypto.h

diff --git a/Documentation/ABI/testing/sysfs-devices-platform-stratix10-fcs b/Documentation/ABI/testing/sysfs-devices-platform-stratix10-fcs
new file mode 100644
index 000000000000..589580c2343f
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-devices-platform-stratix10-fcs
@@ -0,0 +1,22 @@
+	Intel Stratix10 / Altera Agilex FPGA Crypto Service (FCS) device
+	attributes
+
+What:		/sys/devices/platform/stratix10-fcs.0/atf_version
+Date:		October 2026
+KernelVersion:	7.3
+Contact:	Hang Suan Wang <hang.suan.wang@altera.com>
+Contact:	Genevieve Chan <genevieve.chan@altera.com>
+Description:
+		(RO) Arm Trusted Firmware build version reported by the
+		Secure Device Manager. User can query the ATF build version
+		at runtime, through the stratix10-svc mailbox, while probing,
+		and serves the cached result afterwards.
+
+		The file contains three unsigned decimal numbers, the major,
+		minor and patch version, separated by dots and terminated by
+		a newline::
+
+			%u.%u.%u
+
+		A read fails with ENODATA when that probe-time query produced
+		no version.
diff --git a/Documentation/misc-devices/index.rst b/Documentation/misc-devices/index.rst
index f911edaecbfa..9cefd8bc15a7 100644
--- a/Documentation/misc-devices/index.rst
+++ b/Documentation/misc-devices/index.rst
@@ -24,6 +24,7 @@ fit into other categories.
    mrvl_cn10k_dpi
    oxsemi-tornado
    pci-endpoint-test
+   socfpga-fcs
    spear-pcie-gadget
    tps6594-pfsm
    uacce
diff --git a/Documentation/misc-devices/socfpga-fcs.rst b/Documentation/misc-devices/socfpga-fcs.rst
new file mode 100644
index 000000000000..effdc04e074d
--- /dev/null
+++ b/Documentation/misc-devices/socfpga-fcs.rst
@@ -0,0 +1,171 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+===================================
+Altera SoCFPGA Crypto Service (FCS)
+===================================
+
+Overview
+========
+
+The Secure Device Manager (SDM) is the hardware security controller in Altera
+SoCFPGA devices. It offers a runtime cryptographic interface, the FPGA Crypto
+Service (FCS), which the host reaches through the stratix10-svc mailbox using
+Arm Trusted Firmware SIP SMC calls.
+
+The caller owns the crypto session lifecycle: open it once with
+``FCS_IOC_OPEN_SESSION`` and close it with ``FCS_IOC_CLOSE_SESSION`` (also
+performed automatically when the file descriptor is closed, including on
+process exit). Only one session may be open at a time across the whole
+device, and it belongs to the file description that opened it: other files
+cannot run commands on it or close it. Opens from other files fail with
+``EBUSY`` until the session is closed. A descriptor shared through ``fork()``
+or ``dup()`` refers to the same file description and therefore shares the
+session. The per-request context ID is managed by the kernel internally
+and is not part of the user ABI.
+
+This driver exposes one FCS operation: the Secure Data Object Service (SDOS),
+which encrypts and decrypts data at rest. The SDM derives the working key from
+a device-unique SDOS root key that never leaves the secure boundary, so the
+host never handles raw key material. A primary use case is black-key
+provisioning.
+
+
+Why a dedicated ioctl
+=====================
+
+SDOS seals and unseals arbitrary application data of up to 32 KiB, not keys of
+a bounded size, so the keyring payload limits of the trusted-keys subsystem do
+not apply to it. The object it produces is a firmware-defined container rather
+than a generic AEAD output, no key is ever set from the host so the crypto API
+has nothing to bind a transform to, and the SDM returns per-operation status
+values that must reach the caller alongside a valid result.
+
+Device node
+===========
+
+The driver registers a misc device::
+
+    /dev/socfpga-fcs
+
+Opening it takes a reference on the driver state. If the driver is unbound
+while the file is open, subsequent operations fail with ``ENODEV`` rather than
+tearing the file descriptor out from under the caller.
+
+Buffer sizes
+============
+
+An SDOS object consists of a 40-byte firmware-defined header, the payload, and
+for an encrypted object a trailing 48-byte HMAC. The payload is between 32 and
+32672 bytes.
+
+==================  ==================  ==============
+``op_mode``         ``src_size`` range  Maximum output
+==================  ==================  ==============
+non-zero (encrypt)  72 .. 32712 bytes   32760 bytes
+zero (decrypt)      120 .. 32760 bytes  32712 bytes
+==================  ==================  ==============
+
+Size the output buffer for the maximum shown above. The SDM reports the exact
+produced length once the operation completes.
+
+Data structures
+===============
+
+.. kernel-doc:: include/uapi/misc/socfpga-fcs-crypto.h
+   :identifiers: fcs_ioc_sdos
+
+Driver IOCTLs
+=============
+
+.. c:macro:: FCS_IOC_OPEN_SESSION
+.. kernel-doc:: include/uapi/misc/socfpga-fcs-crypto.h
+   :doc: FCS_IOC_OPEN_SESSION
+
+.. c:macro:: FCS_IOC_CLOSE_SESSION
+.. kernel-doc:: include/uapi/misc/socfpga-fcs-crypto.h
+   :doc: FCS_IOC_CLOSE_SESSION
+
+.. c:macro:: FCS_IOC_SDOS
+.. kernel-doc:: include/uapi/misc/socfpga-fcs-crypto.h
+   :doc: FCS_IOC_SDOS
+
+Return value
+============
+
+On success 0 is returned and, for ``FCS_IOC_SDOS``, the ``__u32`` addressed
+by ``dst_size`` holds the number of bytes the SDM produced. On error -1 is
+returned and ``errno`` is set.
+
+=========== ================================================================
+Error       Description
+=========== ================================================================
+EINVAL      ``dst`` or ``dst_size`` was NULL, or ``src_size`` was out of
+            range for ``op_mode``.
+EMSGSIZE    The output did not fit in ``dst``. The operation itself
+            succeeded and ``error_code`` holds the SDM status, but the
+            result is discarded, so ``dst`` must be sized for the maximum
+            output.
+EFAULT      One of the supplied addresses was not accessible.
+EIO         The SDM reported a fatal error. ``error_code`` holds the status
+            for ``FCS_IOC_SDOS``.
+ENODEV      The device was unbound while the file descriptor was open.
+ENOMEM      Staging buffers could not be allocated.
+ENOTCONN    ``FCS_IOC_SDOS`` was issued with no crypto session open. Open
+            one first with ``FCS_IOC_OPEN_SESSION``.
+EBUSY       ``FCS_IOC_OPEN_SESSION`` was issued while a session was already
+            open. Retry once that session is closed.
+EPERM       ``FCS_IOC_SDOS`` or ``FCS_IOC_CLOSE_SESSION`` was issued on a
+            session owned by another file.
+ERESTARTSYS A signal arrived while waiting for another request to finish.
+            Only one SDM transaction is in flight at a time.
+=========== ================================================================
+
+SDM status values
+=================
+
+The ``__s32`` addressed by ``error_code`` carries the firmware status. Two
+decrypt results are successes that carry a warning: the ioctl returns 0 for
+both and the plaintext is in ``dst``.
+
+======= ================================================================
+Status  Description
+======= ================================================================
+0x000   The operation completed successfully.
+0x102   Decryption succeeded; reprovisioning the key is recommended.
+0x103   Decryption succeeded, but not with the latest key.
+======= ================================================================
+
+Any other non-zero status is fatal and the ioctl fails with ``EIO``.
+
+User-space usage
+================
+A sample userspace application demonstrating these ioctls can be found at
+`Git Repository - altera-fpga/libfcs <https://github.com/altera-fpga/libfcs>`_
+
+Decrypting an object::
+
+    __u8 out[32712];                /* maximum decrypt output */
+    __u32 out_len = sizeof(out);
+    __s32 status = 0;
+
+    struct fcs_ioc_sdos arg = {
+            .error_code = (__u64)(uintptr_t)&status,
+            .src        = (__u64)(uintptr_t)in,
+            .src_size   = in_len,
+            .dst        = (__u64)(uintptr_t)out,
+            .dst_size   = (__u64)(uintptr_t)&out_len,
+            .op_mode    = 0,        /* decrypt */
+    };
+
+    if (ioctl(fd, FCS_IOC_OPEN_SESSION, NULL) != 0) {
+            fprintf(stderr, "open session failed: %m\n");
+            goto done;
+    }
+
+    if (ioctl(fd, FCS_IOC_SDOS, &arg) == 0)
+            /* out_len bytes of plaintext in out */
+            write(STDOUT_FILENO, out, out_len);
+    else
+            fprintf(stderr, "SDOS failed: %m, SDM status 0x%x\n", status);
+
+    ioctl(fd, FCS_IOC_CLOSE_SESSION, NULL);
diff --git a/Documentation/userspace-api/ioctl/ioctl-number.rst b/Documentation/userspace-api/ioctl/ioctl-number.rst
index 2fc53093752d..a1e07f7f6870 100644
--- a/Documentation/userspace-api/ioctl/ioctl-number.rst
+++ b/Documentation/userspace-api/ioctl/ioctl-number.rst
@@ -348,6 +348,7 @@ Code  Seq#    Include File                                             Comments
                                                                        <mailto:luzmaximilian@gmail.com>
 0xA6  00-0F  uapi/linux/alloc_tag.h                                    Memory allocation profiling
                                                                        <mailto:surenb@google.com>
+0xA6  00-1F  uapi/misc/socfpga-fcs-crypto.h                            Altera SoCFPGA FCS (Crypto Service)
 0xAA  00-3F  linux/uapi/linux/userfaultfd.h
 0xAB  00-1F  linux/nbd.h
 0xAC  00-1F  linux/raw.h
diff --git a/MAINTAINERS b/MAINTAINERS
index 3a19da74d00c..e1367d1c4631 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -945,6 +945,17 @@ ALPS PS/2 TOUCHPAD DRIVER
 R:	Pali Rohár <pali@kernel.org>
 F:	drivers/input/mouse/alps.*
 
+ALTERA FCS DRIVER
+M:	Hang Suan Wang <hang.suan.wang@altera.com>
+M:	Genevieve Chan <genevieve.chan@altera.com>
+L:	linux-kernel@vger.kernel.org
+S:	Maintained
+F:	Documentation/ABI/testing/sysfs-devices-platform-stratix10-fcs
+F:	Documentation/misc-devices/socfpga-fcs.rst
+F:	drivers/firmware/socfpga-fcs*
+F:	include/linux/firmware/intel/socfpga-fcs*
+F:	include/uapi/misc/socfpga-fcs*
+
 ALTERA MAILBOX DRIVER
 M:	Tien Sung Ang <tiensung.ang@altera.com>
 S:	Maintained
diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
index b7cc11e4fbfa..15727855fd5f 100644
--- a/drivers/firmware/Kconfig
+++ b/drivers/firmware/Kconfig
@@ -193,6 +193,23 @@ config INTEL_STRATIX10_RSU
 
 	  Say Y here if you want Intel RSU support.
 
+config ALTERA_SOCFPGA_FCS
+	tristate "Altera SoCFPGA Crypto Services (FCS)"
+	depends on INTEL_STRATIX10_SERVICE
+	help
+	  Altera SoCFPGA Crypto Services (FCS) driver gives user space
+	  access to the crypto services of the Secure Device Manager (SDM)
+	  through the Intel Service Layer, with requests forwarded to Arm
+	  Trusted Firmware.
+
+	  The SDM executes or authorizes the requests using device-rooted
+	  security resources. Protected key material stays within the
+	  secure firmware boundary and is never exposed to non-secure host
+	  software.
+
+	  Say Y here to add support for Altera SoCFPGA Crypto Services
+	  (FCS).
+
 config MTK_ADSP_IPC
 	tristate "MTK ADSP IPC Protocol driver"
 	depends on MTK_ADSP_MBOX
diff --git a/drivers/firmware/Makefile b/drivers/firmware/Makefile
index be46f1e1dc77..b489548ef3b8 100644
--- a/drivers/firmware/Makefile
+++ b/drivers/firmware/Makefile
@@ -2,6 +2,8 @@
 #
 # Makefile for the linux kernel.
 #
+obj-$(CONFIG_ALTERA_SOCFPGA_FCS) += altera-fcs.o
+altera-fcs-y := socfpga-fcs.o socfpga-fcs-core.o
 obj-$(CONFIG_ARM_SCPI_PROTOCOL)	+= arm_scpi.o
 obj-$(CONFIG_ARM_SDE_INTERFACE)	+= arm_sdei.o
 obj-$(CONFIG_ARM_SDEI_NMI)	+= arm_sdei_nmi.o
diff --git a/drivers/firmware/socfpga-fcs-core.c b/drivers/firmware/socfpga-fcs-core.c
new file mode 100644
index 000000000000..6ecee8e649e9
--- /dev/null
+++ b/drivers/firmware/socfpga-fcs-core.c
@@ -0,0 +1,760 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026 Altera Corporation
+ */
+
+#include <linux/delay.h>
+#include <linux/err.h>
+#include <linux/random.h>
+#include <linux/slab.h>
+#include <linux/unaligned.h>
+#include <linux/firmware/intel/socfpga-fcs.h>
+#include <linux/firmware/intel/stratix10-svc-client.h>
+
+#define OWNER_ID_OFFSET				12
+
+#define SDOS_DECRYPTION_REPROVISION_KEY_WARN	0x102
+#define SDOS_DECRYPTION_NOT_LATEST_KEY_WARN	0x103
+
+#define MSG_RETRY				3
+#define FCS_RETRY_SLEEP_MS			1
+
+struct fcs_cmd_params {
+	const void	*src;
+	void		*dst;
+	u32		src_len;
+	u32		dst_len;
+	u32		op_mode;
+	u64		own;
+};
+
+/**
+ * fcs_atf_version_callback() - service-layer callback for the ATF version query
+ * @client: pointer to the stratix10-svc client
+ * @data: pointer to the service-layer callback data
+ */
+static void fcs_atf_version_callback(struct stratix10_svc_client *client,
+				     struct stratix10_svc_cb_data *data)
+{
+	struct socfpga_fcs_priv *p = client->priv;
+
+	p->status = data->status;
+	if (data->status == BIT(SVC_STATUS_OK)) {
+		p->status = 0;
+		p->atf_version[0] = lower_32_bits(*(unsigned long *)data->kaddr1);
+		p->atf_version[1] = lower_32_bits(*(unsigned long *)data->kaddr2);
+		p->atf_version[2] = lower_32_bits(*(unsigned long *)data->kaddr3);
+		p->atf_version_valid = true;
+	} else if (data->status == BIT(SVC_STATUS_ERROR)) {
+		p->status = lower_32_bits(*(unsigned long *)data->kaddr1);
+		dev_err(client->dev, "mbox_error=0x%x\n", p->status);
+	}
+
+	complete(&p->completion);
+}
+
+/**
+ * fcs_async_callback() - completion callback for an async service request
+ * @ptr: pointer to the completion to signal
+ */
+static void fcs_async_callback(void *ptr)
+{
+	if (ptr)
+		complete(ptr);
+}
+
+/**
+ * fcs_svc_send_sync() - run a command on the synchronous service path
+ * @msg: service-layer message to send
+ * @timeout: time to wait for the response
+ * Return: 0 on success, negative errno on failure.
+ */
+static int fcs_svc_send_sync(struct socfpga_fcs_priv *priv,
+			     struct stratix10_svc_client_msg *msg,
+			     unsigned long timeout)
+{
+	int ret;
+
+	reinit_completion(&priv->completion);
+
+	/*
+	 * receive_cb is only used by the sync send path; leave it set so a
+	 * late response cannot find a NULL callback.
+	 */
+	priv->client.receive_cb = fcs_atf_version_callback;
+
+	ret = stratix10_svc_send(priv->chan, msg);
+	if (ret) {
+		dev_err(priv->client.dev, "failed to send message to service channel\n");
+		priv->client.receive_cb = NULL;
+		return ret;
+	}
+
+	if (!wait_for_completion_timeout(&priv->completion,
+					 msecs_to_jiffies(timeout))) {
+		dev_err(priv->client.dev, "svc timeout to get completed status\n");
+		return -ETIMEDOUT;
+	}
+
+	return 0;
+}
+
+/**
+ * fcs_svc_send_async() - run a command on the asynchronous mailbox path
+ * @msg: service-layer message to send
+ * @timeout: time to wait for the response
+ *
+ * Return: 0 once the transaction completed, negative errno on transport
+ *         failure or timeout.
+ */
+static int fcs_svc_send_async(struct socfpga_fcs_priv *priv,
+			      struct stratix10_svc_client_msg *msg,
+			      unsigned long timeout)
+{
+	unsigned long deadline = jiffies + msecs_to_jiffies(timeout);
+	struct stratix10_svc_cb_data data;
+	void *handle = NULL;
+	int status, index;
+	int ret;
+
+	/*
+	 * Use priv->completion, not a stack one: on timeout this function
+	 * returns while the svc layer still holds a pointer to it.
+	 */
+	reinit_completion(&priv->completion);
+
+	for (index = 0; index < MSG_RETRY; index++) {
+		status = stratix10_svc_async_send(priv->chan, msg, &handle,
+						  fcs_async_callback,
+						  &priv->completion);
+		if (status == 0)
+			break;
+		msleep(FCS_RETRY_SLEEP_MS);
+	}
+
+	if (status || !handle) {
+		dev_err(priv->client.dev, "Failed to send async message\n");
+		/*
+		 * A NULL handle with a success status would otherwise be
+		 * reported as a completed transaction that never ran.
+		 */
+		return status ? status : -EIO;
+	}
+
+	ret = -ETIMEDOUT;
+	while (!time_after(jiffies, deadline)) {
+		status = stratix10_svc_async_poll(priv->chan, handle, &data);
+
+		if (status == 0) {
+			ret = 0;
+			break;
+		}
+
+		/*
+		 * Keep polling until the deadline. Leaving an in-flight
+		 * transaction orphans the SDM crypto session.
+		 */
+		ret = status;
+		msleep(FCS_RETRY_SLEEP_MS);
+	}
+
+	if (ret) {
+		dev_err(priv->client.dev, "Failed to poll async message\n");
+		goto out;
+	}
+
+	priv->status = data.status;
+
+	/*
+	 * For warnings 0x102/0x103 are success-with-warning (outdated key)
+	 * the plaintext is valid and fcs_sdos_crypt() still returns it.
+	 * Non-zero SDM status is a firmware result, not a transport failure.
+	 */
+	if (data.kaddr1)
+		priv->resp = lower_32_bits(*(unsigned long *)data.kaddr1);
+
+	if (data.status)
+		dev_err(priv->client.dev, "SDM mailbox status 0x%x\n", data.status);
+
+out:
+	stratix10_svc_async_done(priv->chan, handle);
+
+	return ret;
+}
+
+/**
+ * fcs_svc_send_request() - build and send an FCS command to the service layer
+ * @command: FCS command code to dispatch
+ * @timeout: time to wait for completion, in milliseconds
+ * @params: payload and arguments for @command, or NULL for commands that
+ *          carry none
+ *
+ * Return: 0 on success, negative errno on failure.
+ */
+static int fcs_svc_send_request(struct socfpga_fcs_priv *priv,
+				enum fcs_command_code command,
+				unsigned long timeout,
+				const struct fcs_cmd_params *params)
+{
+	struct stratix10_svc_client_msg *msg;
+	int ret = 0;
+
+	/*
+	 * The service layer keeps this message alive in its transaction handle
+	 * and still dereferences it from stratix10_svc_async_done(), so it
+	 * cannot live on our stack.
+	 */
+	msg = kzalloc_obj(*msg);
+	if (!msg)
+		return -ENOMEM;
+
+	priv->status = 0;
+	priv->resp = 0;
+
+	switch (command) {
+	case FCS_DEV_CRYPTO_OPEN_SESSION:
+		dev_dbg(priv->client.dev, "Sending command: COMMAND_FCS_CRYPTO_OPEN_SESSION\n");
+		msg->command = COMMAND_FCS_CRYPTO_OPEN_SESSION;
+		break;
+
+	case FCS_DEV_CRYPTO_CLOSE_SESSION:
+		dev_dbg(priv->client.dev, "Sending command: COMMAND_FCS_CRYPTO_CLOSE_SESSION with session_id: 0x%x\n",
+			priv->session_id);
+		msg->arg[0] = priv->session_id;
+		msg->command = COMMAND_FCS_CRYPTO_CLOSE_SESSION;
+		break;
+
+	case FCS_DEV_ATF_VERSION:
+		dev_dbg(priv->client.dev, "Sending command: COMMAND_SMC_ATF_BUILD_VER\n");
+		msg->command = COMMAND_SMC_ATF_BUILD_VER;
+		break;
+
+	case FCS_DEV_SDOS_DATA_EXT:
+		if (!params) {
+			ret = -EINVAL;
+			break;
+		}
+		dev_dbg(priv->client.dev, "Sending command: COMMAND_FCS_SDOS_DATA_EXT with session_id: 0x%x, context_id: 0x%x, op_mode: 0x%x, own: 0x%llx\n",
+			priv->session_id, priv->context_id,
+			params->op_mode, params->own);
+		msg->arg[0] = priv->session_id;
+		msg->arg[1] = priv->context_id;
+		msg->arg[2] = params->op_mode;
+		msg->arg[3] = params->own;
+		msg->payload = (void *)params->src;
+		msg->payload_length = params->src_len;
+		msg->payload_output = params->dst;
+		msg->payload_length_output = params->dst_len;
+		msg->command = COMMAND_FCS_SDOS_DATA_EXT;
+		break;
+
+	default:
+		dev_err(priv->client.dev, "Unknown command: 0x%x\n", command);
+		ret = -EINVAL;
+		break;
+	}
+
+	if (!ret) {
+		if (command == FCS_DEV_ATF_VERSION)
+			/* ATF fast call for simple command */
+			ret = fcs_svc_send_sync(priv, msg, timeout);
+		else
+			ret = fcs_svc_send_async(priv, msg, timeout);
+	}
+
+	kfree(msg);
+
+	return ret;
+}
+
+/**
+ * fcs_open_session_locked() - open a crypto session on the SDM
+ *
+ * Enforce the single-session rule and, on success, record the SDM session
+ * handle in @priv->session_id, mark @priv->session_opened and remember
+ * @owner. The caller must hold @priv->lock. @priv->status carries the
+ * mailbox status.
+ *
+ * Return: 0 on success, -EBUSY if a session is already open, or negative
+ *         errno on transport/mailbox failure.
+ */
+static int fcs_open_session_locked(struct socfpga_fcs_priv *priv,
+				   const void *owner)
+{
+	int ret;
+
+	lockdep_assert_held(&priv->lock);
+
+	if (priv->session_opened) {
+		/* SDM allows one crypto session at a time; caller-triggerable */
+		dev_dbg(priv->client.dev, "FCS: crypto session already opened\n");
+		return -EBUSY;
+	}
+
+	ret = fcs_svc_send_request(priv, FCS_DEV_CRYPTO_OPEN_SESSION,
+				   SVC_FCS_REQUEST_TIMEOUT_MS, NULL);
+	if (ret)
+		return ret;
+
+	if (priv->status)
+		return -EIO;
+
+	priv->session_id = priv->resp;
+	priv->session_opened = true;
+	priv->session_owner = owner;
+
+	return 0;
+}
+
+/**
+ * fcs_close_session_locked() - close the crypto session on the SDM
+ *
+ * Caller must hold @priv->lock. The local session id, @priv->session_opened
+ * and @priv->session_owner are cleared even if close fails, so a stuck
+ * session cannot block future opens.
+ *
+ * Return: 0 on success or when no session is open, negative errno otherwise.
+ */
+static int fcs_close_session_locked(struct socfpga_fcs_priv *priv)
+{
+	int ret;
+
+	lockdep_assert_held(&priv->lock);
+
+	if (!priv->session_opened)
+		/* nothing to close */
+		return 0;
+
+	ret = fcs_svc_send_request(priv, FCS_DEV_CRYPTO_CLOSE_SESSION,
+				   SVC_FCS_REQUEST_TIMEOUT_MS, NULL);
+
+	priv->session_id = 0;
+	priv->session_opened = false;
+	priv->session_owner = NULL;
+
+	if (!ret && priv->status)
+		ret = -EIO;
+
+	return ret;
+}
+
+/**
+ * fcs_ctx_begin() - open a crypto session
+ * @owner: opaque token identifying the session owner
+ *
+ * The lock is held only for the open-session round trip; the session then
+ * stays open, and each command on it takes @priv->lock for its own request
+ * and picks its own context ID (see fcs_sdos_crypt()).
+ *
+ * Return: 0 on success, -EBUSY if a session is already open, -ENODEV if the
+ *         device has been removed, -ERESTARTSYS if interrupted while waiting
+ *         for the lock, or a negative errno on transport/mailbox failure.
+ */
+int fcs_ctx_begin(struct socfpga_fcs_priv *priv, const void *owner)
+{
+	int ret;
+
+	if (mutex_lock_interruptible(&priv->lock))
+		return -ERESTARTSYS;
+
+	if (priv->removed) {
+		ret = -ENODEV;
+		goto unlock;
+	}
+
+	ret = fcs_open_session_locked(priv, owner);
+
+unlock:
+	mutex_unlock(&priv->lock);
+
+	return ret;
+}
+
+/**
+ * fcs_ctx_end() - finish the current context and close the session
+ * @owner: token passed to fcs_ctx_begin()
+ *
+ * Also called from file release, so it waits uninterruptibly for the lock:
+ * there is nobody left to retry, and skipping the close would leave the
+ * session open for good.
+ *
+ * Return: 0 on success or when no session is open, -EPERM if the session
+ *         belongs to another owner, negative errno on close failure.
+ */
+int fcs_ctx_end(struct socfpga_fcs_priv *priv, const void *owner)
+{
+	int ret;
+
+	mutex_lock(&priv->lock);
+
+	if (!priv->session_opened) {
+		ret = 0;
+		goto unlock;
+	}
+
+	if (priv->session_owner != owner) {
+		ret = -EPERM;
+		goto unlock;
+	}
+
+	priv->context_id = 0;
+	ret = fcs_close_session_locked(priv);
+
+unlock:
+	mutex_unlock(&priv->lock);
+
+	return ret;
+}
+
+/**
+ * fcs_get_atf_version() - return the cached Arm Trusted Firmware version
+ * @version: array of three u32 entries to receive the major, minor and patch
+ *           version numbers
+ *
+ * Return: 0 on success, -ENODEV if the driver is not initialised, -ENODATA if
+ *         the probe-time query produced no version.
+ */
+int fcs_get_atf_version(struct socfpga_fcs_priv *priv, u32 *version)
+{
+	if (!priv->atf_version_valid)
+		return -ENODATA;
+
+	memcpy(version, priv->atf_version, sizeof(priv->atf_version));
+
+	return 0;
+}
+
+/**
+ * fcs_sdos_output_size() - validate an SDOS input length and size its output
+ * @op_mode: non-zero to encrypt, zero to decrypt
+ * @src_len: length of the input, including the SDOS header
+ * @out_len: receives the output capacity the SDM may need
+ *
+ * Return: 0 on success, -EINVAL if @src_len is out of range for @op_mode.
+ */
+int fcs_sdos_output_size(u32 op_mode, u32 src_len, u32 *out_len)
+{
+	if (op_mode) {
+		/* encrypt: input is header + plaintext */
+		if (src_len < SDOS_DECRYPTED_MIN_SZ ||
+		    src_len > SDOS_DECRYPTED_MAX_SZ)
+			return -EINVAL;
+
+		*out_len = SDOS_ENCRYPTED_MAX_SZ;
+	} else {
+		/* decrypt: input is header + plaintext + HMAC */
+		if (src_len < SDOS_ENCRYPTED_MIN_SZ ||
+		    src_len > SDOS_ENCRYPTED_MAX_SZ)
+			return -EINVAL;
+
+		*out_len = SDOS_DECRYPTED_MAX_SZ;
+	}
+
+	return 0;
+}
+
+/**
+ * fcs_sdos_crypt() - perform an SDOS encrypt or decrypt operation
+ * @owner: token passed to fcs_ctx_begin() when the session was opened
+ * @req: request describing the operation, using plain kernel buffers
+ *
+ * Return: 0 on success, -ENOTCONN if no session is open, -EPERM if the
+ *         session belongs to another owner, other negative errno on failure.
+ */
+int fcs_sdos_crypt(struct socfpga_fcs_priv *priv, const void *owner,
+		   struct fcs_sdos_req *req)
+{
+	struct fcs_cmd_params params = { };
+	void *s_buf, *d_buf;
+	u32 output_size;
+	int ret;
+
+	if (!req->src || !req->dst)
+		return -EINVAL;
+
+	ret = fcs_sdos_output_size(req->op_mode, req->src_len, &output_size);
+	if (ret) {
+		dev_dbg(priv->client.dev, "Invalid SDOS src_size %u\n", req->src_len);
+		return ret;
+	}
+
+	/* The caller must have sized the output buffer for the worst case. */
+	if (req->dst_len < output_size)
+		return -EINVAL;
+
+	/*
+	 * Only one SDM transaction may be in flight. Wait interruptibly so
+	 * a blocked caller remains killable.
+	 */
+	if (mutex_lock_interruptible(&priv->lock))
+		return -ERESTARTSYS;
+
+	/*
+	 * The device may have been removed while this caller held only a file
+	 * reference.
+	 */
+	if (priv->removed) {
+		ret = -ENODEV;
+		goto unlock;
+	}
+
+	/*
+	 * Checked under the lock so the session cannot be closed or change
+	 * hands between this test and the command that uses it.
+	 */
+	if (!priv->session_opened) {
+		dev_dbg(priv->client.dev,
+			"SDOS: no crypto session open, call FCS_IOC_OPEN_SESSION first\n");
+		ret = -ENOTCONN;
+		goto unlock;
+	}
+
+	/*
+	 * The session belongs to whoever opened it; a non-owner must not be
+	 * able to run commands on it.
+	 */
+	if (priv->session_owner != owner) {
+		ret = -EPERM;
+		goto unlock;
+	}
+
+	/*
+	 * The mailbox buffers belong to the service-layer pool, which the
+	 * parent reclaims once the channel is gone. Allocate and release them
+	 * under the lock that fcs_mark_removed() also takes, so they can
+	 * never outlive priv->chan.
+	 */
+	s_buf = stratix10_svc_allocate_memory(priv->chan, req->src_len);
+	if (IS_ERR(s_buf)) {
+		ret = PTR_ERR(s_buf);
+		goto unlock;
+	}
+
+	d_buf = stratix10_svc_allocate_memory(priv->chan, output_size);
+	if (IS_ERR(d_buf)) {
+		ret = PTR_ERR(d_buf);
+		goto free_sbuf;
+	}
+
+	memcpy(s_buf, req->src, req->src_len);
+
+	/*
+	 * SDM requires a non-zero context ID per request. A fresh random
+	 * value per call, not per session, also keeps a late response to a
+	 * timed-out request from being mistaken for the reply to the next
+	 * one on the same session.
+	 */
+	priv->context_id = get_random_u32_above(0);
+
+	params.op_mode = req->op_mode;
+	params.src = s_buf;
+	params.src_len = req->src_len;
+	params.dst = d_buf;
+	params.dst_len = output_size;
+	/* Owner ID is stored little-endian in the SDOS header (offset 12) */
+	params.own = get_unaligned_le64((const u8 *)req->src + OWNER_ID_OFFSET);
+
+	/*
+	 * The session is never closed here on failure, for any reason
+	 * (transport failure, a fatal SDM status or a bad response size):
+	 * Option B puts the caller in charge of the session lifecycle, so a
+	 * failed request is reported and the session is left exactly as it
+	 * was. The caller decides whether to retry on the same session or
+	 * close it with FCS_IOC_CLOSE_SESSION.
+	 */
+	ret = fcs_svc_send_request(priv, FCS_DEV_SDOS_DATA_EXT,
+				   SVC_FCS_REQUEST_TIMEOUT_MS, &params);
+	if (ret) {
+		dev_err(priv->client.dev,
+			"Failed to send the cmd=%d,ret=%d\n", FCS_DEV_SDOS_DATA_EXT, ret);
+		goto free_dbuf;
+	}
+
+	req->status = priv->status;
+	req->status_valid = true;
+
+	if (priv->status &&
+	    priv->status != SDOS_DECRYPTION_REPROVISION_KEY_WARN &&
+	    priv->status != SDOS_DECRYPTION_NOT_LATEST_KEY_WARN) {
+		ret = -EIO;
+		dev_err(priv->client.dev,
+			"Failed to perform SDOS operation ret: %d Mailbox Status = 0x%x\n",
+			ret, priv->status);
+		goto free_dbuf;
+	}
+
+	if (priv->resp > output_size) {
+		dev_err(priv->client.dev, "SDOS output %u exceeds kernel buffer %u\n",
+			priv->resp, output_size);
+		ret = -EIO;
+		goto free_dbuf;
+	}
+
+	memcpy(req->dst, d_buf, priv->resp);
+	req->dst_len = priv->resp;
+
+free_dbuf:
+	stratix10_svc_free_memory(priv->chan, d_buf);
+free_sbuf:
+	stratix10_svc_free_memory(priv->chan, s_buf);
+unlock:
+	mutex_unlock(&priv->lock);
+
+	return ret;
+}
+
+/**
+ * fcs_read_version_from_atf() - query the Arm Trusted Firmware build version
+ * Send the ATF version command to the SDM and cache the result in @priv.
+ *
+ * Return: 0 on success, negative errno on failure.
+ */
+static int fcs_read_version_from_atf(struct socfpga_fcs_priv *priv)
+{
+	int ret;
+
+	ret = fcs_svc_send_request(priv, FCS_DEV_ATF_VERSION,
+				   SVC_FCS_REQUEST_TIMEOUT_MS, NULL);
+	if (ret) {
+		dev_err(priv->client.dev,
+			"Failed to send the cmd=%d,ret=%d\n",
+			FCS_DEV_ATF_VERSION, ret);
+		goto svc_done;
+	}
+
+	if (priv->status) {
+		ret = -EIO;
+		dev_err(priv->client.dev,
+			"Mailbox error, Failed to read ATF version ret: %d\n", ret);
+	}
+
+svc_done:
+	stratix10_svc_done(priv->chan);
+
+	return ret;
+}
+
+/**
+ * fcs_kref_release() - free the FCS state when the last reference is dropped
+ * @kref: reference counter embedded in the FCS state
+ */
+static void fcs_kref_release(struct kref *kref)
+{
+	struct socfpga_fcs_priv *priv =
+		container_of(kref, struct socfpga_fcs_priv, refcount);
+
+	if (priv->chan) {
+		if (priv->session_opened) {
+			int ret;
+
+			mutex_lock(&priv->lock);
+			ret = fcs_close_session_locked(priv);
+			mutex_unlock(&priv->lock);
+
+			if (ret)
+				dev_err(priv->client.dev,
+					"Failed to close FCS service session,ret=%d\n", ret);
+		}
+
+		stratix10_svc_remove_async_client(priv->chan);
+		stratix10_svc_free_channel(priv->chan);
+	}
+
+	mutex_destroy(&priv->lock);
+	kfree(priv);
+}
+
+/**
+ * fcs_get() - take a reference on the FCS state
+ * @priv: state returned by fcs_init()
+
+ */
+void fcs_get(struct socfpga_fcs_priv *priv)
+{
+	kref_get(&priv->refcount);
+}
+
+/**
+ * fcs_put() - drop a reference on the FCS state
+ * @priv: state returned by fcs_init()
+ */
+void fcs_put(struct socfpga_fcs_priv *priv)
+{
+	kref_put(&priv->refcount, fcs_kref_release);
+}
+
+/**
+ * fcs_mark_removed() - refuse further operations after the device is gone
+ * @priv: state returned by fcs_init()
+ */
+void fcs_mark_removed(struct socfpga_fcs_priv *priv)
+{
+	mutex_lock(&priv->lock);
+	priv->removed = true;
+
+	if (priv->session_opened)
+		fcs_close_session_locked(priv);
+
+	if (priv->chan)	{
+		stratix10_svc_remove_async_client(priv->chan);
+		stratix10_svc_free_channel(priv->chan);
+		priv->chan = NULL;
+	}
+
+	mutex_unlock(&priv->lock);
+}
+
+/**
+ * fcs_init() - allocate and initialise the FCS private state
+ * @dev: pointer to fcs device
+
+ *
+ * Return: the new state, or an ERR_PTR on failure (which may be
+ *         -EPROBE_DEFER from the service layer).
+ */
+struct socfpga_fcs_priv *fcs_init(struct device *dev)
+{
+	struct socfpga_fcs_priv *priv;
+	int ret;
+
+	priv = kzalloc_obj(*priv);
+	if (!priv)
+		return ERR_PTR(-ENOMEM);
+
+	kref_init(&priv->refcount);
+	mutex_init(&priv->lock);
+
+	/* kzalloc() already cleared client.receive_cb. */
+	priv->client.dev = dev;
+	priv->client.priv = priv;
+
+	priv->chan = stratix10_svc_request_channel_byname(&priv->client,
+							  SVC_CLIENT_FCS);
+	if (IS_ERR(priv->chan)) {
+		dev_err(dev, "couldn't get service channel %s\n", SVC_CLIENT_FCS);
+		ret = PTR_ERR(priv->chan);
+		goto err_free;
+	}
+
+	ret = stratix10_svc_add_async_client(priv->chan, true);
+	if (ret) {
+		dev_err(dev, "Failed to add async client\n");
+		stratix10_svc_free_channel(priv->chan);
+		goto err_free;
+	}
+
+	init_completion(&priv->completion);
+
+	/*
+	 * Version query failure is non-fatal; sysfs reports -ENODATA.
+	 */
+	fcs_read_version_from_atf(priv);
+
+	return priv;
+
+err_free:
+	mutex_destroy(&priv->lock);
+	kfree(priv);
+
+	return ERR_PTR(ret);
+}
diff --git a/drivers/firmware/socfpga-fcs.c b/drivers/firmware/socfpga-fcs.c
new file mode 100644
index 000000000000..3f8cae75f050
--- /dev/null
+++ b/drivers/firmware/socfpga-fcs.c
@@ -0,0 +1,304 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026, Altera Corporation
+ */
+
+#include <linux/err.h>
+#include <linux/firmware/intel/socfpga-fcs.h>
+#include <linux/fs.h>
+#include <linux/miscdevice.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/sysfs.h>
+#include <linux/uaccess.h>
+#include <linux/util_macros.h>
+#include <uapi/misc/socfpga-fcs-crypto.h>
+
+/**
+ * atf_version_show() - report the Arm Trusted Firmware build version
+ * @dev: pointer to fcs device
+ * @attr: device attribute
+ * @buf: pointer to character buffer to receive the version string
+ *
+ * Return: number of bytes written to @buf.
+ */
+static ssize_t atf_version_show(struct device *dev,
+				struct device_attribute *attr, char *buf)
+{
+	struct socfpga_fcs_priv *priv = dev_get_drvdata(dev);
+	u32 version[3];
+	int ret;
+
+	ret = fcs_get_atf_version(priv, version);
+	if (ret)
+		return ret;
+
+	return sysfs_emit(buf, "%u.%u.%u\n", version[0], version[1], version[2]);
+}
+
+/**
+ * fcs_sdos() - perform an SDOS encrypt/decrypt operation
+ * @priv: FCS state of the device this request arrived on
+ * @file: open file the request arrived on; must own the session
+ * @uarg: user pointer to a struct fcs_ioc_sdos
+ *
+ * Return: 0 on success, negative errno on failure.
+ */
+static long fcs_sdos(struct socfpga_fcs_priv *priv, struct file *file,
+		     void __user *uarg)
+{
+	u32 __user *dst_size_uptr;
+	s32 __user *status_uptr;
+	struct fcs_sdos_req req = { };
+	struct fcs_ioc_sdos u;
+	void *s_buf, *d_buf;
+	u32 output_size;
+	u32 dst_cap;
+	long ret;
+
+	if (copy_from_user(&u, uarg, sizeof(u)))
+		return -EFAULT;
+
+	if (!u.dst || !u.dst_size)
+		return -EINVAL;
+
+	dst_size_uptr = u64_to_user_ptr(u.dst_size);
+	status_uptr = u64_to_user_ptr(u.error_code);
+
+	/* Caller-provided output buffer capacity (in/out parameter) */
+	if (get_user(dst_cap, dst_size_uptr))
+		return -EFAULT;
+
+	ret = fcs_sdos_output_size(u.op_mode, u.src_size, &output_size);
+	if (ret)
+		return ret;
+
+	s_buf = kvmalloc(u.src_size, GFP_KERNEL);
+	if (!s_buf)
+		return -ENOMEM;
+
+	d_buf = kvmalloc(output_size, GFP_KERNEL);
+	if (!d_buf) {
+		ret = -ENOMEM;
+		goto free_sbuf;
+	}
+
+	/*
+	 * Stage the payload in ordinary kernel memory. The engine holds
+	 * priv->lock across the service-layer pool buffers, and a faulting
+	 * user page must not be able to block device removal on that lock.
+	 */
+	if (copy_from_user(s_buf, u64_to_user_ptr(u.src), u.src_size)) {
+		ret = -EFAULT;
+		goto free_dbuf;
+	}
+
+	req.op_mode	= u.op_mode;
+	req.src		= s_buf;
+	req.src_len	= u.src_size;
+	req.dst		= d_buf;
+	req.dst_len	= output_size;
+
+	ret = fcs_sdos_crypt(priv, file, &req);
+	if (ret)
+		goto relay_status;
+
+	if (req.dst_len > dst_cap) {
+		pr_debug("SDOS output %u exceeds caller buffer %u\n",
+			 req.dst_len, dst_cap);
+		ret = -EMSGSIZE;
+		goto relay_status;
+	}
+
+	if (copy_to_user(u64_to_user_ptr(u.dst), d_buf, req.dst_len)) {
+		ret = -EFAULT;
+		goto relay_status;
+	}
+
+	if (put_user(req.dst_len, dst_size_uptr))
+		ret = -EFAULT;
+
+relay_status:
+	if (req.status_valid && put_user(req.status, status_uptr)) {
+		/* surface the copy failure only if nothing failed earlier */
+		if (!ret)
+			ret = -EFAULT;
+	}
+free_dbuf:
+	kvfree(d_buf);
+free_sbuf:
+	kvfree(s_buf);
+
+	return ret;
+}
+
+/**
+ * fcs_open() - take a reference on the device state for this file
+ * @inode: inode of the FCS misc device
+ * @file: open file being created
+ *
+ * Return: 0 always.
+ */
+static int fcs_open(struct inode *inode, struct file *file)
+{
+	struct miscdevice *miscdev = file->private_data;
+	struct socfpga_fcs_priv *priv =
+		container_of(miscdev, struct socfpga_fcs_priv, miscdev);
+
+	fcs_get(priv);
+	file->private_data = priv;
+
+	return 0;
+}
+
+/**
+ * fcs_release() - drop this file's reference on the device state to
+ * guarantees the crypto session is torn down when its owning fd is closed,
+ * including on process crash/exit
+ * @inode: inode of the FCS misc device
+ * @file: open file being released
+ *
+ * Return: 0 always.
+ */
+static int fcs_release(struct inode *inode, struct file *file)
+{
+	/* close the crypto session if this file owns it */
+	fcs_ctx_end(file->private_data, file);
+	fcs_put(file->private_data);
+
+	return 0;
+}
+
+/**
+ * fcs_ioctl() - dispatch an FCS ioctl command
+ * @file: open file for the FCS misc device
+ * @cmd: ioctl command code
+ * @arg: user pointer to the command-specific argument structure
+ *
+ * Return: 0 on success, -ENOTTY for an unknown command, or a negative errno
+ *         from the handler.
+ */
+static long fcs_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
+{
+	struct socfpga_fcs_priv *priv = file->private_data;
+	void __user *uarg = (void __user *)arg;
+
+	switch (cmd) {
+	case FCS_IOC_OPEN_SESSION:
+		return fcs_ctx_begin(priv, file);
+	case FCS_IOC_CLOSE_SESSION:
+		return fcs_ctx_end(priv, file);
+	case FCS_IOC_SDOS:
+		return fcs_sdos(priv, file, uarg);
+	default:
+		return -ENOTTY;
+	}
+}
+
+static const struct file_operations fcs_fops = {
+	.owner		= THIS_MODULE,
+	.open		= fcs_open,
+	.release	= fcs_release,
+	.unlocked_ioctl	= fcs_ioctl,
+	.compat_ioctl	= compat_ptr_ioctl,
+};
+
+static DEVICE_ATTR_RO(atf_version);
+
+static struct attribute *fcs_attrs[] = {
+	&dev_attr_atf_version.attr,
+	NULL
+};
+ATTRIBUTE_GROUPS(fcs);
+
+/**
+ * fcs_driver_probe() - probe the FCS platform device
+ * @pdev: pointer to the FCS platform device
+ *
+ * Return: 0 on success, negative errno on failure.
+ */
+static int fcs_driver_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct socfpga_fcs_priv *priv;
+	int ret;
+
+	priv = fcs_init(dev);
+	if (IS_ERR(priv))
+		return dev_err_probe(dev, PTR_ERR(priv),
+				     "Failed to initialize FCS\n");
+
+	platform_set_drvdata(pdev, priv);
+
+	priv->miscdev.minor = MISC_DYNAMIC_MINOR;
+	priv->miscdev.name = "socfpga-fcs";
+	priv->miscdev.fops = &fcs_fops;
+	priv->miscdev.parent = dev;
+
+	ret = misc_register(&priv->miscdev);
+	if (ret) {
+		fcs_put(priv);
+		return dev_err_probe(dev, ret, "Failed to register misc device\n");
+	}
+
+	return 0;
+}
+
+/**
+ * fcs_driver_remove() - remove the FCS platform device
+ * @pdev: pointer to the FCS platform device
+ */
+static void fcs_driver_remove(struct platform_device *pdev)
+{
+	struct socfpga_fcs_priv *priv = platform_get_drvdata(pdev);
+
+	/*
+	 * misc_deregister() does not wait for open files. Tear the svc
+	 * channel down here (parent may free it as soon as remove returns);
+	 */
+	misc_deregister(&priv->miscdev);
+	fcs_mark_removed(priv);
+	fcs_put(priv);
+}
+
+static struct platform_driver fcs_driver = {
+	.probe = fcs_driver_probe,
+	.remove = fcs_driver_remove,
+	.driver = {
+		.name = "stratix10-fcs",
+		.dev_groups = fcs_groups,
+	},
+};
+
+/**
+ * socfpga_fcs_init() - register the FCS platform driver
+ *
+ * Return: 0 on success, negative errno on failure.
+ */
+static int __init socfpga_fcs_init(void)
+{
+	int ret;
+
+	ret = platform_driver_register(&fcs_driver);
+	if (ret)
+		pr_err("Failed to register platform driver: %d\n", ret);
+
+	return ret;
+}
+
+/**
+ * socfpga_fcs_exit() - unregister the FCS platform driver
+ */
+static void __exit socfpga_fcs_exit(void)
+{
+	platform_driver_unregister(&fcs_driver);
+}
+
+module_init(socfpga_fcs_init);
+module_exit(socfpga_fcs_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Altera SoCFPGA FCS SDOS encrypt/decrypt driver");
+MODULE_AUTHOR("Altera Corporation");
+MODULE_ALIAS("platform:stratix10-fcs");
diff --git a/include/linux/firmware/intel/socfpga-fcs.h b/include/linux/firmware/intel/socfpga-fcs.h
new file mode 100644
index 000000000000..ae026e663caa
--- /dev/null
+++ b/include/linux/firmware/intel/socfpga-fcs.h
@@ -0,0 +1,148 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2026 Altera Corporation
+ *
+ * SDOS-only subset of the SoCFPGA FCS (FPGA Crypto Service) interface,
+ * shared between the driver front-end (socfpga-fcs.c) and the command
+ * engine (socfpga-fcs-core.c).
+ *
+ * The command engine deals in kernel pointers only: front-ends own every
+ * transfer to and from user space. In-kernel consumers can therefore drive
+ * the same engine directly.
+ */
+#ifndef __SOCFPGA_FCS_H
+#define __SOCFPGA_FCS_H
+
+#include <linux/completion.h>
+#include <linux/miscdevice.h>
+#include <linux/firmware/intel/stratix10-svc-client.h>
+
+#define SDOS_HEADER_SZ		40
+#define SDOS_HMAC_SZ		48
+#define SDOS_PLAINDATA_MIN_SZ	32
+#define SDOS_PLAINDATA_MAX_SZ	32672
+#define SDOS_DECRYPTED_MIN_SZ	(SDOS_PLAINDATA_MIN_SZ + SDOS_HEADER_SZ)
+#define SDOS_DECRYPTED_MAX_SZ	(SDOS_PLAINDATA_MAX_SZ + SDOS_HEADER_SZ)
+#define SDOS_ENCRYPTED_MIN_SZ	(SDOS_PLAINDATA_MIN_SZ + SDOS_HEADER_SZ + SDOS_HMAC_SZ)
+#define SDOS_ENCRYPTED_MAX_SZ	(SDOS_PLAINDATA_MAX_SZ + SDOS_HEADER_SZ + SDOS_HMAC_SZ)
+
+/**
+ * struct fcs_sdos_req - parameters for one SDOS encrypt/decrypt operation
+ * @op_mode: non-zero to encrypt, zero to decrypt
+ * @src: input buffer, any kernel address
+ * @src_len: number of valid bytes in @src
+ * @dst: output buffer, any kernel address
+ * @dst_len: on entry the capacity of @dst, on return the number of bytes the
+ *           SDM produced
+ * @status: SDM mailbox status, valid only when @status_valid is set
+ * @status_valid: set by the engine once the mailbox transaction completed,
+ *                whether it succeeded or reported a firmware error. Clear
+ *                after a transport failure, where no firmware status exists.
+ *
+ * Every pointer is a kernel address, so the engine never touches user memory.
+ */
+struct fcs_sdos_req {
+	u32		op_mode;
+	const void	*src;
+	u32		src_len;
+	void		*dst;
+	u32		dst_len;
+	s32		status;
+	bool		status_valid;
+};
+
+/**
+ * Private driver state for the SoCFPGA FCS that holds the SDM/ATF service
+ * channel, the lock serialising command submission, and the latest mailbox
+ * status/response.
+ */
+struct socfpga_fcs_priv {
+	/* Communication channel */
+	struct stratix10_svc_chan *chan;
+	struct stratix10_svc_client client;
+	struct miscdevice miscdev;
+	/*
+	 * Held by the driver and by every open file. An fd may outlive driver
+	 * detach, so this state is not devm-managed: the firmware channel and
+	 * the allocation are released only when the last reference goes.
+	 */
+	struct kref refcount;
+	/* Set on remove(); further operations fail with -ENODEV. */
+	bool removed;
+	struct completion completion;
+	/*
+	 * Serializes FCS command submission: guards the session state and the
+	 * single in-flight mailbox transaction (completion/status/resp) so only
+	 * one SDM request is outstanding at a time. It also covers the whole
+	 * lifetime of the service-layer pool buffers, so they cannot outlive
+	 * @chan; user-space copying happens outside it.
+	 */
+	struct mutex lock;
+	int status;
+	u32 resp;
+	u32 session_id;
+	/*
+	 * True while an SDM session is open. Guarded by @lock. Commands that
+	 * need a session check this flag, not session_id: the SDM may return
+	 * session id 0, which looks the same as "no session".
+	 */
+	bool session_opened;
+	/*
+	 * Opaque token of whoever opened the session (the struct file for
+	 * the ioctl front end); guarded by @lock. Only the owner may run
+	 * commands on the session or close it. Compared, never dereferenced.
+	 */
+	const void *session_owner;
+	/*
+	 * Context ID of the most recent command on this session, generated
+	 * fresh per command (see fcs_sdos_crypt()). Non-zero once the first
+	 * command has run; it is not an "active context" flag and is not
+	 * cleared between commands, only when the session closes.
+	 */
+	u32 context_id;
+	u32 atf_version[3];
+	bool atf_version_valid;
+};
+
+enum fcs_command_code {
+	FCS_DEV_CRYPTO_OPEN_SESSION,
+	FCS_DEV_CRYPTO_CLOSE_SESSION,
+	FCS_DEV_SDOS_DATA_EXT,
+	FCS_DEV_ATF_VERSION,
+};
+
+int fcs_sdos_output_size(u32 op_mode, u32 src_len, u32 *out_len);
+
+/*
+ * Allocate the per-device FCS state and set up the service channel; reads the
+ * ATF version. The state is reference counted; release the driver's reference
+ * with fcs_put(). Returns an ERR_PTR on failure.
+ */
+struct socfpga_fcs_priv *fcs_init(struct device *dev);
+
+/* Take/drop a reference; the last put closes the session and frees the state. */
+void fcs_get(struct socfpga_fcs_priv *priv);
+void fcs_put(struct socfpga_fcs_priv *priv);
+
+/* Refuse further operations with -ENODEV; call from the remove path. */
+void fcs_mark_removed(struct socfpga_fcs_priv *priv);
+
+int fcs_get_atf_version(struct socfpga_fcs_priv *priv, u32 *version);
+
+/*
+ * fcs_ctx_begin() opens the session and records @owner as its owner.
+ * fcs_ctx_end() closes it. They are separate calls, not one combined
+ * operation. Each takes @priv->lock itself; the caller must not hold it.
+ * Only one session may be open, and only its owner may use or close it.
+ */
+int fcs_ctx_begin(struct socfpga_fcs_priv *priv, const void *owner);
+int fcs_ctx_end(struct socfpga_fcs_priv *priv, const void *owner);
+
+/*
+ * Perform an SDOS (Secure Data Object Service) encrypt/decrypt operation on
+ * the session opened by @owner.
+ */
+int fcs_sdos_crypt(struct socfpga_fcs_priv *priv, const void *owner,
+		   struct fcs_sdos_req *req);
+
+#endif /* SOCFPGA_FCS_H */
diff --git a/include/uapi/misc/socfpga-fcs-crypto.h b/include/uapi/misc/socfpga-fcs-crypto.h
new file mode 100644
index 000000000000..18f24a33da7c
--- /dev/null
+++ b/include/uapi/misc/socfpga-fcs-crypto.h
@@ -0,0 +1,118 @@
+/* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */
+/*
+ * Description:
+ * This driver is developed for the SDM SoCFPGA Crypto Service (FCS). The
+ * caller must call FCS_IOC_OPEN_SESSION and close it with
+ * FCS_IOC_CLOSE_SESSION (also done automatically on fd close) in order to
+ * use the SDM crypto services. The caller owns the crypto session lifecycle
+ * once it opens it.
+ * Only one session may be open at a time across the whole device. The
+ * per-request context ID is managed by the kernel internally and is not
+ * part of the user ABI.
+ * The driver also provides an ioctl interface for the SDOS
+ * (Secure Data Object Service) for encrypt/decrypt operation using SDOS
+ * service root key certificate.
+ */
+#ifndef __SOCFPGA_FCS_CRYPTO_H
+#define __SOCFPGA_FCS_CRYPTO_H
+
+/**
+ * struct fcs_ioc_sdos - argument for FCS_IOC_SDOS
+ * @error_code: address of a ``__s32`` that receives the SDM status. Written
+ *		whenever the request reached the SDM, including when the SDM
+ *		reported a failure, and left unchanged otherwise. Initialise
+ *		it to 0 before the call.
+ * @src: address of the input buffer
+ * @dst: address of the output buffer. Must be non-NULL.
+ * @dst_size: address of a ``__u32``. On entry it holds the capacity of @dst
+ *	      in bytes; on success the kernel overwrites it with the number of
+ *	      bytes the SDM produced. Must be non-NULL.
+ * @op_mode: non-zero to encrypt, zero to decrypt
+ * @src_size: number of bytes at @src. For encrypt the input is a 40-byte
+ *	      header followed by 32..32672 bytes of plaintext; for decrypt it
+ *	      additionally carries a trailing 48-byte HMAC.
+ *
+ * The four ``__u64`` members carry user-space addresses as fixed-width
+ * values, so the structure has the same layout for 32-bit and 64-bit callers.
+ *
+ * For an encrypt request the owner ID is read from the caller-supplied header
+ * as a little-endian 64-bit value at offset 12 and is passed to the SDM with
+ * the request.
+ */
+struct fcs_ioc_sdos {
+	__u64 error_code;	/* __user ptr to __s32 (out)              */
+	__u64 src;		/* __user ptr to input buffer (in)        */
+	__u64 dst;		/* __user ptr to output buffer (out)      */
+	__u64 dst_size;		/* __user ptr to __u32 capacity/len (in/out) */
+	__u32 op_mode;		/* (in)  */
+	__u32 src_size;		/* (in)  */
+};
+
+#define FCS_IOC_MAGIC		0xA6
+
+/*
+ * DOC: FCS_IOC_OPEN_SESSION
+ *
+ * Open a crypto session on the SDM. Only one session may be open at a time
+ * for the whole device, and it belongs to the file description that opened
+ * it: only that file may run commands on it or close it. A second open fails
+ * with ``EBUSY`` until the first is closed.
+ *
+ * Return: 0 on success, -1 on failure with ``errno`` set.
+ *
+ * ===========  =======================================================
+ * Error        Description
+ * ===========  =======================================================
+ * EBUSY        A session is already open.
+ * ENODEV       The device was unbound while the file descriptor was
+ *              open.
+ * EIO          The SDM reported a fatal error opening the session.
+ * ERESTARTSYS  A signal arrived while waiting for another request.
+ * ===========  =======================================================
+ */
+#define FCS_IOC_OPEN_SESSION		_IO(FCS_IOC_MAGIC, 1)
+
+/*
+ * DOC: FCS_IOC_CLOSE_SESSION
+ *
+ * Close the crypto session on the SDM. A no-op, returning 0, if no session
+ * is open. Also performed automatically when the owning file is closed.
+ *
+ * Return: 0 on success, -1 on failure with ``errno`` set.
+ *
+ * ======  ============================================================
+ * Error   Description
+ * ======  ============================================================
+ * EPERM   The session was opened through a different file.
+ * EIO     The SDM reported a fatal error closing the session. The local
+ *         session state is dropped regardless, so a future open is not
+ *         blocked.
+ * ======  ============================================================
+ */
+#define FCS_IOC_CLOSE_SESSION		_IO(FCS_IOC_MAGIC, 2)
+
+/**
+ * DOC: FCS_IOC_SDOS
+ *
+ * Encrypt or decrypt one SDOS object. Takes a pointer to a
+ * &struct fcs_ioc_sdos. Requires a crypto session opened beforehand with
+ * FCS_IOC_OPEN_SESSION on the same file; fails with ``ENOTCONN`` if no
+ * session is open and ``EPERM`` if another file owns it.
+ *
+ * The SDM derives the working key from a device-unique SDOS root key that
+ * never leaves the secure boundary, so the host never handles raw key
+ * material. Only one SDM transaction is in flight at a time.
+ *
+ * A failed request, for any reason, never closes the session: it is left
+ * open for the caller to retry or to close explicitly with
+ * FCS_IOC_CLOSE_SESSION.
+ *
+ * Return: 0 on success, -1 on failure with ``errno`` set. The SDM status for
+ * the request is written to the ``__s32`` addressed by ``error_code``; some
+ * non-zero statuses indicate success with a warning. See
+ * Documentation/misc-devices/socfpga-fcs.rst for the error codes and the SDM
+ * status values.
+ */
+#define FCS_IOC_SDOS		_IOWR(FCS_IOC_MAGIC, 3, struct fcs_ioc_sdos)
+
+#endif /* __SOCFPGA_FCS_CRYPTO_H */
-- 
2.43.7

