Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793549911;
	b=kSt65ZpJ8MgjXIYAf51u60NglbKtO5WYnBu7enPW46yxf8qMgHSAKI6kug17jX5hsqqc
	 mbx9KOZ466WKgpaU0jM4F3bdp6Qqf6Q5KMglPBjhdUgONQlsv9rF7N7WjnItG36eh22Yn
	 ZZp4Lq+FUdO6MvK19Wvv64zpBy8UFK1IMM5Tp8k0N5FU/YluFOYu0xY5MKem4PAOGBBAP
	 OjYALCIYfvFp9O8eRLZBu1DFGhvWUtOWwxBodWXP7xCDtV3Epdt4lCcfB6SjlG/8w0Ds6
	 ub8hIA/bTNbGF6jF27JjAn5PDgPxPzuL+JQae2gVihAOhzVozW4Z8vdLJZNSgCdYr+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793549911;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ugeNmQRt7VpSYCUBFDdZwKH3j+3lNI9rXn3/uhHambQ=;
	b=I9Rdj4Zs6mWaONznnmbikelNmQwE/LclLGMU55g6raoz4B4OYZQdsqbDU+FsQKTN//0K
	 eD+CrTbfxyf4PuyUrRUCYCNn7cD3xFPGvDlAMRcqOjzvY+3D2+BikP1n6n4E+ks3vsNdh
	 XvPsvExazdYU9R+m2cJm7XuBSmFpOml06nPynmBi0yzCT+kVaT1obIV6Gp8Bk82Rr1bQD
	 OCJnp2JUqPjd7R+h80EH07bT8ecy6W4jNL3tik/z3dInmmCxbTSlVibbDZnFKU9vL12mR
	 3dpnW6TLVvKC+Vf6W/vUF5ti/M/Jnjgcbj/x5IjNf9sYI9kFuscaDZ9BMhM5yvFkhQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=miget.com;
	spf=pass smtp.mailfrom=miget.com;
	dkim=pass header.d=miget.com header.i=@miget.com header.a=rsa-sha256 header.s=google header.b=QY2EI6ZQ;
	arc=none smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC3C606A32D
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 16:18:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FC3C606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=miget.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=miget.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=miget.com header.i=@miget.com header.a=rsa-sha256 header.s=google header.b=QY2EI6ZQ
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b203527bceso2872812a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 08:18:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=miget.com; s=google; t=1793549909; x=1794154709; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ugeNmQRt7VpSYCUBFDdZwKH3j+3lNI9rXn3/uhHambQ=;
        b=QY2EI6ZQ746QcKd+4cfpIIdAI/s6ex0gkDiS6KOEzyaET+20a+zn9aDwwrw3ywC6gx
         8Vh1bNlRkTBXJ8ft7aCEiWTVNbVUHWFYE18vmIBk60sPDF5kAWLC9fTAwBYdMVhg7T26
         G//8YAnGjrOMmLWZRUG5yvAHtReThl4uFhv/8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793549909; x=1794154709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ugeNmQRt7VpSYCUBFDdZwKH3j+3lNI9rXn3/uhHambQ=;
        b=2tZIruQCGWpKySIIcZnw2hSms9Cb0G9uTSp34SGOhId2DrQRXEuuGa48LB0mgNDAI4
         Z5lDs+t0bvqrnuDRPFTedu/+VYDMhhRWOr5zf2bTp5+KlgBwTQ8t1Al/5xqnlPs7hcfW
         eGxZk6QK3a0phbwVG5mS1SGwOy4O9gwXGlxfLjLhcvQHQcbxGFdxzihhfMszVtOA0OXG
         /JZ7ujEB7Vm+3BbeoRw7KYL9TdHMMjYyVRmLRMQVzyye5odHLBbakMoYduTmmoGXa0U7
         r+jWMC1hL2z3pB732lroOqMJFx/dAuXWMEGLmrUEtLtMrHB+7NuIjE993Lj2brGmHH3I
         0qJQ==
X-Forwarded-Encrypted: i=1; AKwUvBxIC4xjSCJAndHLVxtk7Q2lkar9X7l79mhWXadt1ZF9bQgSNpRykquXrA0eAkWPiRrM4u7Qy2FHmwBgbLs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Op+Z3pbGeRbEec0rmkwe91gK+kwv0wmr43qJRbIQ0CRq0rRDP
	6gDwTs6HAXSNc4GCGQVcmdckbeNZf5ZGgJpLxEhb0IBrKIrELWVsxeXwBfiWp+qk7nA=
X-Gm-Gg: AYBFou2a1PNxFHvni1QrDGeyLubP5P9RrichFnoKzx1kDBEPXCCSSpWsxNa7uOBnE3b
	PF1qS7j4FXtvO2CnxXZMQr24fPqlULnfjmW8tfOqCUv1Ww0JcM23jM5Da0WBjSyzOoEf1H3600t
	4r5a8UIDub19z6OzRankMnrGqrz2Kvg3W9nOOucL4K3DjHdrFYk/93IgplRe7HP1SGNdy1c8k7D
	4MB6RP6QLoKl+xiACbu8BUZ7oSrSvcSAmhKSBWltn23KcPhwTerTxFxbaHG8nIKSYvLnSyrb98H
	QU3RTWvG5ywJ/vzi346vim9NxT4xzaYb3UyUyFJdltcWFmA4oWwGXSyGhLf/9BNik5gV6LiKvdH
	ywzGLKrdawu+spAHX5wXO1WKn+q5xjQzXkIDCdL9ohUCHXpWVF1JINVa3Mh6D2qGI3TPMU7VbOF
	XKobxGIX0Kn9lIsCI44hfS9Bklt1Fxyu5n939lMr1t2l60Qva6JXuCoBxXjFHfJnAJDtFuw720X
	Y8Qbd44OZbALNzsiInog4svzjAVsZLi2wOMWHkoRjxWcSacgJ/PgjI+0S23s59QpISRM3viP7ru
	STB2B21y25sNSNjhtmdX0U/rUTPaonafU80yZQ2WOmQMuHfKz6fMhDwXJuGRyUw2cR7Ilcb4mxv
	wyU4LBmH4RS7LQ0Ab0AvDtkjTieE/
X-Received: by 2002:a05:6402:a30c:b0:6b3:d0a0:1358 with SMTP id 4fb4d7f45d1cf-6b4d64b1342mr3791738a12.41.1793549908869;
        Sun, 01 Nov 2026 08:18:28 -0800 (PST)
Received: from xia.tail836dc0.ts.net (user-46-112-84-13.play-internet.pl. [46.112.84.13])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4ec9fcac9sm2200155a12.18.2026.11.01.08.18.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 08:18:28 -0800 (PST)
From: Chris Taraszka <chris@miget.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mingyou Chen <qby140326@gmail.com>,
	Ilya Gladyshev <ilya.gladyshev@linux.dev>,
	Armin Wolf <W_Armin@gmx.de>,
	KentoNion <kento@kekto.ru>,
	Matias Civadda <matias.civadda2342001@gmail.com>,
	Chris Taraszka <chris@miget.com>
Subject: [PATCH v3 2/4] platform/x86: bitland-mifs-wmi: Don't fail suspend or resume on profile errors
Date: Sun,  1 Nov 2026 17:18:12 +0100
Message-ID: <20261101161814.1325847-3-chris@miget.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261101161814.1325847-1-chris@miget.com>
References: <20261101161814.1325847-1-chris@miget.com>
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

bitland_mifs_wmi_suspend() returns the laptop_profile_get() error to
the PM core, which aborts the whole system suspend. This happens on any
machine whose firmware reports a SystemPerMode value that is missing
from its profile table, and on such a laptop with the lid closed logind
keeps retrying the suspend, so the machine stays awake and drains its
battery.

bitland_mifs_wmi_resume() likewise returns any error other than
-EOPNOTSUPP from restoring the profile, so the resume is reported as
failed although the machine is fully usable.

Saving and restoring the platform profile is best effort. Warn and
continue instead of failing the system transition, and skip the restore
when nothing was saved, so resume does not write a stale or default
profile.

Fixes: dc1ec4fa86b2 ("platform/x86: bitland-mifs-wmi: Add new Bitland MIFS WMI driver")
Reviewed-by: Mingyou Chen <qby140326@gmail.com>
Signed-off-by: Chris Taraszka <chris@miget.com>
---

Notes:
    Unchanged since v2.

 drivers/platform/x86/bitland-mifs-wmi.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
index 63fae12ebd83..0891dcc1e9b4 100644
--- a/drivers/platform/x86/bitland-mifs-wmi.c
+++ b/drivers/platform/x86/bitland-mifs-wmi.c
@@ -234,6 +234,7 @@ struct bitland_mifs_wmi_data {
 	struct device *pp_dev;
 	const struct bitland_mifs_quirks *quirks;
 	enum platform_profile_option saved_profile;
+	bool profile_saved;
 };
 
 static int bitland_mifs_wmi_call(struct bitland_mifs_wmi_data *data,
@@ -404,10 +405,15 @@ static int bitland_mifs_wmi_suspend(struct device *dev)
 		return 0;
 
 	ret = laptop_profile_get(data->pp_dev, &profile);
-	if (ret == 0)
-		data->saved_profile = profile;
+	data->profile_saved = !ret;
+	if (ret) {
+		dev_warn(dev, "Failed to save platform profile: %d\n", ret);
+		return 0;
+	}
 
-	return ret;
+	data->saved_profile = profile;
+
+	return 0;
 }
 
 static int bitland_mifs_wmi_resume(struct device *dev)
@@ -415,8 +421,8 @@ static int bitland_mifs_wmi_resume(struct device *dev)
 	struct bitland_mifs_wmi_data *data = dev_get_drvdata(dev);
 	int ret;
 
-	/* Skip event device */
-	if (!data->pp_dev)
+	/* Skip event device, or nothing was saved on suspend */
+	if (!data->pp_dev || !data->profile_saved)
 		return 0;
 
 	ret = laptop_profile_set(dev, data->saved_profile);
@@ -432,8 +438,10 @@ static int bitland_mifs_wmi_resume(struct device *dev)
 		}
 	}
 
-	dev_dbg(dev, "Resuming, restoring profile %d\n", data->saved_profile);
-	return ret;
+	if (ret)
+		dev_warn(dev, "Failed to restore platform profile: %d\n", ret);
+
+	return 0;
 }
 
 static DEFINE_SIMPLE_DEV_PM_OPS(bitland_mifs_wmi_pm_ops,
-- 
2.56.0

