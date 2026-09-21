Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AB0D4A689A
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 14:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790001784; cv=none; b=g6e4kGoIgjJrqZ6sd6vWfzr8/L37x+Wj7RmbWf1/Cck4uKr4ujn5yebBbq4w+0SXnH+g6ATdYQtHc7tR9vJslc70eEY3I2BqU0RnuwdveYvoYN7qaCL6vShB0B5WgUkuJFPNhoMtbuPb9ylPlXiIK9/DPWZ1IhqBpwsy6MtZJ78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790001784; c=relaxed/simple;
	bh=ee6NNdwpIoJbHKA0a/AD9u5PEHXwKj964nGJAAW3SH4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fIMKFhRqbNWMdiUxb5oWSHBf3BQ4rPhPolilfbsRPZSFE/wHeYsRB45YXh1mgxTi820llgJ8v3erTG5nwvhkH96nrLUd51OjNJa/nGIBrCD74My2C4nRRwJbyJjmfN7ssSS1hys0lP59C6nDTRHstNeXAWSIKma0CIW0Mu+mcVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AqbeFuiC; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AqbeFuiC"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-868cfc5c244so1615265b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 07:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790001782; x=1790606582; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ee6NNdwpIoJbHKA0a/AD9u5PEHXwKj964nGJAAW3SH4=;
        b=AqbeFuiCjU1Z+KffyMiRh8sQuC9I2hgq2u4T1lSTcLdrgP+0pKhDPO+i/+UokhXt0c
         NkZPID4wtxHd1Tqg3RdRLybgPcdnXHzDHGjWxY6a25pjUCctVtMdvu5+nhPuNw5XcjLT
         ewcOePPwt68bcg6j8hV9e4jufUTdg1QcB2f18MvILeeF4qlu6wy2YlQwQV6gYUvYae5V
         f5L6Ry6TSXACqnHZiW81mJJh+4WPHdCRtC7EUCofIgJLQNh/bELw/1Bm+JExTBKJpNNJ
         e6dLEk9FNFPIDVpoeO0QaZg3AFUXOHrElcVeF8R9kvqld4zEUtIGNC1UyvL9RtLE64g3
         22Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790001782; x=1790606582;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ee6NNdwpIoJbHKA0a/AD9u5PEHXwKj964nGJAAW3SH4=;
        b=oX7FSgFd2D843Rrg2RsL25HEpmYBkgKe0GHcN8Ge5qawxPdqONmHNLUhXJgvu1dNRj
         iKADIGdXhK1QVXwIiuxcIlwyuSISl1DoOrsKobdzX7TiFiWzLulz1HtueT8GNrvCMlyN
         0NyclGvdXFmtu/VBH2bXMHMKMVhXzsQkpTJVaeBce7jc3oAsuqNGwN+d22AQhj7Ibg2y
         iiOqO/+mkwgzn0YLLGoMGVEJ0LyZsQNPo8em/TLQ6OvzRAg8+wge7gByXaEbRLEcY3KN
         vN2B+aL2UZdhhXITC4wLthgEtYTJsenZ3xM57/TXvilpNMEH3QmLWGZ5r7HA5B0FOk2V
         /CnA==
X-Forwarded-Encrypted: i=1; AKwUvBw0uE0dma/vWM4nWSSw53ckiSbJA/Q/a+dbUIQXMeL/lKbID1M09E6s8xx8cOxReTf3a9dSP0tVI4QEXUk=@vger.kernel.org
X-Gm-Message-State: AFuF++k1EJRafi0pIzWp2+tiN7K3srVANmgy+xHvzdLVVddfJ3Kz4TdZ
	V8fWn3C+SQO5CsadfiXvvgr6FxQzuBrspuqnC0Su/3nweWbgqx1WjndX
X-Gm-Gg: AYBFou0fWo9dIgfpnQRfIdapkjiG3a+wbPuhHYFZEG5OHPuN62MIjjtRiu+k/SFokHn
	U+jfPv0QMHuANJVTjgikhaEDUwO6bXX7ueBSEUZpbl+Ar71bpBK8oW5OzYNIYvdjlodxZm7H5A7
	KboYC2IJS9qc0ayCqxihEu8JECoxOmb+7vGsW9rUzQRPdV33cK5TspjYUJ1oCcmTwSJ2RgzsF4M
	CoPNIpPx9nf1d/8sFWj3S2TffeTouQebLT0wro3NJAjFSnjnBcOMSrKeLh3uffnmXzRozMeYfNF
	atBRAinYS7B5DI/dUdJseMD0PXmec4MUHRmDuNWoynFdCtM+0oGFO2IqF13b1FRuzHe4KjeuHgs
	Pui8q0ZMtOiMx0H7RFVCaDDSE5quE7Gywd8M0lEeJmaoMlgHcZbZLVXZpxNeaRnmSKOeaBrmKOv
	wkkwtpUXlQHwt7X6UFWnPsvxmplZ6jhv9PxLtB7TowMcQGcIcZ2XBz6vATeq0qIDwc1Y1OwVADm
	rD14YW4CLlT7wRgSDOfGTkOFendpibcDOirQXpruVhdVcbqXhV88Q==
X-Received: by 2002:a05:6a20:3949:b0:3d3:adbf:7784 with SMTP id adf61e73a8af0-3dd8c41a806mr15005040637.25.1790001782204;
        Mon, 21 Sep 2026 07:43:02 -0700 (PDT)
Received: from LAPTOP-ULBIJHFK (59-124-193-167.hinet-ip.hinet.net. [59.124.193.167])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc72acd26c6sm3704120a12.3.2026.09.21.07.42.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 07:43:01 -0700 (PDT)
From: Chipang_Kao <prozac2734@gmail.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	W_Armin@gmx.de
Cc: corentin.chary@gmail.com,
	luke@ljones.dev,
	denis.benato@linux.dev,
	jprvita@gmail.com,
	scardracs@disroot.org,
	bryan.odonoghue@linaro.org,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] platform/wmi: Move ASUS platform drivers from x86 to wmi/asus
Date: Mon, 21 Sep 2026 22:43:07 +0800
Message-ID: <20260921144307.467-1-prozac2734@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <ee3735b5-6f56-4b88-a582-5bb0aaf3eda8@kernel.org>
References: <ee3735b5-6f56-4b88-a582-5bb0aaf3eda8@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

=0D
> Thank you for your answers and this all sounds good to me.=0D
=0D
> Based on this I've no objections against this series.=0D
=0D
> Regards,=0D
=0D
=0D
Hi Hans,=0D
=0D
Please ignore this v2 patch. Only asus-armoury.c, asus-wmi.c, and asus-nb-w=
mi.c are =0D
WMI-based drivers. I will move only the pure WMI-based drivers into wmi/asu=
s folder, =0D
and follow up with [PATCH v3] shortly.=0D
=0D
=0D
Best regards,=0D
Chipang Kao=
