Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89AE117D6
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 03:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789702245; cv=none; b=QTWhF63HlZGqt81rpDJf+iMQIkOQ96gfWv/TohjlWIl47T/3S2XoLYrSLXHIBBZYiEGau30WruCHD5DajTJI5IIYIjB5h1ORWclH0tWJq37dj0B9DXhiBTVg4wIogfiDAzbVlPEXY7CupkK30VU4Sp5UzPuQvCkrsENWsG28W1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789702245; c=relaxed/simple;
	bh=Xp96osNKNV73rMrH2Cx3GnQRPM4ktS3CCX6WmIYhStg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o6r3AkpacvzudZWq1Y5B97V3U8oKxVuMP+plWsk6ILmXAUFrIuFsKJAVBsb48yk6129jvnXvGin/943c6c78JJhaALjdJwh4qGNDZ28PfF10vNUeNPPgdVc5CWvzdbauDQ4finFETFjMHbblIscJNEmxo0Nf+QanqFedXY1kAwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VXeOBp0N; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VXeOBp0N"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85469b355ffso170564b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 20:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789702244; x=1790307044; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xp96osNKNV73rMrH2Cx3GnQRPM4ktS3CCX6WmIYhStg=;
        b=VXeOBp0NGLL2JDTUR4QepzxPPIZkwP98ChfKFuUpHlWF4r17izghrAByMDL5p7McTM
         FxiSELWVP4jrS36Nk/SagEuhRpbXGIQK21kthjfe/WLOGWAWnr2nov1XBfG9j8LjOm1r
         QmoNiFQ69fIlCWW5z2HWsXG4WIEsZ82w0iLakbnoGVP9KMXdD6r630Ob1jKLVdJWBMEw
         I1Svpty9JIPLus6vHHxF7K85EJUIqV1uHtM5WaVfYCZ5ZQvdfBDZgEoiN3fTKAmXE4r0
         1FtxCa/iKqf5ui2SrHB9I4dGl1ZlhiryXS8peMZ/MzIP8cRvYmMJo6nKZQpqJJqWj6H5
         6L5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789702244; x=1790307044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xp96osNKNV73rMrH2Cx3GnQRPM4ktS3CCX6WmIYhStg=;
        b=FXrgVZxRPqiZy1+1cIVb1gcN8SwbuPAjmxHWWWYvcup1bg6BGT3xlgzU8T5WiQJzZ8
         vc1z2fEhPjrBdU8HCojSqhLbY4uTrd845XgImj981oeVolQBiRHporjg0DC7hJ51cMrG
         Gm/C2KJEjDfDxaPgJRpkrVkS0A/LszoElvJTGLxlsi9Jquix4ASXEEo2SnIx8p1QeZBq
         ttGAe3cajvxMsDs+rxGjb2lQvx2kUZs2lIkwBvyMAhLML0kiSsqDf1yOJr+OAMy2fnM2
         X86Z7Qub/zqb+CAYhj7AX/Crwjz5C9aX4IH0jiWIFrPG3mQUIa/ySiwtjCrS7pxrlcss
         aqqA==
X-Gm-Message-State: AFuF++kyWNDFeq2xk7wQXpaEQDwWrCGfvZVBuT8TGNuqnlTg8+rk8huQ
	KskCvemEqUmswFESssPC47B/O/dwGHOOs/hpEWf8scC3zFqIrZh6s9KC
X-Gm-Gg: AYBFou1WulPaT+IAxYg8C8xTTx+cNwqg3Z88C3kIs0dSEnAWVRiVAw3SnvuTrZXmP9C
	ITvX7kB0K9vOou4zkbHqHElnbB6zGHje2bb8KCMKde0t4NVgZlaZc6eYUszMQ3qrp3vOXTWv1xP
	b11D3vkk69fD7zLl8CFYyZ0EB2m5LUOfk0porCu/e0Ts3wyqBYYa3EDKocPEuFDr4ukOqmlQQSG
	fZoAWmji6CXaQ+e5BuhDpj6esrF/Bm6yKKCKL0ex8uk9uV2r2oux8CuB6U4rf590ZsrI6Dk6lVR
	sX/7zypVwJXZFce2asH1Se0D327ItHIOw1GWbVnEOZGW4qZETuAu2JCuaSWtsuUPDRpq3fPyXBX
	PDfkx6QZFd2T6xZuN5NC3ctpDGnCN4mwIb/c+TcvsKu9V5wCeTNbIXx/s2MulRfYP6bSP+UPWyE
	kVWRzdEdk7/SRLrPZaZGhi0YTL+5dpifQjdjqI3iuEmzZpKKTrKVWbYy5ohMtBYnXDk21dKX63G
	uE=
X-Received: by 2002:a05:6a21:7105:b0:3c4:3321:4fe9 with SMTP id adf61e73a8af0-3dd8c3d20d1mr2273049637.7.1789702243765;
        Thu, 17 Sep 2026 20:30:43 -0700 (PDT)
Received: from bloom.localdomain ([2604:3d09:178e:e100::c570])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc5bfbb4db4sm156353a12.8.2026.09.17.20.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 20:30:43 -0700 (PDT)
From: Ivy Lopez <skunkolee@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Ivy Lopez <skunkolee@gmail.com>
Subject: Re: [PATCH] USB: phy: remove unused phy-mv-usb.h header
Date: Thu, 17 Sep 2026 21:30:37 -0600
Message-ID: <20260918033037.22622-1-skunkolee@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260918024758.359928-1-enelsonmoore@gmail.com>
References: <20260918024758.359928-1-enelsonmoore@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reviewed-by: Ivy Lopez <skunkolee@gmail.com>


