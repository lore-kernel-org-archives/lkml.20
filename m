Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91C31485939
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 12:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789044929; cv=none; b=Dl74XRhlgRkJqQDNpzjV2aupFWmta+a8VhZb2WbSeljsO0QhkS63DyDG26OlHJDHhQ4X9Qijxk8d0ZYWHxCL1hOKQTywGJfMuw4ygJN9j+PMQLwbUdI5CQoXikAq1/ulHUlJkoyNgVT46J+YSpG3y/5uH4AhJMUYE98YXUP50Xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789044929; c=relaxed/simple;
	bh=6H27RuGRCd51q3l3DeMJQ4HmmM8diZXr1Ijh3D4WFuA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t1C5Iw0cnZfokPnDcWqI1jhniMfg3oDDuetBasKsBOmeuczwKthzZWcY+M8nXb+NUynYkEjoZ9pPpYpoH2R4vkO8axeme33BuIVUX1/jAEfXXiG/iq7nAuGSXdlcCFdGtptgVWj7jCKTTDNSff0EWQEiEIzS5tQrsvLD0Xzo+mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XRwu5Sis; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XRwu5Sis"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-86265451beeso3568738b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 05:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789044928; x=1789649728; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6H27RuGRCd51q3l3DeMJQ4HmmM8diZXr1Ijh3D4WFuA=;
        b=XRwu5Sisd8g7uVrMvGG1g3kR46viUOOpzm9OjKult0/W1Eof1we+qfwYTx0Ms+Zj2x
         OoWBuyqUpEd86aDxDEH2mccHmTs5PQeX4a/ZYXayZbQkjmUn6oEwP701s3myjylJDOGL
         8EVGLZzxadZfk3R8CqZZsT0f8dwkF3iZN7Owo8hsl+dABzLHOMBeLAI2pQw/nKTE+MIj
         I7RyGOqRKMlO2QGQ9uxY/Q1u1phUXIt0PuzRkhjQwiQfeVGv33CmsQbEXA6YDPpVCurJ
         VdE51NLTIs2L+Es5SeDZRmkX8iTWl1o58gzM0N1klGAkYWlUvH+JN6B29Coxmjzp0W8P
         3jKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789044928; x=1789649728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6H27RuGRCd51q3l3DeMJQ4HmmM8diZXr1Ijh3D4WFuA=;
        b=kUSl6kaylHX2o3Z9IM/BbwP/NqMDg0hImucGMQk60hniW4b/7CitRhL2N4QJXLpdgB
         2a7LspeviB0o4dQ2Gr4Bfg3ep16aUrBGTnMqZyi1ur2g7umyNEExl2+v75Bldht/mymk
         4DYA1LsOXbMIm3SEx3xBhSf22G+I4LKN1QXu5cPdcZM/ZK60BnPMAYTrgENK2k+5PW6J
         AWrwCgv9dvObicWGvPwO+LgZw2yiN95o4fdQych0lYAIBYt5fE6HFcDF6BberUzD4D6D
         LoNXjy+CHz/BCmSg6sefDp5MT1Rtck5ke2Bvp6ulEsjc7Y6dIABefLD9fzwXyNobah2D
         SWnQ==
X-Forwarded-Encrypted: i=1; AKwUvBwo1luqjLeCHc2xZ2Skfww+uHunCRSv3h023M29oFPuLtfrFXQMLwn93plwwKt34A/7H64P31Bhdsy4Xds=@vger.kernel.org
X-Gm-Message-State: AFuF++kYe5R6RtREbqDELYt0ifIvbDIR8CCqc+cZUCPlAWtMt7LAMYq9
	FkRzVKWXC/782nKKPQTQVU6a3qagZC+lwJvj5VNsGsRZlHROHSZhocW48YgieRGA
X-Gm-Gg: AYBFou2gssUiVQEPfKFI6nC9ngHvZuLUj82jQ70knZWCPNsneo0fTWW18Diwa7NFd8c
	nzQH6kRBZxqRJAb6CRo3owWOjFv4tDkr4DRqAXKVbYdLn+vmXcrdUge14LwmJn6Vhqi1DFHzQ4v
	oOmoNgGw0esq9vcGFeBRuvRsryULMPkRspGXPNx1p7SO1hYcJ/gjf8ZafUyG/IE8JjX8C8+BnzD
	jnks6KCbTwVXxqJoB43Xv6LzL2njujWODOM0SufBxYXoQKtXZKj8/8auOz+DYK456gGrXBTRmZx
	/Q4hkHbNSYDuCC08otRCF44a08qMY3CuLqht2rx7+hm+iIjrntTJdQj/o/5p78LZitn1KJmNL2d
	rJrvGYXPT00qO8Q3vFkrCT9Ggv3XCzzEn/6LIc/tryXzQR0ndIKZ74E5cgNl33HNIUYvaLoyLq6
	AqRLYyG29NW0pElWptmplwd4gVcZdjEtXeJF8u5pFD6SrQEJC5bsxg2vPlXo8Pn6/Ejandzhd1v
	rEsO4OBroJQ+cGDRYcY/5OXOmFEyqHyZqhBwA2XuEd6zXlN+fhvZlM5Qj67FnKwMnFF7ziDmeze
	gR0IcA2REn5Dofxuci7EGV0sLA6II7pORsk=
X-Received: by 2002:a05:6a00:4206:b0:847:9267:2104 with SMTP id d2e1a72fcca58-86168593e70mr57210262b3a.12.1789044927579;
        Thu, 10 Sep 2026 05:55:27 -0700 (PDT)
Received: from rikka.tailabced6.ts.net ([240b:10:ff82:b100:8ce2:c181:4224:d11d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8615371e5f9sm8211492b3a.47.2026.09.10.05.55.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 05:55:26 -0700 (PDT)
From: wakasio <scarabeeta@gmail.com>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: xhci_hcd / ASMedia ASM4242: Bulk-OUT -EPROTO with Logitec 0789:0308 during DVD+RW recording
Date: Thu, 10 Sep 2026 21:55:21 +0900
Message-ID: <20260910125521.1587286-1-scarabeeta@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260910141633.00892cf8.michal.pecio@gmail.com>
References: <20260910141633.00892cf8.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Michal,

Thanks for digging into the TRB content, and for all the patches and
time you put into this over the past few days.

That makes sense to me. Let's leave it here for now. I will stop
using this drive on this controller and keep an eye out for firmware
updates on both sides. If you come across anything else on your end
that might be related, please keep me posted too.

Thanks again for your help.

wakasio
