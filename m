Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 002D83A1D01
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 13:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.135.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789393271; cv=fail; b=ZQ7zOkQycobfYlIqenzqgTJgSXtAFyZ1ZNiy21AV3ODf2EiOlRth+lQvx668xBXZAyPRWC9WARYY6GG0GCibX0uX69GOXZWqyb/N/RCUNajgzsCwqlPyC0O+sd/WrNG9TaTIhGPwSCL6rUSxZpfJPsUt2H5ESojvvtBPsNR4O1g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789393271; c=relaxed/simple;
	bh=9GUldmGaxSfupt7xFLl1+wCR6/X1XPVtwK1kr8/W+m8=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=sYnMjCayg8yDpIDnUqoPeshkh7BbNBfp12OHjs+fxqv3XED2DOK6PQJojCPVlPu2IunRuZcEljh+3LyVS4G0pfESSxrTIJp0YqRho7njnA+cX8q1APdKW0Kd6jnpXmzZ31lJ4ZgOqdM4d8+Xl+J8fIKwokZnURkgEWHCENrEO2A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=SrSnupNn; arc=fail smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="SrSnupNn"
Received: from pps.filterd (m0516787.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ED6Liw2410783;
	Mon, 14 Sep 2026 09:40:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=FmMJh
	KyfHnlcipoV1y5r4gqGtNaWfESy7QGxyNmGi1Q=; b=SrSnupNnGZ/8QNsu2c0bV
	9sL2PVOydbxdDk//WBG6Kp2C33eoeWYeO8cmzMUfwMz3sLY+gt8vpKkNreqQglfp
	iY8Zcu46m7OTcYKipLVX5abNgrYWzTyB1ms+p0u6z1268dgbnB3U4wpWH7uhN5ZP
	lh6hPuZafeCF9p6sUeWVQEMwz9qbXtITpfIO2pGPKc3amsSqxyV4kJefHi8VVW90
	X+xkUDh3/3qBY+RSPVL771ZBXrBy7SplHjGkP0Ri3SjbzCPLAs94xFLVFmkJw5rj
	4VQXScWNcf1nYkKmUFVbrT9iJSBNhilYH089om8i6qjEaIeQzrzwAAgbFcNir5S3
	w==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010030.outbound.protection.outlook.com [52.101.56.30])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4gnr2gdcdj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 14 Sep 2026 09:40:56 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q9AbxGBHzQYOUVBUoJ1YZRbcdLQKFtLEkwbyxZiRlpVRfa6agcmSX0CU2odFGpD7nMHBoG0khOvUyWu6y8LFF+JVrHZRzplPBBV9sAcNklxjuYxqKvcOoYz8qC3RPAf3vhyuVyNU+eLmJ3A/mJT5OLbwL7ONDsYssgP85l+9AbAyUOusHpEGup197my2Bf7Lgmw0aLwdHK9/p+bgNeuE4VbEBW2UOlly8UsWlQWtz04XyZLMT6fgm5xSKT8aVF7AhzxJ4G8j2HlN6P/0YSzCa3eW/wtyHZslzZhKb730G3lqC0QECx4+92EalEn9k8pqgCGi1rTaPRcW7soqYidgGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FmMJhKyfHnlcipoV1y5r4gqGtNaWfESy7QGxyNmGi1Q=;
 b=K0TcSHGawIe+r/F2wY6W8mQkpdDfrhMkS51xTM8sk87pAYvnGQYP5+3QtKfkGmeWAF/lDTT8CvY6ELC9HHvZ3IGJPSiMRvH5Keirc9o8i5EkS1wAYIoqWh7OARBBKqtMqIhPH/Bxqg2hpEdRl7GVquIXgvmscd09rl0UD7S7zFFhxi8TigwDsv9qM+pyTHDlsGu4urwx5Cbe9cAbNXQWKHq/xwkLVf5hhqnthl5uP17D46PX4pdWen/u/7iKQgvGYQF8VCFZLcDjGy1Z7jchQhlSetooRedWAex2b01fbrvm111blcAXdG2FskS3jjUHWmJE9/9P6BDQv7evgPEyKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from SJ0PR03MB5469.namprd03.prod.outlook.com (2603:10b6:a03:28a::17)
 by CH5PR03MB7862.namprd03.prod.outlook.com (2603:10b6:610:216::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 13:40:54 +0000
Received: from SJ0PR03MB5469.namprd03.prod.outlook.com
 ([fe80::2a19:76b2:e731:8c5a]) by SJ0PR03MB5469.namprd03.prod.outlook.com
 ([fe80::2a19:76b2:e731:8c5a%6]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 13:40:54 +0000
From: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>
Date: Mon, 14 Sep 2026 14:42:02 +0100
Subject: [PATCH v2 2/2] mtd: spi-nor: issi: Add support for is25wx01g
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260914-mtd-spi-nor-new-issi-chip-v2-2-3cd4d7e434b2@analog.com>
References: <20260914-mtd-spi-nor-new-issi-chip-v2-0-3cd4d7e434b2@analog.com>
In-Reply-To: <20260914-mtd-spi-nor-new-issi-chip-v2-0-3cd4d7e434b2@analog.com>
To: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
        Takahiro Kuwano <takahiro.kuwano@infineon.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789393320; l=10614;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=9GUldmGaxSfupt7xFLl1+wCR6/X1XPVtwK1kr8/W+m8=;
 b=j+5qJpjCKOEfXtUwCfKYq+T6N1pO6cLFjuyyU/Woep/63p4jlcAtURFpgnherT5uAUq+SlbZp
 uMRiLbZYescA/uLesRzCzvZTkgRiEjsNnjhl4YryjRqgiK14CMiLNQh
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-ClientProxiedBy: MR1P264CA0032.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2f::19) To SJ0PR03MB5469.namprd03.prod.outlook.com
 (2603:10b6:a03:28a::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5469:EE_|CH5PR03MB7862:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c418c69-c31b-4846-d499-08df1265cc47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|10067099003|6133799003|3023799007|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	gjVwgKfgIm1cvotc3ep3ed8vrQrOki/LLIPMnZ7qZZVpMjAmO6I8eQj8d7RNskxvJO/23tB7tCur8i0wROMbCxr6N8rgZG8m3WMxHNW92y/8dfbFzzR5mXiiDphAxDuYL0ObKGIIMaRhwmeTY/YGqHG63XRRFumO5fO0zWfZc9xWcjWaSxOlXhiz6ygjCHqLD1puoyYRHals2qq2KbxiXoVb9RZf0iyoozfd2mYfKsnCUAppw3SGf7sxbNUxEMAyUY+svZXSKXk1LrA5gvXNRBapFnuctw6sOIcUXCTwlhuBQr2xHvLSYEKy1xr+2+FSVdzOtDj60wGXGWrzRQ5FZGvuxqDBTCKzqqLHZxBkwAKlUzaKfh2fOlLivDLztbnIMZ40ySohSqAvqn6hWV5YExZYdTq9iBbgy2kzSsFea2EQj/5pDywn5yXILHLsBScWmjnI21xkcM2XB4MgO4XDmHvA+p4KF6gouRZKvuClLJtKody8QsxVN8SZvGqha+geiyROH2KehvurJ+YK3mEavKjlAPY/mmN5En3vnyfhEMh/1U3sbg76XPagb7gjf2aYAxcdGYOcraOzr/Sl3xqNZiK9uYkFAwWPFnbp9ccOdAk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5469.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(10067099003)(6133799003)(3023799007)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SlpnM3FhMG9WcjdtQkNTNmdXSkdyL01wOVpIcVg4VzdCUzdXTDlqMno4Tm1B?=
 =?utf-8?B?cU14ekRXVHhiZ2l2SU1Dd3NLdjd5N2VXUWwrbFFGa3MrcHZzWW9EVm5qV25U?=
 =?utf-8?B?bUhEblpIdUZFeDFKalc5Q1lsSkxPdVFmYzBleGJnV3lOc0hlc0xWMnFQcWE3?=
 =?utf-8?B?SUpiQkFuV25ZOEI4c01zMGtFL2VXWVpTSWJKb0NiSWtLaGxENWFVa2xPcTA5?=
 =?utf-8?B?MEQzQ205bGI2UkZNNnV1SlQzazk2Q2kwWVJsZ05FMzlzS2NENFZaeDJJU1ZO?=
 =?utf-8?B?SE9xVWt0eW0wcUJkK0tudWQyd2dZdTZVZjJpRnRxZlRPbTZKcXdlajhmVHk5?=
 =?utf-8?B?RnBNS0liRDBGeW53TzdTeUJ6N2R5SkM3VWZUYnhETnBPVDJJVFVzUzVDOUp0?=
 =?utf-8?B?T2JiTFo1eUR4OUQyTTIwQjEwMm1DWms3TmdxeURGbHNJeGQ5K0U4d0xxVlNm?=
 =?utf-8?B?bi9icU0zQm9zNlBoUGUydUhuWlBVMkpoNmxUWnlFa20rSnNZZ29ZVE8wWTE5?=
 =?utf-8?B?MnJDSTZBQUU4Z1g5a3J6ay9VZHl5K3VwNFZ3S1d5c1lSTmRyQlRPTXFLRTJ1?=
 =?utf-8?B?NHo1WldJTzRGcTBSUjduSFpxV3QwZmVtd1V1ck14aTZybnpZNElBblZZT2N5?=
 =?utf-8?B?V1liNS92TjR0ajlCUVBoQWI3N1QvZFlnRGdFYkxkT3A3TUJjY202d0RCRnAv?=
 =?utf-8?B?TUFhN1J1ZmNzWkxTZ2xMVEIvWnVRZmdDcEQ5eFFKbVlSNmlMU1VQblRBK2wx?=
 =?utf-8?B?LytBNElHa2x1bi9oZVJSKzFzcm1TNmIyTWhrUkxYZ1NSNVJHeG1GVzlaZ1FO?=
 =?utf-8?B?dGpVT2kxaHl1WWdBSU5DVmlqa1duNnpwMkluREN2QTJyY1lOcHg4dG9VZ0lO?=
 =?utf-8?B?UGVHSmRIRDc1TjFNeDFXVzZxamNMdVJsZ3piSjhZTFliVTVNWFBRUEduUEU2?=
 =?utf-8?B?aTJNZ2tqRGtUdlBuTERESi9hSFR5Q1Y4WnhsczNBa3ZPd01ZQS9tVFBydHdI?=
 =?utf-8?B?YlZtVllRNUhtQVRCMStiUk9lYU81ekxQd1E4Skk2V3gwN3ExZW95cFlYZ0ZP?=
 =?utf-8?B?S2hoNm9Hc0RQSDVVZUEvUlVIdVFBNWgydFBmSVNzQ0dUM0hFMjJmWGIyRXI2?=
 =?utf-8?B?WEhURmR6Z25hd0E3ayt6WU9WRjBDdU1XU2tzWmgxTys4YnZScFlETHFnSSsr?=
 =?utf-8?B?ZnZTRUJDUzBua2FKRXA0ZHpOSjVUVDVVbm8vYk00ZXpGTTQxSnY4ZkNpN0hr?=
 =?utf-8?B?K0hFTGptUEZrVmNMaDdGZUtmVjFjWVdKVkRqMHI3V1VVNUNxTnZYOUV2RjYx?=
 =?utf-8?B?N0FCYWVhZTdiMGNlakp0SFRSSjNsWnJCQ3JtQVNGRlprdEJaTWFuMnQwOUhw?=
 =?utf-8?B?WHJuUHVkTzVVb0RVUmRwd2ZxVnZNME1rQ3dIRmFpeHVRSHQ0UmN1RXQ5Rllo?=
 =?utf-8?B?dXJTbVRXTmJYYUxLM1hpb1lzenFLa2VvOXQrUFZOK085SHJsUU1WMWlodnpa?=
 =?utf-8?B?bmNWT0Y0MDhwNXJkTjR6SFo5NE5VaU9GeHR6VG5DQkFxVVltUGM1SE13Wk9p?=
 =?utf-8?B?cENDOEF3bm5sd3BWS0RCSklrWXFVdzErOWhrVDFUQmlOWmNESXQzUVlvWDMz?=
 =?utf-8?B?RVluSmxabW9VSG5MdG9Dc0crK0VrTEVXTWYyVW5ZYWI4L2l3NnozSGxJMzda?=
 =?utf-8?B?RTBFQlppSE1MUW91RGNVZHVpMkRCbzFvL1lpYTVwNHJNamVvWHozV2EyM0E0?=
 =?utf-8?B?Ly9wZlJET0lyd2k1bjlTbEE3MkVWL3h2RW5uQ3cwY0tIeW1pTk1wV0FpRHcx?=
 =?utf-8?B?eFdQUEY3NVgwaDJ4MExCZzk3SU1xRkVmcFVaaGhXQUhuaTRyd203eDk1U2xL?=
 =?utf-8?B?aFBsRWlraFZ6djI3N2RiaXZoWDhMSWlGd3RmMnhzbVJCYVg1QUVsQnhwamE0?=
 =?utf-8?B?dzdra1gxMjhJNFNyMy9MM2ZReXNNREl6cWdEVmRYZ0NKODBsNDlaZmJoK1d5?=
 =?utf-8?B?Q3loRjF5Q0NlNVdHUDFYUXBFSVM3cFYvd0paTVo0ZlM0UDVicTYzcEJldWo0?=
 =?utf-8?B?S2J1RG5ncU15RUhBOWhzWHZMdU1sM0x1ME9rZHlhNDZMVHdQeEIwQWR6V2JX?=
 =?utf-8?B?VnE5QzZ3UzRyVVp2RkFnU2ZkT3ZWQ05Mek9EZnU4UFBFQVFNQUdKZDVxaTRL?=
 =?utf-8?B?VjZRWDRlRWdVV1N1bmk5L3EzRTRZTm1hcFkvY3lmU2dmUUZYaHRBNkFXMlcw?=
 =?utf-8?B?enhOM2hZTzl2Ykw3anNERVJvODJ4SkhLc1JmRGphQUJMV2U0K1JBU214RDlx?=
 =?utf-8?B?NmY2WXFpRGxMSG1VVjFIYjZnRWluQlk4emhWSmRkVVZidFFRNFRFQT09?=
X-Exchange-RoutingPolicyChecked:
	17aTMQw8oy+CX1SMA9cohU/grFRwu0mZvNYV3het5cparKhR1o0bhzv9hmbdsc2aEqBqHcnRhVL9FQokZNrYNHOpvp+wfqvpqJwKey9yKe9SkdI+QRR8mTYaa6vWzye7mNW3xNpYrzCL2i7aL3uJzRCiKPZ33BlJlSiYvcTTLtUZFnigGFzM7I1CA/jwTRYCUe54VaRza/r4zEsZNFVFSuz4wNKZQNBr+oxcy8/6PBGb8oAm3K1l3vvF3nuAj8hmMxBJFxFa5127erIJwg/hNfzUilXhqMH1oHFfwA9/kh1Xd2ME/jZz5iRZLdBM7vTULE0ZGiw+0QslQFwkX1Ts+Q==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c418c69-c31b-4846-d499-08df1265cc47
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5469.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 13:40:54.0396
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oQq3xFezzvTvTtVMLJktmC/BTakHNfk0Iumv4sWfeqVk2Or/bgNy9rGz2Bp/SCBieMIPF9ujwOVFL2yPQX8AJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH5PR03MB7862
X-Proofpoint-GUID: 6czxqkhYclvssc0KJSfa5yG2GaHE0rVD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE5NSBTYWx0ZWRfXy00Kr46SOQUO
 lC4SvQmAjVYQ5OdsA6m1sRYEoM6hP6ynKxMZw05lfzqQMg5Hb4iQplPE84QUVEJihOIrV/RHGKH
 9ZlkUYQlu5zmaXAjRbfvtVBHgzVaYlNtkO94q4SDu8jwogCwPlguzuxdwUgEi1K7vg0RkOChcOW
 +uw8ufEl/Ukb8MsoWcf40FcmW6W17tmi2qbWJswGlYNcJq5IZPKQPieknE2qmBO3a9oPrGSTrfR
 KRKWbMtdOaVwB34u27h0QogSADyZhre7VDRPSw9F73V0cdxaX2zT4bYouMB/aBZtZoQUNElOTqK
 hoB3DYxDH58nky7cPmc14L2UTSuf147F5YdDnJtQbcImG3guSWE+Yg3gZYGG+rGWhQQvTGLqglx
 DlhdsIV2uawP6UhYPYqkaQXggg64bQsbzgv1jEVLJpW08HnTxf5i8eaZ1Rpq8RQ/uSLydjZVjRe
 R2cFrdRgMWkCCC/O6ww==
X-Proofpoint-ORIG-GUID: 6czxqkhYclvssc0KJSfa5yG2GaHE0rVD
X-Authority-Analysis: v=2.4 cv=dtdOmFg4 c=1 sm=1 tr=0 ts=6aa7f968 cx=c_pps
 a=lJB3plHzOIAfJWf+6KWQLg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=OmVn7CZJonkx5R5zMQLL:22
 a=P-IC7800AAAA:8 a=gAnH3GRIAAAA:8 a=PVkDEAEEmQ6aH4wvTtUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE5NSBTYWx0ZWRfX19zgxmFrUqfP
 wMTwmAvQzBy2Gw7jGBMkscrm0VJcTNBSDfJo4Oj9VMyibi2bcsTSk/SX6g1BXC60kaSdx35Rdqg
 bMl5FNTNK6PC5oAD/g3X0AupNhvLVdNFW9zSSNQfSJIZBgvYl7p3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 suspectscore=0 adultscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140195

Add support for the ISSI IS25WX01G, a 1 Gbit (128 MiB) octal NOR flash.
The part is fully described by SFDP, so only the flash ID and a small
post_bfpt fixup are needed.

WRITE STATUS REGISTER (01h) takes a single data byte and only affects
status register bits 7:2, so the default 16-bit Write Status assumption
does not hold. Clear write_sr1_and_sr2 so that the single byte write_sr1
path is taken; write_sr1 is already set to 01h by the BFPT parsing.

The flash also has no Status Register 2. Configuration registers are read
with B5h/85h and written with B1h/81h, and the 35h Read Configuration
Register command does not exist, so clear read_sr2 as well.

Software write protection is done through the block protect bits in the
status register: BP0-BP2 at bits 4:2, BP3 at bit 6 and a Top/Bottom bit at
bit 5, which is exactly what SPI_NOR_HAS_LOCK, SPI_NOR_4BIT_BP,
SPI_NOR_BP3_SR_BIT6 and SPI_NOR_HAS_TB describe, so set those flags to get
the generic locking support.

No quad enable handling is needed: this is an octal part with no quad
mode, its BFPT Quad Enable Requirement field carries a reserved value,
and spi_nor_parse_bfpt() therefore leaves both quad enable masks zeroed.

Signed-off-by: Nuno Sá <nuno.sa@analog.com>

---
This flash is populated on the sc846 board and was tested at 125MHz
using the cadence xspi (cdns,xspi-nor) SPI controller.

(Note that in fact the controller also needs some patches and a new sc846
compatible to integrate)

cat /sys/bus/spi/devices/spi6.0/spi-nor/jedec_id
9d5b1b

cat /sys/bus/spi/devices/spi6.0/spi-nor/manufacturer
issi

xxd -p /sys/bus/spi/devices/spi6.0/spi-nor/sfdp
53464450090103ff00070114300000ff84000102a00000ff05000105b000
00ff0a000108d00000ffffffffffffffffffe5208affffffff3f00000000
00000000eeffffffffff00ffffff00000c2011d80f5200ff4462990087ce
04e22801273d7a757a75ffbdd55c000070ff8170f8a12fcb278b00008401
0082080000000088ffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffff430effff21dc5cffffffffffffffffff000b801e
b181b58500f0ff9f500a000028d55a8cffffffffffffffffffffffff0000
060100000000000081050000e70000000601000000000000810600e70000

sha256sum /sys/bus/spi/devices/spi6.0/spi-nor/sfdp
a1fa0cab6324b45a17e6bd7fc7e581496517d558d8c7684cc85e57a5dfe5d87b  /sys/bus/spi/devices/spi6.0/spi-nor/sfdp

cat /sys/kernel/debug/spi-nor/spi6.0/capabilities
Supported read modes by the flash
 1S-1S-1S
  opcode	0x13
  mode cycles	0
  dummy cycles	0
 1S-1S-1S (fast read)
  opcode	0x0c
  mode cycles	0
  dummy cycles	8
 1S-1S-8S
  opcode	0x7c
  mode cycles	1
  dummy cycles	7
 1S-8S-8S
  opcode	0xcc
  mode cycles	1
  dummy cycles	15
 8D-8D-8D
  opcode	0x0b
  mode cycles	0
  dummy cycles	20

Supported page program modes by the flash
 1S-1S-1S
  opcode	0x12
 1S-1S-8S
  opcode	0x84
 1S-8S-8S
  opcode	0x8e
 8D-8D-8D
  opcode	0x12

cat /sys/kernel/debug/spi-nor/spi6.0/params
name		(null)
id		9d 5b 1b 10 01 00
size		128 MiB
write size	1
page size	256
address nbytes	4
flags		HAS_SR_TB | 4B_OPCODES | HAS_4BAIT | HAS_LOCK | HAS_4BIT_BP | HAS_SR_BP3_BIT6 | SOFT_RESET | NO_WP

opcodes
 read		0xcc
  dummy cycles	16
 erase		0xdc
 program	0x8e
 8D extension	repeat

protocols
 read		1S-8S-8S
 write		1S-8S-8S
 register	1S-1S-1S

erase commands
 21 (4.00 KiB) [1]
 5c (32.0 KiB) [2]
 dc (128 KiB) [3]
 c7 (128 MiB)

sector map
 region (in hex)   | erase mask | overlaid
 ------------------+------------+---------
 00000000-07ffffff |     [   3] | no

locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-07ffffff | unlocked | 1024

dd if=/dev/urandom of=./spi_test bs=1M count=2
2+0 records in
2+0 records out

mtd_debug erase /dev/mtd4 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash

mtd_debug read /dev/mtd4 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read

hexdump spi_read
0000000 ffff ffff ffff ffff ffff ffff ffff ffff
*
0200000

sha256sum spi_read
4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  spi_read

mtd_debug write /dev/mtd4 0 2097152 spi_test
Copied 2097152 bytes from spi_test to address 0x00000000 in flash

mtd_debug read /dev/mtd4 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read

sha256sum spi*
a1230061123719295de1df8c401601e7ba2c6b163ab2d324d5d254d83ca71108  spi_read
a1230061123719295de1df8c401601e7ba2c6b163ab2d324d5d254d83ca71108  spi_test

mtd_debug erase /dev/mtd4 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash

mtd_debug read /dev/mtd4 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read

sha256sum spi*
4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  spi_read
a1230061123719295de1df8c401601e7ba2c6b163ab2d324d5d254d83ca71108  spi_test

mtd_debug info /dev/mtd4
mtd.type = MTD_NORFLASH
mtd.flags = MTD_CAP_NORFLASH
mtd.size = 134217728 (128M)
mtd.erasesize = 131072 (128K)
mtd.writesize = 1
mtd.oobsize = 0
regions = 0

flash_lock -u /dev/mtd4
flash_lock -i /dev/mtd4
Device: /dev/mtd4
Start: 0
Len: 0x8000000
Lock status: unlocked
Return code: 0

mtd_debug erase /dev/mtd4 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash

mtd_debug write /dev/mtd4 0 2097152 spi_test
Copied 2097152 bytes from spi_test to address 0x00000000 in flash

mtd_debug read /dev/mtd4 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read

sha256sum spi*
a1230061123719295de1df8c401601e7ba2c6b163ab2d324d5d254d83ca71108  spi_read
a1230061123719295de1df8c401601e7ba2c6b163ab2d324d5d254d83ca71108  spi_test

show_sectors
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-07ffffff | unlocked | 1024

flash_lock -l /dev/mtd4
flash_lock -i /dev/mtd4
Device: /dev/mtd4
Start: 0
Len: 0x8000000
Lock status: locked
Return code: 1

mtd_debug erase /dev/mtd4 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash

mtd_debug read /dev/mtd4 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read

sha256sum spi*
a1230061123719295de1df8c401601e7ba2c6b163ab2d324d5d254d83ca71108  spi_read
a1230061123719295de1df8c401601e7ba2c6b163ab2d324d5d254d83ca71108  spi_test

dd if=/dev/urandom of=./spi_test2 bs=1M count=2
2+0 records in
2+0 records out

mtd_debug write /dev/mtd4 0 2097152 spi_test2
Copied 2097152 bytes from spi_test2 to address 0x00000000 in flash

mtd_debug read /dev/mtd4 0 2097152 spi_read2
Copied 2097152 bytes from address 0x00000000 in flash to spi_read2

sha256sum spi*
a1230061123719295de1df8c401601e7ba2c6b163ab2d324d5d254d83ca71108  spi_read
a1230061123719295de1df8c401601e7ba2c6b163ab2d324d5d254d83ca71108  spi_read2
a1230061123719295de1df8c401601e7ba2c6b163ab2d324d5d254d83ca71108  spi_test
03781ea58ffe95ed666f174f7804b84999f525516595c1ba0f99ee83eb8af22b  spi_test2

show_sectors
locked sectors
region (in hex)   | status   | #sectors
 ------------------+----------+---------
00000000-07ffffff |   locked | 1024

flash_lock -u /dev/mtd4 (*)
flash_lock -l /dev/mtd4 $(($size - (2 * $ss))) $((2 * $bps))
show_sectors
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-07fbffff | unlocked | 1022
 07fc0000-07ffffff |   locked | 2

flash_lock -u /dev/mtd4 $(($size - (2 * $ss))) $((1 * $bps))
show_sectors
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-07fdffff | unlocked | 1023
 07fe0000-07ffffff |   locked | 1

flash_lock -u /dev/mtd4
flash_lock -l /dev/mtd4 $(($size - (2**7 * $ss))) $((2**7 * $bps))
show_sectors
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-06ffffff | unlocked | 896
 07000000-07ffffff |   locked | 128

(*): I should note that the command actually failed with -EIO but it
actually unlocked the chip! And the reason is because the flash as the same
FSR register than the micron-st flash. So WEL is set to 1 but can only
be cleared when clearing the FSR register.

AFAICT, we should do something similar as micron so the writing to an
actual protected region fails rather than being silently discarded with
that status bit set. The question would be how to do it? The code is
pretty much identical to [1]. The masks, the opcoded... So should we
somehow handle this in the core (by having some common helper) that
could be set in .late_init() under a common MFR_FSR flag? Or just keep
both implementations separate for now?

[1]: https://elixir.bootlin.com/linux/v7.2.5/source/drivers/mtd/spi-nor/micron-st.c#L585
---
 drivers/mtd/spi-nor/issi.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/mtd/spi-nor/issi.c b/drivers/mtd/spi-nor/issi.c
index 2f057d731df2..a0b46c298d53 100644
--- a/drivers/mtd/spi-nor/issi.c
+++ b/drivers/mtd/spi-nor/issi.c
@@ -29,6 +29,24 @@ static const struct spi_nor_fixups is25lp256_fixups = {
 	.post_bfpt = is25lp256_post_bfpt_fixups,
 };
 
+static int is25wx01g_post_bfpt_fixups(struct spi_nor *nor,
+				      const struct sfdp_parameter_header *bfpt_header,
+				      const struct sfdp_bfpt *bfpt)
+{
+	/*
+	 * There is no Status Register 2 and no 35h command. And WRITE STATUS
+	 * REGISTER takes a single data byte.
+	 */
+	nor->params->opcodes.write_sr1_and_sr2 = 0;
+	nor->params->opcodes.read_sr2 = 0;
+
+	return 0;
+}
+
+static const struct spi_nor_fixups is25wx01g_fixups = {
+	.post_bfpt = is25wx01g_post_bfpt_fixups,
+};
+
 static int pm25lv_nor_late_init(struct spi_nor *nor)
 {
 	struct spi_nor_erase_map *map = &nor->params->erase_map;
@@ -120,6 +138,12 @@ static const struct flash_info issi_nor_parts[] = {
 		.id = SNOR_ID(0x9d, 0x70, 0x19),
 		.name = "is25wp256",
 		.flags = SPI_NOR_QUAD_PP,
+	}, {
+		/* is25wx01g */
+		.id = SNOR_ID(0x9d, 0x5b, 0x1b),
+		.sector_size = SZ_128K,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB |
+			 SPI_NOR_4BIT_BP | SPI_NOR_BP3_SR_BIT6,
 	}
 };
 
@@ -148,6 +172,7 @@ static const struct spi_nor_fixup issi_fixup_list[] = {
 	  .fixup_flags = SPI_NOR_4B_OPCODES },
 	{ .id = SNOR_ID(0x9d, 0x70, 0x19), .fixups = &is25lp256_fixups,
 	  .fixup_flags = SPI_NOR_4B_OPCODES },
+	{ .id = SNOR_ID(0x9d, 0x5b, 0x1b), .fixups = &is25wx01g_fixups },
 };
 
 const struct spi_nor_manufacturer spi_nor_issi = {

-- 
2.55.0

