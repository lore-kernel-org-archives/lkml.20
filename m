Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B46E377ABC
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 04:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791262464; cv=none; b=F5GcmWXitQ2yXgQ7OQB0UZH+9E8U6l1bp1LHz0F7lOLz/QBcesOg2L8qUHsRucywyyZ0pIJ2kkHNOxgz2JFxtlEACXePAtmF+vZoWBoEsgk5xBRdJYMgjiYwcSAdNt4IAomeVtvAY9IvA63Mw/RPbXkBJ8qYmO8PkWTAZWK7It4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791262464; c=relaxed/simple;
	bh=qVycqab8o99a4AOAEjqzdnDrRkhD68okwCNeq/5OvEk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Pz+6aPKt4d50JvU/iAlUUY1oTScm3h8wS3UnUu7Glb3r1LQxv+VloxL4xiqzICDVca6tLcROP0uFgOEAMcY+6IeiGDxI9MfWy0UONzSTcl1n+gjQEv40YbF02jR6uK5eqw1BrydGXWDLZ8fVs9if+wfDVGAky4KIpXLoYhY7wp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ce4UpE+a; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ce4UpE+a"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3514e7cbbbaso52851eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 21:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791262462; x=1791867262; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GMPAnis30QiFUw04IvU/bFrNZBajtnwIlCR6CxFY28Y=;
        b=Ce4UpE+aEFz7l3oF31blwuKo+me40AV8/Ntxw3WRZGwJsxLTCGcqeIKKxY7I/at3DN
         nCisFlLqy+lwwd94HMWpgywzgtuJBgWyHVEqGoOmY8ix3x9S6Rn7GBsWOoq1OIQOfXiR
         ipah4W6VSyMa9FRyWMoFWYHf7qYotg8oFJ8dDKuRYMCxPM0QFBlTNnbvzGf4ENQ00h8j
         pietv5QJAYeaA25V5WIuHJUcMvXrRyu+Qkh92X6vpGFRM2HB/qWxhodjn9Na7I+xsS7j
         kn675ptmC+d4piphCbHyXvS+vDvrCuk5bf0r2sHS08lUr9bfcXd+nyR7BBNfqZV4EsSo
         Z/ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791262462; x=1791867262;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GMPAnis30QiFUw04IvU/bFrNZBajtnwIlCR6CxFY28Y=;
        b=0OaNCAxJl8b1SU6b4f81zkuMLY75lGECoOBmy/vQBK4GaeAcjCSvtGa/N7eQvO+egi
         WU9H84zuK8lDKaWoWp3kLnLwVY7MMC4bx9O+f3pg1GrJbf4UIAepXSH0iv+bb0KJACoU
         jwTb6K9oJkegOd0y8CmQTGaSjMKQD1zLugz1PqveJDrXyxOiCfWJVWs/LUx5BaIqREAp
         OA74YmlGbAMxKreZATUnpgbcPyrRTOZAigJalYHNv3uLnN/zppYAXHwsaUa5Qc8Ugznr
         iEJu8EWJ53v8rPVEgDA1QGfL4FPKINzfgHktAzzXDzJkQtuZpBmQBEhCZ2DkhFnd/3d4
         PQuQ==
X-Forwarded-Encrypted: i=1; AKwUvBy0tluGswhL1TiSlx5QiE27Wn1kK/22rpts90d6OggZRVA6sXk0SQWoCbF8vb3jiWTYzo/35gk3YRbdUJ0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLzu5zBLDM1WRkh4LtTkVhbcD8cgFtPDcqPjZICVRgnUJ17ko5N
	TXvZ9wTZnOHg+rulJkSI8G6goWzOoqj9XoiWk0SjRKZVZbCjqxWaMJgu
X-Gm-Gg: AYBFou1XKOArT2s1lOh0pc0J2wptetog911xlkTc6xaeHvjZ7qggSE9g9fKNft6xlux
	6tBSMvTqb3yPH6yGBLAehuyEynYTn6Wx/fgBbnHeiaICtpoYe10TQCd7Xzi7xekJvTiUgdmGToo
	m+c6pgP2NMyqQyI0Xn5O6y0/ikw8SxDmaFU+tsVj4kvO2ZsMuY0pdNrDe11xOTj6w7aB1BH6FXi
	anhsk70SjKsVXJS+M3EVzpIW71h2YOPqKhw/7rVRg81ep9lNnenZIjwn0a8V71ES4AyoFGSw+tG
	L/vRtbfeBR7eHCbPB8beXMF36wvCVxeppGc77XG6XVoNcJfUldcqBYr8g/RdxSrBXEMI3tvCC7D
	kGaCwk7uYJrHkupAUdXlDezfRtnlgisjE6z2reZt+e7bgirhxrLSoC1xT3aj60XNfLeqnSYMlIx
	C3ka+EPlChmdRHrWG2skd1aHXA10Tda9sEYK7SzATc/ramqc3Hv4AyEhhZDaj75ky7rVLvTnJzg
	Z4b4AQkpKknziIwEeN4jxVD2Cx4+B3tze3KKf6qvwx+miE4fwIJ+c8BzYZcEudKoUuRrVykowRb
	458Cwdi5fTbl9d4E505OSc4o8uJv
X-Received: by 2002:a05:693c:880e:10b0:34e:7f9a:c722 with SMTP id 5a478bee46e88-3514e2e649cmr183008eec.34.1791262461760;
        Mon, 05 Oct 2026 21:54:21 -0700 (PDT)
Received: from kapoor.iiserb.ac.in ([203.18.51.214])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35146b3b5aesm5539737eec.29.2026.10.05.21.54.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 21:54:21 -0700 (PDT)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>,
	Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Sean Nyekjaer <sean@geanix.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnav Kapoor <kapoorarnav43@gmail.com>
Subject: [PATCH v2 0/2] iio: imu: inv_icm42600: fix kernel-doc warnings
Date: Tue,  6 Oct 2026 10:24:02 +0530
Message-ID: <20261006045413.14320-1-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the kernel-doc warnings in the inv_icm42600 driver. With this series,
scripts/kernel-doc -Wall reports no warnings for
drivers/iio/imu/inv_icm42600/. Comment-only changes.

Changes in v2:
- Add patch 2 for the remaining kernel-doc -Wall warnings in the
  driver (Andy)
- Collect Andy's Reviewed-by on patch 1
- Use the Assisted-by format from coding-assistants.rst (Andy)

v1: https://lore.kernel.org/all/20261003055339.143977-1-kapoorarnav43@gmail.com/

Arnav Kapoor (2):
  iio: imu: inv_icm42600: drop stale vdd_supply kernel-doc
  iio: imu: inv_icm42600: fix kernel-doc Return: sections

 drivers/iio/imu/inv_icm42600/inv_icm42600.h        | 1 -
 drivers/iio/imu/inv_icm42600/inv_icm42600_buffer.c | 4 ++--
 drivers/iio/imu/inv_icm42600/inv_icm42600_core.c   | 4 ++--
 3 files changed, 4 insertions(+), 5 deletions(-)

-- 
2.53.0

