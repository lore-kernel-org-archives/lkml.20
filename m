Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792514725;
	b=rPzo4TNbhUWJ9oqOvk84vbrqNEiQw2jF5DU/WFVollCqQTO2gyn1v3OLWIcHgN/v0qOy
	 PBT4MABG8BjAMvYK5oKbePq5nzAuiuP/xkUTyh8FWO57Ow3lXYO0+U7TRfQFqRaGmBqxa
	 zqKY+I0e2vwl0HtmZ3Lgud4m3scjMx9Djxhp9V2jKwgwLJtP103V6MA+RA2z7cIKo0ZPV
	 xmVjXS3AwxEfIBuUJPf7eqIu6Lx0/oqowl5CBkNBHR8q9EH2lkIGMmcHcaZjn909IOAwB
	 65O91d4/FH++KhAjbl5ks0o7bT/9mvgMmRpYxXIxkz2qYkI2jz2N5faYWJFglzKKw2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792514725;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=J5XvO9ED1PnQW6LvxI91yeoYZ/9/NbKN8AWis2OJ8FM=;
	b=mSEU7Talz9i2rnrlBQFXDannf5Wfev7smQEPWj05naJTwpcn3gulMy6MR7Dys7yGjQ0N
	 xQmlxs3+yETuj03JsYo+JY83aZML0jIj08bv7KDVYiDzSGzFqeNQyL4KK1Q7Dyn18x/G7
	 Pzg8VfsQszNueuDFFXHwaXuYEgtzAfus1IcytYUOLai6GtzXJ/qs9zcFejl/SjrgU6/xv
	 xppUxJouKq5PcU1c4x91MVx+RlSBHFDlFQVzZjPeh6Kug+dAc2C5EMdNctrX2Wtq6MGzb
	 7zYWMeXBnjAM39fZ2KKTuHEgxWFJH7jR2hBOp5Xkn1i8XAlZLpaW0I6EwLtqE0CZMqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HAbOUSyG;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C41B60A6F4C
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 16:45:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C41B60A6F4C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HAbOUSyG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792514724;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J5XvO9ED1PnQW6LvxI91yeoYZ/9/NbKN8AWis2OJ8FM=;
	b=HAbOUSyGnJ0uw/00mhxp9LRtdiA+HBsduaaxJe4vPSUDnpOllfsKBzOv/ZS9C4JygZg3eI
	dUwaAQnnUxLDnE+zscjjVOUsjLEob74a10aRNrZzuH598k0/dkNbzglf1wU+vK4+7i8IIi
	oCCjtHW7nVJFxJLBiy/5WLCvUJgO5CE=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-261-TlZSv--DMT2Duq_tJQJIEQ-1; Tue,
 20 Oct 2026 16:45:17 +0000
X-MC-Unique: TlZSv--DMT2Duq_tJQJIEQ-1
X-Mimecast-MFC-AGG-ID: TlZSv--DMT2Duq_tJQJIEQ_1792514715
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 61072195C25C;
	Tue, 20 Oct 2026 16:45:15 +0000 (UTC)
Received: from djeffery-thinkpadp1gen3.redhat.corp (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id CA14130002CB;
	Tue, 20 Oct 2026 16:45:11 +0000 (UTC)
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
	David Jeffery <djeffery@redhat.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH 8/9] PCI: Enable async shutdown support
Date: Tue, 20 Oct 2026 12:44:34 -0400
Message-ID: <20261020164435.80499-9-djeffery@redhat.com>
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

Like its async suspend support, allow PCI device shutdown to be performed
asynchronously to reduce shutdown time.

Signed-off-by: David Jeffery <djeffery@redhat.com>
Signed-off-by: Stuart Hayes <stuart.w.hayes@gmail.com>
Tested-by: Laurence Oberman <loberman@redhat.com>
Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>
Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
Reviewed-by: Bjorn Helgaas <bhelgaas@google.com>
---
 drivers/pci/probe.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index 27008e2ea5af..101a96718acd 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -1038,6 +1038,7 @@ static int pci_register_host_bridge(struct pci_host_bridge *bridge)
 	if (err)
 		goto free;
 
+	dev_set_async_shutdown(&bridge->dev);
 	/* Temporarily move resources off the list */
 	list_splice_init(&bridge->windows, &resources);
 	err = device_add(&bridge->dev);
@@ -2748,6 +2749,7 @@ void pci_device_add(struct pci_dev *dev, struct pci_bus *bus)
 	pci_reassigndev_resource_alignment(dev);
 
 	pci_init_capabilities(dev);
+	dev_set_async_shutdown(&dev->dev);
 
 	platform_pci_configure_wake(dev);
 
-- 
2.55.0

