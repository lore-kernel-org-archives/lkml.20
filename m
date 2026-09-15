Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B17733ADB0
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789437329; cv=none; b=AiZRQ5121JbQGbByariPZhCN/NI9/3PbLDttXuUDuVEHnnrdtxqcudGV0TpIaBf+FlB39hT7Sf8eVLqZSAdXgTt1mZZ068GtpdetkKZE1hEzAMn19k/wZ5+4i20U1XsGHDV2j4WB2i4BEssB+N0YDXShmsoEvCAJJDC+Er4mgLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789437329; c=relaxed/simple;
	bh=SImV7x1CZ+YZSzFzbNMVur6qt+AKDbf3BSRwa4So7GE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o12fvZRFN4JbcWDaR4sdypm8cRjOYOsy9S0so2uR5DtdPg7hlhvQ+cE9EgGT2ePTr5hYIxIjL+RNauC6w/RI7elno4JJctfKJfoWisEnJiAjvKzhbsZWSyFBUlL4FE94kogtgVuAKfUsTIbSV1AQcD6zEH5uNG9+EjwHv/hr4ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mjG6Q6xC; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mjG6Q6xC"
Received: by mail-qk2-f13.google.com with SMTP id d75a77b69052e-530fa0716f6so25375371cf.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 18:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789437327; x=1790042127; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lmGs6Nrhth/r9kEqCYRE9v0bMT5Om7otMfWFzjHwusM=;
        b=mjG6Q6xCqRM01+Sg+fTkfEosJOcFy9PnJeAgc8qDDSMD3DymXNwMRpoladNNp96rpE
         M11a3RUtaavWcxOkGiW23NNcMXHsOFPH8PnVgzdKoJIyTcNoBaPkIu2a7gSEt5mS1ws6
         LHboJEZPMb/DFJ938RvK0GOdPwyx+RPXDpDJneOr/SgOiDj6WFwvWH15uSubn1RCTms9
         FzG3q7ACWyFyfInNponwBv5MhvK0o9jW8q9pQpU96x5i5GnNa0c4KI/OlRJz036VHwHZ
         EUAE5wXKoU7q+RunZWKvhqBFtuEWa/pFP+9NzoA1vLY0zhzkgWP4VVAK6BVBQrhtDlwO
         1Abg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789437327; x=1790042127;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lmGs6Nrhth/r9kEqCYRE9v0bMT5Om7otMfWFzjHwusM=;
        b=2Lk5ZZEMv22/OYNHLxiw7sT4Ky5yBESCM0HS3X6P44/IthgQ+uS9nd51BuXa9+yI2u
         8ok3louojqxGxPptwe5picGEBaunbccK1tATGP7NRD1nbQQXcNrZ30VWUUB2qLwQQ0s3
         N1q+o2tNAwID9kYwhixI9+fheABgmyxRc4DJB6CPWX59XpH5oMne0iXIo9GUDtlFcoAH
         qb5CH1XS9RgaAw9Q0FTfDX0m2odGGzOf7DGru7x+hXRS3wlE/P5rsKZ3RFu6WCnWj3vn
         8lmc8hVoyDlCNB6LAIsdtmA8v16j+OSscflEgiYQi6uLfUgWLwOdT4cgXguwmgbS8O14
         mQ8w==
X-Forwarded-Encrypted: i=1; AKwUvBwF0MsHsaXOqpUlrkw8Drx96JqVeFaWq7vzNedDhAIivB+5KfZPFZ7oH2Y/NISLISjKI9mTwoXSwsRew+w=@vger.kernel.org
X-Gm-Message-State: AFuF++lBCDkCdkD4hXZjtKClqaQDm7v0r/CipOiZaTwPRYu6au67H+Lf
	wlqmPi1b45V8VBZeQfrvAJUoZNQbsNdQB0TZlJXqV5eGq2RcGS/mju8=
X-Gm-Gg: AYBFou1+AJN/ofXHzES7atx+lZ5gS6LHOPv1rENWRXcM41KKyRb50SbVy4SKj1hm6rR
	eBK2ckhPLlhTz7USa15V7XiksjhE7JNtbOhetJyA11UxwoSTt2VnUMYI7P9k21rqvp9knsIsBMU
	p9g79HRzOB41Ex5d51/7ZdI9mGvhcV1jNQ3FRjAbs+keOJNLWJW+FyEHlWtT61QGOkEk+zlbOyU
	Tu2JCIXhGVTYccPHEiqt2plkOrqzZYCe0+6WfSM+2Z+/vTAgmFuIol09cTUnlp20bXo8Zmb0puD
	2SG651yTBTzOHVBTxmuIBkzzjtk4MiMFCgB2uWa5ErDboAzRx7krmCRjYZ/v6TSCKzeb+Q354Z7
	rkf1hSX6myaQ7+6vkH+ojwS/Qj75Aa41j30FbWif4l+HeLWyZmAsVs2mZ7cZJ3b3aBf4qXcUMnj
	22WhFszn8XU9kMPdycVfhAl3z2pj+/tNRCHV68MorR5TsR0yPuPbca/Czs9mU8Ukurk0n0Y/aF0
	kO01tjqwZLxd+WYK3T3MlsYztK8iSFMLYO8+OARHXgact9dTvF3q5MAFog8VEfwTe4MG+4Qtsml
	9vI2ZxeNuyzWf57/aJjnkG/cjtubFFaHoXarPmf/YvRjVXXlA2Crax21t5YcJC4F2BBF44P9ta2
	Pzie3
X-Received: by 2002:a05:622a:1194:b0:530:62bc:e11d with SMTP id d75a77b69052e-5310cf152d5mr76349151cf.4.1789437326963;
        Mon, 14 Sep 2026 18:55:26 -0700 (PDT)
Received: from 6e-wmo5420-02.ad.psu.edu.net (6e-wmo5420-02.ad.psu.edu. [104.39.213.233])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f5ebc79sm109264546d6.48.2026.09.14.18.55.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 14 Sep 2026 18:55:25 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>
Cc: linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 0/3] EDAC: Balance PCI device enablement in three Intel drivers
Date: Mon, 14 Sep 2026 21:55:16 -0400
Message-ID: <20260915015519.83833-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These drivers leave PCI enable references held on probe failure or removal.

Use managed PCI enablement for e752x. Keep explicit cleanup for i3000
and x38 because their module initialization can invoke probe outside
PCI driver binding. Each patch is independent.

These issues were identified during our ongoing static-analysis research
while reviewing kernel code.

Assisted-by: LLM

Myeonghun Pak (3):
  EDAC/e752x: Use managed PCI device enablement
  EDAC/i3000: Balance PCI device enablement
  EDAC/x38: Balance PCI device enablement

 drivers/edac/e752x_edac.c | 2 +-
 drivers/edac/i3000_edac.c | 4 ++++
 drivers/edac/x38_edac.c   | 4 ++++
 3 files changed, 9 insertions(+), 1 deletion(-)
