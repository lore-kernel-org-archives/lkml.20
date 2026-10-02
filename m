Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A323D88F0
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 19:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790968498; cv=none; b=IB0xfjyYwb7IGvAXHf4PPhVeu7DCEFdj0CBJNncTbFDNdQGh6De7XfW54AdagA2prD0VcavmlyA03iTqyYopn+MmT7Wkm1wTWSxRD/SNJyrxmwxvBYCDNObxXXvgRPJ3cXNoFMn+PJWCERtXdzC6Vj+mDmXmqC2P/OlIkwkDJI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790968498; c=relaxed/simple;
	bh=eHsLpEW3L5my6AzeGFTT3RBfCv34bN1BS8YV5Ip/vaU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=fAMJG+W7Xfm+lGmgETCy53zlXbuXniRgCE5VDp4n1LDk6Fvu4MvCagn7wsSQFKvWv06z0/yWtDLfckKgznPuKqgh6cxfC3GPQ2vpHT+qVGdQ8Yg5E/dBAtJSodFgUy4OVSW231UL85kJM3w6YkL6ZwHgaHf2hxcf2CYkt9RpQrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B1uzrkb4; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B1uzrkb4"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-4a0280d4f56so1388575e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 12:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790968494; x=1791573294; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yXT1p1XHemTBGXdiXf7n1rJKfg3H1kTVdAIHj2f2cLA=;
        b=B1uzrkb4Mj7fp+f+ubsIitDaGp1YTrxCxh502YfO/1vrNySD3e5NvYrD2t/5YNQDHV
         aa0o9td/rNSeCOHsXpcZpdGHOq9TEyeWWli29RwILGDUgED8H7p9mDAqqLVvEYORb+TV
         Hu03exdVpL8SVgOFpnQ2r6EdbCivu4NmjtLbtN7brt/p8SCLTL5TJyZ5ygqtbYITZvXT
         tmZdzlgiYvBvlyFkNlIdybSNEVTN77AQduJz3Elia7LC+TLKCpoxAxjvX08Kime3YgsU
         HCODmIr2hy1sbs8cOuK847zXmd7pUxRunftuEXzu037r60jhF4YmR3UGqip8lDF7BkN3
         zYJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790968494; x=1791573294;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yXT1p1XHemTBGXdiXf7n1rJKfg3H1kTVdAIHj2f2cLA=;
        b=u/Ip0wqFe0WNfO2oSYJRl04TJO4yIz5hNOJHCOVg/fe5Qm7P9qSZMOSUFdTeWOzKp0
         j4EWLgaEFZ+PnRj4owrtAQSdQwK4NG2r/TL9HWHYF3o3+HHwaw4jkW04uCLI8uQkxLNN
         4CBqp8TEeHEaed1etRGFPWp8lpW8dGBYSvDPxDcPvmfC4X869942MjgX+7qeX0KZ3FOs
         khOTSF1PuHF06zZrJcvl5qr/Vh/7wCYY+q5+FpKHcuNHhW8UUYUA02VvKXTdFQ6ciP9m
         2IBskqUoPlYS8Y2kZ0b5LkvK8dRnFsaRDYjB7YDyxqwulCc/MO/XzAc+YmVjSmXdBKyR
         rm1A==
X-Forwarded-Encrypted: i=1; AKwUvByHkftuOmDKBcCbf31CuISt/37pVLEIkxewtQd71KxvvyVVrGdXvzt+mmxiMPzLb5fkbJKiQfuoNbXrMPE=@vger.kernel.org
X-Gm-Message-State: AFuF++nW2doYOd13zU5fft2TONa80qaVQcWW3BkW6qYBQzm+W1A8n+GI
	5TjpfpRPUgF9mb1HWLodPw9pteShiY0PegXIdBoQZ29RKN+MUM5feMUT
X-Gm-Gg: AYBFou2GQU0/CDGKsOkgZn3ER8QvvLfCe+JBH9flCcfewHt81qzow2DcjPJo/Ui2/8I
	m9FLBs2mX3tdQt7c3y55Qqc2aysTjjK43b/kwvHqOTzekL2w2ykDquLYrqI/gjTEZPV50wWHAMk
	wvKfg+sVUOh/ZHrnSFHCX4tgfF2V0r4IBg5QKj8fXCUduj2zy9cKssAnzPjy13aEuuMBIVGuHoj
	2U9Va/jIBELLuXFTQS0CM6QfeYpgzi8HMvkS7HytOz1OxGemv+2LZfbJaYekshNjat8U5IyI+rL
	bVgjipHtzo8HK7VxTNDX7eUmq3M7BfxVEQlgl3u4nl/R52zkFqoAucWyjXgLYr3IOWVPT2cslp2
	8Z9SqYcdNGOdaJdwQv/RQyanU4lBX6pKwZBBWaFLfnSfTzSSzBopU3lBLqogdxsbYy/ZrBAxm+J
	anJX4emDSQNNFTaIXvphwYYTQzutJmE97Kt9mv8dgUODWiYrRYhLVx6WN0gWFT1s+wtG5u5ZC9O
	CLaIF3hyrHrf5KrOU19iSqfM3b8OvbhOE73sQ3UX7U1ZNG22rRC
X-Received: by 2002:a05:600c:4ecf:b0:49f:ce78:3567 with SMTP id 5b1f17b1804b1-4a02769ceefmr68921655e9.24.1790968493618;
        Fri, 02 Oct 2026 12:14:53 -0700 (PDT)
Received: from fedora ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0e1afbc44sm81151145e9.4.2026.10.02.12.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 12:14:53 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: Jorge Lopez <jorge.lopez2@hp.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Muhammad Bilal <meatuni001@gmail.com>
Subject: [PATCH v4 0/9] platform/x86: hp-bioscfg: buffer handling fixes
Date: Sat,  3 Oct 2026 00:14:25 +0500
Message-ID: <20261002191434.58529-1-meatuni001@gmail.com>
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
handling, 6 the sysfs store paths, 7-9 SPM and integer parsing.

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
  platform/x86: hp-bioscfg: fix heap OOB with embedded NUL in store
    paths
  platform/x86: hp-bioscfg: validate SPM state returned by firmware
  platform/x86: hp-bioscfg: NUL-terminate the SPM auth token
  platform/x86: hp-bioscfg: fix oops on short integer attribute buffer

 drivers/platform/x86/hp/hp-bioscfg/bioscfg.c  | 79 ++++++-------------
 drivers/platform/x86/hp/hp-bioscfg/bioscfg.h  |  2 +-
 .../x86/hp/hp-bioscfg/int-attributes.c        |  7 +-
 .../x86/hp/hp-bioscfg/passwdobj-attributes.c  | 20 +++--
 .../x86/hp/hp-bioscfg/spmobj-attributes.c     |  8 +-
 5 files changed, 51 insertions(+), 65 deletions(-)

-- 
2.43.0

