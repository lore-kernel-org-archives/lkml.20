Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC7614A1DF3
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 21:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789679999; cv=none; b=Mz/vCesEUzDjPmqQiRTX4kj/FmB/cm0RXeFpqw7t9C3VWKU5qx2YjenUdtj6lsLbFOI3FdXKa3f4eqXmmaEvmRKY/Sto95QW2l3vEaI/UmqxZmiyHqLXYPA29/Er1BhqyKJ4D2eWIREsbsv/9FAJeLNxxSLPzXAAVrb61Zhv5I0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789679999; c=relaxed/simple;
	bh=Nud/csu0oALfIk1in+qukSgwsXbRJOhFLKs42ieJzoU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sqlNbycr3RQJn6n2a3m03Ti5G5ssQbrGidBwxTg4EQxh3a5DEMtTtMg7epNNoV1K7hLwJ/U53/XQ0sqSmDLKq4lceOVu49LwGzdtWprGs6pDmGlm1xD/LA1K/dZffUlRnLqE+hEJ03DafEvJl1ZmKqp8fj/CZn3p9hWWIo1UTlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems; spf=pass smtp.mailfrom=starlabs.systems; dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b=yWQ/8B49; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b="yWQ/8B49"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485933b24c3so16192f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 14:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-systems.20251104.gappssmtp.com; s=20251104; t=1789679994; x=1790284794; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mAKu+XW/083rrHRSYL83FHRHaXFQr80wRG7HvCbx4Qc=;
        b=yWQ/8B49TCOtompHhU8h6uE1Lzln68IhfC92B4TkZ9O0kGtAAfAlf4J09K41+5vWxc
         BsD/z4lM0USSvtv3l0xLSOENtrYC+Ge0TiHKs1wGYSgI+Fc1XahAxpiV/1+x1sXid5Bu
         95QGJSNgRUgjK5u3E4iCpym/9d5o5Jj1Dl6dJBOk6yxWOR5+UKSD2ymjtJBgAl3FZ+OI
         VnffBDNyjfh5gJ0qApaZTmMq+5YtD9Jcd3CO7ni+EnPETdrQTFXvsukn+iMBf47Z5dyX
         cDtuZ488RD5T6Kkk2m+qFiQ3M7JnF8O7P0QHd5eDEgLFwVzFoRpHpJ/kTpJYDP0067oM
         EiqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789679994; x=1790284794;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mAKu+XW/083rrHRSYL83FHRHaXFQr80wRG7HvCbx4Qc=;
        b=C/K2KCo/PDPm3rBD0UMu+PVGPJpU/XVoljXRMC0yhijkIzN/hJKM0RJ+lEPyaVgZdO
         yIXi3e4G8f+Ub8JrswtYJvNz/88V32W2XgRVzq4ZDFwm2NE4JsEbi4L6MQ7OfcW2WBHc
         8J0hyBzJktpFjSXTgWie57unIRzCqZSX/RqGv7hT4vqsQWarWyJszVOmgyFSFiG9kJST
         o1OcFcoRfwKKf4Dlv5PeEc3jhciUAol4I7nnkI3fywazpPUjNjGkJce7cLai3JvzjW1Y
         lvgMhd3OlDmjLc8MgNMH9C5YR6DHUQd6/Hdycav/Bd/EKlBESu8rRoePhyDqYrCxUNQt
         pWIA==
X-Forwarded-Encrypted: i=1; AKwUvByExRKW4V89ea+HtjRtHdeKTNRhgY/xdGq7MPdTA2pGQwJNQTh5P4AGiQCPo7gmyZOfekzqyzCTlKr3hko=@vger.kernel.org
X-Gm-Message-State: AFuF++nrjBiXXUbDjDaAEr5o5SwjxWAK8mR9NJYgxrk4LyPvSncTfg4b
	uM0hX9lbqjvpH2iPNvIy1QyT4LPxyWB08agmL5gMI89ipdNVFQHYGXWXKOKruzd9Xw==
X-Gm-Gg: AYBFou2ebTm7NZm+s1vHgP9mFO4fEIQnsA6fU8zkoHA/v8UgPTCnk6TSADyfUnLBvdR
	GTuYhTk3cNJt5+xd3yNwpsybKLyCj7uF7ivMquU7WCRRiFmKwdQiPSo5bt+WBtN6ScHVpaWp6iP
	7OKGG6pll3poDlz/h97nhCoXl34mH9aykSrBSkJYzJOE5VcUMhd+TlwKRvG0hpDLSIkZZOQdtH0
	8PdbNZRXokw1/SlSt4r6BB7aTXRZfLW0DAIR9SS85KIWN6G7oLgutm2Gvhcpoy4fJnV0Xn/ymSa
	dY8r2FmxsaeqccD2FHc1F+aeSagppmUxH9VENRbi7ekQYw5hr94CU9VI7AD2KC/uh5K9E6JIgwI
	YBdl7sSX/S3cyz9GWvGwsU903rCwGBuJy9x3RWsy28275qEpJtFCG3DB0rjksvBhIbger9e92vV
	GDhONfE4Ps6tNgdjLH6cRPB1/B5Q3dr+KpFzvkUswtWI47ZkvSEzE/pC43zGWoCu2FkQOy9Z8pD
	bzw3aRDhs8BxmcZBzMR9iqEJbD7UxCheZTL3A==
X-Received: by 2002:a05:6000:70f:b0:487:b50:101c with SMTP id ffacd0b85a97d-4871e215a94mr246855f8f.5.1789679993956;
        Thu, 17 Sep 2026 14:19:53 -0700 (PDT)
Received: from fighter ([217.155.46.38])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf1f6cfsm19086828f8f.13.2026.09.17.14.19.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 14:19:53 -0700 (PDT)
From: Sean Rhodes <sean@starlabs.systems>
To: linux-bluetooth@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sean Rhodes <sean@starlabs.systems>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	"Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>,
	Xu Yang <xu.yang_2@nxp.com>,
	Kees Cook <kees@kernel.org>,
	linux-usb@vger.kernel.org,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	linux-kernel@vger.kernel.org,
	Paul Menzel <pmenzel@molgen.mpg.de>
Subject: [PATCH v2 0/2] Bluetooth: restore powered-off Intel adapters
Date: Thu, 17 Sep 2026 22:19:50 +0100
Message-ID: <cover.1789679980.git.sean@starlabs.systems>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ACPI-managed internal USB ports can lose power while the Bluetooth adapter
is closed. Intel controllers then lose their RAM firmware, and btusb's lack
of a reset-resume callback causes the interfaces to rebind.

Preserve the binding only for a closed, fixed Intel combined adapter on an
ACPI-power-manageable port, then rerun Intel setup when the adapter is next
opened. Other adapters, and resets while HCI is running, retain the existing
rebind behavior.

The first patch fixes detection of ACPI port power management while USB ports
are being registered. The second adds the restricted btusb reset-resume path.

Tested on a Star Labs Lite Mk IV with Intel 8087:0aaa. Three Bluetooth off/on
cycles reached ACPI D3cold, restored the same hci0 without a USB disconnect,
and discovery found nearby devices after resume. With Bluetooth powered off
before S3, the controller also reset in place and powered on successfully
after resume.

Changes since v1:
- replace the open-adapter remote-wake policy with closed-adapter recovery;
- split the USB registration fix from the Bluetooth change;
- restrict recovery to fixed Intel combined adapters on ACPI-managed ports;
- add runtime testing covering D3cold, discovery and powered-off S3.

v1: https://lore.kernel.org/linux-bluetooth/48576c0c4615c9f34f44935216e63d48518f9d46.1785838429.git.sean@starlabs.systems/

Sean Rhodes (2):
  usb: core: check ACPI port power during registration
  Bluetooth: btusb: restore powered-off Intel adapters

 drivers/bluetooth/btusb_main.c | 33 +++++++++++++++++++++++++++++++++
 drivers/usb/core/port.c        |  7 +++----
 drivers/usb/core/usb-acpi.c    |  7 +++++++
 drivers/usb/core/usb.h         |  6 ++++++
 4 files changed, 49 insertions(+), 4 deletions(-)

