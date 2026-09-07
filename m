Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 099631940B0
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 04:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788755981; cv=none; b=M9Qz8EH7/FzDGliaN6t8cq8GYPA5ZhnGPnBlMGXpawy3GKk49zcywb5CHncS3aSvfEPcLA8ftIbi8e2EEqQ7VH1QoPkqAQV8T2+W7aMLuVu/JJtTwJEmkg8rZLmsozE9ujdZZw8o69rhdFe+qpIypVowTN3zhySApBTYkLhEOzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788755981; c=relaxed/simple;
	bh=8WdEEp8LwljNNF68spCvjMrVMLTyjpQ4kBkfOIub2EY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aOjmTR0oBygAsyy5vNpZmFCH/RJkkWNqFKlYIr0xwQv/SoS/GRl1Wp+zIO90X2nTKCxeN8FAU2CeZ0ddwynvgJ8tBaq9d+mwX89zFI1MyZSFjveT5cdL14Ymr4V2Xslx2M5T1JZx/h/fF8oLc8hpYqwaWkmKrkMrbVjJ/8TIpfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HpIBtZbI; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HpIBtZbI"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2d7195706f1so33203815ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 21:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788755979; x=1789360779; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TzKR6aE4Voge0yCJJx2kSjMA/ao6SFaxegmFhjmqeFA=;
        b=HpIBtZbIBzQBTcpNgwqNhLjvYyGxPclDU2n8+yqunEkLPm6R4Hsq+T2e8YZ1Lqa1tH
         L0PYBf4agnm4aoWFYOIMOQu68PIwSVRnsiMX/DB/LQvgHj5Vhbigd2zfG+0nzFwtt0p4
         9t3M/1XOZep5jaalV2fU26NWudY/l0cJblTOTqJoRiT0ipZlVBqkrce4SIlAetLXixmF
         eSZbhOo2YeLhR/9HfgRnSCPjlLsBE2v/WiRHD2QH2LA0eQjW/RxI1XdhL6GbWXz0I73M
         Diw4UIFCZVMuDN2p/NPHI4iSslfRD/aF99qo3I8E/oF6/BDGC1eZVsPkzG+woMbaZAUs
         otWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788755979; x=1789360779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TzKR6aE4Voge0yCJJx2kSjMA/ao6SFaxegmFhjmqeFA=;
        b=mvKLkt+z42iCgWOOqFUZL5Xb7HPMLXrC5xBuGovei15vehmSCq7Yd+z0Wour56NQuf
         bvfg254oP7QhhOsGqcA8TdZhUMMDgmxL0Y6fjqpL65CWjkKo23dDCgggei23ajNpdURS
         pj7UP2Z9iI1Uggz4XD00MSNNlgf9bH07/DeMs8pcPJIvtY1FsCO2D0qqrsO5wxeErwzt
         YmklVXKUOPFVpf3Wuu9slS1jQkPbwYtnoCELEXavRYNFEpQTvaVHkTPvtuFZ7ODT6LpN
         iPrnYv/2xaibQc/08ZsNbKmqxfBCkQFVr/8wzCISVEndYVRvpusP07SEixwklfQpGfjr
         g4Og==
X-Forwarded-Encrypted: i=1; AKwUvBwKleKsQmeGlAOqMoJyONmnOpvOln0p55oW9v99XI/kTozLm8sdbWW8KZ+Vm53Az5sWU/VcMt9d7Mw0bRg=@vger.kernel.org
X-Gm-Message-State: AFuF++lzzA0FuM7tm6m54bteRO3fbMmq/PI9qoPT2vkLERykrhD3XOw9
	PprCCcRBLWBSHYgEfCGBwwVf9V6f7OERbXzP7GskZwEJ5t7dQ7dcpaTY
X-Gm-Gg: AYBFou34iPgAJppiFdgAi9Khz0F+xcJD2bwAQCijuNqszWpfAivMhTYA6McdKrQz5H0
	NLtzVVZtczASTA6eajQYv6E0r/eesfST9RRB9AQurupJQInwG7xoS6z4CckVawfUoq4DU5abtiT
	YfTrSmtaswBflh3SDIPXidZFY3KKD3wH4WZ76V4oU/Ca+wvBgg+XMczj2Bm0G84WR4xZq+x75ou
	0mVZ5W4MDwSGMaVQjS3yKXwjd4QsATa8kZ0jJ47VwjfRT/wUctEURWlcGdX42FqjjHkUNElO0GE
	CHySyIfsWh4ZSSGuyr2Lp6uqgS0elEEpYpI+/sZBxGcw2ruEprsypKGmFUL2tt0loT43W+mupyr
	99asnmWpPLnRNU1i+XpbveKTIA1HkoWh/9xDev8Ba3sliEtJRnEd6GhFEH/Wpc89PfJNFMm91Hs
	AUsdzvo+2ccDiMrGlSfnelNCCfF8NDwAw3MFEikFStVmCytzfbSRxQjO5cMO4VdDWYrvpyjAfQm
	AyeFBgJ8zAtli0NlEqc0l6a
X-Received: by 2002:a17:90b:2687:b0:395:4290:46e0 with SMTP id 98e67ed59e1d1-39b2609f768mr35245332a91.5.1788755979238;
        Sun, 06 Sep 2026 21:39:39 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b123731sm22649867eec.18.2026.09.06.21.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 21:39:38 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/4] Documentation/arch: fix typo "initalised" in comment
Date: Mon,  7 Sep 2026 10:09:30 +0530
Message-ID: <20260907043933.33452-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <b7b77956-591f-4282-aaad-04c9f7899413@infradead.org>
References: <b7b77956-591f-4282-aaad-04c9f7899413@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thanks for the pointer, and you are right to raise it - I checked and this
patch does fall foul of that rule.

The word in Documentation/arch/arm64/booting.rst is "zero-initalised", and
I changed it to "zero-initialized", which quietly moves the file from
British to American spelling.  The minimal fix is "zero-initialised".

I followed checkpatch here, and checkpatch is following the dictionary:

  scripts/spelling.txt:875:initalised||initialized
  scripts/spelling.txt:874:initalise||initialize

Those are the only two entries in the file that map a British form to an
American one, and by the rule you quoted they should read

  initalise||initialise
  initalised||initialised

so that the misspelling is corrected without changing the variety of
English in the file.  arch/arm64 currently has 58 uses of "initialised"
against 132 of "initialized", so both spellings are clearly in use there.

I will send a v2 that uses "zero-initialised".  Would a separate patch
fixing those two spelling.txt entries be welcome, or is that better left
alone?
