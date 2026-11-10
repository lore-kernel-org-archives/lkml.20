Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794327430;
	b=PItGqb33blyuEnIvcFXX5QUIq0vFn1lQ6/+6czZ4tUlvAc2hKlFv7PqmFw0J+A3u3u0z
	 8mPJYTiGMmesVgZRk7cJGzzSohKpH65uhQAgIgolIZnHfwy0EDpF8464v3QyEzw786kHo
	 nakfC6k5HtUJxLPWrVHG8KaO+Wk+cmP8rXkSmwemYJjmfLpBerXmCAjLWbC4zeFEeqhKQ
	 1o5A/S6AYuhlVFKJIh9fDAVxMksLoUOAWX3FZHGa4OZuNB+pEJAbtCqlJTxQNo+4xT+ja
	 3F0XhAeVJB9xwL/E5SED5sV759hF7Kz5rISjRwci/JGfgzuNY9ilIDlezn1lEMTHaxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794327430;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=KaOAbVYlOcg6iQTUoIjRt0+mUMwQVsYG04xSb+9+Pkk=;
	b=a+3dTcGb+U2Rx4oBwz7ZiByjkCmwrrNZhpwCX+veuXtosZEhzjyxKszEBOOZ7a0NzpX0
	 UfKP3ispAgQkjVRVhPclcD56rh12pmVV4euOr/TLmu7EwQz00PJKcbsznPBH1pa2MZLHc
	 tJ+tXF7IaJjrc4JJZFxu/qj1cCvjD0odbxYmB0sJfcVP4fvPYJ1czgZESdCjm7dWSgd2v
	 Vawf9Ui8RuBKySbjTE1+9vxR7IGPqLUqydbdOHV5+6I6umj7TTzlgwu8FUmIYBZMStzQc
	 kYqVqrl0ku+v/9XZHw7pJWDdXXprL1aw0PRCIFOCkiAz0poRmm9CizFDmoix7QLKvkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wRC+Hyq2;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 727C3606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:17:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 727C3606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wRC+Hyq2
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a208d93758so23500375e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:17:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794327429; x=1794932229; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KaOAbVYlOcg6iQTUoIjRt0+mUMwQVsYG04xSb+9+Pkk=;
        b=wRC+Hyq2Wqv8c8vOHhlWvXMpZNKcJbIlzeNbWRpv5WhAAU+NlEMOJwUmRnbGnos8i7
         2JobI5Auq/SonZjQc32wUaLn43B/0dLZR+y3obSX6Mrt8mSEtSjmieK1K+HAC5DJf1aV
         1xNwXNY7srS8v5fErecT8wUeArk6LWporJQpYSj3759GMzfTzu3lSznYXbr7A1ivjfLf
         dwXv0kEIzxErWAn22+B3o8ev4MMwEUesGQF2hnd497aL9zqaYgfqnpRLdSrOTkOWT/re
         mWJXmzfv9hPToixbjkZrpwqzMxBR874MwPhCxqV34YW/8W2b+D9riI/HglDlXj1Zsupu
         WMRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794327429; x=1794932229;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KaOAbVYlOcg6iQTUoIjRt0+mUMwQVsYG04xSb+9+Pkk=;
        b=pW7324e289wNcHQP6jebE5hbOrl0dOfZMjGTollaFGBVRM0H6PgQ4LJIyKsLQA855H
         Y3aS6g2eo/jQmkhdzonqii70WBimb+OUm1J9Inkez6h716egHxyxmpI+4HGzS4QXUpbu
         ZxjX1OvsR8k/qPZ66jWYsD30bpNzgz7Nbo6lf5vSpGS40My5XX5Yf6gSldKtX4Gnzi3x
         TqzF8KV10klvEdSlH6in3y89KRvlFUipdVW7FaPAlHcfasjy9DpnQKIaeXrWp8+5vTKA
         VtAXXZ7IsCEJPfwjhgr506pblCeZYuNdRlYB5RcgR95shRZNbNfDEhh2Po3Uw5RnuwbX
         wrzQ==
X-Forwarded-Encrypted: i=1; AL+hErEbel6ioQZr+E6fEXerHtpw0SWwPZVWoiMzQFlKrPk7C9MlYIL9lhaquPDciHovhABQxD5SRc7aeEC5ICc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/2UjDGddLBW/JD6vHMe1FJp7LseLrhsdxZV24urwbGb8dLAEQF
	iObZdeXqFLcpG77bt0vPpkclskye5IVbSxIf0Ozhrc1qNUeq/9Y6qrmV
X-Gm-Gg: AYBFou3DUB+SBqTDwcwFKQyhadtVV3f075OO9o9Bn3bfN2by6YpV/EsNQChEihxlIQm
	Wgvu3Mb/9/xIXF+C3c/Ou13zfH72UbJnddz+NNJmnJExI1co0qDDECtebHq8PieC4cZ0Y4fQkgh
	aqFoiL6d2HZ0GKHh/U/DYhTsUOR4exHuiXRVd9ivRjIMuAZTW2Q9qk2wNCyhst+A0FfIMqusw09
	nNAbt/4tt1wWVRpBJ8mu7LVvp3BVDyjBBX02TTdmCsRBPPtbPr0VzTzkUrXCQq5rxwCePuVdlM3
	D8B0el74Nnb4Is5jCL+fm0FCE53MYeubUfP2R1aBQAn75jGGHoiOzKaSAxLklFbW9n0e1g2dzdD
	LsHVDk67eGGr/g6R4Pi0NjaQYq7FOEdq+VIuyYa+T8CybyTtfiVZrcKEL+CHjt5Y2RUuNju1phb
	FcevWli9Kl43nofpDTMInCfaKKUqcTycAHO0tNpHvJNGXGVqaTfN4oO135pZdbaVxMrH2poc1bA
	rnZGfIu1mt2XqGvq21ehtT95wyyAaITX46z2pTfsnuLRPppzdam0oKFxsJ+OpQXsXsq35QHC9ir
	dQa7sBeztx2T+ptCSWESDO2f
X-Received: by 2002:a05:600c:6094:b0:4a8:cb23:f71b with SMTP id 5b1f17b1804b1-4ba0234759bmr52917285e9.18.1794327428636;
        Tue, 10 Nov 2026 08:17:08 -0800 (PST)
Received: from infinity ([2001:b07:5d26:7a6a:365a:60ff:fe0d:cfc6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba02381034sm60851195e9.4.2026.11.10.08.17.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 08:17:08 -0800 (PST)
From: koraynilay <koray.fra@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Tom Talpey <tom@talpey.com>,
	ChenXiaoSong <chenxiaosong@chenxiaosong.com>,
	Marios Makassikis <mmakassikis@freebox.fr>,
	linux-cifs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	koraynilay <koray.fra@gmail.com>
Subject: [PATCH] ksmbd: set create_time to btime in ksmbd_vfs_fill_dentry_attrs()
Date: Tue, 10 Nov 2026 17:16:59 +0100
Message-ID: <20261110161659.481208-1-koray.fra@gmail.com>
X-Mailer: git-send-email 2.56.0
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

ksmbd_vfs_fill_dentry_attrs() queries vfs_getattr() with STATX_BTIME,
but discards ksmbd_kstat->kstat->btime and unconditionally initializes
ksmbd_kstat->create_time to ksmbd_kstat->kstat->ctime.

Check ksmbd_kstat->kstat->result_mask for STATX_BTIME and set
ksmbd_kstat->create_time to ksmbd_kstat->kstat->btime, only falling back
to ctime if btime isn't returned, matching the existing behavior in
smb2_open().

Fixes: 5614c8c487f6 ("ksmbd: replace generic_fillattr with vfs_getattr")
Cc: stable@vger.kernel.org
Assisted-by: Gemini:3.8-flash-high antigravity-cli-1.5.3
Signed-off-by: koraynilay <koray.fra@gmail.com>
---
Small fix I found while implementing ptime[1].
Thanks.

[1]: https://lore.kernel.org/all/20261101015551.786044-1-koray.fra@gmail.com/T/#t

 fs/smb/server/vfs.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/fs/smb/server/vfs.c b/fs/smb/server/vfs.c
index cb3f4f5fe9cf..0c95d4668370 100644
--- a/fs/smb/server/vfs.c
+++ b/fs/smb/server/vfs.c
@@ -1914,7 +1914,10 @@ int ksmbd_vfs_fill_dentry_attrs(struct ksmbd_work *work,
 	if (rc)
 		return rc;
 
-	time = ksmbd_UnixTimeToNT(ksmbd_kstat->kstat->ctime);
+	if (ksmbd_kstat->kstat->result_mask & STATX_BTIME)
+		time = ksmbd_UnixTimeToNT(ksmbd_kstat->kstat->btime);
+	else
+		time = ksmbd_UnixTimeToNT(ksmbd_kstat->kstat->ctime);
 	ksmbd_kstat->create_time = time;
 
 	/*

base-commit: b0af9a3e6b1534d353ca6ac23caaf46127f62e4a
-- 
2.56.0

