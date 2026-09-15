Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B4A3B813C
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 12:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789476838; cv=none; b=oS+MZlgMuCuWIhjA7rddTEpEUH/4xT2o+cuIdxeCgI5isCPXTl2nm1jbYYRv85+1lC0BNAntLmALk+UQHwZbUk2j9KtwJ9eUt0FicW51zYc7fNGyNvOM75OrySlEZC3pwes0cCng9ELCNaYRX2Fi0w78TF9RFC/UyHtuwdzYjKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789476838; c=relaxed/simple;
	bh=sme8Hz713zrcPTrgqanyMIM8rXOqa7srde27rwSKSW8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=lX7I+epytcVSjrQOPGvyLvMw67H1i6I1EZJBmTB2XO7UPSDRaLp7vOUdCm9qEUsVCO+orgfKXBy6EbIVQfMSp16LY3WT49UjymQlSTqAXugYyeX9oLFshnrazUAeGS5FnlolvmP4HAoUdsewyPTkPk4caRRVNifVJ01WrtdmvMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=BP9ZPLUI; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="BP9ZPLUI"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7355e411so24130395e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 05:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1789476834; x=1790081634; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Oft/uvvpYXI8HIkiOt6GboGKEaPXhfLuDuk5H2E2Wxo=;
        b=BP9ZPLUI0O4CTR41DJMuH2nKM5IXI8gv5iPS2m5pOnQ0aV/hLhKfacY2owdEOwAzUV
         UN3RjwWEOx3KlpDglBJsOuek6flvTVdqEO1MRLpgeWX3JV1e1YFUzooIbbxc/9qUhkOE
         iTC0t09wr7OwaAE59TfFxP4o3I4vMShtRMQ2E7I1MFIGkaH4VCMCICXuppOdFxb9IQ6q
         sCFKrtQ1E0h1Wzlzwo9RRN3lDncA5dQqGwyomfBs8xnm+6McmhZrO5UqN3dwnCz3tmkQ
         6PCHbk0wCvOIefzy9NmZFKHihh5vIAFN5yTWo0r9PodLAPE1eYJp/C3YzdaiCmccE3YS
         4KjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789476834; x=1790081634;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Oft/uvvpYXI8HIkiOt6GboGKEaPXhfLuDuk5H2E2Wxo=;
        b=eid8yffonCsG/pQMzLSQFRL6e23mYRQlcUinSfT6A8eezBe1rascWBOuc9VH8GWz4x
         wCGJmLpTt2JigE0/PUTExn5Ibj3xZZh+AehzGzXa5UfoMDyClpQMgRZluAWNpyo1Qf4U
         T0aTaz+f2R+SIWRLm/+PXgxY5jUraYUhr55l6ulj8YoWH5XTUGeIMU6vDSayqroSOmq5
         RKr4P7CPtrW8B/VG49DxsJaQdTEe8XI+kjhFVMNBJwidopo7F6sFS4jMLjVFakw3rAtl
         Z5O7kDR7eYa3n6SNjAzlNKPh3lRUdZ/U/vaeLELVKEumqKNv/SmDMaOuoBgP7UEuwNR9
         t/Fg==
X-Forwarded-Encrypted: i=1; AKwUvBwmV7ualDMflk/KaUVBskpQEP2+FbhYJ6BsLutVviI32xSO9dIK1qbtTs00tuS4uyTQakrLaqSgrR8LuyA=@vger.kernel.org
X-Gm-Message-State: AFuF++lDthM875khMVmqHXhcQmw4mKqFfhn3zW91S1wtbuGbw45aTXCr
	x9/fgjMXXOALCuidDgp35iL/Uuu64nrF6UxV9aZVB34aqCClp3MEt4KSNxDDuC4YSIIKmB92uqq
	PmPml5uaOsw==
X-Gm-Gg: AYBFou1nxEwWwcuZiXuM+R96xmOJhq37rGNJ7wzWBGIBiEexken/h3CkURU7yB6tjF6
	EoLAL6nMtGZWLWEaVQTNmYCyN76RKHXt0BQHU95AI84kXUG2gV7EQGxddBWhk/hNfsiBJyGHhg5
	Px4/W0nXnbGOQ7CF/8kuLcB4hsugKE5sGIhY3n5LqT0BwEcDyt/bVGuum57gLkewrOXwKqolfFe
	ECZZLPg0ToprpsjsN7OW3KMZncrzafyhbr2H0E/qnLT42niBkIYlUjVCie2iGcTKSb+J/sAOCRu
	HYCTgdKwCm8+NLgmp2p4eKQRBSQldZBlO4eUTHVz6QJgo7ZPfQX7nT8KhnoTCZmARb9QaWKF/Vj
	ayUeQlnaT1VQ9ztVjLbIqG0pAFnzR0DPJHWHyoKJ9kT+Vlgb7HYR8jW1eAMfnb0KfcFUaXiJKZc
	BbEjKgGIKer38dkbiuveh656lXiIw/ViIvgOQSdGR2cg3fjqwcfUYRkTBEuzO16BGVNOdERuMIR
	Vr1c4rKhCm9u+jHCOdkLYL0x8aAhpdbiDEta6Se9syaiZERAz9Rz7Txs4OB/bdOIW7zkmrmQ7e3
	0ws7mUKuvsBCqEzi0uBl
X-Received: by 2002:a05:600c:3b08:b0:49d:1e09:694a with SMTP id 5b1f17b1804b1-49e7a66af45mr163880085e9.11.1789476834097;
        Tue, 15 Sep 2026 05:53:54 -0700 (PDT)
Received: from [127.0.0.1] (150.red-80-32-100.staticip.rima-tde.net. [80.32.100.150])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d28c734sm57627925e9.1.2026.09.15.05.53.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 05:53:53 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Jan Kara <jack@suse.cz>, "Darrick J. Wong" <djwong@kernel.org>, 
 Christian Brauner <brauner@kernel.org>, linux-block@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260911233415.31271-1-kmehltretter@gmail.com>
References: <20260911233415.31271-1-kmehltretter@gmail.com>
Subject: Re: [PATCH] block: Fix the thaw_bdev reference in bdev_freeze()
 kernel-doc
Message-Id: <178947683123.1379494.5325444794589226009.b4-ty@b4>
Date: Tue, 15 Sep 2026 06:53:51 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Sat, 12 Sep 2026 01:34:14 +0200, Karl Mehltretter wrote:
> The kernel-doc comment of bdev_freeze() refers to thaw_bdev, which was
> renamed to bdev_thaw by commit 982c3b305843 ("bdev: rename freeze and
> thaw helpers"). Say bdev_thaw.

Applied, thanks!

[1/1] block: Fix the thaw_bdev reference in bdev_freeze() kernel-doc
      commit: e14c3379be86854c203de1e0fdfdeaa0b45509df

Best regards,
-- 
Jens Axboe



