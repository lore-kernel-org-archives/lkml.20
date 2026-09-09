Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF0C4915AE
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 08:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788940969; cv=none; b=uYM60Ocrj2P28x+vznrLqJpERctJRLwL3cziL8ILUvfNzHYWMAnKhAEwlgQEgUwtBp2+oEzhFOez6AvHBZbSeQjpoFON4B34P8I6Br59cCLqB19KQsyeabwoU3l749D3F6a5n8b90zalQVKZ85hJj2sk4ILsz6vUbJYDOreVpj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788940969; c=relaxed/simple;
	bh=/rLYP1Imvt5tseRnCHfFwxpAkWrl2m+OtD0F0kQbFTI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hX82Mn7xbJt8q3fyd5EMxUZc+VDdE4tiqhoTEGDxFIBpjxobrPmyFe8vUb4cEhHu1SiFqaGoCAoo/QoFFbG3rz1T2PPWPs9bTUu9q0ZK7XBokcp6QnF+Is1vg0ldX2xaeHRPoML1oySXK5kPyqK3MYHS6cQC/zFtPktOnbE2y90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aicharmers.com; spf=fail smtp.mailfrom=pythoncharmers.com; dkim=pass (2048-bit key) header.d=aicharmers.com header.i=@aicharmers.com header.b=quV0bdgC; arc=none smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aicharmers.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=pythoncharmers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aicharmers.com header.i=@aicharmers.com header.b="quV0bdgC"
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-6b1a0d75a4fso3235841eaf.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 01:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=aicharmers.com; s=google; t=1788940966; x=1789545766; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NVqqZQHFQjLI1fAxKN559sk1nfYU8tizBv/uHckeKLc=;
        b=quV0bdgCqqg81X4LSOVzvsNf6RJBEMQt9nzcyRj7nBZghyE6tUVKK7yOUHnjo5wwwE
         LmfgnGjaj+4317K+wodrQe4qAoCiUfke/AGa4EhVDJCOVh90BAfREwDQ4/wh8Cks/Ax6
         H1P6S9TthKcXy5qYccaFHj0PjOuzegCZJ1Ya7i6UdudWOhgi+ZEpOU/Q6UIHu9+TvVaI
         YK6VX1xzxIPNWSlbTOrfzlniZeC0CeBUTdR7QZFbpTlwegLx1A0pkCc1wNDh5kHvQrf2
         6SlApK4JnUHiXTqNTlwhkMxbBnlpLzEsSSmPJ0LucvYHXc0bLpXPdwecMe8AMftptQL7
         2/dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788940966; x=1789545766;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NVqqZQHFQjLI1fAxKN559sk1nfYU8tizBv/uHckeKLc=;
        b=ryF32F051Uaif+EHe+koHuEQPsdoLcZDsZa+7PWEVFj4/Ymm75PkYAysX8wGJEv7/6
         n4yVHfcVfUZEUZNvZmnROPilG3ffaPvHDjQ/7I54bE7IXEruJREb2lcDsC9qYCzpgYgL
         we7FVF8bJwG0KYiWmyhzfhY6tKxYOydXx2+B0MuKseAaNAt0NEpdKO5zoySPBXiHkaJ5
         jvEpg+/REi7IU+vIckzELbMXJRiSWdhGuyxJ8kGjB/EZaH5O0H9m2tyOx7THlsKfARYp
         Q7uxvxugRFoy3c9+dJQ6JjFE6mGCN4mCs6BKRJvtHnz0UxIH9sEd8sz3zkTMsNjsd5hC
         vBcw==
X-Forwarded-Encrypted: i=1; AKwUvBz1DzmCNTVbwTKyWht+gqpDiUsvCpDH2FRvkvpmKfrZMnDVKTOtrOxaqkgRQdEv0Vu2mZwt4ut0VCAu4eI=@vger.kernel.org
X-Gm-Message-State: AFuF++nWYkYzqJAy6DBTU12fFS57yU7NyetohGjCBJznU5FEdMAa6QH8
	GUrK3yOrjDaFHwknabvK0CuqGeKA0VXOlWgezZ58jNCl+FdaFaIFklNzTMUrnSnqmP4=
X-Gm-Gg: AYBFou3bDtPTTYAx7HYww//QT4UNlzNN6w7faHA2VhJzFEnCjNDsAKIdVSETsA8usCD
	W6HdQut7CLZ7YCSbphoYycqRnR+zqmtQ4RhL3EQNRbxBgnVGJipAP24BCIsQGSeVgDdD0oiZ663
	fMkU3Rq0cdHXkuJ9QB5c+GQegBOS591ief9EkJAU9heTOtfXoBdRJcj1Td2ZEeP2/oHm1haksyV
	bpeBqLimc1zBM81MzyceqN6mD0V7vmhGZV5igJBHKC1g9gtDfEaM2AhFBF4fPmOqqyPiXhK1ouB
	m/W4IG4WFIdwcWrSsUUYKsdnXwHf0tCgGBLWSl3yWFy0e0WqnsC6a6TkqfHNhH7o3f155G+w00X
	h7dqNDURRTKZblJqa3e2cq0AjlhkCZ0FSglHjQ240lD5M4JrMT0rMS7ts8HqsL4HcqZnxL34BsI
	H8sXGdsW4BsjhygE70K5+QRQOXJhbeWj3sfblAUeTB/hKp6xwwLyPldHc4etFWEfvXUEliwetwT
	vUNtQBthmdzjZ9WfYMsMQ6MRlCRZ3693M46H0o8dvEwl/TaqCm2ILlWcuUfYsidYm9LzugnXa9v
	VthJUhfzYYO4KYIWVTRsHv/3l6vpHGJHGxfEdPXi9E+k
X-Received: by 2002:a05:6820:16a1:b0:6be:9627:196 with SMTP id 006d021491bc7-6be962710ffmr414461eaf.7.1788940966464;
        Wed, 09 Sep 2026 01:02:46 -0700 (PDT)
Received: from ip-192-168-20-24.ap-southeast-2.compute.internal (167-179-142-232.a7b38e.mel.nbn.aussiebb.net. [167.179.142.232])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339bbf1feesm42549886eec.26.2026.09.09.01.02.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 09 Sep 2026 01:02:45 -0700 (PDT)
From: Ed Schofield <ed@aicharmers.com>
To: Kenneth Feng <Kenneth.Feng@amd.com>
Cc: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>,
	"Guna R . Bharati" <062bel313@gmail.com>,
	Alexander Deucher <Alexander.Deucher@amd.com>,
	Christian Koenig <Christian.Koenig@amd.com>,
	airlied@gmail.com,
	simona@ffwll.ch,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/amdgpu/smu: Enable UCLK after init in AMD Radeon Pro 5300
Date: Wed,  9 Sep 2026 18:02:09 +1000
Message-ID: <20260909080231.85025-1-ed@aicharmers.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <MW4PR12MB6803F4CF9FA37FAE2FB0C5778EB02@MW4PR12MB6803.namprd12.prod.outlook.com>
References: <20260824190409.1724-1-atharvatiwarilinuxdev@gmail.com> <MW4PR12MB6803F4CF9FA37FAE2FB0C5778EB02@MW4PR12MB6803.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Kenneth, hi Atharva,

Thanks for bringing the two threads together. I've tried your suggestion on my iMac20,1 (1002:7340 / 106b:0218, revision 0x41), with SMU firmware 53.38.0. I tried two warm boots and both failed.

On the same AMD staging base as my RFC, I moved UCLK enablement to the beginning of navi10_set_default_dpm_table(), along with the readback check and supported-feature update. I removed the later enable and refresh from post-init. UCLK was still excluded from enable-all, and both memory-voltage features stayed the same. I didn't add any delay or extra mailbox tracing.

Both boots reported:

    SMU: No response msg_reg: 8 resp_reg: 0
    in params:00000008
    Apple 0218 default-table UCLK enable failed: -62

AMDGPU failed to bind in both cases. I checked that the experimental module was loaded and the firmware files hadn't changed.

This also fits an earlier test with T2 7.1.8. With UCLK excluded from enable-all, I tried enabling it separately immediately after smu_v11_0_system_features_control(smu, true) returned successfully. The trace shows EnableAllSmuFeatures returning 0x1, then EnableSmuFeaturesLow with argument 0x8 timing out with response 0 and -ETIME.

The default-table function is reached only after enable-all returns successfully, so waiting for that acknowledgement doesn't seem to be enough on this board. I don't yet know whether it needs more time or some other initialization step. I'd keep post-init for now: that version passed the ten recorded AMD staging warm boots. These tests don't establish the earliest safe point.

As for Apple, I can't speak for Apple or confirm their approval. I'm testing this as a Linux user. Do we need their input before merging an Apple-specific workaround? If so, could AMD help find the right contact? I'd still welcome a fix for the underlying firmware problem.

I agree we should coordinate the two patches. Mine covers only 0218/rev 0x41; Atharva's covers 0219. We'd need to test the combined change on both boards before broadening the match.

Thanks!
    Ed
