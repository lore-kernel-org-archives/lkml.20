Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 735ED513574
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 16:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789575467; cv=none; b=BxWKZO+wlbN1o2t4B7N1JUNJOFhMtjPYlI4RSLMuZaQ5P7RjQP1eKoktH9u+4g10DbVHA1ztwhhqaGUshPoegKvw50DwhQSXxGdJ2PNxIgiatr0wXjdQDaDXLNmhG36YT6zrTPzbegaaKKxphVX+Yq4Z83UufK3DSne0Un/iYkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789575467; c=relaxed/simple;
	bh=dNHP1gTsQIZoj7AUrk+3cvNZFuIo9EZylbWDUYMpxEk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qxWX3WjhtyhSHgyCgpJQxCpioCAdADDvHLQbTlXPEcDUF5q9JqtsmKeMnCZrgNxbxUVfdz+nEjFDdjW3X7C/ULRLrV3qm/eYSBs0Mq263/KmTcuyrn6G3pJquz3buakE2fLENhNFaAiphEk+//uWm3535LnzKr1pY8O15Jjr3F0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oPLwmdiR; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oPLwmdiR"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-398a147688bso953744a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 09:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789575464; x=1790180264; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fHyHl8JYGeK0KYa1UKcPeUzjQ3WV6y/WuzNvw68/Tik=;
        b=oPLwmdiRoFINGnyPsdhOTtRjjGUgIlLZfCjuBZfIUKM8b5RtoRteggfcrSyhGE3OrA
         +moWQ4m/jAIn+poelfpLshgvDl3qQ4v3J1ZRMMp86DfS//sguxfT9twfioNW+u7rDiOk
         OGcc22X5TxIkLT8FjQDD79hu7TCQb8WAKoVG549CZICNoTcp2lqrzqa6zHvsXhnMfaWc
         XZyYcSa9QH5y/99rNMM/q4ouYtEP+gXsOZi/2uOV4cqYBnDPGPoR1vsAmuYGn2yWiaTF
         qtH0WGz48LD/Ikzm+LFE8pQA0Y7FjJZxfRX6gPNCiIFpfI08hL4d/Z2OnXNqqHCDMVLG
         MBFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789575464; x=1790180264;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fHyHl8JYGeK0KYa1UKcPeUzjQ3WV6y/WuzNvw68/Tik=;
        b=shJ2eIy6FCjeqiqs1CkCs+Xusj+3BhZqAzkKucPk/8oBCVYwvSjfEyRXwUnQsIVce/
         Y3ZrA9AReXr+MzO+107JOtdmvaTvorn716O7PG+RikPPQTs5WhgPSwfj5pkz1bT6PdAi
         ps6tyHnfMzCmXGzZQ3JGF2tG1TElxafBf3PWj/nD1VMCZ6fyvDO7CB0xbeLiNeMirYXa
         n43y+Pj07KfE+AHUqjWe9PfW6LKD9wHaZzC1SSiV2minG8c5VahxO2DlHYh1fR3ytxHZ
         FBC3hSPUzctt6k2KI8opRrnd2HN+6l/DM98+3QA4Ep6HpDYN3JMNN15nQ16s0gs4VPWX
         NIsg==
X-Forwarded-Encrypted: i=1; AKwUvBywK2CFHaPKiZh3sgEFjjOeSLqFCRmevP8swsAVshYR02c1isyZXtFv19IB5w6e9niylpbdJ9qTOSPHGeU=@vger.kernel.org
X-Gm-Message-State: AFuF++ntw/R3IGSZGTn7PSr0JyMZ/bnai4ScFsPNmPS9mogIc6v5g2zu
	0Hb5gaUMa4ZGIkvf/Oct5gLrzbpw2Dka5gck6ecLxfcQ3PGcIie6j8xc
X-Gm-Gg: AYBFou2a5KFWUEf2HJbTjnQM831QmRMaFt1xs/AzNyN3M97nZVuGm7gupPbJBGsM1mE
	wQVKofam2xLll0D5LyygV7LYcFmzbMix9wsdlT24ed7MD0t7TWk2oBr4Eycju8qhiSOP44YG9bk
	gj4Kebeb67quYGF+f9Xbjb5qMh1BNFjrxoFQuo51HdVh8QreYAQ1W3FEQBjlLfNtP0TbPgYFGLs
	nDUo5yweYaUFyx5RwlDUP/G6ApWVn9CM37B+4S8Mlo3TebUuy05+evVZN1nSxEvLLRfd3vJsRkr
	jbCqmrjn99vJMYMNbb3RyYGlSlf1P2Xsccd+T1rSchxUG0G1wCxAwIr7P198Xez+68ldE6r8ud8
	sGCSfGx9IVwUXRFFDSvMBY7181c9HrNUKFGbqQHb2OUkEDelQEXH1GJtdRcP3RmY7iiGjr0834f
	kg6h2EgFyG1id8l7BembuJxC6Nsyzhhj+O87e5hX/9ReyfNt0XnwVzHsVPbWGNJWo6NHuia2MkO
	AgCkzrmVG6rVL+p9BB2qr1kcsn0PTcpdVtcq4Mr94ilJZn0
X-Received: by 2002:a17:90b:1a88:b0:396:6344:3b63 with SMTP id 98e67ed59e1d1-39e1e27dfe7mr7308938a91.2.1789575464203;
        Wed, 16 Sep 2026 09:17:44 -0700 (PDT)
Received: from eggarch ([2409:40c4:18:7581:88e6:16cb:6cd3:1ba1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e35d9b298sm251787a91.2.2026.09.16.09.17.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 09:17:43 -0700 (PDT)
Date: Wed, 16 Sep 2026 21:47:37 +0530
From: Lovekesh Solanki <lovekeshsolanki00@gmail.com>
To: Pujito Adnyana <zhee.tou@gmail.com>
Cc: linux-input@vger.kernel.org, 
	"dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: Internal keyboard dead on ADVAN 1405 (APN21S-140P3-CS): i8042
 controller OK, keyboard device never ACKs
Message-ID: <aqrA0eEt89mr_ijV@eggarch>
References: <CAEkMyrhPTh1Ws0Co6zHBq1aMhrhgam4yPBgbXAMPrffyAKpT4Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEkMyrhPTh1Ws0Co6zHBq1aMhrhgam4yPBgbXAMPrffyAKpT4Q@mail.gmail.com>

Hi thanks for the report,

On Mon, Sep 14, 2026 at 08:14:24AM +0800, Pujito Adnyana wrote:
> i8042: [943273] f6 -> i8042 (kbd-data)
> i8042: [943474] fa <- i8042 (flush, kbd)
> i8042: [943474] Interrupt 1, without any data
> 
> The fa arrived roughly 200 ms after the command was sent — just past
> the timeout, so the driver had already given up and the byte was
> discarded during the flush. The accompanying "Interrupt 1, without any
Yeah that seems like the cause.

> Is there a way to make atkbd tolerate an acknowledgement that arrives
> just past the command timeout, or to retry enabling scanning after the
> initial probe? If a DMI quirk is the right mechanism here, I am happy
> to test patches and provide any further data needed.
We could keep the current 200 ms attempt and if it fails retry a few times.

Could you apply the patch below against a mainline tree and test it?

Thanks,
Lovekesh

diff --git a/drivers/input/keyboard/atkbd.c b/drivers/input/keyboard/atkbd.c
index b9ad2381f885..81df4b7a5685 100644
--- a/drivers/input/keyboard/atkbd.c
+++ b/drivers/input/keyboard/atkbd.c
@@ -714,12 +714,28 @@ static inline void atkbd_disable(struct atkbd *atkbd)
 static int atkbd_activate(struct atkbd *atkbd)
 {
 	struct ps2dev *ps2dev = &atkbd->ps2dev;
+	int error;
 
 /*
  * Enable the keyboard to receive keystrokes.
  */
+
+	error = ps2_command(ps2dev, NULL, ATKBD_CMD_ENABLE);
+	if (!error)
+		return 0;
+
+	ps2_begin_command(ps2dev);
+
+	for(int i = 0; i < 3; i++) {
+		error = ps2_sendbyte(ps2dev, ATKBD_CMD_ENABLE & 0xff, 1000);
+		if (!error) {
+			break;
+		}
+	}
+	ps2_end_command(ps2dev);
+
 
-	if (ps2_command(ps2dev, NULL, ATKBD_CMD_ENABLE)) {
+	if (error) {
 		dev_err(&ps2dev->serio->dev,
 			"Failed to enable keyboard on %s\n",
 			ps2dev->serio->phys);
-- 
2.55.0
