Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D93AA4A3D2E
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 14:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788361150; cv=none; b=UZ1pTxsXxgytDnSqWXJ+/30e8JglQnxJPQ8HH8VdCvGs4Scvo2kHkb2Jg4+jecm8mRj3Lcvc82QWUdP/7+/tbyXBJ8CTRt8Xs0/WNNvGy1iypwi+Aw7OVAQyArQPNKu7QCDY70MoEBBbw0ECtuuhtUA0s2DMvtm/ai2FgUvLmGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788361150; c=relaxed/simple;
	bh=ELrGD0miyJLias5seN/+vG0DXMBNmip19woOIuaGtG0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZHBtX24UlEB/AJpfJks5ipt7lOOaJrYFauX6gynn8QVCjUSfXSrkxhHED5BE/uYGedr+f4ahmYZWy91JqsobaQDlrbhS+MCJZ8OEnmTURvVe37MmyVQcywGLcrrryXWJb1/b4iJKPgGp404CgSwX0LCAwJNo7CswKg6sO/PGDas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G/AQ0PwR; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G/AQ0PwR"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-499b2981a7bso11672775e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 07:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788361143; x=1788965943; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qgs80PN+o6P1wEZ/3GKLDW9lDIEmnf6LbdiE+ajUdKY=;
        b=G/AQ0PwR1ZsIsag2VABoG8Mb8t4izSeSn1ZQ7F0kuuMjuh9EibpBtXUjME693CRyNT
         r5dP0zHv4EizzK9zzMumwXcqUGhGLCiaAbsqAQ1zNvwnNtRfytEyLbkhX6kjiflsRFcN
         B9dN7f4qtIGol4lC+ut2s6aAiNAyq4PVHvHEWvIIXlpHKwWdzbBNnFSbVmuYunrQmYBg
         TJjb8tP47GdfBHhy+5vTjsjFB1/dykywnaL/10hg+5JtUsqr1YvtEyix4syosxYkboN7
         yW37tiOU8trvC/O+BGMAWDuNSj0Gpq36Hl4SoZ+h+vPDMe5DXG/ToFNVZG5o5PxflAon
         kdlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788361143; x=1788965943;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qgs80PN+o6P1wEZ/3GKLDW9lDIEmnf6LbdiE+ajUdKY=;
        b=JJsPTTQqirijXNDg1mv/zlBHVzIzYeObsrD6ULi3jwFRytkFEC17XpYp0ceHEEPG9b
         R0Zm21Yr2geoIGQbWRWShbQxrpBPzxWth2avNGTz+0G9Y6UWmUXVlF7noZryK0D6OoLP
         +3nN9PzycS/qUt5iTn8P2l6TUUHDGbwxkuITk14+GvRaknRiHAoYN1x/RfyPaGSssusE
         ZB4L5F/QChycUvBhZ22MKpqdm1OAR2WvR7/UaTna5tPy0POWPfcK9xr6NEP3LaKUG3Vn
         wxqFgPqMldcWaKT0Tr6aIXg4JISV/lF9/TYYpDtntiYxGpEkfzoZ07U5QrG+skBi6m8X
         65jw==
X-Forwarded-Encrypted: i=1; AHgh+RqT98CElFIZ9ay5plAvHmZzNwKFWpTvK4DsGKxrnO+0AistVUpMr2MIMHMKFiyS42P/vBX01H98vlREvIo=@vger.kernel.org
X-Gm-Message-State: AFuF++kNN9GFBzCGXz7ApfhpLsjwlLVZDaujQ4zLx5K/6hcD5GNmZl4p
	DvtBVN/QV8ODdYRCqfXRL5eLwx4wm+/YXBPQJB1QXzDQZOhzmFEIdO6JyeoCUukP0dXj
X-Gm-Gg: AR+sD10o1c/lH5CFnJYoAXnRiQEDf7o3NQDjeJAu2RNvLDql8xULCIBxkIo2bcpy9yy
	WpM2pz8W0NG+R1SXrytHbWYBd6hefEMgD/maR643//6wxshFQews38dWWXizI5XBac9RQRfBFB7
	WwbPDZkbIfQQ7eQtKRc9AaQExx7k1chHhtwEAvAwUl7pM6R5Tj/euu6aaD7bqckyrAC9jWS/0v6
	Ay68PEiYmf15lB4Ar7g7CGYFxZopdOG7a0cGv7RCb/js7NfSnSxJb9OUXpm9FOTkisTrhOSy0Xo
	EP0Cb5tO7+7ZpdYX5pJkCz9NW9ol2kLuZYxyVDtGcbN7MU6lOQ2UepCh0fs5cqvQqYlAXuyupnG
	3RePaKayKft+qlyTuVs3oeGWj9XCK0AK0DL06FQhmWPNzZ7DkBKG++Dv3shDe1QvGKr8UxcBXBY
	rKVMIAxDz3JZ/L92fdKiSxp9ANgAmdwA6GPtX6vKSz9QTaFuvV4NUBNJ48NffZIe1XtNcchodui
	rhr0rgbhFyQmCvbEq28eyFlyLGryjzTS2cB3CXVchOecWkzQ/Vaq8eadb7pv+lS/UL+0zbr
X-Received: by 2002:a05:600c:1385:b0:499:83f1:398 with SMTP id 5b1f17b1804b1-49ce583e8c8mr91203115e9.9.1788361143256;
        Wed, 02 Sep 2026 07:59:03 -0700 (PDT)
Received: from chateau ([194.65.85.67])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce0b425sm154191255e9.1.2026.09.02.07.59.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 07:59:02 -0700 (PDT)
From: Sergey Zagursky <gvozdoder@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Miguel Vadillo <miguel.vadillo@intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: ipu-bridge: do not use the CVS device lookup for IVSC
Date: Wed,  2 Sep 2026 15:57:25 +0100
Message-ID: <20260902145830.1796405-1-gvozdoder@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <apfI7m2oD-k5GOYN@kekkonen.localdomain>
References: <20260901194526.6369-1-gvozdoder@gmail.com> <20260901195036.7648-1-gvozdoder@gmail.com> <apfI7m2oD-k5GOYN@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sakari Ailus wrote:
> I can confirm there's indeed an issue here. But considering the list
> contains the CVS device HIDs, doesn't it mean you're returning NULL here
> for CVS, i.e. not for IVSC?

acpi_match_device_ids() returns 0 on a match, not a boolean:

  int acpi_match_device_ids(struct acpi_device *device,
                            const struct acpi_device_id *ids)
  {
        return __acpi_match_device(device, ids, NULL, NULL, NULL) ?
               0 : -ENOENT;
  }

so the bare "if (acpi_match_device_ids(adev, cvs_acpi_ids))" is true when
adev is *not* in the list, which is the IVSC case. Both spellings are in
tree, e.g. drivers/acpi/scan.c:1800 uses the negated form for "matched"
and drivers/acpi/x86/utils.c:206 the bare one for "did not match".

On this machine adev is INTC10CF, which is not in cvs_acpi_ids[], so the
early return is taken, the IPU6 probe fails with -ENODEV and is retried
once the IVSC device exists. With the polarity you read, IVSC would fall
through to the lookup that returns the driverless INTC10CF:00 platform
device and the camera would stay dead. It does come up, so the code
behaves as the changelog describes.

That said, you had to stop and ask, which says enough about how it reads.
v2 wraps the match in a named helper so the polarity is visible at the
call site:

  static bool ipu_bridge_is_cvs_dev(struct acpi_device *adev)
  {
          return !acpi_match_device_ids(adev, cvs_acpi_ids);
  }

  if (!ipu_bridge_is_cvs_dev(adev))
          return NULL;

No functional change, so I rebuilt it but did not boot it again; the
functional test in v1 stands:

  https://lore.kernel.org/linux-media/20260902145440.1786297-1-gvozdoder@gmail.com/

Thanks for the quick review.
