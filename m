Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F531304BB2
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 02:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790649046; cv=none; b=vANdA8QaOaGVadxu7ej8BbjAg5GDiGwYIG6rYmsq7p582xwo5V1GIGumE17y9OFydGJElpvtVULVPjTrBAoYuN4ujtWsnQiYf/FlzJOYz4Uuve+qVSq9mGcIi4Fiyeh4cz+DGWbiMgdAN/HtQPhBWmCXMca/RkL90x0gUDOjqTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790649046; c=relaxed/simple;
	bh=RqMpdApkW8ajUvKlzsHEFDCamm8McSuEQxfv4BjZxdg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=WTx9IFz6ZZfxSOpuhWoootcIf4n7YodlUuTs5h1cdFd3jWJeNgiSGZi58K0iBpWp+05E9AU2uOMTCrnuBZjQpczmNOJ1Z8v5V0HocfcypLN4dTIXAoh4VNFxjhtg356cfm1yHjfzl6tV4ezf2O9Q4h5qJiwnd/dOaeK8j149Hs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=BJWp+mSn; arc=none smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="BJWp+mSn"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33bfb26865fso3781494eec.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 19:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1790649043; x=1791253843; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UQ8x0qGG7PntgWtNVA3JU1IAHW0rcEHjE+FOFNOnDsY=;
        b=BJWp+mSnCDL9n56Yp8fsNM9oxbbqOl3lPQlPZc9dhbLGOSodGEhN9j4ib6Gjp0X4WA
         rxUvAnIeWrTdwsepcSrrj4tT0AwI+hKs/fiY7IUyIMtJhsvPkJcumLw6iHTWw0YJpGYI
         uauexwK6IjN4STuzSTQP78DGQBHmR0xfQTOKVKgB2L8p0NuQ+SJNZAuX8trx0hzWbdhD
         JOOi2HbHI/rlLraaeOW7zQ+rdao3n1STY2JktlVl/HBYx8cna8qj9z3ZSRPvU9qyeN8q
         QtcxUGKYDpvCl00vvYkEilKGzYaMgq3zhx3jqsJH1X7Y4rS5BG+oqDcxXxit0LqT1pti
         6P4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790649043; x=1791253843;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UQ8x0qGG7PntgWtNVA3JU1IAHW0rcEHjE+FOFNOnDsY=;
        b=R4iJBhlc3T87TBE/kKsOef/hS5aTiukeOg8+W93h0Uz56VSCwv1Nk+L5l/ntFfPjtG
         6Q0XPnlb5rBGYk7Xuz1o/C5udTUtmG7L2RbY7lgcCkzhSzQYPNRHZ6+h0J8GAvPUT9/O
         U2CMJUp6B8sr/DuyMSeEHsx0jTlGLxXTd2EAQD5fr2smfA3Fhtomp/Qw2NrdszXgCa7C
         9SfTKFgwNaKHywKUngOIksXZGrZGhH+3UqKIfYgXNP+Ih34nAk2xYmGdPCFDNlsusQg/
         RcITJdI3lJmCV681vxaCj3j/UPDV+HHz2JCjBg1ODSDPPxDbRc9Ya6iK8AdUh+cwrOGF
         etCw==
X-Forwarded-Encrypted: i=1; AKwUvBy2R12kwaENQN9lt6U0660Cu0TaqmVGr76r0+eZIV/LYCW5S0y3aFYSGXYCvFGc0/Mm7ejqfllCBF8WxRE=@vger.kernel.org
X-Gm-Message-State: AFuF++mEIPUuIpm5kz70oP+KI6GKNTbgxC9s/sV8Lhfu7BuA8khQwZcn
	z4uIm50cXtQ8JXADCgYuvs90ny+t7xXGMDWF5qnt2I6/FiI76GrcikHSWzHV1stj9sRHISC5KDv
	NMuxLfEs=
X-Gm-Gg: AYBFou1ddINHLnZHL1jfD+pmaYrc1ETT5aDINlpJ/MaWcSD4rTY2a5SZWU6hmd3//AV
	mqg9aeQpAWfAIpAUl05D/SvPn7ykbX5JZpI4Ol9eQWBdhtVccUk8ILP+muDruNaBwucpESZaIBP
	fklrnaJ9jyWaXrmhxqEp7X7vVqX4/FUUbmvlFf6Dvu92ScWLEyhl1dxVJ/v70z2dfgLPyY4epFZ
	X4lTml+780kmAiydJ/iSf41QsmFsQXjtk/oMABWbz/JXnmUozCmi26iIWOFtQBit3LLCqlF0SWv
	aoMhvoQstuGm4YGxnb3uB4LINzjI7WDw4hQddCg7Ah3encCYpWcv9sjaGyAcq/F/92yxKkh61jJ
	fomxOiZSJ+XRJ3LbXD4LpPPdmghqpgy8wkpID8RzT+UPFPbimH5KC4ZqJHM9CVXI9VQbFGDHHoV
	wcavJBWgp+X++m+b5SCI1oGEbxRPX3puRvND3JyrYbpQdmC/Ph/YAFxJQura6M0y2jDkH3gq3/6
	+3r+6X+5itAgn1yveDX9Na9IVAHbAIPRGeirfXsbzQV4xCGBpaUy/D8vQ==
X-Received: by 2002:a05:7022:1187:b0:144:c128:4c4c with SMTP id a92af1059eb24-146d077b4e5mr11330684c88.37.1790649043076;
        Mon, 28 Sep 2026 19:30:43 -0700 (PDT)
Received: from [192.168.1.106] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-341460f5166sm33417380eec.29.2026.09.28.19.30.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 19:30:42 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Finn Thain <fthain@linux-m68k.org>
Cc: Joshua Thompson <funaho@jurai.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Laurent Vivier <laurent@vivier.eu>, Stan Johnson <userm57@yahoo.com>, 
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-m68k@lists.linux-m68k.org
In-Reply-To: <cover.1790641175.git.fthain@linux-m68k.org>
References: <cover.1790641175.git.fthain@linux-m68k.org>
Subject: Re: [PATCH v2 0/3] block/swim: Minor fixes
Message-Id: <179064904203.1187619.6436512745094022925.b4-ty@b4>
Date: Mon, 28 Sep 2026 20:30:42 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Tue, 29 Sep 2026 10:19:35 +1000, Finn Thain wrote:
> Two old bugs were reported to me by Stan Johnson while he was testing
> my recent patch series, "[PATCH v3] block/swim: Fixes and improvements".
> The following patches fix those bugs.

Applied, thanks!

[1/3] swim: Return -EROFS when opened with BLK_OPEN_WRITE flag
      commit: d8fe777978a12a96cb5d10d6d888720fcba2da2b
[2/3] swim: Fix FDEJECT ioctl for exclusive open
      commit: c76b93df9ae61d8ddebf6aa3bc218252f85e80c6
[3/3] swim3: Fix FDEJECT ioctl for exclusive open
      commit: ce054fbe9a4bf4ffefef0f8e2504ea54da058ed2

Best regards,
-- 
Jens Axboe



