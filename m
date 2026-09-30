Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01B1A41D22A
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 07:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790752981; cv=none; b=Rnmm4qMxlyQRegprOTFrjMJiJAkWaBS8/HBiazcnRCx9PXjmJ5xPdU8e34G6osU9h9RW1dA6cmcmCRSbuUrwGySeQUj/TpwdThXCe7aNeBYqPmvXzmZRPw+2nYCAWCS6lfjNx4fMgXAZpnw8ptopmj/OCap9Sldtv0BmbDIukTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790752981; c=relaxed/simple;
	bh=W1/LVnypA/Fa1aCBl0ZqrQ5A0oO0YsvOH2E8+KStOoc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t4KEfmGamCMPeYTUq56snQb0w4SrghcRaDly7N41+EwGuPA38liRhZffvjewi7Y9p5Fzc2cMINsKqmyrbJexpI80Epz3k1HkN7Ren+e35Vz+GmGRhciOkpUbS9ZkGCrKcBDdAMOkdHEIJz6hGHiPbFNPdhzvUnT7f3kXJMDBzKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AKgN/k7g; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AKgN/k7g"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-86212a185dcso3473805b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 00:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790752979; x=1791357779; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W1/LVnypA/Fa1aCBl0ZqrQ5A0oO0YsvOH2E8+KStOoc=;
        b=AKgN/k7gRZJu7WmE05CAR7sMFeRUJdwYpV4zoLO1dk2nQhHYD/vwcBkScvpLjH/bTQ
         un0kujJq09kyFVxD9h9GY6YKyr4g7s7uqmPXuaxnj15u4H7poY5XsTcto0VdEHEpE7n4
         jnM4H0D4s7lWLr0759bTfNZ0Q+JcRM4k5baYCacVRhX62jOroIfKbJhYGTOywnX6oLmo
         toq4S/+6KbNcTQac646pt0kWhfWoi7t2W+qAcxMgVLeiSb8eFiXmK71Foj9JSosXmpoS
         0wokDnavkPeuP8cPZ88Ck8WW/HCaW+2lmU9/oZC5JKTKZ0KrBKM/GUfpdFmss45kU+bL
         jS1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790752979; x=1791357779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W1/LVnypA/Fa1aCBl0ZqrQ5A0oO0YsvOH2E8+KStOoc=;
        b=ExTyFAaeXSVfuaA4VkY2ZNPUzcTHrgM3dT/GlZ5frKkj9bnU8Ef3jnDT57YbPH8mra
         Q/e3wgc9DIi/E3iPWRcFqWea/8PrtTWNI1kXorZLk6OppUwGVLhD+kJ4z7iY77qepHiY
         nVam6+owoI4s47AqkfVXCiQCkx2R6dJh003xlUr2JBQBJE6n8SqJ/G4i5lEDNNC2lS9V
         YHELtKP9eVZNFpFwd3JD+V5e+gHpfbC4zEhtkkqqRKD+rwlErNSAMnjSO+mEtqtLThpO
         u6vA57pU4r5JAPyQmpNkaKEHeRFvdJ6IeIZjR+GEJ0lIcRcfii26xv1VBgHCPQnrc1CM
         rB8Q==
X-Forwarded-Encrypted: i=1; AKwUvBx2Ucu1FxV5fqtc07pHGoSn/otT1B0nUSDJcPpRPqhRgEa46tCA99lc++PA/cFswo6ZLQMhufnm+47HAv8=@vger.kernel.org
X-Gm-Message-State: AFuF++mmnfS81ovFDr4p/1b1m1Ugghz5KFB8A+AnMAe/faoApbXDdF7G
	gmYGUDyGJW2fxft9z1BRvNzPTmvdw+gfJ7mrjeiYhvB3c63bBC17HMxpueFp+gKst1wBog==
X-Gm-Gg: AYBFou0pHfCgTOU3KoD4Iap280wqQS3CHelU/uEHt6I5n2Ys+jDXuu14NDeGTP/+6Z3
	zy4lPU/KGlozLjSyrW876NyQBv/xKfH8ZzkFeCyt5z8ox6clx9/jYVfW6kW2eZFNYs5Xl5l5Knu
	KAhqQEbW0VL3zbgZUhPXyAnLi2eeiQmmdFCidu875dMF7PqN/AKIh9yegc7fSgRyLIHjQgJcCtw
	3xX2cf34t22nJ19fkCxMEf2i8WI2AiQaattimeLN/wxTriRvmuGMmMFPuF+CVgC4tmy+lbolj98
	JLFmS4yxy8kl+BfGKQqYktQ4J3+0FbtBWp8g1Nhc+LtoI5ewF8uVoFHEKlthv67ebl3ra7zZEpo
	hEiT8ZB3ziwEYy6XrsHRS4aJSZZa0PVtQhvly5NZdyhsQ7r36T7C0HfbOF2a9HSaJcTzrQl3Dnk
	nGBoUoJZ/Kou3njC/M6ydBvBtJQAvaQiw70r0f2WGIbce516EaNqsXdpIGq8N0Fq5d4QkJ92JPA
	h5FoeTYOa7PO4YJ/jjG6XurrnSTXs9TKl4hKjwSL7zg7+Invw9uJpcCSyY82rdoq0mBtcfKzqVv
	kW/jJlOX3o3D9iYGXccM9AiKs6F3CU/uMJD8ffYRHXcN9a+JE+WupKEUw9A=
X-Received: by 2002:a05:6a00:a253:b0:881:fa65:d507 with SMTP id d2e1a72fcca58-8874ab8ca2amr312784b3a.22.1790752979389;
        Wed, 30 Sep 2026 00:22:59 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8872643903csm339794b3a.44.2026.09.30.00.22.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 00:22:59 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Hui Peng <benquike@gmail.com>
Cc: Anders Larsen <al@alarsen.net>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v4 5/6] qnx6: abort mount on superblock magic mismatch when silent is set in qnx6_mmi_fill_super()
Date: Wed, 30 Sep 2026 15:22:55 +0800
Message-ID: <20260930072255.1167805-1-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260930031604.70544-6-benquike@gmail.com>
References: <20260930031604.70544-1-benquike@gmail.com> <20260930031604.70544-6-benquike@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tested as described in my reply to the cover letter.

Tested-by: Matthias Goergens <matthias.goergens@gmail.com>
Reviewed-by: Matthias Goergens <matthias.goergens@gmail.com>
