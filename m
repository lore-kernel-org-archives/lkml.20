Received: from mail-pz2-f38.google.com (mail-pz2-f38.google.com [74.125.228.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 604273BAD88
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 19:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790538002; cv=none; b=ZClGVIOQKdVD2aS1+ksJkr8VKtWoem1cAuQiJisru0eqHhXQ6udGvT7A5KnAHUh5aKCA2LMRCxdOSDDNREANT4FMlC/0KSL4CL+d14KvWgN2rny62Q78KfBwaOVKHcEp3Ni9epBJkw5pfucvO02PXeYt28rrVdDwZFFIJJ2w+SI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790538002; c=relaxed/simple;
	bh=Xp96osNKNV73rMrH2Cx3GnQRPM4ktS3CCX6WmIYhStg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dU0wuBWpODC5th1N6SWKSqJ3rrig3EVSGEmEqZDGRbsObFRfW06XC6s7PHO8YRo0c5sYJ/bdJ7Qfk+5LiDyZWoYXkGLZRDgg1rgvnhThkFosug0B+iFqgldweIoEYu5YAQeat2oxQdrqJHOznJJPw/QIdX4ENE1pVb6mu1T3Gug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V/gsvUH6; arc=none smtp.client-ip=74.125.228.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V/gsvUH6"
Received: by mail-pz2-f38.google.com with SMTP id 41be03b00d2f7-cc79f8a6170so299637a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 12:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790538001; x=1791142801; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xp96osNKNV73rMrH2Cx3GnQRPM4ktS3CCX6WmIYhStg=;
        b=V/gsvUH65f4/MTfHpEyxrxLt7CuC3Nn+xHKvmyHw5u0aKsv7siqAZsonHiNd9uIrld
         vn/6U5u2EcikMRGHOivMrfq9/Vj6IEINAWHGPfO/j0Acn2AxFk3OkXc//ZJBciisHVSQ
         DuzRSmvFzRzw1e+UkN+lXsCEXtKRs/Tx6dRGljlIQVgcjoAjPhN9W9wfXjW7XYFkxr1b
         az2wI5jC0icN5shiG9jVMNT3BscI4l/SUqj2pAw7UXQ7yrK/p3zxK/Xtj09PjuFTV5NO
         k+y+gZ89dZeNPwNU1x9M0mF0DTTEnpisVimOgcYKwEFxvYmqZCjbHPVhsJ7LD6ECLOw6
         3sXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790538001; x=1791142801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xp96osNKNV73rMrH2Cx3GnQRPM4ktS3CCX6WmIYhStg=;
        b=GY/jauoscRAx+8lGB+xTNn8zkWzffpkTmF4tzvsOOOGdeTRaQqr7QIyylWatF261R/
         +BNTyn8/1swS6v1JjU22WVhUfcbjar2qH/x9bsv8+z4NwhvK3E2j6QA3m/MJtJCI51nd
         UBNW7eIPrMJ4UbNgKunpVyj7Kmz+HOtVLRBeBlRJyHuV8oTzdEDaTZwfNb93+Fvqpd3q
         ovBma4kdpZmlxLUHfRQaD/9Veb7PDJRNL9O0GyEghBogX34FILSO7+/fjnDoJFRoq9uS
         Gtnk/98NPaJW4vnTLbbqnTmIs0zpyly+M5+MUMiWzhHSjQTXi8Cr5Ee++z/m4NrjVRDb
         jDig==
X-Forwarded-Encrypted: i=1; AKwUvBwnynxEpqRH65UWCuoHUbSkD8IO9AFCcVbkcte2GYK/3RcNFpaQtPxrp0mMXahmJFH5MX/YR0RQQsNhMx4=@vger.kernel.org
X-Gm-Message-State: AFuF++li35s78rhGwEGN+oDJkVFRlj8O6GqLzZ0mg61Uj+35J/CxcfMt
	w/vdFY0Q43XDXz0ioLzFXExSZI0Tj7Jb2Zqdc+SUTdhCjUUZ/gPF8592
X-Gm-Gg: AYBFou3kmzppQSLn8E69L5OqdYXa1CPKz/dVHrnwyKigC+vmvvoG7+ZnBUF61EGD6Yw
	CqdEMDXloj/97efOqv6M2cJC4tfYN4zD2fJ7lwnOxefAd/+eR6SvaqK/miHCb+h2vJbynSfvN0K
	NNZ/OPYmTZO+RyIjripDPz9b42D2llJ5aR1VfcdMnLQoZdua8/9HMVFlr6GDuBrRevwMy+fazBq
	Lp5bHrVMRSTj5ooMHvG0N/KKrItYfcIFAlFKUtMccsHjGPAdy4M0gUls4t5XoD/iVHoKwhH2WFu
	wBSQhiNznDPNv1O4VGyfhF6Q64fEri8Pc7oQe/kdtyT5QHE1QO4kNkp30HnkbBPsA+TAZvJj3Ad
	TFHa/HES0NXnKNNfiFgAjzNMQLZEse+FQQa30QpBkSSkbA/qahkmGRN4l/JkUDms88vPqNtnv2z
	++ByWQsG7uWbU87QR6QUm1ZE5bUcpJMjUGyn+LJC/k/wJHv0EYIUCyc9AnCfAcMo4=
X-Received: by 2002:a05:6a20:d707:b0:3dd:a197:cf25 with SMTP id adf61e73a8af0-3de0e9185e1mr10431840637.73.1790538000543;
        Sun, 27 Sep 2026 12:40:00 -0700 (PDT)
Received: from bloom.localdomain ([2604:3d09:178e:e100::a891])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-882585621d6sm969652b3a.34.2026.09.27.12.39.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 12:40:00 -0700 (PDT)
From: Ivy Lopez <skunkolee@gmail.com>
To: stern@rowland.harvard.edu
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ivy Lopez <skunkolee@gmail.com>
Subject: Re: [PATCH] usb: ohci-sa1111: remove unused dump_hci_status() debug helper
Date: Sun, 27 Sep 2026 13:39:56 -0600
Message-ID: <20260927193956.219321-1-skunkolee@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260926162513.25268-1-zainaboobacker33@gmail.com>
References: <20260926162513.25268-1-zainaboobacker33@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reviewed-by: Ivy Lopez <skunkolee@gmail.com>

