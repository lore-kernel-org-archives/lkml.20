Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C4424D9F83
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 14:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792162547; cv=none; b=NV4pbsdrYvRnW+yaMhmioCmUCZIytM0qAYV2hdpPdIxPF/QEaNPsF8/R8+oafM/nyC5V+R4gZJ9wPiFjYj6AzOc8l8YYtDsmiWthllVqdgmf6CpcMeoZjE8B5dtkBu/uBcP9rEf/aBDWZ/T5z9apcu80nPPSxxMPMp1iP/xxm6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792162547; c=relaxed/simple;
	bh=uEADsI3C+ZwQjfzZOiQYNESNHr6nsHl6ctBrdOBDmR0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qcjJZBwl5DMgwqb9ZqunPSPDq1Q9uQIIFngzRRBmW7jqYDijxW+n5j1g4ss7kEc+6AJjeXa9MwE+IesL6YpuLb7a0faTLFxTC7gdM+flW34Y8wAJPgJrizrCdGAs+qz154G6aCpEvA65LJT6ehA4VjJgpRGWFZzInhjMswHV6pM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M3rBpaFv; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M3rBpaFv"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48de6a62a4cso3482010f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 07:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792162544; x=1792767344; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uEADsI3C+ZwQjfzZOiQYNESNHr6nsHl6ctBrdOBDmR0=;
        b=M3rBpaFvAPekf8pwFqOZvYYbOLLce3tuJy6//0GK+YIK1K19LHF7OBBF1mMFfVivMG
         G+r5sY9GKnABXhpbYh4PS8nQIUuimsEfLX2rUrc8f8s+MbAI0QMd+cNYx1hqyrw5u1NJ
         SHhhVP1l9FHLyX8RSzWBhpVI0DkKv6YT2QuuWkfZgJ6BhhCeNTyIDplAMlqwGMFvo3Vy
         vQJP4psJh+oP6RQa5YinbRRy7z7CtK2fC1nSDIscZq9lF2Aw45jjjCb9FI16zNksKQZQ
         tzKmCFRccsgHGEg+ed52t2MEaWRTnoRPshA9ncA4+rZNngLdUiFhTmKYfGY+7KcLqfS1
         +7TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792162544; x=1792767344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uEADsI3C+ZwQjfzZOiQYNESNHr6nsHl6ctBrdOBDmR0=;
        b=JZgyCgLz5Cqe5VF/6j/GmM3cAT3zD+WWBgGrrZbvnb2GRWZziXJAZtSEkfQFuFSYjR
         XFq30WlWDwFJCy2EzEVqQNEtbQik7aYWg8B9kp3NjYC6euzdXUAxFgw3EsqD0jSfdBJx
         ySDwuzJJ8TrfyAg8M9KRNQhpiFyEaMV+8xHqo4IKnJ8tEu29JVEhYr/BKd2E/XmRBDox
         NEaBqt9KwZgGQt8shlVkN5dgIuSzQVAdrdl8NZiG2fh9xZp5bMZJwCyYl/iqXtnBFguX
         htkE2qZ0vlGw6C62rqOrchsDZp5aTsT6fwLMlz2t0f3WKFLauPwZhyYWM+dya1wxNgm3
         +jjA==
X-Forwarded-Encrypted: i=1; AKwUvBz1GQzlhtUknt3WE9cnnDYPD9tS2bymuTGwGfQ1QB+ejtaZcey9DHwGjd6b/t0V9Mg3npiUj19CWw5Q9CU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLmukiU/dawoD2B/KX5C95bOmiCcbZS1nsCKAnEETCHy2XGoh4/
	Xa7hipEyQ0R4bS+70SSIJqUaUqr58Ewp89oFmr9WoqPH0bkMYVB2fwcZ
X-Gm-Gg: AYBFou3dw9DyYI/sY08hyO4LVKgAVhCCfY1Q/oSDEcSImPZ7qI3/uyWSh4wGS14kzpd
	zWVtqDhp8ZVG14rSzK+zqy+w+tG4+Au+P5I3vwM6hF4kE21sc9BB2NkQ4k/k1ZbIKCi2PCvBU7u
	PengP6jS2I2Nt/2RdpDWFSvKhrG+F8MquYnZKUC+CT5+w2ozbSZQ0dkpfwYrbYBUpWSCgfkiPDG
	AV+W4SZNGID+07UygplzbZlJzTCEzNZFVnYdirI9pD49470hNciLVcAiud8FXYmTS1PjkUl/a5+
	9H0ULja4sH4Kc+EQB1fhL7382UOeTtEQokKXzJCsoyeJkEfF1WVXYIkMDb87UB2EaQTUvm9gxaN
	gHukznfKT05I0pkga/5jR4PG8M8K1ZHpMtDaJBvfy1dFE8fx66DlnqQa6CPltlT44GqLo3KgCfK
	+SjQrH8LPipJg+WGxw4siXtavpCC46r1FJNVsGp6D2QfJEC8OlqsS6AYa06zBQ1P1mEUO9Zcutr
	15FeXN2CyKHkOa6/GOzixmnydvx2t/bYBiap/sSJGX+8ZATFarhKA4Ib9Wm+JCiKFTNJFr1
X-Received: by 2002:a05:6000:290f:b0:48d:f99d:a0d3 with SMTP id ffacd0b85a97d-48df99da6f5mr8407928f8f.46.1792162544436;
        Fri, 16 Oct 2026 07:55:44 -0700 (PDT)
Received: from SP11X1e.cable.virginm.net (cpc99340-croy26-2-0-cust244.19-2.cable.virginm.net. [80.193.62.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4f8bb6sm5918002f8f.34.2026.10.16.07.55.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 07:55:43 -0700 (PDT)
From: George Neacsu <geocausa@gmail.com>
To: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Cc: Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Peter Marshall <pm@petermarshall.ca>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: i2c: vd55g1: Register as a sensor sub-device
Date: Fri, 16 Oct 2026 15:55:42 +0100
Message-ID: <20261016145542.37322-1-geocausa@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <073e5fa2-313d-4d7b-ac10-3a74c57d3c62@foss.st.com>
References: <20261016-vd55g1-async-sensor-v1-1-cd72f6d68ea4@gmail.com> <073e5fa2-313d-4d7b-ac10-3a74c57d3c62@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Benjamin,

On 16/10/2026 12:04, Benjamin Mugnier wrote:
> Signed-off-by: Benjamin Mugnier <benjamin.mgunier@foss.st.com>

Thank you for looking at it. Did you mean Reviewed-by or Acked-by here?
The address in the tag also reads "mgunier" rather than "mugnier", so
the tools would pick it up as written.

Thanks,
George
