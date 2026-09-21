Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 201DA4399F2
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 20:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790022212; cv=none; b=L/OlGNDYoFHsC1gJX6IqHHUZwIDi0UfF8MsLUTq5QM1Qmmh/485j92i5W2pbt/x+ekexmni4jB3PCIb9wBR7MZAi+vLpApmeZlftXGPdZNhmJ9gP6t5B31ChKH3ppbexLedsjXH8iBojl8DJ7QwrmIOoDHjU+tFuxRsbwRqlCSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790022212; c=relaxed/simple;
	bh=EWFjhR70sUh9e9+q8ODcTTuiem6jaj3lVoM1+3zRHh0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FHLWVp3tyZd1j6u0sfC/lssx2BwZGYv8XtlbOGx53aYUWcDwV+tV9DL4nAtSFedSvLfMlY9Xk+ckpBnlEOtU8Yk8J10SqrjOxd+r/SHc+4IsqVMBOVFMbcl45uruQuFLY1h+Ok+XG+m/dr1H9UaddgCgkvKv24M+zmvAoztX51c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yr4m9i2G; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yr4m9i2G"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b91369d18so25938555e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 13:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790022209; x=1790627009; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0eYYXGP5rZFEK5S+wMF41+nX6QKGcDrAc1SnHcB5lOQ=;
        b=Yr4m9i2GrNYzeBQ+hKhu8QtxaEzbQgB1nwNt6EcO/Qg+mkb/c3/YwL91emAfVNTZ29
         QGc74R8xKWY7k6wUdtuhvnejfI7PlQT6CpA2rbmmeR5pfeGKmDpgWYjqaN3cm4pTivE/
         Wl+iKtS3VIrXLqY/CncIiC1jFvopx1+rZVKTaSLGutsr4UdkbOjEaRDhrDjxHRXVx53f
         TpeOFAl7HX0ScMnvZ40fwSHxJ8c6t9AfNByEKdjgESNJKXgmv7MDdIxS8ssGWMUGycQu
         nh475ERGcxeprLORlBDM4B3CAqa1PWgib6LP5xSa59WCWx6Lr3Ngau7gpG6lkcxefun9
         x4+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790022209; x=1790627009;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0eYYXGP5rZFEK5S+wMF41+nX6QKGcDrAc1SnHcB5lOQ=;
        b=FlKTff4ZZz4BF8EIRMEyp1QFB3WjkeFIWsGTyaM766ujfE3dSwlG2k7Z/RpO8VK6r0
         Lhr2yWLfMKMn8wODcP0PgmCwLwH3xsfvvzgpfyHhUTKmOt1rKl2/lymwpgh72nc1sOmJ
         jDUp0tNcXnxnFAtIyuoPe+zHHWFwmfMNPAkvmhU0ub6VbNI8O5O2CP50G2usjs65wyeV
         pr+9L1C9Gqn26fdvJBCEUGKB6eAEcDXJ0ANP6FluUqgseEesiBhZqPJwA2H3nYsYBsBx
         jIOF86g+56/Q+oXIwW+uQGM1Ep6DG1CArXnVEYfiT+aMA03Y9YqO6oMcn6037pyRhTaK
         hxNQ==
X-Gm-Message-State: AFuF++llqfTuUj6zaRS0zC3vNQfH02wJj+i8n0PYJq4UViKnJGl7VvZs
	VgL/Lo1GRUwWIXWDMaPhmufUKl8QYuBvHikrthxGwOl4MJ7pf13VO2kX
X-Gm-Gg: AYBFou21E29b6VCCcYU+NkJY2u/HX95YIVkIhs8eTRhGFLEtNYLQRoCzGRm0UjC+zpG
	kwzYSUbI8FnFrcp9I7+3YCVLn2DqP6Cm/c5QNz8nOC5d3n5WzDlC9T2C3YDA2BtvHIlr+zvbB9/
	Wurjq5G3a9Tq4ddL55Ndwn7lbJYiKqufOsowT3LqJt9BHmoGs470OQiAneSDS9Z4bXCRWao1cGQ
	qh8+Lm3XZBneJlSoLHHv/rim2oBm1Mg61dbxqUErDIGP2IcSuvadFZHehOGPrX4T14TxjLBkGwD
	EVJ47nh/Pdy+HqnDQu2/aYqYMuuFvNqobghIFaoJV2xHatnbGqFuS68ud0NC23hD9k5PXmwbzET
	K8o4dROBkFECoH99SOWcnbkO9hQzfwTj8ygKPdsVBTyhBtidtEzX43PChcnxMkosYcCGSvOFWSK
	VHg8OKyDbsfAx9SF4nUtRLuo6VN9CmUaze17Jm+XDwlGrjodBro70AZ/JYAIwNCPPdJXfHHWbki
	5CVDXObT87+GGuwfmGjwRAQspG0yBMHo3OzxT0auK2dnYiIp3er2cU=
X-Received: by 2002:a05:600c:354e:b0:49c:fc6e:a3d8 with SMTP id 5b1f17b1804b1-49fc584f854mr163229655e9.23.1790022209026;
        Mon, 21 Sep 2026 13:23:29 -0700 (PDT)
Received: from andreayoga.wind3.hub ([31.189.116.68])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fd8cd5214sm17778875e9.9.2026.09.21.13.23.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 13:23:28 -0700 (PDT)
From: Andrea Parri <parri.andrea@gmail.com>
To: Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G . Piccoli" <gpiccoli@igalia.com>,
	Anton Vorontsov <anton.vorontsov@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Colin Cross <ccross@android.com>,
	John Stultz <john.stultz@linaro.org>
Cc: linux-kernel@vger.kernel.org,
	Andrea Parri <parri.andrea@gmail.com>
Subject: [PATCH 0/2] pstore: fix two ramoops error-path bugs
Date: Mon, 21 Sep 2026 22:23:14 +0200
Message-ID: <20260921202317.70595-1-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two bugs in the ramoops error paths, found by review and confirmed with
test-only reproducers against an unfixed kernel:

 - ramoops_init_prz() stores persistent_ram_new()'s ERR_PTR in the zone
   pointer and returns without clearing it; the probe error path then
   passes it to persistent_ram_free(), which dereferences it and oopses.

 - persistent_ram_buffer_map() computes buffer_size = size -
   sizeof(struct persistent_ram_buffer) with no lower bound, so a zone no
   larger than the header underflows buffer_size to a huge value and
   defeats the bounds checks in the write paths.

The second patch adds a new failure return from persistent_ram_new() for
undersized zones, which is exactly the error path that exposes the first
bug: a tiny zone now leaves an ERR_PTR behind on cleanup.  Applied
without the first patch, it turns the memory-corruption bug into a
probe-time panic on the same input, so the ERR_PTR fix is sent first.

Andrea Parri (2):
  pstore: don't leave an ERR_PTR in the ramoops zone pointer
  pstore: reject persistent RAM zones too small for the buffer header

 fs/pstore/ram.c      | 1 +
 fs/pstore/ram_core.c | 6 ++++++
 2 files changed, 7 insertions(+)

-- 
2.53.0

