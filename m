Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E33724DF4D4
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 13:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788788655; cv=none; b=juhCbL23BvT/p339jsgYRivo6hrXjlFtrFyKajSKotasH3nwGeeDIvfYLO/XGbMzWZCyOj705j5QuByG3CfxtigDgZReqrlTbw+RTj5/Cqx16DMEikWofbE9oopHEuu2n4jNMDxn40BTSHzB/m5G+yRGWsNxQYqVdmoE84TG5Uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788788655; c=relaxed/simple;
	bh=D/v3Jz7xvaKh59QLJ99lH4pZEIIORIIk9YVsyFYrUK4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mEG7jolJ5aOwbC2XgSjWsqksxRpYUqT0MshWl4s7uS3tc9bmmqPEij25cMpPppbij4q0xAzjNwp63Hpnk9TtC1R7d1hoMnT5KUJ9Lya5K33adoBo2TXf/nMqds+6TL1PgY/TIpKKsrUd4CQFRoHOlkzEKhCkXQEvP921HwZohuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TOZF4pNQ; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TOZF4pNQ"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-39b52169dacso1199238a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 06:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788788646; x=1789393446; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D/v3Jz7xvaKh59QLJ99lH4pZEIIORIIk9YVsyFYrUK4=;
        b=TOZF4pNQt12wS6QnSKbvulgQXIqYVaGnobubzBIHeWf/X3tkOXgSUQOlBVAj571A71
         Hmo1LptUqM7eKK7oz3SE86ctlvvdPO35/HfUez02OjhUGPjAE9Xitj9iz80VlUjyn4CC
         b78lH9yJCOi3kS4WXFYKP4rdUStbUJEnN1xWoCOTRxrdRSk7sXGMeop6lDeFN27yKQhj
         gMbG8gb50Re9LzIdXU5fOfWL389Qf5W8IwxSCiNL7Ntb52EgxOTtfFNtKF4vI82xE347
         GwltUC8bCoLAYz7Y3RsWSV+xxY/26+BpixpprahVU/i02QaH3UfVR/hm5ytVVc1eHWfh
         vyCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788788646; x=1789393446;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=D/v3Jz7xvaKh59QLJ99lH4pZEIIORIIk9YVsyFYrUK4=;
        b=iBZXEtRLq6lFnSSKq72pihmxN6We6QwWI1vV72r0KBUOog6ab4sTvTDm9VIjZxKkif
         u2ZdYdmW2xM+Uq+MqLM8RDTR9GTanhYayj4kvkg0n6N6zdMFT/87tlda2+eOt+Ak7EIA
         jKRHaif0k1aGt05+VyltnGCgl6fqRKCdOIZbq6mdP40u9ozEYaFaBII/yoGEn4NpD/pH
         CsSOL/j1+gOt/71y3wiyNp1d1ThKak0DxGB/azXA6kiLSMF9cWs/G0BZ9qg22dDEMVAO
         ECHGvJG3opvlSThaw18Zo6o9Gu7XTa9I0yxA/XL28kChSBND3c/y6+MOCn6M1MaJcCJA
         zzxA==
X-Forwarded-Encrypted: i=1; AKwUvBxSvvMQpgo69w3VBUEdjrMP4R9AqA/HqumUW6nwXtI3gkv6jed7kcb/GuYDKJzFL/JMN1UpegbvNoS+ao8=@vger.kernel.org
X-Gm-Message-State: AFuF++lDnvGdN5NNoI3mbn/HiEZdCYU81MNPNUSQz51Ii+6njUczIX34
	rJZ8m2nrXmbcxzAAMtCKO0jyMa7JIzfAyZSHkRZ2j26A2rCRTKlitpQ=
X-Gm-Gg: AYBFou14mOZ5CKGwJ+zjXNfPCLdiYNCEkSynXFOiOpaMh/qnIYCFmXRkkvFDVpcYRqY
	2LEX66xw9JkNMmneKoz0bEs73aucWKBU5YfLTyX7k2hvQCu9IN/pnxPZGiSSuUTYsTdSFuFVlfF
	0BszTj+jrJczLjWRWp37NZRSoxoF6wCEkiewX7qtbjhk30XlSau8Bu/k/R+AT58pUsrglRGYjpN
	WxgSqSuQBznGcI+hTGfAbCac8c/zKHyXPYnYQpZaXCCrMjZzPI/M0Nf0JMNpOS6z1tm/CmKvPW0
	kfd5kL4QG18iwM1DnRwPX5YA6hXFhFShcUM3pvqR5b01OG1UcmWM1AoPRYgH6cPEUKUlLHi+U3s
	KoxBBRbqKe19K0TzytwsNfpkcdxsqAxCS5G2RRSUan2BfttvzaswcSOHI3cNm1IrinPRuAx8WNF
	kbz+QtnAU8Fj4MSBRCknUWFwQRv8Dj1wl7TrrDRihU8p/s7jBZQMTiFjMia6f8IFNAvi0eQfCTt
	f5pdEo603OSMxDW
X-Received: by 2002:a17:90a:ec8d:b0:37d:f983:7b5 with SMTP id 98e67ed59e1d1-39b26101c08mr33965509a91.9.1788788645675;
        Mon, 07 Sep 2026 06:44:05 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:6467:d689:c773:5f09:906c:a72b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b2612d3f1sm20717513a91.13.2026.09.07.06.43.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 06:44:05 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Puranjay Mohan <puranjay@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Song Liu <song@kernel.org>,
	Will Deacon <will@kernel.org>,
	Xu Kuohai <xukuohai@huaweicloud.com>,
	Yonghong Song <yonghong.song@linux.dev>
Cc: bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	donggeunyoo.kernel@gmail.com
Subject: Re: [PATCH bpf v3 0/2] bpf, arm64: fix the exception callback's frame pointer
Date: Mon,  7 Sep 2026 22:43:55 +0900
Message-ID: <20260907134356.616964-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260907130624.611942-1-donggeunyoo.kernel@gmail.com>
References: <20260907130624.611942-1-donggeunyoo.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

CI reported CONFLICT on this series. It applies cleanly as posted: git am
of the list copy onto bpf/master, which is the base-commit above, and
onto bpf-next/master both succeed.
