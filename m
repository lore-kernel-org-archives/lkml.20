Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C60C47CA6B
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788522072; cv=none; b=coD+vTHiuM7vt39lVyrzG1XWK7qvl1d4GSL63KtNcqfpM4AtAOVNbtDHUf124tDpCZh623odNhJaN0vsaX0n6HQi9vkmbDLBd7HQENMNx15JEDTXGedTsmb2W2WMNpHvaJ/Ptu4Hax1FYB+FLUCIeg8NioNgMAtpbXNeJazHaZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788522072; c=relaxed/simple;
	bh=C1mL5wvuXeiJL6+qNXcEHLeUtrImx4Eb3dS/c2suAC8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GjJMFzcU8ELB7UFUp9l+aFcXjmtC7LMqVN+023wZ2twU0vjnp48UNKgDjDr0nzvJ/xbxl55xE0XyCH7f34kIOcU5oxISIKqvBb+jenwZ5ZAbw8f6yyJRIiDXIuU2OQH4St3I1IC82S4mqvaI7YEdhdshM2EHPwG/eWQqlz/RDxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DdDv3Olw; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DdDv3Olw"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7f84a55cc06so711248a34.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 04:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788522069; x=1789126869; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6MSWHQJd1wpok7dr+QgiT6g7ewt6hYaNecwa2k2Spr8=;
        b=DdDv3OlwkT2qOS6kyiYtyxg3Wj0+npa45z9bGBkdtsStYoZTzgffiGPxDx49UHzD3N
         oxkSV9WrAag6dA60LZnJDUb+nE5uXzvDoDcrElw3S2VTjv9gTuyVlK/Cn3hJ6KCWC2xN
         zeFocMAvnrz+xvnx0uk46eTyTo3w6k/lyh4gTd5vbDL1+zp+X/96ulUk4dCaiz4EPNvy
         5BA+gGeKkG6mHRf/sCZddHFcm0bEg6VVkdanaEE/LmMCI9SYuRHH2Lhlk5y6QCrXfsgc
         VxvxLewlDt4sYX4Jg+2AmmYkDgPwmsjGyGi+ZgnSUdz8FLK8IzADFF0kr0RuapkHXXIC
         5WwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788522069; x=1789126869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6MSWHQJd1wpok7dr+QgiT6g7ewt6hYaNecwa2k2Spr8=;
        b=OMZzuAR6dlBTm79UBL2U6ADBX+75Q2jm1dmFlLYe1Qhasml4hDdzBu6MzoxCHRGvZM
         xtaO4qcnqpKv9kBpCWKV3UeWPl9itx45v16XsFd1sjLreDp9okL1zllPDOywQetz7UnE
         NjcggbulXH3Hx2iDi6HhYhuWNtNJa6szxwy0dUkmUzqg8uMUIP8A5PjgVZmS+AsOT+pa
         iH0sk1ZE6UEqBuSiQqEQk31vxnQbifIyn7etN+9R/PJ8jQgd+phUeU+MG1kwnSvqKVAH
         hfd1rzHB22zaBcxo1EpzaKpiRlk9Ih38HbdbdCJDkm1F9Tiz/xLG42QWSR8Eyz1AKo6H
         aEPA==
X-Gm-Message-State: AFuF++kdR3h6pVu9QU6QU9ZIoKYgx2x9Ba/pcnuaMJ02259ClXa7CUbq
	G3m9NOj/3QVSPv3uJNsRW3WZMFipT5s3wPxL/l/0/K2Pcj6zmXgCwYhT
X-Gm-Gg: AYBFou1WuwlAfLosE0p5XxUDJdCnjjED2a4prawV60qgfWgUXJz8MHzTL+C9O+S7ELv
	PQVJYfHpcXkQGlr7/pwSvxlzvpRobvvEPGcWXkxtJpg+LsK5Rs0jl8Q81Fw8+d7vky+DsPmkqC5
	4Bk6Ws2Ikdxh9Us9veLL0K8IRKIFRVQD4jcsvDi0iGC1e5jRI0FoQK1VgVu6tfvOZHSwSubznCe
	0d/Q+qQda2R8cViu2cxqE6Ec27oThGKvxtXms55cPGM1Rks7219KYaqlPHgbQQ7eKMKsyP0UJr0
	SEHnNZfVtXkSvYIuOYIt5WKVsAZopKMfrJa69rEZ8L8bVDzJbknmj1ctB0E8cFc0EoacfngID+c
	kfU/EtBpbQr60EtzRqP4Q1I6APbA+CDI+5xywMbB+GY24OybLh63wqJrmRmlon6jWM/b7Byx8sr
	9Vvu/ihHdWoea6royQ0csugjmaYMb/PE3ti6zl6i+FDTkiVbqgupcIAacApywdmk+Q1OaEG0vcg
	INfPdoOO6fuuCQ=
X-Received: by 2002:a05:6820:221c:b0:6b7:46fc:1ca with SMTP id 006d021491bc7-6b746fc0324mr1975976eaf.41.1788522068827;
        Fri, 04 Sep 2026 04:41:08 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33450e140d3sm2695292eec.4.2026.09.04.04.41.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:41:08 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alan Stern <stern@rowland.harvard.edu>
Cc: linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH 2/2] usb: fix repeated words in comments
Date: Fri,  4 Sep 2026 17:10:38 +0530
Message-ID: <20260904114046.24048-3-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904114046.24048-1-hemanth.selam@gmail.com>
References: <20260904114046.24048-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop words accidentally written twice, reported by checkpatch.pl as a
possible repeated word.  Only touches comments, no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/usb/gadget/udc/core.c    | 4 ++--
 drivers/usb/host/uhci-platform.c | 2 +-
 drivers/usb/host/uhci-q.c        | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/core.c
index fa2022e9bc60..0faa0e07533b 100644
--- a/drivers/usb/gadget/udc/core.c
+++ b/drivers/usb/gadget/udc/core.c
@@ -177,7 +177,7 @@ EXPORT_SYMBOL_GPL(usb_ep_disable);
 
 /**
  * usb_ep_alloc_request - allocate a request object to use with this endpoint
- * @ep:the endpoint to be used with with the request
+ * @ep:the endpoint to be used with the request
  * @gfp_flags:GFP_* flags to use
  *
  * Request objects must be allocated with this call, since they normally
@@ -992,7 +992,7 @@ EXPORT_SYMBOL_GPL(usb_gadget_unmap_request);
 
 /**
  * usb_gadget_giveback_request - give the request back to the gadget layer
- * @ep: the endpoint to be used with with the request
+ * @ep: the endpoint to be used with the request
  * @req: the request being given back
  *
  * This is called by device controller drivers in order to return the
diff --git a/drivers/usb/host/uhci-platform.c b/drivers/usb/host/uhci-platform.c
index f4419d4526c4..7967bb160917 100644
--- a/drivers/usb/host/uhci-platform.c
+++ b/drivers/usb/host/uhci-platform.c
@@ -21,7 +21,7 @@ static int uhci_platform_init(struct usb_hcd *hcd)
 	if (!uhci->rh_numports)
 		uhci->rh_numports = uhci_count_ports(hcd);
 
-	/* Set up pointers to to generic functions */
+	/* Set up pointers to generic functions */
 	uhci->reset_hc = uhci_generic_reset_hc;
 	uhci->check_and_reset_hc = uhci_generic_check_and_reset_hc;
 
diff --git a/drivers/usb/host/uhci-q.c b/drivers/usb/host/uhci-q.c
index 9480d4ff0111..46b3bfe06adb 100644
--- a/drivers/usb/host/uhci-q.c
+++ b/drivers/usb/host/uhci-q.c
@@ -345,7 +345,7 @@ static int uhci_cleanup_queue(struct uhci_hcd *uhci, struct uhci_qh *qh,
 		goto done;
 	}
 
-	/* If the QH element pointer is UHCI_PTR_TERM then then currently
+	/* If the QH element pointer is UHCI_PTR_TERM then currently
 	 * executing URB has already been unlinked, so this one isn't it. */
 	if (qh_element(qh) == UHCI_PTR_TERM(uhci))
 		goto done;
-- 
2.48.1

