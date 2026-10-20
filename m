Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792500772;
	b=z6A7derGUV07nTMhw7eg4sVBSN3LGoDTUGMjbtoomjLQ+BI3U4W5RpsqnnJs9Y3EAGIY
	 yq3/lHH9+VWZ5IiIykdKQGsNFQM3MWUHpn1iaP5o6aALZwgmTEBNy89X+yV367xdvDPaZ
	 uGAxbOA3onbpChFteAYOOr/RPKt4uGGIqXAKMpk15hzeFmg9HyEvuwaJfywW1508oOvS8
	 jytoX4AQRH22nd1skZMPz1PCcKQL7t8mYQyQSgNh1Y3G4vFpIPp2sZujb1yV/moNWAM8Y
	 d0FcuzkbtLVfcVmXl8dUXidD8+teKExnQZ23c5kNn6CSGuEYjwwaoipNqa69UZfiqew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792500772;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=RRNHwuzxK2uMbz7SC9yJ7WKgsG9c53Ltjg56svJJIY8=;
	b=tUZ7SoRWlL/PWxV6U/ujMdDrPhHEP2XHLGax9U28cZAY0VH7q2+KooTW+jckZ9vHy9f+
	 LTWENznbKjByvdjzC2AO893cmIaR62F/tZg/Q96sRbQdup3SHgtDxkDzk2YT99qAXQTGa
	 ql/q/HRTwVB9roDXakWTuZLzf0o1G3JJWlab1Cnf0YMjPhGp0+Lhq+fgu6an1LJchvcNC
	 9DorW2C6k4Z2/i5x3opCQxdZ5wwfhl+ObhEvCS3zCfnkVnnf0BAEakr702xNkx0EKf8f3
	 wu4XYN3r/jFC9+djHyi/m7OsRuY1jtNXnR+QHfrW7gFOpr8gdOdz3h8wxdM3ufNgY+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eixItCB3;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=sJcYLhdB;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94F0260A2618
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:52:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94F0260A2618
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eixItCB3;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=sJcYLhdB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792500770;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RRNHwuzxK2uMbz7SC9yJ7WKgsG9c53Ltjg56svJJIY8=;
	b=eixItCB3B9rIypa9utZowv9HIfZwzk+AO8Fa4nWFnwdhnDklIx2I/y/ceoET8aVdwVOy6q
	zeAxYbwtUO8eszS8bDGf6+xnTF1MmTHy0is0+vU8KjpNwycK4TN+0dfB68Xi3KbTIntgCO
	JnDzpkfDgyRggOph971xDgM8lqwqap8=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-607-RJacppe7PWKYbjEe_F7QIA-1; Tue, 20 Oct 2026 12:52:43 +0000
X-MC-Unique: RJacppe7PWKYbjEe_F7QIA-1
X-Mimecast-MFC-AGG-ID: RJacppe7PWKYbjEe_F7QIA_1792500762
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-6b1e00100eeso4682369a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 05:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792500762; x=1793105562; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RRNHwuzxK2uMbz7SC9yJ7WKgsG9c53Ltjg56svJJIY8=;
        b=sJcYLhdBPlyCvITcjoMJCirtD3PPzZMPnNFxOe87vaVuhpHrIXWHIkuOu2iY/atHLh
         1JF7UuAGdokQTF27QVDwaogPAJj2p+i45CjQ82k92qVljM2CEAu4L1dtWpdcRnWg/nkw
         g5Fkgi0hcuM9hVOl68ideiHl0TGGwq+HjvnkrUPd9xztWqSqPwpQnDjxVrygB6s94SWm
         H6chIRaxCIEQ+keh44j1oAS7Bfjb2Ij3zS3txZkWltNNArc547Dqio+kmRJV/l6P3csv
         dbQjXRPRSp8Sp5p7+PkBB2gvF1Gn7wdPhCy0WReEFI3bOtSYOC3s6w5dvuTQJOBVNQgw
         JCeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792500762; x=1793105562;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RRNHwuzxK2uMbz7SC9yJ7WKgsG9c53Ltjg56svJJIY8=;
        b=yArjRDYMpnFhpxUXZMLgJqa2eGNlT4ybBPhnzuIa4N3WsAdLHU9VA4j8yVjRzzChZo
         +RO1gKl+sxNbVfWcKSHxPGrPsOWsqID3SIW2Ko+gDaoyJ839HJdgkChUe1vul+BajkdA
         ewvdo30fmWpy8PIMFEwczWK9ZepmGGAxVVvvomEh/qrJYiqXPKKDefjCkyDrfGhm4Ugi
         90PFZOQMtlV60ebqSQsNY3RXbvUklv1jmAD5Cs7fi8GQzAGx1zozvNYcgGYfANA1ZtDB
         1WJGXT9geHULmvaw5afZBJBSlld7lJrcxDOBqDvcAqDU7PEUL6qrSSpRJxnzrNgvFNsj
         0vGg==
X-Forwarded-Encrypted: i=1; AKwUvBwcLF0iszPNzdjskxMfb1hyVrz9Q0BjRyaScFwkPdg739Uq05fzi28izqpG3DRl00vUdEkY4JKFJ+Tukq0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJuCsHWGXoxJvA/b5C7ztmmReo1lIYRYbzx15okxNkWEt/hAjp4
	/mZR6jszkNt0eMOCWzKAnNE5R/Ei8T0uq/6V+YhtH8L4gFBCD7G2zCm0CguP4cb1cZE9gGUH1/E
	A4lQDpMSTQjLkXzDTHBwmG2ekLK3g7BrolUbCfS3eTLY+iBoF0uY17j44wj51cB1vaA==
X-Gm-Gg: AYBFou1zImuDU+u7uOdWLfo4s4eR2SpW3AOBDKRNU5N9f5P61a9RsfmkQIwwSAX0Ou4
	Q7cncMAmTmK2yM1NrcexQBz5/VXRRBzLZ+hgRE/5qA4dIGx5qT/Av2SzES/cdpelwzxSMJ1/TfS
	WL8erzgksn0aPTv4K4FAXIRRRPazM6iBr8WhBT5AssR67fXVbeTWlJBE+84tKzE1E6EggvIGTVF
	Xg/bwlebsmmp0Ft35e4QCQshHDFQeNves6Qq/zPWnSdQ/5U41kQrgvmeDJtwCiY+1sGBfg1xRu4
	pl+UrBsQhInEDI55HLzXJ17ZGnZt/gSxFbJLaBAXqbKQDVlcYDic/cmmsjOv4CT7qf6kNaDR8Oi
	wvo3E3CJKCOIfg7gVZMm4e3nnV9ZICnBvoolTQoeFzvXt1FB5Sf4PYwWQ9kcYxBmh76VVdcQRYT
	Ews5UrOkGZKzfbjVyLiNTizHtCb1W8QAzCP8psCtii4BIOrmMDUzDOOoLLqBAgpM63aYrT99Y7f
	u8=
X-Received: by 2002:a05:6402:3206:b0:6b3:b648:3170 with SMTP id 4fb4d7f45d1cf-6b3b6483f02mr6091838a12.4.1792500762144;
        Tue, 20 Oct 2026 05:52:42 -0700 (PDT)
X-Received: by 2002:a05:6402:3206:b0:6b3:b648:3170 with SMTP id 4fb4d7f45d1cf-6b3b6483f02mr6091819a12.4.1792500761744;
        Tue, 20 Oct 2026 05:52:41 -0700 (PDT)
Received: from cluster.. (4f.55.790d.ip4.static.sl-reverse.com. [13.121.85.79])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b3c74eb8a7sm2982781a12.2.2026.10.20.05.52.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 05:52:41 -0700 (PDT)
From: Alex Markuze <amarkuze@redhat.com>
To: ceph-devel@vger.kernel.org
Cc: Alex Markuze <amarkuze@redhat.com>,
	idryomov@gmail.com,
	xiubo.li@clyso.com,
	slava@dubeyko.com,
	viro@zeniv.linux.org.uk,
	brauner@kernel.org,
	jack@suse.cz,
	linux-fsdevel@vger.kernel.org,
	linux-fscrypt@vger.kernel.org,
	ebiggers@kernel.org,
	tytso@mit.edu,
	jaegeuk@kernel.org,
	linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v4 1/5] dcache: export d_find_alias_rcu() for modular filesystems
Date: Tue, 20 Oct 2026 12:52:33 +0000
Message-Id: <ad1e9d2c5ba4803f1c7dafc6687638b0489a7265.1792498351.git.amarkuze@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1792498351.git.amarkuze@redhat.com>
References: <cover.1792498351.git.amarkuze@redhat.com>
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

The Ceph subvolume quarantine ancestry walk needs to find a dentry
alias under RCU without taking a reference. d_find_alias_rcu() provides
these semantics, but it is not exported, so a modular Ceph client fails
at modpost with an undefined reference to the helper.

Export d_find_alias_rcu() to GPL modules so filesystem modules can use
the existing RCU lookup without changing its lifetime rules.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202610171220.i77KPiw5-lkp@intel.com/
Signed-off-by: Alex Markuze <amarkuze@redhat.com>
---
 fs/dcache.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/dcache.c b/fs/dcache.c
index 1b1a81f10da6..13ba553081b3 100644
--- a/fs/dcache.c
+++ b/fs/dcache.c
@@ -1248,6 +1248,7 @@ struct dentry *d_find_alias_rcu(struct inode *inode)
 	spin_unlock(&inode->i_lock);
 	return de;
 }
+EXPORT_SYMBOL_GPL(d_find_alias_rcu);
 
 /*
  *	Try to kill dentries associated with this inode.

