Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793515085;
	b=GiOJupQM7JM531MKDeDANqVlzO4e5zoCnc19jNi9OcoGWp8pTsg/+4iYzVSTPqVxH7Wv
	 UEbZRzjB/IE8olxsZgfb2Y+KMYYU+qVQKh+237YVwNDj7HwSMw18S+uzzwkYrdE2suN7T
	 wzZzs/5tryY1e8Z3Hp3e8ZMfa95XHUIOehl1CJWnK8IjjOIPP6zA5JLXD0AzTS1TK1Lv4
	 1wrCFy4wV4K0JyXJtl4AEo5aCopaeeUrV6m4uZVYpcJDEOkDE/bABa9eYWgoe+01OVyLG
	 5uw/zxpY1AA7yJJlgUGk/8hg95N/1jW7OKTueGkGGn0G5CfvNV8j+9E3ldmf21309Xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793515085;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=e+pqb9ytLIFYoIlSdazW6GvKKk9NtjSLduFPWkr+QGQ=;
	b=2lLBFStlgtdLtsFqymir9rzFeqE3osc1/amvibiBxhJB6yn4MnTOce27kHylq4M4KZHF
	 F5H1dVIoRi/jxcsWDNi0CSq3jsp/6ArScAZzmJFSz2EKUJREjfVNC8J2XWwKcwViBLqsi
	 Wxkgf2TJTWLYB/r7OVQV8TA1FPrhBQEE+CmIQDSdQLJUWZLPHbFvsgUktSPFgb/JY1f8+
	 x9D+0ouYsnrNFKKLezH/4AX+DAVc80TqcWTVCWshN+k64sTMCVeihYAyicv3CdhHhRMSR
	 pzHk/p0wbrv7ZzWKZQqJ2Sru/mcEnfkECpki5oeJFGrGKxtW89dUiFRGtdKxPeGRDCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wn7Myod5;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2020E606A326
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 06:38:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2020E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wn7Myod5
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2e9995ce866so17276865ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 23:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793515084; x=1794119884; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=e+pqb9ytLIFYoIlSdazW6GvKKk9NtjSLduFPWkr+QGQ=;
        b=Wn7Myod5gDe4z5Vw03yTXiszN/cbKBQeNsztxuV7XgI24iJJI365keCvyL7aHrQm4P
         ZbIkF7kEnRgrb/ZoJlDmokWgsKHIHfm+oJ+xQrg5E1SPLtuaRWD9r6b2C2rb2h+h8Tfv
         NuLaJ5AksPGg4R9IGacllS3+KviLjfwg3ZEAbftKwzNoy/KJ2ULqusVNSNN08bE4Win+
         UkqYpLghC5gmaFwWPTlWwfGzxLkbscrhJlD0eOPKWtDJIcUEWVeK9/LATf6CflAG+1U7
         m3zhacMshTyaS4MqVPb8o/DTYN02YY9jQ6IK3ulwUsun7NU+c2W2udupQgT5q2fobIlJ
         y6vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793515084; x=1794119884;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e+pqb9ytLIFYoIlSdazW6GvKKk9NtjSLduFPWkr+QGQ=;
        b=G+nrLImrGPEQlVs6Oe8FwzgZ4n8rNwYwQCEOvlv0EhkuJNHtloZx4dVg3RIlf+ZUGL
         qKkRr+tlKQoeRInz/p70g7tzDuiHpfW9HIFzXg4UPTssSXNnCkrd/83DAY6l+AMlM3IQ
         +efyITPEr0La3BtEcEqDuWcS2nLEEfMeU/NsnsMm02r5p9Y66rr3a2gP+FEVcZsiz8M7
         SM5nT624ChfTQ7/KkhxbYGEfrLPc2peHRSjhNc+x9Chs68m+MaMnyn+99tYLY7W1LNEv
         E5VOJ3LuQkUuIb1vRjIf7S8YxtcLlWimiie6SRe+h3xmFFwHg3UFSwcIQkhp2CYyurFV
         ZEpA==
X-Forwarded-Encrypted: i=1; AKwUvBzYpdR2sBiM7VEpkxkMlso76Dgnpbu77PFnNyP6L9fjCConlLq05DuVtCuX+g4ll6XD3vO7uz9GZKNdKTY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+tsaxm15w5hpF3GqP2in5ysr5bn2cG9bMyWN4Tl4RLnLv9XQzM
	RrVbByL99DxDE9MFmshd/zOO83bmb1oDfn2/1C+KfrWPGJ+TJ200hVtM
X-Gm-Gg: AYBFou05RG9Nbnz8XGm7hWQqJ4hl6jPx/c0VeVcqV19n0upu30jPU1tr35/sbRpd3G6
	T8mDE9opEJUZ/QV6VKDzJfIKEHqPZmVLTfuzjpaG1iyEIx/eAgL3EwkZ+Wp4667OvCE3GotunUS
	RGH7uQhmbpu6rK+R2ZXSfSbbVdPVl6l3wFgK/YVrZcEAOODLGkub6Yy+0dYBCn2z3z9loQzz5kE
	u1dSCWbTNsWt1WmqCff8niYOiKrmLP2r83WrvxWWqTcIIGV2TmqSBLCKSoe2+lo4F0w9NrkPTQ7
	Xb3cFDXc5JReN9yV0FOg3UqX31m0TquKuFx5I4Z4gOBolbdNFL0vCrndeB0TEvRc39pMBi9quPD
	lwK+pk8+ztHyKyaQ9/vAw4XE6f56vej2l7GDd2JSFpySKPaNawFUrPpNUHoIuCGlrsFXpuARtV5
	zEckWS2Gc+/2339AjX9ta+kv+s0O2qmzcQd8ONUFlax+WmumJzTXjoT9vRD6ivAQ5Dfm6CqSKX+
	iMPCZQwyfERmIv7zrsiJa0Y0Nmk2AocUx8Uxx7zbI7X2aDsFjOqJto6cUts+Ri4pyJh0aNbiry8
	qN7QCatfqUYH0wr1fvmmfyn93Duyom+oY1QYCdCV4UkiP/Y=
X-Received: by 2002:a17:90b:2d8b:b0:3a7:ab31:2f4f with SMTP id 98e67ed59e1d1-3ae89749f9emr5379084a91.28.1793515084445;
        Sat, 31 Oct 2026 23:38:04 -0700 (PDT)
Received: from ubuntu24.vpn.host.chaitin.net ([124.77.157.93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e949077sm14036712a91.9.2026.10.31.23.38.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 23:38:03 -0700 (PDT)
From: BeaCox <0xbeac@gmail.com>
To: Ketan Mukadam <ketan.mukadam@broadcom.com>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K. Petersen" <mkp@kernel.org>
Cc: linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [RFC PATCH 0/2] scsi: be2iscsi: validate vendor command buffers
Date: Sun,  1 Nov 2026 14:37:52 +0800
Message-ID: <20261101063754.89598-1-0xbeac@gmail.com>
X-Mailer: git-send-email 2.43.0
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

These patches validate the vendor request and DMA payload before they
are accessed, then bound the WRITE_FLASH copy by the remaining buffer
space. The first patch also keeps the allocation size valid for the
caller's error cleanup. The second preserves the existing u16 offset
interpretation and scatterlist copy limit.

The series is based on mainline cbbddb6b08cc9900a87cccaa9b22bbe06aa4f50a.
Both the first patch and the complete series were object-built on
x86_64 with gcc 13.3 and W=1. An ASan/UBSan userspace harness extracting
the actual function detects out-of-bounds accesses in the original
code and passes 2593 boundary cases after both patches.

There is no kernel/BSG reproducer or HBA/firmware test here. The BSG
entry point requires CAP_SYS_RAWIO; no unprivileged exploit is claimed.
The local harness can be shared privately on request. Feedback and
hardware testing are welcome, especially on valid vendor commands.

The analysis, patches and validation were assisted by OpenAI Codex.

BeaCox (2):
  scsi: be2iscsi: validate vendor request and payload lengths
  scsi: be2iscsi: bound the WRITE_FLASH copy to the DMA buffer

 drivers/scsi/be2iscsi/be_mgmt.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)


base-commit: cbbddb6b08cc9900a87cccaa9b22bbe06aa4f50a
-- 
2.43.0

