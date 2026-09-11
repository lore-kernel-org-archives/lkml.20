Received: from mx.prosyst.ru (m2.prosoftsystems.ru [46.48.77.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B47642848B
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.48.77.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789115248; cv=none; b=YCjLel5pSK8Yf0AcDt+ZXQZuimgd9qKFZVz0zEqs3C3wLDJOiQWyA2rXdTbYXKo2239egnmzfaNmchkAmNB6GYPYoURAQ0qSIvlMWW9FZ86kfjdSBhe4CWvKoeY4/Ib5550OMqZqx3Ed6mYFRyRPxGRMUDFWs/nxoEngznwAf8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789115248; c=relaxed/simple;
	bh=rYi+oMMWYSkIsTarqqDhTmaDhCS9olFaoYmQffkuPsw=;
	h=Content-Type:From:To:CC:Subject:Date:Message-ID:MIME-Version; b=PHc9QYa0PEx0BeXpakQGZcrxarnCjNF5t6ikfmrnnQrAtdVBbnUE1OPzqQkQp6YOcWeHgraOmIi2uo08owh2mV2CB6PIvusrQ4ul1Jia28Gn/vVfBBi6ol8bgutQfxI6sIly7aY47U52MF6Elrn7UvazC+zbjtm/JlFM/wV4kao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=prosoftsystems.ru; spf=pass smtp.mailfrom=prosoftsystems.ru; dkim=pass (2048-bit key) header.d=prosoftsystems.ru header.i=@prosoftsystems.ru header.b=dGbWZ4Kt; arc=none smtp.client-ip=46.48.77.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=prosoftsystems.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=prosoftsystems.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=prosoftsystems.ru header.i=@prosoftsystems.ru header.b="dGbWZ4Kt"
Content-Language: ru-RU
Content-Type: text/plain; charset="koi8-r"
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; d=prosoftsystems.ru; s=ps;
	c=relaxed/relaxed; t=1789115234; h=from:to:date:message-id:subject;
	bh=3RxcPjFvGlBKchxGD+ISXOTlayBQ2dnKi7fvrlVIR0w=;
	b=dGbWZ4KtgNYu9j15lBU2U8wP7xSrzTJeZFVFrwkLsAMqOIwhiEYDNO8XQ8fNGNuj9LHn3soKSpk
	R+2DB0Ju/lv09cBm4KXy9jBEtrr4pLebkLp+UvLsR1WU7k2vAFRKTXk6ruWjgt2zfUoOUNjR8ZP3P
	PpYe4AjDm1CIGsK4TR5OvP2O2vudEQ1cqw1xSDd3cBWe9HZwuYEkwzYNcKcuPlUuZkYaIDh43Tep2
	5k2qITAykTkdqj0AZ0WOaPW5Re4IUG7txhksGUspJe8lwD7XVdxVz158LFmAUZZ7PmjFsBZ4nx5FF
	yAsZpJkTnuFwx/SSoWipUX1DNAred9Wy6LyA==
Received: from echo-2.prosoft.ural.ru (172.21.245.22) by mx.prosoftsystems.ru
 (172.21.240.33) with Microsoft SMTP Server (TLS) id 15.1.396.30; Fri, 11 Sep
 2026 13:27:14 +0500
Received: from echo-2.prosoft.ural.ru (172.21.245.22) by
 echo-2.prosoft.ural.ru (172.21.245.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.39; Fri, 11 Sep 2026 13:27:14 +0500
Received: from echo-2.prosoft.ural.ru ([::1]) by echo-2.prosoft.ural.ru
 ([fe80::c1a2:90f7:8820:c669%17]) with mapi id 15.02.1748.039; Fri, 11 Sep
 2026 13:27:14 +0500
From: =?koi8-r?B?9sHNwsHLycXXIPLBxMnKIPLJy8HSxMnOz9fJ3g==?=
	<r.zhambakiev@prosoftsystems.ru>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: =?koi8-r?B?9sHNwsHLycXXIPLBxMnKIPLJy8HSxMnOz9fJ3g==?=
	<r.zhambakiev@prosoftsystems.ru>, Thorsten Blum <blum@kernel.org>, Kees Cook
	<kees@kernel.org>, Akira Shimahara <akira215corp@gmail.com>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "lvc-project@linuxtesting.org"
	<lvc-project@linuxtesting.org>
Subject: [PATCH] w1_therm: verify CRC only after a full scratchpad read
Thread-Topic: [PATCH] w1_therm: verify CRC only after a full scratchpad read
Thread-Index: AQHdQcdZqZCwwiyRf0GG222RKJslsw==
Date: Fri, 11 Sep 2026 08:27:14 +0000
Message-ID: <20260911082549.82895-1-r.zhambakiev@prosoftsystems.ru>
Accept-Language: ru-RU, en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

From: Radiy Zhambakiev <r.zhambakiev@prosoftsystems.ru>

read_scratchpad() computes the CRC and updates verdict/ret
unconditionally after w1_read_block(), even when it failed and returned
fewer than 9 bytes without writing to info->rom.

info->rom is zeroed at the top of the function, so a failed read leaves
it all zeros. w1_calc_crc8() of eight zero bytes is 0 and info->rom[8]
is also 0, so the 'rom[8] =3D=3D crc' comparison spuriously matches, verdic=
t
is set and ret becomes 0. That makes the retry loop,
'while (max_trying-- && ret)', exit early and read_scratchpad() report
success with an all-zero scratchpad. Callers such as temperature_show()
then surface a bogus 0 degC reading instead of an error.

Only run the CRC check (and the resulting ret/verdict update) when all
9 bytes were actually read; otherwise keep the -EIO so the loop retries.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: 308bdb94de0c ("w1_therm: adding resolution sysfs entry")
Signed-off-by: Radiy Zhambakiev <r.zhambakiev@prosoftsystems.ru>
---
 drivers/w1/slaves/w1_therm.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/w1/slaves/w1_therm.c b/drivers/w1/slaves/w1_therm.c
index d96b224e2215..fd8c067a92d4 100644
--- a/drivers/w1/slaves/w1_therm.c
+++ b/drivers/w1/slaves/w1_therm.c
@@ -1302,15 +1302,15 @@ static int read_scratchpad(struct w1_slave *sl, str=
uct therm_info *info)
 					"w1_read_block(): returned %u instead of 9.\n",
 					nb_bytes_read);
 				ret =3D -EIO;
-			}
-
-			info->crc =3D w1_calc_crc8(info->rom, 8);
+			} else {
+				info->crc =3D w1_calc_crc8(info->rom, 8);
=20
-			if (info->rom[8] =3D=3D info->crc) {
-				info->verdict =3D 1;
-				ret =3D 0;
-			} else
-				ret =3D -EIO; /* CRC not checked */
+				if (info->rom[8] =3D=3D info->crc) {
+					info->verdict =3D 1;
+					ret =3D 0;
+				} else
+					ret =3D -EIO; /* CRC not checked */
+			}
 		}
=20
 	}
--=20
2.53.0
