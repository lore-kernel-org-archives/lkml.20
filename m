Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.34
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793344503;
	b=X7fkAIlEHo12CztmbyB1MqG8d3SKqvgQy7/Yd5Xo3yqDUSpayWwwXAIx86IWroXcCcVL
	 Z+i1MzbAZeXHKE2KWxt8n+YAVjqWUrQmcd6zDAAbI26j7VjC37RY08eCa0J21Fsjm9XDm
	 gv82r66kSmH8C9We+z9jgSq1yQqJBhYWuX20w4rRA8NzZHcA7XZzvmPsAjpWZNcS03nTZ
	 zUp37ciVsb+9gLBnvfn1UO4Pc3VH33H8nT1mtF2WCIYFNtk50PMi8L4zc8248Hp4q2h4i
	 eGNIiFmk4jEq41AE1PF9l1UAGxroC1BzT+ZzuuUp8TmPrvzKJvZJu7TsgVIsuTlrarQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793344503;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:Content-Transfer-Encoding:Content-Type:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
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
	bh=fLJ9rR+Jp/5hiT7ofEWr4evs8VkonwcXYPc5Nj0qHCE=;
	b=VaG9YUEW0YwEvDDrrL5m+6Sq+dk5VJ/Vp2qBeu/3xX8ZQdnkKLC4a5H0PgG5puopIdmF
	 YSqg8DaamVgGlU8Ba3kQKc+chNHQm06/riYXjBrDeE4NszdW1Hka/Q580TFxCYisINnZ6
	 aqsiIFUGvs6ZI5rJss672w4tWp9V6dGecP5ejS82XLmREzY3gvYJBoIWkfC/XO9jWb+WR
	 93DmbqMYb35Ofjmrmf4cE57r+t6/Dbu5dh1I4N+n3jPhJ+xhcHtdS4WHDKd8ZSMBOX7wa
	 evSXwHzGqnqKjqESXyA5F3psN3IUFTP4ek43jVo0EZP8iJv562MEmsn3XwMSLPVTjmg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=OEhShsEZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.34
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010034.outbound.protection.outlook.com [52.101.84.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 819BD606A31C;
	Fri, 30 Oct 2026 07:15:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 819BD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=OEhShsEZ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XS0+ZETRwd5mAkZDYtTUlWKMAtm6zTGJgs1jP3TBejg69oFnggmDkEqHSgmatvlR4OyuWR+5TnVvnSHR6Z9N+TOCBCB7BJebOVUgG4fCna4c0mKy5oFA0OjoSwI34PdMPQ2bBwch4ED9JecygEk/85Ex/8WmI1D52LUIeWqh3bPKglsNenpmtCzP6sVqNSLuiqSBQ1TUDnKgIU4D5lO3wBPVvip++Jo3Egot4WolNlPK8jLiHvFDuPdTGPqe+JI+Y0LRvCBriNJPiTo6z1d4HxYhyj+OFnOTPX/gR8uFngK5p4gooRonUAVJYGfKZiPubhYlfqwT/SIjdSSTJ4tSuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fLJ9rR+Jp/5hiT7ofEWr4evs8VkonwcXYPc5Nj0qHCE=;
 b=ndCxxunKtu/Fw7adxEpGIS/8Hzu72xyNoy4aR4CxY1a/9ZItCwSJeK+UtKPjmTHo2OpMb1jmHMUG29nt1hvb9YqTc50/71DhEJn5Ya8bzN1UNsZf3I4Zj9hEQhh2WXWq8FjT9ZgyhdfNuYU+JTKAtd+GhESCbNhiiORpi9VVZxFl4/pe+kHVnZM+/SCLVeIQV1UymHHr9wlW5ny0ZtO4ZCLEWNMdUTTy3Z6Lx9Oz2Hhah72lgnRM9IXOvNStBIfLG7Nrkq8qOjXlSvJpVaA5ipaM0lJM7fhNXHk1pNozGCKzmFbMbUwfmACGeQkacoucRPuLflA71xG0qPyo39a9GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fLJ9rR+Jp/5hiT7ofEWr4evs8VkonwcXYPc5Nj0qHCE=;
 b=OEhShsEZfD9b02btuUPq9wdW2vJIiZjuaa6VePadC/yVr+Fo2Qg5zPHZcaITj3G2IhIWAOpIl7JoTjqpTja8accoPlmeuXPJXBiuW47+bA5kHL5oGZPeX5AJBOojaeUbsZ6NSM4TpxXdoEtIcZ9UF59ru4u4DZ1gW7Rmf6FmSOjfc9ms8X6ayKficnWlGzDKt4DWjE6BLKoqD0AG0tgGO6EWJv7ZnXVTHJFHkDyDRLc4txEFcPXg3vLQjONP3KCzxiSsolfDQigkqPCvk9jqYeWsL+/2ZF3MmZyy1czKkuc6m1Brza3kJaJ2+7zvR7Kjlnnjd8Y3NVNKUKv/dLQlaQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com (2603:10a6:102:2b4::21)
 by GV1PR04MB10822.eurprd04.prod.outlook.com (2603:10a6:150:205::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Fri, 30 Oct
 2026 07:14:57 +0000
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d]) by PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d%3]) with mapi id 15.21.0569.009; Fri, 30 Oct 2026
 07:14:56 +0000
From: Xu Yang <xu.yang_2@oss.nxp.com>
To: peter.chen@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	jun.li@nxp.com,
	guptarud@gmail.com,
	regressions@leemhuis.info
Subject: [PATCH v2] usb: chipidea: otg: fix fsm deadlock and B-device gadget registration
Date: Fri, 30 Oct 2026 15:19:21 +0800
Message-Id: <20261030071921.276377-1-xu.yang_2@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0017.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::10) To PAXPR04MB9422.eurprd04.prod.outlook.com
 (2603:10a6:102:2b4::21)
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB9422:EE_|GV1PR04MB10822:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d42530a-c2e2-4f5e-0c3a-08df36558067
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|19092799006|5023799004|56012099006|11063799006|261009223027099003|261022105027099003|261022075727099003|261028144727099003|261021121427099003|261026140227099003|261026121527099003|261021123027099003|10067099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	DxbNO4K6MNp2WZwIi4OX+1Yzuvxkhs4pDvFKlaNusos6bfcbjmCHBcaz7LRZ8YAa2okYeiiBhfjiBC7hpUEiwPDPrvbczKNLpXfwNIdRNy+l3uh3pGqn2ftnQVtJa9XQ2yimYhtBblX4efic7NOvZN0P+c5e8KcaYrYoEYIJkfymdZQfeCbhtMHSFyoP3/qzyfh+NA9JP/V5gDRm4aWFNpUt2j0maXNgaJxOhuUmhzRDo1SteRI09lc9UnhXCRQkMMGrpbYh7OXgIMLokT0SSlWNa3t2QAdVfGEfalqKxckbzyDuMXUcD32ZHa9K7J0z1jc9BpUUcWppdfZ+QrvghpFHNoLldFhm2QaurNfOIjLk8k7vtOZciRKHguZmtNDWvjXknLFDaL19IiWingMBVYlZNDePrjfTfyyHfFnd7QYMK/xILQpOffVHeKCRGEkKWXKaAtw+izJhFjwcALEBjgwjwCqND6bJ+i1eL8dekAM5Q4Xy89STyfyikDbLJCWDuDYjHcHYHOK7xZSf27Dq1Vn/1h91yYwVz5F5T2pmysXj1sb6ccJP8Djjw5mvAx/wgBql3Nw4acsR+/dICxqjTV9mmSaAQ5V/ecJtGXT+/S2oX1p7HGBwosUTugRouQYE
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9422.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(19092799006)(5023799004)(56012099006)(11063799006)(261009223027099003)(261022105027099003)(261022075727099003)(261028144727099003)(261021121427099003)(261026140227099003)(261026121527099003)(261021123027099003)(10067099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?shSn7Zz67jOz7L9pg3r3Kq4LfzL2lGtuifPEhkfKOSM1fDUlFCiIkJWnDMWq?=
 =?us-ascii?Q?hI+C5swHmXsvXXvJFpRsHQewtu2w4gKDgsJk5tQ1+/uDkT2pmKcUE+NDRukw?=
 =?us-ascii?Q?p9/OyDYCGg5P9Mgf+tP1QqSAs+t9uc4c7mZussxZNVxcWiWSDeBN63gCheZ8?=
 =?us-ascii?Q?dU3kxOUFFEzo+MKRb4itmtCUorWgvEY9lcEvVHhym7+VAWy1M2gVNn0WbPx0?=
 =?us-ascii?Q?V3fevO3iNRYK4Q9W+JslhQz2Vsl1Qa9nFqoBuQ9RYI/FDza2pl/XKIwLY9De?=
 =?us-ascii?Q?ljSP4xq8CMPT9sGznYoUYdqY+teasNDHgrQdkUQWyQltYYRj1JYE5WDKcZVW?=
 =?us-ascii?Q?UxLJklLvcwNzpIiK9e7mDx3iGKxH/ACOb8vovFMqZ6KBwZVcXKrzO2i/b7El?=
 =?us-ascii?Q?aXZbGVvbNns7zVOVXRjbW+MfPBj7siBjevCDGg3ceVM/IQvHyUew2UhElTlk?=
 =?us-ascii?Q?T37cYrYsMrRagvibPPos1EYLHYRxca12LLl7BaxMwgKPIsvckioMyH9V4pCM?=
 =?us-ascii?Q?By8TwqzZ3R+7Ha6oKh0XU5hFVdWFgva0WCmUiIFgRuH6GJEO6e/6LXMH+uIG?=
 =?us-ascii?Q?lbSZD5ogkF7tCL4Gke2JNHb4981zuQtY4D9UnXpt9GB0yiZcxLtNZV8GyTR7?=
 =?us-ascii?Q?Xm9i+hqaECoOg9dnOp3KNW+3tbITOzxmJMuVDqpzG1c9nG0mwjlpZI2z+EXm?=
 =?us-ascii?Q?zCaLAdJ82tC4gc19k6e8mx21h2JibjyahjOAjg1xfRV4wnTfkUpy2pPCej5v?=
 =?us-ascii?Q?L7c/kkWyocn2vwF7SYMPqayg8FNzKP14bbAhJZJUJq8qUDMBsR5Fv6Iu06yL?=
 =?us-ascii?Q?p1U64vq8r6edWU4DyklwifL3PDOHHlOATHiSiXun8N6dGFQ33t15+AFIFQLz?=
 =?us-ascii?Q?h/JFsM23FRtN7G+i8dZs4OnevYbhjUuKeeXSA7m1kUMq8DzOdXqWhE0lluHE?=
 =?us-ascii?Q?3V/cvOOkYoUYQwTu1pYOlzZakJuybgYSjz9jxyPm3Mw916FH9XQwdENSuJul?=
 =?us-ascii?Q?SyEASkK794H6HxIT5Y5l5Y3Fj2lrtpC2beHPxhlfKLem8uYNeimDqYMv1JPK?=
 =?us-ascii?Q?iuB29u8zabp150wJvMQ8OKfZ2cgNQ6Sbp7ziiVoxTHAn97WUfk6g1bxdpwXw?=
 =?us-ascii?Q?q8hYre3vkkwmg/6xTKjRAbDTdb1fr65R1XKVQ1eOD2IEVCQ9YTqk789yVvm6?=
 =?us-ascii?Q?g/Bpyh+RQDAubl0bfAw+a44kTlUSTMEVWJwBtiaBCmQdc2HNzjXNnOPdfHHe?=
 =?us-ascii?Q?soQr69CDtZRhWFxkTjsLMBNaY4QWdefQUGHkeU3FS4o5pE0FaF9VZoMXPLe6?=
 =?us-ascii?Q?FByuKgGDjzovNDMb4wl6U/ND4qhpOvuf9w+94D6OyVwFg+GacM/ZXHRRrltu?=
 =?us-ascii?Q?bsDQZuksKB8rbnlHAohsvxYVXIiObZnTJyKQOeQXthDMT0EAs3CxDvLelBZn?=
 =?us-ascii?Q?ZPjm/20iQZGYDTiTMoPWKxAe1f2qChVTHYFR6hvvoPGr2M5qUU5/z4ovz2Wp?=
 =?us-ascii?Q?mv9uANKNxth3XnwF8VOYYs1MydjVjGiUXdzsAjk+7Ca1LLMYgdvf8j8duaB5?=
 =?us-ascii?Q?Q9Ce9FAMkIvdrKUHRsRzdk5jPidtOTCpD3Jr9FITPba7tQqRNMMWMVsQsPoR?=
 =?us-ascii?Q?wlA4OlsIBGwHNJRsq7XYPkHoMjnGdt0IYzl71fUBJPfnN9vD+OOC4rudhx/k?=
 =?us-ascii?Q?4v3gOJQajmH316bPYPYWz1hYmehIABxo50wnu44aVaIVGpdBz8Ubhhu6YxYz?=
 =?us-ascii?Q?52i3CaPIGjiPArjfoL+5f7TM6PVDP72Sl8HaT5BKpErTlyY6XAmZ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d42530a-c2e2-4f5e-0c3a-08df36558067
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9422.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 07:14:56.7365
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RYRn/0042e5f/s63HZ/jtIH04vWzgfhqVM7VLdMhA6p3QZQ9EE3tYcXKtFljcncDICJZ6b/TNFpowl5yIfzAFkIkmeti8Hb8XkrwqLuY5M5TGgp6eqr5a22DsHrKhWm/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10822

From: Xu Yang <xu.yang_2@nxp.com>

Commit dd0c03d68522 ("usb: chipidea: udc: support dynamic gadget
add/remove") introduced two regressions on the OTG FSM path:

1. Self-deadlock on gadget->host role switch.

   otg_statemachine() holds fsm.lock while calling otg_set_state()
   -> otg_set_protocol() -> ci_otg_start_host(fsm, 1), which calls
   ci_role_stop() to tear down the gadget role. Since rdrv->stop is
   now udc_stop() (previously the lightweight udc_id_switch_for_host()),
   this reaches:

     ci_role_stop(ci)
       -> udc_stop(ci)
         -> usb_del_gadget_udc()
           -> gadget_unbind_driver()
             -> usb_gadget_udc_stop_locked()
               -> ci_udc_stop()
                 -> ci_udc_stop_for_otg_fsm()
                   -> mutex_lock(&ci->fsm.lock)  <- deadlock

   The same thread that already holds fsm.lock tries to acquire it
   again. Use mutex_trylock() in ci_udc_stop_for_otg_fsm() instead:
   when the lock is held by this thread, otg_statemachine() is
   already driving the exact same transition and will leave the FSM
   state consistent on its own (otg_set_protocol()/otg_set_state()
   overwrite whatever ci_udc_stop_for_otg_fsm() would set), so it is
   safe to skip the redundant correction rather than deadlock on it.

2. B-device gadget UDC never registered in FSM mode.

   Before dd0c03d68522, ci_hdrc_gadget_init() unconditionally called
   udc_start(), which registers the gadget via usb_add_gadget_udc().
   That commit moved udc_start()/udc_stop() to rdrv->start/stop and
   removed the call from ci_hdrc_gadget_init(), relying on
   ci_role_start() to invoke rdrv->start when a role becomes active.

   However, ci_hdrc_otg_fsm_init() does not go through
   ci_role_start() for the B-device (id=1) case, so the gadget is
   never registered in FSM mode, and no gadget driver can ever bind
   to start the state machine. Call ci_role_start(ci, CI_ROLE_GADGET)
   there to register the gadget, same as the non-FSM mode path does.

Reported-by: Rudraksha Gupta <guptarud@gmail.com>
Closes: https://lore.kernel.org/linux-usb/8e659c4f-723b-4241-9c2b-8ea42c6c3600@gmail.com
Tested-by: Rudraksha Gupta <guptarud@gmail.com>
Fixes: dd0c03d68522 ("usb: chipidea: udc: support dynamic gadget add/remove")
Assisted-by: Claude:claude-sonnet-5
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - do sysfs_remove_group() if starting role fail reported by sashiko
 - add Reported-by and Tested-by tag
---
 drivers/usb/chipidea/otg_fsm.c | 6 ++++++
 drivers/usb/chipidea/udc.c     | 3 ++-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/chipidea/otg_fsm.c b/drivers/usb/chipidea/otg_fsm.c
index 642729893cc2..6d6baea69b68 100644
--- a/drivers/usb/chipidea/otg_fsm.c
+++ b/drivers/usb/chipidea/otg_fsm.c
@@ -840,6 +840,12 @@ int ci_hdrc_otg_fsm_init(struct ci_hdrc *ci)
 			hw_read_otgsc(ci, OTGSC_BSV) ? 1 : 0;
 		/* Enable BSV irq */
 		hw_write_otgsc(ci, OTGSC_BSVIE, OTGSC_BSVIE);
+
+		retval = ci_role_start(ci, CI_ROLE_GADGET);
+		if (retval < 0) {
+			sysfs_remove_group(&ci->dev->kobj, &inputs_attr_group);
+			return retval;
+		}
 	}
 
 	return 0;
diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
index c29b2d0dcc7c..1e0d295f5431 100644
--- a/drivers/usb/chipidea/udc.c
+++ b/drivers/usb/chipidea/udc.c
@@ -2167,7 +2167,8 @@ static void ci_udc_stop_for_otg_fsm(struct ci_hdrc *ci)
 	if (!ci_otg_is_fsm_mode(ci))
 		return;
 
-	mutex_lock(&ci->fsm.lock);
+	if (!mutex_trylock(&ci->fsm.lock))
+		return;
 	if (ci->fsm.otg->state == OTG_STATE_A_PERIPHERAL) {
 		ci->fsm.a_bidl_adis_tmout = 1;
 		ci_hdrc_otg_fsm_start(ci);
-- 
2.34.1

