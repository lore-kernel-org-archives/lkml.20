Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B561B47D45B
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 18:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787854759; cv=none; b=F2ZB5H308LvU6xA6nRkuCJO1pQ+f7DmzFr+19IGHembD940JUh/mPsDl4yMA06B/K5/00sJrrOS4U+OBfycdexzpmnraQm5o3SfT7KDWYrQpRqFYe2olaR49k1mJ5jKjMaxh95E7rEx8sHubY1EKm3hT0Cj8/p8NeIcST1PbX+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787854759; c=relaxed/simple;
	bh=laeJaCvRd81udZfwhlzLQ/pBiNLkEyq18mqwuNA0OIU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KZH/yGLUtsNSpBZiZXCbf5LFe36HABP8CfBOezgx8Qr27ee821FkkKjKH5BIn+tQmrL0UF98fh3lT92NesUHunqbPKZ6KH5z+ul+NV7ZPaodosl/XO/QFAJY8ox8gixH7Hk1CAEXY3bPVzbOiRElRPmYyReHaPV7DjhtzvcUfTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vm1wiD4x; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vm1wiD4x"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-482e61a34e5so57556f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 11:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787854754; x=1788459554; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eXazbZDjHYS7TxQMC+6npHdpPuAZoywDenkIT58mmgM=;
        b=Vm1wiD4xngdmdbJ7Q724KkCQ1P5WGn9HhNe3L4kwzcy3WbT/9exNwEYu4Rw3knE2VQ
         sXsHrSMMDPG7X53ZEo5pq2UcEBz2QMOnAmcF4DK8o2WwurY0qeAdLv/LGbFodfaOvZOv
         uPyoznno1BLNBLt1+g8U//pSNKClwAIMNJw/2VVUZMuIHPsIV+Z2b53bsRQWNUIIHj4N
         2ZxKjbNGuS8fuQcohQhVUnD9DIrc28ECG2ayBfIM71UUSkcU5OTZVWcKkUYSEHQ7yc3k
         eqypMr0QFNOzPwIJ6ukV4Td2HvMhLw+r2YVyDsEORuEl+4cHt2aQzpgF0ry83oLjhY6o
         BQfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787854754; x=1788459554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eXazbZDjHYS7TxQMC+6npHdpPuAZoywDenkIT58mmgM=;
        b=G81pa9fJWyEYQ0e9aE8wDzQgpUENpz6SN3OZE0DuRGV8FDC42k1aa6yX6rPSQSSgrU
         r3ZTXHSOFmvUXzh5Q9uMhjS8Os1WUT9d9FEtUNTXhzmltzxwlX9WQAFuXJO+tBDpMoiY
         qZ95IEdKyV/LuL7OJzNtm5W2rkh9ozc5Bx9VcWcI/OdsbWOm1jnn/cXfJFnYZ7WggzDw
         TizHzErFU1iVcfvRL+DnwqIHpW/mzKWk9pOquHvvI9Xhq6Ipuk0+8HoAEPZImmAE06uy
         An71c0RjzwytYsEgDba1HEfBJVpqboUVAZv1Rv9MxrLZVWjlj9nq628FrP9YjKB536AT
         bnZw==
X-Forwarded-Encrypted: i=1; AHgh+RrtgLIeij1Ws5RoTcaCU4ZqgbOa/Xt97Y5NDmKMPlCon44l2Dt22gAbhQGU81j9RaaXZnb8TiQb6h389YE=@vger.kernel.org
X-Gm-Message-State: AFuF++mViWvFgnzMZzG+zc7KLbmU0iXghTg+yU1B7b0mzFCkXd6onEZw
	O+lmpOUztpK5FZpRtPueTrtIQdhyefOcEHOAFVv7s+fjvs6jfALwzSHU
X-Gm-Gg: AR+sD10ceLtLQSJ+ZamKuUQil88AfQKWKJuRCnp3wkEA21y8nhbSOqM94RMkGTAf5BV
	sCZkxuudiTYc2VDQo+D+td0RTa7feM4Df4OMnjtU1vV2zxGQT886ucd3/mOweOQiquCc8oItH03
	nY+IaUewFhdvR3u24jkH5SdlHTQjBzsM/q/Pw3DV4SXKdu+qb6kw8NGhQUDCTsRopr79tu5fe2M
	wsqME1ODklfbQaxQXv9sq8gNzhJcOnU2wMTFj6tacLYfDG0kEpCyCUt0gxxe/GfZFDI25taU+Th
	AqagWlyGya5ntuINlZ+p2P9VmOEfhCCk60fSg9iMAySGpiDd65tDmFsrcMMUkhdojpcGwTZ3FfO
	woABtsnBgMTL2J/jf2iu88Ry8ZbeiJWSlRo+0R9/XBlWDywj37DaAFbJCJpYNx4RlpNQAXj2fFV
	Od2vjyDCyJchhfe403guyWehciIyUHBbarZ7lFhfwfHzrixkPqtpgUXqRs2ZSNVJJ/KFrUipOxV
	2uvPSxWov7NaMIQ3hV+54uvYFtJXUuDfLogBc1G16pX
X-Received: by 2002:a05:6000:2388:b0:47f:5369:bba with SMTP id ffacd0b85a97d-482f79d7637mr707984f8f.15.1787854753934;
        Thu, 27 Aug 2026 11:19:13 -0700 (PDT)
Received: from 1Z10 ([78.213.170.242])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e279eef5sm10428350f8f.1.2026.08.27.11.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 11:19:13 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
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
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: Re: [PATCH 2/8] media: i2c: Add Yoga Book camera ACPI IDs
Date: Thu, 27 Aug 2026 20:19:10 +0200
Message-ID: <20260827181910.2431826-1-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <apAKR_wiAUhI0ZQn@ashevche-desk.local>
References: <apAKR_wiAUhI0ZQn@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Here is the requested excerpt from the YB1-X91L DSDT. Both devices are under
\\_SB.PCI0.I2C3:

    Device (CA11)
    {
        Name (_HID, "INT3477")
        Name (_CID, "OVTI8858")
        Name (_DDN, "OV8858")
    }

    Device (CA01)
    {
        Name (_HID, "OVTI2740")
        Name (_CID, "OVTI2740")
        Name (_DDN, "OV2740")
    }

The corresponding runtime ACPI paths are \\_SB.PCI0.I2C3.CA11 and
\\_SB.PCI0.I2C3.CA01. In v2 the ID additions are split into one patch per
driver and preceded by the requested C99-initializer cleanup.

Maurizio
