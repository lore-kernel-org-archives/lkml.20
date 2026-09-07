Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A400513542
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 17:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788800461; cv=none; b=l8HyOWOcihJc6OH8ZGNLNTeuzWUe+KSpPIMScaxl8klg6OqflV1iOOQq14Bq4AZx8HgM022sBy5vFXejPuV76pQLas1YN5R99nOTPJcRSqmS2iPUNlYXj8bt8VVIag1wM46+DHo8xsV/5pqfsZKG/MctzMOsLMaXZhrprJdaYl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788800461; c=relaxed/simple;
	bh=b9wNFsVYc4DD9fP/QpAUbtXDUtyBSUYWk5c82ne4oBY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BbTW5jz0KzGQwkCubqlKJq/h24Yjb1wDyPkkpsxPE5o1UShbVU2BH3YIu9gaTqx5USqNNKJuwy8dn6AMd2JhbPVwUIzfqFFX46ikE+AoCE4IylpVrbMbQ61QPHam8Ig9ZUYtdYlV8zeOj3traU20YMa7Y2dOvVTsepd9O0oOqhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UwvlIAt2; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UwvlIAt2"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843af75de5so318980f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 10:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788800458; x=1789405258; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b9wNFsVYc4DD9fP/QpAUbtXDUtyBSUYWk5c82ne4oBY=;
        b=UwvlIAt2raJo0Oizqa3H8KpKv67cL1qNwF5y68FJowcTB80uZLn58emObQqjvuwUNt
         7sfUxhozDleG8Io7RLvN0CEYFeTBpblx0ll4EiNlFkGRYy9Z6vZE7Lrt+Dj+INo5U3cx
         zSyPFcGqeFH+FNTau8cdoTR79UsG/LIBZ68w9XcYhV9fGLRO/LSOJ1NaCBcN8Sj/zVq7
         6vu0V2SWL0coQoshhQGZ6qSWs28ePlvEEBbbpGcLK7nHg80H+sdHAtcF5kXHIO+sJDKy
         QDX5I+2nKufXphd94RwLdUDTT+ChrEQIqYoNJUSKBAm3nc1jbdySYlYKm+QC+DuuQjpT
         4Hcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788800458; x=1789405258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=b9wNFsVYc4DD9fP/QpAUbtXDUtyBSUYWk5c82ne4oBY=;
        b=XzmDKeCYl8OfTZTVzd5ZxaLVBcUpyAK+/kxQBlVt12X1DlkN975E+wi7TBlNo+sqjw
         kRdF531F51vxRJW6u9SOQe99+821W9ftLhM2DcQQ2gl+UyNS2S6nax604CZbn2IAjO1I
         tqf2EFvSQ0yiGhZQFP13zldAiz922hNEpcspg+RHAy2r0DasHc8aV5p7dgRYHkQsFxW7
         UrGvqw7MwHTdBqE1eifgxAjnU4xB8QEtwnlLENkVqg/X3TO/vrOxhmPJuiBR/ab1Eg1z
         JbYhdk1JsaFaBcnPxMDTY3DV4qcF8sW9HGRSjA7eBWq0ICmJJpW94niyrFceWmsTKkSs
         kdWw==
X-Forwarded-Encrypted: i=1; AKwUvBznmyhax8FsXqXz0Lz5imwYEcgvxJ/LM+3OTfDaqvRfFPHPEx0dIMCZ0tQuqges8w++OBEGHIsdYF4zCgU=@vger.kernel.org
X-Gm-Message-State: AFuF++m6phOd9iE6qgh2ARKAiiWpopWQALb7Cu4eqM+mxMzWh4P55Jkv
	Ha7TkFgOw0CnWq/j+wu8GrjccDSFi7Wk1ImTk/iJC5/wZ5L5QkOTcIxm
X-Gm-Gg: AYBFou19950vSav75/CBfu1gPc9G6tmrxucf6akjc6tm+eowAwgONinpQkKx6TD4erT
	2UGEzWZbMQ6fW1zLw52j7czIFHFAdhChjn+Vv2xb/h70pQGyxjYiSUOuvu+M+uXGQiOgslhWLg+
	Roc34XSewg0s0m4l3Wsb6X/Ht+c8P6xmmBDEnd2TmP5Qqb1YAe5GYVdIkxHbj8efDUFTr1pWkbl
	Xg4+tGQNY6u1f2N0cKMZSUIIb0AOXD6Qeb98krCnmrv7iiokbKjGS7RgJt+tQk3S4uBitSCslEk
	svMfjzwQgNxF3YwKkJkCqKrmhgP8dZBSA+NjkxUATGiodr+SUbJNRMDr1x1D19w7uTcw+BRilex
	uls6TP9A9UrlLjw2nog4dhyyYF0R3l6jczs5J4fmbclM9pMSwv3r4fdy1GLdr+K2MMKoZBLxAB4
	ShUY3zmLB5DxPzfMKQjEVg/3PRwnf3eZQ2pjPbprPAej5CUFtp0xxnklzKW5mF4NsdsUQLLy6HM
	Psc3etxqCneqYgvfqtk2NGJQpgQeRT6X2tRjU7LIpSOyK6UmSlJBsKkydsH43ZkO0cvWQ==
X-Received: by 2002:a05:6000:144e:b0:485:8ad5:dbbb with SMTP id ffacd0b85a97d-485907f1861mr15214169f8f.4.1788800458183;
        Mon, 07 Sep 2026 10:00:58 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B8822007B3AD9A87B9E27CB.dsl.pool.telekom.hu. [2001:4c4e:1b88:2200:7b3a:d9a8:7b9e:27cb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48588394fa1sm28566070f8f.8.2026.09.07.10.00.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 10:00:57 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Amin Gattout <amin.gattout@gmail.com>
Cc: Igor Paunovic <royalnet026@gmail.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	kernel@collabora.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: synopsys: hdmirx: Remove redundant dev_err_probe()
Date: Mon,  7 Sep 2026 19:00:26 +0200
Message-ID: <20260907160000.hdmirx-amin-rb-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260907-snps_hdmirx-v1-1-760dccc4664c@gmail.com>
References: <20260907-snps_hdmirx-v1-1-760dccc4664c@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Amin,

Checked against 7.2-rc7: devm_request_threaded_irq() goes through
devm_request_result(), which already does
dev_err_probe(dev, rc, "request_irq(%u) ...") on failure, so the message
in the driver was a duplicate.

Reviewed-by: Igor Paunovic <royalnet026@gmail.com>

For Dmitry: this does not overlap with my pending hdmirx audio series
(v4, [1]); the hunks are far enough apart that either can go in first.

[1] https://lore.kernel.org/all/20260721064115.64809-1-royalnet026@gmail.com/

Thanks,
Igor
