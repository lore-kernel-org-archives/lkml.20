Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A9D480DD4
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 10:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790936119; cv=none; b=Mn2P1FJwcjwGZoPv7LAWZ9e7PX1YvuGXzRWVFgbRTfdtIf591mmkisjloV2oLpITyYg3KYgEURDawStn6bFzK5MG959EymoOkj864iVMb2lTVVXvt7Od9ak8sty1TSzV5KG9FGXuk/d3bXQWZGuQXZD2tWRG+u2hRB00zyJjXT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790936119; c=relaxed/simple;
	bh=pTLaSLDRjdFZUmo2LOQFXFd/hb4XHH0ebppMkQK/InY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pRO0cFNnlsKBlIpTR4aQtfqWP4Viu+s/rHjiC7yYKlPZPt0FBClU+HFBVe+N9vTPSWpUTgGpreWThNnQqhtmFDcabb9JrnAjqSZUn57HyWkabOmF3TeLgfxybKAqEbniTlYDr9ILgEWchouzynH3Ihwr5ZQQJWU7LeMHI5Ioy2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lK1Oh/el; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lK1Oh/el"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41A0B1F000FF;
	Fri,  2 Oct 2026 10:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790936118;
	bh=nAeXOdWlJR8Wc4zjrO7mMgDhuXzh/GobOmkypTg4VEo=;
	h=From:To:Cc:Subject:Date;
	b=lK1Oh/elmPMu28qetsOcMS6qHF+ZTzjvGxd0/ysD3k4kAvCcfy6oxcXO8sa+MyFRB
	 YcXw6XZnKp5RwnQPIsDNps7+NRfBH99cxReyPl+cOLMsy6y4gq0Fnp7I2fk7MG/V2K
	 ODIfPLvwyd1gfube/broL0X6ZKp9cKNkhRI4WV9PQm8noZQkJ+FocoCsMm+hCZ4GCL
	 k9bYYtl2TlNDYCXOkTUH0+Eee1B8TGLcj/BnLBsaMhFymICNHhL1FgXp4Dyo1IKLaE
	 ZiYx5hOOT+clTcmxXtIDONHsHY3O8rSLGfoFdYupTafzTixUgCxy/AcetdBtE6ayNH
	 GnCNSyu7i0ZCg==
From: srini@kernel.org
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	Srinivas Kandagatla <srini@kernel.org>
Subject: [PATCH 0/4] slimbus: patches for 7.4
Date: Fri,  2 Oct 2026 11:15:02 +0100
Message-ID: <20261002101506.1084743-1-srini@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Srinivas Kandagatla <srini@kernel.org>

Hi Greg,

Here are few slimbus patches for 7.4, Could you please queue
these for 7.4.

Patches include
	- qcom-ngd-ctrl: implement disable_stream callback so clients
	  can cleanly shut down a channel before switching frequency.
	- qcom-ngd-ctrl: switch to platform_device_set_fwnode() and
	  drop redundant dev_err_probe() calls around devm_request_irq().
	- fix typos in comments.

Thanks,
Srini

Bartosz Golaszewski (1):
  slimbus: qcom-ngd-ctrl: use platform_device_set_fwnode()

Hemanth Selam (1):
  slimbus: fix typos in comments

Pan Chuang (1):
  slimbus: qcom-ngd-ctrl: Remove redundant dev_err_probe()

Viken Dadhaniya (1):
  slimbus: qcom-ngd-ctrl: Implement disable_stream callback

 drivers/slimbus/qcom-ngd-ctrl.c | 82 ++++++++++++++++++++++++++++++++-
 drivers/slimbus/slimbus.h       | 14 +++++-
 include/linux/slimbus.h         |  2 +-
 3 files changed, 94 insertions(+), 4 deletions(-)

-- 
2.53.0

