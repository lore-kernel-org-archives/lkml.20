Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B4CD4E8DF5
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 15:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788450983; cv=none; b=oPGltcsct+vp2eJDPII7Db/m0DK0gYlWCsTdfQJinkds2ayHBLOnfDjNR5Wn4mk/SjLInh4ty9NagKEYR9O+hS0bh2BKlaZBbXQERg6Ljx42itfg1AlyyJ0D4ZisG2u9Qw1buUuDcVjB/9/YVt6FJtKKZbGwAKPZB91NPTM3W7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788450983; c=relaxed/simple;
	bh=9BK1kyxk5Z0/CaDbriSQ++DzrreFQG+kLaclcVYwGN0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=o9ESAQRDew+HdO/0ZsbyTvBkov2EonTT/y/5/k4C7e+7Wio+h6aYTiTT7LsWImmUsG6iHxCTQxcw7JcnLROIbFTDA++LFhonILw91H8+b8TNr3Gy0V2vTy1a/uL3pXrCSI5s6Yn9YGnL/XeHYsBroQ+KTb2nPRJPF61N2dQRo4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=btkRkqlf; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="btkRkqlf"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-482e2fdf5abso9375f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 08:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788450979; x=1789055779; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qf5A2iWXrze7f/WQGCmLESIXScEzdMF2bet/pRtY3Is=;
        b=btkRkqlfotTbaNJJyaxS4LwL7rBuN8VRekBWvzMifhXVTv7st8iBwhg2et4/seMKtS
         5kuo1D/4VmvPntokf67cJPDTL4LNAz+SGUysGEw3s5N98UdMU1ZtwhVAvhi+ugahidtT
         jfSwJQ7pt+GVLsXUHRvvPtjmuMziLsx0F1yEEAC8PWrg/W1mpyacXoyLgZGqnQVA273r
         n2i5GatRaL7j9G+lbpjzzjimD0AMbaXAu3o3KhOAfahyW52IJHcUxKg0SCr+TeVFtSYl
         LGlpsCEQRtO0rJ3q7SZbTqvR4ugigRDWDeGnU0OgmVdqIfW8u//Ii3evKOY6AJACEg0S
         DACw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788450979; x=1789055779;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Qf5A2iWXrze7f/WQGCmLESIXScEzdMF2bet/pRtY3Is=;
        b=CLOL6SQBTkaAT/ADPX8aC7e0Ra5LwZTRopbpT3iMY6oj7YlZszFcwOC3nTOZM0n69w
         bzb8nZwLCyEYuKnZvZEAh708bwpO0nW8YLNHgrQffrrKPA6KYNGDfTls2pM4gVzN0J0T
         kN6R1YOseB/q2miu7eXdqar4LADoe7eF+56K+j3Y66sNAB5SI4pXimSam8ClK0qr1uEq
         Vem2T3lyMfewES9O2BKrPKfYtVBQMwngPs1+xCa/wm95l+cVQVFwHHm7pFdQblrN72X6
         wwah9hxuxcwNMRajQaqUtw2TdPvmJ7BumotDq64CQDEYS4ojCTdt9Syju2T8kf/OPlLU
         keJw==
X-Forwarded-Encrypted: i=1; AKwUvBzrRvQOXxzk4+YDKZcVjEtioGWHIRekWam5Zp4IKaAhd16OFzj8MV9KqXdntGQq42gsPsuodbFYbH90Ow0=@vger.kernel.org
X-Gm-Message-State: AFuF++nMq97k2P/g594TzrYmpyXPKeOXUQo0tkjUFspKuPNIdDX/yknA
	5eG3xEPKyuiXh9xLIsmASzndKwmoEYyN0ST/tihyGxFniLTZk18KWUwt
X-Gm-Gg: AYBFou3zkuZ2cVyay1j+wmA8PiRp5MrPpMLvi2ogJf6yO3lyNdhQJeZvhFb1UzX4PDG
	SEI6pg51a/++5K3G1tq6aq2ODhGBt8UPrvUwEX5cI2aCOio0dAgOC/rDcjSWU5fCURm+UT///W0
	CrI0yAtn0kHkfGLoSSbCSxMjS2GHE3UaQbaiXqFRfQfhbHjp6TAGI6HaMdL5fYtrosvxLVgVyvb
	ZS80oZgS8IeCZ6noM6NYsHWbwzTYHjJNxhFwQ615cCIHGLwFUtlEK4jAsQLAA5vdZ/fkO3qW45F
	14060T8WPW1+rzSz/xWaGBzshL04f/nr+SkrspFkU1C2zampz+OHsuLuUtRJ9EE6d3iiA82uIs2
	hpyxHFIcae4bmA1NwSot3mDdBDNPAj2i+iYNRHUvpLN9oV7LPPCV7paFCDLK0S54xyPNdIV+aYZ
	0uZV43FAXarf4AP66AEit6byP+FFqH1D0MBqJ7VyPZ+OWpBfPeC/cMvIlBt1xDlcWdeltU31Tip
	pTLWZePo0EExvFH/8/yNHX4AiTPrQrKc44xEQ==
X-Received: by 2002:a05:600c:354b:b0:49b:d03:8d3a with SMTP id 5b1f17b1804b1-49ce58180bbmr220232615e9.11.1788450978626;
        Thu, 03 Sep 2026 08:56:18 -0700 (PDT)
Received: from omos-acer (109-81-21-204.rct.o2.cz. [109.81.21.204])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee6024a8sm80527185e9.6.2026.09.03.08.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 08:56:17 -0700 (PDT)
From: =?UTF-8?q?Ondrej=20Mosn=C3=A1=C4=8Dek?= <omosnacek@gmail.com>
To: Paul Moore <paul@paul-moore.com>
Cc: selinux@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] =?UTF-8?q?MAINTAINERS,=20mailmap:=20update=20email=20addr?= =?UTF-8?q?ess=20for=20Ondrej=20Mosn=C3=A1=C4=8Dek?=
Date: Thu,  3 Sep 2026 17:56:15 +0200
Message-ID: <20260903155615.516010-1-omosnacek@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

I'm going to use my personal email for kernel contributions from now on.
Update MAINTAINERS and .mailmap to reflect this.

Also switch to use proper spelling with diacritics, since I normally use
the full Unicode name with my personal email address. I'm leaving
in-code occurences unchanged though, as that would be just unnecessary
churn.

Link: https://lore.kernel.org/lkml/CAFqZXNvOGbzy8-ZnJtKi94jfu2H173Tz7VYpK8KuseMQS-9tNA@mail.gmail.com/
Signed-off-by: Ondrej Mosnáček <omosnacek@gmail.com>
---

Hoping for this to get picked up via the SELinux tree, since the main
change is in the SELinux MAINTAINERS entry.

 .mailmap    | 1 +
 MAINTAINERS | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/.mailmap b/.mailmap
index 6803f3bd2865..0e672a60afdc 100644
--- a/.mailmap
+++ b/.mailmap
@@ -699,6 +699,7 @@ Oliver Hartkopp <socketcan@hartkopp.net> <oliver.hartkopp@volkswagen.de>
 Oliver Hartkopp <socketcan@hartkopp.net> <oliver@hartkopp.net>
 Oliver Upton <oupton@kernel.org> <oupton@google.com>
 Oliver Upton <oupton@kernel.org> <oliver.upton@linux.dev>
+Ondrej Mosnáček <omosnacek@gmail.com> <omosnace@redhat.com>
 Ondřej Jirman <megi@xff.cz> <megous@megous.com>
 Oza Pawandeep <quic_poza@quicinc.com> <poza@codeaurora.org>
 Pali Rohár <pali@kernel.org> <pali.rohar@gmail.com>
diff --git a/MAINTAINERS b/MAINTAINERS
index fc320b373656..875d0baed8b9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24772,7 +24772,7 @@ K:	\bsecurity_[a-z_0-9]\+\b
 SELINUX SECURITY MODULE
 M:	Paul Moore <paul@paul-moore.com>
 M:	Stephen Smalley <stephen.smalley.work@gmail.com>
-R:	Ondrej Mosnacek <omosnace@redhat.com>
+R:	Ondrej Mosnáček <omosnacek@gmail.com>
 L:	selinux@vger.kernel.org
 S:	Supported
 W:	https://github.com/SELinuxProject
-- 
2.54.0

