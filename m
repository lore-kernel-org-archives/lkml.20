Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793113077;
	b=GAAorYPiyBoJPDV+NYi4ZQ7cAGm79OwXGoF1CF1eKDbKSzeLKHKvuvue13XZuAT0uu/5
	 ithD5dS5vj/bgwcnmNgHm+aWAirbANMRxkntFl/PbDn0ABbOfWb58wxXXTYMqIgFeiqe8
	 5Oc49ElmziEBgBFI3dT3LOOaaN/C6+uIDeQ1rdZhTyjxkW27lUMYFuMBCF2pbZV2eXvER
	 M5KxfT25+aZuG6JNzOGX3+AyjsQqRt1aviI3rUkjXCQ967E+FW9yQmZw5QK9ybzjkt++k
	 gg2/p/0MwZVuD9BzEIfLe+EyIBcyV4axI6cafK014kQkeFYgAMK3LSfRQNUuYMDlSIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793113077;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=6xyejghJrV5tkG6wLrqtAqBbMzoSbQ4trkIlB9MCuM8=;
	b=Sy99EN1pQDhu5L61aYJ53Q9TCHcAAai8/ahLHoKJhn+gzV0Mj9mCGRNuDtizE9KHtjEh
	 7KdpUEJ2oMNcEE6i/nEJgV7TVUw6z7MtN7wAP1Qc3ppJRKCHb3TnX8jXtSuxbMgNqUcO+
	 mU8GtElhfBfdneWGNCVUU8NyNqjPs9s1C/YgUap7eWs66sAKLBGIyOyrunHefETMgqZAW
	 gO7UoQwAPFL9w7TjlSEPEXjAkOGhZFn9nxzdf0JfTfU4y6+aClMNbgYjn9drW6TMbX2Nc
	 BaW6ZIqxXd+je1E8QrpUP8DBwolhkQO9QrugrpDTvw5jVzhAscg8bt8sej8Fh+3wkJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=1KDMoh9c;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B27A606A32E;
	Tue, 27 Oct 2026 14:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=1KDMoh9c
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B52E01F01828;
	Tue, 27 Oct 2026 14:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793113076;
	bh=6xyejghJrV5tkG6wLrqtAqBbMzoSbQ4trkIlB9MCuM8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=1KDMoh9cqVR1YbwuEeeIkgXm5U8TQ8PQNUd4SfQQzBq0Ei1+JQd60muBbdzTVpioW
	 3EuemHqSbx7lc8nbd96o5PkXDOxKhZSkcUuxzTxL/D9CDEnyNVyusHrqkoF8aC5As9
	 XE3jVQCRgYPUj9GTmyr0Pr4rw/5ndloKmcyHaKTE=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Tue, 27 Oct 2026 15:57:41 +0100
Subject: [PATCH 01/19] usb: core: sysfs: take the port lock to read the BOS
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261027-llm-usb-v1-1-b9751ddb9c7c@linuxfoundation.org>
References: <20261027-llm-usb-v1-0-b9751ddb9c7c@linuxfoundation.org>
In-Reply-To: <20261027-llm-usb-v1-0-b9751ddb9c7c@linuxfoundation.org>
To: linux-usb@vger.kernel.org
Cc: Alan Stern <stern@rowland.harvard.edu>, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Josef Bacik <josef@toxicpanda.com>, stable <stable@kernel.org>, 
 Griffin Kroah-Hartman <griffin@kroah.com>, Oliver Neukum <oneukum@suse.com>
X-Mailer: b4 0.17-dev-e5168
X-Developer-Signature: v=1; a=openpgp-sha256; l=5344;
 i=gregkh@linuxfoundation.org; h=from:subject:message-id;
 bh=kEc5mCf0GXcrJozr7f6fFqVcblHjicl34PY1j+9QaGc=;
 b=owGbwMvMwCRo6H6F97bub03G02pJDFkPdr/bFsanZPOiafHiUzesdT7lfrA7q1sq9NCktOd+/
 OlNh/cEdMSyMAgyMciKKbJ82cZzdH/FIUUvQ9vTMHNYmUCGMHBxCsBEDk5mWHCyLqpqWcmkdytP
 yweaKHUxBEzet5hhwSwx+/eefMbyRwIa5DKETIJM28vvAgA=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp;
 fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29

From: Josef Bacik <josef@toxicpanda.com>

usb_reset_and_verify_device() sets udev->bos aside, lets hub_port_init()
read a new BOS into udev->bos, compares the two, frees the new one and
puts the old one back. bos_descriptors_read() takes the device lock
against that since commit 4e0197fbb0ee ("usb: core: sysfs: add lock to
bos_descriptors_read()").

This does not cover one caller. finish_port_resume() does a reset-resume
if the device has the quirk, if its port lost power, or if the device
does not answer GET_STATUS after a normal resume. In an autoresume this
runs without the device lock, for instance from
usb_autopm_get_interface() of an interface driver. The comment above
usb_reset_and_verify_device() says that tasks which hold the device lock
are expected to resume the device first.

bos_descriptors_read() does not. The file is readable for everybody, so
a reader can meet the temporary BOS of a device which is being resumed:
while usb_get_bos_descriptor() has not set ->desc yet (NULL
dereference), before it has corrected a wTotalLength which is larger
than the buffer (read beyond the buffer), or when it is freed (use after
free).

The file was made to give the descriptors to everybody without USB I/O,
so the reader should not wake up the device. There is a lock which both
callers of usb_reset_and_verify_device() hold, the one of the port:
usb_reset_device() takes it around the call and usb_port_resume() for
the whole resume. Take it in the reader too, inside the device lock,
which is the order of usb_reset_device(). A root hub has no port and is
never reset this way.

The port belongs to the parent hub, which removes its ports after it has
disconnected the children. usb_disconnect() cannot finish while the file
is being read, device_del() waits for the reader.

Fixes: 12fc84e8c428 ("usb: Export BOS descriptor to sysfs")
Cc: stable <stable@kernel.org>
Cc: Griffin Kroah-Hartman <griffin@kroah.com>
Cc: Oliver Neukum <oneukum@suse.com>
Cc: Alan Stern <stern@rowland.harvard.edu>
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/usb/core/hub.c   | 32 ++++++++++++++++++++++++++++++++
 drivers/usb/core/sysfs.c |  4 ++++
 drivers/usb/core/usb.h   |  3 +++
 3 files changed, 39 insertions(+)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 199d3f535a89..9bc12079a80f 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -3278,6 +3278,38 @@ static void usb_unlock_port(struct usb_port *port_dev)
 	__release(&port_dev->status_lock);
 }
 
+/**
+ * usb_lock_device_port - lock the port which a device is connected to
+ * @udev: a registered device, locked by the caller
+ *
+ * usb_reset_and_verify_device() runs with the port lock, also where it is
+ * called from an autoresume handler, without the device lock. This keeps it
+ * away without resuming the device.
+ *
+ * The hub removes its ports after usb_disconnect() has unregistered the
+ * child, so the caller has to make sure that this has not finished.
+ *
+ * Return: the port for usb_unlock_device_port(), NULL for a root hub.
+ */
+struct usb_port *usb_lock_device_port(struct usb_device *udev)
+{
+	struct usb_hub *hub = usb_hub_to_struct_hub(udev->parent);
+	struct usb_port *port_dev;
+
+	if (!hub)
+		return NULL;
+
+	port_dev = hub->ports[udev->portnum - 1];
+	mutex_lock(&port_dev->status_lock);
+	return port_dev;
+}
+
+void usb_unlock_device_port(struct usb_port *port_dev)
+{
+	if (port_dev)
+		mutex_unlock(&port_dev->status_lock);
+}
+
 #ifdef	CONFIG_PM
 
 /* Check if a port is suspended(USB2.0 port) or in U3 state(USB3.0 port) */
diff --git a/drivers/usb/core/sysfs.c b/drivers/usb/core/sysfs.c
index d22dc78457d7..95a51c7c7a08 100644
--- a/drivers/usb/core/sysfs.c
+++ b/drivers/usb/core/sysfs.c
@@ -901,12 +901,15 @@ bos_descriptors_read(struct file *filp, struct kobject *kobj,
 	struct usb_device *udev = to_usb_device(dev);
 	struct usb_host_bos *bos;
 	struct usb_bos_descriptor *desc;
+	struct usb_port *port_dev;
 	size_t desclen, n = 0;
 	int rc;
 
 	rc = usb_lock_device_interruptible(udev);
 	if (rc < 0)
 		return -EINTR;
+	/* A reset-resume replaces udev->bos without the device lock */
+	port_dev = usb_lock_device_port(udev);
 	bos = udev->bos;
 	if (bos) {
 		desc = bos->desc;
@@ -916,6 +919,7 @@ bos_descriptors_read(struct file *filp, struct kobject *kobj,
 			memcpy(buf, (void *) desc + off, n);
 		}
 	}
+	usb_unlock_device_port(port_dev);
 	usb_unlock_device(udev);
 	return n;
 }
diff --git a/drivers/usb/core/usb.h b/drivers/usb/core/usb.h
index a9b37aeb515b..824e465bbb12 100644
--- a/drivers/usb/core/usb.h
+++ b/drivers/usb/core/usb.h
@@ -8,6 +8,7 @@
 
 struct usb_hub_descriptor;
 struct usb_dev_state;
+struct usb_port;
 
 /* Functions local to drivers/usb/core/ */
 
@@ -85,6 +86,8 @@ extern bool usb_device_is_owned(struct usb_device *udev);
 
 extern int  usb_hub_init(void);
 extern void usb_hub_cleanup(void);
+extern struct usb_port *usb_lock_device_port(struct usb_device *udev);
+extern void usb_unlock_device_port(struct usb_port *port_dev);
 extern int usb_major_init(void);
 extern void usb_major_cleanup(void);
 extern int usb_device_supports_lpm(struct usb_device *udev);

-- 
2.56.0

