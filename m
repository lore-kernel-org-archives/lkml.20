Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77C5F49CF22
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 16:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789489991; cv=none; b=t73fZWnJc5AOQ8r/r00dTywrLIGsRCWiP5muY4ldqKVXPDwLDvGgihci57AvmVNlVRnzH1Ve8faC21nI3kqDOH6NcTd9mUB/NY7yK8A0KOpVCAHTM6Oh/Rgkw8W3Oibi/XUem5y0d2QVJbkQHd7+ZsgA8OlLt/8ny0oKT9fbbyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789489991; c=relaxed/simple;
	bh=KGDGqPgNd/OBpYdXIpCYKiPmB5qT0ahrc/xo97yUpqE=;
	h=From:Date:Subject:MIME-Version:Message-Id:To:Cc:Content-Type; b=MJMRLTqtWDEa7TnwJQDJ76XFbyR3Sm8+eo1azMQNy1x3On3hr0CdZItXnHwWNrpM69woQRgiNpusAQ8IMwN2EPGKD7DXPwkk37DFSssa+2JZWDlLASGCkveg9hTqiAazcl3s207PJ0/VMMIE7t+dB1X89Ni62NSeMpt6PxMNPvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sne.moe; spf=none smtp.mailfrom=sne.moe; dkim=pass (2048-bit key) header.d=sne.moe header.i=@sne.moe header.b=jayifd32; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sne.moe
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=sne.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sne.moe header.i=@sne.moe header.b="jayifd32"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d6ff23d82eso5612765ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sne.moe; s=google; t=1789489989; x=1790094789; darn=vger.kernel.org;
        h=content-type:cc:to:message-id:mime-version:subject:date:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5l6w9DGPU8Uin85r0NsK8D3bCXIsOpHOKl9nAzEtDoc=;
        b=jayifd32mBKr3qiNEsyIGux4oLqJY8XIxw+kDBsMALFfuvf+InEIGIFtA2DprN0Lxh
         pmzn7TzQLQNRbPyh8XFVbrH3kv2qg9VfXyc/N2OFbt7Zbig7uMfA8Q13mg6AGCvkYq+G
         hrPmfuGI9UzrY6Y8Lhy+RFnhbNNMT8bDaLfxRDHHuJXjhFYTuBytkLDnXmny7pyWRdJB
         cXApzToltRyVaQEODthC+6qmEJ6InAVACa/KBNj4K0CePkgH61gtyNdv+ex9O0iuT3Ut
         c4NoEauRHyRb+BMQDcSbwg77HKVNmKMZvUrPRn26Zn6OCyuihZXiqqPj9EiDoBCwT74s
         OHcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789489989; x=1790094789;
        h=content-type:cc:to:message-id:mime-version:subject:date:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5l6w9DGPU8Uin85r0NsK8D3bCXIsOpHOKl9nAzEtDoc=;
        b=xLZpGrOjUkgV1NBhEYgWxIMUj18vsyuUt/F1s0KrNsObgtGdyR1fXQIeIMc2u2/4BU
         03PpDrNtCqDQX2NlPA8gqeZPjm0om0+kmCnRshR1lAV7tPI0t0oHF4QfkpOHW3+S1/Fc
         /od/EQh3YdHLkAIrQWFFCtmJBYM4pYkESOmdCyX/OPVMSgRfKAm1yvD4Z7bdrztQktf8
         /s3dBDPo7C+LTO8zxyerY81n4lndaNYfq7f37I6gRlDZb6z+tQa35Nx4wPehvQ8KK2ix
         QZLAGFxUUc92SDNqYWTXiUtohIFHSKFOKyntafyI9nWvDoUIsTpSimbjghifxCk64mS7
         DCyA==
X-Forwarded-Encrypted: i=1; AKwUvBwePiprCwEFm9FSKdKt6Ypp2qN3GU09ytHsu3iPDuZCSKK/LOYggKvakdjEfzzaw2LYMviBLuB7SEsBR0o=@vger.kernel.org
X-Gm-Message-State: AFuF++l6WTSzqDf+o3Uo1nGmO4lUPa1lOZqHvM+t5qadn5KRUDeaw+Ih
	0jEU3iWlYHb0qSyVViJ21bnWs2SxY7eciEJX1pzGCvqLSeEPr4r/PD6X8vsjDWFUbEyjhoeMilF
	7pX2etpkGgHqqKia4O9IAThm0FuAVaJvGKOZzaml2eTyIPGu4X/MLNU1PQiqwzU0SOIgf41+itk
	XIzYVPkUQ=
X-Gm-Gg: AYBFou0zFpfnRt9dpVV/LZM+JLtN9unb8DzRMwOb9ysfzRx1R02IApc/SwP2PyUcAUI
	n7cYTGtNFN/DxbQorS72+ObNyFjVxklC6Hv1wC3OJnUvZD3+Umqn66qwLoNRt1+gT0CKds2yTFf
	zykv9A/wKgkptc9qQKWwzYif/aGjB3oNyCYdH03NQtldyGgwe9OhZvS6GtvmeGn1Cb7a5OaBS3v
	be0M0DL7CsuvIt0WOZ2UQJx321M5GH5sjeV1jo5XHHJrfOC2ryENvXy6u5Ms/nVNK48PS4rtgne
	f62p855J4pwPRm92BeJvfShORDCmMXEogwWxlv15Kf1n8KvRoWWUmLMBiVflmar6GzOnk/pXHCN
	1RJm8m2PG1zcH0VM1jT+qffJkABczW88Dnu4p02LPVpeAwKRhObNL1sgtT1PfeDuKDuENEPCJcL
	D9Uy+IJuMC7nlf5/T9VNUJtG5kFGHhxatZheYqtZR9tAWtnUxFGcwztEwWm8ITeYk=
X-Received: by 2002:a17:903:4585:b0:2dd:190e:28b6 with SMTP id d9443c01a7336-2dd6c6e2812mr113112105ad.2.1789489988615;
        Tue, 15 Sep 2026 09:33:08 -0700 (PDT)
Received: from [127.0.0.2] ([2403:18c0:1001:3a:74ea:baff:fe97:d2e7])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc50ab9679fsm206727a12.21.2026.09.15.09.33.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 09:33:07 -0700 (PDT)
From: Asai Neko <sugar@sne.moe>
Date: Wed, 16 Sep 2026 00:32:56 +0800
Subject: [PATCH] platform/x86: asus-wmi: don't warn when LPS0 is
 unavailable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <20260916-asus-wmi-lps0-unavailable-warn-v1-1-9bd6fb4c10f9@sne.moe>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNQQqDMBBA0avIrDsQg1jSq5QuJjptp6RRMkYF8
 e6mdvk2/2+gnIQVbtUGiWdRGWJBfamge1N8MUpfDNbY1ri6RdKsuHwFw6gGc6SZJJAPjAuliI6
 u1nPTeMc9lMiY+CnrObg//tbsP9xNvyrs+wHmvTxDggAAAA==
X-Change-ID: 20260916-asus-wmi-lps0-unavailable-warn-9a72be44b9ed
To: Corentin Chary <corentin.chary@gmail.com>, 
 "Luke D. Jones" <luke@ljones.dev>, Denis Benato <denis.benato@linux.dev>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Asai Neko <sugar@sne.moe>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1902; i=sugar@sne.moe;
 h=from:subject:message-id; bh=K0x/j1qpu8TtCs+QlqY6lETYbSNLA9xxbk2O3vU1jgg=;
 b=owJ4nJvAy8zAJfZHZ3FlRAEbJ+NptSSGrJXFDlu7Mnsbrppl1X3/28QY5cxg0RC84IDc81V31
 G7/WPMlSqSjlIVBjItBVkyRpfNIV+GT1/M+HHDR5YOZw8oEMoSBi1MAJsL8kpFhm89M/mrvuocn
 zrzeeXvSQq6KEIGzt55bJPf/Tl8nELhgCyPD2snsiz7/jNt9j7X/xLbVhj/+7F5tyly96UXO/Ql
 +l3tDeABTWkzi
X-Developer-Key: i=sugar@sne.moe; a=openpgp;
 fpr=89C48A71E4EB9EF0C0442D0EFC2CA37958700609
Content-Type: text/plain; charset="UTF-8"

asus-wmi attempts to register its LPS0 suspend-to-idle callback during
probe. acpi_register_lps0_dev() returns -ENODEV when the LPS0 interface
is unavailable or explicitly disabled, but the driver treats this
expected condition as a registration failure and prints:

  failed to register LPS0 sleep handler in asus-wmi

This occurs on the ASUS ROG STRIX X670E-A GAMING WIFI with BIOS 2704.
The system exposes no PNP0D80 ACPI device and uses deep suspend. The
warning therefore misleadingly suggests a sleep-related malfunction
on a platform where the LPS0 callback is not applicable.

Suppress the warning for -ENODEV while retaining it for other errors.
Leave callback registration and suspend/resume behavior unchanged.

Signed-off-by: Asai Neko <sugar@sne.moe>
---
Avoid the misleading ASUS WMI warning when LPS0 is unavailable.
The diagnosis and rationale are included in the patch commit
message.
---
 drivers/platform/x86/asus-wmi.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index a65090429ca7..f7d009b742b3 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -5421,8 +5421,11 @@ static struct acpi_s2idle_dev_ops asus_ally_s2idle_dev_ops = {
 
 static void asus_s2idle_check_register(void)
 {
-	if (acpi_register_lps0_dev(&asus_ally_s2idle_dev_ops))
-		pr_warn("failed to register LPS0 sleep handler in asus-wmi\n");
+	int ret;
+
+	ret = acpi_register_lps0_dev(&asus_ally_s2idle_dev_ops);
+	if (ret && ret != -ENODEV)
+		pr_warn("failed to register LPS0 sleep handler in asus-wmi\n", ret);
 }
 
 static void asus_s2idle_check_unregister(void)

---
base-commit: 587858367581b9c55c3690f4e63382ad622719d4
change-id: 20260916-asus-wmi-lps0-unavailable-warn-9a72be44b9ed

Best regards,
--  
Asai Neko <sugar@sne.moe>


-- 
Asai Neko


