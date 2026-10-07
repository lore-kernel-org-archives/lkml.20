Received: from mta0.migadu.com (out-83.mta0.migadu.com [91.218.175.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A3373B27F1
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 06:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791355568; cv=none; b=TamxkWyCEWNmThx2VokNUWewTneYbCCkkMpRw7jrGXsqIuUd598/i2jVkwr2/ZTQoGCsbchTKm04x0JvI12jktkLQBxzJWMogd21IXNlUW8BT+7p3X85GdnSbYfybo6cVwQf7+doCfN2zOFLCzHGo1zTnPcTyjZx+wQXhMkMWFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791355568; c=relaxed/simple;
	bh=XWhmaHnF0F5r9vJ5hEE64oYYoigOB38AGVvirhYDhug=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BIAp8pNuTygicNEG5ABpSGl20MSRpKn+5L7RfeOUHz8D4DlqYCtekYoUwWGiv/KdxhVGrX5VzAFkeJ4D0x6eMkxPjgQ99PPDLg90EA9G+EGWph1AhcVSJcikR2caYTN6D05bi9tQZcdCjqCQffCVR3L+vxVCBaMD5P31AfFB2sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=RWn8iouf; arc=none smtp.client-ip=91.218.175.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="RWn8iouf"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=XWhmaHnF0F5r9vJ5hEE64oYYoigOB38AGVvirhYDhug=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791355565; v=1; x=1791960365;
 b=RWn8ioufDXtCVtv+AF0eM8oRinWFOPspa4v75LbkL4AxCfRWCadbBnzFHHi+LAVzCbUobWMa
 zqWiX9XLPctx8LtfIUXRdswLznV8C58nAtuW1aAPt1kQl6BW6qPEXvTXIZ1NimLsve9oCZQoH+B
 7vIx1zVpl7zWsMjdKNCxpF88=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id cb663b1c5ec3e0ed;
	Wed, 07 Oct 2026 03:23:49 +0000
X-Mizu-Trace-ID: cb663b1c5ec3e0ed
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5bcc04c71f5so4616e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 20:23:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxelvl8Qs/1tpVqJIle3GNBZvtSjz4pkihL/RdkQ98GxLz209LYigX4WyX+y7sokrTk1ZQb/BM2viJuqWE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLCEmdfEvmAcI+boOzEPg8AceTzLJlj4GsL/xesRTB5qH+gYjgN
	inSUYyzutjB4QlARVf8slROgN+2xodvQmzMui1eSkqTrxJrhIQZkpsXE9hhaaa0rxHpcWYfvauP
	niJMRmlFrq/5sm4eXhrIaNkKwTZKQE4ljTvES2qo/
X-Received: by 2002:a05:6512:608c:b0:5b8:caec:cc77 with SMTP id
 2adb3069b0e04-5bcca64059fmr230164e87.7.1791343424648; Tue, 06 Oct 2026
 20:23:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923180703.3901185-1-fuad.tabba@linux.dev>
In-Reply-To: <20260923180703.3901185-1-fuad.tabba@linux.dev>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 7 Oct 2026 05:23:07 +0200
X-Gmail-Original-Message-ID: <CA+EHjTyUqTzkGErfkvXeUJOpKwmO6AOxwFtUB_-Gtqo756WOvA@mail.gmail.com>
X-Gm-Features: AclHuK-Cmy6M2r-yI92GOlGoRqwijpnzBsQ4122ICX5yj9Fnvw3oxKt091GVXUU
Message-ID: <CA+EHjTyUqTzkGErfkvXeUJOpKwmO6AOxwFtUB_-Gtqo756WOvA@mail.gmail.com>
Subject: Re: [PATCH v2] PCI: iproc: Use __free(device_node) in iproc_pcie_msi_enable()
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Will Deacon <will@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>
Content-Type: text/plain; charset="UTF-8"

Hi,

Gentle ping on this one.

Cheers,
/fuad
