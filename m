Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C943DCDBC
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 10:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792320385; cv=none; b=dV7W1+FJ2Vdl/HNGly0gHJ20rLbu1mle8hbZXOFgwrQJen3BQuzf9WqltzcWbSjJP8rZcuAnitht3FKyY22wAxIxnd9EdqLSd5/o3XN3BhoEf7G2zl3GSwlEb7m9mR1N6VsjsZoqGJd0tPHmzw0kPXXk9/QNATB+wBUwGEc3/Jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792320385; c=relaxed/simple;
	bh=kEWxDoymA7MHszQKrmZjRfLNtr2Di+jrlgc4xNhUAG8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IwCKIK8/cfNdCvZxLnrpbh3SDs0tn/Bvg2DDv/7dVm9rhXfhLujWYuRuZI4W4KNk6povdWC3Q+IOqX437r46aJO1hmUvNRGk2FYi+ttUvuVNxibw2KRbPfhFt2JGvF1INf3ayWRQOLHSvn9yxRJJSqOiNKC2ErXRvgswsPpUFVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T6CnJ+yy; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T6CnJ+yy"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cd67cc518a6so166394a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 03:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792320383; x=1792925183; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HDzT7tmYvszUfdQMD+ETbxumnaTj0Q1RZIImeY9qlcA=;
        b=T6CnJ+yyrmUBYqj1LyDWTEjptLTfUjoPYPmWrjXrAbLgw8eOGkEmJTbrOh/mvx5f4S
         HWfAsRZgxr1J+IcsGva7CogW570a7Qbj6RrOI4su11YbSY+vCc5S4Qxq1de1YbpqD9Fg
         FVi7UvOJQ+1C2ssz4ZwLxHL/6ENZBWphDDYHRId01zVDZdcT3U8JvU0L4ZJsMz9qX9uA
         B9cULbcJ3qVj5qCpfxD1/JBBkhWf6o61us6l565OC/+MXWekWjz5F0tBObTliBa9+mJN
         +oFsF5Xb98HB9tDdmxzs1kaHqKfSG//WioNgKWw8QW6iU+bHZ5oGpjThooQMQhCMK7LA
         64Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792320383; x=1792925183;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HDzT7tmYvszUfdQMD+ETbxumnaTj0Q1RZIImeY9qlcA=;
        b=xSi7UB6sm2+vgHIwgK3xZhSQfdVx1ge8zsynu5ZBFFwUzoL+K+63P/xMPfBXrUvEx+
         NlLP4OvvIW/pIHfswNljk7ptaiwouqcI16eW3l7iNPOHFPvceL6ReOpwFqk72MInayFw
         cYDdKX5SOkJ42xrUjOjVl3CYBu79FbrB7PH7GVTF9rxzt3pPxcePxjstQblEP3rCDmAj
         tsDF8IXKNR5f7TVOvmOxT0iUzZA5DlJ3zUHLPSvPx58OnQSWWVLGn3PgI5cpZl6PT+Yp
         HXVJKJgMBF4RSj3kzw0XYRXace17jc0K7SbZPL8PUYh9mnIwm8fXCnfPwXYg57atv5/F
         puEw==
X-Forwarded-Encrypted: i=1; AKwUvBylcoLphV5FXX4XdfCMBeZ64t/3ZKHJV0P8onpacP1DhisbNmxyed7oaM84xSBiUPf/wnFXdWeHWOI4TuY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJxQ3/d3g1qmF0q8esGJIcGy+1R1gv2Wfz4fBdBeBcxDnm2FHZq
	7vRh1dgpryXWKrtQpC4zZa6q8OKmcGj9NT9nDuWy6xg2AW42ZonGjDvKn4KOnBk6
X-Gm-Gg: AYBFou3c1vsCkKcdJv3lz6Q71IqITUn+ssi7KQAAiY/l3ugcGnXJQ6ohmHKgofrhm1F
	hRxyqKhrzACSFkClcQ3+vYUh7+P9akwFZ7Bt7c6VK236WX+ji5I8ZSUhNEfdDGFjyayiyMNl9jf
	moqxlY+zzpclNuS+79BSu7NqhLvZMUDghixgppnjRPtMgnBSZuob07Q1wWiit2biS4imPaBAJ2H
	gd2sYxwXyIpUUgFvVP4Gja5Lx2ei6rOL4WG1NPXrLq4YhjO2HSWazRciUGkBIoZGjsOBPoIsW93
	Ak6ODLn02VDIR8KA/RDUWE/qvqzvyxAYZHFwXYyTnCM7wMGsz7ZazwdUSqrPGmb575iR483YsGL
	aCamUrRTSOSjuLhz0P+vtJdLLRIFdhdR/Oaqu+iOz5YfW09DIVA2F/oJOM8r0DnAEXNm8MKFL4z
	ohZnIyi9tQLQS/yNNma4iD0Ws7iCMFkdSvYFFw8aoPw7e0yk6Z2G5BjTEyzHWwJnvEE+EFpc+u/
	aGBku6EAn608PVKFcl80xs=
X-Received: by 2002:a05:6a20:3d07:b0:3e2:490d:511b with SMTP id adf61e73a8af0-3e2490d5900mr777312637.20.1792320382944;
        Sun, 18 Oct 2026 03:46:22 -0700 (PDT)
Received: from jmoon ([118.220.156.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd654a33681sm2949085a12.29.2026.10.18.03.46.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 03:46:21 -0700 (PDT)
From: Jinmo Yang <jinmo44.yang@gmail.com>
To: ping.cheng@wacom.com,
	jason.gerecke@wacom.com,
	jikos@kernel.org,
	bentiss@kernel.org
Cc: dmitry.torokhov@gmail.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	jinmo44.yang@gmail.com
Subject: [PATCH v2 0/5] HID: wacom: guard against NULL input devices on successful probe
Date: Sun, 18 Oct 2026 19:46:12 +0900
Message-ID: <20261018104617.743771-1-jinmo44.yang@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260927041138.4112920-1-jinmo44.yang@gmail.com>
References: <20260927041138.4112920-1-jinmo44.yang@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When wacom_setup_{pen,touch,pad}_input_capabilities() returns -ENODEV,
the corresponding input pointer is set to NULL but probe still succeeds.
Subsequent irq handlers dereference those pointers unconditionally,
causing NULL-pointer dereferences reachable from a spoofed HID device.

This series adds per-function NULL guards across all affected handlers.

Changes in v2:
  - Restructured per Jason Gerecke's review: replaced per-branch checks
    with per-function checks for dtus_irq, graphire_irq, and the Bamboo
    handlers — simpler and matches what each function actually requires.
  - wacom_intuos_pad() now returns 1 (not 0) when pad_input is NULL, so
    the report is consumed and does not fall through to
    wacom_intuos_inout() which would misparse a pad packet as a pen
    event (sashiko-bot).
  - wacom_intuos_bt_irq() now guards both pen_input and pad_input, since
    INTUOS4WL always has both on a single interface.
  - Added dev_warn_once at every guard (Jason).
  - Dropped the cp2112 patch (Benjamin prefers Dmitry's series).

Tested with uhid across 27 Wacom device types (spoofed bus):
                   unpatched  patched
  KASAN crashes          17        0
  probe failures          0        0
  hidraw nodes           26       26
  input registrations    25       25

Jinmo Yang (5):
  HID: wacom: check the input device in the shared report helpers
  HID: wacom: check the input devices in the legacy irq handlers
  HID: wacom: add NULL pad_input guard to wacom_intuos_pad()
  HID: wacom: add NULL input guards to wacom_intuos_bt_irq()
  HID: wacom: add NULL input guards to Bamboo touch/button handlers

 drivers/hid/wacom_wac.c | 90 +++++++++++++++++++++++++++++++++++++++--
 1 file changed, 87 insertions(+), 3 deletions(-)

-- 
2.53.0

