Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A38B14477E8
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 13:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791467796; cv=none; b=QmfXL6XaRrMkS1zcAeiC+fsb+NhQK5yd34N+Cv7OetHkc2VCTFyoiVXoV5otizrjr0rTJWsydeRIloq2uhtlS9nu/TLOdxr4s0feKDUIA+pjPvRp7YiqkCZ4mEUsOifb7fgvHlRrMplOGLJ5dLUD+feGLnfDKysKgRm8NPmxPQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791467796; c=relaxed/simple;
	bh=zU05OYynPYFbwF2vZq0gF9lGn3ZbFTGrMnzuOj9sYFo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g60Dry+B4S0LqeXPMai7N0YHetdCuHt5agax/39EfpUgex0lDJ5lJRF7UA7jGY0tcnrXnKAH5Q8FRyrz/1Op8+DpWVjKNaI+Z0FqZeASRsVNVrZUi/ZQLY0L7sqceaMVTdIMrzCLylK2Ehu5OSFTLP7jL7ONnZjJnXOZVPPEI0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nS5wmZHS; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nS5wmZHS"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a061a13884so26598145e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 06:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791467793; x=1792072593; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gpFf7kKepc+cEYa2iUeL+3Vreuqq8d5j5p27iCak5pY=;
        b=nS5wmZHSakZuL6SVs/U5LA6ViqpHCFm6QEGankIvS7F7DHaMmlmGJjqw3O1We1aNoC
         bR9/OFNcizIfDlZwGxuDJLFcgzMJ04Aual7nieV66qn0jH6rUm2ujq0hTU7WdMitA2rj
         Ny5vcmQy8YQJkEn6DpRj9SkSxeTL6fKn3S/jXeZxdzjN6U27LpV1G+9Zw4zHwsj9RvEk
         GLlhtvsZsaQgqeGxQjM0aAY0/VCXofqcF4+B4myE4NsOS5H6hXON4PQghbfjfjwvYFtH
         XAodB2VZzfXwsbxqCbZwRvEVdsym64pMglugyKPaipARqUJdSsW3Ss+UjeSpb8gizm3Z
         0S7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791467793; x=1792072593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gpFf7kKepc+cEYa2iUeL+3Vreuqq8d5j5p27iCak5pY=;
        b=b20pYK3u5aOs831IAUOeEA4cdBub4h79eLqioP3RELiTTjp8warXa4HVwIFdBLrUD5
         DIMGW2t+zxdh1Fs3Dqm2D4y7InHiuMGgxoXL0uUjYOg1sQOfIseHTV7mpKqw3dXulffp
         wr9kmVCUrHP9ktKEYLMS6E80mboSJJKXOUm+egoDCdRVjYMzEHNiXemVZklaUFbzSZ6F
         SJ/e2dbGDfnf4IGKyFs7WFVewUti929UgQ9z9rqiBZkqnwTtSgnOuB1NifquWUcGsNKm
         ArgJjcidXPOjXaw6gbd5tz7knr8IVxbgLocs0PgQvHeA8YC0ct+wMDKvy7F/zRR2jdot
         WDxA==
X-Forwarded-Encrypted: i=1; AKwUvBybr3g9lDMiXNif+k0v/x4zOiExjXDohsgm5lGtlpVCsdXU+nzoXA67CYuYCgnLFTPa5CR2kkFxCzQbcpA=@vger.kernel.org
X-Gm-Message-State: AFuF++lzmt878gfjjVIfhlCTi+l+r/pG5t5OS6KGmnK2HArmjuppVK9+
	6TeyGwthDHd+y2RLSLY0Gwqr/7j/FR7mXQI2774sDKwgJOuLPP50Zq9x
X-Gm-Gg: AYBFou2pgU1qg/Qe6J9naOnZ8JAU/wzNFVMDGV2GXssd1qGpewAB5k9M0qFShpdiJEk
	6xmwAtnVwkGUTOUYlcE5y8h9t6KPB6zOYD0s/UkxsP6GmPIdg6BD82x+MxOaTLFU3dVbdfBdudG
	NWMlRIDq/N2ca9xKB2liSMzuJ1xZBTcEl9tcR9uAsEbrXZaX9AhUQrcqn0fPZdRsqW2+kcWxcam
	0WRUm2w93hCpYKUrkm+iLQYJe5/QK6s18vUhLaaOAKobb95WW6Sfm1X0QEJfeVezEGgtpiy+YM/
	BVHxDOPJDGx+EbwhipxI9u+jRTgpV44uwGdILvo7YnlgYmcr+6pcxQAX61Qew3tm0gNP31K+Zqy
	SFx7y+OU16QIawPD6QPNAVrDpBBWGs1hWVmT0j461a6k0NRhtMNBBxPCCQf/xMIV5vXOMVVtDki
	OlXVbpCPwZlJ4uZ3nZM9Lv/qLELNlgAkcqopxmFQG5NRQ5LA3mzSoIm50dCfQeFcNR2+c+geKUO
	EVSRht/CQ==
X-Received: by 2002:a05:600c:a088:b0:4a1:7e77:c382 with SMTP id 5b1f17b1804b1-4a180313b89mr93347465e9.5.1791467792826;
        Thu, 08 Oct 2026 06:56:32 -0700 (PDT)
Received: from localhost.localdomain ([2a0a:ef40:1479:f801:b8e7:18fe:7039:e475])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a184260f9asm76512765e9.0.2026.10.08.06.56.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 06:56:32 -0700 (PDT)
From: Mohamed Jouini <amad3v@gmail.com>
To: Armin Wolf <W_Armin@gmx.de>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Werner Sembach <wse@tuxedocomputers.com>,
	Christoffer Sandberg <cs@tuxedo.de>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mohamed Jouini <amad3v@gmail.com>
Subject: [PATCH v3 1/2] platform/x86: uniwill-laptop: Add PCSpecialist Recoil 16 AMD
Date: Thu,  8 Oct 2026 14:56:23 +0100
Message-ID: <20261008135624.3520849-2-amad3v@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261008135624.3520849-1-amad3v@gmail.com>
References: <20261008135624.3520849-1-amad3v@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PCSpecialist Recoil 16 AMD is a rebadged TUXEDO Stellaris 16 Gen7 AMD
but reports sys_vendor "PCSpecialist" and board name "X6FR57TY", so the
existing entry does not match it. Use the Stellaris 16 Gen7 AMD feature
set.

Signed-off-by: Mohamed Jouini <amad3v@gmail.com>
---
Changes in v3:
- Rebased on for-next; the feature set is now named
  gmxixxx_xxxx45xx_xxxx55xx_xxxx57xx_descriptor (Ilpo).

Changes in v2:
- Use the existing Stellaris 16 Gen7 AMD feature set (charging profiles)
  instead of a separate descriptor with the percentage charge limit.

 drivers/platform/x86/uniwill/uniwill-acpi.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platform/x86/uniwill/uniwill-acpi.c
index 07b69629b..dc9b73afd 100644
--- a/drivers/platform/x86/uniwill/uniwill-acpi.c
+++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
@@ -3451,6 +3451,14 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 		},
 		.driver_data = &gmxixxx_xxxx45xx_xxxx55xx_xxxx57xx_descriptor,
 	},
+	{
+		.ident = "PCSpecialist Recoil 16 AMD",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "PCSpecialist"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6FR57TY"),
+		},
+		.driver_data = &gmxixxx_xxxx45xx_xxxx55xx_xxxx57xx_descriptor,
+	},
 	{
 		.ident = "TUXEDO Stellaris 16 Gen7 Intel",
 		.matches = {
-- 
2.56.0

