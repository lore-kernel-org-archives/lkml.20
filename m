Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793804464;
	b=D0DRF+9mKk06QT1gnVWmx1AJLQZBCM4Snc1ZjMZUp96cHpYZ29YFRvdqSA8JlnluUkxg
	 G27/eIL5c2L1455xZAIiGCufNMzzh5ML1Vj5kr81LUThSavDwQOvSDsBFq+XqEIxDxBS9
	 nOiREdTDuQRt+MKA/7nYotiUe2USj/tO2xsXXX5mDWUSejzmqOkyO0eDsMTPxvttlyCBA
	 Gzuwk/TythxzeTDcii17xmH0g5RXtyLsiks0NooAHrR9jbBLzg4ABqE19oj5KnYeaSyIc
	 aKlgHF7Rcr7avL49untAh7JTQht0YdeXYe+OyNk05x+XxK4Mrm926I8s9dpVrC9NPcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793804464;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=e81tcatBHOQvCatTtne4Vl4ETpILuAB3x6t6D2nRZLk=;
	b=tGfq7WfoGcaqOfY5ysLrEcuJiPMUsQsz5A/2sLwC9sCBuvmG3+QrneHsISSnnVzR2tSK
	 5Cn/H+H+wQ98cObJ4474ZP9fzg3HvixtgKpprPxyp3HUgJX/ZqmJbRv4IBWpViXqyMgEi
	 X6lKEmk4n6Ssva0Vz1r1iplDbNUuG4iLA5//cA97Mk+O7DTmggIRdwMXa1lulyxb+fU1K
	 +OMpVySxKH7W9pGCGugQ1NMPENPPtbuTYTAl+qU2zYXpRvXN4V2dSzv9X9K31dT6Gp5aw
	 AhqwDaY4xGyBfHTxqg+RFAFIB0wVNl0z9aiUrj53xIsDzhwC4YR7h4trgmFGMsDBhAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fzZA7hIw;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B3B7606A336
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 15:01:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B3B7606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fzZA7hIw
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-35b2c599f43so1625269eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 07:01:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793804463; x=1794409263; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=e81tcatBHOQvCatTtne4Vl4ETpILuAB3x6t6D2nRZLk=;
        b=fzZA7hIwTwFCLtV3HBfFHWeAd5CaDykpU2HEZkvxrySCFEBwVxlsb1eyI5C8dI0btQ
         y0mAt3u0EjX5CHg1SB0EcaMpBEHVM1+hd59xcC5gw5VscTJQklG7JgNAc2uW93pE04Aj
         tFGABa2fl93KkXxUt9jOCOU60LDZjJebHRINVV7F/saYmetX0EqsGlsr+pI7F0Zaguj1
         ZDjJ9bLhGzJBf3f9gDuG7EXWHOxGKhbAJha7X3U2zI4ZhuJzhO6OYL4VXmvVEf3D0fqE
         kNFnHBdaYDPm3O9Vjg3NdIKMsrknnXGY0TDErXA89YQTFYRYQSwwSLXwvEmBjy8g7L7g
         0P1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793804463; x=1794409263;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e81tcatBHOQvCatTtne4Vl4ETpILuAB3x6t6D2nRZLk=;
        b=0hVZJmddNpvc2UCs4lFwQPk0+mk5AEPVoyQcyykWpeCJkQRtwCRT+6mGscsHuHQ1gS
         8h2/0qvgtLEDrxHyq9MMZhFDoG1sHq+tXDmPTIIDrjSvSlYK0YVwwuvq/266lFwz2NRa
         +Q33ukozABWQPLpWRbfAdG1Q+hcKQwBbcex7oLqsb8i7k2JnEkYUg/Q42D5hCLveY9LH
         bmrK2LAxYRPPXiRo93ELPWBs8GEWRmJwmkrBIWcT4zr/SEmZtHwPyR0aaVHhhddL3/o+
         yBA+jisPmoK8B6W904qxW8Or4025O0CO5vpJmjS4JxLn+gGuLqfDQOWx9EUAvTEcDpY8
         dmqw==
X-Forwarded-Encrypted: i=1; AKwUvBwyautGnHLUup7w/7ZX2FPW+3FAZJG3wwe5CJ/2Ui9TJccuB6NeWFCgMaErsXy+Kb1B4NzJNmm3EhgQalM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+jgX/SW9SF2pcHjIkMkAY3cuf0/x1DGhwKhpxgEL+3ruhN+d1S
	UUVZkY5TOirpyFTdqFOV7C5i3IUKS/3PX+aEILILJlqPpf661p9+Aj4c
X-Gm-Gg: AYBFou2kkhYYaRLFBdxHPp4T+tnIosK1zymDQ/soFKxyViJONPei9Ecb4+7el5z7zGp
	mKvJogY+r8RYc8xk+Sh2qx2FrrKpIdYw4xMMgiLOTKPmUdKIMPogJAR3iLYhjAp4qli/wUEVv/J
	ZLrlSWaNKNABqBw70Cq6SOFOkD4BPxamgEoTJMqIszjwRXScl/gsAtDvSIHDydl4mUWd0RK5BsG
	Xu3iVoAlFqNai+DSqmoPjcAK4Dzu/2pkGnSEVg2HaE+nf9AK7bmhtNR70fRCuLDHM9G3t3zW6ri
	sMXAtFpBJhonHPf1rCYUy+5TGn4nemCVVLtPklXd34BcQ8UHsWq2TE693nkQohwms/KS2pv5Qlh
	93QZ5xD1Fuzrv+i1EGE3KHUFCsE3KnlFITUoyJYEkqFJ37mJBYR57BeSAbV6B+kuFRSmxqnkthm
	WTKQBOfdjmTa5SNSu3Ez37uKqQE7SVj31HyLWx+xc8snRy6gYfbg2EFuPFhx4EkcY+B1fknFm6Q
	MU2w3cvhtdXMx8NRJtSvatDooIwz8VqK6t3my41cevBHxFxejQSyVQsG7b5xU/HFEvro+lm2UsN
	a4XueXUA1N6m/hb1E8WTnz1uwj/OncIxp/M1QfZye+iA773mZ5vc+yJlwIVzyH/tIutvbvocCFp
	hv1hiHxI/kiqMYV6wJSjJv0lldp8=
X-Received: by 2002:a05:693c:6092:b0:369:1084:8ee3 with SMTP id 5a478bee46e88-36a423e52c8mr28908255eec.23.1793804462315;
        Wed, 04 Nov 2026 07:01:02 -0800 (PST)
Received: from localhost.localdomain ([2405:201:301c:f8cd:5040:8550:f5e4:709a])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38fe477sm7347457eec.17.2026.11.04.07.00.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 07:01:01 -0800 (PST)
From: Aryan Sinha <sinha.aryan03@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Nikolas Koesling <nikolas@koesling.info>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aryan Sinha <sinha.aryan03@gmail.com>
Subject: [PATCH] HID: pulsar: print the battery error with %pe
Date: Wed,  4 Nov 2026 20:30:52 +0530
Message-ID: <20261104150055.33028-1-sinha.aryan03@gmail.com>
X-Mailer: git-send-email 2.46.0
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

%pe prints the symbolic errno, which is easier to read than the raw
number from the PTR_ERR().

Signed-off-by: Aryan Sinha <sinha.aryan03@gmail.com>
---
 drivers/hid/hid-pulsar.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-pulsar.c b/drivers/hid/hid-pulsar.c
index b0b34849f..ba7cc9f65 100644
--- a/drivers/hid/hid-pulsar.c
+++ b/drivers/hid/hid-pulsar.c
@@ -615,8 +615,8 @@ static void pulsar_init_work(struct work_struct *work)
 	    devm_power_supply_register(&hdev->dev, &drvdata->battery.desc,
 				       &psy_cfg);
 	if (IS_ERR(drvdata->battery.ps)) {
-		hid_err(hdev, "failed to register battery: %ld\n",
-			PTR_ERR(drvdata->battery.ps));
+		hid_err(hdev, "failed to register battery: %pe\n",
+			drvdata->battery.ps);
 		drvdata->battery.ps = NULL;
 		return;
 	}
-- 
2.46.0

