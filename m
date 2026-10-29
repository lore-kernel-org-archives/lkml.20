Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793262361;
	b=4QBe/iWF2AF7REwZ7+bpApTSKkgIdrnWpGByTdtn5Qg13Chg0v+Hnfy4nr+qX7fWKbrR
	 zCy4Vsmgr1yD2w27y51KkkWtRPNIp/Zj/Cur0GnawaMbpd9MJqqS94Hfn9O9JCDjfkelV
	 jwWxUHAFbREINikumrq7hN/GcCgfR/Ah2aleoyfOICsShaamd1aXQOl/uV7CBI7fVfpbV
	 POdkGI4Jj6qfQozmeeBo0uUszZhiqz3H3cs8MTL0XS4uNR2r1LBkpi+DFF5udAY3RSlvu
	 G8tSrnGslTsDgMhU9mSto4pUEoeIk5Hi3V9gaHa/waN4IQ190owwIfSYMR3RqMpivRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793262361;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xSAI1Taz7XPgEgkZ0/+WnfXZLsVVAFKEoUaZ094DMNk=;
	b=RyLT0ginmOB1aVNEi/MyBys1jwUk3EQewbLJXKntBEsHo7c+J8Bgw1moD4fMhH/HK8Za
	 0RG/E1N5d2vf/24/knrkDc1sCx9/ZytaFfXNilHEpyYtCTx9Zo7jJSoWeoN6V4tnNwiGn
	 ++AuquC9/ciXDcNdTWbuUgeQh4ZhO7TY01WhE04YeC/L0UfcMLXVXRWn+WHH+XUB9F1wK
	 V45As7My677oAMKzHjP2yQAYV3ov69MUkT6FKIjEQ1Q4NFcfAcqSOIU9zNcPbhF0J+t0X
	 gd/N5p0XrpBbxJJVq3FbA+P2CRacin8hPjuHqmsmMF/6HlXcBZsZvoYaOEcVQBQr5lA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZEWLkcMZ;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFDD2606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:26:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFDD2606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZEWLkcMZ
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2e83d2cc8a2so4330645ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 01:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793262360; x=1793867160; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xSAI1Taz7XPgEgkZ0/+WnfXZLsVVAFKEoUaZ094DMNk=;
        b=ZEWLkcMZ8/QNABuzDhJfJmFN5hUPFbOLuoMMYZuiB7Qf7nwzWq/ntmp4K7YADMs+bK
         S/cQbbdch+4vnPHfdd1Wb0IbE8RQJxTV0Paca9FtnPnirjLNcQCamNWVEL4pRwVvAqva
         YskHf9oXe/D4YuNmsqORQE5yLJSZ0COXH7sUMishp9aXSStn6cdCyK75Plr3SGg/jIyl
         Arsg+6Nuxwo49Xj1j+iC7nbUd482zlziaYjnqt+iVnLKrf+UP865OzwUUIO8CBMsGHhr
         F5XuEUzWAPLXT5eW4gcadQqCFFe0x0xTKICfeOPP5fOBAD96gXUR74N9AajszIwJc8AN
         y0IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793262360; x=1793867160;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xSAI1Taz7XPgEgkZ0/+WnfXZLsVVAFKEoUaZ094DMNk=;
        b=PrkqflvQTZCjDy4r+eByHvJeQA94RN3fQf6BXiz3TiZ1CLLz82tqhkVY3+8XGpFn0f
         0MzUYLaHlyup/WxlNrHWpcEOwITet6+GFlbEpw3bvAH7uyvtAstiE6+lcXUPaUIlsLIA
         yBVKhs9nIpf+xW69kMsYTIfnekRNx5yD8/EuPoQwKv/T2F0cFdlPZ1nAu7rbazqgtRaG
         XsZJVtlmny/6Ge0b0xCYd1EVQ2xviXQ+KT4jS5YJzIk6iJ+S6GknFdnBWPcmciZRQ4DT
         G0mFugPRNiZfjF44VVXKHG51+CQVs+kxPD5P75YWLDyaOfKKa7W+NlcNu5aSUTLmo/yU
         OB8A==
X-Forwarded-Encrypted: i=1; AKwUvBxCMxjmqVTl2L1zCuvNzqIHGbtnuakuLDVun+OC93MVco6GiiS+GdPlXj47HxSdtyNEDTW3LHR1+2WbkMU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIr/SmgdaxOcD6abclVpvv9szzplYpeRadCx+U3BoSGb69MOLGb
	qCE1s1rPy0Y/HR74TFXnmUQv3qv2Rn+h0QwrWuEbTnHB0kefNLUprnR8
X-Gm-Gg: AYBFou05kk6bYOrIdw5WTWZ8d3YVxSKkiVxOjE4+dGfKDd/mIbQjwq/CCWC7hcPdJNy
	Z8SQcNGnHeDDoy6YuShVy6LB4/tij2AsXTewwYYm1YMkmhnArtBcEYHL4zKCjPs3Dj/U5eNCL4f
	zkzeikhU5+Ud+U6rgn7zF+MMNhRZN0f5PEIo++VYAf1pRaS9n3PIH95nvMyIr8iaJkk9cClgIVl
	aCa5jvWadEVby+qBb58M9bMgEdLRVu+3GLmp5n1Pcd78wYqY4XCdn5n5RSHQSMazBszkLFK7S5P
	+ipgQb150Y0gSNcoEDPFwBxEdQIzN6IIXmpvvCNxlQ6m/XF158zxLt1DgEJ/t3Kwec0OBCU2eXH
	BcFEJYycA4tsGaaywz4LTtieyS17OEN2K51+sRiVJd9ooyhN+MSmrLKoY7aZYfh+6swBBCax21+
	E1JAgchrIF3LCfdZOVj/fK+7VySCLXCvLpFWCad5cH8gc4+Rg+dxQX77w2HOjJfaovkZTfOk3zS
	4WhXUl29D6annrk0Ze2Jf2BQUCPFKNx0m0dL5xYmY8ypYT11kOxe6zDEpOHA3FBo7k+Jv3lkkeX
	F1cB1iH37RTXXKKi6Mq2344kLSQWiqCp
X-Received: by 2002:a17:903:32ce:b0:2e9:4175:306b with SMTP id d9443c01a7336-2eb00052bc8mr67641045ad.1.1793262360067;
        Thu, 29 Oct 2026 01:26:00 -0700 (PDT)
Received: from localhost.localdomain ([240e:36d:b08:2bc0::a60])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6b7a216sm30031585ad.16.2026.10.29.01.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 01:25:59 -0700 (PDT)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Jianfeng Liu <liujianfeng1994@gmail.com>,
	Alexey Charkov <alchark@gmail.com>,
	Amin Gattout <amin.gattout@gmail.com>,
	Chris Morgan <macromorgan@hotmail.com>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Coia Prant <coiaprant@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Hrushiraj Gandhi <hrushirajg23@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Michael Riesch <michael.riesch@collabora.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?=E5=AE=89=E5=AE=B9?= <HystericalDragons@proton.me>
Subject: [PATCH v2 0/2] arm64: dts: rockchip: Add ArmSoM Sige7s support
Date: Thu, 29 Oct 2026 16:25:19 +0800
Message-ID: <20261029082541.469999-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the ArmSoM Sige7s, an RK3588S-based single-board computer.
ArmSoM confirmed that it purchased the CoolPi 4B hardware design and made
no hardware modifications for the Sige7s.

Keep a distinct model and compatible so Linux identifies the board under
its marketed name, including when a kernel-provided DTB replaces the
firmware-provided DTB. Retain coolpi,pi-4b as a fallback compatible.

Following Quentin's suggestion, the Sige7s DTS now includes the CoolPi 4B
DTS directly and overrides only model and compatible. The existing CoolPi
DTS is unchanged, and the common DTSI extraction patch has been dropped.
The series now consists of a binding patch and a board DTS patch.

The v1 series was boot-tested on an ArmSoM Sige7s v1.0 board, which booted
successfully into userspace. This series retains the existing hardware
support provided by the CoolPi 4B device tree.

Validation for v2:
- Build-tested both DTBs with arm64 defconfig and W=1.
- Ran dt_binding_check for arm/rockchip.yaml.
- Validated both DTBs against the processed schema set.
- Checked the new DTS with dt-check-style --mode=strict.

Based on next-20261028.
v1: https://lore.kernel.org/r/20261022125339.82746-1-liujianfeng1994@gmail.com/

AI assistance: Codex prepared the v2 changes from the v1 patches and
mailing-list feedback, revised the commit messages and cover letter,
and ran the build and schema checks.

Changes in v2:
- Drop the common DTSI extraction patch and reduce the series to two patches.
- Include the CoolPi DTS directly in the Sige7s DTS, as suggested by Quentin.
- Clarify the unchanged hardware design and the reason for a separate identity.
- Add a background comment to the Sige7s DTS.
- Rebase onto next-20261028.

Jianfeng Liu (2):
  dt-bindings: arm: rockchip: Add ArmSoM Sige7s
  arm64: dts: rockchip: Add ArmSoM Sige7s board

 .../devicetree/bindings/arm/rockchip.yaml        |  6 ++++++
 arch/arm64/boot/dts/rockchip/Makefile            |  1 +
 .../boot/dts/rockchip/rk3588s-armsom-sige7s.dts  | 16 ++++++++++++++++
 3 files changed, 23 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-armsom-sige7s.dts

---
base-commit: 6d0933ae9d46674a6ea63a87e9e9ab4e662670c9
branch: sige7s-next-20261028

-- 
2.47.3

