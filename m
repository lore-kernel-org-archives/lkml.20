Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792994088;
	b=T1rqClQP2rV1MMWVjNSHOE6K/MAekUIzztKInO6G94/8foTHkb/8ljeVUMCQrlevecWb
	 elFkfCzoBdenJR+mQ0kAWShMsKUwLaQVMRysYKoe4x4L8GOfTcG03scJPCAgYxtPYyh9H
	 FcBpcel+BJGBFgATYZhVSA69lJlFsBQx2tfSjteW2Shdog7tm2eRcSZhHFd8pft3o5bsm
	 LxGVr1hZYh1UBcM6ckNmlVkD08Er67o1tfYai5t39ifj29Xc+zxWSUgxDELmtDjNIjO+Q
	 dfsqdeTp/s9sdaGRVELDG8p2ySxVFAU4zHDeISxMzvdvtj/dLL3HCd8MBpsORvnnPXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792994088;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=q9T0zMsyFxP6+f5YwGyxdVkCFKS+Sl9bRWYPaN9yuOM=;
	b=n8/6R06xnUwqKO1SNMiFsHEp+G2/qXAKKb7RFE1Z4RcSNP5KWIAukQe/8IXkw1Bk0x37
	 lCwEgSk9uwgGD+p/jFzxD+zjzmz8EcB+TM391RdjJ4MJKJpGgAA9WcwF+EglRQoeirMig
	 jKjjaoDIBo+4HobXwhHRMZxRpi3Mhlaf5G4/nCmcSod+1iMeDG877Wnmn4VTHZ+W3NeuE
	 y8i/xJqP+VFh377jfGQiRVe/JqLNrvEKqiR0Pf0MboszGLTsUkVBpp6NADT/tQAd2D1NP
	 OnfVefsjibICAtVv6dev0OhpkwEtFHv4OOhnCIe/OdoqbHjBlDZIw+LEMyofl3cNtew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=Az9xVXNs;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B35B606A323
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 05:54:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B35B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=Az9xVXNs
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-36681e85e87so699786eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 22:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1792994087; x=1793598887; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q9T0zMsyFxP6+f5YwGyxdVkCFKS+Sl9bRWYPaN9yuOM=;
        b=Az9xVXNscG3Ck2w9ynNUu0tuCGQR/ioLw6wLRtkWnJEfRtSPq4Ywm/Ips1yXdNN0AI
         Xjj9khi9Cg3v44tlvQl6np9xYQJPO8G9yusr7MdnHgF3e0IdaEKYZaaRxUT/coaeloiy
         5s1hAVBSp2BVOJBNTH91zhkz6RVQGNWU22geHRs6MbrgwzkqzizIWwKLfycyxB1b+gWF
         buMSIpnizvyc4F/xb1+iIKSc2YoQhGVjHzhsuu9IWY7pn3dc7ElmuGhvoij+NyZesvtj
         gQGHfjCxfc98lu0hxwZH62DzogMvLSsa6Uxzv3pOzvSmdCvBznHL7qsrYNAaZo32PiEs
         lqpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792994087; x=1793598887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=q9T0zMsyFxP6+f5YwGyxdVkCFKS+Sl9bRWYPaN9yuOM=;
        b=ACOEB9ei7JNNNCD47NaH92cDTX7UUL4PqrA/tH2OfGY6P4QpsB+uA+K14ixMzpZO5n
         wLlufe47LqcxIKmkgou0SxmObrXai3eZmm+1qfGNbtg1zeJlGs0kaNwQqU//yK8tbrWz
         f19avXob6l59Fy6NRU6S2RaVttHbXK+R6DiHjDlaqlYP+2X7Ekr9iJIyZFcz3A+K4jdg
         Krt/W2yt3CqLB4m7aFhyeIlXPDUGvvEkzy+EFSpzovXNsxCarzPeo92sTy4jK82HHDRF
         BTaYHhizVU+00o+qWj+awVeiL6QzfE7Rj/bK3aq/ly+i25QPRYyVT6M7yusEGsKerSkp
         HCEQ==
X-Forwarded-Encrypted: i=1; AKwUvBwxc02r5pJXKkneap16NrDN2OCh9Sd54S02txCN2dbJqPS8TIa44LMKlKYOi+PFT1ix5nIXYzETW1X5NAo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJbLzZQJHwkwSnqqYGHhUYscNk7HAPY+FubaxHhtNDdjAuXedAT
	a5d12hkVgYJpHcRkf3+SsvTH8NDvgSmXVyCYoyqF4Eh4Mp9yOfAQ38GdeotMGKHXgyE=
X-Gm-Gg: AYBFou0jDALDe2V5H0Yry6M7aASY4vBVmOBkKtoC9CqSy6ZRbvN0rcCcK0VEPabOKMv
	wzOgT2qb2RkxhcX4UikBYtcNDzzQaBxpag42YqVbzS6+DGoeL0bfszqFWa5pVVsruIXVY0I6HrZ
	TiOxGaUEbz6za80pzSvyQSP52wuAIZfMC+n6FET1jL9cbgFKiwufBPkP7oM4uRZVKsoOm0E4uA4
	TRCvF/gLV3RKJIV1lSmXs6SB5JU5Kggoav5BMflCyg8XfvR3eIjkU2PEDMeRcgKds2TKyDGIbB1
	vhfMg0wkHruW0Hp7646NEza99oeuYZkZDa149TEb1lJ/V++HAbA/QfOWVSUXDuFTrajby0qmOcp
	RzAPRjO3Z+1aoADHH0qFbnfc056j/IvAjCMnSkZvPnZu0sMCpcRjpO67yheToZQIuuYgLadI5hX
	mdUTvdL+p4aWvLuJTjTRF9OiuOocEtOuSxs9TW46jBMbN+IBIs2BombNuFWP8Pd22fmSkPU7who
	9Dg3ErW2f/f/UazQStmbFyTR8tlXeDkt1KBUfVhFGsNBX3i/Z8kW8QJBo3WvTaELFZX91iZnoyH
	1OD7Auz1muCY677y4qlJZVZTeFn0lDAXNpCeG6qFTLjn4n31
X-Received: by 2002:a05:7300:599d:b0:351:2958:1740 with SMTP id 5a478bee46e88-369e84e5603mr9189061eec.37.1792994087240;
        Sun, 25 Oct 2026 22:54:47 -0700 (PDT)
Received: from yhlee-960QFG.. ([125.131.91.97])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8d845ddsm22290613eec.11.2026.10.25.22.54.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 22:54:47 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: Bart Van Assche <bvanassche@acm.org>
Cc: Leon Romanovsky <leon@kernel.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	yhlee@isslab.korea.ac.kr
Subject: [PATCH v2 RESEND 2/2] RDMA/srp: do not DMA-sync a receive IU past its mapped length
Date: Mon, 26 Oct 2026 14:54:30 +0900
Message-ID: <20261026055430.406487-3-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261026055430.406487-1-yhlee@isslab.korea.ac.kr>
References: <20261026055430.406487-1-yhlee@isslab.korea.ac.kr>
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

srp_recv_done() syncs the receive IU with ch->max_ti_iu_len, but the IU
was mapped with iu->size.  Those are the same value only until the first
reconnect.  srp_cm_rep_handler() takes ch->max_ti_iu_len from every
SRP_LOGIN_RSP while it allocates the receive ring only when there is none,
and srp_rport_reconnect() keeps the ring across a reconnect, so a target
that reports a larger max_ti_iu_len the second time around makes both
ib_dma_sync_single_for_cpu() and ib_dma_sync_single_for_device() run past
the end of the mapping, which breaks the DMA API rules.

The HCA itself cannot overrun the buffer, because srp_post_recv() posts
iu->size, so sync the length that was actually mapped.

Suggested-by: Bart Van Assche <bvanassche@acm.org>
Fixes: aef9ec39c47f ("IB: Add SCSI RDMA Protocol (SRP) initiator")
Cc: stable@vger.kernel.org
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
 drivers/infiniband/ulp/srp/ib_srp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/infiniband/ulp/srp/ib_srp.c b/drivers/infiniband/ulp/srp/ib_srp.c
index a85d28b95306a..159d6b6aa93e3 100644
--- a/drivers/infiniband/ulp/srp/ib_srp.c
+++ b/drivers/infiniband/ulp/srp/ib_srp.c
@@ -2111,7 +2111,7 @@ static void srp_recv_done(struct ib_cq *cq, struct ib_wc *wc)
 		return;
 	}
 
-	ib_dma_sync_single_for_cpu(dev, iu->dma, ch->max_ti_iu_len,
+	ib_dma_sync_single_for_cpu(dev, iu->dma, iu->size,
 				   DMA_FROM_DEVICE);
 
 	opcode = *(u8 *) iu->buf;
@@ -2148,7 +2148,7 @@ static void srp_recv_done(struct ib_cq *cq, struct ib_wc *wc)
 		break;
 	}
 
-	ib_dma_sync_single_for_device(dev, iu->dma, ch->max_ti_iu_len,
+	ib_dma_sync_single_for_device(dev, iu->dma, iu->size,
 				      DMA_FROM_DEVICE);
 
 	res = srp_post_recv(ch, iu);
