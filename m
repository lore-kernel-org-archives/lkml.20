Received: from out-2uec-a106.jellyfish.systems (out-2uec-a106.jellyfish.systems [63.250.43.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C400330C60F
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 03:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.250.43.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790997446; cv=none; b=bLlVjMymNmBbmuLkiiyMLZXJGf5qRKRx0O0lSLgCTWaXBrgbGORMIh0/alnnN43gY2rrXbc2Xwbx2vTsOfXz+mI70yuDQ2AvSFViYyeIRqmwq4GEQe1zktXNnJoRdYSWdpJgFLmiTE4UVRyWNYRVQD8LDcH5HWfV9GXvQHCDeVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790997446; c=relaxed/simple;
	bh=c1EEyyQTzobq36SM7xc1sOcMXaSCjqFEcMA8KzTKZgw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dX2iX5zh4Y407BUWCnDj6i9ImWO1jPVTB2JE4HEHOUSib3QxJnoVIM+xMOeZFdmWGMuOh1MqUXNr2VBdvhI/wy9yWylc7nmYVAMf8iax6d9Oitm/HzDpsSd/wd9wIll26nyF1UdbIpoJ00reNmvDQ9g+DwIHM7/hcm2rbfA2mwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=firmwaredesign.org; spf=pass smtp.mailfrom=firmwaredesign.org; dkim=pass (2048-bit key) header.d=firmwaredesign.org header.i=@firmwaredesign.org header.b=VyWpyw6m; arc=none smtp.client-ip=63.250.43.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=firmwaredesign.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=firmwaredesign.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=firmwaredesign.org header.i=@firmwaredesign.org header.b="VyWpyw6m"
Received: from mail.privateemail.com (unknown [98.240.242.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.privateemail.com (Postfix) with ESMTPSA id 4hxW6D6Wlgz8sWQ;
	Sat, 03 Oct 2026 03:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=firmwaredesign.org;
	s=privateemail; t=1790997429;
	bh=c1EEyyQTzobq36SM7xc1sOcMXaSCjqFEcMA8KzTKZgw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VyWpyw6mimSUGOi5yxCHLEI54zsUgFexT2vs7c0dwqs2Rohz1apvC5z04ERy9TqvR
	 gQrkr6tEyWfHFKu0K5ayUtD8nE9u86h/scmOWJ89umHd3PKurB1bVBm5vWI7f+sP+v
	 WV5nrzJe2SM2voxYssP4JqFDlc3Is1RzL0FKK3I+BN/KBEVoyCQO5EP3F+LHHDFVSf
	 J8j/DerTfDD2JUVDeQZYlkwxC1lXNTeqSiCminKfTWrrEAKcl7rrNgVeZXlUAvLPPi
	 A8T/vXtf7RBwODLLkGNvdrMi1ygvyEXeS8l6Mah5UhG75ePnE9p3D9mfZ1nAoTCu/Q
	 bu2qMSViX5ItQ==
From: Marinela Tatiana Selseth <marinela.selseth@firmwaredesign.org>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	marinela.selseth@firmwaredesign.org
Subject: Re: [PATCH] staging: rtl8723bs: Rename CamelCase NDIS encryption state enums
Date: Fri,  2 Oct 2026 22:16:57 -0500
Message-ID: <20261003031657.240906-1-marinela.selseth@firmwaredesign.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2026100244-uncrushed-railcar-be19@gregkh>
References: <2026100244-uncrushed-railcar-be19@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Envelope-From: marinela.selseth@firmwaredesign.org

Hi Greg,

Thank you for the review and the excellent questions.

You are entirely right. These constants are strictly internal software
state values tracked inside 'struct security_priv'. They are used
internally by the driver's connection management loops and are never
compiled into raw packet payloads sent over the air or passed down
directly to the core network stack.

The driver replicates this NDIS layout internally because it was
originally ported from a legacy unified vendor baseline, and the
mainline kernel does not export a generic NDIS encryption status enum
stack for staging items.

Your point is completely taken, the rest of the anonymous enum block
contains similar CamelCase leftovers (e.g., Ndis802_11WEPEnabled,
Ndis802_11WEPKeyAbsent).

While here, can condense the duplicate defines in one, like
NDIS_802_11_ENCRYPTION_DISABLED, and NDIS_802_11_WEP_DISABLED.

Will scale up this work and submit a v2 patch series that converts the
entire enum infrastructure cleanly over to standard uppercase NDIS
snake_case conventions.

Best regards,
Marinela
