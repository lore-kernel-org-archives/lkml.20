Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC9C54BC005
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 18:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787854514; cv=none; b=hwsM6s7L5Hk4srsw+DpdHtp3QYHpjRBBlJMNywkklIy/OpU1OK871nR2C80txF5gebBtOFK2o2YLA4PtVMUwJBScZIv3MY+sPEDtkqc3WyBQ9ytfRMgTeC17yAMHJOeSkvO0nDCWc5eJ9bwaVBeFuMmXbAi+Hf+tDF60qS0pZIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787854514; c=relaxed/simple;
	bh=YmQyD7/4tLeVkJmPWIOhB1qOMLJH7j0iUgM4+DNA6Uc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CB6r1dymQaPWXB2kq6oeq7dFBIoaJqwVZF/c7of0aeNdosJ833WswjcZZrodb6/LsH14knqi7BycesH49z509XJyoOgNxr7wmAjf7neNXIE0ex09qI5x+iwweZe/p7qqsQb6D8aeZ0FVh9i+PcJqr7w9+xFYGNCvQ9Znkau6hhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mmAGiXJg; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mmAGiXJg"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49b8e527d63so364435e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 11:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787854511; x=1788459311; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YmQyD7/4tLeVkJmPWIOhB1qOMLJH7j0iUgM4+DNA6Uc=;
        b=mmAGiXJgDHM5oTfvBo33W7mCuK4DfoqxrkI8QpITmmP+txg6QCbukIixHpWpEsA9/Q
         yA7XtsD5ChMCcMloFTOFRMFWa0lZwRIEC9fdnwuEQ32WxVi7J1J0YhmEQ/NdQUWdQiSX
         metBY5HkIRodpEVL2/+6Xf8TTexk5a1x5BJRds8keAytdcbie5D0OaW4SBDo1dZsXmqb
         ZLMBwRhYKL/fJscvylcycZH4d9N4rhxSCS39zIkwazbNTfLyW6U/FujOCFmrWxti+eK2
         76fzks2bPg6sI8lgKVnLFOg/9tOZwlcmXUzjrzRl50+JEWtpXgy+W/d28N3C7u8mrnOe
         prlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787854511; x=1788459311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YmQyD7/4tLeVkJmPWIOhB1qOMLJH7j0iUgM4+DNA6Uc=;
        b=fbz/o0WqULqcThoxU9GJF0HjpaAqNsSkcTt/BpFkHw1yorzuJWgK06VYVLFH/lVtAC
         jKDIp8wSNER0VgX+OuNqhy/2/LjMCWQEv5oZO+dvkwFn6p3fDByqNF8BcjIXwKn6/QzB
         ++GW9a5lIYmgCjUeEYStxy7Ucex4b4Cz0m4RsBx7WW+/xRGKXn1x02mJUWuH4j+Gq+/W
         phzopcgJehmhGPvzbISKuUfg8T3V2h2jzrnFL5sfIaEq4JGus65cDNvshADFwMZUzRFl
         ozbuhsYOVpFn5b0lzJQKW0eW/SuOEArjK4bQi+pemm/Lg9M6FvBr+OleMJqFhOxXDXB1
         RAZQ==
X-Forwarded-Encrypted: i=1; AHgh+RpcSLiIHRnCiqiSrdfZhee9zIM3cFTA2U9Kw7bBS4SsgSXWYyOTMUAtFG9t1OyvqquLCgn+4xKYeGa9F+E=@vger.kernel.org
X-Gm-Message-State: AFuF++k1/UwN2zyIdmRNdKLWwIA8OanIsn0V7u5wSS/lp+RTVLTRfgEP
	zS9BhtNXieIFR2chCELzOx2M4x+YdJTw4mpNIvQsMRspanaVteQt3DN6DsXHGZ43
X-Gm-Gg: AR+sD12opVpFFG1+wzLG+/mMSfJnmp4u723opsMj7olQ8oYNpGR5mumihbfPeY9LTfL
	odNC+sVnTz7dsUoynGYJ9qCwp71gFH/xjtbkx3YcpMs+/MLS4XTewf0iNY/FcsjMAy6yhke9f28
	EFLqHvoOBR7Dyh5jRiKE/wwYGRD4VdyQVqXZHbb2BdQ0GQFgSHM/Xq5a1yyuDG77wBIv3aW2YyA
	Ef+MOJxCj0mbUX8/O08uvP/GOls/kvaPU2yklRidpKO+iVO+uPFafb+efLHpivT9Aj61lK3joVl
	E9e43/937cCMDFERRcyzqR1jq0RJnJn/QiI03H+LWtgVRkKOeYquP/1P7pvArC5e6AUvcA94nJE
	55FdLm2qCCetOOAXO6M88q+z6HDf3hoevJ8hg330QR91UBaQEqBK4JckwLFdKBpMtqxY1te1Z+e
	RjGLKf+oNQ9vds/Oe76SgkEbXqoga0r2Pbk1q9M7c5cshBoNLrAf3mgF0OzU3E9bWzjkChxTxLG
	wH4F0qlsaFg2IclVGhh2bpcapTIwIfeMgmG8xUKNQhm
X-Received: by 2002:a05:600c:354b:b0:495:4d88:e630 with SMTP id 5b1f17b1804b1-49b91c4fb4amr10535475e9.10.1787854510977;
        Thu, 27 Aug 2026 11:15:10 -0700 (PDT)
Received: from 1Z10 ([78.213.170.242])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e279e391sm10333386f8f.2.2026.08.27.11.15.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 11:15:10 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	David Heidelberg <david@ixit.cz>,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: Re: [PATCH 1/2] Input: drv260x: Make vbat supply optional
Date: Thu, 27 Aug 2026 20:15:07 +0200
Message-ID: <20260827181507.2425796-1-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <apAWXyPRtSe0Uk9_@google.com>
References: <apAWXyPRtSe0Uk9_@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Agreed, thank you. The supply is connected and managed by ACPI/board
firmware, so the dummy regulator is the expected representation here.

I am withdrawing this patch; vbat remains mandatory in drv260x.

Maurizio
