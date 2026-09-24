Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB3A3C3F5C
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 04:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790224322; cv=none; b=HxUqszuV9urb86SwkbdoPpOel0u5TEnV7iE9d9HueKoduFVG2fV4PmJ0MpZTee3jIKqadAJcmujBjL49l3ie1i2phuLneaEGpGaQ6V/5rhoOIrl7gEwsu6THtIRNwt8DfO1vBdLXcn+R/24UpHrckMgRnptO5sj1rTeOAZe8tOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790224322; c=relaxed/simple;
	bh=3JAG6Ij9c36PXq4bgsIh1K7CQfbf0z/ay7gB5qrwte4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NXkRg4nLCEzuuLIbonPqfi78zkeMJjqYix0C7se+jH/MvIa8Y3GlfYSHVGFxAzDly3DFmor0ylnM0DHPe6T8AsB/tbTXbNkuwdx0ueS8M/enFHO0TnUw7e3EVkaJ6WwDWpibHbgkxOiRqzgkE5bHgm+kYrkjzGWZgacpGksfbuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qn9nur6F; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qn9nur6F"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccdaea75so689059a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 21:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790224320; x=1790829120; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3JAG6Ij9c36PXq4bgsIh1K7CQfbf0z/ay7gB5qrwte4=;
        b=Qn9nur6F8AFN2P6ahcZ/4fYYZtVG77XTje1XnUUKFFtj5e3DzByEgv3B5GptoLuQYI
         4GPvf3Wq9LPdNcO2k7l/aeJ2egnX0zbfHvRtjXEd2Y9v48vEyhI4+vljychf6VOTMoMX
         /g9CGDmARwzCMN/2eaMdYaORMN/9N/ddcSlL1QamxGsuwGQRD4WfNHPMz+IIZGl5yRE2
         HM8Rtc23z+QJ8ztjCbo2GooCA5lNwLOixfSP8RzppHaSWFLJ45qAIRJDRupn/g+9h3HI
         GX3PqacrdgpkvUFO0LWIx3GwvxhFlbkfLVn6j5VL8aFUGZUaH6en/XeF1UGl/hLIKCsy
         954Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790224320; x=1790829120;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3JAG6Ij9c36PXq4bgsIh1K7CQfbf0z/ay7gB5qrwte4=;
        b=G2khlcuRtpEZASdaLk1LsWSk7m0Asbuqki1gsBbLhdq5+mopCo80O+tUHh/boaf9tg
         MKD4n/g8pwzMa+53uNvHdUW4zOUTAa6JKce6zk+BuHyLWWk6lzFxH1GA6kfxoyrCl7BB
         ehY7fVuJR94+2dN1V/32Y+l6OnB0nMESeXJqLDAOemjvY8/szvwWfLjGK/a6dpMflJcK
         gtMRU/5gzjY7pDLJ0g5svbYLm4cTTolPUwcIRT8r9NI7yBnOw1++LX6vmJ1h8EiHbx3A
         I60vo9+Mz0SBj4+HE3dwur5fSUYGoO80HpH2IsoEzJbBPnLH+fGLSzKvPzyHWUunvR8M
         aMGg==
X-Forwarded-Encrypted: i=1; AKwUvBwMLq8U9FwLs3gmTCjbxtokWdQbI/Ni5lTyJ87ScxdWZhYwwjkejQsqX9BlPN//X1vu34rxUuh75PMIOeA=@vger.kernel.org
X-Gm-Message-State: AFuF++kX/jhaCyx469r02mO5Z8DJU5HYmxkWFQYTKFUQrOyM15VcWUDD
	q5VNMgpwmE66Fqucj+KgY+0AAJ8G85zkx5rXaqdBAIMQ7Ew7ogIuyOr/
X-Gm-Gg: AYBFou0bXdsOByuinwCMsNvHEFBkjGyRyEwS9mJNAsTYtVEwkcgaUk4bGGwsXV2Q0FU
	W3rVkal7dU8BqycP7dtkr+yBfBovfjzoL3TyKE1zUNyF5RIzuHZPT0lg/wBLFpWLuddxiDrslqU
	I4uayxh6fDGLgPR8PIU/KzrQ8pd5UOkSrnaD/MtrqS3MwlYuqzlYp9+xDDynLWRSjS3ClNP05Zi
	X9Jnxpu3cJ+dVjk0ZjQGDVMp6SwpTLU4qR5fjUFsb5oheIiNDrKBsOxkwcuntePMjtOIy7+6q0o
	7yZdcX6yy7phTOYHYb7L5PIAdkrxB2Z9sN3UnW0MCfNEjcHnTvmF7yTCN1HGV8iDcUQjdZbAKrB
	ssp17tXM3JrgaAT0Zgm5855mW2qGDsBqcpfGxofqSyC4kzfNg9hiYac/BiCtJvCSIY4TtfDpSO3
	WtV/5ArWN+bgFjq/gM5uowX9UJ9AQ4Cj+VICYPGXJs5exfnjikZPV9gDqH0lPDcqnE2On3aThd5
	1fsqpoi1wBpDONAWad8b7Uq8f9jCeO2gJxIVsuzKuUhUixMpEN1+uo+0TRFPaNz1L3/HO3kn3bp
	7rcesMXVPLFAaYukJrvc0gGV5VV5m7SlKaOBvONfgU4CaT0S7VUk7w4w2vA=
X-Received: by 2002:a17:90a:f94f:b0:3a0:2614:2077 with SMTP id 98e67ed59e1d1-3a098b93d4bmr850160a91.41.1790224319843;
        Wed, 23 Sep 2026 21:31:59 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a092d9797bsm1496938a91.1.2026.09.23.21.31.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 21:31:59 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Hui Peng <benquike@gmail.com>
Cc: Damien Le Moal <dlemoal@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Jeff Layton <jlayton@kernel.org>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 6/6] qnx6: validate sb_blocksize before dividing in qnx6_mmi_fill_super()
Date: Thu, 24 Sep 2026 12:31:55 +0800
Message-ID: <20260924043155.3898135-1-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260921042511.1473629-6-benquike@gmail.com>
References: <20260919222556.3792829-1-benquike@gmail.com> <f68323da-e90f-46a4-b3ce-70d26de115e6@kernel.org> <20260921042511.1473629-1-benquike@gmail.com> <20260921042511.1473629-6-benquike@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tested as described in my reply to 1/6.

Tested-by: Matthias Goergens <matthias.goergens@gmail.com>
Reviewed-by: Matthias Goergens <matthias.goergens@gmail.com>
