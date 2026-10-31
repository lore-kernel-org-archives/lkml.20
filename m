Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793435744;
	b=LhuKQu24Fv430ZPn8kEQVp7/V2COMpgTbyKc6SSrf7KvJfE4D1Ni9wgDatjbhA30V1AB
	 UHQ9/sHthQRiM8/3Rfz3lBH20/3JpdHmA6uR3JmGh9BexEOP2J1KOwlDi2eAeldFNmMub
	 FJPjDZ09cQZ2MdAoAVuP+R9jk3GRhKejR4E+faCUJ3EXROXS4C9x1ka4p1Bw+DG535k2X
	 IC9CIcTH+hsbiO6EO5rI3kzzTvB2ah3544vI02KHmNpL0RVPcjnWqXkkIqopX1m4J0IRE
	 b1O28hENu31NjENdIzrdxBI136kGEkiUsfF9JgEl7M/VvZAC3o/cdPv/Pc0//oc0eSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793435744;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=WLiyauFtJhuMbP58y+JmNLKI5+Crt03dR88sII+z+Zc=;
	b=KInDmjKDhCo5K6tjx1jz/SX66N++nRgKnw/JvJerAl/8R1pIbCzezDTFN62V/3FFzq7t
	 B+a1IOV0iUYjQ1POWRR7/0AdkRdDd1Ti7sdbhQNAPnRSgF/IS5geUEcae+M0RkaQ7o1Qe
	 vKiXsnVWOkqySgt3IOAxR4aruuh8jucNMWupve9b3b3x3AS2ekNHbw0wgc8zqIlnNnq5k
	 MWWpCYS6N569DE4p7dcootvYIKtMlMDOnznb83QglmBJRVivMP5bgSKZrPbGPpCHka9ct
	 hvd+xBpkyF31Ctoor/UumTzUxkBMreLlgwn5cHMX/2+lLQVuFeITMSTIqdoLG75ES5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oM7MKWPX;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29B39606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 08:35:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29B39606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oM7MKWPX
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1ae18eb9b69so809317c88.0
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 01:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793435743; x=1794040543; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WLiyauFtJhuMbP58y+JmNLKI5+Crt03dR88sII+z+Zc=;
        b=oM7MKWPXiwBnmnUW7hjb7bFq7oaqkJ7gORRhViZm0K69X7bramu7qL9bsdRosphnds
         tTgzzR22oZFcXrvHm5WQ9SrRFpx8/dmc814X+ECqN++TrtoAsu1YgSAb0AF1t4vblKzx
         rRrVRHzHwxSIBANpvdQqFYhMX2G/BEhmf8Rm1syR2Irio0MjMcGteAk5/5NMqaB1K/Z0
         r5sYfaROlkM0fSSf82q4QxF4xmvun5m1onRXi+2evqGpj7QqTmzn+NTuPPq6WKhXMWi0
         6wh3qZoLVpGENMeF0PbiRqhu7mLHfMUPhDJ2q62wW6feRmKacl5MF9hMX982n5NbLNx3
         3nzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793435743; x=1794040543;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WLiyauFtJhuMbP58y+JmNLKI5+Crt03dR88sII+z+Zc=;
        b=rmmoBrACf16OSK9oo2pQzVABY+YC/5X3vNbyKIF5TIBtEkw0bWvj+otbfz+SWOc1uX
         QSZnq/wZJ4OlgjiKCrE2Qwd15S5XxEYyAEC7DlaBfKXWm8YUlDyj0TsCdQV+m0NQBYye
         dk55Deb6j/EN9Heo0KG82AesbF5hHhErJiV8JjYVfphqcBu7qXFYufrhYCHQ+dgOg49R
         sjTatF4E+kT4ZKvrWkvz1KhcwZ+XqfD9rqL/ZzZXVC/F3UZVCeKrgEebEfcvHQcFQgUs
         HEC/cJeF27JoioiMr1Ts6T/9nX4jtcLgGKrAbAx+uw4e4355F+sWYpLYsjC8GaduLgjl
         i21w==
X-Forwarded-Encrypted: i=1; AKwUvByHNEWgeC+n+X17UItaBE6M73N5kRg3G7sV1LCJT5SDmrv23Hz+riGKkI6XY2d+sosYoUHMrCvNTc0C9Is=@vger.kernel.org
X-Gm-Message-State: AFq9FYImLiIQl10Lk32pMGYXF7dhX8yKmRhcFxAZspsCAXMs3R3NYJiM
	bu8lvqxOR5avVpZul0YHsU4fDSt7/S1XCUIgNPj0D4ain8QpwRnKab9kdC5Hrg==
X-Gm-Gg: AYBFou0aKrNzBtlWTUNisgZbLt8AhLqqA7yMKd4+nRBeftPxcNmu+fTjxWE6+WEHlXh
	/gu5V5R21Bns2OrzSjCO32/I/SldqKRXJUdCNY423IiIfn3xNwoo7mUWuTlcDid0ZgC5WtWF+MP
	vnQNYts7qHQHMqtnk+1eV3H0mtrMhyoPpP/vgGx92RwgixuaMO366woUhWZZ6F8YfzOA1Un75bD
	SHk/CzN66c0vGg2/hRmQxvqPWu+kSu/kEjhIiST9D/ViD1FBkeiEGcvgeveWTRvgn8203BGyrAG
	FvESTZK9I1dVDU/HSCX+pjF63jaFeNrM46KnNGA02652dS9qGBT1FRNUbAdSaYMd/jo5L7tdlXV
	xj+8BHBNyaQw2sl9XDqaiuFJurftgqrKmCkpHEnxTWhSROcKFjgl7Zj2EdI3/FEBdSQoMTspSFw
	gVWcm4/nWaygYUMcUIRJb/8AOiiUQQYcurZGtNl/QIy6tJJTlugAAg33GITghnYKYVnzXI6JSrO
	hCpVgu+pe+OVuH544Qnz2nPumHmSHoDYPa8+TwQBoKmv7X1eIuwm7/gwK/2qq57D6OpPgKGVFeC
	GP0qzNJgfXuVw1FTdtTG4SdbUZ+rdOxDCtkvUkbkMcIhvl4KeQ==
X-Received: by 2002:a05:7022:7f17:b0:168:3243:c937 with SMTP id a92af1059eb24-1ac5cb1c8b3mr7522678c88.16.1793435743153;
        Sat, 31 Oct 2026 01:35:43 -0700 (PDT)
Received: from localhost.localdomain ([103.170.55.71])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1854da78sm18910706c88.6.2026.10.31.01.35.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 01:35:42 -0700 (PDT)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: hare@suse.de,
	hch@lst.de,
	sagi@grimberg.me,
	kch@nvidia.com
Cc: linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Subject: [PATCH] nvmet: preserve ANA log page copy errors
Date: Sat, 31 Oct 2026 08:35:05 +0000
Message-ID: <20261031083505.4767-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
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

Do not overwrite an error returned while copying ANA
group descriptors with the result of copying the ANA
log page header.

Initialize the status to success before processing
ANA groups and copy the header only if all group
descriptor copies succeed. This ensures that failures
during descriptor copying are correctly reported to
the host.

Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
 drivers/nvme/target/admin-cmd.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/nvme/target/admin-cmd.c b/drivers/nvme/target/admin-cmd.c
index 26028be8fe4d..2bcb6d3de9ec 100644
--- a/drivers/nvme/target/admin-cmd.c
+++ b/drivers/nvme/target/admin-cmd.c
@@ -543,7 +543,7 @@ static void nvmet_execute_get_log_page_ana(struct nvmet_req *req)
 	u16 ngrps = 0;
 	u16 status;
 
-	status = NVME_SC_INTERNAL;
+	status = NVME_SC_SUCCESS;
 	desc = kmalloc_flex(*desc, nsids, NVMET_MAX_NAMESPACES);
 	if (!desc)
 		goto out;
@@ -572,7 +572,8 @@ static void nvmet_execute_get_log_page_ana(struct nvmet_req *req)
 	kfree(desc);
 
 	/* copy the header last once we know the number of groups */
-	status = nvmet_copy_to_sgl(req, 0, &hdr, sizeof(hdr));
+	if (!status)
+		status = nvmet_copy_to_sgl(req, 0, &hdr, sizeof(hdr));
 out:
 	nvmet_req_complete(req, status);
 }
-- 
2.55.0

