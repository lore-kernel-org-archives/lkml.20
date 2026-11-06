Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793972394;
	b=zoJ9nwGfDesaxiJIdpQ3qBcSVutG0caND/iYbQyHSVDDbPxRrV8uqUAnbIkIy9AVGoR0
	 UJskFH+Nio/TsIW2C/d3ExT7xBT73SPD01vX8tPQPr7vpf3eJ2pUPbXeEikPUX1pbbmpm
	 Ou3eIL3k1XSACTT3cijvO93v8vIeqWNvag/wWCpG/3yypPH/Nv1r9sp4Z/GDGgYuZY31E
	 IWxrLS7jc+QABLhf6zoCj28g7grr5b7C+wFRMB+CvF7xWNowDVFVvVbxpOIoi6dzqiYhV
	 AdSBbdKtZ/uuXvoMAC/Pyiji//6Z0hKrhEK71rUL7yu5cmIhcFrToGkBLUYO4H5af/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793972394;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=gksl1zKtJ6ElB/cCgmRYVsXG0BSiIoZ0y9Iw57/Ebq0=;
	b=oetke8gIkxWgPXikjRaQDpgfIcuVgWU/0wTAT9yjFYCmEE3pR31fdIEUKwTKQX1lnPi8
	 tORjUM89CyhvvoiqMRzIyH88ySfsPvQD7KIYn8Em8c082Ukssj+jwF06qMCS2Qqt1i8EN
	 KNefvnMfpDzUoko+YVbw9lfl0anV1idq1unzbP6zcEFEKYrRi/jdsjpogpfpNuCq1YxiP
	 mQsTRQiBRXa2ANcCeBjLeCzw1eg+klOU945kpJvXmh4T7zv5UMyn+UDbtQMPksM6uYFSJ
	 9ahsbwD4PrKEkZnzSer+A/B10WN4r9DMSVntVTvoVA5W3RJDX6fLIq1V8PnBwiLfYtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MIlOWJJp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B37606A326;
	Fri,  6 Nov 2026 13:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MIlOWJJp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B50091F0089F;
	Fri,  6 Nov 2026 13:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793972393;
	bh=gksl1zKtJ6ElB/cCgmRYVsXG0BSiIoZ0y9Iw57/Ebq0=;
	h=From:To:Cc:Subject:Date;
	b=MIlOWJJpI0AvPlj6OewVU3IebPRBlGx3nDIdYJiJ/c2oIt8M8J6OFcGfNwxlFrKIq
	 Qfz5IXZQ2KOG7QnO7JiYJJ3eH2HiJt01VVNu9N8OAHmDq9xdb0r+n4UgDeBkOWCGCR
	 ynpE975mCntWji5jA07s4L0XdFLjCeuylfPTYCFbCjqakDtB+uAH3mWpYjuflPrHaN
	 Obltdf4QAvQjJYq0HqH23ss/1C9eJxdJLOonrnqse3zLBk9emoJ+CIcliQTEY4Jtum
	 /HOaV3pN967DZVyldk9iUhsxNZ8GzaWgwwpvPJPw6XqlXceAjaQ7+VBYD6p3hBgWyC
	 OvWAmPYU645eg==
From: Joshua Crofts <crofts@kernel.org>
To: Peter Chen <peter.chen@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Bin Liu <b-liu@ti.com>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] usb: remove redundant pm_runtime_dont_use_autosuspend calls()
Date: Fri,  6 Nov 2026 13:39:30 +0000
Message-ID: <20261106133933.1577-1-crofts@kernel.org>
X-Mailer: git-send-email 2.43.0
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

Since commit d1706f9da9f4 ("PM: runtime: call pm_runtime_dont_use_autosuspend() on reinit()"),
driver core is now responsible for undoing any
pm_runtime_use_autosuspend() calls on driver exit.

Remove the redundant function calls.

Joshua Crofts (3):
  usb: chipidea: remove redundant pm_runtime_dont_use_autosuspend() call
  usb: musb: remove redundant pm_runtime_dont_use_autosuspend() calls
  usb: dwc3: remove redundant pm_runtime_dont_use_autosuspend() calls

 drivers/usb/chipidea/core.c  | 1 -
 drivers/usb/dwc3/core.c      | 2 --
 drivers/usb/dwc3/dwc3-am62.c | 1 -
 drivers/usb/musb/musb_core.c | 2 --
 4 files changed, 6 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.47.3

