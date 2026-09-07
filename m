Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazolkn19011008.outbound.protection.outlook.com [52.103.66.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FC2718DB2A;
	Mon,  7 Sep 2026 08:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.66.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788771530; cv=fail; b=Nfu/ltxcT3taws1NT/cbSEqkyypClcWeuEmvAOazbseZ86id4Z2h9BLYRXQFRUgW7u1d6a4PlqHqA4wRWChiYgSlfi7fsezEMycqUCkQVk0oDq4yhDf+/C3fK7gn1jHhA+w+b4VCXtvBGKVrqOfp0RKm1U6jVIfkzCUXTqTdSmQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788771530; c=relaxed/simple;
	bh=FQcXv3WwSpz9QgZnTfGgUCuSfFwckOgIk2jF4TWQ8iU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=RGUPXy5+rJPpr+7hr9NJlS07z3Uz4CTPALBSMHKDCzMx4+TqnS+LuojyREh4VN+05o7VfGAN8pLeSHRuGia2oCK0b8fXUDVTHGSj++xDnMWsih+mV/R+2zPl0Q1J0RW5+ZfdON3vMLQA+dBgdwFvL1xtg31kBOCyq34De38ZsWY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=rzG6ROJy; arc=fail smtp.client-ip=52.103.66.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="rzG6ROJy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bhsB4ymwLmQDDG594xAP+pnBPrqOQZ21g2+LR0/K0kRc0WyHQWlB7EuzMZUpnmBB6wkjaEa3/Q2RlGTXKuBJsJ/AIomE3KHJu/ON4zTt7hHCKPRQWvOQNMAxtX2nR1Khus+gMbu3V2l4eccnmaCwGm1b0xfcJ6l9eubqENr7hfYoq2nMk80EO7Rlh7DlkXTsPHqF7yI0Z4w5eAqZBqS7AYnHAMku3x9RHb+i4nny9hWcMIihF9zDOqxqxQKLFc8cOYbGpK6K+kn/LI+oCPgPf2mZT5HDXnIOop56p3VsknxRSDjnbwNNfoyIg6PkYw9bGkDjVCBnPIp7sJx7JmuXYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dpDrQwbrpgA1LcJ9xv5lFsq5IJM3oNOwZgvQiQvJr54=;
 b=Ed59RwFj1nsra4ictZMbcg74zh8oxj61HrTPL95Y736L2sPL6qfL8lQKcoXjEYoXib+ABcIPldWL/Y2nt7tyEkgTMfWNvUm+tSFsxzuoTF3xdzMFpnOd+xnfvuHNfJRn6ojd4g1FA9EmeM0ch8NR5eg4LlD0kZGUDHNuTF6f/NuozwtWfhvcn3YAhDKn4WYNLKns5Gs7CXHqjfIMWmrPF+TcmP5RfVUmQnbEznM4ENji4faGgN/N3QWjJ1jVIlYvSlZYIHZTktwj7uSROCk6MpAzREUShGxkPw1q3e42nQai1bDi4iAAqxc7O5UnQEB5AaJb3MDeP//hhiOogcizXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dpDrQwbrpgA1LcJ9xv5lFsq5IJM3oNOwZgvQiQvJr54=;
 b=rzG6ROJyk0O+nGaph8FHK2ACMN/t/mlqINlOq1QgJkAN9fk87O45uHlz03xdnGolLy1aBITfIjscwJwcltDg8IAAiMGAvD4J0qSYCVPt5rBjqSXQSaZz/ME/ein4/4Qj/pzzvjcCVO36nC9t+VoTQ8je1ACZeM7k27hOa6UxNS1Tfshk46CmHnKqYQQjdgc92uBWcBuRVXXoyRMO/1enLAFy5VzaR07GCbRuAqZWUVegse0E4FKysY3IMw6Qa9wBaL7D4ja8jfUAy0/hZ+DdBPXPEIUjKXnpvQO+A10r0q5qkACWqWW5Y+faDYYoesvWzI0OHoqOG+BJF4B8V6kyMg==
Received: from OSZPR01MB9313.jpnprd01.prod.outlook.com (2603:1096:604:1d9::14)
 by OSAPR01MB7277.jpnprd01.prod.outlook.com (2603:1096:604:11c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Mon, 7 Sep
 2026 08:58:42 +0000
Received: from OSZPR01MB9313.jpnprd01.prod.outlook.com
 ([fe80::90bf:9b82:54c3:1542]) by OSZPR01MB9313.jpnprd01.prod.outlook.com
 ([fe80::90bf:9b82:54c3:1542%4]) with mapi id 15.21.0382.014; Mon, 7 Sep 2026
 08:58:42 +0000
From: Keisuke Tsukuda <catnyaaan@outlook.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"syzbot+a83a5a1ba9ff57935171@syzkaller.appspotmail.com"
	<syzbot+a83a5a1ba9ff57935171@syzkaller.appspotmail.com>,
	"syzbot+d31109047baed8f3b590@syzkaller.appspotmail.com"
	<syzbot+d31109047baed8f3b590@syzkaller.appspotmail.com>, Keisuke Tsukuda
	<catnyaaan@outlook.com>
Subject: [PATCH 2/2] usb: gadget: f_mass_storage: ignore class requests while
 inactive
Thread-Topic: [PATCH 2/2] usb: gadget: f_mass_storage: ignore class requests
 while inactive
Thread-Index: AQHdPqcVo82q95tMy0mErm8E/6z4tw==
Date: Mon, 7 Sep 2026 08:58:42 +0000
Message-ID: <20260907085806.52647-3-tkdkei@outlook.jp>
References: <20260907085806.52647-1-tkdkei@outlook.jp>
In-Reply-To: <20260907085806.52647-1-tkdkei@outlook.jp>
Accept-Language: en-US, ja-JP
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSZPR01MB9313:EE_|OSAPR01MB7277:EE_
x-ms-office365-filtering-correlation-id: 5f95650e-7604-45d6-3dd0-08df0cbe37a6
x-microsoft-antispam:
 BCL:0;ARA:14566002|8062599012|8060799015|31061999003|15080799012|12121999013|41001999006|38102599003|24021099003|25031999004|8022599003|19110799012|25010399006|1602099012|10035399007|2607281247196008|3071699003|102099032|3412199025|4302099013|440099028|19061999003|1710799026;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?/OeKpfd+LhwULmV4vaUtZmZPGfYYgQUzHq8uAn6N5TBkrVqmcGoBr3oS9d?=
 =?iso-8859-1?Q?zIV4AHpz8MQlvs4C82LEW2Q+eqf2PRGCCmUCTcMeqH7BO5YYLTuFDv/apQ?=
 =?iso-8859-1?Q?Ogf3YoZ7s7uKbbzSZKZ++zB+/Rh1x7b7Qx9D2CQGvXBvKnhxqT1NFm5GnD?=
 =?iso-8859-1?Q?6P/mNUxiHvINo26OGYeDUuK/fq0hO3NZluugxyFA4aoer8JWlRm+bqfE0U?=
 =?iso-8859-1?Q?JDckVS0RyI90IN2ZG6TjLp5FXxvURGEC2qLNTFvDIjMyPj/b2EV0AKJDFz?=
 =?iso-8859-1?Q?SVrY9q1iONHK19I+YUPg6VDyh6PQRlpnIFgs6ugZS373Az56NmHZcqNWnq?=
 =?iso-8859-1?Q?nZiCZDbzYDfn7+Q3BoSlGIYalHsWQmVsXmebn0v59mCl0y6Ozn3c7TwUA8?=
 =?iso-8859-1?Q?W5x6lbKMs2811oZqUhjvNAflSe1ecRu4UwxwtV4Gw19V0MgzPX8zES1Tac?=
 =?iso-8859-1?Q?riGPlEB7CKHT7PfCnA/SHkVSvqKz2GIO7zg8qkcHUN31ObkAEqg2rsoL81?=
 =?iso-8859-1?Q?1eyzvnlDQOHPVMf+Q5LlC66ZE5H9Ys6tSTrOhD1KuITtT8THEkkLi12oI3?=
 =?iso-8859-1?Q?O+4AmQgVevO4IffEcg3UF2mrI+Dxf4vmBuqbgZNKBlUwx4Y9fZQByVghea?=
 =?iso-8859-1?Q?tFWg8cYXVh2Ga9XcO/MdXToDszQA22WUZmU7DRxHNz6KkCtzaJdU1PZhx3?=
 =?iso-8859-1?Q?NiA181JBNnlEs+g8iBWe1lTe+8Ta1o8WhHuUNODtpn+2lciS41IuMAj72Q?=
 =?iso-8859-1?Q?UXJhYTOoMY3+ZMQj8TmLqQ8kg4LFSmb0GRikFPge7oHNJ4XIZFPZIYU8lF?=
 =?iso-8859-1?Q?Sm+1e/+0+uDGmoZAj8sYALs/v7tAcdIlsNWnirijYeK2fmA1rh2TOy70K5?=
 =?iso-8859-1?Q?cOfNsb2wnMAf0v0/YpXospjiz7R724zQwdiPJkwHokaLeNYTx0lSwEbENA?=
 =?iso-8859-1?Q?ngPjgSX55/HC0at3nTQPm4PXcElQAmmg2/lLJQ0hUiBB8DBMbYQjCJRRCR?=
 =?iso-8859-1?Q?8g2/DlPbxoAEKt+UQXzCOS2k5m8R7tsjD8RgoCPr1ab3WPhk5ocDPfDwCa?=
 =?iso-8859-1?Q?ndVnG/tUsv+RxUcFzLi66CZczXozAJSgqkhaZnFDWImeODiU9AoindQ/xE?=
 =?iso-8859-1?Q?z1FoK5BAq4tEs9NAnHIp+L/RbIYpNbKQkDsAbwFB1YCVXCmG6bAaTCkctS?=
 =?iso-8859-1?Q?Qws2HqrY3FKCDLubef1N3JpqroSYvGxcNX0=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?IpLhWIaQbUYIwK0WwuN4Q8Zz/SzNeTam4oIPUWhtChEqbVl+fS+L/qLEhE?=
 =?iso-8859-1?Q?8uKXsOz40sFofrjHrB79xFYNrSL3pbwgdkh0YKPDmIRQyrtjn7gv/BdEI5?=
 =?iso-8859-1?Q?NA+xHC4izC0VqP3XSJpNLFpUIomEm4zXtb7pCYe4Zx8qtufLoz+xcaOzO9?=
 =?iso-8859-1?Q?Qk6/oWZ7Ngti3/CPqEiRKnAvTtapnhvIcIsylhfIrsNRPZnoW9eUh+Kv5k?=
 =?iso-8859-1?Q?wjLMHjgRDz1SngfnUeqMyjmy5UkX9Hbzj96e8lGjf08xURpupWzfXfP3QO?=
 =?iso-8859-1?Q?nfLtAHQ4UXcsrgMEJhlhh85GPxCDEwIf2jQVxhpeTMjNowXwR744vOLBuB?=
 =?iso-8859-1?Q?d+S2sPfTyrLviuldOc8TBmNtdeVOnt/0nPlssC9fKcYOpGs/oi2PUZCEsF?=
 =?iso-8859-1?Q?XHtq5oTUNOvM9hOXDLG14zmiJS+284zkH7mYZmw3trLAL3IPi140/WIumI?=
 =?iso-8859-1?Q?h6X58VTKyYSwO/gPKmxOW30NAXQLSDXMW7qE2jIiCgIZ/GRMtfA2lc7vHB?=
 =?iso-8859-1?Q?EtbfB/wek9qp1mPjlyfRiBtwPzkEidouwQGsdLmT1SiCKeFMuMWcI7+iKq?=
 =?iso-8859-1?Q?MEOAveJ9e4833ow3TvR7kIAUrYB7WyiUPXgGmQLrr3n6PinVIzeiFMQa48?=
 =?iso-8859-1?Q?zmG+gaRCII5agHFKmlcPosLX4hsOwSKGdIk9pyAZ4L56l4GTc55fur4ORm?=
 =?iso-8859-1?Q?OpJ+bY9JDhn9VvPAq4mPGYTgaztuaTlSbnVLbP2wlrHcPCEY2idaCPlhOI?=
 =?iso-8859-1?Q?slztC3a8GciiZ4eUt5LHmefzQQJ//D9GLygL7OiRrF5vpP7ylG0dryVUWP?=
 =?iso-8859-1?Q?SQ7HfQQmOgyZsWiHAHxPsDnOzn2/n6g2hdU5Ss084+U3VwpGimWqyr68XZ?=
 =?iso-8859-1?Q?OHrS+MINUuYgepqPDi24NyRjNKWWrWJjvtjxhqm+mFBFkWn5y4Z6XQlJJd?=
 =?iso-8859-1?Q?BXMQpMsxLZI72QeBD7TJ9zYVrzzLuvmzx/V4KXU8epCSfV+KVryz30jixQ?=
 =?iso-8859-1?Q?irmm1mV/mab3WWEK8inDkZ3qZxQwjvqnQqC+DaVMN6muXitUieRFLFKcKQ?=
 =?iso-8859-1?Q?IGuvPD00Kj7e/hLUAHq4LBFbqHR1uAy1/ir5F9HvJjxkSPzulqlXeOzW2A?=
 =?iso-8859-1?Q?5EnZHVy9yadaARxHhDuLQYug1JESWRhPoXsEicgDNoRWVHmtVkAQdll2Kc?=
 =?iso-8859-1?Q?kZXQAgIAyGGvain04jBoPFBhL1BbYsOYsSMtEzzRXPf1qYZxSBHegqfqi1?=
 =?iso-8859-1?Q?ituEe1kOHwJXizu1Z3bwBqe2iDwVa+Yc44TuEpLxC8tPtjd1qMs+RGbX4p?=
 =?iso-8859-1?Q?XXEqDMOsewVpVhA+QkpRBa8XJ5ii9U3IRHnaFPK+DvBGN6zlC4q4P4VRX4?=
 =?iso-8859-1?Q?OBXzs3vRupIACUyfV3cyEORj+kZm7eHWIAwnJ4cYeGQlC71KLCDcFVIjhP?=
 =?iso-8859-1?Q?8RBTGo4HMKMzOabh?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSZPR01MB9313.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f95650e-7604-45d6-3dd0-08df0cbe37a6
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2026 08:58:42.6827
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB7277

SET_CONFIGURATION is handled asynchronously by the mass-storage thread.=0A=
A class request can arrive after the composite core selects the function=0A=
but before the thread installs common->fsg, or while the function is being=
=0A=
disabled.=0A=
=0A=
fsg_setup() already rejects this state with -EOPNOTSUPP, but checking it=0A=
through fsg_is_set() also emits a warning. Check the active function=0A=
directly so normal requests during a configuration transition are rejected=
=0A=
without hiding fsg_is_set() warnings from other internal paths.=0A=
=0A=
Fixes: 8876f5e7d3b2 ("USB: gadget: f_mass_storage: added eject callback")=
=0A=
Reported-by: syzbot+d31109047baed8f3b590@syzkaller.appspotmail.com=0A=
Closes: https://syzkaller.appspot.com/bug?extid=3Dd31109047baed8f3b590=0A=
Signed-off-by: Keisuke Tsukuda <tkdkei@outlook.jp>=0A=
---=0A=
 drivers/usb/gadget/function/f_mass_storage.c | 2 +-=0A=
 1 file changed, 1 insertion(+), 1 deletion(-)=0A=
=0A=
diff --git a/drivers/usb/gadget/function/f_mass_storage.c b/drivers/usb/gad=
get/function/f_mass_storage.c=0A=
index a50743c..52d486a 100644=0A=
--- a/drivers/usb/gadget/function/f_mass_storage.c=0A=
+++ b/drivers/usb/gadget/function/f_mass_storage.c=0A=
@@ -463,7 +463,7 @@ static int fsg_setup(struct usb_function *f,=0A=
 	u16			w_value =3D le16_to_cpu(ctrl->wValue);=0A=
 	u16			w_length =3D le16_to_cpu(ctrl->wLength);=0A=
 =0A=
-	if (!fsg_is_set(fsg->common))=0A=
+	if (!fsg->common->fsg)=0A=
 		return -EOPNOTSUPP;=0A=
 =0A=
 	++fsg->common->ep0_req_tag;	/* Record arrival of a new request */=0A=
-- =0A=
2.50.1 (Apple Git-155)=0A=
=0A=
