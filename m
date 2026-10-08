Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 039173D79FB
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 10:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791456525; cv=fail; b=QM/tBDNNob4QZ5eWYq/y6bPJX7BjHBGtqz/i/J+03I+NyAmabH4knGP8ZHcz4kl2JLaai1NgsVJzb5Gr0/zb3lOjWs/z2QgZv2G2aoTgCNAudva/ymM8E8mdoOgUAicj7sAWmX7BNf0EGuA8SfX9hHbh6TUiGx3uczik8ZRET8A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791456525; c=relaxed/simple;
	bh=g5Gmir0U6d8jAMbbrLmEyPVK9MgrNIP6PTCy7xZi4ko=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=PcgkGzklHRLE6rrsObHzFmYrQLvJIbIAz9Y9ysK20vcaYh/8KljLtiplb2X+CxnVYQWgfHFDYpdvwH3/nwCzPIU06mVNROfi3YMDeDpgRpZsXFxftFxG6mVcAKN7PirtR3dZ4x9Bi7dX05OJ2goBYjznKnQPq3K4s3i2TirTVA8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OTKRwWbi; arc=fail smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OTKRwWbi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791456524; x=1822992524;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version:content-transfer-encoding;
  bh=g5Gmir0U6d8jAMbbrLmEyPVK9MgrNIP6PTCy7xZi4ko=;
  b=OTKRwWbiWAEbk4wb/1Ormq5miTHY1jKWhuDtoQdolD0KrFAajE2bApPN
   3OSh0jD1QGtft3EalEktHKbT7ZGH7DlJDUIMSaHo5TP8jHaivCjElijg6
   O00lYGdJP9Mn+iJqnETXADCSUliyYQMvdEmWI5DBm603qQ8IfsQ6mp/lU
   9a0Z1K5o8aaQbHd8U5N9IOhtomuzez2Kypw7/A0TrVOrQIJA8dzpIk74/
   /W16ycjZkE3MUoStBeV0n7CO8/kaBnAB1aY5aKunpeqOa8PW3fEi/MoCk
   c01tZyFmXhhn8q/5BCjqMu5HxWPtmrSXCgNu+CAvIFM1s+gvlKlJ4SbQ6
   A==;
X-CSE-ConnectionGUID: WoVuK0WfRxuQNSjVclzXTw==
X-CSE-MsgGUID: QK7MX23tQKmpH7AV3VrNtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="337442"
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="337442"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 03:48:43 -0700
X-CSE-ConnectionGUID: CoaeYb2nTUSJrQXPDvjQ4Q==
X-CSE-MsgGUID: LiaAC8l+TNuMN/C1TQ7dVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="15211"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 03:48:43 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 03:48:42 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 8 Oct 2026 03:48:42 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.67) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 03:48:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lyLqGBUDPchZaufrjYA7ZTsvWAtotMEJkFRDeSqKwFVaPUudaEk03IiteLaV0agpEnXEdjp/o9sOvm9uCsfHTjZWA1I1Jx2p5BqzLYVDUyrMBFmYnx37DOsZyKJhGc2BuaA9qBQoJHX0wRWIRrCdGk94FEa/WB7yV39sGK253ikCAVf5o81xjYXI2PCHxhtYJRJipN1jaDcMegZ69MHJ1lGBZQoouxJ/13CWWDME9H9m5g9yTejB9t8xXtle5xluMYOxBL3uB+1j0MC677A2QkKyPDq42a/I711jUs7lKwbeuPUyyBqm0dkyNE8dolLm727LMzNjpjPOxDOMDxZIMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nDriBcMZhIR0nk0mK83GK/xgu8bRAg8j3r4cBUe4h5M=;
 b=uOAu2e7GbqT6NQq1loXivmgth+Sx6ZBUPkmtxL6d7RWTHVAQSjGJ3ey2xJCJyz/kUSUUTDlJSz9C2Pk5avZO9pWN3xODaQyN39jJPlKoxUriHqPT97UwN3qignRUNVFM1XwtdF/JXWxzjRqCTsRXE5k/cUWPbic4rXPqLRk0+zGQygeCQhvu2yqquZN7fPkWY4MqKk4hjlBle3ivVEmCZi1qCC5ykj1FRA8zPScsaUYnehPR+3o4TCrY3+eWX6ETCBlKMJXpZWgmkfVlC9WLaJES/u1hBAMYdbPMa/76MLVNODhSrHIjbpC9nscFtUHlA922/0CHvLU9GsQr//5oCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB081371.namprd11.prod.outlook.com
 (2603:10b6:610:34d::17) by SJ2PR11MB8500.namprd11.prod.outlook.com
 (2603:10b6:a03:574::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Thu, 8 Oct
 2026 10:48:38 +0000
Received: from CH3PR11MB081371.namprd11.prod.outlook.com
 ([fe80::dead:ac74:f146:cf8c]) by CH3PR11MB081371.namprd11.prod.outlook.com
 ([fe80::dead:ac74:f146:cf8c%5]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 10:48:38 +0000
From: "Hahn, Matthias" <matthias.hahn@intel.com>
To: "Ping K. Jiang" <jiang_kangping@outlook.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"x86@kernel.org" <x86@kernel.org>
CC: "tglx@linutronix.de" <tglx@linutronix.de>, "mingo@redhat.com"
	<mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"peterz@infradead.org" <peterz@infradead.org>, "seanjc@google.com"
	<seanjc@google.com>
Subject: RE: [RFC/DISCUSSION] x86/tsc: Handling legacy PIT fallback
 calibration on modern platforms
Thread-Topic: [RFC/DISCUSSION] x86/tsc: Handling legacy PIT fallback
 calibration on modern platforms
Thread-Index: Ad1VfW6GJFdWcHhxSfSywrMry6HhvAA9kaKAACbw2zA=
Date: Thu, 8 Oct 2026 10:48:38 +0000
Message-ID: <CH3PR11MB08137176D0B01A78B1C613FA95F1932@CH3PR11MB081371.namprd11.prod.outlook.com>
References: <CH3PR11MB08137159D0CC079C8BFA13F6E7F1952@CH3PR11MB081371.namprd11.prod.outlook.com>
 <SY0PR01MB109881D4E8F08FBEBD9F43089FB942@SY0PR01MB10988.ausprd01.prod.outlook.com>
In-Reply-To: <SY0PR01MB109881D4E8F08FBEBD9F43089FB942@SY0PR01MB10988.ausprd01.prod.outlook.com>
Accept-Language: en-US, de-DE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB081371:EE_|SJ2PR11MB8500:EE_
x-ms-office365-filtering-correlation-id: 8f0be8e5-4942-4cd7-b6ec-08df2529b603
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|38070700021|56012099006|10067099003|11063799006|4143699003|260925022911599003|260925021311599003|22082099003|18002099003|6133799003;
x-microsoft-antispam-message-info: QxATsP+eYLnKK/5HkEYmhRuKN7C/rsKNj0xu4YbfBYNFBbIvqQAp2afZaEVGrRpAaNTUg3vt6vXqpCS04Ur4VZ+nhPrOfw4ixCyn4svBEl+g2FLSF3PqP+RiFOYvgh9WBzJH+OqCzkLZz3VnsIPd9wbrOIhstMr+w8b++xelO+3y0vYsdb81jltj7kmjxkur5CXUW3o7rrevav7okBoni2PY3wkuKLY+/PaD/kObUK+rFkRJsTH3C0ySr9XUn0MOuN2K0FdZKTQIXjvxc332c2DGnOmFoHoB2E0Y3dKzO7mKV9XFCIFfGJJjIH0ttTCE+FYMJ1hOynImBgNpOib/peQJUAktAdxHpaKK/LcDzNAwYY1HtqZTP6jQZmZCCPXcVv4R7pcBB7ccrl62G5xlO73y65iACfZSbgBon74ldZZ9nqIbUwmrgKYQvF7e7uxDZvqAmqQkFjnRG4coS18hGWqkYcWazk4YgDuRUtemtKrET/2/+M/z7iaJjVbNSg1yUWTz914Z8EIWOp/8PcRPjsbo650adjUwH+2i6jFwdlvjCffBAmzpFhbEBO3dUePvULrBAcIbBkJ9nbcTHguGHPFMBAMWN7EpmH0MYJBoNL3d8h7VMXm6S9MRRDAdCfIHWdurXRNg8GYevRQ0Y9XRfVZX8N/a/BjiO0TVXelZlckvLwJPBWmZxTRyRrkneJBMf9QTh5r5MXAfG8F3sRlcvr8cf9CbiVJqQy71IeybM0w=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB081371.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(38070700021)(56012099006)(10067099003)(11063799006)(4143699003)(260925022911599003)(260925021311599003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eTNpR0dBZWYvbTN5dWsxTzhGb1NaYU1UdERuMDcrYlMxa0ZmZG00RFhXYmJT?=
 =?utf-8?B?TndPQkxGckw5VVNVNVdtVzZZc3FUaG00R0JOOGplUW9DUzhyT2tlRDV0YXcx?=
 =?utf-8?B?alJ6UENxOE9aU2lnR1pCTjNxbDMvNHp5QXpLRzhDTzllU0dZOE0zN1VweDlj?=
 =?utf-8?B?UkNqRGtnOXdFYm8xMHUrUDZ5bUUrZ2hOcTZnL3lFUU1UTFZiYjQwejBZOG1H?=
 =?utf-8?B?VTVKWGQzRFVOZXdTWDVBOWJOajY1ZG5vNTZiTk8vWVVtZWZRUGJYWUR2Q0VH?=
 =?utf-8?B?UFRaRE8rUk1TeDNCWFdGUEdVRzAxaVdJdzZwUkdGaVhRQm5lc0RULzNFTUZ0?=
 =?utf-8?B?L0VBa3BoT1U1aUJaa1Rra1ZYQk9WWFpKV0tVcDVNUFZ5VnhhWFJBcWQxRm5B?=
 =?utf-8?B?aWRMK0Z5S1BaaEZObnUremRUTEdFYTVqY1YyNEZNL3YvcUordldSa1pYWnUw?=
 =?utf-8?B?Wi82M045cUdPRXhYQU82L3VLYzBpSzBWM295ZkhGdXYrL2UzeEpMMW9DQjRl?=
 =?utf-8?B?Z0FhbGhDaXY5dklRbjJwL1EyYWF4dlNYbzhDZldDSGxaSkhGZVVXN09XYmE4?=
 =?utf-8?B?STdnQ013TWtpQktLWWc5Q25IMGgzODRBdXZzdElmWW5sT01XcWVKa1ZQdm5U?=
 =?utf-8?B?elNNNFpHRU5JVms5UmxTdXVDTTJuQ2FLL0hIZS9QWUFxMHBSTkl5NGV4S3Zy?=
 =?utf-8?B?Yzk3d0ZvaVJvUHZneW1WZFo4TzVtaWxQNXMrNTQ2NHZyaWdiTXpoT3ZpVEJJ?=
 =?utf-8?B?c3NRYXovQWlwTnNhZkhWZ1JwUDZyQTE1N3NpY2hHTDdoamNPaHdZZWVLeS9H?=
 =?utf-8?B?dStPaGhqdFNGNnNIaUJIQk44RlhkNW05d1RmSG9hMzNmLzRFVU84c3cxRERs?=
 =?utf-8?B?OUJCOFdzY0wxbnRJSUo5UmhhemQwTm9nKytBOFQ2UGxSKzJaK0Q5ZXdNMXdH?=
 =?utf-8?B?aU9pWVNGYXJUNzEvczRsVW02bEdqYXNWbDUzWEtzMjFGa3owcUlnRVN3Q01G?=
 =?utf-8?B?aDVNcDZLUFNiRE50K21QcDZ1T0JETnZMSnRHdlVrRDlxcEZBcVR2aTRaeGc5?=
 =?utf-8?B?aU94UkVtaXJrd2wyQWlIN0xta2kyQUU0NVk5clhEMTNVMVkxUTVaMzcwdXpQ?=
 =?utf-8?B?eG1LMXlEMFR0NFR1VmMxTmtyU3EzYks3UDcrOHhXWElobHBHaVlkcUc5dm4y?=
 =?utf-8?B?aXV4U2tFVS9jZXRKQmRVNnF3aytBMjZ1VHpZV0JzK3U1dlhFS1Y0QjgxVXg3?=
 =?utf-8?B?L1Y5bEJNQ0orYjRvRW0zNktvcUdndks4Sis3bzM1THJXMHhzZGZoWHM1N3NB?=
 =?utf-8?B?czNESWZUdDNwZGpHd3Z5VHdtTVZkK3FCWTNSL3diM3c1NnhnYnRkZzBYL3F1?=
 =?utf-8?B?RlJsWFRnTGIzakphSzZ2WjVCUXR3WEE0SjZqMjQ3andnOGJxSkRXUWxlV1gw?=
 =?utf-8?B?Z0xKUisxbVgwUXpmQW90OVB1VzFzUWJzM212b3U5SC9nMkRFSGVyd1Z0VitH?=
 =?utf-8?B?RGtTbEY1ek0xb3RKQ1FMZDQ4ZER2eGR4U2NvWXVTa2ZvMVNQYiszeTVEdERx?=
 =?utf-8?B?M1JlK1lrWEUxTi9vY0x4OUwwMk0yd3VPeS9lSFRPaFhWc0lPNlI0SWR0T2E5?=
 =?utf-8?B?N2FhMEtQeDdES21uUVhXQktrMHNnaENVREx3TTNvU2ZEbEIwOWRCMFF0WHRP?=
 =?utf-8?B?Q2luY1NINXVFT0M4dzJ5ZWloMngrUks2ZTFiMmZnL2JUWUpGcS8yMUxBWGRM?=
 =?utf-8?B?VWRzOWVRN21jU2pmM0w5cFBzdnFhQVRJWUx3UXdvN2FHbnZCRmcybUcyS0c0?=
 =?utf-8?B?ZWRXUlRyeTJFZmxKSUQ0RTB6WlA2ZDRwc3NTOTB0WTM5ZUdNRkVhcHRRK0w4?=
 =?utf-8?B?RXJxT0kzNUsvenhSVmRYSFkrVUQ2TVhkU0JTRFc4UStqT0FiZlBpR2hjYnNY?=
 =?utf-8?B?VnNIa3RpVEdqNXBQdWNoQWtwVnUyS21mU2xMdi9Qc0dmWER2SElzdHpHbFBL?=
 =?utf-8?B?U2JRS1FwRWNGT3Zoc0E3a3FQRklrVVh3RGNFWWZWMm9lay9RNjFRWjRhRkt4?=
 =?utf-8?B?cG15QWZYMWxZQVMxd2NXZ0Q0cThVbjI5aDRPYnNjMDVOZDl1VkFuNXp2ZDhR?=
 =?utf-8?B?elptemJ3VHVJeUlKekQ2enc5aUo1cGJVZDlZYU5PNFdSTnhmUTNVMnZEWWRM?=
 =?utf-8?B?VEZLV3BmZW91cnc5RHY4UTdhQ1V0bjRrUU1CN1JBaHVJWXU3VTdnUFFYQTh1?=
 =?utf-8?B?eXQ1VUZ0N1djZERNS3dXQ01MVXFFcERPVUpyazhySkpCTEtYK2x3aGNrNkxi?=
 =?utf-8?B?Q1VsQjZ3TGdVKzJnWE1vOHRMTW94OE5zd3ZUVVBZV3lUSy83TjczQT09?=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: l6DcNQNIheRb3cDqIVGETujLU4D2sqvK0icX0IZNrIm63isLOAvfECQ06evYakc9+z924SJJYc+OZUty+vfz3FTxscGOZGRJ7LsyFkmFDLZWgOgMtarXthlegE41zA3c+q/wHitXX2Pv2s6B8Sd6kocTDmhtBJV9Pt6W6oDG9VzCdQq0e83GaasRHr1zuH8ffoRvEf1dPR2kYK80vJSCdoO8KsSzSVeF/Q9v3V7zu/Z3Tt90nqr1HVQs1cqH5S28ztLFGyYeJ/TXhWD9OVWuZrrc/NOFuk9Rv2a3+dX08L+vkgx8FJLJI9XK0eHmDBC6HMzWF/0gaBFkK/OMarrKRQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB081371.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f0be8e5-4942-4cd7-b6ec-08df2529b603
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2026 10:48:38.7205
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VAOjiGO6zCGGjzwWACUWLMaCKgcMkhDSpVyJF5TH6Kk7FiXgidSeK7Y3dKwQ00UPVAIZJ0kY0J/oPPpAxA04gQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8500
X-OriginatorOrg: intel.com
Content-Transfer-Encoding: base64

RGVhciBQaW5nIEppYW5nDQoNClRoeCBmb3IgZm9sbG93aW5nIHVwLiANCg0KPiBJIHdhcyByZXBy
b2R1Y2luZyB0aGlzIG9uIGk1LTE0NjAwS0YuIE15IFBJVCBkZWxheSB3YXNzIH4xMzAwMCBjeWNs
ZXMsIHJlc3VsdGluZyBpbiBUU0MgY2FsaWJyYXRpb24gd2l0aCAzMCBwcG0gZXJyb3IsIHRlc3Rl
ZCBieSBydW5uaW5nIGBzdWRvIGRtZXNnIHwgZ3JlcCBUU0NgIG9uIGhvc3QgYW5kIFZNLg0KPg0K
PiBJIHdvbmRlciB3aHkgSSBjYW4ndCByZXByb2R1Y2UgaXQuDQo+IE15IG1vdGhlcmJvYXJkIGlz
ICdCNzYwTS1QTFVTIFdJRkkgSUknLg0KDQpEaWQgeW91IGJ5IGNoYW5jZSBzZWxlY3QgIklPIGZh
YnJpYyBsb3cgbGF0ZW5jeSIgaW4gRlcgKEJJT1MpIGNvbmZpZyBvciBUQ0MgbW9kZSB3aGljaCB3
b3VsZCBpbmNsdWRlIHRoYXQga25vYj8gVGhlbiBpdCdzIGV4cGVjdGVkIHRoYXQgeW91IHNlZSBs
b3dlciBsYXRlbmNpZXMgZm9yIFBJVCBhbmQgeW91IG1pZ2h0IG5vdCBiZSBhYmxlIHRvIHJlcHJv
ZHVjZSAoc29ycnkgSSBkaWRuJ3QgbWVudGlvbikuIA0KDQpSZWdhcmRzLA0KTWF0dGhpYXMNCg0K
LS0NCkRyLiBNYXR0aGlhcyBIYWhuDQpJbnRlbCBEZXV0c2NobGFuZCBHbWJIDQpQaG9uZTogKzQ5
ICgwKTg5IDk5MTQtMzg2NQ0KTW9iaWxlOiArNDkgKDApMTczIDY1MTQ1NzgNCg0KLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IFBpbmcgSy4gSmlhbmcgPGppYW5nX2thbmdwaW5nQG91
dGxvb2suY29tPiANClNlbnQ6IFdlZG5lc2RheSwgT2N0b2JlciA3LCAyMDI2IDU6NTEgUE0NClRv
OiBIYWhuLCBNYXR0aGlhcyA8bWF0dGhpYXMuaGFobkBpbnRlbC5jb20+OyBsaW51eC1rZXJuZWxA
dmdlci5rZXJuZWwub3JnOyB4ODZAa2VybmVsLm9yZw0KQ2M6IHRnbHhAbGludXRyb25peC5kZTsg
bWluZ29AcmVkaGF0LmNvbTsgYnBAYWxpZW44LmRlOyBkYXZlLmhhbnNlbkBsaW51eC5pbnRlbC5j
b207IHBldGVyekBpbmZyYWRlYWQub3JnDQpTdWJqZWN0OiBSZTogW1JGQy9ESVNDVVNTSU9OXSB4
ODYvdHNjOiBIYW5kbGluZyBsZWdhY3kgUElUIGZhbGxiYWNrIGNhbGlicmF0aW9uIG9uIG1vZGVy
biBwbGF0Zm9ybXMNCg0KID4gV2UgaGF2ZSByZWNlbnRseSBvYnNlcnZlZCBhbiBpc3N1ZSByZWdh
cmRpbmcgVFNDIGNhbGlicmF0aW9uIGZhbGxiYWNrIG9uICA+IG1vZGVybiBjbGllbnQvc2VydmVy
IHBsYXRmb3JtcyAoU3BlY2lmaWNhbGx5IFJhcHRvciBMYWtlIGFuZCBuZXdlcikgd2hlbiAgPiBy
dW5uaW5nIGluc2lkZSByZXN0cmljdGVkIHZpcnR1YWxpemVkIGVudmlyb25tZW50cy4NCiA+DQog
PiBPbiBtb2Rlcm4gcGxhdGZvcm1zLCBob3dldmVyLCBsZWdhY3kgcG9ydCBJL08gY3ljbGUgbGF0
ZW5jeSBoYXMgaW5jcmVhc2VkICA+IHN1YnN0YW50aWFsbHkuIEluIGJlbmNobWFyayBjb21wYXJp
c29ucyBiZXR3ZWVuIG9sZGVyIHBsYXRmb3JtcyAoZS5nLg0KID4gQnJvYWR3ZWxsLURFKSBhbmQg
bW9kZXJuIHNpbGljb24gKFJhcHRvciBMYWtlKSwgMTAyNCBQSVQgcmVhZHMgdG9vayB+Mi43TSAg
PiBjeWNsZXMgb24gQkRYIGNvbXBhcmVkIHRvIH4yMS4zTSBjeWNsZXMgb24gUlBMICh+OHgtMTB4
IHNsb3dlciwgeWllbGRpbmcgID4gfjEwLTIwIHVzIHBlciByZWFkKS4NCiA+DQoNCkRlYXIgRHIu
IEhhaG4sDQoNCkkgd2FzIHJlcHJvZHVjaW5nIHRoaXMgb24gaTUtMTQ2MDBLRi4gTXkgUElUIGRl
bGF5IHdhc3MgfjEzMDAwIGN5Y2xlcywgcmVzdWx0aW5nIGluIFRTQyBjYWxpYnJhdGlvbiB3aXRo
IDMwIHBwbSBlcnJvciwgdGVzdGVkIGJ5IHJ1bm5pbmcgYHN1ZG8gZG1lc2cgfCBncmVwIFRTQ2Ag
b24gaG9zdCBhbmQgVk0uDQoNCkkgd29uZGVyIHdoeSBJIGNhbid0IHJlcHJvZHVjZSBpdC4NCk15
IG1vdGhlcmJvYXJkIGlzICdCNzYwTS1QTFVTIFdJRkkgSUknLg0KDQpUaGFua3MhDQpQaW5nIEpp
YW5nDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQpJbnRlbCBEZXV0
c2NobGFuZCBHbWJIIA0KDQpSZWdpc3RlcmVkIEFkZHJlc3M6IERvcm5hY2hlciBTdHJhc3NlIDEs
IDg1NjIyIEZlbGRraXJjaGVuLCBHZXJtYW55IA0KDQpUZWw6ICs0OSAoODkpIDk5MTQzLTAgDQoN
Cnd3dy5pbnRlbC5kZSANCg0KTWFuYWdpbmcgRGlyZWN0b3JzOiBDYW5kaWNlIE1vb3JlLCBKZWZm
cmV5IFNjaG5laWRlcm1hbiwgUmFtYWNoYW5kcmFuIFNpdGFyYW1hbg0KDQpDaGFpcnBlcnNvbiBv
ZiB0aGUgU3VwZXJ2aXNvcnkgQm9hcmQ6IFNvbmphIFBpZXJlcg0KDQpSZWdpc3RlcmVkIFNlYXQ6
IE11bmljaCBDb21tZXJjaWFsIFJlZ2lzdGVyIEI6IEFtdHNnZXJpY2h0IE11bmljaCBIUkIgMTg2
OTI4DQoNClRoaXMgZS1tYWlsIGFuZCBhbnkgYXR0YWNobWVudHMgbWF5IGNvbnRhaW4gY29uZmlk
ZW50aWFsIG1hdGVyaWFsIGZvcg0KdGhlIHNvbGUgdXNlIG9mIHRoZSBpbnRlbmRlZCByZWNpcGll
bnQocykuIEFueSByZXZpZXcgb3IgZGlzdHJpYnV0aW9uDQpieSBvdGhlcnMgaXMgc3RyaWN0bHkg
cHJvaGliaXRlZC4gSWYgeW91IGFyZSBub3QgdGhlIGludGVuZGVkDQpyZWNpcGllbnQsIHBsZWFz
ZSBjb250YWN0IHRoZSBzZW5kZXIgYW5kIGRlbGV0ZSBhbGwgY29waWVzLgo=

