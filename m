Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 015AC17C203
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 04:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791086483; cv=none; b=f+FE54pXf/5GBOBT9N3vR55L533qK48DSo0HpLkO5Dj92lhTN+IHbYPArXGiqL7QjtIN2s9N7zxey1w9/HHe6aB91I7MWRMtv6Fj+RS/hPw98UevdY+1sQpDJpRxXD8iIgiQyjb5qgoKKtw63oyOfijXmm8SNEhvHAxX6bN3ZOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791086483; c=relaxed/simple;
	bh=M/DRZCYiuluO4WfBhgfQcvJdJ5//I9/6eDfS4FeNE6c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=sftrX08NQ4VIin1mqQLThXTQ9v08AgV1GD2icQfSvmtK4nir/7L2znpxBgiZkBRtjE/BVhHImyp71Pp3qQFXatp0/b3DXIblMtbQ7t79rKMlKGcHcP151aq8n23BFCcKPhwlkhsh1y5PsCa0ql6yVgi5TkARtFu2X8HIhpFiWdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com; spf=pass smtp.mailfrom=brighamcampbell.com; dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b=VWJzveQt; arc=none smtp.client-ip=74.125.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="VWJzveQt"
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-351297d9de8so22051eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 21:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1791086481; x=1791691281; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=UBu4+OK0oZjzvYRuy0gg/DODPE51bubm1C8uCd2Uv28=;
        b=VWJzveQtYqMlVYY85SMwS1AdwC8vsDi0T6vGBChi6c2YPGWxftuK8b3GP+0RjjrZBN
         cvbwgsiZMPNES3USKoggKZMmgZnWMYnnD+7sYgnfkEasLbiLSPBA9CJTlXqdvXso7sIp
         URk6D/CkAN/+YSBv6QEbOrzfd+TMwKLkxhIc80glN4I2OMfnx8q3nR2FQcOQzMvG2ywD
         cNeJDoSE+hXjSfAdxgs+Kbt/m+GHqAk86AgCKEvFyMlwqsIokI+6oXdD+7yQzcI0WNTt
         rsO3/it15OvXtxHQ4Oz4GiSGM/hwW7nuriLea7l9SXYAuRbGaFTgaTxG0hVh5L/6WibL
         tkqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791086481; x=1791691281;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=UBu4+OK0oZjzvYRuy0gg/DODPE51bubm1C8uCd2Uv28=;
        b=N9rA89Z/FinjCj6EDpM3PzTkWmwYHI587hkk/e0/etsTcwkWS0RRXaUrV5ZJF4+8WM
         xGOcNIdyn9I0KgHL9hPCQEPaXSLgtcSpe8JA+C4xRlY2adgJ7TwB291Y4XUvxG55sJdX
         PP8hThKSkpMoGiqCNu+DAQwUPFnS8e25Eyi6jC0y4HgTiwPwEcus7wFYaJVK8SEpbzDE
         T/gFcMafInJG4ySMPyuvSmV6HZeB2zT/EJP/aQZaHkuNBsJ9CS3hiIqZ8N3loIPtuhCP
         XPaUMfYLOpJDVXARsbd7+Rt3INXv529ewEfxW+1yhWWd21bvyCFxraJ/5/z1GcyUySos
         pO7Q==
X-Forwarded-Encrypted: i=1; AKwUvBwrCGWYb2juioP1ZkscQm2NFXvWg2SoS6PkqobUIdog1OYMcsojq80FFfd1cknpKOX/qpwObiyFKR70n98=@vger.kernel.org
X-Gm-Message-State: AFuF++mZdfPQoBPVYff0vT0EDvA+dOfloqO3CaPK6wr1jMJQkFP0Hf9G
	2DQzY0FkN1wL8PB5Wb25v0/hK7ETZH0vehKXAzFKt3vg29lV6ekuPrjdML3KGJNCXVrTNOx9pux
	G4/eE
X-Gm-Gg: AYBFou3QtYL5yurr3sYBxqXqQsIyJBc1J2c2Bsisu+RV7kfYArja1sFyn4GukwS+0BD
	n0iT9vxqHDnQOZr22LXM+hjJmp0THJYcs0KgLTxjcNPqzU879vNt18Xl+bJp6OxrXVTFKj+xLpi
	prB0fYgWFLh/Xp+qejsKLdBeOZ3df2WBhu148+Gx92E/BcNcM9ox57Nm0YgUNOAFo9bOB0PMUD0
	DSfo5Y93jIBBbDg6jtVaziLGfFhXNYBboH8+ndufrwv/6+WCSlr1ezEhe+KArC9xacOZX4vumlK
	GkQH0nbE6+HQEjfGlHaHaBkkGUWbly3bJ1I8DHMaiRPwTnX8kEWsL2JUbAGjVhhzFb6vuRzdOBk
	e43f3Tbeg9AVaeBkFuDTnZ+ifO+5WgDCn37gaTz/XB+2/mqCDqXxGVVart/uwpXJTj1bXEYUsuF
	oVFJsW26ItmanRBX1izD7adz56YS5XInem5+pPCdy09EYDynkXsp0WkGHEEBxvP9mvrrXRWzsFS
	1UQG7IMSsHKVGjGddbf+dYRPN5Ef10K9z211BpgSm+m
X-Received: by 2002:a05:7022:238b:b0:14d:c53a:f6a0 with SMTP id a92af1059eb24-14f5bc00823mr12600784c88.13.1791086480624;
        Sat, 03 Oct 2026 21:01:20 -0700 (PDT)
Received: from brighamcampbell.com ([2605:fb40:0:c09:9328:12b0:aafb:5758])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-151fd2b2a95sm10180479c88.17.2026.10.03.21.01.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 21:01:20 -0700 (PDT)
From: Brigham Campbell <me@brighamcampbell.com>
Date: Sat, 03 Oct 2026 22:01:13 -0600
Subject: [PATCH] .gitignore: ignore pacman package signatures
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261003-ignore-pacman-signature-v1-1-d16a9a026f55@brighamcampbell.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDQAyF4atI1h2II3TRq4iLGDM2gqNMtAji3
 U3b5ffg/SeYFBWDV3VCkY+aLtlRPyrgN+VRgg5uiBifNWITdMxLkbASz5SDOWnbfUjcY+QGoyQ
 Cf69Fkh6/ctv9bXs/CW/fHFzXDT7UHIV7AAAA
X-Change-ID: 20261003-ignore-pacman-signature-fcb02c302efa
To: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Christian Heusel <christian@heusel.eu>, 
 Nathan Chancellor <nathan@kernel.org>, linux-kernel@vger.kernel.org, 
 Brigham Campbell <me@brighamcampbell.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=628; i=me@brighamcampbell.com;
 h=from:subject:message-id; bh=M/DRZCYiuluO4WfBhgfQcvJdJ5//I9/6eDfS4FeNE6c=;
 b=owGbwMvMwCUWLsWS0KCyxZPxtFoSQ9bB8/1LG9OWn5k32WVF7v5fr6S7121k/f5kteHU6B9/N
 i/fKZOn31HKwiDGxSArpsiicmuW+sXJ1o8ORvBPgJnDygQyhIGLUwAmwn+e4Te70edY3dqD65Om
 zOqwWbGpzOhZVsaXe7fZeJ5937Sx02EyI8PKq9HHZhs9+h8craogOm3fGnl15qsLewP17z55s/B
 jaA0nAA==
X-Developer-Key: i=me@brighamcampbell.com; a=openpgp;
 fpr=24DA9A27D1933BE2C1580F90571A04608024B449

Ignore package signatures which are generated by makepkg when package
signing is enabled.

Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
---
 .gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitignore b/.gitignore
index 9875120ea7bd..bd52dedcab61 100644
--- a/.gitignore
+++ b/.gitignore
@@ -104,6 +104,7 @@ modules.order
 #
 # pacman files (make pacman-pkg)
 #
+/*.pkg.*.sig
 /PKGBUILD
 /pacman/
 

---
base-commit: ff47652a4b66c067c765a7ad464d930b5a9367cc
change-id: 20261003-ignore-pacman-signature-fcb02c302efa

Thanks!
-- 
Brigham Campbell
https://brighamcampbell.com

