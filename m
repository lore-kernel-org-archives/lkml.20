Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 127793822A3
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 01:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792201212; cv=none; b=J60HNhCzvsP6AsS1j8eq+ysTYTZObSOjW3NRQ/i55Clr6NbI7fdweS+Om6jYqtkaQ0OX+CsyVhkL5uWzyJG64AoqpazxdSH0T7otIDWPngXFspgsns0ygPFVYHIRebdkbiKwxtJmsobclxt/iyftrNx7ROwbTQx/RWUoofK8x6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792201212; c=relaxed/simple;
	bh=4urCyMVaiNsaJ5oTpbhYdSXWJFtAQ+6atKPamaiUKok=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V5h7s1ZFaiTluckh2CFrTtOUkqohbpC5kKFpVXJ8npYVq4Ta3YzrMqnfe471Ebv5+KPr/JPKotqneVrmp9Q/6pnjlMUikHfa78S7qCkElFb4jT2HOP9haoWe2GXL3MoVrJeqk+wdqDQgGoor6Xzn3veOGbx9bR/XGAVpsWvKCPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FsMtwl7Y; arc=none smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FsMtwl7Y"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-15756f82e8aso1083146c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 18:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792201210; x=1792806010; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fOueiXluXjDj/m0cQAsVf7wLNjXdqluvAn8HpEkfgJc=;
        b=FsMtwl7YAxjF1zetKNovxXluFmVFsyLCH4DY/lHqdbRb+3E1zHjArs7Mq+eRYwe/Tc
         prZSZMhbZ/0ovMeTYaRvPPxxnPy0CmmwsMnh7F4PgY4p/tbXflnBXEAFMW6C8oXH/tj7
         nyd7h31x6c15W5xHH8ZBMF44iTACLO8FM+p/9CNu2WuXnHBt07p4tEUAvRVuvOT2hBTe
         K9t7On1H7e1ixGNjA1rXldhj4G2oPe+qmj/U5IZoT4pgWleJKsqFruQJ7SaAU6eNfWxj
         vQpLBhB9se6Is7MKTUvf1kynkpLU1JvMMLr/jhuMhZLtY9QlryEvlv8GrktMxqBD7Y9/
         gFCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792201210; x=1792806010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fOueiXluXjDj/m0cQAsVf7wLNjXdqluvAn8HpEkfgJc=;
        b=tKnUU+ioJqXRYFibrclX9JV1gsCm6+eVUlazASm1/3OEUAs5mVQDBpi7MJC8lsPqp3
         JdkLfTifjC7hFnI+u07dhyyvbaRUf3GWrL12Xe+aw968mthbrn3X1roblxxWMQhIRrB3
         bdSQg3+ZtNBgVi4nmYKnEWdmgSaUyz+4Invm2UHMQgITaFhoa3qp6IL/mYqjSQGTLX7Z
         VBcqmwMLLZ6uy7Amzeq23GfJkOlbazKsnjPwKbqy7ofw4W2N/I/xWnt7IPyPoptjFL0j
         NM7qfXI/UNIg0/jm4Xf4jIrp/EsGPkZB506GJOyvv7nGACIcAfQec4hIwXtqvavznqIB
         ezOg==
X-Forwarded-Encrypted: i=1; AKwUvBzaDN7UAhzznY9Z+VcER/gss60kmPr1LBYmpAqNehIjKR5Rjash1mgfRCXZ2jEzPY7HKiVwNJ+zBFb2sVw=@vger.kernel.org
X-Gm-Message-State: AFq9FYK3kKps5kO046M75aOeRTLzBzTmvPB2KsiwEQnaIfG9UNOH2MU6
	FSIZI//OxRpZhX3QT4E7vN0PVX0pdfVp5YW4sCLmWwH4Kph0CwB8vLLJ
X-Gm-Gg: AYBFou3/5+2NUEiIuMhl7PBI33ok+AoLMB9ba/evQAORtbUmyECLivK76aVww+rRfgu
	epIkYuwLRvGBoOG64ruEHRRFuF8VNEZFMmJeiAf7CeGHMTkfU/HBTtgKmQcDCxFIBqigZ9oc7S8
	6kZ9NvmC7N0NeMEcChIob16bvIFotJQwqnHs3fXImK/l1pflh47FiuPj/2nCsVphRDVml6ghMCh
	nMefXi4V/SMLXstcngykMqEV/QZVuMe+VZeDA19nksm5CIMuGqXyldi/HlLpv93j4em+Q9FdA93
	n66ushdQ+8Y68cCLtOJGnVxajUNm2xeYIgUD6hDeVH/FlFhl1juE0gYQlxRGp5fJJSjVUMIYZ4r
	DogdcH2sh7u+cuBDb6J6e5ZPYRRpyNDzZ104Ud2xHi23a+RJGk0NFHuEfEV7rV/qXa6xn3pirK6
	mcFQ2xPzz5Tt2ZKOWEJFMdl0Y3l7usRSOPs0muEw8ALgrbXhPsIJ0bj7ODRumPaHu+w+4mOBn+h
	Ebk+ms+rJGRiSO0L6HdfyXNJuH6i7WyVMy6mLgmN/mY68jLvhtXBvKZs0q9dydeU4iq05E7UVI=
X-Received: by 2002:a05:7022:f401:b0:184:60dc:c381 with SMTP id a92af1059eb24-1851238b5cdmr2818837c88.23.1792201210084;
        Fri, 16 Oct 2026 18:40:10 -0700 (PDT)
Received: from lappy.taila8a9bd.ts.net (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831acba710sm12128429c88.13.2026.10.16.18.40.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 18:40:09 -0700 (PDT)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel@lists.opengamingcollective.org,
	stable@vger.kernel.org
Subject: [PATCH v2 03/11] HID: hid-lenovo-go-s: Prevent deadlock if device removed during setup
Date: Fri, 16 Oct 2026 18:39:48 -0700
Message-ID: <20261017013956.2440130-4-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261017013956.2440130-1-derekjohn.clark@gmail.com>
References: <20261017013956.2440130-1-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hid_gos_cfg_remove() calls a mutex before canceling delayed work. That
delayed work function calls mcu_property_out(), which holds the same mutex.
Prevent deadlock by removing the mutex. Additionally, since
cancel_delayed_work has the potential to re-arm, switch to
disable_delayed_work.

Retaking the mutex before removing attributes could deadlock on store()
as well, so don't retake the mutex.

Fixes: a23f3497bf208c59ad ("HID: hid-lenovo-go-s: Add Lenovo Legion Go S Series HID Driver")
Cc: stable@vger.kernel.org
Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
 drivers/hid/hid-lenovo-go-s.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-lenovo-go-s.c b/drivers/hid/hid-lenovo-go-s.c
index e979527ece8e..b27e82ec9b76 100644
--- a/drivers/hid/hid-lenovo-go-s.c
+++ b/drivers/hid/hid-lenovo-go-s.c
@@ -1445,9 +1445,9 @@ static int hid_gos_cfg_probe(struct hid_device *hdev,
 
 static void hid_gos_cfg_remove(struct hid_device *hdev)
 {
-	guard(mutex)(&drvdata.cfg_mutex);
-	cancel_delayed_work_sync(&drvdata.gos_cfg_setup);
+	disable_delayed_work_sync(&drvdata.gos_cfg_setup);
 	sysfs_remove_groups(&hdev->dev.kobj, top_level_attr_groups);
+
 	hid_hw_close(hdev);
 	hid_hw_stop(hdev);
 	hid_set_drvdata(hdev, NULL);
-- 
2.55.0

