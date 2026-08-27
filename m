Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BAF63DA5DE
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 23:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787872713; cv=none; b=t9zcK2jDVTG9lPTCAakroNDaVP7yO+6rz26LtSdQDL3+YcfX3Gyk4W7Pm8KFtPxrLOgo/5sA+CqFnE/tBJbOnlyvqev9KreAVoF66tT6pWq9UoHi5Akf9+B4zf4U4qfnaHarJi5rNwgHkC/woSG9udSnnnA0qdF7LBPVmK3cWMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787872713; c=relaxed/simple;
	bh=mBUn/hTP80ffwCIYg46mImDDtg9txT49wm8ZCCLAU4s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hYA0sW1Pa9Lu7MU0GoXLG0e0kPM7Xp3aAZaIMEriiEakvn7zizH/0vXmFnVAOH1tt+T/HcCRGiuQkyRelFor2kA2RzaCeh+1cFNeOJm4HO91wkI80XWq9yyD0LLOoHYg7+iSbPBZBoDZTUNFGAnLahZ4o8pqqBRLLMzlSBm3ldg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IAkikBmM; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IAkikBmM"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49b8be0409fso1510775e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 16:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787872709; x=1788477509; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AhzoEy5TUnSrE/sOnXMcYJ2l7J2sJrZcZgTYycYce7k=;
        b=IAkikBmMN3568YbCzZK04AQA2TLLMO8maw+eIU3aVqT24Uen6rZqTGTHC2JpdJJ5Jw
         IxCEkRs+/f7W6xbUsH9L4Vq4sz7L65bKu2UDHuzg67ekofroqgXlsmdMIvP8vsfuTfCl
         Qs2RCD++ZOfENzuXe7ctMODTGlTGfAF5ScIXNwnwyjYUN7KR5a7LoikUutQmjrlhtjb9
         HGLYdfhscWglWub7IaCA3kkjRDeToScM7H8KX6j3z/wqpRrMXWa77hQD6cZ6RgFoqyok
         rZRkjzCsr48Py2y08vt2ydq8e17oogluu2WNzIB3bAdQ19+pUegOQdIvp7kQYe53XyBJ
         c0eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787872709; x=1788477509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AhzoEy5TUnSrE/sOnXMcYJ2l7J2sJrZcZgTYycYce7k=;
        b=mEn/qDW6liCh2ZWW5kq2cI+nNzeUr6t0AviOevuK/lVaCqlP7cR8CDdPBUgF04NlY6
         dJ5i3WQ3wHUZCLsEXtPvm3Go60h90ukVIIuFrCHgN/H6AXu7YBf4RfWdxT8kalmwJ5C6
         fi6oxErwNE5MaaPLkSubapWHrgztFOZQjflRrVWuq82eF5hRnT0W6ctWmEvf0reS5WPc
         Uoq0q1+1klp0tJnu2ipXfujWkpPdKgu5R0Of2npACkLcVCcNCYGQzgFRAn4ALMsDOfiI
         f7uzWhgdqwgvjYvDBtdRi8qaxz1ovktO7dUkQ8AK0luoiXaPkuf49kwn+7FdlQU2vx9D
         aPUg==
X-Forwarded-Encrypted: i=1; AHgh+Rp7aceGYZte9fcl9iqA7UnaeXAXckeMOCRqRlM17ZF1Hzwof8O5KsrfwLO+2bTAvqLNPLZt2u9JVWqBrAk=@vger.kernel.org
X-Gm-Message-State: AFuF++mqkxwOC1iZ9NAq5eymN04zD6tr3p3d2B9ZAte5omNKfaGSoMAc
	NA5Jst6Nuny9nMtTqojozGb2NP+7MXkX9Om3gFtEyRYznmYQH8mR6hhN
X-Gm-Gg: AR+sD12sB2MHlXnpMijqe8ZiLfYNmpA96AcYAggaZNvmV+eLeFVF6xxF75JNJ+O2naE
	/imFb4OGfWH5EuLVS9jHsO090wzNSuY6CvsC/SJZAXHf6tQFrLxYMkwWncASc7wujHfUy/b1ysp
	ZjGukZQCFo3CgicTG6wv2b08QPyW0N7OGs4wpYgqmCfh9FAs+hF8LMgQTKuHqV3272RcyG6HnTd
	ivww53gqSUXBkFNuFqNzuth6Wa+y/RbXTehp9U0V/dtXwURvfyb3XqvJM8mEVGTKKYDBTAp4o9+
	NYzPM0quOeHvK7Elf401JbGI+0PI/tUENiNq3MmFA4cHbhgL92W3VOJZ3Sfb8H3zapij4ISOW8W
	nQHICMz4SRiV/RJFKV+24zQFOx4fRmzXLUSLKC25p7Ftb16pp3Rb5Y46Lx6yqwZHJPjw9tOtYwr
	ft3SWrXyK89x2e5iPPshdfOJQqnoeUaxN45a2QzrzMDj4PD2gH0a3vhm7APtqt7hboXXMz/E55C
	Ev8WDgV9oX+NMqL1hrynoRYgkU52T5yb+DouAke3+uw
X-Received: by 2002:a05:600c:8b8c:b0:499:80d0:8b73 with SMTP id 5b1f17b1804b1-49b91c21bc7mr29918525e9.4.1787872709574;
        Thu, 27 Aug 2026 16:18:29 -0700 (PDT)
Received: from 1Z10 ([78.213.170.242])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b95013d06sm6748875e9.12.2026.08.27.16.18.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 16:18:29 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Maurizio Casciano <mauriziocasciano7@gmail.com>,
	Uwe Kleine-Koenig <ukleinek@kernel.org>,
	linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jose Maria Martin <jmmartinf@hotmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/8] media: i2c: Add Yoga Book camera ACPI IDs
Date: Fri, 28 Aug 2026 01:18:24 +0200
Message-ID: <yogabook-media-acpi-dsdt-20260828.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <apAKR_wiAUhI0ZQn@ashevche-desk.local>
References: <20260826132256.3343451-1-mauriziocasciano7@gmail.com> <20260826132256.3343451-3-mauriziocasciano7@gmail.com> <apAKR_wiAUhI0ZQn@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Andy,

As requested, the relevant device objects from the tablet DSDT are:

    Device (CA11)
    {
        Name (_ADR, Zero)
        Name (_HID, "INT3477")
        Name (_CID, "OVTI8858")
        Name (_SUB, "INTL0000")
        Name (_DDN, "OV8858")
        Name (_UID, One)
    }

    Device (CA01)
    {
        Name (_ADR, Zero)
        Name (_HID, "OVTI2740")
        Name (_CID, "OVTI2740")
        Name (_SUB, "INTL0000")
        Name (_DDN, "OV2740")
        Name (_UID, One)
    }

The per-driver ACPI ID patches are included in the v3 series sent as a
fresh thread.

With Best Regards,
Maurizio Casciano
