Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B89B3B27E8
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 10:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792146434; cv=none; b=fJ52jpLZhPf2BzzYf2Fn/alCYD2wjduYi62aF67DIIaTBgoLawzMRRY6s16X0Dhv+BaYE15ISIoEVpAFcqkDfImLh33zohJwEiuXV06W8BY6ByllXKsxUkQN+MkYKgey+bUi6M/AxS0urRh19agAHvdhV7SUFfDbxIRzIRsyD6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792146434; c=relaxed/simple;
	bh=Ax5VOQA/Fi0laL2ZD1hrhTqB/HB9VBcr4363vS0YCZ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Od1kGcCs5osXfWnVv/BzxDukBJR0eVSu1SQlJfzi/Mafa+NpHW+9Du+DnpYH/UiHMh8lnQBXTD5i9E9OC6eYzYJAv2tjQgppuLXuCKnU8HC85wiXEJ4d0WOtUsCa/2IBFnDBCEosOtYO1PFQ2L9Qw7B2hQESpzvCpxKWCBjnYsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sa1JMdD2; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sa1JMdD2"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48afbd2c386so3728786f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792146431; x=1792751231; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UyhIdDi1VpYOEm/5a5yHitWOCTd5K8IUtK2pMbtEUUc=;
        b=Sa1JMdD2igl/XmKM1t8uBzLcDObQGTu3VWICw1RgSo7iLPUDNSLYILQElotAjCCAXl
         MtSHXiF9n2QUrn9I2qBmz3RZqrS7nRPrYHWoQM/dJPJTMYKN7tAc8jpJLOQvSnQRlsMJ
         2QhlCyrd1AtUvYJihFp3GJGgs07nYdmiZN3zX4aw57G9s6Z48l5hRbnY6yaysMl9gaMa
         83HiJEKCD8Rc6k60+kt47+Ws/B2dENC9nkTPUlqaB2fBLCwr5Pv5TREG6tbhngv1aEla
         WmOWQA7XZ99hb5+jUwd1wOR90qyYPFbzBzjEnAC0+pbhRy4pNkOMwF1LMbBMheud6FmG
         m6IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792146431; x=1792751231;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UyhIdDi1VpYOEm/5a5yHitWOCTd5K8IUtK2pMbtEUUc=;
        b=Lo1o/7IjM2wh9xkpW+lomXqMSzKnoU8WtsJAqGTGN0FtrRQGbNEmqj9lfcVKqGnQNk
         lq+9nI52/yO6WYwJ+vbgfBwZ6+cyhFangBk6Y3uzyU3pTxwtEtLruzKa79oRF+FzBfiZ
         zTpsHKu6H+ZJIF97ym0A3EljeiGv8k9scpAuuAULsHWgnh/xy9tDq3AYc+KAa8y1V2el
         b6mHTDt+Z2T4Y5mizB5b5/u5X1CgvkNshjzHArRwQ057mZbe+/unLzKgajNhoDN7Rg2i
         dB9G5ordvgjYMqfU2NJeaOOOr6djW+6mThPXWcs/B04SD1nJxQEGgWsawfm4WRYVRd0T
         /eEg==
X-Forwarded-Encrypted: i=1; AKwUvBz5rI2Qtgr2Nn8QiiJ6rinK4YJxnT4jOhUHVgYtuypT699BbmO2yKDGRQG9JJZEw9tCE91DqwaTdWBCfT8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLPfgKBDSpeJv+5Sc/zlX9OQ7Mxt04cZGknufElc3fVZJKp3Ox1
	LWYV8HG94A+Q0RFkx1hOh4wdVN3uNyx2Gc9Y/n3nEOIkF8Cr3CCADWB/Z9nlwh+K
X-Gm-Gg: AYBFou3b8o7yKPf9TfU23prlmK5x90ry2qOZ7z2AK15M0/1Tt6GyP0ZU9/gicpCblQQ
	zEg7Be5oUmnazeZUYMb8i9ar22tqZagonHGbBD1UMi9lq5F+3QIe3TLfNeFH/c2/xwz1Zfwi0tu
	5Xi7iOaIlKr1BvZTT76jUaT4HDIRKSCwARiP/S1ebE7Fl9tIBH5qmPAQLJUGA1sNgruEN/Z+GX9
	W0XrsWBJZQpX3nghFR/iSazOXsNuQ5swI30+KYdY48r0EUVDa16ObcSpL26hzr3m2ei9yRmvraE
	+Jx+si6rbXdFu6dY7CWFcq/LPKZHkueq1ZTEL9/0LFbu9gr4r1WP6WKfRjmySsElL8mtjl/C4UC
	iAdiONLQCGXjRVZwJh4J/BIBLcIgYDiUnRuVm2+oirOSflwdWCthSMEyBYiph/Vj6wkftjBNN+g
	sTEuaE3Q+Wq2J5v1dt89OgLLnph+5TecKBA7O7VKpwsLp1fpFeyyUrB3MBcJjHAklEbXSLV0B18
	oY/+oJ+whV8DbqMGDJ+qbjbkSgoztOjhZeFWdOUB5dLaWqWEpm+yHlrnbzx+wEFNKwlrlxD
X-Received: by 2002:a05:6000:26c7:b0:48d:ff06:c634 with SMTP id ffacd0b85a97d-48dff06c78emr2653168f8f.54.1792146431162;
        Fri, 16 Oct 2026 03:27:11 -0700 (PDT)
Received: from SP11X1e.cable.virginm.net (cpc99340-croy26-2-0-cust244.19-2.cable.virginm.net. [80.193.62.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4c4fc4sm3698139f8f.15.2026.10.16.03.27.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 03:27:10 -0700 (PDT)
From: George Neacsu <geocausa@gmail.com>
To: Sergey Lebedev <lsa.uz@pm.me>
Cc: Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Peter Marshall <pm@petermarshall.ca>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Jizhou Tong <fqwqf@fqwqf.xyz>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: i2c: vd55g1: fix VD55G0 streaming below 900 Mbps
Date: Fri, 16 Oct 2026 11:27:09 +0100
Message-ID: <20261016102709.30467-1-geocausa@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261016070158.43624-1-lsa.uz@pm.me>
References: <20261016-vd55g0-sp11-fix-v1-1-eb14bd80d8f8@gmail.com> <20261016070158.43624-1-lsa.uz@pm.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Sergey,

On 16/10/2026 08:02, Sergey Lebedev wrote:
> So here, writing 0 there does not stop the output by itself. vd55g1
> writes it at every stream start instead, which may be the difference.

Thanks, you are right, and it is not the place either. I retested on the
Snapdragon model with the line length change applied and 0x0329 handled
three ways:

  ISL_ENABLE = 0 at every stream start (as in Peter's v2)   6/6 captures
  ISL_ENABLE = 0 once per power-on, after boot              2/2
  never written                                              2/2

All at 840 Mbps on one lane, 644x604 Y10, with real images in every run,
including a stream-start write on the first capture after loading the
module. 0x0329 reads 0x01 after power-on here too and 0x00 once
written.

The failure I based the ISL change on came from a debug build where the
line length was forced by a register write just before stream start
rather than coming from the driver, so it was not a clean test. I will
send a v2 with only the line length change.

Thanks,
George
