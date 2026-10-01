Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 014702F0C7E;
	Thu,  1 Oct 2026 12:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790859337; cv=none; b=E+DxI9Z1GojIO7BaC7LVe0ioOuChMtTUV1gQ1+ATXHrWz8R3IRUyk1FMSBp2zsHp37/egjqm4L/H/k2kZaN7o6fFQd2h7xF6v8wdbBFvyq+OgPMctxy6fJF+l8B7w8Be8GQwJ62uedR7p4cfntMcmurgKf+mE4KjtN3Ct3hP2K4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790859337; c=relaxed/simple;
	bh=vX0NW/L+hWDrygsbkQcLVlMrVZ2QZaJ/UTg3IiNdFNM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s6FiDtlKP6gbHuLvN3yURfCSi+zRpryCxNWRW9TVG0y6NdbVAovbZXm6cJoMUrvr5YVpSaOA837BWELhobblDX3SaTLXDOZN/uaVHXPhdoW5GAh4FWNvwXk83P8dZyclG3fbSMGpCc7iaM6vYJu3xZNuwCcZsDRCH/0FxLHEl1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jIzk+MWv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jIzk+MWv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2072E1F00898;
	Thu,  1 Oct 2026 12:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790859335;
	bh=XRCX+Zo1OqQ7H9k+LWCEKRgHXOiihn+rqufCY7PsiYw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=jIzk+MWvVu73cBzyRJus5yrv2x0PdSQIRLhiBmZNuuYJFLUqaDg4yotX9Zjha8o91
	 5CLr94pOnzlt738DduNoai2F4xZA0jVgtfcRXnTBmD3zaIlMfaXkveG0yhvMpPU9Kh
	 4PhmwbRWpx4XsDOIca25eRQG++qAc3RnVGhJtR3aq+APGeoFjF8lj94melPE1e6MzY
	 fxkVA/6N0zWIgaGUZ8EDJ0LrZ//+R/Mgtsnzf6QoVbvFErOiph/dTKXt/088gingCq
	 cphYCqvl6Fq+dpCtTWgd+a6qQAH2KYjXXGwKjve73xzBd1So0StvT/wT39tAs1ltwa
	 7yun9ZYFMHUxg==
From: Mattijs Korpershoek <mkorpershoek@kernel.org>
Date: Thu, 01 Oct 2026 14:55:20 +0200
Subject: [PATCH RFC 2/5] media: v4l2-subdev: Add new ioctl for connection
 status
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-v4l2-sensor-detect-v1-2-a45993be17b8@kernel.org>
References: <20261001-v4l2-sensor-detect-v1-0-a45993be17b8@kernel.org>
In-Reply-To: <20261001-v4l2-sensor-detect-v1-0-a45993be17b8@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Michael Riesch <michael.riesch@collabora.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Maxime Ripard <mripard@kernel.org>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mattijs Korpershoek <mkorpershoek@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6964;
 i=mkorpershoek@kernel.org; h=from:subject:message-id;
 bh=vX0NW/L+hWDrygsbkQcLVlMrVZ2QZaJ/UTg3IiNdFNM=;
 b=owEBbQGS/pANAwAKARkNHbRmThk1AcsmYgBqvlg+8wtUobL1zMyZHI01PEgTnbc7Z50ehmrgD
 +3uBXm4RsOJATMEAAEKAB0WIQQu6UKnth9qvlMTrQAZDR20Zk4ZNQUCar5YPgAKCRAZDR20Zk4Z
 NdhqB/92SS54MII/N83rt7VY6zNpUWP8zGyKvTiOUR9j8lUAPbaHf+OCf9YAERsLYQz70ZZvPj6
 7zb4MFs4BCjz5oyhLqSI6PHV27z7Qh0oF9QVx1/h7cqpGXzNwwqyvCh0KpWNwMpeUSZatECsZH0
 Uf0ZeLrXmRRRlCnppgQfHtbJ/ctm/dH97bu6dvR5QWH0B1yVvuFGrJmG2kFpa3XMb1hN0Z99G19
 JTApqADnk+uR9NntnlbjPOK5vXuD9VyZTFFqm3I9UO1iBFyqaz502t+SHl9jZgnOxsBmLjhOBiJ
 NnimcnYIkvZ3PLixbcb4MnFuvVE8FutChJ1BPiHdqWXRzh3w
X-Developer-Key: i=mkorpershoek@kernel.org; a=openpgp;
 fpr=8234A35B45C0D26B31C1A2DA570338B018144F28

The V4L2 framework has historically assumed that every component of the
camera pipeline is always present. This is a reasonable assumption for
integrated cameras in laptops or phones. However, in automotive systems,
cameras (e.g. rear-view or surround-view) can be damaged or
disconnected.

When a camera gets disconnected, userspace cannot detect this and thus
cannot react (for example, by disabling streaming on a faulty camera).

Add a new v4l2-subdev ioctl (VIDIOC_SUBDEV_G_CONNECTION_STATUS) that
drivers can implement to report their connection status.

Signed-off-by: Mattijs Korpershoek <mkorpershoek@kernel.org>
---
 .../userspace-api/media/v4l/user-func.rst          |  1 +
 .../v4l/vidioc-subdev-g-connection-status.rst      | 89 ++++++++++++++++++++++
 drivers/media/v4l2-core/v4l2-subdev.c              |  8 ++
 include/media/v4l2-subdev.h                        |  3 +
 include/uapi/linux/v4l2-subdev.h                   | 12 +++
 5 files changed, 113 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/user-func.rst b/Documentation/userspace-api/media/v4l/user-func.rst
index 5fc95c792408..3d7fcfbfabde 100644
--- a/Documentation/userspace-api/media/v4l/user-func.rst
+++ b/Documentation/userspace-api/media/v4l/user-func.rst
@@ -75,6 +75,7 @@ Function Reference
     vidioc-subdev-g-routing
     vidioc-subdev-g-selection
     vidioc-subdev-g-client-cap
+    vidioc-subdev-g-connection-status
     vidioc-subdev-querycap
     vidioc-subscribe-event
     func-mmap
diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-connection-status.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-connection-status.rst
new file mode 100644
index 000000000000..1ea83e5bbbcd
--- /dev/null
+++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-connection-status.rst
@@ -0,0 +1,89 @@
+.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
+
+.. _VIDIOC_SUBDEV_G_CONNECTION_STATUS:
+
+****************************************
+ioctl VIDIOC_SUBDEV_G_CONNECTION_STATUS
+****************************************
+
+Name
+====
+
+VIDIOC_SUBDEV_G_CONNECTION_STATUS - Query whether the sub-device hardware is
+physically connected.
+
+Synopsis
+========
+
+.. c:macro:: VIDIOC_SUBDEV_G_CONNECTION_STATUS
+
+``int ioctl(int fd, VIDIOC_SUBDEV_G_CONNECTION_STATUS, struct v4l2_subdev_connected_status *argp)``
+
+Arguments
+=========
+
+``fd``
+    File descriptor returned by :c:func:`open()`.
+
+``argp``
+    Pointer to struct :c:type:`v4l2_subdev_connected_status`.
+
+Description
+===========
+
+The ``VIDIOC_SUBDEV_G_CONNECTION_STATUS`` ioctl allows userspace to query
+whether the hardware behind a V4L2 sub-device is physically connected.
+
+The ioctl takes a pointer to a struct :c:type:`v4l2_subdev_connected_status`
+which is filled by the driver. The driver probes the hardware and reports the
+connection status.
+
+.. tabularcolumns:: |p{1.5cm}|p{2.9cm}|p{12.9cm}|
+
+.. c:type:: v4l2_subdev_connected_status
+
+.. flat-table:: struct v4l2_subdev_connected_status
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       3 4 20
+
+    * - __u32
+      - ``status``
+      - Connection status of the sub-device, see
+	:ref:`subdev-connection-status`.
+    * - __u32
+      - ``reserved``\ [7]
+      - Reserved for future extensions. Set to 0 by the V4L2 core.
+
+.. tabularcolumns:: |p{6.8cm}|p{2.4cm}|p{8.1cm}|
+
+.. _subdev-connection-status:
+
+.. flat-table:: Connection Status Values
+    :header-rows:  1
+    :stub-columns: 0
+    :widths:       3 1 4
+
+    * - Status
+      - Value
+      - Description
+    * - ``V4L2_SUBDEV_STATUS_CONNECTED``
+      - 1
+      - The sub-device hardware is connected and reachable.
+    * - ``V4L2_SUBDEV_STATUS_DISCONNECTED``
+      - 2
+      - The sub-device hardware is not connected or not reachable.
+    * - ``V4L2_SUBDEV_STATUS_UNKNOWN``
+      - 3
+      - The connection status could not be determined.
+
+Return Value
+============
+
+On success 0 is returned, on error -1 and the ``errno`` variable is set
+appropriately. The generic error codes are described at the
+:ref:`Generic Error Codes <gen-errors>` chapter.
+
+ENOIOCTLCMD
+   The kernel does not support this ioctl.
diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index e9f81b9be9e2..bfd5c5a6a060 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -1142,6 +1142,14 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 		return 0;
 	}
 
+	case VIDIOC_SUBDEV_G_CONNECTION_STATUS: {
+		struct v4l2_subdev_connected_status *status = arg;
+
+		memset(status->reserved, 0, sizeof(status->reserved));
+
+		return v4l2_subdev_call(sd, sensor, detect, status);
+	}
+
 	default:
 		return v4l2_subdev_call(sd, core, ioctl, cmd, arg);
 	}
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index d256b7ec8f84..d47d6eae6177 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -550,10 +550,13 @@ struct v4l2_subdev_vbi_ops {
  * @g_skip_frames: number of frames to skip at stream start. This is needed for
  *		   buggy sensors that generate faulty frames when they are
  *		   turned on.
+ * @detect: query whether the sensor is physically connected and reachable
  */
 struct v4l2_subdev_sensor_ops {
 	int (*g_skip_top_lines)(struct v4l2_subdev *sd, u32 *lines);
 	int (*g_skip_frames)(struct v4l2_subdev *sd, u32 *frames);
+	int (*detect)(struct v4l2_subdev *sd,
+		      struct v4l2_subdev_connected_status *status);
 };
 
 /**
diff --git a/include/uapi/linux/v4l2-subdev.h b/include/uapi/linux/v4l2-subdev.h
index 2347e266cf75..8d50c73e8ec5 100644
--- a/include/uapi/linux/v4l2-subdev.h
+++ b/include/uapi/linux/v4l2-subdev.h
@@ -268,6 +268,17 @@ struct v4l2_subdev_client_capability {
 	__u64 capabilities;
 };
 
+enum v4l2_subdev_connected_status_whence {
+	V4L2_SUBDEV_STATUS_CONNECTED = 1,
+	V4L2_SUBDEV_STATUS_DISCONNECTED = 2,
+	V4L2_SUBDEV_STATUS_UNKNOWN = 3,
+};
+
+struct v4l2_subdev_connected_status {
+	__u32 status;
+	__u32 reserved[7];
+};
+
 /* Backwards compatibility define --- to be removed */
 #define v4l2_subdev_edid v4l2_edid
 
@@ -287,6 +298,7 @@ struct v4l2_subdev_client_capability {
 #define VIDIOC_SUBDEV_S_ROUTING			_IOWR('V', 39, struct v4l2_subdev_routing)
 #define VIDIOC_SUBDEV_G_CLIENT_CAP		_IOR('V',  101, struct v4l2_subdev_client_capability)
 #define VIDIOC_SUBDEV_S_CLIENT_CAP		_IOWR('V',  102, struct v4l2_subdev_client_capability)
+#define VIDIOC_SUBDEV_G_CONNECTION_STATUS	_IOR('V',  103, struct v4l2_subdev_connected_status)
 
 /* The following ioctls are identical to the ioctls in videodev2.h */
 #define VIDIOC_SUBDEV_G_STD			_IOR('V', 23, v4l2_std_id)

-- 
2.55.0

