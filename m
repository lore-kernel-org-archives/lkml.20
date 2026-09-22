Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AB044A3410
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 08:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790066025; cv=none; b=DV8Syy1h3v91wOTkkjAT75xwsuaGwgBHohX7t2JTqN/7fcxJbtvIsySeJyUiQi55Bqmww3UF/2AyGLtxywPWw3MlISfLk3PhGytVAJg6s3IW0BibZqyvvFApc7LswQCjY6/sD6hJ3izMxHD6q8ISiPZuHLUEzuO8yZKmG/wpWC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790066025; c=relaxed/simple;
	bh=a2jdZ9Lke6+A6sooRkBfgYI9NYMfLcSpnTEWQfg5qms=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=unAZ+96cNHW22lZ8X2M4EufN4KCwjLDQ2vcbw/cdAphrlU4qUkjwI/z+FOzYJTJAsWcWfn8JBeCWTOrsK+OSjDDFUTKhb371uw7NH//iGVxHetaBVR20w/CbroTOyeRL1tDa4B8F9qXnWQdJqi8CLgCYNhI5QM1Shffppx0x100=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NYhg8Q5j; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NYhg8Q5j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FFDE1F0089A
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 08:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790066018;
	bh=a2jdZ9Lke6+A6sooRkBfgYI9NYMfLcSpnTEWQfg5qms=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=NYhg8Q5jhOApc6IyRQvX2486Wg6MuIenR+Lo6BVjpALnW17DlG9IDmFDnHRJdyDA1
	 tCgq/4oxUjgteROu5j7RusqVJNWUYe4fLR9ersrWAC/DhVcAiG53cMpMXSN4GNrjLx
	 9iVS25hxHvMrI260chno6b7LW2F0UpmeL/jqafjHJPsrQKSqcILZnhh9hQPSEOgGsw
	 0gOl5H4ZzTuVdoM9wZKzNpwan0ZToeqJQVabCor6xmPfDJzC4pwQzWwHVxEKq7A3/4
	 b12Awe0VyAkhSoqEEJeSnxw1cfeq+lLwklvUoUBgP+Wb2eJU4vdYEPejQlGg4V4FX4
	 EwWXKdViluWNA==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f1b845so3170550e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 01:33:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw14vtd03zVe997mAvAbcRfo/lcDRWd3h5dxkWCyHTomt/CsTGIcXwsbjIf4OYS2o15iGDfBzSPtrXpIlE=@vger.kernel.org
X-Gm-Message-State: AFuF++kyKWi1uxHIlJmykLqiETed4piMFPZKO2C7QStQhiYF4gGZyqjJ
	YGVdYC7D/HwbVTXZwSE6A+xskmbWYf2LZ/Xmy4+Mm5XfuceG5JYjOGMmXSZkS1rWi10JKiTDJqj
	UZzkU134+q0c4zf+oLUbrXJnersGE+CfNoIrarnH6aw==
X-Received: by 2002:a05:6512:2216:b0:5b6:1a7c:aa1f with SMTP id
 2adb3069b0e04-5b8c19838e4mr4189989e87.55.1790066016806; Tue, 22 Sep 2026
 01:33:36 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 22 Sep 2026 01:33:35 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 22 Sep 2026 01:33:35 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260921195636.1925869-3-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921195636.1925869-1-mukesh.ojha@oss.qualcomm.com> <20260921195636.1925869-3-mukesh.ojha@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 01:33:35 -0700
X-Gmail-Original-Message-ID: <CAMRc=Me0BUbbPsxPzd2N6gsOiYb1_6fskb88mUSP5V=1EgvN_w@mail.gmail.com>
X-Gm-Features: AcwNN1X5hurPWeLm0TXp4m9zhGTvn7whTEqJAwd-jqZtFt1xSczig6idQw_NH6I
Message-ID: <CAMRc=Me0BUbbPsxPzd2N6gsOiYb1_6fskb88mUSP5V=1EgvN_w@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] firmware: qcom_scm: align PAS resource table retry
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 21 Sep 2026 21:56:36 +0200, Mukesh Ojha
<mukesh.ojha@oss.qualcomm.com> said:
> The initial PAS resource-table buffer can be too small. TrustZone
> returns the required size and the wrapper retries the SCM call.
> Although qcom_tzmem_alloc() aligns the allocated buffer,
> the size passed to TrustZone remained unaligned.
>
> Align the retry size to a page boundary so that both the buffer
> and its advertised size satisfy the PAS/TrustZone contract.
>
> Fixes: 8b9d2050cfa0 ("firmware: qcom_scm: Add qcom_scm_pas_get_rsc_table() to get resource table")
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
