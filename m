Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA5833EDE4A
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 22:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788559561; cv=none; b=fgyC/8gusF/hnIzyrAoqdf+biHtwsQPsHOBlpMxIENlbXZ4xzbiFIuol+43LK/yXAe+vQu6k03EwuYSVaNogpw6S5vJ2QqENHfkwx8p0EsNHv/rlHvuPFXAvrr5GnRrTvvMS7N5sIr4lcrZDS3GCSlAL0g+4vNZ3NnZlPPe9bh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788559561; c=relaxed/simple;
	bh=JE+Mf/xZybCdcDrWOeIPFco24j81E98f9DvLgRBGZC0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=I0XPuaIbp4orKwRXpmLbgH+NgRiQduN8TAFibm5Pr5EaXgLt7tbldECO1ZQPDQqqxzFJBGHKsMZBQaMqAhvSePHykrZM5yrkKbpoSZSTHabPSipoJjqFmBz28GTk50B2QeVGjiWYgVKhsUmWtW3NcwYEUSp7ZlEBJ7uU+jQ24IY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--skhawaja.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=J/y3n/eU; arc=none smtp.client-ip=209.85.215.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--skhawaja.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="J/y3n/eU"
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc1c1cc5206so1780361a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 15:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788559559; x=1789164359; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gFPQMsmC48q+wz7mUdVX+fcsDqeGsLw2XrmLniTg61k=;
        b=J/y3n/eUh0/+Dp3Qal/DofBuOXvReIq30m+RZwLwJBpbmsyzf4hvb9zzvuypmRQRgv
         3yGvGKBubK3oMQ3YpoxRDdbbtFyUm3aUUsb9SaTVKHKgbZ1WYkuOqyKzixKx7nIAkPva
         Fu4F4IpVWCr49e8W4iPIaMd3FXxlWva7nHP9roh52ITKdwXuXVyXGK5je9Q0/buO66WK
         z1XaYIa0Q/HIpjQ91gTHn/WGnw5FS+cGiHlCVpKGBZsy6YXlnYOLvDqoT2VrY5/ntsBX
         08VwD1hYlWeRZnkTAEZhVXZBo+K7TLPDNcbPfb5llGmZHvVq150vEjS018caY8NLMtoe
         V1yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788559559; x=1789164359;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gFPQMsmC48q+wz7mUdVX+fcsDqeGsLw2XrmLniTg61k=;
        b=cwwexnecMKvaqyZ1pKQkixi1/qvgyrNf9QR1Uqr+dr0UznQzV1rKwPoBDVPXFPEK2q
         HbZTG5SmhgeysYGplv2aU6YFTrzzcnTB8D0C6LAyFQ+Cjj1B8Oi2J/23X5kWV4vh0PVV
         ErhtWr+nQMoAZ9HZu5KA6MUxCN1szaf0YTEQ6tgDRv0d39aFkoIZs1ac705o3F7terAG
         1iYnSyHZfv8i55AxlCcowXpUfZLX77Jh5zLLFVA9lLfulQtcH7GsX/TCuD1CV/Rh9XNb
         Anj645XOTTRHgBnuyTCn4DLOyKiOkBjFLS8jNNzSJdmS7fjanpVKmDjRiIpVNNhReqGq
         PQNQ==
X-Forwarded-Encrypted: i=1; AKwUvBzGVV97hiK43eLn2V86pjbKVsHw3e++Q2GhvbxauIP9vZ59K7MPqAwBpfn451NXB6aS/Z43EA+0DkwKRLE=@vger.kernel.org
X-Gm-Message-State: AFuF++kOWzhMS68aC4G4EodFrp0FHYW+hFK7z+VebH+yhGP8K1prVMwR
	HFWRI5p9xEtQ0J28wOEiMD4/lk8QJTKBPb6iW4ToSNwG+YyMExg3bc87wIasqr0faRN9qTrhgSl
	aoAI5jaxiQhKkPA==
X-Received: from pfbhm10.prod.google.com ([2002:a05:6a00:670a:b0:859:a043:9ede])
 (user=skhawaja job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:13a2:b0:858:6307:5f7d with SMTP id d2e1a72fcca58-86166dbb899mr12027017b3a.8.1788559558716;
 Fri, 04 Sep 2026 15:05:58 -0700 (PDT)
Date: Fri,  4 Sep 2026 22:05:54 +0000
In-Reply-To: <20260904220555.589752-1-skhawaja@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260904220555.589752-1-skhawaja@google.com>
X-Mailer: git-send-email 2.55.0.1003.g10538fe699-goog
Message-ID: <20260904220555.589752-2-skhawaja@google.com>
Subject: [PATCH 1/1] liveupdate: luo_file: Add documentation for dependencies
From: Samiullah Khawaja <skhawaja@google.com>
To: Pasha Tatashin <pasha.tatashin@soleen.com>, Mike Rapoport <rppt@kernel.org>, 
	Pratyush Yadav <pratyush@kernel.org>, Alexander Graf <graf@amazon.com>
Cc: Samiullah Khawaja <skhawaja@google.com>, David Matlack <dmatlack@google.com>, tarunsahu@google.com, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:KEXEC HANDOVER (KHO)" <kexec@lists.infradead.org>, 
	"open list:KEXEC HANDOVER (KHO)" <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"

Add documentation for dependencies between FDs preserved by File
Handlers. This supplements the previously added
liveupdate_get_token_outgoing() and liveupdate_get_file_incoming()
internal APIs to allow File Handlers to resolve dependencies.

Signed-off-by: Samiullah Khawaja <skhawaja@google.com>
---
 kernel/liveupdate/luo_file.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/kernel/liveupdate/luo_file.c b/kernel/liveupdate/luo_file.c
index dbae0715220b..0a4994377c98 100644
--- a/kernel/liveupdate/luo_file.c
+++ b/kernel/liveupdate/luo_file.c
@@ -91,6 +91,21 @@
  *    again later. If the issue cannot be resolved, these resources will be held
  *    by LUO until the next live update cycle, at which point they will be
  *    discarded.
+ *
+ * Dependencies:
+ *
+ * Preserved files may have dependencies on other files that also need to be
+ * preserved during a live update. A file handler can resolve these dependencies
+ * by querying the token of the dependency. That token can then be serialized
+ * and used to fetch the dependency during the retrieve() callback in the next
+ * kernel.
+ *
+ * Some of these dependencies can be resolved late during File Handler freeze()
+ * callback, but some of these might need resolution during File Handler
+ * preserve() callback based on the constraints such as immutability and
+ * performance. This introduces an order of preservation. Note that the order of
+ * preservation of dependencies can be safely relaxed later, but it cannot be
+ * enforced later.
  */
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
-- 
2.55.0.1003.g10538fe699-goog

