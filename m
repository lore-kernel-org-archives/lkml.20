Received: from mail-vs2-f41.google.com (mail-vs2-f41.google.com [74.125.227.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B3C23BCF7
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 03:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789786956; cv=none; b=ZsV/cWTly0fwPy2iJcrjoko9EOMOwXBTcC4z3y9A4hzSDFslK93C3wGmIO4NG5pD2qptBezdD37YLxIz7OCE89rKcpcQXPd1E4+ybwTM4TGyrbc43Q9kjWCnvzEnwD37YDPaeBbOnVde3PApQ+8g8H5QtBk2m7VRERdvgX1iByw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789786956; c=relaxed/simple;
	bh=CYNVK6YC3aZr1149C7YVsi5REhaaHK56J2QkT3Vltk0=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=qo2qH0vZW1HtgDN672nOq8druagst6fhSuvhT6XqLf7aYcKMawd9WAaCFO2M7yipPQDVJ9FsLrkkDda1w6BE22/1jZwN5P/Kp3AqcgouRS7ZbqsMUzqJyf2/kWUhFSsxt9kx2qsk+ZctDlf8cK9JhqPOOHPNuO4oOiZMekkmU6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=idkmanager.com; spf=pass smtp.mailfrom=idkmanager.com; arc=none smtp.client-ip=74.125.227.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=idkmanager.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=idkmanager.com
Received: by mail-vs2-f41.google.com with SMTP id 71dfb90a1353d-5c67e512ee5so440016e0c.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 20:02:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789786954; x=1790391754;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5fzJtigo/7t3PwS7P5np8F8Yh6nRyXPfgoaV8isKaaE=;
        b=vlSOvN1wib0VlRHLOF5jldV44t28kd/EfmsqdqLoxvEkwRKVKUb2d8K6VMLuxiVV6Z
         LPgxyUX8eHcJN5Q3GNaHf7iPQlamUAS9wdb2ZGHiq7u7QzrK0S5+sbXoFbYZQ9VjUySx
         RWTlvLDZh3Wl4ZwVDMEAvKMY62BYn4v4mSduA2cXMlGBMpOMjbcrLAnsvQx2F2erxAVb
         vjk31Giye5YWGcz5Ol7QcISXREvefvKExGhEbRbR4keVmY4ovcMVqg2TFyq8h0yK3MYl
         keMYGZGqdpmMSS45lya70l1ONacJZmIlJC6PvjvvzSsEJFqv8WOZTvDQ8/FbdaCt8PP1
         1Szw==
X-Forwarded-Encrypted: i=1; AKwUvByqSRIxOPeIL+2c+BaOtD4HX8cbdIEzpJj2gK8mPRrboJM6mvp4eyb0Ie5sDQSr1mokOBDmHRM31rkpofk=@vger.kernel.org
X-Gm-Message-State: AFuF++lxECCmIJsJURPa8KLaTmOV6xDUEW7GNkfYliuaNKwEkA10MO3I
	VL2+0xP3r5ckaAzVIL5DUZfcDkb0Z5lnuvSCsa1pOdX0TpLQRPpFyOQZnKAlbr2w1lDO2DJ4UOS
	dw6SoagPyng==
X-Gm-Gg: AYBFou00MIpPA7Yykz9oywIEKdCFqFUugVBByudr3jxLFXwsBciQCmEfH/Ql3DJmJYi
	gEwitf0pxc6QcQfc0BAiEM4fPXZjbfBBYm4apzrkE/dyEVzXTHfsRiH/nrU5Yn56xAN79DLqh8p
	D1b4SHPou9WnadOLytECjMObjR5cBYSnPb6RH084EOx/Knh05DnwE/N0rZWADfCBCeq6GE55VZg
	QdWCjNSPUp6YJaUjCjptvQ2CScw7bhogk9fqPNHBXE9VmrRu5R8hXuR8OhVaFTF/NC/L9tkFKiN
	EPpzlYcXH0st4dSc3qYOOeOMl/i0sl46ScK1gbleVtj1acNzrldCxKYk3PgFekz/grwBbwXGXam
	qvgU2CTKqnH+1hnnZJjwIYvkSeqZC4j6vf98a9+3P7y4xiGFiSn428n5DDoeg1DvLOWXz4+jAqS
	4epsyP2siAyapCwFoBo8/Z33sfpx0PGDrYgNdI0rl0YCDXjdw+PGH/K//kd62pqN8ON4SK4/1ie
	xmdpj5CnIiRWIH2ebpPnWHiPi63zjft0dgyaD+LdbeKnNZoRvtooGc=
X-Received: by 2002:a05:6102:419f:b0:7a7:198a:c2c6 with SMTP id ada2fe7eead31-7a7198ad3f4mr32603137.36.1789786954039;
        Fri, 18 Sep 2026 20:02:34 -0700 (PDT)
Received: from [100.96.0.25] (corp-190-12-36-222.uio.puntonet.ec. [190.12.36.222])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7a6aa41d7e6sm1385924137.1.2026.09.18.20.02.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 20:02:33 -0700 (PDT)
From: Ing. Alfonso Kuen Arroyo <gerencia@idkmanager.com>
To: hch@lst.de, sagi@grimberg.me, kch@nvidia.com
Cc: linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
 mlombard@arkamax.eu
Subject: [PATCH] nvmet-tcp: fix stale comment on NVMET_TCP_MAXH2CDATA
Date: Fri, 18 Sep 2026 22:02:33 -0500
Message-ID: <178978695312.43804.1554581215424967584@idkmanager.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

The constant is 0x400000, 4 MiB, but the comment next to it still says
16M. Noticed by Maurizio Lombardi while reviewing "nvmet-tcp: report a
bounded MDTS instead of "no limit"".

Signed-off-by: Alfonso Kuen <gerencia@idkmanager.com>
---
 drivers/nvme/target/tcp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/nvme/target/tcp.c b/drivers/nvme/target/tcp.c
index e598101..726e05b 100644
--- a/drivers/nvme/target/tcp.c
+++ b/drivers/nvme/target/tcp.c
@@ -23,7 +23,7 @@
 #include "nvmet.h"
 
 #define NVMET_TCP_DEF_INLINE_DATA_SIZE	(4 * PAGE_SIZE)
-#define NVMET_TCP_MAXH2CDATA		0x400000 /* 16M arbitrary limit */
+#define NVMET_TCP_MAXH2CDATA		0x400000 /* 4M arbitrary limit */
 #define NVMET_TCP_BACKLOG 128
 
 static int param_store_val(const char *str, int *val, int min, int max)
--
2.53.0
