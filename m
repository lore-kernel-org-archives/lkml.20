Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D764DD6F5
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 15:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792166103; cv=none; b=t3DIQfvCeR5J/qoeO6uNHQPqxSCFDI7EINJrGlaS+EYzIeOwHL7eQZejplB5Ne/Fx37XNy2gjsvi7uH4r2narLZkF/FoYpqC0nDwKGFKB7zuHlSTUgB7dsRdGWPuN8+I61H6FTiqVKN/Mk+0R+s8KISfY6YNDsBdd9Ll5+uTqIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792166103; c=relaxed/simple;
	bh=3FHL8H8WmJo3KmMRdVqq/3MRZml1VzjOBDNGQ7/pIfk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B90Vd37aHpYWLpfvTu9FEn9FbArI3mUM4LvkRYkje4VMD3X6g8KwOu922IYgRV6KfdV0viTiRzBajijpg6vYwolXiealR1KIIXnYX3vAmCyn/6/J/zm5Qv5BCN/UQTwBf7lnW8PiFXj2DWxoUJ1bTE3NmD6LvSc+/+Cw4trxIIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=dsCMNsmP; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="dsCMNsmP"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cc147d86bebso122179a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1792166102; x=1792770902; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J2LRXjRZMsgsI6TbLIpT8JXpII70C8p2ozsHbUGAzqE=;
        b=dsCMNsmPgf1gKW6zL0vlBMHZkyr6k0NAJVT7gamrsC7wBYkda9JuMSX9IylZWdJtqy
         hdWvcSzsVeNGWWDdHO0xUttJeOGDuIvo8xjWhIhF8usCFSW3HvW947U5e9xzunulWXUB
         KqgGiDb1hbNJXnFmgX/IIss9SIlkeVeKQ8BYATw3PAaUeYnqItGNJfs4WznkAb6nCQC6
         xA8o0AfrlSZb7jgqnojTL2MkldiNgj0b+wVhSZ9kgHFHUqK+AoNUev5WnOf7TPuuEiEt
         98ZqRn90Dq9e2yfrYoNlwKrk7axR8sbk3HkhvRJGMbnaAk5VxddLsYv+agtl9aBhJrk7
         yiVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792166102; x=1792770902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=J2LRXjRZMsgsI6TbLIpT8JXpII70C8p2ozsHbUGAzqE=;
        b=dlQ+N8l4L5QDzpMb5rOoY5yMy1g1YQsIo6qVke0sUAENs5yys2XsF5rKBYhzaz/gmf
         7a0kzNO0ihOOVupciBNd5niHn9VAVivHEqQ/r2cNM4cY4Axo02n60WrqQNqx4sEDtZI1
         4l1GwuaMYq8YRX01iQVOIeTBEDF37hIqivCJRott8O5r4ILBFmzi3JM5pa8yTuRX12Jb
         RDfGvv50f+JIpHJv5WfeJy+0z3kM5yNXC9ggSuanFC3OJobEIn3lCPWJFDcDQVSvCTfT
         KAR37xu7yOnRFLxcKysVuDFW1KXqjvNHqUs5b7T3ewJCQaDwxgSOwxHhi9n/XGcIsYTY
         JU0A==
X-Forwarded-Encrypted: i=1; AKwUvBzTubWvp7yvFQb6XmDCC8+S/Jiy2zorLF3oqWGCbOBYuu3P2zU4whoqHVbgwp4gHfRu50I+iJMvgPMhuk0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJe5Wl+FUbFpi4u4OVUKwdACYdKq/YcdSxYtlgCamxMOine9o1n
	DJ3H7jbCUNjRGBzJIVAWiq++C3kuNqoVBppyfWPUWGwPWk5VsRdrPVa81mDWnR1dQMg=
X-Gm-Gg: AYBFou1hYHR8+n3HAI/qF0OQO2Bcq5iIv9AA3CEdtuH5E7IDsNCTWurnxcGX0b//q/K
	yILaTzYX2jpDlpDi0p3UPTO2El9rgY9+cHO2E8fzO1e/UBSuKx2yF5D/f8qZ/MFMMjA2LNoHoNs
	/m5wTNnA079B1lkdUpriXrfLCmBTcLPyEpI4MHj6ElO0IlgMb3gvhxbLyBNDSZlViHZFwDWAvS2
	x0MLcPVtzbCDAnmdlGZiGG9iHMS8apnen/j0CQScE0QBvemg8CA0d509M99l0/PHcxDx7D/BCpB
	kvKQY5/kTqniik2/kmksEozwsmlAa89LfmW85Ahr5UTbsHpNlN8TuNDmeW+OY96REuXgzC7o6Jv
	1iM4gdu0mD132POus99y8jD2URkFl7b7YksI3xdvWKsO7T/iOf3eokIWixgWpbguNym0abpyhaJ
	v0oxcF9WpcKfXcbQEYA/N3M8+R3qFA7P20UNhBr/SSn1BPcJAkcJ/ADh3EZvgnHQoAXIkAA1wpb
	xbS06FdqlEuxF3uCb64cA==
X-Received: by 2002:a05:6a21:3981:b0:3e2:1927:3acc with SMTP id adf61e73a8af0-3e21927d82dmr782314637.13.1792166101596;
        Fri, 16 Oct 2026 08:55:01 -0700 (PDT)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:5e7a:332f:f584:a3d8])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd65ab63cadsm983076a12.4.2026.10.16.08.54.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 08:55:01 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: "Martin K . Petersen" <mkp@kernel.org>,
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	yhlee@isslab.korea.ac.kr
Subject: [PATCH v5 1/3] scsi: bfa: clamp the received unsolicited frame length to the buffer
Date: Sat, 17 Oct 2026 00:54:39 +0900
Message-ID: <20261016155441.1607196-2-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016155441.1607196-1-yhlee@isslab.korea.ac.kr>
References: <20261016155441.1607196-1-yhlee@isslab.korea.ac.kr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

uf_recv() takes the received length of an unsolicited frame straight from
the firmware's completion message:

	uf->data_len = m->xfr_len;

	WARN_ON(uf->data_len < sizeof(struct fchs_s));

The only check is that lower bound, and it only warns. xfr_len is 16 bits,
so a length of up to 65535 is accepted for a frame that was DMAed into a
buffer of sizeof(struct bfa_uf_buf_s), which is what claim_uf_post_msgs()
posted to the firmware in the first place:

	buf_len = sizeof(struct bfa_uf_buf_s);
	uf_bp_msg->buf_len = cpu_to_be16(buf_len);
	bfa_alen_set(&uf_bp_msg->alen, buf_len, ufm_pbs_pa(ufm, i));

bfa_uf_get_frmlen() hands that length to the FCS, which passes it down to
every unsolicited frame consumer, and they believe it. The worst of them
is bfa_fcs_lport_echo(), which takes the length as a memcpy size:

	pyld_len = rx_len - sizeof(struct fchs_s);
	if (pyld_len > len)
		memcpy(((u8 *) bfa_fcxp_get_reqbuf(fcxp)) +
			sizeof(struct fc_echo_s), (echo + 1),
			(pyld_len - sizeof(struct fc_echo_s)));

The destination is the fcxp request payload buffer, which is
BFA_FCXP_MAX_IBUF_SZ, and the response payload buffer for the same fcxp
sits immediately after it. A reported length above 2328 makes that copy
run past the request buffer, so this is a write, not a read.

Cap the length at the buffer that was posted. A normal frame is not
affected: FC_MAX_PDUSZ is 2112 and the posted buffer is larger than that,
so the cap only takes effect for a length the buffer could never have
held.

Fixes: 7725ccfda597 ("[SCSI] bfa: Brocade BFA FC SCSI driver")
Cc: stable@vger.kernel.org
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
 drivers/scsi/bfa/bfa_svc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/bfa/bfa_svc.c b/drivers/scsi/bfa/bfa_svc.c
index df33afaaa6735..1ccf2e994a671 100644
--- a/drivers/scsi/bfa/bfa_svc.c
+++ b/drivers/scsi/bfa/bfa_svc.c
@@ -5453,7 +5453,7 @@ uf_recv(struct bfa_s *bfa, struct bfi_uf_frm_rcvd_s *m)
 	list_del(&uf->qe);	/* dequeue from posted queue */
 
 	uf->data_ptr = buf;
-	uf->data_len = m->xfr_len;
+	uf->data_len = min_t(u16, m->xfr_len, sizeof(struct bfa_uf_buf_s));
 
 	WARN_ON(uf->data_len < sizeof(struct fchs_s));
 
-- 
2.43.0

