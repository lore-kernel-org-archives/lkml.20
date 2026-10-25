Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792922003;
	b=IzAHuHjejDhTfp6GkGOR57gXhZPK7njZp2AZsepDzhCuFovwuNsMoD0fx8471Mj0i9QA
	 lGciQXXjMmzIyjg/5gcQnD6NKEyMSRt3mkgrg027wAKN7nK54AOdNNqso+H5mJRsIjegJ
	 eicbItW5uYMx/+Cet5QTSuXB1wBsE1SqwAu3GUQoaKJe4WtYVjhqCSgXopxRljYbW+Ac1
	 IljOc0KdeqCEo2fABkp96Tn6cOAPT+nAiBgLzzh7497jhdaBty70EWCJEnksCSwk4TipQ
	 bJaBTO7YrlZk6O7JdGOZvDSfSrWSH6fkSVdJmp1UcmtQ3J+fNh4TMRdTB69agAI/EkQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792922003;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=6PtEA2UtMTqcqVdkWoMV++OnOcpG82BOix7xLgA714w=;
	b=meTMc18f6rFOmqH9cRz93kRahNj18mQTjRvgEqpwb1BkMQ8gd/iFZbGKOLGVmnFLyhCI
	 v8Xg9SmMSANs6TYNquR8OSKI0e26PAkzJ8wZMPCdaKeHcVwEifXvTn7gXkG49u8gmBcUV
	 Xi099kFMegCYIMZ7qIRXbaPefpsjvLLDBiIwCnynXrJoMJ4vfSW+nccPCjBGZ/AR71QIy
	 QAEIelvwTAO23fjSXQPcewhXnrBvAkpqBVMWFM1dE+OrHPiFQE8agk5Gbz/l8LJS3EWob
	 pOQUrpmDkq+eD1pv5rhaHJSWG+69SsEZJWgaEkuZyFLlxLpOvtbxz4YPT5gS2AMEImw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="Vy60/HuI";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA58B606A31B
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 09:53:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA58B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Vy60/HuI
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b408f2d936so2938197a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 02:53:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792922001; cv=none;
        d=google.com; s=arc-20260327;
        b=UVNoqnVqI16MOx1PlDT8gCFXTyng+S8Q4nSgZKAhu8uYEmXS0hIFX/DO+i38sc3R+F
         OtAjqKBEKhUHwq8J+3LWlN+mCBrzi2qNhV2XMITuFpxEw52TSdHacesD7+k/u+ftid7j
         CPWUrPThSecV/kjpOSuYCFmVM5Ho3b9cYgXBgBhcVdLC0dinAarDgz7IajXgY16/Uzu7
         CxNjHCgQUxyEvBfLbhq+Cu3kle+0I0JoFqANRkkqEHJnWhsvdPaNCyFe9m/+VNcQ4ron
         F/crTqmDyIRxNKa0EomyJz59RBjIdGCqWx1Y70eK6344G4Z5623WJphgdZnfx7wJqJcR
         nWOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=6PtEA2UtMTqcqVdkWoMV++OnOcpG82BOix7xLgA714w=;
        fh=Z1+3HjOOACRQT+hikdfeO5frX88dDDsVdSZatZyIq2E=;
        b=mOI+fhfwZmdPdxC1PSZLCKdLHXeUD8TWpaQEHk5kOE5hxhxr4qEPJVS4m9RrnBx2/T
         y7uWaRd0DylkEaT/O1Xy9WwEHoolp+kaQ2dnvdT7sP2/3Pj+ovRasPMeZKNqcasBBJ8Z
         e+VpPh9SOspzUddP8enxHhs0/VfS8ansEJoMpVSM/iiCQJlVazZ/MNZrSOV4Vkw3GmJQ
         t+zGhWlaYD+sZ+SOtxOjLrythEoM2soqFJbZ2SNSHWKuiu9D3ySaSLB2AwsKz1UEVbfw
         k6C6hDRiyCKIrILFcO1yw1VwppptBaKcOVNdPBGGmcYOyWp9wUgzEzb7ZWpG3zfhWB8c
         2zRw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792922001; x=1793526801; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6PtEA2UtMTqcqVdkWoMV++OnOcpG82BOix7xLgA714w=;
        b=Vy60/HuIOOHGkECakw9qQeSwY7OX8plnS0WVLz8+4hCtE+H+FdizqKoXsRIodYiqWm
         waLxD8Lk9Mh5BV/UGp5eZxlIxFM3LX/MTou2H2VyYTI0XZZ/izLuLJNx/gTaeZF8tLxG
         hV+bSizw71J5ks7psvQO8YYUnOeQlzOv3y4zyA+3A/5tAGmgrJOtrCwb4RkxebFp0kHQ
         hUT5FLoewOEUExXqWkHbuELYNSbjZlSnSEFAzEWHdkehYOnaaChz4zpwQl2EK45dKedu
         FGfGHk34oPwNaZRh+Fy6pkHK7sYS5CvbcJxvQjRhYHjiehqkIYtiUhs+MgGirPzaYMKz
         Q78A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792922001; x=1793526801;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6PtEA2UtMTqcqVdkWoMV++OnOcpG82BOix7xLgA714w=;
        b=uUrIEv2FVQ1VyohjCVC1Q+kpyBGlrcE8Uu8JIKleG2J0GM3Tjsa9tDULAikQ8gesNW
         geKdqAf/f+6bAGxYDG93r0vJkYU/w8koZt0uOI1DaTonoxJ4imJUrb4QRpY1d+D/grNn
         dwzkIaytpSrCNHlwORYISy3409j7Oy0wbhvAbgp2R4bZLVkpLR6sXwjGBmrbdZLU6w6V
         4ffcWm+3f1A4KoXI9aE2f7ikYeh8Os8QxFYnzgnqtdTeVDvIr4pQrcx9jUZMTUocCYsl
         0qZbmPp6uzI07rchdVAPa6mkgONRQ4ogG8ZLhBQeDkWOyQPCeFvQJYsq6JqDYSoPTVOo
         V06Q==
X-Forwarded-Encrypted: i=1; AKwUvBzpcrlc3eNgPwbyMLfefV5ItbnUjoa0rGmcfWUdMytOgFkxeccF0ujkRmkpt3jHtq0KU/chktkQL+QkhQw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIRBaz/+XDBgXLIXGvczkPedkF4u18TpEHpWypm0xJ4vP1rCqXV
	1+gLYNd9BQ8zFVbe3EnRkGxdS1VJLDV/Ac8xN+VEyX9TOwR4AeUJD01TTjZYwCcOHkmrsq2oJtU
	w4NZCYjz/eaykFxKwPVc8NvATPBrdr+o=
X-Gm-Gg: AYBFou3KeYOglEW4KrkqRIW6ka6q6drKrYJsrCuAMBlDyiUmulBX/10/IP2EU+Kag/L
	7I6yYzvmIh/F+oHnCxcmPt0+KR+R4jJV0NT0AvxO6pvri6nGTAy+0T3Em9HpCkU86uKEVxmJlKE
	ytZHhAH3s1P0ftPteq5HWZPJpsxQUPRp9ALnj6OYCR/rbqqdGc0WszaXL5fpWaxW/QatbVOuv6c
	/0n3ztK/LDwuRaNZn7IBgmexFVfkftQi4QGjSsenzx/qIudzoCTPc9Xs9h6necjXxlNUpMqHO6S
	SrJcy/5pjVgxR21zY7IYBtsSRR5ygmMa2Ypq3EFbkEfte0NQrEQiPSpwWSMk0imzMYDAeBsPd+e
	CHBoagCLUbRWfOSBRLIAGNTPmksv7kUiSlTeuJ6S+GBPMwmjn7sNT7IYZcyfEtbVdIx8=
X-Received: by 2002:a17:907:9d1a:b0:c2e:2d8c:4585 with SMTP id
 a640c23a62f3a-c46bde8a1f2mr445903566b.36.1792922000889; Sun, 25 Oct 2026
 02:53:20 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Abubakar Musa Samaila <abubakarmusasamaila@gmail.com>
Date: Sun, 25 Oct 2026 10:53:07 +0100
X-Gm-Features: AclHuK_xZzMIUgzgDxUYS0S8n_we1GNSKAQQHoI-f2BeDz1YvWNvfoIENaxJN_0
Message-ID: <CAHxSwT_ya=kxLdQkx5iY6DdVbxDv9MP5shRUF5-yDUvM=cFpKw@mail.gmail.com>
Subject: [PATCH v2] staging: fbtft: fb_upd161704: Replace udelay() with usleep_range()
To: andy@kernel.org, gregkh@linuxfoundation.org, outreachy@lists.linux.dev, 
	julia.lawall@inria.fr
Cc: linux-staging@lists.linux.dev, linux-fbdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From 778030aa9291e3a7d40ffb03b19e6877041cddc8 Mon Sep 17 00:00:00 2001
From: Abubakar Musa Samaila <abubakarmusasamaila@gmail.com>
Date: Sat, 24 Oct 2026 12:02:25 +0100
Subject: [PATCH v2] staging: fbtft: fb_upd161704: Replace udelay() with
 usleep_range()

Signed-off-by: Abubakar Musa Samaila <abubakarmusasamaila@gmail.com>
---
v2:
- Send patch inline in the email body rather than as an attachment.
- No functional changes to the code diff itself.

v1:
 drivers/staging/fbtft/fb_upd161704.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/fbtft/fb_upd161704.c
b/drivers/staging/fbtft/fb_upd161704.c
index 7288140e7..94ae5bbf0 100644
--- a/drivers/staging/fbtft/fb_upd161704.c
+++ b/drivers/staging/fbtft/fb_upd161704.c
@@ -32,27 +32,27 @@ static int init_display(struct fbtft_par *par)

        /* oscillator start */
        write_reg(par, 0x003A, 0x0001); /*Oscillator 0: stop, 1: operation */
-       udelay(100);
+       usleep_range(100, 150);

        /* y-setting */
        write_reg(par, 0x0024, 0x007B); /* amplitude setting */
-       udelay(10);
+       usleep_range(10, 20);
        write_reg(par, 0x0025, 0x003B); /* amplitude setting */
        write_reg(par, 0x0026, 0x0034); /* amplitude setting */
-       udelay(10);
+       usleep_range(10, 20);
        write_reg(par, 0x0027, 0x0004); /* amplitude setting */
        write_reg(par, 0x0052, 0x0025); /* circuit setting 1 */
-       udelay(10);
+       usleep_range(10, 20);
        write_reg(par, 0x0053, 0x0033); /* circuit setting 2 */
        write_reg(par, 0x0061, 0x001C); /* adjustment V10 positive polarity */
-       udelay(10);
+       usleep_range(10, 20);
        write_reg(par, 0x0062, 0x002C); /* adjustment V9 negative polarity */
        write_reg(par, 0x0063, 0x0022); /* adjustment V34 positive polarity */
-       udelay(10);
+       usleep_range(10, 20);
        write_reg(par, 0x0064, 0x0027); /* adjustment V31 negative polarity */
-       udelay(10);
+       usleep_range(10, 20);
        write_reg(par, 0x0065, 0x0014); /* adjustment V61 negative polarity */
-       udelay(10);
+       usleep_range(10, 20);
        write_reg(par, 0x0066, 0x0010); /* adjustment V61 negative polarity */

        /* Basical clock for 1 line (BASECOUNT[7:0]) number specified */
@@ -60,7 +60,7 @@ static int init_display(struct fbtft_par *par)

        /* Power supply setting */
        write_reg(par, 0x0019, 0x0000); /* DC/DC output setting */
-       udelay(200);
+       usleep_range(200, 250);
        write_reg(par, 0x001A, 0x1000); /* DC/DC frequency setting */
        write_reg(par, 0x001B, 0x0023); /* DC/DC rising setting */
        write_reg(par, 0x001C, 0x0C01); /* Regulator voltage setting */
-- 
2.34.1
