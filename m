Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794158255;
	b=JiSAJPC3f7UMpFh9C6yXXFs/R+DYDIjcNrrO54VHciJRCAulb2agzNcqv+/rjInSFDjT
	 BhI2vaaD755X5vLQRGGfI2FTknbeQuVthavXqn4ey+Z54PRboeybwpUFjkf3mQS93jJ9N
	 1g80/RbNyqN6N7HyAPvXMjzFg7ppDLkFPxroBbU1LzX4Z9fWGbWZgfZKT6B6kNA3+0NH7
	 qbAw9xPa6zoa1ELeAK5j4S5Tj9jwdSwG6UL/Vc6rH4e6wK/AUfXItw4N2a5H2vswvoNH6
	 /76Ek6R2OcbMuJzoaI2fZU0y12PNJPtdCQOocU6dZdaFSFjcFNbv8+G3lFj/Q2LFrkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794158255;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xrZCsGFBJGE8YTdUW/NXxb7L9++8m8GQvAjnd7WRUIM=;
	b=bAMUTUXWmpP7mhJFA16RDw/uqrMEwV67g2krfY1B1T2PGLRrhQ69WIu1QMh5UPw/nZBQ
	 3Zjxz6cCHII2rSsSyU09t88E0PHenk/EIyENbSK++no1fpit/aps597RUU68uaELHHxrr
	 LTM+gFD6nMcCgePA/LWAmb86zsTFITd1pWH/7qaVFv55giYVYpkPJvFJAodFwq4Ku1S0U
	 xR4UrJOUm7qQG5LffjnOntRDrPkqm5T/3Mom0DIEILyfCxury517QRsTMyYvmplzuZBqR
	 BqQZsg0pVt9XOlB/kffioLodRdfUPuJJfmim5jUZM6oDKQLE2z7qy5utBng+hhdWDIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sNb13mES;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E5B606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 17:17:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4E5B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sNb13mES
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-37000e7234bso634890eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 09:17:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794158254; x=1794763054; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xrZCsGFBJGE8YTdUW/NXxb7L9++8m8GQvAjnd7WRUIM=;
        b=sNb13mES/0f5ALwDbw037sVMGFFC0HaA8P4+YFzDQeOJ9X+bYg58bAe6mzpznfMO/O
         N3GTYiFjgrsMlyZgqiDrzrP98P1TNa/lnt/pEKOq/kZQAWzRhrUaQRxNRuELAip+Cplh
         AFyFh0UZlkcs3++yk+c5i2fwiZcw47AsEKeQnNTd8lPThdwwl5hg7CdO/N9YM996ZgeB
         ZLtv2NUqiHBNXgnesgmnkfp/z2WbZAKoDQCINcD9l3tSN9CmrEKzHrl5Jl6JnC/kFuOu
         qTefALObcsdqTqhhlvNZZRCaFBmmuKh3mamo3V1V/DHLAMrGUODC6PNXXdiEbxOds5eg
         Sekg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794158254; x=1794763054;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xrZCsGFBJGE8YTdUW/NXxb7L9++8m8GQvAjnd7WRUIM=;
        b=LT9dgSJ4gem7sDstaB5TQ5nzXheQGBC5j2jsMDCWWJ7yw4tPtwt+UzOuCYRkB4etpb
         MgVqlVIHynZILv4Z91LeETi/Ov/CNZCC4wQzM7jjmM5tJxOj6kMclewMXQdf3lcytTZt
         6PrI6dhp0wQVgxOtvS6891Ll0j5n2Al/piITevBKSceRqtNtZLY0ldefKMKNfCeHF9ua
         eXTwLt/hUr7aI4t+J35/YBe0SWn+vag2HGH9jFUFUU585YczKRscKRYaxNhQE8cCL5mF
         je2eKgDly9Nv2y2JM3WZ8BY2NutmbuQL2i7snt1FN06mJtzRtO11YljhTAMMnXQTKoJj
         k/VQ==
X-Forwarded-Encrypted: i=1; AL+hErEfgxaXjF30AAoG2zmLthQPC6ttyweH/3uzAnEmy/aHdL5aXw73e7xA6guqeUjRy9j3xzeqhryBu0ZViIs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+dotju8rT+XT06lKd4iCFOX7lx+VmsxAWWDP4QwupwtcVrbg7S
	jSAWUrCiGCtg9GZ0FMwj9ddcCHUZrkDMJRXOVxXJs514LsxAM0tzN/R2
X-Gm-Gg: AYBFou36wZRWpT0tJoMs5thG42rbywYZ2w1Ma9okR+n/X7NVs+y9MsmUI+Xfy2BkMiC
	ONpK0CB1zs5kz7DscZ3FFlNmMtdlax7BG+ZD5Yi0jUGBk8a63Q8QKEUuqwfVSYOG5muOdG4+H89
	c6CFt1txkCxfLKr8N1LM7y4bkXifFUtiZpQoaZ4/L2+9Og5ibR8ityiO8f2Y8LicLzHhhvj7fsI
	WsuSVWthsfW0GiSTq8VGfpeccDwQcQiB5PqrevZLayGL3ZztuYyO2xoOScwuSxxnO+aaPbJBPr0
	Hggr1J4E2Vc/h+N7uqcPieMtYIRJ3z8NI4ftrcUcKhqp3cCCDG1v1IJw0wnxAgpDzakz82y8Xqv
	nzyHj4KKOD7pTasMiwMY/jNuq2Uv/JGBMQGdfNs4K1AWRLHDlHydBYkR9qU52KXN49UoXNszeev
	lwymb1r/QH2fbEqJjK/mdHsjpY2+xfTwD1Jfx0474ZBD1eI8p3BjSxLl2Q6lG5dzLYHavHCqSrR
	7xW7SKqflchgP50d7cyZd1eoEihYS/SJ5+L5nQ34zUJkO259VGFw8SDwFyIhsYF9UICsOzscY6D
	hm5frN6gUnEkaMos5NdDuN7Jva6tmKtoxtssdfrKQDgyNAPd
X-Received: by 2002:a05:7023:a42:b0:195:1a77:85f4 with SMTP id a92af1059eb24-1b39feefaa6mr2960462c88.24.1794158253619;
        Sun, 08 Nov 2026 09:17:33 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-372665db8bbsm5983442eec.22.2026.11.08.09.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 09:17:33 -0800 (PST)
From: hyunjungg <hj351016@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Peter Ujfalusi <peter.ujfalusi@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH v2] ASoC: twl6040: cancel jack-detect work on component remove
Date: Mon,  9 Nov 2026 02:17:22 +0900
Message-ID: <20261108171722.695360-1-hj351016@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: Hyunjung Ko <hj351016@gmail.com>

twl6040_remove() frees the plug IRQ but does not drain the delayed
jack-detect work (hs_jack.work, twl6040_accessory_work) that the IRQ arms.
hs_jack lives in the devm-allocated twl6040_data, so a work still pending
at remove runs after the private data is freed -- a use-after-free.

Cancel it after free_irq(), which stops the work from being re-armed.

Fixes: a2d2362edf9f ("ASoC: twl6040: Add jack support for headset and handset")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
v2: Rebase onto current ASoC (did not apply, per Mark's note); trim the
    commit message to the essentials.
 sound/soc/codecs/twl6040.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/twl6040.c b/sound/soc/codecs/twl6040.c
index 650836f..826bde1 100644
--- a/sound/soc/codecs/twl6040.c
+++ b/sound/soc/codecs/twl6040.c
@@ -1136,6 +1136,7 @@ static void twl6040_remove(struct snd_soc_component *component)
 	struct twl6040_data *priv = snd_soc_component_get_drvdata(component);
 
 	free_irq(priv->plug_irq, component);
+	cancel_delayed_work_sync(&priv->hs_jack.work);
 }
 
 static const struct snd_soc_component_driver soc_component_dev_twl6040 = {
-- 
2.43.0

