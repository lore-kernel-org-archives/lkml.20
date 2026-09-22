Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2CD9524B1D
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 08:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790064069; cv=none; b=VoFgO0PStOsJc7BCLZ1zU4bYjuDql7er+x37qWhGOZCTYAK45S1eHoRCOkUblemyIek7V2G/RWkDUBK5yyEOTmsIc1u4afohAKge8wKmKBH4n1c1NbBqDpmWHQq3/Ih/yXeOUM46M8gtRcX4uStyGplN9m1mMlnmEMHjSSMyFd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790064069; c=relaxed/simple;
	bh=Kz0+Gm3KFWWMIgbjBI3C3yS7MzZWyY5UKhB8HQObcAw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X46NBjKq5baKtXEwGIVysuKX6HqD8Op+Qp+EOO9mQQADjSlKwRQnEUGwWUkkX5XYfgjS4yUHCY25S3vAq46jc/o71bJfCiJsBzM3tnXUAWkWyxAltnH89unuPxPtfKnJEpdIJ5hPpZWxlJPadTfIAVcGUaTU9TZctwR0VCniV2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WhdPOZ6N; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WhdPOZ6N"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cea50db3so2340401a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 01:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790064057; x=1790668857; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jjOpUlt+UjJ6VV4ZayWYwJ5pQEbpQ8Gjw+EW35MyDL8=;
        b=WhdPOZ6NhZ7nD8bHQQqKf6PAEIH3DtQMCFp4FLChYekJ4Cud/5MZFUe0RymNlhZ4z1
         FpIMq8eWR19hCsKxSygMVN9ODy80/KJN4/BL8XV9tTQ/q0uyFQIJIedzt4QNzLL0KQQe
         O2DKPnOXXXIqII3h6vA/eoWh/pjiI/Lb4zWRT/wnaD4pryKIWcfAQCbNcXIqS0QDNFs2
         htNxsN2EepS6YTtbj0Hh9qOydKgZ1f8Krwt/OQXpIGWrSHhlzgcr5vq++zVkTDWl5vJL
         dMA+zYd1MQj/SByVe2raNQwd8AyaHK5CV68uZxhjgVbIJtTT4BZlJ28/Vbg7P0uUMGRh
         zYoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790064057; x=1790668857;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jjOpUlt+UjJ6VV4ZayWYwJ5pQEbpQ8Gjw+EW35MyDL8=;
        b=MwGtomWwGai4Y4D2c3NJgTxU33JcNQG/KqNx77RJXhB5dVFCnRWWrGja5VOydaAbAR
         yGbqTx0hnHQrQEKPcdc9wxVbOo9bFtNlSQtZeyxi7esPYciRCMvDSjWODYTI7nr+osgY
         a2CEp/pvYHeChdhOybW7Iv8cbNUU2d68ClSj8lTsbYzeeiqdJ2hmVODRgT1rxlS3QVwg
         yWpqZg6m5EsGCuKx3chE9kEhx6X2axHGcyEZgl28qVd3R6/TzyL0+sEgvOlr8DRc/4NG
         xa3evRSxCzxkW22VntutufogDRQi+hZPNWLaXCa4BMu1cEJLMa1RyNqNtD3iEwI8qDYp
         ksBA==
X-Forwarded-Encrypted: i=1; AKwUvByIXkxwZgsb844gU7eqYEY6afZn8ehfjoVh6e6JnR/O8mmhp5h0wFDOmFpgejRKPsjHpwGM+i21aIobIDQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mAvUCBw1Wyen9VxpCD10svm5dW315/NBIFfsbryxFq+BJvoJIM
	N6w4sj4oO7tjkKPOMRImr0JCvzGLeH/lHkm6PcNdwRHZ1G+rZ4uqrJPb
X-Gm-Gg: AYBFou0bPXSJXxUrRjNmpE5Iz2A+9tLlka1ubfJgeGw0410q/T+P/g0YcbVaggosn05
	27g0H1LrEKamkkN36F8aoMr/kkX02E9bDlJeC3ReUEWLepXH+aNpwEp/jMkAMyyKeHYG/I9XtlA
	qanWKGgAztVQrW6O+sGxe/FHFk9J0SLutqlu9tGN7uiOoKE8TZjACJRNS7db5hHGTPEUA+VjLv4
	z9Dlob/bL/fj76TwaKGQ+SOZgemufXwNK+Tj40GtCDfVa0ZGAO08DznQ85dADWCfF6Kt7YmIT8M
	WHkh2tSGcTNS0TQohgzQv1pHMWJ0rTI8emRxuT7/sMDflFCnDhGxnLuHjmYUenWC/E0sEkYlm1T
	AFeaJBdQTQIiPG8GdOXY0VxtcE/vxWPcMYHakjfuDODGzPjfZgxt+Tazb992aGHmJOg5B1pAp1r
	/sMcZ4uj09RkqGpHbxdofHZeFPFRGA93KXJFSiFKTwTfeZmtdnijJGpuRkJQo9b76X2ggK2pBd8
	Wr+DfYEJYoger3Cee16KiI80bvB+co0dcWfak+8hz2tGZk9BDJL8Bd4k22HiSQ8zrgfnjOjAi2r
	6KXQYAVKDw==
X-Received: by 2002:a05:6a20:6a1c:b0:3dd:85a9:55a2 with SMTP id adf61e73a8af0-3ddec7aef29mr380694637.36.1790064056935;
        Tue, 22 Sep 2026 01:00:56 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (67.51.127.34.bc.googleusercontent.com. [34.127.51.67])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc756b4239fsm494006a12.19.2026.09.22.01.00.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 01:00:56 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: Ridong Chen <ridong.chen@linux.dev>
Cc: Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Waiman Long <longman@redhat.com>,
	Guopeng Zhang <guopeng.zhang@linux.dev>,
	Shuah Khan <shuah@kernel.org>,
	cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	stable@vger.kernel.org,
	Hui Peng <benquike@gmail.com>
Subject: Re: [PATCH v3 1/3] cgroup/cpuset: return PERR_NOCPUS in remote_partition_enable()
Date: Tue, 22 Sep 2026 08:00:54 +0000
Message-ID: <20260922080054.3895080-1-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
In-Reply-To: <a00dbaaa-99f1-4172-b337-911ff45ae71e@linux.dev>
References: <a00dbaaa-99f1-4172-b337-911ff45ae71e@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, Sep 21, 2026 at 03:08:55PM +0800, Ridong Chen wrote:
> What is going on here?
>
> Please do not reply with a new series. And I think the changes should be listed
> in the cover letter. Otherwise, it will get very confusing.
>
> ...
>
> I cannot apply this patch. It seems quite different from v2.

Hi Ridong,

Sorry for the confusion and the noise. Two mistakes happened when I
prepared v3 after splitting patch 2/2 per Guopeng's feedback:

1. I mistakenly passed --in-reply-to pointing to the v2 thread and
   omitted the 0/3 cover letter.
2. Patch 1/3 was accidentally overwritten with a broken diff instead of
   the remote_partition_enable() hunk from v2 1/2:

@@ -1591,10 +1591,11 @@ static int remote_partition_enable(struct cpuset *cs, int new_prs,
 	 * above it or remote partition root underneath it is not allowed.
 	 */
 	compute_excpus(cs, tmp->new_cpus);
-	WARN_ON_ONCE(cpumask_intersects(tmp->new_cpus, subpartitions_cpus));
 	if (!cpumask_intersects(tmp->new_cpus, cpu_active_mask) ||
 	    cpumask_subset(top_cpuset.effective_cpus, tmp->new_cpus))
 		return PERR_INVCPUS;
+	if (cpumask_intersects(tmp->new_cpus, subpartitions_cpus))
+		return PERR_NOCPUS;

Would it be OK if I post a clean, standalone [PATCH v4 0/3..3/3] series
(as a new thread with a 0/3 cover letter listing the changelog and with
the v2 1/2 diff restored in patch 1/3)?

Best regards,
Hui
