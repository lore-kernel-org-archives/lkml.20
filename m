Received: from mail-qv2-f42.google.com (mail-qv2-f42.google.com [74.125.230.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34201207E00
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 22:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790460327; cv=none; b=EQAnqsdl+0Kcd9GZ9vi4h6/Y9zKatl9JkzGB8AamQax9ahxX1YZf3sZqDTKUNa1FX3txwOVo/Yvu3uBXnsui2Nxyz4F4FtObsQ+J7ORa8gQ75Jur92Ariop9NnTvN/tG62OynA5L3WxP0fK6Tk6K/Vgm3K4iJp1mn87BypbOEqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790460327; c=relaxed/simple;
	bh=CgdVJ6BsuH4GCu6wDMdj6Qc/v6CwfNepjZFad0EEfnw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L7ZhIH6jnAQDNhNMMm+tTLHsNXVgcaWGvBlWCBt4Q+aYCPe3aaShqkSpzf7SwE2OSDSmMRVs9sFzN2boMGSSAgEiPgwlm6kPRz5rGir90JmlYNnDo7PDuud0MbUn+ej7EUvojq6mpYhlmLP4mDwlm+9shWTXyC6D4idnVdNYYEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dAxcI29e; arc=none smtp.client-ip=74.125.230.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dAxcI29e"
Received: by mail-qv2-f42.google.com with SMTP id 6a1803df08f44-9144fbfdc76so5433916d6.2
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 15:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790460325; x=1791065125; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tbjel2c4muWyHvcqY7KfJGxMd99JcLe33APmWlDvbtE=;
        b=dAxcI29eIoxyoAIR0BAZ2u0nKbbS1ap9PQ7lJivUqVKFDST8iIHKs4V/YrBNi7Onn/
         M8QRUuba3/vgOrAZmAQmnGW0kUNiz8md5mT0x7lrB0I/Anp3WCPZ5ZpJ3noFhTs1oJNL
         LfETQW5E8Lr7VtwlHZ3Lek8BVP3g9LAS4fSplJa6uEzIztc2+85MbjcQIgCJvj+78/zG
         jtuCH8ZNF2AvrI3h/b3CeknjtfxLZkEPyKKJ0kW25LwRzu0qTa35lSufDuEYRSkm712X
         zQcY6cczqrho3n5khxj5/Wyv6RTgqtZ9JldQfj/vRmloQn5nbXzRkVNuLIVypOm0t6nK
         8CXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790460325; x=1791065125;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tbjel2c4muWyHvcqY7KfJGxMd99JcLe33APmWlDvbtE=;
        b=dL+dWwet2qMWFBRPa2sVrWWaXPqFcJ3oZ/xFYja/T6IfM+YD115kdtvQuW0dIefOZs
         55OqVGDmfC+uqcXUztoEJRem+WwfVnnzFfZ1ruuDMEb/7qp2rAVxIxWtiI6KHSWfYHGW
         Kt63W8z9dDlUl8RMD1hxD0z5MGoZX6HaRMMJ+ibOTWnlSyL5sNEi/CMUgf+4L1hE4AF4
         Wk7NFJ15xzDdCYMWa+6mqfKebOIi0GxllePf/N5AwExYdBZGte2IjuxKYfq7yfh69dgS
         J5q1EIesfsbr1vplAYSAvII4VRsOWtVMhm3CmICJEchhx+hYaJ/K8QQpas3m+DOvtEl7
         Vpfw==
X-Forwarded-Encrypted: i=1; AKwUvBxX1IFYbASMP7ADxW2ZsjsP8/UCycS9GNEMNBT5s6FwoQbgFD7mtdRgZ8EOyXLJnQb4Zb44lXErv27lyeI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIDcUK3DsesYh5Ze5kqGTIH19Ag8k2LVnXTGxCrg7B1aL2ct9+q
	Ije4AXNTfu1zCH3WzGXKXiFvKN0bLMMudQo/TkBuuuD4SDEUKZtcbfVv
X-Gm-Gg: AYBFou2SSEwyvD+VXipyNVHceiKcdFpFa8nOYw+boHjZ6dX3RpQCF/Cc57ss3EXww2J
	W4RRmChTXl2ROf9ZDlLMp/8dtTSRpyDdwVAW+gK6S1Q7IhZfS7MZ2Pcwo0126r3vY45se50lwYn
	TRVT4GXfnEizS5vp8+X+Lsiu+Rh336kua8WS0aVY/bT6mePu021KvVnn9WjZRcfl6MBNt5P5UBR
	6m79EGu2dORJLdDi9uXh642D5ggknLcu8tFWH0jATsGRVPRdlCpQidWIDBESJj3HAK+D0XeGVPi
	KnfCJJr8uUeH+L5BQIwoDxXdSXa9ec6pGVdHUl8kowsy+DLmnuRRmqivHV1KnvnHs4R4mu9p4A5
	NKuZ+2eDVh0/g/b+IDxMVyaAiN/1nRPtU3mflCKZR5x1tEqeeJcXs/7gz7ZSd2f9uHdqYCiQP7m
	6pXY7cLX/J/EqeF2uJHRefz3goViybXsOOEtzRplUmzYlYz3uz4awPNJhtNRBePL4nKHDfYR2t+
	UbzTXk/WShin5f/k6aWmA==
X-Received: by 2002:a05:6214:3913:b0:910:6cba:ea64 with SMTP id 6a1803df08f44-9142f70b55fmr128076076d6.14.1790460325074;
        Sat, 26 Sep 2026 15:05:25 -0700 (PDT)
Received: from DESKTOP-F7UNNQO.localdomain ([73.227.27.194])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9143edd60a7sm33214736d6.20.2026.09.26.15.05.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 15:05:24 -0700 (PDT)
Date: Sat, 26 Sep 2026 18:05:22 -0400
From: Jason Luo <jasonluomath@gmail.com>
To: linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: (pmbus/ucd9000) Add monitor types 5, 6, and 7 for
 UCD90320
Message-ID: <20260926220522.GA63217@DESKTOP-F7UNNQO.localdomain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The TI UCD90320 power sequencer defines additional monitor types:
- 5: Input voltage
- 6: Voltage with AVS
- 7: Input voltage with AVS

Because ucd9000_probe() only checks for monitor types 1-4,
voltage rails configured with types 5-7 are ignored, and thus
are never registered with PMBus.

Add handling for monitor types 5, 6, and 7 to allow these
voltage rails on UCD90320 to be detected and registered.

Refer to section 10.6 in the documentation below.

Link: https://www.ti.com/lit/ug/slvuaw9c/slvuaw9c.pdf
Link: https://www.ti.com/lit/ug/slvu352g/slvu352g.pdf
Signed-off-by: Jason Luo <jasonluomath@gmail.com>
---
 drivers/hwmon/pmbus/ucd9000.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/pmbus/ucd9000.c b/drivers/hwmon/pmbus/ucd9000.c
index f76c2913c9ca..96e0c587d52e 100644
--- a/drivers/hwmon/pmbus/ucd9000.c
+++ b/drivers/hwmon/pmbus/ucd9000.c
@@ -44,10 +44,13 @@ enum chips { ucd9000, ucd90120, ucd90124, ucd90160, ucd90320, ucd9090,
 #define UCD9000_MON_TYPE(x)	(((x) >> 5) & 0x07)
 #define UCD9000_MON_PAGE(x)	((x) & 0x1f)
 
-#define UCD9000_MON_VOLTAGE	1
-#define UCD9000_MON_TEMPERATURE	2
-#define UCD9000_MON_CURRENT	3
-#define UCD9000_MON_VOLTAGE_HW	4
+#define UCD9000_MON_VOLTAGE		1
+#define UCD9000_MON_TEMPERATURE		2
+#define UCD9000_MON_CURRENT		3
+#define UCD9000_MON_VOLTAGE_HW		4
+#define UCD9000_MON_INPUT_VOLTAGE	5
+#define UCD9000_MON_VOLTAGE_AVS		6
+#define UCD9000_MON_INPUT_VOLTAGE_AVS	7
 
 #define UCD9000_NUM_FAN		4
 
@@ -579,6 +582,9 @@ static int ucd9000_probe(struct i2c_client *client)
 		switch (UCD9000_MON_TYPE(block_buffer[i])) {
 		case UCD9000_MON_VOLTAGE:
 		case UCD9000_MON_VOLTAGE_HW:
+		case UCD9000_MON_INPUT_VOLTAGE:
+		case UCD9000_MON_VOLTAGE_AVS:
+		case UCD9000_MON_INPUT_VOLTAGE_AVS:
 			info->func[page] |= PMBUS_HAVE_VOUT
 			  | PMBUS_HAVE_STATUS_VOUT;
 			break;
-- 
2.25.1

