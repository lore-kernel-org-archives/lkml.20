Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 333A4419FB2;
	Thu,  3 Sep 2026 10:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788429939; cv=none; b=jc0VNTmra9shOiriqgGnDNVxU+CozELGJS+ZSU2nTen+dehRIdazZgLHSr5Ry2stLQTfWWyFcAnrIS799iSPuukGLHdGozAkOpalUuywZFegsPhYlPBKAXqzsYxqn5cu/i9gChLESOZVMjwv1RNy28/7yGflRkrEuAk8RlHvtas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788429939; c=relaxed/simple;
	bh=xW2urQsVEDXn55Kns1EHCAEHKrhI3DMT2OFdwtJPXIw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=maooAgfsu8riyQR8MAuoDRxnePQSpUTUb6bAOpOtsxg20y5KpPmqWnj/yWiX21R4Pbtczp/Mtelcw59xMiqoL2oahI/815MMZySA7no+lhiVL8sSLoTcfqnxHspQGqKTppZeXCIdcaxzbFX2kdWurtVJYH4nboG1Bgydpns+d4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ijkelgBa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ijkelgBa"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2C9B4C2BCC7;
	Thu,  3 Sep 2026 10:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788429937;
	bh=xW2urQsVEDXn55Kns1EHCAEHKrhI3DMT2OFdwtJPXIw=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=ijkelgBaktVLR0cpTDx1Jhxye5ZJKhLZRkJrBVCeQZAMlDaZXIi0w8JbYmNiPlCMV
	 2Q9rpTxd0Yl0IQzqIsU8HUVJvXkC9UN2R/6YP4us2vGBnigxZuwUlIGbCeyynOSwDK
	 OPRQAfzQiC45EcEp+WfuuibKx8dBTG9XxXqtidy0PuMIFRjhBlFes2bq03ErQAaZ+Q
	 jNrge0E4OZ2O8YkH8yMltyaIRLUrk1owMyX5J337+RsD+8SP+YKURijKwn0dO4enfx
	 ibuOFNnPib66MVyw6gczT8o/uOgt51g73N+9wUv80SMfsftgBVj7XycyuEeIsrBbuD
	 v84G0W35A0XKg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A50FC624A4;
	Thu,  3 Sep 2026 10:05:37 +0000 (UTC)
From: Mark Amirkan via B4 Relay <devnull+markdamirkan.gmail.com@kernel.org>
Date: Thu, 03 Sep 2026 03:05:14 -0700
Subject: [PATCH] usbip: Reject unterminated strings received from peers
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-sympwn-linux-005-final-v2-v1-1-f92548abf9ce@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6CQAxA0auQrm1SKxjHqxgXgB2twUqmghDC3
 R11+Rb/L+CSVByOxQJJRnV9WsZ2U0B7q+0qqJdsYOI9Bdqhz4/+bdipDRMSVRjV6g5HxlByoDI
 cqsgRct8niTr93qfz3z40d2lf3yGs6wds5GOffQAAAA==
X-Change-ID: 20260903-sympwn-linux-005-final-v2-942904985f2f
To: skhan@linuxfoundation.org, valentina.manea.m@gmail.com, 
 shuah@kernel.org
Cc: gregkh@linuxfoundation.org, i@zenithal.me, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788429936; l=5486;
 i=markdamirkan@gmail.com; s=pscsi-20260818; h=from:subject:message-id;
 bh=QTpBrPKFb81Y4iOSFIIcF6enJuCbPleIQefiKM9cBHY=;
 b=AYsvP6s7XIX49FN2iNmnHc1bdI4K84493i2YnMAKAHld2xt2bY7o33boLiuR1+qtgMkBx0sC5
 C6+5aCVh0jbAeaI1KUq7w/uWf4KmDuh5cP0oGxucGhh63yNhv+Mgw/i
X-Developer-Key: i=markdamirkan@gmail.com; a=ed25519;
 pk=/wb49ibt4gZFDncmhFQBYtjPvzT1tfJtvK4Mqt1P2Wc=
X-Endpoint-Received: by B4 Relay for markdamirkan@gmail.com/pscsi-20260818
 with auth_id=961
X-Original-From: Mark Amirkan <markdamirkan@gmail.com>
Reply-To: markdamirkan@gmail.com

From: Mark Amirkan <markdamirkan@gmail.com>

USB/IP path and busid fields are fixed-size strings and must contain a NUL
byte. The list and attach clients and usbipd use fields received from a
peer as C strings without checking them first.

A reply with an unterminated field makes both clients read past the end of
the 312-byte device record. ASan reports a stack-buffer overflow at the end
of the record in both paths. In ten normal attach runs, the busid error
printed six bytes beyond the received record. The server did not send those
bytes, and their values changed between processes.

An import request with no NUL in its 32-byte busid makes usbipd read past
the request too. ASan reports the access at the end of the request.

Check the strings after receiving them and reject messages without the
required NUL byte.

Fixes: e9837bbb3e69 ("staging: usbip: userspace tools v1.0.0")
Cc: stable@vger.kernel.org
Assisted-by: Symbolic
Signed-off-by: Mark Amirkan <markdamirkan@gmail.com>
---
 tools/usb/usbip/src/usbip_attach.c  |  4 +---
 tools/usb/usbip/src/usbip_list.c    |  3 +--
 tools/usb/usbip/src/usbip_network.c | 35 +++++++++++++++++++++++++++++++++++
 tools/usb/usbip/src/usbip_network.h |  2 ++
 tools/usb/usbip/src/usbipd.c        |  3 +--
 5 files changed, 40 insertions(+), 7 deletions(-)

diff --git a/tools/usb/usbip/src/usbip_attach.c b/tools/usb/usbip/src/usbip_attach.c
index 531a415538f9..b81127ba3b04 100644
--- a/tools/usb/usbip/src/usbip_attach.c
+++ b/tools/usb/usbip/src/usbip_attach.c
@@ -153,14 +153,12 @@ static int query_import_device(int sockfd, char *busid)
 		return -1;
 	}
 
-	rc = usbip_net_recv(sockfd, (void *) &reply, sizeof(reply));
+	rc = usbip_net_recv_usb_device(sockfd, &reply.udev);
 	if (rc < 0) {
 		err("recv op_import_reply");
 		return -1;
 	}
 
-	PACK_OP_IMPORT_REPLY(0, &reply);
-
 	/* check the reply */
 	if (strncmp(reply.udev.busid, busid, SYSFS_BUS_ID_SIZE)) {
 		err("recv different busid %s", reply.udev.busid);
diff --git a/tools/usb/usbip/src/usbip_list.c b/tools/usb/usbip/src/usbip_list.c
index 3d810bcca02f..19d6e2205579 100644
--- a/tools/usb/usbip/src/usbip_list.c
+++ b/tools/usb/usbip/src/usbip_list.c
@@ -86,12 +86,11 @@ static int get_exported_devices(char *host, int sockfd)
 
 	for (i = 0; i < reply.ndev; i++) {
 		memset(&udev, 0, sizeof(udev));
-		rc = usbip_net_recv(sockfd, &udev, sizeof(udev));
+		rc = usbip_net_recv_usb_device(sockfd, &udev);
 		if (rc < 0) {
 			dbg("usbip_net_recv failed: usbip_usb_device[%d]", i);
 			return -1;
 		}
-		usbip_net_pack_usb_device(0, &udev);
 
 		usbip_names_get_product(product_name, sizeof(product_name),
 					udev.idVendor, udev.idProduct);
diff --git a/tools/usb/usbip/src/usbip_network.c b/tools/usb/usbip/src/usbip_network.c
index ed4dc8c14269..b99c230c62af 100644
--- a/tools/usb/usbip/src/usbip_network.c
+++ b/tools/usb/usbip/src/usbip_network.c
@@ -124,6 +124,41 @@ ssize_t usbip_net_recv(int sockfd, void *buff, size_t bufflen)
 	return usbip_net_xmit(sockfd, buff, bufflen, 0);
 }
 
+int usbip_net_recv_busid(int sockfd, char *busid)
+{
+	int rc;
+
+	rc = usbip_net_recv(sockfd, busid, SYSFS_BUS_ID_SIZE);
+	if (rc < 0)
+		return rc;
+
+	if (!memchr(busid, '\0', SYSFS_BUS_ID_SIZE)) {
+		dbg("received malformed busid");
+		return -1;
+	}
+
+	return 0;
+}
+
+int usbip_net_recv_usb_device(int sockfd, struct usbip_usb_device *udev)
+{
+	int rc;
+
+	rc = usbip_net_recv(sockfd, udev, sizeof(*udev));
+	if (rc < 0)
+		return rc;
+
+	if (!memchr(udev->path, '\0', sizeof(udev->path)) ||
+	    !memchr(udev->busid, '\0', sizeof(udev->busid))) {
+		dbg("received malformed usb device");
+		return -1;
+	}
+
+	usbip_net_pack_usb_device(0, udev);
+
+	return 0;
+}
+
 ssize_t usbip_net_send(int sockfd, void *buff, size_t bufflen)
 {
 	return usbip_net_xmit(sockfd, buff, bufflen, 1);
diff --git a/tools/usb/usbip/src/usbip_network.h b/tools/usb/usbip/src/usbip_network.h
index 83b4c5344f72..075114729a22 100644
--- a/tools/usb/usbip/src/usbip_network.h
+++ b/tools/usb/usbip/src/usbip_network.h
@@ -166,6 +166,8 @@ void usbip_net_pack_usb_device(int pack, struct usbip_usb_device *udev);
 void usbip_net_pack_usb_interface(int pack, struct usbip_usb_interface *uinf);
 
 ssize_t usbip_net_recv(int sockfd, void *buff, size_t bufflen);
+int usbip_net_recv_busid(int sockfd, char *busid);
+int usbip_net_recv_usb_device(int sockfd, struct usbip_usb_device *udev);
 ssize_t usbip_net_send(int sockfd, void *buff, size_t bufflen);
 int usbip_net_send_op_common(int sockfd, uint32_t code, uint32_t status);
 int usbip_net_recv_op_common(int sockfd, uint16_t *code, int *status);
diff --git a/tools/usb/usbip/src/usbipd.c b/tools/usb/usbip/src/usbipd.c
index 3e22b651c754..325edac8aef6 100644
--- a/tools/usb/usbip/src/usbipd.c
+++ b/tools/usb/usbip/src/usbipd.c
@@ -100,12 +100,11 @@ static int recv_request_import(int sockfd)
 
 	memset(&req, 0, sizeof(req));
 
-	rc = usbip_net_recv(sockfd, &req, sizeof(req));
+	rc = usbip_net_recv_busid(sockfd, req.busid);
 	if (rc < 0) {
 		dbg("usbip_net_recv failed: import request");
 		return -1;
 	}
-	PACK_OP_IMPORT_REQUEST(0, &req);
 
 	list_for_each(i, &driver->edev_list) {
 		edev = list_entry(i, struct usbip_exported_device, node);

---
base-commit: c9273c83885835dbd1e8835d5665dfb8503d65e0
change-id: 20260903-sympwn-linux-005-final-v2-942904985f2f

Best regards,
--  
Mark Amirkan <markdamirkan@gmail.com>


