Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794588189;
	b=AW4ok/tPSgzzTrh8tCl4wmwUwdgm0yOLWvnWwr3SZ1FzU6f9HqKBjoeQQJk1f9O4L4rz
	 kiwSOW00wxVJAEhRPtdie8B6zEFX4YsEiYgDMRARNXT1nx3Ra2yvKjG7ssEw4vCJ9ySRr
	 oY4aQVmtpIM+EMMrEzRnM/dG1ndnTr2Wcn4M1g2aee7m3+f3b4x33ZoZx+8b++GgoyX2R
	 j0kkfw9zZ8eAM9YElHUim+WH5xZ5S2U+Mi3N3BnTYFtGDc17gPlGQdiUZoDQjbyWX144y
	 F97fkt4DQBhUNihExI4Pu7KVVHooZKXnqrac9AlZXgLxomOJOrfNAEfYCVtrKQRFOHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794588189;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=SnFzLVm1GvghoW/dBPDDgRA2UDkluNzbcq8quImtAl4=;
	b=0RF+7KNIhSldm0Dd5kvo99TKNZrGpqwFmuz9zpd0u6MmqB3bEKqlNy893f8cX+waQluM
	 E0f3Ymo7BALxnc9dU/L/hoNlJVaQFd5l4jhiQe3nsYIZ/e0klDAR8K9V+LsWhnfoZSb+4
	 RXWLURHWNIaHkcBVOHGjkzDfAnlrGkIIfDj1YAwZos1JphO3WjDN47KGt64cLKENryrsK
	 36BypMzNw6qrBb2+ilzQLL+G/G7I7QWLuPmzV98jjnfV1UW4Iui1bfXSvPBCrrY/LKypR
	 RjAVCA1CRRDHYnLh0bkPTm/5/6iQGS8bcu+GJmZ6yP3YtBmu/JqVxCTF5EJSFLBmlIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=dQP6umtI;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C9B9606BCAA;
	Fri, 13 Nov 2026 16:43:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C9B9606BCAA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=dQP6umtI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794588180;
	bh=5StR20USj7POU5fRSI8x3oN7S+uN8BMA4IyoZGgatk4=;
	h=From:Subject:Date:To:Cc:From;
	b=dQP6umtIIwAmbZzP6eHDGMVKO5xri0zzOOHo9iExt4pg2AeVgOM+a78FhKVlFqmJg
	 30D2AIUYALe67zXY6XS3Dk+DNB0HWXd19dxruhi0YI5ptFV7wqPpWOo+ZiVK5zTI6V
	 7IBn742ADgcE/3MVCXOOWSRXB2ivWB0cO8ge3rPAD+LtmpJA5f6jJwM6DsT4mcGFip
	 CIH8kvNJA4Vexy/ALGrVtOMVSK6bRUvAQ4SbyXS8Fpb2DajXPCqCYVJeo2mmZVkxOw
	 qXa5+CT+n5w4FsTv1KDXJR4bYbRwZ0r11cZOVUlls5WNaWPLTzG5ZcCivd/dmdukLz
	 7nYlmjXpheVlw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A58EF17E0840;
	Fri, 13 Nov 2026 17:43:00 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 5EBE148002C; Fri, 13 Nov 2026 17:43:00 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCH 0/8] usb: typec: fusb302: cleanup device driver probe
Date: Fri, 13 Nov 2026 17:42:36 +0100
Message-Id: <20261113-fusb302-probe-cleanup-v1-0-e5c65a8c58c8@collabora.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQrCMAyA4VcZORtYOhjTVxEPTZdqRLrS2CGMv
 budHr/D/29gUlQMLt0GRVY1XVIDnToID5/ugjo3g+vdSEQDxmo89A5zWVgwvMSnmvHM5GcfJp4
 oQmtzkaif3/d6+9sqPyW8jxns+xdccVH6eQAAAA==
X-Change-ID: 20261113-fusb302-probe-cleanup-9b1adac8b81f
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Badhri Jagan Sridharan <badhri@google.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2099;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=5StR20USj7POU5fRSI8x3oN7S+uN8BMA4IyoZGgatk4=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGr3PhMWricC4svnKvTS2tg0vkCc5PP7Cehjh
 lVmxF8YRZjBKIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq9z4TAAoJENju1/PI
 O/qa/UQP/ikzBY69hDL1/IvnP0TAqILCxFn7k9y2QKA72u8dwBSq+q33/dqrbaNXI3CEAX8a5hh
 1CBp9LuHHh4o6r8qDebfS+YvEN+n8fFa/b6hSyFy7GeBv/0SpuK6S1N/i2HNouHQobibeWga8eH
 aU71ByrU3ZaS0nyyNR+7a2xkoXObAtliWPMgQQMcz6ymzqMtCmPpfRH9wPVzwhvtMZXu7QkPed/
 gOg2JNaB+8zIksdH//sTnnBnajyonFYh7umnvQs74YwMiT7aelZRy4zXNBoTUvKYxF0Je/IysdB
 8/yPJkruV1eomF12O+oBVzwoo0y2Vfxku0cxttNeVE+L9GLLwuZrKspsaLOb2AQRHASbfDz/g/3
 1ettxk1VxaV4URgUeprwa8UKHU0zVVs6ClUjtyAUp9CsvIuSw3lwDgg46g0AYpy5oEoy6VuDJxi
 Td5TEJhUrFvhtoHaCvxwciWn1mBoVRHOAyk8Qr4MlnzZnX1fX+zFmbFBmAqXXDKiUY2ytfpIqMP
 QJS3OBN1ks1hdm2m0rLc7h4HSJ+0QCMzwqaEgASScn/fqRpjn+oRn30ZfwH896VQKu08bIFQpLa
 DYn2Rf6s9I83/+tj8XVxJu7/kO6f7B8tB6Apo2EWZWzEgcjO/LsmXLg+yM2cUkARnckScL02nNe
 ipPXp1qQH6yduysTypSY4/g==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Move fusb302 to be fully converted to device managed resources
instead of having a mix risking leaks and clean up the interrupt
setup.

These have been tested for over half a year locally with different
Rockchip boards. I waited for [0] to land, so that the DRM HPD auxillary
device registration can also be dropped. As that series drags forever,
let's get these cleanups processed independently.

Note, that this first cleanups the GPIO interrupt handling and then drops
it completley. The rationale is, that the last patch has a (low) chance of
regressing somebody's system and having to be reverted. In that case the
custom interrupt GPIO API should be properly documented (as deprecated)
and we want at least the cleanups.

The series is based on 7.4-rc2 instead of Greg's usb-next branch (based
on 7.4-rc1 and still empty), which is relevant for the first patch as
older versions had devm_kzalloc() instead of devm_kzalloc_obj().

[0] https://lore.kernel.org/linux-rockchip/20261020072816.180-3-kernel@airkyi.com/

Greetings,

-- Sebastian

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
Sebastian Reichel (8):
      usb: typec: tcpm: allocate pd_list entries non device managed
      usb: typec: tcpm: add device managed port registration
      usb: typec: fusb302: Switch to device managed resources
      usb: typec: fusb302: switch to devm_pm_set_wake_irq
      usb: typec: fusb302: rename init_gpio into fusb302_init_irq
      usb: typec: fusb302: move gpio_int_n into function local scope
      usb: typec: fusb302: rework gpio_int_n_irq handling
      usb: typec: fusb302: drop custom gpio interrupt logic

 drivers/usb/typec/tcpm/fusb302.c | 160 +++++++++++++++++----------------------
 drivers/usb/typec/tcpm/tcpm.c    |  29 ++++++-
 include/linux/usb/tcpm.h         |   3 +
 3 files changed, 101 insertions(+), 91 deletions(-)
---
base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
change-id: 20261113-fusb302-probe-cleanup-9b1adac8b81f

Best regards,
--  
Sebastian Reichel <sebastian.reichel@collabora.com>

