Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F60525A75
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 12:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792069024; cv=none; b=PHnp+fAI0VONZq9YDFsRgtI8ZWmUG6FABaqqG9fpCKd6EvL4NpeHojQYpuRdPS4w7JAvB6jHLPcMBrOZ3OopFfpxMn47Nhe0aK7di9bmHruGMd1FmLwDm1/+a0mngiVYPpHwnYxNfnvT6A9h/1giqJUoGS37UaAiJrLyI9jhR5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792069024; c=relaxed/simple;
	bh=wtOFZraGsBpQ4hUfkUfCU2qsltkn9pzHky/+wweZgS0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rDj8/3G7XaKXlit5hXbtYVG2UgUAUbXNU+bivcDccm96zjp7kA7eH/Qfxn4UgCACYgRo5hQ8fum9fZykCTk1lEgy/yRhrqSkNYSzoukGiqkHuKeuq/eWZAE+QSEq1AXX8oY0UNix32j6YKB2ft92d17wRIgmsqP+Dregz2ji3sE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WIFsMW2U; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WIFsMW2U"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-35ef6b49813so1694604eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 05:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792069020; x=1792673820; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OHTjKir7WhEF+7otyD21r203js5QZtUClqFMAlpQpKk=;
        b=WIFsMW2UZ7EGtMhZCjbzhukEp7tsaqltA7iijtjxW5ovVikZVmvlYmONTuf4qac6Fj
         NvrEkMIT5ufUrMwoGP+0hPkpysFmtiH/1LzYldxLNJS1xptoegRmZ7u46icwjLp2isHU
         lUOehJY26kb+76jEK33i5889pScfBJl7q2kKVQsjzEvM6AEfioyTkqQTH830aNohfhPg
         t478hdz4iMcWDj2OdwGe4REcsmPaS9rEAcfUV6LfofdVB3Ssup97hgojQj4+Mwz7OQ4f
         K6NLrev1suxx/VgZFXdHejF8Ep+iAwp/xj3oJu9BE4bjYjaxdwUZr9eujlwTe2jhwAiy
         hJew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792069020; x=1792673820;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OHTjKir7WhEF+7otyD21r203js5QZtUClqFMAlpQpKk=;
        b=kr6lqBM7olNPjaOVngMbR6we8iLfuTPWhG2U8lBRYQel3E7GyvZWHcAe2EThikrSIT
         0/Z2LZOy62IeaEC05EFP//teul1KYYHsH2uDrk67POfUrYhOSUwfIWWS2twX2oYqp7n7
         0une8ko2uML5ZdKOR1INK92cYEm3Y0OzK1fs0MX0Lv95py84f7k8/44q6eQ94+J2azxH
         sYrGo38+aBVFbztvA2GPwh6/lQhi5LybZttYTUMFCRVUNueK5Am/oOgUzvj6kk1Fv6A3
         TjM9TOfzRY8j44O783bQKBNEwf+yKNQBQwtRQTVvzKFuis5uAQ7fIoWxP/v8MVcNqRgw
         hu/A==
X-Forwarded-Encrypted: i=1; AKwUvBydcZd553RtqEBvgXrIjO8moHSBobeKUkvVTtf3Rg42d2XaEDDUCkBKO0B5rGsb1Ks3mT03ajdXj/lJ9l8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKXhz3BCVlK8SrjjFcuSPkfmNHehEl0sY3C4ONq5LatA10DYFni
	MWlgZqPmgx5fkz/Xv79xDOZh/nzc+tKR54TstsjvvkL9FmQ0YhwDQRaOXhjObzl8
X-Gm-Gg: AYBFou1/OLsZiT2BORf2UJTU56R8tYSsv5LmZGqbSCORy7eAPNJLbzKq/9l6XcRqRKK
	7Y9RDT0TDQc71ktN9JbchBzlwq06Jh8qSsrR3PEaFSDUYSWUwGLN0uwWIORbIj2UMVzYR7Vdirc
	YO3Xos68NdtAeFdhyp9BkP+hOmvjp+zKfi7Vj3WTCmQQO0HCyBY8tI+mgKZEfZMVfUubb+FFjlC
	XoPcLEAodz4Wc8S9qfLMHW7GVY97nnLWU1cfGQTa9lHr22EZoSsa6IpuKKDjDvDRPy1D0nKQQhS
	KSGeh1eN3SvkhAzysY2EiQ7cNgs7CnrJU8E4webfttXBAtFi8YVY9whU2PF7TwO7vZY0IQXdAKo
	mAVNZGqAZJ8up5OpRKg+gCyY2iS7yyzbRiQCbc9WgiGXI35U4iC9ya7wsyRS1c0EnivgGU/TGcM
	cViVvgCR3hKEYa4FalpDGN18cQkpy/1ww9qeAst3uduAIZtKSDa1ANyuaB0I61YmW5aE+h7g2xF
	fH9qqShmRtaSDKsvWIKhs5gGL0appU3uTFS0uVoBpWw42KrNadEjR3yXmSXMRkyEkSHz3sV2bGQ
	OHp1QkJLtJL/+eG0zAOCNlw=
X-Received: by 2002:a05:7301:90a:b0:351:7d5f:df26 with SMTP id 5a478bee46e88-3537df9780fmr19801431eec.15.1792069020235;
        Thu, 15 Oct 2026 05:57:00 -0700 (PDT)
Received: from penguin.bbrouter. ([200.218.229.14])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cab27d5sm68812345eec.17.2026.10.15.05.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 05:56:59 -0700 (PDT)
From: Daniel Pereira <danielmaraboo@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	Chen-Yu Yeh <chenyou910331@gmail.com>,
	Weijie Yuan <wy@wyuan.org>,
	Federico Vaga <federico.vaga@vaga.pv.it>,
	Akira Yokosawa <akiyks@gmail.com>,
	Carlos Bilbao <carlos.bilbao@kernel.org>,
	Avadhut Naik <avadhut.naik@amd.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] docs: add a guide for translators
Date: Thu, 15 Oct 2026 09:56:41 -0300
Message-ID: <20261015125644.12908-1-danielmaraboo@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The documentation has seven translations, but the English documentation
has no guide on how to contribute to them; the only one that exists,
Documentation/translations/zh_CN/how-to.rst, is in Chinese and covers
zh_CN only. As a result, the same problems keep coming up in the review
of translation patches: labels copied from the original that collide
with the English ones, partial builds that hide those collisions,
documents left out of any toctree, missing commit descriptions and
missing recipients.

Patch 1 adds Documentation/doc-guide/translations.rst, a guide that
covers the whole workflow of a translation, from choosing what to
translate to sending the patch and keeping the translation up to date.

Patch 2 translates the guide into Brazilian Portuguese. Since it is
based on the original added by patch 1, whose commit hash is only known
once the series is applied, it does not carry the "Update the
translation through commit" line that the guide suggests.

Both patches were checked with a full "make htmldocs" build, with no new
warnings, and with scripts/checkpatch.pl --strict.

Changes in v2:
- Drop the references to the Assisted-by tag, which was removed from
  coding-assistants.rst and submitting-patches.rst by commit 1e035297ffda
  ("docs: remove Assisted-by references"). The guide now only says that
  Signed-off-by can only be added by the human who certifies the
  contribution (Weijie Yuan).
- Use a plain path in the ":Original:" example, which is what most
  translations do and which the documentation build already turns into
  a link, and drop the ":Translator:" line from it (Weijie Yuan).
- Rebase on current docs-next.
- Cc the translation maintainers, so that every team can comment.

v1: https://lore.kernel.org/linux-doc/20261013003702.5824-1-danielmaraboo@gmail.com/

Daniel Pereira (2):
  docs: doc-guide: add a guide for translators
  docs: pt_BR: translate doc-guide/translations.rst

 Documentation/doc-guide/index.rst             |   1 +
 Documentation/doc-guide/translations.rst      | 694 +++++++++++++++++
 Documentation/translations/index.rst          |   3 +
 .../translations/pt_BR/doc-guide/index.rst    |  19 +
 .../pt_BR/doc-guide/translations.rst          | 711 ++++++++++++++++++
 Documentation/translations/pt_BR/index.rst    |  11 +
 6 files changed, 1439 insertions(+)
 create mode 100644 Documentation/doc-guide/translations.rst
 create mode 100644 Documentation/translations/pt_BR/doc-guide/index.rst
 create mode 100644 Documentation/translations/pt_BR/doc-guide/translations.rst


base-commit: 90d9f76ccb72ec024ef476b4229f3dd1957d7b26
-- 
2.47.3

