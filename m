Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08870265621
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 00:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789518581; cv=none; b=dshhjgR4WerDtIb7BXBII4WsOjFOuZxjccD5sNt5Kxswr/9WLz0olO1sunHGXQ61Lii5w4yppp0/bHgP+gqXJBdgtlxzY0NCW2EF22kZ5ElBc53nE+xU4ffYr/iJeSWpUh5RiFb/1f5WNdnEcIDeqazdyyc+voXoUbbl4p6MXfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789518581; c=relaxed/simple;
	bh=JEOTKt0Dzx91mkjXhhoaM6TgD5HWgwbpqOYkcuSDjUY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uh4QDrc45Y0wmio3ZOQTv8L4SDBFO8g3E8NNoy9hBpJGkfGaHiKG8JTJdwc+xodGDffKze5Juo0gzMm/CofD0VndGQeyNFsknASD4ENKs18KsFPpGlSpQcTV1HznPRpA66uU/Ydavmf6BS7l5KqujDeMaD/mRu4N86b0Hw+VCFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=chU+HpyG; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="chU+HpyG"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912d3931so2465415e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 17:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789518578; x=1790123378; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tKqlv/hz08xj9ZVfIOS5h1evGtqTWLQkw0YhrEDSCJE=;
        b=chU+HpyGozVf+AmQCHe8U1B+ejDkeOJcbAiofWsDeOrUEjM7bXEX5QIa/ywBMDkD27
         arFMwBACvIpOaLkozOzxdBp9fSidmJNowzup4y0wYRZw63JlyT2cuUf4Trqpp6K07+9Y
         pArPQsSM0YLORK1HDTdVQCVv8As+34X2u3Jx+roxOZoOlAcYgBbyz3Y1B5UkyHxFto5t
         tx38SgPjNg7HVgOtT0Rc0hoC77Dmoa2nE0GEKr1QxpLY1Q86/HzFVYizUUQhlI9T33/3
         e3D2EjsPBNMrmIJ7HWs1wLX2ahGqW5DPV1du3xLXIFaWPzniYwzUIqxgdDMRHoMwwLyL
         MH/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789518578; x=1790123378;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tKqlv/hz08xj9ZVfIOS5h1evGtqTWLQkw0YhrEDSCJE=;
        b=FtQzPePDRdvfyDkmiBH1k/sQW1+sqAeeHG4urmQb8dsaSgrS0QFzDvulDBOSu0fODU
         M595eWPti7jV998v+1N6dvcNjjjSnY66ODwVv5OfhqPCdDJ9evVavyb7wtcqjBZdD92y
         Zwvdnjme1qcEznCSL2HmbMSezEytjjXG8O8Bpl07haTu3nlu0qqxJM5rZKFD4KTVa2SJ
         gW5uEVLROc4shLNW7LIpK3DsD1cMW9+fpaL8KRObiqzpfhvOZaYll0yZ64NSZ2DTMoWX
         Jd8TpHbuzQm3hf4e2DRdrTQ0KW9N/x3/zrLwg3KBUqMKpVfCQbvbKrp1hMnfnZOtZdBO
         LdNA==
X-Forwarded-Encrypted: i=1; AKwUvByaG/42u6/tn7n/rAyMvx7nRrURVi+q3ATkZ0bMC4ZMAwUTZZZfzWIbqeMyLqpuDIOFtM/C3LsrAtkfi4k=@vger.kernel.org
X-Gm-Message-State: AFuF++mfNXbhGl6KtoeqUU9HjTRK4lWjl/SUb18HabT8NXuKA9iJ2yPS
	FVdq25IwBdw6Ds/7EsGjFAFS1WcVW+0GsV6YVBbSrsKPgN0AQ++nwyiv
X-Gm-Gg: AYBFou3o/jR7hHTASwuLi5ZvDIKV+hAvXM6JgKobW+qMz5vaCPRsyLcUP5bOCnnzky1
	nkDVUYtXN9SzA8YydCv3zY9ORaMbWq0Kjl9jw6TZ8Vvis2eh1h+ix27lKtISxddDCGpBopGXd1e
	34RxK7ElOYM5GvJFvrN4H45C1YrTeLeQUnyXrniTjivf6L8XN5ofLQixLiUSINjFg7msmy1AG5q
	1jTm1KPMxTrPuf3XswrCt69rtekiktP4TvGRZ5Mico/9nYMnEN4iBNddrvD2Q/D3TYG/xWNUtpA
	VCOXh3CWBvJ52I3X9bmDLfGeG7w53cSFTyuSh0YgN34ykbDa5OEvClXn0VrztPrrHeB9ObXcA41
	Tyt1ZDoMTpOke0k5c4DHRsP573BFtscsl8NFh5AKEm8oMnyU8mVWcwjtANZIkhtqZueJqjn+yOC
	rNOgxZOq4C9bVmdHVVMUzK4M4WGRekk84f3RJApq9bpf8a/XPuZJo8N2xFSMKA8ah4PEvJk2pnA
	l/JhsSNf6QuVwQMj84b2Ac9olArKo3mOIq+kdbcUJySNKkRVfQO
X-Received: by 2002:a05:600c:1f83:b0:49c:c96a:d36b with SMTP id 5b1f17b1804b1-49eb7306966mr4213945e9.12.1789518578208;
        Tue, 15 Sep 2026 17:29:38 -0700 (PDT)
Received: from fedora ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83da99b7sm29827395e9.10.2026.09.15.17.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 17:29:37 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: James Seo <james@equiv.tech>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Muhammad Bilal <meatuni001@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] hwmon: (hp-wmi-sensors) Fix use-after-free in fungible_show()
Date: Wed, 16 Sep 2026 05:29:26 +0500
Message-ID: <20260916002926.161595-1-meatuni001@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

nsensor->current_state is dynamically replaced as the sensor's state
changes. update_numeric_sensor_from_wobj() does this by freeing the
old string and installing a new one:

	if (strcmp(trimmed, nsensor->current_state)) {
		new_string = hp_wmi_strdup(dev, trimmed);
		if (new_string) {
			devm_kfree(dev, nsensor->current_state);
			nsensor->current_state = new_string;
		}
	}

This function is only ever called from hp_wmi_update_info() while
state->lock is held, so the free-and-replace itself is properly
serialized against concurrent updates.

fungible_show(), however, reads the same pointer after the lock has
already been dropped:

	err = hp_wmi_update_info(state, info);
	if (err)
		return err;

	switch (prop) {
	...
	case HP_WMI_PROPERTY_CURRENT_STATE:
		seq_printf(seqf, "%s\n", nsensor->current_state);
		break;

hp_wmi_update_info() takes state->lock internally and releases it
before returning, so by the time fungible_show() dereferences
nsensor->current_state in seq_printf(), no lock is held. Two
processes reading a sensor's current_state debugfs entry at
overlapping times (or one reading it while another read of the same
sensor triggers a refresh) can race: one thread's seq_printf() can
be part-way through printing the string at the moment another
thread's call into update_numeric_sensor_from_wobj() frees it with
devm_kfree() and installs a new pointer, causing a use-after-free
read.

Take state->lock around the read in fungible_show() as well, so it
can never run concurrently with the free-and-replace in
update_numeric_sensor_from_wobj().

Fixes: 23902f98f8d4 ("hwmon: add HP WMI Sensors driver")
Cc: stable@vger.kernel.org
Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
---
 drivers/hwmon/hp-wmi-sensors.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hwmon/hp-wmi-sensors.c b/drivers/hwmon/hp-wmi-sensors.c
index 03c684b..55aee16 100644
--- a/drivers/hwmon/hp-wmi-sensors.c
+++ b/drivers/hwmon/hp-wmi-sensors.c
@@ -1247,7 +1247,9 @@ static int fungible_show(struct seq_file *seqf, enum hp_wmi_property prop)
 		break;
 
 	case HP_WMI_PROPERTY_CURRENT_STATE:
+		mutex_lock(&state->lock);
 		seq_printf(seqf, "%s\n", nsensor->current_state);
+		mutex_unlock(&state->lock);
 		break;
 
 	case HP_WMI_PROPERTY_UNIT_MODIFIER:
-- 
2.43.0

