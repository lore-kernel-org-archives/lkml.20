Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792514703;
	b=BEyMl5YeAB/LjgLrmMvpfkvxS+0KlOh2qlkm1YQ175JVsRyI7UcDDGik8mIlsfV+PIpl
	 lgli/i5Qe3bJijzobpJAd3/GtLgCNi4PtBYM2D61/yhDTGgQDtC4GdPbkaM2gf8y+GMGi
	 Gj54yWOcW0pfq0nNjAFGrg6ePPtMUffl2+jJpln7XqZuFxsCmolv7nHSI2cXxYXtpQrKH
	 REwkn+BtqAxmu7W3qtxS+HMAd+9/3ffvUbh8b45RmO63IHoyZehwTA/l6KKvWGFG6kfBk
	 bDjNMTDi9i2Ofo6ibLt0vYC+sb5ehbi1NjGvx3kW1CqWOXYTBUoHcihr8J7ZUbicSGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792514703;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=OLtaBWF2S8xYQupQu7qrCH159MdeXfdQdbvdeZt1vZM=;
	b=IwKR2ydnVQO1vLUFVpzvSut1C30coP812xqBQyuxMaU+wKrR5BTv8EwWBGCIQIXvQ+oc
	 pOzB7kWrB0ScC1E7yfj+CfLcXevr1dKzSI1x7FH23F2peS7+8uMN++ozXTHVAF1hHz3AF
	 vUT4Wp8VcawTBlAZELF9mTNKWr7dqT1GSFVtq8r1vWo6rbVkmAkOE7OlWz6SK4EXqSSU0
	 0Oq0DqyOaUAukV95BI0qawieunYVGndW0hm06Zc8KfS5+SPEpwqZwZ6NiqAFuhZOwiPwg
	 VSJmj4LYsvSfa/yDpxNIDh6Y9E+oMCtCZNmGxF1CGuRvQSJdvRj95mvjtu/H6W0s5bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IgYOHc2M;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7000160A383A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 16:45:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7000160A383A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IgYOHc2M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792514702;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OLtaBWF2S8xYQupQu7qrCH159MdeXfdQdbvdeZt1vZM=;
	b=IgYOHc2MqaoeI0o8r8BqfIQp3w0Mw41nQQcRlhCTX57xyt23p+e6lXHCtqFqtjAKTsHRlQ
	QLmV3m2BznDGwU2VDjhZUoMS8+KLb/RLlwMlkoYqMUWlGXWpcsTPKWYkSD+arw74+PNQY9
	ERN24uf8SmwD0jg49b5h2XRd9ZswAJM=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-615-3teFs58-MqKA_K66TtvFKw-1; Tue,
 20 Oct 2026 16:44:59 +0000
X-MC-Unique: 3teFs58-MqKA_K66TtvFKw-1
X-Mimecast-MFC-AGG-ID: 3teFs58-MqKA_K66TtvFKw_1792514696
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 496A61945109;
	Tue, 20 Oct 2026 16:44:56 +0000 (UTC)
Received: from djeffery-thinkpadp1gen3.redhat.corp (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 0F48D30001A2;
	Tue, 20 Oct 2026 16:44:52 +0000 (UTC)
From: David Jeffery <djeffery@redhat.com>
To: driver-core@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	Tarun Sahu <tarunsahu@google.com>,
	Stuart Hayes <stuart.w.hayes@gmail.com>,
	Laurence Oberman <loberman@redhat.com>,
	Bjorn Helgaas <helgaas@kernel.org>,
	kexec@lists.infradead.org,
	"Ewan Milne" <emilne@redhat.com>,
	"John Meneghini" <jmeneghi@redhat.com>,
	"Lombardi, Maurizio" <mlombard@redhat.com>,
	"Bart Van Assche" <bvanassche@acm.org>,
	"John Garry" <john.g.garry@oracle.com>,
	"Jeremy Allison" <jallison@ciq.com>,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	"Pasha Tatashin" <tatashin@google.com>,
	David Jeffery <djeffery@redhat.com>
Subject: [PATCH 3/9] driver core: warn should device_move try to move a need_parent_lock device
Date: Tue, 20 Oct 2026 12:44:29 -0400
Message-ID: <20261020164435.80499-4-djeffery@redhat.com>
In-Reply-To: <20261020164435.80499-1-djeffery@redhat.com>
References: <20261020164435.80499-1-djeffery@redhat.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

Currently, no device has need_parent_lock set and is moved by
device_move. need_parent_lock is only set by the usb bus and very
few device types ever use device_move.

Add a warning to device_move to catch should it ever be used on a
device with need_parent_lock set. The combination would break
the immutable relationship needed between parent and child for
need_parent_lock when locking and unlocking both.

Suggested-by: Tarun Sahu <tarunsahu@google.com>
Signed-off-by: David Jeffery <djeffery@redhat.com>
Tested-by: Laurence Oberman <loberman@redhat.com>
---
 drivers/base/core.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index bce555dd74f6..e8a62c8f0ad3 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -4705,6 +4705,14 @@ int device_move(struct device *dev, struct device *new_parent,
 	if (!dev)
 		return -EINVAL;
 
+	/*
+	 * device_move() should not be used on devices with need_parent_lock
+	 * set. Concurrent reparenting will violate the immutable
+	 * relationship needed while locking and unlocking both parent and
+	 * child.
+	 */
+	WARN_ON(dev->bus && dev->bus->need_parent_lock);
+
 	device_pm_lock();
 	new_parent = get_device(new_parent);
 	new_parent_kobj = get_device_parent(dev, new_parent);
-- 
2.55.0

