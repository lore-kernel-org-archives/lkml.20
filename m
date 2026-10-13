Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 625485326A6
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 18:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791914592; cv=none; b=OETAN8Gwhuc8dgte2UTL8Qn5o9zllLyMQXhe1A/zRO9Zq2+vkB5vCqLpujzKXSkeA37lCgGAGgO3qCROWEVFfH4mmMNVeU7wicFAry+tcycLw31p/ML2zlt65S1E+Ugwd1vGGBbral7vXoAIkLekcD+AytCZMXH1ie0lpz9bTV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791914592; c=relaxed/simple;
	bh=1EKTNsYObddSzMfazdsEfTP4VW5E+sXjf9Ax6jA38oo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M1gqRSh5wXLSGfkG3lxVLGRljOf1YfFQtZiJuPj6oqVDXzBwcD1kwoPqE6pft0Kd7N2drEGGBI/zIAjbjzAiSBjKVmtDZ+BBwOluLlpvSIRWqUbBEfGFQZophId90tTGjUhS5YNpQmG3oJw4PBGYl2Vd7qwF7yf7N9GEi8C1fJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dwcSSTzU; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dwcSSTzU"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48af27fe287so2853903f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 11:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791914588; x=1792519388; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jUyh+j71lLXWUxyOREj0fzVr8qwfQy1ksYC2qzHO33g=;
        b=dwcSSTzUAMNKy9h6TFsrYRPSd2vkKDmrqjWlGt5NuZJEjfi3cOwnq8DTgcBQM8GV5J
         OqvnbqFN7rNmAguF5DoA/PLy4rBxBaDT/NRMLjvaRLEjnvFJ1hshoAoq5dKjasvGngwM
         crFt5KrC4LigS3/N1YE3PmPP8Epx5weHQbV880Ir0kghvJvpjn8Mvr57WwLQ9u0g24Sk
         s01YDaD/Lj223x1/73SjKJikJQirbAdhWdZJZ0yTSK0qzMXwAV8T+6JzTg2YmS2F3tk2
         XDzQ2pNM5JXQNpneCBOrEaK5DpwIXujqjnYuFy2iuZ0TL3oKEFehnO/MfUdGno9qrBBX
         sDCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791914588; x=1792519388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jUyh+j71lLXWUxyOREj0fzVr8qwfQy1ksYC2qzHO33g=;
        b=WG69/Vz/6eW1CMs+9lMLz3Jzxo3aPVUWx3d+Cek0or95s/Grs6EtImf/mGNB7pDrsG
         XD29QfhE7cO4Pke59VWAp7I9vZBAXWKjKgU3oGnAACjBDNz31hSYEVOD0ohWSIaNJWST
         B1kdw/mmoGycGIiLKuw9NgKNtqY05dvhj6RU4vgJgc+L/i/+FswpHfeacYwpUwjo1I+y
         1ETYsj0EQm5RCzqCdRK4rhWpykSZyPKcUNcsvx8RLFtjB9zixnw5ZZ3dvyNOgwxlCsKl
         +tb/4zFs3Q5SWYghYYocEjsHITQlOYn5VBGasAZCT1phNNdS0JivWrmrOYmJZGbCGVzP
         A2yA==
X-Forwarded-Encrypted: i=1; AKwUvByy8ihbfv1XkqsvaJCzO+XgVOks5QeupblqSURoewszvQc2w9AySc8iLmlCo5CChmfCQmSo6GuU53xRWPM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIcGeKsU2FgLxAPfqijmTJbFrDfpiF6DLFbHzSnBBnOfSO6Y9oB
	5A4+RQnuvoqZG85Njgcq/k0BK+vYbYuCUYHFyjC6IqKx+8TimVtWAK9C
X-Gm-Gg: AYBFou3Edl/ctZXS+iH5AmoLxfii7Xf9cTQXbO80c1cGMhSFLKwQzEZmlktbb9yWuDE
	ZzaHVlNLuDyZfWeZ522p506DQ1wf19/D+6XOmJjjRzb9te7g9HzV91iBPEJ3PuxSvNbK/+yrJN8
	1jBqZSyxk2muO7a44ShjwYYTSjuDgoLcsozux+yfNqflUwGR6GctVRuWnYdOkUG6FHEn11gf2q2
	xPGL1N3HGHLjGL30EaACURYgvtktcfZUgoMcSj5k25QsAtXqeha1A7znonJu90+gdhWv9eA6+Yu
	CeyjsT48pxRgyO5bjJgRLH6C6wcVtnzsMLFMn3vpHnP8HuXjme09EJsZ09V4fKG9gURZgDSE+fC
	wBx3f87LGE2J2OnpEtXbw3/yDO0598/XzssJ+tyDOfLw4KlUIjiCTdpFGTtiWr1qAjlcJ4vaF0F
	z3EsEUo26Xq4K8QKRsOYkhfNPyCRrCjCmfpKtyo1ADYQ3QDF2b3eo9A6IULYcb750aD1OGsPNUt
	x8y/fGhLI0ookatN+jAC4bOPNSVpw==
X-Received: by 2002:adf:e007:0:20b0:48c:656a:f36c with SMTP id ffacd0b85a97d-48dba77cefbmr20450562f8f.3.1791914588364;
        Tue, 13 Oct 2026 11:03:08 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0bc4ec6sm6381987f8f.48.2026.10.13.11.03.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 11:03:07 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Sheetal <sheetal@nvidia.com>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] ASoC: tegra: Support auxiliary devices
Date: Tue, 13 Oct 2026 21:02:53 +0300
Message-ID: <20261013180253.477605-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261013180253.477605-1-clamor95@gmail.com>
References: <20261013180253.477605-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for auxiliary devices, such as amplifiers, sound-muxes or dsp,
to be added to the sound card.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 sound/soc/tegra/tegra_asoc_machine.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/tegra/tegra_asoc_machine.c b/sound/soc/tegra/tegra_asoc_machine.c
index 50b23bbb637bd..e4af049fd7e89 100644
--- a/sound/soc/tegra/tegra_asoc_machine.c
+++ b/sound/soc/tegra/tegra_asoc_machine.c
@@ -550,6 +550,10 @@ int tegra_asoc_machine_probe(struct platform_device *pdev)
 	if (asoc->add_common_snd_ops)
 		card->dai_link->ops = &tegra_machine_snd_ops;
 
+	err = snd_soc_of_parse_aux_devs(card, "nvidia,aux-devs");
+	if (err)
+		return err;
+
 	if (!card->owner)
 		card->owner = THIS_MODULE;
 	if (!card->driver_name)
-- 
2.53.0

