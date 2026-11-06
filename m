Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793993779;
	b=zYLhNv67HEHl4z4eLbkIzNFJdy21q4iZzaHvFCHfkvleadx5Bqtf8ABhPxuusmy+h4QC
	 2YXt+qouAQgk7a3o8dd578yG+kE6/YvLAXwvCBKQ9p5nN2edPx5po4+Z1KF46R2cZVZ4q
	 3TOA6IyEJTvE1jy++nWlCObZpSehZ2gE64yT4zTKMsZ8EYnnQ99qmtHfq5UufpzyTjo2s
	 erPpWsVZafcpiYWJKQiLh1LvaEa2M6uJnyyk0KG4C6gXsJL3e4Cjh4QAkwbLzC0GHCasv
	 0C+4b7OAKsnGmc40OoDEB8LIl0mQygion8UIS60FerteZVz5GjDqjJXDulIApTy11Vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793993779;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=6xTKEOGFRLXidPHrCfmBqE6GgEsv5eOpzmihaPx4Isg=;
	b=rWG0/u+2mDECliMBWFvnjS2uWLPqdiWWjY6UwOjQ0g6YNCROTdz/OFaplkJqYwI7RFwv
	 QU96TbEQnQwmW3o1TSSuckWDS2MHztwMzTREqHcgd5hd9KGAi9QY5n2BfzKSN40T9VSh6
	 znRiYFUiD8PKier87zwSvJw4LeNKiN1Uqm8iLvw5OhxQEcaYljM4oEFf7ehFU1IaAbIZ1
	 ejSPXS1Ij5DEkBHDyRkP/KMb2kZTnCZ/8t7OGcYAf5izz+A6pNwrJacB9LIP/MsvsWZm2
	 VA18bg4NfQjOM6uhRW/rpLrMBjC7rKD93EvJNyirK55njtqp6a6uQ8OUjh7Xr8Y8dAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=modelmiser.com;
	spf=pass smtp.mailfrom=modelmiser.com;
	dkim=pass header.d=modelmiser.com header.i=@modelmiser.com header.a=rsa-sha256 header.s=protonmail header.b=O03VjtsC;
	arc=none smtp.remote-ip=185.70.43.98
Received: from mail-4398.protonmail.ch (mail-4398.protonmail.ch [185.70.43.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C57B1606A32E
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 19:36:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C57B1606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=modelmiser.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=modelmiser.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=modelmiser.com header.i=@modelmiser.com header.a=rsa-sha256 header.s=protonmail header.b=O03VjtsC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=modelmiser.com;
	s=protonmail; t=1793993774; x=1794252974;
	bh=6xTKEOGFRLXidPHrCfmBqE6GgEsv5eOpzmihaPx4Isg=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=O03VjtsCY5bZQorTEx3GDBoMlcCM6LY58ixfoMVronH0DkRdO5QEQKeUEIrKPUG9F
	 9QSU5u2Uf5kj1iS8sVpiOJqaNi4MMCJJcMWLZrHdwiBlaMVUA+3peZK2NIzGL+4cVH
	 fPmeuoE8Cuy3oSNiWZp2s5+EpWpByvVCFEsYLZUus/HQQE/tPSeZIkk6KvckFzVS0t
	 I0a8vUQm92JcXmgL6rhSNTHwEVBx0jYgsHcpBqfSmcyGo5NBRWbFx/AEfUpMynt3jO
	 1eS5e4kWEKsOXLWOJKETZcbLO2siyrGhaF63fqHuAJLeqZv51CYYaIgNz8pvCPA1al
	 Sq+JmjylcG7tQ==
Date: Fri, 06 Nov 2026 19:36:07 +0000
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
From: Chad Aldreda <ca@modelmiser.com>
Cc: Johan Hovold <johan@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, driver-core@lists.linux.dev, linux-media@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] Documentation: devres: warn about device nodes in managed memory
Message-ID: <20261106193600.3267465-2-ca@modelmiser.com>
Feedback-ID: 232753253:user:proton
X-Pm-Message-ID: 9b7570ea9211575eca35ac2ab2eedd2b8679507e
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

devres entries are not reference counted, so managed memory must not
hold state that can still be reached after the driver unbinds. State
that rule for its common case, a cdev, miscdevice or video_device
embedded in devm_kzalloc()'d driver state that an open file can still
reach, including the v4l2_device and media_device that v4l2_release() in
v4l2-dev.c reads on every close, and say where each kind of node frees
its state on the last reference: the struct device release behind
cdev_device_add(), per its kernel-doc in fs/char_dev.c, and the
v4l2_device release callback in
Documentation/driver-api/media/v4l2-device.rst. That the video_device
release callback runs first, and must not free the shared state, follows
v4l2_device_release() in v4l2-dev.c, the video_device's struct device
release. A miscdevice has no release callback, so a kref, with its
ordering against misc_deregister(), is spelled out here; it is not in
the miscdevice documentation. An embedded media_device is also reached
by media request files and the media device node without a v4l2_device
reference, and has no reference count of its own; the text says so and
leaves its lifetime out. The point that unregistering does not close
open files follows the cdev_del() kernel-doc. That an open through a
cached inode can still reach ->open() follows chrdev_open(), which uses
inode->i_cdev while the cdev has references; the same kernel-doc says
the cdev can no longer be opened, which holds for a new lookup, and for
a cached inode only once the last reference is gone.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Chad Aldreda <ca@modelmiser.com>
---
 .../driver-api/driver-model/devres.rst        | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/Documentation/driver-api/driver-model/devres.rst b/Documentati=
on/driver-api/driver-model/devres.rst
index 4f0b90e7e1..6dc6ab261e 100644
--- a/Documentation/driver-api/driver-model/devres.rst
+++ b/Documentation/driver-api/driver-model/devres.rst
@@ -208,6 +208,42 @@ Lifetime of a devres entry begins on devres allocation=
 and finishes
 when it is released or destroyed (removed and freed) - no reference
 counting.
=20
+Because nothing counts references, managed memory must not hold state
+that the core or the driver's file operations can still reach after the
+driver unbinds. A common case is driver state in devm_kzalloc()'d
+memory that an open file can still reach: state embedding a struct cdev
+or struct video_device, or the v4l2_device and media_device a
+video_device points to, which the core touches on every close, or a
+struct miscdevice whose file operations use the state. Unregistering
+the node in ->remove() does not close files that are already open, and
+for a cdev an open through an already cached inode can still reach the
+driver's ->open(). Allocate such state with kzalloc() and free it when
+the last reference to it is dropped:
+
+- for a cdev, from the release callback of a struct device embedded in
+  the same state, with dev->devt set, and added with cdev_device_add();
+  see its kernel-doc in fs/char_dev.c. ->remove() calls
+  cdev_device_del() and then put_device(); a probe that fails after
+  device_initialize() calls cdev_device_del() if cdev_device_add()
+  succeeded, then put_device(), never kfree().
+- for a video_device, from the release callback of its v4l2_device; see
+  Documentation/driver-api/media/v4l2-device.rst. The video_device
+  release callback runs before that and must not free the state. The
+  v4l2_device release callback is not the last access to an embedded
+  struct media_device: media request files and the media device node
+  reach it without a v4l2_device reference, and the media core gives it
+  no reference count, so its lifetime is not covered here.
+- a miscdevice has no release callback, so the driver counts the
+  references itself, for example with a kref that ->probe()
+  initializes, ->open() takes (and drops again if it then fails) and
+  ->release() drops, and that ->remove(), or a probe that fails after
+  misc_register(), drops only after misc_deregister() has returned.
+
+In each case, dropping a reference is the last access to the state by
+whoever drops it. Keeping the memory is not enough on its own: file
+operations that run after ->remove() must not touch the hardware or
+other managed resources.
+
 devres core guarantees atomicity to all basic devres operations and
 has support for single-instance devres types (atomic
 lookup-and-add-if-not-found).  Other than that, synchronizing
--=20
2.43.0


