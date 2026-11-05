Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793861002;
	b=NG7sC1BwFbu4AhF8cOfrJr5IEE91+KHbns1AQWgJIFRqRVz2VFPWr7m582R1t0dei7Je
	 rvV8y1rcjIenTWleM7kkpGKo2KhgIrNcwmUs5wYwyeDlIW9+mo8N/5LYltdfyqgHbsA2d
	 x74S4Cmvq/vpUEyeT1pdeCxKht0Z+abqgRYfrW02jqxgiP0tIHyrakKivI6OpFKlovJdd
	 sE/BJL1+Ccm9FNoj3vDwjqeD0S0f3OSWEgVNT+xZwh6qb24eu9pTTKoH7QheovRnaG4td
	 8pv66PC94c5nUPfLho6FRjZ+Q1fAaTqAdY8AHn3qmtEfy52Hr/Ok7qyd9x44OawDc9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793861002;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=HOKhZ+OmEJZ1PLckraBlLABqKVAROM53Rmk2rUoOxt0=;
	b=SMWyTcotnnM3OverTZgt7saDNWu/FN4qb3BWTXk6WrP0KKzd5RX+/D12KJE2G5omPpFd
	 +xSlsz3mIwD9YzW4n+kofmbfAgdY2K+idn6x5FKTZ8irv+iKc8mMckebPMkIVMPLIRfzQ
	 t8CRfKQci1C8YDmFQP1HXR8HnXxJuBFhyFCbnDbxQ3fLD0ULzXcpU1/+RtUE1daz3Vxdy
	 /KU96QFbGiVnyNRmD1Gw5o4rWxdSZqofo8ogmRk+Kv7FIms3m7K7CzS/PetuSqaHnn9UU
	 W9Xl+KIVjXHdUKKYIfuwmdL4MoTeoxrxelmGPtIjpJffM43cXbnY4m76lFDSIrsU9Sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MuKVEH1x;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3AC9606D82E
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 06:43:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3AC9606D82E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MuKVEH1x
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3514b90bb89so2952011eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 22:43:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793861001; x=1794465801; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HOKhZ+OmEJZ1PLckraBlLABqKVAROM53Rmk2rUoOxt0=;
        b=MuKVEH1xUqrYC1GjaCSZWWicHXAVCUiBM0uO0SW52JjbYMEzebJ4dm0N1HIEnLJ2U3
         QaJL4Js/NWHXLTqhHyqTkdoPVj+P7xA5C+aGVvan+NZ26FYSU+dH7lvWM3iuPF+9e+rU
         Tk2D2Bf4yIagI+gYv85Ac2U+LA4BqtcFBDu1pAoKRBYIe0GjHctSARx1QaCgXuPJHHbV
         YuGCistEpSmWOI+2O/wy8puh2khrR3GOL3eQuI2H6a4Ciki818ZnKt96GySPXlU8HLAi
         vjI5n0La7WeUS+jIgQbfOxypVMCoed52c7Gj8cEk9jIcksGP5wftxWQl/GyMpbPxubF2
         O/Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793861001; x=1794465801;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HOKhZ+OmEJZ1PLckraBlLABqKVAROM53Rmk2rUoOxt0=;
        b=oxb7pJEht2K0Pg/Jgntk/F8kwcnGIvkCgZw+rKBcaFdorFWybCBiL0lscVipjStBvO
         WZP4/VqrqV1N5i5XxCaDZWOaOYbeiBy6KdOnNbl9vw2xnH+DU4zp3UUHBKYR+dILPAbN
         WAO/HxqiT2d6lpG5bwiIHQ00wvGMGi2kvBFl8/Obl9B7YU16szngjI3qaRFZtkgJ0vy/
         JuNAjBDkvyyVppHrWmsC9I2+6+pHdGFcVHvsm9F2FPtCUvFlrvmtNZaOzHN9pa4z6A0Z
         RVX3xFi7mcjn27SowJQoVtIgV3iOYF+jvBsniIO1X7SWHrvUZjXnGu0i/ZsvMB2jsvyr
         3Cew==
X-Forwarded-Encrypted: i=1; AKwUvByW+JqWfOE365mMMntVliydztsxXheBU3guMKfU/NMIMWdgNtdt6/rxhcN253/JUv3YyqoakNqZqKKEcw0=@vger.kernel.org
X-Gm-Message-State: APuU4Z970dXuAb4lA3PKdHEWXvlYeWjy1EyY/jOgtlpj5+WCdKbuW9Uh
	kX0UKYt4NlwGo/phRSS+cCaehmnnFwlm4YGoyyL5gdUV+N2xf/h2UbVv
X-Gm-Gg: AYBFou0wTbPP5EJJQkYiNZarOd1hOWtD3JQcToHbhe7blOR+NLc7SrmD9fNYJ9sbjP9
	/Jm37YJoWOSQUuTDVtHCubCaUBTnUVmm7PffrawFXXfg6/W7fPm4jPZwF2y7awtWLOeLd3DuVpT
	85wtIQkA5UPVfrIeAlQmjdgVBQS3ZdwX9sI2qblLSaFUWp0FjlVRUvf+Pb3lf6uZVXYqnkIMRFH
	SZkNF6kTXs/wj/6E02WCeLKJn79efFmblladT81P/e7lvAOo2llMbUtN0abbSHShQ299hB8XSxk
	RdGYmiFnE3mGqDRpwPjIjsJuaiVVHQpRmA4s3WGjovtxOyyvOiAEFMVonqebwo0BtDDnP8Dd6B1
	dZsHifLHGFHFFeabLCSLGK8qu7LRvUWJAZ+B2wiF+RYtTZbrMIlh3f2a7hWR//aGWhbebVeSnW5
	eyFqIuuK6JtJ4WjjnJw/G00LDn8k/SOg3k96qhgCdLu2Q6wi3ndwr0O10HY771zmIH5L/HyUhKq
	CIamrMrr56vha8vcJEsqfAy6ToY+Cq5L7/nI1Y3qW8d1VP3dLdpJQ1GffJmcobnQXdpRCwHW4wW
	fbSGEg8Ae7JnlicXnWkgz3ZFiaI2m3ux6j5zkpZ8A4gagNtB8fb5UO9uO5CggUX7Qjdqj3xCogo
	=
X-Received: by 2002:a05:693c:4159:20b0:351:29c8:643 with SMTP id 5a478bee46e88-36a423a8b7fmr30063206eec.18.1793861000822;
        Wed, 04 Nov 2026 22:43:20 -0800 (PST)
Received: from kernel-dev.multipass ([49.37.221.53])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca3785430sm19435759eec.3.2026.11.04.22.43.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 22:43:20 -0800 (PST)
From: Gobi Durairaj <gobidurairaj@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: atomisp: fix block comment style in sh_css_sp.c
Date: Thu,  5 Nov 2026 12:13:12 +0530
Message-ID: <20261105064312.360626-1-gobidurairaj@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert block comments to the preferred kernel style with a leading
"*" on each line and the closing "*/" on its own line, as reported
by checkpatch.

Signed-off-by: Gobi Durairaj <gobidurairaj@gmail.com>
---
 drivers/staging/media/atomisp/pci/sh_css_sp.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_sp.c b/drivers/staging/media/atomisp/pci/sh_css_sp.c
index 2beb7168517f..bb916de3dce3 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_sp.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_sp.c
@@ -266,8 +266,10 @@ sh_css_sp_start_raw_copy(struct ia_css_frame *out_frame,
 	pipe->copy.raw.max_input_width = max_input_width;
 	pipe->num_stages = 1;
 	pipe->pipe_id = pipe_id;
-	/* TODO: next indicates from which queues parameters need to be
-		 sampled, needs checking/improvement */
+	/*
+	 * TODO: next indicates from which queues parameters need to be
+	 * sampled, needs checking/improvement
+	 */
 	if (pipe_conf_override == SH_CSS_PIPE_CONFIG_OVRD_NO_OVRD)
 		pipe->pipe_config =
 		    (SH_CSS_PIPE_CONFIG_SAMPLE_PARAMS << thread_id);
@@ -702,8 +704,10 @@ sh_css_sp_write_frame_pointers(const struct sh_css_binary_args *args)
 			err = set_output_frame_buffer(args->out_frame[i], i);
 	}
 
-	/* we don't pass this error back to the upper layer, so we add a assert here
-	   because we actually hit the error here but it still works by accident... */
+	/*
+	 * we don't pass this error back to the upper layer, so we add a assert here
+	 * because we actually hit the error here but it still works by accident...
+	 */
 	if (err)
 		assert(false);
 	return err;
@@ -1233,8 +1237,10 @@ sh_css_sp_init_pipeline(struct ia_css_pipeline *me,
 	sh_css_sp_group.pipe[thread_id].port_id = port_id;
 	sh_css_sp_group.pipe[thread_id].dvs_frame_delay = (uint32_t)me->dvs_frame_delay;
 
-	/* TODO: next indicates from which queues parameters need to be
-		 sampled, needs checking/improvement */
+	/*
+	 * TODO: next indicates from which queues parameters need to be
+	 * sampled, needs checking/improvement
+	 */
 	if (ia_css_pipeline_uses_params(me)) {
 		sh_css_sp_group.pipe[thread_id].pipe_config =
 		SH_CSS_PIPE_CONFIG_SAMPLE_PARAMS << thread_id;
-- 
2.53.0

