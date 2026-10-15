Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 964C94AB3C1
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 19:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792092422; cv=none; b=lUMRlfEytfovIJUR59Id6T/ODGRix30/GGdGIPNATRVbvPD51e+STph39JsTzMSMZ/sxR5ucAj+mfQMJFNHgwkkJPDytE8jlJqL1Dgw+s9nPBRAwRytt/Bmp5S6UewnJFF21Nt8GSgJgXQDJT/oDCBZxpwS8QxL6FLI2X8oEk6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792092422; c=relaxed/simple;
	bh=KfP/vjeGWsuZ4w73uZHQKGJi0F/32o26SPzn575BRdw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AxcsgzcorxAG7qx3LCsrk4ZirJZMGQ39vYR+ixmmQ6zKDbiNVVPn8nYgdILPa2IBYbKeAjz6Zl04zQsrwtSArGUeTT/4v0eLesdqu1r3OSBrhmlbVRt/8zXNvzRL7ciBUUXSeBUMJJ7NjPVUSkJYkpiS4uDZh+Ifg+YUP6lLKvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ghleTTrA; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ghleTTrA"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-535179e995bso70106531cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 12:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792092413; x=1792697213; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1BOiR3HjstR3v+8dWKVs/nFPkMjZqmy5flCQLz7ZGEc=;
        b=ghleTTrA8sN3BkxMrEg+fVh8FkC3NAswPWRc8KNteLq+XWUBrCuH3gy2skylDXgdkk
         2Kw6RcWY8I6DoT7Bk5FPSU1UgXyPJ57/1J3hnFDLfHFYdCEzz4SrPkQNJPc2RzmS5CLd
         4zAzML1nBpVVqAnDE9xZZiQ4TJHyFLALOgMn5HKKTZ15PxJTsNPLsf4L5zRPe+OXhh/J
         YwrsvGQcfpiwb90OSsB3P2MjvSRRxu7VyFbpnYrhIZoJxlCVZqKejy1JbwvcNUES9K/F
         lSi3aGkeLfw59/s35p16i+5mLhuPk782zXkclllo+iDEPaBtZ89srxGR575AKiCr4OK7
         t24w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792092413; x=1792697213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1BOiR3HjstR3v+8dWKVs/nFPkMjZqmy5flCQLz7ZGEc=;
        b=jZDTXqF1Is3rqwZIEFOS562wB76eWHBdV0qOL+dlDBDaQ4awh+XvHFD75p1jRyiMuW
         M3RfdEhF+jnueg27XtFfai047Gk/7aPsNxO2M8eLduVvBVLTGkt+poZ+t2yexmH0ieCk
         fNGdImnUAN0x/Z8t0S1HvcVOVWzzbBm8LFDTljjjiJGLRkQ+r3QywMOFqTV0BSEWkmtu
         aN+jr7kj+4AohhehLzmPc3c69iuRIK9KkiLwWIq1OrWn3G8v/5oF9o66RvYtB6rxabhl
         RgLKLej+w9iWpuiTHQVUL8ZcyNUHKW1lXU2iL/ZEGXVfx527Zwh3IL+JpM5kGcd+Yz5x
         2vBg==
X-Forwarded-Encrypted: i=1; AKwUvBweXRiw+AfodgKxNrCRPcwCCQYi6YW6BF9UImr2Fg19bsutzNfmbNNLA+Q11UC7V+gTBz7RQ0y20oInvVM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIf/eQCfQibwzz7tn5LqIwIWlD2KTXYA0isHjOCZvAC2uvUJoiF
	9Rb9Gr0zIQMGKcJMUZGhuZucWayWVDrfvzj9wWQPCE6xGUi0AgZSu/o0LCaa2BeiL7k=
X-Gm-Gg: AYBFou1jPtBZm6zbwa1RAtUyYGBbWJ11WWbhuqhNGNVFuhn2rf56icX+66pYJ9KMMrc
	iWbrJn0DhkONVzYjRJ9VUVNdFW8O4wnXdZ9LmZ9xY5cntPSRcfWpeUFYSMBIots/FOU6aneDsRo
	UXmC9Ozxhj/JwNSCAc9QO4uO4lPZNbZDPyirTvLs1HB8V/9c6gZ6LG7DuBhBIX0UsgSfCOjTQww
	1lWIeYWJfbKAMkTG5NV/11cvyheBNZWac5w3OIhXDgVK8arCp2BaRV9Ws/mJGdDMGQDloINkur7
	swaERC6vmNoIixMIFEm2VSPmlrVOp5U5Gc+WQpt+dE/J/RNDeviJLDHSnC2bW2BV7Ad13yjPANy
	V9OjsdW7q0ixf26+uaYhm3caLGz1rfVzZJp717tsYH6uEOeWqLS6ma+rs4YSkiMigNfICmoccmp
	db1SRI9TnKUbOvCYdr00NaYjiFOObhn4lhQ3plIrvRXFcbfINtYCgrqH9rH1w9hZqjvCUtbkYJX
	YQCCWd0N61FwV+tKSOuoyBpJDY=
X-Received: by 2002:ac8:5c8b:0:b0:535:cd9e:c12f with SMTP id d75a77b69052e-535cda02393mr232419501cf.32.1792092413486;
        Thu, 15 Oct 2026 12:26:53 -0700 (PDT)
Received: from localhost ([144.121.52.163])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91bcbb8c4a1sm3270566d6.45.2026.10.15.12.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 12:26:52 -0700 (PDT)
From: Ray Strode <halfline@gmail.com>
To: rshouriesh@gmail.com
Cc: bod@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	hverkuil+cisco@kernel.org,
	j@metarealtyinc.ca,
	krzk+dt@kernel.org,
	kulikeduard89@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	robh@kernel.org,
	sakari.ailus@linux.intel.com,
	vladimir.zapolskiy@linaro.org
Subject: Re: [PATCH v7 3/3] media: i2c: hm1092: Add ACPI enumeration and the 19.2 MHz configuration
Date: Thu, 15 Oct 2026 15:26:24 -0400
Message-ID: <20261015192632.283185-1-halfline@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261013-hm1092-driver-v7-3-d81a9b152ffd@gmail.com>
References: <20261013-hm1092-driver-v7-3-d81a9b152ffd@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,=0D
=0D
Regarding the crop-bounds question: the 19.2 MHz mode reports a 1294x734=0D
crop at (0,0), which extends outside the advertised 1280x720 bounds at=0D
(8,8).=0D
=0D
Reporting the native array as CROP_BOUNDS accommodates that readout window=
=0D
while keeping CROP_DEFAULT as the active area:=0D
=0D
diff --git a/drivers/media/i2c/hm1092.c b/drivers/media/i2c/hm1092.c=0D
--- a/drivers/media/i2c/hm1092.c=0D
+++ b/drivers/media/i2c/hm1092.c=0D
@@ -836,12 +836,12 @@=0D
 		sel->r =3D to_hm1092(sd)->mode->crop;=0D
 		return 0;=0D
 	case V4L2_SEL_TGT_CROP_DEFAULT:=0D
-	case V4L2_SEL_TGT_CROP_BOUNDS:=0D
 		sel->r.left =3D HM1092_ACTIVE_LEFT;=0D
 		sel->r.top =3D HM1092_ACTIVE_TOP;=0D
 		sel->r.width =3D HM1092_ACTIVE_WIDTH;=0D
 		sel->r.height =3D HM1092_ACTIVE_HEIGHT;=0D
 		return 0;=0D
+	case V4L2_SEL_TGT_CROP_BOUNDS:=0D
 	case V4L2_SEL_TGT_NATIVE_SIZE:=0D
 		sel->r.left =3D 0;=0D
 		sel->r.top =3D 0;=0D
=0D
This changes only the reported bounds; the mode's crop and register=0D
configuration stay the same.=0D
