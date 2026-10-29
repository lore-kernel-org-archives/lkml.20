Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.129
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793280619;
	b=LK3g3QDUCInxNh4r3OjZLhiRZ/PN6KlXil9lV9hBPVxBm9EL9qHWV57KojQRBT31+7T3
	 q/UfgvemaqJSexZt+1JfGhvVxnN9Hz09ucyUUVNyBSOe5VPE1l+/ZDk6IuHCsqCv0hPYN
	 m7UNGtOT9EkawgzbY8BJ2aFr7J9OiQL2RnDMimP0297TizW/W5FPnbB7M0gXlG4fVcb5E
	 f8aEWmCozS2nQ/I10s9l7sESg8c1LBSQeYT1bazo5X9WkSolsemFbSD0BgYPPLSI3HbdB
	 elx+urHEbGq9qt5RnGj2dTt5yZLhblKHKL50uxl2NoXHo3LcEUraoCWntrMazngBXbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793280619;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=FK1NEp7KNqNkN9kw4sF+qFm94iQIH/PmZZAd7ktbsQU=;
	b=Q2Hpp9Uh8pctuNl5/htzrU2NLClqJE5M3k5/llx/fr5s7Qzc0tzoGrf9txn7/Uri5KZ8
	 607CJ11z0zUAk8CYAWspiVZpD8qZJwMwN+TmRyjwEekMnKgmLXI3b2vqEq60HW7PPaGuW
	 RCEgTcGLc5xK4KaURJOxKaXo8wNx75Sf9vHz187Nf8WCpI++vIKTib8G9XH4b0VB4ogHr
	 8W7UIsu+Dbr6Dkw3kQT+yN8Gn3Lp2Oc3IBCHCaQcWmsVhyqRTyO1q1MlA6jJs6IeXjUh4
	 lduDN/CvY0/eK33qp77a1rmc+ai1sPSF/Kw5XSPfy1QCaEDSdJYuhVVTAEXuaaimKMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TP0rN4nH;
	arc=none smtp.remote-ip=74.125.227.129
Received: from mail-pj2-f1.google.com (mail-pj2-f1.google.com [74.125.227.129])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15945606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:30:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15945606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TP0rN4nH
Received: by mail-pj2-f1.google.com with SMTP id d9443c01a7336-2e876f468e5so1185125ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 06:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793280618; x=1793885418; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FK1NEp7KNqNkN9kw4sF+qFm94iQIH/PmZZAd7ktbsQU=;
        b=TP0rN4nHLQ1fB57H62jKG4PP8jAKAyi3uopqyZO4N6PtzC2dD8jg4dpauPdJrLFsQ/
         6NY8asEy/okYbK3YqTDLb9hzEpRQFqgPEPdCkRwFEqmkgWfwVyvjTXUb7F1aVx5dRnNW
         FNaQnkS6HXj+JfvIsA4Bwv/Xd/gXvo6bjEK8nH4hBACXP9bhM2iURYU3yq6oCvMb5nzE
         ocmCqg8hMNKK54alNTlT13b6BVzDNiXlp4VGn+1sdufrXLCAdIqM7UDJZtEr6gUoOymv
         7bu7CNI2kHCNUlR2qZks7V6UTWVbFotYg4l7R/FoBT+fTYnylC7dzrcjg5zj9cIsfY1i
         knHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793280618; x=1793885418;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FK1NEp7KNqNkN9kw4sF+qFm94iQIH/PmZZAd7ktbsQU=;
        b=GRamUdkdzI6yXWz+C4qSDSUF0jJ3L9aL6tqu5SSB4dUZPRaXBYSyswEmL4ZdPMLEIx
         KaPtfH1WcMEaphF3i0qPd+E2cHsJr8tUXR8KbrCoTR3u4eh34qSgCk7ek1092Cc9q0A8
         8Gm9Sp8U7efCF7zSdt0LAlvcHSrPCF95teJA+yLC6yy7AnutYvfytq0F1PQuBK1DoWwX
         REQhdm+ZUBV+ku7J+LlkWNz0Slzuu1+bcvGG0/FAaDE/49nZPHASrIiqq6L7J/EGpQ9a
         iMkCq95wc0U989FP2XtCZgvYEJGFVXg5vRUb0bSXa0/ewZTt8iLPg9VICiylIDGNtum4
         vHJw==
X-Forwarded-Encrypted: i=1; AKwUvByKIAhqyEO/sJgxO5oJzSA1Hye8oKILHFsjzEtFnFo0/b1Q/e8nXV5EGHYXcD3/muIF/gwQ9jvQBaDJ6yk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ+p51xNbrdoqFk8QtDW96lEEpryygJMw7KNjhgISM8QHROT4Y2
	9AdZJ+9RXjIWXLMDnMposNVxU4k9QbRlR67dqPI5PFP2hU82m0trGojEwmwYxcVMnAk=
X-Gm-Gg: AYBFou3jr2n2hgQKLNdNXQQCMjBr5EBKkbjvrLRik6UZzuyfzIWsPGd2rIvvQUyxzM5
	0ml7lEhJmqrCg5F/mjtLJxn85rkTsm/9CwK8yoowIpnkG3EBgw+xpN/Q1dIxHFMB9DO0sdzNQIt
	78gjE6txbqDVy0Gxqi9RXlqSC1AzNDzdfQuwZLQv2GNYkcK/AHz1c8xflQ6e9F1B9uUMMSC/piO
	U0P7atUYObujXk0SX+RliffGkiunQPXI0ZpGTHUdfKIydZUiLhJ6u6wNrq0ge0UH2WZRY86p0yq
	sxVjVVbNHFA0L2C1RiF7aq/T6I2sug8PcD1VOi7kKU5KHCwKUTIbGdhS5akv3rrLFjBTIB3qodw
	bhEZFbwTHct9SUERSTk75zJ4onT/Yk4JiV1U05D1MAQK7Sbw0c6fFuv17vI9Go5E3hi0f386f9e
	93iQ/ymYVa8xe2q1djbkfIDijYpnExbTjbPpAJzrPKIm2azZnEwlC8aoMvp77gxOCX85HTkcsqb
	E+HzMsAs3ehdYfjswtFIA8P5+tu8jry5k0r4+rSUnwwViblW8Yx3l8i+NSX4zIuxfCOsj28LQMA
	ZK//tZVaGLzht+UVfR8twNgrAQlQwQdJyEJqww==
X-Received: by 2002:a05:6a20:2445:b0:3de:7bd5:fb47 with SMTP id adf61e73a8af0-3e9023a4ad3mr4982964637.39.1793280618265;
        Thu, 29 Oct 2026 06:30:18 -0700 (PDT)
Received: from archlinux ([2409:8a4c:cc3:2931:e1d3:ace0:b5ce:fd44])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdacd6aeb55sm4068530a12.7.2026.10.29.06.30.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 06:30:17 -0700 (PDT)
From: Jiandong Qiu <qiujiandong1998@gmail.com>
To: alexs@kernel.org,
	si.yanteng@linux.dev,
	dzm91@hust.edu.cn,
	wy@wyuan.org
Cc: corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jiandong Qiu <qiujiandong1998@gmail.com>
Subject: [PATCH v4 0/2] docs/zh_CN: update translation of doc-guide/sphinx.rst
Date: Thu, 29 Oct 2026 21:29:39 +0800
Message-ID: <cover.1793279600.git.qiujiandong1998@gmail.com>
X-Mailer: git-send-email 2.55.0
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

Hi all,

It has been quite a while since v3. Thanks to Weijie for the reminder,
and to Dongliang for reviewing the series. Sorry for the long delay
in sending this update.

This series refreshes the translation of doc-guide/sphinx.rst.
Since the updated version refers to process/changes.rst, I also add
the missing zh_CN translation for that file to ensure a consistent
reading experience.

Changes in v3 -> v4:
- add changes.rst to the Chinese process toctree and remove its TODO entry
- sync changes.rst through commit fd5425b67355
  ("docs, resolve_btfids: Document kfunc BTF annotation emission")
- remove Assisted-by tags from both patches
- fix a typo in the sphinx.rst commit message
Changes in v2 -> v3:
- sync changes.rst with the latest commit.
Changes in v1 -> v2:
- drop the separate llvm.rst anchor patch
- remove the `_sphinxdoc_zh` anchor from .../zh_CN/doc-guide/sphinx.rst
- add Assisted-by tags

Link: https://lore.kernel.org/linux-doc/20260619140245.1982921-1-qiujiandong1998@gmail.com/ # v1
Link: https://lore.kernel.org/linux-doc/20260621131215.1303439-1-qiujiandong1998@gmail.com/ # v2
Link: https://lore.kernel.org/linux-doc/20260706151358.2103703-1-qiujiandong1998@gmail.com/ # v3

Jiandong Qiu (2):
  docs/zh_CN: add process/changes.rst translation
  docs/zh_CN: update sphinx.rst translation

 .../translations/zh_CN/doc-guide/sphinx.rst   | 167 ++++--
 .../translations/zh_CN/process/changes.rst    | 528 ++++++++++++++++++
 .../translations/zh_CN/process/index.rst      |   2 +-
 3 files changed, 662 insertions(+), 35 deletions(-)
 create mode 100644 Documentation/translations/zh_CN/process/changes.rst

-- 
Jiandong Qiu <qiujiandong1998@gmail.com>

