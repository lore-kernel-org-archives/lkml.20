Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E671352C35
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 17:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788974266; cv=none; b=GIevQvkw+g5KcJ37fYmPaSav5vYX1/wporqDsx6W8gEoedT+W7vO6xNHm1dADHo3SmxuHHU3qiwcQDj4uT0wve00DfSnidXsVLdYsDrw/HZjwosKduVgbxB9dlY9mUNsAX5dWp7MU63HuU2tGqMA+8dXC5X6NAhDSBS7lq72w+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788974266; c=relaxed/simple;
	bh=9x+UXlmTbEDfrQmslkKbRb4Ip5p2FmrpwjeL0fCSqfY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Oxt4A46tJ4XacnyOBlf/BXeyjAa+9DLqOgaIaldDa/pEA18xvIFpXTKDMQgjl82i0BZd/iZQg3Kx/rr4oubcMfVWkC9Z+zszTaNyidU1V5pdfRRxIrDfncZiiJL8NPoCgDs6jC5AEMy+AkSubyxuqBCeGiBXQ2ml9NerHteQq9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f0Mtk0eQ; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f0Mtk0eQ"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747eb79f7so4073655ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 10:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788974265; x=1789579065; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HseOepf2cqIK4PsWTAUNT1JQorqoMCi9XT1JmBPyS3Y=;
        b=f0Mtk0eQVN47+4UtdGduC9Cw2o7miPL8PYCWgw6D0qcUzcOeLsVNw75J3I6L5gdH4t
         7YaIr7xc9ciUx+BBtHvymKFe0Pbz0Pt6+KMgmMYuqyibjgHVvYle3i6g01Rs1jBvII4k
         KUVzNxzlwmgrPMDG+w8GfqZHnmNn+CGLmyCu6YO2+L73ZTiNhkgRlYHDSTHG+gXj6EZm
         TXGM4JPUhWG5NMCmAXlPsU1aWQsrW5Gio2Yu+W7jBnajbAC0WLrPD2J0/QxTPHf1/KFg
         H6GrV+YDkHpnHcaal6bIbS3owKSPKqDHBsVcLHN5/KuQ/CiS+JtncGAKSFWc5/oRBvYC
         QruA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788974265; x=1789579065;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HseOepf2cqIK4PsWTAUNT1JQorqoMCi9XT1JmBPyS3Y=;
        b=cjMP67sU+bjYn0im9Qek/EKvhKnWlWX8g4D0nChU96+5quQohedzY5gxT3+odRuLvH
         lo8CjYgiH5IJDFa4gRZy/0Bv5MG4qzg63Xdi7DsRt2GmDvf4941qx5092D8KLxNuwwLc
         6wvDUK2uOt+N+mgHrN6xeTwEEnzFM7FddTFxAPI08FsYok1IE1lm4fD4+Dk+JL/PiVeX
         07XGQXb9k2A19VMIWeiz9+On4JSIIz7Bqvv2w1xagVT4+pCpbPRTe8mLLVlDT7M8ilS6
         g3RtIBnYQorfV0QV0n1vdJ47MvO6nEiIMXXN66fBkG+CXbU6Tj91FeVyPW4nOL/cRcAe
         dKig==
X-Forwarded-Encrypted: i=1; AKwUvBzOm4O2b8R3v3CvuXB7Ewahdll25eT20FTcijlYgpqTvcwEQ8hy3PLgmpyxmGMaq/MCQ5kEPN5DANIw25M=@vger.kernel.org
X-Gm-Message-State: AFuF++ntRMAAteRDpROoGvgjt5I6miUfxIOFwkir/qZ184ZqUMZFje6N
	n3GjyV6rQKWYqNc6Lc+sNacKacF0vUkkbISDm/Vw3CgDzWZBTtmkrgB7
X-Gm-Gg: AYBFou1IzFO9R3KEYhFIi0DMMVSE8wG+U9+S8tajLfPKyeW9AOONo1YWcjY3kDAuAPq
	4Q1FarSItYmAX/U2he4PxIzPm+NqF9A3/oDCabtf24hiTv9aktVcI4nOYoysWWkE2RXH10fSgWs
	WI8XUS9v2jlPb/H7++nvI5QGM7jipP9+6qApawtOwNiIUq7zHeHDSChTqeYNA0KJGqUzpkskgkg
	sbDjvaifQmSHXT4pqma8fLa7362oMiDZ5/KfncWWwsKu2UDqs3KVjlL0Wg3bMQMZrf2Bw6X3UiN
	7T5/BrWI95iU/rfjtLN504UR/3WndJz0CTdwKRUUtGSgDJtRsvGrIEe1EQ9BocQ91BAAqPluuPO
	EuovKFXFHsleBhEYL+EHnL4TqsSsBUAlpNaFLDvnzJb1K/Cq6BkMeyCH3BVhe/3oOK8gdpAlyxL
	7NeUERQ7G/YmG9ryD/cyOYRfcWxneR5h3UnvL0FAjgE+cp/yn+BXrfP63f9bJR3eAvjmqQ8JGnG
	gAUtGOMCsOi8fd3wUei
X-Received: by 2002:a17:90a:fc50:b0:398:9be6:f998 with SMTP id 98e67ed59e1d1-39d70c2ec14mr3385661a91.23.1788974264580;
        Wed, 09 Sep 2026 10:17:44 -0700 (PDT)
Received: from thangnn-ASUS.. ([2405:4802:1d38:5c70:24ba:44ee:a9ec:98f1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d7715b6d4sm412187a91.12.2026.09.09.10.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 10:17:41 -0700 (PDT)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: stern@rowland.harvard.edu
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	usb-storage@lists.one-eyed-alien.net,
	linux-kernel@vger.kernel.org,
	syzbot+356ae236154297f0d60d@syzkaller.appspotmail.com
Subject: Re: [PATCH] usb: storage: ene_ub6250: set transport_reset to avoid NULL deref
Date: Thu, 10 Sep 2026 00:17:36 +0700
Message-ID: <20260909171736.53927-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <f97797b6-52ff-4c40-80b8-eb9c6bc42228@rowland.harvard.edu>
References: <f97797b6-52ff-4c40-80b8-eb9c6bc42228@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, Sep 09, 2026 at 11:59:00PM -0400, Alan Stern wrote:
> Is there any reason to think that usb_stor_Bulk_reset is appropriate for
> the ene_ub6250?

Yes: ene_ub6250 already speaks the Bulk-Only Transport wire format
underneath its own SCSI translation layer. ene_send_scsi_cmd() builds
its command/status packets with the shared struct bulk_cb_wrap /
struct bulk_cs_wrap from include/linux/usb/storage.h (same
'USBC'/'USBS' signatures, US_BULK_CB_WRAP_LEN/US_BULK_CS_WRAP_LEN
framing, and the same "0-length CSW, retry" / "CSW stalled, retry"
recovery logic as usb_stor_Bulk_transport() in transport.c). It only
uses usb_stor_bulk_transfer_buf()/usb_stor_bulk_transfer_sg() over
us->send_bulk_pipe/recv_bulk_pipe -- no control or interrupt transfer
appears anywhere in the transport. So the Bulk-Only Mass Storage Reset
request (0xFF) plus clearing halt on both bulk endpoints, which is
exactly what usb_stor_Bulk_reset() does, matches the actual wire
protocol this device uses -- it isn't a guess.

> Probably a better solution would be either to make usb_stor_probe2()
> check that us->transport_reset isn't NULL, or even better, make
> scsiglue.c:device_reset() fail immediately if us->transport_reset is
> NULL.  Either one of these would work if some other subdriver forgets
> to set transport_reset.

Agreed, that's a real gap independent of this bug -- nothing stops the
next subdriver from making the same mistake. I folded the
usb_stor_probe2() check into v2, next to the existing "transport and
protocol" check, since it's the same class of error and refusing to
probe is the safe default. Kept the ene_ub6250 transport_reset
assignment too, since that's what makes the device actually work
instead of just failing to bind.

v2 to follow.

Nguyen Ngoc Thang
