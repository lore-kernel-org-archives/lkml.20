Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793461693;
	b=ymTeQRniS90p8ggF4K4LG/roYEClIagLP9XyWXptogA6cOXGSPlJtLw8OzbaSFjC8DkX
	 coq0Rb8snAnNJMWWaQY6cbJ3kFa6OfO94wBFTJuqRPefupq/1VT4bABaW/Y45GLuJEBdA
	 7jQv8I2OeaVPJ8pxyy7uAATC2yqX4lglX/G/+4LpiGDcPfHJI9Yi5p32nbaWpBojkmHAv
	 kVO7CM804z8uknWnfcyKRvJiazsFTzaJjei1YT+V4HDitlD+aoL3DEAUxrBXOo5nHy/T9
	 oEpX0Xp2jo9YNVHujYTaZ1uajVygbqhNZCboIeZnA06QXn0GfFhEXSPMmsAuy2Ntjjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793461693;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=0B/Jt4PrkjhDnRBbGsYYmLETRWHMQgnj6GHzv/YqbfE=;
	b=nQO2pJVst6Adj3/CfScJW3f3zfKDOa0osO97spe7lwgqCFek3+3C40cCIT5ed4bU5ybm
	 AdZJ2dfLOHYYJvduxbjOzE6J2WAg20oHxLArVikj+6fPKMGfukpIygjkjk7fRgdOhgkCW
	 V84FLStd36l2xJrww1PZyHpSIQE02q+Zer/RZEAKS8+9sGo+EVj2qpfozLqAjZMNCdFzK
	 EYJbVHKLlmE2L/VCysWbYU4J+wkxkV7cEY0FoOyYQde1zgNBS5/iVpB4rMrF5EPK9XZZK
	 Lb9GWPTxfdBej/m5ElGdsWU1+PexqNS3A3Hd2/n6zhwefZ1qh+EzUfJ0/A+6fXjZFiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b="eqG+dkL/";
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=ZUivIN9B;
	arc=none smtp.remote-ip=148.163.135.74
Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30AB0606A31E
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 15:48:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30AB0606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=eqG+dkL/;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=ZUivIN9B
Received: from pps.filterd (m0167072.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VDmT2K3266650
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 11:48:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps01; bh=0B/Jt4PrkjhDnRBbGsYYmLETRW
	HMQgnj6GHzv/YqbfE=; b=eqG+dkL/DIdDxKBio1cYT1jv31aCRgvdOlPth5bvUl
	R0Bx03HdiL/JUQFbhUqDPsrxZIg5QRHJNgT7IAOaIQ7HHfX6Vd1vnFOVZD4WCxot
	XbLw+J4fFpzwYVabOPUgbdbC8GoxlQj3QdmgEgBrT7O3P8vP0Ol2gtPunwqsvk+o
	SIQTej/u/GcV0OuoqQ59f4w3OUbvr908K2lshMi05wv7s1gtw8OKM3ZYRBK9PU1c
	E2c54XqfrrL6hSh8D1MqGENTjNgoQwEJKo9ukUbVWUfnxsyQ6lc1AqfdtVTssvOm
	WjciJi+B22MTmMX3CoeLMayuxhLH3GJXIDbJ3t0eHEmA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4hncgq9wm8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 11:48:12 -0400 (EDT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-53639e47be2so32249751cf.3
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 08:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1793461691; x=1794066491; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0B/Jt4PrkjhDnRBbGsYYmLETRWHMQgnj6GHzv/YqbfE=;
        b=ZUivIN9B9YBRuVmDazt8fmKGWIa9T5DWFm4d+B1TMyiJU3PWY2jVfttjsI1i70Laam
         l0KrU68sd584ySXlvkOkk4zVCcwlLyj+Qqr44XEgzOW5Nf2Lk92iXMQV16n411fxKIru
         YPPejzPQkPndTiLvR1OFwGBsqGFSCkt9299NAg6wTcadOKnmKnoGy1WfQbhGc/HyGwRS
         ADY1+2PPYDIgR3j4M0KfUzjHVuYxkMsOJ1bgvtXzrQfI64pXXsnLGlSdHpszDOmm2x42
         jq00NpqGi1tDMzfNHWsEGP+p4ap6K4TcBwdcuLQzji114wXI3W2Hh4B6q5zQPKxbZDFI
         AudQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793461691; x=1794066491;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=0B/Jt4PrkjhDnRBbGsYYmLETRWHMQgnj6GHzv/YqbfE=;
        b=dVP3IN6v2XEwy3nyocirjSK8O01dBn2GylzVoRmwSTlavWwPVX78VsMFGucQh0mRMT
         kMMJYVkCw7vqFWFIMhTt4sqkttFOuDUwQhOLOHQsjbs3BAZDAgOAewYcE6nRb+3JWLeG
         wl4HDP3enoMY2KEPlyx+rxLnXW2CCR2kwx8UZrLZGBbPOsxWPxAJMhUHFawWbfJPkFSk
         Gz+FpnxvAVgvOJib+g50/dCvYs4DfDv2gPmJu/1OmMqOdlkTxwOPudNb6EPpESjoerqi
         qISO31pnfQ3LMgUpXSofECW4gHmE9gKi6Vn73AuIR+hNr5gkQz+e1RHifPdd6c51PfIP
         F7tg==
X-Forwarded-Encrypted: i=1; AKwUvBzNiGCk+aMz4t8a5p4BpcnStzsbv3gZBIkraUcM1+wUzPKgQK2lvw0YxyV8IGak/wHtprveqUrbW5dXCqc=@vger.kernel.org
X-Gm-Message-State: AFq9FYL8KG+EQUmgTk78W6tiYM+4Y2r+9uUjhKXyLFoKPY2BkS/zRrY8
	bDUi0MiFwS88eTkv+cMuJU4dkT85g7du3UDUDytfVvJ27Ge/STyR/MXin/8SN66N+2q3LoMSGSt
	4eLvP0WKgHnw5itAGgJiwSQenzpjbBjuUs1FEmJ1jkIVm4MrqbpjWfDlKggCBotG6KfoZRg==
X-Gm-Gg: AYBFou1JyaXIdLGcoxBl6b5wsV6hyhoRv8zT9pOgSEgMiPKn6Xv57g+rItZswQKb7cA
	U9lFVZkZb7pYYTeo2JJkYWUtZ1AtOlcNTPY9Ws9UD30anVxNSlL5WkZqwH2t08Jrr48ZilSZnw3
	hi1yKJcMFoUrztZ/Xn018V8EFBd/AU6vaO5dfvd9x7BTG6l8nsOiBaKPsm1A79CzunWwNTd0bmC
	ooEIjK5RGrwFU14JY91y0v39bjFezF8SmaRdsi+FA6hwD2ajci6OE8Hhxhv1CYSF3gACnebL3VD
	iI41qMuuflZJPxQjvtH6Oq0i4eC+KASgmkVAjHb+rZbvdQAOVzlBNU3Jcx7m3Rrz3aEHFto3NbC
	1EJ0KBVw3GE33UtNGDbTCBQAzMaa4BHVIU8s9pYWo5sIElgHyZFrwHjnhEw==
X-Received: by 2002:a05:620a:1d06:b0:944:a46:5c1f with SMTP id af79cd13be357-944217452e1mr861669385a.40.1793461691231;
        Sat, 31 Oct 2026 08:48:11 -0700 (PDT)
X-Received: by 2002:a05:620a:1d06:b0:944:a46:5c1f with SMTP id af79cd13be357-944217452e1mr861665885a.40.1793461690718;
        Sat, 31 Oct 2026 08:48:10 -0700 (PDT)
Received: from [127.0.1.1] ([37.142.159.89])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b80333sm9694395f8f.32.2026.10.31.08.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 08:48:09 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Sat, 31 Oct 2026 11:47:48 -0400
Subject: [PATCH] mm/userfaultfd: store the child's new uffd context in the
 wait queue entry
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
Message-Id: <20261031-uffd-fork-ctx-v1-1-a837fd576ffc@columbia.edu>
X-B4-Tracking: v=1; b=H4sIAKMN5moC/yXMTQ5AMBBA4avIrE3Sn7BwFbGgnWFIkBaRiLsrl
 t/ivQsiBaEIVXZBoEOiLHOCzjNwQzv3hOKTwShTamU17sweeQkTuu1EY5lUadvCeYLUrIFYzu9
 XN7/j3o3ktncC9/0ACm7sEHEAAAA=
X-Change-ID: 20261031-uffd-fork-ctx-23fe063a5cde
To: Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
        Peter Xu <peterx@redhat.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793461688; l=3087;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=4VwRN2aXCA+IhJ6bxdAbQ/+gb2gC5RTAIQ2hevD75F0=;
 b=VS5pRjL5E2ZcJ4ee/ZGTrATXKELkz1s6LtsMjvYqAjM7zUNhwY3vw5GE3DpFv97TmyWb6ODwl
 xBtBxSwLNZPCaLWfaSp5pzvFwELwA2t97mg9o+wfjeq+dNQtbeCfwvy
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-ORIG-GUID: mW5mQTqtuuRSCtMwrpXIOX-D1suA2NEf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA2MiBTYWx0ZWRfXwOKRqo4jiWMj
 AzEVr70IPXhgLELvKAUXlOitKKOlalixhuFTKn20FP56dpYmh3xut1FIddIzI99BL6nhkN/Uptz
 Zv5AQ/uqzWFB7K+VvffyZ5umzjx6UOeMcr36H8fLhFX68QLDGaRejJLMt5B8ZvnrpCPib2Q9HkF
 qW7EK/CNa9erxhZAR2QvokP4gPAiLf7qFWZcXMZgSkkLfgTiZ1EMyLT879jta7KI1QUaup4hXNT
 x8aP98EIgXEozb1wsZyIFeniifC4ckG9SnPWVE3rJT7n6M1LuPcdg7RYxOBdUY3WEYlKTiVI6NU
 PIF/WD0h3XYPCJ+QEaB0q+IP5tKVGXQQznIY7yixcJVZKngYgWYV4PxPFXN1x0qiZLnpEpj5uN6
 SM4X9KYpXKSS43p3cgFbwrptzvRlpp/JY3l7IceR/0la4jDq24+b8Is+u6AzHCRYClzqyRq6hIi
 TAVL47YVDqExGukZmTQ==
X-Proofpoint-GUID: mW5mQTqtuuRSCtMwrpXIOX-D1suA2NEf
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA2MiBTYWx0ZWRfX1xYkOd+Vfkcw
 8F+Y0sBhvXJKRqdbuJELUFA3tNCIX4WnR/c1ONpVKWfHL4V68t0+o93TU6W05kayXY/AMmV+vF9
 5cxWOinoUtq3r/MgUkOfJl43rmyP2sStH3kFNG4wzO2QCmkp1vOk
X-Authority-Analysis: v=2.4 cv=ZIpCCn7b c=1 sm=1 tr=0 ts=6ae60dbc cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=P+xgYyhW+KadpqoI50EQPQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=SsB-OO3BMngHh3ZO9fOt:22
 a=bMp_idCJdzv5ZnZB5UwA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11952
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 phishscore=0 clxscore=1015 adultscore=0
 malwarescore=0 bulkscore=10 impostorscore=10 suspectscore=0
 lowpriorityscore=10 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2610310062

A UFFD_EVENT_FORK message cannot carry the child's fd when it is queued,
because the fd has to be installed in the fd table of whichever task
reads the event. The forking task has to hand the reader the new context
itself. It does that by casting the child's userfaultfd_ctx pointer into
the arg.reserved.reserved1 field of the UAPI struct uffd_msg, which the
readers cast back.

That temporarily puts a kernel pointer in a struct that is copied to
userspace, and results in ugly casts when passing the uffd context
around. While resolve_userfault_fork() currently zeroes reserved1 before
it is exposed to userspace, this unnecessarily risks leaking a kernel
pointer to userspace if future modifications are buggy.

Store the fork_ctx pointer in struct userfaultfd_wait_queue instead,
which is kernel-internal and passed around anyway. The casts and the
zeroing go away, at the (negligible) cost of 8 more bytes on the
stack.

No functional change.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 mm/userfaultfd.c | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/mm/userfaultfd.c b/mm/userfaultfd.c
index 3b71712edab4..cae70df89c00 100644
--- a/mm/userfaultfd.c
+++ b/mm/userfaultfd.c
@@ -2430,6 +2430,8 @@ struct userfaultfd_wait_queue {
 	struct uffd_msg msg;
 	wait_queue_entry_t wq;
 	struct userfaultfd_ctx *ctx;
+	/* UFFD_EVENT_FORK: the context created for the child */
+	struct userfaultfd_ctx *fork_ctx;
 	bool waken;
 };
 
@@ -3006,14 +3008,8 @@ static void userfaultfd_event_wait_completion(struct userfaultfd_ctx *ctx,
 			 * didn't.
 			 */
 			__remove_wait_queue(&ctx->event_wqh, &ewq->wq);
-			if (ewq->msg.event == UFFD_EVENT_FORK) {
-				struct userfaultfd_ctx *new;
-
-				new = (struct userfaultfd_ctx *)
-					(unsigned long)
-					ewq->msg.arg.reserved.reserved1;
-				release_new_ctx = new;
-			}
+			if (ewq->msg.event == UFFD_EVENT_FORK)
+				release_new_ctx = ewq->fork_ctx;
 			break;
 		}
 
@@ -3111,7 +3107,7 @@ static void dup_fctx(struct userfaultfd_fork_ctx *fctx)
 	msg_init(&ewq.msg);
 
 	ewq.msg.event = UFFD_EVENT_FORK;
-	ewq.msg.arg.reserved.reserved1 = (unsigned long)fctx->new;
+	ewq.fork_ctx = fctx->new;
 
 	userfaultfd_event_wait_completion(ctx, &ewq);
 }
@@ -3404,7 +3400,6 @@ static int resolve_userfault_fork(struct userfaultfd_ctx *new,
 	if (fd < 0)
 		return fd;
 
-	msg->arg.reserved.reserved1 = 0;
 	msg->arg.fork.ufd = fd;
 	return 0;
 }
@@ -3482,9 +3477,7 @@ static ssize_t userfaultfd_ctx_read(struct userfaultfd_ctx *ctx, int no_wait,
 			*msg = uwq->msg;
 
 			if (uwq->msg.event == UFFD_EVENT_FORK) {
-				fork_nctx = (struct userfaultfd_ctx *)
-					(unsigned long)
-					uwq->msg.arg.reserved.reserved1;
+				fork_nctx = uwq->fork_ctx;
 				list_move(&uwq->wq.entry, &fork_event);
 				/*
 				 * fork_nctx can be freed as soon as

---
base-commit: 243e8cdab64129d6207c398f8cf5fbb1962ff7e1
change-id: 20261031-uffd-fork-ctx-23fe063a5cde

Best regards,
--  
Tal Zussman <tz2294@columbia.edu>

