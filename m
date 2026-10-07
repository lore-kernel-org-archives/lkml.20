Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F09A4825AE
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 13:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791380866; cv=none; b=jQMnDU/+AjQ/qp3gnI39rtcuZsZnGY3M4ian82AWshM2NU6adCawtXgFn9gGwlBtQUbE2JKYqCk5nhS6Q8pOAOjjjZyuCu+SdFaI6AcsYzJ+GrhaMPpXUeF/iAX2Z7S8Ol6Qjs7+Q6z5gWTWOf33n7UbZ91qtQX0OVnIO0DZLFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791380866; c=relaxed/simple;
	bh=ClkXeauB6TZwgoDJxAC3EspeBxlldN1oDp0dORabP58=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=H40p9bzNqf2C5MeFB/r4cOJyeF/+sec+Ksp2e1+jfUGk5udJTon/MLM7BuOGueWc4TWujo1xAl+HFDyLj4uHscStoahb884oggowIX9OLva6TizI38J688naRrmSD3LrCw2IN4aol4nJ1cvK/DjJEr2HaFmkLosp9DR9uOt5hW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f7rhcbyv; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f7rhcbyv"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-35115b52125so2229144eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 06:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791380854; x=1791985654; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y7Pu1XSlwQ74T15/trFdlLLwSkUqfKBFVvVva015Ihg=;
        b=f7rhcbyvbe19T8MTgEwtZG2kyg10TbhWALDxDB8IOzK2DXkUelynXq9iHS/Rm/X7vU
         oQK8cVzRvVPCBr63EaIsDe7J5rF163s2xh1qzPPT/YBPvTnSf5pCtYBHeKzBQOXv7UcA
         +6WynUgnD2oaTN3IIUgyxAeOlYxd0aPX2QO8T5YQYvzLvsW/c8DcpbELV3maSVP//ZnY
         8HclxssV6zTEna73rCbvNYZ6tInrht7QmwjpWrQ/xLitKfUYDzLrdsQLCOvq7Zhvd+i8
         sPrQIjUvGMKEM8RLkFEcL1sH09dKXd3okM1lFSSIQC8mf+dZ+3UKMsaY4RhEo2xFMfjX
         jong==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791380854; x=1791985654;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Y7Pu1XSlwQ74T15/trFdlLLwSkUqfKBFVvVva015Ihg=;
        b=GyIW0acJaCHsFs4hk88Zh3wyqZqA5roI1egpq959eDn3aFQ2lEmHoa6vAwzlk7KE2m
         Qu410fUHhWnAhmIMtx2BYVa4EU5C3uMjuDDd67ENhgbs7X0On//xPMZivmUXgEmt2ajj
         mHTt+QNFEbqBMr3T2F4nJdK1gO01MSUvSwqCRAQ97rKR3LtuwG0v3fH7v2nkHWpGIZm/
         8gxclnuGckyBZzWFX9eCu+jvf6Bhj9a1sLs7whJNbG6aAT8AUb1Mv5TOQEya0QJsgIaY
         YCcFpSqav7bNO1gcpGlTHYqYKWLI13UFU134IUtM1rlFwXbyWNLNqGNvYeOxDPBOvsJj
         e1Dw==
X-Forwarded-Encrypted: i=1; AKwUvBwi4f+4f8gq28s8A5P2kSmZ34jNOzJLcNGN/vjzTBKVoCoJUnCY1t9iCiNm7T42gqvGygdcAd4aac4bc20=@vger.kernel.org
X-Gm-Message-State: AFq9FYKh44epgjgqnmPA7GRnj22zm2Yh+Q9Xv8ZHZG9TRLHbxBuXA7eB
	w7v2a4/zW5EuelRFKJSiSDM8u0G8Z3t0BwDe36raMOAVO6ZeL7tCn1SE
X-Gm-Gg: AYBFou2VBdDcbY7jgzYFQ1unlbqiOKXaL70Y9VrMg5INkbpojgd3j7sbwyyGj6DD2Lb
	VnrsnTnaJTt1dpubsabHndEAUE/ZAD64I90pTYR8TnC9mKK8Dz1EZUnRRoX6VrNTiE0lZ+BnjMW
	APsGrPBc1xj0c1iv0XQkKw9ZS+bb8Z2LSwn5CA6s/bkxp+GdPLMGLSo1+iIYNreVWtsCHpSsdcB
	TPHlviEf+VtIW0AGHujtk0vJ4H327DujOvVhNurqZOfQwNtuheis5sfqT55mWLn3Jxjm5vGQfuD
	eSgnTtrzZvaV6LmPRhC3SXjbqtzOvUSiHM+08c88Y97qCvu/SYRFZjDbq5r/Jv1vVOyQ3TXzH2S
	aXC6pCdmLvuN4pDhSP/DPhSsNegcbflZoOG2ZK1qzRL+LW0AEfcPkp+9uG/UZBO4rcNY0gmgZc4
	0uTgFMmrO/HCV6aS7wILEYgYq1wIjZ2ZlBvudA283uApIWvRVxleYZyzF+itI5zTaueF97EAaOe
	IHeQ9TvVGHl256snJBaKzZvu0HrABKppLMOX4Es/ZuIBn0=
X-Received: by 2002:a05:693c:809a:b0:351:6b56:6627 with SMTP id 5a478bee46e88-3516b65a983mr865808eec.40.1791380853762;
        Wed, 07 Oct 2026 06:47:33 -0700 (PDT)
Received: from fedora ([2a02:6ea0:c803:3091::12])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3515aeb5c2esm7304472eec.10.2026.10.07.06.47.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 06:47:33 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: Jorge Lopez <jorge.lopez2@hp.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Muhammad Bilal <meatuni001@gmail.com>
Subject: [PATCH v5 0/9] platform/x86: hp-bioscfg: buffer handling fixes
Date: Wed,  7 Oct 2026 18:47:02 +0500
Message-ID: <20261007134711.473857-1-meatuni001@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Buffer handling fixes for hp-bioscfg.

Patches 1-2 fix hp_get_string_from_buffer(), 3-5 the password
handling, 6 the single line input check, 7-9 SPM and integer parsing.

Changes in v5:
 - Fix the multi-line comment style in patch 1 (Andy)
 - Reword the changelog of patch 4 (Ilpo)
 - Limit the scan in hp_enforce_single_line_input() to the string
   instead of copying the input past its first NUL in patch 6 (Ilpo)
 - Include array_size.h in patch 7 (Ilpo)
 - Copy the token with kstrndup() in patch 8 (Ilpo)

Changes in v4:
 - Add patches 4-9

Changes in v3:
 - Drop Suggested-by: Andy Shevchenko from patch 2, tidy its includes
   and declarations (Andy)
 - Return -E2BIG instead of -ERANGE in patch 3 (Andy)
 - Drop a blank line in the declarations in patch 1 (Andy)

Changes in v2:
 - Split the hp_get_string_from_buffer() fix in two (Ilpo)
 - Drop the lib/string_helpers patch, use @only of string_escape_mem()
   instead (Andy)
 - Add patch 3

Muhammad Bilal (9):
  platform/x86: hp-bioscfg: fix OOB reads in hp_get_string_from_buffer()
  platform/x86: hp-bioscfg: fix non-ASCII truncation in
    hp_get_string_from_buffer()
  platform/x86: hp-bioscfg: return -E2BIG from validate_password_input()
  platform/x86: hp-bioscfg: allow clearing current_password
  platform/x86: hp-bioscfg: fix off-by-one in password length check
  platform/x86: hp-bioscfg: fix heap OOB in
    hp_enforce_single_line_input()
  platform/x86: hp-bioscfg: validate SPM state returned by firmware
  platform/x86: hp-bioscfg: NUL-terminate the SPM auth token
  platform/x86: hp-bioscfg: fix oops on short integer attribute buffer

 drivers/platform/x86/hp/hp-bioscfg/bioscfg.c  | 82 ++++++-------------
 .../x86/hp/hp-bioscfg/int-attributes.c        |  7 +-
 .../x86/hp/hp-bioscfg/passwdobj-attributes.c  | 18 ++--
 .../x86/hp/hp-bioscfg/spmobj-attributes.c     |  9 +-
 4 files changed, 53 insertions(+), 63 deletions(-)

-- 
2.55.0

