Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794577869;
	b=OJdmRO1FJwz0728DoppldetLXEob4c9v898QpyKnjiJMI6JUYlmK1c/cbxLbhov2yvs7
	 BbdYQkdQNbnHA5L87Gr2GVVA0T2R4UySdk9MQb+dXnzFcjLtr5BZLakStFFQvXOV10hUA
	 mLbP7uVOeoo5Ttywi/erUwLV4Cor7nZyYWDZSsNY0eWiWuKJ0opunWLv2yMVHCIju1gTu
	 9jvsoqtzPgh4/er6JLoGpbNDnl4b46sy+24zcCH9tfHG6ORoa+lpCr9S/shkk2r3clc17
	 O83FFA996EE8/Uo1VjqmekufZP0EEW4G6LWUYfI2zmE9vefstMjDW10lE328EKDiCBQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794577869;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=7iTF7pIbSI90EquAmYpExtNdo9tex/uprtpCYXUB6uQ=;
	b=H7AvF+8gkAie739tk52PQC9xWYFgKUIRqzPp5Uh+/CLgHt/w2wvlmDw+K/0u8Xu/Hhfi
	 nWSHGbs+prJ0PGxr7jReASeHDDkaY+VSGVFjqYcRChQP0dzezu7DhKRj/bWxN8UuVdmVF
	 Hy7anPLVUyFPq0TSg4WW7YMdxci2I8OkVVq5wlwwe+mDu7qj9N/vGc+pD/8CcKZfW7q+m
	 2G4ZJwlefnTHGrINeQ3vxhF5hLuad3KiNsTTTYjdm5gEpwxfJaHTgcTRB8OWOj/Ed7+S/
	 qIF0zsILPA5NSxA1HalwYt7q0V4NMamknMO4s4SguoQD6krUYBn+nX8RK8xc8waSsrw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="f2EQC/+O";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 324F460A381B
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f2EQC/+O
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794577868;
	b=BFiljRcpjRD0SKKtMCYD278synK8AD1rfRAFL84mnUjPr8yPIqwosXQEEtga9p+X0qhq
	 zvpArFCtKrLb+7LuHsPZfMHSHKyT2WtnXdbhE1OyXW1/JaOD9jHEKDpnV+4TB7D5ocxpf
	 TiCZYf9Tr0l05rwg02+ZfeIYJvEVtU+TvyEzJbMWfzdKBtse/hoqV1jb8YwbnH4pSe/Js
	 wVKIZL2UtbRYedczfzfXEk0IHZBqGIj9K2hlnaG/dwOtMe8A74ANex5HoLCrv+UbCUw42
	 ViLJOovHkbU1iiZxE2G32zAmJ77H5yk6L6P5Ivp2eVZadCViY3sdZYoSelkKgkDLvng==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794577868;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=7iTF7pIbSI90EquAmYpExtNdo9tex/uprtpCYXUB6uQ=;
	b=qeNS88j9X+HHokoYUX0DVvDbEPlfeQ7/36yHwTgSuQBCg9gIfgVIRi1omN4F/zC5KWAk
	 uuH4X2FOKiDUKCc8mQ0Wgd+935k5qdaNwDNfX6Ofe1lLBmvEnieReIgZDSDUSFk0UJARp
	 61q2KuZl4nqUxRXStZrE+kVaCFJipV5TqFahX0/oGvQcKKUuOwAD+zHyeuS36mYrOAkuq
	 64vsEHrh9HGnbseNIcR77JXiDagWnALcTp8PmtY468syra60NuszVB5eskdQ0nUqOaP0Y
	 oGPnmZoIhlNs2WwA6wItBUH5PzwWkQGZg5IY44xR9CBWivgW38DN2SP4SjEJwLHJO8Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 40AC01F000C4;
	Fri, 13 Nov 2026 13:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794577868;
	bh=7iTF7pIbSI90EquAmYpExtNdo9tex/uprtpCYXUB6uQ=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=f2EQC/+OjcOQbEqq4yNuuu/dwTtCXMIMZSWlwQT4eXpRn3js+OCz9t9xXgQmxDaDx
	 6LGx110X7ug2fon3qktqDWb/dIb3PTJucJazSAjMTi5apArZ9VY6QxcEMOS9F8d/ld
	 V0EojiJErZsLuTl7uUWKs7H0pMK65RJ6KYJsdVaPFB2R/IE51OaJfr2xFiVcUMvhBX
	 e3+eJl/O7yw29GQKkDottjGbMviWqRadpgmR57/V4HhNtjozskp3mb/YYJnhgCWmuN
	 Edw4srgEREA+YXxinwE5VOHJvc+p3ApHAqcP7vJOL8nnyRL3TLb9gBKHJBYe658H5A
	 1Epf3m8k7MzmQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 92D30477D6;
	Fri, 13 Nov 2026 13:51:07 +0000 (UTC)
From: Suyuan Wang via B4 Relay <devnull+shyckless.gmail.com@kernel.org>
Date: Fri, 13 Nov 2026 13:51:06 +0000
Subject: [PATCH] misc: genwqe: Require CAP_SYS_ADMIN for flash access
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-genwqe-v1-1-75e064a19068@gmail.com>
X-B4-Tracking: v=1; b=H4sIAMoV92oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQ0Nj3fTUvPLCVF3TpCTj1BSz5FQLIzMloOKCotS0zAqwQdGxEH5xaVJ
 WanIJSLdSbS0AYOrb+GoAAAA=
X-Change-ID: 20261113-genwqe-5bb3ed6ce826
To: gregkh@linuxfoundation.org, haver@linux.ibm.com, arnd@arndb.de
Cc: linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794577866; l=2975;
 i=shyckless@gmail.com; s=default; h=from:subject:message-id;
 bh=2IDS6cWesHgEyQ0y9gHSZmaX8tXkBSHw4f0W7fyXhNk=;
 b=TE+beaQCQz1FaapfPVum3t1xHPsVCLUHh2ruJxVBjTVxH9Pcsx+YPEDBWjPUxDQQyneHcOvs7
 7a1mzWEAdE9D9oaz+FMyTw+FMusqeHv5e3ecD0madxhfN38otJ4pObv
X-Developer-Key: i=shyckless@gmail.com; a=ed25519;
 pk=pMtccVGiWES3bV+7YBFuBclkvq2n2HBHQ5azaBrK2lY=
X-Endpoint-Received: by B4 Relay for shyckless@gmail.com/default with
 auth_id=1498
X-Original-From: Suyuan Wang <shyckless@gmail.com>
Reply-To: shyckless@gmail.com

From: Suyuan Wang <stevewong@hust.edu.cn>

GenWQE device nodes are created with mode 0666 since commit
5ed22cebbacc ("GenWQE: Change default access rights for device node"),
so that normal users can use the accelerator. The ioctls that write
card registers and GENWQE_EXECUTE_RAW_DDCB check capable(CAP_SYS_ADMIN),
but the flash ioctls don't:

    case GENWQE_SLU_UPDATE: {
            ...
            if (!genwqe_is_privileged(cd))
                    return -EPERM;

genwqe_is_privileged() checks the privileges of the device function,
not those of the caller. So any local user who can open the node of a
privileged function can overwrite the card's bitstream partitions or
VPD in flash with GENWQE_SLU_UPDATE, and read them with GENWQE_SLU_READ.
The new contents stay in flash and can leave the card unusable after
the next reload.

The same SLCMD_MOVE_FLASH command can also be sent with
GENWQE_EXECUTE_DDCB. That path translates the buffer addresses but
passes the functional unit and command from userspace on to the card.

Require CAP_SYS_ADMIN for both flash ioctls, and for SLCMD_MOVE_FLASH
to the service layer through GENWQE_EXECUTE_DDCB. Other commands on
that path, which is what applications use, are not affected.

Found with a static analysis tool and checked by hand.

Fixes: eaf4722d4645 ("GenWQE Character device and DDCB queue")
Cc: stable@vger.kernel.org
Co-developed-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
Signed-off-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
Signed-off-by: Suyuan Wang <stevewong@hust.edu.cn>
---
On GENWQE_EXECUTE_DDCB I only blocked SLCMD_MOVE_FLASH, the one service
layer command in the UAPI header besides SLCMD_ECHO_SYNC.

Compile tested only, I don't have a GenWQE card.
---
 drivers/misc/genwqe/card_dev.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/misc/genwqe/card_dev.c b/drivers/misc/genwqe/card_dev.c
index 5a07e8403e97..13adcf17df7d 100644
--- a/drivers/misc/genwqe/card_dev.c
+++ b/drivers/misc/genwqe/card_dev.c
@@ -998,6 +998,11 @@ static int genwqe_execute_ddcb(struct genwqe_file *cfile,
 	struct file *filp = cfile->filp;
 	struct ddcb_requ *req = container_of(cmd, struct ddcb_requ, cmd);
 
+	/* Same flash access as GENWQE_SLU_UPDATE and GENWQE_SLU_READ */
+	if (cmd->acfunc == DDCB_ACFUNC_SLU && cmd->cmd == SLCMD_MOVE_FLASH &&
+	    !capable(CAP_SYS_ADMIN))
+		return -EPERM;
+
 	rc = ddcb_cmd_fixups(cfile, req);
 	if (rc != 0)
 		return rc;
@@ -1150,6 +1155,9 @@ static long genwqe_ioctl(struct file *filp, unsigned int cmd,
 	case GENWQE_SLU_UPDATE: {
 		struct genwqe_bitstream load;
 
+		if (!capable(CAP_SYS_ADMIN))
+			return -EPERM;
+
 		if (!genwqe_is_privileged(cd))
 			return -EPERM;
 
@@ -1171,6 +1179,9 @@ static long genwqe_ioctl(struct file *filp, unsigned int cmd,
 	case GENWQE_SLU_READ: {
 		struct genwqe_bitstream load;
 
+		if (!capable(CAP_SYS_ADMIN))
+			return -EPERM;
+
 		if (!genwqe_is_privileged(cd))
 			return -EPERM;
 




