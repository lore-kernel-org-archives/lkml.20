Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A644C9558
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 18:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787854689; cv=none; b=ma3xEY3n5miEPcMxS03FWmCIKANih/m6rJH2rZDgud32xlJE9h4Kcl0VZlsHxg6HCssX/Ac27r58ZzNEUP5nUfTETnOi9GvK91CegtbsD3JoTclGusQoA8XMf3rGJpSj5iwLWBTZCp27wyQ+vlZ24jm68BtzhAg+zsDMAgtnxbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787854689; c=relaxed/simple;
	bh=i4XP/y1OtMKTpjmyldq1NfyuUnIY9DtWEpicagMug+4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sdWyGesMkRUrTmIoga+ecfXacitVmmO7PvGjVGzs44tFDQA0MjpnTJOmpGwzpxUmKFMsuRJMndmco7eMySDw33IcPSf2bkNKeJm+1Wi9edAdfNyGqC4n7Evaoc3sQa3F4tTt8O+lWbmhEOogMX8Vk4jf+8Wei2HAI8qCwYkMju4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cAmd6me6; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cAmd6me6"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4953de5be0aso503155e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 11:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787854686; x=1788459486; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VEsNUYGlKy1ooscwN6zWUOqqar7TDxOoNVnM+VqT2yI=;
        b=cAmd6me6u+7OzDIBk/v2EYHMAcc9uKzlCaYiCqz7UywCNWXhBd/hDECXW7v9kxiEK+
         HGAyHZFIDqOUUhvOybUuqD7CKpwqm4qMnNej3ErpV7Xr4wabMXPLfCflK8WeZoHGEao6
         lkq7Ku7TAaljcUoQuJktrMbhkKI6KkNjnZ5K9udHMRMWCbAdoqHLnC1j4KZF2sIEtWae
         44rwszqOdsaiHns75FzbXCWAbpK7eOPpCwp9f9vhs35XkeW014Joyig7RA+vqU+9ZXlZ
         XnTNyoQ0D9tGddxArYb5alXC/cNGbmaiOzdBjbmIm3Le1AQK1Mti48lwqBLzFrryy/Vw
         K9pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787854686; x=1788459486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VEsNUYGlKy1ooscwN6zWUOqqar7TDxOoNVnM+VqT2yI=;
        b=qljAmXBJJC17iJpbeq7eaftVFe45hGosK6+IjtTONwP3QkmLoOX5TawGOF/ib8s2b/
         ybv8CsfQxfjxHhworEvKIX46Z9fzV1eGe5sfq8GI0EEruJ5tb/pU2NmtopKDgubyFZbp
         ICif5oQ02Xjsf9/3uSovsXNgot2aRJBvXIEsSqiI5GRSlRLSZkilz7wm67W73U/yjRKg
         294vE/0BYSDdWNphx1GbnqGdySWjlG33FeioOo3W47cPGJv8kqEIzFSjCaTRYUES1c5v
         5IwxSEofo9zKYFDeBkms+YDS7qQdQUFTF5l5myNgLsfXxZxa9f8Etxo6fMD5gq9vSc8c
         NdUg==
X-Forwarded-Encrypted: i=1; AHgh+Rr9zGyDhEOhXPEmUxxLHk5MbLK84lehLNoBE8ebNtq+rXt2w9QdncgnYUWTtD8YSn0m9mwt3eIzvmmPmY4=@vger.kernel.org
X-Gm-Message-State: AFuF++kFK3lYJNmhKZIylSLgAIIYG9lv+XrD3yHFCMa0aGxBoGeZBLcZ
	p66yvrzTXHFCe8ejsOWmyQqMrJoiOEaAHxA7pLdOmI9PhBFE/NHfvqE7
X-Gm-Gg: AR+sD10tgZQa9YX0WK8iY/z5miWKW2v+BPCHQ6t2Irok7OwbNLM7LZ6gruGKDswQ0/k
	FLFBAw8VFab7b2IE+1zVQ1syzQMUvwe2RbkoWIsBPAkDaq8MbycIiJ6/Uof0a+8Ojson2WUXG9n
	5nAhQOU52S3L3LxEJFiq2ld56EgsPxJJ2F3ERslxhNeWDLsS6mznZrraRUAllXQoY+3Kbf6zHpB
	bbmd+BCefEVwsB6MH0JFV9AHg6AyWCSiUtKgBzLoekb9gS3+iY/VECzRHmECT4szf17r3AU0Oj7
	IkndA9aKFb4okdLXPInImr1LZa0X1oK43GvoCbDxshdvoA5q5vqBgAT5ppNOjy16sRtaB/FY/Qc
	Mru6d+llPph/WYntWdUSanYrApiY3Jve5zWG092dTv4zt593ziNIjP9D84vwsBUSqnZQjXgczlP
	vxWU1EqEfvvVtIumrVJUQqoa0b7V4DSnHDtAuNVfrwW2PwIYepH3W150nAyMsuHjSFxj0aoCbOM
	hBx8+3UxuuutufibsTt6Z7AHDap53pVEBcBA6zi3Z0f
X-Received: by 2002:a05:600c:3107:b0:49b:4dc0:9a06 with SMTP id 5b1f17b1804b1-49b91c50f5emr10361015e9.13.1787854686006;
        Thu, 27 Aug 2026 11:18:06 -0700 (PDT)
Received: from 1Z10 ([78.213.170.242])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b497fa9c5sm66270655e9.4.2026.08.27.11.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 11:18:05 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jose Maria Martin <jmmartinf@hotmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH v2 03/11] media: ov2740: Use C99 initializers for ACPI IDs
Date: Thu, 27 Aug 2026 20:17:48 +0200
Message-ID: <20260827181756.2430054-4-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260827181756.2430054-1-mauriziocasciano7@gmail.com>
References: <20260826132256.3343451-1-mauriziocasciano7@gmail.com>
 <20260827181756.2430054-1-mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use designated initializers and the standard empty sentinel style
before adding firmware IDs.

Assisted-by: Codex:gpt-5.6-sol sparse
Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
---
 drivers/media/i2c/ov2740.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 39003c1632ad..8f0ad5dbb245 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -1461,10 +1461,9 @@ static DEFINE_RUNTIME_DEV_PM_OPS(ov2740_pm_ops, ov2740_suspend, ov2740_resume,
 				 NULL);
 
 static const struct acpi_device_id ov2740_acpi_ids[] = {
-	{"INT3474"},
-	{}
+	{ .id = "INT3474" },
+	{ }
 };
-
 MODULE_DEVICE_TABLE(acpi, ov2740_acpi_ids);
 
 static struct i2c_driver ov2740_i2c_driver = {
-- 
2.53.0

