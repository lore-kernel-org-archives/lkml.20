Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 288F152F27C
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 08:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790066524; cv=none; b=lZtAODdroWXcCw08lzd1VC5nnc2HygniNcrbLQPO0nIv4BWgDwQfSybKVSwXaTtKIc9uXJPGS/VpkZdZm5QSYH9Vl7POULZLw3OU4p6KEwsM27rj8uND/HtFuChFlKH96qT/tjowAIwauGwC2MsZ/Oy/KxDpLZTzxyuLVMquHgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790066524; c=relaxed/simple;
	bh=kck8L/NQRlysm6vgqjrDELzS09ugXw6JQ7kAARLdPTU=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U4yl1RK2NZI5VS8SUxtuxX2Jai4VT0/5gR26Bup5/Ta6aBC5mX5esiAAs+JKNmDYXIcCH6wRoKNNiUs2Xq4c605dANP78fIQQF+Wu4vayglI/HBBnUg70U2I122YBbjJnkTp4GtXoackVOE3WQE5nWhmYcoc/7KNETiicHuAXps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lFwFG7RC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lFwFG7RC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DD401F0089C
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 08:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790066520;
	bh=kck8L/NQRlysm6vgqjrDELzS09ugXw6JQ7kAARLdPTU=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=lFwFG7RC1GPgBW9VpnjSHm5NG0xiYn4onuIj4qFX0pthMyjOfSAVi8Ruli9u/+OMX
	 Qt0x6awz2B3LJ3xzyEsluI3gcXX5wJqJqCNUzrLsNS2xyw1hDmjGl289rYEKBF1ytj
	 NOfyvO7G3RzYaqIzyQHzBF+qRa3MmBjIQSjlS1Hy3Tj/AfLcc9K0mpQFgZwRJ3msbx
	 OI9+cfrNMxy2PumMkvRoS0Y7tw2n7K2jF/0izB3pFuSkyLkK30xCciyZ9WwAi6Q8cz
	 mxUXC9DyWvt4cv2HxnSPackOPoK8/OHXjVotvvmUNtU+yQGF9p6eClzE/a2gLRf0pN
	 UY51w+U/otGNQ==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b5e4f16c81so3302900e87.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 01:42:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByazVFaUQdB/PRAp7EvlJHRy4ASztPhU48EcjlhdMDr0E9gMHrPy0oz8jucGmmI5vITj3k9MUYcXsiJDAw=@vger.kernel.org
X-Gm-Message-State: AFuF++mqS1Zh3G3sDHsw8yqdGlHuo6aFyfeFzPEkwEJJGidB8cPlEsRG
	AVvcT4h3oyQ0WmhYaG4HXR3pogcAQaSf8vkajs5QCeyHvwS4QaWE+xICxu0Rcv4SYZ5WZBmYNOJ
	+oVkc3ihnRbVAVmBTLZvJzGSNvZ6rjlnbtIyEZw3iSw==
X-Received: by 2002:a05:6512:b96:b0:5b6:1a7c:fd8d with SMTP id
 2adb3069b0e04-5b8c196c1b5mr4813014e87.51.1790066519268; Tue, 22 Sep 2026
 01:41:59 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 22 Sep 2026 01:41:57 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 22 Sep 2026 01:41:57 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260921195636.1925869-2-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921195636.1925869-1-mukesh.ojha@oss.qualcomm.com> <20260921195636.1925869-2-mukesh.ojha@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 01:41:57 -0700
X-Gmail-Original-Message-ID: <CAMRc=Md2QehBNptfiKWfTSzhSf_bg8gpC4hbe60c9FOiZb_Avw@mail.gmail.com>
X-Gm-Features: AcwNN1XFSj2Uxs-rWA0kn1vTTqk-pdkddBYgSD-ic__2gy87BQAfmxIi4VvGh_c
Message-ID: <CAMRc=Md2QehBNptfiKWfTSzhSf_bg8gpC4hbe60c9FOiZb_Avw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] firmware: qcom_scm: handle empty PAS resource table
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 21 Sep 2026 21:56:35 +0200, Mukesh Ojha
<mukesh.ojha@oss.qualcomm.com> said:
> The PAS resource-table query may successfully return a zero-sized
> table. kmemdup() with a zero length returns ZERO_SIZE_PTR,
> which is stored in rproc->table_ptr. The remoteproc core then
> dereferences this invalid pointer while processing resources.
>
> Treat a zero-sized result as an absent resource table and return
> NULL after releasing the TrustZone memory buffer. This allows the
> remoteproc core to skip resource-table processing.
>
> Fixes: 8b9d2050cfa0 ("firmware: qcom_scm: Add qcom_scm_pas_get_rsc_table() to get resource table")
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
