Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793037605;
	b=pNQtuu5RldzyM3dwuk4eFwXWoYsggIyk5cz8PUQSTg4QAEuFyucKae781pJlyoK8YVMG
	 AeM/lhk/VrWGZcN90fcH4sWiJxx1WIoUJO63/eEFUF+KHCOWHYE6VlmPSioQV4lT/EDjR
	 6adI+gej5jQvFO1/bzOkFiW6ryaIEu3NKJX8sDcZO0Tof7YCUlFMENizgcZuajFDy4qno
	 nBrD3GmdH+cLC5ODyAsqI3RCH3aWTw+k9I8QCQ73IxgPxgB5w9mvvx/zLUDgVRwsiAZnK
	 +rTYvTrzwQwj6zOCpUNcLB+xdI93Zvs01HThYGnmQyQOWC648ezaz5dsdlwMyiIzobw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793037605;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1qBZmfgPT2INlHLC5uDOw8q+VbmsUhEO4KbGb0W1nwg=;
	b=2LXwxgN++n6Si8xcgpKZsPzyS1Jl5fzkYdxVwdvmLwesP4l0uDnG96XLotRTY3nDi/O7
	 xNIcB7deBKtORBnvs/FPSWFf8tm2uB6A/4KoHHSJcm23dwMVpApzkdFMXBFl/2JMLGT4y
	 SO6vkVptNEIn7yOlrD0QCf8e7iermTgddgQNJ+CzUCbn35cpuhMrWL4a+YcnflkxWPyuH
	 fTt3c9WXixn8psM5RyoTyJ/N1hUG2oQ978uqsfYPLaIHMvr61HQ6rNteDGVWmnL+WD4gb
	 cQ/uisCg0y2Sr8dDJmrrDga0x+7odUNlHs2Xm+ogRXsy8crT4R+xWraJ2P9KwVbPWSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dPPS+dZq;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD8E6606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 18:00:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD8E6606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dPPS+dZq
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1846bc43c28so3501365c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793037604; x=1793642404; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1qBZmfgPT2INlHLC5uDOw8q+VbmsUhEO4KbGb0W1nwg=;
        b=dPPS+dZqwhyPLHZWlZAorfsrTLZwzWKWt3+xwo3MQXeYeKsgJJ/EVgowNxbQsW9FtC
         8osT6J8dQ1zQZqCPweC/R6WQmBfim2AnVTN6y3ZYuOm860crIodUKEFGhPUQNEckvP7k
         RjRg6OQsHAXi4FWt4fnWiP71C27NvlIyK+NEQ9Hml8u79OXEJGiykKwATXY/r/my7Alb
         dc/GhEXXwCAFcSX30mx1ALCFQ1DOZdSEqb6cKTuJ6/4LghOpbkPVwO5KVi4ug44ScMkZ
         tpFtJidALnIZ62K1q2X+d7mBxE+OQTZ35j2ks2Ms9gPkFwDt3YjA9MXEfHGDOaCDmh+u
         f9Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793037604; x=1793642404;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1qBZmfgPT2INlHLC5uDOw8q+VbmsUhEO4KbGb0W1nwg=;
        b=m8EKtKwd6Ez6ImJWlD2RUhGj/S6+2lLv9xZpkYPqefxihpFJ+MP1D2tMgVTFBRYfuf
         b8pOsQOOb8ceYfj5xlplY92vjvc3QZ1IGTSONyfnirgDvgs4TNrO10ENLWeC2yrwdw6R
         hcGONW8wvqFV3iq9Vh+d3vfWfgaU/pS8ukBOtikz2KQ1m5Xb3YgVtGOGWIE1DQWYY1Xo
         C2KJRnrIOOAwSnTW6HrSSN6g/RitvxTJIuoVgE61SVYB8LGGt+8UQsZL1rX6t5SukLcp
         nRSG20EPHumcm+ZB91NpGYCpUv+TUFRrFI5yes+g7N4KUPPojE7/DT7r3bNPjKt+ajkf
         GoHQ==
X-Forwarded-Encrypted: i=1; AKwUvBzvDKqGGe6sg8ZNNmLjvYEEv02lxbPCUucQ2u1/o7USAA96KZSf1gwR0h7dbUxW33ZaiSwq4/g8s7soJyU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLK7KxbYXyRCAAuecZePjA6qcQCNy+h2V4Bf4ip133KP5slK/1d
	1bHBLbFmx+kbd8ZH1LPzejhUWmO5h1/BW2trob2IXRQzekN8NByJuWqS
X-Gm-Gg: AYBFou38fhYtoXnZztowZXY7Dv40YaY3yHs8uVVeqaC7PY5808+D0F26P75DWFBy2wC
	RAOZouy3CGTlMG6uVhcf5IHGDvbVPqLQxbFN8MnC3K7GhruV4Ueci+aUF62AEsljkZhaVbgEHxq
	/m/HeKM+GKpxCU9/ijxOGSZqhxCxJmx5U2QPLSjnnz/qLBy9A+qWASE9PaDfuSkOEW6MnJB0Tfn
	wu+I9lcyNLYFUIkqMd9W2Vc8PquUzbJgwbRMkx8bIbTID7MxH1v5Mzef3w5so2Y1r7Bjz+e5PWF
	G9ouq/KKdEDzkdVCzySFDpaKW8J/CIPr6T/NlMKfoGSDGwLQ6nLaVpNAdSeiVkAVywOjDqMa/In
	fx5fTn+sykfQMVyC6QbKapq7/w+/4AulzN6Ztk7w09Oj4q2m9O3M8dufp1CBWafdvy0/HKdv6OB
	wDMEiZgOUvqObJyEKUlkntX2DunurXKESyNgEdEvpMmPGZhSokn2UFvq/bRrdAntwZUrb8IaTct
	M0Iq638JaC+APKCXOxqvMatykaXEs3EaCnOaHZk3Q1lPDM5DyEAuGI=
X-Received: by 2002:a05:701b:4582:10b0:14a:a6dc:9ca6 with SMTP id a92af1059eb24-199292eec43mr10712176c88.3.1793037603609;
        Mon, 26 Oct 2026 11:00:03 -0700 (PDT)
Received: from localhost ([103.204.210.88])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19894d59f90sm25310060c88.3.2026.10.26.10.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 11:00:03 -0700 (PDT)
From: Abdullah Mohammd Sifat <sifat.yt.2.0c@gmail.com>
To: dan.carpenter@linaro.org,
	hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Abdullah Mohammd Sifat <sifat.yt.2.0c@gmail.com>
Subject: [PATCH] media: atomisp: Fix memory leak in atomisp_alloc_dis_coef_buf
Date: Mon, 26 Oct 2026 17:58:39 +0000
Message-ID: <20261026175840.13979-1-sifat.yt.2.0c@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Free the allocated dvs2_coeff memory if ia_css_dvs2_statistics_allocate

fails to prevent a memory leak in the error path.

Signed-off-by: Abdullah Mohammd Sifat <sifat.yt.2.0c@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_compat_css20.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index eacd7ee5c050..48196a358ad9 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -1373,8 +1373,12 @@ int atomisp_alloc_dis_coef_buf(struct atomisp_sub_device *asd)
 	/* DIS projections. */
 	asd->params.dis_proj_data_valid = false;
 	asd->params.dvs_stat = ia_css_dvs2_statistics_allocate(dvs_grid);
-	if (!asd->params.dvs_stat)
+	if (!asd->params.dvs_stat) {
+		ia_css_dvs2_coefficients_free(asd->params.css_param.dvs2_coeff);
+		asd->params.css_param.dvs2_coeff = NULL;
 		return -ENOMEM;
+	}
+
 
 	asd->params.dvs_hor_proj_bytes =
 	    dvs_grid->aligned_height * dvs_grid->aligned_width *
-- 
2.53.0

