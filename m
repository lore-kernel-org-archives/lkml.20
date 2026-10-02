Received: from mail-ej2-f41.google.com (mail-ej2-f41.google.com [74.125.228.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A5B3D76
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 16:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790957752; cv=none; b=dR7WfLvJQr8J5V5IQ+z2rH7OgDBEmWIKUl5iWMqSLU5bkzouamFrTOUUAIJDWWgtN0EaRYugJgjlTf02StfE+4yuRzXqI/1z0KVZ95YNc/3ExcpMefrvOQ+3xPdENC8NqbWtmd2e00pr8E52Kl+MNqsgZI4U+dRCX5t5kxn46/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790957752; c=relaxed/simple;
	bh=Le1SYPb2jPNj5MhF8OuGIlzFKKsBR2rEDTHPqcMQNeM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hnnTkynFWcLgTFAAzOivCYcLLCxUcYlwz7B/IJcxS/dnW0eSjKGRV4wsXMtE5zX2ZNnPEni60ROyXc2Ak4/k8Rt5b5QslI+BYvedniSvJOMW6NSwMvuWhJmkmwVuNhbbIDnnniEMThaKY6z6axw1Yy0tCYJTjnRRyWlkRzjdWZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W61Bo5gY; arc=none smtp.client-ip=74.125.228.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W61Bo5gY"
Received: by mail-ej2-f41.google.com with SMTP id a640c23a62f3a-c2e320322edso6516466b.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 09:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790957749; x=1791562549; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZtyEZmwj0f19Lpw83gnqEqbS3r4hbHydMWKTWR/TdRU=;
        b=W61Bo5gYLf5flTB6iLcAJdoKQXBqRVe69B5nIDefiy1t9DhIV8RpCeL+5g0IMk0Dmu
         kkhGXVQJIQP/jSghoZ2tQ1vs0VgAn6lsC1ywm5rfyQCyyvlJhoRKhETZhzhkcAcTHris
         Q+/IGn2FenLTCvGrjG+DCcmukmf4SKQKxNdaKOvi+cLnb7gobd+kHB/Nd4t3/wESAyiA
         nUs1Uwi8FMD/5Zt7Ir5p9aJaEwq7WDtWIDRjCWD1zQbjEecVTIxUTpyfBheUhCU0U1Hl
         WCWpss9VpHmbTzblxvU1+SQN/jrXj57PfsJsnNX/X+fk/z0wRj5qWEhar6YHKHXGWBKz
         CdQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790957749; x=1791562549;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZtyEZmwj0f19Lpw83gnqEqbS3r4hbHydMWKTWR/TdRU=;
        b=lwKEJNy5BPrZgNBx6fbAjrYGr4xRqc0d5vCWe/zWZUdQ+/oSTypiw7gz4KtAeJ3IAL
         QfoNF010r/Oo6IT0X57+IHcfal3gkPhGEqQSJxSs7SghPOSUHxQ5Xq4Qnwz+rcwXvxae
         3yhbZ1vay5/4cBJkhZexQ1OtYGJfNAGtOtvgnXunYu1IqxX8fAgoFE8jQ6q+vQYUAGA+
         s/tO84Z5C87BGre8WbwJ+3/2iKBvQStBZExm1QHg0INnYp4LentHkpjCA4zrisSoKQYc
         Y2O1LxjeTyAHKVzgzPTNJMe6eD3wujIwbzUUhvFz8JlFRWy3/4vqtniXSzqDIURcyrWY
         cKZA==
X-Gm-Message-State: AFuF++nYy1TWQ3O1Q56oPlspcW/DYCxp+07FjnP3mdcnpK8s8qob/QyY
	cIiiNUe7SVNH0GX5JSC7x7vvROMuVMYIaEdGmPVlyX3gTNlsJv8kDknZ
X-Gm-Gg: AYBFou2z0O0LK0itJ5vczxY++iUajUTIiIg0AZ62Yg6ZeA9Ml4U3VBb2lxJTl4ZclaA
	F8/mebRBpiu2yXe+ndIw0xxodaJBj2I1WYFKNs0oZN9PNIXQb5VfQ5y6rA8hREKix31AGCQZEI+
	kRTlFWjn0EOS4B8hL9Q5y1yogDYbim0u3l22TN68Q6o3nKB7sFaCLyr2oAWOL/293t5QzdFh0wj
	XOcJl2JFN4gT11WMDmLax99ebkBBfCckSkyiLGKjG/LDMIgXEegegPnMRR1RsYiUv2H7ycjsfZ1
	OFvudqupekEEyZqexYTaIK2a8kS7E6s9DxDsP5ippOj+g1aRtcbmdH/ONRW6TUgabCDbtV2Jmsu
	1XlGvLqfjgJlptqug04gucXSpWDYCR8o1sRgL+KTD6XaPZS1rYEbYeTvxaWThWVp2HbqqqizFzc
	z8df/Ln5Vnhx4drWOs+b4dI+NAPI8n+y05UNVTht64GbuwWU3dyuMpNiMK9bhO/mafgVCaoeTvY
	ajDpyOMmHznfFwp82DcMh6UNONVwGSkRjFFS2Tl
X-Received: by 2002:a17:907:d086:b0:c2d:d408:5da6 with SMTP id a640c23a62f3a-c2e4b2417b1mr256577366b.49.1790957749284;
        Fri, 02 Oct 2026 09:15:49 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e4cf5f4e4sm106437166b.42.2026.10.02.09.15.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 09:15:46 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: sparclinux@vger.kernel.org,
	"David S . Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>
Cc: linux-kernel@vger.kernel.org,
	Magnus Lindholm <linmag7@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 1/7] sparc64: return from the generic clear_page implementation
Date: Fri,  2 Oct 2026 18:14:23 +0200
Message-ID: <20261002161515.932316-2-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261002161515.932316-1-linmag7@gmail.com>
References: <20261002161515.932316-1-linmag7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

GENclear_page falls through into generic_patch_pageops after clearing
its page. The patcher then rewrites kernel text on each invocation.
Return to the caller once the clear loop completes, as GENcopy_page does.
This affects processors using the generic page-operation fallback.

Fixes: 6c70b6fc7b6f ("[SPARC64]: Do not assume sun4v chips have load-twin/store-init support.")
Cc: stable@vger.kernel.org

Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/sparc/lib/GENpage.S | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/sparc/lib/GENpage.S b/arch/sparc/lib/GENpage.S
index c143c4d1de3f..6ce11108e143 100644
--- a/arch/sparc/lib/GENpage.S
+++ b/arch/sparc/lib/GENpage.S
@@ -48,6 +48,9 @@ GENclear_user_page:
 	bne,pt	%xcc, 1b
 	 add	%o0, 64, %o0
 
+	retl
+	 nop
+
 #define BRANCH_ALWAYS	0x10680000
 #define NOP		0x01000000
 #define GEN_DO_PATCH(OLD, NEW)	\
-- 
2.43.0

