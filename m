Received: from mail-wm2-f11.google.com (mail-wm2-f11.google.com [74.125.225.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D3B48123D
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 11:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788781682; cv=none; b=Jqmx7BLuA3Wv8VhLV1dRXsWr76/wVaOFla0Qw7U0mSDkA1cGy5OdkO9jH8OFG1uNr831nt2BG8VbOPKXkMFuzSw9WIa3OBuo+thRX+WrFyThskd3W7AxDQ3TYnt1e4U2jV/t85CVHJtJZdiNt38gpWV5GsXRbMkMi+7lXGOFxrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788781682; c=relaxed/simple;
	bh=zisK6DSZbOvLPwi/dAk2097X/6CPmHmVmuul8j51ByU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PTCMpftDMK4+D+5sgd4LNV2BImPFpRy36XKNyDjlqsQKrIJORFttyWPyQ/ED9wbuAzR7pakMZb6fEvEjnZE2egCadPBRhF8A1PPMzEsXScvoSmmsk/aRHQu1OJ5QRdC6EtQvCO+SwE0xyP7L4tLU6RZHEt4fSK/OLbpbMXyjt9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PzFMbc+H; arc=none smtp.client-ip=74.125.225.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PzFMbc+H"
Received: by mail-wm2-f11.google.com with SMTP id 5b1f17b1804b1-49ccf0fbf41so14044175e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 04:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788781678; x=1789386478; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zisK6DSZbOvLPwi/dAk2097X/6CPmHmVmuul8j51ByU=;
        b=PzFMbc+HE71k5MHz+pMC4F2BIVMETuZRIYspiXiS/GSAaiGUNGZItVCmI23siOCgxA
         WxJyZzagmKeANJoihEvf7l1YNuO3WAX7Hhca/d0xuvj8jj56uGRoiyINDGDQC1TuqjwR
         LNsvnR/bgeaEevdjwC58Rm7QCbehCkQEgEHg/m3z3Eq+1HzYbjWEWRzHmUWgdkqVkGPv
         kHGMUKSTiyL+TuJrVDdXO22KekmWm+JZpLSYnrQhXxz7OOVffY6EQib0rpq7y/9xx49P
         Dbsu6zZIqa1JwE9x4wgf2IPAiVfaBHJg11GGFbu3zvQsfRz7J7zchnSaSgZcf48nFZCb
         jUqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788781678; x=1789386478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zisK6DSZbOvLPwi/dAk2097X/6CPmHmVmuul8j51ByU=;
        b=by8DaD7cX0Kw39JF3UjzpdxdCg8OUOXRT0sEqYmhGkFilObygsHiUe9kBFSasU4ojz
         hgBcFwlDrGoYrxHP2xZTCtWK3k2AjCy1Aa1Npt+z02paPl2wbf383M5fyLPQI0WfHZIX
         nnS5OikZHoAhPRPfrV2OicgBbvZvLY0GL6M6K0XaS1SdLzE4IlqkmuMlCwV/NlSVYAL5
         eEjTKaWm2hwyYc5ItAx+axPl/e6V7GcM8Zbn4FkBg3Q2/vKGhDsHi+LWRzXFj2J5+Gk3
         k/meVrEmy7a8Ce2rUxvhSzU7LXRksrxiS1zEffro5mzwce1qGJEhnir9a0o1AqgBE3bi
         t/GQ==
X-Forwarded-Encrypted: i=1; AKwUvBw7pA1r1QZt5lkgSrqCSr4slnMd9AL0gAkDvJAPAYv5D4HsNUslwZhRpaVCKBUpN0vSkrPEaTRXOBTSCnU=@vger.kernel.org
X-Gm-Message-State: AFuF++lqEramlqf6bQvTn36ykArdPKdk5wNXtOrmleRtqX5vk6TFs1Xp
	4gcoSkwdGEKet3q3xuto+7BJ/hKOWSUYuU7mZMc6C2YREXSmY7Al7I4P
X-Gm-Gg: AYBFou2hJeeU/LA0aAPFK1L5uCML+v5O7vIgpuCQCbON4rLXYVWim0WxImzTmCoDPEe
	YhbXx5uXNr4EBE2TmsZ4eyCL9bvt59KN/HAmKERXl7snc3UFoMdOWSBr2kcXMmc4AOZ11kOurKV
	kfatKRTk/HLjv47hY2lReE/g2rY7WrW/AB8hDIyrgzgquUk4zC7XX1YYGAlu/Yot4o+FW6fNIEx
	c02MyQwL/uVUfzf7jmevc7gPOvwCKqtXnm6VyhAJHRV7q3T1KBS/0h2WYeWr71BxUhAqWlXmmLh
	I+XJvGUggnTXUUjx1pfl3S6AglzIa4Jkjd1RDgxDOmLnrdHaAbs8b+RlSe38qi/vv/X94MqQOxn
	tATPq2KmBXfSb6AbQVsv/c3ek+ndz2nEjpvHilsQQkdL+AkQKv3tvJogFKJ6uDekg43F4tWghCO
	T50Tt8WwRnWQRcDY02n5kBdSFz8fW8WQga3WAPH4ShhsbdRZ+zgFbXQV1HxkNwZ5DOU9MNy6OaE
	ywPe2B7okSXpBU=
X-Received: by 2002:a05:600c:154f:b0:49c:fc6e:8cb5 with SMTP id 5b1f17b1804b1-49cfc6e8ee3mr219765505e9.25.1788781677871;
        Mon, 07 Sep 2026 04:47:57 -0700 (PDT)
Received: from serhat-ubuntu.home ([212.253.216.238])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee80eda4sm383491635e9.15.2026.09.07.04.47.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 04:47:56 -0700 (PDT)
From: Serhat Kumral <serhatkumral1@gmail.com>
To: leon@kernel.org
Cc: bvanassche@acm.org,
	jgg@ziepe.ca,
	sagi@grimberg.me,
	linux-rdma@vger.kernel.org,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Serhat Kumral <serhatkumral1@gmail.com>
Subject: Re: [PATCH v3] RDMA/srpt: Clamp the CQ size request to max_cqe
Date: Mon,  7 Sep 2026 14:47:25 +0300
Message-ID: <20260907114725.28908-1-serhatkumral1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260907063251.GE13683@unreal>
References: <20260907063251.GE13683@unreal>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, Sep 07, 2026 at 09:32:51AM +0300, Leon Romanovsky wrote:
> All these Sashiko reports suggest that sq_size is being changed in the wrong
> place. Can you check for the correct value in srpt_tpg_attrib_srp_sq_size_store()?

I think sashiko could be triggered again here due to theoretical max < sq+rq
probability because in the default (4096) state of sq, store() is not called.
max_cqe <= 127 and max_cqe < 4224 points to the same issue and it is not
resolved at this layer either.
