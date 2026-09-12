Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF2172E7631
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 16:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789230409; cv=none; b=k8c8bXH5YtmZfx80CaE+Jvj2D3KF1Q4c6AJuXxwcyVcCDb+lP7HQwWkv0mfodn72+LLbQIjWLi4p48a28cy0zPENMufupLRy9b0o0rUD8u18fTxI+Y5Odxbc4KcTq7pM3p3dIY3OiA8t2n0pI10hX85xKrLbydbeOuOP57lBAUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789230409; c=relaxed/simple;
	bh=2ybGNvtRPmELIiuqpy4MyXSFl7zacEdOM8euYoyTYNA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=a9Ari/nQEAMDi2eQVMATmaczv4g0m8HZEnEcr3uvl3VyNGFCo3ut42oaG62Yx8pa9oQIuDApcUf8Fg6ffeWRlhP2ndwW9KRtfsRZo+FVdSDdCtiUMbM4eOCjdutFVy2F5XOHKF2U8Yeliwz8tfqg2WLnxGgqUWF8lrsHYh6Ap7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qQpDjRLg; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qQpDjRLg"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5b76694fb7aso1790363e87.0
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 09:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789230405; x=1789835205; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CgEC75mikLCwF5cE3ExQ9CoPkC0/OMRsItLfyWpU9YY=;
        b=qQpDjRLg8IZhUfvWBmMMysx9/KgCXzz3LvK1OTkBIOE0Lpdp3gMCunkLg8f5Q5Pvu8
         EsC3+DrdZx2EXIvZJV8frQPPWFe9N8Vqx5RobQrHYqtdAU+n0G2ARbITIzoZDp+ufrW+
         WWs3KQ//4QBiXKDy6mfqHe79EazeO/6Ul/UnFl5G4PPdIpfKBw41z6y+6mjaOb7n762V
         nxIzP6Pm9ECqH+j3bwUF8ERtHGmfsqg5PP5NX18EbXIbxAIU5fnN1Md14KAk7VgQ+gYF
         4o1NS2JN9Itxr8ud1GnTYoAf+TKDpCitZf5ax/O4AU4jmt9b3eM66Ow1sVxlv0cg0TZ4
         xglg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789230405; x=1789835205;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CgEC75mikLCwF5cE3ExQ9CoPkC0/OMRsItLfyWpU9YY=;
        b=az2AXfehL5Vl8Jw8vrq0KICaPdR4Lx/7QwOq1biBJWWEGS77dFx7f+nc3WqLdHSwxU
         DcPfO6INNtG3mK1+D+LPINVQV38peJmijKopf1Vs3lYXPRgb/owyDBv2ZJTMvv6rDRWu
         8BV0px01QzcRfqhc5v06YZ0O92JgbLoLyXYUB55rrI5bEgFeSvNID2cb838FkKWR1Ful
         j9ksFbz4eNJnbwOB48/u/R+0sQHfMC8eJZWwPGJceOLTN499xyEgCvEnf5hnTANzI8Xf
         2T7QvgvVjl+TJ6ijbsKHR6K5VZmR67HE9/UbXsIsrLvddqo0oUM9WgcHhITs/Tl1svYI
         pSLw==
X-Gm-Message-State: AFuF++nmWAVm4dByZr/CJDmoYYjNt86rKmcERfT0MfSoQ0JwuZdvpNny
	1CQsW97C0edeykYVwac5tn112/RDoliZR4RXR0iymSQBmPi10UjeBFjU6JejW0ukCYY=
X-Gm-Gg: AYBFou0UgFClyPVF85Qqf006S6rOmxAtrdTTBBbbDtyOcdMtpAUmnjUiRi+McjgNZ/2
	ub8yZF/iFLsU7Hv2mVTCweFMEp02XcFDK95Hs7NBwIez7ljpqxnhWIsjEZe+fOX/JP63Tteh7FR
	m/AzcWSN24UZVNBvudd7KAHS0w8TJWKf88Q8GvFn43SvufIDAONW6Bja7keseZ3Em/rX95kRfD3
	LfrOgodkTmxLZ5mvhxCS+uS1+28aXTk7u80RbmSb0/LM63hv6pSt+3dhoVyaMW90M2JwM5rYete
	B2CjRjYvk1WT/MMec2EuF9oZjGSLIDACtIah3sNvpcfJ++F79z45diZwk/2SxPKPRJ3grAzG9CW
	27Nxmzi7PwiMyvb1EoJLkNdU846E3StGmoxg+kHW4tYqx7L8yc1AeaRdUy+0FE12UuBhCYCqis+
	fPqaoEYfGPF6DY/oG/irsgMPVLIqFhPsjwOw4dBUKyXeYYc1HeMgTRabRk9U29myWlYn0PikzYy
	oKm/xX+A6Lk2ekkAetbsa8BO9efbZjSDA==
X-Received: by 2002:a05:6512:3d9f:b0:5b4:ab0c:f606 with SMTP id 2adb3069b0e04-5b89a2e7c1bmr2727737e87.2.1789230405156;
        Sat, 12 Sep 2026 09:26:45 -0700 (PDT)
Received: from localhost (host-80-73-162-2.rev.as20985.net. [80.73.162.2])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a047aba2sm1364112e87.73.2026.09.12.09.26.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 09:26:44 -0700 (PDT)
From: Andrey Golovko <andrey.golovko@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] mailmap: update email address for Andrey Golovko
Date: Sat, 12 Sep 2026 19:26:30 +0300
Message-ID: <20260912162630.7731-1-andrey.golovko@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Patches sent from andrey.golovko@gmail.com carry the authorship of my
commits, but some of the tags I gave on other people's patches use
andrey@golovko.me.  Map the second address onto the first so the two do
not look like two different contributors.

Signed-off-by: Andrey Golovko <andrey.golovko@gmail.com>
---
 .mailmap | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.mailmap b/.mailmap
index 37aad399e4e0..bcc092fd83af 100644
--- a/.mailmap
+++ b/.mailmap
@@ -91,6 +91,7 @@ Andrew Morton <akpm@linux-foundation.org>
 Andrew Murray <amurray@thegoodpenguin.co.uk> <amurray@embedded-bits.co.uk>
 Andrew Murray <amurray@thegoodpenguin.co.uk> <andrew.murray@arm.com>
 Andrew Vasquez <andrew.vasquez@qlogic.com>
+Andrey Golovko <andrey.golovko@gmail.com> <andrey@golovko.me>
 Andrey Konovalov <andreyknvl@gmail.com> <andreyknvl@google.com>
 Andrey Ryabinin <ryabinin.a.a@gmail.com> <a.ryabinin@samsung.com>
 Andrey Ryabinin <ryabinin.a.a@gmail.com> <aryabinin@virtuozzo.com>

base-commit: df2908090cda368b01ff43709f51890076c56157
-- 
2.53.0

