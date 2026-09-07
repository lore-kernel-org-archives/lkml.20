Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C526F4CCDC7;
	Mon,  7 Sep 2026 01:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788743764; cv=fail; b=K0BT4jRbQa1wO9fE2naU+qO1ug7/jvu5b595KAADMDylp+8lu/cRKHyKIeYSBzcIVTsyWVR2V2bwuSNrCGvUeV4exglAcwt7vkg3jQKHzO2t/EzbCaAAE56deFCsa1/TWWOmDBRFTo5FcMHIwBHAx23CDF8CwIgrniM4uZ/pHFU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788743764; c=relaxed/simple;
	bh=/yzPuq8urE0I3UaGOLOvBK0UCLZQx7h2/IUl0wUrxeU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qrvYotzt4Y3/vgPOScwgnxk+toxN+tgIorguAEozWICv3YxN4+YTeEZcj9qEdfUbSsOGD2sffHLpzRZjKXxtfSWdk23t7J4xY3XTBbFkOcs353B5U7FLLMR9ZPMffkxhT/kLH9+EnDNv8lnc4PCo16Tfn0q/fGsuD+PRqVe7pXg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VcAj51Z7; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VcAj51Z7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788743761; x=1820279761;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=/yzPuq8urE0I3UaGOLOvBK0UCLZQx7h2/IUl0wUrxeU=;
  b=VcAj51Z7EcXIsH2XcnlDUlpqmQIOYIG3iygAFRZfeu+ogZaCzq2+rF6f
   pB2R8krwXynKTrkeb4JHtwHxyZ7C3UrscFueQJQtriKAORHns2zpRSppk
   0FIdeJkY4SF1OOaCOWOQI6j3+TRdzLm3PJmCzHtERU7Xa+3l3hSUZeK+R
   9F1Opzaz9+nkmqunjMZ/H5aRuNph2ml11A7BrohxP18rwVPdiY3claLma
   xTWv1457Q9cBKEp9jpbXc0EAOyFqxBw3BVc6eaIKbZiowzjiVyw+5ElQU
   +yi/m7wI/AOuAWLZYZxe4jaYBQsA5/G2zU+qjhwQayw2S5clwWJFnRnzX
   w==;
X-CSE-ConnectionGUID: o8KpkjaPQS2CmcTUZ5fYyg==
X-CSE-MsgGUID: aRkFadX9R46KEOL9d0hKsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="100304285"
X-IronPort-AV: E=Sophos;i="6.25,266,1779174000"; 
   d="scan'208";a="100304285"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2026 18:16:01 -0700
X-CSE-ConnectionGUID: Ymu/xe4QS2yDbtIdUVRvEg==
X-CSE-MsgGUID: /v7/H7WlR/ucQtcq8IbsCQ==
X-ExtLoop1: 1
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2026 18:16:01 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 6 Sep 2026 18:16:00 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Sun, 6 Sep 2026 18:16:00 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.25) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 6 Sep 2026 18:16:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZeQCYXzE48nDB/bKkUrjlxAQWJglydV2wtGJvH2VHHRanWMT2bNuoaLlkrC7BWLuF8+F3/qODCWB82HYxmy21S0fLEHaAWp1en7fOyxVwsZ+fb+X8j0zc6UNknNB4RNyXuqKf455K7Ydab10ww8t/2a+TTLiDgwIq0GJLbDTXxm95LxR8K+lhy0yPIjd6WebwAhz4fdEbOBI6QRITaYsnb0CfC6HIJLDjPyMJBTmpFb8a6kbEe7341DhY39K0VUYgXXH1VYgkCcRCBmT+rLFLqo3JUa2Et5nU0UrbNjqHPKHfOrwG3w5ge6skZYfca7JVDRM87ZQHfoGI+51ZhTR+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/yzPuq8urE0I3UaGOLOvBK0UCLZQx7h2/IUl0wUrxeU=;
 b=d2misuxXIIZo50kw0kdAuhMoDvq5t3l89+bj46hG8qgNLDYBHdnaNqmuICHO2UyFyp2FWFnC4ULsGD7u+nOwrjpG6wBjV19du+jgU9SJqGEaX+dyXl2rIuaiz6DdgA+eKIv2JGAtZX5IByXd1TSTsM1W5GR08qRyRamWaxrSWp4IYIh7B8P1EZSEU+/F83KiLmlLnMjLnb11ZIG9qScsraAtWZ4gXYL8oSwvo3hObF6u573AzmSYEAUTSPd19HFx2g+OuzbGrU7DbgiYoaMLO5tImLWjjMgkjZznIvbo/Lga5ZSkWdSJB4IDahTQhz3iO/8npHBPZLfo285wawXkag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ2PR11MB8424.namprd11.prod.outlook.com (2603:10b6:a03:53e::10)
 by IA3PR11MB8940.namprd11.prod.outlook.com (2603:10b6:208:57e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.14; Mon, 7 Sep
 2026 01:15:58 +0000
Received: from SJ2PR11MB8424.namprd11.prod.outlook.com
 ([fe80::3df:33f9:59a1:da76]) by SJ2PR11MB8424.namprd11.prod.outlook.com
 ([fe80::3df:33f9:59a1:da76%5]) with mapi id 15.21.0382.012; Mon, 7 Sep 2026
 01:15:58 +0000
From: "Liao, Bard" <bard.liao@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Bard Liao
	<yung-chuan.liao@linux.intel.com>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "vkoul@kernel.org" <vkoul@kernel.org>
CC: "vinod.koul@linaro.org" <vinod.koul@linaro.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"peter.ujfalusi@linux.intel.com" <peter.ujfalusi@linux.intel.com>
Subject: RE: [PATCH] soundwire: debugfs: add root-level peripherals table
Thread-Topic: [PATCH] soundwire: debugfs: add root-level peripherals table
Thread-Index: AQHdOrOen/oFmooauUKkOpcPrWvyALa+CnOAgABCCWCAACXhgIAD5M+Q
Date: Mon, 7 Sep 2026 01:15:57 +0000
Message-ID: <SJ2PR11MB842480439A18829A8D865AA7FFB22@SJ2PR11MB8424.namprd11.prod.outlook.com>
References: <20260902081802.420946-1-yung-chuan.liao@linux.intel.com>
 <6aa4b17e-042e-4319-a3a2-41f7346f3755@linux.dev>
 <SJ2PR11MB8424EEF8CC938A4DD842F06EFFB52@SJ2PR11MB8424.namprd11.prod.outlook.com>
 <9f06bdbc-b25d-4a8f-aeb6-ba11e43e9cdb@linux.dev>
In-Reply-To: <9f06bdbc-b25d-4a8f-aeb6-ba11e43e9cdb@linux.dev>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR11MB8424:EE_|IA3PR11MB8940:EE_
x-ms-office365-filtering-correlation-id: 72f3b215-55b1-456c-4db5-08df0c7d92ab
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|38070700021|6133799003|10067099003|4143699003|56012099006|11063799006|22082099003|18002099003;
x-microsoft-antispam-message-info: zHUo4QrxYsNHFS/WJrtAWe6Db+tGHIh0F1iEke1RJfs1vuzX+HH7P0THBByZ4o+f4MMX2Nsqfgsh2p6jdf7ahsrfoJJamOeOsoEIhnvoRgyWKiKTElmmHKlzvPRjzEJW1Ksdvx8FKy5sLGvh8BMEbpxhIAyVP5ntDagvb2YatW46HMWVX1IV2S4wPPFiUez/oyOnoA7XD5ND9lLtqAlKMGPc5nNM3hrFJFQyQ5/q6nc/zKTOY7/V5dwfRx+R9a7sSCHnKJ3P90PRQ2WBIPYxJbt+DIeSLP6w4wbOYLywitnxTx6I2BreTATr4jO3u5mGVwZDXY8tvcH0tDK1yF5GOTWcjJ1gyqMjzy/F4Wmz4EQUu8ZVVS6L6HhZx1qTf5eyv6tBmMegcnuu+OM3QXjZ95EH60hOHxzVqUewuBsL+aZI+PnO3WHuf92t6JiAkUXmL8oLCK1hzlv6hj3rbXaa7xL+L8nOxVPB0QSMv6x19xlT2/Pwqty5guFQ8SYP64IbJt70kTY14SfK3IlqZ4F+I8hJjXBAAX2beokgczOVfV1jXqp0/NESPW8BYsTArsmCJBhYISmIwqj4t0IuHRLwj5qWfP+rGxygPKq8g/vxnXlD3K37GdnEdptEf2ySzpTnXBGka2o0FkN9U1YrDuUYoTIHts8lf4VjJLtH+H8u+0G9u7WC11agkgqJpHFJH06xFpbqxfNK17kQz/zDX4mxg+R5PnsBwkUPUyF3UGnNd00=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8424.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(38070700021)(6133799003)(10067099003)(4143699003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TXdlSkpHVDRuOHdqZTczZDFEZkVQeFB2cU9JRUliM3lINVM4eDJlNmtHVlRr?=
 =?utf-8?B?aTFkWVg4a1lqTXA4MmgzcmJhRVNnVW9jZFo3elc1UWZEa2p5MDNSall4aXlW?=
 =?utf-8?B?eXBGeVNpUXVVVnkrbXVrbFBwTGZTOHJTZVIvS2FvZEJOVGFOM3JTNmNCMm5D?=
 =?utf-8?B?ZEY2WU45QU5NcTMySWk5d2kzN2JldWRDN05VMENMUjJ5OEZ2TW9lSENXNSs3?=
 =?utf-8?B?YnRNQktCQkxzdUhHQmErWXYwZmcvdmU5WDNNcWJZaStiYmR5SUoxZUVEQys3?=
 =?utf-8?B?bys5Y2IzczFZWit1NkhSQ3BMV1VaenhQek9lN0g0a2VXbEV0NCtuRWtHaDgx?=
 =?utf-8?B?YjRmNlZkeEZkc0oveGEyQ1hvcHFFVHJnM1RlamtPeVpJWmZhbkQ2MytrVXZv?=
 =?utf-8?B?S1lEaFFVZUxuWVpOdlIxVW5PWnh6eFVrREFwWHhqTjVnV092dmw5c0szQTd1?=
 =?utf-8?B?VlNqWktzb0RkdWlWemZobERJQnlKVFoxcVE4bDhuVXpOempmU3hqNmIvME1O?=
 =?utf-8?B?MGdWKy81aDBSdlpKOVErbVV5RkhQenRGWmhyWGlHSzR2WjZMSGVrR2RMRXYx?=
 =?utf-8?B?WVRQajFzdGlPa05mMlBUcnJrdm9FSGYwdUJDNGhvUUNhUVRkZUtTT3lwMHEv?=
 =?utf-8?B?dGxmOXJsUWlrbG5GWWgzQnhJbG9IVXJPUnNHUW8zcWV5aU9oMXdmdXRDMlFF?=
 =?utf-8?B?SkZCYng4Q29wczNmMEpnRmRZT0pweXBKMUtQSThNVS9vd0hIdDYrb0VPS2tx?=
 =?utf-8?B?T0lJK3NoT1RVNUhXazdQTDFhUmJtQXhoQnlVRTFES1lDVnZ3VGYxNFJTdGp6?=
 =?utf-8?B?ZVhSQm1JbVdxdkpQZHdoM1F1MHJuQ0h4MGs5WnpZNk95UGplS1g4ODhvOHJi?=
 =?utf-8?B?WlpDUGhYeTBnS1Q4dU5nWUhsOFV6U1RuK0tjNTZIbWFuaVU5T0VoejBQZWxB?=
 =?utf-8?B?R0FLSHc5WjRQcFY4cFpUVXRmdG1ISzg0QXRaL0FtNVhaTmJFSWgvZWQyRkdl?=
 =?utf-8?B?RlJkb1Ywb3RVRk9kaGVzRjFISkMxbVNZZ09vNFg5YmlCODlqTVY0UHQ4NWky?=
 =?utf-8?B?RUtEOVgyK3dtbUZyai9SSmFaWkZoN0VJSGJ1TDZQa243eS9TK0FreE9oQVJt?=
 =?utf-8?B?ZXBIMW5mUENHSzZWZzdLMDJZVDdSY0lXUTVkT25peGdUK2F5dWZtdy9ySWZL?=
 =?utf-8?B?M2V5TmxHVFhBL0xOUTI3aVFuSDl6Um84aEhnOGRXa0xpWC94aDlyMk1zZHhk?=
 =?utf-8?B?bmZNNkl6TlptS2EzelMvaWFJeVAyNCtiWFNTc1RHUktZSmx2SzJ1SitzekVJ?=
 =?utf-8?B?bmV3WDViOUxaZTFIaVVCbzdvWGEvb3NzaytUOVVQWllGRDRHZHNsaEVhTWFx?=
 =?utf-8?B?emNtOU1KYkFTS1FpZERzSWNtaXdrejRONDRoc0kwZm41aXRnTFlIVmNhSDAw?=
 =?utf-8?B?M3E5ZHVJOFV4Zm1TazdhWXExamErUlF1YVVJK3VOMnFXWW9XTld3dG0wQUtM?=
 =?utf-8?B?alFXam1ZRGV6YnJBcWlSNGZXU1RkWngrZ0haOHJYTkt0a3pNbTRMOWJWRm8r?=
 =?utf-8?B?TUZPN0lmeFpqbXN4a1FDZndiZFRxR0lGY1oxNWxPbm84Zm5rRW5TNWR0eGpO?=
 =?utf-8?B?cllDSTNyQlAzSXNBZ2FhY3RtNWVMS2lSdmdCUm1WeWhRcnUwRG5MR0pkcHdG?=
 =?utf-8?B?MXNVVmUwRjRHaFkydWVwUWI5dHo0NkdkaW9Qc2dOSndJWTZGRDlmNlp2ZXBp?=
 =?utf-8?B?NmM5UFZZY2NBUDh6NmxQbGx4Yjk2LzVEMEUxV3NBUkVuZ3NJRkU3N2R4Z01z?=
 =?utf-8?B?WG1Jd0wwZVV3WklEVFYxdUVHK0ZxOWNHZjdVVDlsUitRL3NwTHhGeW5sWFBq?=
 =?utf-8?B?YzJwQ1FycDZ1emEyamoxa1hobVJUYW1kcExEUDhPdnZiVnAyd1VBQXBmWjFt?=
 =?utf-8?B?clBDRWxvdVJ3aElvWkxCUUluSm9rVEpzNUJva0RiQ2NDL3BtSVNjbzl3QlJj?=
 =?utf-8?B?ZnhCUXo1a1BzMGg3cWRIM2IybVVMQk1FMzlPSGpiQkFyTTdzTkhlS1Qzemd6?=
 =?utf-8?B?cnFONktvYVY5NTh0WXRJNENZT0JlYnJoQW5KNWxjZWZGdjY4R1FkL3Jmdk9Z?=
 =?utf-8?B?cWt6VHBybno4Y1lER2dwN3BPUDBqbThXMEFocHNPN0JEYVBHV29KbGpqaUh2?=
 =?utf-8?B?eGh4MUVjS3YwZ1ZxbFJVSEljdjB1NkxWYnNOZms1OSt0WHkrN1Z1VnVmaW1n?=
 =?utf-8?B?MlVXVzU1eFFubUZJYWExYkxKZ1VneGkzUUJ0d25JT3NhVG54bitmeFdZR1Vo?=
 =?utf-8?Q?UVemB1I6eUgtUiw4qm?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: QGTvOv65MCvNLc6Y7wLzwCf//khsVyqoSR2l4FmDF/B7jN4YUmA1AdVAbYsMavJcPfKcStgbbRLm61S4GH+/6y0P6lVOwaUKChMapgHjpQJCmEsyFoXLUNTCkAVcn8uL3mDb89tiAu7x0Il60+0m3C85ckKmDO1/lWhQxfP2wINzbAQw/xOitp8AzV9ioZ2HTny4js1LzLsRRzgUYycC5zGIoiQuqrnSn4oVGhoIakSWk/JjXt4qPQJpYYwlBwEWn3NMkDCFPG9fd1DfEi043aN/o3Zbjkykxi6pM0CYqMdWsElK9VXkDHw8RQhZWuKljhLHom+Y3b+5WYQoidOx6g==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72f3b215-55b1-456c-4db5-08df0c7d92ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2026 01:15:58.0863
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nss0E1VTIfa1qKegyZUGV8BlF6wrazk62iTKrxmUIMiLX6DCCVAhhYj4Exr5eNQE3FBbwXGmMVigmKS2wi0IDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB8940
X-OriginatorOrg: intel.com

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGllcnJlLUxvdWlzIEJv
c3NhcnQgPHBpZXJyZS1sb3Vpcy5ib3NzYXJ0QGxpbnV4LmRldj4NCj4gU2VudDogRnJpZGF5LCBT
ZXB0ZW1iZXIgNCwgMjAyNiA5OjQ3IFBNDQo+IFRvOiBMaWFvLCBCYXJkIDxiYXJkLmxpYW9AaW50
ZWwuY29tPjsgQmFyZCBMaWFvIDx5dW5nLQ0KPiBjaHVhbi5saWFvQGxpbnV4LmludGVsLmNvbT47
IGxpbnV4LXNvdW5kQHZnZXIua2VybmVsLm9yZzsgdmtvdWxAa2VybmVsLm9yZw0KPiBDYzogdmlu
b2Qua291bEBsaW5hcm8ub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOw0KPiBwZXRl
ci51amZhbHVzaUBsaW51eC5pbnRlbC5jb20NCj4gU3ViamVjdDogUmU6IFtQQVRDSF0gc291bmR3
aXJlOiBkZWJ1Z2ZzOiBhZGQgcm9vdC1sZXZlbCBwZXJpcGhlcmFscyB0YWJsZQ0KPiANCj4gT24g
OS80LzI2IDEzOjM2LCBMaWFvLCBCYXJkIHdyb3RlOg0KPiA+DQo+ID4NCj4gPj4gLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4gRnJvbTogUGllcnJlLUxvdWlzIEJvc3NhcnQgPHBpZXJy
ZS1sb3Vpcy5ib3NzYXJ0QGxpbnV4LmRldj4NCj4gPj4gU2VudDogRnJpZGF5LCBTZXB0ZW1iZXIg
NCwgMjAyNiAzOjM1IFBNDQo+ID4+IFRvOiBCYXJkIExpYW8gPHl1bmctY2h1YW4ubGlhb0BsaW51
eC5pbnRlbC5jb20+OyBsaW51eC0NCj4gPj4gc291bmRAdmdlci5rZXJuZWwub3JnOyB2a291bEBr
ZXJuZWwub3JnDQo+ID4+IENjOiB2aW5vZC5rb3VsQGxpbmFyby5vcmc7IGxpbnV4LWtlcm5lbEB2
Z2VyLmtlcm5lbC5vcmc7DQo+ID4+IHBldGVyLnVqZmFsdXNpQGxpbnV4LmludGVsLmNvbTsgTGlh
bywgQmFyZCA8YmFyZC5saWFvQGludGVsLmNvbT4NCj4gPj4gU3ViamVjdDogUmU6IFtQQVRDSF0g
c291bmR3aXJlOiBkZWJ1Z2ZzOiBhZGQgcm9vdC1sZXZlbCBwZXJpcGhlcmFscyB0YWJsZQ0KPiA+
Pg0KPiA+PiBPbiA5LzIvMjYgMTA6MTgsIEJhcmQgTGlhbyB3cm90ZToNCj4gPj4+IFRoZSB0YWJs
ZSB3aWxsIGxldCB1c2VyIGtub3cgd2hhdCBwZXJpcGhlcmFscyBhcmUgbGlzdGVkIGFuZCBnZXQg
dGhlDQo+ID4+PiBkZXRlY3RlZCBzdGF0dXMgYnkgdGhlIGRldl9udW0uDQo+ID4+DQo+ID4+IFRo
aXMgc291bmRzIHVzZWZ1bCBpbmRlZWQsIGJ1dCBkb2VzIHRoaXMgbmVlZCB0byBiZSBpbiBkZWJ1
Z2ZzPw0KPiA+Pg0KPiA+PiBXZSBhbHJlYWR5IGhhdmUgYSBzeXNmcyBlbnRyeSBmb3IgZXZlcnkg
cGVyaXBoZXJhbCBsaXN0ZWQgaW4gQUNQSS4gRWFjaA0KPiA+PiBwZXJpcGhlcmFsIHdpbGwgaGF2
ZSBhIHNldCBvZiBwcm9wZXJ0aWVzIGV4dHJhY3RlZCBmcm9tIERpc0NvIHRhYmxlcywNCj4gPj4g
Y291bGQgd2UgcGlnZ3ktYmFjayBvbiBhbGwgdGhpcyBhbmQganVzdCBleHBvc2UgdGhlIGRldl9u
dW0/DQo+ID4NCj4gPiBJdCBpcyBjb252ZW5pZW50IGZvciB0aGUgdXNlciB0byBnZXQgYWxsIGlu
Zm9ybWF0aW9uIG9uIHRvcCBvZiB0aGUNCj4gPiBzb3VuZHdpcmUgZm9sZGVyIGluc3RlYWQgb2Yg
bG9va2luZyBmb3IgdGhlIGluZm9ybWF0aW9uIG9uZSBieSBvbmUNCj4gPiBpbiBlYWNoIHBlcmlw
aGVyYWwgZm9sZGVyLg0KPiBSaWdodCwgYnV0IGFzIENoYXJsZXMgc3VnZ2VzdGVkIG9uZSBjb3Vs
ZCB1c2UgYSBzY3JpcHQgdG8gcHJvdmlkZSB0aGUNCj4gaW5mb3JtYXRpb24gaW4gYSBtb3JlIHNl
bGYtZXhwbGFuYXRvcnkgZm9ybWF0Lg0KPiBUaGF0IHNjcmlwdCBjb3VsZCBldmVuIGJlIGFkZGVk
IHRvICdhbHNhLWluZm8nIGFuZCBtYWtlIGV4aXN0aW5nIHJlcG9ydHMNCj4gYmV0dGVyIHdpdGhv
dXQgbmVlZGluZyBrZXJuZWwgY2hhbmdlcy4NCg0KVGhhbmtzIGZvciB0aGUgc3VnZ2VzdGlvbi4g
SXQgc291bmRzIGJldHRlciB0aGFuIG15IGFwcHJvYWNoLg0K
