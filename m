Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97669481A97
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 13:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791206377; cv=none; b=ERVKoN0/NHG2PrC5K5rWqiPndQ8HBvqDaIRGTL+MpEA45La1bAbLYwRS9xcr9O/uu+b9h0xK6eV8i2pwFysJ7DwU3l4+cOUn+pXnyOyr3XVrqqiXaHGj4/ZZPrFeps4V2UffGjSnQQgyMfdJu0Krl6+K7JoqEegXiBnTBuwMQlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791206377; c=relaxed/simple;
	bh=/7kitseJa2/Kfb2q/CGa18mriWwsIA5wOnsnq+OybPE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qxWs6lfdecbv1cdzi0D3Nusr/Pgb1NKIHt6mD+oD37X9v+jPNVoyRE4rq9DU58WMQmUNebmpEX862PwlhLCj9twWlYx2pZIIMT9LG7zWSVVeLkYd/adWDc/oZrcGTbLRa6ibsYqcXFka1sV0KJ9mKbMyDso1dCVYSUw/+2/oc6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=os+Gjcd8; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="os+Gjcd8"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e66390995so11325815e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 06:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791206364; x=1791811164; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FCQ82Dz2x1lLu1VImeOunKrkyp4+eiM5Z+nDZWLDM6Y=;
        b=os+Gjcd8EJffxTPEBWm2unWg+XDXYBXiYsgI5POiPN36dSE6r9tSfkwhKoJOq1/Iew
         7dam9VqgJWrucwXnKXXg6Tm4MSefnFOduyp9VRzwcGe2gGhRFHIdkQ6LDp5GJDBGpd6a
         UlsK/CvmgJtIxeFCy5uHPrfoBWwXiPVcWIzzbewbWANC1nUm/k5Hdfqxyp9YVIKx8jrr
         cp+SaUraYhQiWsqscaO3oR0+lrZOmc8g1WRzTpWqKBdOSGzYPL5v0ozBM36FdP2V42ZA
         d1Qh20B7JI5QxFjC5KC0LLTs8fU4rTrP0XDFuqXE63bvqAsxBLsgFTDwxtcM2FyaMjJv
         b+1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791206364; x=1791811164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FCQ82Dz2x1lLu1VImeOunKrkyp4+eiM5Z+nDZWLDM6Y=;
        b=kkYnxhYq5NOuf3b+EePT1u7UPFst+xUH7D4RQEItjpXeCYJBuNY1qWRCV1Fvxzpgp7
         NC4fA/pUu5TMBLScKiBa0Rk+KHes5cc/qEjcoCxbflAhYW7suAvdDByiM9QvmVrsO2po
         XDbCqbJfwlds2AhDjgzeJd2/M1ZqdQDTeP9grsmh2++zpwsKtdusAc9fgjILb79FzMVT
         n0n4Yr2gb1hNu7R/XetRIpT8wOF8gd37YsTSbcWgiMBiDSmEksFDR0tdq16nRvYAhap8
         dDq/BhKHqxeUa2yto+xG7kFluvoJ0/P4lqD5d9WVePi/yAD+o7XfSoJ250qCfy8Xfxhn
         yE0Q==
X-Gm-Message-State: AFuF++k2ZTygUebsFC55iXCTISg44VsxT3oG5KsFs55LSoBbp9jEw/6W
	Wl1VhdUl4NN2hE6U1INaH28dqkf3bw4pCgEm6kclJ4SCepY4p7MBE8eu
X-Gm-Gg: AYBFou3q4mp9g/t6t4HVxL+HMUG6mvXxh32eV/KJkJzq8wHZGAHmHhgczqg/kqWcZjQ
	8MHF6fZVlm8PubtF186m/4M/1IzTYA56VRyGk3oVCr2JFP8KhAaSVdKYFTbZrr1jYuI2rVmdtgb
	9zkyU7Qx2wC3L830zT7DWg3ZVP6Ou/rvDDvbVQvPwqGz8r32BHMfYoDuXN6eg6a43fEaGdYcG8N
	xm6G1pw7rDuOKdVEx/pk5MrGtu/+XYDLavTZUaOG+XIrYZOA93wIK3/orZ7v2/2CLEAOXK8cPOL
	9WTMW0eLuAWm5G6qb2hNCeTPHodMsuTbjoRiVnhJxQmYHYIMb8g9cNAoq1yd1CIhqT3hVmK0FwN
	3p5ly5j9bzsuHFF92oXCZ4eQWBGN0ijU0KD2EXX0rLFwNBV/WOK7r31wigso6AsCX6GGU+2uTRE
	Si7ZFU3hsCt+s/gnMT1xW7GmyYN9QP0kxlRkn0MfTjG/ngvZ2XMDXyx/LFyjJpE9RkKp6oPRao0
	pqCILELLSwLbFN/EaK/KayoE7W6iS75fzxc1PrLiGbr+dOlMpfD8WBv9xZoIfBnHrHfZX7hGA==
X-Received: by 2002:a05:600c:6296:b0:4a0:da23:e06d with SMTP id 5b1f17b1804b1-4a0da23e547mr180815855e9.10.1791206364206;
        Mon, 05 Oct 2026 06:19:24 -0700 (PDT)
Received: from nuc.fritz.box (p200300f6f726f000fa633ffffe02074c.dip0.t-ipconnect.de. [2003:f6:f726:f000:fa63:3fff:fe02:74c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a16d6295f9sm259642465e9.14.2026.10.05.06.19.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 06:19:23 -0700 (PDT)
From: Johannes Thumshirn <morbidrsa@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org,
	Filip Jensen <dev-Felipe.Jensen@duagon.com>,
	Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>,
	Johannes Thumshirn <jth@kernel.org>
Subject: [PATCH 1/1] mcb: fix kasan read slab out of bounds
Date: Mon,  5 Oct 2026 15:19:09 +0200
Message-ID: <bb501f159e657a11453c0ed65691132cc58e79c4.1791206167.git.jth@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1791206167.git.jth@kernel.org>
References: <cover.1791206167.git.jth@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Filip Jensen <dev-Felipe.Jensen@duagon.com>

Fixes the following kasan bug report reproducible when probing the
driver:

slab-out-of-bounds in string_nocheck lib/vsprintf.c:655
slab-out-of-bounds in string+0x396/0x440 lib/vsprintf.c:737
Read of size 1 at addr ffff88810dd32f94 by task modprobe/661

It is caused for passing snprintf a not null terminated string as a
parameter but in the format string expecting one ("%s"), thus making
it read pass the valid data.

Another solution could be giving a length to the snprintf parameter:
        snprintf(bus->name,CHAMELEON_FILENAME_LEN +
1,"%.*s",CHAMELEON_FILENAME_LEN,header->filename);
However, this solution seems less readable and since there is no need
to format the input, apart from converting it into a right C string, a
simple memcpy is here proposed.

Reviewed-by: Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>
Signed-off-by: Filip Jensen <dev-Felipe.Jensen@duagon.com>
Signed-off-by: Johannes Thumshirn <jth@kernel.org>
---
 drivers/mcb/mcb-parse.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mcb/mcb-parse.c b/drivers/mcb/mcb-parse.c
index 7e09a0ea80f8..2b115cb0e5d9 100644
--- a/drivers/mcb/mcb-parse.c
+++ b/drivers/mcb/mcb-parse.c
@@ -200,8 +200,8 @@ int chameleon_parse_cells(struct mcb_bus *bus, phys_addr_t mapbase,
 	bus->revision = header->revision;
 	bus->model = header->model;
 	bus->minor = header->minor;
-	snprintf(bus->name, CHAMELEON_FILENAME_LEN + 1, "%s",
-		 header->filename);
+	memcpy(bus->name, header->filename, CHAMELEON_FILENAME_LEN);
+	bus->name[CHAMELEON_FILENAME_LEN] = '\0';
 
 	bar_count = chameleon_get_bar(&p, mapbase, &cb);
 	if (bar_count < 0) {
-- 
2.51.0

