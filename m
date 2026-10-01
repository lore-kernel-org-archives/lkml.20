Received: from mail-yx2-f42.google.com (mail-yx2-f42.google.com [74.125.224.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2094E489FA5
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 16:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790873439; cv=none; b=chSWJkRBvCO8olYnyBChm6jEUppuE7hOAkzj6v69DYzzt1jAl9dzaq4XXu0Mka46fpjZt/bPCjUNER6EFy/QrYObgdfeqvBIdPhtaMZ7EmKWZDlCaGev9R5hWJeSc5beEijoC/XVWklV2q8n/9ZVDNzmzqHZYwnvaxtD+FxWLCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790873439; c=relaxed/simple;
	bh=bfDmBqDj0trYBMNSpDSBhSDsHUJ1O+BMBVzB461qpOk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=htORyPDd83Qpd9koXRzSS6Nc0obSwmuoM31nBOPdl6Vr7l+RIAoFyBdhPb38lUj0RQViQT+72uDN73TDrOVEL2H1Xa0DXKH++VIwOgC9fIXyFCnpI6I1JFR81KhnWabmcOOXri0OV0n7PowKfnr4ShGWlcjbe9LgBsOsHrNAfWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oAjMpB12; arc=none smtp.client-ip=74.125.224.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oAjMpB12"
Received: by mail-yx2-f42.google.com with SMTP id 00721157ae682-8a7411012b1so66044597b3.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 09:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790873433; x=1791478233; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=szcjPGieXEfqhKINUtFT84K24oT0iMiw2DuJ+a0prBk=;
        b=oAjMpB12L5xqS+xT5ewSNdk4W7LUo4T9/AeyMkXGNOKg0dcJhlrcA3QqmlrAU0/2P2
         TT0Rbs44Htvnxwx9Ti4p+QSTdNqd5qQW2szXvJGWyucNnfijQwgBj13xZvdaV3DhA6y+
         mRPPq+yabPRh2MZf9+h2249NKEtkOZAOe3B8kaHL0EXzo17PNLUdcEigWtnISO6YoxYn
         UqvZh3lg65klszwe3xBdRIQFdIfUq6pevCL45cG+D/wQbvadM30xPbf1V2GkRAJnesqW
         ggnMraoLGTNdq6AGUFbePytKJe7WW7r6fM8K1A6mOHzrJV73FVjGxkutIXbeWPFU8Gnz
         eCVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790873433; x=1791478233;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=szcjPGieXEfqhKINUtFT84K24oT0iMiw2DuJ+a0prBk=;
        b=A6drlrc0spnOkaQpkG73ydSxsBbScl1GAJSwMNgqq2efkcQAoc+jNJjDD5/9qrW/Zp
         1J6OVejCkcA0kU0ND95GjlgtAfHZ6JTDJxpK492xE+MUtVEfelBhc86tLKrCEch9hszO
         k/JdjNcV8Cz2nwtvZO4x/ELRwTHwf5Usy/KemFTsmL9ieZqcT88u5rF69yK5NkTfUrrl
         t6xin+kgIHJkYW4N1ePCg79UxmPQEf3zTiJyhsNky4vWSaQaAU3Qpoey4Rrz3Bcvdggv
         7YqneuknpOqmoZPm2tQas8TIy7pL18Qqiru6RcIe7jv7iQ9qWLFnVJvNzvqKgOmn5/uU
         EQvQ==
X-Forwarded-Encrypted: i=1; AKwUvBxfhvv86hXR8GS7dCgTXMTyzTQgFf1aT1DiA+VKSK240GltrYFX9bMKR688u62qO3vJ68tB+e+pxcaMiJI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLH0iTrWaIOxr52II54GTo2bxZ1gktVnFRiRmn423Q8tFCHeTov
	OcrXYW87uj9NlTAjq4puys5tlWaMufkUhYSGZe9r/H8Zoy30fNgrth3P
X-Gm-Gg: AYBFou32gYmb2rrjFdhVuXcgaN5MH82kh1qB971BCbD2roKh2a0WqL1ET3P6OGuXhAI
	5KoarkqXwsa8gBsRfaRE55x0BmC876BnY25M3Go/i3G4OKqcK92h1gH3RI5UXbtY9tDl8zneOVx
	EiLTpgexqx+sF/xbfYSBsboiiSeqdjTuGbOdGg5PjcCYK4NLAXjkCfAJxDkuGP2vBHyBg9rVOJd
	/azZx3WKy/3YEfjCuQuZaFDaUruqhg8u8/tzHvXjG4/syhQ/EkoRAQVmDMYyLGomaMSoHyPvyC6
	L9tozkHNMPDX+CTo6FY3MvY8ru/bCHtkjTgIdhG1bNbRiabI6/Xppx2r9SXnft0jikzhWTaX61b
	ssDUQxKL92Wp/Tt4iQysnPhqQpHWDk9UoVF8/B+OL7enJjKXxgUILduvlbyDQREPdG9ytltWceV
	9LKoc5lIdONjW3lOD4q/c6SfcQCXKwvcyNG6Jumwo1RgnQbQsuB42DJNfhadQD/RgD9BVJalE=
X-Received: by 2002:a05:690c:6907:b0:8ab:4b1b:fb27 with SMTP id 00721157ae682-8ac9342129emr21793467b3.23.1790873433102;
        Thu, 01 Oct 2026 09:50:33 -0700 (PDT)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8acdac9c648sm13789557b3.14.2026.10.01.09.50.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 09:50:32 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
To: linux-alpha@vger.kernel.org
Cc: Magnus Lindholm <linmag7@gmail.com>,
	linux-kernel@vger.kernel.org,
	Matt Turner <mattst88@gmail.com>
Subject: [PATCH 4/4] alpha: default NR_CPUS to 32 for Wildfire
Date: Thu,  1 Oct 2026 12:50:18 -0400
Message-ID: <20261001165018.415526-4-mattst88@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261001165018.415526-1-mattst88@gmail.com>
References: <20261001165018.415526-1-mattst88@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The AlphaServer GS320 has up to 32 CPUs and the Wildfire code handles
all eight QBBs, but a Wildfire-only kernel defaults to NR_CPUS=4 and
ignores the rest unless the user raises it by hand.

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git ./arch/alpha/Kconfig ./arch/alpha/Kconfig
index 0fc61d986a7d..b5b02bb42aca 100644
--- ./arch/alpha/Kconfig
+++ ./arch/alpha/Kconfig
@@ -483,8 +483,8 @@ config NR_CPUS
 	int "Maximum number of CPUs (2-32)"
 	range 2 32
 	depends on SMP
-	default "32" if ALPHA_GENERIC || ALPHA_MARVEL
-	default "4" if !ALPHA_GENERIC && !ALPHA_MARVEL
+	default "32" if ALPHA_GENERIC || ALPHA_MARVEL || ALPHA_WILDFIRE
+	default "4"
 	help
 	  The kernel supports at most 32 CPUs. Only Marvel and Wildfire
 	  systems have more than 4.
-- 
2.54.0

