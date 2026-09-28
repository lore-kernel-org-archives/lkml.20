Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C6C4854F1
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 09:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790586039; cv=none; b=EuLANvMZYCj4qjqHZ0zPqi/vcHNU6MuQy6dIcj8IgmjcIISspskKadoAkJinoDcWgK6iH5fZzX4qoGkU1Tt5dIEM2NdvplsQP2gRKmD76wdyUQtOc4RPj/TtXpwyBRqWCsTGyQG0vHTuDPX6Ul6rQmdQ1VLVpHdH0JeB5hi+9CQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790586039; c=relaxed/simple;
	bh=Vwt5jRUFUNWUzFh6wGFDqhtk+9yWoFR7/PjgmMHhp9c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Q1uMbAc2P0x155FZngiZkNmxH8ae20fvwHRdyT02hooE8pG5TT31V6WafSAY24wBLZnBAfj265lvhT4r+FR/aE86nm1DPEzqgTt27RT9z+hGNCfg1sfoFhhSXY25GBsqtg+mZPJACLkgd4PwnHTrqkLayjtnbkTmzWmrp7vNvXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZFAhpOc5; arc=none smtp.client-ip=74.125.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZFAhpOc5"
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-34182b58c7eso2390198eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 02:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790586037; x=1791190837; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=peWtFw7a//NXoz+TblS/D+EGwqrleEVQ+goT3kgpwso=;
        b=ZFAhpOc5rD1XJSPl1v3i8pGMpdW2V3lbC8VUSl2u4vvF+pEvCnvcg+cHbvOBXDyMaq
         9e/1csHosxwKlVwUW6lJMX0VaLYOyuHgsSXWlO3d1zT3KquaC9pfnw42c+dPFj92434a
         jkpx+pTStBJfT3Fh3waZN54n2KOaHwc7I5fdhlYjwY1CF7SaKc34aszBLElKhzsU/w2L
         jNwpb2OGC3mwu8dLbUbViStt4EJ/n8bj4GBbuWdWM7pAdhPUPPltyx4ojYlBzj0jx9gi
         ZqwaFJvZEuKQ1Y+FkWU5Opu7jl6M3QA2jnCBGPRYoZ3LKJk4OJWDHjr5Ic3I1ydd1wkz
         2Zfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790586037; x=1791190837;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=peWtFw7a//NXoz+TblS/D+EGwqrleEVQ+goT3kgpwso=;
        b=CYQ/DT7Y6NDzaSgpvCKiAdaJ/m6mV8aUi8VLxGS5VXvLR9d5B+KHTzrTREDBBevb+2
         Y0FIOpS+2iK2lyuGAzyzKiRDX2d4ahI4SO9oloWEkc/+0Mbj9uyqUQDItDn40w6dg/Pu
         i1S3QnOdLu92ZlCNc+39rUKzztVUgPMXhmquhWqWGhTWIqGNijbKhZY4z7PuB+1OrS9Q
         kSdTwcHt+5hdEdMWwgY+r3UTcANkDp4+UMS6mluHC4sNWvxE5uv7UNZtphQLB25LP13B
         mNRLupNCpFAUccZUWEzl3SicvUWV6um7WaWP2IjpAgSpmnVhZLsPGjof6yBIqeNHaH7U
         vELg==
X-Forwarded-Encrypted: i=1; AKwUvBxzX5ECtU6QCZFaO5DIMTGGcQFNoMdHblOloit46gTzdGAKYHfj9hMmu6bHQCYeFFh3Op3F/YZPbSWVAcA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJwZ0W8jGzNhNAiMij4N8RnyVVLDiTy75xRLoCsT5zT3HnZU+yv
	Pp77UWcth/6/D9vFY3Kud+IYhNGtB81ycamIX3vX0a7vIXtjrV8nl/X8
X-Gm-Gg: AYBFou3rIZOrTNFg0+ZvEA0CHBYB6HPH7VQQTMf8vjWlgsgWkQDhzhSW3eaxOdqqVGU
	DeML2jssIbjuR79he/FJdfRYV1To3siDYgMrbgPZyo3MBf5/OJrDCG7rlnLRBMjqFyaVj9zR2FD
	YlikmqWYOCjEKp/v2NhYj/xfr9tdxoW/RDsELFwMy9mQo6fwBXAjLaZyhWQBtx3Q0xEPMLOH9yY
	JmowAWjJt09uXib/VPcMIM1hho7qCGh+OEeBT/g1ivLt5hluAazqEHBs3MhPHGXfUoxtlPk/lak
	Ro55ZWIeoU5ppCs+qGieisqrfJiB3gmuzEuYqzRcRLOmhwpewblHMijUCU0079HKZc1GaFIbBsZ
	GeUaq+WKi0EyCr+s4QV3MeJuz42730rLKutqeJt4Ooe3XNI7zyPjDLMonbTMCO8jUfwbM/ZTsbK
	MvjOpo9+Idv+QpBWmZlOoDn6WrEvk/FCqDMIqlQ9OhhKvHUDxh5ElUKyqcHLAdlKLfJvQB6LXfO
	S2Rw/vfbaljKgCCQuKp5SEUlF26
X-Received: by 2002:a05:693c:41ca:b0:33b:fc17:e691 with SMTP id 5a478bee46e88-34a63cad7d7mr375711eec.2.1790586035905;
        Mon, 28 Sep 2026 02:00:35 -0700 (PDT)
Received: from homik.search.charter.net ([2603:8002:ad40:56f0:3430:2ac1:d99f:94d7])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34144172de6sm43351473eec.9.2026.09.28.02.00.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 02:00:35 -0700 (PDT)
From: Mariia Nikitash <nikitash.mariiaw@gmail.com>
To: anil.gurumurthy@qlogic.com,
	sudarsana.kalluru@qlogic.com,
	James.Bottomley@HansenPartnership.com,
	mkp@kernel.org
Cc: linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	morbo@google.com,
	kees@kernel.org,
	justinstitt@google.com,
	codemender-patching+linux@google.com,
	Mariia Nikitash <nikitash.mariiaw@gmail.com>
Subject: [PATCH v2 0/2] scsi: bfa: Replace strlcat() in symbolic name construction
Date: Mon, 28 Sep 2026 02:00:28 -0700
Message-ID: <20260928090031.712418-1-nikitash.mariiaw@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series replaces the strlcat() uses in BFA symbolic name
construction with snprintf().

Patch 1 converts bfa_fcs_fabric_nsymb_init().
Patch 2 converts bfa_fcs_fabric_psymb_init().

---

Changes since v1:
- Split the BFA changes out of the original cross-subsystem series.
- Patch 1: no code changes.
- Patch 2: use a single snprintf() call for both host_os_patch cases
  and drop the explicit final NUL assignment.

Original series:
https://lore.kernel.org/all/20260915081910.4142719-1-morbo@google.com/

Original bfa_fcs_fabric_psymb_init() patch:
https://lore.kernel.org/all/20260915081910.4142719-8-morbo@google.com/

Bill Wendling (2):
  scsi: bfa: Use snprintf() in bfa_fcs_fabric_nsymb_init()
  scsi: bfa: Use snprintf() in bfa_fcs_fabric_psymb_init()

 drivers/scsi/bfa/bfa_fcs.c | 88 ++++++++------------------------------
 1 file changed, 17 insertions(+), 71 deletions(-)

-- 
2.43.0
