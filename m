Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021110.outbound.protection.outlook.com [40.107.57.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B1F472093;
	Mon, 14 Sep 2026 13:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.57.110
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789392888; cv=fail; b=NlmsmCc/w3HeM5oil562loj6RAvi4QARqDGzZlfPFuszlL0tNoiXAgdVNxLREW+yRNKmQicm3cn2pfZTRNGOCD1LUWOIcntidOUi78pE9O3NqyNgWQYHInTkD7Fl9ByMd33C/x1MGxWTgo3mBZgIjfVuuPRwDO5jXj74gbzOVAQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789392888; c=relaxed/simple;
	bh=NmUXMfjgwTSUO/mF1pPZEnlWDUMBDcfVo04Rnp5Fcus=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=G3viP+4Y8uxwUcPEr18ItKdvDrB7es0lYClgWWsioy7STZq2Rb2DYGLG2obNi1tOzPMNI4YumDySotJ4PyBi92QM5vSj9H7bfm1QKcaQF+0qRDLhtM7VXnLxbBT7IWzkR8daNF1yiQYFmlsUYpvsAk3FmqV5gGPUHTaP/B0BoeI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com; spf=pass smtp.mailfrom=ebytelogic.com; arc=fail smtp.client-ip=40.107.57.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ebytelogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pRZ7ZMXfm9KYAnRDghkrQr4czmM9w9F++wN4M4QAttWQVnRnI0RJt0KeezE9pTSQIbGPbvO+AP6O6BkRIvsKMctOoUWvEq6f3TSAU1CDCBm7tqmVAlsBqpRwnKaNtmXjamL4RHWa5z0jnKhnFDnZ2Z//8Nz6rGJngE7oNeOdB07veKqnEntE0IxUmDPzqzIgvdGfgNOwYbKe9lSwou3bD29ZsfiIva3d8nUS+gmel2dXqy8cIQU5zkHEorulq20lgw00/fr4ncNa4BbdMpQMe0GruyLH1prrbkoBqVGY2AZtWnS3k/xxcMFgxxHlXkuQmnSWKzQsHTQQBQQWJP64aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i4Nzdz8aQBnoC+2/XO0LXOe1x4iSdoIFJNSol4b0hIc=;
 b=NtKPVx/csZjSv4xktWHPGWPv7IIYT8EuT7hjsfTwzl1auPCLOYeRWJ9ACbX/D9tyazgmHQVpA68DwzMwsi+v950/27G6XoCQTdOAClgx9zkaErHWrsYQoe7GgySg7Kr/Ydhkq0gba4FpYPq4xNkoYKWoOWx0Fnpz0eKhTp0stUpxrm5UIhvUnSTvB8afn17RP34QT3SZnZQgt5Eyc8nsw1Oi9fP6J5wgLPWebPaMaG/8KbejtkBoDWZ0Xw4TY5814A0hVSePb/aPlZrAOPtONVxJqhNZ45U0hAapo5/zpgV5ghNudtaESp4lodK0m228Yl81kjpw4iUiFSbnX+mktw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ebytelogic.com; dmarc=pass action=none
 header.from=ebytelogic.com; dkim=pass header.d=ebytelogic.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ebytelogic.com;
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM (2603:1096:c04:1::97)
 by PNVP287MB6090.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:34c::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 13:34:42 +0000
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e]) by PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e%6]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 13:34:42 +0000
From: Hitesh Patel <hitesh@ebytelogic.com>
To: linux-media@vger.kernel.org
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ravi@ebytelogic.com,
	Hitesh Patel <hitesh@ebytelogic.com>
Subject: [PATCH 6/8] media: qcom: camss: refcount streaming on the shared CSIPHY and CSID
Date: Mon, 14 Sep 2026 19:04:14 +0530
Message-ID: <20260914133416.1030231-7-hitesh@ebytelogic.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914133416.1030231-1-hitesh@ebytelogic.com>
References: <20260914133416.1030231-1-hitesh@ebytelogic.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN5P287CA0003.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:262::11) To PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c04:1::97)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PPF28092842E:EE_|PNVP287MB6090:EE_
X-MS-Office365-Filtering-Correlation-Id: 3252a35c-6bc2-43ec-bb7f-08df1264ee09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|10070799003|23010399003|1800799024|366016|3023799007|10067099003|5023799004|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	pXqxz0SQQ2hc+OfiNN0MTGhtdlBidhXIdaae1SHB1EDbX6ruUB6xt0T03b6C/yxTF5sahnL4aa+IAmx5RET/wCPH7U0HLcP5rNlGFfOKKpjh1hvKzPofCAZ98z54p7Dq9Yfyyao7tOSNOscxy8VLp7/kTehCuxgQosjFUc9H1MdxESD9MZ5uC/FWTBinl+W4jLbY1F+v4U2UHQ8f9zRV8b9jQwuXJVS6Jeg8OIhJ9TfZio+Kgq8IUHZPBDsiw2vCkmUZbMomoZpzrxp/toyifP2AhyTa7Xpo8LrpPqeV+uNYLlceidRQC1N8a+mJyZdgtnqXDtcSkhyxiIGjvCSzv0DZQrc+FpZ3hHfEX/H7Ue2K3Sg1t4JWozGRWxBwfubP3jJ/IkGfakRiK1zo2mCCXs+gs1msU0m2UR2obtp75tuJ8VCbg1MlWollWLyrEXDIMcSdGRI5QVT3Oc9DlclQbeVVbipcl5UTJbIh1o+PkPx0qmdFJFYLSAyC6xf0ZwdNgtqDdUpSvCwqg59fQkESggtMkvtHIFGOhEqpl7Fp3euMMuS4TLVVSRj6HVysXwkZo5seQaePdGAVoQ4Y0ILIpGJLlcJgYrMqARptFfT0UEcum59aOENjT/xliYmJ5Imke/u2O+VXxUASgOCSSQyH411yxV+dDVcQeBz3RZQXHt8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(10070799003)(23010399003)(1800799024)(366016)(3023799007)(10067099003)(5023799004)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9fnY/sG6oL3wMnsd8VLMB26KWaT25BJ/v4UEVc8c6PMkFj4PuDPtCck4SBvr?=
 =?us-ascii?Q?MTKklGqIfwFt81MP6jvryftZvrKpYIElDGPeAUuJ9dwkpako4iFTRe9A8IHo?=
 =?us-ascii?Q?LPKBekFC6xJDyosv1i/uATnFPYF4LZLHaY0tzBhRUK5dZOqMGKFG0ZeBjoYt?=
 =?us-ascii?Q?05vSoT4pstgWW4DRkkpUY/+sbgERwBjbf4zDgkxkByaZWcMPFAvylrR59U0h?=
 =?us-ascii?Q?SwFgV96a3lgUnpMSKOeQO20vqADA5x7j6g1UsziCZv+Smw3E3lSmyvpW7tIC?=
 =?us-ascii?Q?ZWy8jbgoEkGd6obkY1ZfS6tpPuF03AkfUaolcuYzfb9vMsKB0icKlwL43YL4?=
 =?us-ascii?Q?w5doTU/GIhKcGRcln3uz+2vHCqMrGGrO+dpdGt8vVHbCioQeVfSs5JaxT/n5?=
 =?us-ascii?Q?tWnrKfY7rsRJWdn2dwok9B6n6CjI1DAplAgDU9q8VrZhMMIuqyKr7WuG+NnG?=
 =?us-ascii?Q?1M8MMCjvQpV9BhD3Y9EwMTXJk+0MVJtRTpWzIWuhfTSC02bgI+ukH6Xn0Epp?=
 =?us-ascii?Q?UmPJeEg6Af4Tqh+RmC7L+ErBmsD4VYNZRjO3KwX4CExzHw1ME4R5nessIKty?=
 =?us-ascii?Q?Vrlb2tpMGhx+ZQDxLd5ECoEfqzMCrgjO2slCEOe8IVI+tc75RRpgbBaJTk6V?=
 =?us-ascii?Q?uluQ8bij4MpbJyTn/srWF2VVkb48oEiTGGGwWbwpf8Ab9RACUj3R95Pa5dd0?=
 =?us-ascii?Q?J2dLykcoCVkKjtiPoEpmcrGs399MzSX8bL6bPkLu1oLo/mQQdLYfB2dWsS7X?=
 =?us-ascii?Q?3/O/Vva7lod66uQP9v9wqSvaEzI6TC0SEBMe+QjwuIkvbnFwBeAGx6/nsAKA?=
 =?us-ascii?Q?N6KSydJClhMkUzJwkwXNKohQorVnfE8pE5F5Me2yonVU/EKTFc1LjXSQK4dg?=
 =?us-ascii?Q?98ZclBBGm9W+3SsvkHwu9WA7A7GYb6r96uzTNqPK987iTVM5ozCN7Fskd9Y+?=
 =?us-ascii?Q?4CJne/sLO7AZuwZ9QU9kP0dg0SRK4Gk8NK1ymflNAelpwwaaKVSHnY9V1hUX?=
 =?us-ascii?Q?APgXG8/jG27sKetInitOkel2lDyHsazF/ZZjzCR12rXpAgL0xw5h3JT8zf0l?=
 =?us-ascii?Q?bCGaVwFx1SH8Wy6viaZUV4pfE+aRbQjmoyw1Xw6+q3dUppaD3VClFwzit6EY?=
 =?us-ascii?Q?VDLHjlPmZ/40uwc4DCpOFyoZFmy8E4hhUl8VuQY/nHJl9kzUvzEdzdAxNX4d?=
 =?us-ascii?Q?hDIJMh3IDNHaK/KflDk0rDhLu+t5BsKVKo1KSYLwW38reMRgRkgVSQEosrTD?=
 =?us-ascii?Q?7G+hefeLRltuXdIuDzKHy+OYvT9I7kN+41hPDQ+3yqhvzBFzqUegmUXuherr?=
 =?us-ascii?Q?RBB6r+MCPD3iZoAts3+KQZSk4XqxCSOlD/jAwqPGR6Q//+wXnQIs5SoHck04?=
 =?us-ascii?Q?fK3bpqp2kA6NAKaErl+Tpz35D3iD2Gpto2BMG3y5DaExelvlIwx0kBMcIscp?=
 =?us-ascii?Q?1iSJIUrQqQ4hheq/bTiEnNxvQbSOH4fRVqDAVR7B/LNYmyansRvMcBMYpVMy?=
 =?us-ascii?Q?fTLlSuGhR3dQQsBg43x1klyEkhOaqK6EK3KeUWNMIDkUEhzY/+GtjMFn4yv5?=
 =?us-ascii?Q?2gkc+BgFLI+JPGJl7E6MMAgGERPG+7VFQv+jJ0kOzdplmF/bpsdv2CLgPjVT?=
 =?us-ascii?Q?nroPLlp7d0BQmh7PPwRN1RY/KI2GPHn35LcFm0UqVaJq4fOuI3Gg/SPCz9eM?=
 =?us-ascii?Q?b0lwpLPm4k6fb3HeNr1+yevLv/IO8VK4EFOZl99FygJt2RglR/VBVmFKobii?=
 =?us-ascii?Q?a/Uq1Q9QAqAkP1ccjM5DEacmYU6NtOa+cRTFXzZudA7JxZHW7ZnppWNpYoQj?=
X-MS-Exchange-AntiSpam-MessageData-1: aCGfLTBf4yWpJw==
X-OriginatorOrg: ebytelogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3252a35c-6bc2-43ec-bb7f-08df1264ee09
X-MS-Exchange-CrossTenant-AuthSource: PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 13:34:41.0638
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 13bdb17c-4ae8-490c-90c1-ec8121ef96ee
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GVHk+gCYLnJHFS0acKJ9vq7vwrtkPACumGv30OtA3NyierqDA/OGegnKLZXNMNWTBwp4L7YDAoRXpqQzvj8hKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNVP287MB6090

video_start_streaming() walks the pipeline from the video node
upstream and calls video.s_stream on every subdev it finds;
video_stop_streaming() does the same to stop. The core allows one
transition per subdev: call_s_stream() keeps a single
sd->s_stream_enabled flag and warns about, and drops, a start of a
subdev that is already started or a stop of one already stopped.

That is correct for a subdev with a single user, but the CSIPHY and
the CSID are shared when a CSI-2 transmitter aggregates several
cameras onto one port. A MAX9296A GMSL deserializer sends two
cameras on one CSI-2 output as two virtual channels; the CSID
demultiplexes them to RDI0 and RDI1, each of which is its own VFE
line, video node and thus pipeline, and both pipelines traverse the
same CSIPHY and CSID. Starting the second camera hits the core check:
the CSIPHY and CSID s_stream(1) are dropped with a WARN, and while
the hardware happens to be already running, stopping the first
camera then calls s_stream(0) on both and tears the CSIPHY and CSID
down underneath the second camera, which stops receiving frames.

Count the pipelines streaming through each CSIPHY and CSID and only
forward the first start and the last stop to the subdev. The count
is updated under the media graph mutex, which serialises the two
pipelines' start/stop against each other. All other subdevs of the
pipeline are driven exactly as before, so the ordinary one camera
per port case does not change.

csid_set_stream() programs every virtual channel of the en_vc mask
in one go, so a single start already covers all demultiplexed RDIs;
nothing needs to change on the CSID or CSIPHY side.

Signed-off-by: Hitesh Patel <hitesh@ebytelogic.com>
---
 .../media/platform/qcom/camss/camss-csid.h    |  2 +
 .../media/platform/qcom/camss/camss-csiphy.h  |  2 +
 .../media/platform/qcom/camss/camss-video.c   | 48 +++++++++++++++++--
 drivers/media/platform/qcom/camss/camss.c     | 28 +++++++----
 drivers/media/platform/qcom/camss/camss.h     |  2 +
 5 files changed, 71 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
index 5296b10f6..9e612ae99 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.h
+++ b/drivers/media/platform/qcom/camss/camss-csid.h
@@ -167,6 +167,8 @@ struct csid_device {
 	struct v4l2_ctrl_handler ctrls;
 	struct v4l2_ctrl *testgen_mode;
 	const struct csid_subdev_resources *res;
+	/* Number of pipelines streaming through this CSID */
+	unsigned int stream_users;
 };
 
 struct camss_subdev_resources;
diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.h b/drivers/media/platform/qcom/camss/camss-csiphy.h
index 9d9657b82..b920fe670 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.h
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.h
@@ -114,6 +114,8 @@ struct csiphy_device {
 	struct v4l2_mbus_framefmt fmt[MSM_CSIPHY_PADS_NUM];
 	const struct csiphy_subdev_resources *res;
 	struct csiphy_device_regs *regs;
+	/* Number of pipelines streaming through this CSIPHY */
+	unsigned int stream_users;
 };
 
 struct camss_subdev_resources;
diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
index 0852eb6f1..16c5f3748 100644
--- a/drivers/media/platform/qcom/camss/camss-video.c
+++ b/drivers/media/platform/qcom/camss/camss-video.c
@@ -249,6 +249,49 @@ static int video_prepare_streaming(struct vb2_queue *q)
 	return ret;
 }
 
+/*
+ * video_subdev_set_stream - Start or stop a subdev of the pipeline
+ * @video: CAMSS video device
+ * @subdev: Subdevice to start or stop
+ * @enable: Start when true, stop when false
+ *
+ * CSIPHY and CSID are shared between pipelines when a transmitter aggregates
+ * several cameras onto one CSI-2 port. The core allows a single s_stream
+ * transition per subdev, so only forward the first start and the last stop
+ * to them. Every other subdev is driven unconditionally as before.
+ */
+static int video_subdev_set_stream(struct camss_video *video,
+				   struct v4l2_subdev *subdev, bool enable)
+{
+	struct media_device *mdev = &video->camss->media_dev;
+	unsigned int *users;
+	bool forward;
+	int ret;
+
+	users = camss_subdev_stream_users(video->camss, subdev);
+	if (!users)
+		return v4l2_subdev_call(subdev, video, s_stream, enable);
+
+	mutex_lock(&mdev->graph_mutex);
+	if (enable)
+		forward = (*users)++ == 0;
+	else
+		forward = !WARN_ON(!*users) && --(*users) == 0;
+	mutex_unlock(&mdev->graph_mutex);
+
+	if (!forward)
+		return 0;
+
+	ret = v4l2_subdev_call(subdev, video, s_stream, enable);
+	if (enable && ret < 0 && ret != -ENOIOCTLCMD) {
+		mutex_lock(&mdev->graph_mutex);
+		(*users)--;
+		mutex_unlock(&mdev->graph_mutex);
+	}
+
+	return ret;
+}
+
 static int video_start_streaming(struct vb2_queue *q, unsigned int count)
 {
 	struct camss_video *video = vb2_get_drv_priv(q);
@@ -281,7 +324,7 @@ static int video_start_streaming(struct vb2_queue *q, unsigned int count)
 		entity = pad->entity;
 		subdev = media_entity_to_v4l2_subdev(entity);
 
-		ret = v4l2_subdev_call(subdev, video, s_stream, 1);
+		ret = video_subdev_set_stream(video, subdev, true);
 		if (ret < 0 && ret != -ENOIOCTLCMD)
 			goto error;
 	}
@@ -319,8 +362,7 @@ static void video_stop_streaming(struct vb2_queue *q)
 		entity = pad->entity;
 		subdev = media_entity_to_v4l2_subdev(entity);
 
-		ret = v4l2_subdev_call(subdev, video, s_stream, 0);
-
+		ret = video_subdev_set_stream(video, subdev, false);
 		if (ret) {
 			dev_err(video->camss->dev, "Video pipeline stop failed: %d\n", ret);
 			return;
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 4cf736d80..ca8101c2d 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4620,27 +4620,39 @@ struct media_pad *camss_find_sensor_pad(struct media_entity *entity)
 }
 
 /*
- * camss_is_receiver_subdev - Test whether a subdev is a CAMSS CSI-2 receiver
+ * camss_subdev_stream_users - Streaming user count of a CAMSS receiver subdev
  * @camss: CAMSS device
  * @sd: Subdevice to test
  *
- * Return true for a CSIPHY or CSID belonging to @camss, false for anything
- * else, in particular for the external subdev transmitting to them.
+ * CSIPHY and CSID are traversed by several pipelines at once when a CSI-2
+ * transmitter aggregates several cameras onto one port: every virtual channel
+ * is demultiplexed to its own RDI and forms its own pipeline. The hardware
+ * must only be started by the first of them and stopped by the last.
+ *
+ * Return a pointer to the user count of @sd if it is a CSIPHY or CSID of
+ * @camss, NULL for any other subdev, in particular for the external subdev
+ * transmitting to them.
  */
-static bool camss_is_receiver_subdev(struct camss *camss,
-				     struct v4l2_subdev *sd)
+unsigned int *camss_subdev_stream_users(struct camss *camss,
+					struct v4l2_subdev *sd)
 {
 	unsigned int i;
 
 	for (i = 0; i < camss->res->csiphy_num; i++)
 		if (sd == &camss->csiphy[i].subdev)
-			return true;
+			return &camss->csiphy[i].stream_users;
 
 	for (i = 0; i < camss->res->csid_num; i++)
 		if (sd == &camss->csid[i].subdev)
-			return true;
+			return &camss->csid[i].stream_users;
 
-	return false;
+	return NULL;
+}
+
+static bool camss_is_receiver_subdev(struct camss *camss,
+				     struct v4l2_subdev *sd)
+{
+	return camss_subdev_stream_users(camss, sd);
 }
 
 /*
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 39ea33e61..00b8d5304 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -167,6 +167,8 @@ void camss_add_clock_margin(u64 *rate);
 int camss_enable_clocks(int nclocks, struct camss_clock *clock,
 			struct device *dev);
 void camss_disable_clocks(int nclocks, struct camss_clock *clock);
+unsigned int *camss_subdev_stream_users(struct camss *camss,
+					struct v4l2_subdev *sd);
 struct media_pad *camss_find_sensor_pad(struct media_entity *entity);
 s64 camss_get_link_freq(struct camss *camss, struct media_entity *entity,
 			unsigned int bpp, unsigned int lanes);
-- 
2.43.0

