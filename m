Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB2D47DFB9
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 14:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789397708; cv=none; b=u1KXmSMu6aL6o8EM50FWREsUEqXp/qSjv/ErpJ5M0pC1l8g0Lblyqj4GtrANvqRPdyM7DcLvGu5x/bhBGgKO54RMFvM8crDkPWAKR6nNt62RqImt43IwCjpuxniFQreCooFXQAu7MCr0B26QTf2/HqbaBiAdkM1BwBhvvSIlK8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789397708; c=relaxed/simple;
	bh=5N31Bn+fMZxVCyI4v/P4OWSLDjqclKHgBXc2TzlRNtw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XQiXpcYp5dOf4h6nZrDFgX1o5atVMqQGGS7bw1nb1o6IJ0dqMjSNclKcBd1m5K+zze+o2takxX0hk7H5C5fmRyC50lDaqP1jZlXWaJk+iZzh+aU9TMBUJc5B+0ZirHAuxiZNAuwFKLmdfJSD6ikqv0dZals9skvO8+6eRz/WIRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sUGpDUKY; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sUGpDUKY"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-85469a3490bso1972236b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789397706; x=1790002506; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QFieKNss0oxmMeY7RkxeoYk4NgyWyR9vOSnVYMRho1A=;
        b=sUGpDUKYe9z2EVylWHN9io5C2Vn3Srzq1acB0DXECpYtbVVaIyhXhpgnsrqHYDjXvT
         oOp0pD8b/va3I1LWzl31WBk8D5aRGLPRKyKTHh5NcVDT879hg1VtPZYwxF9BMOXn+mRu
         b3J5ZPC5NFohM8tFq1zV1CFjzJywdQXJHvBJd89HtOWYzMOHTw5ClL1Zi0MEObUrlUwq
         eSs3LUbNu5C6KJ9uCbTr+jspTMHAl/J9gfGh73qo0Rz/gSu5vfZF70amapRRk2TdDf70
         sCUTys/Zep/lNxPWC8ZFHafsvt10VGu08ATp4zv1obXEKBQjpkbUd3vlCQhHKLMnU+2L
         J9kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789397706; x=1790002506;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QFieKNss0oxmMeY7RkxeoYk4NgyWyR9vOSnVYMRho1A=;
        b=ZcscJKfgYI9Hjspe41dmu6mvvqHXCx0i+e5gMvEWnQDcQkpDn0GFfPz/oWV4FjLXJ7
         CgxW0OLNlQPa6SoeDDhDPk2/oknqicDwWuekWZa8E4/kyUxzErkcj/uTJ+WmS97sGcvB
         YOpgAdPTcYXZAWbAIm4GKkqebxnebisXvykxumX0y4uYwrolXSmXErfzcwMIdEEDHr2b
         Iay8du1sZNOAn15N6Qq6d+llM5VrvKriBGf6F6ELHqJU5BJ9L8nlmpLH2ug7AdOR25na
         zke7qjlfpUenNV0oGCRVAfdoWYE8ervYALKYYaqwqT03j6jkeuU6/N4yqRZH1oaEjeQC
         fDTg==
X-Forwarded-Encrypted: i=1; AKwUvBzteZlABeKrYhYFTu3WbGY6raRM8GCDEc0ihRnwVuvTu/mFexNRGuo2iG/FuegHYtOj8Ipoa3DNw08bqV4=@vger.kernel.org
X-Gm-Message-State: AFuF++mvbEQcAJXvGt0FgXWPku9HxbwjVXaysYhpPlkjMjxn2AE45fpo
	yIl4k04u4j2PoGACaKJkU0k3XeaiAQSotJUwTKNW0WFiyRmApu01oYs+
X-Gm-Gg: AYBFou1UKn3IgC12MAkswt9EDZuIcBPa1FPUCSBEVlc3zbt39Mi7ySw3+xY+zC64guX
	SC22XcAiTcumyH2+NfdUtSQGS0FzQCZV55tqKB2h5W9kjnCOx//jc2KLyPyWv8DzgTJ+Dfsrzvv
	ar2qs/1WWUITvZH/u7NNIJtNNmOZQ8HsG6bCHcPjiruJs4NaesXKGzBe47lkqMBYfnLIEgH0hqU
	DOl24pBPFHsi/X5t8G9qEFvo5+NBjjA9RNIT6A5bg7yG66qu7WKHCxRAgMDzBEGBiKpD6cEAY9b
	vV9nlvBvrymAcM9SfBAI9PpVeobYc7wQZSEqVFgXyPQlgR+sirAC523HiTlK1ouvUnJbgnw0LLh
	t35b0Aq9KDTsEyxLWY8AHDHDFIFkyEnrP139EywJM9/chc+xiww9lGMiuHICo4CaMm9/FUlMyBR
	OjqbE3M0cHV6uDVv/pk9swoBhuUW50evJUA3uT2EG1Pd5Nz5VoV6Sbphe8U2ttg+fgwC+QT99ol
	P7NIky75Yztv0CziwFeNkpBB51iPPHnEMnA/9hC
X-Received: by 2002:a05:6a20:2443:b0:3c3:8c91:5da0 with SMTP id adf61e73a8af0-3db4061e3ddmr5845756637.15.1789397706065;
        Mon, 14 Sep 2026 07:55:06 -0700 (PDT)
Received: from KRHW1CJW23.bytedance.net ([139.177.225.247])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc4c615a65bsm5338805a12.3.2026.09.14.07.55.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 14 Sep 2026 07:55:05 -0700 (PDT)
From: Zhao Li <enderaoelyther@gmail.com>
To: Miri Korenblit <miriam.rachel.korenblit@intel.com>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] wifi: iwlwifi: fix RCU lifetime on setup failures
Date: Mon, 14 Sep 2026 22:54:30 +0800
Message-ID: <20260914145433.42830-1-enderaoelyther@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two key-add error paths remove packet-number state from RCU-protected
pointers and then free it immediately. Concurrent RX readers can still
hold the removed objects.

The MLD link-add error path has a related problem. It can free a link
without first removing a restart-time published pointer, or free it
immediately after unpublishing it on a later firmware failure.

Use the RCU-delayed freeing already used by the corresponding normal
removal paths, and make the link mapping cleanup common to every failed
link add. Keep the MVM and MLD fixes separate because their origins,
objects and maintained-line exposure differ.

Zhao Li (3):
  wifi: iwlwifi: mvm: defer freeing PTK PN state on key failure
  wifi: iwlwifi: mld: defer freeing PTK PN state on key failure
  wifi: iwlwifi: mld: unpublish links before freeing on add failure

 drivers/net/wireless/intel/iwlwifi/mld/link.c     | 4 ++--
 drivers/net/wireless/intel/iwlwifi/mld/mac80211.c | 2 +-
 drivers/net/wireless/intel/iwlwifi/mvm/mac80211.c | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

base-commit: 50d3d79dc0743b616afb00d01a626c76758721f7
-- 
2.55.0
