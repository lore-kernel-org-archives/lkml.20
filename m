Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793891654;
	b=UpTfHSldFCiI4v5qXkF+1s1RHAOi38mG0Q6Zq3+fsdZ147Q6wEgs3ExcqHFPThrcU/P4
	 ARJPIO5Kfh8bgXGuLPZmLqdd3YMV8TFGl+ttZhcfUoEvCnk283KgioxQe5pta//g5qi3u
	 xKFI1RkMk6qF/NRMGc9dlgmXw6KFtlMWF8+8PjIO0QFUPsMH7rvLkJ+FG05zfsMtP1vHs
	 ippLJD2cJr72qjSMV/ssrRz9oG32vmbzVnijMSW+kldZrsnT7sNO9Rr+acEI15DLLmJ+c
	 bBKduH7aCS8ozpuPyq2zPwIDg1d5wk1YxUH+nhFfgIUDOt1qHlB/I95H1jWjNtyglxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793891654;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=IXsQCDSdG7y1XG8+TdbE9NhcI3/PPLWdPr4Sx/VOURw=;
	b=4mv9fUCtcMnm7Nz9k+K6ROo1OoQkPTM/rlrFP8m9TXzGE3I8DkTAs9AQTjHKkltpYJ2E
	 DfFdirxC1xKc9DnmimG0/tczEgDJIuok+rOLI5RDYMTIbHqcKbCcymLBEJDl/sy+ZhrYx
	 RSbcY2+Zh/9q9QBrNSkCQyLLELaYbq1L4xgihQBdCdcKqRVCUkarIKwU4CWiUXyIBF+IT
	 YogjgLdNpScYqVB54RUWKaT3ZIYKm87pdcJRj0MNlZdOUFNSQpZofuWYgOShMo1eSot4s
	 LT48BMGeHrhk7njAuKdei5M7SD4SLXEZHHzGb2Jx2iEioVUJJV9tEswqhcWetavfl5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=GIMLTF+E;
	arc=none smtp.remote-ip=209.85.160.173
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE01B606A32F
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 15:14:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE01B606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=GIMLTF+E
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-533778ab0bdso21980941cf.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 07:14:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1793891653; x=1794496453; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IXsQCDSdG7y1XG8+TdbE9NhcI3/PPLWdPr4Sx/VOURw=;
        b=GIMLTF+E4TlZ8ZiK5bXeSzeBywVYFjiBz2ltLqDas2nQ/k8Cn5SSw+bQGMdoRyXwme
         9cskKX+4g++7LogN3fVYiVhDsNX2NH2nYhpXNNa40so7uPc9PxgwKhYpAW9f26js3e9/
         wa7Zas3BgvvqRCZSt6R+pZvKCOPblTe3psDwQ/VVIaSWJ8amA/oAO5SqsO0sK170JRe4
         HPWurD2bM8zegiaLwvCvER1b67lXyv+ufYFVMRsUKz6Lp2TE5u6MTC9bYUsqXxeboobg
         zeFdRCofJ3f7zhmxwaKh0Rigfkyxg5+sWYk+zhQmboI8xn5ekzCCNPuY3e2d/DhGnM31
         JBSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793891653; x=1794496453;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IXsQCDSdG7y1XG8+TdbE9NhcI3/PPLWdPr4Sx/VOURw=;
        b=xXH6sVRuHrmzEwdxVpL8A4RGJhH31/dMpJ6AzttOZxfpScgMCuMuuLWM4XLzPTDUoK
         4g9DPSVA5PMpWTbKyO+KIoRq8IMD8zsjisbP324cXpYlBHNAQjCQbCW5LFcEeip2Qgm8
         /9iDHwwFJILBYVIJQYD8IazxQW5f/3hEOqImtrC0obvrZOVO4Q4hI8ikQ6CyKS/rM51L
         /XoHWqPa1mbcwKtONsY5w65g75+vshKdcrZDJumbziDt/NbWpSdebCtd94V4pl69IQOU
         pbQ0Y8vXV6SK1jMlTJhohtAZxL54YcOw71uMia9IOLdcN9cjw0qg8RwUIsUFZQ+2hp42
         RL9A==
X-Forwarded-Encrypted: i=1; AKwUvBw+/czulgLAyel4UZ+ByRqtqNe9PjXx73eHHHylJay56SRhd44xaL3iYwqW/1xvIG6ZijuvijFz89CvxlU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/HtytBL6KnB2EyhkOkqkbIoQ0aSX1lj2T18y8IjTqiMfgckY4K
	KEW/HNV/YGTxp3zwuujBuMHZ8KwwLIMmPzWLH3EuYOqFBOo8O6K2IAV17f+2pDRT7yg=
X-Gm-Gg: AYBFou2607Z+L5K20JpwfPE5ob0JV4NJ2jsBvUDH78psnMEo7h5Faw1z90NE0BYQeHy
	O/D7PFEik+zLrpdGccex8OR6vaQmPrbsAimk2inWV5V2pzEku9mehDIUb08pE3GUNA9ote5bIzd
	y4dQhYgXvjKuRwSak5OpF3/OV3ZaYg6QbRnJFbPGWfZYlcxCQcoWRRXa48pz4kNmXmDQNqHsSS5
	i1/xlBKSxKt+2hfaIzLkjNThooRymIAlvT28TK9CzC+2sX1Zbq7EuZ2uXak5zUXjwUntAPrOU86
	qijMKABTMrBCTfnWb0OcSdILjhsWOsWCzofoOcmI2qWJdHmdd7qiFuov3vFb496crjO2xFs36Kk
	8/dBla+PaXkhlhCiHHKwOkoSAVxKq9xEZ7mnxSPafdFvaWQcn6WMbw1G5vHjs3CFMyj17pgLVOb
	UUlNwwqdf4V7WLk/boHmkEia2LbSlROmanhp1O25URCU45gdL2D6y8d2KCAf+24+aftNh03C08l
	ej92cZwqDLMSiQrwAhPHIv4xNh4+30kSQwAkVl8pDxynBiXx+A6X45zLWuU0d4BlkFbcys96UDX
	KoF7EJBl9RKyezVxK6Vrf3yPtAxLSVPKejNDA/AUGDLFnA==
X-Received: by 2002:a05:622a:e08b:20b0:54b:6814:ffd5 with SMTP id d75a77b69052e-54b68151baamr62483211cf.48.1793891652813;
        Thu, 05 Nov 2026 07:14:12 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.251])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-54b100ab908sm53756371cf.4.2026.11.05.07.14.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 07:14:11 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 05 Nov 2026 15:02:30 +0000
Subject: [PATCH RFC v3 38/90] uprobes: cope with a new task that has no mm
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-b4-cells-v3-38-bc9095937a84@toxicpanda.com>
References: <20261105-b4-cells-v3-0-bc9095937a84@toxicpanda.com>
In-Reply-To: <20261105-b4-cells-v3-0-bc9095937a84@toxicpanda.com>
To: Christian Brauner <brauner@kernel.org>, 
 James Bottomley <James.Bottomley@HansenPartnership.com>, 
 Andrew Halaney <andrew@amutable.com>, Jeremy Bingham <jbingham@gmail.com>, 
 Tahera Fahimi <taherafahimi@linux.microsoft.com>, 
 Serge Hallyn <sergeh@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1793890933; l=944;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=asYZFy7hjqvikRZWFKWfSCfamB5AQy9/u+56vKzjgV4=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QGv6YniprB6w8Vm654PinKGYHdMJvsfa/Ng4Db0H8gcBHDq7Ki/rpw9PFMekPD325bHCG8UUOCz
 JiPvyE/o1kA4=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

If the parent has pending return probes and the child does not share its
mm, uprobe_copy_process() copies the probes to the child and queues work
that sets up a probe area in the mm of the child.

A task that is created without an mm does not share the mm of its parent,
so it would take that path. It has no use for any of this. Return early
for such a task.

Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 kernel/events/uprobes.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/kernel/events/uprobes.c b/kernel/events/uprobes.c
index caf444762a27..af378f228d5c 100644
--- a/kernel/events/uprobes.c
+++ b/kernel/events/uprobes.c
@@ -2185,6 +2185,10 @@ void uprobe_copy_process(struct task_struct *t, u64 flags)
 
 	t->utask = NULL;
 
+	/* Nothing of the parent's mm matters to a task that has none. */
+	if (!t->mm)
+		return;
+
 	if (!utask || !utask->return_instances)
 		return;
 

-- 
2.55.0

