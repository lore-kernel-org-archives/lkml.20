Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793588654;
	b=W6a9u3i2fT/9vLy2EDdoTAbBF5JSqjOhm7ZxZINl16G99iAIoxPE1zo9F7KlP6itgDJm
	 mmD1eokF8DW2xdAMldq3fEyugedp8TCzsb54fqqZjD22sKxNWglcdRbQ34ENUTncfngBY
	 rrJ/CxE1rDIQTYY9CP/HcjNDepXjOBTrXYfmIic99mxTb2FVj6RDvMSscaLfPlUtSiFxW
	 ZBybOZpLmF2J/NtnT5IIAz4U8MRatOfrYA6nBC/vFq3QXA5qIccI/cmU+MLvSAVnMkzh0
	 4i+eCZ+d/EaTVoABEfck9bkgtYTQvaQRlu4NETJB7uRArjCFzyFZxDYeJmXYJ2pzoAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793588654;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=+BDDKc4Fo82TfQu52UTaHwsZp5Jsbne7r5tspFIBGbc=;
	b=14xNLNpgSKgOQcW/mvSFjE+2HgxSlKvWPWPkEK9tnIj14qBzR+SITQzdFSOMHkuWazz3
	 YnwuNfWnbg23lnCAzLg4gMWJdjGe0pF3evW1xKG8M914iUPCT42nbZvUfwYkksruRRmYY
	 US6VjdOWLBosSN+BXdecBiEk072CbOdFPS+56pQgaoXtk/Q3GS3I+vQOArzxr4dVx/qW4
	 14QXajLnHtJHAQIcy4udC00pdQHa3Ef+ErI1vrBOLCVwPXjPfXyFfPOmKwmJBiJj2MOCO
	 /HciQJCdYxY8BtGsgQZqrjixA9H7EESv/NOKOj3OXRrdlbFpEzqP/c5I8Olv3IVfWdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=bOzWfDHK;
	arc=none smtp.remote-ip=117.135.210.5
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA19C606A324;
	Mon,  2 Nov 2026 03:04:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA19C606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=bOzWfDHK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version:
	Content-Type; bh=+BDDKc4Fo82TfQu52UTaHwsZp5Jsbne7r5tspFIBGbc=;
	b=bOzWfDHK0kLICbRKKRSqeeZKf6mlr7ZACHL4/Zc+q2I0L5MAEsZpg69xlVnydn
	ZaaoiOFyWayujne7hVAceKy1rVm48aIkmJ93ZLFaYp1SSUuBlZRsqUSM+47NfJuk
	AvhI9JvdKrzXWJFIvNdcjFsaWeGMWAuLwE7AzgBszhrrI=
Received: from pan-u.. (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wD3__Gf_edqwFRmEw--.60931S2;
	Mon, 02 Nov 2026 11:04:00 +0800 (CST)
From: RenPanpan <rppxj178543@163.com>
To: tiwai@suse.de
Cc: alsa-devel@alsa-project.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [DISCUSSION] ALSA: usb-audio: Card naming for composite devices
Date: Mon,  2 Nov 2026 11:02:51 +0800
Message-ID: <20261102030359.17222-1-rppxj178543@163.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3__Gf_edqwFRmEw--.60931S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU8xhpUUUUU
X-CM-SenderInfo: huss5yirxykkqt6rljoofrz/xtbC6QA8O2rn-aDp4QAA32

Hi Takashi,

Thank you for taking the patch.

The quirk entry fixes the ALSA card name — cat /proc/asound/cards now
shows "MAXHUB Speaker" instead of the generic "Touch Device". That
resolves the issue for this device.

I will hold off on the general iTerminal approach for composite devices
for now, and revisit it if more devices with the same issue are found.

Thanks again for your time.

Best regards,
RenPanpan

