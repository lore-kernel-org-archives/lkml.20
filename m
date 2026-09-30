Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E0A737AA9C
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 03:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790739587; cv=none; b=TPIQCLikwd+sPVx8Nt/rlO+cre5phB0/lwecIZ7/7bk8wLTr2+nIjfyCJHn5FDT/WdOeG9nh857MgZdw3gnvrE55PZHhjKYZgWBONBTwvlfWCyxdFQ+3KkurssXKZdHLoBOaO/hU1DzxmeUrmcxCEl2dFvcLNpXixkiPcsylkq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790739587; c=relaxed/simple;
	bh=GdeZEzx5GKh9ZY0H/ycxz2NRMTcpeYqQQU7x3wrswlA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SPyRZo2CspEjI+9QMnLkPbZ1cjtWemSmZ1zaoU68j9OuTwNi9DGRdShITNiG/budpvklOhkXM8coO+jJONwG/we1Z+Zgmqa0ls2/dGGDU91K5wv6zg1R0X79l4UnjTF4Uhma9xvUvIFYGKGY+8ji2K5sCkL84mobX7/lb/T2lbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JS9mc7sR; arc=none smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JS9mc7sR"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-34cde269e1bso77197eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 20:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790739584; x=1791344384; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ia9CbVKKwRCU5GzXWGPkLwk9XTdQTUAtoP5YeQIZPys=;
        b=JS9mc7sRfqJC3ziAg6EQXugbPKZVKdueuT8W4aUSgx7VNUNlc9Zsjfzik6D78Y6ylK
         SNO1qXgeYlkiE1HONapM6GuzDy8JvGbg3TEl15cR6bkqTKMUHxGGNW7f8K9eZoGNw05e
         yVZZi9EjJaM7LOUMITfuDxZFA30LZOw0cgdPttFX2VxOypqGj66do0AiFSpXdKP755pZ
         ENiHQtNJRN2PZQKjjDLVK09/ZkkViZRhqMmreeHzCBd18qR8j0sM4VcmqgbpJCizMOOM
         vuuc44fOTNPsvZ6008OsNgt4/NBjX4zXhN9Wiejc4ACk2unrkGIN7sHZ2vjJ/Faw+lsO
         sVoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790739584; x=1791344384;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ia9CbVKKwRCU5GzXWGPkLwk9XTdQTUAtoP5YeQIZPys=;
        b=MWjWhL0Pbu6tiPKWJ+zDQkdz+z1BQV3Oj5ZKFkxHaH8TfI0LcUPYVVxNUZUn/mYp2j
         ge9S/QKtWnFZPvfivpTKmgMfoD6mGLJVPiFBSbyEgOvx7bJp/vk1FkghNjNs6lBJRMWX
         f40Vp3IrjkBUci8LyC2mFyZhB7okcW2PTn0hXUaJRJOKOg3+eJFB09qhW/0jvAOINf1k
         EZxLd7PuPM3PCJM6iSFO/yYAP6G+JrWE+u0pOjJmhb2QjXcSLMmNhwM9RuX9UFAbSF9N
         bLQN1FAKlbxqrxAuoK2Bp/9c4+ZTBCGHxFNMY4hBqEEfFXlK5vJfEWQXDCcqiUtW305y
         XNeg==
X-Forwarded-Encrypted: i=1; AKwUvBwLJWgqRUA5kpW+2IvPVe3CbTBxTbFksIOzF08eoTGOD0kA5VXUgldtjkR5uoxKWPuVX+xaFtMAwA1M6Rg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLqHmlr1TaaVTYRVrMSGIBO6F75uMdF9NYhUlC0DB6FuVJCs0jA
	SJilE1ymq82Bht4S2YJMFzsb6BqdN3Bg6hKK7HGDCMXF0xrB8Bx4Cl/+
X-Gm-Gg: AYBFou3H2HeFflmkhYNISvmDiA8CW1m+ezla50XxHZKo4EVqftBQSIIslaZcHAiqka4
	6s+S996m9GMCfZqBpW5oY8vihUBCvjaYBjUKaK07CG3Ss4PrLlnmNahO810rVsIVSjSadIf34V9
	WZPTdP6+GlvNYGF8x6H3gQCCAo8bNBqW2BhhWm+llaqWG7x6sffEYKqfMzmd74gLqL9qpB+uWR8
	vqSFXef68nVuTU0Z2nmzT+naJdeOtzuWskNV9En6mdtBp3ZD8AF7d1Fv4sJKHLrB+Fzi56bgieZ
	/Ipl0SrwDK8rEFHEnzgEGeLaS3roBgAq3XTbNqA91Rss5v/PI5JBMXu/q6C4TpODK4zV8whzgi1
	rfotVf+YyLREyx+dlmeYSLwXZ29KWau5W2HHd621tw1GIok2dsaO4wPR4AMSi86hN5KRD+4E3gj
	wlV6N1TXG1C5TkoMX9W/5cOgBuxEOHYjODPmS1DVoY6o8uD/bZtnHRJ8P9DJvGNUwhP1KreS/7l
	A0W+pg9aSZ2UfM4QP5djCwrkO5iBQRizqtufHJ8Tq9AeS35pf/OAbY0jpsDtj14zQCXKHetQKdQ
	RoWgNDLGnXupXNQl3Hu2/q/8IN+NyJy5o62SUVo16urrAvVuvvOmZ+zjmNI=
X-Received: by 2002:a05:693c:66c2:20b0:34c:7e54:65e6 with SMTP id 5a478bee46e88-34cd91735a2mr336022eec.5.1790739584070;
        Tue, 29 Sep 2026 20:39:44 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34cf22fc6cesm252806eec.2.2026.09.29.20.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 20:39:43 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Jan Kara <jack@suse.cz>
Cc: Hui Peng <benquike@gmail.com>,
	Christian Brauner <brauner@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] isofs: bound empty directory blocks in isofs_read_level3_size()
Date: Wed, 30 Sep 2026 11:39:40 +0800
Message-ID: <20260930033940.175021-1-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cm3n7vjwbdnafttuz5ftkzz5wdbalgews4dfs5zlwvkyuzotuq@jo2nhsplhstc>
References: <20260919222553.3792320-1-benquike@gmail.com> <20260923175215.1577791-1-matthias.goergens@gmail.com> <w3rnunloyshklgq4ocr4jsullzhaey6u7odstfoyhd4usbfppo@m33jyem5jgrf> <20260924151356.3287733-1-matthias.goergens@gmail.com> <20260925043804.2091174-1-matthias.goergens@gmail.com> <cmlro2xzle2aa7ebflvxhbcv74mea7p6qvxhin6egpdvyzyuxh@s45tpgxdal3n> <20260926083517.556576-1-matthias.goergens@gmail.com> <cm3n7vjwbdnafttuz5ftkzz5wdbalgews4dfs5zlwvkyuzotuq@jo2nhsplhstc>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Honza,

> Any reason why don't you do just "++i > 100" here and completely
> remove the empty_blocks variable?

Yes: i has one other use.  The "if (i == 1)" further down records
where the second section starts (i_next_section_block/offset).
Counting empty blocks in i would move i past 1 before the second
record is read when an empty block sits between the first two
records, so the next-section link stays 0 and isofs_get_blocks()
reads past the first extent into whatever follows it on disk.  I
tried your variant on a two-section image with one empty block
between the records: v1 reads the file correctly, the variant returns
different bytes.

I'm happy to send a v2 that adds a comment saying why the count stays
out of i, if you'd like one.

Thanks,
Matthias
