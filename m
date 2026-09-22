Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54BA8556B85
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 14:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790087325; cv=none; b=m5JA9lCHqcLNHp7MG4w45COUcz54IjrEyj0aoQw9AJbw8OiLYnA1hznckX82xL0eP2uaAR7Rgz2twVGqfehHoK05+diq23a/vmRTBVTeJgUULkxwemNue0n4LMHR5RutwRjE1gcnDsBftAa30e/78AP5tyj1Ra1IzApxOv9va5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790087325; c=relaxed/simple;
	bh=SVtzUg4Eb+h//swwQumGXMTtjoutlA+uq+ys1ApPWSc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PZZ5aYdJEKxQB88ss86GvRpKd7TJUSaDd7Z2iEm2w+Z7KQzLagOdE5e2G4Veg6AzFzs3pMYkuzxBZqRUM7YYc10v8gyA0GzbtEawqgHoPfdbZct0Nupr42pExRA4sSEXVdztlCb6pBfnkt3gCcL6bYOmzL8MsPvEPR2bfkDhDF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bdB02Ipb; arc=none smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bdB02Ipb"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b8d6489419so414124e87.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 07:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790087321; x=1790692121; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C2cIcFD9n/tIhle0FL6VW14T8JQcamu6z/X7FWTdDmM=;
        b=bdB02IpbBAv4XESwKAcJhUt9dgcHa2erpxr9NqcM1HXuWC5Uzyt+Kidg3uKs4LwkYq
         8IJVUfJ+7WJRtirgB7oeAQ2xn5xFPJgocGqpERQjaEGcr7cNFVGMRq1gopkUaxBr0eK/
         dO2AjVfBEWrtDyo1bAX2i9x95oCspoZ2J26BcJ1eoAtfZZw4yLZP1S4jQyElMH+IwKvf
         24BJhV5Xw+yCEnRYvTmIk/sWWD5Syp7aCYs0/IGYzPqPTPOpvwT4Yt14ZqT5USp6SSta
         AT449txM9XKTszVDeIPq8q7pKLGm6cCQ9FKo9Na2XXwtsFuyOIkcwjEoPJ2V3BNkaC8I
         Mj/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790087321; x=1790692121;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=C2cIcFD9n/tIhle0FL6VW14T8JQcamu6z/X7FWTdDmM=;
        b=EVHQCJYNe5zli2m/t5NFMiR30tGEqu73f2FtBk26HOs2+Xkq9MffvFeJtUQ0p0UCvx
         htDoDhmv/sUgrA7+ENROLdGSkPHzFxJJKwfT/HmiAG8E+aeNaNUz1lIqPLTPRSCvE6pq
         40pvdlfs/uJZwkWpJA/MgXdGjVkhBG4sJyuVPuN8qsq2iK0Z2gAXUdbpPJQ7IuJT0Dz4
         +SbYlDzLUWHinFec4zzLv8NVe8/uhDDXf9fS6YbrrSqZ5c64iRGXrRcCRVF1VuFO4FbY
         ghnC8y+vUeROXWSTDAZumyO4NoOXY8t1cnD5gEh4qpL7nrVJ1OPnakOrXvv/4i5nr8nn
         oLyg==
X-Forwarded-Encrypted: i=1; AKwUvBzFZIPzuGzoNuz7+z0GAtS+VkAYSnEoHDWvaPwrAdM+MuiwORdvBf30Bh3BnKJQ4Q7VVey1L/RmmwDSqbQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mH8ePf9uIEA64qqrmry5abb6jdp413oQgvLhNPGzdNzPicYysK
	vRRpB88GUJKWxW2uXTvbSubNkDisSLhlri31/7eKTlXNh6FG2nD9sN2U
X-Gm-Gg: AYBFou2AEd5JZX0yFnKOk/5kfKw2mudPBnSGZvOTVQfTWjlcCpLANEaoU40D0U44IuQ
	C/8flG8Igau+fHUk3xSm7Kzs0ivIWjko8GEm0Y1hms6xGT3SU/BJF3DTuVE0Ei37b7LpAaT6lT/
	bp2ZEEFcPg70aRXlm2QHgfpAibsAdaJX5ouMNQIN6H3YWm4w7kanrXMAh6CrUYgrlkRg2vY97/V
	S8XCc0j/etEmx73vjjwD6yVhCPO9E1BgbnN5iygwdk7Ebl+18Ext35sHpA1ypOE41rmpyWudvsJ
	qRUIIkB4R/64WzMifwRchqmypuaz8/0KqeMEjK34j2pf0Zr7rHCn5wYTG0NdMNqqpenXS3LcJOp
	GILOdj/bnB50a2eLc3eVrRzpTSJKKo3woemjRqB+SheBRxb/CmrdYR/0pH/vhH3CNGFY/Z4+eqm
	7bxJBtex0bmM6C0Txcf4UreKoyRvzqunibi+CVblMiHMj2vqTzVAqLRXqw7v/sXt8iVzI31yMYS
	hvFs8sqQAjTOsHzORNofku65YafEab/bsUCf08L
X-Received: by 2002:a05:6512:1329:b0:5b4:adb1:b25b with SMTP id 2adb3069b0e04-5b8c17f1feamr4505886e87.14.1790087321044;
        Tue, 22 Sep 2026 07:28:41 -0700 (PDT)
Received: from fedora-tap.advaoptical.com ([82.166.23.19])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8d46d2064sm589691e87.24.2026.09.22.07.28.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 07:28:40 -0700 (PDT)
From: Sagi Maimon <maimon.sagi@gmail.com>
To: Richard Cochran <richardcochran@gmail.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Simon Horman <horms@kernel.org>,
	Jiri Pirko <jiri@resnulli.us>,
	Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	netdev@vger.kernel.org
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sagi Maimon <maimon.sagi@gmail.com>
Subject: [PATCH net-next 3/9] ptp: ocp: hand the TMC bus back once on an acquire timeout
Date: Tue, 22 Sep 2026 17:28:23 +0300
Message-ID: <20260922142829.57740-4-maimon.sagi@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20260922142829.57740-1-maimon.sagi@gmail.com>
References: <20260922142829.57740-1-maimon.sagi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

adva_x1_mblaze_acquire() ran the hand-back itself before returning
-ETIMEDOUT, and adva_x1_bus_claim() then called adva_x1_bus_release() for
the same error, which runs it again.

Both write MBLAZE_RELEASE and poll for the grant to drop for up to
MBLAZE_RETRIES * MBLAZE_RETRY_US, and both run with the i2c root adapter
lock held, so a single failed claim could hold the shared controller for
half as long again and log "TMC bus still granted after release" twice for
one failure.

Leave it to the release path, which the claim already calls.

Fixes: 3b815e29966f ("ptp: ocp: add TAP CPLD access for ADVA TimeCard X1")
Signed-off-by: Sagi Maimon <maimon.sagi@gmail.com>
---
 drivers/ptp/ptp_ocp.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/ptp/ptp_ocp.c b/drivers/ptp/ptp_ocp.c
index 510083dc750a..feb61355078a 100644
--- a/drivers/ptp/ptp_ocp.c
+++ b/drivers/ptp/ptp_ocp.c
@@ -4526,10 +4526,6 @@ static int adva_x1_mblaze_acquire(struct ptp_ocp *bp)
 			return 0;
 	}
 
-	/* Drop the request we gave up on.  Any error from the hand-back is
-	 * subsumed by the -ETIMEDOUT we are already returning.
-	 */
-	adva_x1_mblaze_release(bp);
 	return -ETIMEDOUT;
 }
 
@@ -4647,6 +4643,12 @@ static int adva_x1_bus_claim(struct ptp_ocp *bp)
 	i2c_lock_bus(adap, I2C_LOCK_ROOT_ADAPTER);
 	bp->cpld_adap = adap;
 
+	/* adva_x1_bus_release() runs the hand-back, so the acquire path does
+	 * not do it itself: both poll for the grant to drop for up to
+	 * MBLAZE_RETRIES * MBLAZE_RETRY_US with the adapter lock held, and
+	 * doing it twice only holds the shared controller for longer and
+	 * logs the same failure twice.
+	 */
 	ret = adva_x1_mblaze_acquire(bp);
 	if (ret) {
 		adva_x1_bus_release(bp);	/* keeps the acquire error */
-- 
2.47.0

