Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05DD0415B6B
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 10:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791799573; cv=none; b=hoRHewOlvUTHsxnHblCsYMMKmVJfxMc7N2Jf89ti6SzneYHdQ+TRb17qsrU2aT/24grFDjqB+DfjZF++rcUASSq3EcA5VGGJ5wuK1TPZJ0O+89Bx3QxTE2EFDQ63z9dgbd0CQh9Z+mjsdzFLLIFJ4CtdqV7hgKOHLUY8ZjcHct8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791799573; c=relaxed/simple;
	bh=mD6dZoP3ZagEhLT8en6JZ2TEnxmI/QAwfBdTaspPZtU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kJE6hbqgW70EL2b9VIPvTftNW0VxEuaPdTsEOcngqwoUnmZhbtehZXBKz/lxkuvsfkNwVeI2UKhZBSdQOKoDlTlvrfMjKmR0+4PFyD5Wr7ad+a+mLM//0vHPtgKPUAIH4Owd0dYKT+ofa0g3BzPn6/Xe8xMBMKghJZypBMucmgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T/Qm6ZMA; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T/Qm6ZMA"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3a4b9732d5aso1261766a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 03:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791799561; x=1792404361; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6dJ7hRSQIEyiDrhx4pqjl/RoZOTZG8NADNLqENX3HhI=;
        b=T/Qm6ZMAtSg+179AvlMK47FWRp0K3mJd9ErXROGGyvaSHVZIxrzFf8bjIfEGS/vaGx
         qWZH18ONBGW9l67KAd3se5ghz99yXiWzT7fSlpMRRrHb9dhIHz8oncxbaNlg0Ho1PfY8
         VliL1zoaYeAx3c7gt6sLn02ZXcIOY4ysWqBNbzCQZMRGpIOQ1qh7Yvih+IO81pt511hI
         RGRerAng7N6v4bn6lLEloM4HyW4fHj6w8rAinhhXdFVT3CXfMqGTwLY+AJiDeLAlOJ2a
         9CZ/mQJd0edRbacNVfiJUJbx7ijEmczFL7oWCycRme2K4IkfNpfimmyW/KGS6LV40X1w
         4Eeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791799561; x=1792404361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6dJ7hRSQIEyiDrhx4pqjl/RoZOTZG8NADNLqENX3HhI=;
        b=tK0wz4I/txOpV1pYIWtWa7kqsaFwqDxWcIbSjCDapfUvJBysDuvHZB5uofZwP6VCO9
         5jgKAgNnifMsa0mI5Py8prcWEe+elqOVOpC+mss5Ttftifj2Z7k7zaftq/UCFa5qweiY
         9jGdbQIc20AmZT3lZTUm+NMsHEIrWTdptde0+RifIhrhPBgM55iCL6BdfqDaZVKqky3+
         toCGDAloGxlupFnt2ZGXEPnUXxPRj+k6ED9HWlLHXBIJW9AoIInH1Jrvq3ZMt88jeAts
         3u3ENMykTm9QupwUeZ5jV6j89KWRagBZP3z03EfS/K09pbDUH1hRKi7KVJA8JV85nf8L
         KFIA==
X-Forwarded-Encrypted: i=1; AKwUvBxBgYgB/ffzWb0UmP0a/o66nM4CU4Zk51+9525JHglrQpTT0Wn+zO589ocYchejkIfLcB2FJY4PTckXfyc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLx0OSnNqUIxOOF8O+1ZSylc5EtYHPPyFJSfmRHXW1JpZbuxwU7
	ovEQb2HE2WvDbekhM7rpnPxiSIaESwr7FbfQRR648mHzpjIn6GxsB6WA
X-Gm-Gg: AYBFou2D/vzEziBELLV4d++EKDbYSxSJl+BjwfS7lSiZqJQUxIFv65KD5U+DBvyh5Gd
	bst5G570GB+ZsEgvqNQuMeQu5U4RLkj1teebg6sKs4rQYFtHSVAt5d+1DIOpoqZsI+25sau3A2s
	Y/MizGocnGLtgXNn6IvcpcV5rjid2jb+8AW+/g0aupDcdk2SHvuXNu9mUl0YKE05/0TkQEe4MDK
	VVFyIPXVZq9bCSBfGaot/8e8iMg4Y3MQpLeB5cLkN6S98NhK5UNHb0e1RdFCJIm09H/OgEtVC5h
	TDuzqCL/a07X3Mr8Li7hDu3E6yMtHiN0HnBOBdBfNZxY8M2NbOgn4Z4bxlRGREUuNpCWY+kzywi
	yam24L1lxkS8vOvsEU689rJ7cJJKvI0buHZBRad6YCuBeV3ompLiouctJ31HGybqN4sucMtQur+
	2OU7psohtQTGEeQiAkUV48VXE+aGQrKIN+3Ipcx5LFVsIvePnrXaUs5qEqiEu7+HZZLJlMUfw=
X-Received: by 2002:a17:90b:5887:b0:3a4:a383:f9cf with SMTP id 98e67ed59e1d1-3ab3a9a78f8mr8544966a91.38.1791799561006;
        Mon, 12 Oct 2026 03:06:01 -0700 (PDT)
Received: from qby-nixos-laptop ([20.89.137.63])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da04596dsm4074272a12.29.2026.10.12.03.05.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 03:06:00 -0700 (PDT)
From: Mingyou Chen <qby140326@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilya Gladyshev <ilya.gladyshev@linux.dev>
Cc: KentoNion <kento@kekto.ru>,
	platform-driver-x86@vger.kernel.org,
	ted eric <ericted8810@gmail.com>,
	Armin Wolf <W_Armin@gmx.de>,
	linux-kernel@vger.kernel.org,
	Chris Taraszka <chris@miget.com>,
	Matias Civadda <matias.civadda2342001@gmail.com>,
	=?UTF-8?q?=E9=AB=98=20=E4=BF=8A=E6=96=87?= <btx342@gmail.com>,
	powerfullz <wleizc7319@gmail.com>,
	=?UTF-8?q?=E5=AD=99=20=E8=AA=89=E9=93=AD?= <wolf109909@outlook.com>,
	=?UTF-8?q?Milo=C5=A1=20Vlku?= <vlku.milos.fun@gmail.com>,
	Rsplwe <i@rsplwe.com>,
	Bozhen Peng <bozhenpeng93@gmail.com>,
	Anton Karasev <uselessfire@gmail.com>,
	Jame Jao <jaojame6@gmail.com>,
	Mingyou Chen <qby140326@gmail.com>
Subject: [PATCH v11 1/6] MAINTAINERS: Add maintainer entry of bitland-mifs-wmi driver
Date: Mon, 12 Oct 2026 18:05:27 +0800
Message-ID: <20261012100532.19612-2-qby140326@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261012100532.19612-1-qby140326@gmail.com>
References: <20261012100532.19612-1-qby140326@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a new maintainer entry for the bitland-mifs-wmi platform driver.

Signed-off-by: Mingyou Chen <qby140326@gmail.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index fa0571a5e479..0874713f262b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23042,6 +23042,13 @@ L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
 F:	drivers/platform/x86/redmi-wmi.c
 
+BITLAND LAPTOP DRIVER
+M:	Mingyou Chen <qby140326@gmail.com>
+M:	Ilya Gladyshev <ilya.gladyshev@linux.dev>
+L:	platform-driver-x86@vger.kernel.org
+S:	Maintained
+F:	drivers/platform/x86/bitland-mifs-wmi.c
+
 REDPINE WIRELESS DRIVER
 L:	linux-wireless@vger.kernel.org
 S:	Orphan
-- 
2.55.0

