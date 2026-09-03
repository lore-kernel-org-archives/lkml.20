Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A2A449991
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 10:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788432174; cv=none; b=NJwYy8Mg4IfMnl1nn8UbibQnX5lzbKSpdqMRI9i9rqqLOjhxnJL+LByU1VqLr0c6BrHfYondooeygBrj4ySiZzo6hWKm6XmcxbjmcWocqUEZ0y+XNx/HBNyqnw9e3/Tv/2eklS+eAP21uafDiw81PdUGHBQWyM2DP7jP8poXWNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788432174; c=relaxed/simple;
	bh=+GX8WEIiqxcsxRx8lJOjMEWa5txU6zxSwwWpPI3e4mA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=L7uo7WzyVwwA1/70EdW7fR1/acutGPsvvkRy0R14pzSEAwAvsinvhsGR3UZkWrFe25tTcizScnitSs2p7MHH8f8dWYbaUXfGEEIjREO2+Gij2+HVEA2m2iLo5tkIQuSyJ3kibNHrdEKdpUbJclnpPUzZFNFJKEEFXq6FyKxizz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DbrG4Dvr; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DbrG4Dvr"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4957eefd361so15431515e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 03:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788432171; x=1789036971; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aaqNY17cMmjcPMSLqDr2N+tN8Vmcq3Ywr2AifLrAlrE=;
        b=DbrG4DvrJEOiaTFF3e5+/ksSjj01VWHj5uWjijZFe0564CUW9240Y4jFfUerAJsknJ
         T3AEfegt+LnWvUTkbvCFFGZChn1/MC6X+ZJ6ik1HLv3OkmVKiQVKn9sqquNxfPvDBmlm
         cSvs7EwJKENtUslckdygm4NOOd5S67vqjZVzQKlju0hq6mpmzPeHAyqglM58Xl6gMNYT
         u3R5qBkHWnKhPgVx/hpXq2/04LfuDrPH0Id+Q8UuMNnzntMZUU0Qf6DNN+MQMcYmf040
         oZE6gaBH1EpYPoFJIoCftEbeh7zzOMkHRysN9JumJeT/R2GX4wXrcp7cSdwNxYD/WHTV
         8MvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788432171; x=1789036971;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aaqNY17cMmjcPMSLqDr2N+tN8Vmcq3Ywr2AifLrAlrE=;
        b=o9+Foz77i924tmoBzmE0mR72377Q4rupKwdmkzNNj5uCdXFQx2Ar6zZMaJclWbzRXD
         j9YJZyPkUbcKXVD81X6cIs7AmFw+Eac/Gbv3NsISRlsL6imEnRAy6DmENZM6Bcprw34W
         28l0vxLg1/+LWVihi63ficSrSqF9szqjuduLks7+PL2m8UBM35Vo8aQC+2LRW7HIPBzK
         6iNKktqBfyokaMX7ZibFi8VH8sNgiw1IrAXP81/+nk4YTpCgPHoLpfwWSQ2eb4G/zP+g
         CsLowLhcNMEcy0SOEvkHTijC0fiF1CHL6ZybGfghL4JvKHGRBA3tmEsZjWA5WYIszHSX
         +2Eg==
X-Forwarded-Encrypted: i=1; AKwUvBx++aekOmMQpGfux7cr7qqSmh6DktYvI3M/q4y+nio2ip8l2/QEWrs6zBmRYYd0RpMvpx++YDiRN/S55U4=@vger.kernel.org
X-Gm-Message-State: AFuF++lg+HE1jjjbypBd1dstxanTZpKl9H2vN/3xmziZ8gGnDvdISiN3
	jt5biw8xfIBxdLhjpEzwnmE8+cYaEQMeHEx0d+a3geyPQckjaVvwZpckGOKFaCf2
X-Gm-Gg: AYBFou2RCO+qrpQXG6v99JyGICa7JanSdK1Rw9i1mJf4NWQvdarXwx3O6Kv40VhVO71
	9fllMLtYQQZ5CIFFZm44WE+eJMvzX+oPuLAJdm5keFhF6hkCp2I0F10tCz2z8+5tOGPHCD5zobZ
	Cwg1xf1J1wi1GLnitiwhpOPQN9ZKMwg7svfhpcXFn6zJMhtBXvdVpXI+mf3pP+OvMPGY7lCjbEw
	bioLb3c2Vz6466QHrJk8Sn/7eJ60VKmyR4yh74CpNVZ75d0tObdY35AVr2ApF+9y4fOOYZvtXff
	DeGFHCrPQYobfIwAJ/WpiRdXNZKwEFJJqQhqLPb09PM7/RJhO5OMpv9qQejh88FwUDdJp4I6vNU
	kzLqMyJf/9rXAN3QCwSxhItSNdS/Sb2yxV006SosG1FL6YKZSSwdL/x9KZsARkWuV+hdZbJ5wQq
	1EjXL8J+XUomc+GSFFQ2jzI5dQsSF/YMHLhooTZMtwJ/VzDNlWrwXPdMftG+h2RTzNHNIifzDg3
	aMxJuiJ/bttizyyDol0xvxOXf015R6m
X-Received: by 2002:a05:600c:3f08:b0:49c:e1ed:26b1 with SMTP id 5b1f17b1804b1-49ce5850cefmr215418115e9.16.1788432170902;
        Thu, 03 Sep 2026 03:42:50 -0700 (PDT)
Received: from ubuntu-mbp.fritz.box (bzq-85-130-235-2.static.bezeqint.net. [85.130.235.2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf5135353sm5090695e9.2.2026.09.03.03.42.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 03:42:50 -0700 (PDT)
From: Itay Shem-tov <itayst@gmail.com>
To: rafael@kernel.org
Cc: lenb@kernel.org,
	linux-acpi@vger.kernel.org,
	sre@kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Itay Shem-tov <itayst@gmail.com>
Subject: [PATCH] ACPI: SBS: report relative state of charge as CAPACITY
Date: Thu,  3 Sep 2026 13:42:44 +0300
Message-ID: <20260903104244.25556-1-itayst@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

acpi_sbs reads SBS command 0x0e (AbsoluteStateOfCharge) into
battery->state_of_charge, which is exported unmodified as
POWER_SUPPLY_PROP_CAPACITY.

Per the Smart Battery Data Specification 1.1, 0x0e is expressed as a
percentage of DesignCapacity and is explicitly permitted to exceed 100%.
Documentation/ABI/testing/sysfs-class-power specifies the capacity
attribute as "Valid values: 0 - 100 (percent)", so any pack whose
FullChargeCapacity exceeds its DesignCapacity - the normal state of a
new or recently replaced battery - makes the driver report out of range.

The correct source is 0x0d (RelativeStateOfCharge), a percentage of
FullChargeCapacity, which the specification bounds to 0..100.

This is the same defect that was fixed in the i2c SBS driver by commit
b1f092f6480e ("sbs-battery.c: Capacity attr = remaining relative
capacity"), whose reasoning applies verbatim here; drivers/acpi/sbs.c was
not updated at the time. drivers/power/supply/sbs-battery.c has used 0x0d
since, so the two SBS drivers currently disagree about what CAPACITY
means.

Observed on a MacBookPro11,1 with an SMP/bq20z451 pack
(FullChargeCapacity 6775 mAh, DesignCapacity 6400 mAh). Both registers
read back-to-back from the pack at a full charge:

  0x0d RelativeStateOfCharge = 100 %
  0x0e AbsoluteStateOfCharge = 106 %

/sys/class/power_supply/BAT0/capacity reported 106 while upower, which
computes charge_now/charge_full itself rather than trusting the driver,
reported 100.

battery->state_of_charge has no other consumer, so no other property
changes behaviour.

Signed-off-by: Itay Shem-tov <itayst@gmail.com>
---
 drivers/acpi/sbs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/acpi/sbs.c b/drivers/acpi/sbs.c
index 86b7c79..862cb94 100644
--- a/drivers/acpi/sbs.c
+++ b/drivers/acpi/sbs.c
@@ -318,7 +318,7 @@ static struct acpi_battery_reader state_readers[] = {
 	{0x0a, SMBUS_READ_WORD, offsetof(struct acpi_battery, rate_now)},
 	{0x0b, SMBUS_READ_WORD, offsetof(struct acpi_battery, rate_avg)},
 	{0x0f, SMBUS_READ_WORD, offsetof(struct acpi_battery, capacity_now)},
-	{0x0e, SMBUS_READ_WORD, offsetof(struct acpi_battery, state_of_charge)},
+	{0x0d, SMBUS_READ_WORD, offsetof(struct acpi_battery, state_of_charge)},
 	{0x16, SMBUS_READ_WORD, offsetof(struct acpi_battery, state)},
 };

--
2.51.0
