Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 277DC3BADA9;
	Tue, 15 Sep 2026 12:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789476035; cv=none; b=CEZh9NkeRUSDCUm+Eu1lGpg0Ad08nCAvJO3TWM2q3btpM7hVC7WYZ7DyPYWuhy37JBzqi0CZ6f2T34ubGJ/iQOZkjN2U4mRVNfsIGyRgg9lFj3FXU71ue4oS+cvc/GWDj4m9gpiWjsx4GoeLwy8sorNxie7G6k+PwSUYIitxEvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789476035; c=relaxed/simple;
	bh=lRz+zsCQ3j38/sR2mdN4I+08VnJc4tL/zc8Umhhvga0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QegsJMaMx1vGM+WmgeOo6y390skx2Cs+Ws2Ul12aOiB3ed2HmBR0vfqLCl89eBQQMOhy7zIVOo8OmOxERkRnwS8wAl5r+y9MH4+NDglVkUhuiqd49luf77q3rbVG8DQVEEeCk4YXfOCBXrsvCEPyslawoX8R3gaSc1nAUDPhTBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EY3vUs64; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EY3vUs64"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB08F1F00893;
	Tue, 15 Sep 2026 12:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789476033;
	bh=fKOeAB35kxH5Xu98XeB0c0hoqHO67MF5Lsx29vYtXSk=;
	h=From:To:Cc:Subject:Date;
	b=EY3vUs64DvcIax/ZFoGDJCyofOc/4zFFiOlLd26Lb5dUqckzAWoUbJ24xKmtPGrSu
	 nKBKENya2wAJWykU7n/i9qhwk2IKEW5PcWLI7L8S3iBBuGl4LtVT3ZZgm5r+uwSSz7
	 Kg80FAMx2chvJ28ODvVImKkpb+7ROBjPDjozJRGWTgNxAYCC11iNly/s8+NVrX6v4y
	 xvDLT9caX3bNdqdzJBiXCsT5fQuT1jHPzpZsZxgyr2zx+W/waJGdsVEDXHF+zS9MbB
	 LW9ZQfa+SBksBwG+Zu0+h6LlArcodkpumIKUmfYcglrpiabDroRqCTLxr929D5uADl
	 xtwiWwDLmMztA==
Received: from johan by xi.lan with local (Exim 4.99.4)
	(envelope-from <johan@kernel.org>)
	id 1x6SSc-00000005fOn-1Opy;
	Tue, 15 Sep 2026 14:40:30 +0200
From: Johan Hovold <johan@kernel.org>
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bill Pemberton <wfp5p@virginia.edu>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] USB: serial: quatech: fix baud rate overflow
Date: Tue, 15 Sep 2026 14:40:10 +0200
Message-ID: <20260915124012.1350748-1-johan@kernel.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The two Quatech drivers are using the wrong the type for the line speed,
which prevents speeds above 65 k bps to be set.

Johan


Johan Hovold (2):
  USB: serial: ssu100: fix baud rate overflow
  USB: serial: quatech2: fix baud rate overflow

 drivers/usb/serial/quatech2.c | 19 ++++++++++++++++---
 drivers/usb/serial/ssu100.c   | 18 ++++++++++++++++--
 2 files changed, 32 insertions(+), 5 deletions(-)

-- 
2.55.0

