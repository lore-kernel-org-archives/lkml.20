Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D8E34B437
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 18:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792261518; cv=none; b=F8WpdeuwcFcxSwxVrg9Zo/ici4mBXb/OyeAtxjLdAQnuPbX5F5snB4kLJNHMsnO5uLCPgA3JjPDhiR5O6dvcc6R1rg4fw8+nb2Sged1bIDfj56GCpE816Bhi+nRNqGuB1BnwPdGZHk1+ATtM8aRleUmOvjWG3CkkabVD7Nf2P8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792261518; c=relaxed/simple;
	bh=BRWVIj0+QDTuMYi7F6ltxI3tp8k6MD7qa2pkLuMBaWQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aDkoe78AY7RElaiAc/9Bufm6j9deox0yIGkg0a6BZat5MhVoZuEntzlb2zh2C3UWHJrTQ4h4dwxLADddmJz9n8fKnT85tBrllKkkQ/Daef56K3oD1W5QOtL2Qi1Zv7S8EQDUpCku0+6KTBeLTle4YEQlVGnfLxBX1+sZt86u/Wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ILLOFWEa; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ILLOFWEa"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cd6028ff33fso386278a12.0
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 11:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792261517; x=1792866317; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=luYltKYLm6yYl2bIMxE28aT7V3Jm1uOyqRT/NXcaIW8=;
        b=ILLOFWEalzVrj8yA0Em/8NS4cW4lV/XJhCeGEuPLrdwS/gyy78RcUnnMztUvzgcmc7
         SC0PiSO0AeEt0Vub1isPfXOsdasudQWYFfD2ncJIM3VJSCZsvl81jfUEgX/sVx8x7TYA
         4QVyFK/QUSN+xjeQask7SNGC3iNlLpelcv7elehDLmZTzTZicIadVUzqmuo+z6OM1dea
         nOeSP4qtxNXXpIYaPeT8nzWS6BBcXTyNfNx55qDnqQc59UKiaZbK1DW4sGaXepbRmvSq
         k/ChkTDc2cHzDOY80A8lwDhoh+NxFPS7paSWIde5xzdPl68VZWi3MOFv12FfdSUAH3C5
         jsFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792261517; x=1792866317;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=luYltKYLm6yYl2bIMxE28aT7V3Jm1uOyqRT/NXcaIW8=;
        b=mpNOXaW3o2VliEEtxWukZfgbTS28Dh4FWvoGM1XRWaVk55Shtm7EM9S7WN4KUqERgp
         IBstRc5Ic1DlVEI61/bKoC0KQ6WdqbZsCAS5xZ0r++nspAegYAgcpbmSAm0sEWaz85kC
         D/RIgb3ZmyxKYBpuzxVHciQ4AxzmwjNSAbeBUhVWT24nxszObA2a1t+nrUqNm4mG2+dx
         himtcuYvkXye6mJvyf/DKaA/THRrQWtqJ3tnqkGQwqnUP8RmuDwV5XRrMxczntq7n0bh
         YTkg55jLi/RB9347IZnFW2CF3ocg8aCiN/Qn23V+km4pofGvkJyDLiSXR7bZb+PHtgID
         QnKQ==
X-Forwarded-Encrypted: i=1; AKwUvBz+FCdTJFTEOQ7+mD2ThGM3DyhAWIktkAr0AK4AxTeMO6u/3nmeVKxlQfjQIzFxw22YNRGxZse3+4/UVxk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLZUvW2ZKcA7ayUIrmMD9BNYknAJm/UHbyZLRb/jAExU0ovcDh+
	rSfYsiCu/mB+YTRddZrVW7mNhc1ELhN9d1VdhvUu4Z+0SYJUSg/Vcb6wjS8+N/6rL6g=
X-Gm-Gg: AYBFou120P9kG7EIYx7IwB9ARImtYZNqoZ85hA2JUOjcOHf1u38nthgPfbMgaWxmjmI
	bNZQLNsSHIrBIih6zTfwkNuu/tvPcYEqB8g7Mf594JiI1+fWRVPLfl0Gh70R9UBiiwFGAYHN0pr
	hgJluzC0rzrakaIkTKGrullUC7gMQbyT1tBJqqgo2n3sVEHVc7F/mbjMrDSUteNt+o0+V6qkUEg
	8t2C6C8pANVg/58mbtvsW9X1f/MF3NEkPj/hlkT8wCQSrTVWkPh+XPiTgo7yLyg4/56p5gyywrY
	56CTdGFlVGTx3kWaJT2/XguT3ptVLI7jeqpAfe8Vkxlui9ryy5UyruLCO0flTDKSmo8ZqTbSSWy
	Q9LP6NO8KMDmfnQADpiwA1PA59mGoz+SlHlVYQ6CNdc0ILecttjfa+BBpVg5zurPm1qaBi3YhsE
	v8AvNfkBpQi6Jx2P268VE27vYfXBtPCn7BSgLk5KqQWn7uoBIQMOrcuMrZic8Bdd4eIcTlWk0Yo
	6domN8fSBDGwiOt9v94V0ciVAOMiOMfeV4t7piNNGqMcP0lBHRSMQTviTFcVJ8totHoFZ2E2gvR
	eQ==
X-Received: by 2002:a17:90b:3b91:b0:3ac:bfa7:b079 with SMTP id 98e67ed59e1d1-3acee97ab0amr2910170a91.7.1792261516634;
        Sat, 17 Oct 2026 11:25:16 -0700 (PDT)
Received: from localhost.localdomain ([2001:56a:78dc:9300:8846:761:63e4:6d67])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc46ecd32sm9241586a91.3.2026.10.17.11.25.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 11:25:16 -0700 (PDT)
From: Abdalla Eldoumani <aamsdoumani@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: Mark Brown <broonie@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Abdalla Eldoumani <abdalla.eldoumani@ucalgary.ca>
Subject: [PATCH 0/2] kselftest/arm64: vec-syscfg exit status and VL inheritance coverage
Date: Sat, 17 Oct 2026 12:24:52 -0600
Message-ID: <20261017182455.1884-1-aamsdoumani@gmail.com>
X-Mailer: git-send-email 2.49.0.windows.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Abdalla Eldoumani <abdalla.eldoumani@ucalgary.ca>

Two small changes to the vector length configuration test.

The first makes vec-syscfg report failures through its exit status. It
currently always exits 0, so a kernel that fails its checks still shows
as passing in the kselftest runner.

The second implements the "Test PR_SVE_VL_INHERIT after a double fork"
item from the fp TODO list by also checking the VL in a grandchild, two
fork() and exec() generations down.

Tested under QEMU (-cpu max, -cpu max,sme=off and -cpu cortex-a57) on
mainline (58161ead2, after v7.3-rc7). To check that the new test can
fail, it was also run on a kernel modified to clear the inherit flag on
exec(): the existing check passed, the new check failed for SVE and SME,
and vec-syscfg exited 1.

Assisted-by: LLM

Abdalla Eldoumani (2):
  kselftest/arm64: Report test failures in vec-syscfg's exit status
  kselftest/arm64: Check that PR_SVE_VL_INHERIT survives a second exec

 tools/testing/selftests/arm64/fp/TODO         |  1 -
 tools/testing/selftests/arm64/fp/vec-syscfg.c | 64 +++++++++++++++++--
 2 files changed, 60 insertions(+), 5 deletions(-)


base-commit: 58161ead29e50d70a317ea26b472e0c7508e69da
-- 
2.49.0.windows.1

