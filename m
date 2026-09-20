Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D17C385D8A
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 07:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789889512; cv=none; b=goqcMLv5oTGvE13FoL1cg4blck1Mp/fGWR8yUow82HTcYowELDE5x0eimMRBq5SQfYf46blWmyTe1JPYg/TGgEdgVyZwOJ25YCj11+ceAEtA4o+RNJH5o9Wcz7Kk7Sny2FCvg6guf+mjldp1oCDNsHwGQTImteSM/m0kPjsQUB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789889512; c=relaxed/simple;
	bh=jfISFHccu2UqRsiLdsx03nCmH78bx7oi1EBN6gkgJ0E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=BgevCyypa1oN55UZ+0d5AIqQTwbL3VT1XHHvUbnKzZp7peOrX8aeZFkcnBxIB5NZc6vbXRRYDlD7POA9M/EHEqZJL1VTT4xlHFh4U0MRqwZzyv1JgGvlJB6+cKgHzFZD97eFquMaQ5iB9+XtWyEzGkvnxpYowpnHvEytdEcgp7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=evalinux.com; spf=pass smtp.mailfrom=evalinux.com; dkim=pass (2048-bit key) header.d=evalinux.com header.i=@evalinux.com header.b=JUNS+4zw; arc=none smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=evalinux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=evalinux.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=evalinux.com header.i=@evalinux.com header.b="JUNS+4zw"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-46accbdfc20so1643352fac.0
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 00:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=evalinux.com; s=google; t=1789889510; x=1790494310; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bEa97+NVpDACV0kWi4lR/v50EIFrpNArQgZwPyPPEf0=;
        b=JUNS+4zw99jHMC2A6QD+OpsyIkCfq68OBh3Z7Xr9VevQ2h75+9kiQwDroR0CXLoPro
         BL8QwY868jsxGUlxtaJ7hJmQnP2viqMeIxPeiwmvBxfP60+0+F0UovkqHZxa/TLz/u9n
         tpf6VXTZ6ABCm6dC+dAuKmrY00dCqbRCvjbjYdkTSHyicLo+DTG0j7Q5dmRklmgk3qq0
         Hd8T7C5nGAnwp88bFY1lqLFN7FU9VLkJ4DxRhiK4cBFqRzJNzxfZkIz984N8Yhc0krun
         ZYDCL2MO0r/r42zKfL7dY93Yy5i63uYJZP7LFet5WSJ2tlLHidxcEoP59nDuEr9BcXgm
         ef7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789889510; x=1790494310;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bEa97+NVpDACV0kWi4lR/v50EIFrpNArQgZwPyPPEf0=;
        b=vpaBY96dKO5io48jWWrQef/DOMLTrqqmCTpq+5na5Sz6A6+w8PKn+jRM80ttT0UyR2
         uCsrvimeQuPDA8DE4H4jOoEsoTkr6EWS064M7pHocC2Ax8i8iMBbcpZCTNOjRN6eKAoD
         ZCHObwKDC8diRiovf8SP8/nma4LG1KY3XWegyDPt72cIjFlf4746stt+cidcr31bDpdZ
         At6+JEVemKLmGUV5WKqqhjYn70ox6GbN7cxx/Ngn170rb3jJKu7Bf+uiIP3aKcdOEdK9
         3yFu+f3hnvu0cBBGl2Od/ErRlgKL1I/iBz63aGRPoo6x2+Mwi0zYeG5A2VCZaUShIHNr
         iPGA==
X-Forwarded-Encrypted: i=1; AKwUvBwFOmb3tQqorSwlqPPe8eMLeHIUQhkImQIS5lB03ceWJww08aYvL97hrhqyFT41LhZWhC7j64/PNkSTldk=@vger.kernel.org
X-Gm-Message-State: AFuF++m6DAQXKKrXQZOy0bUlLBk82IT8WUf+0eqVF5bnEXOusPBG26L+
	CoyjnRCgwpLyJPU0M8bxoLTWdKbtZM4UtOOSZ8vZ3236/0rRgb+N/WQhdp5VfuFteJ4=
X-Gm-Gg: AYBFou0jPgM4gfG/XNPIG+p99pWs6hMGhBGHXQ2V6pcAeBnbmID5w7QtebFGUlEH9ey
	YJoxSR0H/eYAC/qZ4ibTQ02yOGGvLBeLucduXiFo8jwdSwGeLLTordw0iMA6Fe9zeEcYXjTsfal
	lOSN2ijjRaTYCith8ndgnE3ouHwrpsDCrN5Mqz0tD9LFyb/95t1EGMuuZyshQJStA5BCrmIiS6k
	iOx0Kx4QhZY7H6HvudwH/XGheZCyqCcND91TqFrzqZKmcobgL5NfnDmnrsWu1uph61+YQzuH7xc
	6pfj/PGQUKIWu1lHDVq9RsRQpY+eq6yBe57UW2YsHxOcKo2gOW0+1nZgfcntFItVgtTq1xw5KU6
	zWGXCulTzzFRVxFMFCRAGvnFl58uNiQtcZQL6FDnurGv5QA6lkHgmoD9lmY1dE5NSJ/Dm8wNNqi
	sy6gS5Ht0k0/94g+1YT7lfQl5f90IwK2xKgnf7SIbVrTBVQ5RM12DR04BcHK3uiPopTlE2YwvMK
	1qAmPLNLUI+2mrLNwBbhD1f9U6Nug==
X-Received: by 2002:a05:6820:4c08:b0:6bd:e592:2c64 with SMTP id 006d021491bc7-6ca9a847c43mr6021838eaf.23.1789889509901;
        Sun, 20 Sep 2026 00:31:49 -0700 (PDT)
Received: from desktop.lan ([2001:470:1f0f:2e4:14ce:9fa2:a97a:cd20])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6cd35f15a1asm5083680eaf.14.2026.09.20.00.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 00:31:48 -0700 (PDT)
From: =?UTF-8?q?R=C3=A9nich=20Bon=20=C4=86iri=C4=87?= <renich@evalinux.com>
To: Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Dongliang Mu <dzm91@hust.edu.cn>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Steffen Klassert <steffen.klassert@secunet.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?R=C3=A9nich=20Bon=20=C4=86iri=C4=87?= <renich@evalinux.com>
Subject: [PATCH] docs/zh_CN: fix stale :Original: reference in xfrm_proc.rst
Date: Sun, 20 Sep 2026 01:31:44 -0600
Message-ID: <20260920073144.546566-1-renich@evalinux.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Commit 03e23b18c720 ("net: Move XFRM documentation into its own
subdirectory") relocated Documentation/networking/xfrm_proc.rst to
Documentation/networking/xfrm/xfrm_proc.rst.

The Simplified Chinese translation was not updated accordingly,
leaving its :Original: tag pointing to a nonexistent file and causing
tools/docs/documentation-file-ref-check to report an invalid reference.

Update the :Original: path to point to the new location.

Fixes: 03e23b18c720 ("net: Move XFRM documentation into its own subdirectory")
Signed-off-by: Rénich Bon Ćirić <renich@evalinux.com>
---
 Documentation/translations/zh_CN/networking/xfrm_proc.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/translations/zh_CN/networking/xfrm_proc.rst b/Documentation/translations/zh_CN/networking/xfrm_proc.rst
index a2ae86c44707..6990f8e2fdb4 100644
--- a/Documentation/translations/zh_CN/networking/xfrm_proc.rst
+++ b/Documentation/translations/zh_CN/networking/xfrm_proc.rst
@@ -2,7 +2,7 @@
 
 .. include:: ../disclaimer-zh_CN.rst
 
-:Original: Documentation/networking/xfrm_proc.rst
+:Original: Documentation/networking/xfrm/xfrm_proc.rst
 
 :翻译:
 
-- 
2.55.0

