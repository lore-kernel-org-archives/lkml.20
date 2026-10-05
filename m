Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FFF13DDAF9
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 10:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791197213; cv=none; b=Bjs2uv8VwSaM8cnHgF111zM3SP24CNcYXUcPO5OGGPXUsR068vRe0kBPyTZnLfNjPe1giuG1rgRd8ij5gpLyvBAMB4xUmVZGKHwRDLY6HRApTMnGo1mU3jrELmmO9bKQj0nk0iE6B0mNL/L7sjYlrZqmkjQ8rlLMRjLnqc15tYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791197213; c=relaxed/simple;
	bh=mXUAahTE+iLm2mg6xrnFW6mcn2COXMs/9ARrZND1ezE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D6SyvxFB/Z9grfwUMRJ8tOjv2OY53KSwMiVE+i3Y/r4NZ65LJIYaSkknpZDgubr54+9RBajNOp7o5Pe2aA4WkAIV+Zo0N06myEOK9LaYw7DSM+CrVhSowCH7PPpvpqmt9zbzr718seHgXDFSeb8DNWzNHJ2GcuQvyQflPVDompg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oGisSSAj; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oGisSSAj"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccf3ca626so10690505e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 03:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791197210; x=1791802010; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p87CL+99r2nufenKJUmxs5PgJ6qzjJ8ZoeapGb8jCEk=;
        b=oGisSSAjJcmo+bynapDG8BKlTVBWZZtFXgpwWfd7fYqQLPXUPueQnRY1k1ecl2+1mT
         PwN6u+e+lRIVQdrJP7+Q0mhqvky/n70m2i2nltczMgNTK6daN5VcARRhW5swXVTOMxBC
         eCI4PqZx6ImUIW4YRpWqKQYgvK7mC0QRvuuL63h7xTLakyLgR7EcK/7cd+DZ0hvTtenk
         bYJkVFPR+PfXis2zXk5SKOav1ZIHm9bIYCRagdEUYsivu7HCN7qwAM6FBl2ZQu6t7wl9
         t4xRicifCln9DfBiTg+oqfcXtd53j/K+jDdQZ0JjcT9xeuBBYEhkqJ5c7/LBTdg1m+wC
         ySSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791197210; x=1791802010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p87CL+99r2nufenKJUmxs5PgJ6qzjJ8ZoeapGb8jCEk=;
        b=b8eGwpeG9ZczHE7xPpHQCKNg/OHx+ZGPffTD/Mqd4bYKYr5NgEQ+G31jvaSBd3Ypzm
         //sLm3AOlzawFAvX+PZzjHzCG6JDgvYXvDnMgHJd/DtRx0972pntX4Si9BCbsQk5iMpF
         /eGl1n7OyOcBaQt/6/kg3TXmoqRz01YnhzbszXAFVgiadJ5O/bNMMlPvw7CA0pxaRzv4
         LevZ5ZQ7ZaHnJXX66USQ5CXIxh3GBwAgfYsZKnxTa1jFSOpu+nTg7jY8rrvmuLHzAbVz
         EzokrNwh3RZvXa7r7ung9Y9dvKNcGpUyMgBxHOzzKKaNIBnrUCu5a/VIL+Jpa+Zrkbp7
         SBnw==
X-Forwarded-Encrypted: i=1; AKwUvBzG8UEbos6CqcznnCi3kz2FMIXb3DTFDHIeUSYdFe4Vt6uAQ0KABL49x2nxP0UbwR5E9kTZ3sDvG2FNXA0=@vger.kernel.org
X-Gm-Message-State: AFuF++n+lRKthtNGG0oCo0uscZSGXVegBPSMQHFJFf9PVpFaBFQakjvh
	aoNKWUywwsBn5LlJfk/58fU6o+CB5a2hE4XBRYAIMgR9cHLbAa6b00uxbUXNsoA6
X-Gm-Gg: AYBFou2M0Vzs7s8GvzJD2UvGioSVz/4lFaevsHf0DImc+lI7B49yrr2ljAVVy2HVbQw
	tX69ZpGpnKP/ILseARt5Edf+KTh/4uCxHMGvKGdT0vkzBNDDL1p3y11nVZwr8QmkOpg/tARj8sa
	48WeRQ1co6G239/4XCXknv+0EW1BG8jpxiUPzDEiw6mTth5KDbVRGq39cTDTjmws8ymKcbaQJiZ
	QW6C3E84KUvpCddJAP92qL2fZ+VogiQuezLGRozXb5fVNHKQlDD1/m/wtXSAL1SkgJf3zfLz39e
	Ko4rJmJxLNvQ6vhCI6J1aImSwFNjVfCFUh70djCFQbM8xxU5Ct+9XbGz6YcNhY3tXGF02Fceid0
	GxCNKZZIOoR2OcZ7nZe+OOY7+5378CFQXevvaF6c9kCkmRGqaV2D7fTgCQTlJPNd9MKdif8V/Du
	lZIREAufMEky7EIgPft4EsKGQztb74vH+3/QXp1RFUWzIy4lXvjMK3TdtR/wya0S16G8TemxMz0
	38gH0KodLoh3S7axyhOgYM76yDGl0+A7ZHvqjvK8MGfp4vz8ZQW2+FeHhzsC0VmaQ37TTWuxpIC
	7ToAgP39rjXmEpKb/Vb1h/MpSg==
X-Received: by 2002:a05:600c:1f93:b0:4a0:1c10:1419 with SMTP id 5b1f17b1804b1-4a1728f7420mr34459605e9.26.1791197210463;
        Mon, 05 Oct 2026 03:46:50 -0700 (PDT)
Received: from robert-83cx (static-dsl-191.87-197-115.telecom.sk. [87.197.115.191])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0280c8bb0sm367261625e9.11.2026.10.05.03.46.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 03:46:49 -0700 (PDT)
From: Robert Bozik <robertbozik@gmail.com>
To: sakari.ailus@linux.intel.com
Cc: linux-media@vger.kernel.org,
	mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	antti.laakso@linux.intel.com
Subject: Re: [PATCH v4 2/3] media: i2c: Add driver for OmniVision OV32C4
Date: Mon,  5 Oct 2026 12:46:48 +0200
Message-ID: <20261005104648.16362-1-robertbozik@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <asN9kKdqf6hY_iCV@kekkonen.localdomain>
References: <20261005071010.7191-1-robertbozik@gmail.com> <20261005071010.7191-3-robertbozik@gmail.com> <asNsiKal6GgcqUSK@kekkonen.localdomain> <20261005101447.15264-1-robertbozik@gmail.com> <asN9kKdqf6hY_iCV@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Sakari,

On Mon, Oct 05, 2026 at 01:36:00PM +0300, Sakari Ailus wrote:
> > Agreed, that is better. For v5 I'd give ipu-bridge a small table of
> > sensors whose second I2C address belongs to the sensor itself,
> > { "OVTI32C4", 0x3e }; for a sensor in it the bridge adds reg = <main,
> > aon> to the sensor's software node and does not instantiate the VCM
> > from SSDB - so the no-VCM exception of patch 3 folds into the same
> > table. The driver reads reg with device_property_read_u32_array() on
> > both DT and ACPI and the _CRS walk goes away with its CONFIG_ACPI
> > guard. The property fits into the existing dev_properties slot that
> > lens-focus uses when there is a VCM, so no change to the header.
> 
> You shouldn't assume there won't be a VCM; please do add an array entry for
> reg instead.

OK - a separate entry for reg, independent of the VCM.

For the VCM I won't assume either way then. The bridge instantiates it
from the second I2C resource of _CRS, so v5 skips it only when that
resource's address is the sensor's AON address from the table, as it
is on this machine; a module with a real VCM there is handled as
before.

Thanks,
Robert
