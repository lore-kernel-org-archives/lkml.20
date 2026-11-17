Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794892464;
	b=ks2W6avnowQ6orjOZBU8frhtcovOjoRasrblRt6eXIEG5iNvyzTUE4FEbcyJjoMEe+Kp
	 UZjPIMfFp8XSLBKUkG4OU2FKYFMle1aT9yd100EJorfO0608E4l6zNqu3sa9ltPXaka/K
	 ylGjeR8WUcavzQZuq1AH2WVKbkMGNFAPGHarYIAfnj+uxEU74e02Qax3e+M1hoQxwn3Ik
	 R/aWMggUTv1t/HF/o1G5AxANfRx7fS7Svv5Rql6AzDcqIIgpo39x2gjq9gtCVCGjIvdXX
	 O+8TI/9Cp/MuUy00tkdhT8ZCeVw99VptuqmkymZFVaETS4Vi7GSAM9S4oA1vLEAS6Uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794892464;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=SCfz1f0OOAQVJN2xpcPcFGbJPw3mdu0gWKPmT7oxwLI=;
	b=j0QEKnFOncK8qcFLS4l4/H76s8hiD3FJtB7Gygslit+taEWgH5wCz45kVUBHqQvO9gBw
	 mNrS1RLphY4FDqYqfJIAF4uLkMHRs9FnVb5DWhA9jthKg0pPuTf5XLjEnqdfWV6G3CsB6
	 N5a58Z3R3IaGbW5SsnMzGOi4L0GWYljPx1U1H3gYcShkU+Nvky5Qepyc1xympPKGtb+ZD
	 JAg+uUIOSDU0FxJ6kUDIGjqWoWdqVyter6hnWSMFWAy5qlYuSTDP25rJL60Vg8ZFF38gU
	 cy04RB15mbL5B5/WoReyrTbe8zqo1BjYC6/aJKaISCD7NeRP0HHrJiCRm2qe1gTb8tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=TUfHvPFE;
	arc=none smtp.remote-ip=209.85.215.227
Received: from mail-pg1-f227.google.com (mail-pg1-f227.google.com [209.85.215.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D737606A329
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 05:14:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D737606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=TUfHvPFE
Received: by mail-pg1-f227.google.com with SMTP id 41be03b00d2f7-cd6028ff33fso2352200a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 21:14:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794892464; x=1795497264;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SCfz1f0OOAQVJN2xpcPcFGbJPw3mdu0gWKPmT7oxwLI=;
        b=p6CviHopdebPIUugVdZyOv2BKWo8MMxq0EwScEl4dYT9NRurQy5fUbo5DA8Xqp3eqY
         s+etLtnFTR6g54GTtXO2zexbT8WpvF4k9/Jp960EaJI4NgCf5Jjst+AIvGqubboL7k5U
         RUHwJKmX6uqLOU7GiptbXKBv+ctwyauRYPNaJ73g3Q5SsANdWJPshK0AQPwBkLgyA/eG
         h0pOew59LNeMjKNgWImEdqRfqUMA18anz1AZqym5E+nfoOGG7ElkMKL8DRSUD4/H/BOQ
         lG9JiYrheuRnD8ZDVlPl6eY9zrsCmGspTDv66jnK1kQQ6j6HV39kJXOIFAitCOdLQHnj
         AEdQ==
X-Forwarded-Encrypted: i=1; AL+hErFdQFA7/FQDUXdqSqhpXlWJW9MKCrAA367PwJdArtc2i240A6SAXpDaMBAQ+qF9u09aUdrWs92QXqT1SI8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8tWNH3kfTakZOwum5T5yB/cVTEjzyZJ609x4jrFaAId9v1DUbt
	nrZS6lPSft6l/RajaWXhw5ofa/iJpFf9Z+ooY46pxLvlbKR/+qNahUay9w80CUcMQwQrHJv4J9L
	j/FOJmCpLtP/i/6ml5RKXUUxFQ2uPoEjoqXAr8u6oji+ExLKFGGIOsGf20tBgqh3xlzreqX3s33
	RSH5o35FKstTn1RPpEPSsUgQIgDK0VW/ntzo6z3YTyiP2uoQZ4tF8sKgwTm7zx7K5Jg8U4RRHGZ
	/phTkAdm0xVWcgk
X-Gm-Gg: AZFdTZc9T3mT03c8GbV4yMZx09rn/bo+fmGIo4+TcBb+CUGM74aOO+eZM2jaf4tf7gX
	UNz/hPDAElCsl2VLx6qFOF63RNO+OMK1kXqeAtR9qDZK1+r81FYu6/kUexVnZ0NhZx0/EwZOeoR
	f8ex/M1CsvIANHLgIKwXhgGn63CAiR1x8d1J8f7+FOVSpXvsQb+q6dEFQxnBiDStjqhqRGg/StS
	rlvEhUxRfqguCjpM2k8b0a5a5b2kcPCkNLoz58jiwGmhziHdH17TiuPBKmuUkzcEE2rsbATIc1N
	XHcon+TJmZ5ICf9+sxVHi4WPr+i6bxTJ+cHR292pBm17q5cl1YbGVf6mfnl6TR800pIPIcLSydL
	5WMe5ILpSJMK3kmSrjM4nR5u3DIJ2gaD7zvhqead0z9q2GXYBthkhH6/ec4R4tS5xqVm2AXZyz3
	LFVEBhYIWM4MbUkt0uYR7x/Cf6rH6o27cw
X-Received: by 2002:a17:90b:2246:b0:3ac:9d14:feb2 with SMTP id 98e67ed59e1d1-3b1b0a0e12dmr13044555a91.35.1794892463790;
        Mon, 16 Nov 2026 21:14:23 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b3abeca517sm1145875a91.8.2026.11.16.21.14.23
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 21:14:23 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b167bc8e16so3686218a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 21:14:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794892462; x=1795497262; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SCfz1f0OOAQVJN2xpcPcFGbJPw3mdu0gWKPmT7oxwLI=;
        b=TUfHvPFEraxXwRyTcV8fi3F2uwwJW7SwncnU4MSdreahoIo9cC/rk+Bj8yNLVdk8qB
         MdRk4iwksTqfnEisMSfMKXt+ZdvRjwoAQSy4OvVk6eF8dozVoWKRPDz1CevBX6u9YSjm
         YoJN/EZs7S7HO9NfWvpB1rmBpVM9L5L44O9j8=
X-Forwarded-Encrypted: i=1; AL+hErE/v/813ZxAbbiIdmS/pu+X9ctVcuugZtYayOuyM7tgfQLSeWo4wg2qTNkrA6rm5Qz4WVEzpXxnMmFE47U=@vger.kernel.org
X-Received: by 2002:a17:90b:3d87:b0:3b0:a831:5acc with SMTP id 98e67ed59e1d1-3b1b0a3a056mr11554930a91.42.1794892461643;
        Mon, 16 Nov 2026 21:14:21 -0800 (PST)
X-Received: by 2002:a17:90b:3d87:b0:3b0:a831:5acc with SMTP id 98e67ed59e1d1-3b1b0a3a056mr11554911a91.42.1794892461137;
        Mon, 16 Nov 2026 21:14:21 -0800 (PST)
Received: from vertex.localdomain (pool-173-49-113-140.phlapa.fios.verizon.net. [173.49.113.140])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efd7a586d0sm7827675ad.47.2026.11.16.21.14.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 21:14:18 -0800 (PST)
From: Zack Rusin <zack.rusin@broadcom.com>
To: Dan Carpenter <error27@gmail.com>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Martin Krastev <martin.krastev@broadcom.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v2] drm/vmwgfx: Fix NULL vs error pointer bug in vmw_prime_import_sg_table()
Date: Tue, 17 Nov 2026 00:14:16 -0500
Message-ID: <179487959553.2515856.10912427542043749089@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <akPFZ-e9usvsYgf_@stanley.mountain>
References: <akPFZ-e9usvsYgf_@stanley.mountain>
Content-Type: text/plain; charset="utf-8"
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Thank you. Applied to drm-misc-fixes.

z
