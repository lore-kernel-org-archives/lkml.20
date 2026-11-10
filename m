Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794334664;
	b=WEKnZfl3G7aVZS/oa5VVd/b1jtvjXMbVfkK0zVbOfKgVxB3uhQ4Wrsddsj2ruyc0Scva
	 9i/WwxGoLDe8sNoMNga1uz6pcK7zUUyqtgLv7CvWQVcJmtlPVtQQjQxz8O26Quv/y1dsh
	 cL5i4mtKKLpRpHlDeDTr5IqtGe6E8lE+gQS+2Ud93HXcfJtQ1KF8HG7KCi2fgL4A2zgfO
	 GFNUzN9rTdsT0gr+rQixfcHECwWLN4sZeUhBPLYbUluIrk56q0CG79I83pSBVPG+7xlPF
	 iMHGQYoDTJObTr27RyEnSM46dBY+y4G7dMiv5Q/+yi0N+i2cKgmSSazfYymTT3x04fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794334664;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Content-Type:Mime-Version:Subject:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=sHccIo2W74JWJTwt1pWbxPtLRrMDVhYETC/mnvIlimI=;
	b=QNFr/xdefCcBWlkrM5LhvJCVt7s7M6dz9C5VQajOofhUZCWgDXEGjLRFkDMnN5kiPjVB
	 k3y3JQ6HwuEzaCvqc8AkoF4N59ZvaUSxQSfpHz/tOkgEXwnjjZjTdbQO9aPk/ZxByqoye
	 5AJ4/QahHKojsKILycE2W8ynZDKTj2CFbNKVj11PDyOq7Nhkrw3uKxVKwmCwzDCoFPZBx
	 ugKV7WIvaKQeNPsgWS0mNFoVCCXobbPLAAXLrfIvEnOV+26M5I+fbBxz3LzmHV4paifcV
	 k3DSSFsczRVeXOCB1P3PSi4nbN2+/AxlpAr318w7u808h31ymCzpXhkuWIyCjZanz3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="sFX/ml93";
	arc=none smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CD14606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 18:17:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CD14606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sFX/ml93
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cdb9d5c1c8eso1207157a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:17:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794334663; x=1794939463; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:subject:mime-version:content-type:from:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sHccIo2W74JWJTwt1pWbxPtLRrMDVhYETC/mnvIlimI=;
        b=sFX/ml93fLvoZaK4uTWGjiIEIReJRrI/X+5sUtF6Nsvssif+axCDW2HmpI5wP1Mvnv
         z6RyxGfaB19WIs2ibfNZ0qhMrVtzP09wppil1+7rQWY0LMKsGSZDP9LLouFmGKXbd9D2
         rkk+rQ0LRX2RaMzQ/yhz2BC9lE2m+DaDPXv8WOOVrSxjqvozFR852LPyQsTkT0wVrIRh
         urcatdteP6o9YYwo5YpR/0tq2NUX75tPbYPsXdERvCkDearwX6dGLDW2mPGOYBjwItnN
         I5fS1tx/+93/1GqNHbfdpHv4o3zimEovvKPB09BckpmDuBclDEvD9CgD72lQFtN8oHb8
         mceA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794334663; x=1794939463;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:subject:mime-version:content-type:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sHccIo2W74JWJTwt1pWbxPtLRrMDVhYETC/mnvIlimI=;
        b=KYjDjBrfiuWfZhkGytpl8ZccKaWw3V9NZTDUgqN3l6c8DO9VcIMgl8nMMLJLB7YcuZ
         OJewAD+7nIHqc8ga7EbmaTjAocWgLQ1IXR/xFzjIFD/L90/hHHSbJaW0TQ4+aDTOiVu8
         vl9ZRMpEYKEBTTwIG22tulS0hxsLsZjadmltNwlAMXpnM933btGbAqe61uVkUH6jWLfg
         V1WdMJuhRAIFlqU5LybE0ym536mmsJCf0Nm4z5ZWyjlUERSr8c8m2yGsqLio+h9hbGAe
         0Nmh3tmOwvbtuYaGCFZ2O2vlDbXo4TuvZe6gmL2/OqYpkt2l7WQ7p7azqEwWts/Mxrm/
         pfJQ==
X-Forwarded-Encrypted: i=1; AL+hErEtzyXiIun15tViRazCE1XKOPvYeX0IMkEaQX6rrPR7nEW7RKLXe7KhB8RUJkR/kUj7JWDNB/mlv++bhoQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8m1ZNs7/Xz/as8V33QG5xeCAGillVN/BDqXP0+o++g6nC4V8AO
	D9aGQF+yk5gvBhghircjCbIFq1gaNq2YqRamQRPsJIOUlBFaI0yS2AOS
X-Gm-Gg: AYBFou2ucunijB8trb0CJqUVfL9xMCHWnCjj/yDHRWDZRu/GN76coNT5RtVO9agbMvt
	yYbcUsrHg0h8VIzh9LD1GQA4rc0g7kYBsWM/PLRNNcU+vNY+mB3rI9XO5bRe1Yswjzg/d6/ajqD
	Ee14H6QTgRtHlI33SxqrvdGeRbqJ58mRKih3UeS7DEG++Hqj2vW/EF5zgELCB4yNp4Ek8t9a+nY
	VhzB6/sD4UrxSmipi6FR7lmvpcrVxLJbxFbWJqGM/a7Ah8DSaUJKmYJ+QlsgJgKicxgQ0y20qos
	QUP3gbTWpic144fk9FBFTsSRPiOjf/bEMDGlvKQjnTId/wFR1sAh0KhQl23RywCjwEz4i+m2Pq2
	0LVLRYNr2jVNM6oBsJPCiLDFbXm13v0CFUkFAc0NYRNsiPYUJBPop6IbeBZ/NRTQTiCfY6+2iII
	JlPqAuYUnYX3ExMrB3xUV4xkDIyAh7m9z7P3IYJSD+N7P/3BEdG5Lz0GP9O0aPSIQb1Hb2LYyvE
	B/1Keoeey0DLgOyLJ+M4Em+tWi/+W2MMsQ/8cPrgp3RbDrZuK5SIvS34dF/VJ6k8Fr4JFV38Y17
	xqJBOzM4jdvAV2i9ywRGVpC7AhK4+qMhw7gyKKc/bYe7nIEdl4FAtHZMBQY+bd0cadhaIuwtomP
	zeMzrL6tqtHxSOLIbRvmuurrz2rnlzKeCxUHWtwJcK6F/5uDk
X-Received: by 2002:a17:90a:d887:b0:3ac:7556:8ee6 with SMTP id 98e67ed59e1d1-3b166cc02abmr3414334a91.16.1794334663437;
        Tue, 10 Nov 2026 10:17:43 -0800 (PST)
Received: from smtpclient.apple (mx-ll-183.88.2-201.dynamic.3bb.co.th. [183.88.2.201])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6d4a329sm12243585ad.23.2026.11.10.10.17.39
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 10 Nov 2026 10:17:43 -0800 (PST)
From: mixalhs <mike.michalo@gmail.com>
X-Google-Original-From: mixalhs <Mike.michalo@gmail.com>
Content-Type: text/plain;
	charset=utf-8
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.700.51.1.1\))
Subject: Re: [PATCH v4 0/6] ksmbd: verify session setup requests before
 signing with their key
In-Reply-To: <20261110165834.28162-1-mike.michalo@gmail.com>
Date: Wed, 11 Nov 2026 01:17:24 +0700
Cc: icb@fastmail.org,
 senozhatsky@chromium.org,
 tom@talpey.com,
 chenxiaosong@chenxiaosong.com,
 ematsumiya@suse.de,
 lsahlber@redhat.com,
 hyc.lee@gmail.com,
 linux-cifs@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <C5746055-5C40-4335-9A30-5522244EBA55@gmail.com>
References: <20261110165834.28162-1-mike.michalo@gmail.com>
To: linkinjeon@kernel.org,
 stfrench@microsoft.com
X-Mailer: Apple Mail (2.3864.700.51.1.1)

Sashiko=E2=80=99s review has already pointed out some real bugs that =
will require a V5

I will fix them and send it, will spend extra time verifying everything =
but if there=20
Is any feedback for this version I would appreciate it.

Thanks,=20

Michails=
