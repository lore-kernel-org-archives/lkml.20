Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=13.77.154.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794905152;
	b=X2MwyDoAHK/PcCUajYplyMzKBVVPP+DZOs24mwIMSnXFqqofojmy+GA3kMRYMN1glibm
	 0rKr6zYJIzQmmuHJK4CDHhqG8394YyzyF/+LcUVFlD+lWKZEnNHho3fI+a+NJd5hlh1uX
	 mqKqsBltxdLYYwm0oFPn9OHR3TrD76RwoP2CVFuY/f4G/Rl9+fjsdd/LCv+kWYMDsNyg/
	 8OiQl11mT+hXIBgdwpbaqUYIcAzCC2x71Hiapfw1EVKu9eqBUQB11d/S2ut7KCkanI2DW
	 PoYkEBilt8JPdVj5LihLn0ckMZMx11twPShHN+YIUWzSfWTyxBM/WYqG1Kh4GJgoE6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794905152;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Spam-Status:X-Spam-Checker-Version;
	bh=HtFmR0A1zd56E77IqTnfAjtFkFzX1qWEHRLdOy3zHUY=;
	b=QkIUiN+NZaW+6tr9aHmxnUGuVrdKDPH+Co2NkTgG7R+jkSZtQyobiPPbS0lC+IYvBn38
	 gn8ofAGjW2f3lOgMviBNfWlQicGnr03tUPtoAu843etOBVokq6WR1v93Fd0CUV9/n4QcX
	 sTqv0GpQ7U6tJjOnfGDt8cA4FZmR99HQPEWjurZCIxsnFMWAeCh/V8Tl7l7Zh4bFz3m6k
	 +Y85DXQljiDeU9ZK9URDPNwtD8IdlLDnV6UVcwwVYcG71MFmq8ZwizCIGj4N9kxdJxs+/
	 ev6BN5b5/YyfTfu+w2Vs2kiHsPLa39Bq51/PflFE6n9qQwytAC1kAKT5hoxoHgEecmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.microsoft.com;
	spf=pass smtp.mailfrom=linux.microsoft.com;
	dkim=pass header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b="qfBTkCc/";
	arc=none smtp.remote-ip=13.77.154.182
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9E9E606A330
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:45:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9E9E606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=qfBTkCc/
Received: from CPC-namja-026ON.localdomain (unknown [4.213.232.16])
	by linux.microsoft.com (Postfix) with ESMTPSA id 5BDBB20B7169;
	Tue, 17 Nov 2026 00:45:48 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 5BDBB20B7169
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1794905150;
	bh=HtFmR0A1zd56E77IqTnfAjtFkFzX1qWEHRLdOy3zHUY=;
	h=From:To:Cc:Subject:Date:From;
	b=qfBTkCc/eF/aTHC686gT4dj8yqP41Ng8i+E9WPgqFq+WUjFY69s3p77Y537pb+WlR
	 V4XdGVNukhxnR1z+WhZrLQQ4R/uxoD/bicGAT3aZD8s5cQ+5MEy84QEcOHTR4LDk8G
	 5b+Oat2bx7uTHzOH++CrBOXSkIhHSskTAzBeFRZE=
From: Naman Jain <namjain@linux.microsoft.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Jakub Kicinski <kuba@kernel.org>
Cc: Bastien Curutchet <bastien.curutchet@bootlin.com>,
	Douglas Anderson <dianders@chromium.org>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	Alexander Sverdlin <alex@sverdlin.org>,
	Chuck Lever <cel@kernel.org>,
	linux-kernel@vger.kernel.org,
	Naman Jain <namjain@linux.microsoft.com>,
	jeff.johnson@oss.qualcomm.com
Subject: [PATCH] mailmap: update email address for Naman Jain
Date: Tue, 17 Nov 2026 08:45:42 +0000
Message-ID: <20261117084542.2076622-1-namjain@linux.microsoft.com>
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

My Qualcomm email address is no longer accessible. Map it to my current
Microsoft email address.

Signed-off-by: Naman Jain <namjain@linux.microsoft.com>
---
 .mailmap | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.mailmap b/.mailmap
--- a/.mailmap
+++ b/.mailmap
@@ -701,6 +701,7 @@ Mythri P K <mythripk@ti.com>
 Nadav Amit <nadav.amit@gmail.com> <namit@vmware.com>
 Nadav Amit <nadav.amit@gmail.com> <namit@cs.technion.ac.il>
 Nadia Yvette Chambers <nyc@holomorphy.com> William Lee Irwin III <wli@holomorphy.com>
+Naman Jain <namjain@linux.microsoft.com> <quic_namajain@quicinc.com>
 Naoya Horiguchi <nao.horiguchi@gmail.com> <n-horiguchi@ah.jp.nec.com>
 Naoya Horiguchi <nao.horiguchi@gmail.com> <naoya.horiguchi@nec.com>
 Natalie Vock <nat@pixelcluster.dev> <friedrich.vock@gmx.de>
