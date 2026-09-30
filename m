Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5270251DE18
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 16:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790784810; cv=none; b=aCiZPO8Yjhk71Dib0RF5lSdNil+n2AE3tZ9zv2MTKzAnK/D6FoJZO1DkwsD0uUXvdAhcFmo7UPX2QLEJNeKCCfhKcdXdvpnuNYS4Z4MMT7QaoZWqyBOAjy0fw9XhcnNWs189yVjPf5WE8lKflyxCQvsUNMaIsXJTK9nbTuyiyXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790784810; c=relaxed/simple;
	bh=qOkoB1UvmuC4YZqe5Fz1zEEcDa7BiDDxjJDSjZCF8fI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GqDVNsbzDx43ptIAtxi6j+2rcJWuzYqaoAr9mk+9oXsvcBvj68T9j2Yr/42yZwLKk7zvbrD3EH323kHgda307n1V2I+wayXm/oa/rC/z4zr3O5V8HN3iQZQYVc3SwVBD6Ilg1bshiQQPpVTJ2ta5cBQ3enRfHcpUxLU5tH/yb5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=u0nFrP8c; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="u0nFrP8c"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-48b0503e39fso284133f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 09:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1790784803; x=1791389603; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MPuRlti25Fuu3NRfeKW/Nl7M5gDTcAuzPve5dEthuXw=;
        b=u0nFrP8csUMQ95fLYEL7ITNQncnKAg4veZmOnutj1tKhpq0gkyjubRphsISIT8Aat7
         pVZg0CKEMGpIK/SNIZfLtSYjQRvuof1s9kfvNMwCdWZwTS2h4hzjroQHo3g99BLCue+Q
         3TVqbwbKd8C0liVVPCwL3bvGklcwt4XvOzSNtuhE6VtONzU1mnmA8k89SGy2CJE73t4X
         fP51ERK1SluIKy2CAeSMP3RyZkjT/Fr/ZN0c7Fu8O/LcodpdSaJWZb/Ott8WJ5XV3NE4
         lji4hwqJf6rcOSpBMkTJrSE7DPegA0JrZkAkkD4Q4zQvOX4FrpZzsjsY2rdOfVz6t8kn
         t2/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790784803; x=1791389603;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MPuRlti25Fuu3NRfeKW/Nl7M5gDTcAuzPve5dEthuXw=;
        b=uTAWM6u2TRluJkhXJN678hZrzRLtAZk710PaRzQ6LJsfNk+uk3lT0A5xgkkn1gGnZ/
         CYo1awc34Jf3djCMhuBl2w8OgU3VyjY4aVAr5uAWggeV5NXOflRTpC1j7GhFA1tH3J33
         P9UaEK10CxhQCYfyMiwcCzgMQ/ChqyZ/F9J9VheJ4I8NDm0Ywy/Xc/fyFqpuqaJzS2+J
         y6jHvrHcNy7GVYpa5qH0RhUOvfOiDR4hLD7X2Zj5C1eV+T0UEXE0yEUPzFLtCxV44cno
         OIJYNyjk/0iCx6cdR++5d0yNvvk0gxswft47GX4F2wYlQGh61t772T0EiehOt3Q0ZZIK
         xBCg==
X-Forwarded-Encrypted: i=1; AKwUvBzOUJzQRE7Un9qcu3dWyi79tU2sN8TuOUi4is/Vwt9XLjZuO0RhrPE5eZ4FHvf+A/noN7U0sB44P0vBFoo=@vger.kernel.org
X-Gm-Message-State: AFq9FYI0/V5iWlzAeKBA83KOTc6pXzl+fs5ehEvkj5gLjWKWzXkt6Rbj
	9dxStwJiedpfJGMzc1S6ae0pCaMEhBTNYpCPs8PbYYIEfq3UMekxD+N+90tWrInKQHc=
X-Gm-Gg: AYBFou1T2QhSLvoyBlbGfd1rMqjamyoKXXsE6NxcM//GhptLAbmsitpfDGUGGuFTmsU
	HMn3V5V0AJxX4DtRHXbqDj+uAMSyFTqemq3qgOzzU6R2mu7ZC5IyFu9NnBu3k3B/5E738egyTYz
	P12PLVYFoAWurYx5oWSDCSaVkrK5NZXQgvW1Y4CBhPEPK8ZsmeSMNq5vK1BgkZXE3ZDsdDo/ipp
	qcFLKX3Wmniwzgx9egXHWp/q/xSYGwl4VeuCIyXMf0h8cs2SP1wfsB29+alYjsVhWViOz1uu5Nn
	ACppuZvupIN+x6VDI3xPQ2nwCldDCZyVnoNETumPfPaC4a3y0IwC2Ra5AB0srEPn+Z9kBZ3J01a
	XAriUXKk+IUXA2C94x8vtLL8dHiRH4nzUC5S5KIglX9rLD3iCpmwHqtrpDzWssqpx11bqV6Da9D
	toDVJi/Dyo5sNIinVBXfhkop9LmynimxRmtdNPaZ75ifmDFkdB0u3REOLCyvxyaQP9Mnx+m1OlO
	MMYMYx/oUJRyFwH
X-Received: by 2002:a05:6000:25c2:b0:48a:fdde:5241 with SMTP id ffacd0b85a97d-48b024ef6b1mr4355983f8f.31.1790784803457;
        Wed, 30 Sep 2026 09:13:23 -0700 (PDT)
Received: from alchark-surface.localdomain ([5.194.93.183])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b068bc9d1sm119384f8f.5.2026.09.30.09.13.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 09:13:22 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Wed, 30 Sep 2026 20:13:04 +0400
Subject: [PATCH v2 2/2] regulator: of: state who owns the array from
 of_regulator_bulk_get_all()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-regulator-get-all-v2-2-ca82070d22f2@flipper.net>
References: <20260930-regulator-get-all-v2-0-ca82070d22f2@flipper.net>
In-Reply-To: <20260930-regulator-get-all-v2-0-ca82070d22f2@flipper.net>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Corentin Labbe <clabbe@baylibre.com>
Cc: Alexey Charkov <alchark@flipper.net>, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1204; i=alchark@flipper.net;
 h=from:subject:message-id; bh=qOkoB1UvmuC4YZqe5Fz1zEEcDa7BiDDxjJDSjZCF8fI=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWTtNRUPCZn4gZWjK/BAdtgPz7PR/U92Mty49U7kjo/30
 tWsh1x1OiayMIhxMViKKbLM/bbEdqoR36xdHh5fYeawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyMdYx0jBi5OAZjq558ZGXb8P3HvK2/Rgw3O71sN54m4Hq9sMt9ulf0ry+n2nL9HxbgZGR6kLvr
 Iv1q+2nTXhGNiZr13+jbPZpkc9VdHxNdy4vfKh1wA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

of_regulator_bulk_get_all() allocates the consumer array and hands it to
the caller, but never said so. Its own error path frees the array, while
regulator_bulk_free() only puts the regulators, so both callers release
the regulators and leak the array.

Spell the contract out in the kerneldoc.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 drivers/regulator/of_regulator.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/regulator/of_regulator.c b/drivers/regulator/of_regulator.c
index 785b7a11dfc6..09e26febfc83 100644
--- a/drivers/regulator/of_regulator.c
+++ b/drivers/regulator/of_regulator.c
@@ -929,6 +929,11 @@ static int is_supply_name(const char *name)
  * before returning to the caller, and @consumers will not be
  * changed.
  *
+ * On success the array is allocated here and handed to the caller, which
+ * owns it from then on: release the regulators with regulator_bulk_free()
+ * and free the array itself with kfree(). The supply names live in the
+ * same allocation, so they are gone once the array is freed.
+ *
  * Return: Number of regulators on success, or a negative error number
  *	   on failure.
  */

-- 
2.55.0

