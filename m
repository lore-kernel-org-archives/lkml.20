Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB2C3B14BA
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 15:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789574058; cv=none; b=LfR7FJnjV3/ahaClwaQTOGL3vOdjSuAzi+D7TFnuev4tQLnC0/1zx4pvHzaZz11ZAcYTL0zBlgbrrwhBLUuWSydiuT8uG3yPO0wYLaYcreRxWGSKiZ6ouGKcVke3glGqN3HZJDPq+pMbD7bAChJYxC604Crh3OkO3dYn/iIV/qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789574058; c=relaxed/simple;
	bh=Un72WoZT8gYUqQrO9W8+rWOjRXJKWQuSMylkHXu37yI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kWUMYYE0BWzdlzOAifgPjtcQjUy0dyDpzBgi/kCVkHAtwDOnKAHhbX6AsjAzNMFsEPpIIGomuLl6E+TKUD5I9Z2mg5Ike/XKfdgzjy4uVUr+UDFr0iQqpRrO+jE+ptxtN+qsMAWPI+51PNrPrPVD/LcGdSCckjNPNsdN8OL6WJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a7NtDY5p; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a7NtDY5p"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f13d7aso1535377e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 08:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789574053; x=1790178853; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Un72WoZT8gYUqQrO9W8+rWOjRXJKWQuSMylkHXu37yI=;
        b=a7NtDY5pXCjNhD+3ZFjZBdjRpv6ALxIMicAMwsxTJg2CcY36VT1UZmLRjh1px4bbtm
         +HIL3fGu/elB4z9dlpKTSptQRCiviFhnkMh0apXIqJDBClVS822/XfMrucRCNw3uxG64
         fvQnui8JEcQ7Ilbj7mpMI7WVLyKBeD4gmWTz4PUudfn4engYBJMQLJNk3LfhNTLY7RYn
         O3ykv/5DY/QEJCYqauHULdQcOUu7Yr+hNXPXSaCBt/GbmMhzdFuvcRvU6/nionbJHh+n
         K2psQc/wDAbP442cc3zqXOgKTPAgDj4Yo/7JA6A5evwX8Kyx9uTs10TjR1xjvdBvMXzy
         eQuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789574053; x=1790178853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Un72WoZT8gYUqQrO9W8+rWOjRXJKWQuSMylkHXu37yI=;
        b=Q0xL2+2Vq2DN99Q+CHsbY96flxIpGklh0SAVdU0kY7JVtHNmjdDnxlZ/ZkKLZ+ditH
         SCETJAcNhbrzdskujYtuMoS8UzBB+eTEr4K/RJ/JWLSa8MyBVCiOgh/EHTLU4f14GP7E
         MJpVGAGejb63ILV7iBHtHF1GKOzIGYwWkwDwpg/r7E4tKI2ekZ1hhopXJ73tS7nNW6jC
         SmC20sw6I0ioB+w+NN13+gzZQ4Q70h8mF1FH72aiFv7b36oyN1NZqm09HqvbMd/AkLes
         XVEhOo9DPwDrCY4hRZ536HMhfvzsNGOBHVqEDN8FYnRlhjOyMEbxMJBsWRjP5J/flATc
         rFDw==
X-Forwarded-Encrypted: i=1; AKwUvBxuohHKa5svD1qu+aIFGS/a06Nn1BD45dtiDktwDUkuU9XBziDpLfikGY3L28oSzxkE8Xvujt6nADExhkk=@vger.kernel.org
X-Gm-Message-State: AFuF++kGidtZ6x1nRSR6yo6d8eUMCyEypwB6lwfnhSJOLS+fgz59ietx
	gTKRHyoHUzwnA3+REvNgqmZqRGmvEep8MMyH9bawiXKxIFRgyCuX92U=
X-Gm-Gg: AYBFou2pMulRRAdz3TIFq/OLHp+kTveulHNesUoIdQ/rksaSXW8fQcnlXoh/g8RoMxQ
	61Nz83w46QLwNysRKTKk6sejZWU+9GN0+c8wcL/zpIEL47JBdAgkp5X8HMIImpsHBovBz8X0bvs
	92+6mPH5CEFv7BHBNlSF619xoOY2BrIGgllaTSzNs/XYsw79K/TbmJ1Z+7QkCQLSRLHvv+nEIEp
	kZCaFgrrDGIYoECSx8OWCQGvCr+pEiVGBlJDJHtaN2pWOqmN968EDj0by3oi1cKOrBsGxKovnn0
	nRMpt8f/v+Xjlq6avUiDQUkxa8hA4mFQVYuYLv8LBXJAVoggOwMS9feVqNuD4GAwxslQdDtls0L
	q1I75mweXS/aWqhES+uO/ymGBiDKEwv8kB6dr3tbk4yaGrr657K7YLoie3Crxy8cVFhBfMR54ue
	vwidDB5T6MqtrbuYKpPesS1EbnAOfG4KlPHOWHE+2LU6+GVQWrRduhxFFSzp5Z+ThzyJcZFBpPL
	vINJ/s9fb62hfGn3u+V/5cAEzAP/P+YiDgIcQ==
X-Received: by 2002:a05:6512:3da8:b0:5b6:1a7c:3b with SMTP id 2adb3069b0e04-5b8b666e4a8mr947500e87.62.1789574052531;
        Wed, 16 Sep 2026 08:54:12 -0700 (PDT)
Received: from localhost.localdomain (sekoohaka.ddns.net. [151.243.208.241])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8b57cc55csm1017913e87.36.2026.09.16.08.54.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 08:54:11 -0700 (PDT)
From: Maria Lisina <sekoohaka.sarisan@gmail.com>
To: andriy.shevchenko@linux.intel.com
Cc: lee@kernel.org,
	linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev,
	sekoohaka.sarisan@gmail.com
Subject: Re: [PATCH v6 3/4] mfd: intel-lpss: Remove extra DebugFS dentry
Date: Wed, 16 Sep 2026 20:54:07 +0500
Message-ID: <20260916155407.47647-1-sekoohaka.sarisan@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <aqq5d5ESVulYfOnK@ashevche-desk.local>
References: <aqq5d5ESVulYfOnK@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> As Lee pointed out, we are fine with 100 limit, so one line here and below.

But doesn't the guideline strictly say no more than 80?
