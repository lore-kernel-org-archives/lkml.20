Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=40.93.201.22
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793623736;
	b=o6/fYwUyqazkXvacsEa2OSCpwU1Efj+C9rCN6XsJmRshabczrVfOAh4BVPdskKd/73c8
	 E4vEwyY8ESOxOik8Y+Q5U9beE7j1QilubUaBFzUFVsvzzn+XKOnGry6ObyDVc7V7gUOX5
	 nL43UP/xxI4SXyzakn7SI4OL2Dv2R5px1NLFb+40Q1EeC7PONArWg4/5Pm1XLFZnGLno1
	 G+JdSLBo8rjuGKGQc0kyz4v+bxPbznQHvF1L9VcDl8E0XuV7UyZt2/1Fu+NfzJ24iIFtw
	 CXpRPjh7l8Z0Zda4T6hHcEGMomoe2REpdAR7H3AvTRsMpMSekuoOhwmSKM02JBPfkng==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793623736;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:
	 MIME-Version:X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-LD-Processed:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=qdJXsuP7rjabUFjSysRo4k/nqwCEFw0sBdvW6M9cD74=;
	b=ylFmYpzSdXvcNgNpcPYg1Jz8Z0uFRBGoeQgeSg6dnSgR8e0LVpzEY00Wg4cr1azIEx2x
	 COQk27XhvWOuFgF/pxVTgbYFMNNV/aqpaS2Br0TGxoWaAnimTWk8AuAPQnU3fmixHQ0t2
	 OYMJpLqf0107RTeitvnPtpvVJEG4nMCtMrZZ3C0Oat7nJEiuOMvhLs7CdbzT/h95IAXpG
	 9Mj2zNz+42NohmVG32QJ/B2txt6glwkzFrWYkyBF8qLJDoc2jkpHiKjLbABPpeinAPwHP
	 2RwXr5Uu6cY+yljCBh/cruIguSsIuiNyFB81O7JvF4P/dxfBNdQ+pL2N9r3Ey3lx6JA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=4zozMwcp;
	arc=fail smtp.remote-ip=40.93.201.22
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013022.outbound.protection.outlook.com [40.93.201.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07E6C606A329;
	Mon,  2 Nov 2026 12:48:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07E6C606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=4zozMwcp
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RzrTETZ0qsLqqM80qg+4KJuByMp/g71bUAz4is++P4rh7yX4M6eWvl+fRy2emqFYtKnuGRyDSrCHACIfW/vBKnyTtDQqlqiVBpGcnm6nwJQjQNk2V+72a5b4Fxi4E+TsAZnaYoNiqBJxwFinnTZ2tIi/b+TSLkE5X7LKDyTUPzUcaRgXT6b81u2pZpqO4JrFyEhpqVktDfokKqMevzEburPJUF+aU775kdfVw3NkdIbHwHHxMBAdnLOho/IzB4RQIpT4lDv7wg9H6lFmfxPr0eiArlXeigKA6klLlM6AFTgGieobYsz7hhfCXsqg9IZn4gs9rfbHDfg2I361pQxAKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qdJXsuP7rjabUFjSysRo4k/nqwCEFw0sBdvW6M9cD74=;
 b=AxB31+pBWQ33APx9nSGou4UlmHj/EKa/ZbkVaiWRhY2vAV/yK8DrdW8lafampm4RP4V1c5lo/W7lwfK/ZhXCkgp7BTky6LEoQqunDImwsP9Zo6aeX0CrPXSR2R5DAGYizSBhiLOVUuawFjALzA355S4j12fyrDktdCTa57N3MkfTpgmY4yM5kBLjVjkRg+ZlkL/8XuQW7nKNISITz3bZVVzCu7rgI//6K61tQGYJJyxoKZmoapqEgp8P6vNwNhEOlXk5A32EhE2omXIDCCuyL1/OtnjrE5lNn9mS80u9pZ7yre1zeYGdglSALQK3freW8SwVeP4buBhjFEaIWX3bow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qdJXsuP7rjabUFjSysRo4k/nqwCEFw0sBdvW6M9cD74=;
 b=4zozMwcpEXocz/e6dNZYku2ItSrLJdETYqcbzibTzxKmQEIJagPtemt4vuFs5C/on3+nWaI6fBdgUDkYeFiFM/8UvATj6TqxZBiKp5zXpoHl5lu0oKB7Ccgc08N3RgJ8TKlQIQDP+nSdyc1Aw2HA5JWCwutg9voddB46jol5S4k=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 by FT1PR12MB623484.namprd12.prod.outlook.com (2603:10b6:170:2e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 12:48:52 +0000
Received: from LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287]) by LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287%5]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 12:48:51 +0000
Message-ID: <82ac95c0-2b11-45df-a6fc-c0888d58b2bb@amd.com>
Date: Mon, 2 Nov 2026 13:48:40 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] dt-bindings: edac: xlnx,versal-ddrmc: Add
 xlnx,versal-xilsem compatible
To: Borislav Petkov <bp@alien8.de>
Cc: "Veggalam, Rama Devi" <rama.devi.veggalam@amd.com>,
 "Ghannam, Yazen" <Yazen.Ghannam@amd.com>, Rob Herring <robh@kernel.org>,
 "tony.luck@intel.com" <tony.luck@intel.com>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "james.morse@arm.com" <james.morse@arm.com>,
 "mchehab@kernel.org" <mchehab@kernel.org>, "rric@kernel.org"
 <rric@kernel.org>, "git (AMD-Xilinx)" <git@amd.com>
References: <1792587442-2794880-1-git-send-email-rama.devi.veggalam@amd.com>
 <1792587442-2794880-2-git-send-email-rama.devi.veggalam@amd.com>
 <20261022143730.GA1287910-robh@kernel.org>
 <20261026203920.GA696395@yaz-khff2.amd.com>
 <PH0PR12MB8125B27A7814A3818739C4B9CE6F2@PH0PR12MB8125.namprd12.prod.outlook.com>
 <b683fcbd-ae5b-416c-96e1-7b0d7146c468@amd.com>
 <20261029152549.GBauNlfeOlTwktwjYs@fat_crate.local>
 <9dd48bd6-70ce-49f1-b3cc-7cf8f49e995b@amd.com>
 <20261029162711.GCauNz378qqsVFtI6y@fat_crate.local>
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
In-Reply-To: <20261029162711.GCauNz378qqsVFtI6y@fat_crate.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIUP296CA0029.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:34d::19) To LV5PR12MB9779.namprd12.prod.outlook.com
 (2603:10b6:408:301::14)
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
X-MS-TrafficTypeDiagnostic: LV5PR12MB9779:EE_|FT1PR12MB623484:EE_
X-MS-Office365-Filtering-Correlation-Id: 077f5fe1-cb65-4889-653e-08df38dfa58a
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|7416014|1800799024|366016|11063799006|4143699003|56012099006|261028144727099003|261009223027099003|261021123027099003|261026140227099003|261022115727099003|261022105027099003|261026121527099003|261022075727099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	HBFZmeuDWKCZKxNWXQOjkYKNkYj7ob2AT5Q1DSyWxWBt2rCvPtQwWMrC1M6Nwti/HH0ZPDZ5yARjJZ8Nsyoifa6Ps+NM90f4SNMvGwj+b2MV935G5MvlN7rM9OMz+oPA8YKCkA1V8L96jo74iO0dr9bFmCu1a1WFKCR1NahXXLyoa/knHUr11oUi38SilESE/TN6YqFDcyoh0sG9V+thUPX/IORmxn4IG6syOoG2xQAlTXke97NN5vnaD4BK26wkn3ztsYkk68zCM0tnB9oO/NPnBmB0qondvLuZLgX7ktqZzwE79BA1X/i6njTskeG1QtxRkYr6jsm0iCgszBzNlari1nRcijS3jjVFGuaKAs6yH4a65qd44KKe4Iri/KwWH32hgZ0hLPXoq40lb+0B07YtLocVWH6P2DmT8ZcHSXbrUEJ72Y3nuqrKwbIay0MGB7ilu/7lkeSQzhlyJd5KQvPK2AWKn8yqY7fEeHfLtj4t0oyaswxi43rJmkiDKbck97Luc8FfYOQz5amE1K6KWRYamOIZ+ycnEJpm3EawaDxSZkRQ4he3qE5dQ8U9orIk80hNOjsckulQ7YdHI7uUXdXSuCEuU29vovvVHBQV9KeUmUsVvR0qiLPpPAFdeLNuV2UUZR/FqPxRsB4RJfKLtL5/RNRHp33QcLZu6r+Lmos=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9779.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(7416014)(1800799024)(366016)(11063799006)(4143699003)(56012099006)(261028144727099003)(261009223027099003)(261021123027099003)(261026140227099003)(261022115727099003)(261022105027099003)(261026121527099003)(261022075727099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z1IrbEx4d2lVWTBabC9xanZHeXlaTjhBVytGSlJkcE9zZUJzM082ZTRQNmZ1?=
 =?utf-8?B?ejN2RTVPb1dPYS9aVE9MejRoUGhYWUxxSXJBamJaVVdXaERyOTYrbmNaUU1T?=
 =?utf-8?B?RVV6TTE4bTVFYTFoZVB1dzJZeEhINjlEM2IvTk8xalhPSktLZ1U1OENxYjBn?=
 =?utf-8?B?UFRJaDl3RTNlSmozaUh2TkpuTm44VEdCcWc1dS84RmxpYjVEZ3ZUcmpUNFpv?=
 =?utf-8?B?TUJ4anVMUWVxandjb09zVEN4YWVOSVM5ZElYZDBuL3lkeG9PVm82Ymp4SVRE?=
 =?utf-8?B?a25teTloeW9SMFRiUnBQQUM0a0c5d05YUmlwb3N0VnZSOWJmVXJ1d1BGejFB?=
 =?utf-8?B?NU5FL2R3aHR4SXBhYUVIVlNoOHlDUEVPeHJZTnFyMEhqT2JMdFhRZWZrb0l4?=
 =?utf-8?B?QStaditrYk5DdlFXRWNDUFdyOGxEN0RsMzBidUhCTnpISzhJaFcwRmJaKzBy?=
 =?utf-8?B?d2VFanEzWG1IQkNuQTg2Z2hsQ3YrZ2VnUHZIYTZCVmp0WHhpSlFlTEt5ZFJJ?=
 =?utf-8?B?YURNd2Z1TDV5RVVWYTVySFc0LzZ6ZUJ0RDdEMHAzaXpDZVZJa1FHOW1MMzNu?=
 =?utf-8?B?NDVtcGNRTm5Ib1RKbXl1bC9uYzZXVE5UdDdSUk5EaDVZZnZyekRjd3JGZktG?=
 =?utf-8?B?dXRGMWwwc0grWnRXWlJkbU15S1hEYXhxb0Q1RG85VVZMUEdqVmNvcG9nTVhi?=
 =?utf-8?B?dGFscXFUUXRDZXBzNWpmQk94Y2c5ZGVpVHNUcmU0cHNwR1M2WndROFhBVWpy?=
 =?utf-8?B?VURMMkNkSnZBbE54MDBnTm9LZXRaRCs0bFFRU2JDTzcrcVQrVnEyUllCVjlI?=
 =?utf-8?B?V2s1dDFrOEowajByMTBqNVh5K3A1dTZKM3BYcTBVbjZNREhNZEx2U1RsQkFP?=
 =?utf-8?B?ZDFVK3luNkxiV1F0dWxib0lTTEVaSXhiSEJuNXlXSVFRNy9mcnp0L3JpQVF2?=
 =?utf-8?B?bkxYLytMNWlDUTh3Rk13M21UNW9CQ0srUUFrYXplVGxsLzBXVmNGY1NjRVNL?=
 =?utf-8?B?TjRyZzBGUkFyOStXWVZ4R3ZjOFh3UVpVanhkMkRnY3BueEdjeDBJTmpaZVNh?=
 =?utf-8?B?YXRMdDhHM3lpWTNHNnU5THFJVXF6ek84Nm05bk5tdG5sVXEzNWN0aVBuK1NC?=
 =?utf-8?B?MlZ0Vm0vbFMybzVEZklneHBMNUVSRy93d2ZjcFVOT0dGcW54WEF6WERuaHpx?=
 =?utf-8?B?d1dhbnJGYzByNHZlN1FXeWxObGdXT0h4UWhmZ1o3cXRPTFdURVRhdGcyamlY?=
 =?utf-8?B?YlloNEN0RU9XZ3kraC81TWNJN1hvb2M3M1ZrMmV4OVlZK3I0YVFPOFMxNXd2?=
 =?utf-8?B?S0dUN1lGSys5ck8rN1F2V3NjZVpLWlVVQXNoL1REbVNjMkpUQTVGR0dkc21x?=
 =?utf-8?B?RHR4M2RENmh6SGFJemFPVHlHZ25McFN1amZZMExhUng3QmNITXFEZkdEdG5R?=
 =?utf-8?B?Sjk5SUhWOVVlZHRsajhtejlXRlhEN3hEWitRWE9HM3FpMG13MTdTM00wUlRQ?=
 =?utf-8?B?ZWRQYjA3V3AzRlRJTHlOZFF5aXllYTdTZEdNd3RFMkN3YUxnQUFERDRrOXBn?=
 =?utf-8?B?akszVHRZRkxDN1dmUnU5SHhuSjk3ZmYvdmg5T0RBQy9ENDJCQXJ0U3NDMzR4?=
 =?utf-8?B?dURyVCtJbUd0Y3JuMWx0ZTFROUJwZjhOMmh5bzZQL2hxSnpJZDRud2ppdFFY?=
 =?utf-8?B?Y2VJTGlFY3ptcXNZdWRLeGZuUUhycERWYnZkN0Jma05udWRqT09lcThYd0JN?=
 =?utf-8?B?Mi9ja0tRTDN4OXl4OFRacUpuUlMzek4wbFBjbFZVNzdNOEEwN1hLVDhIamti?=
 =?utf-8?B?QS9FYXRVZXduQ0ZvYkRINVZDYm5laHdvQ0hCb05IQUhQYXpsMzJhZ0VkRGRz?=
 =?utf-8?B?aUk5L2dUM1JFOTBxRTlScSt1dXhtWUI3emF0clhIZTJQRUI2cmFJSGt1c21r?=
 =?utf-8?B?Ykg4Q0E1akdjNk9BdHFsaFAwUlowTmZ4ZnFnaHFPbTdjRmo4RjN2alNpUUFu?=
 =?utf-8?B?YmtuRXdic28xSGxta2FzQnRBeXVYajliVC81bkpkcko4U1lYYzFuK2M0WjAr?=
 =?utf-8?B?VWU3MUxxRVJGN1ExQW0raUlUNk0rVnVBY2V6VFlObm4xQkdRSmxDaUZaTkw1?=
 =?utf-8?B?K3hkNlUzLzZUUmpOcE4xWXJ3NUZjMDJ4TDRGUDk3amEwWWRsMUpKNS9LSWFQ?=
 =?utf-8?B?S1cxMU8xeThWSk4wREwrcmhGL2krdmRMcTBJNUNmQytnSlI0VGt5ZUQ1M09j?=
 =?utf-8?B?ZlJ4QzFGaGdqSmIvQnBKeStNVWZUUi9oRDlSVks4QjdkUU45U2V2Q0hkQWNK?=
 =?utf-8?B?SEVYSGl0VjZtV2VOYjBjLzNCTFIrampYZk9rcjJlTzcvRGdBR0pXZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 077f5fe1-cb65-4889-653e-08df38dfa58a
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9779.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 12:48:51.7955
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TxMbHsdFxP4I/TzQHFXQWmUtcYftVQ61CnlW2OYeuPTWiC+pgDREzW6xBagZcG4C
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FT1PR12MB623484



On 10/29/26 17:27, Borislav Petkov wrote:
> On Thu, Oct 29, 2026 at 05:12:44PM +0100, Michal Simek wrote:
>> With Versal Gen 2 which is still under development I can imagine that we can
>> design it in a way that we say that we won't allow any MMIO interface and
>> only firmware interface will be used and firmware itself will integrate all
>> edacs in the system and export it via the same API. Then we will have only
>> one single driver for the whole platform and it depends only on firmware
>> which functionality is going to be exported to Linux. Which is IMHO model
>> which you would like to see.
> 
> I appreciate the intention to make it saner but ARM is insane by definition in
> that regard. You have IP blocks which can be built in in all kinds of
> platforms and sw needs to mimick that. For some EDAC drivers we even have .c
> compilation units which get linked into each platform which supports them.
> 
> We would usually do that when you have too many EDAC wrapper drivers loading
> on the system and them needing to talk to each other. Which the subsystem
> hasn't really planned on supporting.
> 
> But if the wrappers can be relatively independent, we can do the simple
> thing and do a separate wrapper for each. No biggie.
It is completely independent.

Regarding platform data versus DT which Yazen mentioned. I have played with it 
and pretty much it would look like this from firmware instantiation point of 
view. (active_platform_fw_data - already holds SOC specific hooks that's why 
they can be reused that zynqmp_pm_get_family_info() in edac is not needed.)

+static const struct resource versal_xilsem_res[] = {
+       DEFINE_RES_MEM(0xf2014050, 0xc4),
+};
+
  static const struct platform_fw_data platform_fw_data_versal = {
         .family_code = PM_VERSAL_FAMILY_CODE,
+       .xilsem_name = "versal-xilsem",
+       .xilsem_res = versal_xilsem_res,
  };

  static const struct platform_fw_data platform_fw_data_versal_net = {
         .family_code = PM_VERSAL_NET_FAMILY_CODE,
+       .xilsem_name = "versal-net-xilsem",
+       .xilsem_res = versal_xilsem_res,
  };

+static void zynqmp_firmware_add_xilsem(struct device *dev)
+{
+       const struct platform_fw_data *data = active_platform_fw_data;
+       u32 cfg[4];
+       int ret;
+
+       if (!data->xilsem_name || IS_ERR_OR_NULL(em_dev))
+               return;
+
+       ret = zynqmp_pm_xilsem_read_cfg(0, cfg);
+       if (ret)
+               return;
+
+       xilsem_dev = platform_device_register_resndata(dev, data->xilsem_name,
+                                                      PLATFORM_DEVID_NONE,
+                                                      data->xilsem_res, 1, 
NULL, 0);
+       if (IS_ERR(xilsem_dev))
+               dev_warn(dev, "XilSEM register fail with error %ld\n",
+                        PTR_ERR(xilsem_dev));
+}
+
  static int zynqmp_firmware_probe(struct platform_device *pdev)
  {
         struct device *dev = &pdev->dev;
@@ -2345,6 +2372,8 @@ static int zynqmp_firmware_probe(struct platform_device *pdev)
                         dev_err_probe(&pdev->dev, PTR_ERR(em_dev), "EM register 
fail with error\n");
         }

+       zynqmp_firmware_add_xilsem(&pdev->dev);
+
         return of_platform_populate(dev->of_node, NULL, NULL, dev);
  }


Edac driver would have


+static const struct xsem_cfg versal_xsem_cfg = {
+       .sw_event_node_id = VERSAL_EVENT_ERROR_SW_ERR,
+       .cram_ce_mask = XPM_VERSAL_EVENT_ERROR_MASK_XSEM_CRAM_CE_5,
+       .cram_ue_mask = XPM_VERSAL_EVENT_ERROR_MASK_XSEM_CRAM_UE_6,
+       .npi_ue_mask = XPM_VERSAL_EVENT_ERROR_MASK_XSEM_NPI_UE_7,
+};
+
+static const struct xsem_cfg versal_net_xsem_cfg = {
+       .sw_event_node_id = VERSAL_NET_EVENT_ERROR_SW_ERR,
+       .cram_ce_mask = XPM_VERSAL_NET_EVENT_ERROR_MASK_XSEM_CRAM_CE,
+       .cram_ue_mask = XPM_VERSAL_NET_EVENT_ERROR_MASK_XSEM_CRAM_UE,
+       .npi_ue_mask = XPM_VERSAL_NET_EVENT_ERROR_MASK_XSEM_NPI_UE,
+};

+static const struct platform_device_id xsem_edac_id_table[] = {
+       { "versal-xilsem", (kernel_ulong_t)&versal_xsem_cfg },
+       { "versal-net-xilsem", (kernel_ulong_t)&versal_net_xsem_cfg },
+       { }
+};
+MODULE_DEVICE_TABLE(platform, xsem_edac_id_table);
+
  static struct platform_driver xilinx_xsem_edac_driver = {
         .driver = {
                 .name = "xilinx-xilsem-edac",
         },
+       .id_table = xsem_edac_id_table,
         .probe = xsem_edac_probe,
         .remove = xsem_edac_remove,
  };

No zynqmp_pm_get_family_info() calls and no DT binding.

Please let me know which way do you prefer.

Thanks,
Michal
