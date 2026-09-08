Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021094.outbound.protection.outlook.com [40.107.51.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7ED02749DA;
	Tue,  8 Sep 2026 11:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.51.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788867793; cv=fail; b=ErDVG6kI+FzgTaEsR3EDPy1CuS7LpSFxbE5vZEKRNkBIgpa+ketT+7V+fcfMcelawNr4N74rzC6hAi1q6KlhSEuYPPFhoI1PIhJhrpgA2eMnONJIhwjTLsx0DWRlQT7WVXP/sEEwkcfr/w6LkuCgauMF2l6KU77G+9ZGFeu4kKY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788867793; c=relaxed/simple;
	bh=12ghz8MxSkAY5RRKjNNI3sY7o20q/Br2/jTo4VBbcvo=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=YefrJT2IXOj/9+rKFJcSvJSi2IEhj/krgsuUXWYZo2cgqynWZj79q7Nfp1UHv50G7hHYjbG84SdMJc1erjPE/NPrsmEeqmc/V0rL+/aTrv9K4zOZNZhJj6UHguQRxb1J4txnEsZ2nsVzfh6FIqF2N6AD5h4tb6hB3+QdjAOkNyk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=fail (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=bLhlguS5 reason="key not found in DNS"; arc=fail smtp.client-ip=40.107.51.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="bLhlguS5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p/8Ms3kPwkxHicyAqip0TXe2wqmEAeOv89p9WQOT18BDY2Yi4pam3tutfcA3AW/UQFp8xbq3j97jB+loKlQq9bSGj8io9R8Nn3iEC0rnAu3ZjIGG3dDznbI7EulwjMz0PGZ1SQ5fN+wlGOzMznHIoDUCvVltrB+08Y54RFSUNkdtD+iuscgvme2bXEnTDqJl5rzwZskeSQwx5R/iK4HqA5XECjneRWq+pdpUKDBYIUGp9mC7gqOa2zHtbi82QSeg3Zb+qrww5H2w82Zja448UF72ggh9MIFIB+lCRi1FbZwW9VAJhFQJ+6ufFihAODkylPLbDbKbkG3kJM7RJ9fS/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wB56dF9QPr1X9hdvHbkvgKcP4sdl1ivb+A7vRBr+Wes=;
 b=OmQEFhF7cEaR5JhEC8aiYczIO3+zrT19igpD1GBa6c/cpAhrscCiuK9Abr3+j9fcV8a0lxtSbC/j1w7qwhHySTKpBRyqsrPtdorKvvZcsJq+TTZQ/LgoFnAGNmH8h8F06ZDKjdOD33etn5vAj+jXCaqMm1GtVYH8q3iCILDZuPC3VT3/R718QhpSTmLRYV0Uv62vPKY5LUToH1Wyjfp2Ed5nSl/V+YsDvkmkDOqrXWEaKkod78rKDzMGvnrhriKRfefmSfGrIHt2JqWz3yLnZXZywkVhqhA2WDcYsL8cyVethRs19xFzLUS+UQE5vADK4Lo6Ss2+tQhF7vvI+I/eCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wB56dF9QPr1X9hdvHbkvgKcP4sdl1ivb+A7vRBr+Wes=;
 b=bLhlguS5ndA0dx69HCugusD6MQYN5xoaGY6QiYMPB0aymFvBuzteuF/FvLrL3iuBrPetHcwFn2Ro3BByimD/GPMiBMK+23pcc5cCBeK75xNKz2LyuaHN6zoXwgdaJWdmfEeeJvIUkr5WHYK0Ff5vUeS41b6Qu1+otgvInlh+9iOtK2NExk+jp2IGNiChZaAjcsEfveIZMNUuPyaEYkw9cSFiRosJsRmQGuK63JYdb29A5rMjkZKOcvoHsmrcYNTUfbOYuBqvE3lYZnyf1b6JR7mMTiMGLlEzlgYJ/FVhS5TQYEryolTwpRPpx6gr3blZm63bUymOrA/kkfNjQI99Rw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from MA0P287MB2178.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:11e::14)
 by PN2PPFBA0397B73.INDP287.PROD.OUTLOOK.COM (2603:1096:c04:1::147) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.6; Tue, 8 Sep 2026
 11:43:00 +0000
Received: from MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
 ([fe80::f8da:c075:cde1:e167]) by MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
 ([fe80::f8da:c075:cde1:e167%7]) with mapi id 15.21.0382.014; Tue, 8 Sep 2026
 11:43:00 +0000
From: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
To: sakari.ailus@linux.intel.com
Cc: tarang.raval@siliconsignals.io,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Xiaolei Wang <xiaolei.wang@windriver.com>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Kate Hsuan <hpa@redhat.com>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Walter Werner Schneider <contact@schnwalter.eu>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RESEND PATCH v5 0/2] media: i2c: Add os02g10 camera sensor driver
Date: Tue,  8 Sep 2026 17:12:26 +0530
Message-Id: <20260908114235.86568-1-elgin.perumbilly@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN5PR01CA0023.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:25e::10) To MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:11e::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2178:EE_|PN2PPFBA0397B73:EE_
X-MS-Office365-Filtering-Correlation-Id: 94e8b8b2-207a-4a8b-044b-08df0d9e55c9
X-LD-Processed: 7ec5089e-a433-4bd1-a638-82ee62e21d37,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|52116014|376014|23010399003|366016|1800799024|38350700014|6133799003|3023799007|10067099003|56012099006|5023799004|18002099003;
X-Microsoft-Antispam-Message-Info:
 Y4Hk7/H9HpKpCY3MVnliVwl+vYxpokM41mNa8qH2RVGSQJC0J+xzjICB3NyQTcLo/0UXYgIL1pGrYyGByrdk0Ee8p4Ytr+Wq/Fuy9pyKBEyDsSq1imytopsxr9GjSxdaAGwfSKdmuVRhFfMP3bAN4A8S5wTck9FHEvyZVLdOUo+jOW5iBmdflilMUcDp9wDuW6ZbaWcqbHmprSEHv5W4cTCr8djf1Ybv9Lsl4S5WjQgP5m6leSDEHWxk307MZyOyVWQhhr73poEYgtSJSMUNEhQ9si8fSz+vF7c/wpUogIAm6xNjg6oBOAyB66Ze4XoP59bSK2umzRaj9SPN/6+ZZdDIHd9OAyU+pL7oajcc4qMFewlZUOQwySvZsdqW2isHj809/p46XSC6gqKl4Q99j4WpMEKMvoPBHFSW/TwrOI6aK9CcTV67rhHUP4yUvOnOe4sIe82t3v0lwq2neSPEJzeTXdK9rOv+7dNBBKp1CAxHLDr6ZR8VnA6sqM6rlDkfClkMiD3JGOhIHp4uvIJBlUiqkdKNguSE12sFNm3HmDkWQA4aN05EKhe24EoI25fYtK4akHh+CIzCz9QxfkH4e+lPr3ZOwbiYlS51Z4uLvh2Sn5fRRKqU2zyWNMEqJu2D9qdLBOoCCKiUnGGUeEgNJOf+IvNxgbajmhoy5nsbZZzgAy0CeBYa7V2kBGdpi+C/capDSbuW7VwObuUTk627GIy+iNoQPZLIK0Q8D/PyakE=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA0P287MB2178.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(23010399003)(366016)(1800799024)(38350700014)(6133799003)(3023799007)(10067099003)(56012099006)(5023799004)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?4BPnAk8yAcov8v6zULZGnAvg62T0q8AHvR7dowfg12GUL2Y6cA471itSKA+s?=
 =?us-ascii?Q?KVsliWEBGMDMzsxnmGpjIAL2MkjTuBFrT7VxqO3/pzPahgX84LDjLEh6Tr16?=
 =?us-ascii?Q?v92Ck6EPAGpmcOLnDU5MLXSSBOoYNxP1COReT9HUUb/oxApsWkcwAbP/SAPS?=
 =?us-ascii?Q?/l/8k0AvyZRfHoICjedhAObYFu7hnCY77o1JxDGqzzXBReOnSXQ2p5cUKjDU?=
 =?us-ascii?Q?t9s3btzRgaDBuA29Y03WwwdyhtiFaUAKhBZwuSDciS3vin0ByTPXAXpNApNG?=
 =?us-ascii?Q?JOn7csaMRP4VjXTFoDCsNHHquFYocX25kzXhD1tzTQJvxHIWJLRloe4UoO5V?=
 =?us-ascii?Q?NpVn2p13nmVzD+zuxwn5B7hqGL8/ayRZwNTiwr/wYBcm6qpGg2eA09nk1wRb?=
 =?us-ascii?Q?p8qxS947Y7RbC1sjDCf+DvsYec9Hx3sZFElMfv/dDmITq/h7QZo3JD60M4O4?=
 =?us-ascii?Q?g0HooPxoGZUeshKh82xbItMaKGc57p3YhYNDRJzEg/ryICgXMfM7X2riXPEy?=
 =?us-ascii?Q?pDOFWolIzGfVPvElV1DYT2ehI5WjZRnWB1enMTUBHVaF6G0abvUuYI9ibnna?=
 =?us-ascii?Q?W2F3/R9SV7NaakrCMLnaPEPsjv9cxXm0ya10N3IcAfVlqgqRUpVQipYlyYR+?=
 =?us-ascii?Q?KHphRCxhcPDw2GuAfhMBIMu9B1fuZR6DrO5ZhzrltFZpzMhpJtwMc0nGdDlc?=
 =?us-ascii?Q?qOjJaIwZLW4ib/pBCRYK8TdcWf9T+mXMnSQuEjyLKb8bVG7wZ3+KvycLWpVm?=
 =?us-ascii?Q?MLxxB36M2CDas8byFFi0YVcv+qcTNo9Mac3rWeQOYxsZODL/p1biNVL3Xpkh?=
 =?us-ascii?Q?hrcmK4I7FCYEVBguoU1Lo2lWinkLaJL5YW0/maL/P/NjAWujQ3WFm7sdVd1i?=
 =?us-ascii?Q?efgIE1swqzEH880u22ws4pn8DRQKCVB89vkAzcQbRwGcQ5i0jdA7pkXJDgh0?=
 =?us-ascii?Q?ZUfJFCcNl+ZqWA3cDQ4bVOJ6wSM5NNaUZkcmzzTv7Im5SJh6HoLSUNd+mZYx?=
 =?us-ascii?Q?OUYtO+EvGkW+pbunb3YxSim4jxUUv0fv8z0M2YxpHUQfAElN6fsWwwHE23JI?=
 =?us-ascii?Q?xBRW0rmgdKgOxeuSciNjkQnVghLk7tm9gA4uduVFsagK39fImYf6iGJsZ9He?=
 =?us-ascii?Q?L6k2rcxi7wIthUqytEKyYqPiQc7/6tc4YLoNGHnanYdnwIEUjt7hO2IF9XQX?=
 =?us-ascii?Q?etqpSM1ZqbBVV7yTf7pFB2GEa4aNva3TOfUw6nCPOAe1EdHEBRNxQfkx+M/t?=
 =?us-ascii?Q?d6HIg2CzRcpOqLy7K7FgbSIC5MyrJXJ75jt1MXigaFWSlvJwO0JoTGkaASxU?=
 =?us-ascii?Q?cV8RSpwdKeSABgjgHeeocdPAJ8LSmy5NInD4F8SqzrQ+zISzn4oQwVd3iDMa?=
 =?us-ascii?Q?p3EhJWgmk+CRXVHreCMU/th71ngNoTt5/hdG6cJNh9k8w3rnvFFZnN/LVd8D?=
 =?us-ascii?Q?zBYSOSz2JZDU1D46Zl+ZtsYHVo2rwlZGzSRD9TlBxtCdTkFaADNQ+dgJoaRB?=
 =?us-ascii?Q?lmiZac/qd6XQjt9QVuA/lN7zDtUI3iX8Qm2P6Ubkr+OW3Dxjt9eWe6Ixut9S?=
 =?us-ascii?Q?L9K3tQYo7IwiRMTWmKdpsPdriB92Qx08/znjwgL8xkQOwc4wk0M12JB9EqNP?=
 =?us-ascii?Q?g+sIzPrAcqQM7B6pn+ftwSCHCSxREH905FaPbd0eSueUBXNhPGHocM1ndPbV?=
 =?us-ascii?Q?NML+Q37WJCzuBeHLX+y4kwz/A4xPjxHitZQMUYyTVr+tQbLGVRQr7NobQ+2+?=
 =?us-ascii?Q?gAc5+T+SCaXccQwzNsYk9y2pd/ziMb23MWvPZFxC+3SX9tE3CBHy?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 94e8b8b2-207a-4a8b-044b-08df0d9e55c9
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 11:43:00.6519
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UIE8sfBIFx/nqufxoOBC+nYRVpDYTuT8hQ2ElE1irqE/rlK4nmph3Y3mwcM9WWtV3ZtnCWHHI13IfOfGn1WHBD8yuyKjOs7bCqEOK0JZslMIaxPlck8uXpePy/GlYDaP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2PPFBA0397B73

The following features are supported:
- Manual exposure an gain control support.
- vblank/hblank control support.
- vflip/hflip control support
- Test pattern control support.
- mode support 1920 x 1080 @ 30 fps, SBGGR10

The driver is tested on mainline branch v7.0-rc2 on IMX8MP Debix Model a.

v4l2-compliance 1.31.0-5387, 64 bits, 64-bit time_t
v4l2-compliance SHA: 5508bc4301ac 2025-08-25 08:14:22

Compliance test for device /dev/v4l-subdev3:

Driver Info:
        Driver version   : 7.0.0
        Capabilities     : 0x00000000
        Client Capabilities: 0x0000000000000002
interval-uses-which
Required ioctls:
        test VIDIOC_SUDBEV_QUERYCAP: OK
        test invalid ioctls: OK

Allow for multiple opens:
        test second /dev/v4l-subdev3 open: OK
        test VIDIOC_SUBDEV_QUERYCAP: OK
        test for unlimited opens: OK

Debug ioctls:
        test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
        test VIDIOC_ENUMAUDIO: OK (Not Supported)
        test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDIO: OK (Not Supported)
        Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
        Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
        test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
        test VIDIOC_QUERYCTRL: OK
        test VIDIOC_G/S_CTRL: OK
        test VIDIOC_G/S/TRY_EXT_CTRLS: OK
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
        Standard Controls: 12 Private Controls: 0

Format ioctls:
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
        test VIDIOC_G/S_PARM: OK (Not Supported)
        test VIDIOC_G_FBUF: OK (Not Supported)
        test VIDIOC_G_FMT: OK (Not Supported)
        test VIDIOC_TRY_FMT: OK (Not Supported)
        test VIDIOC_S_FMT: OK (Not Supported)
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
        test Cropping: OK (Not Supported)
        test Composing: OK (Not Supported)
        test Scaling: OK (Not Supported)

Codec ioctls:
        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
        test CREATE_BUFS maximum buffers: OK
        test VIDIOC_REMOVE_BUFS: OK
        test VIDIOC_EXPBUF: OK (Not Supported)
        test Requests: OK (Not Supported)
        test blocking wait: OK (Not Supported)

Total for device /dev/v4l-subdev3: 46, Succeeded: 46, Failed: 0, Warnings: 0

V4 -> V5

Patch 1/2:
- Correct typos.

Patch 2/2
- Remove the data lane check, as the sensor only supports two lanes.
- Fix the error path in os02g10_parse_endpoint().
- Remove the error message from the clk_prepare_enable path.

V3 -> V4

Patch 1/2:
- Add the required endpoint.
- Carry Vladimir's Reviewed-by tag.

Patch 2/2:
- Address small review comments from Vladimir and Sakari.
- Drop Patch 3/3 as suggested by Sakari.


V2 -> V3

Patch 1/3:
- Drop the fixed data-lanes property, as the sensor supports only a 2-lane MIPI interface.

Patch 2/3:
- Use regmap paging features for page selection.
- Use sd instead of _sd.
- Remove an extra blank line.
- Remove hblank control, as it is not used to set hblank on this sensor.
- Remove an unnecessary error check.
- Reduce the scope of the ret variable in os02g10_set_pad_format().
- Rely on the control value for link_freq_index.
- Call os02g10_parse_endpoint() before initializing regulators, GPIOs, and the clock in probe().

Add new Patch 3/3:
- Add dynamic mode configuration instead of using a hardcoded specific mode, as suggested by Laurent.

V1 -> V2

patch 1/2:
- Corrected $id to ovti,os02g10.yaml
- Fixed data-lanes property structure to use proper items format

patch 2/2:
- Mode-specific register writes handled dynamically.
- Moved page 2 registers into a dedicated page 2 block.
- Used pm_runtime_get_if_active() in set_ctrls.
- Resolved negative hblank issue.
- Improved error messages in disable_stream.
- Updated V4L2_SEL_TGT_CROP and V4L2_SEL_TGT_CROP_BOUNDS.
- Added my name to the author list.

Elgin Perumbilly (2):
  dt-bindings: media: i2c: Add os02g10 sensor
  media: i2c: add os02g10 image sensor driver

 .../bindings/media/i2c/ovti,os02g10.yaml      |  94 ++
 MAINTAINERS                                   |   8 +
 drivers/media/i2c/Kconfig                     |  10 +
 drivers/media/i2c/Makefile                    |   1 +
 drivers/media/i2c/os02g10.c                   | 932 ++++++++++++++++++
 5 files changed, 1045 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,os02g10.yaml
 create mode 100644 drivers/media/i2c/os02g10.c

--
2.34.1

