Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792951407;
	b=HPvR+VYucyfIXyU9Xq4qt4+n+jEgXJEndH4Sl1YJRDn7cN1exMs0KeGmv4wnQKErSE+f
	 5vHyQkKTbR9ah4oxtcCD9rP0kAdK5M3uNTd17D03LAM320FOpDGsx3kkrclEzl7Zs7LIN
	 Argon3hw8/1EDCgwcjtzScBNBeEftTzbzB14e4+pHIt52XJPjNMlUQHpZcbmYGsuJduYX
	 9lAc5ZGcom/4HuNnAMqnMHq3+hUNqt1OOwrZLIO5Y6p26nSKps96GmAbU6ZmZpVM/43yY
	 tatdXkOS7NCpFFGl0rG1MKc6BJGa3y8vGIkYC33Qtv428bIKltp3CtyWBfDqMuddp4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792951407;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=oGMF4Q3FKs8fn3YAByKtysFrkHDHvnUFQNs10reubHI=;
	b=XSvKwNFaTMkRLodlqawMuvOpe/EuohG+ztxSg/m24wz0fE14eV48qs2xdZmjkVKZ2xI4
	 OY7BJ4eZLtIyMZWL995G3FHbrUWsacOecqaIELY4NMNq07hTaUsAsp955DG8G7T9U8MwY
	 ogK2UOFqEcSjcXwGBVe+WiVuhqbPB3jSACxmZMSItz1mLN/Mm9q0gTYUry/WXV49T8nW/
	 kjQqf7uzd/U1Ub4ONeq7AJJAFNl3zJo9H6rfJr2Lwfz3MXFLeW1QNwNAzRDIRoatky2Ju
	 FjRf+sTpUS7MDm8P/V6RiJopyVbHBrJzAZFsgZL8Y5fSFb4I9pnaXZtS8UP7LDc8Maw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Yz3DAhZa;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18F17606A323
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 18:03:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18F17606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Yz3DAhZa
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a549cd7fd2so4176125e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 11:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792951405; x=1793556205; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oGMF4Q3FKs8fn3YAByKtysFrkHDHvnUFQNs10reubHI=;
        b=Yz3DAhZa1ioTItGzQDNf9M0ywPd9fITkrY8kdwClnU8r3li7j2PGsQtcTAdpnVaryL
         JTXKcNOhDKV6qK6UtvgsAdfGmK3ArnEEIGTwIOMm93uMNRYkg/wOq7mTvKNL335m1q/5
         f5Dl2tmVpHj7+Ncg9u/G8lpmFoJYzq3eryI+8FsxdPWV35FhFHF2SaChRXw+0J8JD6vh
         UV2glsk3BhDvC3m7CditfmOSViBdHU+TzKxjopFtOdFFI/Jt+biqXWoAkYrKrfvdA25a
         TDc8E3gWN0Q1JDTwNoTBDlePhzi5wBXQ211kIUW7isjHO1zEcoxTXnBnj514ON2iESpw
         RXDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792951405; x=1793556205;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oGMF4Q3FKs8fn3YAByKtysFrkHDHvnUFQNs10reubHI=;
        b=JKfiKdCp/VDhBBXVcPl6V5oKTbk3fC6ifdMhhpe4xU+L10jyjp9H5tPAelbHu5TrSS
         4+RFp65Pqi9lIaB/glty7JhO6sdhQRuW3ycoWmYmfUqL3CFYliExlH0CqwMDIByXDuDc
         GMccW/2vLGJNc0W7mJKDoIgpbUtJRHId0RrELFChEQCMTm2ND8uf/pG9vorngDgUvVku
         qweJ+aCb1SKzxDoAcr+7nLcZqB3tJu7CPzIY/WRKdod4qxqHy5/NdskNYUzotfEGRslz
         53svqjLqv21ihenMOsCkarqls/OGgzzqrdiGbKqYkJYKLOCnbkrab38QS8elZe52FUIo
         Fjbg==
X-Forwarded-Encrypted: i=1; AKwUvBzP1nMXmCVRwpP99mX30//qeCMV66EISE9Eqn5LPyLWD0QchCJ/s9OdmUmcVHLCumNnAeTUmUXRQ1O1hWg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKcriJGqJvn7Gi+2lfZX9GOEtom0SQpC4yGGKO1t0T+7iUux08G
	8qG2xbQSXiaRdN8wl8IT17JysEZtIYfl4IqDyOwDtSacDi8VGbyFZKDZegeu
X-Gm-Gg: AYBFou2uWg37lHjg55WH8dyhiZkGq7V10pACeu/A19fLcE18nVOte6OVIKnM7rk8m1U
	rRA7PHgwDNpj5Tc6CYuv5MeqZvYxEXWcATtQOoDawOzNGJ+SulIg97ukTsiT04unafxEv8S1gZ+
	8NrRm2Rc7e2GGT3ch4ZpKH4C+tgxrl09i05qlaewGv/q1CVMb4KuArxIdAOLlTyxw87WUm0/ibu
	sBLd2G5ECi7ghxQP4H0BPHUQmAoNnO0ROoeYLmPCihTIbVC1lGGGrCzNOhpWDjO5BQIMZ0+rnjJ
	6/Ye9Ji+rAuKef7jlvw/VdL0CMzuDSg5VsYwMSd7J9bgvWJrKZuvwAUwIzrRfBaDWDQyefj/OKH
	0/pXKGv/Du+PgkZBeodqjmZ/dmtap1sITQ2l5PX+rMkWGltzYvoUQCJqk1GTeCxUoDeY4tgLHdz
	Rv+NbT9b+bBFdjQdKr8G9P7beFV43ek1uhEIOSdZY0HhyI1IhvoJRf0vaKROTzJ1xlfWcnl3I4D
	Mmwzm0D0cja3hzuxFnG3GxhQfyB6qAWgKfAnA==
X-Received: by 2002:a05:600c:630f:b0:4a1:efbe:529c with SMTP id 5b1f17b1804b1-4a35ae9e071mr92039425e9.12.1792951405253;
        Sun, 25 Oct 2026 11:03:25 -0700 (PDT)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a4cb7bece3sm82641055e9.10.2026.10.25.11.03.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 11:03:24 -0700 (PDT)
From: Tristan Madani <tristmd@gmail.com>
X-Google-Original-From: Tristan Madani <tristan@talencesecurity.com>
To: jic23@kernel.org
Cc: lars@metafoo.de,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 1/2] iio: light: cm32181: validate ACPI object type in cm32181_acpi_get_cpm()
Date: Sun, 25 Oct 2026 18:03:22 +0000
Message-ID: <20261025180323.3641477-1-tristan@talencesecurity.com>
X-Mailer: git-send-email 2.47.3
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

cm32181_acpi_get_cpm() accesses cpm->package.count and
cpm->package.elements without checking that the returned ACPI object
is of type ACPI_TYPE_PACKAGE.  If firmware returns a different type,
the package union members alias onto unrelated data.

Add the missing type check after the ACPI evaluation and before
accessing the package contents.

Fixes: d34ca613b939 ("iio: light: cm32181: Add support for parsing CPM0 and CPM1 ACPI tables")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
 drivers/iio/light/cm32181.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/iio/light/cm32181.c b/drivers/iio/light/cm32181.c
index b32a94028f091..1528465be6adb 100644
--- a/drivers/iio/light/cm32181.c
+++ b/drivers/iio/light/cm32181.c
@@ -121,6 +121,11 @@ static int cm32181_acpi_get_cpm(struct device *dev, char *obj_name,
 	}
 
 	cpm = buffer.pointer;
+	if (cpm->type != ACPI_TYPE_PACKAGE) {
+		dev_err(dev, "object %s is not a package\n", obj_name);
+		kfree(buffer.pointer);
+		return -EINVAL;
+	}
 	if (cpm->package.count > count)
 		dev_warn(dev, "%s table contains %u values, only using first %d values\n",
 			 obj_name, cpm->package.count, count);
-- 
2.47.3

