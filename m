Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793964954;
	b=rpcXFskZNQ1z6nZiRSgxr2tzSROQilT6dHxJM7WAv2NoI4C6xl4ltH1iSAlG+irw7CHd
	 SG63QxASu5a9L45wGTnzB6IP1oAP9kuNvciZGbNiR5O6NX3SD90DBwOj//aLkrBwZ2OAp
	 3O51faf+7m47B5xGiG7en/LdOsF6SURR77ul7xytXc9Egdvwc4sCjr4QoScOTcxHf7P+w
	 hwDVqHZ8fYW1RTVHZgAuwaBKZWFAVgsxIPZG5SNw+bmFqxW23GxqY0eYyOfcN/FDthDDn
	 ZgLsBsL1C9yxXfYkFhT5Dnoc8wD6XSSOAtoxGaqVVxHOn57L3ZEl6yGrXo2qmCloxLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793964954;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Mu1cNBjSM0SBDkEiEiXS1muN+y/MI7dfI+8SiRwv+9o=;
	b=TckwJTDvSUHUFRQQKduVWf3J67H9WirWWKnL40niR3g96Ygb+BZsgmLmWokMi+uUWKGY
	 RawE78Wdk7Ct0HwPwRB0fiECCQUzaR3mMInWa8F/Y6XLbFVRotPijGeiEnTT81dX+tJ3h
	 uJF/Gzj0dG+keIB7fYi+bh7G1nRKAEjHlLc+nSiGCPZdEN+xP2amfX1Sysy4b1xZ2ZPM1
	 h6QJuy734EVoiubsW1SGUyzmaKOyzPmFEdZ4sFkZfSU1agMF1sg18h/jgBOXxBmyTK98R
	 2wxrX8tAzpXsuij9wJfhwrkZFQqVkJwLvIK+cJA9UHphlBbu7GCfq1MfyFrl+fR32Ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="zlaxMcb/";
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED120606A907
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 11:35:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED120606A907
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zlaxMcb/
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3ae1a9e187aso74303a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 03:35:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793964953; x=1794569753; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mu1cNBjSM0SBDkEiEiXS1muN+y/MI7dfI+8SiRwv+9o=;
        b=zlaxMcb/p7Agz4O5lT6ei5HFl3me03K0ckEkCnliA6QmSgPUci2ouYFI6KZBZH+Bn8
         MiTOsbTMQJpiDWYJA3TRRi6+91CBPf2lqQnS38Mo7OFOOqiXA7lgZvPbD8wBaQkX+q9s
         YSfmB2jLZqrnbpo1u9bgDtC1x4b/BYaEQa2lUGQ17y6ixfrIHnS9XGk6LlK436RlSq+g
         cny1huULrGj5JDvgkp2z0XomC/L9WknbIsCNAVd7+zjYn7CXYbxyOZc0ovc25W2JewSA
         8L0PG5pfHth701JslngbhOGzTHEOVUHb/ml+d0Dqs3MpyTMGV237FrEAxCURxoiUV+CS
         Wx0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793964953; x=1794569753;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mu1cNBjSM0SBDkEiEiXS1muN+y/MI7dfI+8SiRwv+9o=;
        b=JLl3Qup5xuoEo2khVJetD6qKgKiRGSSHm+PFRy3L/AkSsh75qDVbIz6vadAKfVdH/0
         bICvvt1urkmku6npcsPexWriF/3t8V8mCatcTCB00oKdeZVnklJB+xDHiei7DKHb6JhQ
         gSJqKmFeuNzPfI7/PSGdKmPAX5uFsWTAkcm39AxS7vkYTU01n1XVWHaKcvSFaj701uLz
         HjVlwIhyJiMdkgFCNzHpgNmvdUYF8ksrJpYMJP1JGXDQIQlF+s8xU7Gp4exhQIDjJy+f
         +AIeI9DilHZhS++UPzMSYrCJ2dcHAPoMRD3GnioPMRhNhoi6ynwoD4EFehJbTXkEZDgJ
         3G3A==
X-Forwarded-Encrypted: i=1; AL+hErGs4UHa0xw8ZOFM4e8mwpmwJqWV7GNlcKs4TXPR05CvTHnbvM+fCOPe4nAVhMZTsyL3ASU5aa310c93Ebw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+7jkHpmkcrjZ2fxjVoTz65uKjw9Ksfb8cNEa7NJX8Nib13wG6v
	/9Y/jZDMF7T4nJyBE0wuTkNGEBc+q5jCFpyIq9v7Z8Pj0Oxv8Kly1Fs5
X-Gm-Gg: AYBFou3lGgLjdbdTSS6xxhBrtQHefmUPlcN0R95T18sM2s5PXYuk+J1IZQ3toIKCUa7
	vU+VUKQCwh/LEBRtCcc7GuBg1s29BMvDcj6t1k2NQJbWFJH6UUt6ni64Cz0e2+v1RRjtggdk9MA
	N8Z8NCRTW4HC5Oh8Qdtpnrd6mTNgCMc5BA0k7ZNmFfURvGiQU5D8pNvz9AkoXOAVQ6QBowMZahO
	4KTLP9vGTWKlFDuRxxXblkSY2cYjmSoYr2h33zaVxGyNRRouBUiIw7RlRfMz+T1XaZ4HtSbj+RF
	OE4NnAaNNZl5VGHNkcqBvI7N78FeD6BkvzDGmSOAfajmk44UkCv9/wlkMNnlF4eJcTc/J5w47aq
	w3griS33fEYyKDugWkraef9vXLMYyn+UWWkSCfhZNot7twYDInOtaC7/X47qFrm5zXqaFLqoxLg
	iljNQE/hfL1w5K/0gh47rE5Coznoq9rodmmqy8NQFB5sPVmaVfLT2M7hEdqTi2o5lDtnQIlOUOe
	j+UtmSh5GMnNqD+lVbNxPFJhfG/NIR7MUe13XyHa4yjlj5LgLXEmMl6ZD2Npn1Bzp11ZP2ZK/wG
	3a/M/Mxt5QRwf/3nML3Lfk8DmR3GmP6szb6IE+xEE+0A6A/9dbBofvK+LGN9UO0DYhjf/f+WIdn
	S98eyfWmBF9bq5d3QnGaNcviV
X-Received: by 2002:a17:90a:d883:b0:3ac:9e5e:d1a5 with SMTP id 98e67ed59e1d1-3b0db70872bmr4052038a91.6.1793964953356;
        Fri, 06 Nov 2026 03:35:53 -0800 (PST)
Received: from chenyou.ncku.edu.tw ([140.116.19.13])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b32b6507sm8343173a91.16.2026.11.06.03.35.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 03:35:52 -0800 (PST)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: Alex Shi <alexs@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Weijie Yuan <wy@wyuan.org>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	Yanteng Si <si.yanteng@linux.dev>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH 00/13] docs/zh_TW: process: add translations of 13 documents
Date: Fri,  6 Nov 2026 19:35:31 +0800
Message-ID: <20261106113545.708896-1-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
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

I previously promised Jon that if no contributors stepped forward
within two months, the maintainers would have to produce some results
ourselves.

This series adds zh_TW translations for 13 process/ documents that had
no Traditional Chinese version, and moves each one from the TODOList
into the toctree of process/index.rst.

It is independent of the "resync translations with the English
originals" series sent alongside it, and applies on its own.

Terminology follows the decisions in that series; whole-file
terminology unification and the glossary.rst update will follow
separately.

The series is based on the docs-next branch of
https://github.com/kernel-zh/linux-zh_TW.

Chen-Yu Yeh (13):
  docs/zh_TW: process: add researcher-guidelines.rst translation
  docs/zh_TW: process: add cve.rst translation
  docs/zh_TW: process: add applying-patches.rst translation
  docs/zh_TW: process: add maintainer-pgp-guide.rst translation
  docs/zh_TW: process: add changes.rst translation
  docs/zh_TW: process: add handling-regressions.rst translation
  docs/zh_TW: process: add deprecated.rst translation
  docs/zh_TW: process: add kernel-docs.rst translation
  docs/zh_TW: process: add maintainer-handbooks.rst translation
  docs/zh_TW: process: add contribution-maturity-model.rst translation
  docs/zh_TW: process: add conclave.rst translation
  docs/zh_TW: process: add threat-model.rst translation
  docs/zh_TW: process: add maintainers.rst translation

 .../zh_TW/process/applying-patches.rst        | 392 +++++++
 .../translations/zh_TW/process/changes.rst    | 532 ++++++++++
 .../translations/zh_TW/process/conclave.rst   |  35 +
 .../process/contribution-maturity-model.rst   |  83 ++
 .../translations/zh_TW/process/cve.rst        |  90 ++
 .../translations/zh_TW/process/deprecated.rst | 363 +++++++
 .../zh_TW/process/handling-regressions.rst    | 969 ++++++++++++++++++
 .../translations/zh_TW/process/index.rst      |  35 +-
 .../zh_TW/process/kernel-docs.rst             | 355 +++++++
 .../zh_TW/process/maintainer-handbooks.rst    |  20 +
 .../zh_TW/process/maintainer-pgp-guide.rst    | 795 ++++++++++++++
 .../zh_TW/process/maintainers.rst             | 127 +++
 .../zh_TW/process/researcher-guidelines.rst   | 136 +++
 .../zh_TW/process/threat-model.rst            | 187 ++++
 14 files changed, 4101 insertions(+), 18 deletions(-)
 create mode 100644 Documentation/translations/zh_TW/process/applying-patches.rst
 create mode 100644 Documentation/translations/zh_TW/process/changes.rst
 create mode 100644 Documentation/translations/zh_TW/process/conclave.rst
 create mode 100644 Documentation/translations/zh_TW/process/contribution-maturity-model.rst
 create mode 100644 Documentation/translations/zh_TW/process/cve.rst
 create mode 100644 Documentation/translations/zh_TW/process/deprecated.rst
 create mode 100644 Documentation/translations/zh_TW/process/handling-regressions.rst
 create mode 100644 Documentation/translations/zh_TW/process/kernel-docs.rst
 create mode 100644 Documentation/translations/zh_TW/process/maintainer-handbooks.rst
 create mode 100644 Documentation/translations/zh_TW/process/maintainer-pgp-guide.rst
 create mode 100644 Documentation/translations/zh_TW/process/maintainers.rst
 create mode 100644 Documentation/translations/zh_TW/process/researcher-guidelines.rst
 create mode 100644 Documentation/translations/zh_TW/process/threat-model.rst

-- 
2.43.0

