Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B8BB406818
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 09:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788428297; cv=none; b=PjKKcPFSrz12k640kAFSfPC63FNUXcq6agWlsjHGT14vmKlZ73SFdIcSwwwvejnMnVvVul/4h8NCjJi0IvTIulYwZweNWdGBrpg11lYgxRHE0Rhj5Ufcj5nn9RYo4H8iMn29FIkyrIZ71ZjXOxyJg/QaNV/6vJnCMHzMH+twGVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788428297; c=relaxed/simple;
	bh=Q9BId9yytQXtW2g9cbFswwLQG2BZS6hF1a5zfdPjrO4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Dah6wDa9sqjhZNimrtAuFiVeEaYQ7WWn0Jg+Ptk6uUiA0aySFEvlHzSuUBdfYuctxwYb1pRhyn1l6HcKdi26Og9EE950q7mxiLKUur3eynqgr7v/s26kmi5ucxeJ9HVURwdgezosGSF0t0Wnd+Ebn/64XMdxBPQHcAdJffNKIcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bMG8tSQY; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bMG8tSQY"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-ca97d139d5fso2029999a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 02:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788428295; x=1789033095; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q9BId9yytQXtW2g9cbFswwLQG2BZS6hF1a5zfdPjrO4=;
        b=bMG8tSQYmtDhqBaslfZrgbrhxaOpGaGDxy2GP2OIjiF8HYZ2hCrsbAFpRmlcWAx0/n
         7jdRIUapPgOu3qmWj6vdV40fzKoHoKJ3U32VJkIrWVSZbjk8BilM/GAhQ6j9A3FO45UL
         CUDLvB8s5V+THAkcAMaRqlBpUfB7YWsvXFxnnLBpQCWGhNeMNn/sefgWtgK0X9cE8e1D
         M2wyweEpBRZdWkb4KD49S7Oc0aAZyb+BMfge4yLdq55eNWKXtvxoIJFfHjhjRC5ryBZR
         qz4KkvF6SjVIwz7k0+hyWrQX6VKYPpJzBev99V4SKusJEk3u9w7H3IBisUB4RYfqSIHU
         pZQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788428295; x=1789033095;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q9BId9yytQXtW2g9cbFswwLQG2BZS6hF1a5zfdPjrO4=;
        b=FmCnrrjHtz8stN6zAbe09Ng9UBg6zpsB1DnFwC9qBRkVJ1mCFUR2o2zGwAEd4cYQjG
         XeKNzgtYfy4yPYZ3/pxDJQ07WsfH+p0bNS4mg/M4UUS79DR7kQWlwtsBPxcpVARddk64
         dK4+e+9zhw2J+t0LHPGfB776t+mgbbJg0+qG15sNXqYU29ttw0flUozoBWTfU47YQPcm
         xKoXV3mbN9xaN3Ol7RscfgA6ydkgLC9Qcmg0nT6QjdHyyvjWpB15TIKmeGYzwp8ntFtq
         PjLvE+hEzgn79jV2G3tCpzknLSDO6ZNyDp0EOfKFqdOnihA5Zku639w3zzQbMUlCXxls
         cOsw==
X-Forwarded-Encrypted: i=1; AKwUvBxn6WprNpc31qff9d4RyazyzQTQCUTVOBjvB7hO+xe7/sXTV3xou/oVdSCmEvaQ8FN3NLWtF756xfA4tVk=@vger.kernel.org
X-Gm-Message-State: AFuF++k2Gw5Nekb77wbTu8VXZ++5QolPeLvfquL70r2EgueBGW9DEip+
	QIHCfgLvW4Gvs69/C5EJVGX1aUv2Cl3IfSBEyTLYuJOw2MjEBffrow6m
X-Gm-Gg: AYBFou24TptqLD8kmKyIsPvZJoXn9aKE6CHom24umRokoGnS1eBc0CfxGPjNr+yQYYk
	eMCvWFun7GyOCQ/yNBxNGHbtDBnlGevkJ0/i21gCfKMe1MMRGCHAv3PIGVnuB6S/YMg4TUMUqG0
	zKog/7+QcvOZjfNdeeM93zTLWL8D24fNoptElTH4TIOkPV49F3oeSWrcFUEVze/Qs6mAcBTUFyi
	4lQ/Rl3s7B9lt4AmOgk/qfkHkJhZ/5nTnaqAS+TjaR4xnPkcKU6quYp+h/CXG6ieaOftqni9+ly
	C3/1IA+92JOdIBu6Y5XgOQg0s4oKoC+wNAhTt7Se4DsN5z6078eXsxrCJwhTnEif/jxoQ3275Pb
	t9c4bPF9VxXc9KapcDXiZsb5bPzbDOAjH/UQFw2AQEFDdKlsu4MkyBo3UnZI9sUirU+fQFUrWuH
	QT9R2lvBDNRcujq1BXssjfHBcRHcOFhV/WuFetiOTp3UWRlRFmbUSCBsfCjMheBQLd8k9/NWG9r
	rUx03sNck8tob8DhELbkuJSpA==
X-Received: by 2002:a17:90b:268d:b0:398:ab03:95b2 with SMTP id 98e67ed59e1d1-39aee023191mr18618479a91.10.1788428295488;
        Thu, 03 Sep 2026 02:38:15 -0700 (PDT)
Received: from mi-ThinkStation-K.mioffice.cn ([43.224.245.235])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08ce4221sm5086931a91.14.2026.09.03.02.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 02:38:14 -0700 (PDT)
From: yewentian395 <yewentian395@gmail.com>
To: Oliver Hartkopp <socketcan@hartkopp.net>,
	Marc Kleine-Budde <mkl@pengutronix.de>
Cc: yewentian395 <yewentian395@gmail.com>,
	linux-can@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] can: isotp: implement N_Ar timeout handling for FC transmission
Date: Thu,  3 Sep 2026 17:38:09 +0800
Message-Id: <20260903093809.1894919-1-yewentian395@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <eb5e9618-3dbf-42cb-a635-752ff9fbcb99@hartkopp.net>
References: <eb5e9618-3dbf-42cb-a635-752ff9fbcb99@hartkopp.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Oliver,

Just a gentle ping on the frame_txtime addition to rxtimer you
mentioned. Happy to help with a patch if that saves you time.

Best regards,
wentian
