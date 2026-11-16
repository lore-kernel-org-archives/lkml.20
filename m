Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.136.65.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794846782;
	b=FOsj4VZFVDDcuwdBwsIZmjBr2uiEGXVVQ0CUhHY4MtBE1PToAdSgQaPcjugVed2LJZm8
	 mwW42NjTR1l9+kx3y97q+tPuH9D/zOMCP6HzJYxv3rGn8Qw88LPD9hwuB0MnKCwe2n8py
	 KWZMd/XdDjCkklIFLKG1gA3SycfCc01XR31gUgYIharPep78ynKb6B/YyYlX3ANeousnf
	 YMabw+9FWuXhot6j7L+CWMHMnDwxr//lUOInlKALXnWb6a3qWn8Q7ciOl9Qxz688ifAV0
	 MqzgK2fOkipb0BhkVf6+vspgGku0wnukrxL8om5bdj7HTnXJOKhcwJO3vvX/E30/9vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794846782;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:MIME-Version:Content-Transfer-Encoding:
	 X-Flowmailer-Platform:Feedback-ID;
	bh=PTCezzwhXegCp0HN9dhFnxMs6Dv4psl9EH2T3b5OSj4=;
	b=fce+cS+jHJSjLvIsh4gsuzsM1m54aoda3UjnQmfXSDDLSpn6lPJDhnB34AAGc1vZd2j5
	 oSIRQ4pVK2YZzS73TcnveUhH1AKN1wp+6TcWk/l22N3rSLs4td6sVPYNSOpnu1wlF2F5i
	 ljLe6UNa4S5eGe5U3TdFMdfZbFBCrDmuaS0Kw3JWAOYjTu5yHurrxihYMw5qSp3FMAs2j
	 dpM/KQgZpb9FqbyAiKK4vq3a8rM0CFTS/vp9zCgPYsF8iwlfXsbz0Z4dHHom6YMasSrAF
	 QqvYBEo2PSMhmuHVU560OWGZjZ2T64tw1ek23Z4e2KO4vTKm8pKETyfIZceZyxLI1Vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=siemens.com;
	spf=pass smtp.mailfrom=rts-flowmailer.siemens.com;
	dkim=pass header.d=siemens.com header.i=benedikt.niedermayr@siemens.com header.a=rsa-sha256 header.s=fm1 header.b="N/yTmj+M";
	arc=none smtp.remote-ip=185.136.65.225
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40DB606A322
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 16:33:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D40DB606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=siemens.com header.i=benedikt.niedermayr@siemens.com header.a=rsa-sha256 header.s=fm1 header.b=N/yTmj+M
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 2026111616325778658a594d000207ff
        for <linux-kernel@vger.kernel.org>;
        Mon, 16 Nov 2026 17:32:58 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=benedikt.niedermayr@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=PTCezzwhXegCp0HN9dhFnxMs6Dv4psl9EH2T3b5OSj4=;
 b=N/yTmj+MkPW56dBM/sVQUibhcIccnpYeh9j2wIYuxOkVUIzyX/xJRTUlHPNe/u1dL6uWc9
 C5Z/HdD0d1vuwFTddmLq50SSnNEFd+t/loROR/4FoTKsV12mZpVkc3PujZWOACruvMTKvIg4
 N79KDlE3gjy+eV7GsFY1BvMbU8i2o8Dka0qbcm8fN/zcGrhaqxZbscE9qioAS4Jg/Ih2H8lq
 knHqqMaZrfSNIFMmTVAQEg6wKNDI7/OMyPynGzQCcA9icblFHjS3gGQ6kA4HexX4yzjZ4NHa
 4OxEzJo+8c2Cr3ugblOi0gIEptWKuxThc9tYsp9utIrsJ2PD11TFImwA==;
From: Benedikt Niedermayr <benedikt.niedermayr@siemens.com>
To: benedikt.niedermayr@siemens.com,
	linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/1] hwmon: simatic-ipc-ec-sensors: add BX-54A EC driver
Date: Mon, 16 Nov 2026 17:32:56 +0100
Message-ID: <20261116163257.1303207-1-benedikt.niedermayr@siemens.com>
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
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1323861:519-21489:flowmailer

Hi,

this patch adds a hardware monitoring driver for the embedded controller on
Siemens SIMATIC IPC BX-54A systems.

The driver loads directly via ACPI "_HID" which is reserved for Siemens.
See commit for more information.

I'm not the original author of this driver but I reviewed it as carefully as
possible and I would step in as maintainer for it.

This patch does not enable the hardware platform on which this controller is
present.
Instead I just routed the enablement through the i2c tree, which is currently
in review [1].
I wasn't expecting the review to take that long, so it's maybe better to route
the platform enablements through this tree instead... I dont know...

[1] https://patchwork.ozlabs.org/project/linux-i2c/patch/20261116142351.1228943-4-benedikt.niedermayr@siemens.com/

Best regards,
Benedikt

Benedikt Niedermayr (1):
  hwmon: simatic-ipc-ec-sensors: add BX-54A EC driver

 MAINTAINERS                            |   6 +
 drivers/hwmon/Kconfig                  |  11 +
 drivers/hwmon/Makefile                 |   1 +
 drivers/hwmon/simatic-ipc-ec-sensors.c | 568 +++++++++++++++++++++++++
 4 files changed, 586 insertions(+)
 create mode 100644 drivers/hwmon/simatic-ipc-ec-sensors.c

--
2.43.0
