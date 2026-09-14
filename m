Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012041.outbound.protection.outlook.com [52.101.66.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 030A847604A;
	Mon, 14 Sep 2026 14:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789395082; cv=fail; b=W65vTbL+cv5UJivHAdtxJu3LibrWZ5u3ZG0eqsfgJQnSrpvk16IsCqVJlpbU2kafxapyUXX3LEOXdxnpuWRaPYs2Q4o3cKysXa01Ef1abuH5jsRfIEGgqkge/t6VetG6N45//SlMBARBoL2YkF/w196vwcXkPf4tgHRlh3Vq8JA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789395082; c=relaxed/simple;
	bh=/m8oXPbNvhlQFtkGuaFz3sjPlTmT8rQp3A2k1x0A2Xw=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=cNsXUnT44fW4sBMiFEqix750M13GyBO7S9e0clB60fmZc6IPr0ExsH8nHBUnapkPRGaIyHr3vdlfWiCHlo52yl6opXS0nLRL6ixdHkOz1/BJykmcrP70OYVQWlTmJ90R1uGa3W1ErIKFNiQrFMmp0sh0NL8ZsKa4XNsak8f7ufE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=TIjo1r+q; arc=fail smtp.client-ip=52.101.66.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="TIjo1r+q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w3DLDbtnpQyti0OI+L74AznHgk0tr/4jZ0wgaMJLkHkmq4UDSms2GqUk7nDWQLaQtmfASTOcAvnf9p7/LQTDyPD8Tt5ugKmLHfa0YfhBL3OAR5KuHjw0WWqV2dMNlIBrG7TcquHu85F4nahdK1aimvjqdWRRsAgLR5n8EAAEQ57cHuRGb5f/mbEEU7INjr2XlYPvSw4L5QO8+uBhrKR2MhryqbBbK0hZh4YPLgdxe/mmDEjx2XO9BPE60wnsCWYA39KEJl3rYashhLDrqz94itT214E970ycXoqO9d1b1J2eeCRQxgAWdvjDpoEQ/925PSE3T7wlICKe0WhYKs7QTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=er8mkpSGysTU2AnOCiPtxLRaraSl7B9NqJnF92yeKFk=;
 b=EAIoMs+ge5upmRbYdZo2ZZmKkPvAkCwVOEYijr6Mtwg/7TosmaL/sxhm7fXjXV9Kw/jLBjT9H2PhT/y/FpOIjvmTQFhjv0LHjJUVhGgVlPCCeEyXmoUh8qxm6er0HtoZzo9FmEEGB2f9tQuMBOt+XgzZfOt8lxl7E0w3FiVFpxBb/6k+4L6a29U1l5LERqxTfCx87GXy4T8eIAsF0cgaIGgHECYEQopwbOSFAYmGbwecEeJ6v/spVs6YT3TXC2riZVzPhFaJm0bfXk59xkInKDqtB8V42EfNd4RipZwkXKn+kaWaxYF8x5kXx8wKinK7m9rLHUZLhz6PYqoGAPz6qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=er8mkpSGysTU2AnOCiPtxLRaraSl7B9NqJnF92yeKFk=;
 b=TIjo1r+qJK6jWvD6aC97MUZdAytxwa5+HKllCYbMjFO9ScebLR3qagTBOxW6Y/vT5TUaAHVQjA/s+JMZeZoXxELPp+H8Yv4wmLqiJi6z0YFnrQBl07J+oHJk6UJ4EaZpRj9YhgGNJFzV0lSiMIzPPCuMsG3tz+1ocWA+c7nzB6qx8RgHVFasuDbAMvFcLhb892BOaYYGafVCy02fdyB7m6t2T42Qnyzp2rsThl7n8QZYPUPQIjnxicbJa0oB7C+ooDP1eupVNJU3YQqmU5PQgnevdko/cd3tQZRG38HksBqQbT4XBV2I/PyMeHJI10X3q4ulJhK0b38M5ETbvysVhg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by AM9PR04MB8618.eurprd04.prod.outlook.com (2603:10a6:20b:439::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 14:10:50 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%3]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 14:10:50 +0000
From: pankaj.gupta@oss.nxp.com
Date: Tue, 15 Sep 2026 01:09:58 +0530
Subject: [PATCH v51 1/7] Documentation/firmware: add imx/se to
 other_interfaces
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-imx-se-if-v51-1-4a7dac612cb5@nxp.com>
References: <20260915-imx-se-if-v51-0-4a7dac612cb5@nxp.com>
In-Reply-To: <20260915-imx-se-if-v51-0-4a7dac612cb5@nxp.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Pankaj Gupta <pankaj.gupta@nxp.com>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789414820; l=14442;
 i=pankaj.gupta@nxp.com; s=20260817; h=from:subject:message-id;
 bh=GR+UpWiKN6vQ/fD+2am73nCHpHQoukDXxfoTE0YlRxg=;
 b=T/J2/kS033vqXs4cWFl5EFsimgLGDTN3747YurkgfGirQgfN2G+uTC6VrQpo8eBpJ9r9uSnIZ
 gYusd0bCDgCA4fNyaAJBM6fuy3TpoloOzXrtMUzh8fooggIe4asCojm
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=g4ZgzIWbpXnSxRsoH+l6PWLP78a+Mzpl8e6RQe74d5Y=
X-ClientProxiedBy: MA5PR01CA0199.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b2::11) To AM9PR04MB8469.eurprd04.prod.outlook.com
 (2603:10a6:20b:414::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|AM9PR04MB8618:EE_
X-MS-Office365-Filtering-Correlation-Id: ac81a8d2-a10a-4b0c-76d8-08df1269fabf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|1800799024|366016|19092799006|921020|11063799006|56012099006|10067099003|22082099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	lyJoENZ09ETWcOlaVgs4HT87lYz0We6au8txglcHLQDWidUvYxU5HbCC08RCzJEDEdEtJbme/c/UHQqRLusN1un4r190tMrnPXJqyZD3Vg0hNMN939c5WGEkW3zY8RhlQieIdcyAYXHghzhaaKK85JMG0i5mI80MJtslM9OqSa7CxEKUGBhTqEQ7j5ONC1h2L7iXvpP8OLVDZVnzHcRwuCk6IjPqbKGNXtcIAbhq6DJ8jJLhs1ZWXG+h4UtRG8Cep1ak0CpDTggpkG6pJBQo9C8PJPqeQpCUuY44PMv2k66YVgBzc1oiP/MNBjS3gE2MaT7lFpTCzncSiliBydBhf2kEcKMPdQRv2avQLKJ3zV+o8KaX3CwG+kKhFmSof6tZlrOWyf1yYl6L56aVPEL/sgntWWV0NgZgVQEwgiljnW2ZvQzcXNSb3ERMQJ4wsw5QFE8n696rHqTWvNZsrEoIOmMyDv/jFAeTLfqR/dMAox8No5lTrAb2C/N8hyvN6zabk4QNfzLzd+EMEcWY70SIwR5Nfzqu5+G4OadFtHc0py8UrAcgzOFStQXMNIzeR6vadzV2Z0kuY5V0xqnn7KIXSZgWKxYR3RmWbwestl3jK3D+ajmwVCz/Kj3rIl+uJreSgv1Pd7Ch7sbr7LFoMJ9sBLP+B9EBaCWXtCPPGF/J3VyybjkWVOshz/+j0STqC3SLdrgqy2BynrgLUqAOeb5A4A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(1800799024)(366016)(19092799006)(921020)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QlFCb2VvUFRKbFc3VTVFWXRJRkJVdFhtbXJDenhYTkdMODhvOXRaNU5VUXU0?=
 =?utf-8?B?V0o1d3AzQTRZcHJsbHJvQ2NVUFh1RzhtaU9OVUw0Q2ZFRVd4alZqOGVuMU9p?=
 =?utf-8?B?cWY5c1U1Y2Vlcng0ZXdFWUNjVkxlaVc2RENINHJYM01jY3JPbnBrTkNrdVBK?=
 =?utf-8?B?QU5VSWVCQmFxTWQvdHo2YVVodWE5U3pvelZQUmlIMXdodHZqWXd0RURHN2F4?=
 =?utf-8?B?YVBxZ1FZUjNjbkp3c0p3QXJLZkhSNVEyNTYvMVRyYzRZZ0FvbTBxdC9UR2xO?=
 =?utf-8?B?djhyZ29YNkNldUZweWlKM0llTkNEbjJKV0Z1YWpHNFJBWW1mV1ExQjRkS0JU?=
 =?utf-8?B?ZHQrZzE0Qy9FcGgzMFFNeWUxUU5XdEFBWDZQSEZRVTFHeVdDSGhPR2dyMFdB?=
 =?utf-8?B?VDJyc05yc0hGYkZadmNDZ1d5SzluaVFQZjlDY0VuZ25uR0xLejRrcGo2QmZy?=
 =?utf-8?B?bERFQ0RwM2o2QUx1WDdjdndDcy9QNnBDN0VKbUUvOXBma1RkT1R4QWVvdnV6?=
 =?utf-8?B?cjhlUERodkxPeGFTYThmbDNBU3pPcXU1WlZYVFlEYjNKcXdaVC90aEM4RzBZ?=
 =?utf-8?B?Tzl1Mktmai8vdnJWb3gvK1c5OE9MdVpHNis0NUdhOEcwVFNXVDhVcjFMejlZ?=
 =?utf-8?B?aGFERW1uZHhBaE5ISUE1ME53VWJOZVNGSVhZQU9DQndlSm1IZ3ltZkZMakt6?=
 =?utf-8?B?OWVZNWUyclc0K2U3VnJubkZNTmdiQjN6WGFqNSs5WVkvVTRMcWpMV1FPKzJ5?=
 =?utf-8?B?VWx5QlYyTk9QNXNFODlaYnlWVm14Z0RjUHZteGpkZTNPd2kvUXhxOG9XL2la?=
 =?utf-8?B?V1pqU0t2ZThyemlOdVhycEdBZWh1TVFDR0N0emY4aFdRZXA4a1FDU0xHV0tK?=
 =?utf-8?B?ZlVCb0xtb2tCem1oUzgvYU4vU3RPRkF6MjZuK3BDZTZxZ2V1RGlHQ2dXRitV?=
 =?utf-8?B?REY4bTlrOGMvSUlOMzdpZTBXQzlMWm1YTmJaYzBMQ1JBUU5GWXB4cVNaaWJD?=
 =?utf-8?B?ZHY0ZmFKdnkrSlJMdi92ald6alFEYmdCWUEyUXVtT1BaT0JyK09qL01kM0dp?=
 =?utf-8?B?T09ZMy9mUjJzZTFLbHBxZFA2bE1rbFVUZEJ4ZzBZMzRCODFTS2pGWFQxb1Qw?=
 =?utf-8?B?SUs4N0xTcnpGNVpPY0tMVVFTS1B6UXI2ZmJZNjFVUGxWaEhsb3E0cklYbXFE?=
 =?utf-8?B?cUl6bUMxTmx5OGV3anlhcGRrZStnaHZMUFZsNkVNb0RySVhqbitnQ2JHRDk1?=
 =?utf-8?B?UklERjhHSFVPcFlnazI4Nkp6UUo2MHJBaVlWa2FNOEkvTGdoUjRkejdYVk1w?=
 =?utf-8?B?bXErRmhyMDlRZWdNQjN5aUVHc0lhb3BpVlhNYlV1YW1RUkp6bGQ5em5scytK?=
 =?utf-8?B?cTNQVVUrVFFZZmNIYkhRb1VjRnNlOExqemp3VVRJQnVZN05INzVZZ0M3V2JS?=
 =?utf-8?B?WHgyMmdqQitSbzNiVzFhYkYyM3RNUTlhVE4xZE1CTFZOeTJ3NjR6NWJqdWI1?=
 =?utf-8?B?RG4vZmd4ZU1IZnVEaDZJby9Geitrb1Y1QnpGVWcwWTZYdENMTmpsU0k2VVVz?=
 =?utf-8?B?V2FwbjRIc1podmNTcDJRYWFZNEZtUFpJcDgwb1Q3amd2c2F2cHp5M0w1d3pH?=
 =?utf-8?B?NG1yNWZFRjl3cnlCZ3pDV3Y2RmVZNzdMRE9BQXJjdkFXNUZreDBFbHp4dVVF?=
 =?utf-8?B?Q1llS05zRzc4MXRDaFJVdGtCN2F5ODhKM0pjbmtRUFl5Z3RrazdhNmMvRStR?=
 =?utf-8?B?cGxuY1hNMUcxTXJqNVE0dXNKMXZXeCtISjJzVVFTcmV1YmVhQVY3ejNDTmJt?=
 =?utf-8?B?TmN6YXVWemdPRGdBTDFHN1RMdUpQNmt3K0UrclFsS0NhRzlFQzhnekRNakJo?=
 =?utf-8?B?VCtESUlTK000bmtLeTQrbS90M2RhMEFNVkNka3A3NDMyYkRPWEZ3TUhUYWw4?=
 =?utf-8?B?NDQydXd1V0hjbzBBVUFsbTN4UkpCY1VLR201ZmloNy80ZW9ZTVRsQU8vNDhS?=
 =?utf-8?B?NkxhQUNlVmtTQXl3QVlzNjM2dFlpRlo4a296eHdiVkZSOGp1cGRDWWhBSDhL?=
 =?utf-8?B?WXA3RVg5WUJFR01BWUt5aWJPcFZVWTJwR3FwRHNXY3JzS2dlTnp6N2R2MWU2?=
 =?utf-8?B?SnZlemtCSlhEN3VUZUhwYVFjak1DWEp3MlpYYU8rcjlvWUhoN1Q5VE1IQlVm?=
 =?utf-8?B?NDQxOENMajM4WEV5MDFraE91d3RMdHVtTDZEMWMvTEJyaGVBbU83SmppYXdk?=
 =?utf-8?B?NmY0QS9ucjdMWXhtMTJwRk1zb2FMNzhMK1VUK0lYRzg3QWlidlVVYkIxN3hp?=
 =?utf-8?B?RlFUcDFsVWorVkdkcUZvMkpqWTVkRkZJWWlCSy9WU080MkdZRW13NTJPVUFi?=
 =?utf-8?Q?SJmUZKO1+QGbms5SOnR1Nw1xwr+LB9iKKtEJb?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac81a8d2-a10a-4b0c-76d8-08df1269fabf
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8469.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 14:10:49.9471
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NiYdbPR6l6KU1x7Hrt3jzErHj3WZTAlfw9Ceck5KmoYJC0JURekOzpTaQLPY9X9/GxHmbR7YaOrbBgyo544VszmBIPrmxtOXj1q1PqrkWOA/uLjubYG57m1/obggNqnl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8618

From: Pankaj Gupta <pankaj.gupta@nxp.com>

Documents i.MX SoC's Service layer and C_DEV driver for selected SoC(s)
that contains the NXP hardware IP(s) for Secure Enclaves(se) like:
- NXP EdgeLock Enclave on i.MX93 & i.MX8ULP

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
----
Changes from v46 to v47:

- ELE_STORAGE_OPEN_REQ concurrency and command-receiver exclusivity:
  Explains the three-layer protection used to serialise concurrent
  ELE_STORAGE_OPEN_REQ ioctls: (1) an advisory early check under
  modify_lock capturing both receiver_exists and is_cmd_receiver in a
  single critical section; (2) se_if_cmd_lock serialising the full
  send+receive cycle; (3) set_dev_ctx_as_command_receiver() re-checking
  under modify_lock after the response arrives. An ASCII sequence diagram
  shows how a racing second caller is rejected by firmware before any
  storage handle is allocated.

- Signal handling after a completed hardware operation:
  Explains what happens when a signal arrives after firmware has already
  executed a command and written its response into the MU receive buffer.
  The driver validates the response, calls fw_api_specific_ops() with
  is_cmd_interrupted=true (which closes the firmware-allocated handle via
  se_close_session()/se_close_storage() and clears the kernel-side
  handle), then returns -EINTR instead of -ERESTARTSYS. Returning -EINTR
  prevents the VFS from transparently restarting the ioctl with
  already-zeroed input buffers and lets userspace enter its signal handler
  to decide whether to reissue the command. An ASCII sequence diagram
  illustrates the timing.
---
 .../driver-api/firmware/other_interfaces.rst       | 238 +++++++++++++++++++++
 1 file changed, 238 insertions(+)

diff --git a/Documentation/driver-api/firmware/other_interfaces.rst b/Documentation/driver-api/firmware/other_interfaces.rst
index 06ac89adaafb..984ee3ecc8dc 100644
--- a/Documentation/driver-api/firmware/other_interfaces.rst
+++ b/Documentation/driver-api/firmware/other_interfaces.rst
@@ -49,3 +49,241 @@ of the requests on to a secure monitor (EL3).
 
 .. kernel-doc:: drivers/firmware/stratix10-svc.c
    :export:
+
+NXP Secure Enclave Firmware Interface
+--------------------------------------
+
+Introduction
+~~~~~~~~~~~~
+NXP i.MX hardware IPs such as EdgeLock Enclave (ELE) and V2X create an
+embedded secure enclave within the SoC boundary to enable features like:
+
+- Hardware Security Module (HSM)
+- Security Hardware Extension (SHE)
+- Vehicular to Anything (V2X)
+
+Each of the above features is enabled through a dedicated NXP hardware IP
+on the SoC. A single SoC may contain more than one such hardware IP, that
+is, more than one secure enclave can coexist.
+
+NXP SoCs with such secure enclave (SE) IPs are:
+i.MX93, i.MX8ULP
+
+To communicate with one or more coexisting SEs on the SoC, there are
+dedicated messaging units (MU) per SE. Each coexisting SE can have one or
+more exclusive MUs dedicated to itself. No MU is shared between two SEs.
+MU communication is realized using the mailbox driver. Each secure enclave
+can serve multiple clients by virtue of these exclusive MUs, and can
+distinguish transactions from different clients based on the MU used and
+the core security state. The communication between clients and secure
+enclaves uses a command/response mechanism. Each client can expose a
+specific set of secure enclave features to higher layers, based on the
+commands it supports. For example, a secure enclave can simultaneously
+serve an OP-TEE TA and a Linux middleware client. Each client exposes a
+specific set of secure enclave features based on its supported command set.
+
+NXP Secure Enclave (SE) Interface
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+MUs are not shared between SEs. For an SoC like i.MX95, which has multiple
+SEs such as HSM, V2X-HSM, and V2X-SHE, all SEs and their ``se-if``
+interfaces dedicated to a particular SE are enumerated and provisioned
+using the single compatible node ``fsl,imx95-se``.
+
+Each ``se-if`` comprises two layers:
+
+- (C_DEV Layer) User-space software-access interface.
+- (Service Layer) OS-level software-access interface.
+
+::
+
+   +--------------------------------------------+
+   |            Character Device(C_DEV)         |
+   |                                            |
+   |   +---------+ +---------+     +---------+  |
+   |   | misc #1 | | misc #2 | ... | misc #n |  |
+   |   |  dev    | |  dev    |     | dev     |  |
+   |   +---------+ +---------+     +---------+  |
+   |        +-------------------------+         |
+   |        |   Misc. Dev Sync Logic  |         |
+   |        +-------------------------+         |
+   |                                            |
+   +--------------------------------------------+
+
+::
+
+   +--------------------------------------------+
+   |               Service Layer                |
+   |                                            |
+   |      +-----------------------------+       |
+   |      | Message Serialization Logic |       |
+   |      +-----------------------------+       |
+   |          +---------------+                 |
+   |          |  imx-mailbox  |                 |
+   |          |   mailbox.c   |                 |
+   |          +---------------+                 |
+   |                                            |
+   +--------------------------------------------+
+
+- service layer:
+  This layer ensures the communication protocol defined for interaction
+  with firmware.
+
+  The firmware communication protocol provides two guarantees:
+
+  - Serializing the messages to be sent over an MU.
+  - Firmware can handle one command message at a time.
+
+- c_dev:
+  This layer offers character device contexts, created as
+  ``/dev/<se>_mux_chx``. Using multiple device contexts multiplexed over
+  a single MU, userspace applications can use file operations (fops) such
+  as ``write`` and ``read`` to send a command message and read back the
+  response to/from firmware. These fops use the service layer API to
+  communicate with firmware.
+
+  Misc-device (``/dev/<se>_mux_chn``) synchronization protocol::
+
+                                Non-Secure               +   Secure
+                                                         |
+                                                         |
+                +-----------+      +-------------+       |
+                | se_ctrl.c +<---->+imx-mailbox.c|       |
+                |           |      |  mailbox.c  +<-->+------+    +------+
+                +-----+-----+      +-------------+    | MU X +<-->+ ELE |
+                      |                               +------+    +------+
+                      +----------------+                 |
+                      |                |                 |
+                      v                v                 |
+                  logical           logical              |
+                  receiver          waiter               |
+                     +                 +                 |
+                     |                 |                 |
+                     |                 |                 |
+                     |            +----+------+          |
+                     |            |           |          |
+                     |            |           |          |
+              device_ctx     device_ctx     device_ctx   |
+                                                         |
+                User 0        User 1       User Y        |
+                +------+      +------+     +------+      |
+                |misc.c|      |misc.c|     |misc.c|      |
+   kernel space +------+      +------+     +------+      |
+                                                         |
+   +---------------------------------------------------- |
+                    |             |           |          |
+   userspace   /dev/ele_muXch0    |           |          |
+                          /dev/ele_muXch1     |          |
+                                        /dev/ele_muXchY  |
+                                                         |
+
+When a user sends a command to the firmware, it registers its
+``device_ctx`` as a waiter of a response from firmware.
+
+The secure enclave firmware manages storage over a Linux filesystem.
+For this, ``c_dev`` provisions a dedicated device context called the
+command-receiver.
+
+
+ELE_STORAGE_OPEN_REQ concurrency and command-receiver exclusivity
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+A userspace-created ``dev_ctx`` becomes the storage subordinate to FW by
+being registered as the command-receiver via
+``set_dev_ctx_as_command_receiver()``. FW sends NVM callback commands to
+this ``dev_ctx`` via that priv's MU, on which the ``dev_ctx`` was created.
+Once a userspace ``dev_ctx`` on one priv is registered as the
+command-receiver, after opening the storage handle with FW, FW enforces a
+global one-storage-instance limit: a concurrent ELE_STORAGE_OPEN_REQ
+arriving over this or any other priv's MU is rejected by FW itself, before
+any storage handle is allocated. The driver uses three layers of
+protection; the sequence below shows how a concurrent race is handled
+safely::
+
+  Userspace A        Kernel (se_ctrl)          FW (ELE)        Userspace B
+      |                    |                      |                  |
+      |--ioctl(SEND_RCV)-->|                      |                  |
+      |            [advisory check under          |                  |
+      |             modify_lock: no receiver]     |                  |
+      |            [acquire se_if_cmd_lock]       |--ioctl(SEND_RCV)->
+      |                    |                      |  [advisory check  |
+      |                    |                      |   passes: TOCTOU] |
+      |                    |                      |  [blocks on       |
+      |                    |                      |   se_if_cmd_lock] |
+      |            ele_msg_send_rcv()             |                  |
+      |                    |--STORAGE_OPEN_REQ--->|                  |
+      |                    |<--STORAGE_OPEN_RSP---|                  |
+      |            fw_api_specific_ops():         |                  |
+      |            set_dev_ctx_as_command_receiver|                  |
+      |            [re-check under modify_lock]   |                  |
+      |            [release se_if_cmd_lock]       |                  |
+      |<--ioctl 0----------|                      |                  |
+      |                    |                      |  [B gets lock]   |
+      |                    |                      |--STORAGE_OPEN_REQ->
+      |                    |                      |  [FW rejects:    |
+      |                    |                      |   one storage    |
+      |                    |                      |   at a time]     |
+      |                    |                      |<--ERROR_RSP------|
+      |                    |  se_val_rsp_hdr_n_status: -EPERM        |
+      |                    |  fw_api_specific_ops not called         |
+      |                    |<--ioctl -EPERM-to B------------------->|
+
+The three protection layers are:
+
+1. Advisory early check (under modify_lock, before send): fast-path
+   rejection if a receiver is already registered. Not the final gate
+   because modify_lock is released before the MU send (TOCTOU window).
+
+2. ``se_if_cmd_lock``: held for the entire send+receive cycle, so only
+   one ioctl command is in flight on a given MU at a time.
+
+3. ``set_dev_ctx_as_command_receiver()`` re-checks under modify_lock
+   after the response arrives. If two callers race past layer 1, FW
+   itself rejects the second ELE_STORAGE_OPEN_REQ before any handle is
+   allocated.
+
+Signal handling after a completed hardware operation
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+A signal may arrive after the firmware has already executed the command
+and delivered its response into the MU receive buffer. The driver detects
+this case and preserves state before returning ``-EINTR``::
+
+  Userspace            Kernel (se_ctrl)          FW (ELE)
+      |                    |                      |
+      |--ioctl(SEND_RCV)-->|                      |
+      |            ele_msg_send_rcv()             |
+      |                    |--CMD_REQ------------>|
+      |  [signal arrives]  |                      | (FW executes,
+      |                    |                      |  allocates handle,
+      |                    |                      |  writes response)
+      |                    |<--CMD_RSP------------|
+      |  wait_for_completion_interruptible()      |
+      |  wakes: signal seen -> -ERESTARTSYS       |
+      |                    |                      |
+      |            [response is in rx_msg:        |
+      |             validate with                 |
+      |             se_val_rsp_hdr_n_status()]    |
+      |            [fw_api_specific_ops()         |
+      |             (is_cmd_interrupted=true):    |
+      |             for SESSION_OPEN: record      |
+      |             handle, close session via     |
+      |             se_close_session(), clear;    |
+      |             for STORAGE_OPEN: record      |
+      |             handle, close storage via     |
+      |             se_close_storage(), return 0] |
+      |            err = -EINTR                   |
+      |            (not -ERESTARTSYS:             |
+      |             prevents VFS auto-restart)    |
+      |<--ioctl -EINTR-----|                      |
+      |                    |                      |
+      | [signal handler runs; userspace decides   |
+      |  whether to re-issue; FW handle tracked   |
+      |  or cleaned up; no firmware resource leak]|
+
+Returning ``-EINTR`` instead of ``-ERESTARTSYS`` is intentional: the VFS
+would transparently restart an ioctl on ``-ERESTARTSYS``, re-running the
+command with already-zeroed shared input buffers. ``-EINTR`` lets userspace
+enter its signal handler and decide whether to reissue the command.
+
+.. kernel-doc:: drivers/firmware/imx/se_ctrl.c
+   :export:

-- 
2.43.0

