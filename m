Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793972603;
	b=4xyMNa4M5vZ4CZyYlOWpUyc1OQoxl42bbW8QVrlA/9GVeXxBz3GShc9Hm261CtmAr1JU
	 QVaVAuRJvkkwziE+OBeW4j+3JpIv3ZDMd3B4NklrkkbgMRg3AnzZLiwnJRLpCspgsGh7p
	 Vj28Dmg2MpPP1F42GKeFSZlG+d07316KHOexDaApgGpFJvrqkmncred40VWXb1s5mgvOr
	 XOSw/odN8ATELrZfEqKOagW4QRlTQsbBtrCptxehiP3i5jJe6aDeWe1C/rSQafTvuE31i
	 x+z8TY3htVtcGjpxHuyeyNp/d4VqQidgpRqlUp0Fh+aINR8oM7PedCw/TKU/MyxV3kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793972603;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qT2iGCtzANHH9hlwoXwHnZX/StQ9bdfI9+nrQG92gYA=;
	b=yNpwOOZu1PA1ueyUhEqIoDjGli2HCihwfTXaZAWAkIVxSljGlJIRIJnixQr1PuQU0+7/
	 QEYcb98QEEje+STf9sbyaqcdqNNgaQuhgqoDI0dZXvPeGi2MZ/I11KZlRxWS0OUC0gePM
	 5eU0LeLHrDaZbUOSP41DN3zMwICalyoHQ9N3bH30QnlWSwEFJknxGUDe1Wtrq3qgRcjoy
	 K539Qe7ZK8JW1DYMZ1KhHUmBlRxBfzff0EIa+2DNpDXpS+c+DqsNgkrc4/Q2FvB+JKby7
	 GVBVpwk4G0aFdQU0bTiiB3e3VAsUVCyoM9w4ZQx6ucBXijvDejcVV3xIcY8BMafA4Sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=stellman-greene.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BJeFDv7h;
	arc=none smtp.remote-ip=209.85.160.176
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20B08606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 13:43:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20B08606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stellman-greene.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BJeFDv7h
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-53653e30353so7867131cf.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 05:43:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793972602; x=1794577402; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qT2iGCtzANHH9hlwoXwHnZX/StQ9bdfI9+nrQG92gYA=;
        b=BJeFDv7hN/hzk97oCOSyAew+imDVC+QVCJRkjVfHpEEzNHhf6QSKpfoB8Mn64jhDjV
         nYGYEcgFR0/jYMbW7xvGitg0xNs3gFA6U4lgNsxRTafla21JPF4C3Pfhq8F9GuqWo9Lf
         kEfRiXk/nM1Z3ltcz2JTePzDeSs8BBcPLESWdwD8hx308vSHeZj7Gk346yasluWlGklG
         4X16OUKwf7L8Yzg7DmF8WI6l/yZZsfy3YvLU5oX6eI7DTghNh7SDGn0HM/44Srk6kcrG
         WLUv13OwgPrS9Wly0zRliSwaJwKR6Ngv+qrR+bR3cICziZ3meWVNvB03Eq3q8caxPkDP
         1Vdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793972602; x=1794577402;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qT2iGCtzANHH9hlwoXwHnZX/StQ9bdfI9+nrQG92gYA=;
        b=l9PJHaVRa7ZmaAHvrKcEgwqBIBuEYevg4ZeFln/Gx/0GOedArhuxWp0dEDmlsX5Uyc
         mZ4eXCn33N3z/V8YYGwMw24lWNadW1jF8/+2iL2cDbN7kXsFmjaRPlXDlrbmPTS9PpPE
         s2FrMcar+yEMcFUSlC63CN32wMaIZU1no+NFvsRPssiFmMO7UcISAoGOw1Dv51iJsX1c
         9MWlwPDkd0XHBkQ90MliyL3MFb6wen+/DoWzDuCm3/tWdgts4yGAdyVj3KVSUqfcZE3e
         loRZwlqFWayiPJkyXEZyIoJVSXJEJ6zBqhvm6OIjVi4E0tPMkkD/4BZ1UT9lhnLv63/m
         EcnA==
X-Forwarded-Encrypted: i=1; AKwUvBzrOv9zleql4wwcOGsxTNoPF/2oNzb+fdGH8Uq4eRKgPPdrpgZl11GHJXjwY52ShDSf1Z1/0iSs7x4gcPU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8cuP2J49otvbSxYGSzQorQptWmuWkYIg1VKjmwdwwQEn9SInvO
	tKv0UyIdwclmi5BkGS0zv/aF0a4RLs5vz2WWOP10iyem6IDxvbwkB1m5
X-Gm-Gg: AYBFou3iEeonhnsh0Lq10Qq1/ycxFerPku7plz4X6GK/EQXqz4cnjreqqs9gysMsoX0
	0pEayIa+2hglL4PIJI7tIEjsBhlBrcntirCPAYOJzI0XrOuUHOK+X0D+F5w68jmIjBZavMAkwo8
	kCoOFFtptm9qaHdca1abo6HKPAQJoTbvJ2fvxTtIXXkQwRhOWNczwuJcEHX8pU81V/m38/czm2m
	ISwkNLA1rpwqljgBZ963sdbeah9yZotN/gMXdwpVAYGti3NswmcM6/yAJ9ADNPbEd9olm8w1DKY
	aJv8DrkYXVVmcR9N7ffXLu85x55AUwyiJIHWwmlLTia8ClQLq6eNt9YWBZONynNPUgXdWylbhpi
	zatWmKKKkyhoaI9SRWJVSMhPAIydKROS9IvDwrE52cJAd5lVakkXE9Ld3dT27sDPKbHv5A8PFS9
	omii5e4rNRRjcw+iZ6b2nweaAokLsFwi1F34P9uQ0pIKLYV2Hu4r7TGsjkSn25hAu+0Eqm8rMWO
	bpGTdAKxAYg0rI9tP9kWXQvqNNidfyMjP5WefmC1M/aNVGM0sjNCdyt9AkddTWhOClfFj70Xqef
	IcxlUU31dcIldklK93XSpxqUxmXXPIKgD/lE2LZGtw1fCMEMMNYXOttdAimav87kO0tgk7NI+qe
	3Qx7c/laHvfWffKNpjkfHXzkMrih+48nY8mMn0sFbnCWFlx/PVpx+kKlgEIjkMzY2MYn1hQ5UYB
	Hg3N3olsxVK20/1EiutOUw89xOYzE=
X-Received: by 2002:a05:622a:408d:b0:536:93e0:4b46 with SMTP id d75a77b69052e-54e13881a4dmr40064431cf.25.1793972601788;
        Fri, 06 Nov 2026 05:43:21 -0800 (PST)
Received: from Mac.mynetworksettings.com ([2600:4041:5c28:200:3d5f:800f:1837:ce61])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ea6a887c0sm20792636d6.29.2026.11.06.05.43.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Nov 2026 05:43:20 -0800 (PST)
Sender: Andrew Stellman <stellman@gmail.com>
From: Andrew Stellman <astellman@stellman-greene.com>
To: Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	linux-nvme@lists.infradead.org
Cc: Keith Busch <kbusch@kernel.org>,
	Yuehong Wu <wuyuehong@cmss.chinamobile.com>,
	Nitesh Shetty <nj.shetty@samsung.com>,
	linux-kernel@vger.kernel.org,
	Andrew Stellman <astellman@stellman-greene.com>
Subject: [PATCH v2] nvmet: accept ANA group ID NVMET_MAX_ANAGRPS in configfs
Date: Fri,  6 Nov 2026 08:43:13 -0500
Message-ID: <20261106134313.34829-1-astellman@stellman-greene.com>
X-Mailer: git-send-email 2.53.0
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

nvmet_ns_ana_grpid_store() accepts an ANA group ID in the range
1..NVMET_MAX_ANAGRPS, and nvmet_ana_groups_make_group() accepts
2..NVMET_MAX_ANAGRPS (group 1 is the default group).  Both then pass the
ID through array_index_nospec() with NVMET_MAX_ANAGRPS as the size.
That helper treats the size as an exclusive upper bound, so the maximum
valid ID, 128, is rewritten to 0.

nvmet_ana_group_enabled[] is NVMET_MAX_ANAGRPS + 1 entries wide, so
index 128 is a valid slot, and the controller advertises ANAGRPMAX =
NVMET_MAX_ANAGRPS.  NVMe Base Specification 2.4, section 8.1.1
(Asymmetric Namespace Access Reporting), "ANA Groups", defines a valid
ANA Group Identifier as "a non-zero value that is less than or equal to
ANAGRPMAX".

There are two visible effects.  Writing 128 to a namespace's ana_grpid
succeeds but the namespace lands in the reserved group 0, which Identify
Namespace then reports.  Creating and removing ports/N/ana_groups/128
increments slot 0 on create but decrements slot 128 on release, leaving
nvmet_ana_group_enabled[128] at 0xffffffff, so every subsequent ANA log
page reports a group 128 with no namespaces in the Inaccessible state.

Use NVMET_MAX_ANAGRPS + 1 as the array_index_nospec() bound at both
sites, matching the array's actual size.  A namespace assigned to group
128 now follows the same path as any other group: its ANA state is
Inaccessible until ports/N/ana_groups/128 is created and configured,
where before it was placed in group 0, whose ana_state entry is never
set.  That entry stays 0, which isn't a valid ANA state, so
nvmet_check_ana_state() let I/O through.

Tested on v7.3-rc1 with and without this patch, in an arm64 QEMU guest
with nvmet over NVMe/TCP to 127.0.0.1.  Before: ana_grpid written as 128
reads back 0, and the ANA log after mkdir+rmdir of ana_groups/128 lists
group 128 with nnsids 0, state inaccessible.  After: ana_grpid reads
back 128 and the ANA log lists only group 1.

The issue was found by Claude Opus 5 running Quality Playbook, an
LLM-driven code review tool:
https://github.com/andrewstellman/quality-playbook
The fix and this changelog were drafted with the same tool and reviewed
by me.

Fixes: 20dc66f2d76b ("nvme: prevent potential spectre v1 gadget")
Signed-off-by: Andrew Stellman <astellman@stellman-greene.com>
---
v2:
- Rebased onto next-20261105.  No code change from v1.  On this tree
  it's only build-tested (nvmet as a module, W=1, no new warnings); the
  runtime testing in the changelog was done on v1.
- Changelog: noted that ana_groups/ accepts 2..NVMET_MAX_ANAGRPS, named
  what the tool drafted, and dropped the Assisted-by: trailer, which
  checkpatch now warns is a non-standard signature.
- Sagi asked on v1 whether this had been tested, and I didn't answer at
  the time, sorry.  Yes: the test described in the changelog was run on
  v7.3-rc1 in an arm64 QEMU guest over NVMe/TCP, with two kernels built
  from the same tree that differ only in these two lines.
- Yuehong Wu sent the same fix on next-20261027 and tested it over
  nvme-loop with the same results:
  https://lore.kernel.org/linux-nvme/?q=s%3A%22clamp+the+last+ANA+group+index+against+the+real+array+size%22
  He said he has no objection to the original being taken instead.
  Thanks, Yuehong.  If you're happy to reply with a Tested-by, it can be
  picked up when this is applied.

v1: https://lore.kernel.org/linux-nvme/20260910154849.66095-1-astellman@stellman-greene.com/

 drivers/nvme/target/configfs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/nvme/target/configfs.c b/drivers/nvme/target/configfs.c
index b3a5242d0..85dda0ca7 100644
--- a/drivers/nvme/target/configfs.c
+++ b/drivers/nvme/target/configfs.c
@@ -709,7 +709,7 @@ static ssize_t nvmet_ns_ana_grpid_store(struct config_item *item,
 
 	down_write(&nvmet_ana_sem);
 	oldgrpid = ns->anagrpid;
-	newgrpid = array_index_nospec(newgrpid, NVMET_MAX_ANAGRPS);
+	newgrpid = array_index_nospec(newgrpid, NVMET_MAX_ANAGRPS + 1);
 	nvmet_ana_group_enabled[newgrpid]++;
 	ns->anagrpid = newgrpid;
 	nvmet_ana_group_enabled[oldgrpid]--;
@@ -2084,7 +2084,7 @@ static struct config_group *nvmet_ana_groups_make_group(
 	grp->grpid = grpid;
 
 	down_write(&nvmet_ana_sem);
-	grpid = array_index_nospec(grpid, NVMET_MAX_ANAGRPS);
+	grpid = array_index_nospec(grpid, NVMET_MAX_ANAGRPS + 1);
 	nvmet_ana_group_enabled[grpid]++;
 	up_write(&nvmet_ana_sem);
 

base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
-- 
2.43.0

