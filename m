Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794916266;
	b=vtA5uegH3ox8oTIKnp1nnkCcuNgcQGwz05qUrOYscWE8IRIUWldgv70BwHOS9Gm+WyY8
	 /tcn/v1qOizZgdu+QEJq5wXYdVsiiMZStYV+zUEW6O9yhLz1G9QunQR5JP2VOeE/knNuJ
	 l5uxFGE/NdxJ1+vxcArzVEYXq9NhkU2vX4tF1WumPPDiwYsfspSz2Vs0J6MqVb1BdXtCr
	 7rfM6X7T1RKeMCnRLbmH56+KPAC+DMBr0DtACDkqmWRGC99krNGjYhd8zyGRC9Ml2ooyU
	 JO6LAiB+B4cKZDbENMMvlu2a0aZ+53r3Imw9bp6SZ+gbxL0YW8dIxFhzElbu9UW9aVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794916266;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=sndVk1kvVcJgUJP97zm2MOkioC3KVSvDmF0LGbe4m7k=;
	b=VtYRnllkguCk1ihyfyoq++Hab7YzL9OFKSPx2oJz0Ni/W2IvHwIXG0uYucS/snO85PE2
	 UiyH2b4uYXjFXMtchUB7kMWwgZCAvoETIoj54gTRYOOAoA7coERjCfo7ysKM3UrWcNKsF
	 vkRcVDpKm73bg2SMPZj0BsbpVU24gidbKygMUEZ4ZDlGh9SiGf0/uyEyZ3dbqdgSL8Anx
	 /xaEYvGGd+0XQPmdoL5KuA9h3aAxH2FE7RBefQVCSsvIc7DU+LYOgD3VD27l8Ml6S61il
	 BAYe4jGofXJG/AANOgDmOYCvVcmjBuoxXrX5/2vYOi7eYkGif6jByCcfS3b7LVAw8dQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=PHE+DrLL;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E839E606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:51:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E839E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=PHE+DrLL
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2e987a2ba0cso27343415ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 03:51:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1794916265; x=1795521065; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sndVk1kvVcJgUJP97zm2MOkioC3KVSvDmF0LGbe4m7k=;
        b=PHE+DrLLbq+bKoyCTmhWmTE+8SzJaoyIAVtlERyzMDnRmvXx5DvcH/afLo8IzOK3Ic
         mMjakZdf/kBTWEogCavfsZfNF8Fun8K3lgdiiHrqoNSseTg6nsOJyJzeLgOKkRVYpjSn
         XCsQEdBhs7xneBlzmGbuOb5GOXBbC34P5WEwruQQbtXOwYwg7rDVfp0M8YPmYtaOwDOD
         E7N/Clxw6UgZFTpURIJdgA1jS48/1i8n1KfXeHbGRiIx7l0WrPsMC28KKZ/KbmqbNBve
         bPv/p0lGGWwRMWdV8FRYb78iaPSvJ6P9i25WW7xkZfuQ/4s5z4sXdXQhePzO9viQx4IH
         ojGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794916265; x=1795521065;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sndVk1kvVcJgUJP97zm2MOkioC3KVSvDmF0LGbe4m7k=;
        b=GvX4UFiQ0J6kJRWxG1O0hz/2C+jXNVcvXn5BNovxijNA4nrc8wddCeJahDXAI5BOWn
         OVFy8VsjWPT1HE8/X6At4ksDVdxs4YU/+6MOrIDfZgO9UdQGUL8Sd/93FeZVWx6jHgQj
         cKwfaDSUom802eaKboiP3wD8Xpzu/ALaVEBxBcc+rQRIuN4v+cRXj/as//AC6huPUnOP
         nmeLhPYOi9TmU3iA/lD9B2FXy/CgPm2y9XmbTwVaVUYyuX2Vdhf+EOvHvkyppoajdCLG
         QjOnduRn19DxYLGt3k5I/Uh6YsqdB7dYWQdZlTxcEmCyz1yBztVDzeW4MG0zeHWKjJln
         wMQQ==
X-Forwarded-Encrypted: i=1; AL+hErG0YKRXxu0xR2uzC91iW8XKvHuqZXA6LBIkHn1y102sklu1FZgKmpJJ8zqXteXc8rNp5oczcpCtJdz69+c=@vger.kernel.org
X-Gm-Message-State: APuU4Z8gUcD/2sFccYrtQ4nWb2t6gkz8rURCz+95q7o6abAN+tbvcSEX
	T+pA6HRBVInd6hSd0LXL1KoJaCQYDu3KU12yLmy59ic94m4lEn0n9GTnhoLBBAu4hug=
X-Gm-Gg: AZFdTZeK5LuZf0KDrMKmTwwwg/C/6bgE9+GcrBZlKNaSHnpeTIjRa04JK1CvYyoX4Gy
	9TCRjzIBM72afzhjEwFoy5ExZv6Tm3yrgryQfAOJb6oeW7cXkT/yo8bdVSvkxJw4+/66VsZ0m0u
	pWiWO+BAwH7OximhtomMUbVDQ8PqYS/aFfyvr3loFXhTEph2fYf3mycx6FIfCGgnAQhPlFHTfQe
	z34wbJwDEf9jgAtbiv74V3ZEvthPlYhHhOiZftU9Q+PsBHwsyrb73Yq5WMHToCSUM1tgeEYw8tr
	4q2vMVCVmh2qHStmUkYr8q9GuQNNi8BN3V6AIjw3zfbHto069q7cnyxyx0SEOEYm+YlPwtza17J
	pUTEXhQJHmAj6q5NvwBHBevv4dBQQpV2SC/3vUdtL2K3LMf2cQOWK/S63EfjCgskfBAJIVKmc4J
	W/x+zHZ2KVDNjLkYx7G9F7k5PByz1Q/baqvRlOvwpr/y+byqC67SQ0kM4Sb/bR/xJJ3u2yL2yg9
	1HyG8ATn3oDzEow1EYr2kipDveZMbnRSk8lq+xtwG481/ixE3M2LwmYIdzKz2oK/EWdHft1WDt3
	wGQcU/CaiMG1OkX98ZseNgarKN5SekpQDOpE2iywSHveqGaOAsfNbLe9DQsohdKBWv449ywIRsZ
	16NwrTaGUDRctZ5sXnCweCnKpzgaivkpQnp3Zf/jM14rmb+fUd/1wKLvWOlb3
X-Received: by 2002:a17:902:dace:b0:2ef:e547:e0cd with SMTP id d9443c01a7336-2efe547e397mr10611265ad.31.1794916265316;
        Tue, 17 Nov 2026 03:51:05 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:73df:c7da:8e76:82c5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efd7a88a55sm14107085ad.65.2026.11.17.03.51.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 03:51:04 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: sashiko-bot@kernel.org
Cc: lduncan@suse.com,
	cleech@redhat.com,
	michael.christie@oracle.com,
	mkp@kernel.org,
	James.Bottomley@HansenPartnership.com,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 4/4] scsi: libiscsi_tcp: do not accept a Data-In for a finished command
Date: Tue, 17 Nov 2026 20:50:58 +0900
Message-ID: <20261117115058.1955891-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <sashiko-outbox-218654@kernel.org>
References: <20261117101500.1894608-5-yhlee@isslab.korea.ac.kr> <sashiko-outbox-218654@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Both cases need a target that reports a task management function as
complete (ABORT TASK, or a LUN or target reset) and then still sends a
Data-In or a SCSI Response for a command that function covered.  The
receive path handles PDUs in order, so a target that follows the protocol
cannot produce either.

Neither is new with this patch.  Without it the late PDU is accepted the
same way, and iscsi_eh_abort() says in its TMF_SUCCESS case that it does
not stop the receive side for exactly this reason.  The patch narrows the
window rather than widening it: a Data-In whose header arrives after the
task has left ISCSI_TASK_RUNNING is now refused, while one whose copy has
already started when the task is failed behaves as before.  That case
belongs in a separate patch.

Best regards,
Yehyeong Lee
