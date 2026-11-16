Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794796784;
	b=bhp8+N+c77xSkeNPGpPIPGzOGZ2IbSaeSGK/4GD5hPyvKzeEXkcShEFiKhUmkjhAWpgq
	 t73Em2prhJUkis8v5HX2yokqLRc8/1ODaKG2wfKirAx+Y8PeJh6GNBcjJ+J5PMLpNGzgJ
	 hUN6uCFeHuq6becgNwL6olavDO6t7NT5tFft8oDVhtP1ENjy34QpSs9KEuipW98SKCGv+
	 kg6lMaSQ2clpi6ILOuQ4ms9YSMBgazwQcJ/F61Dg3oymb2u8v5wkP7Sn2QmI+6X1dd6UQ
	 dX9CrNWPvSD6tfApommLOaE82TXYDb+de66vw27RRJRK26IE4oITUTxZUWxJKsP71pA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794796784;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=W1VDz9lyYjusMl+WyanPC/YCYkBINyyegwMMtwqSAfo=;
	b=vwL3UxMKQQKl5UnobNOUBgvBxvauMxoAjPSK01rli6x3DrCHNfOyGMKrB7MxzMR+bGKP
	 5GPyV86pbBMX22Qgg3uO+W9ihz7kSSHEONTfXa97+w+humiFOF120yjgrgWOqHxeqGBF2
	 SXZLlNwABPeg1JFrWiba8ppPYF32OE33xHK4BHGdn/2S9hzcUXzncIulcDQQBRq4Wargm
	 eaw96/67MBqiT8RQQvvQPXAg/G0T7U1aIXh2MV740QHdy0pei8f+onva1nxNgpKa+b1un
	 LXySWq5wFLgYTfanZQPeIF8yHXxlYfZejiM9li2FU0wBXIpxp5+7/XX5Lc3qmpwMo/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z7gDma7P;
	arc=none smtp.remote-ip=209.85.222.175
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB58606A321
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 02:39:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CAB58606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z7gDma7P
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-93f1e5d7450so386956185a.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 18:39:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794796783; x=1795401583; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=W1VDz9lyYjusMl+WyanPC/YCYkBINyyegwMMtwqSAfo=;
        b=Z7gDma7P5PpaLN0hhr8r/VvOPWXLIsWiR+vO2v7kNV+r4QzPBoZ34CmGj6A0RHlvUn
         cSKLubOdcQTssAoeTypaPDrHRM4j4gtOf+aULHrdtVkeAsbanmNNGZoQg93pP6DDy17R
         O+WLuL9ZTU78x3c0vSQ42M8Fm+0Nyc+Cisn76WGVD/5Pp95BQCF1CNpJTh4PdUvgw2Ij
         ZSLUPYbafUQMksZgVm5IpoKUzX00QZKaYhOxxTpCx85wXtWWmhx+PN06nxssfqnBCH/8
         9qFaqMjaw2AsFMQwak8RxhW/S/pZ6UrrvO6CouaB7C1dkF31fgn4EM0tsO2VLN2olW9o
         08QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794796783; x=1795401583;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W1VDz9lyYjusMl+WyanPC/YCYkBINyyegwMMtwqSAfo=;
        b=kDkSqGoXSkz6oWXDXcxUqe133kE/TJVkx40ZitD33OtzFJg1nrtrJJdyFI5N8i9ryF
         BHx6m6ajDX91cr/kWHygBQLR7gNYVodeV0cVaKrkdBRvdnu1lrx54lVlhZO+BDSZi/4E
         cdbF/W7lAEhg+D6bVcpRtYDHyRhegI3Ughg/nmX1vG4/GjkmYd4YxKcLLItnXQg0Yt9A
         GO8fsariDzFjhGHgJBM6C6cY2Zn+IAxKbzrvEJLnvl9ibaPBRe9kYIBbwenGaiwvhAQT
         NsoMelZPmVMxf2Cq06KiZ2HlanmgrDUbZomu1tMJ392RARcE5YJNFbRDruSDIY8TdbXp
         86rw==
X-Forwarded-Encrypted: i=1; AL+hErG8h9fWGb7peFn/rpPPZoJgwJCL39hyTmxrRtbPaaxvWTaID73iK0J6cyRt4FOtRrxKNhuM87K/qdp/XXg=@vger.kernel.org
X-Gm-Message-State: APuU4Z85a6iV5Ml3SxjzXzLE+yYZS6aj7sU4kFGMCFH7XSOD0AwAqika
	P3kAxT6kD++hx+qDCnnOsngnvdihsVF1tVLhSYd8YyFV8sXoB3/yp5ef
X-Gm-Gg: AYBFou2CGW9NwfDMZtFLQRf2F7fQLSNCPaMaFmQpdPaBad2b3Bh6L7J8UbYGZA6lv7s
	4v1nNxk1mX37wl/jvxpQRjPO0YEZyNN5zi6Kx4XU1oTq3k9iqfqJi/5v0v7m1uq7hz/rP/14fLw
	xRpxuGx/1ZlhddLLgU+8KDQFXYZbGpRuLPudZ7m+HDX9BL3wY2kOzGqt47HllcrN1NNQlO6NwaP
	xajur20NCehKD0vhbve3X0Wrul9J4RKqL6p3zRczaNf0rwugZUsdf9gagD00d8UN0eGsLuJIBT4
	vy5LXnVVoSdKXmBNIlzc+Z5vP28uuLTjAtVL2GLwRev/8cQbGs/u4sbKtaFKaMYxJZMG78WzDvX
	AyAQlKKcCOI8zMcTuMM7jq1rOMz7i2wECtlj0U6n9PzUZ3K7qpN1xlVKweI6E0xV+glr06Dyv1W
	D9VtvaxYcAuGy+lcSuUdUCdsRfhXKXBgzoPqUpw/ZpOykdsofv98VTKEsYbF8Pil37Iq8s0+sif
	ZG2/pmGH3CS2HqZYL3GEJdnz7bDken1xQpB10Nx+vmeVMrQiQYkyUuq1Cr95/DF7PamtLrCXr1y
	xKEbxIsNHulwD9Cc3bSXf3CIL6DkrI7wG8/zUZojz1Hsq5/qHQMPIABBegnZrVDs2sMK4mJ5uJk
	3taw4nHECe060sZvisr1TYg==
X-Received: by 2002:a05:620a:2903:b0:947:7f9b:f839 with SMTP id af79cd13be357-9494bb706d4mr1584260985a.47.1794796782744;
        Sun, 15 Nov 2026 18:39:42 -0800 (PST)
Received: from linux.. ([8.34.174.240])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c8f92bbsm747000285a.40.2026.11.15.18.39.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 18:39:42 -0800 (PST)
From: Changyul Lee <lcy8047@gmail.com>
To: Justin Tee <justin.tee@broadcom.com>,
	Paul Ely <paul.ely@broadcom.com>
Cc: "Martin K . Petersen" <mkp@kernel.org>,
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
	Hannes Reinecke <hare@suse.de>,
	Nigel Kirkland <nkirkland2304@gmail.com>,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Changyul Lee <lcy8047@gmail.com>
Subject: [PATCH] scsi: lpfc: Look up the VMID entry under vmid_lock
Date: Sun, 15 Nov 2026 21:39:39 -0500
Message-ID: <20261116023939.588838-1-lcy8047@gmail.com>
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

lpfc_cmpl_ct_cmd_vmid() looks up the VMID entry for an RAPP_IDENT
response without vport->vmid_lock and takes the lock only after the
lookup. lpfc_vmid_get_appid() can meanwhile hash_del() another entry
from the same bucket under the lock. hash_del() clears the next pointer
of the removed node, so the walk stops early and misses the entry that
waits for the response. That entry keeps LPFC_VMID_REQ_REGISTER, and
the I/O of that VM is sent without a VMID tag from then on.

Take vmid_lock before the lookup, as lpfc_vmid_get_appid() does.

Fixes: 33c79741deaf ("scsi: lpfc: vmid: Introduce VMID in I/O path")
Signed-off-by: Changyul Lee <lcy8047@gmail.com>
---
Found with a static analysis tool we are developing.

Compile-tested only, with x86_64_defconfig plus SCSI_LPFC and W=1.

 drivers/scsi/lpfc/lpfc_ct.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/scsi/lpfc/lpfc_ct.c b/drivers/scsi/lpfc/lpfc_ct.c
index f709e5087577..af720ccdf1b6 100644
--- a/drivers/scsi/lpfc/lpfc_ct.c
+++ b/drivers/scsi/lpfc/lpfc_ct.c
@@ -3613,14 +3613,13 @@ lpfc_cmpl_ct_cmd_vmid(struct lpfc_hba *phba, struct lpfc_iocbq *cmdiocb,
 
 		hash = lpfc_vmid_hash_fn(app->obj.entity_id,
 					 app->obj.entity_id_len);
+		write_lock(&vport->vmid_lock);
 		vmp = lpfc_get_vmid_from_hashtable(vport, hash,
 						  app->obj.entity_id);
 		if (vmp) {
-			write_lock(&vport->vmid_lock);
 			vmp->un.app_id = be32_to_cpu(app->app_id);
 			vmp->flag |= LPFC_VMID_REGISTERED;
 			vmp->flag &= ~LPFC_VMID_REQ_REGISTER;
-			write_unlock(&vport->vmid_lock);
 			/* Set IN USE flag */
 			vport->vmid_flag |= LPFC_VMID_IN_USE;
 		} else {
@@ -3628,6 +3627,7 @@ lpfc_cmpl_ct_cmd_vmid(struct lpfc_hba *phba, struct lpfc_iocbq *cmdiocb,
 					 "6901 No entry found %s hash %d\n",
 					 app->obj.entity_id, hash);
 		}
+		write_unlock(&vport->vmid_lock);
 		break;
 	case SLI_CTAS_DAPP_IDENT:
 		app = (struct app_id_object *)(DAPP_IDENT_OFFSET + data);

base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.43.0

