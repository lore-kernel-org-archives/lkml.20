Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C1B3FCB11
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 03:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792381762; cv=none; b=fgVz26hlKM2nzF97ba1TY+t+3MpQHYbOkZ1WESux/fdmzTeiVib6i8w2zz3uXliWdJsZ7ZzQDjLEi9hJjBaYvpfJRFaHAH8Nk7v/YOun8yKdn7rLDg5UdQZu5YL1ODKKxbnGYxqlTc6p96EfUHal/BRF9J9iIPD7F7dUbCUGMVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792381762; c=relaxed/simple;
	bh=ABJxKEaQtZ0QjZwBCK3+8g63pPMNurXD9XOETuliAjg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EU/raSGliPRB80+MgDgG7BxgIfOuHQOZOM/vaa5b5BVQeGee40Cnc52atUQTjdOhBd+WLc58IxRaQDMWwE+tAO5PgcJZiFGRLWcgIsVK3JfFdxkPqkFS03E12Z4d+Y/trqCzpBoi96+CM0uyr6bH6dWYbzaiteXVmmAXs4gQfvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dXNsa9Je; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dXNsa9Je"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a16aaf2067so20383395e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 20:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792381759; x=1792986559; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fVEYd5MjejeQV04NBe4mWPXzx4IqO3UlJ5AzV2FYsCg=;
        b=dXNsa9JeW9+l5uAhfkbZeJOInEKkjNA2Zn++6jGanWfmnhM964iQ3kafAj+AI8KLOK
         glhPgQFkFwGyuCh/lU7t99Eafud6uy1Zd2lLb58e/jrJC/UmMVlEbhajheOJWbd+UknQ
         KZ1yM4mtMK6EnR7shioxy5ZRInpmSJgo38Sd71wAWvZLzxyrN56eqy11lPnOpMyB/vJf
         jxcVbWyYg7MUPdxoMKbjnXQzJrHz33AVzE0Z7+k4OsvAHA4Z8DNkUsMX5RjlHRnMzbMe
         sEDbNTlDrhfFqaNsBUnmO4s9eRwXXVx/a9g5dqWq0rOTsXCRn3AbTTWgdk0Ya4Emtpis
         tPWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792381759; x=1792986559;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fVEYd5MjejeQV04NBe4mWPXzx4IqO3UlJ5AzV2FYsCg=;
        b=YRjRC8xWhLvi6jMXFfMUR3cGe2fcfdQojJMM7pPZB5YHtVrCziGKZaQQrM7joeYsr8
         3ilipGRpcYnOHICjfeDkTrv5ciVPlOdVPK7zAKYoOvujvp+F2QoP2OiUaNRzWqcm1YCN
         XUOfn8fZzD+3QnkxodiBFy3StNBXzyxQ47+FfQKKBQRFjoCjnkK1YpJ6nucWcUCuo4AZ
         PwP/Sr8aMDsAqlyPiqPpk6YqDQlCnKDkvstFyaoOkJ4flRyLTWGyBe6ennL6QpWmI9tA
         3kdGa/XmSEDbp28WWdrqo/E7YIhmRBg2lN6RlDOCLNuNB8oXZy2S3xr39VwxyZbj0hEK
         wlEA==
X-Forwarded-Encrypted: i=1; AKwUvByUDRPgNQ4+l1Mlw/lSalzX+W0i/X4jmVkjKGfZ+LHmk+l1Ses1LdblsCiD5UjSlkRoFU3+frRjknMe94Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYKp0Q+Po8uCAX1IOd0ze83EIGQh9aXn+3agJylqvGmn5YU7NNMn
	vOoRGsk1v3f2dsi0VT/j9aMQHP66jP3R0PGfrXuHCWeayYhXiGDheKyl
X-Gm-Gg: AYBFou0zNSeDt9degRYBRFy5p8XLIclvccM+HSPRSdiidZgXIdY0mTJrAGcjSCVExp5
	4emhtr/AveQlLqhPHNRIXLfl+ElkzyzZ/HTv7Hh1kior8ljGtQ1buJ0rsRkmkPp3UW5W16d6QfF
	eKh3BT6xIeybJKAcLgAN+E+Jh/Eb98pED42aqREKmGBV+UPGnqem7HvwAgM47U3Xv0U+0pF33w6
	rLRF4466nRQ5dtraG3XLFGocimxEh7IKW/zkY/qlnC6Im4f9ZpYGmNnCRjmZVXqfgAHNOV86mlC
	jHnmM83nM1TE5ZCxQjr0pRULcHpQ3n5diljZlcpvBadUWu+j5DCy8YTcGiay5PFN6GLud9JaYq6
	7sCAsQdT+iMIX9C/X0vKUYQVog3OnE8kzj4In7AmPnUgwNlk5bFAsq0HCcCVA9vnotTlegK9Fw6
	2dig2MXtLJl5ZTGnBQ/ITtBCMygDHor0yeiPTDwr3wJ7IIuRDP/frb4hHWp15lZnYA0byq09CHJ
	A5Edq3UgD5D6OClxAm2tHLfHjLQQuRlDJSSQtLs3dOuNYL4cZ9s9/pLB1PnUHYZYv8vSp8VF70r
	JJ7F4Tj1vj4AQzIstg==
X-Received: by 2002:a05:600c:a05:b0:4a1:813f:2a57 with SMTP id 5b1f17b1804b1-4a1d7608058mr139978165e9.13.1792381759297;
        Sun, 18 Oct 2026 20:49:19 -0700 (PDT)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd9b8b5fsm371302795e9.9.2026.10.18.20.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 20:49:18 -0700 (PDT)
From: Orgad Shaneh <orgads@gmail.com>
To: tsbogend@alpha.franken.de
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: OCTEON: program L2C_CTL on CNF71XX too
Date: Mon, 19 Oct 2026 03:49:18 +0000
Message-ID: <20261019034918.3805764-1-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit bd978130307c ("MIPS: OCTEON: program L2C_CTL, not L2C_CFG,
on OCTEON II"), cvmx_helper_initialize_packet_io_global() writes L2C_CTL
instead of L2C_CFG, because L2C_CFG does not exist on OCTEON II and
writing it hangs a CN6335. The test is OCTEON_CN6XXX, which leaves the
CNF71XX - also an OCTEON II, as OCTEON_IS_OCTEON2() and the rest of this
file treat it - writing the register that commit says is not there.

Use OCTEON_IS_OCTEON2(). OCTEON III (CN7XXX) still takes the L2C_CFG
path, as before: I have no such part and do not know which register it
wants.

Fixes: bd978130307c ("MIPS: OCTEON: program L2C_CTL, not L2C_CFG, on OCTEON II")
Assisted-by: LLM
Signed-off-by: Orgad Shaneh <orgads@gmail.com>
---
Found by the Sashiko review bot on the original series. By inspection
only: I have no CNF71XX board to test on. The Fixes: hash is the one in
mips-next.

diff --git a/arch/mips/cavium-octeon/executive/cvmx-helper.c b/arch/mips/cavium-octeon/executive/cvmx-helper.c
index 107b1be..c02448b 100644
--- a/arch/mips/cavium-octeon/executive/cvmx-helper.c
+++ b/arch/mips/cavium-octeon/executive/cvmx-helper.c
@@ -1028,7 +1028,7 @@ int cvmx_helper_initialize_packet_io_global(void)
 	 * to the cores. This avoids conditions where IO blocks might
 	 * be starved under very high L2 loads.
 	 */
-	if (OCTEON_IS_MODEL(OCTEON_CN6XXX)) {
+	if (OCTEON_IS_OCTEON2()) {
 		union cvmx_l2c_ctl l2c_ctl;
 
 		l2c_ctl.u64 = cvmx_read_csr(CVMX_L2C_CTL);
