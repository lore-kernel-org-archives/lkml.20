Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA1B38E8B9
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 05:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790744511; cv=none; b=TPjSfN4D8AQklKrW4SEp0ablEnvq0/VpZj4qUgoj0B+PngcLEfw8wjGUnyaIxn8fShOAFZc94sW63ieSZglWzTuC7vGKSGDtblL5BWQHd5I1ZEsJHBuHgRKvPF9vsLFpeJ55Vvy8AVHk53i4IKiyzrepsrOI7UgFSoOvOPWWDe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790744511; c=relaxed/simple;
	bh=Wj6fEXUo2kKp8r2C5A0yqiHnwm8Zped/Gi+sUjz73zI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Po8xODqB9E6OUJ9Kzhhg9cKnsA5Eoc34ea0prSr+9vN+9zupQAo8mMEaSAVs2tooz+vrmCAfT7ni7U/Es51CBiT/c5HLJTME/xQOijW1BJinnrP26LekRlsoeVnWNpfj42Q7KAukaoDZBLde1rA6NiwjUYqzfkJ6fTxrgIutJfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n4ydRHCI; arc=none smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n4ydRHCI"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-34b590a5b5eso1639766eec.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 22:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790744509; x=1791349309; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z1Yx/ERGrvzLNDM/aln7d4fjkG8qSALCIn2H16VCKuo=;
        b=n4ydRHCIqCAsw1K+lzIlYNKLFXdoS8AAhQJ42GK2+qhP7+YxcB2nrvDndTJ35xhkyX
         nUKtZKENfdR8ps31gPFAfVchFhWqWHSecrB7V0Fv+8YJYQEoEUginNZgC9mre2+ceL3a
         rnXOy5Tzgcwqlpz2qlrCJZRVIU3lvVweiTC9Od2zHGkXiQ3jIHbLwAGK7RFip+5jVGdV
         9Rr9mQlBDmzVsoOQbPvKoyYJKEp+ZutbMmF2yFco8oaxVm5pC4wP+1HjqolF7vERGoQj
         XbRQo53ETRX5Qv5F8PpUILKR6Qy0OkCiXUzzVFEanz0uGf2VLLaEEDVPdLqcDB9+AvXv
         EjKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790744509; x=1791349309;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z1Yx/ERGrvzLNDM/aln7d4fjkG8qSALCIn2H16VCKuo=;
        b=DxDfss+JzopndrRYpJz3DWGXvo39w5Vf5yFL7OyWmiZMEJduvQq4O8Z0ICYGQMZ+5g
         I2k27PBVAtbwKUoQRMWprzE5DX26ulHr4eVbkmro2ulqdA+6/c7wzUkeLT13QvWXQ4Vr
         927WK3QDQuAMep1edEZCd9kJfVXHZ5GeBgp4oz1X57/RNI2ydir1vaX8nQSotrouCcMc
         /QCaRVLLaCc0BQiteAmMJQkTZtDRhNFJ+usyocCrZuyubjqjpmWrWPWKtqjraYrfhXpy
         h8Ju5NhbyEgB7LN6leJy2zGr+wpiFFoOab1h2QHjyxqHUOvUoeWbErMvN2a0oJu+dpyC
         16Vg==
X-Forwarded-Encrypted: i=1; AKwUvBxlt8PBUfi8UVTEylGBVZUwPDLQ/HC/UlYKl1CbWZT5hDkJuCAwJJLf0BFdlAMekuFtUjhojyx2e8EzaU4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ8BToPzkiCiy+vG7cFU0G+zC8Szj8zriIfucnoThDQnpucH/2J
	cPbpXhNmbYOVZ/Ia0656F0e9lgx9huNUDz3Taw8G53hNdxN7EoASTqMB
X-Gm-Gg: AYBFou1zLPUfS6HbDqNl6g/QXHEjQphI2p/i921ZxG2e5AmgBDqA32DFen3QQCadKqM
	2yfcuN8ca82kjRylSjqwfN/0FdtALpgYDPVaS5+HYQpJ58ONkcfORHoL93GGbkDsTw9sIuPXqtP
	TLc2zMM+BuP6+kyGl+2cDFgqjcsKnRbTzp44RyUjMz+C5R9UAmMaZ+YAsYfAr3W2KnZSVUJBVkL
	7YYP8SJgZB3VYKp/pJyVtA9Nrb2hgTM6aMw4jV1bWivAljRfqDc7MA4XEVO8A9UPEKk0HczTeKw
	EBWDjeaQ0V7IUFQSFXWQYQqUGEE8LeaaTFmc30vQ7JbnvdTaasjsipxBfTVrLfPEudAgqxXtU7q
	NkUeyt0boaqcLAebfwjRUjGfAMm7T2maOskCkPxuEH5osB+atiIcRfo7LRFhTdifZRFby+fQpkd
	zawEeaLW7K29fxHw+virREQQEronvaEgK2nvYa76coOafinJuDfbV/KAHQArCspA0/bphuVyBhd
	amf6ZmRlwsXD86MNftcFZLCUJNJgyCdSw2v8RvulThBqRZU8qaFHAYdIALVisk=
X-Received: by 2002:a05:7301:1522:b0:33c:19bc:d8d2 with SMTP id 5a478bee46e88-34cdd0af6c7mr481285eec.31.1790744508699;
        Tue, 29 Sep 2026 22:01:48 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:101a:5ce6:a15e:d8ca])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34cf613b0c4sm778125eec.28.2026.09.29.22.01.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 22:01:47 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Tue, 29 Sep 2026 21:59:11 -0700
Subject: [PATCH v2 2/2] platform/x86: thinkpad_acpi: use __free(kfree) for
 automatic cleanup
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260929-thinkpad-acpi-cleanup-v2-2-88e176953a4b@gmail.com>
References: <20260929-thinkpad-acpi-cleanup-v2-0-88e176953a4b@gmail.com>
In-Reply-To: <20260929-thinkpad-acpi-cleanup-v2-0-88e176953a4b@gmail.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>
Cc: Henrique de Moraes Holschuh <hmh@hmh.eng.br>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Nitin Joshi <nitjoshi@gmail.com>, platform-driver-x86@vger.kernel.org, 
 ibm-acpi-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Ali_Ahmet_Memi=C5=9F?= <aliamemis@disroot.org>
X-Mailer: b4 0.17-dev-6c14f

Use __free(kfree) for local pointer allocations in
dispatch_proc_write(), tpacpi_evaluate_bcl(), and auxmac_init().

This ensures automatic memory cleanup when exiting function scope and
removes explicit kfree() calls on exit paths.

Assisted-by: LLM
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Tested-by: Ali Ahmet Memiş <aliamemis@disroot.org>
Tested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/platform/x86/lenovo/thinkpad_acpi.c | 42 ++++++++++-------------------
 1 file changed, 14 insertions(+), 28 deletions(-)

diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
index 645df773fe63..93fc69a7dd63 100644
--- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -891,7 +891,6 @@ static ssize_t dispatch_proc_write(struct file *file,
 			size_t count, loff_t *pos)
 {
 	struct ibm_struct *ibm = pde_data(file_inode(file));
-	char *kernbuf;
 	int ret;
 
 	if (!ibm || !ibm->write)
@@ -899,16 +898,15 @@ static ssize_t dispatch_proc_write(struct file *file,
 	if (count > PAGE_SIZE - 1)
 		return -EINVAL;
 
-	kernbuf = memdup_user_nul(userbuf, count);
+	char *kernbuf __free(kfree) = memdup_user_nul(userbuf, count);
 	if (IS_ERR(kernbuf))
 		return PTR_ERR(kernbuf);
-	ret = ibm->write(kernbuf);
-	if (ret == 0)
-		ret = count;
 
-	kfree(kernbuf);
+	ret = ibm->write(kernbuf);
+	if (ret)
+		return ret;
 
-	return ret;
+	return count;
 }
 
 static const struct proc_ops dispatch_proc_ops = {
@@ -6711,26 +6709,21 @@ static const struct backlight_ops ibm_backlight_data = {
 static int __init tpacpi_evaluate_bcl(struct acpi_device *adev, void *not_used)
 {
 	struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER, NULL };
-	union acpi_object *obj;
 	acpi_status status;
-	int rc;
 
 	status = acpi_evaluate_object(adev->handle, "_BCL", NULL, &buffer);
 	if (ACPI_FAILURE(status))
 		return 0;
 
-	obj = buffer.pointer;
+	union acpi_object *obj __free(kfree) = buffer.pointer;
 	if (!obj || obj->type != ACPI_TYPE_PACKAGE) {
 		acpi_handle_info(adev->handle,
 				 "Unknown _BCL data, please report this to %s\n",
 				 TPACPI_MAIL);
-		rc = 0;
-	} else {
-		rc = obj->package.count;
+		return 0;
 	}
-	kfree(obj);
 
-	return rc;
+	return obj->package.count;
 }
 
 /*
@@ -11075,24 +11068,23 @@ static int auxmac_init(struct ibm_init_struct *iibm)
 {
 	acpi_status status;
 	struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER, NULL };
-	union acpi_object *obj;
 
 	status = acpi_evaluate_object(NULL, "\\MACA", NULL, &buffer);
-
 	if (ACPI_FAILURE(status))
 		return -ENODEV;
 
-	obj = buffer.pointer;
-
-	if (obj->type != ACPI_TYPE_STRING || obj->string.length != AUXMAC_STRLEN) {
+	union acpi_object *obj __free(kfree) = buffer.pointer;
+	if (!obj || obj->type != ACPI_TYPE_STRING || obj->string.length != AUXMAC_STRLEN) {
 		pr_info("Invalid buffer for MAC address pass-through.\n");
-		goto auxmacinvalid;
+		strscpy(auxmac, "unavailable", sizeof(auxmac));
+		return 0;
 	}
 
 	if (obj->string.pointer[AUXMAC_BEGIN_MARKER] != '#' ||
 	    obj->string.pointer[AUXMAC_END_MARKER] != '#') {
 		pr_info("Invalid header for MAC address pass-through.\n");
-		goto auxmacinvalid;
+		strscpy(auxmac, "unavailable", sizeof(auxmac));
+		return 0;
 	}
 
 	if (strncmp(obj->string.pointer + AUXMAC_START, "XXXXXXXXXXXX", AUXMAC_LEN) != 0)
@@ -11100,13 +11092,7 @@ static int auxmac_init(struct ibm_init_struct *iibm)
 	else
 		strscpy(auxmac, "disabled", sizeof(auxmac));
 
-free:
-	kfree(obj);
 	return 0;
-
-auxmacinvalid:
-	strscpy(auxmac, "unavailable", sizeof(auxmac));
-	goto free;
 }
 
 static struct ibm_struct auxmac_data = {

-- 
2.56.0.rc1.315.gc6ed9934b7-goog

