Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792627285;
	b=YWnnWOoOSzSALEjC8JcbG3tJF61mfLH6DdppRRfN7VwkFOngJ+Dokdsd0mW2m+wkPVO1
	 VHHVj58LtGueRuFFE777Y7YPGOhht6bsUxrY3LfztFaCac7gHPJnSyFHNTEfCu5FOhARo
	 01/80fTx5vMcL8f6On7tCrDV5jQ+B6gmj6Gp4+3lUW4ysf6rIylWsCJ3aavGMKo5C3kwi
	 xQOTkiOb1AvwKP1FBpKCCzBZz2CFkZyP3VI9/HnOBZopAXsS+jp7dc86NQQ1fky4q6EqZ
	 3x6Uet5kWRoQrSVPqkOZg+6A5t5acx4QvjyNzKwMBnwjZmiw5X9hWOubG7h0QPS1XfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792627285;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=9rsuU/zpvGVZ6N3nvTXW6aQt3MLOdJQFmOTT1iINVYg=;
	b=V2V3yxF0DdEK7+gKL78OvSYBOqxHRNVYMgJvYCQQNKorvQmQpW7nhmIngvOOOAW2DFkG
	 fsxWze+Gn+PeFvDd1SFKeWAVONY7xKZpaDk2l29O6RbEbJ6iRmK/RKxZqxNxLM8n8EQ8S
	 yQu9UFm8ZoJT7Nrwu8kzSZizyp5B5fNGt/6+PHlVoxozUwBRYVa9aK8W4aTv8t+bidlI6
	 D40QYVO2PS5S/72N8El73HpJuTFRJUV/gQ7iQNZSH/voWbNiPDRjmBcZ8XLFrptxBQNje
	 MHkAc/pnBeojGC03uLzKSDP02vhUZp7CxLH5f/w6jirX/r/C623TNSsb+SiP7qsc/eQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=m5yg9UoE;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A589760A261C
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 00:01:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A589760A261C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=m5yg9UoE
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-35d0be18c71so400741eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 17:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792627284; x=1793232084; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9rsuU/zpvGVZ6N3nvTXW6aQt3MLOdJQFmOTT1iINVYg=;
        b=m5yg9UoEpcdYE8egFZeIgIiw+eoQYctsAkRwAViGsNT06ip2KWN83KgAyDKgQ+L1QV
         SlsKZ13l0t35zjsjJg3dfmFvJP5BVklcHpBUWEIVatgaa2HInySG0PQHaAeLoV6oY8AB
         +A9l/nh9nQQx8ljsyMwVjjiyaRbLxs2l2hiw4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792627284; x=1793232084;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9rsuU/zpvGVZ6N3nvTXW6aQt3MLOdJQFmOTT1iINVYg=;
        b=VoGvUrEVndU7iiwBbVKc9z7JT0UpovrKCeQzYLnFSmOZQiOwhGPDvkdqzLVHzq6q2n
         fLCF+3h8J/2qzPVy39jAJjYIyx++8ZSeMAMKiWHRvsI9tv7kOShKC9vEhUKYVhwZrlpR
         849m1C7+rKE6AMbwrB/e2FwIgqM1aD7DtMA9A9N84nvJod6blhyo8Igia0lP+BPXSbz2
         bTHHM2WZxID6Z5WhK9/wgCGOT7xaoCG8zVOn5ecnP8DsOriBz0Jkx2uNPRpyhZMLikLL
         CkTHVHLqmSq9HcDbp5pvCH6u0eptDZpkL5F3IHXOgGnxaMihJwLVvQp7UFqI6nxM1FjA
         PU2w==
X-Forwarded-Encrypted: i=1; AKwUvBz8qkT66OtadE5IbpPUZRe2+qcm6P4iKCeRSLk5k1lbeg32xMw53W4qXq6SE3gyBTPCE6gOkVhmJq+Zu9c=@vger.kernel.org
X-Gm-Message-State: AFq9FYI8zIc9k5x4FMx95ORZFRYXK7YU3Cte6dPpUf9LwroIylDDt3vc
	AW2EZPP3Oi/0d+XlvaFL2p4CPK49wWmAsVUZJJis8el3dzo/6BlxYAuM7ncl6fCf0wvYj4g5q6k
	Gt/w=
X-Gm-Gg: AYBFou0dL6ZkIfDjE1QHdVRg404ms0Fvymrec8CHgh/sh02dxYLsY+WYm9FUtyDkIUs
	Xbn3Oo2BTMNxXBPxBLy3BoCqnDW6T7htHf8b/G8ghUd4N0ASHNaZLJCVZ69pSLYsY/1oymk2kCP
	lL6TbPenM7xBeIaiG2dqbP+bwefOVji5XalAgqAHQplAvCvb3T/ZqC+uN8ldDP6V4krH8r0HhOh
	6/g3jllRS2hF+cKX5K+irGXHCDrhDXvLeeh+w40mZhIZHe6WTOZw9EYyy711shEtLSxv/C9ddEw
	Vfvv9YTKJVV801UPlnZCy4k5y9kR1AOQjkKzufERZZeV1ibJqfkyFjPN9icnfXBcryHmDugJnZf
	PuF2ZdRf2roqZUiLY5ko37TGdCPKrEVPcYS99EI5+Q2wEu59gnQf/uxdBGYx7ylsiPfvsooFaQ/
	lVkCgyg7fL7otZSDqNMa9XyqiIEqT6dPOoA/nlEidBTiimHpQIkKyX8SWhMVu7LuK60brRKbd3B
	/ZnPePd9hf0S1Yw9IiRpsT5Kb830RfHmhMxHjtQH9IU3Jk+etVQmUwaDsI3FGDXX72zsN2mkzWD
	0fgJg6cuKRQDdIpOnlLD
X-Received: by 2002:a05:693c:8102:b0:351:606f:2832 with SMTP id 5a478bee46e88-368ae2d4b25mr1068928eec.3.1792627283594;
        Wed, 21 Oct 2026 17:01:23 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:14ab:bfeb:ac88:458f])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-367411bc89fsm13245730eec.16.2026.10.21.17.01.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 17:01:23 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: Jonathan Cameron <jic23@kernel.org>
Cc: =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>,
	linux-pm@vger.kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	linux-iio@vger.kernel.org,
	Brian Norris <briannorris@chromium.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 06/17] iio: adc: rcar-gyroadc: Discard pm_runtime_put_autosuspend() return values
Date: Wed, 21 Oct 2026 16:57:07 -0700
Message-ID: <20261021165858.v2.6.Ia4649c7263a5733426a8778ac4b2dc459f3ffef6@changeid>
X-Mailer: git-send-email 2.56.0.218.g1ec904b173-goog
In-Reply-To: <20261021235818.3059519-1-briannorris@chromium.org>
References: <20261021235818.3059519-1-briannorris@chromium.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This driver propagates the return value of pm_runtime_put_autosuspend(),
which is not particularly useful.

Returning an error code from pm_runtime_put_autosuspend() merely means
that it has not queued up a timer or work item to check whether or not
the device can be suspended and there are many perfectly valid
situations in which that can happen, like after writing "on" to the
device's runtime PM "control" attribute in sysfs for one example.

For this reason, modify this driver to simply discard the
pm_runtime_put_autosuspend() return value.

This will facilitate a planned change of the
pm_runtime_put_autosuspend() return type to void in the future, similar
to commit 3afd8df02433 ("PM: runtime: Change pm_runtime_put() return
type to void").

Signed-off-by: Brian Norris <briannorris@chromium.org>
---

Changes in v2:
 * Split iio patch into per-driver patches

 drivers/iio/adc/rcar-gyroadc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/iio/adc/rcar-gyroadc.c b/drivers/iio/adc/rcar-gyroadc.c
index d38cf3caeae0..0d3b061d6ec2 100644
--- a/drivers/iio/adc/rcar-gyroadc.c
+++ b/drivers/iio/adc/rcar-gyroadc.c
@@ -199,10 +199,8 @@ static int rcar_gyroadc_read_raw(struct iio_dev *indio_dev,
 		*val = readl(priv->regs + datareg);
 		*val &= BIT(priv->sample_width) - 1;
 
-		ret = pm_runtime_put_autosuspend(priv->dev);
+		pm_runtime_put_autosuspend(priv->dev);
 		iio_device_release_direct(indio_dev);
-		if (ret < 0)
-			return ret;
 
 		return IIO_VAL_INT;
 	case IIO_CHAN_INFO_SCALE:
-- 
2.56.0.218.g1ec904b173-goog

