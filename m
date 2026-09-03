Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6FF6381B16
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 04:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788408906; cv=pass; b=Ro4FNux5q2Tw7/rkThuM+P2FgbhLRJHZ6HWvjeVarviUmzcy9xwK0bamOKRoqvHeb9FRaKxFSMANjj8lu8HIyZ0oEPyIGj3PMIUy94SHp2Mi1blliWJOZ8h94nXyNri/cL6mAMeLpqUA3Uch/yQGzm3JLwBxQbWY6LlQdDbcUFQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788408906; c=relaxed/simple;
	bh=/CdnSkAI/SEeFBhKT8eXTMpB/EwyptIYnhSh6zIHjt0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nvKfexPuLl/M0tZQon2LE5hfCQqvqx255MYq57+VK5m7zlX2/iGLcPlMmFgF9iUZeL5+V/CYicH9lbhN8WRTPGp562FUpWnVmSuRJGN6NXRiCqaLACajnirIXtfQiLM+a8Nm8/NjW0LbKi8APV9uxGUXVRbvrGAs1guY1Qq9ZOU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f9LFUedB; arc=pass smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f9LFUedB"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-852c481415fso2228792b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 21:15:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788408904; cv=none;
        d=google.com; s=arc-20260327;
        b=daOMfy05E7CGHSUEUWcwSdKOzPqhnLfY9EmHhilnNK22TiT0t82cJNHlbv+H/S6vJe
         da7uAjeMXNXnSHBrWpaP4FfINdpm/QDUTcrQR7c2YdQlHLUdJvumA6W7RmqZeaV1Y1IK
         qYHGa0h6hFtShl/F5AGmIGuJYVbep2a/vu3JLBSBypR8Y8x3iGAiBHP+zPBPLoBnya6i
         s4kn/rM5g58hhAywWEI0leftg1VPPJJnOuccgl2ICOLt0pKu6j3Fa/+ZlvwxtfW6F7Tb
         PLqoRyrNOjLGi2A2YDDrbJCXgwLb9txNhWZ/01Cc9LI0GKr2itheKVJcwoL4fCVTugzZ
         qPEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/CdnSkAI/SEeFBhKT8eXTMpB/EwyptIYnhSh6zIHjt0=;
        fh=dAGqUUGRyeczEdVuPj8k/XgmPXySUvdf7sYHcUDICY8=;
        b=dp3d8cSihTRoPyX6QEdSOd9F+AZmQEe3DjFam9gkbYQU3PPPoFxqKrkSuAxk9Cax2j
         6ueobapwagkS7VKtMoA01JKfD1s2C9dZ5Y90OSHuWr+usQgjGop2AuKWyOV76wFXBtNA
         ZXluKpjeczTCBD63D7WCLbkyLMSRhDva1B36R1pPqNmjihmLIHFnwpqhiIVW9Ro0AhQv
         uNcUTHHrxvQoVZ8Q4bWRm0LIIPB3pbcOByasfXP8HalIpYSEeblOWo4KSBoQCHMhvubv
         VxOvicF3jHchd3SOF4nnj3C1dwWRIDp+Px4Q31xwW1P2/uqAFvI0C7PEGbau6jVvZvs4
         Nn/Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788408904; x=1789013704; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/CdnSkAI/SEeFBhKT8eXTMpB/EwyptIYnhSh6zIHjt0=;
        b=f9LFUedBAQgroo545PFYs7yYkfn+d/YqcmRHCbFtOj6Flp8IRA1m2E03JxSIJ1hkMO
         uI+XqK5Zc7xT5idotqW6vwkr6nBsAkYxRI/x2f3SZtBPyu/JZIjpiUj63r1vrXacKjP5
         DVkNYIxDOjKb/V9mWvNA96zijOcmcKIQAGMrk09X2ZBNynAPsSmrU5MxLlXz3k07p0io
         dKy2fUdhDSw/OJ3WWK/99GIKmLNR+Ion/TDQTTZRZSgEB3B6P6r4NfMDO2LttKgs4oAO
         ZzL6BEq/WarE9w74sDLE86ATOoTxvrxoy0KlUkB8/e3AlhSMGru+3rb+RJTHfmEbRxyj
         Fubg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788408904; x=1789013704;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/CdnSkAI/SEeFBhKT8eXTMpB/EwyptIYnhSh6zIHjt0=;
        b=IijrbNqPxySTODkPkv5v2Yh1F2c0v/Az/uPgLuG74jByIRGNWTok40HaVGJbLsFOZt
         xlHD+w5XN7vQlquLEXWCVozXKcWLGv/bW7w0kvZXk+LWUaZsfb2QLW0bnIFBzAyVuOyJ
         puoBZ/pfLmL/dJRKJkLHgZMemNRadDfcD2G2o02NTj20C2xw6w/bI9fDxSmHNDSmg12f
         uRdBfj+VXUhpdxdgUrQEmm3u0i/91cHGFLR7NzIBHA4Q9Qm4WvAfs5oXjSPTzSgumcDP
         FkNqbwnYO5yJOtQMjfKzoctrdeWt80jvq722okZGVIih5UfEcVeS/4SUwHV4dGawpe0u
         raXg==
X-Forwarded-Encrypted: i=1; AKwUvBz9tMUZCH1pJQ8nlrTGWqRR73311hT36brZRd+j5ZwJ5/NjjbI3yj8u6l/9SM8C9+aq4a+AVMwG7agAl0Y=@vger.kernel.org
X-Gm-Message-State: AFuF++lfaF4FYRtKm6ypMy7UqxG5n+ch27R09oKGmxCzAc0//iFXJF38
	G9oePax5dvm5nTGswHIC8LICFzD5qIMcaoewHC1nVez8V5WeMgCwUPLcK+JU1CilUvA05bFki1G
	5nvY9zp6iymGX5jnPyLm7VtakYiGYqx8=
X-Gm-Gg: AYBFou1GbLlHET7Exn9zAsZam93dMVcBJD2JvLgWc06K3/HdU1HBAMWCwrHP0GExLR3
	AWL+uIeXH20sZK61N1tAcNEBVOdywGOU4AIZZr20EYnwbaHdJro088qygA26NHa8C4Y7/p+TblC
	JYR+P0AfGct+fXv13fI4alhECLwKvu59ZkEtcX4aPJt7mCItW/AUU/+pxmQzwnqkKoCTHEMwx4Y
	/Xlxiv3O3f7Rw4ocICp4venIQ/IbMVTvorq0kFAETlQ8Bc0ajQMPAeVEA4FEtrixJgCND9uoMgr
	ingA8+ZqpPc5Vaa6hPgDENWzcddOsMgREyrUpCM5tzT/TvAYUFgqJVHMypcJGJC+dg9QFGrmIJK
	K856i+LSlOwBELkdbjbHWWIFYl3lMup+oeW6JDhzaPlkbLqqsJlzq0kcY
X-Received: by 2002:a05:6a00:23c1:b0:848:62ab:7b7 with SMTP id
 d2e1a72fcca58-85ed93bfe5dmr11990726b3a.16.1788408903612; Wed, 02 Sep 2026
 21:15:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <apgNYDiSiPmNZspF@sirena.org.uk> <CAABR9nFEbNxQ_oWCvZobOJnmCBdhAdTYfrm=sMzygh28CMFFtA@mail.gmail.com>
In-Reply-To: <CAABR9nFEbNxQ_oWCvZobOJnmCBdhAdTYfrm=sMzygh28CMFFtA@mail.gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Thu, 3 Sep 2026 11:14:51 +0700
X-Gm-Features: AcwNN1UMURtyEGzADFhhZXlM-8xROk25l_3NLc5C7-jyAaxvLqbjAJcXuOLei6Q
Message-ID: <CAABR9nG4f=3wjoXh7FYLs7R3T1N-wRtPD=UrfPJmuZnhjBf6GA@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the gpio-brgl tree
To: Mark Brown <broonie@kernel.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi all,

I have sent a fix for this issue:

https://lore.kernel.org/all/20260903030700.132068-1-phucduc.bui@gmail.com/

The patch is based on brgl/gpio/for-next.

Best regards,
Phuc
