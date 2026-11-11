Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794434256;
	b=nYZGf5wOuuNv06vY5F34FoSV0bL3tye8OIAq4ZsaxUbJ3rwbxwYpMBmXfAisCS1z2Ezj
	 HRpeK7AkZbOiKcsiYffsX3pMRIfjz1t5jt5wzwH0uV1f3IZ5c/9luEAFarsnsGEL8Oy17
	 9oJzLmdThlAr5Qel7tJvo3ch0yr4kPRH/g+mTiDgw1MBhocpNi5v5AZjgf4+2dbI2lpm5
	 06NUkHAQG3iJzoGzGGL+IfcGOhj6r5gPmEqiccP3uOZg4XKmOZ8Tia3cakIxjFOuzSYF5
	 0LdO2Faol/9sIaxPvYDrsWZTHpcijRRFsGolWT+3P8VxXS+GPyX2uvUh7Y+/+JFF03w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794434256;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=SpxeEyGCBIe2pmFodowG7QVxBvAwlFcEp0A+XN+w7cc=;
	b=edVyup/4WUYnyTwDACSOvMgy8t3TdBR3XeHyOXrKo4Lcj/HTBDcp3crhIwwJXA0i4dyG
	 sQCoFirhXtj621iLWHpUcXDbGvOlqymwT0KpRwj0GNbvyYIaMI5PV4DXQgvxxUaZxfK0c
	 03NnGs4xZ2j0V3ZLobSlwGi8rNahErhnFVJRCY6JDgl0KZ/UjEI1elQIs1lFw2sD3c6Br
	 2G0ab3NnDklmwoucFgK32kMlhQn2mc2/PY8W90Nybxq0OInNNDIq22khXp2UQg4Oq/N6j
	 elDlpOiGrXIQfihGhVNOXrnQ9tkjb7xe7ZzCOMJoesiuO7I9SpBNB8i2NurQCJ/33BQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nEQlVa7S;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 775CB606A327
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 21:57:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 775CB606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nEQlVa7S
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-36f6295304dso4432219eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:57:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794434255; x=1795039055; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SpxeEyGCBIe2pmFodowG7QVxBvAwlFcEp0A+XN+w7cc=;
        b=nEQlVa7SBqq5wJgUoTQc0s6JCfis1TV1le55JeVM4syZGTmNngYzCg3Zyltd0lK+Ox
         XTKKuObijblBkqafA7E8qpcMVg62I77jo49rqLT640mDOr9OUoofzd1h8qsHDMTm0q77
         lNm74rfCLHwzuwDMmZo4D5pXFiPlcA6DA6aDeqhT49PhrCpV7+gkzCbpUmap0O8qbkV3
         /EEwLA9ARHl05MSOrb3woRUXjJkDJMF4Z7gvqMCIKQs6ZehuENwy++kvYFoO3pQxKspH
         j3bwqpvBow2fabNc5eoWT0Y+H90vaRhaLbv9TC9dmouPLwV0a5qzRg4XUeOyodmKItH2
         IYZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794434255; x=1795039055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SpxeEyGCBIe2pmFodowG7QVxBvAwlFcEp0A+XN+w7cc=;
        b=XgiuGl754C6DfQ3pyQeSWpI60URuWBROF4FeszJlPAOx9Cgm8o13FX9/FlzmhN+9lh
         Fh/gO4HEzyMR1I1A26NWNl+4lFWd3XocX12ePwcLkJA/ZsSUhL+MfpFcWcQiKXhBUi0e
         Kpqu1BGdx5dNyuyi4h1WxbBTzRnx/M3PvVTWkQGZ5jgB7w8w0hcHAkA2YEDhYTfueq0S
         k2qG0xCzHT0rHVgEk2vCj4kztymuVQuuc39SUPFAkrvYJQjjSGHwcT58H/bjTK06CbzU
         fWTe17gtY+U4iI1Xx5Ua1ZwuA+Dxo5hUoqrPx4UsiN5kyEIFe2NeOwdvBd4PwruVMPiI
         gd3A==
X-Forwarded-Encrypted: i=1; AL+hErGZNQ5NPls0qA6H78UXRXgJEuHahdLhH+Z1OWQxvOe3ziMlS3UBFKGLHyxo80K7J0vIykFLxBbKe2pUH2Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z/4jcy9ufCCvSNvHnQFAvPX+fwq3IONFWg0miYq3CRRGQcShwsc
	STp8xzDLIYhu3xI5bvJCQgUmR8xSeEmxOBcr5XxCnXvgKys7ZeB6ujQ5
X-Gm-Gg: AYBFou0su3u6UN6lLXh8duN8bKmZe5tc9/R6/7eBvtbR9/mh/PGGVCdRSroOYZWb36x
	Y6RNcEyIAcHxTWh/kkKuvvMnj2HePRWPATywySgiDXvUFydvV/JqlXf7UYddv1PuQeQiO8234GA
	/+WHNblMko9AXRbWEG/0GX3cRmsc5ypfbscmX9ZhstTrnmViOMq8fNUeDNTrYtv2GA+G02QZmrQ
	E0xw+3f5h8EwyydkOXo3C6UOIkhEC/dlqdxVbsIK/vyRhZ9J1mRhu2/Wtwwi7nD3ezYMA2k6VEB
	0gAoAQCdiWw3xz9ofPyaRkCcc2gbcOiZumDW426op8AoIkTWS4IiG6bA8rYbn+kEyQuvH5KvB2l
	hqcZS9EUAX1ij4Jwb+xLiUx+AYQGWjeIPYoJaSDWd/of/YHTsDfuDe7hNvHNAc2GBPJJNdDZ6+i
	YQL0tfOPGEzvMnvNAOm0mBgF+/trOhk31V7x4/yd2U1MtJwxu4ymFS7csxK7BppNvInUrsBOX2Y
	FXp0zmmYPRnRHdHk6vfGtC63afDeKtJ/DKdgbJL4l9W3lCkpOZNkLKyI32jXZrQaYtzTXdnbL6u
	KEYFWTbjjWF17F0/nrJjTOtMvvPBnreOn2L+WDibcLxAYiH0MrNaBR9sqtviMKDLeigUTfw99L6
	LT53xpBJsgcmA6w6xIg==
X-Received: by 2002:a05:693c:60cd:b0:369:f18f:3492 with SMTP id 5a478bee46e88-37686d38d9dmr5076667eec.35.1794434254626;
        Wed, 11 Nov 2026 13:57:34 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:eb83:637b:7b26:8dfe])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751dae6377sm17823523eec.3.2026.11.11.13.57.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 13:57:33 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Henk Vergonet <Henk.Vergonet@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>
Cc: Oliver Neukum <oneukum@suse.com>,
	Martin Diehl <m-diehl@gmx.de>,
	"Alfred E . Heggestad" <aeh@db.org>,
	Thomas Reitmayr <treitmayr@devbase.at>,
	Slawomir Stepien <sst@poczta.fm>,
	Jie Wang <jie.wang@intel.com>,
	Manuel Ebner <manuelebnerli@mailbox.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	usbb2k-api-dev@nongnu.org,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] powerpc/configs: drop CONFIG_INPUT_YEALINK from ppc6xx_defconfig
Date: Wed, 11 Nov 2026 13:57:22 -0800
Message-ID: <20261111215723.3802209-2-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
In-Reply-To: <20261111215723.3802209-1-dmitry.torokhov@gmail.com>
References: <20261111215723.3802209-1-dmitry.torokhov@gmail.com>
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

The yealink driver is obsolete and being removed. Drop its module
selection from ppc6xx_defconfig.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 arch/powerpc/configs/ppc6xx_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/configs/ppc6xx_defconfig b/arch/powerpc/configs/ppc6xx_defconfig
index 8aab229fb909..29acc77573d6 100644
--- a/arch/powerpc/configs/ppc6xx_defconfig
+++ b/arch/powerpc/configs/ppc6xx_defconfig
@@ -537,7 +537,6 @@ CONFIG_INPUT_PCSPKR=m
 CONFIG_INPUT_ATI_REMOTE2=m
 CONFIG_INPUT_KEYSPAN_REMOTE=m
 CONFIG_INPUT_POWERMATE=m
-CONFIG_INPUT_YEALINK=m
 CONFIG_INPUT_CM109=m
 CONFIG_INPUT_UINPUT=m
 CONFIG_SERIO_RAW=m
-- 
2.56.0.567.gdb80ae8cd5-goog

