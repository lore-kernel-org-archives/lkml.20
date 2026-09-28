Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 142DB3955CB
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 06:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790576570; cv=none; b=l4AqecPjLidUmnMJChnGZ5FMEGLvmZXFbf9qQ9j3iU927/2yUiVaRgVsvZfi0cinLp78cWbjj+eU3FZsaqSzE/Em01IdQinqfHm1cJNz+KLHzdVhdE6vYNc6U9WY1fvtn7refXv+9/2sd/ZShX+syqu6mxir8AAFZheYVaqHhN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790576570; c=relaxed/simple;
	bh=LR/nA4tVHyi6eFNl4mMbMzn2KnpfyeV8b0n4FCCSrn0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u6OfkCXZKZadzLwjs/SyTCB+EET+0hLWnoUAfJE/70Pa6mPBYLMyFCtX12ffOBLGPuXLa9l9vebHOiWHxOb0UWNlSitkUcS4z4aAs/eeImIa9j7Xa4DJYwtebleCrSPVH0KuFIkkQsMvlZxCtRYY1ezgAIpsKAAs/XiiwSjPi2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inspiral.be; spf=none smtp.mailfrom=inspiral.be; dkim=pass (2048-bit key) header.d=inspiral-be.20251104.gappssmtp.com header.i=@inspiral-be.20251104.gappssmtp.com header.b=LUd+qxlj; arc=none smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inspiral.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=inspiral.be
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inspiral-be.20251104.gappssmtp.com header.i=@inspiral-be.20251104.gappssmtp.com header.b="LUd+qxlj"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2a8b9acbc6so364134266b.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 23:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=inspiral-be.20251104.gappssmtp.com; s=20251104; t=1790576565; x=1791181365; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PbVyliIXNTgSBOAj+pK7xJkZUV9YZeRWXj8iKW7Lm+M=;
        b=LUd+qxljMVLJckINGPYvWjAF/JZv1PbV69Dd08+Uz6YKRbM++bMm19YwvyT0WNCXDV
         Hme2XzMBi/qWNSQ1CgvyzpcEzG308zMO9vjSw3DInRxTyvZGlIuUL0ShaKdaQngAhiIp
         HpdsMacrFYcydNqbXrL2xTfigP3dd1i5GOT6R4p81O2L5taFNnnZWT0SW12ByP5V2u2M
         nY8S0X8ERkDJkSG/OrqgD3/Vks68e0441lxZ/F9qC9pfnqQwEuZhDeww9jstb2Rzd7Bz
         E/8uDmQjpAUwHfVIbXFcc4Iyx0nQ1nt7ZAw6pWXj+7hV1u9MYqhctGspW4RF7LgjbW8W
         kmIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790576565; x=1791181365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PbVyliIXNTgSBOAj+pK7xJkZUV9YZeRWXj8iKW7Lm+M=;
        b=eujbQmOrWhWQmW0WXlKI09m8e+XXu7H1q+UKlOQZTh1i6+TbFUzO4+y8Q0LfPBHN5/
         iJFLiLQhQSjmHUrU+eF8CjJJzydehJzWL348AWnyL2grf9qUYGGJx7O6V7qgXHuK+EMO
         LW46YsO6B/lM0954ubjWi6aBg3aX8p+EGWcbUFuXOmt0Vw1sumOvJOpVn1ii/7af69LO
         lO0jReTJTLVm3cQ2faTnDY+23JWUvfIbcQ2SKnwu7VO6yJnnM5AFF/HZLICr7V5uZOZH
         6MLeBsGNLtAgGS1feKzqVuO1lzYchYoRRJPHDxred0Im1WmE87/XzLnk0LMpgjWfAYG7
         QE2A==
X-Forwarded-Encrypted: i=1; AKwUvBzF5zSgdVyA1OKnbxaAMzxSAJ+1z4Oozwm1cmIvwkCu0kQl1kIT8eBx4fXzf8OSLaik1ALdm+j1TdATUuM=@vger.kernel.org
X-Gm-Message-State: AFuF++mQUFIyn0yPKaDZoEeYfYwHJkTMv+eBNtbZ3vR7v59omoq0CCEL
	lcQAq+g6oOHKDa04uL3bPyWE2YtOK7oXvRSkl/wTcm950O4ukCieIPqEfnn99xCpdlQ=
X-Gm-Gg: AYBFou3F/Eq4kZQR8dqtFlEmXrGjp+xU4445zVzCy/CE/BUAPiD+vxHHr43XRUOyjXw
	YH8aIi3rJXuIUaLOYFqh9qGSmlCq8iuPnKUUPyJU+frT6nyDfSN10HAzrpGkj1yiZf9SqmdSq8V
	SWM6Kxz8Ap9iXw3LtEbD+i9ECX5oKIod2gNnCzWuJEf52lsyGcwJbh8Vm3jIZ09E1b8eEf+PVEl
	15aIA3qZPs/0arrFWlQFOZN89AEQAmwPR9FJ7EMmXvvePIEHUqpfP+w69EBDLtIBylAdtIQ4SbB
	J3i1ZgqxwtWdNy7tahh/5mggtL+BGiwdMY4/xbMsprSt/SQlr921GeDRg6fJw7p4ohMznrKMq4t
	pLvokjc3rA5dB8hdPl0r9vAjvEEDeB2yUa3LaAY4fVK9Z1MpH7A/uFucM/NrJuuC815yjTg3oXZ
	owD53HBO3LagoZhaao6oSF1fWe7wKx/Mk/GqQIgx9SaBPe85btbbHk9sxIy639JBkydgPTIogHV
	uo9x1OcRSZllUWhyaJOPnejX9GFTehXZKst27/64Q4E/T9JLyc=
X-Received: by 2002:a17:907:ea8b:b0:c2a:fbe1:7340 with SMTP id a640c23a62f3a-c2afbe173b5mr498650466b.41.1790576564599;
        Sun, 27 Sep 2026 23:22:44 -0700 (PDT)
Received: from vger (99.240-244-81.adsl-static.isp.belgacom.be. [81.244.240.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2ae678bbb0sm419858666b.5.2026.09.27.23.22.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 23:22:44 -0700 (PDT)
From: Tom Verdonck <tom.verdonck@inspiral.be>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tom Verdonck <tom.verdonck@inspiral.be>,
	Sashiko <sashiko-bot@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH] hwmon: (sht4x) Fix torn read of heating_complete in heater_enable_show()
Date: Mon, 28 Sep 2026 08:22:38 +0200
Message-ID: <20260928062238.67746-1-tom.verdonck@inspiral.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <7b2087ccb963e097cf3f6333efaec0c46549003b.1790358356.git.tom.verdonck@inspiral.be>
References: <7b2087ccb963e097cf3f6333efaec0c46549003b.1790358356.git.tom.verdonck@inspiral.be>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 61406e9cac69 ("hwmon: (sht4x) Fix jiffies wraparound in
heater-ready check") widened ->heating_complete from unsigned long to
u64. On 32-bit architectures a u64 is no longer loaded and stored
atomically, so heater_enable_show(), which reads ->heating_complete
without any locking, can race heater_enable_store() and observe a torn
value, reporting a wrong heater state.

Take the hwmon lock in heater_enable_show(), as heater_enable_store()
already does when it updates ->heating_complete. The other reader,
sht4x_read_values(), is only reached through the hwmon read callback,
which the hwmon core already serializes with the same lock.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/cover.1790358356.git.tom.verdonck@inspiral.be?part=3
Fixes: 61406e9cac69 ("hwmon: (sht4x) Fix jiffies wraparound in heater-ready check")
Cc: stable@vger.kernel.org
Signed-off-by: Tom Verdonck <tom.verdonck@inspiral.be>
---
Guenter, if the hwmon branch has not gone to Linus yet, feel free to
squash this into commit 61406e9cac69 ("hwmon: (sht4x) Fix jiffies
wraparound in heater-ready check") instead.

 drivers/hwmon/sht4x.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hwmon/sht4x.c b/drivers/hwmon/sht4x.c
index da2b6130fca7..27fddff70354 100644
--- a/drivers/hwmon/sht4x.c
+++ b/drivers/hwmon/sht4x.c
@@ -237,6 +237,8 @@ static ssize_t heater_enable_show(struct device *dev,
 {
 	struct sht4x_data *data = dev_get_drvdata(dev);
 
+	guard(hwmon_lock)(dev);
+
 	return sysfs_emit(buf, "%u\n", time_before64(get_jiffies_64(), data->heating_complete));
 }
 
-- 
2.53.0

