Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD48E456287
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 18:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789928091; cv=none; b=Nx80hNguURYYDvH67fyfjivrO3JnAbMV9mcCBz6FEkx9/YEA9KErSa2tBclwl7y3i0mrErvfK9sEPVkbBPRxgxy79NpRXsoL/7fq4hjgBpxSlPDvOo6Ac+xVopKFPD6ou8bGT1VZVjzdMfm3B2DRXmLKUGjcaqxQU2g66biFYF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789928091; c=relaxed/simple;
	bh=WXF66WmtMtCT657v10dcTOpqc4WfEbuJJpMl3klh4YM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZXq3A9SOE3ADAGuDVsb+1FChdvL5UGX5gtXt4YFDGTfN6fQWD+OUYGU+BzaCT1lJOOaVn28F89ZMr6A9Q1nuGKYZL9dUSETxlXGFQFEgU8ldBHXt2P3CW/y5hRh4P79gi5bWDtuw+JVP0iFuJ1Uf2BeVFTKY8bCAjSrDyz4xn8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MzyzQgNr; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MzyzQgNr"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747eefae4so6822905ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 11:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789928089; x=1790532889; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WXF66WmtMtCT657v10dcTOpqc4WfEbuJJpMl3klh4YM=;
        b=MzyzQgNrlzdBXuR15LDX/wzqNolpU1UwdkIVxi/HRm72W2hdgmjeU7kBu7paxZUhLH
         MU001Llk/9EjOHxIt+bYWriyKz2cIAcVQFuWnJAm20y/9YclW/xlhRKNGtLhRU9b0T7C
         erCzrzkA+kITuHhc3kwsUobmG1VufZ/UMlaxn2+wsb/nMI2EEz5qprM1NdpnInTssXJi
         hrZac22HhWLrOQG6ABtkoTzpca8JiNkW+4Ty7uMSphQlbLbhDdwxfq+Z5BBHIXF3t7ut
         ZDNHmvKMBZjZaivhdyOsHtduT7zxxnjiu6WBmcerExlcGNAYIgzYwpjwtdTwulQyto8M
         pmPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789928089; x=1790532889;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WXF66WmtMtCT657v10dcTOpqc4WfEbuJJpMl3klh4YM=;
        b=eq/UClzMuWvGO9RSSdIGeYl3uRqiZnd1JuM3sTQqn4Uryh4gn3AkOoV5sZPUhvm7VJ
         lA4vugGWD1WxW4njvWbmVLGMsRYRaVEE553bVSfnXrhjWhRm8+DZAWR4amHhvN3upSBV
         Y78K8trB3l39zQFiIEHGP5lxxiJ27iKn95rVfqJHHCtAE72iPzSbdl44hrLk85c6/QRi
         sY20IPzKVzKnIfU5cvvlV32LrgPlmDtrIuT+jY7H/5SujHeUuoGrxA5vODBuuijkEPQb
         BDWwk+70gSwSaABwOTa5+r5peuhSFtxGAjtXmwXn7SUFeNdx/Fw7lLzo3gNi9atKr/09
         B4dg==
X-Forwarded-Encrypted: i=1; AKwUvBzG4mYyqzP9vAHe30mIR5fGdE6UJhoBFq9JxAEV2KUuNgaH20GosmgSx0AUFanKVqjpOH+V5bME8iioaL0=@vger.kernel.org
X-Gm-Message-State: AFuF++mZH49NBcv2c7lJ9FbE3et43UjUqyJiW2mGwrXmnpKkzcUr8nCF
	cIte2rYBrBFBOeHBICweayWj7HIiI17AigRQdwEU++D+S7XESIcXNjz7
X-Gm-Gg: AYBFou1DND/p++e56dkrPHx2G0MA3T77W/VLs4KHQ1fbhwcaUnkFJtCgyBLSlA0oOzm
	T+EGyJgqW9sCnw9v6QFNWllSczhnXYp5Sd45KtwxhX1a3VvUdwnk+SxiinzgtT9Bmem1pEg2v+j
	JiZFYowByvegmforRieXgRgpPtNsz6hHW9rMnzSQSgP/Y66RIbqE/O6p33/32JBxZ4141Ygo0r3
	iloM8ymE/ZQd6VT/m2aUSaE4TKtaBNkUag2HUiMOGKXoPGfeK6adzxQnl+jkHDiRLm0eSqOk155
	gDFAF3zbmdPLrbyes8tkJnAjrD3YMaoolbrxWoagW3k+7/7XqPE6g3L+M15ejGu9tryU7hZgn7p
	KAL37vGO8nP6CxcSOL79GcSp1OHQoaNZWOuLZLoXah0vGVvFClboIcm7RgHTnns0Ia4jttmA6iI
	QBCxS6DZeJLQa2T+ovC3RKyGcsZqWRWx/QPNUHVLArS4WltfG4cJo7ll6BBRSHjf4zFMQQJ8O5M
	7vc+vf/7HaWtdDsTw6An3Ffb1Tn9E2lrsfojP4/GaeMd/TT2IkwNStTDykoYSA1MTm848cPwfNI
	4BEN
X-Received: by 2002:a17:90a:a82:b0:39e:6c66:cbdd with SMTP id 98e67ed59e1d1-39e6c66d00bmr3882116a91.21.1789928089015;
        Sun, 20 Sep 2026 11:14:49 -0700 (PDT)
Received: from phui-2.c.googlers.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e554e5529sm5863256a91.4.2026.09.20.11.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 11:14:48 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: Guopeng Zhang <guopeng.zhang@linux.dev>, Tejun Heo <tj@kernel.org>,
 Johannes Weiner <hannes@cmpxchg.org>, Waiman Long <longman@redhat.com>,
 Ridong Chen <ridong.chen@linux.dev>
Cc: Michal Koutny <mkoutny@suse.com>, Shuah Khan <shuah@kernel.org>,
 cgroups@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] cgroup/cpuset: prevent local partition activation
 over remote partition and sibling xcpus conflict
Date: Sun, 20 Sep 2026 18:14:47 +0000
Message-ID: <178992808796.3122215.5327280843811501376@gmail.com>
In-Reply-To: <aa90bb73-c2af-4d13-8f2a-0435aa528058@linux.dev>
References: <139d9231-4723-4365-9af7-8142e6581ede@linux.dev>
 <20260920082335.257680-1-benquike@gmail.com>
 <20260920082335.257680-2-benquike@gmail.com>
 <aa90bb73-c2af-4d13-8f2a-0435aa528058@linux.dev>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sun, Sep 20, 2026 at 04:57:39PM +0800, Guopeng Zhang wrote:
> I think this patch is still missing a Fixes: tag for the
> cpus_excl_conflict() change.
>
> The validate_partition() change can be covered by 6da580ec656a.
>
> However, the sibling CPU ownership issue fixed in cpus_excl_conflict()
> was introduced by the following commit:
> Fixes: 2a3602030d80 ("cgroup/cpuset: Don't invalidate sibling partitions on=
 cpuset.cpus conflict")

Thanks for pointing this out, Guopeng!

In v3, I have split the validate_partition() change (with
Fixes: 6da580ec656a) and the cpus_excl_conflict() change (with
Fixes: 2a3602030d80) into separate patches ([PATCH v3 2/3] and
[PATCH v3 3/3]) so that each patch fixes a single logical issue with its
corresponding Fixes: tag.

Best regards,
Hui
