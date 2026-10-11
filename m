Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CB074052B8
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 08:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791707859; cv=none; b=OYTvWzzfrUcAuIQ4EEGEliZriphxIYQNPvhaMZEwqNy4UaK+eB9O98CHDmJZloazBIOpCoirvdzjX/edkONaEkHY80I+1wwjW1RXUD6QEUWkFxE0KmbVfkVjhnJA3QPYKYaa7YjPSDS/seloEkg8ewV+eXTqTcFQp/SxrHJ00tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791707859; c=relaxed/simple;
	bh=FAOolMCkINrC3lTjV1XO/oOYFDvOm0h61dGOFddLmK8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DD/rI9feYBGjVMGUKCBgFTwxcfEzqCFCDGkvSgNCHu+ygwNze7I2hSSyAu89zYz1KAOSneS11V+eYPdQhTVo1ar+YiSIZWJVC7pNsitp1zTtr7nPheQZNiLrBcUlHyEHXVlEshnIrpbb1HMByFwQKV7a/y/e+7QBr7Ksbhp2/7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SPcqT2XE; arc=none smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SPcqT2XE"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-141395927feso1748769c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 01:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791707857; x=1792312657; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bBHjRRmvdKma54nJSNqg7NX8dKE06rBjHStPBqfNhw8=;
        b=SPcqT2XEljhU7MK0YL/Y8Rba4DQUsjA9ERBEzhESsyVzBkNTnDpy69xRbZkgTfCbo4
         vvFct1Fi94v6apwWwU768XdKrvgWTBOPkgTfTpXv9mJD8laLQEDCepo773gzOspM2eKu
         vnww4m8g5ETALVlLEp/FCVH9Jab1VEKBFPj9NT5fCsUbmeeuko1AK7IbL1q/Hdp0hJOl
         Bf77NRhX08Guj0D1PcGyEtAcERDxgUWakFDLx5jaVHGTW3vpvgh7UlQOTSsuR9Rr9qfj
         /m6j+/eO86M2Bh0VN7HajZMiCM/FMOfvj1J5SSnU9TaW7SmiRXnAkzTe1Y+d1/RXb71U
         FYYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791707857; x=1792312657;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bBHjRRmvdKma54nJSNqg7NX8dKE06rBjHStPBqfNhw8=;
        b=xipXDgdbz4wJgN+IU+mnz3+hWCAHM19xPgq/pmoY5fecpP8pblbeJryHjwKDjyME1g
         dWaVCD6JCFr6ag9mfBSZKOXSzFfG0XbJ1ypkBmM1HQSuLqrMipMNQNYVwzvXCm9qC80C
         sL8FBBgsBxE0GXKORsuktHLRj2Ze6z5WjePa57s9roN8ZXk2YUa4ooyg6AmBuBySQj4Q
         nYOwHwineUIxWzhg3+MTx43F/EIYvlYhbqOwFYbmR6PO4fW9ilWA6LN5S/ZwRRRYAuhS
         2im3XYHwsCKZBTo000sEYo9NNskhqwaTStQE3cpKn4K1HrQxs3xOstFFM7Zw3QwIAH3s
         6GIw==
X-Forwarded-Encrypted: i=1; AKwUvBzEK601kGqIzC5+Z3pcblM+JMWvw1RsbXvvGPGVr+HXvd4d9xKDGRwJ38Euffac0fx1K8+y3vf/BlZTMFY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJYMn+TTicckR6QO+i4L0L36oM4KWa2nDOFbO4fNQ8l2Vea1WL/
	kROgu8O1YyhFYncmPcbF7qVNGvjekoMYsIsK7qVL9givMav/6nZvUAQO
X-Gm-Gg: AYBFou1T9cfQx4EfBo5pKuD1+Yx2IWhR4ARir5fZQaN7Ns6mh2MYBknkwCVw7V4Dj16
	+O5hJsdeDT5zCTpDqr58/PAtOS+CMgoRAPoQLaI7pClSpg7PQM18bXOlM5LdxnQvZM94XsaOqOB
	Gy3bNDXMky2/EQsNiUJBFAMxkHLx6SJn8FKrZ1KMVpX1V0uQIte4pZwBSELIuerkQWUGLvmaF46
	m2RHwvCGELQikTivQrpOzzLv2hoAHO2ZmAtNbDz0QLirOhdq62RyLHrft2fWjHGzYkFIB0WoCmi
	phKrrGZ8u/vo2jdI9uDGrUBen17f2V3ShVUrqZ1OvxowgEAn/iMWhB34tKlr82s3pY6cIlFuJU+
	cItd9rUmu6jka1kSKzLqZ/vnjFFn7/KCOy3pyzcq0kIVXxVkUGA1QWpa7f8Dn8loDqrfz2SYpyf
	03rbnk1miDjistmnpm5hxUzBcjK1O+qJS4A5FYKYt5k1gmbeBVMetUtJiXxhVrHhgdDyJi0L3zK
	lx9MFxlabYYndkJ+UPtns5wcPPrE0xY+M0vkYSGJJ0QuRMkuK4Z9JerOQSENuPmv1FMpgDH1g0f
	48gT9A==
X-Received: by 2002:a05:7022:297:20b0:14a:8df8:56b1 with SMTP id a92af1059eb24-16a5ef28a5bmr8084789c88.22.1791707857215;
        Sun, 11 Oct 2026 01:37:37 -0700 (PDT)
Received: from LAPTOP-UUUVNN1I.localdomain ([129.126.57.197])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a42407e7sm20186473c88.15.2026.10.11.01.37.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 01:37:36 -0700 (PDT)
From: Wei Jie Law <98lawweijie@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Andrew Duggan <aduggan@synaptics.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v5 0/2] Input: synaptics-rmi4 - fix two device-controlled out-of-bounds writes
Date: Sun, 11 Oct 2026 16:37:26 +0800
Message-ID: <20261011083730.223083-1-98lawweijie@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two fixes for out-of-bounds writes in the RMI4 core that a device can
trigger through its Page Description Table.

1/2 rejects functions declaring 7 interrupt sources, a value the RMI4
specification reserves; the driver otherwise writes past fn->irq[].

2/2 rejects a PDT whose interrupt counts grow between the counting scan
and the function-creating scan; the driver otherwise sets bits past the
end of fn->irq_mask[].

Changes in v5:
 - 1/2: keep RMI_FN_MAX_IRQS at 6 and reject a count of 7 in
   rmi_scan_pdt_page(), after the RMI4_END_OF_PDT() check, instead of
   growing irq[] (Dmitry).  New subject.
 - 2/2: unchanged.

v4: https://lore.kernel.org/linux-input/20260825103123.12216-1-98lawweijie@gmail.com/

Wei Jie Law (2):
  Input: synaptics-rmi4 - reject functions with more than 6 interrupt
    sources
  Input: synaptics-rmi4 - reject a PDT that grows between scans

 drivers/input/rmi4/rmi_driver.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

-- 
2.43.0

