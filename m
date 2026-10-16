Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F27339E6F1
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 16:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792168533; cv=none; b=h2m8kbmXv8AVu3riMPUNohZ0JqfLsSCSQwtxNeEStQnuzFGOu4xJI6OuPz9IXvX8kvFruyvz7JR50JGkw7BfSkSE7XB09JZ4q/2UVP/SrVCYZV5Jf9CAFw85HtTsUfmcLFg2ayQDl3yP6KIQTM5WpvfXXB0EX49uq0/OWtbh54c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792168533; c=relaxed/simple;
	bh=5b1LSJchI/0MrZCsyqtEYTEFSPdgvZ9ZrmnPqy/vB8s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hkriMZ168XGUD0ccyu+WGVh+5DLIcbtSQasMtXHdbS8HJi/E86lXzKBzAO5CBFYvbtuFWQQi7oEjWyryvA0YO1ARprcAt4BF9bEiQSMOPPsZ322Nw5LYJICoOfJIG3lB5GGkeIY+cllOSd4OPHUCGqZkW9chPZV7HdBzovszaSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lrU/WwFe; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lrU/WwFe"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3535a54bed9so62517eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792168532; x=1792773332; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=47f/8DXwm5RKkGVIka3Vq3IjvPnPwaCzKP349NQJgKA=;
        b=lrU/WwFekKY7r/zOZbUUVPaX1uhJBlgNCWmprJxzvZyr8iT7iZvuE1QGvLHbF00J1V
         +Yub72QYZt6GiLkz9pNm50XmdK9XfwOvH98CUihN8tUXDTXxRCBn09NFEb3JePdolOkA
         eqNPJuwVZG05uz9KNG0by5I5IsxaaOvU/QuZREp1Dy6BhspWkYaDthkUYg9w6GYGYkAX
         uV+1783yj3wSHC7gtCT3Bv+mrVAg0OJXu6862wr4MoUNmCGK5C9nHH3yZSvYZuVARDI+
         q0yDJqTjtPhqEWS0nga2ggkeU7qM3b8YAiH6EYTL7nJmx4saB5oXrzZiyrWSSxDIzJP7
         LjSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792168532; x=1792773332;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=47f/8DXwm5RKkGVIka3Vq3IjvPnPwaCzKP349NQJgKA=;
        b=BsrJmulmDHgZIeKoP3fGfoz5YAUDQKueMjBibMkZcUH4dVSMUaza7PpnsUJqZ+Lsf0
         FKGiUjDpFK3Y+odlvxvodwtWC6vQztFbgwNxNh8VyEc8RoaqLXJBfoXORwmfSVyHQFrl
         LpuXZ+ddaCaV42Src9HySIhDMZwp8xurqivBMf0qYF2JfwlqyCbQzxeVOFUfKVYKCa8N
         hoU3gtczCMdRlEi9E9BsP14BEWvOHE1UPKRCU4MCJGDIqXncoinQX/pur/NdQ7QleydQ
         of8SIKnSLUhZGyuqJy++gcmNry9mdUB8Sm/vC2eJXgXcxqpJeaOkFWVvaz743BwWe/2e
         R+vw==
X-Forwarded-Encrypted: i=1; AKwUvByK4+F1ENxesTRHkImiyRi3+iSfponK6lTS26sJZVUyjuOibMhGS5O9DAkvfNxpRuTfQ6Xh1qdtq4bzQRY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJQrDyegHK3N9UfC46QVTFxxlCd3IWqxNBMaXk2bF7tILycTYQL
	VvYaFEHQBHZZysazIX1JCAJOCCTVgh6DZ06gqt5hPH2PC5b8eW5yTXry
X-Gm-Gg: AYBFou18P4sBTLd3nbafq2vEF8WDqKP4z9S/LzacSF5tCh/eW38ZBVm6ws3VIX7LnbD
	/ytTX9HkRzV6kwRdTYrYG9eX+4DJO1jAIJVLAkhdLNcRE9sZuKPSPV16hHfZv5B3MfV4xBhu4tC
	HGvo3m3w3BcnXXz42VtEgT+UYNfoXCJhNehXbps02QToWQcHXMjAZa7qs7eSTBYgF12D6A4CAmU
	ZBrIA78bxmoOHnOxo4Ed3eyve+6zLSICGQRdiptuk73nrtH9+UUqA8Ysqa1AfJkEwIOagwXvIUM
	VwcniP4vH0QTyqsV5rVL5yjzhumlcHOCfUyRDr2b0atkPZDpucTy9Rpr1UnWkvnD1idfoZ3XXMB
	ZeVWYvtylUNYcDRJZ3zFmr86HLJsVTQfipqo1rkKwics7E56V/wmsnZ2DxTqbQ4FMcbzAWnWqKm
	7zS85BH6A9dbVZ64GZrL3UFpTR2ilKimiozVPocPuJsfL0mDJZovFa3CaktGiLN9BPqzSFWVJdH
	mSXb/D40bzwKxqhssJzdhpzOBO1wpQHQvpiXBTistmgpR/GMBJQ6anP
X-Received: by 2002:a05:693c:65c9:b0:35b:782c:aa29 with SMTP id 5a478bee46e88-361a2941548mr312350eec.33.1792168531330;
        Fri, 16 Oct 2026 09:35:31 -0700 (PDT)
Received: from dev-oss-0.tail8d7c7c.ts.net (c-73-70-201-200.hsd1.ca.comcast.net. [73.70.201.200])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360820a02b8sm8348351eec.17.2026.10.16.09.35.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 09:35:30 -0700 (PDT)
From: Qian Xiao <heyheyco@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Ed Brindley <kernel@maidavale.org>,
	Denis Pauk <pauk.denis@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Qian Xiao <heyheyco@gmail.com>
Subject: [PATCH v2] hwmon: (asus_wmi_sensors) Reword BIOS upgrade advice
Date: Fri, 16 Oct 2026 09:35:08 -0700
Message-ID: <20261016163509.249020-1-heyheyco@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Known Issues section suggests that upgrading to a BIOS with WMI
method version two or greater should rectify the problem. However, the
driver refuses to bind when the BIOS reports a version below two, so
every system using the driver already meets that condition and the
advice does not help.

Instead, suggest that upgrading to a more recent BIOS version might
help. While at it, fix a typo in the preceding sentence.

Link: https://lore.kernel.org/linux-hwmon/CAFGXJCm6ZWK0NsFhZ1_ycgYtTTT3nhqj9mose60t+Rrry1aPvw@mail.gmail.com/
Suggested-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Qian Xiao <heyheyco@gmail.com>
---
v2: Suggest upgrading to a more recent BIOS instead of dropping the
    advice entirely (Guenter).
v1: https://lore.kernel.org/linux-hwmon/20261014233318.34567-1-heyheyco@gmail.com/

 Documentation/hwmon/asus_wmi_sensors.rst | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/Documentation/hwmon/asus_wmi_sensors.rst b/Documentation/hwmon/asus_wmi_sensors.rst
index 8f2096c..741111c 100644
--- a/Documentation/hwmon/asus_wmi_sensors.rst
+++ b/Documentation/hwmon/asus_wmi_sensors.rst
@@ -72,7 +72,6 @@ Known Issues:
    X470 Pro seems particularly bad for this. The more frequently the WMI
    interface is polled the greater the potential for this to happen. Until you
    have subjected your computer to an extended soak test while polling the
-   sensors frequently, don't leave you computer unattended. Upgrading to new
-   BIOS version with method version greater than or equal to two should
-   rectify the issue.
+   sensors frequently, don't leave your computer unattended. Upgrading to a
+   more recent BIOS version might help.
  * A few boards report 12v voltages to be ~10v.
-- 
2.53.0

