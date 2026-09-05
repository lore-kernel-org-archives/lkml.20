Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17E864CB8A7
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 16:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788626723; cv=none; b=vB5NxxBZAa3ydyqf1VHoTh+QBhUE5qOVBSovNFRgZpAgGeCgaLIp5mnIhKgpNCUw5JwRH//BwXi+hLJZg1yx+Bh++wQ2zv+Hfcfk/vHf+mQ+EV6OfCBPr/Hg8r1UIoX/M+7Td+ZObx/uuP+k6hjFMKeXvUcz79fio9UA4k1wVfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788626723; c=relaxed/simple;
	bh=ifc7H3d8cophRdBVvhP/1sBwTZYA0mepFYMjpoBRgcY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ojtOB9qzNzXG+SPs2Eut5fIN2lhbkNgEQyk9zs0aeBWrAst73kxV2iYyGALyZhFhinjut4WGc9bRYpQu95KjJ8wMAtpXYb/ZzUrusyFyupmE31lggkwK9R4HCRLvipfDyEfj3mn9R0lVUDwNYM3AiHRJhgrpmUp0oY0avch72xY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q2veQxqu; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q2veQxqu"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-52d7a3defe8so22105951cf.0
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 09:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788626713; x=1789231513; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MGsQP05BVP7HKqk9s+jX5IUhEyQb2OXorpPQmD8qdnw=;
        b=Q2veQxquBr3zYbatYaVLvr4AA+RntALkXyYoZab0Cu48VI4Ru3iCBuS8vuCfN08/ic
         EBftGeAMGl1yQuTg7FjPggwRRiNAtyzfHju75/NEFmAmlWrYtng5wpuv7YXbX5tYZeVy
         rKyLYy9YZTWoFDHt+heUW1jOTeTovjQVRb7UQr7twfrmyL+blcSRb79LwzvbuepBfHUc
         yiZlIhuR6p365i9aPzRsXY2BtIdvjEJseoZ8RPsadAxroqfkxtpH2lorgim8HDQJQiB5
         TZBbD3dXWrGEevCqoYREh37fu+0yvM/hfB/EcbFymWZvTdtuZJQxrfAowIdfqK69Vjso
         OB0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788626713; x=1789231513;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MGsQP05BVP7HKqk9s+jX5IUhEyQb2OXorpPQmD8qdnw=;
        b=pXhV8CIBMkKQNhtTUXuBOVQOcv8PZActqEbtpXsttDvUuP5gNCIHKE+vbNxWMJ2HFI
         a8VwR/BeoilbXr7XfckCZXGTYxr8e57oismrfjx9lxl/TKSYcEiTQOQgDm61ENLEx/qk
         0hJAW/msZ3nM4GTQMSQeDAoNTOH7wt3Z440JonU3E09WXKV3LmQ/hMT49dbkdcMvolGy
         ESz4Am1x0PWbQDuXPBh+NUTvqt7yAXv8wbHKi1Yz7fcD3qosrnFV7AtEl9EPz6jGNV3o
         d+q8D/3KGM3Z0OlcHG+qXGIM9aOxzilFV4pjS2fzSuVMiuotM4Ehr4v72ygFkLCphIsB
         RGVg==
X-Forwarded-Encrypted: i=1; AKwUvBzpo7WGgLee/K8bjSS2A9nBTpX1vvu3/1hy1VVlXrlkO9zF7MXjXvMHs2ZcnhdJBmabGwzyinEyFeuRfjI=@vger.kernel.org
X-Gm-Message-State: AFuF++nzQn8IY9pwlQ58aTH2xBTaxDRnLf7PK8POtI9MlKKsQpGYPhTT
	dlFJFbw+/7osTbGO+nBGs5uftek4hjYk9AzUZzn3MZ/0n/lunFhquktc
X-Gm-Gg: AYBFou3n8L8g43ks4BtFk5BZ2ab5wGqhZKWJBJ8/33EYmwc4y0OplgqnXhvCB+iFCHc
	FDg2imVNAKsQRUJld5nt2Nlo4ZNwl+lqr4scyogXmNt5b7gCTJ8MzYn8bTD3H7Au9Zh8l/6Rw01
	ypIswh15f+rCdzClSC48QFZFTI4qKniundnmgKjQEUW7G/dnI9+ZLLEoXer/CeKjZC/rQhoBm8O
	wBxzWyPa4h0IIR5aPQ1q/+ucU9O63NLk8xJ93953hCpzfEIVLX8MOVzAVs8qhSDEZYsVB5WJ2uq
	RDV9v8nYZNE6jOQ8mdyw3RHC4YYdhcsFZapLJjJsXlwxkIBVcj61XnXh0oZvoyEte3GNM5m2AUF
	T6cq8rKUSK/HApN6sXj2d1RGBjh5dRntOj88GwdFXqnlGtFNwgeb70N5TUkHh2nyRpc9BYzYxe4
	FtDDEogu8m5FhKAZ0lRGvbWIqzwhMjKSt45DuQcC6irX9WOIngmDoFhFN2qXH/jt24kH0NhoMnu
	5Xnfexn1TrkvH2D38N+Mrn7vFQ=
X-Received: by 2002:a05:622a:1493:b0:52e:12e6:6d7b with SMTP id d75a77b69052e-530549f8c81mr144088371cf.39.1788626711978;
        Sat, 05 Sep 2026 09:45:11 -0700 (PDT)
Received: from dave-desktop.lan (modemcable053.177-58-74.mc.videotron.ca. [74.58.177.53])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9104067ac52sm48984326d6.27.2026.09.05.09.45.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 09:45:11 -0700 (PDT)
From: David Collin <davidcollin899@gmail.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	David Collin <davidcollin899@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 2/2] usb: dwc3: host: fix props[] overflow when all quirks are enabled
Date: Sat,  5 Sep 2026 12:44:48 -0400
Message-ID: <20260905164448.209348-2-davidcollin899@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260905164448.209348-1-davidcollin899@gmail.com>
References: <aptV-QHKGbMqw1uP@vbox>
 <20260905164448.209348-1-davidcollin899@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

props[] is sized for exactly the number of properties
dwc3_host_init() can populate, leaving no slot for the NULL
terminator property_entries_dup() requires when usb3_lpm_capable,
usb2_lpm_disable, and the <=3.00a PED quirk are all true. Size
props[] for one more slot.

Fixes: 8da7644493b4 ("usb: dwc3: Specify maximum number of XHCI interrupters")
Cc: stable@vger.kernel.org
Signed-off-by: David Collin <davidcollin899@gmail.com>
---
 drivers/usb/dwc3/host.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/host.c b/drivers/usb/dwc3/host.c
index 74117cbb2f42..cd1e5204ac3a 100644
--- a/drivers/usb/dwc3/host.c
+++ b/drivers/usb/dwc3/host.c
@@ -130,7 +130,7 @@ static int dwc3_host_get_irq(struct dwc3 *dwc)
 
 int dwc3_host_init(struct dwc3 *dwc)
 {
-	struct property_entry	props[6];
+	struct property_entry	props[7];
 	struct platform_device	*xhci;
 	int			ret, irq;
 	int			prop_idx = 0;
-- 
2.55.0

