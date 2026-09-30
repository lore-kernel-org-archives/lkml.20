Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6442729992B
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 01:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790733526; cv=none; b=ZZ41kjVUFRqMvfs0XKio5oNnaz2lFIZaXjK3eyB6roRxV+CUAW+7wLZkyuMXV+v4AUwp4V4/SaO4yH7DHByrm0GLKX8NSXoXj+nV9lx3IZI7qik4oQsLnz9mVgGzeuKDPRZI9DY6FyY6iEc9xff4zE9n9Y0Fm5CV7T2ndMcf87U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790733526; c=relaxed/simple;
	bh=Eyn2E2FvVFCJNg7yb1TPx9O+fNtB5Oi/TdanUqZxYEs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Knt8SOebQCAfKggYiAOskgHQr/JZ8B/acB708YkOSOdqV79kPo7TEnLuQ75O1bvXdIhD6+BFdjq/aSmgJZaiBXciCQfpoqPobwYojtx47ewbfCV7dLioshfp4K8dbzU7ad9ZAuukCMCpbYDPhpgn+IPvFMfYne2PIAzkflWb9SY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ss7awoaU; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ss7awoaU"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b8e986b8b1so4878477e87.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 18:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790733522; x=1791338322; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g1faA/W9nbbijKsh74cTmCcYMwxVC2d4f+A1unM9IIM=;
        b=ss7awoaUAYueGy3JTgmqXLwHIj+LZ8fEyvYNeItGBvXp/kAv1PnTE/mflnzi0kX/My
         RycOz3x0y1PkP8CGSTNqS7OiSRScqDMOQzYiOe9414etcfOw3zo9KqJVqLyw2vV2pxG7
         KhPpOmmZJId2AMBtWJBpN8FKsUz1CVl22JN+boGZd8i6rwBWUj243KzXCsfT2mI39x2d
         jKtDJ9lQWdAAl6S6sxa2bIHP+VhSHzXmU0ykgF/5LmuhQ0X8BIQzXXd5ZNrgpg7g/qO6
         ucI0sKBWal862mY+f4ClWl1o9yVwPSNNpiRDa7FyZRvo6vgfXg4I0xRprIoXyi0/4TY5
         76pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790733522; x=1791338322;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g1faA/W9nbbijKsh74cTmCcYMwxVC2d4f+A1unM9IIM=;
        b=u/y7WKoTKntVWw4sVVvECs2PREHnBXn5dg1OTlwu7En2J2BAAYug/qvkLqVmwEOQz/
         7Evg383vTMbqe7El/Jluq0NeZXLTZqnyG/+FqjwWyFAGp0XKzVRaGgsDxaBeFKWTRkpk
         x2XkSL/Og377EF16UlETiXfg28tZW9ubbyAcN7tKgf13zZ2yMl1OxTRuyPaRlp/x+y+V
         SW7sze39Gi4fmq3Lyvbbt0lvnsf6aQGginr2jQJsEnhvB0F0IkuZdu/ESHnArf9sPq00
         60R0chYBRKaEPV1gRxAHXlnz5uK6Pyrrsj5oTpZJotyiilEvL1hKY+n0n2PvDolMX8W4
         HNog==
X-Forwarded-Encrypted: i=1; AKwUvByjWYF69ZUsp9PfeshYmXk7K1JZV5cxX6Bc79DuLF2wLX9B7eazffcCBCDecGIeSguS/r1BmGAn0uivs8Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYKRfqoXzgUpJpN1EdvRQJYALGfFT28n2rcMB2vNru7cNdCqMBNT
	lgSCQEF/39xlBpoVL0cjgrSuml932CBtT0XSYVxqQ4XgpFqBdwgn0bV3
X-Gm-Gg: AYBFou3imUnYlkXiBIo9EAiPt11mw/jsrNSNnTV2x6eOUx3ebKScfE6jPAwQgVch7Vm
	ASXtl75LhzxtyTXvgonY2tChngLvwtZIRIqMioIwpDvuh4NOyLV4wVCyyPzRcLnA62C+3l38qxq
	VlV8+mIzv9euiHrHjRa2SdtzDZY6tpeDP3lyY07kJORfER3JCBFCqnh7iqNMvhFkxvcSrODRvvh
	H9FXiiXGH52so0U+MbWAxliIez3GSpFQuAoU8EoGcSkAo+X8m1ORu5l/Tsawb6AiVMW3V3TDyIK
	S76QZT56CcdcbSk+FX/h4nfQpa4pJd1ztSvf2PDm1CE5iCcI0tzmJBHEUEhXb0ALjzLJcuCbyli
	DOtQ+fv2pRZfc48cgGTGSHL6EZsMlLJkVmYSarjdgNqwa2dX41n/mFI9igF7TOfe4gmDEWaJ9jI
	n5PMXdbayxuvZOV2TF02uDVhgUZqFcR1GW1RF749U8IrQj7xrVqDv4q8qTVfKvlmv32MXNAI/j9
	Gc+gGpLNFQcgmb1rcZR+TV5m9iucnmFK4VrtF6CMn7EVnuzKz5XzxndNOBzXAj3vM29
X-Received: by 2002:ac2:4473:0:b0:5b8:f417:dc00 with SMTP id 2adb3069b0e04-5ba3bca837bmr295821e87.22.1790733521846;
        Tue, 29 Sep 2026 18:58:41 -0700 (PDT)
Received: from wildarch.lan ([109.72.228.33])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ba3b4639e1sm355442e87.21.2026.09.29.18.58.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 18:58:41 -0700 (PDT)
From: Anton Karasev <uselessfire@gmail.com>
To: chris@miget.com
Cc: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	W_Armin@gmx.de
Subject: Re: [PATCH] platform/x86: bitland-mifs-wmi: Only check the function id of GET responses
Date: Wed, 30 Sep 2026 04:58:40 +0300
Message-ID: <20260930015840.3114671-1-uselessfire@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260928154337.154969-1-chris@miget.com>
References: <20260928154337.154969-1-chris@miget.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Chris,

The Redmi Book Pro 16 2024 (DMI XIAOMI / TM2309, BIOS RMAMT6B0P0B0B)
behaves the same way: its WMAA SET branches only set the return code,
and only the GET branches fill in the function id.

Tested on that machine, kernel 7.2.7, with bitland-mifs-wmi from
for-next ("Detect failed function calls" and "Treat
WMI_FN_SYSTEM_AC_TYPE as optional" applied) built out of tree, on AC,
writing /sys/firmware/acpi/platform_profile directly:

- without this patch, every write of low-power, balanced and
  performance failed with -ENOMSG, although the EC mode changed each
  time (QFAN 2, 0 and 3 read back from the EC);
- with this patch, all of them succeed, and reading the profile back
  still works.

Tested-by: Anton Karasev <uselessfire@gmail.com>

Thanks,
Anton Karasev
