Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A73931A556
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 07:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790753103; cv=none; b=hMCQ1rNwqJvHV6Q1fgnckoBaVyAcKHHT89u95Re7Le0EhToKoyHlB1/3vGs14T22+FMzOFnfiLFht7JvawqAwUkXHVnJm6TdfaV7cVk0xXEdgg1+Klw1dOWr7HEK2MERSmh0+bbTkpCOVQGPJXr3j7/+tmGR3bYWXlo60Lx4gUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790753103; c=relaxed/simple;
	bh=3nG/sDKEXby/WIrLfH86wORGS+f2incixoM/JnZ1iJw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qUBbI7a+zaCDoE2QDaaZOBvNapFwT6gTFVR6ru0pbGImHgL2L4KLI2/TZ3O32Z+4PaKWSTXt+q6Mbp9xa5BINF4vioMulBmfm8ZO3wEiqGl7V3fQSsRkMAiFPF+IBxXmIO2bMZCC63LsNzYYAgZhh7bVy+cmW2hLVY0I/x4VhXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=inAmJie9; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="inAmJie9"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-488811c9ebaso2470560f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 00:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790753100; x=1791357900; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XAd6nfAO22oQbqKamKmwvUK9RC63ufUS5aB+67o1X1Q=;
        b=inAmJie9Vl9FlWO2TXS8afcevZQYRiCqQ2D1blJ3gQRcwjecBwmKmScYrPtZVPK+xy
         F9sAbwXUtk0oHtn+UzCLXDi8RYpRt3Hm4hCthH5jVFi8CDeU/YogY3t2U+JfWz6DCP7n
         /Jwo92Cdmgr1caNq0Txieb5/1FT3jdTCB5jgNe3iTmsF3MleVLyqeY9kg1lkHmkI29Tt
         sA0N0QGpNxSLz2ZAD9omxq5Z7BDga+3jnDt3zvfKpW7qilFs5qv8Btpo0hxd4buAi/uA
         gkpop/yH754SAZ9Q4jspnDMcSS+vndFfhaZ9xh4+Ix+oeu3DGlC/fiE7B8EkjZVm//eU
         t1QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790753100; x=1791357900;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XAd6nfAO22oQbqKamKmwvUK9RC63ufUS5aB+67o1X1Q=;
        b=WyhpkqO9PVyO0YTuB6+dufa7SbmDTZzdoRUdXEV4rKcKD/medy3JKSrkfQUB2RBuv+
         Ym02mf+25QAhOf6cUHTDODs1sl7uTeYdq0cCYqgV8bQD1EmLRZ/doES6Ju8x1LqNhuui
         82UL65Sn2You39jA+47cUx+uHDwTLOLZGfgta1kG2iTD3uuGbvf78hkfIoutnQtDS8fl
         lxNzexOJQbTATY5RLLgRqS3X1oQUZ3JAAPtN+aYIAfPXIaWuMDm5/JgHywNWOll55++z
         SC3wRwgZNV+zuVpFhjAf2qslOJdtEMOOAc2gjk82PNWZA6qKU46RcOFrS2P4ORU9Jhvy
         apMg==
X-Forwarded-Encrypted: i=1; AKwUvBxd2IXRiI6lhmolYj/O99K5WJ6jPCKbA0zEODKiAM8xkvRw5oZ0Em8dnGSXkUSHxk+UjzLj1cVVA0uRzcU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKFzks1A0OqDlpTFwqY9X3gqx3V/zGwyRype2GKztsiOVszSt7D
	EumB4nbYbQhMS+n52QhVuC+XzZ09UyWScaUtCOOHbIixc0gHsMvAHuCL
X-Gm-Gg: AYBFou0xmHQezsxxvmG/kKAMynn8Brn0AuFXRwhGEtAEIDeVKMRIVOjN5JGo7mpsgNf
	7p5ak/bx/cesIwIEZLEV5mDN9/Qg9XYD3bR99OcAgOpbMKNIsBUjWhZwbc48vpeza9x1XFgBcfM
	GsdHydtSO0W127aPGKJgKlUJz/fpsI87b/zdWjQANHYTbHU+80Lo7PaAvb4/wkVb2f4/lIRYSIf
	2kWzKlu+vPmo85P2fxJFJ4d6ZnDz4uFQMFMu9nQlGqqnLw0o5WK9Un0YUp2w3XJImixMKzU7CaB
	AICPBUPVFmZZxti8a6vafeW8WRK4iXe3qXeDu6sfTtcC2ri6tvyO9Jf9FiUbBIHrmjISUecuSwS
	koUP43O8jP126/Hx68FZ+hXoFeJCnsBg2dv1adnVlzNS4N5Beqa7uEuHZg75S/D+QI/mXDHVfWU
	yYwXVBQtbAzKqF0sCuepejgUyQmYoYN4xKlhdnOpKANR10LYOxzbDWCCyMkbWvJWs5szwgkhwmu
	ycr1r/KuJJV8v3dbMI=
X-Received: by 2002:a05:6000:400f:b0:48a:f26d:18b3 with SMTP id ffacd0b85a97d-48b02535074mr1142441f8f.42.1790753100479;
        Wed, 30 Sep 2026 00:25:00 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b029fc420sm1267411f8f.28.2026.09.30.00.24.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 00:24:59 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Sebastian Reichel <sre@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/1] dt-bindings: power: supply: maxim,max8903: Document MAX8922L and RT9524
Date: Wed, 30 Sep 2026 10:24:49 +0300
Message-ID: <20260930072450.61836-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document MAX8922L and RT9524, which use a similar charging control pattern
to the MAX8903. The MAX8903 is set as a fallback for both chips. No driver
changes are required.

Svyatoslav Ryhel (1):
  dt-bindings: power: supply: maxim,max8903: Document MAX8922L and
    RT9524

 .../bindings/power/supply/maxim,max8903.yaml           | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

-- 
2.53.0

