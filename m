Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7078B4BE432
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 16:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790007670; cv=fail; b=pCOuqVzwPH4KUj/kxeB3ciPTOPxwSISm0ECuMuNeYswH0JMIgrLmuzIsXnk3TK9UfqN3cGghBySGkuZxnucZnskBxXBI9lrhW0TRJ1goUccmHhS14bQUmXmKzsp8Du4bcs0GMoFD46tlxTln209pF0E14wXONntK76SrsJ0R49Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790007670; c=relaxed/simple;
	bh=VqZb1hg4a76Apizcy8NPPRYj4cBViUH9qi1RSGMcrt8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KFpwsx4dRmd/0keSMOIE4GgwyQi3TJTsHBqvgIEK8XJrNs/v/NxJg8cpmi6mETrO7WkZOoMlgykmetADaBe2h2PP1hyAs8ZIxrI16DHzfmDSKdQVsJzv7Od/gNJ/PiC8E9gN5Nmh93qIZjHQj7rH0NmXxrWm+9b7BJ6WFEzdEx4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SLiMZm+g; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SLiMZm+g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790007667; x=1821543667;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=VqZb1hg4a76Apizcy8NPPRYj4cBViUH9qi1RSGMcrt8=;
  b=SLiMZm+gEav3GKJB2r7DC2hTZwbZQOQjYJMAnv0nwX77MTI9JDhvZ7ug
   a+1HuWU2gEMBHf2luehCDnljF0X++W7bvVpVKAWiQ1tD0BnYDyDEeJzwN
   615scVU4F5t2ovaDCJ/Hf/MSz/EWpqIWu2dXqF7/ruXI52Xra+s6Clv8m
   0Xl1K4mNpxbgvIAQqiQNQDP4rMfI/ILSkqq9zuFUWRUJFZqdQIx1igWCr
   P4ayAyQ1Xl+cDK1+M8ITs5B353JR3t56m6A2j1kXZD7EKf+pD46CmL05U
   LeOOt6n0g1PbiRlkG92SB+Ka+TuryFzqtgqVfhVrS/YRjjLj106oTGWiT
   w==;
X-CSE-ConnectionGUID: RQ3mS/vaSs2PRXBasY+Kdw==
X-CSE-MsgGUID: EsVsRmzvQdCBqt4YEuID4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="108039018"
X-IronPort-AV: E=Sophos;i="6.27,115,1787036400"; 
   d="scan'208";a="108039018"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2026 09:21:06 -0700
X-CSE-ConnectionGUID: Po+8rm3LSxujWktxgLKZpA==
X-CSE-MsgGUID: ukCcLKFrS4SUfyxIr8d3Mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,115,1787036400"; 
   d="scan'208";a="280777909"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2026 09:21:06 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 21 Sep 2026 09:21:06 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 21 Sep 2026 09:21:06 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.42) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 21 Sep 2026 09:21:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OWb6rM7zdEZPzrUCsNr4d6d7DcxV78PuRr5GuD1fbhsaN/dixpZFdTIbvFg56b36K68nZS1HfN4iFSECnDWIhTMthIE8QzRWF7BfwnUlbF4jQyHqTwK206xCkXEhaTMAQV0RT/aJOGqx9R58wVac9ePM5lzlWJz/+nI3xKoGaWmAtJWh9kPbT8qAVleB7rIXn1y8pnkaCLfkrzzFfZE9dPQ9fBv/4lXdqDx3kdC9MH4WVWBt+0t8T1FIefPNFPD7WfJUuJuxGBXA3wix0jUPgUVOShAqU48B3QyZK/cqsihi2Cl1OEmfxw1fLhBHTTCIeqXBQy5D67f1SlzPfs+G2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VqZb1hg4a76Apizcy8NPPRYj4cBViUH9qi1RSGMcrt8=;
 b=a6UhQwYEGVyLTnNRxpFjU2CSsf9PFTGYi7vQBBD/JQiy1f4zfh09lrBOMr0LuHBKVyvey4ynkKfM+LW3NL3Y9X/x6LgWclJGr9gsNrM8fbA2mV7Y1zloeWoA+FV4iMJXd+zH5KWMzagQYfXA/Gzj5cbxZVJQr0Jg9jLLLXDxL5ZIXI2CMcWwXnLtV/7HVI6ak/2p1G734FSqsX8wAFUSkNTFLhvWHP5D/fkvZUiplwiowmzdbTNc+poZxFqwPy0xbwO0ElgBclL0iy8URsLGXv0u/VhxQ3jIRs999tu7+ZEWPhJSvMYmoMJuwSWxldxAMD7TyL+FYOI0oZAq/ChiYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com (2603:10b6:a03:48a::9)
 by LVXPR11MB9779.namprd11.prod.outlook.com (2603:10b6:408:386::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 16:21:03 +0000
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::3454:2577:75f2:60a6]) by SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::3454:2577:75f2:60a6%4]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 16:21:03 +0000
From: "Luck, Tony" <tony.luck@intel.com>
To: "Chen, Yu C" <yu.c.chen@intel.com>, "Chatre, Reinette"
	<reinette.chatre@intel.com>
CC: Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>, Dave
 Hansen <dave.hansen@linux.intel.com>, Peter Newman <peternewman@google.com>,
	"x86@kernel.org" <x86@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Dave Martin <Dave.Martin@arm.com>, Ben Horgan
	<ben.horgan@arm.com>, James Morse <james.morse@arm.com>, Babu Moger
	<babu.moger@amd.com>, Drew Fustini <fustini@kernel.org>, Fenghua Yu
	<fenghuay@nvidia.com>, "chen.yu@linux.dev" <chen.yu@linux.dev>
Subject: RE: [RFC v2] arm,x86,fs/resctrl: Generic schema description Proof of
 Concept
Thread-Topic: [RFC v2] arm,x86,fs/resctrl: Generic schema description Proof of
 Concept
Thread-Index: AQHdI9HenMNwdsLN1kygWHexrPiqfbaWkbOAgADnkICAABkPAIAADNKAgDYAiQCAB57HAIADib+AgAC4WLA=
Date: Mon, 21 Sep 2026 16:21:03 +0000
Message-ID: <SJ1PR11MB60837BD005CCDE4554393B9AFC842@SJ1PR11MB6083.namprd11.prod.outlook.com>
References: <d258a32f-12d5-464d-abe9-4720fb3e44b3@intel.com>
 <9e38f138-7872-445d-9a11-105f9d0fa4d0@intel.com>
 <07a79f5f-ad39-447d-b43d-01e44c7870a2@intel.com>
 <e859ba7a-d488-4c35-b0e2-fc88cdb34f29@intel.com>
 <ef14b978-1b58-446f-b07a-691422220cb8@intel.com>
 <aqdguFLXpds-FrEW@chenyu-dev>
 <da618b0e-aced-42b1-8497-61ba4b0bb973@intel.com>
 <1511a82d-4c1a-42ad-9b2e-7def751d2824@intel.com>
In-Reply-To: <1511a82d-4c1a-42ad-9b2e-7def751d2824@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6083:EE_|LVXPR11MB9779:EE_
x-ms-office365-filtering-correlation-id: c9ed736a-c51a-496a-a58c-08df17fc54df
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|23010399003|366016|1800799024|22082099003|18002099003|38070700021|11063799006|56012099006|4143699003|10067099003;
x-microsoft-antispam-message-info: sVBKX9+3fFgLHpg9/XLFNVFljdj3gOCh/YpxfcUcWZy+xaA7ItcjxZ2/rC3KrcDiAxR0EVKY2LZb/edwYxAFh0witx5eQEXvrcsX/GgwRwDt+8XXoVlEaLMwYVJRoExXt36fIwg42Ya/4iId55iIotkiMO/cnHBayQDaqpVHb0tVgbMye9WgxhHIs1taet0SOs8cB8yP8DgDjy15tZEltycGTnqAPIzXqLTp+cxWLf66/V7oWBJLu0lSfubMJhXfxmcNeG3Slhmpxq7DJGIkyYDVBU3gUWt+TEoeDqaFBOjQ/bEsEHRcZ/t50dCqKzKmHLyfqS9e//P9cCU0NJyT7PvltbrHubgWVVQHR57/Q3eEoyavVhsRdlXjv5Jq6Vr39No02JI+a/xPls0cWr6niBw0xXJmxlX+SxadH8LAk8csNJ8jO1mjEHOusq1RE/XAHHdA37IES4ZLJ50FPXBWMvLgr+7SQtY/yTQ3t4o9QlXMFKmypTfnGjMOhIsmyf8cpkCYXi78Eq/XSJFZksD10UTDaE/3llpGUfQVzIsyAb+U6S64N4Z1qQ84RcykSUtW6r4eg9Lbs89kfm6Z8z0TyHzL+/YYEGOg1dElhMXs74NeY/b0EBUMPM7vmwCqhnPHjPXyrxQqCQIRKNZ5cHvoAz9PQmoxDCt+aKXqtovfn3j1XZLvQ94o616MQC3ZE8CHmDzyfcuO17a3z/Ou6hl2ROBo0fKp1v1LtX2f7tSL9s0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6083.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(366016)(1800799024)(22082099003)(18002099003)(38070700021)(11063799006)(56012099006)(4143699003)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OEpVNUlWQnowMHFnVFBwVm40QWd2Vkg0RDZRV0JqSnU5ZUxhV0JISUx4dVdK?=
 =?utf-8?B?aG5DUFJVVXNLZzVQOHlXYXFaSWhTUW4zV2RhdHd0SHAyY0VuRjRTeUJVWjRE?=
 =?utf-8?B?WERhR3gwQVg5dTN6YjRsYjNZVmpMb1FPakxEWklDdEVJdDRweUl4dWxUNzVM?=
 =?utf-8?B?VUJFMFhGd2QyUVJZMEU2UnF2TlZ4cmY5YjZDQ2V1QTg2L0tNbzNBWEFkTWpN?=
 =?utf-8?B?YUVlYmV5MEdtTlQyUUdnRU1DUW9qRHRBOHhQcnFTYnZMY1F4YmQwWFRGMUZ5?=
 =?utf-8?B?c0JJOHVjSzJGbWVmRjRkMVhpd2pOS29FbGVzbFp4ZXFaNTFCSkx0eUNMb2lv?=
 =?utf-8?B?aTJHMENtNjVjOEpiVmNwcnB4cW5YSEdYVXBHK1BCeGVncXhoMFZYK29SQUp1?=
 =?utf-8?B?OGxkTmZHdjdYWVFlSmdNMXU4UDZoampvUHBFL2UwNTgzUS9HYUR1MElqdmFJ?=
 =?utf-8?B?RnVvandTd2QxeE5XQStIT1QxY3RkSVdGWTVpRkl2eU9hSUlqdUZOYytzTmFq?=
 =?utf-8?B?bGd2R0JsTFRLNUpEalhzMEtuTU43UmdBeU81WmNKSmowRit2M3IzcU1Yd1Ax?=
 =?utf-8?B?cDJwa2pZRTJ5YjBBSW1YdUZDeTl0K25RWEMrNDN4UDFhRjlFTEN6SlpNd3Fq?=
 =?utf-8?B?MnZVVzB1NUlZcjY2VUw0eEYzUmI4MVF2VEwzditBa04yOFpQUm5Ha21qZWlP?=
 =?utf-8?B?MkhLV3VaNXhkU2Q5enBLY3MzYmRpNjZuc1lwWGtBSmhMdW5ub0VJZFV1N1ph?=
 =?utf-8?B?Q2N4SFZWK2F1WWNPQmZiV3VHVm5rYnpUbHc2c3gxNHVaNDJldWFpWWNtMGVi?=
 =?utf-8?B?aGh0aTVuYm1tUmZwRzJhQmFuSmExT05OL3lRYVc3NzJkM1JKYm1aVU1PenZO?=
 =?utf-8?B?YnpGQ3J1WG5lWEVOS1JBcVVyODJFMHJlcUN0ZjNMWXRFSVlaRldNZjhwYW0y?=
 =?utf-8?B?K1NpdzBNK3phSzFJcEJlS2YvQ0kxWVVscWZ4RGwrdHhiOXNud0JqeTZ1UWRP?=
 =?utf-8?B?V1p1dkdiWldYQ3VZRVIzcERLK0FJRzdzaUhVQ25SNGRuMEV1dUdRbWdWbUJm?=
 =?utf-8?B?V1dpUm10MzV1elZsdnVwK2kyU1pidDVPM3AvaFg3akJNR3VVdml2eWIzUld5?=
 =?utf-8?B?OXhPZkg2ZWhZMXJ0bG9STGNFS1MzbGtyS1FiYitQZzZRVXp6R1ZIa1JNeG5U?=
 =?utf-8?B?bk4xYVRIUTNVMm1wWDN1UDhnZjNKVkdGdXdTcG5EMm1HNE96V0xCb0ZUam9T?=
 =?utf-8?B?NnF1NmlEN0dWMU0zdldpbkNrbnFzWDV5elZOaWI3bzYwSEgrT3BkQklpRkxu?=
 =?utf-8?B?c3BRYmZ0RVAwbVRsUUo0aDEzeUorKzdXOHhCQXBTc3dsYjZYWHpUOHY2STdz?=
 =?utf-8?B?aEZsVHVBTFp6VjFVRTAyUkVEVEtTWk9BS0M2WmRsWnJKMm5hRDlqbUhyYWtB?=
 =?utf-8?B?dFNPTDFDQTRuNVNaSFhiRkI3eEVtKzlvVDU5T1B5SE1SbXV4WC9jcnQyYUpv?=
 =?utf-8?B?TWl4VjFzMnVuaUc1eVl0Vk03NlhzRzRwTkZwYmpORVVybTg0bWtJT05MWXFO?=
 =?utf-8?B?bHFHWjdPQWhkQ0FuRWczbEltNUdhQ1RiTEtuaE9YQ2dsZHNxY2MwSFhvUW5p?=
 =?utf-8?B?OW1hOTRqZW9qdWgzd25MbGc0TTUwYzFxNFBJR2ZVazNBQkpLbHlwaUZoZW02?=
 =?utf-8?B?T3Ixem1yTkQvVkdUQTYxb2hsWmRISE94Si9ITmtFQUVoc2NZWHZJR1h3ajgz?=
 =?utf-8?B?bmhYa0hYRVdCOG5td0tpcUF5QzFDamZRWWo4UDZ1NlhmZnhmVElaeFMvUkVp?=
 =?utf-8?B?cXZ4TmRLaTZQK1drMGJ3UTdxQUdBU01uWWY4K0Y1NUNIUUJuVUNUaGd1aDZJ?=
 =?utf-8?B?RkJlb2RyV0dudGFiZGhiVUo4Y1hHbzJHQWd0K2traWRTVFZHdWdpN1MrSXFy?=
 =?utf-8?B?SGRuekw4cUJESExMdVB5bHZpdHRQSDJ6dkJ5WjF4L2xvSHNKMW55N0Zxd21R?=
 =?utf-8?B?ZHR3SmcrOVAwV3FiNEg1N2MxL0VWVkpLVDBMTUFsR2ZTOHNvVUpUNlhURzY4?=
 =?utf-8?B?RzM5ditqZStGa1BOR3N2VTFnYWhiQkNNNG5CRHF4Uy84T1VFQis0WXE3dTAr?=
 =?utf-8?B?QWtJeEJkanVSMWtkdjYvZ2NUa0xCMGpiUUg0dkpiLzcwekVHTkw5Wm85aHNI?=
 =?utf-8?B?UzRkb20xWWl3bXZpWUFsby9JdmJnSkxVeWxhWmEyYm5JMGlPOUNjcUhpU0py?=
 =?utf-8?B?K1dZOE5seWlXQWhUaWhaUWhTRU51OXVzNWRDdEZ0WUN5L21IaGNPSHhJOTVH?=
 =?utf-8?Q?pmXslNBweTN5+Flmyc?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: whiHb+y/Xsgzq9EuFwJ5gUvto/h9bNqVG3j+VJB369Wxv8kDOkIqhHRpIXQ4O/z7RP7g2lVD5qe6ZwDpU7O7K0/zaucLP2kagDJVLbRxpZgpy6TwZ43ME5+XYjMKU9uyO1ltfvhHb7/pQPVoN6/9IWuUREoxyisj2h2EPtNf907kSLJg+UV5qTaxdVPl1+cEKYOQ/fNCauxcVrQbWsBbqGaY99XQRFYFzFFcX6T72S1HJknwpHycqd3KRlV4Rw7qiin23bXtxOcxx8PCoHB7HQm2yaSrLkQiNkYO7fZJZl1ndtNB17aA2NqRuKhVYOqh3HIm7OofXG+oVlYWQxzmaQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6083.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9ed736a-c51a-496a-a58c-08df17fc54df
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Sep 2026 16:21:03.2703
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SeJGT4T1mUpl7xB0+PAW5ZaLTa+1KGTEKQ+2pVnffPh7A17VWCpfACNj9j9kC9EOEeso28McDrrn80A9G6KvTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVXPR11MB9779
X-OriginatorOrg: intel.com

PiBJdCBzZWVtcyB0aGF0IHRha2luZyB0aGUgd2Vha2VzdCBsaW5rIChtaW5pbXVtKSBhY3Jvc3Mg
YWxsIHNvdXJjZXMgaXMgYSBwZXJ2YXNpdmUNCj4gY29udmVudGlvbiBpbiByZXNjdHJsLCB3aGlj
aCBjYW4gYmUgdXNlZCB0byBhdm9pZCBvdXQtb2YtYm91bmRzIA0KPiBDTE9TL1JNSUQgYWNjZXNz
Lg0KPiBJZiBhIGZ1dHVyZSBwbGF0Zm9ybSBkb2VzIG5vdCBzdXBwb3J0IHRoZSBDUFVJRC9NU1Ig
aW50ZXJmYWNlcywgd2UgY2FuIG9ubHkgcmVseSBvbg0KPiB0aGUgQUNQSSB0YWJsZSB0byBnZXQg
dGhlIG1heCBSTUlEL0NMT1NJRC4NCg0KVGhlIENQVUlEIGVudW1lcmF0aW9uIHdpbGwgYWx3YXlz
IGRlZmluZSB0aGUgbWF4aW11bSB2YWx1ZXMgdGhhdCBjYW4gYmUgd3JpdHRlbg0KdG8gdGhlIElB
MzJfUFFSX0FTU09DLntDTE9TLFJNSUR9IGZpZWxkcyByZWdhcmRsZXNzIG9mIHdoZXRoZXIgTVNS
IGludGVyZmFjZXMNCmFyZSBwcm92aWRlZC4gVGhlcmUgc2hvdWxkWzFdIGJlIGEgI0dQIGZhdWx0
IGlmIHRoZSBPUyBhdHRlbXB0cyB0byB3cml0ZSBhIGxhcmdlciB2YWx1ZQ0KdG8gZWl0aGVyIGZp
ZWxkLg0KDQpJZiBhbiBBQ1BJIHRhYmxlIChvciBWU0VDIGVudW1lcmF0aW9uKSBzdXBwbGllcyBz
b21lIGxhcmdlciB2YWx1ZXMgdGhleSBzaG91bGQgYmUNCm92ZXItcmlkZGVuIGJ5IGxpbWl0cyBm
cm9tIENQVUlELg0KDQotVG9ueQ0KDQpbMV0gSSd2ZSBhIHZhZ3VlIHJlY29sbGVjdGlvbiB0aGF0
IHNvbWUgZWFybHkgUkRUIHN1cHBvcnRpbmcgWGVvbiBkaWRuJ3QgI0dQIGZvciBvdXQNCm9mIHJh
bmdlIFJNSUQgLi4uIGJ1dCB0aGF0IG1pZ2h0IGhhdmUgb25seSBiZWVuIG9uIGEgcHJlLXByb2R1
Y3Rpb24gc3RlcHBpbmcuDQo=
