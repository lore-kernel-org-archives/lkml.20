Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9B46396585
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 11:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789558662; cv=none; b=XnGvdQUbrpdbpwIIoidn+7EbjNg6TII/Gg3zp+scBbDQm2jWvU0gexmuawrm623d+wyBs63wWD2hsB70KAsoboVoqorG5MQPEAYel/LmQUgaaIiAtWOo1rhj7pR5hv7ZFKmYJ3TLNziwYb3EOuGz/pGtH05tfT86/WPJR8Esrm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789558662; c=relaxed/simple;
	bh=FbQ6xgNpLh1+aWQRKalxyJfNU46gtcOpd5w6xbKJJGM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DB7jjbfC8vXXcfz8AuHnpHsPlrEdG8vtJxM8A7JisjLsZJTVKt3l4OdY8AMvsD9Qwya1dGrw8P08pAHHxQxFeBi/jf/yW0bcFlzwDHoJemo6lH3V/9v5wN1l+NLY8i5+TpVE184BBGaL91eH5vKACFJ1qrxYr+YZn1i4zf8p9CQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lSG092Oy; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lSG092Oy"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747ee1f9bso7210525ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 04:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789558631; x=1790163431; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cEQLS6J2QTb1fD6UW23RPMak1P8fPzYBsSNcEOaqPwk=;
        b=lSG092OyiFbZf4EA6ioDQIAAT0sp/bEmDdi/1qYSTeas+HPZIclMaD8048vctvErEm
         Xew2lf/IWW5crpfpwbB/GVf6DhlpobCt9o+L2HbY7i5zCrHyobrL8SFybQxVpfzW4dfn
         gK1R7khd8getF/gIi9X5/MBpgk39k2elN7z50odWcNyOqRaSkteDxtM3/Mv5GMn9zaSr
         0OPewhAoxpzyS1k1aahkrHZ25/wITxfhssVGikYpm7nABOlP33Zx6AQYp9zSYvZ1swUg
         7LH4I8m3DbLfp5gErWp5FhcyHX/X/WbWrLXyyl3xF1RlWakKJAHDY0A2kHs7eujpHrqw
         WmiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789558631; x=1790163431;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cEQLS6J2QTb1fD6UW23RPMak1P8fPzYBsSNcEOaqPwk=;
        b=MhSJjoj2HxhGoCIxKwGRLTNSgVCeTzfR7wjYyFjoC20LZkJ2+v7HUZzyx95gHWQi8y
         42JlnttXo35QaU2lVRTWB1UkvJKPOetyI2KmXoTMrwVDEjN6UMRRykV89Wsqc7kS5MXL
         rpYYH31t1HrXBGcbWZ2qjkNN794f9CPp0EuKlmfIPTxquqRSc40vZzWnaJzKuDYTQuVM
         R9gr5PwTnY526c4y/IFOHXRB+OHraeLR2j6rDtz7540P8YT1nqEcTArFZGib9cl0Gj+h
         Rpvs+MOSHPeIvycHDPaaWIXA/S9Pbyd2RPwRDX9mjPycSQxEqcNq61M3fCH3Dmo6sAAG
         WA3Q==
X-Forwarded-Encrypted: i=1; AKwUvBwTVlKmvuZjmJUnPwuFXw+mjTcSIBLrNhzlVpz8KOQ+hw2UpizMF4yRLRhIq9oc151YLgRQoDzM44LtyXY=@vger.kernel.org
X-Gm-Message-State: AFuF++kfDHz3Tb5sTJIdBjm21j6uGMIyfDbzZqjH2ziWIa77AqJ/Qbua
	eZYdeBT7/apUbUGWreK44RG7Si8UwJ5kYvpbGEa+0x2zAWeWfRddKrairNCv9FZW
X-Gm-Gg: AYBFou0Lr++BT416ptqX+7089Bvv7kyRygyKF14z+pYNGdZrgDPOS4ER1NqmLlKHP+h
	sG65GCgH4HwbxyXEgP5mGiwe9xGX74OPTFAvt0lxfLHzPT7M2PM0csZg34H6S5w1VLxWd9dCaI4
	p+WRoJSTmeBn74seqLbV1LKp4N9bRedMbGotVBmURxaYRO86q01nNERbSd6mrVPcC4yIYGW2zQU
	aZjabB8KfdReFjdl8OOhXXJPCj0jF967b45+PLje19gCNdOBgxkpydfPHlCvZY2Y8LbnuWebGQ7
	FWk6SeQJMs4BD43CvvziNAZEI7v/2PoskIOPvZ4CjIgbgF7eHKmIohKdhPQpYtFe/sE5FAasx1h
	X+2jdOpa/LL1csmOxXV+FJrB3TKrnMwjEGV+rGlRHL7S0IaMopI7irVmSjYNQrX+dMmShCpUF3z
	QMK4MG0nhjDdUyO36jTzMIyb2U9q01ZIB9cau379SXpCYLYab+adNqwSiToLrV9nXbnXWiBDv7y
	FJK8PEi9k8HBxSSAWN+r5jvPl+5+yj39CZ5nXnKpC7q
X-Received: by 2002:a17:902:da85:b0:2dd:89b1:7fd3 with SMTP id d9443c01a7336-2dd8dc06d6amr44900095ad.4.1789558630843;
        Wed, 16 Sep 2026 04:37:10 -0700 (PDT)
Received: from KRHW1CJW23.bytedance.net ([139.177.225.247])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd89f02fc2sm9927045ad.59.2026.09.16.04.37.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 16 Sep 2026 04:37:10 -0700 (PDT)
From: Zhao Li <enderaoelyther@gmail.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Bob Copeland <me@bobcopeland.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] wifi: mac80211: balance mesh path quota accounting
Date: Wed, 16 Sep 2026 19:36:47 +0800
Message-ID: <20260916113649.28315-1-enderaoelyther@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The interface mesh path counter does not track the number of installed
paths. Failed mesh additions can exhaust the quota while the table stays
below the limit, and proxy-path churn can drive the counter negative and
let later mesh additions exceed MESH_MAX_MPATHS.

mesh_path_add() reserves quota before allocation, but its allocation,
insertion, and duplicate returns never roll it back. mpp_path_add() does
not reserve quota at all, even though the common free path decrements the
same counter for entries from both tables.

Make every successfully installed mesh or proxy path hold exactly one
shared reservation, and release it whenever an addition fails. The two
defects have different origins, so they are fixed in separate patches.

Validation used GCC W=1, Sparse C=2, and a controlled production-helper
accounting matrix. Allocation and insertion errors used test-only fault
injection; the concurrent duplicate path did not. A separate two-point
hwsim 802.11s run reached mesh_path_add() from HWMP PREQ/PREP processing
and mpp_path_add() from received mesh data with address extension. It
observed the proxy-accounting difference with identical table walks. No
physical-radio or layer-3 success is claimed.

Zhao Li (2):
  wifi: mac80211: release mesh path quota on failed additions
  wifi: mac80211: account proxy paths against the mesh path limit

 net/mac80211/mesh_pathtbl.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)


base-commit: 50d3d79dc0743b616afb00d01a626c76758721f7
-- 
2.55.0
