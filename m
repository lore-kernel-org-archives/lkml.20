Received: from SLXP216CU001.outbound.protection.outlook.com (mail-koreacentralazon11021075.outbound.protection.outlook.com [40.107.42.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3432A42AFAA;
	Thu,  8 Oct 2026 07:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791444945; cv=fail; b=a7EZ5Lv7oM2hWOhPr/bcLfzQ9DCPrJ1X5F3MVi8sUlTUsVjUljp1hbOAI2g61Nq1GEP6FW8Xq1zlXH2L3IlXd7Tv68k8c2Y5FfphVsYUOXTCN3kI2EtOojJVcHGZXa8KSq+/Hn4Zt/9em32Y/WeH16RinEWNUqKikQXLbKmrVLk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791444945; c=relaxed/simple;
	bh=1U2mwJITINFQBIaGtJu4It3JQ9D+JisHy07LuSE/UIs=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=TaU11mEWrf5E5TLxJMvF+8dkBYisqJ549aBLl/S7fNS982zdwXWDgvJWQTizhhKiAP90cxzto+9tZntUg22+r/3gseVj01qGdF73aWm1hnlHNiWcLjlzZsrnp5ZTsnDQnIqKBYIM0XV6D0BLL5oLIhTzDmwWs+X9MrSr6/liSTE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (2048-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=wbKoedYu; arc=fail smtp.client-ip=40.107.42.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="wbKoedYu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=keO4vuLvMY/2WbwKZk4a0nFO0+HyF0KImx8hNeBRBcVxlDroh6vt0hNv48pXCJClWidZ0U0yUuDCoJUZqUObWbMvXplhdwFih1WAD5lJoKo+ea1f6wzISjYom5IByT7pXs3xTYIZ56WbxNfim6QXeO7U5iMWY99RnF4StD/lxnTK85b3vefArM6ZBBo0JHaIKqFAjeBJhBcHKbsmYB5mHqyv7Od7RkMS0TD+M4m7gYMYfIFj9G+3Yx8Gjum2bON/UODnriH7txvCGlRMzkvwq61YDxbnrdi6u2UqU8e/zvzuqFD8gGSx+2WAl0Znm0CA7oH4oh4zS5cID5JrCJFNPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qX3vvMN9vGzr0ttoBrGF3hOof0BLctrqisk+c73Yl9k=;
 b=WvmI2yG9O9qUi2AC0iz3UAVyL3SsbuENeB/eSsAg79XeHgB+fETO9kro15otcdCPm3UPAsErfhCwAAHmBbtc4REuVZp9AVqWOZ8yy6G5w1whvgiEZYHnrnIxJJ3GYZpw80DYrTrOmeixAucpFW4apjsJQH9pzd+YXEa/VP9c6ByWbtklPuuLR97FBrYbmG85le8QYbcXbua/eVOPlEFMyo9BIxX49FYngyA3Y6gkS7fJQpcpdDFjX2sd484aLuUclBwxk73Y27MDYDEwa0uDiWs8zpwyi5ouCNkb6QoYhyJ1qWrwX/tnIzZznEGkdwGuMftPItzuozt90c4yMriPwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qX3vvMN9vGzr0ttoBrGF3hOof0BLctrqisk+c73Yl9k=;
 b=wbKoedYuN/ZIQcDbFk7GxdaFFy+xN2qpLUQivlg/gOAw+h4RvJ2onN3Fu1BuuuRXhB4+5Vonxir0+UkBVaDxMqssYAmSKc/oJGFx7C0ReKmTOaGfa1dZzZcKxbUdjMqipsf6EmzgrD8Z05/Fg8eE/FNy9Ah0oLzsUCdW7OKhPGyKrwE8D5dQsMYKJKFFC8LHTD8MbQKozKnxnFAUcHMfKqyTtQYwayEZrutKMVmwnqd6V3s+yzCwWozj2dCJfM6K94UvgHqB8Bi7S1eT1A4GUVzM9prgPuVT+3GCu8iZA6X50tlNorMP5N3hi3kQ91R45/pvnB2OLVsBdbxjQcDniA==
Received: from SLXP216MB1148.KORP216.PROD.OUTLOOK.COM (2603:1096:101:f::14) by
 PU4P216MB1339.KORP216.PROD.OUTLOOK.COM (2603:1096:301:a9::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.17; Thu, 8 Oct 2026 07:35:34 +0000
Received: from SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 ([fe80::8f6c:834c:6cef:7be]) by SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 ([fe80::8f6c:834c:6cef:7be%5]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 07:35:34 +0000
From: "jackson.lee" <jackson.lee@chipsnmedia.com>
To: Jiale Yao <yaojiale02@163.com>, Nas Chung <nas.chung@chipsnmedia.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>, Nicolas Dufresne
	<nicolas.dufresne@collabora.com>, Sebastian Fricke
	<sebastian.fricke@collabora.com>, Hans Verkuil <hverkuil@kernel.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 3/4] media: wave5: handle runtime resume failure when
 closing
Thread-Topic: [PATCH 3/4] media: wave5: handle runtime resume failure when
 closing
Thread-Index: AQHdUw5074PJVMt81kKgs5XYOoRF4bbzSDYw
Date: Thu, 8 Oct 2026 07:35:33 +0000
Message-ID:
 <SLXP216MB1148E3261E481EA73B09046DED932@SLXP216MB1148.KORP216.PROD.OUTLOOK.COM>
References: <20261003080853.430099-1-yaojiale02@163.com>
 <20261003080853.430099-4-yaojiale02@163.com>
In-Reply-To: <20261003080853.430099-4-yaojiale02@163.com>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SLXP216MB1148:EE_|PU4P216MB1339:EE_
x-ms-office365-filtering-correlation-id: 98b3f57e-cbf3-4eba-e5b8-08df250ebcf3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|38070700021|56012099006|4143699003|10067099003|18002099003|22082099003|6133799003|3023799007;
x-microsoft-antispam-message-info:
 KYgiIWszJQ8Zpr4Edm4QqCOW3ACp8sfLNqf0pIUSrEaY0C7yZ52iHjh+e+84KtKaOHu89fKOPFjbwu1y8De5Pco6LPpB3j9zRnUwwYNZZAswyQYHA50AE+dXASpPt532Ibydd+RpD/adEVkPqemiFMTVv2KLzP3axPVpNmPyqG+iyGmKI4rS8gUJJCCPT8dRbBGhqaY/w60lMMbJyr+Lc6oWpedtRYseP0VHjSnK7w5QyAdHWdxWTflyvC6cdI+H0hhTAAiyRTjLT6G9h9v0DobbZILn0vgAy9QPXJwDihr2SFIlqUxAV862SCRslAzFHqHDUukb24wnZ84xCQ2+rLjYQhw/YdG/XgxXF7udr/XsIQ39Ux3PrRL3K/umDsdN60F/A73/snX0ILzYQxNFvZY101nqdKR/Bhp6kNb10OaPU/DfGFnzeUNgBtdJDMWeL0ZNbIQRm6xBzurE/7MsCM0oazjKu193tHAntcY4IZ1f6Av9kCv3a/sn7xl7R0ftCzeVxsPK0gpGPhcp2r0o9CSejAIi8P8swU7G281qMpoffZoWa+5A8oDnDFuajJa2IxTTUEl4vfwhK90A2YW+/wCP6W0tQ7dQRWiCRezZRMaNFBuhZvNw8SN0ruV5bZCsOKslaSOA+KRx2j6C8nwhqLGUVdumiFgzy3AW1cBirXx7eVlV90oQ1+KZsE3MzXxYrGgV29iXlUo0ylv/SGaGUXXaw4zdwNBmXbzrESJw5tw=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SLXP216MB1148.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(38070700021)(56012099006)(4143699003)(10067099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?VqKFao3nDd9Lg6MLpaFtdgzhtWyRbvSNzwd42tb0lchnBdUzRqeKaDXq0rCj?=
 =?us-ascii?Q?0WNTvdAyjg9Qhzg4IB43tPwfd0EH2aK65ks5GrTaDWpQ/A8sByAW3xmRbMGL?=
 =?us-ascii?Q?0XvZeNPM1EZovcfoVpdmeRuI0Dczk+3dcsZbEcZuNTebrTlJFbHalzepxz14?=
 =?us-ascii?Q?HMiXi+c2wGfUTqkrnxuLLjjSA2yXyjtFweD5s1b14EBVAg5vdInFixqxzbqT?=
 =?us-ascii?Q?QTLv4Z5+tOMsYRxdqfBuH04XIHXMVaCYWdiurse7WXO+bF38/Jl+KrfShuCA?=
 =?us-ascii?Q?oaODVsL6jqkW6vnliER8GRsbRS8ONkIW0eLXWGuW+cQ7nekBmPdARFIwOi/g?=
 =?us-ascii?Q?VmniwyquLqvWp95T+066F8iXWSM9RNplBdgPuZe/K6frOtplFKs5G3BobbVe?=
 =?us-ascii?Q?SsTPy2Pn2QhWsSrRm5OmiS6QgbB64IS+6aOlpTDpjVGvLaeQF+g4jRMdqPMM?=
 =?us-ascii?Q?Eq6j8GMtsjQgTdU7RvQ1I7p9bh0F95jenJrYEv0iCNcs4AuJkc82/ibBCM57?=
 =?us-ascii?Q?uiM+AHeSSUUtKtZiu8bCTgip1d9cfJ6GW8ikwe8+AA/jhpajGRT02QJ+UhSu?=
 =?us-ascii?Q?XYSD9sqhDcq35QTiv16YAblMqDT8eMkJGMHf4S5c4B4sX+P3w8EU9WgN4FAQ?=
 =?us-ascii?Q?WcXae1thKWnlFnGChM+6UK9khvzyRKTqQeexGkNaxPMrOVCWdxhWcRftgEih?=
 =?us-ascii?Q?Pic3UTU5JW/HMmDJpGqZ0Zp7l/IOOGzqeXP0Nq8A7bx1FyZ3+kAUnfNgjSX9?=
 =?us-ascii?Q?3bZxpjPtKaa7KrHKqzKNDUkHpBGFSIjg4Ew6PIuEuJR6ji3JUyzicJJKl1+r?=
 =?us-ascii?Q?zVLQhUU1K9vo5tdUO/sCelMTd8KhQTyQ4UGznaNzLyHt4GAwrPCCM6MThtGZ?=
 =?us-ascii?Q?2ZDkmHrPwfJtFvWzFy+RyKqp+oQT2NezKlEFeOWno+/Q9pldwApjunqEY2rk?=
 =?us-ascii?Q?9h00pf+yXmDZ/shU+nRlRXQoH8HnD2RTGnLWQNNSIWYl/tlwKZX3uL/oWtnn?=
 =?us-ascii?Q?srzJJOYHcczTVHpZ1ODhcmXw5kcR+/xhUifKrQWAp7t/iyLaE49UspEt7i/1?=
 =?us-ascii?Q?wp4j+2tLbKUDnw8JTKsVRZsThdw0epoNQNE5UagX/QnHKtwKusYn9RNWCCFY?=
 =?us-ascii?Q?/PFGxcEdNY/YYOLqChJfFntCI8ywIeXwrKKpwZwTYgYn5geeCXBuQB/g+vUo?=
 =?us-ascii?Q?Ir4Zh+KyC2pS8/l98Td0K0+MZ8UNb+m6QJ3WGTcxwv8v+uuJorFUMfZ//xYK?=
 =?us-ascii?Q?mjKBBMu+DUyadD//SLHLWd6DgLfIWNx5fteMWbXCoj3RwHDthOAMhT1A5nzW?=
 =?us-ascii?Q?46ZyxPi2YjdNqGjXPCRml9kcsHPfWXOawbWSWg4HJzBigy1DmLSxsfXjKkqI?=
 =?us-ascii?Q?OkgIcZ8+q3FCXZbEslyyVuiSZBPgjzMrukZNVyCw6mikCswRbyV0CwdWnyhu?=
 =?us-ascii?Q?9YZYEuwgrixcczWEo0jLOI2wASGSAN6PR34p+ELgEfA7MdSeCGz+r4SHTY0K?=
 =?us-ascii?Q?m3v9tptsOajX0o6w0TKOhxie5xoqPu3mHMyFqIfi4TJEtqqA3cbV5jjD3Zj+?=
 =?us-ascii?Q?Gv45gnmVjWAPO7XjzUekGyohIsAEEfaAhNsWhwuNrjBiWkhOB6GbTWWARhrf?=
 =?us-ascii?Q?/J1YBfu8BZzkoacY8FlYexxvW4dvrn7Ii7et/Cs1XyEld9Ami+uhi10LdgWO?=
 =?us-ascii?Q?hIWcpJPSuH509u56Zb/S5DqRDPtZcYm4y5+2VZ3+WVm9CMZLLbq1qnSmQzXq?=
 =?us-ascii?Q?zm+6ISz6Ig=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 98b3f57e-cbf3-4eba-e5b8-08df250ebcf3
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2026 07:35:33.9571
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R5Vs0t3bDTJ1mdwkDQpHQo5ZmM7oKtBYOIc7hqWkaYmhrIwXAYgszHPLIlnoXHHeWM8AxC52vhK7rqA/PhMNIdE04Rea05YZQqLV3ALvi2s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU4P216MB1339

Hi Jiale

> -----Original Message-----
> From: Jiale Yao <yaojiale02@163.com>
> Sent: Saturday, October 3, 2026 5:09 PM
> To: Nas Chung <nas.chung@chipsnmedia.com>; jackson.lee
> <jackson.lee@chipsnmedia.com>; Mauro Carvalho Chehab <mchehab@kernel.org>=
;
> Nicolas Dufresne <nicolas.dufresne@collabora.com>; Sebastian Fricke
> <sebastian.fricke@collabora.com>; Hans Verkuil <hverkuil@kernel.org>;
> linux-media@vger.kernel.org; linux-kernel@vger.kernel.org
> Cc: Jiale Yao <yaojiale02@163.com>
> Subject: [PATCH 3/4] media: wave5: handle runtime resume failure when
> closing
>=20
> The decoder and encoder close paths ignore runtime resume failures and
> proceed to firmware commands. If enabling the VPU clocks failed, those
> commands access unavailable registers, and the paths later drop a runtime
> PM reference that was not acquired.
>=20
> Return the resume error before taking the hardware lock or issuing
> firmware commands.
>=20
> Fixes: 2092b3833487 ("media: chips-media: wave5: Support runtime
> suspend/resume")
> Signed-off-by: Jiale Yao <yaojiale02@163.com>
> ---
>  drivers/media/platform/chips-media/wave5/wave5-vpuapi.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
> b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
> index f77abd5e122a..42bc737c6980 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
> +++ b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
> @@ -220,7 +220,9 @@ int wave5_vpu_dec_close(struct vpu_instance *inst, u3=
2
> *fail_res)
>  	if (!inst->codec_info)
>  		return -EINVAL;
>=20
> -	pm_runtime_resume_and_get(inst->dev->dev);
> +	ret =3D pm_runtime_resume_and_get(inst->dev->dev);
> +	if (ret < 0)
> +		return ret;


Skipping finish_seq when the device cannot be resumed is right, but
returning here leaks the instance. wave5_vpu_release_device() returns
early for any error other than -EIO, without calling
wave5_cleanup_instance(). By then the m2m context has already been
released and the instance removed from the device list, and the VFS
ignores the return value of ->release(). So inst, codec_info, the ida
id, the kfifo, the control handler, the fh and the bitstream buffer
all leak, together with vb_work, vb_task and the auxiliary buffers
that the close functions free.

When the runtime resume callback fails, rpm_resume() stores the error
in dev->power.runtime_error, and every later pm_runtime_resume_and_get()
returns -EINVAL until the PM status is reset. So after the first
failure, every later close leaks the same way.

On a resume failure, could the close functions skip only the firmware
part (the finish_seq loop and the hw_lock), still free the host-side
memory they own, and return -EIO so that release_device() goes on to
wave5_cleanup_instance()? The same applies to wave5_vpu_enc_close().

Thanks
Jackson

>=20
>  	ret_mutex =3D mutex_lock_interruptible(&vpu_dev->hw_lock);
>  	if (ret_mutex) {
> @@ -750,7 +752,9 @@ int wave5_vpu_enc_close(struct vpu_instance *inst, u3=
2
> *fail_res)
>  	if (!inst->codec_info)
>  		return -EINVAL;
>=20
> -	pm_runtime_resume_and_get(inst->dev->dev);
> +	ret =3D pm_runtime_resume_and_get(inst->dev->dev);
> +	if (ret < 0)
> +		return ret;


>=20
>  	ret =3D mutex_lock_interruptible(&vpu_dev->hw_lock);
>  	if (ret) {
> --
> 2.34.1

