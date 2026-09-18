Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8AF8509F14
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 15:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789746240; cv=none; b=CAFSU+64nUkY6AhKQmBwhnrIS7bdpk7Tlv3LVMo0qZfyvb5Mn7si+ULeNtks2LAU+o05GHa3NFYzD9VAcqoEDPh1CihzgNG8PuSWQiznTkj8XhpNQGUHUTh31mw/0tNtlKHTBexlflRtHtNjIv2addjnpmBhRiPckQJVWUUHluQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789746240; c=relaxed/simple;
	bh=C5AWntZI5VfsdkhVNOlhJWjuARyHAh4CGfTREDIJj+8=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:In-Reply-To:
	 References:MIME-Version; b=Dg6vb46Eb81WFJMvkWJFWI9KYTZvnkJGhMKo/v6+5DsLPiNGCTdDHOhhtyqb+fnCHw9ZfO8qELg3TKq9QODJq7tE3Ko20PApI8ul3AdpbLz2/wchpmPFooDVT61mGMRxDmhtvmPuORGxMzydDuab/sXLVOMiuX6yADPfL89QeTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aR9+soVg; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aR9+soVg"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c29d50b7cf9so141636866b.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 08:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789746235; x=1790351035; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:cc:to
         :from:subject:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C5AWntZI5VfsdkhVNOlhJWjuARyHAh4CGfTREDIJj+8=;
        b=aR9+soVgGL4K0KTpu5HjNLJkXqcbTxvb57pKBs5lIyj7YfMZkK00Eb2bOLDkyqgy6q
         W1BGp77qdE4WpZWCKpfmoja4QWPd2MV5G5jIBsMvXST1gfwrLivSA+QkPgjBaZpNzB+s
         HpmuRVzdX2T4sgB96qkMRSo8Aw0CYEg8fA2WTTJC88IMnjRogv1MjPgeiFD5SEUu8zQm
         DuiOpXt7kQ07aFZSvXKBZxh8KbGD5Ud6g72zEW9TmBILUu7VwmQlWAJI3LAt1pDR3xUC
         6AQQX7ePR04BdAMldOJPlbxd/x+OSEc5Ii3zsZBAj77GAv0qrXrRE4kQ7GHmcLeGBzJJ
         pZzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789746235; x=1790351035;
        h=mime-version:content-transfer-encoding:references:in-reply-to:cc:to
         :from:subject:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C5AWntZI5VfsdkhVNOlhJWjuARyHAh4CGfTREDIJj+8=;
        b=cWbjT6QKMM4v1YIa75Z0wr3EkOYofyu1PdcOQh10910BnT/9Ji86BObwqyFTkGpUEg
         BamNpM1g/0m6REvgmFHkMYcWyuetqeespzsxQTJMiPshR482HzHVx1gCFGwcsHLsfHd8
         SVVVdl+Byu0yqQpW9tnzp1QnVGoybe6KMPc2TveCUHvJZBWZU6z1xrISH/exGL+rGy0/
         AK4vEKqV1ZVZkVGrGyf5Ozv/fOKK+ROkoD5FXjSDuNDlYMW1qqRFdyZJrjysSEIMBwXE
         TrnhEsqGLk2lV2AOLZPMkd+dqvIJGOy44+RainOFvgfcdB1WgIIfpgvEDHBISIBHWgbA
         SfQg==
X-Forwarded-Encrypted: i=1; AKwUvBwSEhoESU/HHtXC1xhl4/t5zknLixJ47uR3yTXaHKMELKxSJpdfzU88cLAGJctmzWgRNvXKiu87AsTTkE0=@vger.kernel.org
X-Gm-Message-State: AFuF++lrKBb2VUqx97gqQMTME5iHF3ddhcQoh54dh+JjZj8J5v5PNLbu
	RRv0f5BYtIDKMNiH9k2uOc2SSiDGyaN4VVD5M74+tuwLyEHcljNRC8rS
X-Gm-Gg: AYBFou32cVqDup5JhiWwVsRJhk1o/StiWkKjhnRCffX6Cp90c5COEL7DGEHAIleK0Sd
	1BfgYtx1hrCp51qb9c19FaK+E68gCPTn8Q44O4SePXcClUK006VpeG4JYu7QqN5fnzoi5l4lBQ3
	0XNGnItR+J+2972tXiYw5HySCV21IYdpCQL9EbMoa2WVQUWU8RNT5paaRQHReKLh1nqK1jxXUU8
	Z37At/YlDbb2eTInoTe2njh4/PEWYHLtss/xtWmYq6qP7DDepf3lr9vbwY+z7tDWpvGo/MLQJM/
	pCJ93osJO6kEawjK2pA4jwEooNxUEQpWWcw/bQqoWZ9HmWIay99P5sSGCuzCkXIj21+vckO/o12
	jniCMmRddLFg+f5yVS7K1CnokXYq7CLnykXSQkdRK/k8HKJxuxm5fmeYFC714UgEG3wQLHJA6zu
	yKqIZlfUFdR/6HcNTK6Hfm4MBVAnUgzCBQS/iB147mRwUvVnvfoirxSPNXvgLrgDkKi/FJ9jVgi
	mnnH5Qzuh5vu/aRGGQzGwSYJNtUz07EGc/8H7npet0cKBZ0jhDJtVqerIv24B1WuYhKWeEsS7wt
	rtUckklgefXj3Hw=
X-Received: by 2002:a17:907:3f17:b0:c26:19de:9126 with SMTP id a640c23a62f3a-c2a15b3401dmr300021466b.25.1789746234745;
        Fri, 18 Sep 2026 08:43:54 -0700 (PDT)
Received: from localhost ([153.61.198.250])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a1b7a442bsm78355366b.4.2026.09.18.08.43.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 08:43:54 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Fri, 18 Sep 2026 15:43:50 +0000
Message-Id: <DLIK37JYD35X.3NZ4ZHTHDKAFX@gmail.com>
Subject: Re: [RFC PATCH v5 1/5] blk-iocost: add BPF struct_ops cost model
 support
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Tao Cui" <cui.tao@linux.dev>, <tj@kernel.org>, <josef@toxicopanda.com>,
 <axboe@kernel.dk>, <ameryhung@gmail.com>
Cc: <cgroups@vger.kernel.org>, <linux-block@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <bpf@vger.kernel.org>, <andrii@kernel.org>,
 <eddyz87@gmail.com>, <daniel@iogearbox.net>,
 <linux-kselftest@vger.kernel.org>, <cuitao@kylinos.cn>
In-Reply-To: <20260918031751.1255420-2-cui.tao@linux.dev>
References: <20260918031751.1255420-1-cui.tao@linux.dev> <20260918031751.1255420-2-cui.tao@linux.dev>
X-Mailer: mkdraft (claude review draft; edit before sending)
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, Sep 18, 2026 at 11:17 AM Tao Cui <cui.tao@linux.dev> wrote:
> The registration and binding model follows the TCP congestion
> model registration pattern: registering a struct_ops makes the model
> available by its name (char name[IOCOST_MODEL_NAME_LEN], validated at
> init_member), while
> io.cost.model binds one registered model to a device with
> "model=<name>" and unbinds with "model=linear" or "ctrl=auto/user".
> Unregistering a model removes it from the registry, but its name

I don't think it's what Tejun asked for in v1. He asked for a per-device
struct_ops instance where attaching switches the device to bpf and
detaching switches it back. Instead there is a global name registry,
a lifecycle list, an "unregistered but still bound" state and a
refcount_t on top of bpf_struct_ops_get(), and every version since v3
had a lifetime bug in exactly that code.
Do it like hid_bpf_ops does with hid_id: device in the struct_ops,
bind in .reg, unbind in .unreg, and le
t struct_ops own the lifetime.

pls wait for Tejun's feedback before respinning.

pw-bot: cr
