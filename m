Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794297511;
	b=waPXJStxQ5WhTDhrLbwEkUsBHPtMm2PhglPWEorT3436iiLQ6rpONesSPkd3yTkxd3Cu
	 4bJ8/zz4opJykVP+xOKGVtCfvP7IM+bBCrcUrarejN3yNW6p2zy7+SHh4vAyIiGzF0Mpp
	 Ew7CLu1m442eZUKW2NhhOqZVeaCFkNGxaMxU1NItat1dchERJrtCVSOg12+OgrZtCQKkh
	 v7P+J1jjTu8a2peLtEgaR2/d1jxCmUG8m5KztHaBeZN8nkiF2rZV8LkdUrf9MVSUdipKz
	 AgQVJPZnyWQxvGn4AgBOv5CN3nuw0PzjWqfU3nEmO+/IZ4wVmRGKawgafn0gXP0rm4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794297511;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6s8LsOvQS96egUDF6YSIUDYrf2On2gBbK6S5xTXVfvI=;
	b=ff6DyPU1yDsyW48lQzfmcMEhOrO3OZqRVubmiq3ErA8at6ddV/ha3JwinzTwi31htQQN
	 0BjAfiPQhiH7vRCVvlrpelY8Rc0498C3D/CwhaE4+NbiMM+dfRx4UYXVMqHNL98ubzgwd
	 lHD3bQOEEPaNRx835v36L/fRiIbXmYk5Bo0+58Jgl1MxvOueVZakorPN6w7+2EMrgLpbd
	 L7FqJ8SroMEC5MpL0DHVFnujINUD2kxrlmmHkI0WAnmPDFIWq+FN3R2KqnMCdoZqkWdJH
	 CfrcgQupQclxoA+ZiBrl60aQo5ssrByd5U6JK6r8E0jBxOaeBSmjiqGAIQ7q3RWZexA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=LoUesHNU;
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEDF8606A333;
	Tue, 10 Nov 2026 07:58:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EEDF8606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=LoUesHNU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=LoUesHNUTIK7kHjazH+uuGu4SaVX7B4vqLNLx3F0x1qGberfYpzXymp933Ox65r8BcnXUeuMCvrNF
	 4uKYFPe2ZSiG/SA8oanB68oD3KRpTQCFwz2XKGnRZoyDEz0cjZQ65NYDy5vuJ8ETAmCZGgdxIeU0mW
	 nLeNim1gBxRjzlUE=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app09-12009 (RichMail) with SMTP id 2ee96af2cea4b09-d1de6;
	Tue, 10 Nov 2026 15:58:28 +0800 (CST)
X-RM-TRANSID:2ee96af2cea4b09-d1de6
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from utest (unknown[223.108.79.97])
	by rmsmtp-syy-appsvr07-12007 (RichMail) with SMTP id 2ee76af2cea2027-acdc3;
	Tue, 10 Nov 2026 15:58:28 +0800 (CST)
X-RM-TRANSID:2ee76af2cea2027-acdc3
From: Shunbo Shi <shishunbo@cmss.chinamobile.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 00/22] usb: fix spelling mistakes in comments
Date: Tue, 10 Nov 2026 07:58:03 +0000
Message-ID: <20261110075825.24946-1-shishunbo@cmss.chinamobile.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261110064105.20335-1-shishunbo@cmss.chinamobile.com>
References: <20261110064105.20335-1-shishunbo@cmss.chinamobile.com>
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

Cover-letter:

Hi Greg,

v2 of this series fixes an issue in v1 spotted by the Sashiko AI
review: due to a rebase slip, the "usb: usbip" patch (22/22)
carried an unrelated hunk for drivers/usb/serial/ftdi_sio.h that
reverted a spelling fix made in the "usb: serial" patch (19/22).
v2 drops the ftdi_sio.h changes entirely from both patches (the
file is left untouched, as the word in question was deliberately
not fixed); all other patches are identical to v1.

This series fixes misspelled words in code comments across 22
subdirectories of drivers/usb/, found with codespell.  All changes
are comment-only: no identifiers, strings, macros or code are
touched (verified mechanically - every modified line starts with
a comment marker).

No functional changes.

 93 files changed, 154 insertions(+), 154 deletions(-)

--
2.53.0


