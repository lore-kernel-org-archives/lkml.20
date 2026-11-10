Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794292877;
	b=0eE11dVpGEnIrYkllKzTPP+wtful69KErirtseH7rUTsA4RVLZT7umpznOnMcJAFVt8T
	 YRk2a6b0VQw4yp0HxmKpjO+qCZ06jUxyBUxMZ4zFs+POHE1RfwkZ/NSNgdbAUcRPFxIbh
	 hEA1RWN/6nFiFkgUmD28GUqp7XvGk5HI3cx+2wNdTz9OgP3rCBpFUTctbd6/odpqbEYjk
	 PWvQSLd91gWUkvVzlaCfyAkh/wj5aiw7wfhjJTwmzVYpLM+CG6PHJEMzO59ASXxTPtoA+
	 2VBc1uGwtsInGl0n4Dj1wKH1/rF2uF5F8kP01hgaJ0uvaPPq6qpK0r+nx14X4hu5jxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794292877;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=irqAV1thSntQkMi934BjuVjncEggy+0TP3uYhp1lsTc=;
	b=tmo+KYmxaawxDJSKaHlIhnjP2SXTkEQUcICiDxgzDwvsbtiAhZMahpY3vjRh6ZT4p1Sd
	 etdOoRZs7ftrQ/90wLoEpyhhNkcJLZSIi8Qgo98d5ub8IjtvVAq1mA5xuDY0JUQLPRQmv
	 IyPFOEw5W7nNFLKgnBfNxnD8qjp8v31/qOscPiDAo7BhindqVWN/SUyex246iJsCks3oV
	 Z0auvoFYkAi8Eku+wmcFxrc51XmryCOvsGRL4wMxeSxSDvRt4dkfkM+zeFqhhK/aXaEjA
	 kUOCBR/4t28Vhzq64p7OEU+Wi6mOftyYn0UuE75rGezrtsIZzjL42qhUg7cPt/0FLaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=ZPPMckEh;
	arc=none smtp.remote-ip=111.22.67.137
Received: from cmccmta4.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20C8E606A325;
	Tue, 10 Nov 2026 06:41:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20C8E606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=ZPPMckEh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=ZPPMckEhM/yo8J/bs2L4eeMxnaMj1YjcapqzYbgzW7XaiS8C9noia7EyqA07yWKWeclMRDWGwArSh
	 o4UwCeXmMCctk8SDVojydUfv+rR8KetUb8T9AlbF8klSAZsNELIwil6kWDSdVxxJsvSbOhJU0Qsyy0
	 v7r68LaxXk/MwnP0=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app04-12004 (RichMail) with SMTP id 2ee46af2bc85835-6b64b;
	Tue, 10 Nov 2026 14:41:09 +0800 (CST)
X-RM-TRANSID:2ee46af2bc85835-6b64b
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from utest (unknown[223.108.79.97])
	by rmsmtp-syy-appsvr10-12010 (RichMail) with SMTP id 2eea6af2bc812f6-aa0f2;
	Tue, 10 Nov 2026 14:41:09 +0800 (CST)
X-RM-TRANSID:2eea6af2bc812f6-aa0f2
From: Shunbo Shi <shishunbo@cmss.chinamobile.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 00/22] usb: fix spelling mistakes in comments
Date: Tue, 10 Nov 2026 06:40:43 +0000
Message-ID: <20261110064105.20335-1-shishunbo@cmss.chinamobile.com>
X-Mailer: git-send-email 2.53.0
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

This series fixes misspelled words in code comments across 22
subdirectories of drivers/usb/, found with codespell.  All changes
are comment-only: no identifiers, strings, macros or code are
touched (verified mechanically - every modified line starts with
a comment marker).

Words that are USB domain terms, device or product names,
people's names, or common informal variants are deliberately
left untouched.

No functional changes.

 94 files changed, 156 insertions(+), 156 deletions(-)

--
2.53.0


