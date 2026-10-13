Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010024.outbound.protection.outlook.com [52.101.56.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DCFE378823;
	Tue, 13 Oct 2026 08:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791879698; cv=fail; b=acC7cGGTye4NrZyGFpK5HEIe+tGkL5GXaI+WibhBXwWUjSC5j8w15UseTm1nMAPpF7/YYGWuQZflQmAtDW4ncNp1I3TKT05ZkxTo4skKdXXRY4rWyB6ypXiBLsQ8ZQ8PbcNuP+x2wi67ZMjUFf6paEYiPyW7QeMyUhY5bV9ScqM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791879698; c=relaxed/simple;
	bh=2vPvVhwCo0ZLgrMPB4tlEYegIWV1GLrxyCl+tVm4wB4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=KncisS711qRF7Aq+itlXtlL32O1pxmWEGhNSoI0/Q1Q1blof8RcyMIZxUWIVfs9uOmshMXfdeNP5asHf20TQlfCUept5RZW6p5jtZb6KlBf9yGtSqGSu9YwVrdRekN2fPT/lnHJH5r+vQUWwcws4/pCihtFS/Chwlf/QNGaY8FM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=m56IrREb; arc=fail smtp.client-ip=52.101.56.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="m56IrREb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eycmlBfDJe1iruhjcNe5VaNsaNsc5imiF2PA1HVThvUE0ll/sxmp104uDziKXGj37U263hPi4Jkl1v3eXNVrYW47QIEUjaMbPTlDmTzItDXKujPEMrs/HIozwEirrXhiikjGmEytPATG9Zf4v2aVhEYPG4ioaEXNuAbKOMk79WmeMkH6yQZBTUOvGkkGI4BOGHmq+/cXCAgmy31yGywMeuXLpPIBfDMRlCYebPbdqTQOb99VNWavC1cIOXRxN5baBb7wKxrCDEPUFl3zoVhlA32UI47l8M+q1TV0xbyk7Dwfs9RYFyzu/ETYcIBoDAnWo1d8Gz+9nQE4F9pzWoc/NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yp32myEt2vaDuiwiOmNB3OM6aLbmkU3QM37TY7APibc=;
 b=ZRH5XG4KhD8tSP50BGcNjIFy5mfULUWhs0gn2T14KiI3jlrwKPZrn5rYaWExh5L2+6twbf4I6aG4wJuzlPICqmkyC66EGkZL5WsVm1roRu5t7b4dMdpHTLOjnIojX01EvmEQ2+C3Fix6AMcgNARg0RdKujgopdNgKkZnI0woQhJXNQwgM/v0CbcHtRisH1ZCW5BopuEqyEPT6BstTbqdkJ4gsI8VSrmgchi6lB9EIRnvkrLiBXPBtkyOMlKEse6h5/5+WSP9gs7EY6GhepkUrXvI0S63F5y3QFcbW2Hi28bWfGfKkeW/bf39fU/FNhsVWp7xQSVFt1DkNbzsSzbxyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yp32myEt2vaDuiwiOmNB3OM6aLbmkU3QM37TY7APibc=;
 b=m56IrREbLrRs3/aMGiildALqfANWMGhjDZWukS/8Bo+AFH2Yw/dh9yCZYudRC6d70Cyhyjsp2cphKHB6hWFqMIUcu2ufCEyj4eArypmDbKldPhlbzPIGUiDmtQT7uwv24qOLeqEJMClRgBH9z6O6gqOEttd0E0hdBfJsNIyOehA=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 by MN2PR12MB4256.namprd12.prod.outlook.com (2603:10b6:208:1d2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Tue, 13 Oct
 2026 08:21:35 +0000
Received: from LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287]) by LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287%5]) with mapi id 15.21.0496.021; Tue, 13 Oct 2026
 08:21:34 +0000
Message-ID: <ad7fdd3a-489a-4573-8dec-961a16e6539b@amd.com>
Date: Tue, 13 Oct 2026 10:21:26 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: zynqmp: Add ifm ZynqMP VHIP6 EvalBoard
To: Marek Vasut <marex@nabladev.com>, linux-arm-kernel@lists.infradead.org
Cc: Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260916204509.166633-1-marex@nabladev.com>
 <20260916204509.166633-2-marex@nabladev.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 xsFNBFFuvDEBEAC9Amu3nk79+J+4xBOuM5XmDmljuukOc6mKB5bBYOa4SrWJZTjeGRf52VMc
 howHe8Y9nSbG92obZMqsdt+d/hmRu3fgwRYiiU97YJjUkCN5paHXyBb+3IdrLNGt8I7C9RMy
 svSoH4WcApYNqvB3rcMtJIna+HUhx8xOk+XCfyKJDnrSuKgx0Svj446qgM5fe7RyFOlGX/wF
 Ae63Hs0RkFo3I/+hLLJP6kwPnOEo3lkvzm3FMMy0D9VxT9e6Y3afe1UTQuhkg8PbABxhowzj
 SEnl0ICoqpBqqROV/w1fOlPrm4WSNlZJunYV4gTEustZf8j9FWncn3QzRhnQOSuzTPFbsbH5
 WVxwDvgHLRTmBuMw1sqvCc7CofjsD1XM9bP3HOBwCxKaTyOxbPJh3D4AdD1u+cF/lj9Fj255
 Es9aATHPvoDQmOzyyRNTQzupN8UtZ+/tB4mhgxWzorpbdItaSXWgdDPDtssJIC+d5+hskys8
 B3jbv86lyM+4jh2URpnL1gqOPwnaf1zm/7sqoN3r64cml94q68jfY4lNTwjA/SnaS1DE9XXa
 XQlkhHgjSLyRjjsMsz+2A4otRLrBbumEUtSMlPfhTi8xUsj9ZfPIUz3fji8vmxZG/Da6jx/c
 a0UQdFFCL4Ay/EMSoGbQouzhC69OQLWNH3rMQbBvrRbiMJbEZwARAQABzSlNaWNoYWwgU2lt
 ZWsgKEFNRCkgPG1pY2hhbC5zaW1la0BhbWQuY29tPsLBlAQTAQgAPgIbAwULCQgHAgYVCgkI
 CwIEFgIDAQIeAQIXgBYhBGc1DJv1zO6bU2Q1ajd8fyH+PR+RBQJn8lwDBQkaRgbLAAoJEDd8
 fyH+PR+RCNAP/iHkKbpP0XXfgfWqf8yyrFHjGPJSknERzxw0glxPztfC3UqeusQ0CPnbI85n
 uQdm5/zRgWr7wi8H2UMqFlfMW8/NH5Da7GOPc26NMTPA2ZG5S2SG2SGZj1Smq8mL4iueePiN
 x1qfWhVm7TfkDHUEmMAYq70sjFcvygyqHUCumpw36CMQSMyrxyEkbYm1NKORlnySAFHy2pOx
 nmXKSaL1yfof3JJLwNwtaBj76GKQILnlYx9QNnt6adCtrZLIhB3HGh4IRJyuiiM0aZi1G8ei
 2ILx2n2LxUw7X6aAD0sYHtNKUCQMCBGQHzJLDYjEyy0kfYoLXV2P6K+7WYnRP+uV8g77Gl9a
 IuGvxgEUITjMakX3e8RjyZ5jmc5ZAsegfJ669oZJOzQouw/W9Qneb820rhA2CKK8BnmlkHP+
 WB5yDks3gSHE/GlOWqRkVZ05sUjVmq/tZ1JEdOapWQovRQsueDjxXcMjgNo5e8ttCyMo44u1
 pKXRJpR5l7/hBYWeMlcKvLwByep+FOGtKsv0xadMKr1M6wPZXkV83jMKxxRE9HlqWJLLUE1Q
 0pDvn1EvlpDj9eED73iMBsrHu9cIk8aweTEbQ4bcKRGfGkXrCwle6xRiKSjXCdzWpOglNhjq
 1g8Ak+G+ZR6r7QarL01BkdE2/WUOLHdGHB1hJxARbP2E3l46zsFNBFFuvDEBEACXqiX5h4IA
 03fJOwh+82aQWeHVAEDpjDzK5hSSJZDE55KP8br1FZrgrjvQ9Ma7thSu1mbr+ydeIqoO1/iM
 fZA+DDPpvo6kscjep11bNhVa0JpHhwnMfHNTSHDMq9OXL9ZZpku/+OXtapISzIH336p4ZUUB
 5asad8Ux70g4gmI92eLWBzFFdlyR4g1Vis511Nn481lsDO9LZhKyWelbif7FKKv4p3FRPSbB
 vEgh71V3NDCPlJJoiHiYaS8IN3uasV/S1+cxVbwz2WcUEZCpeHcY2qsQAEqp4GM7PF2G6gtz
 IOBUMk7fjku1mzlx4zP7uj87LGJTOAxQUJ1HHlx3Li+xu2oF9Vv101/fsCmptAAUMo7KiJgP
 Lu8TsP1migoOoSbGUMR0jQpUcKF2L2jaNVS6updvNjbRmFojK2y6A/Bc6WAKhtdv8/e0/Zby
 iVA7/EN5phZ1GugMJxOLHJ1eqw7DQ5CHcSQ5bOx0Yjmhg4PT6pbW3mB1w+ClAnxhAbyMsfBn
 XxvvcjWIPnBVlB2Z0YH/gizMDdM0Sa/HIz+q7JR7XkGL4MYeAM15m6O7hkCJcoFV7LMzkNKk
 OiCZ3E0JYDsMXvmh3S4EVWAG+buA+9beElCmXDcXPI4PinMPqpwmLNcEhPVMQfvAYRqQp2fg
 1vTEyK58Ms+0a9L1k5MvvbFg9QARAQABwsF8BBgBCAAmAhsMFiEEZzUMm/XM7ptTZDVqN3x/
 If49H5EFAmfyXCkFCRpGBvgACgkQN3x/If49H5GY5xAAoKWHRO/OlI7eMA8VaUgFInmphBAj
 fAgQbW6Zxl9ULaCcNSoJc2D0zYWXftDOJeXyVk5Gb8cMbLA1tIMSM/BgSAnT7As2KfcZDTXQ
 DJSZYWgYKc/YywLgUlpv4slFv5tjmoUvHK9w2DuFLW254pnUuhrdyTEaknEM+qOmPscWOs0R
 dR6mMTN0vBjnLUeYdy0xbaoefjT+tWBybXkVwLDd3d/+mOa9ZiAB7ynuVWu2ow/uGJx0hnRI
 LGfLsiPu47YQrQXu79r7RtVeAYwRh3ul7wx5LABWI6n31oEHxDH+1czVjKsiozRstEaUxuDZ
 jWRHq+AEIq79BTTopj2dnW+sZAsnVpQmc+nod6xR907pzt/HZL0WoWwRVkbg7hqtzKOBoju3
 hftqVr0nx77oBZD6mSJsxM/QuJoaXaTX/a/QiB4Nwrja2jlM0lMUA/bGeM1tQwS7rJLaT3cT
 RBGSlJgyWtR8IQvX3rqHd6QrFi1poQ1/wpLummWO0adWes2U6I3GtD9vxO/cazWrWBDoQ8Da
 otYa9+7v0j0WOBTJaj16LFxdSRq/jZ1y/EIHs3Ysd85mUWXOB8xZ6h+WEMzqAvOt02oWJVbr
 ZLqxG/3ScDXZEUJ6EDJVoLAK50zMk87ece2+4GWGOKfFsiDfh7fnEMXQcykxuowBYUD0tMd2
 mpwx1d8=
In-Reply-To: <20260916204509.166633-2-marex@nabladev.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1P189CA0013.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:802:2a::26) To LV5PR12MB9779.namprd12.prod.outlook.com
 (2603:10b6:408:301::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9779:EE_|MN2PR12MB4256:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f24f52a-f7f3-4481-9a8c-08df2902fea0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|4143699003|11063799006|56012099006|22082099003|18002099003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	ieI+fVh78wa0ygAhbrU8Q4AtEsDGf+3ycbR5ArLZlpRefWhhoQyJxwMuufKEVe3VOXO8HNoClDVUa1Sm6vHiT/lWVyYGxdN7tWBRx4+/wT4fn5L+bfaE6DZyNmjiwIV0B1pRZb/7g29AymHD49KOWsEgPkKJxuDoN8yRazTIh2+0GTJDxlj8Jiap4VchB4FoaXxhgmzeK4tIAaCJ7rNlfx7W0lMVAIDbeOkXX6GgrXxcgzES4iaD3aaX4awCZ3PiecET4ITnEqnt/8KlGbb1Ev9ioRY+HBOzjdIslnY0innkfEOJIobRRiYDQKAcaiH9PLdesRd33YBSBsQK/qV3us+iS4dpaaxrSBfjKCE3awD4m2YdZit+mEeKzm4H8Eks6pUukVLaQ6cJg/aqBcKqAFuXuIGQFmXBZur445AIgPWNZY1o6iNv3SPvpAg765MQwObhSpr1nzp/WQ7SFCRhYrwqaatxDmrTrabIxujaFnh4BAsx8HCbsRzejS7fMxA+PCMhGyENV8XVo9plVJodzmbBgBYvSU5dsfXnxzJ/OIJ1fkEXNQJ5iYFJQ9ztQnLr7V95JhGC7yIw+O6RtoD6qx98XX28Mf2CTCtQhhmx4Xb92SU9qG0t3aFwvcpsCIm7R8CBzsCTdP+hb+W9y8ovif6vHpTdVbPFnxwK1pykuA8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9779.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003)(261009223027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N2RlMUZnSllpQjVhSzlUUDRzMmRNWW1UY1lMTjV4M25xQWdBVWJ4N1BJaU1S?=
 =?utf-8?B?aytqTkt3bitMMFdsNFd4ci9mSzRuRElvTjQwQVdBMWlTVEk2SGJpMTdVaUFr?=
 =?utf-8?B?K2tPaTJId3F4WVdzbTFKNzBsOFJKdDRTSmhTSEpqNzUwVTRjenU4aU53M04r?=
 =?utf-8?B?Rk0zYnN0dFlyMWpEK0lQZ2tZcm9vMWwxQVljZGZKd1BvY0VHRGNQRnljWnJt?=
 =?utf-8?B?ZEtmNGdDclhTbmhXZW5uaVZiMmN0dVJ3NGJsNThvdC9ZUUR5THlkRThJVHhj?=
 =?utf-8?B?YmVjSHJNKzNyTEtGbnQyQlBGbm9GZmNTRUJYdm4zenhwNitlUWMwNENPK3dY?=
 =?utf-8?B?Zk5DQy81dVNzd2NMUkhwaThtWGFyTjM0SjJwOGpHVlBxQzVzdCtQdE5jOG1O?=
 =?utf-8?B?azJoSnVaMDNKT0o2NWRxV0loNHRFWllCMiswM1cxaVBUTXJCelNnTXBoSERx?=
 =?utf-8?B?Vk5yU1lwVTFWeDl1N2wvK2FFcFZwYTE5MDdhOGdZMU10NHcxYS9kTk1ON053?=
 =?utf-8?B?dTJWd3dhM1NzTThWTlBLQ3hmakdXUThWaElrRW0xLzNtSFBsZytJUURCYVNp?=
 =?utf-8?B?ejN5b0k1VHNCTWdZL0pITXA5Rm4vK0RrY0xwdzRtcmVmeXNQY05jd1hNdis1?=
 =?utf-8?B?dUxWcERIS3RmUWRlQ2xiWVRuZEEyc3pFTG5RNm91bU9XWjQ0NGc4Q1RERURC?=
 =?utf-8?B?RWpJbk1VN1N3enN1bGNGRUNaclN2UUlyc2FZWUdacDRFVmQvSWx2RklFelgw?=
 =?utf-8?B?b3dRZDUwd3orWGNFUjZnOXZmbllJTlhhaGRaa0FTUmdGOTFpSzgvQXR0VkZO?=
 =?utf-8?B?eTlaOHVUMHpHRFl6ak40RlgvL0l3bEdmUGVGZnhHQWI0enZZZWFlTExaVm9U?=
 =?utf-8?B?bkdVSTVYOFlNMmhWZy9jTWZ0K21LcW5XTFhwYUhaZFF6dVloTUxDMk9Zdm84?=
 =?utf-8?B?YmF4cWxNYWpBemErMHFweFdwdVR6TXNZMmliTEFNbnh2cFNJT2dGOVhLaEll?=
 =?utf-8?B?T1NuQzlCbm8yT29vYklWZExQUUNvZTlwZ1BtLzNtN1lBU0phOWhSbExyNEN4?=
 =?utf-8?B?MWpoOEtCWjNzNm9WRDZHS1B6TkF0bDRzL1E3L2hiMFkwblMvNXRCMWNlVEZ5?=
 =?utf-8?B?K09SOGw5MEJMTFFEb2hKUUlpNFl6b0cvKyszNU9lVWNWZ3FBU2pWWCt5c1pm?=
 =?utf-8?B?SXRmNHk3SFQzRUM5ZFlMTHgreEtUeHBpTU41YUhPSHNpa3o3WjJSR2NYSCtC?=
 =?utf-8?B?dktxTkVyUVFVMVFPcnRCdHBYS2lXam1vRUVka1VvTHpSMXhneGEzYUVkRFp6?=
 =?utf-8?B?NUd1anM1bFg4QUVlSHVYRFkveUJJelpMdVpULzNuRjFKTnhwNGlFc2o3SFNr?=
 =?utf-8?B?ZkVDYXo1cHU0N1NtM0l4dUZGRStFSFN2NEZZVmMyVzM5aTZHanZHbFRGeDFo?=
 =?utf-8?B?aE1PZmRNQVJTVlJqa3N1Nm16NldjWklTUVNudDRYUmNpOGpBbWJpcjRrcjFU?=
 =?utf-8?B?TEs1OFJ2THE1NGQ2SzJsMjNEQmFjeldWY3o4SS9HMTJXUmsrR1llWXI0UjFJ?=
 =?utf-8?B?czhGaCtlY2d1RXFNeWtOd1JOVlVjQzlueHQ0WGlGUTlOTUNrWE5oYkxXemJ4?=
 =?utf-8?B?Wmk3TkFzNkdwMHZxVWtkMHJVR1UvWGU4QXJWb2RFN3lVN0MvQWU5b1kxaGdy?=
 =?utf-8?B?K0x0bHhVdnFZbGFKOHp1SUY2WmhFb1FoaGhSaVZHRkY4eGFXODBFOGswenVN?=
 =?utf-8?B?WjBMQ1dMTHR4aUNEYXpVbXpoYjhNMzJPQnNQODZJZjR2LzRnM1lSUWVVUUsv?=
 =?utf-8?B?REVWQTVBZFJJWjdyVnVYamM2Z2pkZDlHTDhXaXFaem5Hend1eTdrcFJaNFpI?=
 =?utf-8?B?dXFNKy8zYkZVcGo3RlNLbllhRk5NMmJkZmEzQVNrYXlITUtmbDREeXBoQk5t?=
 =?utf-8?B?SXRYN09HZ25Od1h2dW5ONllhSXVwY1VMUzFXY2I2cFp3cmVySXRTRXhtcHBn?=
 =?utf-8?B?RnAvb243MlQ4VjdrVDBYSUJOaU5Ka3FNM0lBSmVrL0lhRDBTWlZSdWp5MzRv?=
 =?utf-8?B?N0ltNFJhU1hTRlVhWVo4eWU2MU9rajlnM3BaekRmeGdPVWt6LzRnYVlia1Zy?=
 =?utf-8?B?M3VIUThFM2E3YTk2U2VjV05nWUZQeXE3cG5tOWtMZ0xKQ2kwWnJPWU1vamg1?=
 =?utf-8?B?TUJjZ25tMFVSc09UQXVJOU93eVExSllkOFVsT2xzK2hKR2ZPZ1hlSnN1VGVw?=
 =?utf-8?B?dkdpemFQWnJGYmhxQmc0MXR1QmJaWUdRaG1DeFIrOXJaSkJvQm85dW1DT1VR?=
 =?utf-8?B?ZzNVR3JzU29YRHRtR09mSU45UHNkK25rNm9ZdTN4OG1TU3dQWlUrZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f24f52a-f7f3-4481-9a8c-08df2902fea0
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9779.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 08:21:34.9069
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CTMSIZToacXqpuxdMTWozG2+/gFsh7yH0qa19USisA0P3Y/PckMTVQ+90USzqggN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4256



On 9/16/26 22:44, Marek Vasut wrote:
> Add support for ifm ZynqMP VHIP6 EvalBoard reference design.
> The board is populated with four ethernet ports, QSPI NOR,
> eMMC, UART and USB host interfaces.
> 
> Signed-off-by: Marek Vasut <marex@nabladev.com>
> ---
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Michal Simek <michal.simek@amd.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> ---
> NOTE: Checkpatch complains about ethernet-phy-id2000.a240 being
>        undocumented, but the TI DP83822I is generic C45 PHY that
>        is valided by Documentation/devicetree/bindings/net/ethernet-phy.yaml
> ---
> V2: - Rename lm75 node to sensor@
>      - Use GPIO_ACTIVE_LOW macro
> V3: - Drop bogus clk_ignore_unused bootargs
>      - Drop gpio line names
> ---
>   arch/arm64/boot/dts/xilinx/Makefile           |   1 +
>   .../dts/xilinx/zynqmp-vhip6-evalboard.dts     | 300 ++++++++++++++++++
>   2 files changed, 301 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/xilinx/zynqmp-vhip6-evalboard.dts
I am not able to review or take this board support further without publicly 
available hardware documentation for the platform (board-level and relevant 
interface details). Please share public documentation links once available, and 
I’ll be happy to revisit the patches.

Thanks,
Michal
