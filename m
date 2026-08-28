Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11EFC449992
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 12:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787920408; cv=none; b=ZkdQEvdP8qK1cgFgWSXmH6lCxfvZzobv/JVZ67+tfnce211mGAJJIZJCDPeOwKJfaS7T7+be5enjs0xAF52EV7PZit+rx7BXZ2FItAh5n8y+EM5T0pgZyxgBz02ebes+SKm/lpQqrG3f9zWOBCBg8kWU2UXPzC3Q2F4aH/oWLmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787920408; c=relaxed/simple;
	bh=bqfJK6AvjcrjKxv8vWiaGOdrwD/fsLSuibq+C9S1YR8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Sq3OqiQbESGct5Y5+zlrPOrdpECc6lFc1Aodcn5Bz+v4qypLF2e3T1msSfiW/x/UgKP7mi5616eW7z2V3rFe9/gffSpVW4xbdf1xYdmHzTO7WEHzLfUoYf8ESbkwjSWNfqfz+XMJqCqOi+OIndgjiKDTVw2ItVgzR9xBsia6IH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BfVCfqsl; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BfVCfqsl"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-85aeb506b78so11415407b3.3
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 05:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787920394; x=1788525194; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bqfJK6AvjcrjKxv8vWiaGOdrwD/fsLSuibq+C9S1YR8=;
        b=BfVCfqslo3GL69I4crMY3JvAWuL1m8zKifTWvhLHX9ZJ0lvcRnd5tgmPS8Iawn1TAC
         AyJoMvWzkWa9omMRR+MBal0KqwgbkTGs8QVDnqjjQwwlwgQgw0KFdKTrzDTFz7eKDCwm
         9/mRXG0nRs59A5rIQjS+D4dCD9dXwbo2m5v9UhjHUCaZLZOIWbmr4fqc9Ol5E4/CrktN
         TPb1hnJ0EoD494j4suTvjbCFRcAEPUAflFQ1YHVSVNUVoVt428h9r2eiLhrEREumUo6c
         RCvdaGqCOaULFd5+EgTVuP2WqtyY2Xi9Pba3susZ034rQMDHhvlvldqKoBAUtBlkUGEP
         HZMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787920394; x=1788525194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bqfJK6AvjcrjKxv8vWiaGOdrwD/fsLSuibq+C9S1YR8=;
        b=NGbXx2qcBg5wqQ8042WbdKByKUVBtLas0mR9+N+45pGXrg24IcnzeDZzesdPEOfwpj
         qekPNsmWv+22L5OCt/zzi2iWsqQvBerJmCia2DAWtF+37d+2OPaM27mTz9uVhc09EjWa
         d4tegPF2YHVc/PmPrKyT9vPAxQk65CjUw/kZTN2A6UwmNUL9Mk1xcYY21JfRihWlrbiN
         eDYNIF1oegWl+zbbyvwJLRV266JhMhG7v6KnTGywj7KoWXpmX3oJFB9orY8Ye5dVN2LK
         1Wi3K1bFICWwhichNtjkmLPlLHHwadezkrTec+svlN/d/0HSoCP5/XS/vf+Wwqhtqa2f
         kdbw==
X-Forwarded-Encrypted: i=1; AKwUvByOXPFgolJVedb9tvoWAp8TPeY2mQ7P2fs5kQ7XfzbSRmn0xz6y73jat6WPMrRplZePBOMLfufITwzOZzU=@vger.kernel.org
X-Gm-Message-State: AFuF++mcLj/mSGGKM1jX3FXgM2tAVBRJD01IMbPEdgtVi946Xw6WO7I+
	NVxpe3qYuDorSDLngz9BRns9gU2Xm2K2IaW/1QsYEZZqgrJ6F/Vu5TiL
X-Gm-Gg: AYBFou1x1yG16KTyYTrt+1v7XnxdRrhnBF7WSYPJWPt0FiNrVyBp1TeqijL7DcTt621
	LJBURfSeFqwbJtLq8dgU52oDUi5wogwQ93U6ffYdSI1Gi5HYAmkCOLnwPs4IHG/M3w+9JjBPX8w
	ZWSs8sCIaqAuKW9AkFWorlz012xxcKusEAuc+IqEXp6RS+k+q50Sd7zvfQD8VfaJmjYCjjcJi3Y
	mbws85kQt1oBQxXmq734yjpLOkV28oAMyR4FKCeI44fQFxFpqTl9JalWt9mpFbcHkiBfOAPgjfJ
	U5ezCNvwHHtrGQEFfPGb2EvvDf69M5gF19KdMdC9enqKGl89tLsUGB7Jxk+aHvLbUJv94uM4y/j
	A+nloEC87YTSRwFCpWbN1ZxZgNRQXEro0vjINdTgBtbWwZCpAX1swCArQ60Tm8MjZrwSCGCNXP5
	DsblQKO0HQgKVNHBUq2s23ElUkHziqh1xCGr0MB/GChIQh45yQ4f8Z9EHA0eqz1BT4Wl4=
X-Received: by 2002:a05:690c:6ac6:b0:854:4fdc:cab9 with SMTP id 00721157ae682-85d65ee9995mr32089877b3.6.1787920394110;
        Fri, 28 Aug 2026 05:33:14 -0700 (PDT)
Received: from mac.lan ([136.55.173.105])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-85e5f4f3b6csm5435987b3.20.2026.08.28.05.33.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 28 Aug 2026 05:33:13 -0700 (PDT)
From: "Cen Zhang (Microsoft)" <blbllhy@gmail.com>
To: gregkh@linuxfoundation.org
Cc: AutonomousCodeSecurity@microsoft.com,
	Dai.Ngo@oracle.com,
	bfields@fieldses.org,
	blbllhy@gmail.com,
	cel@kernel.org,
	jlayton@kernel.org,
	kys@microsoft.com,
	linux-kernel@vger.kernel.org,
	linux-nfs@vger.kernel.org,
	neil@brown.name,
	okorniev@redhat.com,
	stable@vger.kernel.org,
	tgopinath@linux.microsoft.com,
	tom@talpey.com,
	xmei5@asu.edu
Subject: Re: [PATCH] nfsd: hold cl_lock in client_has_state()
Date: Fri, 28 Aug 2026 08:33:12 -0400
Message-ID: <20260828123312.26927-1-blbllhy@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <2026082828-palpable-dingo-241b@gregkh>
References: <2026082828-palpable-dingo-241b@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Please use your microsoft.com email address, and not a random gmail.com
> address.

Sorry for making you raise this again. I will hold off on new patch
submissions until my approved Microsoft email address is available,
which should be soon.

Thanks,
Cen
