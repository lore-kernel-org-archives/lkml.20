Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793890707;
	b=Ypcj/NQRxPFA6BlUTlAm2696ZYGUjE+x3852AhfC5q4AScRaYbeDrfcRWNDIex+T2X4I
	 BCCfArfZGinKbLl6/dXAhUL8eWPuiZk4c0WCDygdeGP7p6GchOuPUvF0NDjuj4xvJmNzE
	 ux89NoCPRBM5//Dms7Vfzmtk4CCcPpXitR3JzP7w/l6oNWxikhM2FJD2EOwihGgwEh6h1
	 xrpUH4g7fhMKUSEYc0E1G6bM5vOBcBRCKYVGHd6qvoxJ7wx7XZFuUp1OfGc/usMmk5H1Z
	 vKxDcRY28MWkLPwTA1HCeQH9TnQNY7B/ChRlFtYBv0UVibuzmDTccb/zpapvNNmFjEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793890707;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=2nslQvC/aVHnWdIM3Z4G4/15txf2h77Oj9uqNFdqD0I=;
	b=bi2fnpVVaKGfnWkFOjmTUd3SPL3szjvzrLTpK/JqlL22fg5U2Ogd2UAvt1EH0rzhr0oW
	 QEPy7Al2kq8ALtQvP6OvKqwB7aCcxDwd7RssKLMPvLUg/74sH2mbE/prNwHxkgkALl0+v
	 MPnnMPqVLpQ9fEtsqd1Zq3DPurmULrYg2Cq0EKRnp0QdDVirWIqsyt8qWHHbOuxlJxlY5
	 lFJeUbqlZMwBR686vs6TPVYiSUWigLsrQhWTxgT6EuB1KWTYKnYUfOmW15WSCleAeQoZI
	 jyFLxy8HDnxE9ayqrMf3/G/7RtIfTu9yrCa2FdMNGvI+ixisQErzZnvFQH/SBAnYENQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=OjG4onLT;
	arc=none smtp.remote-ip=209.85.167.170
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF88606EEA3
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 14:58:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BF88606EEA3
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=OjG4onLT
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-4d7034a99a9so1184450b6e.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 06:58:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1793890705; x=1794495505; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2nslQvC/aVHnWdIM3Z4G4/15txf2h77Oj9uqNFdqD0I=;
        b=OjG4onLTyO9/HeWu2wWrKpIlBgalaUbSg1aE8cDuWWJKH2+2YcCmfYNv0Ilp8T/mWO
         l7W+Y1w+bb90O/WEIwazfUTxIuBgTzkUGZyP4yp5ZFp83GmZZRI5VttMl2QyXeMA9eDk
         gcBlMNfM9KTR/ieWpT9Th23oXinpOI2jWIucbHNEQAHQJflGN9/q61RpmZZ2dpVGzlWe
         TX4I9vaVohguCAftJewTlwT0dJO4TI4SarTFKR0uZ8lgtyGJvo9R0FHmDmgu8aOZwEaR
         G9D+s/70lZof4PFw1B1NONGqP35dfDKMHXzsnWgRrYHeb3YVw4/uCL2RcYJJ5pi8iEoQ
         suAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793890705; x=1794495505;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2nslQvC/aVHnWdIM3Z4G4/15txf2h77Oj9uqNFdqD0I=;
        b=iVPrDeP07XaSqVYNnJNPVpcw6RNOE+jwcT9+khRowOJtgT78lTc1J0+iX6BwZj/qvo
         UptnQ681ICkjQwgfnpoXLL8OMTF/uNs5Z9kmxgvsI7wtq8M0UX1R8dzn88tA3CzFo8Ls
         VBgw/w9rtGYB+G7QPw5Cnn2SQiK1lbvDm0lWO2/Za1mzUKjCOwaM7vIrndVnSEYCZGhc
         N585TLnuGY04nmGsE4a/urVzzKevSPoU5HiM7xO9/pErxNRr8Ul7BpNoX7QONpLc2Jfi
         LCPTkc5Mgukktf0IaOYVuNPMWSQq0BtSRNu0HXwD539eLc3nGWNbpD5yND4jHOBoZ53z
         BWcw==
X-Forwarded-Encrypted: i=1; AKwUvBymPdlLQYCCWRyMAK80bLUUEkkamkhaxXmahkGMO3+9ClSpgOy3hIPLRHgCQeW/pTwNqluYlE6HWygdUVs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/5y+Ai13fOw5gFDvrleT6yG062s4BAH+oHUUcBE+q3FJRiIq0x
	t0gFByxpdjvh3FpiZqU/HZX11ip3GVKOMAUi41C3/zSzWy0+U14bN5UuvXI8Lb2EbNw=
X-Gm-Gg: AYBFou1ecxMOYTSkYIg2Hv/XO83KpmUWtcubVaji+gLBX2K+BDX2rlXLQ6SP8+tDYfs
	v7uZo9vNaTGrR7NJYDrA9HxfalsiUVoG/nJnm4Og/MUJOTs6ciZH1EcTs1Yuq9tLU3pHx1q9btr
	qWcDUf1zHe2dtAgyzQG48duvnNypjxCqt/fh5dpy8x1AiXaMVKoOli+8eorbtb3GfM1Ei31+QC2
	NkHTCFInlKF82YsbtmVOMv5K0/ttzfH3W9P2h149RUYkC2u3dSrIeY1A2zxyGel6SaRGYBQB6wx
	pB5LCU9JR5wByugDsb5BaWZ9Rtlqedt8jUjqXjqwPdVZ+ZCoe1b1/6SSlaD9tYV4UqqCAxDRxZd
	Up/pV5raRBLdfH2wx0JZOMRPJu0WL+d3CnAQ8g7vCKgzttCHBc3cCjhRzNbHB+XV5E4XrCuZRM8
	f4MIfx5arzsT2i9Kp5QhOZs5ch9k6SfKfHRN1fsTn8zqsSgc2s37A+hPXZ02rt8LZ0Yl6raGsk0
	qsew8VXNHZgbQLubKzix5C9PXabUX8eqhXZc8IWqD5uZMSReELKCbygt7rJtAVAdU5W0vy+v4ww
	nLo1M4FAN3jw3OFYYSLdsXAsVlw6F4uV90tN1tU1LTeLHw==
X-Received: by 2002:a05:6808:1798:b0:4f4:b62c:a3d8 with SMTP id 5614622812f47-5640dcc0142mr13239065b6e.33.1793890705297;
        Thu, 05 Nov 2026 06:58:25 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.251])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567a9f34acbsm4419244b6e.7.2026.11.05.06.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 06:58:23 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 05 Nov 2026 14:57:06 +0000
Subject: [PATCH RFC v3 15/90] fs: let an idmapping pin the ids of a cell
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-b4-cells-v3-15-bc9095937a84@toxicpanda.com>
References: <20261105-b4-cells-v3-0-bc9095937a84@toxicpanda.com>
In-Reply-To: <20261105-b4-cells-v3-0-bc9095937a84@toxicpanda.com>
To: Christian Brauner <brauner@kernel.org>, 
 James Bottomley <James.Bottomley@HansenPartnership.com>, 
 Andrew Halaney <andrew@amutable.com>, Jeremy Bingham <jbingham@gmail.com>, 
 Tahera Fahimi <taherafahimi@linux.microsoft.com>, 
 Serge Hallyn <sergeh@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1793890670; l=1943;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=LEm7jnZkkI0mYjYi1LA7l2MoWWec+D2ZoGJVtMUTiwE=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QGBAr7sDJpJH2aFRSBZBN348qhOGfAgviJxZyIAOk4k8MK5LiEamnB164r4rMbVuLGjKA1h5/fr
 qPx5HzTh/6gE=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

A struct mnt_idmap holds a copy of the id maps of the user namespace it
was created from. The copy does not pin the namespace.

So a mount that was idmapped for a cell can outlive the cell. It would
keep translating on-disk ids into the ids of the block after the block has
been lent to another cell. A set-uid file on that mount would then run as
the root of the new cell.

Let an idmapping that was created from the user namespace of a cell hold a
reference on that namespace. The block is released when the namespace is
freed, so it cannot be lent again while such a mount exists.

Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 fs/mnt_idmapping.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/fs/mnt_idmapping.c b/fs/mnt_idmapping.c
index bed57094cef0..93a34bc93efd 100644
--- a/fs/mnt_idmapping.c
+++ b/fs/mnt_idmapping.c
@@ -21,6 +21,14 @@ struct mnt_idmap {
 	struct uid_gid_map uid_map;
 	struct uid_gid_map gid_map;
 	refcount_t count;
+#ifdef CONFIG_CELLS
+	/*
+	 * The maps are a copy, and a copy pins nothing. The ids of a cell are
+	 * only lent to it, until its user namespace is freed, so an idmapping
+	 * that names them holds on to that.
+	 */
+	struct user_namespace *cell_ns;
+#endif
 };
 
 /*
@@ -281,6 +289,9 @@ static void free_mnt_idmap(struct mnt_idmap *idmap)
 		kfree(idmap->gid_map.forward);
 		kfree(idmap->gid_map.reverse);
 	}
+#ifdef CONFIG_CELLS
+	put_user_ns(idmap->cell_ns);
+#endif
 	kfree(idmap);
 }
 
@@ -294,6 +305,10 @@ struct mnt_idmap *alloc_mnt_idmap(struct user_namespace *mnt_userns)
 		return ERR_PTR(-ENOMEM);
 
 	refcount_set(&idmap->count, 1);
+#ifdef CONFIG_CELLS
+	if (userns_is_cell(mnt_userns))
+		idmap->cell_ns = get_user_ns(mnt_userns);
+#endif
 	ret = copy_mnt_idmap(&mnt_userns->uid_map, &idmap->uid_map);
 	if (!ret)
 		ret = copy_mnt_idmap(&mnt_userns->gid_map, &idmap->gid_map);

-- 
2.55.0

