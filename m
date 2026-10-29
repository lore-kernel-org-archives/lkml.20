Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793302293;
	b=5M4UnS12SwM5UT1hriAew8tqVtDEzvgXbWHs/B4Nb1uBcxm6UsQMf2+WzFjHBweu7XFl
	 70pwGmV0IPWyzuS1yg8fhcU1n2RPykEg2IyNkwAUlTr+Gx5L8R8Q3cKmOtYkpxDi/uSPq
	 dN9NNGcESFtmLf13JzC3ogQ1v5rbdmorVJYxsI+p/UYFKDH53H6T9w5lKXFJgn8RRYf6O
	 7nSBuFzoMWYfYQRemw9iotcDppc/j/SkKxxEIiTYyIC0mpDgq8d/th0jov+sSEIOG/p2+
	 YhRT9s2hwuh+EHfuM/rnXKZZzp6c3MFkA/wmkG6YAdjbFdeTXLdd6U32E5I8T3iv+EQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793302293;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition;
	bh=0pXuLeWnwLuEdTfr5wuCa/0ukD8OinO4VmLvRf/x6AY=;
	b=Bx/aN9kshhiqbHhrW4aER+8RR+0UfnF6cYkxtxKBa4rnSJklzv/l/SwhUZnmA6lI0zuB
	 4NGLk3hv6yTKT98YBHnXmqYn6TDal0kxeJw7AuCp/zpS8CDySzwX5QNiKtrMRLT22/j3R
	 P0g2RqRbfsuYAsa8Zv/Poa2fxcpcybpSwyXtJnKXtnyu5GV8Slx0UdmnrGUXuIs4+p3v7
	 KDNg84YPoTYvgy1DmELy658rDHcYZTRS2eByxMDfZBYUKgErQ3jIKTlAXBg2gcQndspEe
	 3YZ86NanGYYwSdagnNDheD3dA7vfwwt234k/U0yOEsPughUXIyJtOdifS//0tKMN1ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Z/i8Y425";
	arc=none smtp.remote-ip=74.125.224.43
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E433606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 19:31:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E433606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z/i8Y425
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-67a2efec15cso1114240d50.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 12:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793302292; x=1793907092; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0pXuLeWnwLuEdTfr5wuCa/0ukD8OinO4VmLvRf/x6AY=;
        b=Z/i8Y425SNmQbAcagV5ZAByEy9jq2mjoztnJcpFrTQ5Bu3Ic9QVDTPQcemCyDAMYcR
         jlWeJ17UGvEHfoq22U3aEtjh8ymc1FEIHDxHcMJI4bNKPxiUP3f+eY35d1PU+Bi1Fhm+
         9YNtNm3xsm4ljmR6AB2XuX4fVCakP+oQAZHKWLBqSIo+FsyCcVP9sT6gK+Dv7BTas8ea
         GMm6b3d6GUqWzg5pqaWRjUBB6kLRPVkvQjgFzNx0P+8n4pvNNrDesc+kxt5giRojrTCr
         /wy2JF3KnCGRITJd2ZH4Va+QrqeSC7ix/CBEYBgvvYE3yaTeISIUa+xjJc7ksz5IKG/R
         b6FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793302292; x=1793907092;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0pXuLeWnwLuEdTfr5wuCa/0ukD8OinO4VmLvRf/x6AY=;
        b=gxiY6kZ7OWVZOZq3w7If5Sgl5FJepo7g5CYkVtDpqzFb2Xa1jkNpf+4FUJMkMhcLlP
         5mI5IBW4qcBm/GS9wfJgj/3tpXDv3A4AIinJXEx6pSS70Xyi3Ytz7S4MOR/P/ppvItZ2
         rVUdaPJMnVT/tz7FysJ/ESDE7waTlnpJkL3Z83iVB/z8PTW8+J3u4dwd4Vzn0BDz9m1T
         0CZVGb8gniOgE3ggoMGbqhHAsF3772aQj8iVbV4MegwEtRyBeM8DVEIx/bx2BnU0pJUV
         ClBaBDDKpiDtHCqNC1cVD8crrkoPrEGHGWX1OsDCLMd3kWhPnmIaWsenaVvQt7sgCdYF
         vR+w==
X-Forwarded-Encrypted: i=1; AKwUvBxhgN1G38RDaIbZs9RuZGK8X9iRjQGOifOFSzqWDc/718D/g2DoKqnbZV3Oixw9Yy3nwip8pQ09VpZ3xpQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIC5OBxOznBQFTDkRjhQOUB60PPxcJkja5O86PEm87ojwfotI15
	3fIiAvd42IXo4eZRAEoNTxyI7pb7QvZj4mMZAaZ5UJrsA4wNMWNxj8slqJHGjQ==
X-Gm-Gg: AYBFou2mhYJeBqqLyAEM1kgAKZfzKU6eEQ3QS9krRLRDv3lP+AdYKbTKM0CrTzcz5j/
	/wiaG6d37l5d/nk1Z4BFCQaR3gDOytWxW9oRuQIQgC4lyQnGe2AdxUiqWafDGvkpdLmi3MRRlAs
	ajpoa7nmOPMrHDW8uOaRHi2i+D87L354kLJLeyN3liXRWNRvExyX8440wtbvALlqNZNnE99k98j
	M6Re7W1xarOHr86vvgP7frBn1Wpf4e06vnowceawtI/RNZ6BF2o7m2CId/IicyEqaapeMC+3v+H
	9R70AlFQ33VNWHYlOMvDZZ4yOpsZSNA/kyWTPQ7jOBieQeFa0+lDl00Fqrf1vQatLmM4+CDPqP/
	Oa198R81S3BYQ6NEsWWSM72ZxxnyRD9fB0ac0FUEG0S84kGH7g27em8ixzePJfwv46NaFuBeTBZ
	pKu+wBg0WtHqR3/zqgEglSY+3CIO6WCZiCO6F8Lgr38jrT4vVrS5dC+xeNxNsJo/w58bIWD01+7
	WyZqht60j3OYCZLEC/gZih9ycvlaaFgf0Id1+hCSVt03aALknXt3hT54FGbBYu2OZ1DAixzfK3Z
	dXAHYEZhp5aCctaMlL2oiBBB1/geN4eGWaxDXEmWLyvBU14qOd2rMY8h9g==
X-Received: by 2002:a05:690e:118a:b0:679:9e81:e523 with SMTP id 956f58d0204a3-67a8d05799dmr2459364d50.5.1793302291619;
        Thu, 29 Oct 2026 12:31:31 -0700 (PDT)
Received: from daniel-HP-Stream-Laptop-14 ([2607:fb90:ef13:305:4486:2d08:e87c:8ba9])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b2b4b2f81asm794187b3.30.2026.10.29.12.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 12:31:31 -0700 (PDT)
Date: Thu, 29 Oct 2026 15:31:24 -0400
From: Daniel West <daniel.west.dev@gmail.com>
To: Hannes Reinecke <hare@suse.com>
Cc: "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	"Martin K. Petersen" <mkp@kernel.org>, linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drivers: scsi: aic7xxx: spelling corrections in comments
Message-ID: <auOfDNDXtYlhsXt0@daniel-HP-Stream-Laptop-14>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Fixed multiple speeling errors in the comments.

Signed-off-by: Daniel West <daniel.west.dev@gmail.com>
---
 drivers/scsi/aic7xxx/aic7xxx.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/scsi/aic7xxx/aic7xxx.h b/drivers/scsi/aic7xxx/aic7xxx.h
index 20857c213c72..39352ffaba7e 100644
--- a/drivers/scsi/aic7xxx/aic7xxx.h
+++ b/drivers/scsi/aic7xxx/aic7xxx.h
@@ -432,9 +432,9 @@ struct hardware_scb {
  * each S/G element is expired, its datacnt field is checked to see
  * if the LAST_SEG flag is set.  If so, SG_LIST_NULL is set in the
  * residual sg ptr and the transfer is considered complete.  If the
- * sequencer determines that there is a residual in the tranfer, it
+ * sequencer determines that there is a residual in the transfer, it
  * will set the SG_RESID_VALID flag in sgptr and dma the scb back into
- * host memory.  To sumarize:
+ * host memory.  To summarize:
  *
  * Sequencer:
  *	o A residual has occurred if SG_FULL_RESID is set in sgptr,
@@ -499,7 +499,7 @@ struct hardware_scb {
  * the length to store additional address bits and a flag to indicate
  * that a given segment terminates the transfer.  This gives us an
  * addressable range of 512GB on machines with 64bit PCI or with chips
- * that can support dual address cycles on 32bit PCI busses.
+ * that can support dual address cycles on 32bit PCI buses.
  */
 struct ahc_dma_seg {
 	uint32_t	addr;
@@ -741,7 +741,7 @@ struct ahc_syncrate {
 #define	AHC_ULTRA2_XFER_PERIOD 0x0a
 
 /*
- * Indexes into our table of syncronous transfer rates.
+ * Indexes into our table of synchronous transfer rates.
  */
 #define AHC_SYNCRATE_DT		0
 #define AHC_SYNCRATE_ULTRA2	1
@@ -970,7 +970,7 @@ struct ahc_softc {
 
 	/*
 	 * Device instance currently on the bus awaiting a continue TIO
-	 * for a command that was not given the disconnect priveledge.
+	 * for a command that was not given the disconnect privilege.
 	 */
 	struct ahc_tmode_lstate  *pending_device;
 
-- 
2.51.0

