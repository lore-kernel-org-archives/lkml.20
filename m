Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793135380;
	b=o0+/+lNYeG3jHmvF8zE8cg63oPXRItATVZVa14dalxporXgvio+Sk6P8Z5b2zfXWNZdO
	 Qj7Zcun/+plNioPKmXj6mSI8utGhL0Z2GAZpjFezg7Nw+3D6+63yC9VFEyu8ZPLBUJAKU
	 duFyKW34PyZ5x9M7MK0Uq2VmqNDbKIdIhqKcfyH2fW7yrkqListfa20XsXXfufjJbHSXm
	 p0snuApreccLL25L+gVD4Kc1B8WGGnJvVLjYAkQCTCRovjjc7uy01bVpy/yofBNx2np9O
	 SZL49BXRcJupLug1plk5lytnkxFZMbWg38XcuJ4/FGVt4J96tpsBjP7fby2nKYeujvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793135380;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=5xjzIYr+bH8hlCaoTxpmkLS6NjvJyW6sNrJ1hHd5rJ8=;
	b=DSEwdeI4nhpshVzsFSRjXLDcsLaAUgANK71ztXnLXDOK9nXEovBVihopQXp0HJZhgsPo
	 LY1vVCisNkdfjuIkNBvr6P4FUtHaKONZde7TJx2lzb6ineZF59kVGn1MERqhrRn3SQd8d
	 dhF2RCTH2RvhaxHHVC2RRYNPGOzM/+CeABwOHJ+svKEwJ4Hvwk4yJ7pS5aQkyYh3YREiy
	 xNRkAKQldFqz9uW71ghSxQjHw1Ahhi/7TbBrWhYZig+tDtvDu/eky3dzk8NiVrAvVChz2
	 TVCxmzTC3OCklAK0bOEuYwgtYLLiKsCUC3qRpcy/HqtgYH/A33LFGADFM5pNDevH4tA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20260707.gappssmtp.com header.i=@mg-crea-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=c4f9gxA9;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A803A606A31F
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 21:09:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A803A606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20260707.gappssmtp.com header.i=@mg-crea-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=c4f9gxA9
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48af4d4e61fso204981f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 14:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20260707.gappssmtp.com; s=20260707; t=1793135378; x=1793740178; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5xjzIYr+bH8hlCaoTxpmkLS6NjvJyW6sNrJ1hHd5rJ8=;
        b=c4f9gxA9gFBSUh0oJBf053KSbkujgNmeShZvYgLYY2/Y/MjA78j5OIYZ/bPiI8JcyK
         VjpVUOHlivKbXVx+g1cUv6I6+l+S7rowgRSvSOEZ5soXIqixdTMJlyHFcWLBaTLmoo6V
         RMN3C7Zd5+LUwQcRVeZXTjqMkjUVtCQoMgSbe0e8tVJ9pjOYr/I3E2U5s/SSeUppUtOc
         +Z7eMw5HLLS8bu7cB9FVKdyW6c2Tisvm2HiGpBJBRiJBragyR1zbS/JIUpuxM46OAL2P
         VNk5ilLHefUlsi3KwRisMDvpYhmNxfAGXvSUZy0Ty5wU/dRTAu6Jcb1yYnYqvBfmh0om
         ufbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793135378; x=1793740178;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5xjzIYr+bH8hlCaoTxpmkLS6NjvJyW6sNrJ1hHd5rJ8=;
        b=A/bedzKZceo98xphGLmSBCyKMNgDd+3z7sRaQu+g+E2pbSZtOq1wazLmaMtB5+k8eE
         ktAbpd0ZEv2wA2Ga73VeeQJoOsJJZlxMXLANrCExFrbSXR+jfcWquo1PK/hww9OAui55
         /ebFrBTQ5S0s4+kAoUUAmpaGUIu1ZGOboxCOvnZIV5Gg33LAuYS1dLzjAwkjBcA63Ao3
         oKvKB/iVuqjXEusDFNykxIDfaaR25/RgZ7w56Qxw2/mMRSWDyVAgsDqfDKAxietgQfFk
         soH+XcmmX9ykD6NyKLVUX9xLmqfP3vsbG0TQh/7H01ovfftXhaORj3QEs7fYE3ryL5NU
         Fj6w==
X-Forwarded-Encrypted: i=1; AKwUvBzMMNzji7CnLD+aLYuLG5ONKambWZUb8MRaUn1ySkswK0iEdRvIvsmJmtAI+hzjHU4aSagJcUn/KXDjVPo=@vger.kernel.org
X-Gm-Message-State: AFq9FYI0d836AwlnAV5jAipbPztR3YZhXzxht5TSBzbNRDygHC2B3Dco
	CYFGu4skyf2R47tMrnI2TiX/aK4NOQW6yp5WMypWP2lvv9xVxwJdmHTGaPhMDguClcE=
X-Gm-Gg: AYBFou169CCVTR6nsiuKfLOfUURf2/Ktg55mPtyAxcR+NX8FlV7NFKuGJo+mCkvaXxh
	Jk2Em25U+dnEEANy50zGt6fI70QI3rNq6bhPopEQtTL274uukVXzb4SE7A2NhT85Hi9SBXOaFAB
	cuFiIEZoVs4d8i3YQXAeX7VisRsGMIpxme5qDYPFCrWqXVPh0Em4/x8at3JAD3r2xux+qBI6F3m
	0Kl742DSfUOjKI7XHVRFPBVxT4ldKObIU8P2tza8XmtQqDL2mcnnM8LogMe00AYPm8EekW7zB2Q
	85ol6a9zIndn0XKv8msk1M5uRFtLDBHjPKLuqgRKPSZunOJvq2oMtt3dNzbcycaHeCdu/ucpm/z
	qj9IZIVDxtOSuwH0NeWo8I0/F8r2bwmG4iA+Yaoimot5raPbLytSSUXwOMBWPDFPfeSI1Imviam
	Zj+mTRb6uc/PUQ7uavJBYDk/Fyf5y8TBRunEJv4aQZLuNMytdkfFqkHILNnUkcmlyKh73TIYkFx
	F0tQZDbkxyZoED1COPpYqT79gRFKH2nnPQBvnR+mADvKnjPLOaBXR7XmTe8I1zDl0AzvLW/VjBb
	XDHsxhYal4Qf
X-Received: by 2002:adf:e011:0:10b0:48e:43a:1d9c with SMTP id ffacd0b85a97d-48e5d5d9158mr1044256f8f.48.1793135377892;
        Tue, 27 Oct 2026 14:09:37 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:5cfb:af57:9834:741b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd8dcfsm24488905f8f.50.2026.10.27.14.09.37
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 27 Oct 2026 14:09:37 -0700 (PDT)
From: Olivier Louvignes <olivier@mgcrea.io>
To: "H. Nikolaus Schaller" <hns@goldelico.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Paul Cercueil <paul@crapouillou.net>,
	Paul Burton <paulburton@kernel.org>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	letux-kernel@openphoenux.org,
	kernel@pyra-handheld.com,
	Olivier Louvignes <olivier@mgcrea.io>
Subject: Re: [PATCH 0/6] MIPS: Ingenic: Add XBurst / XBurst II infrastructure and SoC support
Date: Tue, 27 Oct 2026 22:08:21 +0100
Message-ID: <20261027210821.21612-1-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1792956055.git.hns@goldelico.com>
References: <cover.1792956055.git.hns@goldelico.com>
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

Hi Nikolaus, Thomas,

Patches 2 and 3 overlap my cpu-probe v2, sent the same day with
Nikolaus' Co-developed-by:
https://lore.kernel.org/all/20261025073146.25326-1-olivier@mgcrea.io/

Both add PRID_IMP_XBURST (0x0000), so only one of them can be applied
as it is.

They also handle the X1600 differently. Mine puts PRID_IMP_XBURST on
the PRID_IMP_XBURST_REV2 path (write-combine through
_CACHE_CACHABLE_WA, as for the X1830), as the Letux commits
ee3e4e8baeb6 and b799b9a5e4d3 do. Patch 3 here gives it a case of its
own with _CACHE_UNCACHED_ACCELERATED.

Tested on a HiBy R1 (X1600) with the REV2 path: it reports "00d00000
(Ingenic XBurst)" and boots to userspace.

Nikolaus, which handling do you want for the X1600? If it is yours, I
will drop my patch.

Thanks,
Olivier
