Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09F5A53D9DF
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 14:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790086954; cv=none; b=A9qkLE0cmbqCCmB/UjGCHqAbjzU8GZ3Z/IOV2SkL8bwbHOeVTotaKNoHAqxokiCcQH3R7+z77UzNLFWKAvNXaD6DgzckfF6rzTGciPv+qmbHnUp6yPwFy2p251xfhbnmFsh5k+4fArxqZiA/yxMvtl1a2nmBlqwXQorZU1Gwin0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790086954; c=relaxed/simple;
	bh=sa74+Aly9BHjmvFsKB2kZ4XZplxfAqWK9AmNDrpMnWI=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=cWyrVRarxgx0Bh6Dg0Mkqz3mTKTyNB5ve8aqZafUrCA53jeHRN/fayXOPXbYTFXmdgw3H+SyxRmaXIEDhMHOTQghd9zMeGIwKMc2rLsaF9YWTakO4/RPfHlZpTFAKZ/+U9gR2UCeDhRN0PybU4iEGRUeD/PxO9vGAhuHR4pzhPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=iO+TEuz2; arc=none smtp.client-ip=212.227.15.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="iO+TEuz2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1790086941; x=1790691741; i=markus.elfring@web.de;
	bh=sa74+Aly9BHjmvFsKB2kZ4XZplxfAqWK9AmNDrpMnWI=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=iO+TEuz2zRGkcGXk+tWodsJBv2gTyzQVpNow4wVq+Ja++ckGZaWfF4n9sQdtJpNi
	 VHz5Z+UeZtqDexU7BuMmmGxR6eFH9D251w4AFVHN2fqTbSyHqaJBBo1YuUmDc0SjH
	 n4qJIs9xD8S9bKce64kQJOqb07KFsbjft+9dahSGGk+gjs9HeijXSGzaZUY7seYrj
	 kiK+bLczWJa0kQlUTyLh9mcmgk/o3wJxa6SlK0nUlU8wbVq2iH1ZS2ED4s5kjv/ED
	 dZvX3ESq6Ichs156QvFO3R1XNw82sJ4KT8uNuyZDIIj0v/Oz+ujEXBBGjrmXSBKNy
	 dalQfY/ZwFQpqo8pag==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MW9vi-1xFBH50U8I-00NzvG; Tue, 22
 Sep 2026 16:22:21 +0200
Message-ID: <ce9aae9e-bb67-430e-9e2e-83b27265f489@web.de>
Date: Tue, 22 Sep 2026 16:22:17 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Triet Hoang <triet.hoang.dev@gmail.com>,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Stefan Wahren <wahrenst@gmx.net>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20260919034840.28593-3-triet.hoang.dev@gmail.com>
Subject: Re: [PATCH 2/2] firmware: raspberrypi: Clean up local formatting
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260919034840.28593-3-triet.hoang.dev@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:rOBOT7Xz7yAUillFjWpoC2HN2qfl5BhwmTz09BUDjSUDJOYzTG5
 q5jF9JedovkOOntyoFE/hS14bsq9BY3q63DoDRZuY9/ZxiuvK0KG7WAbCvLwhRd15IOvCTQ
 Vn1pqY6rEfy7fA2+w5zM8z2m3oQJwpTnt09I4SkqVDvIhOSS7LqaKw5PhRCEulJk1j8R0rY
 ZFSHo3iSCjgzyh7uH5zBQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:LgImieF/e7M=;PQqnVqV3rxHlYvTqS8xywpWF4V0
 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
 niN3YkaOkM=

> Add a blank line after the local variable declaration in
> response_callback() and fix the indentation of the UINT_MAX return in
> rpi_firmware_clk_get_max_rate().
=E2=80=A6

See also:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv7.3-rc4#n88

Regards,
Markus
