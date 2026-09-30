Received: from mail-dl2-f43.google.com (mail-dl2-f43.google.com [74.125.229.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 727C636E47E
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 02:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790736676; cv=none; b=I5FOjfyAUCAMdCAlkfNztL2pe73nQ6OIW5iR4bBys9IXgSDsjJUkoytdtdwtWulbM94KYNU79Xsbts8IkITZTC3KH2Wl2PykMpEPE3ZGcJqwXON8q3VVallCVV0qYiy2gUJ0UD78/Kt955Rf3tgbJhgoI4mW+x4tiMfLtDpzE2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790736676; c=relaxed/simple;
	bh=vTZx4gCnhDGfJob7Ma4mwhOsNP6hIrB19vRqS8gxLXg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PPndYyKbH8ZYR+talkazDo0XVYoJ+3K2iKd+ghsqa+XdOv8jzVsAFVjkj+JsYfawZs6orf/EDqadI415CU+tkY5aziow8WcsCKsn4zL5jVYd8CKY4kbEwAOdFuadamGapmm758AMXncnZ8E4p6o/bpk55d7cIOWPwtmcs6zzY60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=B5Y4q8CZ; arc=none smtp.client-ip=74.125.229.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="B5Y4q8CZ"
Received: by mail-dl2-f43.google.com with SMTP id a92af1059eb24-142dd04f7f2so3479955c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 19:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790736674; x=1791341474; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=99ovinxsFoVp0y9um2d4xLdsMEAJmWbWSBDRVa+kv8A=;
        b=B5Y4q8CZU/qwTXoRrh2qi1/Gra++XLQoTYAjUMmF3RcGOkxYLFpE6Vft80b+NEBn4M
         TJmqFeTUEdrHU+a+i1cq3wnBfysFbulpb3O+mEX9xGrQx3E4yxGEvMgoqJeDqyrqSwFc
         FboX7fc3l48lETXM82Fuu5SMzs7zwC26LPWlQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790736674; x=1791341474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=99ovinxsFoVp0y9um2d4xLdsMEAJmWbWSBDRVa+kv8A=;
        b=HrZpgtgDl8BGdJfWQ3dtoEvS8hFBorYv3lKg34zE/jHwoASMEcUBjQwKoh9KhMY1o9
         qXQ948vRyA7zbdLG05x06EO9vushTkktPjuLISdGXx7hqLvjNfTkkXrDDiET1kVeSRiD
         vd8NpN9VnoUM+Ue0Y7c4IVeaggxNhAIvbBUfV77W/HfKVCv0htMEuiQXu5PF1FCOJWRy
         QTD6tRv2Yq1/PW5AddVpoBQ0erUGiXoHMJf+vKAnOUOk9h55+xGaDSFoK8n4DReKWaks
         xs9GtNrn5FdS1TQRvxbs5qG/gnB4SOGxXvqCm2vqH6a5bOpyu9+nRZUunUre1Q0wRKS1
         jXfg==
X-Forwarded-Encrypted: i=1; AKwUvBxiesbJW5OKcIgg+PWci71KAo88EQcPn/k17EZD6n02QrVuoNnMndiOWtuidMpJhkfVbmiTMw5tFmW2NZM=@vger.kernel.org
X-Gm-Message-State: AFuF++mUeicVaDOhIwUU3JlKnSo1Wfmngujenjswr64Ah0o8qDU4i+vT
	g9s4nQBcZrDFZOt103N8iTsN1txPaEamJGMCq32/v/3++rmRYzsa9hpsSVKz+euibw==
X-Gm-Gg: AYBFou2F5sKDJ5S/L82btG7R2g7nWpri1mt4luJezPJtSjNPnzv53qpHgdjId5hmrU9
	j1zU4A8nvWqZ0+MRVkzH+OMDnrgsNYoDwheryV6RKRatAZKTc1y7TOJ3a9TsryyFonxnqyR9rmF
	85aqbW5QWtZjOhQxKqkSzpPcrYGKLgsGqnS+nvzRMoZJjn1nlDGyb0nncl+gxIk4MFj3JzXwDUe
	M6SIavxde0PrynDhinBKD3d4+OAgXGLoke5jPE/Rqnh9beMyH7xVyVTcJGVlKbwJ/7X6EY9Y4R/
	dySnCw+RLJDkUxFQHg81gYJGNwrn7lt8BdOeAlLdA/sGKKMEVI4oPb2MKwRsy3I9TxbGqDHBKjq
	Uk1d5PRI20ynAaFJN1P6PSbycCN65z0kWcDFCd/J8gtIHZ9pBn7dhHHvkObRbWZwrcECSVwdde1
	MLrENibnuViFD4u3YEypnvam4y18JX9thhXMxM/MCQiO7DrN3u0GS6wt4Qe0yiHs1JlJ6iI61AN
	08EM7kLBO/BIHz4hKnMXdkKS6AcOvHsMWyw
X-Received: by 2002:a05:701b:2813:b0:143:8829:5fb9 with SMTP id a92af1059eb24-14c9ed38c49mr1173391c88.16.1790736673424;
        Tue, 29 Sep 2026 19:51:13 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:5f5a:aa9:d06d:b4a7])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-14d083fe728sm229335c88.6.2026.09.29.19.51.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 19:51:12 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: "Rafael J . Wysocki" <rafael@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>,
	Doug Anderson <dianders@chromium.org>,
	Ulf Hansson <ulfh@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Len Brown <lenb@kernel.org>,
	linux-kernel@vger.kernel.org,
	Brian Norris <briannorris@chromium.org>
Subject: [PATCH v3 5/8] PM: runtime: Clarify ->runtime_idle() callback return value handling
Date: Tue, 29 Sep 2026 19:49:53 -0700
Message-ID: <20260929194956.v3.5.If6e26acac7770c65446dd0b81f891948abb38973@changeid>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
In-Reply-To: <20260930025044.104824-1-briannorris@chromium.org>
References: <20260930025044.104824-1-briannorris@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This doc says "Negative error return codes are ignored by the PM core"
for ->runtime_idle(). This is misleading: any non-zero return value
(including negative error codes such as -EBUSY or -EAGAIN) tells the PM
core to abort automatic suspension of the device, which is commonly used
by subsystems to prevent immediate runtime suspend.

Clarify that unlike ->runtime_suspend() and ->runtime_resume(), the PM core
does not treat negative return values from ->runtime_idle() as a fatal
device error, and that any non-zero value stops the PM core from
suspending the device.

Signed-off-by: Brian Norris <briannorris@chromium.org>
---

(no changes since v1)

 Documentation/power/runtime_pm.rst | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/Documentation/power/runtime_pm.rst b/Documentation/power/runtime_pm.rst
index 8e93766bdf99..6fe20ad8d3d9 100644
--- a/Documentation/power/runtime_pm.rst
+++ b/Documentation/power/runtime_pm.rst
@@ -158,9 +158,14 @@ suspending the device are satisfied) and to queue up a suspend request for the
 device in that case.  If there is no idle callback, or if the callback returns
 0, then the PM core will attempt to carry out a runtime suspend of the device,
 also respecting devices configured for autosuspend.  In essence this means a
-call to pm_runtime_autosuspend(). To prevent this (for example, if the callback
-routine has started a delayed suspend), the routine must return a non-zero
-value.  Negative error return codes are ignored by the PM core.
+call to pm_runtime_autosuspend().
+
+To prevent this suspension (for example, if the callback routine has scheduled
+a delayed suspend or determined the device cannot be idle), the routine must
+return a non-zero value (typically -EBUSY or -EAGAIN).  Unlike
+->runtime_suspend() and ->runtime_resume(), the PM core does not treat negative
+return codes from ->runtime_idle() as a fatal device error; any non-zero value
+simply stops the PM core from suspending the device.
 
 The helper functions provided by the PM core, described in `Section 4`_,
 guarantee that the following constraints are met with respect to runtime PM
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

