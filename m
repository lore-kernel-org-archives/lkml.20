Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB576511181
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 16:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788797131; cv=none; b=Pd2HCNx+9vCBNiiOYuC+iQgBrw7voBXf2ANJ5VcHHefZyzUnPDfrMujxpwSWORHmqVf8NiqVPTDJ8Q0LlQ1pk++rWPMDjMaQY/FS8SCtlp+U6hkajTKoHGJxCCG8AKfaNZL7bzxMm3K9FsTrbdvOylmQZ6J7CD1yVw7PrtlEQQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788797131; c=relaxed/simple;
	bh=2WOsLAPThCX8TB/02g8wSwkG34LMSmNHu26+Sy2QUG8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I7fCggvCjEGYcm+Vq3Czz0X7nax+DgxU0EdUI74J2sz8S5pcaUAsN8m9q0XIhqGwM1zV9rUeQy26/5a71MhrQ3VBaold01pLb/s2QMa0KC9OTB+jWaREvItZqbzrwohElwKJ1qBajVDUW7+myrOCJT3WnL/TO8YMzr/Eb5CEio4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L+aV2QTs; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L+aV2QTs"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843971bdd0so385079f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 09:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788797126; x=1789401926; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2WOsLAPThCX8TB/02g8wSwkG34LMSmNHu26+Sy2QUG8=;
        b=L+aV2QTsBWhB+Is/z1g81g+yq3HGNediJsdJ6Vo/U6iij7z3Y8RUdisXwmALd60FWA
         4OBKdQOd9vPl7JhEZkc92iGbXXeZTppZbElsakAfAO4gpwutg/GLd5W80dUAZX7og40R
         W0VOYABrDrVsWQ1u/7OLRJWUj6ZoV7cUHrYbqL+G+jNEvjr+kPkcruHjWR0a0rsWWPTA
         MnpR8H9zp1bRNGIgvX3rlciw16ogMAFJIA6gYdeiX7HJzQCILIRV2pVIUDvt5HLvUI3c
         2nZY/OlKDFKv1lYS3PWCO7wNx4vIvH+xnzV6vAMwPXW6OEcSmkG8C982DOIJPD8gR3/2
         X+Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788797126; x=1789401926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2WOsLAPThCX8TB/02g8wSwkG34LMSmNHu26+Sy2QUG8=;
        b=rSA3NHeMG7tX9vNnR2WXMgCpL5NCjSmQfbnNi9l6lDYHZVK5YRNfNTXS8yuyx1K7Dp
         Tgl17klomImFdgM62XzdMN+oCcXcreF1YtoIxB96vOZj9oXbbxcGUy0ay3nqRdFDnx6B
         ZuMUkJEkj346cimA7I9VKThgdzg8QiKelTvDDDfh8Cm1PknhdTh1GS3VQgcJ3NuOLS8H
         QWRuTH2fcCGbCvrEf/vrZFekgeCE+dQT2pgiYcdZaIzUMukBaZgQ9DGq35cg0PRn3OTB
         ytt70+FDcvuvNXU52EV4jQjUqWnFIO/McaoGeUZdDyjy/kV6REZ6J719Luj/PHbuyVmI
         ACAQ==
X-Forwarded-Encrypted: i=1; AKwUvBw1MgrT3AvUMkmverYTRWVt9cjR1E6wG82CS5JxVVEGUECJS8g9WDI4CwecC77Sh0SSKq6jZNvk9oJozcA=@vger.kernel.org
X-Gm-Message-State: AFuF++kDUjCzsTCmM7tELV4jBpY6cV8/uW+mOxn/+pqSBiBb9s3o+L/s
	q6m2ifHw8zR1wfUiQ/4XCW8nAfLsYFkD5Q+jKw05lI4KAc9P1BAmrjKI
X-Gm-Gg: AYBFou0zwGM4BPEABrpcwoKv+UM58snSkbP7B3zOoRPRtsBVA1WEIgHXcUfTTEn50OX
	Phj5pCMkfc1tJMxN8ezS/x8t53vX+PdiOO8BcRS6YgRGhK8WUXv3Ce0iHziHG0Fcj2XgFNQCHRE
	zLH8Xw6f46JiaHt0m8Qwfixu69UEsNIGsb+GMsz+oRzNSXBoaf/MsUxlC/Zr5atUJRwEu/zLykT
	l0O8JAVOwbfKVFmnhPF8tA6ZW95U4+TfIvhIh7QVPz6dEfGZx8eFeTEFFc5rNkRUcWKrXfnb69B
	rx0AajbJsHuzY90j4UB5d50E2XuVFnBGjlUbAUho4/OUImMOcCOrkrToFJeXeqOw2Ymfqbp3k4l
	h6XeuT47ZCvl3w7HA6D+FQ/W3Fu2OBiZLvJbghy6us04a8Yh/7NL+uGUQSZ/ALPS2agvqHWjiNC
	ooosypN8bzp04wBbkNWHUGHlinkmf+2T89cLvAJ3+ZEG9hvU7DW1LVmYBhO9Q3eeMkcL6YUAFto
	2vcu7zly6GTGSLEs8KY0w==
X-Received: by 2002:a05:6000:25ed:b0:485:82f7:9053 with SMTP id ffacd0b85a97d-48589246177mr22958565f8f.1.1788797125515;
        Mon, 07 Sep 2026 09:05:25 -0700 (PDT)
Received: from lima-kdev.local ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858d312ca0sm29616413f8f.4.2026.09.07.09.05.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 09:05:24 -0700 (PDT)
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: kprateek.nayak@amd.com
Cc: bsegall@google.com,
	dietmar.eggemann@arm.com,
	juri.lelli@redhat.com,
	kayracizmeci@gmail.com,
	linux-kernel@vger.kernel.org,
	mgorman@suse.de,
	mingo@redhat.com,
	peterz@infradead.org,
	rostedt@goodmis.org,
	vincent.guittot@linaro.org,
	vschneid@redhat.com
Subject: Re: [PATCH] sched/fair: Remove unused autogroup.h include
Date: Mon,  7 Sep 2026 19:05:21 +0300
Message-ID: <20260907160522.1152423-1-kayracizmeci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <3ae49b35-2188-4b29-af4a-6fff500098d3@amd.com>
References: <3ae49b35-2188-4b29-af4a-6fff500098d3@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Gentle ping on this patch.
