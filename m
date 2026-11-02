Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793643511;
	b=PC3q9xI2TbSkMm5Ao4ef2jlHGV34C0GLfJkgxg+132a83qQgamdJK3xBBQ8NawMV+CCH
	 A2vNIdrc7Zy+Y1S46Xo1seGiqTIB67m4UeaWnXCqC1uPzKF/DucBbiMZL4/THeWyjZIF6
	 BNQSvogHsAn87MIUIJraJoQDHiVXi97arn6t0n92sn041/6MOudc+DsVAyi48ErxKHPeB
	 dGnDmD47UPmmqF3mo5CqcEJcLTgKco4mrfyPwyAM90IBAWgOo2k0hQXqRKiQ+EukEFMhs
	 z1KqGWndsvfvKaH1iUBlUVTQ2smbLJvVI3w/5Hbh4xULRLlFDHAkEeRJBaB+MDgaRZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793643511;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NHRs95xsQgjnwOuFrugRmWxAc9XLLQLwb+OYmfFck/4=;
	b=wyefApz34yk0OUl1rzWG3VlHhly4bgSkKWVz5mqdumVftQfF0jIGvSgJ8PmWqBIOZFnu
	 IiE1euknqv/Fg3f7G2pZZenp57+qVdc4ceFGWuzTMkaScpG4/gDaX/FyVcwt5z0gOroCI
	 iy7pRiOuTnO3Lnu3mFA7D0DMi18oHgN8rpaxR3bFruq27YI/Gw7gxlNtmtkyaF/S8uxdy
	 22tZR9Lb3A9ihGDiSHx3nkhSaiKAQNUnFGO4fLn55P3NrZkeaODf1m0f49nbzPlr15Aug
	 TGFlExy8HG0Yuh3n4tsNMgqUB2YFcsKOlVIRbpftiiFwh1WdjN7VzZzim37KlxsrDUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BNcbP4a3;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C4C9606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 18:18:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C4C9606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BNcbP4a3
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48e0d1da913so2558656f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 10:18:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793643509; x=1794248309; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NHRs95xsQgjnwOuFrugRmWxAc9XLLQLwb+OYmfFck/4=;
        b=BNcbP4a3nURPwGReohMJlcBk7a+a/QqJYDJigkMRVyIu0fGjRRoEhJMwq/Id8ORSVy
         cuB198sVread6+W+jQ5TzCWxhFtJyV+DI50GNK2tk2WzojkKwvynA2v+0Kby0Py3Hl7S
         OXq1ci1nHxaX+emvJAan4BUEQOxPMv8xlLxdiT7dJRJ/awtbLOlGWv+i28diy5ePqwUn
         pGPdpeiJkkLof9X+5xiIZR8LndVMPlD9VFWDVh/iC7cMWuSKWqtk2usG86ld7PrXMLkY
         24CvM2zC3D4PvnYVmvaznI2ziS+kR8vehsO6akIBvV3pWM6OnY6bcYZErkjDgkZ5wRDN
         wl6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793643509; x=1794248309;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NHRs95xsQgjnwOuFrugRmWxAc9XLLQLwb+OYmfFck/4=;
        b=nNhxo0t61YT0ixJ9DqTBuz5a9AIKnWiSkdx06QWWBtHUWG3y6mTuQoJ4JgxaNykyI2
         B9GxQzRCP30VhUwAnRR3sJRA4T2WEGJVIB9vNLdVnBKwAWcOLY0sDgDKPHTNUiCbchJx
         38QrqzUsasR4jK1plVJqt6ARHTJFYKlMGKhuSu6xZ9l0ZdFAaOTPc/l/priWqq0Y0OYI
         hxzhfaZlv70C2suNWzmLfbQX7yOv8pGYai/curRR/KU3njLqluJxqBXeyRwIM46WfurZ
         JUIZo/HiOkXmqwnZ9pjkNYAX7X22m0V/JyyrW5MLBS0YWKphkWXVhuHrrh3RJdlxwdjx
         GdOw==
X-Forwarded-Encrypted: i=1; AKwUvBzyvtMGVwxzHOW8Tz3jxz0zQWU+2dbUfX8tYZ9bACKJkQwPv4YLJxko4fZwxLcB53nh+GT20CZ6WYa54nc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+GDjLnbn1wjEoFYaqkkgDLG03w8iyNN/9318Xb9cK+AFKlG1hK
	qyL5vJdxzItQYLjjeKzTR3IUgblFyQl49q6PEXH0ashPo3ryqYTWS/w=
X-Gm-Gg: AYBFou2qY2Q+dl2SK+/S4oT5qL72fxv57mvoqDX3CjIHCzfxDkTOLGyr+qimO+/roOF
	QVqWFKZCX+WKD9jYEFbvg6kwlXkBpebINq9Y0BhnMz2jYzWcuqEpBObQHpiWinOPSdNT1IZ4/zp
	VMxdJPl/TrGLpsPWZAigN9UGGW2zBm6SPSOQv2Cw/2QHZuSo7HoNFG930bDmSahNGJvd6Tg+Z6i
	8aZwnKTCxmKjBa49YBZyt6aqaaHMFlwCr2RUCzExXFRJJj9EnVZbKFhK236CAze394Sy2b/3AtU
	mu9vixadt4PFkzV/tEMOZBz3/ruju3XdTLC48uHevVYwNOKh2TzMLGstvjUEKkid1WmGsJ6mPOi
	VyziHNg3o70a4KJnCCE9CZwHP5z3zABVaT6Mu0hZtZ9c6eRLaQMvqzDAz4ipy9u3uOUjgYpdmAY
	mdCH/dlRFT2qj1yAUtT89yeLDCgLI+xD8xT1bl6ZZdi/9wf9FA6Ehm6cnHfZErvoFsIzsld+s8s
	FnYViad4EBpmWEe6ad38PPIJ3LCSaTbIea0KioTrWFl0h5178g9TsPGM1NOlGgtPjQCS2yTygys
	VmCZowBcAx4=
X-Received: by 2002:a5d:5e8c:0:b0:48e:5c9b:f12c with SMTP id ffacd0b85a97d-48e6e2d4c32mr27465476f8f.16.1793643509167;
        Mon, 02 Nov 2026 10:18:29 -0800 (PST)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71baa1b3sm20326986f8f.56.2026.11.02.10.18.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 10:18:28 -0800 (PST)
From: Tristan Madani <tristmd@gmail.com>
X-Google-Original-From: Tristan Madani <tristan@talencesecurity.com>
To: Azael Avalos <coproscefalo@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH] platform/x86: toshiba_acpi: validate ACPI object type in tci_raw()
Date: Mon,  2 Nov 2026 18:18:27 +0000
Message-ID: <20261102181827.1989460-1-tristan@talencesecurity.com>
X-Mailer: git-send-email 2.47.3
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

tci_raw() calls acpi_evaluate_object() and uses the returned buffer as
an ACPI_TYPE_PACKAGE without checking its type field. If the ACPI method
returns a different object type, accessing package.count and
package.elements interprets whatever data the union holds as a package
descriptor.

Add a type check before accessing the package fields. Return AE_TYPE
when the result is not a package, when the package has more elements
than TCI_WORDS, or when any element is not an ACPI_TYPE_INTEGER.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
 drivers/platform/x86/toshiba_acpi.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
index a0b8060836d01..4ccc8f51c3a5b 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -342,9 +342,20 @@ static acpi_status tci_raw(struct toshiba_acpi_dev *dev,
 	status = acpi_evaluate_object(dev->acpi_dev->handle,
 				      (char *)dev->method_hci, &params,
 				      &results);
-	if ((status == AE_OK) && (out_objs->package.count <= TCI_WORDS)) {
-		for (i = 0; i < out_objs->package.count; ++i)
-			out[i] = out_objs->package.elements[i].integer.value;
+	if (status == AE_OK) {
+		if (out_objs->type == ACPI_TYPE_PACKAGE &&
+		    out_objs->package.count <= TCI_WORDS) {
+			for (i = 0; i < out_objs->package.count; ++i) {
+				if (out_objs->package.elements[i].type !=
+				    ACPI_TYPE_INTEGER) {
+					status = AE_TYPE;
+					break;
+				}
+				out[i] = out_objs->package.elements[i].integer.value;
+			}
+		} else {
+			status = AE_TYPE;
+		}
 	}
 
 	return status;
-- 
2.47.3

