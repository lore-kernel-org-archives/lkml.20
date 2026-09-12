Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6585837998A
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 08:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789200634; cv=none; b=jq/1rWY6oG96hLRWb2SbiU6CfnblggHyr/vpA79BQ9KGAln7IAwiD1EEw4ja+WpsQ5eXWEw9Ccn7EFMs6S6G4P8DOokzAKIUDbAfUlG1aCS/10LgZYedbNrg2Pj1V7+YnOTKNqxHTOmsu4rFYcUZkbXvwnILU9LI07mOdARSIL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789200634; c=relaxed/simple;
	bh=6nWCBRQF/kOF34K+yQsyRWVKFuNtDKfSwiqJajUcaIo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JwnPhse8G9aCArwrnUOFlcrR9AMTzYl2qKPjE1MRRBrYTuBushYTeAgREbIctLI8xUtIGXVdFH8u/z0ekSiF6U+AjzfoW5KolCQIKXutC9KCvzhzrC9D34HUh0t+EQ7Q066YhTqyWx8r9yQY4mmskTXGqZm/KXnKQNL44sASvQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OWbl1lS8; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OWbl1lS8"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747f01363so2424965ad.2
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 01:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789200633; x=1789805433; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nc9NVd9sNNwRH8ykh0v4EzTVIL5fN9DWH/NmlxUyoiQ=;
        b=OWbl1lS8YUDNWey63Tr+w8lxNYUYDl+5kd/uVDV8E5NV6EsxDlql+lycFzce9kbyt5
         ABvQIwC11ap0BWT04/mR6DlV9sSiEADbjwUXzQJiHj1QkhGDW0/s5S/vbG5C4kRl8BRe
         3QQFIqKC8FbldWRFPWmh1s6co5nvH6pual0DXrWme6llnscM6J2wX03h8EbBAT3gxpOl
         PeNt0GhMkjr7VzM2Z4U18rdFjEF2r5uZ/MLi23AilRkQLN9R9Uu0sngd0/Ta1puZUfCS
         Yt5lRte5v4HwzOMYRm6ClTBEg8+KdCsDXg2eSOnWNko95EaPe80LkoTn4ZBknK+SCTxI
         7W4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789200633; x=1789805433;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nc9NVd9sNNwRH8ykh0v4EzTVIL5fN9DWH/NmlxUyoiQ=;
        b=hOk1KRcQJaORFLda/S4Z4KhzxajKor4Otcz52GxoVtehGBsA09NUlB/Y5m6XPWUs2B
         ZjPtWXLZCgs35KKz10E+/o8f4qtdD0YdE6H14ckmJM52qLaV5774lMU+er5pBguVegPO
         ynFAStpYgwi3039OXwqOQkv8lxCi01svNDiQSD4l5K7S+1RWL3pnkw4JbDW97OHjnCkb
         VWNrR6pf53GKvadQKwFfWbCGBBGP6klX8s2muGDfEzIJxGBE8tvBUz9G6nXl8AlzonXc
         uMy2mFMJT+U42DEZfW5EW7z93micJjFqEVrQVG2ZocQ52ejGMI6R4EmERcQPausbGy5L
         EL0g==
X-Forwarded-Encrypted: i=1; AKwUvBz0Smr9G1UhEkBiVQhH4I7Mt4nRygkRsWQxmAMhPE30v4f2UJx3iheqCRAyuwaZi9tXx8SU+M6y979AuYc=@vger.kernel.org
X-Gm-Message-State: AFuF++n+3biTChXzIe7em5mCQzZ/ljx6AShD/JIyJZS1ZpQNPgTCvy45
	uyDx1IoiO6K6Q8cIDjJ5pBOqAdKFfXJXAN203Y1jXeKjhaTuDjdLYoUB
X-Gm-Gg: AYBFou0G2Vn+pAMvwXZ4WyOjOFPCOMGFXstvVgwD58DaXdW1u82OEm5OfM6ZUZ98dIA
	uy7I1PMOvCnmkP9bhNB+3ozgy0yH/jhOV4hyyKeyIFNQXvyoXw9jGQIfzbvyhL7tVLhFKu76PrR
	axZyeTYrXooc7U4E0nMHFqbctRYsji3fJHoDCipNtE0kobbwnXR8LAISyD6ElO2rDWpZQ67C0Cx
	LLCSwnSw6XG30S7m1oHuic8uBfv4/jGhH2VV+rdrDHYOhuNLJMC9mu+riiwjGQcZbcHtmD/uMoK
	7459x/6DoLtcGlQsP4P6KAwwSPB6VqLWjhIyyD6uvkcC4ZqpFTbQbNBHbTz32bd5tMtmSkmLxgH
	kOr1dIJO83OMG0wfFrDwQXcIMHsUgEIEvnygGSOlyF4ufb4qc72D4A5oK3U9FBHfENfmHYnOURI
	yvwqLteOJdwVPJ6v+AvburV2zhJnOUiNg3tK/OVjDQqJXv0zb+bHP/QuB6xNIA80xgXy5vKaHyK
	C22S2Vo+Jfp8GDrDawKM4Hy0BzOwoHCFt/c/dXMrYIPeKVyQnddGmVacc9MeMm5aNtek9Yvaxt3
	cPnW2m6CRLGtApkqlr4I+ZSR5VzMfm/3DslZJeGVcNji
X-Received: by 2002:a17:90b:582f:b0:396:d28e:bd8 with SMTP id 98e67ed59e1d1-39dbbea2aa4mr3547100a91.3.1789200632576;
        Sat, 12 Sep 2026 01:10:32 -0700 (PDT)
Received: from 0xiviel.ip (122-63-135-80.mobile.spark.co.nz. [122.63.135.80])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39db7ae6d25sm982474a91.1.2026.09.12.01.10.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 01:10:32 -0700 (PDT)
From: Eva Crystal <0xiviel@gmail.com>
To: Min Ma <mamin506@gmail.com>,
	Lizhi Hou <lizhi.hou@amd.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Eva Crystal <0xiviel@gmail.com>
Subject: [PATCH 0/4] accel/amdxdna: harden command BO payload validation
Date: Sat, 12 Sep 2026 20:10:08 +1200
Message-ID: <20260912081012.2274075-1-0xiviel@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These came out of a read of the command submission path in
drivers/accel/amdxdna.

Where to spend review attention: patch 3 is a real fix - a leaked GEM
reference on an error path. Patches 1, 2 and 4 are hardening. I could
not reach any of those three, and each commit message says so in as many
words and explains what currently prevents it. I would rather be plain
about that up front than have you read three messages looking for a bug
that is not there.

What the three have in common is that a check on user-controlled data is
either skipped, or holds only because of a property established
somewhere else - an allocator that page-aligns, vmap() refusing a
zero-page mapping, or the integer promotion rules. Those properties hold
today. They are not local to the code that depends on them, and two of
the three sit next to siblings that already carry the explicit check.

  Patch 1 makes amdxdna_cmd_get_payload()'s bounds check unconditional.
          It is currently inside "if (size)", so a caller passing NULL
          gets an unvalidated pointer into the command BO. The single
          NULL caller is safe because command BOs are always
          PAGE_ALIGN()ed.  [hardening]

  Patch 2 gives the error-path memset()/memcpy() in
          amdxdna_cmd_set_error() a floor. The length is
          "abo->mem.size - sizeof(*cmd)" with no check that mem.size is
          at least 4. A zero-sized BO is creatable, but cannot be
          vmap()ed, so it is rejected a few lines earlier.  [hardening]

  Patch 3 is an actual bug fix: the -ENOMEM path in
          amdxdna_cmd_set_error() returns without dropping the reference
          amdxdna_gem_get_obj() took on the chained command BO. Small
          leak on a rare path, but a leak.  [fix]

  Patch 4 adds the explicit short-length and NULL tests to
          aie2_init_exec_dpu_req() and aie2_init_exec_cu_req(). The
          length test is currently performed by subtracting a size_t
          from a u32 and relying on the result being evaluated in
          64-bit, so that a short command underflows to a value larger
          than the destination. The slot-filling siblings in the same
          file (aie2_cmdlist_fill_dpu() and friends) already have the
          explicit "cmd_len < sizeof(*sn)" test; these two do not.
          [hardening]

No behavioural change is intended anywhere except patch 3. Every input
the new tests reject is already rejected today.

Based on v7.1.5. Compile-tested as an out-of-tree build against 7.1.5
headers, no new warnings.

Not runtime-tested, and I want to be explicit about that rather than
leave it implied. I have the hardware - a Strix Point NPU, 1022:17f0,
running npu_7.sbin 1.1.2.64 - and I am happy to run whatever you would
like on it and report back. I did not want to send results I had not
actually produced.

I have deliberately not added Fixes: tags. I worked from release
tarballs rather than a git tree and could not verify the introducing
commits; someone with the history should add them if these are taken.

Eva Crystal (4):
  accel/amdxdna: validate the command payload regardless of the size argument
  accel/amdxdna: bound the command error payload length
  accel/amdxdna: release the chained command BO when vmap fails
  accel/amdxdna: check the command payload before using it in the exec requests

 drivers/accel/amdxdna/aie2_message.c |  5 +++--
 drivers/accel/amdxdna/amdxdna_ctx.c  | 39 ++++++++++++++++++++++----------
 2 files changed, 30 insertions(+), 14 deletions(-)

-- 
2.51.0
