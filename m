Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2273E476CD8
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 09:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790932685; cv=none; b=H+DWgPT1RLqrGsshie+G00LbVwcUkhPSGeTCP2GoIYS7/Xx2b5NUvW/T88eitTu4EnpckRSua24OMeGciK019GqwySGbo4XP5BDcBK8cP4dUCcVnB68YgYsTXOZnUVwm+pl+ftO+BeVfJf759+sFXL/x9bbe/llT+U+y3iH5Clg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790932685; c=relaxed/simple;
	bh=IUZNf3fno5D/v1SQtKkJJtC39+JBzebyE7h56078Jj4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PpNbSoWzffp5jPnckXOhCmN0OKjFhOiRdKv+Qvc69KPAlNhM6T2Mq1wC4Lnwc2Am321JSMrllWKKuXHNGJliR1BH9VJvkCtBDlCcVT23kvdOtCvH/ehlRlNQ8GKGNUvBqDopbpMt8If0x00sfS1b5jY0QEA1tSYgZhV1DgPDPyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IFg2oAmc; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IFg2oAmc"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ff9621c5dso46987845e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 02:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790932682; x=1791537482; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H0FcRb8OTX7/GhAedNNsxuIjIt1hP3QdH9f7yijnG/M=;
        b=IFg2oAmc4OUwqJ7/ZADZIUBWoK0A41m3vk0OoWpsiXflsnjc3loxliTcWMGrUn2P3k
         jl66KzvdUHXDElmsrvWPkxKxm0Y7f8QX2SvTJ0ZkcJF4EKD3b+1KrTWjsPCQ9DLh8pXY
         XZBRqR+Z5K0QMHfZmS9czomEFTvSmOC/A3npIALIZNAJDFVKzPfL1gaFbPLS9OlprlYx
         o8QS6yQohrVFd4J4/Dt7tPWKkEGmr5grL0Ms2ZbtwPnZtcqop93jq8s+VGo4fOicArnQ
         tE/g+pwmDzDpo9YS8Eo03Ci7mukayZKs/fKaKP8qXlpXlBDywp1x6BUknTQI+rDApggk
         mnhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790932682; x=1791537482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=H0FcRb8OTX7/GhAedNNsxuIjIt1hP3QdH9f7yijnG/M=;
        b=rJdJT3C8dMouWGCnJ0EyT435Dc3TyZwHm5nMqs6y8x/becBOABvRaQV9KGT38z6Gd9
         C+CM+kNH6dL7W6WZns2WOxPl/YIo9WuWsTz3H+Ximx5Blf0apNfM6hJ+qqhR9Quf7Qh/
         8CuBvQBgPYdwkr54N8fAgePLeuqB5ibz8pB0nYk2eL/r0wGI2HTXBz64DnLmSKXxqvcl
         iemOElCUeFMo/FtYNAcD3Vj7p4NE9XSumO1hdQR6+ebLzA7MpZApKGv0gizSAaq5bJMT
         I0p+s4UvEA1SqKUC6af8F4en24y3LcoQKgnN0AKqkcyg7QPvEkSGgcMCw75GIKKI3RqR
         WQKg==
X-Forwarded-Encrypted: i=1; AKwUvByOryOaAh/8/SIhnGmlBeLgqHCW14fY91VF1Rx/73mTGTXmOYv97RRixcpRqNr6lGn3Y27kVDXOQ9CFq84=@vger.kernel.org
X-Gm-Message-State: AFuF++kaMc36yA0YgNlPeV9ppYWlJ4u2kYVwwO9uiEHiZ+6ZiKbed7QI
	UQEsa90basdhsuwGc/X5Syp+nVhZwHASuGWJHDCbsHZ2Sqav5SL61IL9
X-Gm-Gg: AYBFou3n3n807HRHE4Zd/5rvmL0guFZmH2ZqX0+vy67DWevrzFsPiRbina5MRNnPzQZ
	kUj5swQ3Wz6vFVrIa5Pn8NYB/UxnzyogYsB772Ss7gxpgE7sAD9DtcEdUzrTVFI/IRuIZg1xVew
	njpLid/Xbcc/a0rdPKeqJohfpfG4x0rtsUejm4r3gUedrTzEE9EZOPXlpyM/53UV+Mut/jbo9+y
	HuidzZDSfGnS17UnK79SXJMfCqqi4xt3NEQeJw8N37gxRyZLuAaXP0ee90jGKaohHye89aWvMrh
	rjcphHAsBf9+AmqBiU2x+6RPNrqO0OJ2cOHmlY5fI4vAeFSYCAWvn+Fif73GMJcG3Jp6cfB8+n5
	GI2wc8ROE7qhCp3f1hWh0mmivhwj6rAX7QhEonGxVkS2JofiwUkS6A30HjHIR44gLYiLNFFUJno
	mALoESiQ+YDuFn9xcNS+3aMfc8eNw3AZoGXCjl90mGr+HRpE4mTvHUdno5n87Ctyz+oEuispwQY
	cg4q1YzpiM/nIwhCBnFRYnvmH9O7jiV/NQSfSsgUm7hUBGEBHguXRh/yds=
X-Received: by 2002:a05:600c:8b77:b0:49c:fc6e:8caf with SMTP id 5b1f17b1804b1-4a027564df4mr36860205e9.19.1790932682063;
        Fri, 02 Oct 2026 02:18:02 -0700 (PDT)
Received: from 1Z10 ([2a02:b123:8010:a99a:44ac:6cdb:a419:601e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0280b2e3csm77717755e9.5.2026.10.02.02.18.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 02:18:01 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	mchehab@kernel.org,
	linux-media@vger.kernel.org,
	bingbu.cao@amd.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andy@kernel.org,
	hansg@kernel.org,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 02/16] media: ov8858: support 19.2 MHz clock and CHT gain setup
Date: Fri,  2 Oct 2026 11:17:59 +0200
Message-ID: <20261002-media-v7-p02-andy-reply-1-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <ar9Z1Zr-deCCQ1nx@ashevche-desk.local>
References: <cover.1788360629.git.mauriziocasciano7@gmail.com> <628adb1cabec866554ca26a2da5af860b04d6cb1.1788360629.git.mauriziocasciano7@gmail.com> <ar674__4-cNOGMMy@kekkonen.localdomain> <ar9Z1Zr-deCCQ1nx@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Link trailer was invalid and has been removed.

I also corrected the disclosure to the documented form used by this tree:

  Assisted-by: LLM sparse

The clock constants in v10 use integer unit macros consistently, including
19200 * HZ_PER_KHZ for 19.2 MHz. Patch 2 now uses 24000 * HZ_PER_KHZ for the
24 MHz value as well.

With Best Regards,
Maurizio Casciano
