Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0FA636D4F1
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 20:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791317290; cv=none; b=Tcjky+6x/JLt1pe1zixlqcIXCMq8vXm56OMISCbXUqjpz3uI3jB4KYXXRZd3VExhsyjyk+Q8Ol03SpXTMKNFn00cqO64a/TxY1zDJ/S+YLLSsQ7pcYQTW64KRiDzsz4177tCpKGoqWv2uAfhkmONrj8CJEY+GGPRSNan9JjahIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791317290; c=relaxed/simple;
	bh=PhhKSOpCe/E/GAGK6TfFO4BrrpiXBwhPFWTDPIQI8PQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PYtmehq8oEMJubkEiF+NAr/ALjW72ADxJXv3wvFuox2+D9oTU9mZHw8i9NNjMGOZsoUUqjvu4BpV0zKcELFeNqa8TVgwHQxDBCfyG3rQhPI/QZTRH1zD9RkYweS+oX04ocU7+DTNnlw6EEGXMkAHg/sMlsjdPNiwq5Gn75mlYD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pfNDgMC+; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pfNDgMC+"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-34c4a0868b6so2837201eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 13:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791317288; x=1791922088; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=REeqHpbU7sEmHz3kU0K1dMEvaUlqDewtYeD77YnIXKk=;
        b=pfNDgMC+sgMXkiyPvIdHPNRXfDuJXYF8Zyt+gHXm+54X8cnDXRx1zUvXDg6s4XRoo9
         TOIERF1vnHX6E/8ekL+p0NX59Az8Z/i7VLgPbQlVz5IcZ6lNofdozHQI+DMPZ2XEh58Y
         XxcnLebBnmGk9kateY5ZxPz9/Nh8lyxWwvsmVkMXw+JXpwjSqADfhJvjk/yikvuV2/0m
         GVU0BGozDBrgMFxIqnq4/ARsewk+6cSGEr5Zu9KhJxp7pdqe7APhj9uhuLPymM/hZ3KC
         C8e4wGF/BaPjK3ee7nXfpJtVWnY7y8V+p1mwynDutK+d1CThcl3f1ELPxtJH86cHVypn
         v8dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791317288; x=1791922088;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=REeqHpbU7sEmHz3kU0K1dMEvaUlqDewtYeD77YnIXKk=;
        b=2V0eCkrYQXGsB/onmJP7ik24quklL1NgJJPRHLvgGzJiqG3xSiETJ13TtGBGWZrWFB
         +1vrJcM4SqSDtML3tRiDPgYWb8vDPVwdZFvlImvq5dFplkWm0/q+hiK2XxwmL9PUjZJJ
         gORDQ+uojmiL7zlzpptOBHC8R8jmm1tx9ueAwbUTrB5eoMnPY2dx09hhrqolF7wWXbsR
         37VVJSSs9pFliMAWAkn7S/nh2Vhxo4iwrESlxb406rW7QOqL8iV0DD26oQTbp+8h1WDx
         fhYJk69wtb2lyha+HqQSF2vmCE5IaL2tZmsiYMJ2IKiuEQbQZg2M9x8ye9tfNL+nPvbR
         IygQ==
X-Forwarded-Encrypted: i=1; AKwUvBy+BwNgy2NRdi7JAtek5RKzrYfP8ZkstA77Wdwhqyjg/51joSN7dmzBxq+OCAsRQQHfQUNLd6YBN8KEumc=@vger.kernel.org
X-Gm-Message-State: AFuF++n4uAU8Ldc4RSCZxez5yKdlQcWnIfCfj0yCTBFwSR4UDcOsmqza
	qyDdN1sYuUETKKtM6cnoG5FjFtfsY4DF0HWJhvSur7fIE/vY7bpLTBkxAhFiSw==
X-Gm-Gg: AYBFou2P+jxhJW/MYB1bKGSDd1ze+nde+VioDOxrahscy0bstToCM9h2gVpFwMztZJP
	am8tOUxyKMk8PC3Nnl3dyVUD88x1PkE59OVwMigmCLxK2yce2ZWgFZrEPIsXY4vwbffJmE9Cj0V
	RUd2537OLRhK3T3jCcy1RM09mGPrFNg1Sl/IUz7qis5xMeLPvDIBOE2HPmmUp+F317W1gtssQxy
	AppkdAkDl2dWsYpln626pCf8iyauaSyJXmbUl0GoxZGjX4+/lTp94wftGPjw7uPo0Mu1pjNLz/G
	qD2hR6hWrjuu6HD4PpBVGYlb7/Bhud/T7XI9eDXgmli2hwlL5h2sXLyjJv887Gi1KvoPq20W5E4
	S+ehbG1uwvKnUUkeyOrMKty9D5tZ5lk49GQFM+fdbTDvHDGKWYrRAdTQDgXVQCoB9fKh0wUseVr
	9fychYIDdVQ8gS9TQcB+6rk5nj788Nqa82imK08QxBt68D+CNscAIg20aB9f869OsnprsWQ06/W
	Q==
X-Received: by 2002:a05:701b:418e:20b0:15b:1439:1fcb with SMTP id a92af1059eb24-15ec66dd5e1mr2613597c88.10.1791317287714;
        Tue, 06 Oct 2026 13:08:07 -0700 (PDT)
Received: from host ([103.103.208.69])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-161680e191esm804946c88.11.2026.10.06.13.08.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 13:08:06 -0700 (PDT)
From: Pranav Desai <contact.pranavdesai@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Pranav Desai <contact.pranavdesai@gmail.com>
Subject: [PATCH v2 0/2] staging: rtl8723bs: fix uint types in hal_intf and rtw_security
Date: Wed,  7 Oct 2026 01:37:49 +0530
Message-ID: <20261006200751.819332-1-contact.pranavdesai@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Per Greg's feedback on v1, I went through the variables to pick
types based on how each is used, rather than doing a blind replace.

I am sending this as a smaller 2-patch series to ensure I am on the
right track before tackling the rest of the driver. If this approach
looks good, I will do the same for the remaining files.

Changes in v2:
- Replaced the driver-wide `uint` to `unsigned int` conversion with
  explicit sizing (u8, u16, u32, bool) based on actual variable usage.
- Scoped down from the entire driver to just hal_intf and rtw_security
  to keep review easy.

Link: https://lore.kernel.org/linux-staging/20261006102846.170825-1-contact.pranavdesai@gmail.com/


Pranav Desai (2):
  staging: rtl8723bs: replace uint with u32 in hal_intf.[ch]
  staging: rtl8723bs: replace uint with explicit types in rtw_security.c

 drivers/staging/rtl8723bs/core/rtw_security.c | 51 +++++++++++--------
 drivers/staging/rtl8723bs/hal/hal_intf.c      |  8 +--
 drivers/staging/rtl8723bs/include/hal_intf.h  |  4 +-
 3 files changed, 36 insertions(+), 27 deletions(-)

-- 
2.55.0

