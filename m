Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1657737CD2C
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 00:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791851830; cv=none; b=rMHaN9i0wOkLFooITwMEtUwW0OfaFRR8B14w/0fZwmC5ow3pXz8ueYqAdQEB0k/mhex4O1dJ6Y68IgmcWaM6tJk6rE59SdzOS5891uCtkQOXgdbQUF2rH4BMGht65eoQy/FtFhyEOAdrSpzzdyEWB6ODhp1ZFXGXxTzmrg1WRYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791851830; c=relaxed/simple;
	bh=L+dE0/hU4ZNeQxjs73nhw3WwEUtYeGTvqOmMgoIXmfY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W3oxXitHibdbiwXPKB5/xwiFa35dreXnT3RS2izhMp3fLQmKOCtmAf2RNRoUaiQq1QI3gmM8h9oRWTPa+nKNEZTD00pFpGIrZ+Trtblc/xZjBVkQ8dxhmrAhb2dL/f6Dd2sFgspO6/IqkSSrcjEzxhdDbecM1DbwVf4Bn5M59zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AXH4xXFD; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AXH4xXFD"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-35c76e9614aso106569eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 17:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791851828; x=1792456628; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0VkHgqdUHzUGSmNMiwrINvUMy6OmGz5QxPOiyM5hWps=;
        b=AXH4xXFD2wkppEQI08cL9Q1tAosO9G5HGPYhcgyp6V3x+vuUCh/Xmo95dGS/lgFj25
         2DnoeUeGYcFKE6kU8L9KBaj19/h61dznBnmCeOqzFicNWkyDW2iAykHcqMLj9a35Dxjo
         7dlbZHwNP7V00YpelsUN2qC6qdJNbD1efrq7CfqFSyXKhmALikT6KdCUM2wMub3o94wq
         8oXFDrCeUotv7ScXhOwxwXbHKGKoeozvcn/Dn1+OXIsdOFrWNcQ+UJXYjaMIxmUV7iPJ
         EUUUmFFOtdemPmqVaJTnqJrT/qkYHWUPuIel0mWXffSbStg+5mud53FBQLaaU72qugpG
         3U1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791851828; x=1792456628;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0VkHgqdUHzUGSmNMiwrINvUMy6OmGz5QxPOiyM5hWps=;
        b=P8hkBkgtw7dlsj4bVjlm5xi6OSHFDnOoNo3u1Ht0BtXZtJ2gLL5Hj64SNb/oYdfhHT
         PqowrxBTrY++EgIf8bbWlCuwEs6itIejv0WT3jU/dCy/ysbkVY14vDRluJaaMIQJtc8a
         nvLw5JUC+rnCtVDuYwaaAZq23tJpJ2NUTQFckR3OzWyYl0a0jBhug5zffN7svpmqf9gC
         dxS2cVNFw/gt4xn0KzYGPO4lLcYXQYfy5LZ0PQ/24KU95fzdl7rVTDV9HKNjsOLpF/LW
         z6oo4X1NEOMGfkOLeL+wJmVWSHqp0RlI15rivVPJEhXIDH+nxWDjv6d9gi1BVZlYsFQq
         s7uA==
X-Forwarded-Encrypted: i=1; AKwUvBzuHOpignL/RmZmFtO0R2h7640rDpPVD9vRXmLLSMYAkdJBggmpBr6Bh10O3RPOvmdwYKc6dmgqjj0mRtk=@vger.kernel.org
X-Gm-Message-State: AFq9FYI9mfQgwRhh8mE9069xpUZOre+3Ft1OO2LQRl+bD/0s0zn9v/Jr
	p/0YBtNbCtrE7sTq5Mz5qnCUuo0Nfk8sdmZHdW6SJamk57grVCrV+FX39JTNg4rj
X-Gm-Gg: AYBFou0L4gMDTihtWIPSDVlNYiQXoFbHYwuIllJCpwEJKvWE4laNFRZvK3JUMxMbELE
	TLG8K9kDaP0uvDiWC8mgZ4BBWFoHB2JivkhbUrthWNQKC73C3HRxJw9zgxE5giLgBJN2hb4sAsF
	EOBuIibrDn5kEHUwGJJTaJi9PnaI43pKijBPdVH2D8r4U7uqVljbMBllVzSM1xZElO6xaA5HscF
	l1ua8lLR1mDg8DVm/KA81ne1n1jChnuTGJTjyspSFVlXvJx+Z80jR3RTBL3wiF3tqu5uoO3Xcra
	Uhdm2VuTxAk5kKYfJBEhxuIzBP7kIxLXWIIYakhrozY3xShYPq8+bGCRb/H3wr2Bxe18Dje4Ixt
	Xt7FI4xXGKPTdA7i2XndjxrBjxxWOkOCHZwf5MR+xWCP20XrOEspxSe/aBtOU5xHAN1WYSLkXkU
	mzNDpabYfPG+Lj/4NydUAnVywoaCt/UA/LnxS630FzSrxX0PnuI7v0lxPj4YBcGUL1D7qX9ADOw
	/XT+drtkbVc3/VZme39tl757nGUCQMClcz08GZODDsLPy2rFRhG36xtNaz5vwaLvMJpFSZQ58r6
	9f/8EzYOBAl6MVSBt8r6amKRTw9XtsYUDQ==
X-Received: by 2002:a05:7300:fe4a:b0:35c:11e2:cf11 with SMTP id 5a478bee46e88-35c11e2d21dmr1684181eec.2.1791851827888;
        Mon, 12 Oct 2026 17:37:07 -0700 (PDT)
Received: from penguin.bbrouter. ([200.218.229.14])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca1b556sm49947560eec.9.2026.10.12.17.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 17:37:07 -0700 (PDT)
From: Daniel Pereira <danielmaraboo@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Daniel Pereira <danielmaraboo@gmail.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] docs: add a guide for translators
Date: Mon, 12 Oct 2026 21:37:00 -0300
Message-ID: <20261013003702.5824-1-danielmaraboo@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Jonathan, apologies: an earlier test send of this series reached you
by mistake, without the lists in Cc.  This is the proper posting; please
ignore the previous one.

The documentation has seven translations, but the English documentation
has no guide on how to contribute to them; the only one that exists,
Documentation/translations/zh_CN/how-to.rst, is in Chinese and covers
zh_CN only.  As a result, the same problems keep coming up in the review
of translation patches: labels copied from the original that collide
with the English ones, partial builds that hide those collisions,
documents left out of any toctree, missing commit descriptions and
missing recipients.

Patch 1 adds Documentation/doc-guide/translations.rst, a guide that
covers the whole workflow of a translation, from choosing what to
translate to sending the patch and keeping the translation up to date.

Patch 2 translates the guide into Brazilian Portuguese.  Since it is
based on the original added by patch 1, whose commit hash is only known
once the series is applied, it does not carry the "Update the
translation through commit" line that the guide suggests.

Both patches were checked with a full "make htmldocs" build, with no new
warnings, and with scripts/checkpatch.pl --strict.

Daniel Pereira (2):
  docs: doc-guide: add a guide for translators
  docs: pt_BR: translate doc-guide/translations.rst

 Documentation/doc-guide/index.rst             |   1 +
 Documentation/doc-guide/translations.rst      | 693 +++++++++++++++++
 Documentation/translations/index.rst          |   3 +
 .../translations/pt_BR/doc-guide/index.rst    |  19 +
 .../pt_BR/doc-guide/translations.rst          | 709 ++++++++++++++++++
 Documentation/translations/pt_BR/index.rst    |  11 +
 6 files changed, 1436 insertions(+)
 create mode 100644 Documentation/doc-guide/translations.rst
 create mode 100644 Documentation/translations/pt_BR/doc-guide/index.rst
 create mode 100644 Documentation/translations/pt_BR/doc-guide/translations.rst

-- 
2.47.3

