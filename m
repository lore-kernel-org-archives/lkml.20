Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793348666;
	b=MsnxtBeE+qo2rKk7k659wYxn1Yh96QFbAxsHOFDUm/oOD4H2/EzvvvzT6bIhy4g9hr5v
	 PNjE5Ttnz+0ZIdDu6eCwAmfWZmCpH29c85lsO7/Sdff3/qO/DtKACiNjaRDbXR0w/piHq
	 WtR7DVS1QzPzlhKvyiMQF9U3CYmmB7mUG0cmI/ic9YEvhvxFq8kdEG5uCGWbRft3CFnba
	 dnWGMlUXtXj7KA2XZloAhDzFDiPtP2zbkWKTdVJPQuSwz+1cILg9L06b+KMwoK9RbgNvx
	 yg31bAU8atHUgP5zzbHwBpD5SrfNedZGsEhLZmDbASw96f12d83kng5Eh8W1k9U2b9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793348666;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rG/NcuGbiOGELg6y7eJc5iHH1SHQcH5ELZ3obN5iebU=;
	b=FRnjtOERAMmnkKj9vYxmTVTUWNg8hwCGUei5416sxvc14VZ9AH9cZ+MDiObtzFvXjN8X
	 TZMbHb9skG6A03e/pImfRyV8U+H3X0TfWCiLJcxa3idUHvVnda6kDQGvmtxKAXYqNlF4R
	 mRN8WleiGComtBnV6E0zKjstsc5LD4OlR3HTNb8AwwzIk7nI6z5e/dsCeYWdlRblJkfRG
	 xfHbaWEMeRrwqUu7g3rMNw2pSSWyR5scAXYLJwwPViHHyeTFnKQOMT3FJdjuWDlsq9Ozi
	 kt5D3r2cPAKhIIbMQaI+Qjacp4cKRCoO8nOrz8F8W4MowwiSmr6/SOmh/+4GWxtyfmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dcDvUhf0;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92112606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:24:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92112606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dcDvUhf0
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-369f33df08eso977540eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 01:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793348666; x=1793953466; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rG/NcuGbiOGELg6y7eJc5iHH1SHQcH5ELZ3obN5iebU=;
        b=dcDvUhf0Ea9ZGP4odjbCRyix+OG80QK7mqN4qG2DC7w8HLxA/wYoFFJZRgKFOkpxtY
         BVxfD2JTAkFbjQsYo1BiKpy4Uxky1rn6Q0vEoflmxdLfHdkMrDNyL3JjOz0XiQJ2MD8a
         TOjOqeqz9mVWzHrLgqUFvpE0rKy5EQnGo2/77GlYRvrDXyA8uyG/nmjcH7tEu3V1SBLb
         69uNQokmes8yOs9pHNGT24IXYO8Irds///xm3C7lmen2jW6adZ34kW6lKKh0OJAfIchR
         Xc5uiG28SFZEpfvuQE2h2EHyZIsquKZInDlfLEXGnDr1WDv3F57nhIHjQqjDC4cQLb0k
         jfhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793348666; x=1793953466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rG/NcuGbiOGELg6y7eJc5iHH1SHQcH5ELZ3obN5iebU=;
        b=Wn2gEvPACjXKWJkTPhAC0bmCjDAGzYXbpZJu6KI9+JREnKza+dq37W89yW/8NdktFw
         AlCvco8ZNWY/cS8tXnt1qG2S4PofyNcjBwFE4WJdMigRDO+E/X7CQ46MHodbQjlcvGJp
         0Qh9ZlD2IUJ70GwM2e3lrmT9yPxrWb1fuuhINKNgdYTALxgXtFKU94BodrxCOUXWyeeZ
         by111i34Y7flGy4PA0r0HlS/Av2mhMPKZWcodMSWW5bIawqx43CEQiqdxKeeCPnO4zNy
         9HlA2IqjowwQX7PeJtB8tF6EA00WNcIH2PtZ8Sp+8IUexs0LWpVgpsEVuGkQ/7S4eICe
         UGLQ==
X-Forwarded-Encrypted: i=1; AKwUvBy4j9PcocAMk6TcQ/rRIRTSKSQ+ndJd1HmemYfSvaq4N2l/BwcMxa/sfkxIeYcS8ZwtPnSdwGj7OkWXask=@vger.kernel.org
X-Gm-Message-State: AFq9FYIkqBl1wfbhp1Oj6E60U66J1fFmNdqZlj6lffD+5prVQoUwp2/e
	/zqGWSQ1na8A22Zdynd3D6TbHGdRmhx5rpazuRJJ6E0NDkThGYl9qJMXNEvISMbL
X-Gm-Gg: AYBFou1FLUSh2YRjCLQ9kXb2lq1VYbNXWSljogYDM1qItYaYwI5PmWD8BifQV0zjA5z
	bff/IIVZhnwrGR1p9EvgDE1GENwgT0R8i/wY/q7r/P/Q1SH/GiqjYm1g2sxhgCFsGNzhNiFiwhE
	vB36i76BnNQ2NDcOGgp365KCW3Nv0Z98agRKkGafvo4V/vCw8ii/b4ohHk8Bz+F4yfHUUogKQV/
	EOXl/pNlSi5IXmf0Zv3BP5opdgPeUnKMjZvQaQcZpsvwoXBbx9g/+tnoVTPDy121HojlAo25SaS
	/Z9pUyqLqgmMZFQh00Turddtt5BZQhN5tHxFBqZHLoHgG3/CATw9VR3qrgtrUuAsrjSGNnt0Id9
	NktByiqnRQAKsVhhVDGRnxIrvVszq9RzmmW0TtpdJm30EgTtc+AWusQmEKoNr12r0vV0OhQgsyq
	MLkxzR+g4A2keDW/ppQJISgdihCn9wJ9/FIXGOFfIvYoIZTBndtbjGMokTMRGrhJegK+g5/uwLL
	FPdXKS/KayMtWCIr6tZA5Fr8HYA+k+LlEN9+BxqwPLiUgrnfzowWqeiEqi/b8EW+efv4ZDoPLJC
	7OKcwYlswqfaPCQaO6kYrI8OQ9u9UFGtsc0Gy7i7mIwWy+4lktAvACCZAHwetZ0g+w==
X-Received: by 2002:a05:693c:69d1:b0:36a:fec:d8b0 with SMTP id 5a478bee46e88-36a423f9734mr2476230eec.25.1793348665664;
        Fri, 30 Oct 2026 01:24:25 -0700 (PDT)
Received: from chitransh.. ([106.221.205.232])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a77c0dsm5999986eec.26.2026.10.30.01.24.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 01:24:25 -0700 (PDT)
From: chitranshmandhaniya@gmail.com
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chitransh_Mandhaniya@dell.com,
	srinivas.pandruvada@linux.intel.com,
	david.e.box@linux.intel.com,
	irenic.rajneesh@gmail.com,
	qipeng.zha@intel.com
Subject: [PATCH 8/8] platform/x86: sdsi: switch to devm_mutex_init()
Date: Fri, 30 Oct 2026 13:53:02 +0530
Message-ID: <20261030082303.284271-9-chitranshmandhaniya@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261030082303.284271-1-chitranshmandhaniya@gmail.com>
References: <20261030082303.284271-1-chitranshmandhaniya@gmail.com>
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

From: Chitransh Mandhaniya <Chitransh_Mandhaniya@dell.com>

Replace mutex_init() with devm_mutex_init() so the mutex is
automatically destroyed on driver removal via devres.  The driver was
missing a mutex_destroy() call on the teardown path.

Signed-off-by: Chitransh Mandhaniya <Chitransh_Mandhaniya@dell.com>
---
 drivers/platform/x86/intel/sdsi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel/sdsi.c b/drivers/platform/x86/intel/sdsi.c
index d7e37d4ace23..bf1ca472cb06 100644
--- a/drivers/platform/x86/intel/sdsi.c
+++ b/drivers/platform/x86/intel/sdsi.c
@@ -663,7 +663,9 @@ static int sdsi_probe(struct auxiliary_device *auxdev, const struct auxiliary_de
 		return -ENOMEM;
 
 	priv->dev = &auxdev->dev;
-	mutex_init(&priv->mb_lock);
+	ret = devm_mutex_init(&auxdev->dev, &priv->mb_lock);
+	if (ret)
+		return ret;
 	auxiliary_set_drvdata(auxdev, priv);
 
 	/* Get the SDSi discovery table */
-- 
2.43.0

