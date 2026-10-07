Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C9073F86E1
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 20:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791405772; cv=none; b=hxJG4toKf7zVA5JkfnCLPxGEN10tG8CcgdoMLNKJoWaO+8Gox7zP6wtC8wt8uE5EvFtFTKlmMjHg/+RroX4UGs8fTQu8SSTvPVPfQsxaYGZNwz/RAbK1BaZWpenxUbNJUkKCIbMdCXmkZsSw0FR7AUkjkE53i89rFD551QnF4IM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791405772; c=relaxed/simple;
	bh=TFY9tOSQZG6cW9Xz19R1Fsu14/FrS6A0ND2sm7laFW4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=utKyJggSUBQKcFDvljj64R9x0XdI9sXsxLumO/7WR1SfkF0MeIrRjJVC3Zp2YyyzjxKZAoeaEDN2kz4Yd57ai9Kf+ZKRlHFTNA5sAJ7+O754laMoBgAkQiIJMkwT00vxO/1JIqoMX8RFhnSlOOnhCTHXIQSdY3stTlnann7DHVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com; spf=pass smtp.mailfrom=trailofbits.com; dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b=eBCnAp8c; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b="eBCnAp8c"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-15756f82e8aso1453422c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 13:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1791405771; x=1792010571; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2w44cogeP+44QvieTFJ7kjVK03e1YaQy1nQzOi9xKiA=;
        b=eBCnAp8cjMxB/xqiy0AqummU7qNdD+P0rnAm3da40rx0RbUi1iIYCP8l6jYraUfBT2
         Nx2bWgviVV17/JeoOJt5KT72lpYX91nPb5gheTWq9njdCARPeiDbQdu5JsuIAnNhkMGZ
         /XZzhXiVM+VL+Qv0JgHBqYfea1esAmG6QBQA2MGuDoqXuVlzhAoWbtkrsHEApxfVWCA+
         4fCIck7ErAlXq8gfVUUlsW8n1Vbfhba7zNpttLA87nF/PsCgEqcKZXAmbb2WHZSVYMgR
         HmbJyiVfv71qCkTXT966yn0IXowRKPCh/K3YiuUFTMXwlVf6Kf85xj6tF13bI7trBJU7
         3iLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791405771; x=1792010571;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2w44cogeP+44QvieTFJ7kjVK03e1YaQy1nQzOi9xKiA=;
        b=Cu5UY++5ehTgDS6q1OEjst4abX9P7S/75qGrLKd9mc6ObMCetUbHe1e1hBbyt3mqBS
         0FgdtQBh9S847xelHrlEx6eHhRHe72gsz3xygsVdFVzWzg/vCV0VjbuymnOkTdt0jE65
         2EzdQ6rJl8Pe9Y9DGoqidJlYuYeLiihLSqtItE4kc5U4WmKzpZ1ZtwkL887JcJSPjscM
         jQ9R+Ml9K1xDcasfRsCco4KetBCnkfxAclDE/aZP33vzo3Ccu70qGHuj5jL2n/NwKmr3
         Jx/EkDqVWMiXAdRd2A2HzhrJdhV4AJtRKYDUh9luxC40OqfC2mZouZMwxP0VdziGVRsd
         KE4w==
X-Forwarded-Encrypted: i=1; AKwUvBySP1MaWdcQcIqDw5pIs+KAFwYYqe2HHZlMI1oFLjSgPFDctvkZpjDz+OKTnRcrOREsWvwCKoLFjz3siyw=@vger.kernel.org
X-Gm-Message-State: AFuF++n+WEAPTFO8xSAVMvPHwwxBic1dLTlBfBqqQLTqUNPZ28sb2VBo
	klQtb2OpQatbvoLXhjhFu2Fv/ZACignG84b2Z8tFYAVLXWa18CkMz1YFMPH4nVjqSw8=
X-Gm-Gg: AYBFou3lltaWeufySdDWcl8GdK74MgPoKXeKhQB2uYTsJmhYNBuMZBNy8/8Ko6B8F1Y
	588HIMaeBUxZWFehFIbzkSZcr9/ECLMBsrp2EOiHFtqNaii1rjjvcPB7y54HaEQIgsyh2vjISwu
	ncrO5/wVHNGEFIext5SbvnSIUJJWXlA9wN5wue7uJMGoUttyrdF4h/P0hTgfJxYlUWyiGmegL7/
	R31vlHG/qckACVOnsO16XTP45kQfvEa/teuAElLpV9c9lDHD2mkTzYFi+se4amFf9WYYI8bhQig
	MKRsjCPc2kp6IlrYV4NDSTnLvqwX5r02XPqb4ylHbBiFHHvxfobHleFPjYe6AaSbMdmSjbrNISy
	132LsshVLe2c5o3DR1Kgbye/GRyDDF7YfjK8Q466y4kAwXIJ40E8J/8/qe4vqM5yrxswwEJ9E9t
	7lw7RMm7eRdG1UDBvmxkBKPyHAjUZEksC/PTUG/iZp/LBDxzrDPJKZL8x4vsNYJED0h5YNIsOFp
	mJCrvt0FaVBMNycZ3GfxEswompwUOytlEHoSy9CzBDHnNkBE2No216pQfVYmEdiqm0toQPL8A5k
	qP6fCdQ=
X-Received: by 2002:a05:7022:b0d4:b0:14c:c588:ac21 with SMTP id a92af1059eb24-1659f86d360mr411370c88.9.1791405770312;
        Wed, 07 Oct 2026 13:42:50 -0700 (PDT)
Received: from localhost.localdomain ([2603:8001:5f01:8bab:7854:1520:fd4f:2a94])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-16167ef2e54sm7586938c88.10.2026.10.07.13.42.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 07 Oct 2026 13:42:49 -0700 (PDT)
From: Artem Dinaburg <artem@trailofbits.com>
To: stable@vger.kernel.org
Cc: Artem Dinaburg <artem@trailofbits.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	Helge Deller <deller@kernel.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Helge Deller <deller@gmx.de>,
	John Johansen <john.johansen@canonical.com>,
	Paul Moore <paul@paul-moore.com>,
	James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	apparmor@lists.ubuntu.com,
	linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Georgia Garcia <georgia.garcia@canonical.com>
Subject: [PATCH 6.6.y 0/2] apparmor: backport CVE-2026-45893, CVE-2026-46254
Date: Wed,  7 Oct 2026 16:42:21 -0400
Message-ID: <20261007204226.47033-1-artem@trailofbits.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Greg, Sasha, and maintainers,

I'm working through the smaller CVE backports still missing from 6.6.y.
These 2 upstream changes belong together for CVE-2026-45893,
CVE-2026-46254. They must be applied in this order because the later change
depends on or completes the earlier one.

The complete series is already present in 6.12.y, 6.18.y, and 7.2.y.
These fixes also affect 6.1.y, which will need a separate backport; this
series is only for 6.6.y.

Could you please consider this series for 6.6.y?

Thanks,
Artem Dinaburg

Series:
  1. AppArmor: Allow apparmor to handle unaligned dfa tables
  2. apparmor: Fix & Optimize table creation from possibly unaligned memory

