Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792928535;
	b=kTbZt5/dzVL0mnjlDK4glCFlFkVHRiQR18LoO0SO0K0MDs9StY4RFuvi5CUXHEye/iqg
	 ZH/4IGQ9dJeevyrg20jwNpHIIIj+5Mspiba13MGeAnfH6VgpzDFapbaL1rArzjLm4g/Cf
	 wxcAZbURVlyRyPgDlV8TMIMBTe0tywoB7YVnwJ/NFggPmiNnVzOtqIqC+Z5JpHpIT202f
	 +kFJ0X02B6rv5/ATt5W03hbRcQqemu5IPnrnOBLj2zImegROuBmC8wy5Pv3BdolP053iT
	 ZKP3On+1Q3wo394v3MHaPxEVya/DkUy26W3YmPleuEocM2zUG0GJb+K/JkJT4iDSguQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792928535;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=eKGclNvWgUqyUYzP51bT4mzycc6IKVIeGzeiBZdeKY8=;
	b=F2gQxNL//wExt7gfZyd6eGuv7P7arRLkNvJ2zIz3T753aZL+MIqj26NgdMtGG1z1Idht
	 /kv1+cLBrZD+5KVRnlmmG1p7HTsEr+8yhKpgqSWAnzkVDWEOQQSowcEKmDzfEKLFRj7aD
	 x3gyHQi1ciwR1srJFwk0FgjiSYFJtGUaM3eVxhmzaVKsOn6NXI3UeztjQ4JqtJEwA7Ywt
	 FjUolYngbpLYPTr9D6XFQIL912SwTOd7HfjwzgQ5hrWmmT+go4amboSAuZ6fHm6cTzK5A
	 QqZfp+jRrTSnO4vRg9lrus464N4xuZtpAPKum25fY9SpPc8LYICEchhzd93lRa6K9ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=U8j+IzmY;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB98606A31F
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 11:42:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EDB98606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=U8j+IzmY
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3adc4590de4so1543280a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 04:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1792928534; x=1793533334; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eKGclNvWgUqyUYzP51bT4mzycc6IKVIeGzeiBZdeKY8=;
        b=U8j+IzmYH/pXSKWVIUwus2HUH+rGH8aZ4T8suJNpGewLFnCD7J5rvzI0HfSiYCPSVZ
         UU4CkEMO9Qqy2W5QvDKlmwHH/tbrDBUXcW+av3RsVX87Yr76Pcq2W4fqtINnH9Dj0YAt
         PMT1xCU8sCW8NDrXZD7L89UuKvknbqIDeWPRU0pyXxNlktk/2pQo/MiFFoAFQc/QXQJm
         CkiPrXK0z/fSuNwg/322gb5PCMGD1njFA5/U9v7Uy42Xg5UcrgXotJ4/DNDnAPW2vh4m
         oQWEI0QnVs/dLN9i8IBZti+bNhXgdtmXhofpsOoPgmWMCSXUEn8tr/h9gmkuOJw2jxJg
         U2NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792928534; x=1793533334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eKGclNvWgUqyUYzP51bT4mzycc6IKVIeGzeiBZdeKY8=;
        b=VAoaUf2E1iuS1ADcEQ67mIZMRwVkZ6ytxxoYcvezYpHK9fIWwXbBJ/Ik1DjZrZNti6
         8tMpHM2v7ekP+RREiR3ZbpId8ZaDan6xKs/cRzzN6wgwuJ0Oytve8337ogGU13pw/3XX
         +GSwXmQSZWKjD68jzBGlfAGzR+F1tEzqztfct/SHXr8UJdopcv3MQnOOMwv//fdhPbAF
         AEIeYULw3SOhTqndERYTwMHmgYKupvzFrDf5MyzowWDdlRxEK0juU5HWFT3PdB/0PPFH
         ywATOLah/33LEnhaB7M+CVDOvAu0bDatf7RTrYUDq6yBWa3RpogIZsbxX+/EDdywS8AC
         aB9g==
X-Forwarded-Encrypted: i=1; AKwUvBxNVjPJORy3QuylAD8gLyGHJv5lH9S9ziGYq6dDxqm3f9dFjbvk0oa17EOKGOlXl+8pCrNt/5bsgob0W50=@vger.kernel.org
X-Gm-Message-State: AFq9FYIuUlhmWnO40GCTYrXYYdznCY8vs/5GvuS9tJRQQZiAfZhcf0D9
	l961Pp5lqA2W7mReUD9pPoipYy1tSD1RBqZVN5bJU5vcueUlU6GO+wpM9GLEHb3pqak=
X-Gm-Gg: AYBFou2FWPvAYbbbxD6Zz3wOVHl8U2vd3D4drDbSE5cM/uqNLoT90eFb3dzaGQPkYP7
	m7KoKKFvPq3DVibKIuXmp/5QxbCIAyYO9W/v6FjwSdwu0Cu295Q0KXr3X7sQUi95X2QlS8s9VDW
	KpiwZWXfsQE7Ah7xM89kM6s2YlrK3MfBp5O3gQ3AKRl0mV1dCDOmBuxS6qREPkjff4a7Q5edu0g
	cvjZ0ykTSUN/hOs9ZPIbocnn5Ot7kPTt6y9ddzxxGgmgJ8vzTqOqaEtLubg7ueibCY/ANnefOLz
	g7tOl9kHhJLkztyRropXhoHGnK1mvCFzGxs+sCXmhDQDu/1QkeRBMaA5zrTTmdh5CZeeCER3h/8
	Xq/8iDdGGiCqOSBOOWBQOsl4a9TWly1dOBsFDyxe0BJOJlQu2Wz4eD5h7PS0JLgqt9tjoHL7Due
	hO7ab335vY3nsPeA7FDqMIZeNcKj9sfnek5SEPKVSonZ+4secr+k3CcaDtrHCgMP3wtGUILdd0i
	y+V5rqB6SSR2mZ1sDqb8rVw+d7zu4lTR/A9nX+LPCYooQ8HdOWosv9zxZukEGbCvdQ/j7k8r2n0
	yMNExHvRIdHD3v5+ckhXRujQTFrtuJRxBgsUtSmX8QDKZBFncZj18EQ/Se0mEjhVPw==
X-Received: by 2002:a17:90b:57e5:b0:3ac:a7ee:6770 with SMTP id 98e67ed59e1d1-3ade9b2f223mr3775889a91.7.1792928534279;
        Sun, 25 Oct 2026 04:42:14 -0700 (PDT)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:dba3:be57:a674:a67f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adeba32e38sm5219705a91.2.2026.10.25.04.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 04:42:13 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: Bart Van Assche <bvanassche@acm.org>
Cc: Leon Romanovsky <leon@kernel.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	yhlee@isslab.korea.ac.kr
Subject: [PATCH 2/2] RDMA/srp: drop a truncated SRP_RSP
Date: Sun, 25 Oct 2026 20:41:55 +0900
Message-ID: <20261025114155.4007867-3-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261025114155.4007867-1-yhlee@isslab.korea.ac.kr>
References: <20261025114155.4007867-1-yhlee@isslab.korea.ac.kr>
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

srp_process_rsp() reads the whole 36 byte SRP_RSP header, the tag, the
credit delta, the flags, the status, the residual counts and the two data
lengths, without ever checking how many bytes the target actually sent.
Its two siblings, srp_process_cred_req() and srp_process_aer_req(), both
refuse a message shorter than their header.

A short response therefore makes the initiator parse whatever the receive
IU happened to hold from an earlier response, since the IUs are reused, and
act on a stale tag, status and residual count.

Refuse it the same way the siblings do. A conforming target always sends at
least the header, because a response shorter than that carries no tag to
complete a command with.

Fixes: aef9ec39c47f ("IB: Add SCSI RDMA Protocol (SRP) initiator")
Cc: stable@vger.kernel.org
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
 drivers/infiniband/ulp/srp/ib_srp.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/infiniband/ulp/srp/ib_srp.c b/drivers/infiniband/ulp/srp/ib_srp.c
index a85d28b95306a..d891029087b7e 100644
--- a/drivers/infiniband/ulp/srp/ib_srp.c
+++ b/drivers/infiniband/ulp/srp/ib_srp.c
@@ -1946,6 +1946,12 @@ static void srp_process_rsp(struct srp_rdma_ch *ch, struct srp_rsp *rsp,
 	struct scsi_cmnd *scmnd;
 	unsigned long flags;
 
+	if (byte_len < sizeof(*rsp)) {
+		shost_printk(KERN_ERR, target->scsi_host, PFX
+			     "dropping truncated SRP_RSP (%u bytes)\n", byte_len);
+		return;
+	}
+
 	if (unlikely(rsp->tag & SRP_TAG_TSK_MGMT)) {
 		spin_lock_irqsave(&ch->lock, flags);
 		ch->req_lim += be32_to_cpu(rsp->req_lim_delta);
-- 
2.43.0

